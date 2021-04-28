Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9FAB36DF84
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 21:24:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44C576E14F;
	Wed, 28 Apr 2021 19:24:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D47FF6E134
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 19:24:12 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id h8so35532424edb.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 12:24:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=6gJkIDLV0W90z1ebpaGrCfj1lCotTEG4QJynvWjJSOU=;
 b=k3VMDCJHmVcoBxcvO+P1MP1N6QLQ9HJni6r4gkmPatzN1K0x+mHdFwF0fsx19zCaUK
 5e6Fx9Vb28uoRUIB72sootGQCvFCGKBSmomG8aLCYmWlxNIgWojM8GRoRP9zAS16limP
 hqDa2OY88xIkIj67saGjZrQTDZdIsRZq+EDUCaPiRRvlxmnb1yXdIcCCdPL8Syyn5R7I
 8LIsb/vfe315TMGVKFKlnbjtKSf+kpXzyuKM6huUguotVVWR37zixmABlunNYHMkJozv
 XnUlAKNnO1S0FehFdTczABZwyYT0qiye6hB7tT/1FGh1egl4+vprqEg4GTIfdRVwqaaZ
 ZeSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6gJkIDLV0W90z1ebpaGrCfj1lCotTEG4QJynvWjJSOU=;
 b=QBk0ISj675dDIfd7bueljMXwmDBqYPIbxj+Q2ifhXu67VxnIC8Sc1t6amQwJkGXSoq
 szWcWtT/FivZAbWURMRVy4qBfb7BSaRP4pLibzNDmVbVW8dWLzkdQgpqtUdBCF1QNwb7
 ZjnMR982fmD+FQEFXDqaPwNlWwVuLeexdT+RhFdmh75tFaAnfv3/LVUW8DzCspLEk043
 oKUpD7fEdw09EN2v7TRYAEav+BBCstidWAMv/F2iJdDtD/kH987a3GPslvB1ESzvtSGV
 zWIT/LR2wfmIYCV5hlnq82l61GDActuBt3BgtGlhfc9AGfV0uPu8BS6DroJ/yPq/60HI
 sw3Q==
X-Gm-Message-State: AOAM531CwSj9JSWzUmhWiBqDaAcKkCBD1bsui1F/9gCw6fEJ7FyuI8Zc
 lU9wqm/ZftWheU0AgyGpr1ec464rpNpeWosXlDER6qzVG+c=
X-Google-Smtp-Source: ABdhPJygmNMZsXZnWS3NuCG7FuesWAx1cfN/UoLo/uQ9kPNCyLqDllKJyiXTrdrlxcA/6tcm93C6UbkVoYtRM9XWph0=
X-Received: by 2002:a05:6402:b88:: with SMTP id
 cf8mr13495627edb.227.1619637851382; 
 Wed, 28 Apr 2021 12:24:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210427214913.46956-1-umesh.nerlige.ramappa@intel.com>
 <20210427214913.46956-2-umesh.nerlige.ramappa@intel.com>
 <875z064x5h.fsf@intel.com>
In-Reply-To: <875z064x5h.fsf@intel.com>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Wed, 28 Apr 2021 14:24:00 -0500
Message-ID: <CAOFGe94kk9N-MPKMF-T+5BCRiXuY7p1iQRquQx38pRQiqvazWg@mail.gmail.com>
Subject: Re: [PATCH 1/1] i915/query: Correlate engine and cpu timestamps with
 better accuracy
To: Jani Nikula <jani.nikula@linux.intel.com>
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris.p.wilson@intel.com>,
 Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 28, 2021 at 3:43 AM Jani Nikula <jani.nikula@linux.intel.com> wrote:
>
> On Tue, 27 Apr 2021, Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com> wrote:
> > Perf measurements rely on CPU and engine timestamps to correlate
> > events of interest across these time domains. Current mechanisms get
> > these timestamps separately and the calculated delta between these
> > timestamps lack enough accuracy.
> >
> > To improve the accuracy of these time measurements to within a few us,
> > add a query that returns the engine and cpu timestamps captured as
> > close to each other as possible.
>
> Cc: dri-devel, Jason and Daniel for review.

Thanks!

> >
> > v2: (Tvrtko)
> > - document clock reference used
> > - return cpu timestamp always
> > - capture cpu time just before lower dword of cs timestamp
> >
> > v3: (Chris)
> > - use uncore-rpm
> > - use __query_cs_timestamp helper
> >
> > v4: (Lionel)
> > - Kernel perf subsytem allows users to specify the clock id to be used
> >   in perf_event_open. This clock id is used by the perf subsystem to
> >   return the appropriate cpu timestamp in perf events. Similarly, let
> >   the user pass the clockid to this query so that cpu timestamp
> >   corresponds to the clock id requested.
> >
> > v5: (Tvrtko)
> > - Use normal ktime accessors instead of fast versions
> > - Add more uApi documentation
> >
> > v6: (Lionel)
> > - Move switch out of spinlock
> >
> > v7: (Chris)
> > - cs_timestamp is a misnomer, use cs_cycles instead
> > - return the cs cycle frequency as well in the query
> >
> > v8:
> > - Add platform and engine specific checks
> >
> > v9: (Lionel)
> > - Return 2 cpu timestamps in the query - captured before and after the
> >   register read
> >
> > v10: (Chris)
> > - Use local_clock() to measure time taken to read lower dword of
> >   register and return it to user.
> >
> > v11: (Jani)
> > - IS_GEN deprecated. User GRAPHICS_VER instead.
> >
> > Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> > ---
> >  drivers/gpu/drm/i915/i915_query.c | 145 ++++++++++++++++++++++++++++++
> >  include/uapi/drm/i915_drm.h       |  48 ++++++++++
> >  2 files changed, 193 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/i915/i915_query.c b/drivers/gpu/drm/i915/i915_query.c
> > index fed337ad7b68..2594b93901ac 100644
> > --- a/drivers/gpu/drm/i915/i915_query.c
> > +++ b/drivers/gpu/drm/i915/i915_query.c
> > @@ -6,6 +6,8 @@
> >
> >  #include <linux/nospec.h>
> >
> > +#include "gt/intel_engine_pm.h"
> > +#include "gt/intel_engine_user.h"
> >  #include "i915_drv.h"
> >  #include "i915_perf.h"
> >  #include "i915_query.h"
> > @@ -90,6 +92,148 @@ static int query_topology_info(struct drm_i915_private *dev_priv,
> >       return total_length;
> >  }
> >
> > +typedef u64 (*__ktime_func_t)(void);
> > +static __ktime_func_t __clock_id_to_func(clockid_t clk_id)
> > +{
> > +     /*
> > +      * Use logic same as the perf subsystem to allow user to select the
> > +      * reference clock id to be used for timestamps.
> > +      */
> > +     switch (clk_id) {
> > +     case CLOCK_MONOTONIC:
> > +             return &ktime_get_ns;
> > +     case CLOCK_MONOTONIC_RAW:
> > +             return &ktime_get_raw_ns;
> > +     case CLOCK_REALTIME:
> > +             return &ktime_get_real_ns;
> > +     case CLOCK_BOOTTIME:
> > +             return &ktime_get_boottime_ns;
> > +     case CLOCK_TAI:
> > +             return &ktime_get_clocktai_ns;
> > +     default:
> > +             return NULL;
> > +     }
> > +}
> > +
> > +static inline int
> > +__read_timestamps(struct intel_uncore *uncore,
> > +               i915_reg_t lower_reg,
> > +               i915_reg_t upper_reg,
> > +               u64 *cs_ts,
> > +               u64 *cpu_ts,
> > +               __ktime_func_t cpu_clock)
> > +{
> > +     u32 upper, lower, old_upper, loop = 0;
> > +
> > +     upper = intel_uncore_read_fw(uncore, upper_reg);
> > +     do {
> > +             cpu_ts[1] = local_clock();
> > +             cpu_ts[0] = cpu_clock();
> > +             lower = intel_uncore_read_fw(uncore, lower_reg);
> > +             cpu_ts[1] = local_clock() - cpu_ts[1];
> > +             old_upper = upper;
> > +             upper = intel_uncore_read_fw(uncore, upper_reg);
> > +     } while (upper != old_upper && loop++ < 2);
> > +
> > +     *cs_ts = (u64)upper << 32 | lower;
> > +
> > +     return 0;
> > +}
> > +
> > +static int
> > +__query_cs_cycles(struct intel_engine_cs *engine,
> > +               u64 *cs_ts, u64 *cpu_ts,
> > +               __ktime_func_t cpu_clock)
> > +{
> > +     struct intel_uncore *uncore = engine->uncore;
> > +     enum forcewake_domains fw_domains;
> > +     u32 base = engine->mmio_base;
> > +     intel_wakeref_t wakeref;
> > +     int ret;
> > +
> > +     fw_domains = intel_uncore_forcewake_for_reg(uncore,
> > +                                                 RING_TIMESTAMP(base),
> > +                                                 FW_REG_READ);
> > +
> > +     with_intel_runtime_pm(uncore->rpm, wakeref) {
> > +             spin_lock_irq(&uncore->lock);
> > +             intel_uncore_forcewake_get__locked(uncore, fw_domains);
> > +
> > +             ret = __read_timestamps(uncore,
> > +                                     RING_TIMESTAMP(base),
> > +                                     RING_TIMESTAMP_UDW(base),
> > +                                     cs_ts,
> > +                                     cpu_ts,
> > +                                     cpu_clock);
> > +
> > +             intel_uncore_forcewake_put__locked(uncore, fw_domains);
> > +             spin_unlock_irq(&uncore->lock);
> > +     }
> > +
> > +     return ret;
> > +}
> > +
> > +static int
> > +query_cs_cycles(struct drm_i915_private *i915,
> > +             struct drm_i915_query_item *query_item)
> > +{
> > +     struct drm_i915_query_cs_cycles __user *query_ptr;
> > +     struct drm_i915_query_cs_cycles query;
> > +     struct intel_engine_cs *engine;
> > +     __ktime_func_t cpu_clock;
> > +     int ret;
> > +
> > +     if (GRAPHICS_VER(i915) < 6)
> > +             return -ENODEV;
> > +
> > +     query_ptr = u64_to_user_ptr(query_item->data_ptr);
> > +     ret = copy_query_item(&query, sizeof(query), sizeof(query), query_item);
> > +     if (ret != 0)
> > +             return ret;
> > +
> > +     if (query.flags)
> > +             return -EINVAL;
> > +
> > +     if (query.rsvd)
> > +             return -EINVAL;
> > +
> > +     cpu_clock = __clock_id_to_func(query.clockid);
> > +     if (!cpu_clock)
> > +             return -EINVAL;
> > +
> > +     engine = intel_engine_lookup_user(i915,
> > +                                       query.engine.engine_class,
> > +                                       query.engine.engine_instance);
> > +     if (!engine)
> > +             return -EINVAL;
> > +
> > +     if (GRAPHICS_VER(i915) == 6 &&
> > +         query.engine.engine_class != I915_ENGINE_CLASS_RENDER)
> > +             return -ENODEV;
> > +
> > +     query.cs_frequency = engine->gt->clock_frequency;
> > +     ret = __query_cs_cycles(engine,
> > +                             &query.cs_cycles,
> > +                             query.cpu_timestamp,
> > +                             cpu_clock);
> > +     if (ret)
> > +             return ret;
> > +
> > +     if (put_user(query.cs_frequency, &query_ptr->cs_frequency))
> > +             return -EFAULT;
> > +
> > +     if (put_user(query.cpu_timestamp[0], &query_ptr->cpu_timestamp[0]))
> > +             return -EFAULT;
> > +
> > +     if (put_user(query.cpu_timestamp[1], &query_ptr->cpu_timestamp[1]))
> > +             return -EFAULT;
> > +
> > +     if (put_user(query.cs_cycles, &query_ptr->cs_cycles))
> > +             return -EFAULT;
> > +
> > +     return sizeof(query);
> > +}
> > +
> >  static int
> >  query_engine_info(struct drm_i915_private *i915,
> >                 struct drm_i915_query_item *query_item)
> > @@ -424,6 +568,7 @@ static int (* const i915_query_funcs[])(struct drm_i915_private *dev_priv,
> >       query_topology_info,
> >       query_engine_info,
> >       query_perf_config,
> > +     query_cs_cycles,
> >  };
> >
> >  int i915_query_ioctl(struct drm_device *dev, void *data, struct drm_file *file)
> > diff --git a/include/uapi/drm/i915_drm.h b/include/uapi/drm/i915_drm.h
> > index 6a34243a7646..08b00f1709b5 100644
> > --- a/include/uapi/drm/i915_drm.h
> > +++ b/include/uapi/drm/i915_drm.h
> > @@ -2230,6 +2230,10 @@ struct drm_i915_query_item {
> >  #define DRM_I915_QUERY_TOPOLOGY_INFO    1
> >  #define DRM_I915_QUERY_ENGINE_INFO   2
> >  #define DRM_I915_QUERY_PERF_CONFIG      3
> > +     /**
> > +      * Query Command Streamer timestamp register.
> > +      */
> > +#define DRM_I915_QUERY_CS_CYCLES     4
> >  /* Must be kept compact -- no holes and well documented */
> >
> >       /**
> > @@ -2397,6 +2401,50 @@ struct drm_i915_engine_info {
> >       __u64 rsvd1[4];
> >  };
> >
> > +/**
> > + * struct drm_i915_query_cs_cycles
> > + *
> > + * The query returns the command streamer cycles and the frequency that can be
> > + * used to calculate the command streamer timestamp. In addition the query
> > + * returns a set of cpu timestamps that indicate when the command streamer cycle
> > + * count was captured.
> > + */
> > +struct drm_i915_query_cs_cycles {
> > +     /** Engine for which command streamer cycles is queried. */
> > +     struct i915_engine_class_instance engine;

Why is this per-engine?  Do we actually expect it to change between
engines?  If so, we may have a problem because Vulkan expects a
unified timestamp domain for all command streamer timestamp queries.

--Jason


> > +     /** Must be zero. */
> > +     __u32 flags;
> > +
> > +     /**
> > +      * Command streamer cycles as read from the command streamer
> > +      * register at 0x358 offset.
> > +      */
> > +     __u64 cs_cycles;
> > +
> > +     /** Frequency of the cs cycles in Hz. */
> > +     __u64 cs_frequency;
> > +
> > +     /**
> > +      * CPU timestamps in ns. cpu_timestamp[0] is captured before reading the
> > +      * cs_cycles register using the reference clockid set by the user.
> > +      * cpu_timestamp[1] is the time taken in ns to read the lower dword of
> > +      * the cs_cycles register.
> > +      */
> > +     __u64 cpu_timestamp[2];
> > +
> > +     /**
> > +      * Reference clock id for CPU timestamp. For definition, see
> > +      * clock_gettime(2) and perf_event_open(2). Supported clock ids are
> > +      * CLOCK_MONOTONIC, CLOCK_MONOTONIC_RAW, CLOCK_REALTIME, CLOCK_BOOTTIME,
> > +      * CLOCK_TAI.
> > +      */
> > +     __s32 clockid;
> > +
> > +     /** Must be zero. */
> > +     __u32 rsvd;
> > +};
> > +
> >  /**
> >   * struct drm_i915_query_engine_info
> >   *
>
> --
> Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
