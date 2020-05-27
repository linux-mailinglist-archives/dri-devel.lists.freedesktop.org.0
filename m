Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3419F1E4822
	for <lists+dri-devel@lfdr.de>; Wed, 27 May 2020 17:48:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAE1E89B0B;
	Wed, 27 May 2020 15:48:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fireflyinternet.com (mail.fireflyinternet.com [109.228.58.192])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9799F89B0B;
 Wed, 27 May 2020 15:48:12 +0000 (UTC)
X-Default-Received-SPF: pass (skip=forwardok (res=PASS))
 x-ip-name=78.156.65.138; 
Received: from localhost (unverified [78.156.65.138]) 
 by fireflyinternet.com (Firefly Internet (M1)) with ESMTP (TLS) id
 21311397-1500050 for multiple; Wed, 27 May 2020 16:47:55 +0100
MIME-Version: 1.0
In-Reply-To: <20200527140526.1458215-3-arnd@arndb.de>
References: <20200527140526.1458215-1-arnd@arndb.de>
 <20200527140526.1458215-3-arnd@arndb.de>
From: Chris Wilson <chris@chris-wilson.co.uk>
To: Arnd Bergmann <arnd@arndb.de>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Mika Kuoppala <mika.kuoppala@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH 3/3] drm/i915/selftests: avoid bogus maybe-uninitialized
 warning
Message-ID: <159059447457.30979.14504945135116433938@build.alporthouse.com>
User-Agent: alot/0.8.1
Date: Wed, 27 May 2020 16:47:54 +0100
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
Cc: Andi Shyti <andi.shyti@intel.com>, Arnd Bergmann <arnd@arndb.de>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Matthew Auld <matthew.auld@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Quoting Arnd Bergmann (2020-05-27 15:05:10)
> gcc has a problem following values through IS_ERR/PTR_ERR macros,
> leading to a false-positive warning in allmodconfig, with any
> compiler version:
> 
> In file included from drivers/gpu/drm/i915/gt/intel_lrc.c:5892:
> drivers/gpu/drm/i915/gt/selftest_lrc.c: In function 'create_gpr_client.isra.0':
> drivers/gpu/drm/i915/gt/selftest_lrc.c:2902:23: error: 'rq' may be used uninitialized in this function [-Werror=maybe-uninitialized]
> 
> This one is hard to avoid without impairing readability or adding a
> bugus NULL pointer.
> 
> Fixes: c92724de6db1 ("drm/i915/selftests: Try to detect rollback during batchbuffer preemption")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/i915/gt/selftest_lrc.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/i915/gt/selftest_lrc.c b/drivers/gpu/drm/i915/gt/selftest_lrc.c
> index 824f99c4cc7c..933c3f5adf0a 100644
> --- a/drivers/gpu/drm/i915/gt/selftest_lrc.c
> +++ b/drivers/gpu/drm/i915/gt/selftest_lrc.c
> @@ -2908,23 +2908,25 @@ create_gpr_client(struct intel_engine_cs *engine,
>  
>         vma = i915_vma_instance(global->obj, ce->vm, NULL);
>         if (IS_ERR(vma)) {
> -               err = PTR_ERR(vma);
> +               rq = ERR_CAST(vma);
>                 goto out_ce;
>         }
>  
>         err = i915_vma_pin(vma, 0, 0, PIN_USER);
> -       if (err)
> +       if (err) {
> +               rq = ERR_PTR(err);
>                 goto out_ce;
> +       }
>  
>         batch = create_gpr_user(engine, vma, offset);
>         if (IS_ERR(batch)) {
> -               err = PTR_ERR(batch);
> +               rq = ERR_CAST(batch);
>                 goto out_vma;
>         }
>  
>         rq = intel_context_create_request(ce);
>         if (IS_ERR(rq)) {
> -               err = PTR_ERR(rq);
> +               rq = ERR_CAST(rq);
>                 goto out_batch;
>         }
>  
> @@ -2946,17 +2948,20 @@ create_gpr_client(struct intel_engine_cs *engine,
>         i915_vma_unlock(batch);
>         i915_vma_unpin(batch);
>  
> -       if (!err)
> +       if (!err) {
>                 i915_request_get(rq);
> -       i915_request_add(rq);
> -
> +               i915_request_add(rq);
> +       } else {
> +               i915_request_add(rq);
> +               rq = ERR_PTR(err);
> +       }
>  out_batch:
>         i915_vma_put(batch);
>  out_vma:
>         i915_vma_unpin(vma);
>  out_ce:
>         intel_context_put(ce);
> -       return err ? ERR_PTR(err) : rq;
> +       return rq;

Hmm, I've used this style a few times, so could do with some syntactic
refinement.

drivers/gpu/drm/i915/gem/i915_gem_userptr.c:    return err ? ERR_PTR(err) : mm->mn;
drivers/gpu/drm/i915/gt/selftest_hangcheck.c:   return err ? ERR_PTR(err) : rq;
drivers/gpu/drm/i915/gt/selftest_lrc.c: return err ? ERR_PTR(err) : rq;
drivers/gpu/drm/i915/selftests/i915_gem_gtt.c:  return err ? ERR_PTR(err) : rq;
drivers/gpu/drm/i915/selftests/i915_request.c:  return err ? ERR_PTR(err) : request;
drivers/gpu/drm/i915/selftests/igt_spinner.c:   return err ? ERR_PTR(err) : rq;
-Chris

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
