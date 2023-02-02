Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C23DD687CC9
	for <lists+dri-devel@lfdr.de>; Thu,  2 Feb 2023 12:58:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 907E110E20B;
	Thu,  2 Feb 2023 11:58:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060e.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:fe59::60e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF44210E1DA;
 Thu,  2 Feb 2023 11:58:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lhkbFLluPnoKNk5AXztlwwoVvmunCMck2qmmeiR1qCP9Oo1O2bWO1Ownlo09JR+MwDI0wNI9f1mpYQoLvtGp4tqsHxQiV8uMqUk7ycfLDlqdM6PxZ5+e5giLv9CPSP2fYwWEiLf9xjJxcIRq1FY9KfZ2Z5wpq4nx8nlZfFSy9auO/l4MB1y3XvR59leRWq9NlQs44RTzFsrJ5ocERuzSJsr+YAtAW9GazExmWSocvgl/KbSYLatWyJjNCBJ3wQD5Z/m5f1mKm3hVd4Xmnh3XPlAHVcklcnVnH/zg4WfvGaT8JZdDfhHDgOMCnWX+gOYIElvkbsvUl3bpLLXq+nO19g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hJrGvopLET90ZMTEK7T+ASCSaKRiIhGAZkr5ldfj4Jg=;
 b=Crs4AQWBNqyIJ0fHYyMIIKkXYOfrYNqlPjcfsDfyngcdK3W0c4aaslFSG+2iJn6QHiRrFQ7hew9bwVqz1zlPt4U+7AHR7qPPMFXBZfQQq9Tc938aGLrc5fGBWau27vRwSfvK7Ez1aoK80hOYXbax2xjBJ5BKFfgal5wSkpIWGDrjw/gmijcb91BUOotk0E9nbCHTZvhRLwIRPpnt8ZtIHRrE3UvE8daE+dVaQp2uk9nsGGnzJcGr3p4LxYBCT+xQS92bnstPYfSCWYPPrE3fc4I5XHu056y7e0lmIcMPApGS1ZA/OYIVh57kb6elAUZ6U+nCXp0FhRU5wS/H0G2P5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hJrGvopLET90ZMTEK7T+ASCSaKRiIhGAZkr5ldfj4Jg=;
 b=cDSp4Q35PTBkwPxXOZ9FlFHVwTTspo0cAIv3dgzEHTPnoVu+iNoBiNgQ9RoAcxSoGrCcTytIPj8drjY0okwD7JdB0y8i/5n18lTsyjMhmd9SNBM35ZtTSvt5RItrTTXABu8DF33F0eM3ZJ5LQ/ljFZv34Q1cWzH3SPGXGAm24jg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BYAPR12MB3589.namprd12.prod.outlook.com (2603:10b6:a03:df::29)
 by BL1PR12MB5160.namprd12.prod.outlook.com (2603:10b6:208:311::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.24; Thu, 2 Feb
 2023 11:58:24 +0000
Received: from BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::500a:d02f:5ceb:4221]) by BYAPR12MB3589.namprd12.prod.outlook.com
 ([fe80::500a:d02f:5ceb:4221%7]) with mapi id 15.20.6043.030; Thu, 2 Feb 2023
 11:58:24 +0000
Message-ID: <cd0e2994-f85f-d837-609f-7056d5fb7231@amd.com>
Date: Thu, 2 Feb 2023 12:58:15 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [PATCH v2] drm/amdgpu/fence: Fix oops due to non-matching
 drm_sched init/fini
Content-Language: en-US
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>, amd-gfx@lists.freedesktop.org
References: <20230201164814.1353383-1-gpiccoli@igalia.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230201164814.1353383-1-gpiccoli@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0133.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::20) To BYAPR12MB3589.namprd12.prod.outlook.com
 (2603:10b6:a03:df::29)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BYAPR12MB3589:EE_|BL1PR12MB5160:EE_
X-MS-Office365-Filtering-Correlation-Id: 0fe8ef19-1593-4d55-e74b-08db0514c956
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PqwxX2mRsrR7dpvdelULHQI8LLA3uyP9VorkpuPh0zl2Fz473r7WxQLzWgJkUkbrYqqIUC4sEHkCyqYuwrbAw1cF1+T1yPQFEeN6mP8C41wYF3X5cNBgWpyiPqRggG6uS3FT2r18XnYIRChBIjChu41WWres7duIdiJhT9Wp4N6vqBarZMA/fmOGuobPPalOBjuvOo4Aldlxo/zwWkNMG9DPI6wy5+Tyt5yYLI1TjL/sAkC+m0PfuIQPIJquIx91L/qtMzrJV/ZfVxBdOlScitSRcEdrgzTOOL2OexIsnuB8gmrcKt838g0gaJEgvA2rtHqn4st/r/jgaZQ508gjwatJ+WKUhm3GJUTA7h9N8zPc45LtKbOdWoT5Mlw6GF0Vooli3zNB1sOeABWMA3qU5KQ1tEGZ4sfl3Rpmf6c8LHZLJrJKL51to0Ikdndeh5yr0EXASqV98npEekqHd4w33/jQiD57bZC18CCQML+KSPF5wWeTr/1IRRhtCIJAmKl0ogyAGydlw2BOOz+ynoDWphfBhhrmSxims7JCV/YQrEmfUah3V/06xWKc9F9hDmjh2e8dccr2PIFHQer+Gdyo/hLfFG7wwouqJZ/ovattAlPWWjr/jUHjwQZW3FqHSAGNlog05RdW2Ze1SvNGVEmREhM3Hd7yChSi22EPpT8BCPdhMcMvgb+nuN+Er0ZvDJjuAbblGX6NbTqwDOnvaLTpXMDIO5KIZ6C+d5kJuOrgjljRW3wS+2s68p3Q0Rh/BptopZaGS/ExXMYwzpFzd8bGTA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BYAPR12MB3589.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(366004)(396003)(376002)(136003)(346002)(451199018)(5660300002)(6506007)(26005)(6512007)(6486002)(36756003)(186003)(6666004)(38100700002)(2616005)(316002)(966005)(54906003)(31696002)(478600001)(66899018)(66476007)(31686004)(66556008)(83380400001)(2906002)(86362001)(4326008)(66946007)(8936002)(66574015)(8676002)(41300700001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bGpSeDM3SUZveC8zSW1INWdYbmsrZHJBc1Y2NlUrQUswa1ZFakhubUNmUTFL?=
 =?utf-8?B?OUNQVElQVFFSQ2J1TmhCTlZRTkQyUHZzM0Zkb0ZER2RNNDhkQXU1YWoxcDkr?=
 =?utf-8?B?elpoTzJSZFBOLzkwYUxFaUVOMnU1aFM5NFh4ajB4eEJwKzVnK21tcHlkQXJz?=
 =?utf-8?B?VzZJOWc0czNhckd0RENSMWthemdTSVo0a1ZHTmFNTS9IRGpiazRXV3JvRmZV?=
 =?utf-8?B?N1RLa1JkclBFMzZIWHcyY2dFa3VkL1FBWTJpVVNzRlNUT29UcEtrQU1EWWQ2?=
 =?utf-8?B?RlRYRndyNGNxS0I2N0ZmSmJDS1pXMEZwckdaODA4aDFSTFcvOVBVU3V2aStt?=
 =?utf-8?B?TngySmp2a2J5S3ZOckN1R09VaWo1V1RHaExRVElkRTUramtpMGZVSGZkZDNN?=
 =?utf-8?B?bU9FczM4dFdYNysyRFFoVmMyc3drTmtCZ0pOMmtXdTFGbzd1OXlqdXZjL0hn?=
 =?utf-8?B?MlpyeSs5eElCTG45WHlDbWE3SDdFSlUxU1kzRUVTeUtTMWpUdTE3ajJwUjZQ?=
 =?utf-8?B?dWNuZUZOTzdNODcyQWFuL3BJYjhGSjlVNUVyd05CWU1aUlBvY1EvTHRNS1RJ?=
 =?utf-8?B?RlNGT2xPSUt2d2dhNGhqTzA3WWxNbGtCWWxhUENGbVpObVc1R01iOGhBOU9F?=
 =?utf-8?B?RWJHUUlFdDJNNkx2N05zVG11L1hzMnphVHlWU0R4cksvOExYWThsdStSSzY0?=
 =?utf-8?B?TFo2dFJRY1JtQ2doSVFrelBFWTlieERLSzQ5NUpQenBsVU4rSWlpOVJ0YUEy?=
 =?utf-8?B?VXRReEZvQzk1Qm9YekFkN2VXZlpsL24xeFZCR1E4cTNlbkRmbk5VSVQ4Zm1X?=
 =?utf-8?B?b2NpY3I5Y2ZEUVNvOWFOTFNocHFpYlBSZVFsVjhaRlN2K1Y0NGJPaklhRHJH?=
 =?utf-8?B?ZWxuQ1NNalpXM2pObmQ1Umk2Z29SVG5TVWorY3ZOQmViZTJFdVJpSWNQUDAw?=
 =?utf-8?B?amJwUUgvdE4wRlk3SXdqVHZjWTRFSloreWtHTmNJMGUrMU1WOER4TkFWL3RH?=
 =?utf-8?B?YnVRd3JqbzFVbGk4dXQ1Q3k0RGVhZlNoNHBuWUhCMXhSR1dzeENreDNsUVlX?=
 =?utf-8?B?emRBci9WdDU2SWN3V1dFT0dHd2NzOFovenJkR24yK3owaUN3VG16SmRzd2dP?=
 =?utf-8?B?ZUcyQytNRG1KQWZVUncrWGdydUtndTI3Z0JncUdLZEp6YUc3K05XT1RuRU8v?=
 =?utf-8?B?L0xIQjEwM0prTDdyOUVESy94SHo5R0pwQk12TUpjRjFTWk9pWTlwR2RDNDl0?=
 =?utf-8?B?Y0ZuQ0M0dVBFdHVOTUoxMDVxY1QzMUNnb0RRRlpHc0YzdnF0d1VFcDRySjFq?=
 =?utf-8?B?N3lxOWlaNDJ6bWU1K1IwQUJscFkvRWlEbjROUFlqbDA5ZW5FWVRXUTRUM1Ju?=
 =?utf-8?B?VVJjNVpIUEFzazF2aURRQ21keHkyMU1NVUxFOGMvWm5yZTNNbGNNZzBucmlK?=
 =?utf-8?B?WXhrSUs2L20rZWgwRUVmUDZ1OTRyNDUxQUVaSGFMdEtFL0Z1R2VvMUtxZDRL?=
 =?utf-8?B?Z0dEQ2ludmhQbUlZMC83alJsSTZUZUhHUEduQTJQTXovR0VlamRFK0FhYTFY?=
 =?utf-8?B?UjFjYUUyNU91SjVGNS9wNmhla3hBME1YeUo3NVJCVFFGZEI5MC9FVi9QVjRs?=
 =?utf-8?B?cm5LcGhVeDduZ3Q4dHowOHdQci9qdTkybGNReFVrZEZpWjdIRGw5MjArTU9S?=
 =?utf-8?B?QVhlMUJvVFI3ZHc4N0JUQXZIOENidnVRYWpIQWVmbm9Ta3Bobkh1M0JsZ3Bk?=
 =?utf-8?B?Q0lMRVVGQ0gxMmVFUlRjazJRNXcyb0hybTg2bVVoMk1TQ2wzT2ZNY0RXN0o1?=
 =?utf-8?B?bVhwTmsxbTJDOWJlNmxHaGtxblZmQXFFcytnQkNGOC9xdTJ3TXJvSG90RU9l?=
 =?utf-8?B?T2tVYlJ2M3V6OHVEaXR5SVJtQzE2WnRZTWh3bG4wUUlla0FxaTlsSWNzZ0ND?=
 =?utf-8?B?UXdjVnBoQkZuTkd5N1ZSekZvYW1yT0dEdXRYMjhlMythSUN2RGRDSVRsNGZ5?=
 =?utf-8?B?Tk9wem84bFhOTksxamFqUDJ5YkZWSi80NHdtSllucVF6b1VuNTBXalljanpS?=
 =?utf-8?B?eDVpT3JPMWtVTWZYYmdlZ2o0VW4zcVdNUnUvRkJhOXNWZXFOanVSRDByM3Nk?=
 =?utf-8?Q?fp2myAs1V4eu651PdlQcpDWhW?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0fe8ef19-1593-4d55-e74b-08db0514c956
X-MS-Exchange-CrossTenant-AuthSource: BYAPR12MB3589.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2023 11:58:24.1269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7VgPaQ9KMtGHkTRiH+MPQLPMlzQGR5SygJaeHYNrMopnmmY1QnHeLCP0xmqxmoft
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5160
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
Cc: kernel@gpiccoli.net, Guchun Chen <guchun.chen@amd.com>, Xinhui.Pan@amd.com,
 dri-devel@lists.freedesktop.org, Luben Tuikov <luben.tuikov@amd.com>,
 Mario Limonciello <mario.limonciello@amd.com>, kernel-dev@igalia.com,
 alexander.deucher@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 01.02.23 um 17:48 schrieb Guilherme G. Piccoli:
> Currently amdgpu calls drm_sched_fini() from the fence driver sw fini
> routine - such function is expected to be called only after the
> respective init function - drm_sched_init() - was executed successfully.
>
> Happens that we faced a driver probe failure in the Steam Deck
> recently, and the function drm_sched_fini() was called even without
> its counter-part had been previously called, causing the following oops:
>
> amdgpu: probe of 0000:04:00.0 failed with error -110
> BUG: kernel NULL pointer dereference, address: 0000000000000090
> PGD 0 P4D 0
> Oops: 0002 [#1] PREEMPT SMP NOPTI
> CPU: 0 PID: 609 Comm: systemd-udevd Not tainted 6.2.0-rc3-gpiccoli #338
> Hardware name: Valve Jupiter/Jupiter, BIOS F7A0113 11/04/2022
> RIP: 0010:drm_sched_fini+0x84/0xa0 [gpu_sched]
> [...]
> Call Trace:
>   <TASK>
>   amdgpu_fence_driver_sw_fini+0xc8/0xd0 [amdgpu]
>   amdgpu_device_fini_sw+0x2b/0x3b0 [amdgpu]
>   amdgpu_driver_release_kms+0x16/0x30 [amdgpu]
>   devm_drm_dev_init_release+0x49/0x70
>   [...]
>
> To prevent that, check if the drm_sched was properly initialized for a
> given ring before calling its fini counter-part.
>
> Notice ideally we'd use sched.ready for that; such field is set as the latest
> thing on drm_sched_init(). But amdgpu seems to "override" the meaning of such
> field - in the above oops for example, it was a GFX ring causing the crash, and
> the sched.ready field was set to true in the ring init routine, regardless of
> the state of the DRM scheduler. Hence, we ended-up using sched.ops as per
> Christian's suggestion [0].
>
> [0] https://lore.kernel.org/amd-gfx/984ee981-2906-0eaf-ccec-9f80975cb136@amd.com/
>
> Fixes: 067f44c8b459 ("drm/amdgpu: avoid over-handle of fence driver fini in s3 test (v2)")
> Suggested-by: Christian König <christian.koenig@amd.com>
> Cc: Guchun Chen <guchun.chen@amd.com>
> Cc: Luben Tuikov <luben.tuikov@amd.com>
> Cc: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c | 8 +++++++-
>   1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> index 00444203220d..3b962cb680a6 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_fence.c
> @@ -618,7 +618,13 @@ void amdgpu_fence_driver_sw_fini(struct amdgpu_device *adev)
>   		if (!ring || !ring->fence_drv.initialized)
>   			continue;
>   
> -		if (!ring->no_scheduler)
> +		/*
> +		 * Notice we check for sched.ops since there's some
> +		 * override on the meaning of sched.ready by amdgpu.
> +		 * The natural check would be sched.ready, which is
> +		 * set as drm_sched_init() finishes...
> +		 */
> +		if (!ring->no_scheduler && ring->sched.ops)
>   			drm_sched_fini(&ring->sched);

I think we should drop the check for no_scheduler here and just call 
drm_sched_fini() when the scheduler instance was initialized before.

Background is that I've found a couple of places where we potentially 
set no_scheduler to false after the scheduler was already initialized.

This is then probably leading to a memory leak or worth.

Regards,
Christian.

>   
>   		for (j = 0; j <= ring->fence_drv.num_fences_mask; ++j)

