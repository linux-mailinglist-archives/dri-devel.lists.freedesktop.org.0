Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 115557AFD91
	for <lists+dri-devel@lfdr.de>; Wed, 27 Sep 2023 10:05:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1599D10E1A9;
	Wed, 27 Sep 2023 08:05:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2042.outbound.protection.outlook.com [40.107.244.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E9A910E1A9
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Sep 2023 08:05:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SINi7ySiNkdLctiEmOX8XmXtFi5uboDmaWKsEuVZNN2tHo7KbZhTIYagmFfv/eXi+GtmONsy9yvvW5iAKPSex4pRCqq9Z9uMEmHtETA/uvYr5NVy0xjnSfQqTJdysYQPfztFAT6dCUvcp+hY3pmLojF5dJEs2k9fZp8ZHzhGFdQyzj4JuYPcBAkNN9oE6tCGqyUfoUXsSkVSxYIPRM0OBZ+VNbtn9B5ZIekeq6goSGua5w9pODm+/F3+1Yw4u2jnCOP5NpfyCS3bZ6yfIr6MlBbR3b4rMzEHE2XqXUY8zLvJUKkQ/3zTgL8qZ2APp5IX/rL/4HIilknCdB+tJmoMmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D3CBqyYkT6pKhbTuW8LrA7/ArSJTV8tSQdvnbz53BdI=;
 b=B2oLVqwm90tJ47UiFTslWT6UomDdsuWIbFwTgSLJhxQZmJcpthTrq5sxbErW+cTVT09E2K5bUfo/YeMvScDBnss80brI/e38J4pXrGd60pqYPenSHTogd/+6lffoNH2cmUJjvdkqvE0GsTRMVm8Mv0HgsKP9j60isXUQgUkaCP8hJzgwxMqv2SYgci/N93sy85vFtwXblQOvuEBZ2JqI7/mNXT1Yvk6zm1UcsgmNIjSaRzRffWNtPltpjqHyvfxsmz1tN/V1EV1MnBFSbGsELBKKTUyu14XN1Slmj7CinFJQPW3s4gRDoIBy0Pp+XOuIpIwVYA3gzlpbiYzvh8jvag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D3CBqyYkT6pKhbTuW8LrA7/ArSJTV8tSQdvnbz53BdI=;
 b=tRD33Z/KZoGBk2XcYfjSSw5BzcdRv92MfRDChKv0aJB4CUggHtYIghZtBhS4kzjvnrqiyDtN6T8W7wRc5o7RZJG4poLnDl0M4k+5wP5kybjotT8Ye8LrSK5ZoeYKjPxb+7PxIY//jO1qtiMYWNE0CvdfyolgLNK7Oe6jGcBK1C4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH2PR12MB4151.namprd12.prod.outlook.com (2603:10b6:610:78::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6838.21; Wed, 27 Sep
 2023 08:05:11 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::a7fa:4411:67a3:131d%4]) with mapi id 15.20.6838.016; Wed, 27 Sep 2023
 08:05:10 +0000
Message-ID: <c2ffc21e-bf92-81f6-aa9b-233e3475025f@amd.com>
Date: Wed, 27 Sep 2023 10:04:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH] drm/atomic: Perform blocking commits on workqueue
Content-Language: en-US
To: Ray Strode <halfline@gmail.com>, dri-devel@lists.freedesktop.org
References: <20230926170549.2589045-1-halfline@gmail.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230926170549.2589045-1-halfline@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0154.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ba::7) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CH2PR12MB4151:EE_
X-MS-Office365-Filtering-Correlation-Id: cb133d0e-e0b9-43a8-2871-08dbbf307855
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IZYTCW0MuYbLt1WKJO/2miPdFr+zkE6hChyQFnIp7nWnb4zPndGL0x4/4qIy2l2Q1ClDN3S9BpzGgFclZZ5S1cwnG8UsmAaWhTRmKr7kUIlC9qseoPuZtI3h/66oT9HNT2crVw/3Wl0Au/2EgLOdaI+Sfl20ThKt+bDc9bG+30H4DZQruINIX/F5o/xVROMlse/dw+gvb2akNB7CxvtZGhAG7OvBNXIbHOyg4d/jZDzFtaudhv8zyA3qJ3YTlwbrr1bGYQh49TER5Z2yesnKN8mWfQBj8vtCZ+hSDVxDAsF1X4HVxP8kgzXVZDfSgJvilw6wcv+GB7GpCauu8zxYEdz6wGFiMwS+SaH67kuUsHwWoZ54op6deho1LrZKD2tdm/Muu1iQ0yFLmLfr6vUJlzXT2Mxpo49zbQ9lLUzAENsS+Dpy3i4pLMlgYCJcIpyxE1da8tBp9ddX8uOVdsEDwimwJoz/DRqTyr1wfzcanBUSnWnS47T1qmPMR/2XEhKgAWyVzYjnaBV2s7Knv0LfMa8VJIejcn4Vnmyd99xNprYXEkOS0E17hy/ESQW7OEfGjJxSPbMryo5WzEDGFJUOHRU9EWmL9VOfcCoApmcMyOWYs2MryYkCg8wXXziBC7sF
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(396003)(136003)(366004)(346002)(376002)(39860400002)(230922051799003)(451199024)(1800799009)(186009)(86362001)(31696002)(38100700002)(36756003)(2906002)(6666004)(478600001)(966005)(6486002)(6512007)(6506007)(26005)(2616005)(66946007)(5660300002)(66556008)(316002)(8936002)(8676002)(4326008)(41300700001)(66476007)(31686004)(83380400001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1lUL3dzeS9Kai9oNmVyclhIZDU4VE16OTAxc01XNEJOWW5rTFdEZTdjaHB4?=
 =?utf-8?B?Q2Uxa2F5TnhHejRmdDVlVHF3a0NZb05wM2tvNktpZ0dhWXBKY3M4ODhSa1NZ?=
 =?utf-8?B?RVNlYU0vWk5RMVJPRUI2NXYvVFNzNTczdUxZTDJHMFB0YTNFWi85ay9temZI?=
 =?utf-8?B?KzNXZ2RlbmRjUUZUeTllTHhkSjBLbXQwcUhGempGdVRuZktQL2VHMWZpNlI3?=
 =?utf-8?B?bU5vbDZVTUROeHdXSmFINEtWcDR1YkdiejBRS2t4ZlRoekVwRTZpenZKUWZO?=
 =?utf-8?B?ZW5wK0xPVlJoYm5MUVNGWi82NUQ4UElYbXVBOWM5emRoU2hWKzBZN2ErSTJ1?=
 =?utf-8?B?OEJRb0hMM3pSMHcwVDFMeHduS0hVZTNxcFc3Z2FDZzRQL0VqWi9iaFord3Vp?=
 =?utf-8?B?M3k5MkFjU1p6MU12Y0Q2OU1RUnVUYTJxSG5HVE9iZU9WS0YwcitoT1ZaOXpj?=
 =?utf-8?B?MW5Idi9yQy9mL0pYNU04TzRyYUdpOGk0S2J6QmlSMHRlaTh2RnVuSHdTK2hh?=
 =?utf-8?B?L0NzRnE2OHIrc1VjRisvakUvU2h1bHJtQ29NU2lLOU9vb29IRmNjaGQ1VGRQ?=
 =?utf-8?B?L2ZIdlNKV3RKdFlrREZ3K0JaVzA1TDU5TldNcXI4ZnZ6YTFyay9ZU3kveHNM?=
 =?utf-8?B?MXVoK1hjSEVNNWcrditIZVdpc1BwQW1IZHBmSUlWTlIxbGYwQTJ0eUdFRjFX?=
 =?utf-8?B?bVhGeUJ1dERyd3ZYOERndmtpZzNpNVVtSFBib3B2VE1SR0ZseDVLelR4ME1x?=
 =?utf-8?B?bmU1b0dzTnladVBWQ2EveDBUSzIxTlJYMGNvcDQwMEZzaUhMUlN4VlROMFZz?=
 =?utf-8?B?TWFMZUNoVGtENDZDTnhwdTUwTXRmNDBBZ1lsNVZlTE1RUGRDaERvNUxuM2hZ?=
 =?utf-8?B?eHlwakg4L05BVmRaTHRxUXdSUXdRMlcrQUJLTThZei9NcFBxVk54b2FFb3Bz?=
 =?utf-8?B?alF2MjY5ZzBJcmRLVUwrVXlFUFJHdjVXUXA4S3JWalJSRytuSHhrZm5JWFM0?=
 =?utf-8?B?UERiai9kdHc5WHZCYXhQQ3ROc09jbDgzdW56YkcwUytUV2JBM2ZMb2MxQStm?=
 =?utf-8?B?MjgxWHd0MzdHWDZQSGhJZ09xRmJWQXRGWmRmc0VGYVRyWXFuSXlyUFBVQUxI?=
 =?utf-8?B?NXJ4UlFTYnNNSUIzTDFUL2MvR2NlRFludmNzZ3RtbGRPM1ZacUROZTFCZ2ov?=
 =?utf-8?B?RHd0aVp4NU1BemZpUlN0ZlhNazNFM3haN3BUN3VnenlFUUx2QzVIMkRiQU53?=
 =?utf-8?B?ZWRzYjVFVVUwWDBFKzVzRlhJcUdmdDVKcEkzVjBPM2pGd1ZuWHYrSmkvOGRT?=
 =?utf-8?B?K2FiWWZGT29CNzJlTThHWlJadWRueVlJT1FFdEJrc1dob2tKNVREbXRXa2g0?=
 =?utf-8?B?ZWdwN1hIaFBGeXlNQUlidGJDZllqRFdmai9kUFovMTB6RmV4VGhvTCtUWGl6?=
 =?utf-8?B?TkM3eUJmRUk2WnNMdU9NZldKV3huRW92VmJacDJDSUlrbk5HeXRxQVVrenNZ?=
 =?utf-8?B?U3NGUy9OUDZUR3hialhCT2hIUC8rNGhnQ0NvOC83NzdCa09JYkZONjVabHdW?=
 =?utf-8?B?a2U0MUgySFNRcitGckw4VnlFeUVtQkRvME8xRUZtbkhES3VqclVjTTFPbE42?=
 =?utf-8?B?UVVVbnRXank3OUJPWUtlRi9xM1IrZVJsRkVVUDRYMmlaRGovSGdOK09FYSs1?=
 =?utf-8?B?NW9vUWRLSDZHS3kvdERDM0duTCt4RXhFbWErVC9CS1ZVdUF0R1JzQlREb3pl?=
 =?utf-8?B?ZTQ3eHBxb0g2N1k2TVhjZ1dYZTdWczJ5d2lJTzhzUXphbDV6NGk2RklMWHpN?=
 =?utf-8?B?eHVnRlBpM1l6KzZ5dGU0bTVyTVFuL1g5eGR0Z3c3ZHIxSDVqNUUrRHpkZFBy?=
 =?utf-8?B?WVRJSzR0amFUTEQxK3JQV0t2QkJYTEkrSHZGQzB3T2ZhTDNkUEVHTWlMMWdX?=
 =?utf-8?B?eTdBdExRdkVlSkdUOHk0eVFFUmVWRDZITU90d2RIeDJpNDVtdEVpSUVhTnN2?=
 =?utf-8?B?Rk1pN2ZMUzB4c2VjajV1ZjNQQlg1ajYyVWJnRHVlcjZ3ZVdFWU9IeG4vQWIw?=
 =?utf-8?B?Umt0UURNd0d1TTVDLzJxK2JRZWNJOUF4bUhNTi9hazRRSDM2cHZIY25OQWg3?=
 =?utf-8?Q?gSer5ytMARkumJlOM39cqY1mm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cb133d0e-e0b9-43a8-2871-08dbbf307855
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2023 08:05:10.2216 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ESjRlQJK86a2nKMJIiZN1ivUTQ4ZTtAKpQl2wWweb3KUPrZ+j1Veyhmm6tQGgxWM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4151
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
Cc: Ray Strode <rstrode@redhat.com>, daniel.vetter@ffwll.ch, Xinhui.Pan@amd.com,
 mdaenzer@redhat.com, alexander.deucher@amd.com, airlied@redhat.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 26.09.23 um 19:05 schrieb Ray Strode:
> From: Ray Strode <rstrode@redhat.com>
>
> A drm atomic commit can be quite slow on some hardware. It can lead
> to a lengthy queue of commands that need to get processed and waited
> on before control can go back to user space.
>
> If user space is a real-time thread, that delay can have severe
> consequences, leading to the process getting killed for exceeding
> rlimits.
>
> This commit addresses the problem by always running the slow part of
> a commit on a workqueue, separated from the task initiating the
> commit.
>
> This change makes the nonblocking and blocking paths work in the same way,
> and as a result allows the task to sleep and not use up its
> RLIMIT_RTTIME allocation.

Well this patch made me laugh :)

I'm not an expert for that stuff, but as far as I know the whole purpose 
of the blocking functionality is to make sure that the CPU overhead 
caused by the commit is accounted to the right process.

So what you are suggesting here is to actually break that functionality 
and that doesn't seem to make sense.

When it's really not desirable to account the CPU overhead to the 
process initiating it then you probably rather want to use an non 
blocking commit plus a dma_fence to wait for the work to end from userspace.

Regards,
Christian.

>
> Link: https://gitlab.freedesktop.org/drm/amd/-/issues/2861
> Signed-off-by: Ray Strode <rstrode@redhat.com>
> ---
>   drivers/gpu/drm/drm_atomic_helper.c | 7 +++----
>   1 file changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 292e38eb6218..1a1e68d98d38 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -2028,64 +2028,63 @@ int drm_atomic_helper_commit(struct drm_device *dev,
>   	 * This is the point of no return - everything below never fails except
>   	 * when the hw goes bonghits. Which means we can commit the new state on
>   	 * the software side now.
>   	 */
>   
>   	ret = drm_atomic_helper_swap_state(state, true);
>   	if (ret)
>   		goto err;
>   
>   	/*
>   	 * Everything below can be run asynchronously without the need to grab
>   	 * any modeset locks at all under one condition: It must be guaranteed
>   	 * that the asynchronous work has either been cancelled (if the driver
>   	 * supports it, which at least requires that the framebuffers get
>   	 * cleaned up with drm_atomic_helper_cleanup_planes()) or completed
>   	 * before the new state gets committed on the software side with
>   	 * drm_atomic_helper_swap_state().
>   	 *
>   	 * This scheme allows new atomic state updates to be prepared and
>   	 * checked in parallel to the asynchronous completion of the previous
>   	 * update. Which is important since compositors need to figure out the
>   	 * composition of the next frame right after having submitted the
>   	 * current layout.
>   	 *
>   	 * NOTE: Commit work has multiple phases, first hardware commit, then
>   	 * cleanup. We want them to overlap, hence need system_unbound_wq to
>   	 * make sure work items don't artificially stall on each another.
>   	 */
>   
>   	drm_atomic_state_get(state);
> -	if (nonblock)
> -		queue_work(system_unbound_wq, &state->commit_work);
> -	else
> -		commit_tail(state);
> +	queue_work(system_unbound_wq, &state->commit_work);
> +	if (!nonblock)
> +		flush_work(&state->commit_work);
>   
>   	return 0;
>   
>   err:
>   	drm_atomic_helper_cleanup_planes(dev, state);
>   	return ret;
>   }
>   EXPORT_SYMBOL(drm_atomic_helper_commit);
>   
>   /**
>    * DOC: implementing nonblocking commit
>    *
>    * Nonblocking atomic commits should use struct &drm_crtc_commit to sequence
>    * different operations against each another. Locks, especially struct
>    * &drm_modeset_lock, should not be held in worker threads or any other
>    * asynchronous context used to commit the hardware state.
>    *
>    * drm_atomic_helper_commit() implements the recommended sequence for
>    * nonblocking commits, using drm_atomic_helper_setup_commit() internally:
>    *
>    * 1. Run drm_atomic_helper_prepare_planes(). Since this can fail and we
>    * need to propagate out of memory/VRAM errors to userspace, it must be called
>    * synchronously.
>    *
>    * 2. Synchronize with any outstanding nonblocking commit worker threads which
>    * might be affected by the new state update. This is handled by
>    * drm_atomic_helper_setup_commit().
>    *
>    * Asynchronous workers need to have sufficient parallelism to be able to run
>    * different atomic commits on different CRTCs in parallel. The simplest way to

