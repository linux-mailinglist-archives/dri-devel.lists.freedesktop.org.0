Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 60D2D691E9A
	for <lists+dri-devel@lfdr.de>; Fri, 10 Feb 2023 12:50:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 337DD10ECFF;
	Fri, 10 Feb 2023 11:50:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2083.outbound.protection.outlook.com [40.107.223.83])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A915010ECFF;
 Fri, 10 Feb 2023 11:50:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eQzl41vGomYn/B7ItNa5nVoXs3IxULtQP4kOA9+Y9+O0woLfX1y/fTXvJeXuximyCnH7aPAhFdZxm3xhjHae+9Q/leFiJEHbiQONK0LhbbMBmqepdIBT4e6RQ+e7MRnHLu3zlNmaGcz9r39Qxex22vQz7Iu/HOAdT7eww0O39SJnlxXz7mU7RaJap5VeIef9NkqLMZXJIwbvJR9WW7zTCCiAnK9BrjpE/HPBFucBDJyJEk/YUxpFS9r4/sK/spMBUA2Ikj0HSPtj5x4IIMNAmHzsIt0s1NGMGJIcssXZWVpMtXZTlhLDFQT1g8CT73Z9PnegpdLOk7xlLsDGahxHFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G6pdfoTrkaFkEUD/Q8Lu04SLdSw6OnC3nMrDj/ddnKY=;
 b=B97TrS4N4GBG7PIDYg5jNWz9wwiV43hZb7mYJ6JBEvzHqaWRXaW/WlViyMaU16HoKxevvdDD/tB1TO8aDqLwMBoDxa2InxcsZQS6mUgrWgRJo1nDGERW0jBhPvrrQK4sYvGppd+fEHRaOrQ6ysRnhe8pdOSXqA1ZvxMJsKG7DPAH6RQcj9LORmsMywt5vNGJNSOevzKlDKbnxefrj9933c+zKcg7AEqhcBbDoGJzP9fLnFDgzxSeU8YkkNWXU5BtqHjyQ3Q3O+bjI/lwlweyOgCO73OQ7ozTm9jOsaCJ/M1QgyMUt1HX/DQm4gVap4rz1a/Nh5X7jgSXFsN/aFD65A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G6pdfoTrkaFkEUD/Q8Lu04SLdSw6OnC3nMrDj/ddnKY=;
 b=nYLDJzkUwnthGgoKk8ItmD0JLMp1Yum/QzzUTHj38SDpxZLSM0L/AV1yFZGZGD8swQdnmAHx5X/B6hCBfn1XKv74jGt51IpQljdyGLZoGhcYfTkcdFVyIeIkXGRMnexuvSNhDPZkJYOZTkGGn41PGULN3FAoSKkywPiQgoAlmik=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MW4PR12MB6875.namprd12.prod.outlook.com (2603:10b6:303:209::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.19; Fri, 10 Feb
 2023 11:50:10 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6086.019; Fri, 10 Feb 2023
 11:50:10 +0000
Message-ID: <28eeb2f9-76e5-2a74-8adb-183f00900da1@amd.com>
Date: Fri, 10 Feb 2023 12:50:02 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [Nouveau] [PATCH drm-next 05/14] drm/nouveau: new VM_BIND uapi
 interfaces
Content-Language: en-US
To: Danilo Krummrich <dakr@redhat.com>, Dave Airlie <airlied@gmail.com>
References: <20230118061256.2689-1-dakr@redhat.com>
 <Y9MjSeMcsd18r9vM@DUT025-TGLU.fm.intel.com>
 <7c046ff9-728d-7634-9d77-8536308c7481@redhat.com>
 <c2256c7d-e768-ae3f-d465-b9f8080d111b@amd.com>
 <2427a918-5348-d1ef-ccae-a29c1ff33c83@redhat.com>
 <a214b28b-043c-a8bb-69da-b4d8216fce56@amd.com>
 <3a76bfa9-8ee5-a7d9-b9fb-a98181baec0b@redhat.com>
 <49ac3f95-6eda-9009-4b28-0167213301b2@amd.com>
 <bc523c5c-efe6-1a7f-b49a-e0867dc1413d@redhat.com>
 <15fb0179-c7c5-8a64-ed08-841189919f5e@redhat.com>
 <1840e9fb-fd1b-79b7-4238-54ae97333d0b@amd.com>
 <CAPM=9txON8VCb3H7vDY_DOgtUg2Ad3mBvYVxgSMyZ1noOu-rBQ@mail.gmail.com>
 <a1c526e0-0df7-12cb-c5a1-06e9cd0d876b@amd.com>
 <3f935a7e-fede-2bad-c029-4a3af850c9b5@redhat.com>
 <95d0631b-545c-ea4d-7439-75422e9a9120@amd.com>
 <67958920-c5bb-a0f5-2306-e3ae4fdbaeb3@redhat.com>
 <c0635ff3-027f-bcd7-afbc-46f4e62d3651@amd.com>
 <4439c44b-cbd0-7160-da3d-e78f6aeeec77@redhat.com>
 <85548cd2-1bea-3c04-40b9-9abb03cb57b3@amd.com>
 <69e87e6a-7e6a-7b8d-c877-739be9cba0a1@redhat.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <69e87e6a-7e6a-7b8d-c877-739be9cba0a1@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0139.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:96::14) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MW4PR12MB6875:EE_
X-MS-Office365-Filtering-Correlation-Id: 229e439d-e8c1-43a7-8358-08db0b5cf649
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Ttn7eRKEU1MxnFKMX8vrNB0UMwgv9Oh49V5LV+Bp1m9N+J+N7BCxdfeBXeNpqwitBPRmo23qmlPBe/xqmCsZkFbEWfZDQrs5Q7gl/ilm5PJH9i4WWLIyyb4yxJg7SQ24FwB9VqMizD3hZ2vY23OvYLqewUvH2brxbk4DBK12flaT1ThePM5e7eU39A+JZFRZi8pw8NHAteiMSQpwx2jYxtAUMftJY8i5A+UylWJtoTGTH6vYfGLTZLOcwGuzaeGOQ/akxMHQ7LJZwx2J9bAiFucpquj/YOPoRrHKOHeK4KMR4koYY5H55OSr30Mbr5rUZtzm32dc6SQBfn7i5VtagbJkNWUujxCLaZui59QeJ2+R48BfYx8ooCPKGyoSEsHmZnO5Mq7jH3Bt0qlKynaK5N5ERurtKheyD+4Q15MVVZuM726bWyeusRULHScrqGngtMLn4lQEHRjcq0Ypz/MsMDeYJTqGRu8QjTt4yyAWNUi5RF7JQnO/7rlXJJueKeKk55yVk9waZMukOidPMkz9Uhm0hccMxzFtH5nFbHvDaOxbkODqQBhab3oBeswuZG/OR1GzAHmo+y1rwxAvqNt7Roq9P54RxnjlmpIjvcbJd6Hq7JD6/iZa9dmMlZ5uOi2f1GigR6hj/zjZXeg0ISsJhDcvxtRE095yuJK90zznOPNw3w9lZYQiGl9VK/3+tdEHEpeirFb3CPVZE3oYAfexA36X7wvguH+sOkqcdSmNe7o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(136003)(39860400002)(376002)(396003)(346002)(451199018)(38100700002)(5660300002)(36756003)(41300700001)(31696002)(31686004)(86362001)(2616005)(2906002)(83380400001)(66574015)(186003)(8936002)(7416002)(110136005)(6506007)(6512007)(53546011)(6666004)(316002)(66556008)(478600001)(6486002)(4326008)(8676002)(66476007)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Sjgxa2tkbG5ERDBPMys0bFpTcnVITG1Rcm1PcFhzUVp5QWN6V3I2QjBLWHBB?=
 =?utf-8?B?NTV0ekRza3kxSXlDWTFzOEZleSs2b21tZzZLSU9jMHREMmRIaGpIWjM3OWZF?=
 =?utf-8?B?UUJ6R0xudWl5SHZPeTVkN2NzS2hZbEErRmtCWGkwdXZURlZ2OUdLTVR2eWp3?=
 =?utf-8?B?RFV6K2hGSzNwRnRZcmhJU1lJUGJVTkdDdFU2cC9EaFdLclBid1l6TXZmcFNM?=
 =?utf-8?B?b1kzQXkwRGNrQ210VUhGOGZDSkRNNVBIQmlzazFHOHBJbDkwd3ZFUXc1c1Ns?=
 =?utf-8?B?L2p0YUJtcVZHWWMwVGF4cnRkclpLejJRbmZVcS9mQ0hHekF6dWcvSHl2dFRn?=
 =?utf-8?B?OU9Wc2lTZ3V6Y0k3YlhlR2VQcFBYTTBxWUZPbldXd0hDdk43KzdHTlhZNVlV?=
 =?utf-8?B?K2dpd3g3WlhjSHBycmh1YXIzZ3NLWW9NTkRidFlGU1lGaEZGcWJQaHV4L09F?=
 =?utf-8?B?OXM2dHMrbDcrNGI3S0tBYXVaaEtMNzk5eEc2OW9qMTFZeFlNaTNaVm5LSVlI?=
 =?utf-8?B?Qy82SU1jQ29OdWNta3E3YkRhd21wZmxDZGtWWVZJdHMrKy9JSUIyU2RrUGFN?=
 =?utf-8?B?TlZkZkZaNzNCeHZUcVFNR2kvZTVsNzhmc2p5TnhreG9UbkN4anNlcEJkQlpW?=
 =?utf-8?B?WVNjNTVLdG5MeDdDM0phU3kxZzJHNHpZWWRsMzJvZDBjM2FUdnUzYmoySmZj?=
 =?utf-8?B?T0ZGdHZjak9jdWt1Q3NlNVJkbVcwMDRFZ25US1dId0NGNTVTWm1QbWhSMG5Y?=
 =?utf-8?B?cjN5bTI3ZEE2UTByZHdUUXU1cmw3TFU0RlBkZm0yYWw3amVvdzlhYXFXeUo0?=
 =?utf-8?B?dDQzSDhGREZuYXFrb0orRm12NTViVk1CRVFHVmZxODh5S0ZuSnhMNUxKekxz?=
 =?utf-8?B?ZS9KVythdG1OenZkZ0NwdjI4dFcxc2J2Rks0VFJJNCtpejZJc1k5QlBEVTA3?=
 =?utf-8?B?dzVXeGVtazJmM1BUa08wSWNyMU83bVNSUmFGRzZOeVNMVm82TjZ2anFTdzN4?=
 =?utf-8?B?YytaNjBoRXhrY1R6UUpkWWRaUnFYeS85NndxRnF2ejQ0MzdUWlA1OUlaVU1v?=
 =?utf-8?B?SkxaY1VpQ2JRSEtoOEdpRGZtemRMdTZwdW9pSHhXbzlFMkxYMXFqdHpvYXBn?=
 =?utf-8?B?TUNFUkxBM09aY3Y3dzAvQ3VUclVpN2xhV094dmNvbDcrZ1FlMExXbUdMS094?=
 =?utf-8?B?OWdXQXpIUzA5RzVYTGVUbWRGZzNCbnJjVWQrdEtiNERhMUd2ZjFSMUtzeUtQ?=
 =?utf-8?B?L05TYmMza0NaaEt1RlVJQndkdm92dittYTQwZHUrejhPSDlZSXNkb3paSFhG?=
 =?utf-8?B?N1dldUc4eVNTSUlMNHNPR29hQ09hOVNRcTlHcGZ6VThobzF6ayszTnNZMW5n?=
 =?utf-8?B?V3ZlT0thakcvYTArdkRNaU5LOFZDdXVIOE5TVjVBQWJ4Vmc3UU9Zc3FuZjN3?=
 =?utf-8?B?WXkyY01nM211Q1dtcTBCOVduZjFPbjFvY1NqSklCcVlZZ0VjRnp2d0VxcDMy?=
 =?utf-8?B?UW9ncDJGY3plclV3SkREMm9hWDFuZ3FNK3Nld053eUZyenl6VHR3Mk44eU1r?=
 =?utf-8?B?NmRkR2drUU4yQXpia2ljajZtd3pXVjRIWWw3Y1ZOaXJVSUtjREI5Y0x0UHkz?=
 =?utf-8?B?eUpsSy84OTlrYWp0RVd1V2tKSGJBZ1BvcllLb0N2NWo4Z2JseVdOOXBLQkZO?=
 =?utf-8?B?c1d0NnVDOXVER3JQRjJhamVjcFkzanFIY04vTHlkUDBWeUtJTnRzeEwreXph?=
 =?utf-8?B?M2EvMm5ML0Y3YWdkQytRUEdnNzJvYXhiMW1RakxQVVJiN2tTL0d5YWF5TlNZ?=
 =?utf-8?B?VU5aZzRPSVFUSVdYYlBKcnlWeE1LT1FPbExQRFY5TG5mM3M4aGRXNGVLMDNn?=
 =?utf-8?B?SXh2NEovZFQraVUwT3A3OTJ4MUtOa1M2bXZUbDlkUWo5M25iajZraFhnaHdI?=
 =?utf-8?B?aXRWVlNEdHV6cVFwMm5PSlRtUlFXYjZpaVVicGEwTjZhbzAwV1NOWFBhZmlY?=
 =?utf-8?B?Y1RLZHhRU09EUGJ2OGhPOTNtU09XU1FYcUpkelprbGxsZEJNZ2NYbjhuUERz?=
 =?utf-8?B?WFgzeWVSbHJUTlAxUlhUOGJFR2FKWE1VSklSRjJLMC9UcTJkWm1LL2FhWFU3?=
 =?utf-8?B?ZVFaMzl1cFdMV2l6THEzdkpvQ3JGWXFsenRhTGdzbVljMUdFRWh3NDhZOXFi?=
 =?utf-8?Q?gcDo4Y3EdQ1bm5tfnp0APK5fp8PltcUIu+fHwLlKfNGn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 229e439d-e8c1-43a7-8358-08db0b5cf649
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2023 11:50:10.1372 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BxKxAb/B8vg0U4MLa8jPfyNLpji8bnqV8kw5phZe73Ko/tGoC5s/4+OBfvlX2ezB
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6875
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
Cc: Matthew Brost <matthew.brost@intel.com>, jason@jlekstrand.net,
 linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org, corbet@lwn.net,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, bskeggs@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



Am 07.02.23 um 11:50 schrieb Danilo Krummrich:
> On 2/7/23 10:35, Christian König wrote:
[SNIP]
>>>
>>> Just to have it all in place, the example I gave was:
>>>  - two virtually contiguous buffers A and B
>>>  - binding 1 mapped to A with BO offset 0
>>>  - binding 2 mapped to B with BO offset length(A)
>>>
>>> What I did not mention both A and B aren't sparse buffers in this 
>>> example, although it probably doesn't matter too much.
>>>
>>> Since the conditions to do so are given, we merge binding 1 and 
>>> binding 2 right at the time when binding 2 is requested. To do so a 
>>> driver might unmap binding 1 for a very short period of time (e.g. 
>>> to (re-)map the freshly merged binding with a different page size if 
>>> possible).
>>
>> Nope, that's not correct handling.
>
> I agree, and that's exactly what I'm trying to say. However, I start 
> noticing that this is not correct if it happens within the same buffer 
> as well.

Yes, exactly that's my point.

>
>>
>>>
>>> From userspace perspective buffer A is ready to use before applying 
>>> binding 2 to buffer B, hence it would be illegal to touch binding 1 
>>> again when userspace asks the kernel to map binding 2 to buffer B.
>>>
>>> Besides that I think there is no point in merging between buffers 
>>> anyway because we'd end up splitting such a merged mapping anyway 
>>> later on when one of the two buffers is destroyed.
>>>
>>> Also, I think the same applies to sparse buffers as well, a mapping 
>>> within A isn't expected to be re-mapped just because something is 
>>> mapped to B.
>>>
>>> However, in this context I start wondering if re-mapping in the 
>>> context of merge and split is allowed at all, even within the same 
>>> sparse buffer (and even with a separate page table for sparse 
>>> mappings as described in my last mail; shaders would never fault).
>>
>> See, your assumption is that userspace/applications don't modify the 
>> VA space intentionally while the GPU is accessing it is just bluntly 
>> speaking incorrect.
>>
>
> I don't assume that. The opposite is the case. My assumption is that 
> it's always OK for userspace to intentionally modify the VA space.
>
> However, I also assumed that if userspace asks for e.g. a new mapping 
> within a certain buffer it is OK for the kernel to apply further 
> changes (e.g. re-organize PTs to split or merge) to the VA space of 
> which userspace isn't aware of. At least as long as they happen within 
> the bounds of this particular buffer, but not for other buffers.

Well when this somehow affects shaders which accesses other parts of the 
buffer at the same time then that won't work.

> I think the reasoning I had in mind was that I thought if userspace 
> asks for any modification of a given portion of the VA space (that is 
> a VKBuffer) userspace must assume that until this modification (e.g. 
> re-organization of PTs) is complete reading 0s intermediately may 
> happen. This seems to be clearly wrong.
>
>> When you have a VA address which is mapped to buffer A and accessed 
>> by some GPU shaders it is perfectly valid for the application to say 
>> "map it again to the same buffer A".
>>
>> It is also perfectly valid for an application to re-map this region 
>> to a different buffer B, it's just not defined when the access then 
>> transits from A to B. (AFAIK this is currently worked on in a new 
>> specification).
>>
>> So when your page table updates result in the shader to 
>> intermediately get 0s in return, because you change the underlying 
>> mapping you simply have some implementation bug in Nouveau.
>
> Luckily that's not the case (anymore).
>
>>
>> I don't know how Nvidia hw handles this, and yes it's quite 
>> complicated on AMD hw as well because our TLBs are not really made 
>> for this use case, but I'm 100% sure that this is possible since it 
>> is still part of some of the specifications (mostly Vulkan I think).
>>
>> To sum it up as far as I can see by giving the regions to the kernel 
>> is not something you would want for Nouveau either.
>
> If, as it turns out, it's also not allowed to do what I described 
> above within the same VKBuffer, I agree the bounds aren't needed for 
> merging.
>
> However, I still don't see why we would want to merge over buffer 
> boundaries, because ultimately we'll end up splitting such a merged 
> mapping later on anyway once one of the buffers is destroyed.

Well the key point is all approaches have some pros and cons.

If we merge and decide to only do that inside certain boundaries then 
those boundaries needs to be provided and checked against. This burns 
quite some CPU cycles

If we just merge what we can we might have extra page table updates 
which cost time and could result in undesired side effects.

If we don't merge at all we have additional housekeeping for the 
mappings and maybe hw restrictions.

> Also, as explained in one of the previous mails in nouveau we can have 
> separate PTs for sparse mappings with large page sizes and separate 
> PTs for memory backed mappings with smaller page sizes overlaying 
> them. Hence, I need to track a single sparse mapping per buffer 
> spanning the whole buffer (which I do with a region) and the actual 
> memory backed mappings within the same range.
>
> Now, this might or might not be unique for Nvidia hardware. If nouveau 
> would be the only potential user, plus we don't care about potentially 
> merging mappings over buffer boundaries and hence producing 
> foreseeable splits of those merged mappings, we could get rid of 
> regions entirely.

This sounds similar to what AMD hw used to have up until gfx8 (I think), 
basically sparse resources where defined through a separate mechanism to 
the address resolution of the page tables. I won't rule out that other 
hardware has similar approaches.

On the other hand when you have separate page tables for address 
translation and sparse handling then why not instantiate two separate VM 
manager instances for them?

Regards,
Christian.

>
>>
>> Regards,
>> Christian.
>>
>>
>>>
>>>>
>>>> So you need to be able to handle this case anyway and the approach 
>>>> with the regions won't help you at all preventing that.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>
>>
>

