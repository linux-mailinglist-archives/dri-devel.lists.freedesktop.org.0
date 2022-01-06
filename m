Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE3714867ED
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jan 2022 17:51:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D70210F2CF;
	Thu,  6 Jan 2022 16:51:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2047.outbound.protection.outlook.com [40.107.237.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D940010F1FE;
 Thu,  6 Jan 2022 16:51:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GdrLdxNz1Z7zNZFz/QJRxJLTzwV9BWaz5qIAzIW8vdJY3w0SHVUQ6NVNu1p84zyepvwEHFy+Q7UqnPcWn5++GslsZi3n0qSLllEuI5Zy9KzuxjSBtiUi3CwZaBjnftm6wavoA9LmDVxTYlBVx2JAL4ZnGuZiY76XocEWPeULTNlUB5xjFI+DgjH8qaT4qPg41d/IbG0EM57GZ3epahbUpybXf3906inHP9RatROrGcwz9aOUivhMybvwbP25sqhicKU08BBXDDWYeqYRcKQ/DWP3RLkOvLNxWuaIW9gaj6CcR2e8v/vXPx+6ECyIBLf7L+xzZASgaqUQSjeN8h4olA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F3HI2WctX71Q4NOWL58gZJBK5VW+N+cP7qacklxhAiA=;
 b=ZDR9h+nrhgeSROM+fZGY+kux/81bu16Afr2LC1lx4ygtKKbKx1DqI8RczGzlNhi98OtCuAgSB+Y6AWGA5lxDMYXjMlySfW9kHJlj3/RJz0ql7y9jSSVqZxpZldutDjhiYWXTuYAF3OKi83FBth7P/DTyWqZKDtm/S1iBuPw89l7Mc4UERbrs/h7wePS+TwIOFFxuQpMqJ+9caodoDvfWthK5jpUuVmA6mRLzBqpn2NoV4y2aY05zzKTib8BqJxuwdiXmBRdKf+LzRxjwoAiamsuKzhPGWWcLJ3icx6qvrLAVu/GfhAwjEgdqraki5VUmQFEyqcjDNL0zK1NSiI+hWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F3HI2WctX71Q4NOWL58gZJBK5VW+N+cP7qacklxhAiA=;
 b=RvuiSM79FJ+n6JUtBb4ziqJv5qk0keQWSS1MO/zelgCa2huTywccXboZKTYLB7at7W92ZDYPGbFKhTIKw3g5kGP7wyxqbiiWHrbYJ61AkX9hGN+sE0CNgmooMB6fChHlGLoxQPd7Os/raR/gyUc0EETSE2H+9OcmQRWno57HDz4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by BN9PR12MB5179.namprd12.prod.outlook.com (2603:10b6:408:11c::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4867.9; Thu, 6 Jan
 2022 16:51:33 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::971:531c:e4f4:8a9a%7]) with mapi id 15.20.4867.009; Thu, 6 Jan 2022
 16:51:33 +0000
Subject: Re: [PATCH] drm/ttm: Don't inherit GEM object VMAs in child process
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 "Bhardwaj, Rajneesh" <rajneesh.bhardwaj@amd.com>,
 Adrian Reber <adrian@lisas.de>
References: <20211208205344.3034-1-rajneesh.bhardwaj@amd.com>
 <94b992c2-04c2-7305-0a51-d130fc645f3f@gmail.com>
 <58d61e47-3796-3147-db6c-ea7912d16902@amd.com>
 <de272de9-3f4a-db40-699a-41394cb699dc@amd.com>
 <cb5668d4-a13d-3b0b-442a-bfe1b3a7239a@amd.com>
 <000edeaf-8a89-ea4d-5b9a-2bd7758f675c@amd.com>
 <f00f2f16-f0b3-cb54-f88e-d53353bfdb79@amd.com>
 <f4527002-ec6d-5279-3b79-1aacb6cc55cc@amd.com>
 <YcBM3PMz7J90F3LQ@phenom.ffwll.local>
 <9d1030c2-2269-cfdd-bbb0-9c3d5995841a@amd.com>
 <YcOQN/l7W66W/X0f@phenom.ffwll.local>
 <a5c769fd-7eac-2628-a36d-fedddfb7d398@amd.com>
 <279c7ffc-99e5-f052-5de1-9b957c455d85@amd.com>
 <1ab2558b-1af0-3319-dce6-b805320a49d0@gmail.com>
 <60760210-3b3d-952c-2637-4d70fab1a857@amd.com>
 <fd95f1c0-7550-0497-7284-64a5257304ca@amd.com>
 <ddb344cc-48ec-7323-4494-4e1cb8323585@amd.com>
 <071fbdc1-38ce-d1e8-0e11-25204a3cc217@amd.com>
From: Felix Kuehling <felix.kuehling@amd.com>
Message-ID: <af705589-a601-9774-ec55-d1c244f756a9@amd.com>
Date: Thu, 6 Jan 2022 11:51:30 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <071fbdc1-38ce-d1e8-0e11-25204a3cc217@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YTOPR0101CA0063.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b00:14::40) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8b5fbe48-a45b-4f39-ec38-08d9d134cb2c
X-MS-TrafficTypeDiagnostic: BN9PR12MB5179:EE_
X-Microsoft-Antispam-PRVS: <BN9PR12MB517932E4595286C563A63A34924C9@BN9PR12MB5179.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HGhyPshB4Tce4KZTOXFSEY/9HMDjqdcX7/wvBKc7qY0gTURtUc6jRU/oEZg0DMF0NU1XvMjtwhMVc5o9Rec3nvN7+/1zZ2a51Ig1qtsUD91XvwssKOwIJftmeWrC3m9NtVcAS+G6CTtZSZZ87iJeTp9d4f66Hzf58sUwMjfSauRrp2km4IdlzWSuOaGFVxDEV/8/e9PmGdPYZSlHS4JrBBQBOuhap4i8t1HiLxdTf4/ORqeVApWyuWKOMYZ8FG0RULtoLcZpGmZEolerdSByk01hNSDof+6Ijds65GZoE3+8PWMtOqWf+xr8mo09KmpZwVkTCfw0uGY8Vv1ESek2mMcg4ftH80BlWI6H9oxDa/pflmdMMxB0eqwGm6My8p1q5DLJNRlfwx+ipwi1PBuDY560D5s635tnm4Quzbexfx3O3Ku4iRF8ymsbdFhjlVCd0vg+IwV31NWgmdzJMqq/lbMy84pDpWBdwRXVFlZXEI1htLWRhSGrAK19NDZ24l9iuaC1/Ut+qSic1wdIeDE0vT7oJnetzyEpJgAByzbrIOc/Ki7b2bT7dtz+uClZ6afzV29NMv+inL4OtlZz8oa95sAblxTDAmAdkKVJRUVJsNJZuhxuYHxIxTkQDX2AZgyPkoWGFiJtEGzUglYA7VQnPoHhDuYIygcK9Igdv8xxZBnsXpsCWEB7jaelVx1q70wmP0G8NGdiTP0TkOjjlD3Kpjv8a1lJ4hQn4E0yhkMPc8kMTlnELO1EJgmjP/7wA47n
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(38100700002)(316002)(26005)(8936002)(66946007)(31686004)(186003)(66476007)(44832011)(36756003)(5660300002)(2906002)(6486002)(66556008)(110136005)(86362001)(4326008)(2616005)(6512007)(66574015)(6506007)(8676002)(83380400001)(508600001)(31696002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3MySUVOb0g2V29DZDhVS2diUTdDQzZMcVZNUEFhR0RYM2FuQmNVN1U0bWxG?=
 =?utf-8?B?clpQVVRBUE0wdk40azB4Y1k3TGVCWlpucUlVdyszWjVrTUQrb1FWcmY3c0g2?=
 =?utf-8?B?SUt5QitJeWxubGtaQmFsanhWNGtHWXFJRVV4QkUrM2JVOG0waFNzYXppYW52?=
 =?utf-8?B?MWRHQmREYkxYQ1RVcTFIV2lmWW1UY2oyQS9RZDJJUVo1eVhCcjhSQUt4Vmp0?=
 =?utf-8?B?WitFME5QVkp6TFFtSERYbWQzNm1uSW5IQXp0aE4zVTd5YmNYWGZzY3hJb1R1?=
 =?utf-8?B?aG00TTZsMjNHT2hpUG44VFNva2w2NXJ4VlIwN2xmL0RibHRNVUZGNGJQSVYr?=
 =?utf-8?B?cmJCakxVdVJQVG1ldTloTE9rcnFxNTE3VlRxRFhXU0dna2xmV0FHL2hESmk0?=
 =?utf-8?B?TlZWNWZSeTRqS0VCc1dUdjVjdlB1YWdDTkhKL0FGOGljUkVaVE5zc0ptTXY5?=
 =?utf-8?B?VWYyakxNdGNDNWFTdUJWNGZGQXZWTVRSSnNpQXdJV2YyQkRNRnBOSjlDWHNx?=
 =?utf-8?B?V0RSMmg5bjJaVm92VklXcmxZa24vcVNqWFVxY25YM29JMVIvRFpCaEtCYVYv?=
 =?utf-8?B?WDViYmRabHloU1A0Qyt1RmhFVnUyRzJLQ0JuUGJrSFUycmgzMTFQcCtRM0lh?=
 =?utf-8?B?MDIvc0t1T2RxZ0FHNUZvUStkalVvN2tJZ1g3SXFaY1RWR2pJZ3Y0bWNRQ1B2?=
 =?utf-8?B?K2t2MFoxdEZOTHgvOUZxanpWb1JJUjZMek43bG1DYkpySFk4OWRvaGVOMW80?=
 =?utf-8?B?REg3VTgzR0JZMWFpeHFtYTlSSlg5b09yaUJKUFRYeXMwTHNMODhBMEd6V21o?=
 =?utf-8?B?Y2dOSkt4L3UxdWFLSVB5VFo1d1hLZ3dId0lPNFBSZy8zem1HWm1FTDZ2Uzli?=
 =?utf-8?B?R1JaVDIySXRNdEg1V2hTUzhrTlZReGZQejU2OC8vUVV3YVFDTU4vMDFCUkNo?=
 =?utf-8?B?RXUrTDEyZC9FVWVjOHZCeU05M25ZNlBGQXduQnc0VlZUNEx1ZGg3dTlPRU5G?=
 =?utf-8?B?KzVvdTg2d3lXRjRrVW9Zb1VINzBFU08vV1JBY0pYeXhUUndYV0l4VTJhbEZH?=
 =?utf-8?B?bmZKQ3NXcUxObVViRWlYZ21iVGR3RHVhQVBmL3R2aSt4dnNCV3NxMVg2c0R3?=
 =?utf-8?B?NFZYazZOK1doRHJSMU45dGV0UmpJNW9OSGI0ellraElRSHR6N0YrVG9maXox?=
 =?utf-8?B?K3NGa3kreHVFSHpKdjV3cWpBRlpNclNFZHVtT01vV0hjclFHbzQ2alJnNnBT?=
 =?utf-8?B?YzlEWXhQNmpzVWl1M0piMVhWSS94aUJCRnVWejY1a215cElGb0ZVQW1TRVYr?=
 =?utf-8?B?aDZBV3lMSW02dXFCSFUzZUF3bzY4N1N4ejdweTZsaU4waXAwY0IyeUZGZmhl?=
 =?utf-8?B?bXNrb2tTeHppUCtzNUw0ZEpnazhxT3ZtYi9VdFlKZU80bUk2RWZOSHFvWTlK?=
 =?utf-8?B?cEtWYWMveDVMU3NNVTIzUUpjWHgrTDJjd044Z2oyY0w2MlozQ2xzTFpaVUtk?=
 =?utf-8?B?RDRuVHdhcHJRb2svL0doZG5LdGJJRS95UmdxUGV6cnJodlQ0RSs2QUxnYXJT?=
 =?utf-8?B?QWxPUHZlVUlzS29pYTl1cEZiM0ZHWTU5TFlwSGpPbTdHYUNlWTlBVXNlNC9V?=
 =?utf-8?B?V0dRNEc2YnVCQjdrWXBUaTZEdGZZbHVtb1JJUklTMjAvcXBDKzFncDlpdkRE?=
 =?utf-8?B?ZnczajdBM0ttZ2lPVHZuVnh5RjA2UDR4c2JaSTZ2SHVTdFRRdnUrcWdvTU5m?=
 =?utf-8?B?RTZPai9zMGVDZGlWWW1SYjVIdVJjQ2U3V2JmaHlJa1ROWWF6U3hKK0NiVUJq?=
 =?utf-8?B?Z3hjSXVyczdlaWNubzhzNGNRbFB3YmIzSWx4UHRGOTErOE9rOFVlYnhZdVZP?=
 =?utf-8?B?NXVHZ1cyQTNuaDZuNXhKUHl5TlV2RDlOQU9nVURJaHZtb0RxQ0RBWFUyaUJI?=
 =?utf-8?B?WVlYVERWSlFrOCtUMTRYbU5qV09BK3FQYWZkTi9qSHRxb2pieCtteTB0U2ds?=
 =?utf-8?B?WEhYWWdhOEZiTnJyYXphemxZU1FRUWlZQkdOZnkxY0paRS9udGREKzRqQkwz?=
 =?utf-8?B?eStPYWJ5U1I4RmdKK0tSYjFCNTVJSE9TT0RZcG1sLyswcDd4WGlzUzdKMlhy?=
 =?utf-8?B?eFAyaHBMb3NLRGQyNVZvNEIyWG41UHd2b05IQzhEazlWN2hQN1VodTNvL2NU?=
 =?utf-8?Q?+NGD9iT9utPi8rDJjfXA/T4=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b5fbe48-a45b-4f39-ec38-08d9d134cb2c
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jan 2022 16:51:32.8265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RUYCtfVmA7AHo64mrleGiZwe1Inv3BL5s7nf2Hd4SK+p/h1ruspcn928f1EUOF5SSbnJKfbDIvD724L/F2p4ZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5179
X-BeenThere: dri-devel@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Direct Rendering Infrastructure - Development
 <dri-devel.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/dri-devel>
List-Post: <mailto:dri-devel@lists.freedesktop.org>
List-Help: <mailto:dri-devel-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/dri-devel>,
 <mailto:dri-devel-request@lists.freedesktop.org?subject=subscribe>
Cc: daniel.vetter@ffwll.ch, amd-gfx@lists.freedesktop.org,
 David Yat Sin <david.yatsin@amd.com>, dri-devel@lists.freedesktop.org,
 alexander.deucher@amd.com, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 2022-01-06 um 11:48 a.m. schrieb Christian König:
> Am 06.01.22 um 17:45 schrieb Felix Kuehling:
>> Am 2022-01-06 um 4:05 a.m. schrieb Christian König:
>>> Am 05.01.22 um 17:16 schrieb Felix Kuehling:
>>>> [SNIP]
>>>>>> But KFD doesn't know anything about the inherited BOs
>>>>>> from the parent process.
>>>>> Ok, why that? When the KFD is reinitializing it's context why
>>>>> shouldn't it cleanup those VMAs?
>>>> That cleanup has to be initiated by user mode. Basically closing
>>>> the old
>>>> KFD and DRM file descriptors, cleaning up all the user mode VM state,
>>>> unmapping all the VMAs, etc. Then it reopens KFD and the render nodes
>>>> and starts from scratch.
>>>>
>>>> User mode will do this automatically when it tries to reinitialize
>>>> ROCm.
>>>> However, in this case the child process doesn't do that (e.g. a python
>>>> application using the multi-processing package). The child process
>>>> does
>>>> not use ROCm. But you're left with all the dangling VMAs in the child
>>>> process indefinitely.
>>> Oh, not that one again. I'm unfortunately pretty sure that this is an
>>> clear NAK then.
>>>
>>> This python multi-processing package is violating various
>>> specifications by doing this fork() and we already had multiple
>>> discussions about that.
>> Well, it's in wide-spread use. We can't just throw up our hands and say
>> they're buggy and not supported.
>
> Because that's not my NAK, but rather from upstream.
>
>> Also, why does your ACK or NAK depend on this at all. If it's the right
>> thing to do, it's the right thing to do regardless of who benefits from
>> it. In addition, how can a child process that doesn't even use the GPU
>> be in violation of any GPU-driver related specifications.
>
> The argument is that the application is broken and needs to be fixed
> instead of worked around inside the kernel.

I still don't get how they the application is broken. Like I said, the
child process is not using the GPU. How can the application be fixed in
this case?

Are you saying, any application that forks and doesn't immediately call
exec is broken?

Or does an application that forks need to be aware that some other part
of the application used the GPU and explicitly free any GPU resources?

Thanks,
  Felix


>
> Regards,
> Christian.
>
>>
>> Regards,
>>    Felix
>>
>>
>>> Let's talk about this on Mondays call. Thanks for giving the whole
>>> context.
>>>
>>> Regards,
>>> Christian.
>>>
>>>> Regards,
>>>>     Felix
>>>>
>
