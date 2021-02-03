Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 921BC30DB12
	for <lists+dri-devel@lfdr.de>; Wed,  3 Feb 2021 14:26:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4BF76EAC1;
	Wed,  3 Feb 2021 13:26:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B139A6EABF;
 Wed,  3 Feb 2021 13:26:03 +0000 (UTC)
IronPort-SDR: e5cdya8YdREf9vQb8toSBX9BjO15O+6o1z/myY2H1Fr5L7A0cMgL/oHGxa6T6KG2kOpiRmJd4N
 8aOOp+Hs9ZGA==
X-IronPort-AV: E=McAfee;i="6000,8403,9883"; a="180264614"
X-IronPort-AV: E=Sophos;i="5.79,398,1602572400"; d="scan'208";a="180264614"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 05:26:03 -0800
IronPort-SDR: Eu5nionr3ZKY/uqBe+FJWQLroZIX1hROzBeg/E3a3KTGYY+7uAK16Xt+A5i4t02bVwQBmq2KNt
 IwXeUbFKTc7w==
X-IronPort-AV: E=Sophos;i="5.79,398,1602572400"; d="scan'208";a="582732182"
Received: from jconneax-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.21.179])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Feb 2021 05:25:58 -0800
MIME-Version: 1.0
In-Reply-To: <20210126214626.16260-8-brian.welty@intel.com>
References: <20210126214626.16260-1-brian.welty@intel.com>
 <20210126214626.16260-8-brian.welty@intel.com>
To: Christian König <christian.koenig@amd.com>, Brian Welty <brian.welty@intel.com>, Chris Wilson <chris@chris-wilson.co.uk>, Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>, Eero Tamminen <eero.t.tamminen@intel.com>, Kenny Ho <Kenny.Ho@amd.com>, Tejun Heo <tj@kernel.org>, Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, amd-gfx@lists.freedesktop.org, cgroups@vger.kernel.org, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Subject: Re: [RFC PATCH 7/9] drmcg: Add initial support for tracking gpu time
 usage
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <161235875541.15744.14541970842808007912@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Wed, 03 Feb 2021 15:25:55 +0200
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Brian Welty (2021-01-26 23:46:24)
> Single control below is added to DRM cgroup controller in order to track
> user execution time for GPU devices.  It is up to device drivers to
> charge execution time to the cgroup via drm_cgroup_try_charge().
> 
>   sched.runtime
>       Read-only value, displays current user execution time for each DRM
>       device. The expectation is that this is incremented by DRM device
>       driver's scheduler upon user context completion or context switch.
>       Units of time are in microseconds for consistency with cpu.stats.

Were not we also planning for a percentage style budgeting?

Capping the maximum runtime is definitely useful, but in order to
configure a system for peaceful co-existence of two or more workloads we
must also impose a limit on how big portion of the instantaneous
capacity can be used.

Regards, Joonas

> Signed-off-by: Brian Welty <brian.welty@intel.com>
> ---
>  Documentation/admin-guide/cgroup-v2.rst |  9 +++++++++
>  include/drm/drm_cgroup.h                |  2 ++
>  include/linux/cgroup_drm.h              |  2 ++
>  kernel/cgroup/drm.c                     | 20 ++++++++++++++++++++
>  4 files changed, 33 insertions(+)
> 
> diff --git a/Documentation/admin-guide/cgroup-v2.rst b/Documentation/admin-guide/cgroup-v2.rst
> index ccc25f03a898..f1d0f333a49e 100644
> --- a/Documentation/admin-guide/cgroup-v2.rst
> +++ b/Documentation/admin-guide/cgroup-v2.rst
> @@ -2205,6 +2205,15 @@ thresholds are hit, this would then allow the DRM device driver to invoke
>  some equivalent to OOM-killer or forced memory eviction for the device
>  backed memory in order to attempt to free additional space.
>  
> +The below set of control files are for time accounting of DRM devices. Units
> +of time are in microseconds.
> +
> +  sched.runtime
> +        Read-only value, displays current user execution time for each DRM
> +        device. The expectation is that this is incremented by DRM device
> +        driver's scheduler upon user context completion or context switch.
> +
> +
>  Misc
>  ----
>  
> diff --git a/include/drm/drm_cgroup.h b/include/drm/drm_cgroup.h
> index 9ba0e372eeee..315dab8a93b8 100644
> --- a/include/drm/drm_cgroup.h
> +++ b/include/drm/drm_cgroup.h
> @@ -22,6 +22,7 @@ enum drmcg_res_type {
>         DRMCG_TYPE_MEM_CURRENT,
>         DRMCG_TYPE_MEM_MAX,
>         DRMCG_TYPE_MEM_TOTAL,
> +       DRMCG_TYPE_SCHED_RUNTIME,
>         __DRMCG_TYPE_LAST,
>  };
>  
> @@ -79,5 +80,6 @@ void drm_cgroup_uncharge(struct drmcg *drmcg,struct drm_device *dev,
>                          enum drmcg_res_type type, u64 usage)
>  {
>  }
> +
>  #endif /* CONFIG_CGROUP_DRM */
>  #endif /* __DRM_CGROUP_H__ */
> diff --git a/include/linux/cgroup_drm.h b/include/linux/cgroup_drm.h
> index 3570636473cf..0fafa663321e 100644
> --- a/include/linux/cgroup_drm.h
> +++ b/include/linux/cgroup_drm.h
> @@ -19,6 +19,8 @@
>   */
>  struct drmcg_device_resource {
>         struct page_counter memory;
> +       seqlock_t sched_lock;
> +       u64 exec_runtime;
>  };
>  
>  /**
> diff --git a/kernel/cgroup/drm.c b/kernel/cgroup/drm.c
> index 08e75eb67593..64e9d0dbe8c8 100644
> --- a/kernel/cgroup/drm.c
> +++ b/kernel/cgroup/drm.c
> @@ -81,6 +81,7 @@ static inline int init_drmcg_single(struct drmcg *drmcg, struct drm_device *dev)
>         /* set defaults here */
>         page_counter_init(&ddr->memory,
>                           parent_ddr ? &parent_ddr->memory : NULL);
> +       seqlock_init(&ddr->sched_lock);
>         drmcg->dev_resources[minor] = ddr;
>  
>         return 0;
> @@ -287,6 +288,10 @@ static int drmcg_seq_show_fn(int id, void *ptr, void *data)
>                 seq_printf(sf, "%d:%d %llu\n", DRM_MAJOR, minor->index,
>                            minor->dev->drmcg_props.memory_total);
>                 break;
> +       case DRMCG_TYPE_SCHED_RUNTIME:
> +               seq_printf(sf, "%d:%d %llu\n", DRM_MAJOR, minor->index,
> +                          ktime_to_us(ddr->exec_runtime));
> +               break;
>         default:
>                 seq_printf(sf, "%d:%d\n", DRM_MAJOR, minor->index);
>                 break;
> @@ -384,6 +389,12 @@ struct cftype files[] = {
>                 .private = DRMCG_TYPE_MEM_TOTAL,
>                 .flags = CFTYPE_ONLY_ON_ROOT,
>         },
> +       {
> +               .name = "sched.runtime",
> +               .seq_show = drmcg_seq_show,
> +               .private = DRMCG_TYPE_SCHED_RUNTIME,
> +               .flags = CFTYPE_NOT_ON_ROOT,
> +       },
>         { }     /* terminate */
>  };
>  
> @@ -440,6 +451,10 @@ EXPORT_SYMBOL(drmcg_device_early_init);
>   * choose to enact some form of memory reclaim, but the exact behavior is left
>   * to the DRM device driver to define.
>   *
> + * For @res type of DRMCG_TYPE_SCHED_RUNTIME:
> + * For GPU time accounting, add @usage amount of GPU time to @drmcg for
> + * the given device.
> + *
>   * Returns 0 on success.  Otherwise, an error code is returned.
>   */
>  int drm_cgroup_try_charge(struct drmcg *drmcg, struct drm_device *dev,
> @@ -466,6 +481,11 @@ int drm_cgroup_try_charge(struct drmcg *drmcg, struct drm_device *dev,
>                         err = 0;
>                 }
>                 break;
> +       case DRMCG_TYPE_SCHED_RUNTIME:
> +               write_seqlock(&res->sched_lock);
> +               res->exec_runtime = ktime_add(res->exec_runtime, usage);
> +               write_sequnlock(&res->sched_lock);
> +               break;
>         default:
>                 err = -EINVAL;
>                 break;
> -- 
> 2.20.1
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
