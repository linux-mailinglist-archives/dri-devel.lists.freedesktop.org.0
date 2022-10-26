Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C06B360E66E
	for <lists+dri-devel@lfdr.de>; Wed, 26 Oct 2022 19:27:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 087AE10E626;
	Wed, 26 Oct 2022 17:27:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2064.outbound.protection.outlook.com [40.107.92.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4070410E626;
 Wed, 26 Oct 2022 17:27:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LPrApCfAw8qqPLAYvtD9QPFXGGeaLOUMmcfOk51Aey+QqtvEUZXqcMMdRhoasz4uNyGcoR18ofBtgieGf9k+QhzIJmmKTYHKuKCLI3YSQXiPtT/6xhw9zvzzUhCBgWh/2q2VCWsDcDOuHQHkQlhSgyQ5We4Ui4tjQufqJQGMwMgp2FleXGxyLY78IBlebfDQDnqPqlg0jzprMGYV40sWDtv/xV9KoboUJD5YTiFVISty7Efqf2L3hzxMgoi+gT+WOJwN5+RVFyPlvFPbyN3zuwXmPEp9GSfd/mc3kW7DoYbAmE/R5c2u4RVmZSy8TJPwwr+qa9NaH/lOPm7WmYtCfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Khu2qDHQcUKHfns1uHNzLxpaPoU1fb1VBum+VdrjBGg=;
 b=cMMwNR0QO5jD5hslW5uBgg0kvpvFSZpPP2NcoYCq0DB6hBKApo51Z0e3xbl3tpKalpZBkAQUyHGavDQNnQ5bhUW89o+xROFQr9lMDUGFL+j9kE6t8yZIrgbhiTRrCGea8brNYo3aciqGTWCHFHx5uqsFHSoOxtlCUW5G8wxkOLaV93e62FAYcfcLDQvnphSS4Xf3ZTt76S8xZv44MY+kd5f3qlIzqPLponC8MaVx1V1R8UaPjV6Esp/fcNcoOoZuQqxia2h0lrflYbMB6+eRBPpYbZPVPy8FgA3g+XzNeP/JHLbb5l481gIiiW+I+FgWDahObGnzvJ/9PfUKulr9qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Khu2qDHQcUKHfns1uHNzLxpaPoU1fb1VBum+VdrjBGg=;
 b=5eVkLWm2G9G1ABDxnK1vN6LLULyxVVGE6JfuhbztGcTk/+Zv3TAOyf7t9F42xHoswmpY2SRSD65v2vtAsEMiKGsWSvnmRXQ/8vfZMH3Mz/tkfsrxane6u14ezTP1wODRvS0PLTiLrA0RmE2kc0ZBI4qCcViKGIauLLM+a2FH424=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by MN0PR12MB6030.namprd12.prod.outlook.com (2603:10b6:208:3ce::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.31; Wed, 26 Oct
 2022 17:27:00 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a350:f29a:f287:7279]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a350:f29a:f287:7279%4]) with mapi id 15.20.5746.023; Wed, 26 Oct 2022
 17:27:00 +0000
Message-ID: <87386405-8dd2-f88b-1755-620962786925@amd.com>
Date: Wed, 26 Oct 2022 19:26:55 +0200
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
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <CH0PR12MB5372F1A8B89543E067865EC6F4309@CH0PR12MB5372.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0119.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a3::19) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|MN0PR12MB6030:EE_
X-MS-Office365-Filtering-Correlation-Id: 422a2d82-5758-490a-af93-08dab7774a58
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: F+kuYcE8tn+/26YDUJ15TOxMbGZLrj8ghFdpoaFh20W0eRDMWAf8klK5FNa5fkOswJlXidRcQU446tDbSDRq8QTJMCOmOQ4ZUbMLRPBtiYgf+C4BPBZwvVz+ZtwIJk0zfoIGX0+cLlpDYNZJRFQER6YxYHnOqxU67ngT6zMseBJqKbMtoxX1mgYAtewwglpXuwIyblNBrC+x2AIfZtUWgT6YQBj4HYimJjzqk1a8nPI0Gm2P0yJw4min7Auu2Jgn5Oi/6oNN4EYzv7pk3C5SQvp6lYEA/qBwuyax8naln9lN0eDQx8XDMWeaI4hDkGAgbRRikk0bqGpKmane270Pn29fACazBZxIgqHp75+9A/MPQS+KOX2nhfuP4F9veV9FTf+Z4LXCm7NkoN415PuV4cx8y7hHBRtLG4TS6Yzbe3pOGSgwXhviMkkjNYeJJK5wnOkknaj4azauCueDxhiwjthXYvH8CyTYvKe+wayry1Y5++YLl8XjFQc8ng0pxVqmUyREejI1vEeKfybYDj8oq3JcNdLI09DnWHyhgEgMABPjwtrwiZlm5ZcPEQPR/wn7vU7qRDzGr/OWk1EjCD3abOaBpjZj/ZmaKlANxBG6OTMySLY9I2c5hMeYNkwdGw2Sb1ZpqclMom6bgYJ5TtIEYyfR5gystDEuqzwotezIQ6PN+kb0gzeQIhAPKAUC31/hfVDdqWptIKxvCoetkxBEsXHlwC68TyNoeQg5vEp0Ns1bVIvNEW57ZjDhYdRIceMZTBO40AUA+6x1oHAYhLYyvMt1cNZPBCCXWUg5OWeKmV/Cxi6hQ7+nGZ9un/LmeUnpdLiMjrk/FDJxDfAyzJuhwg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39860400002)(346002)(396003)(366004)(376002)(451199015)(31686004)(6486002)(921005)(66556008)(31696002)(66946007)(86362001)(38100700002)(66476007)(110136005)(316002)(36756003)(6512007)(83380400001)(53546011)(478600001)(6666004)(2906002)(6506007)(8676002)(2616005)(8936002)(41300700001)(186003)(66574015)(5660300002)(116466002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dDMybDNQYjNET25YK0RIVi9nMTdzNElhV2JHYXBpdUZMVllmSDYwd21jRjN2?=
 =?utf-8?B?enNaZXRpdFhBdDNvRUdwM3FFOXJpZkZXaDJqeFNTeTA0cFEyTHpnNDdyUDRU?=
 =?utf-8?B?eGRhcFpVRmlFOEx2bUE0UUkrVndidU53clEyRXJOVTNXRWk4UTN1WDJLU2hx?=
 =?utf-8?B?dmZCQmdaNlA3L2s1TGlvSW5KZTl1WmR2R0RnQUYrYUszanp1NTg5eHdsYjll?=
 =?utf-8?B?K2FsSGtib2hPbzkrODNEZk1tam8zV3R5WHhnNDRsa1p1bUJ1aEdmSFgvc0Jy?=
 =?utf-8?B?MitxZnlUUk1OcFVIRGdPall5d0JaWW83Z0EzOEhqemdUei8rcVVUK1hqdG1s?=
 =?utf-8?B?RUMvOE5KSHE5bHVONGFKODFRSHM1Y2xKUEx0b2NRUEU5RHFBb2IzTUZjLy9k?=
 =?utf-8?B?SlBxREtUU3hNQ2dyaHZscnNJVjMwYUhHYnZPOWF4TUEyVnlEV2Z5M29NVmsy?=
 =?utf-8?B?dDZHbk9JUVNKODhKUENuOUJNZGxBQ2hkWWhIR2NsREMwekUxQWQ3NmtKWi84?=
 =?utf-8?B?TzZ4cXVUYjdpZysrZGFtYVBYQVBKdzVBZ3ZRU3o5czRoNDFhdDZYelVlQS9V?=
 =?utf-8?B?L3plVEY2VlNudmtLVURKUHZLSk5TbnFEYm51UXZXT0tmR2xQUzQyMDZsQkVJ?=
 =?utf-8?B?bHV2clJETGMyTUdYeW5DWVBkYWpsbUc2Wm1xajB3VzdTM2xuNFluaFdEUkhD?=
 =?utf-8?B?SWdPVFkrTjZpUEN3WXFGVmo4cnNNZkFBbldRdUk3RjQ3N0pKL3lRU2NadGkz?=
 =?utf-8?B?dlJ0Z3RUZW0rY09ueDIzTks1U1lpd1lhZ3I3aGIyK1VRMDNXYkhKQjFuSHg2?=
 =?utf-8?B?WEM0QXVFRGRvRmlsV0RNV0JLQWNVTnJmZWZuUENySUp0dHhqV1ViNkljNmp4?=
 =?utf-8?B?RkZUbGtaTTFkTU9rNW5yMkUzNW03cUU5emoyUmxnZE1URmRwdHIwcEdEelZo?=
 =?utf-8?B?MVBRanh3MFRoSVZITmw4S1VEMkdDRzRLdnFEd3ZaSFhhR1JlcUNxTE5aZXB4?=
 =?utf-8?B?YjJaTE5MWGVxWE5rRGNwZzZVYkxBbmJzKzVSUWZ2R3NGdlB2TGJsNm5RMjdN?=
 =?utf-8?B?bmVLc05RdXRZN2I5empjdi9CQnRDZDI0ZnNYenF0NGNIck5HQnlCa1Y5Z0FW?=
 =?utf-8?B?cHhZeFRINHYvVmpRcExZVVdSaUUwQ2ZEc0E1VTdWcnM0NEhEYmZXbFpmQ3ZP?=
 =?utf-8?B?RVNnQzFMV2Y4bC9zUTU4SU9FSTVZd0FuUnU3aGdqOEdRTkdVaDI0WmJjeHJW?=
 =?utf-8?B?dHNHdmJ2NmR4aTQxdXZRclpHUzIvRjZFczNZWnNUdmU3UmhIZ2VPeXJtUjU5?=
 =?utf-8?B?MlJWY1ZLOGl6blZ4VWF0dTc1cjRzaU9LZU0rQ2hVOFcrWEVOOWRDbkNkWEZu?=
 =?utf-8?B?T2w4WnhHVjZFSFlaUzEzemNSZWMvNlRQcHZaNDI5Qk1YallXMDJrbWJUaFZs?=
 =?utf-8?B?MHBjbW9oNWx3NlhHVWxVUDJTbmgyczUyLytabmpNU2xlQ0s3eWFQY1JKV2M5?=
 =?utf-8?B?Uy80VzArQWVFSXpLcXFVRC9NaHlINnFoY2dUZThlN1RXN2VLU01LTDFTNkVV?=
 =?utf-8?B?a3RYWkxmWndLc2ZKK1JBUlpzdzBUUWxVTGppM1duOUk2clVmUGhpbEVGSnZi?=
 =?utf-8?B?NkJJUVR1NlF2SXNXaDh5UHpJOEVxRnRCRUJRQWd3SE0rNkFlK1ZVY0VHdStX?=
 =?utf-8?B?SEdjSW5RODQycEcvZ2V5SWV5TWhlQ25meUpONVM0enNncFY5NkxYVlpFcmZT?=
 =?utf-8?B?UTlZUzZiY0t0RW9YOTlDNWUvNE1WMWRwcWIzbXBRaEozUENMemdMZHc4cWtG?=
 =?utf-8?B?aFBPclJBN2FlQmp5Vmxmd0xxYkZ6UExETnNmYWI3YmVEQjJWZ2Z3RTdZVlBL?=
 =?utf-8?B?QndhZEJiVUxSY1M2RDZ6QnpwcFRUZnJ3b2RoL0hHMXZmT0pWVTNaalJkV0p0?=
 =?utf-8?B?T2tMQlFXcUhLaGFhRVd2Y09FaTVPSlI3TmlpbjBZc0RGcEdHQlBmM1laVmdL?=
 =?utf-8?B?cmlrNENhcVFDbVBXSGYwYnVLUCtyeUppRkJvNjJnc015Qi9YRmN5ME9QNFln?=
 =?utf-8?B?dGoybUI5OTB4cGQ4N1BIai9RcnlTMGc0enREdFFXU1p0NHhmeDVjQkw3d0hW?=
 =?utf-8?B?NWlZWk9ONUtIdGpDTldhYWluMHNPM3hBMW1IU1N5aGlrT3QweC92SGJnUnVY?=
 =?utf-8?Q?Koy+uESjKD1pKP8ZhDz93aEtVMt/F4aD1T+Iihl30kVo?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 422a2d82-5758-490a-af93-08dab7774a58
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Oct 2022 17:27:00.5944 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jS0FprA2PYvc9wjWuO2sn9szqp7cLkYmUUSgfMnvVQw6HVrv+KNNL4aUq4zvmftW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6030
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

The problem is that this re-submitting is currently an integral part of 
how SRIOV works.

The host can send a function level reset request to the clients when it 
sees that some schedule switching didn't worked as expected and in this 
case (and only this case) the hardware has actually never started to 
even work on the IBs. So the re-submission is actually save from this side.

But in general you are right, the sw side is just completely broken 
because we came up with a bunch of rather strict rules for the dma_fence 
implementation (and those rules are perfectly valid and necessary).

Regards,
Christian.

Am 26.10.22 um 18:10 schrieb Liu, Shaoyun:
> [AMD Official Use Only - General]
>
> The  user space  shouldn't care about  SRIOV or not ,  I don't think we need to keep the re-submission for SRIOV as well.  The reset from SRIOV could trigger the  host do a whole GPU reset which will have the same issue as bare metal.
>
> Regards
> Shaoyun.liu
>
> -----Original Message-----
> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Christian König
> Sent: Wednesday, October 26, 2022 11:36 AM
> To: Tuikov, Luben <Luben.Tuikov@amd.com>; Prosyak, Vitaly <Vitaly.Prosyak@amd.com>; Deucher, Alexander <Alexander.Deucher@amd.com>; daniel.vetter@ffwll.ch; amd-gfx@lists.freedesktop.org; dri-devel@lists.freedesktop.org
> Cc: Koenig, Christian <Christian.Koenig@amd.com>
> Subject: [PATCH 2/5] drm/amdgpu: stop resubmitting jobs for bare metal reset
>
> Re-submitting IBs by the kernel has many problems because pre- requisite state is not automatically re-created as well. In other words neither binary semaphores nor things like ring buffer pointers are in the state they should be when the hardware starts to work on the IBs again.
>
> Additional to that even after more than 5 years of developing this feature it is still not stable and we have massively problems getting the reference counts right.
>
> As discussed with user space developers this behavior is not helpful in the first place. For graphics and multimedia workloads it makes much more sense to either completely re-create the context or at least re-submitting the IBs from userspace.
>
> For compute use cases re-submitting is also not very helpful since userspace must rely on the accuracy of the result.
>
> Because of this we stop this practice and instead just properly note that the fence submission was canceled. The only use case we keep the re-submission for now is SRIOV and function level resets.
>
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index d4584e577b51..39e94feba1ac 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -5288,7 +5288,8 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>                                  continue;
>
>                          /* No point to resubmit jobs if we didn't HW reset*/
> -                       if (!tmp_adev->asic_reset_res && !job_signaled)
> +                       if (!tmp_adev->asic_reset_res && !job_signaled &&
> +                           amdgpu_sriov_vf(tmp_adev))
>                                  drm_sched_resubmit_jobs(&ring->sched);
>
>                          drm_sched_start(&ring->sched, !tmp_adev->asic_reset_res);
> --
> 2.25.1
>

