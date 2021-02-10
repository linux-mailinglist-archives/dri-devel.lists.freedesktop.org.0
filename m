Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6E0031692C
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 15:31:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5B566EC89;
	Wed, 10 Feb 2021 14:31:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D940C6EC89;
 Wed, 10 Feb 2021 14:31:07 +0000 (UTC)
IronPort-SDR: +UFi6S+kiyhzRiaMI5zWTekYSFh425l94NdZOaqEkYUbJX+O28tCeYMSLO+9G2EoRcbspkLnYM
 TbFl4VL5piuQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9890"; a="266919387"
X-IronPort-AV: E=Sophos;i="5.81,168,1610438400"; d="scan'208";a="266919387"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2021 06:31:07 -0800
IronPort-SDR: iokoZIAq5W+IsiPfGY0fW94n0g4TrEXc4wSF8e5IDWFjF0IZb6ZkO1c5yyZCXpUkztDKNPTE2o
 0h/LtnmMMKkA==
X-IronPort-AV: E=Sophos;i="5.81,168,1610438400"; d="scan'208";a="380123320"
Received: from bartoszo-mobl1.ger.corp.intel.com (HELO [10.252.56.156])
 ([10.252.56.156])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Feb 2021 06:31:05 -0800
Subject: Re: linux-next: build failure after merge of the drm-misc tree
To: Stephen Rothwell <sfr@canb.auug.org.au>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>
References: <20210210141138.11a6ad09@canb.auug.org.au>
From: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <670f6c7e-1f71-ffce-f9dd-07c7f6164c22@linux.intel.com>
Date: Wed, 10 Feb 2021 15:31:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210210141138.11a6ad09@canb.auug.org.au>
Content-Language: en-US
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
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>,
 Luben Tuikov <luben.tuikov@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Op 2021-02-10 om 04:11 schreef Stephen Rothwell:
> Hi all,
>
> After merging the drm-misc tree, today's linux-next build (x86_64
> allmodconfig) failed like this:
>
> drivers/gpu/drm/v3d/v3d_sched.c:263:1: error: return type is an incomplete type
>   263 | v3d_gpu_reset_for_timeout(struct v3d_dev *v3d, struct drm_sched_job *sched_job)
>       | ^~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/v3d/v3d_sched.c: In function 'v3d_gpu_reset_for_timeout':
> drivers/gpu/drm/v3d/v3d_sched.c:289:9: error: 'return' with a value, in function returning void [-Werror=return-type]
>   289 |  return DRM_GPU_SCHED_STAT_NOMINAL;
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/v3d/v3d_sched.c:263:1: note: declared here
>   263 | v3d_gpu_reset_for_timeout(struct v3d_dev *v3d, struct drm_sched_job *sched_job)
>       | ^~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/v3d/v3d_sched.c: At top level:
> drivers/gpu/drm/v3d/v3d_sched.c:298:1: error: return type is an incomplete type
>   298 | v3d_cl_job_timedout(struct drm_sched_job *sched_job, enum v3d_queue q,
>       | ^~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/v3d/v3d_sched.c: In function 'v3d_cl_job_timedout':
> drivers/gpu/drm/v3d/v3d_sched.c:309:10: error: 'return' with a value, in function returning void [-Werror=return-type]
>   309 |   return DRM_GPU_SCHED_STAT_NOMINAL;
>       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/v3d/v3d_sched.c:298:1: note: declared here
>   298 | v3d_cl_job_timedout(struct drm_sched_job *sched_job, enum v3d_queue q,
>       | ^~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/v3d/v3d_sched.c: At top level:
> drivers/gpu/drm/v3d/v3d_sched.c:316:1: error: return type is an incomplete type
>   316 | v3d_bin_job_timedout(struct drm_sched_job *sched_job)
>       | ^~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/v3d/v3d_sched.c:325:1: error: return type is an incomplete type
>   325 | v3d_render_job_timedout(struct drm_sched_job *sched_job)
>       | ^~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/v3d/v3d_sched.c:334:1: error: return type is an incomplete type
>   334 | v3d_generic_job_timedout(struct drm_sched_job *sched_job)
>       | ^~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/v3d/v3d_sched.c:342:1: error: return type is an incomplete type
>   342 | v3d_csd_job_timedout(struct drm_sched_job *sched_job)
>       | ^~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/v3d/v3d_sched.c: In function 'v3d_csd_job_timedout':
> drivers/gpu/drm/v3d/v3d_sched.c:353:10: error: 'return' with a value, in function returning void [-Werror=return-type]
>   353 |   return DRM_GPU_SCHED_STAT_NOMINAL;
>       |          ^~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/v3d/v3d_sched.c:342:1: note: declared here
>   342 | v3d_csd_job_timedout(struct drm_sched_job *sched_job)
>       | ^~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/v3d/v3d_sched.c: At top level:
> drivers/gpu/drm/v3d/v3d_sched.c:362:18: error: initialization of 'enum drm_gpu_sched_stat (*)(struct drm_sched_job *)' from incompatible pointer type 'void (*)(struct drm_sched_job *)' [-Werror=incompatible-pointer-types]
>   362 |  .timedout_job = v3d_bin_job_timedout,
>       |                  ^~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/v3d/v3d_sched.c:362:18: note: (near initialization for 'v3d_bin_sched_ops.timedout_job')
> drivers/gpu/drm/v3d/v3d_sched.c:369:18: error: initialization of 'enum drm_gpu_sched_stat (*)(struct drm_sched_job *)' from incompatible pointer type 'void (*)(struct drm_sched_job *)' [-Werror=incompatible-pointer-types]
>   369 |  .timedout_job = v3d_render_job_timedout,
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/v3d/v3d_sched.c:369:18: note: (near initialization for 'v3d_render_sched_ops.timedout_job')
> drivers/gpu/drm/v3d/v3d_sched.c:376:18: error: initialization of 'enum drm_gpu_sched_stat (*)(struct drm_sched_job *)' from incompatible pointer type 'void (*)(struct drm_sched_job *)' [-Werror=incompatible-pointer-types]
>   376 |  .timedout_job = v3d_generic_job_timedout,
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/v3d/v3d_sched.c:376:18: note: (near initialization for 'v3d_tfu_sched_ops.timedout_job')
> drivers/gpu/drm/v3d/v3d_sched.c:383:18: error: initialization of 'enum drm_gpu_sched_stat (*)(struct drm_sched_job *)' from incompatible pointer type 'void (*)(struct drm_sched_job *)' [-Werror=incompatible-pointer-types]
>   383 |  .timedout_job = v3d_csd_job_timedout,
>       |                  ^~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/v3d/v3d_sched.c:383:18: note: (near initialization for 'v3d_csd_sched_ops.timedout_job')
> drivers/gpu/drm/v3d/v3d_sched.c:390:18: error: initialization of 'enum drm_gpu_sched_stat (*)(struct drm_sched_job *)' from incompatible pointer type 'void (*)(struct drm_sched_job *)' [-Werror=incompatible-pointer-types]
>   390 |  .timedout_job = v3d_generic_job_timedout,
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/v3d/v3d_sched.c:390:18: note: (near initialization for 'v3d_cache_clean_sched_ops.timedout_job')
>
> Caused by commit
>
>   c10983e14e8f ("drm/scheduler: Job timeout handler returns status (v3)")
>
> I have used the drm-misc tree from next-20210209 for today.
>
Hey,

I reverted the commit in drm-misc-next-fixes. It should be good now. :)

I must have accidentally cherry picked it when grabbing all fixes.

~Maarten

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
