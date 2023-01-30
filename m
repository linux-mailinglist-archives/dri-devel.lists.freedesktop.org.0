Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C3E4681D24
	for <lists+dri-devel@lfdr.de>; Mon, 30 Jan 2023 22:46:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E4B7410E134;
	Mon, 30 Jan 2023 21:46:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2066.outbound.protection.outlook.com [40.107.92.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1EAB210E122;
 Mon, 30 Jan 2023 21:46:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lTbWseeYFMHCmzRzLHxPENsRu49MlXczF/n1ElzOGnoPH5zxdf5I6g4u/DOqRTgqTh/z+yPqxtB5svzKOFKDlXJykh8Owwd8wUow8QfxjqbwNJ9OmRo911iADC/MUO551zGS3XgCQszr7oW02aPUdaYdKxk4X2pe8P+Ft/sjhAtXByz3ffDihmxg0r51PMuv/W47QQ2frcZBQUK5KcuBA7i2grIQDwpnt0SeeezvjyqkIEGQjGr9gZo58jgcH7H37c1PKUwf6OJoAEz6M7U+a4JbFgKSksty7IfZ++WvkjSgguHzt2yGZdJaK713eUV+m7PIGynj+rxA2jhHPdYy2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bSSQrWKPHBGG2uI6VRs9OUzs7mkZDYn+uE8DSwcpHN4=;
 b=HBhuLqsvUpQLNTE7EtD10G6CBpcxd+nXfq292tQE/9DCVsW6ezpB/x+u2QhzPgTvbSrQyh5Of8vb6o7tYOhjhnvUiXtlGKbySYA1qwEBVrSsOXSoHDG4tUhuBPvOuYxUG4atXUgNjrU7Q4Cv4d5q2WuiObcybFhW97gKgQVQ99yUDtfbbp2mAfGm6XC7COReMxg2H9tbV5P4AXBdjWvS9jALMOMH+8pTu3erB2XHUcrGsVBBFc1wbRrQgfcas1h8SoIuPheAG0k+HUqsZ5qu1drk+D31nct1SCZI8g9Y0APhh1ZBS9BrusKOa9jscaq+4hPfoeGjbpXl/YlpBZ3phg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bSSQrWKPHBGG2uI6VRs9OUzs7mkZDYn+uE8DSwcpHN4=;
 b=1MiDmhKpB2wiYCmUs47TGKnk/UnjHSMx1iWccHKMYt1+GYeYU0Quhq+ZxC6gBwnAdBZ+4nDM6Gf3jLJnGFL1mF+Vc/N0m0PHImiM0h9jBQnx1OEG3zIZqSOJChAwQA1BK0N0xl2iJMuodGr0kiZy7DeSQ3SQAsblTX080ujxHDE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 SN7PR12MB8103.namprd12.prod.outlook.com (2603:10b6:806:355::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6043.36; Mon, 30 Jan 2023 21:46:13 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::4df2:b32a:e628:c57e]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::4df2:b32a:e628:c57e%7]) with mapi id 15.20.6043.023; Mon, 30 Jan 2023
 21:46:13 +0000
Message-ID: <80eab7e7-71f4-8777-28b1-b2dd31fd28ec@amd.com>
Date: Mon, 30 Jan 2023 16:46:10 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-CA
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 vprosyak@amd.com, Alexander.Deucher@amd.com, daniel.vetter@ffwll.ch,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
References: <20221026153557.63541-1-christian.koenig@amd.com>
From: Luben Tuikov <luben.tuikov@amd.com>
Subject: Re: [PATCH 1/5] drm/amd/amdgpu revert "implement tdr advanced mode"
In-Reply-To: <20221026153557.63541-1-christian.koenig@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT2PR01CA0029.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:38::34) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|SN7PR12MB8103:EE_
X-MS-Office365-Filtering-Correlation-Id: 5be42fa1-75cf-4172-59d6-08db030b6824
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /pVFdA+gkH3SJYdBUSCBid3pjrH2fsqEK96iADNRmFrnQgS/G4Oz8d/IXbruR1/b8/2CBcp+BXWAFMnQOm71+o93WgnSrJ1G7Oek91U2NYhKcK/S7OTkDU8cy6ukBweE61TK8qTWKSrgdZzAcz1dHvCjFWrT1wFFFodYVJfLwmQzU4JEZ0S2Q+O1+d1zGtGHS3wrdZ//VWk+vPzGaezwCyBgOdpR8syGUKOVGoKGxrDftnCTTXTNu62Cjzz1iTEOipLb/0fXMtfyJSOGjYcAttql/W5mQWvWPvLQ9W51hZfQvBIO2jkwNRtDEntp7vWVB6fKvXJ/WawF839FGmNqgS/MbgYvJuZEk8uzMJjoIGP8JDl81sqy7h1VR6sF0mKY4fe5wBNL5Hf6YZajinB61ojYAr2fIRNQ2xPfqgMznoUf8cquzKA81rEP1WgvsJWQlgSJ06I+fpcDnqTki9ybegpK19FRreC9dpKm8KA7vOaiXqrFlG/9wHcLp++znZrvNrDS3Kz2bKuGR4MZyLmhe7iZl7JqA4gPmLLTNaZXaLdWgI7g7SK4s/QBhasXEMtb1Uu6J+3UuMAr+07uw1z9kTxCXFehv8LXk9zZU6vjzO+mbzm4Fk/vntlDZpRfRHWPli2mi+ZG37GdQz+wFNfsX2NuV9kDtUxvs5rICgHaVi9lHeZ6rfR8CmIHzIesQkKizkKyoxrogGcnNFEnmmmmgIjYWRJmxBDQCK72Tim0TyCi/l8VogtLO0/IAz+J2kDNYUNo986njsad0BFuZBz+YSXf51481OVx15yqXznkHNU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(366004)(136003)(376002)(346002)(396003)(451199018)(41300700001)(66476007)(66556008)(66946007)(31686004)(4326008)(8676002)(83380400001)(316002)(8936002)(36756003)(6512007)(4001150100001)(30864003)(44832011)(66574015)(2906002)(5660300002)(86362001)(478600001)(6506007)(55236004)(53546011)(186003)(26005)(6486002)(31696002)(38100700002)(2616005)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGk3eUxaeW5VZGs5VWswT0FyY2FuckpZWDUwcXRzQ2lXOHY1SlpPQXpOSWxL?=
 =?utf-8?B?YTRTdEFUK21OWGNSZjBMOERObTEyUjBwclRDNDRMdVI3OHJMVUdaZ050QU5t?=
 =?utf-8?B?ZzVRcSs0dDBPeVAzTE9rRDU3SGJQL0FHMWtrdFVzc0tmN2VzYVBVWFJiL0hy?=
 =?utf-8?B?azRtbGFEU01MRFg3aVU5N0VVaExVWUpadEZ2NW8rbTBScEhNZW9KaWJFdEhT?=
 =?utf-8?B?cXpxekRlMWVZU29tamhmTFN1N3RTVEpVYTZzRFVMY09NNnRtcGVvNDIrRFB1?=
 =?utf-8?B?ZUZKUmpqeU9VRHV6MzVtc2VBME1HNTFSVjN5MlMyWDJrc3kyTmNyNHRlcmdM?=
 =?utf-8?B?ZDVGRktrRDBCOXp5aHptODNTNkd5MlBBcnR5SHFsOW04b25aM2dlT2w0YkRq?=
 =?utf-8?B?S0FDQU1Qdm9jczIrYlU1dFRlcDZkSlkvNlJubVlMTEl3SGkxb1RIT1QreXhZ?=
 =?utf-8?B?QjZSZXZTRDFrUkZaMVJicmg3U1ArMXhvdzdnd0JFSnU3elEvQ2FXQXBPREh0?=
 =?utf-8?B?K1Q2aG9sWlFyaEZ5S2JVaUhTVkVsMnVPRHVLbUxZeG5EN1lyVlhCYkdrRy9u?=
 =?utf-8?B?bmE5NTZGR1VXVDd0eDlIcnlFNnF1clkxdEpXb1ppQXV4bjBQYnFlNlBISmhX?=
 =?utf-8?B?b3QzRDdRY3B5bjNCaC8zT3BKNTBESDFmWFptYXZSckJRL1Nva2pyMHQ1cGRG?=
 =?utf-8?B?NzNYbnZqZDEzblJ0K25YS0JJRGZxd0ovazBaR1BqQzFXYnZVbXVVaHl4RFhE?=
 =?utf-8?B?Ni8zd0JXWWRtK2FNd0tsWFNEdzJXa29DQlk4cUlPV1V3SllIM3diRzdZSnVW?=
 =?utf-8?B?RzZtOEp4OE5ua3JoaXZDNERTYkRHREFqQThrVXZtRko0bVZqZzJJQmZodkp1?=
 =?utf-8?B?WkVHdmN5VE8zN2JTSUdBVmdIOTlHeWRUN2RQaEtNL1d5RCt0bGVGeUVzUUVF?=
 =?utf-8?B?WkZyQzlGSXZ3Ri9vMCtkb0dEaVZtQVpxMXNDa2JINDI0WkQrQ2YwU3BDKzgy?=
 =?utf-8?B?cE1HKytWdjVJWGgzbjJ2cFRRNlpaTHpCd2doT2JMTnVBQnlnZkpNZWZzdUo0?=
 =?utf-8?B?L1Zwc1NMRkRoem15eHFJZjdvbzR4Z0xHRS9RSFRGMlpRZEgvaERYTnFTSEJu?=
 =?utf-8?B?cFpTc2VRR2xqaUZpV1RUYlhVcFd2VGZTclVNeXhGdUhJQnF5cDd5eGV6aGZv?=
 =?utf-8?B?RXdVRjdTazhhdXp6ejN3S0puQTlYdDd1b0lSaTdPYWp2dXlKQXB0T0t0QzVK?=
 =?utf-8?B?VDRudGJTWHpNakpkbjZMd1Vyd2xpdy95bUpQMkRUalZzRFpEQm95MHNFT2Ir?=
 =?utf-8?B?S08xc0dzUFVlNjlOTFgwd1hnT0RQdUNwSVZQRUR5b2QwQzVQZWEyK2IyelU2?=
 =?utf-8?B?WTU0MWs2VHdvYW9lR3VWL1lRYklCVVUvREJDWFY4d2czdUM1dFlsVXpVbmtu?=
 =?utf-8?B?VWgrVXNFc2pscGZLOWc3Ym1NZHNXbWtLSHJNTTlYcWpySGNiTHdUZjZXT1hz?=
 =?utf-8?B?UjVYTTdpeWZ2OTU4RXQ0NHpra1p6NERCYXdMdnp0cm9vTW03Yk9qMnZNUnRJ?=
 =?utf-8?B?ZlRRcUVSekszbGxFM1BURDBEVFVCWUc3S1FoeU9xNnZES25qdkprUWtnTkh6?=
 =?utf-8?B?RDhJYkd5UFBkYWZyYnhUVHRBWDNZUHd3eHNTNmxiWmVUZ0tDd3QxWHZVNEJS?=
 =?utf-8?B?TmYzc2FWMEpPK0JValZJZnRjUjJUckwwcDkrRDJNTjdwektFSGw1OTdGUFgw?=
 =?utf-8?B?Vi81WFh6MWhSbjNST3Eva0Evcm9EYTFZZHdvMXdYbzR3aG5yTml1TmlsRW9V?=
 =?utf-8?B?VmkveW9HWVlXNHBkRFJDZkZ0aVNiZzh2b1dnbmFHSnNWMDgvdGFjWFdXQ3VY?=
 =?utf-8?B?L2xnanZ1VHVvMTMzNUg3VS9ZdmVUZTlyQ0l1ZTI5SDRaTFY3d3JSay92N0k2?=
 =?utf-8?B?QU9PMGdQbzlLV2piZ0Z0SmYzbkdscmgyZFlTMWo2YUpEa0NaNGxMNHZVcmo0?=
 =?utf-8?B?VWQrVm1EcHVKeFRXemJlR0lVSDlHd1ZKVzNrc0dxU3paYzh6eWlRZDc0cWVS?=
 =?utf-8?B?UThid240dFFtc2hZekRLNXViMG5lMk5IOG1IMFBZOUVLZzZrTmZXWU51QU9C?=
 =?utf-8?Q?z4Xzv6y2YU46iGyxe/eUkqin1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5be42fa1-75cf-4172-59d6-08db030b6824
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2023 21:46:13.1668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iT4nEnR8V24G1FWbxm9qi2w4JCWqHP5HrjXI7ZIypycD5xyeQEeDPtloMQqn0aMZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8103
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The series is,

Acked-by: Luben Tuikov <luben.tuikov@amd.com>

We don't want the kernel to be in the business of retrying client's
requests. Instead we want the kernel to provide a conduit for such
requests to be sent, executed by the GPU, and a result returned.
If the kernel cannot process requests for any reason, e.g. GPU
is being reset, or in recovery, or OOM, or there's a problem with
the request, etc., the driver should return the request back to
the client (user space), and let the client decide how to proceed.

Regards,
Luben

On 2022-10-26 11:35, Christian König wrote:
> This reverts commit e6c6338f393b74ac0b303d567bb918b44ae7ad75.
> 
> This feature basically re-submits one job after another to
> figure out which one was the one causing a hang.
> 
> This is obviously incompatible with gang-submit which requires
> that multiple jobs run at the same time. It's also absolutely
> not helpful to crash the hardware multiple times if a clean
> recovery is desired.
> 
> For testing and debugging environments we should rather disable
> recovery alltogether to be able to inspect the state with a hw
> debugger.
> 
> Additional to that the sw implementation is clearly buggy and causes
> reference count issues for the hardware fence.
> 
> Signed-off-by: Christian König <christian.koenig@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 103 ---------------------
>  drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |   2 +-
>  drivers/gpu/drm/scheduler/sched_main.c     |  58 ++----------
>  include/drm/gpu_scheduler.h                |   3 -
>  4 files changed, 10 insertions(+), 156 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> index 6f958603c8cc..d4584e577b51 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> @@ -5070,94 +5070,6 @@ static int amdgpu_device_suspend_display_audio(struct amdgpu_device *adev)
>  	return 0;
>  }
>  
> -static void amdgpu_device_recheck_guilty_jobs(
> -	struct amdgpu_device *adev, struct list_head *device_list_handle,
> -	struct amdgpu_reset_context *reset_context)
> -{
> -	int i, r = 0;
> -
> -	for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
> -		struct amdgpu_ring *ring = adev->rings[i];
> -		int ret = 0;
> -		struct drm_sched_job *s_job;
> -
> -		if (!ring || !ring->sched.thread)
> -			continue;
> -
> -		s_job = list_first_entry_or_null(&ring->sched.pending_list,
> -				struct drm_sched_job, list);
> -		if (s_job == NULL)
> -			continue;
> -
> -		/* clear job's guilty and depend the folowing step to decide the real one */
> -		drm_sched_reset_karma(s_job);
> -		drm_sched_resubmit_jobs_ext(&ring->sched, 1);
> -
> -		if (!s_job->s_fence->parent) {
> -			DRM_WARN("Failed to get a HW fence for job!");
> -			continue;
> -		}
> -
> -		ret = dma_fence_wait_timeout(s_job->s_fence->parent, false, ring->sched.timeout);
> -		if (ret == 0) { /* timeout */
> -			DRM_ERROR("Found the real bad job! ring:%s, job_id:%llx\n",
> -						ring->sched.name, s_job->id);
> -
> -
> -			amdgpu_fence_driver_isr_toggle(adev, true);
> -
> -			/* Clear this failed job from fence array */
> -			amdgpu_fence_driver_clear_job_fences(ring);
> -
> -			amdgpu_fence_driver_isr_toggle(adev, false);
> -
> -			/* Since the job won't signal and we go for
> -			 * another resubmit drop this parent pointer
> -			 */
> -			dma_fence_put(s_job->s_fence->parent);
> -			s_job->s_fence->parent = NULL;
> -
> -			/* set guilty */
> -			drm_sched_increase_karma(s_job);
> -			amdgpu_reset_prepare_hwcontext(adev, reset_context);
> -retry:
> -			/* do hw reset */
> -			if (amdgpu_sriov_vf(adev)) {
> -				amdgpu_virt_fini_data_exchange(adev);
> -				r = amdgpu_device_reset_sriov(adev, false);
> -				if (r)
> -					adev->asic_reset_res = r;
> -			} else {
> -				clear_bit(AMDGPU_SKIP_HW_RESET,
> -					  &reset_context->flags);
> -				r = amdgpu_do_asic_reset(device_list_handle,
> -							 reset_context);
> -				if (r && r == -EAGAIN)
> -					goto retry;
> -			}
> -
> -			/*
> -			 * add reset counter so that the following
> -			 * resubmitted job could flush vmid
> -			 */
> -			atomic_inc(&adev->gpu_reset_counter);
> -			continue;
> -		}
> -
> -		/* got the hw fence, signal finished fence */
> -		atomic_dec(ring->sched.score);
> -		dma_fence_get(&s_job->s_fence->finished);
> -		dma_fence_signal(&s_job->s_fence->finished);
> -		dma_fence_put(&s_job->s_fence->finished);
> -
> -		/* remove node from list and free the job */
> -		spin_lock(&ring->sched.job_list_lock);
> -		list_del_init(&s_job->list);
> -		spin_unlock(&ring->sched.job_list_lock);
> -		ring->sched.ops->free_job(s_job);
> -	}
> -}
> -
>  static inline void amdgpu_device_stop_pending_resets(struct amdgpu_device *adev)
>  {
>  	struct amdgpu_ras *con = amdgpu_ras_get_context(adev);
> @@ -5178,7 +5090,6 @@ static inline void amdgpu_device_stop_pending_resets(struct amdgpu_device *adev)
>  
>  }
>  
> -
>  /**
>   * amdgpu_device_gpu_recover - reset the asic and recover scheduler
>   *
> @@ -5201,7 +5112,6 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>  	int i, r = 0;
>  	bool need_emergency_restart = false;
>  	bool audio_suspended = false;
> -	int tmp_vram_lost_counter;
>  	bool gpu_reset_for_dev_remove = false;
>  
>  	gpu_reset_for_dev_remove =
> @@ -5347,7 +5257,6 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>  		amdgpu_device_stop_pending_resets(tmp_adev);
>  	}
>  
> -	tmp_vram_lost_counter = atomic_read(&((adev)->vram_lost_counter));
>  	/* Actual ASIC resets if needed.*/
>  	/* Host driver will handle XGMI hive reset for SRIOV */
>  	if (amdgpu_sriov_vf(adev)) {
> @@ -5372,18 +5281,6 @@ int amdgpu_device_gpu_recover(struct amdgpu_device *adev,
>  	/* Post ASIC reset for all devs .*/
>  	list_for_each_entry(tmp_adev, device_list_handle, reset_list) {
>  
> -		/*
> -		 * Sometimes a later bad compute job can block a good gfx job as gfx
> -		 * and compute ring share internal GC HW mutually. We add an additional
> -		 * guilty jobs recheck step to find the real guilty job, it synchronously
> -		 * submits and pends for the first job being signaled. If it gets timeout,
> -		 * we identify it as a real guilty job.
> -		 */
> -		if (amdgpu_gpu_recovery == 2 &&
> -			!(tmp_vram_lost_counter < atomic_read(&adev->vram_lost_counter)))
> -			amdgpu_device_recheck_guilty_jobs(
> -				tmp_adev, device_list_handle, reset_context);
> -
>  		for (i = 0; i < AMDGPU_MAX_RINGS; ++i) {
>  			struct amdgpu_ring *ring = tmp_adev->rings[i];
>  
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 16f6a313335e..f177d8e5b665 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -519,7 +519,7 @@ module_param_named(compute_multipipe, amdgpu_compute_multipipe, int, 0444);
>   * DOC: gpu_recovery (int)
>   * Set to enable GPU recovery mechanism (1 = enable, 0 = disable). The default is -1 (auto, disabled except SRIOV).
>   */
> -MODULE_PARM_DESC(gpu_recovery, "Enable GPU recovery mechanism, (2 = advanced tdr mode, 1 = enable, 0 = disable, -1 = auto)");
> +MODULE_PARM_DESC(gpu_recovery, "Enable GPU recovery mechanism, (1 = enable, 0 = disable, -1 = auto)");
>  module_param_named(gpu_recovery, amdgpu_gpu_recovery, int, 0444);
>  
>  /**
> diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
> index e0ab14e0fb6b..bb28f31bff6f 100644
> --- a/drivers/gpu/drm/scheduler/sched_main.c
> +++ b/drivers/gpu/drm/scheduler/sched_main.c
> @@ -355,27 +355,6 @@ static void drm_sched_job_timedout(struct work_struct *work)
>  	}
>  }
>  
> - /**
> -  * drm_sched_increase_karma - Update sched_entity guilty flag
> -  *
> -  * @bad: The job guilty of time out
> -  *
> -  * Increment on every hang caused by the 'bad' job. If this exceeds the hang
> -  * limit of the scheduler then the respective sched entity is marked guilty and
> -  * jobs from it will not be scheduled further
> -  */
> -void drm_sched_increase_karma(struct drm_sched_job *bad)
> -{
> -	drm_sched_increase_karma_ext(bad, 1);
> -}
> -EXPORT_SYMBOL(drm_sched_increase_karma);
> -
> -void drm_sched_reset_karma(struct drm_sched_job *bad)
> -{
> -	drm_sched_increase_karma_ext(bad, 0);
> -}
> -EXPORT_SYMBOL(drm_sched_reset_karma);
> -
>  /**
>   * drm_sched_stop - stop the scheduler
>   *
> @@ -516,32 +495,15 @@ EXPORT_SYMBOL(drm_sched_start);
>   *
>   */
>  void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched)
> -{
> -	drm_sched_resubmit_jobs_ext(sched, INT_MAX);
> -}
> -EXPORT_SYMBOL(drm_sched_resubmit_jobs);
> -
> -/**
> - * drm_sched_resubmit_jobs_ext - helper to relunch certain number of jobs from mirror ring list
> - *
> - * @sched: scheduler instance
> - * @max: job numbers to relaunch
> - *
> - */
> -void drm_sched_resubmit_jobs_ext(struct drm_gpu_scheduler *sched, int max)
>  {
>  	struct drm_sched_job *s_job, *tmp;
>  	uint64_t guilty_context;
>  	bool found_guilty = false;
>  	struct dma_fence *fence;
> -	int i = 0;
>  
>  	list_for_each_entry_safe(s_job, tmp, &sched->pending_list, list) {
>  		struct drm_sched_fence *s_fence = s_job->s_fence;
>  
> -		if (i >= max)
> -			break;
> -
>  		if (!found_guilty && atomic_read(&s_job->karma) > sched->hang_limit) {
>  			found_guilty = true;
>  			guilty_context = s_job->s_fence->scheduled.context;
> @@ -551,7 +513,6 @@ void drm_sched_resubmit_jobs_ext(struct drm_gpu_scheduler *sched, int max)
>  			dma_fence_set_error(&s_fence->finished, -ECANCELED);
>  
>  		fence = sched->ops->run_job(s_job);
> -		i++;
>  
>  		if (IS_ERR_OR_NULL(fence)) {
>  			if (IS_ERR(fence))
> @@ -567,7 +528,7 @@ void drm_sched_resubmit_jobs_ext(struct drm_gpu_scheduler *sched, int max)
>  		}
>  	}
>  }
> -EXPORT_SYMBOL(drm_sched_resubmit_jobs_ext);
> +EXPORT_SYMBOL(drm_sched_resubmit_jobs);
>  
>  /**
>   * drm_sched_job_init - init a scheduler job
> @@ -1081,13 +1042,15 @@ void drm_sched_fini(struct drm_gpu_scheduler *sched)
>  EXPORT_SYMBOL(drm_sched_fini);
>  
>  /**
> - * drm_sched_increase_karma_ext - Update sched_entity guilty flag
> + * drm_sched_increase_karma - Update sched_entity guilty flag
>   *
>   * @bad: The job guilty of time out
> - * @type: type for increase/reset karma
>   *
> + * Increment on every hang caused by the 'bad' job. If this exceeds the hang
> + * limit of the scheduler then the respective sched entity is marked guilty and
> + * jobs from it will not be scheduled further
>   */
> -void drm_sched_increase_karma_ext(struct drm_sched_job *bad, int type)
> +void drm_sched_increase_karma(struct drm_sched_job *bad)
>  {
>  	int i;
>  	struct drm_sched_entity *tmp;
> @@ -1099,10 +1062,7 @@ void drm_sched_increase_karma_ext(struct drm_sched_job *bad, int type)
>  	 * corrupt but keep in mind that kernel jobs always considered good.
>  	 */
>  	if (bad->s_priority != DRM_SCHED_PRIORITY_KERNEL) {
> -		if (type == 0)
> -			atomic_set(&bad->karma, 0);
> -		else if (type == 1)
> -			atomic_inc(&bad->karma);
> +		atomic_inc(&bad->karma);
>  
>  		for (i = DRM_SCHED_PRIORITY_MIN; i < DRM_SCHED_PRIORITY_KERNEL;
>  		     i++) {
> @@ -1113,7 +1073,7 @@ void drm_sched_increase_karma_ext(struct drm_sched_job *bad, int type)
>  				if (bad->s_fence->scheduled.context ==
>  				    entity->fence_context) {
>  					if (entity->guilty)
> -						atomic_set(entity->guilty, type);
> +						atomic_set(entity->guilty, 1);
>  					break;
>  				}
>  			}
> @@ -1123,4 +1083,4 @@ void drm_sched_increase_karma_ext(struct drm_sched_job *bad, int type)
>  		}
>  	}
>  }
> -EXPORT_SYMBOL(drm_sched_increase_karma_ext);
> +EXPORT_SYMBOL(drm_sched_increase_karma);
> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
> index 0fca8f38bee4..c564be29c5ae 100644
> --- a/include/drm/gpu_scheduler.h
> +++ b/include/drm/gpu_scheduler.h
> @@ -488,10 +488,7 @@ void drm_sched_wakeup(struct drm_gpu_scheduler *sched);
>  void drm_sched_stop(struct drm_gpu_scheduler *sched, struct drm_sched_job *bad);
>  void drm_sched_start(struct drm_gpu_scheduler *sched, bool full_recovery);
>  void drm_sched_resubmit_jobs(struct drm_gpu_scheduler *sched);
> -void drm_sched_resubmit_jobs_ext(struct drm_gpu_scheduler *sched, int max);
>  void drm_sched_increase_karma(struct drm_sched_job *bad);
> -void drm_sched_reset_karma(struct drm_sched_job *bad);
> -void drm_sched_increase_karma_ext(struct drm_sched_job *bad, int type);
>  bool drm_sched_dependency_optimized(struct dma_fence* fence,
>  				    struct drm_sched_entity *entity);
>  void drm_sched_fault(struct drm_gpu_scheduler *sched);

-- 
Regards,
Luben

