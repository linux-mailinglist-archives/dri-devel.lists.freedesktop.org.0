Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EDAA43CCBA
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 16:50:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 053CB6E8B8;
	Wed, 27 Oct 2021 14:50:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2041.outbound.protection.outlook.com [40.107.93.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B994A6E8B5;
 Wed, 27 Oct 2021 14:50:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DGT3Z3/R+K3+EaFAtOZzO2fGGKDCkqUbABqetzpOqs4O65eYX5DMuH/LIF8jDO3RQWAP7ANiTQlK4GLIQvhAwuh9X0bPBBS2YnmMSdYqHAaZedtYvPWt9rRzyPFqaEfJFDGDRSkWFAV6M6RHJIQI9lTaKRZLHH0mEmwZm88yoXDRqWIYxN+t8ExkCSNO8QBey7w967oGh4CpT1BJZJyEJ8ecwBQpdIx+jZPUIlBTNPVRDnDYoOz1UCvGO7JeesLaEiT/A9EgdaIHHl1OECbJtkZ2nfvOKVQc8hrrD07lrJ6+IqyddHbuHOo17VjX7GqQcdm0/DPfTOVfwJ6v9seZAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GwKzxukKDnlGe+5JlOUBAGgQTWTA2nAGeZI87bR4EtA=;
 b=CTcf8sBac5tTIbff0joDJyY6nx1TUa8CzG1r/OHcPwBbfXMEgDA+fKixjIKUt7DM/YqCm1hN+OVFXuEOQa21ybOK8C/kIo6EoMpcUL20DGGkaIEei09DoZ6ss2THAA653v+aJvMdyovDAFGZ5p6F8E6kSToPlFVnLLXZgQf2RDM3cK9lFI2x3Yody4SCH5yqj/31oIcajbVarcyArNOfLY/E4mDxW26evtOl2ggwV3bMxGmRTnHx/9xCgehCJfFLgMFMdQBAz4rwQTx/8S5auFG9kXjD1zXihiqLItxqa8+Gcfsj1K5ShqLGVTjXu2sikx593DaD2ctG8Z5McxGAVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GwKzxukKDnlGe+5JlOUBAGgQTWTA2nAGeZI87bR4EtA=;
 b=E4XL9IeJ7UTZcj7y5BtB7YxcAiZpjPloT7o8IToKhoWLelIHNYBEW7bYkzWL9NdHlFbNZ1yoH69w2iNUEO7LFmKg7SB7XnN2iENyJmHgzorgKQCJEjS1+IVXgYADhjksM9NtWP0qDxCP7cZ+CLUPfRTyFxOJSNCzvQ3AUygePS8=
Authentication-Results: ffwll.ch; dkim=none (message not signed)
 header.d=none;ffwll.ch; dmarc=none action=none header.from=amd.com;
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14) by MWHPR12MB1936.namprd12.prod.outlook.com
 (2603:10b6:300:114::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.15; Wed, 27 Oct
 2021 14:50:25 +0000
Received: from MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a]) by MWHPR1201MB0192.namprd12.prod.outlook.com
 ([fe80::55c7:6fc9:b2b1:1e6a%10]) with mapi id 15.20.4628.020; Wed, 27 Oct
 2021 14:50:25 +0000
Subject: Re: Lockdep spalt on killing a processes
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 amd-gfx list <amd-gfx@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, chris@chris-wilson.co.uk,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>
References: <73c163b4-1917-1cde-b75f-831ac66f6ea0@amd.com>
 <2090e8e6-4b0a-4b75-a776-64dde1ecdfd5@amd.com>
 <152adb05-e863-525a-f586-ecccb39a4724@gmail.com>
 <5e67d2d2-f5ce-2669-6ad9-7e40c74ce853@amd.com>
 <696ac3f9-4b45-b8a5-5300-79093d2cd1a5@amd.com>
 <2639d027-b6c8-ee09-5e9a-564308949c53@amd.com>
 <cbeac930-84c3-7a62-0b3d-4cef3074139d@gmail.com>
 <da1ed5da-59ad-d12a-906c-c84b7462d8c4@amd.com>
 <bb70e916-e71b-9968-78d9-d7de8fef9e91@amd.com>
 <5c70c6a9-8867-506a-1e7b-32f85589a070@amd.com>
 <c5fc1be1-eaec-a57c-79ee-9a63123ed9a2@gmail.com>
 <a1f594de-e326-6150-c787-35a4fde648d7@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <ca590ce0-ea1c-0d40-f157-2e3b5c657b01@amd.com>
Date: Wed, 27 Oct 2021 16:50:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <a1f594de-e326-6150-c787-35a4fde648d7@amd.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: AM6P193CA0066.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:8e::43) To MWHPR1201MB0192.namprd12.prod.outlook.com
 (2603:10b6:301:5a::14)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:1ffc:9265:7616:2569]
 (2a02:908:1252:fb60:1ffc:9265:7616:2569) by
 AM6P193CA0066.EURP193.PROD.OUTLOOK.COM (2603:10a6:209:8e::43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4649.14 via Frontend Transport; Wed, 27 Oct 2021 14:50:22 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 21584bd0-c4ae-4009-7327-08d999591bcd
X-MS-TrafficTypeDiagnostic: MWHPR12MB1936:
X-Microsoft-Antispam-PRVS: <MWHPR12MB1936A1D292A9115F6CBA0CA283859@MWHPR12MB1936.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: f1o4XZHEJwSB0w7XIcFuR9EHV8obUh3WsSp4FHSmykYmGQEeUtFv2a5OHFvP9xgue6yOTbv/M1PbLQOuSsmtpwPtiilnDl5leA8Yb2ZrPNS6zl1cRiJNBYs1YOf6kA6Z6wXPt0QEgbVclRIF1bKHsIV4aowgRhhc103J1Q2AOFuR/WuCbED/9oIEeoFSRbr8UdRRHs8H/Nt4uOnP7bpuz0wfYE2UL0MSTetrKy/vJr70YXJtqtjVZ0n+NN48aO8NBM1YowtAlw4t+LmwYo8y+1BQy1Wyo+EIqmCeGk8TUc/XbXPUGpsAuYA2WyuKdgdOWCX1ZRqVqQQ6kxyovGcURqnhJK5nSobbHVrs5Bsi/5Va9p8E106UKpUuBC3eraXAt8FALeq5n1DohvqRYEOozhsBRyFNj2ZC+FffhwBBSRIpQrhCTal2L0iEhQy5g2rlPSPsyx/q4tu34GcCWegZ8GSMSEpsdhHz7OFbdR/I9+w4awYuK3+u3HVa/RX2BpADVKt78ZxZqTPsyHgXaKMmf8g9N/a18ouq7nQpSEWdLohKb6ZEzAH0LbvObvyPrzbBT6IXpprFmIVd4pKmRozKIi3SQSwuiUFdrAsNeNZRsWYoe1hZsJntUDe7KH5FkDL2JfYit+mjTE2kYqfJARS7HWOxIZIAJdvdPmOVhkFi4zzIHGPJSFcl2pTaxbzkJwZEScj2+5imYfQRH76N6Aqe/7t1EHIS3qfAcVXZMjhX+u3OOp/NkRJLwbuX47ECxi9B
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1201MB0192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6486002)(83380400001)(38100700002)(31696002)(86362001)(6666004)(2616005)(4001150100001)(53546011)(31686004)(5660300002)(8676002)(66946007)(66556008)(66476007)(2906002)(110136005)(66574015)(8936002)(186003)(316002)(36756003)(508600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WFVCTFBjL2RaQzlCNWd4dEh1N3plelJWV2I3WmVzUG96VG1GSGNaNVZORXRh?=
 =?utf-8?B?cUdWUStLUlpFVmVraUlXRTI1NFNvcFNGQktIZEdNZVdPTVZFR015TXZwQTcv?=
 =?utf-8?B?dGxUUmZzMXV2L2VNZWY5ZDI3Z1Vxd2dkR1hMRGEwVzJlWk1VUjFFL2Z2YzZa?=
 =?utf-8?B?SzlGaXRPMnNoVTU0Y1J4aENjb0JGOWcwVTNRbTNVcElXTGNrQzFvTGF3QVo1?=
 =?utf-8?B?M3hWSXhEZlJmUmliNlZsMzhwRmEzWUNZSGRyRm1NYUwrbDNQTHpvdUhQYTF0?=
 =?utf-8?B?cWZTN1BmbFg5TTQyS0R2alB0bS9maUJ2OXExdE96S25rWnF3OUpCTmwzVVor?=
 =?utf-8?B?OTlwUzlzeWVOV1lXWWJVeDJjMG9NOU9xYW5NbFpnT3pMQi9RbEFEUEp0VUta?=
 =?utf-8?B?cVE2K1RUVzE3ejM1eUxoUUlKWHN1RWdRNEFYbUVWa0tPYlg3WWtOZzBTNE10?=
 =?utf-8?B?ZXZUeC9DNis5US9PYmVDeWdzdmw1QTRadjJaYWRha2phLzZiNm1KNU5vUTZi?=
 =?utf-8?B?VjFHRUNEaWVCUWJZNmRLYnh5UWhrT2UzTE5aYmJXSDRUV3o5ZENrdXJvTEdR?=
 =?utf-8?B?akF6TndBcHQ4Tk9vbFBZV3RtQ0lxR25nVjVHWXlXallKZUhmVDYxNkYzb0x1?=
 =?utf-8?B?L3ltTzhGK0d4dXUxWXpabnJyL3NxNERucGl3TzNseTFmVUt5cWtKMFd6YlU4?=
 =?utf-8?B?eWJ6Y25aWTBaUGFFY2FIMXFkRXorU2VJRmx0MGVJUk1LOEJqek5WTnNQRWtZ?=
 =?utf-8?B?Zk5obTVXekRsaExrM2RxaFRucnd5aW5vS0pSSlpHRzJEQnRUYTlPMnN3V0xB?=
 =?utf-8?B?RFVsSnNHZW9GNFo3MzBpS0NZaWVvKzI0MS9NNTZaZDhVVVJraWxQL0RuN3pS?=
 =?utf-8?B?K3ZJa3RRYkpFa0dGemdicHhNamxGNHJ5aXZxbXZoc0hCRUNSZXIxM21kNmxF?=
 =?utf-8?B?WW9mdlVOSmJWOVhkUW9WYnpYMFVyMENRQ3hrMXNPQ3hjMmVxVjRzeWRTNURT?=
 =?utf-8?B?blUyYWgxSW1peXg1NlR2WWxVY281R1VhL1YzbnlYSXQwWnQwRWtPK0g5cExZ?=
 =?utf-8?B?RnVMTHlaR203WG8xR3U4b1FrYktESnRrbWQxWDFwMEZ1RDBZRW52dUJJYjI1?=
 =?utf-8?B?cUY4cjJOVkpkSFJQdFIxcXk3cTVHNTFwVXlpeVRCYWhuQnAvQkJwNlRNRFJh?=
 =?utf-8?B?d3p6a1A0Mkd6eFdidzFjN0JQa3dWYnFnQTM1V0lKK0NWeGdnRlhmVTE2RFE2?=
 =?utf-8?B?UkoxV1BaNEFmOHFSUmZRdzR5RDJOcXhjMC9PL1FpRkp3UmdlNCs1Yk5oekE2?=
 =?utf-8?B?Q245UnIyTGlObFkyT0gxOURlTkVSVGFiNXpOeTBxRVBSaXJhOHNzRCtRYk5B?=
 =?utf-8?B?ZFJicDJTN1UzNjMwcUlhbDFLYStXNWtSQlhDMXFPK1NZV0l0bFhTTGNDY0h2?=
 =?utf-8?B?YmtkczJ4Zy9QcUpLeVgxTUFLUW1PZ2VncWw3Q1JNVmxpUWJTVHBReTF2NWM0?=
 =?utf-8?B?ZWhZVHR6aUhsWVJSb1BRQnl4QVhnWWNBMG5oa2ovbjFKTkxLSmFqY0N2WTcx?=
 =?utf-8?B?ZG15NjFyR3hSODB5cllobGNMa05vVHczZlNKUmQzUnUwL2REVkl2T1M3Ujlq?=
 =?utf-8?B?d2pURHM2Y0ZMSXcrMEt2KzN1dEM3TEsydDllVHFFRkRsNUxnb1RCUksvbzE1?=
 =?utf-8?B?anFwNU5sbTdWa0dPd2ZiYVFVN0lIcVp0RWlSemw4U05lZDN1ZHkrNThkK0Rr?=
 =?utf-8?B?L1hBbFErSjk5Qmg2VXBJcjN5NTJRLytxOHQ5QzlvUUJUUmZaK1ZRYUhKSUFa?=
 =?utf-8?B?TG9oRmVkdE5kaHVHMUNkZ2xKMXltSU9uaUdON0VRdElCcHAxNFBPL2tkLzE0?=
 =?utf-8?B?TmZaWlpRc2VyeCtTNXBVcFBvdDZjSDYvclFEeEpMOXV2Z2NZdk1RYWMrbUpt?=
 =?utf-8?B?UGlBNk1zSHkrZmlKRDVKNExjbmhESWN5bm91aStLZ1VSNVJESzBKZUo2UmJz?=
 =?utf-8?B?cldmNEorQnZSdnNnbnR2YzEvZGsrc1JlYTVMakRVZzB5VFhna2NMVG9NdkFn?=
 =?utf-8?B?V0NNMDNIS3NTNkdWa3ZXMldGZkNTSys3TS9zeWswV08wajErNU4wWjhhSERy?=
 =?utf-8?B?ejNSWWsvTlhtcG5vd2hsSitPdDhVZk11enpXMnZRNng0V09pQUNmaGZHYlcy?=
 =?utf-8?Q?Pyu+FT38zHF3xDu4fEz4LSg=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21584bd0-c4ae-4009-7327-08d999591bcd
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1201MB0192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 14:50:25.0982 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3/UchbXh22V+d3R8Ufp3E72yzeXW4THhuszjhKIwGES9i/ZwdIrwqT6RIZPWJKrQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR12MB1936
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 27.10.21 um 16:47 schrieb Andrey Grodzovsky:
>
> On 2021-10-27 10:34 a.m., Christian König wrote:
>> Am 27.10.21 um 16:27 schrieb Andrey Grodzovsky:
>>> [SNIP]
>>>>
>>>>> Let me please know if I am still missing some point of yours.
>>>>
>>>> Well, I mean we need to be able to handle this for all drivers.
>>>
>>>
>>> For sure, but as i said above in my opinion we need to change only 
>>> for those drivers that don't use the _locked version.
>>
>> And that absolutely won't work.
>>
>> See the dma_fence is a contract between drivers, so you need the same 
>> calling convention between all drivers.
>>
>> Either we always call the callback with the lock held or we always 
>> call it without the lock, but sometimes like that and sometimes 
>> otherwise won't work.
>>
>> Christian.
>
>
> I am not sure I fully understand what problems this will cause but 
> anyway, then we are back to irq_work. We cannot embed irq_work as 
> union within dma_fenc's cb_list
> because it's already reused as timestamp and as rcu head after the 
> fence is signaled. So I will do it within drm_scheduler with single 
> irq_work per drm_sched_entity
> as we discussed before.

That won't work either. We free up the entity after the cleanup 
function. That's the reason we use the callback on the job in the first 
place.

We could overlead the cb structure in the job though.

Christian.

>
> Andrey
>
>
>>
>>>
>>> Andrey
>>

