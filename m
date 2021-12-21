Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C0A3F47C36B
	for <lists+dri-devel@lfdr.de>; Tue, 21 Dec 2021 17:03:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 40D1D113CA1;
	Tue, 21 Dec 2021 16:03:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2084.outbound.protection.outlook.com [40.107.244.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 740DC113C93;
 Tue, 21 Dec 2021 16:03:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gNtSIML48f86mbT5TKi0LjkcfsmGyuQvmYcs7ubuBf5h1DRGSq++7RxZLC1fmcWIyrhw3DM3zDXens2pMm+uZKv75eqg9SRJZ3wscU5LTH04buLjMAFLIMMKxdCTpJZowqDEP87xd0jyuuNDP7YJ3UGF3eQ61xB/4dQeyZodN8gyXwSGLllqa1UI7Tqhc1O9zo3Q2VaIowTUzuBFsbWW6kMcLTIAV5hW1NJuIhB4ftX5xGmUAX2+y0A/38u0hzfvEbtKk/otKdvwKJZmc43AOBR2v2dUyS7ZO3Mu3XihUYRg+MUHQ6kAKSsE76peRKSnqIxBzJvqVJMf9LAqQXtskQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dEPWkghyRqJz6gOM+Z4lIEmMAP7TouFvwxvPMZDwzJ8=;
 b=LqxeG1K1NS1WpM+15jX8EG8Y5oEDgUV4j85R/GKyT8JpRvlp38vqb2IWZbUnqb6t98ynmEroeHM0hBFotvVTWOZjUmI/hFJLzrmWOxgZG056WtsFfMU6yPs+HYNYJ10FZieTxVnFrlT8KLQfygXhkjU/qDQ7FIAU/qU0IgSPkr5/q9SEOngQ+zwTUR8xUWBuiglrRXFbjwnxW61Ss5oiJLRLKNMq+rHoG8sX0dGTHr0fbmoUyIu55Bsp+Vf6Ukxxn5Kwf3druBNRUx4413Q10Yo+31gMyzc77W8m1QQ44rsmhssvH9pagl4v9JEh/TYA4RPBoj/w/U678OT/Q9Spng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dEPWkghyRqJz6gOM+Z4lIEmMAP7TouFvwxvPMZDwzJ8=;
 b=CLSgHglTg+W0y8dZagLx8wR+1PDB1kwyLaoN8zWHX8+C15xWSHvWP0GkX2rw877x6YaPXf2+D3NUpA3OE4W704mHDb7fUDw6my+xR3XLKDwJcXXPMldm0/EVk6mbJMPhRlG3E2zyhOeUSHmftUfBWki/lodA91ysoHbXJ030lcM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM5PR12MB1947.namprd12.prod.outlook.com (2603:10b6:3:111::23)
 by DM6PR12MB4561.namprd12.prod.outlook.com (2603:10b6:5:2ac::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4801.14; Tue, 21 Dec
 2021 16:03:21 +0000
Received: from DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::5573:3d0a:9cfd:f13c]) by DM5PR12MB1947.namprd12.prod.outlook.com
 ([fe80::5573:3d0a:9cfd:f13c%7]) with mapi id 15.20.4801.022; Tue, 21 Dec 2021
 16:03:21 +0000
Subject: Re: [RFC 3/6] drm/amdgpu: Fix crash on modprobe
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20211217222745.881637-1-andrey.grodzovsky@amd.com>
 <20211217222745.881637-4-andrey.grodzovsky@amd.com>
 <bdbb195f-a9a7-2129-deaa-93e4e49cc8a2@gmail.com>
 <72fe2521-ef31-63d8-6bcf-67af5a74330e@amd.com>
 <48f45e4d-7219-5031-44bf-d1aec3a4bb61@gmail.com>
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Message-ID: <dce7b2d7-ac9c-047c-365b-38added395b8@amd.com>
Date: Tue, 21 Dec 2021 11:03:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
In-Reply-To: <48f45e4d-7219-5031-44bf-d1aec3a4bb61@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: YT3PR01CA0137.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:83::11) To DM5PR12MB1947.namprd12.prod.outlook.com
 (2603:10b6:3:111::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ddbc8f0b-6d03-4942-45d2-08d9c49b68cd
X-MS-TrafficTypeDiagnostic: DM6PR12MB4561:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB45617D46FF8EA9C3C25A261AEA7C9@DM6PR12MB4561.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VXk4T/8llDYBdZbLOFHAVpgtq6fmAdmiVPcHuJ3jnRS01yZT641fd7JDhkCJoTi2F5C/csPLPLYKNMgRh0AFtzkKq18QvdYCJ+HYcrXGdpQP19sPjqDhVqIX3gMrb+zhP4EtWyTsquUBgsashfA7k9OEV//1BypjI0a+x2SUVFzA6GdYU2Qc0BhdC42HGbqug7YjX9n3NBTAgN86DwKsxq7WL/WMVcn4YWM3+vWWNIoqP2yDgFg1PVP05v5xaHTFIE/+jPcFJqjLkxIuJvUgdN5zN4A3VwGLRz77NBvAcFyldtEo4MOcESJLwNQu2eiJ8xKxtYHL4SpL3GrxKkotPJU9ABLcoiHYfzcpcLvrcCdEUKyG48aSW4hi7rBgPNfTCzbIBLVFkYyioukKUnnWHlXHe184I+Fqj/ngb0m1OVyfbWUvVFp+bD33totr3HKZ8JjRfsNsqAmZ/cfhtvF5PzXGqsESw6Ic7ARcE/WyhuJASBmhmJOulcyvX/a+EpFz/2y0wkaVylJH34fMWNj57vT+SoPH8ffbI3C0x0bLeg7Ur24Ol8MQi7o5xdhDP8ncEY5dW/JTK54YgNNo6q5alFf3g1HL2NyM2edfgqDgq63G92chvWX/oH4y+7fYatJoODutQLuSOzqJYnsTs9xO4ZPfGp5bZMAloNkfufUJkdPOw8iz+vVv74UkTwvSQT1L8oHie59hUdMZR6AJvQhYq2ij3SID0g0kirYk+x2A2Qo7pDRn+m2aUNKNPt3nQx0jtTjmX8BvjTZkcerlcle6Qpz7xX5ivlok0Dhi6H4CyZRsJChjkG4bSvr2K+5rxYej
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM5PR12MB1947.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(6666004)(2906002)(31696002)(508600001)(4326008)(31686004)(44832011)(186003)(6506007)(38100700002)(36756003)(4001150100001)(6512007)(966005)(8936002)(316002)(66946007)(53546011)(6486002)(86362001)(2616005)(66556008)(66476007)(5660300002)(83380400001)(66574015)(8676002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WjFhQ01qMHB6cENVakxhVjZ4elA2Z1RoVXowU2xJR1FCNEl0NnBibTFoY2ZI?=
 =?utf-8?B?N3FzLzFZMGR5bDlTSmZScnRVVHVHdWlyUm1pSldyU3BlRDFqQi9IMlR0Umtt?=
 =?utf-8?B?MWtBT2lwY2oyd24vNEtyQW5XVHJramtPbmY2R1FqVmEwTzh0VkYvNmp3MWZp?=
 =?utf-8?B?dkJvNlRHZVlrNjdqOFJTY29JQXZuWmE0VmNjVytFL29BV2cvdllqSnZIb1RF?=
 =?utf-8?B?ODZUcDhTZzhDMWl1blMycmxPVGxkTjdJZVQ4Q0RBYkh5WkVCM3c5d01DRlkw?=
 =?utf-8?B?Vkp0WEwvTWhvaDZVcnlmMWJuODFFZUNPUUg1bE93MmY1bGlPMm42RVoya1JO?=
 =?utf-8?B?OHFKQkFtTWpWU09nQzZwYzlsa3BHc3l4ZWdHYUhYK1BONjA5YmNlajN6ZWZS?=
 =?utf-8?B?Njh2WlRtdXhoTjBXcWQ4NnBaK2hweDAzN3AyNmV5UXA0bmZSMk42ZDFEbXVn?=
 =?utf-8?B?VkpIL1pwU3lCMTNCbnNDbUJSRnpwYVBMcTdHYkU0b3ZlNVFOV1hoMmgwWkhx?=
 =?utf-8?B?M0NOK0dZUW4zUHBYOU1aanZwZXBwWkhmamRHOGdNeXhoWm9IMFFnSWl3enA3?=
 =?utf-8?B?dE1YWkxhaFdEMU0yT3hHWFpjM1IvSGQrMW00TWRpMXpGZ09FTncyQmFDakgx?=
 =?utf-8?B?ZmhSODlRblZyRlJaNGVKemFaTlJLaEtDdXhxSFY3azdYUmJOeVg5SXp6bWFG?=
 =?utf-8?B?TG1XTjEraVdmbW4rZzU0NGZUejhuZm1MeEF3Z0dQNndLSzMrU0hXTmorQjlt?=
 =?utf-8?B?c016UGVVazU0ZkxMTDI3aUpIT0J2YzFFQUVVRVZ2NDBSSTFpTXA0VVc5RTdm?=
 =?utf-8?B?UXgyMmxnbWx0Uk42bTlXOTBTU2ZxNnArVHByQWlBaWhRQnRXZVRrSmV3Mlhx?=
 =?utf-8?B?OE9NWXJMbW1KQ3MyQ3BVSWJiTXBIZ2NvRGFmb2k1UzBwMzVqeXdDM0MwckQ2?=
 =?utf-8?B?NUJlZ1RVUk9Ta28vNTJiTm5kVG02WnBraVRoa0QrbFR3c2RLMjdjNnNacHlr?=
 =?utf-8?B?UnhRdmF0RFVadFhnZEF6NnMxT2NWQ0JTWmRMdS9ZVWUwWTlPeGdRY3BuOHFw?=
 =?utf-8?B?cGJYY1NWRXo3S3BzakdDeGpLRVFUVWY0MFRVR2I0cTVFa3BnZUxUNmdicTdK?=
 =?utf-8?B?dmU5UkJZR2RSbUJ0QUVyMkwwWVZ0ZE1XZDdpbStyWS9RY3FJdTlvOUtlSmNK?=
 =?utf-8?B?YlZPYWR2TG85NjF2bUhDeXF0UzQwZkNaMXBNMmZwcms0cjlmeW9BT0RsOUZ2?=
 =?utf-8?B?QmtVNWFZYzlBWk9aWXAxc3pkYUEvaGMxZVVvcUFrNWNBeU5RSDUwQVNudjQ2?=
 =?utf-8?B?bWxiRTNQYVErNkVBT00zRTE2RWYvbFJuNldESjQzbHF6VElmOFg4eEF4cVhx?=
 =?utf-8?B?a084Y0QwaWcvNTFISVU1SWpOUjZxTFMzMkI3dXFxN2kwbmE0TDkxT2g4aWNK?=
 =?utf-8?B?ZTRvckNEc2M0a1dncHFqS21EWTFGNG1XSldwa1YvRmVaMVZnRkpkakY0RmZv?=
 =?utf-8?B?Z1BNQkJwcjF1QXduRE15bloyTk1WYXBVMThIbFJIOHgrRThtQnJWTEFwNlZO?=
 =?utf-8?B?a0FyT1dkd2V0S3IwUHlXYVczdFRNbDB2d2ZhdjVNK2l3NU92RlRLTzBkendP?=
 =?utf-8?B?bGdRRU85UnVtaDgyWTlkSHU5cEltSTJ0NE1lb0NLUDJQdmVqWUY2bVhjR2NB?=
 =?utf-8?B?WVBNWGlNWmRBMHVmUGMvdk1UNCtoVUNtMnAzUzh6aDN3dmYva2RDejV2WmZ1?=
 =?utf-8?B?OXppQUpBUzluVDlVVXRDQWRMTWxFQmV0b083ZEVVR2J3dENaWS9DU2tSTzdN?=
 =?utf-8?B?OWd6aGluRE1DU2ViZ0ljVm5EVXYzaDhiRE8zWjFxYkdQR2VWSEx1Y0swT0ky?=
 =?utf-8?B?bHlaZHJQcVRzdnA1YUdTNHZmQmJyVTdGWG1LVkhOT1lmOUlSYmVrT3VKWG4y?=
 =?utf-8?B?Ty9ad1Z3Ny9ld3phQ0NvdTE0ZGhEclg3V0VTNWl4eGFWS2ViRldqRmVick9u?=
 =?utf-8?B?NTJRbXVtNUtyYS9DTkdndU9YeTR5Ky9pWUwyUUhQam41MmkzOExPTGZTSlQ3?=
 =?utf-8?B?RjhIMC9tQ3FMOGlmeFF1c0F6WDV4cGZERU11QmRQUngxNmZBditqOVJIRW5Q?=
 =?utf-8?B?L1I3Wms1b0tIY0FZQlYrVUxSem9SUVVlekkvYkNkZHQ4aG5YZjRhTlA0U1JS?=
 =?utf-8?B?Zzk1RXNCdDQ5aVBRQ2JTa1E4NDhYelEycEh1czl1VGc4djg1L2hZbmx1TnM4?=
 =?utf-8?Q?2gGUADyXHNt+pU/OkOD0vrBEoh+CJ/MT3PCoi6+NTo=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddbc8f0b-6d03-4942-45d2-08d9c49b68cd
X-MS-Exchange-CrossTenant-AuthSource: DM5PR12MB1947.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2021 16:03:21.0643 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rcNaMaMDUzdBrv2RdJddiRoY/bf65fVE+WtZFO3SbuMLAM8ZCBPIueYZkXCwFU+eZ0rtGZFDGAyoqRe6mizp+A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4561
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
Cc: horace.chen@amd.com, christian.koenig@amd.com, Monk.Liu@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


On 2021-12-21 2:02 a.m., Christian König wrote:
>
>
> Am 20.12.21 um 20:22 schrieb Andrey Grodzovsky:
>>
>> On 2021-12-20 2:17 a.m., Christian König wrote:
>>> Am 17.12.21 um 23:27 schrieb Andrey Grodzovsky:
>>>> Restrict jobs resubmission to suspend case
>>>> only since schedulers not initialised yet on
>>>> probe.
>>>>
>>>> Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
>>>> ---
>>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c 
>>>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>> index 5527c68c51de..8ebd954e06c6 100644
>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
>>>> @@ -582,7 +582,7 @@ void amdgpu_fence_driver_hw_init(struct 
>>>> amdgpu_device *adev)
>>>>           if (!ring || !ring->fence_drv.initialized)
>>>>               continue;
>>>>   -        if (!ring->no_scheduler) {
>>>> +        if (adev->in_suspend && !ring->no_scheduler) {
>>>
>>> Uff, why is that suddenly necessary? Because of the changed order?
>>>
>>> Christian.
>>
>>
>> Yes.
>
> Mhm, that's quite bad design then.


If you look at the original patch for this 
https://www.spinics.net/lists/amd-gfx/msg67560.html you will
see that that restarting scheduler here is only relevant for 
suspend/resume case because there was
a race to fix. There is no point in this code on driver init because 
nothing was submitted to scheduler yet
and so it seems to me ok to add condition that this code run only 
in_suspend case.


>
> How about we keep the order as is and allow specifying the reset work 
> queue with drm_sched_start() ?


As i mentioned above, the fact we even have drm_sched_start there is 
just part of a solution to resolve a race
during suspend/resume. It is not for device initialization and indeed, 
other client drivers of gpu shcheduler never call
drm_sched_start on device init. We must guarantee that reset work queue 
already initialized before any job submission to scheduler
and because of that IMHO the right place for this is drm_sched_init.

Andrey


>
> Christian.
>
>>
>> Andrey
>>
>>
>>>
>>>> drm_sched_resubmit_jobs(&ring->sched);
>>>>               drm_sched_start(&ring->sched, true);
>>>>           }
>>>
>
