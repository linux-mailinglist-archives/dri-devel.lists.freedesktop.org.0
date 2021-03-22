Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 59B7034496B
	for <lists+dri-devel@lfdr.de>; Mon, 22 Mar 2021 16:39:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25D5689444;
	Mon, 22 Mar 2021 15:38:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com
 [IPv6:2607:f8b0:4864:20::836])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 591A789444;
 Mon, 22 Mar 2021 15:38:58 +0000 (UTC)
Received: by mail-qt1-x836.google.com with SMTP id c6so12646168qtc.1;
 Mon, 22 Mar 2021 08:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q5Ft5lLSDaaxbDQPFOK0eIFQBb3jzsyJPgsCkWhfbtM=;
 b=J2EO49ifEv2cKS6X3/HI/5pLJRAh2nVCnbC/myzg7CBUv6OqIYWkcGQcTrqS7UVCen
 zQ//FRb88kI45bvVtZ2hJYROEjBOv0LWO4WXb9c5/CpMmjaJtL+SIY3CAGvLZIgNzJ74
 H1Cl1uUGt4bU5LyPe7ZevQUWMfxwq505U30qWzmjxeztv2geIElRGRiIlRwN0jGwfoFf
 yJBRYOK3Z5a2c1bcbFQAH8D3Zmgv7Ohz8Vc92K0NuFzxe0ACDFV4oYGI4RmSLQI5c4+7
 yj20/PvVqAk5+VXsnercY1693a/M/v6XTnG/d8rypJDfCJLJh02QclOfHAzvuNQ08mEE
 Gm/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q5Ft5lLSDaaxbDQPFOK0eIFQBb3jzsyJPgsCkWhfbtM=;
 b=t8LLhUeRMqfl8YciqIUhByEmF0CJcZHybR7eoWoLCw8PLfFRymnjFTKh9cz15JirXx
 uaVeFLUjtp6trZlOb5SlAThYrOEcWl/ErbeFR2dQvKGXR7cuwLFzAu5ODG1FlvYv2Kfl
 pASTnBu2Cs2Psee4jE2zeuI6EJzSsYoNNRnw5Q5m9Fb2jbg9Ms44H0dhruy0juCfatqn
 FJKBca7qOFaCfFr4fpIevtMyG8nPq4PjU0KVHJart0MB13tdgJLnJBbRnaVzPvUbFfOO
 jmz6QgsQ7nrAtzON04YCgX0C9l52vVor5+ofZXKwkLaVai/7BwTGG0OirvQfBVdQ/On1
 HVVg==
X-Gm-Message-State: AOAM5320qkpFwoVt/S3WcaBxNX7jlX+gLZxtOf9q1P9ABYBZvdKfjr6S
 Ny+zHlvhg57T/UZuwCEY/BydQG/drmg9pT+OHw9UKLKvnMQ=
X-Google-Smtp-Source: ABdhPJwKbT2CiLUGj3z4i5+PNdob1Ppx5HWnWqxQNF951Hzpv7GLjvziLZ+2MVqGM+a6zY5cbmiaIkig83KXID+3dp4=
X-Received: by 2002:ac8:4c90:: with SMTP id j16mr436916qtv.223.1616427537416; 
 Mon, 22 Mar 2021 08:38:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210318170419.2107512-1-tvrtko.ursulin@linux.intel.com>
 <20210318170419.2107512-2-tvrtko.ursulin@linux.intel.com>
In-Reply-To: <20210318170419.2107512-2-tvrtko.ursulin@linux.intel.com>
From: Matthew Auld <matthew.william.auld@gmail.com>
Date: Mon, 22 Mar 2021 15:38:31 +0000
Message-ID: <CAM0jSHNLVqvtMPs+vdiDVpiZwotruqxyCLzBjbZSoVHaCDd3rg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 1/6] drm/i915: Individual request cancellation
To: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
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
Cc: Intel Graphics Development <Intel-gfx@lists.freedesktop.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, 18 Mar 2021 at 17:04, Tvrtko Ursulin
<tvrtko.ursulin@linux.intel.com> wrote:
>
> From: Chris Wilson <chris@chris-wilson.co.uk>
>
> Currently, we cancel outstanding requests within a context when the
> context is closed. We may also want to cancel individual requests using
> the same graceful preemption mechanism.
>
> v2 (Tvrtko):
>  * Cancel waiters carefully considering no timeline lock and RCU.
>  * Fixed selftests.
>
> v3 (Tvrtko):
>  * Remove error propagation to waiters for now.
>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
> ---
>  .../gpu/drm/i915/gt/intel_engine_heartbeat.c  |   1 +
>  .../drm/i915/gt/intel_execlists_submission.c  |   9 +-
>  drivers/gpu/drm/i915/i915_request.c           |  52 ++++-
>  drivers/gpu/drm/i915/i915_request.h           |   4 +-
>  drivers/gpu/drm/i915/selftests/i915_request.c | 201 ++++++++++++++++++
>  5 files changed, 261 insertions(+), 6 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
> index 0b062fad1837..e2fb3ae2aaf3 100644
> --- a/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
> +++ b/drivers/gpu/drm/i915/gt/intel_engine_heartbeat.c
> @@ -314,6 +314,7 @@ int intel_engine_pulse(struct intel_engine_cs *engine)
>                 mutex_unlock(&ce->timeline->mutex);
>         }
>
> +       intel_engine_flush_scheduler(engine);
>         intel_engine_pm_put(engine);
>         return err;
>  }
> diff --git a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> index 85ff5fe861b4..4c2acb5a6c0a 100644
> --- a/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> +++ b/drivers/gpu/drm/i915/gt/intel_execlists_submission.c
> @@ -421,6 +421,11 @@ static void reset_active(struct i915_request *rq,
>         ce->lrc.lrca = lrc_update_regs(ce, engine, head);
>  }
>
> +static bool bad_request(const struct i915_request *rq)
> +{
> +       return rq->fence.error && i915_request_started(rq);
> +}
> +
>  static struct intel_engine_cs *
>  __execlists_schedule_in(struct i915_request *rq)
>  {
> @@ -433,7 +438,7 @@ __execlists_schedule_in(struct i915_request *rq)
>                      !intel_engine_has_heartbeat(engine)))
>                 intel_context_set_banned(ce);
>
> -       if (unlikely(intel_context_is_banned(ce)))
> +       if (unlikely(intel_context_is_banned(ce) || bad_request(rq)))
>                 reset_active(rq, engine);
>
>         if (IS_ENABLED(CONFIG_DRM_I915_DEBUG_GEM))
> @@ -1112,7 +1117,7 @@ static unsigned long active_preempt_timeout(struct intel_engine_cs *engine,
>                 return 0;
>
>         /* Force a fast reset for terminated contexts (ignoring sysfs!) */
> -       if (unlikely(intel_context_is_banned(rq->context)))
> +       if (unlikely(intel_context_is_banned(rq->context) || bad_request(rq)))
>                 return 1;
>
>         return READ_ONCE(engine->props.preempt_timeout_ms);
> diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
> index e7b4c4bc41a6..b4511ac05e9a 100644
> --- a/drivers/gpu/drm/i915/i915_request.c
> +++ b/drivers/gpu/drm/i915/i915_request.c
> @@ -33,7 +33,10 @@
>  #include "gem/i915_gem_context.h"
>  #include "gt/intel_breadcrumbs.h"
>  #include "gt/intel_context.h"
> +#include "gt/intel_engine.h"
> +#include "gt/intel_engine_heartbeat.h"
>  #include "gt/intel_gpu_commands.h"
> +#include "gt/intel_reset.h"
>  #include "gt/intel_ring.h"
>  #include "gt/intel_rps.h"
>
> @@ -429,20 +432,22 @@ void __i915_request_skip(struct i915_request *rq)
>         rq->infix = rq->postfix;
>  }
>
> -void i915_request_set_error_once(struct i915_request *rq, int error)
> +bool i915_request_set_error_once(struct i915_request *rq, int error)
>  {
>         int old;
>
>         GEM_BUG_ON(!IS_ERR_VALUE((long)error));
>
>         if (i915_request_signaled(rq))
> -               return;
> +               return false;
>
>         old = READ_ONCE(rq->fence.error);
>         do {
>                 if (fatal_error(old))
> -                       return;
> +                       return false;
>         } while (!try_cmpxchg(&rq->fence.error, &old, error));
> +
> +       return true;
>  }
>
>  struct i915_request *i915_request_mark_eio(struct i915_request *rq)
> @@ -609,6 +614,47 @@ void i915_request_unsubmit(struct i915_request *request)
>         spin_unlock_irqrestore(&se->lock, flags);
>  }
>
> +static struct intel_engine_cs *active_engine(struct i915_request *rq)
> +{
> +       struct intel_engine_cs *engine, *locked;
> +
> +       locked = READ_ONCE(rq->engine);
> +       spin_lock_irq(&locked->sched.lock);
> +       while (unlikely(locked != (engine = READ_ONCE(rq->engine)))) {
> +               spin_unlock(&locked->sched.lock);
> +               locked = engine;
> +               spin_lock(&locked->sched.lock);
> +       }
> +
> +       engine = NULL;
> +       if (i915_request_is_active(rq) && !__i915_request_is_complete(rq))
> +               engine = locked;
> +
> +       spin_unlock_irq(&locked->sched.lock);
> +
> +       return engine;

Bad idea to reuse __active_engine() somehow?

Reviewed-by: Matthew Auld <matthew.auld@intel.com>
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
