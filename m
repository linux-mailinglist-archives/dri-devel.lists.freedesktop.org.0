Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52E1060EFD4
	for <lists+dri-devel@lfdr.de>; Thu, 27 Oct 2022 08:04:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 876B910E497;
	Thu, 27 Oct 2022 06:04:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2053.outbound.protection.outlook.com [40.107.92.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 947D410E497;
 Thu, 27 Oct 2022 06:04:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EZtrsjfXnwjVuisv5WBELORK3nCAzqN6+hfEZhJHB6NktR1RTBqkrMODwlE2/rgejxY+LzZ1ois9gqZ9Q87eBxfVT+NCLIGBKRHDobf/oUhcC9srj0r6c5LgCfChD4eN9qqkw8IyF0nuMUtGMLtefGUFM329S7Uhc1DxmAvlSoN8jAetNfW8OXqYFtdZpi+YmAbI4bk2G47pCJLwR78Ityux23zPiDSeT9b4MzQMYCr7iUQKFKynKhefGvt7m49RGV80K2phXrb12VsQOU8tiFmhkChS38mpnuKoOBxxTZQbD+DGgIOKMuC1MCT52w9canoEXgjGSiV17XG4hBjj7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=azugpBLmf/UcaOw7wGi6PRduJwYoN3Msry8fq3p8tOE=;
 b=VHUdv3Fe7f9t8YCTf0frsqJUyTWOqLkeEahmgz83Jey0zIHr2tZz5Yy10Odu0hTcuu98MSAhG7tY0Z6rRCkocZMYPlIZZ3azO/tD6t5DoGvB0+TPQKaYtVNm5R4+g5JOJAjqjM96Q/bcYm+LaVOADiT6wFfkIgZ0qDdio5ZFrDaFd7ZudH7A35GJWDQSkCzMMGp4YMFyKdvqxMfbl58NN0h58ozfXzNjcMEj2Q/04vs141oOPHq6iEI9f03X8FOmhCo5CoOy2LPHo3jxTFqTC/fcWKqtYIzqHYp9jcfshkfPk/HLIzBHvkEXoPbsHfB/tZSQkI/AKMrSHRHJNXA+tA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=azugpBLmf/UcaOw7wGi6PRduJwYoN3Msry8fq3p8tOE=;
 b=J9VUseGeJa7YvQ+2+nzlIU2m7J9xqXkYyAErO0KHRzP7fJpm1duESLuERtXoKLICXwe5B+mAcQwXNgnMv/6SOSfQWdeUA94QwFB7lZpmiv4G71WeI/S0Jdix0LFUAeMjC4yaXPqp9gcPVz9bx6IVTirD/4yHLkyDoAwyi7Yqz40=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by PH8PR12MB7278.namprd12.prod.outlook.com (2603:10b6:510:222::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Thu, 27 Oct
 2022 06:04:30 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a350:f29a:f287:7279]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a350:f29a:f287:7279%4]) with mapi id 15.20.5746.023; Thu, 27 Oct 2022
 06:04:30 +0000
Message-ID: <87221b50-d4b2-9b39-f0c0-8208af14c4e3@amd.com>
Date: Thu, 27 Oct 2022 08:04:24 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 2/5] drm/amdgpu: stop resubmitting jobs for bare metal
 reset
Content-Language: en-US
To: "Liu, Shaoyun" <Shaoyun.Liu@amd.com>, "Tuikov, Luben"
 <Luben.Tuikov@amd.com>, "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>,
 "Deucher, Alexander" <Alexander.Deucher@amd.com>,
 "daniel.vetter@ffwll.ch" <daniel.vetter@ffwll.ch>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>
References: <20221026153557.63541-1-christian.koenig@amd.com>
 <20221026153557.63541-2-christian.koenig@amd.com>
 <CH0PR12MB5372F1A8B89543E067865EC6F4309@CH0PR12MB5372.namprd12.prod.outlook.com>
 <87386405-8dd2-f88b-1755-620962786925@amd.com>
 <CH0PR12MB537262629F9DBC0797ACF1D1F4309@CH0PR12MB5372.namprd12.prod.outlook.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CH0PR12MB537262629F9DBC0797ACF1D1F4309@CH0PR12MB5372.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8P250CA0020.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::25) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|PH8PR12MB7278:EE_
X-MS-Office365-Filtering-Correlation-Id: d1aeca55-1098-4740-bec6-08dab7e11cb6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mnnEQV4Y89d66ZXfLHAU0HzET3W9mxX9zZXDFJuxgkoSk+bGNF6vb78o3upkuo2BLyqTVoYfXdjOFIgT3c2G6dXMuydYS6iOCDsDoa2ZEbjIZkk+raGXZ7JG6RafLd4FaGVdjZPFHpKNHYG464soPn+w11/hyUyScfRmNFCt1YXUaICEKuiipqDzH4HoO7FpRQ5AHVbhVPhpTl37XGrZhLRPWT6PzQ0S9yLv8BKS/zYQjK4JZet1APAG1s/KHHPgNm5Hli06J6raIiZq3eN+Bc79coi3zAAf6QHQcbzQZJZuFbifbDQi63o5wnlHRkWDI6LZQ3STAn5AVH+GaygxLgAtZSXTjqJIXIJTh9AcKpSDJJDFi2B7CXw670E8mIakrtfD+Xh3SaPaddkeLWUz+jKk1QZjJboxxpgUGhHUpuA/+wyuDcYmmGhqxtZoBwhcn+WLtwMXg4rRqQpSzimkJhPYvx5q9bPLSA2Fn325AxdOARgj+Sfr+38xIOD2ss7kjfjMjBMsDfmCwEkIp8C1YfnjfsEP2LgPYP5Y1Xpc0K9Il0qkydksDvwnB6sWanAkaP5SvG1W7ENKN41rabS/vBW2dtYMP+E6Ey0Kqj3z4escNopK9FmnRG0p5gxLTtSlXd0uwXfcqT3fbtzzpm7+Xk+42M+7WUu3LzGlwnL/RWYpFi1YWxPik++BJ38y0GPIdakwInnWwq2m9AaApyPlfMa+ikPJlgMZgy9oLb1CMW41h0rXFAJMnAwDNW4myH1LAWMd21JfyMbDsW77BQ8PCDdpGN6dp9Un/UmBirFklO3tUoVpfmmPpTn4tpaKckZw
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(136003)(39860400002)(346002)(376002)(451199015)(31686004)(6486002)(478600001)(86362001)(31696002)(110136005)(83380400001)(6506007)(53546011)(5660300002)(66476007)(66556008)(66574015)(921005)(2616005)(316002)(8676002)(6512007)(2906002)(186003)(26005)(38100700002)(6666004)(41300700001)(36756003)(8936002)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlUrZEVMVmhBYlJ0VENNOWN2Nm9ld21jc05udGRJUmpML0cvR0d6VUEyUUNG?=
 =?utf-8?B?ZVBRZ1NleWQrV0FyMDZaeHdXNDQ0MldiVC95dHZDZTR1emRkTkRaZDZLa1Ry?=
 =?utf-8?B?OUlDZ3dDSTR5cEJoUEZ3cUhkSXlXSWlLZUk1by92bkRzd3NISnVIN3QwdTA5?=
 =?utf-8?B?bWNWcmVFd1FMbUxjamt4SDFTUFI4ZVp0ZDdkb2gwSnVJb1NQTXNkSjRLd1J2?=
 =?utf-8?B?ZFlNam9UeXlNSFVUcnVOaEgxd3NjNElLYThnMkoyRnhBV3V3M1lnby85MUFu?=
 =?utf-8?B?QVpZSTNJQVh1N1VyQzVyS2plbDBzVTk2RWFnbzZrcm0wdVpuNFZtZ0wzcm9G?=
 =?utf-8?B?eXVTZ1BBVnFKY1pOY21UZGh2QmVGREhmeFpRVXlGTFhvWW91RDRKanp1T1ZF?=
 =?utf-8?B?eTFvTE1TSkxDZDY1dU9IY0NKeU5vZFpLYTJmVnJ3alNXV3c0MDFmb2JnNnZp?=
 =?utf-8?B?QnZyK0twdVkwbVRtcmQ0N0x4S05LMzhSUXkvTURYcExRbWZYUUY3aHVybDJP?=
 =?utf-8?B?TENJbHRsRW80OWY5RU5wT1MvTTBFam4rVkpiNTVyazRVVHpVQ3RsVHJ5UWxy?=
 =?utf-8?B?bkQ2bXpObk9DTHl6ZGZid2g2N212d0l5Tk0zUytma3J0MmJpcGxqeU9jOWFU?=
 =?utf-8?B?OHN5UHByYldaZ3hXRENFUURRV25VVjU3Y3MxWHI0TDNYV1FxLzAramtqejJI?=
 =?utf-8?B?alFnV2hkTnZnTUwvamdaV2IyTDc2Qm94TlkwRkhvZmFHWEdPZkIwN1ZxSllw?=
 =?utf-8?B?ZjY5SlZUblFPY3B1OFNHQXo1Y3FjbGRnVUZGMjdEWk9UNUMwT1Y3QnIvbHpZ?=
 =?utf-8?B?S0pXcFhYRzROQy9ZSVdMZ21pWUZCUEQ2RmhFU3FSU0hQc1dSeWhWYlF6d2xt?=
 =?utf-8?B?ZEZ5Q2tMN0QreFdScUxWeWp5SEFTL0ozaU5YZGV6SWNCZUhQRUxjMTNhdmVt?=
 =?utf-8?B?MzdPTFJndTVJcFNMWEJlYSt3bUhJcjdWYXRmcExLRjhsUzNEdUJma1Y4cnVz?=
 =?utf-8?B?WXIzZEYxakVIcy9aOFRCNitLaS9HaUVNKytGUlJzeTBoSVlmd2FlTEo4dmhu?=
 =?utf-8?B?ZzlMU1Z1aWNkMmswVVd1TEUyM0ZyMVJTb2p6VUo0Nk9YQ3JXUS85MGpWd3R0?=
 =?utf-8?B?aXdXKzNHcFNIaGdjMFVyU3FJRzNaVW1xSjlTOFFHNVpWSkh1RXpHOUlNYXhW?=
 =?utf-8?B?eTZUajRzbXo4TkZJZGRrOUV2VWxDQU0yQU0xTXVCN1lRSGZDcXgzbVhyR01P?=
 =?utf-8?B?OUVKMGVsa041QlpvWGlsd2xJOW9QbEFGR2l3eGZqRCs5ZndjRG5CT09YcFc0?=
 =?utf-8?B?UmJzdUxseGdZSVpiNFpnS3hxYXpXNmE4MCtYVHZjc2RqYmtqMlpJR3ErU1BU?=
 =?utf-8?B?SWRKTld0ZVE2Vk9GSUJLUmJTNkl2bmVhV3g1VTh2VXo2OG9GUmh2NlIwMElL?=
 =?utf-8?B?eEV4WHlUajFrTEF0eUVlWkdrOHFTL0oxNVB4UUZmaU43aEN3em0zemdTMHFD?=
 =?utf-8?B?U0xmWWRWTys5U3g3NWt5dkh4RVVDTWNNOGlDbndPekdWWXpwd3ExUXMrdVhM?=
 =?utf-8?B?cXRkNnJTOW04Snh5VDJTcXVXV1UxaWtrS0hWOCt0Mnc2bFpOOFF5MW5XWm9K?=
 =?utf-8?B?OHZKdXBmVXdrWENuTndUUnpYbERtM1VHV3dSVUg5dFNrQWx1T1p5SG1meXlL?=
 =?utf-8?B?WGhnZ0xFcUNBVWg3VVByTTE4cTVKR2FPbXZ2L1hnR3ZOaDJEMHc4YzVQbTU2?=
 =?utf-8?B?TkJlNG9wcFI3cmVXYldSSTBtWnJ1NE9aSGF2ajFtZlVacTdORUw1K0MvamhQ?=
 =?utf-8?B?ZlQyeHRLVzMwaHpEUm1VRElMdHE0OFBXN3l4dXJxcHg5blhQU0t5SHhKTzBr?=
 =?utf-8?B?dFdvUW5TV2NOWkxKTFhrblI5NXNTMGhvU3YyTE12MUdHbWF2cWFuSlBGYUQ1?=
 =?utf-8?B?d09NT005UUFiRHNTT0Rld1ppMVhCZ004SFNzeExqYUtJTTFvQVViK2o2WUVW?=
 =?utf-8?B?OEpNY1RxWGZ4Um5kb2c4b2MzK2JUeFRNNEtzMExjN0M4ay9CK3lVUDdpMEtu?=
 =?utf-8?B?TncyVTdVRzBvRTRqd0hYbW5GZVZ6aXBnU1hMUVZxSHd0d3hwOXZXMytiN0Q3?=
 =?utf-8?Q?purc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d1aeca55-1098-4740-bec6-08dab7e11cb6
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2022 06:04:30.5484 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GI/PVCYarBESe4Fj7cFkTjQOt1AA7G9ati/VLaH1Y8P373lEaHQDOn3babbrbNEZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7278
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

Hi Shaoyun,

yes, absolutely. If you say that this is ok then I'm fine with that as well.

Thanks,
Christian.

Am 26.10.22 um 20:13 schrieb Liu, Shaoyun:
> [AMD Official Use Only - General]
>
> The SRIOV already has its own reset routine amdgpu_device_reset_sriov,  we try to put the sriov specific sequence  inside this function. For the rest part(re-submitting etc ) we should try to have the same  behavior as bare-metal.
> Can  we just don't do the re-submission for all kind of reset since kernel already signal the reset event  to user level (at least for compute stack) ?
>
> Regard
> Sshaoyun.liu
>
> -----Original Message-----
> From: Koenig, Christian <Christian.Koenig@amd.com>
> Sent: Wednesday, October 26, 2022 1:27 PM
> To: Liu, Shaoyun <Shaoyun.Liu@amd.com>; Tuikov, Luben <Luben.Tuikov@amd.com>; Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; daniel.vetter@ffwll.ch; amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Subject: Re: [PATCH 2/5] drm/amdgpu: stop resubmitting jobs for bare metal reset
>
> The problem is that this re-submitting is currently an integral part of how SRIOV works.
>
> The host can send a function level reset request to the clients when it sees that some schedule switching didn't worked as expected and in this case (and only this case) the hardware has actually never started to even work on the IBs. So the re-submission is actually save from this side.
>
> But in general you are right, the sw side is just completely broken because we came up with a bunch of rather strict rules for the dma_fence implementation (and those rules are perfectly valid and necessary).
>
> Regards,
> Christian.
>
> Am 26.10.22 um 18:10 schrieb Liu, Shaoyun:
>> [AMD Official Use Only - General]
>>
>> The  user space  shouldn't care about  SRIOV or not ,  I don't think we need to keep the re-submission for SRIOV as well.  The reset from SRIOV could trigger the  host do a whole GPU reset which will have the same issue as bare metal.
>>
>> Regards
>> Shaoyun.liu
>>
>> -----Original Message-----
>> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of
>> Christian König
>> Sent: Wednesday, October 26, 2022 11:36 AM
>> To: Tuikov, Luben <Luben.Tuikov@amd.com>; Prosyak, Vitaly
>> <Vitaly.Prosyak@amd.com>; Deucher, Alexander
>> <Alexander.Deucher@amd.com>; daniel.vetter@ffwll.ch;
>> amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
>> Cc: Koenig, Christian <Christian.Koenig@amd.com>
>> Subject: [PATCH 2/5] drm/amdgpu: stop resubmitting jobs for bare metal
>> reset
>>
>> Re-submitting IBs by the kernel has many problems because pre- requisite state is not automatically re-created as well. In other words neither binary semaphores nor things like ring buffer pointers are in the state they should be when the hardware starts to work on the IBs again.
>>
>> Additional to that even after more than 5 years of developing this feature it is still not stable and we have massively problems getting the reference counts right.
>>
>> As discussed with user space developers this behavior is not helpful in the first place. For graphics and multimedia workloads it makes much more sense to either completely re-create the context or at least re-submitting the IBs from userspace.
>>
>> For compute use cases re-submitting is also not very helpful since userspace must rely on the accuracy of the result.
>>
>> Because of this we stop this practice and instead just properly note that the fence submission was canceled. The only use case we keep the re-submission for now is SRIOV and function level resets.
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 3 ++-
>>    1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> index d4584e577b51..39e94feba1ac 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
>> @@ -5288,7 +5288,8 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>>                                   continue;
>>
>>                           /* No point to resubmit jobs if we didn't HW reset*/
>> -                       if (!tmp_adev->asic_reset_res && !job_signaled)
>> +                       if (!tmp_adev->asic_reset_res && !job_signaled &&
>> +                           amdgpu_sriov_vf(tmp_adev))
>>
>> drm_sched_resubmit_jobs(&ring->sched);
>>
>>                           drm_sched_start(&ring->sched,
>> !tmp_adev->asic_reset_res);
>> --
>> 2.25.1
>>

