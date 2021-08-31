Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46B473FCF1B
	for <lists+dri-devel@lfdr.de>; Tue, 31 Aug 2021 23:24:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9984F6E0BC;
	Tue, 31 Aug 2021 21:24:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam08on2066.outbound.protection.outlook.com [40.107.101.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65C586E09A;
 Tue, 31 Aug 2021 21:24:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=NxzFPuCdF+SaVBPgcVcj0KEzKemM4dBYQtgXi+xf1AYkDu0srVT6jRUvBAsrFbM+q0Le8b2TY/ABEcCP1vKnjDzUbs7OUMyAJUPY8Dozgn+AQH0Zy5xgj7xDBe04tByJgEJ+rJAPOkxoC0RhVHd5tbN2h3gz45GbIrFNJse3nqO6hFMLRFTcvVRo2j8eCNg0R97/i+uY1EGncWvc5WmVvxlI7z+wEgS2vG8ZVbhpflVTfnF9zadIVbIUwVS0YPyXE1Ui9AiOR6EhHeccepUT11Ei9QU+aa1OH33jg4p+Pacd+VSC32eukaaClGZojLSClFnEYDbgbczBJkqSiupUnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h8OvA/mqz8be8Xxom7WKuJMi7UHryY5sBwDbX5OIzRE=;
 b=Q/ZpTOhDsk0VCmZhnOE3egsI5YVG4LS9/w1XCWrsapGpJYm1wojX5qMTiQed/K6THZmsQhZ5sWnDlXQKLvmE/2tS/foN57GrDaHeeJTwkTQ0yrdtOrscI396o1FodOT3LBdfWPVNsDF5qZvoFMF3jWSyC3ZViNkDzL3qbeqqE5V5pMM2VKbKBnaQgJU87FoKKoLCX7nAUoeF5Q+pbAWJsDSsLJZZsf//keF2c+52ifug72/xc2XrNuueSfnq0lk5F+iHrOFZYf7+RcZ7UEuiaQNKoMFDjWswZwRbfVje3uI6rqBvDk69C7wbRFT/UcPi9Kvrc9dnlBOL1wIZt6qV5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h8OvA/mqz8be8Xxom7WKuJMi7UHryY5sBwDbX5OIzRE=;
 b=LJYLAn2ITF4TSfu/ZcDjHVA7SOLigHKAMR1oEuuVRO1hI7tuJJB+JDmwWSqIj+DrSwqlovtzMN3xHsxiIJHWDZHRoSVtiRrNVIV5dQKIpeVrQWp60pSP3zd1TYQgp3fTq2461gPoLLv6k8V8f2dQ7LZl7a84mxoZLl11IXYBbYA=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB3957.namprd12.prod.outlook.com (2603:10b6:610:2c::17)
 by CH2PR12MB4823.namprd12.prod.outlook.com (2603:10b6:610:11::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4457.17; Tue, 31 Aug
 2021 21:24:41 +0000
Received: from CH2PR12MB3957.namprd12.prod.outlook.com
 ([fe80::3c17:fc0e:bf93:70df]) by CH2PR12MB3957.namprd12.prod.outlook.com
 ([fe80::3c17:fc0e:bf93:70df%6]) with mapi id 15.20.4457.024; Tue, 31 Aug 2021
 21:24:41 +0000
Message-ID: <bc0a6c6c-9536-f7c6-7aee-6b9d33246dfc@amd.com>
Date: Tue, 31 Aug 2021 17:24:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.0.3
Subject: Re: [PATCH 2/2] drm/sched: serialize job_timeout and scheduler
Content-Language: en-CA
To: Andrey Grodzovsky <andrey.grodzovsky@amd.com>,
 Daniel Vetter <daniel@ffwll.ch>
Cc: Monk Liu <Monk.Liu@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, jingwen chen <jingwen.chen@amd.com>
References: <1630406139-19621-1-git-send-email-Monk.Liu@amd.com>
 <1630406139-19621-2-git-send-email-Monk.Liu@amd.com>
 <29be989b-c2a5-69b3-f0b8-2df52f50047f@amd.com>
 <YS42tI6qAUb3yqOk@phenom.ffwll.local>
 <11d6acb1-ce9f-372e-3993-232379436e4b@amd.com>
 <YS4+1evCjyCA50iP@phenom.ffwll.local>
 <ab9aa89a-c057-b1f0-d02b-3d79f50e97e8@amd.com>
 <acb17005-3b6e-c43b-ce2a-933c0300dd57@amd.com>
 <41967bb9-f1ba-3090-aedc-e22397655647@amd.com>
From: Luben Tuikov <luben.tuikov@amd.com>
In-Reply-To: <41967bb9-f1ba-3090-aedc-e22397655647@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0006.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::11) To CH2PR12MB3957.namprd12.prod.outlook.com
 (2603:10b6:610:2c::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [10.254.46.67] (165.204.84.11) by
 YT3PR01CA0006.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:86::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4478.17 via Frontend Transport; Tue, 31 Aug 2021 21:24:39 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f587daf8-908e-4ab1-190e-08d96cc5be64
X-MS-TrafficTypeDiagnostic: CH2PR12MB4823:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CH2PR12MB4823C33F6ACA654AD720EB3899CC9@CH2PR12MB4823.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JX3rRuDTT33Uo8k79yjEaUA5yicltTPVwITOwcAgg5brG1fVa4DwDBPBq30s6J0hAjv+u91PKd0EE1X5qgXtQr2II2pxD5/WfdRPWCGnnC+zwd68NjB927P/iuT4lDeshwl4U+NPxK0cniyWpWolrwGXmlLr8Jw4jfFmabAtMKKlodDpkNCJuonemP/9EvyipRSUBCemVm3k9MtpKYquiIjskQtO8jmwmP6CBevI7bM043a4m8jdCW9Lxr234pcS8jKs3PmbQPYEh3IPhhpdkKm/5Ccyq9GxJpoZmhHgVZmtpULBc2T/GY50MjXU92N/2upEDl8X2ia04hxp2hFCJuYrXJ6E14LG6DFiLf+Be67wDimMJJsjpDHotWTm+DeAiPF9bpsDDCTK4wMIWpdKl0sz2RVc1rI+I0eApeTeQzhy+sJFmBSWpWVdMbhCDZn2lj9Wn5rnEKc77tTh2WVjnOY0U0bYe3DhWPDhrqEFiIqEd4ktKvvxGed+nxTofPvORKxAemS3T99b8s5P7TJTJHNNs7+pIsOUH/DJTJGntn031WuM/izi8LiuBjOrCYuFZwCl1l+5wkyAF69J3KWRMOTTjrygl3o+HPXPIXSQz9FCgVkmYa+YCG0miPJ88BrE1qwqYnp+S0x0zCxp1zrnZpSdIY7HeZ6Wk9ugPWJcvYI73DACn+d+GTUOPeuk9Rrl8xWI5nnlk7By/l5FC1xb/b+JTb5031Ze64ucwoaLDjNb5ew4lp0EjVVzJmEHC7O/I9CW1ahgFS4x/bfpuivYHtUmGIkq8tSGubcuHSvJ9qfZWhpTemVzhHme7yTx+pjnl4MCwaWka3szZmWhEmKTX/n9LMwu8sYT+tk0gBb2G2g=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3957.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(396003)(346002)(136003)(366004)(83380400001)(16576012)(2616005)(54906003)(956004)(31686004)(8676002)(4326008)(110136005)(36756003)(86362001)(186003)(38100700002)(53546011)(66476007)(66946007)(26005)(966005)(2906002)(316002)(66556008)(478600001)(8936002)(44832011)(6486002)(31696002)(45080400002)(5660300002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NUtqcTN6b3pyaG9iRFRuSE5aMmVqZnRSeWJrdmNBdjhDanF5M3M4Z05xZzdD?=
 =?utf-8?B?VU5wYVR0dFRhNEQ5MXdidkdmbU9JeldySXJ3VU5PakNVNzVaVGRISU9PTm92?=
 =?utf-8?B?a1hMNi9mQSthTUtRWGhOclV0d1JGKzFpV1J1SVJsdldDWUpHR21tdjlqVDhw?=
 =?utf-8?B?S1cxWnpYQk1QbHV6cGh6dHhDMFVQdGNnNFR5MnhPU3lhcndDNWhjSkNrVEln?=
 =?utf-8?B?TlNuU0ZuWmJMSDBrdDE3WVlST1NMeGp0K2JIR2dBSW0vVUZXZGJROW1IM2FJ?=
 =?utf-8?B?MHhSK3FJcDZhQlBSdlBRNlNoNG1LbWx5Wm1BOVhaUmpiVmhZRVpORHB5ZDdZ?=
 =?utf-8?B?UGVnQW5ZclVMdkR3TlljdXExT0pjUXM1MFRCRXpQeUNBeGoyckMwN3JBL2FH?=
 =?utf-8?B?ck43TndjNG1VdUtVY1RVYWNxZGZoS1pSY2ZFUlVVZ05WdjhvT29tQ0hhUlJu?=
 =?utf-8?B?Y3ZTSkJZQnBjaDllMzduNXhtOG9UbC9xTEgxc2pXQ2k5U0M2MDcvbEkvaEt5?=
 =?utf-8?B?UzdmQlZsS0l1WkYza0Qyak1RUVg2UnY4Vk5vc2JLSmZEVWJsM05PVTk4c0h4?=
 =?utf-8?B?UzZiY0RjWDE4N1luaEh6RHluakFnL0Z1cFprQmZJNmVVQ0xVQWdwRmRoUzdp?=
 =?utf-8?B?L285SFRuRGo4eE5ZNHowaFVaNCs5Ni91VVNOc2NRY3Z6MnQwYmd5YkZQR0tH?=
 =?utf-8?B?THlWUDY4TE04ZHBXRFF6bDdLMVExMUgzV1kvdXdkeHRGWXkxdjhnSlBpZGhq?=
 =?utf-8?B?RXQ2d2UzcHkvQUxGVGNocFRuOTZ5Z0FJQURJVEdmczl4L2Z6S3lzY3lqUmVT?=
 =?utf-8?B?NjZJWEpwdzl1anFyZ3U5Z2RNTnA3enJJeDErWjlvcmJ3T3JtQ2UxUVNoNE5C?=
 =?utf-8?B?K09hRWtHY3JDUnQ2OWwzV2JCVDhvS3Q4V0VYTUVMS0M1K0xlaTZnYUxWQkhB?=
 =?utf-8?B?UDlkQWk0NCtDSFJrekF3SVJpZ29rclZld3dTemQ4ZDN4NTZONjdlb3plOXZv?=
 =?utf-8?B?K1BrUVB5QkhKRnJKWlVwc1crN3NBZE5PWmNyN2dWNU1zSDExZ1ZyZElrUzlL?=
 =?utf-8?B?WmtJNjIrbE0rYUVEMVZ0dmpTdzhacTZLL29mdDRxbzkwY08zZTFuTkRFNzBU?=
 =?utf-8?B?dHE1Q3ZEbWZhbFhVWlE5VG0yc3lpN0JmaXFlZTNvcjNBRkVCWkpwN09YM2xJ?=
 =?utf-8?B?MTl0RXVjR0t5T2oyQStxc3pzWkdzcGgzM0VHZm44aHhkR2FFNC92Q2Q5L3hx?=
 =?utf-8?B?djJMZ0ZpcTk5TTJPblpnSGFUSzhGaW1KNlR5QlVBenRhQUR5TEQ5clFVY1N4?=
 =?utf-8?B?UDF2eFA2V255RlRCZ0VnYlBDNldkNEN2R040ZVRlemtBWHp1dkpwTjczTldF?=
 =?utf-8?B?MDhhUWoyczY0TlNYZzVPdHZJVWt0THA5ZzhxWnhkekNacllFRVl3WW01K0RV?=
 =?utf-8?B?RmpCem9zZU5yTHdqd0xxTDJYOHBxcjBjZjdmc2wzdzRKY3lKd2VucVNyQkQ0?=
 =?utf-8?B?SkErR2NYYmFjMUw5cjVmQmhmZVEyOXY4RzgyU3RXbE8zNHVwS1hVRllqUGY3?=
 =?utf-8?B?SVI5Z1ZTaXlDQ2R0Mys0OUc5bEFKdEtQRUdXQk96TkhkYms0Q1RpSThsVmtq?=
 =?utf-8?B?Z2MrZ0RyT2NUa25HajBTRWtiSnRaMnJJcjlHVE83Z3ZkZmtvWVZRajBxMlZo?=
 =?utf-8?B?dWI3c3NaUnhOVFdXQjU4aENBQnNuTk0yL3AyL3RQR0pLakxRQmtjMDFHYnAy?=
 =?utf-8?Q?fWzI/+Wte6MqykvZUNoel1zGWeUJCyQzzuoPDL4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f587daf8-908e-4ab1-190e-08d96cc5be64
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3957.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2021 21:24:40.9503 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PEadgcYxzlQF4ycRMr4g4iQIRkauapfR0faC2KiUal/qpuCkWpN3ECnKcSB7PFLl
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4823
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

On 2021-08-31 16:56, Andrey Grodzovsky wrote:
> On 2021-08-31 12:01 p.m., Luben Tuikov wrote:
>> On 2021-08-31 11:23, Andrey Grodzovsky wrote:
>>> On 2021-08-31 10:38 a.m., Daniel Vetter wrote:
>>>> On Tue, Aug 31, 2021 at 10:20:40AM -0400, Andrey Grodzovsky wrote:
>>>>> On 2021-08-31 10:03 a.m., Daniel Vetter wrote:
>>>>>> On Tue, Aug 31, 2021 at 09:53:36AM -0400, Andrey Grodzovsky wrote:
>>>>>>> It's says patch [2/2] but i can't find patch 1
>>>>>>>
>>>>>>> On 2021-08-31 6:35 a.m., Monk Liu wrote:
>>>>>>>> tested-by: jingwen chen <jingwen.chen@amd.com>
>>>>>>>> Signed-off-by: Monk Liu <Monk.Liu@amd.com>
>>>>>>>> Signed-off-by: jingwen chen <jingwen.chen@amd.com>
>>>>>>>> ---
>>>>>>>>      drivers/gpu/drm/scheduler/sched_main.c | 24 ++++--------------------
>>>>>>>>      1 file changed, 4 insertions(+), 20 deletions(-)
>>>>>>>>
>>>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>> index ecf8140..894fdb24 100644
>>>>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>>>> @@ -319,19 +319,17 @@ static void drm_sched_job_timedout(struct work_struct *work)
>>>>>>>>      	sched = container_of(work, struct drm_gpu_scheduler, work_tdr.work);
>>>>>>>>      	/* Protects against concurrent deletion in drm_sched_get_cleanup_job */
>>>>>>>> +	if (!__kthread_should_park(sched->thread))
>>>>>>>> +		kthread_park(sched->thread);
>>>>>>>> +
>>>>>>> As mentioned before, without serializing against other TDR handlers from
>>>>>>> other
>>>>>>> schedulers you just race here against them, e.g. you parked it now but
>>>>>>> another
>>>>>>> one in progress will unpark it as part of calling  drm_sched_start for other
>>>>>>> rings[1]
>>>>>>> Unless I am missing something since I haven't found patch [1/2]
>>>>>>>
>>>>>>> [1] - https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Felixir.bootlin.com%2Flinux%2Flatest%2Fsource%2Fdrivers%2Fgpu%2Fdrm%2Famd%2Famdgpu%2Famdgpu_device.c%23L5041&amp;data=04%7C01%7Cluben.tuikov%40amd.com%7C228bd1600c914efe24aa08d96c934bbb%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637660202148713283%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=PrrvFHAwDeLlbcOctlKHsCFs9%2F56XNVzoLVcT1RoJgI%3D&amp;reserved=0
>>>>>> You need to have your own wq and run all your tdr work on the same wq if
>>>>>> your reset has any cross-engine impact.
>>>>> IMHO what is problematic in serializing vs. locking (with trylock and bail
>>>>> out like we do in [1]) is for multiple TO events arising from same reason
>>>>> like maybe one job just waits for another and once first is hanged the
>>>>> second will also appear to be hanged triggering it's own TO event.
>>>>> In this case multiple TOs event will trigger multiple resets if we serialize
>>>>> but if we use lock with trylock the second one will quietly bail out.
>>>>>
>>>>> [1] https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Felixir.bootlin.com%2Flinux%2Flatest%2Fsource%2Fdrivers%2Fgpu%2Fdrm%2Famd%2Famdgpu%2Famdgpu_device.c%23L4903&amp;data=04%7C01%7Cluben.tuikov%40amd.com%7C228bd1600c914efe24aa08d96c934bbb%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637660202148713283%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=kxSWBoshVTLMMFIFZdPsP4MBgUAoC%2F3szo9GUemSRLY%3D&amp;reserved=0
>>>> Hm so I guess a single wq here, that will hold up all other TO. And they
>>>> should recheck whether the job is moving meanwhile.
>>> Can you clarify about this ? What job should be moving ? The dependent job ?
>>>
>>>
>>>> Also unless you use hw semaphores the job shouldn't even start before the
>>>> deps are singalled, so not sure how this goes wrong?
>>> What about a simple example where
>>> we actually can submit a shader on one ring and a simple
>>> WAIT_REG_MEM packet on another to wait for the shader to write
>>> a specific value to specific memory location. Here you have both of them
>>> started
>>> in close proximity and no explicit dependencies involved (at the
>>> scheduler level)
>>> and yet if the shader hangs also the WAIT_REG_MEM job will hang.
>>>
>>>
>>>> The vm_id flush stuff can make things a bit more fun for your specific
>>>> case, but in your specific case you have to run all TO handlers on the
>>>> same ordered workqueue anyway (because trying to paper over this in other
>>>> ways doesn't work imo).
>>> I didn't get this one.
>> So, awhile back I tried to "serialize" this by moving timed-out jobs
>> into their own timed-out-dedicated list, then freeing them asynchronously,
>> but I never got it to work reliably due to races with low-level drivers and
>> assumptions made way back.
>>
>> My idea was to atomic-move timed-out jobs into their own list, at the time of
>> timeout, and later asynchronously to free them (or better yet, inquire about
>> their state, and free them or move them back--ideally the inquiry is atomic
>> and done at timeout time before being moved to the timeout list). Anyway...
>>
>> But I found out that all these knobs and levers weren't in place and I was
>> getting problems with it and it never materialized.
>>
>> The paradigm was loosely "let someone else do it", like, "on an event,
>> move it to a list, and let someone else handle it", or "on an event, mark
>> it, and let someone else handle it". (loosely borrowed from an iSCSI target
>> I did many many years ago--it worked well and there were no races, even with
>> out-of-order executions.)
>>
>> If you guys have any ideas to that end, maybe we can try it out.
>>
>> Regards,
>> Luben
>
> I wonder if we really need this serialization at all, if we do HW fence 
> embedding
> at the drm_sched_job level instead of doing it only for amdgpu, and 
> modifying all
> the drivers to support this we can both remove this hack and solve the race
> against concurrent drm_sched_cleanup_jobs job freeing just by taking 
> reference
> to the hw fence of the job at the beginning of drm_sched_job_timedout
>
> Andrey

This sounds like the right approach to me.

(Convincing the low-level drivers of this might might be a big task.)

Regards,
Luben

>
>
>>
>>> Andrey
>>>
>>>
>>>> So I think this should all work, no need for tricky cross-scheduler
>>>> locking.
>>>> -Daniel
>>>>
>>>>> Andrey
>>>>>
>>>>>
>>>>>> See
>>>>>>
>>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fdri.freedesktop.org%2Fdocs%2Fdrm%2Fgpu%2Fdrm-mm.html%23c.drm_sched_backend_ops&amp;data=04%7C01%7Cluben.tuikov%40amd.com%7C228bd1600c914efe24aa08d96c934bbb%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637660202148713283%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C1000&amp;sdata=Fpt%2Btho2W4woHKQ861cEbBzoOidS6zuDhFi%2B1UTwWJg%3D&amp;reserved=0
>>>>>>
>>>>>> for the ->timeout_job callback docs. I thought I brought this up already?
>>>>>> -Daniel
>>>>> Yes, this discussion is a continuation of your comment about serializing, I
>>>>> mentioned before that you proposed it.
>>>>>
>>>>> Andrey
>>>>>
>>>>>
>>>>>>> Andrey
>>>>>>>
>>>>>>>
>>>>>>>>      	spin_lock(&sched->job_list_lock);
>>>>>>>>      	job = list_first_entry_or_null(&sched->pending_list,
>>>>>>>>      				       struct drm_sched_job, list);
>>>>>>>>      	if (job) {
>>>>>>>> -		/*
>>>>>>>> -		 * Remove the bad job so it cannot be freed by concurrent
>>>>>>>> -		 * drm_sched_cleanup_jobs. It will be reinserted back after sched->thread
>>>>>>>> -		 * is parked at which point it's safe.
>>>>>>>> -		 */
>>>>>>>> -		list_del_init(&job->list);
>>>>>>>>      		spin_unlock(&sched->job_list_lock);
>>>>>>>> +		/* vendor's timeout_job should call drm_sched_start() */
>>>>>>>>      		status = job->sched->ops->timedout_job(job);
>>>>>>>>      		/*
>>>>>>>> @@ -393,20 +391,6 @@ void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad)
>>>>>>>>      	kthread_park(sched->thread);
>>>>>>>>      	/*
>>>>>>>> -	 * Reinsert back the bad job here - now it's safe as
>>>>>>>> -	 * drm_sched_get_cleanup_job cannot race against us and release the
>>>>>>>> -	 * bad job at this point - we parked (waited for) any in progress
>>>>>>>> -	 * (earlier) cleanups and drm_sched_get_cleanup_job will not be called
>>>>>>>> -	 * now until the scheduler thread is unparked.
>>>>>>>> -	 */
>>>>>>>> -	if (bad && bad->sched == sched)
>>>>>>>> -		/*
>>>>>>>> -		 * Add at the head of the queue to reflect it was the earliest
>>>>>>>> -		 * job extracted.
>>>>>>>> -		 */
>>>>>>>> -		list_add(&bad->list, &sched->pending_list);
>>>>>>>> -
>>>>>>>> -	/*
>>>>>>>>      	 * Iterate the job list from later to  earlier one and either deactive
>>>>>>>>      	 * their HW callbacks or remove them from pending list if they already
>>>>>>>>      	 * signaled.

