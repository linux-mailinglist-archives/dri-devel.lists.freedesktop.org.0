Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0EEA6A412A
	for <lists+dri-devel@lfdr.de>; Mon, 27 Feb 2023 12:50:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 030F610E3E6;
	Mon, 27 Feb 2023 11:50:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03D3710E3B6;
 Mon, 27 Feb 2023 11:50:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1677498642; x=1709034642;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=dbs1E93F2Y0PbjqkrFfxn3vuscXkTjJJhWx1O76sd4Q=;
 b=KteEsHud0OxX1xcLV6Sq0XoHXQDcoC+AkoGKxmvxgh5hsWzsv38EGwfO
 +V4WjzOFbEK/imBDaLheFIVWpxu3eZctgOtZPG2+oG7pn1D6wqvxZLeIk
 5Xly5vdCPhHK/uuDQ6y+3nrr8N2TKqeBxtD8dFZZij5dyWLiCICLbnvxI
 4tN4saqHMWNIiaCeLtvv4YOxk2F3hat+aIJe1U1OlwGuCNCiaCqB3X6oB
 XuXtRHfHg2ESR5Lw7OFQIwCujbI19OQFXfsEdaMOtGl19k2lPJ/8ZBMLb
 XEW+PzvW85fp4MhEbggvLELb6cYHDaZ6QPIrHz/WweZ2QHa1B7dMqd5TD A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="336119100"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; d="scan'208";a="336119100"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 03:50:41 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10633"; a="1002722121"
X-IronPort-AV: E=Sophos;i="5.97,331,1669104000"; d="scan'208";a="1002722121"
Received: from jkaisrli-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.56.158])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Feb 2023 03:50:23 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, David Airlie
 <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/3] drm/i915: Separate wakeref tracking
In-Reply-To: <20230224-track_gt-v1-1-0222096fcdc6@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20230224-track_gt-v1-0-0222096fcdc6@intel.com>
 <20230224-track_gt-v1-1-0222096fcdc6@intel.com>
Date: Mon, 27 Feb 2023 13:50:20 +0200
Message-ID: <87v8jn1g5f.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
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
Cc: intel-gfx@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Chris Wilson <chris.p.wilson@intel.com>,
 Chris Wilson <chris@chris-wilson.co.uk>, dri-devel@lists.freedesktop.org,
 Andrzej Hajda <andrzej.hajda@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, 24 Feb 2023, Andrzej Hajda <andrzej.hajda@intel.com> wrote:
> From: Chris Wilson <chris.p.wilson@intel.com>
>
> Extract the callstack tracking of intel_runtime_pm.c into its own
> utility so that that we can reuse it for other online debugging of
> scoped wakerefs.
>
> Signed-off-by: Chris Wilson <chris@chris-wilson.co.uk>
> Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> ---
>  drivers/gpu/drm/i915/Kconfig.debug           |   9 +
>  drivers/gpu/drm/i915/Makefile                |   4 +
>  drivers/gpu/drm/i915/intel_runtime_pm.c      | 244 +++------------------=
------
>  drivers/gpu/drm/i915/intel_runtime_pm.h      |  10 +-
>  drivers/gpu/drm/i915/intel_wakeref.h         |   6 +-
>  drivers/gpu/drm/i915/intel_wakeref_tracker.c | 234 +++++++++++++++++++++=
++++
>  drivers/gpu/drm/i915/intel_wakeref_tracker.h |  76 +++++++++
>  7 files changed, 355 insertions(+), 228 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/Kconfig.debug b/drivers/gpu/drm/i915/Kc=
onfig.debug
> index 93dfb7ed970547..5fde52107e3b44 100644
> --- a/drivers/gpu/drm/i915/Kconfig.debug
> +++ b/drivers/gpu/drm/i915/Kconfig.debug
> @@ -25,6 +25,7 @@ config DRM_I915_DEBUG
>  	select PREEMPT_COUNT
>  	select I2C_CHARDEV
>  	select STACKDEPOT
> +	select STACKTRACE
>  	select DRM_DP_AUX_CHARDEV
>  	select X86_MSR # used by igt/pm_rpm
>  	select DRM_VGEM # used by igt/prime_vgem (dmabuf interop checks)
> @@ -37,6 +38,7 @@ config DRM_I915_DEBUG
>  	select DRM_I915_DEBUG_GEM
>  	select DRM_I915_DEBUG_GEM_ONCE
>  	select DRM_I915_DEBUG_MMIO
> +	select DRM_I915_TRACK_WAKEREF
>  	select DRM_I915_DEBUG_RUNTIME_PM
>  	select DRM_I915_SW_FENCE_DEBUG_OBJECTS
>  	select DRM_I915_SELFTEST
> @@ -227,11 +229,18 @@ config DRM_I915_DEBUG_VBLANK_EVADE
>=20=20
>  	  If in doubt, say "N".
>=20=20
> +config DRM_I915_TRACK_WAKEREF
> +	depends on STACKDEPOT
> +	depends on STACKTRACE
> +	bool
> +
>  config DRM_I915_DEBUG_RUNTIME_PM
>  	bool "Enable extra state checking for runtime PM"
>  	depends on DRM_I915
>  	default n
>  	select STACKDEPOT
> +	select STACKTRACE
> +	select DRM_I915_TRACK_WAKEREF
>  	help
>  	  Choose this option to turn on extra state checking for the
>  	  runtime PM functionality. This may introduce overhead during
> diff --git a/drivers/gpu/drm/i915/Makefile b/drivers/gpu/drm/i915/Makefile
> index b2f91a1f826858..42daff6d575a82 100644
> --- a/drivers/gpu/drm/i915/Makefile
> +++ b/drivers/gpu/drm/i915/Makefile
> @@ -81,6 +81,10 @@ i915-$(CONFIG_DEBUG_FS) +=3D \
>  	i915_debugfs_params.o \
>  	display/intel_display_debugfs.o \
>  	display/intel_pipe_crc.o
> +
> +i915-$(CONFIG_DRM_I915_TRACK_WAKEREF) +=3D \
> +	intel_wakeref_tracker.o
> +
>  i915-$(CONFIG_PERF_EVENTS) +=3D i915_pmu.o
>=20=20
>  # "Graphics Technology" (aka we talk to the gpu)
> diff --git a/drivers/gpu/drm/i915/intel_runtime_pm.c b/drivers/gpu/drm/i9=
15/intel_runtime_pm.c
> index 129746713d072f..72887e2bb03c21 100644
> --- a/drivers/gpu/drm/i915/intel_runtime_pm.c
> +++ b/drivers/gpu/drm/i915/intel_runtime_pm.c
> @@ -52,182 +52,37 @@
>=20=20
>  #if IS_ENABLED(CONFIG_DRM_I915_DEBUG_RUNTIME_PM)
>=20=20
> -#include <linux/sort.h>
> -
> -#define STACKDEPTH 8
> -
> -static noinline depot_stack_handle_t __save_depot_stack(void)
> -{
> -	unsigned long entries[STACKDEPTH];
> -	unsigned int n;
> -
> -	n =3D stack_trace_save(entries, ARRAY_SIZE(entries), 1);
> -	return stack_depot_save(entries, n, GFP_NOWAIT | __GFP_NOWARN);
> -}
> -
>  static void init_intel_runtime_pm_wakeref(struct intel_runtime_pm *rpm)
>  {
> -	spin_lock_init(&rpm->debug.lock);
> -	stack_depot_init();
> +	intel_wakeref_tracker_init(&rpm->debug);
>  }
>=20=20
> -static noinline depot_stack_handle_t
> +static intel_wakeref_t
>  track_intel_runtime_pm_wakeref(struct intel_runtime_pm *rpm)
>  {
> -	depot_stack_handle_t stack, *stacks;
> -	unsigned long flags;
> -
> -	if (rpm->no_wakeref_tracking)
> -		return -1;
> -
> -	stack =3D __save_depot_stack();
> -	if (!stack)
> +	if (!rpm->available)
>  		return -1;
>=20=20
> -	spin_lock_irqsave(&rpm->debug.lock, flags);
> -
> -	if (!rpm->debug.count)
> -		rpm->debug.last_acquire =3D stack;
> -
> -	stacks =3D krealloc(rpm->debug.owners,
> -			  (rpm->debug.count + 1) * sizeof(*stacks),
> -			  GFP_NOWAIT | __GFP_NOWARN);
> -	if (stacks) {
> -		stacks[rpm->debug.count++] =3D stack;
> -		rpm->debug.owners =3D stacks;
> -	} else {
> -		stack =3D -1;
> -	}
> -
> -	spin_unlock_irqrestore(&rpm->debug.lock, flags);
> -
> -	return stack;
> +	return intel_wakeref_tracker_add(&rpm->debug);
>  }
>=20=20
>  static void untrack_intel_runtime_pm_wakeref(struct intel_runtime_pm *rp=
m,
> -					     depot_stack_handle_t stack)
> +					     intel_wakeref_t wakeref)
>  {
> -	struct drm_i915_private *i915 =3D container_of(rpm,
> -						     struct drm_i915_private,
> -						     runtime_pm);
> -	unsigned long flags, n;
> -	bool found =3D false;
> -
> -	if (unlikely(stack =3D=3D -1))
> -		return;
> -
> -	spin_lock_irqsave(&rpm->debug.lock, flags);
> -	for (n =3D rpm->debug.count; n--; ) {
> -		if (rpm->debug.owners[n] =3D=3D stack) {
> -			memmove(rpm->debug.owners + n,
> -				rpm->debug.owners + n + 1,
> -				(--rpm->debug.count - n) * sizeof(stack));
> -			found =3D true;
> -			break;
> -		}
> -	}
> -	spin_unlock_irqrestore(&rpm->debug.lock, flags);
> -
> -	if (drm_WARN(&i915->drm, !found,
> -		     "Unmatched wakeref (tracking %lu), count %u\n",
> -		     rpm->debug.count, atomic_read(&rpm->wakeref_count))) {
> -		char *buf;
> -
> -		buf =3D kmalloc(PAGE_SIZE, GFP_NOWAIT | __GFP_NOWARN);
> -		if (!buf)
> -			return;
> -
> -		stack_depot_snprint(stack, buf, PAGE_SIZE, 2);
> -		DRM_DEBUG_DRIVER("wakeref %x from\n%s", stack, buf);
> -
> -		stack =3D READ_ONCE(rpm->debug.last_release);
> -		if (stack) {
> -			stack_depot_snprint(stack, buf, PAGE_SIZE, 2);
> -			DRM_DEBUG_DRIVER("wakeref last released at\n%s", buf);
> -		}
> -
> -		kfree(buf);
> -	}
> +	intel_wakeref_tracker_remove(&rpm->debug, wakeref);
>  }
>=20=20
> -static int cmphandle(const void *_a, const void *_b)
> +static void untrack_all_intel_runtime_pm_wakerefs(struct intel_runtime_p=
m *rpm)
>  {
> -	const depot_stack_handle_t * const a =3D _a, * const b =3D _b;
> +	struct drm_printer p =3D drm_debug_printer("i915");
>=20=20
> -	if (*a < *b)
> -		return -1;
> -	else if (*a > *b)
> -		return 1;
> -	else
> -		return 0;
> -}
> -
> -static void
> -__print_intel_runtime_pm_wakeref(struct drm_printer *p,
> -				 const struct intel_runtime_pm_debug *dbg)
> -{
> -	unsigned long i;
> -	char *buf;
> -
> -	buf =3D kmalloc(PAGE_SIZE, GFP_NOWAIT | __GFP_NOWARN);
> -	if (!buf)
> -		return;
> -
> -	if (dbg->last_acquire) {
> -		stack_depot_snprint(dbg->last_acquire, buf, PAGE_SIZE, 2);
> -		drm_printf(p, "Wakeref last acquired:\n%s", buf);
> -	}
> -
> -	if (dbg->last_release) {
> -		stack_depot_snprint(dbg->last_release, buf, PAGE_SIZE, 2);
> -		drm_printf(p, "Wakeref last released:\n%s", buf);
> -	}
> -
> -	drm_printf(p, "Wakeref count: %lu\n", dbg->count);
> -
> -	sort(dbg->owners, dbg->count, sizeof(*dbg->owners), cmphandle, NULL);
> -
> -	for (i =3D 0; i < dbg->count; i++) {
> -		depot_stack_handle_t stack =3D dbg->owners[i];
> -		unsigned long rep;
> -
> -		rep =3D 1;
> -		while (i + 1 < dbg->count && dbg->owners[i + 1] =3D=3D stack)
> -			rep++, i++;
> -		stack_depot_snprint(stack, buf, PAGE_SIZE, 2);
> -		drm_printf(p, "Wakeref x%lu taken at:\n%s", rep, buf);
> -	}
> -
> -	kfree(buf);
> -}
> -
> -static noinline void
> -__untrack_all_wakerefs(struct intel_runtime_pm_debug *debug,
> -		       struct intel_runtime_pm_debug *saved)
> -{
> -	*saved =3D *debug;
> -
> -	debug->owners =3D NULL;
> -	debug->count =3D 0;
> -	debug->last_release =3D __save_depot_stack();
> -}
> -
> -static void
> -dump_and_free_wakeref_tracking(struct intel_runtime_pm_debug *debug)
> -{
> -	if (debug->count) {
> -		struct drm_printer p =3D drm_debug_printer("i915");
> -
> -		__print_intel_runtime_pm_wakeref(&p, debug);
> -	}
> -
> -	kfree(debug->owners);
> +	intel_wakeref_tracker_reset(&rpm->debug, &p);
>  }
>=20=20
>  static noinline void
>  __intel_wakeref_dec_and_check_tracking(struct intel_runtime_pm *rpm)
>  {
> -	struct intel_runtime_pm_debug dbg =3D {};
> +	struct intel_wakeref_tracker saved;
>  	unsigned long flags;
>=20=20
>  	if (!atomic_dec_and_lock_irqsave(&rpm->wakeref_count,
> @@ -235,60 +90,21 @@ __intel_wakeref_dec_and_check_tracking(struct intel_=
runtime_pm *rpm)
>  					 flags))
>  		return;
>=20=20
> -	__untrack_all_wakerefs(&rpm->debug, &dbg);
> +	saved =3D __intel_wakeref_tracker_reset(&rpm->debug);
>  	spin_unlock_irqrestore(&rpm->debug.lock, flags);
>=20=20
> -	dump_and_free_wakeref_tracking(&dbg);
> -}
> -
> -static noinline void
> -untrack_all_intel_runtime_pm_wakerefs(struct intel_runtime_pm *rpm)
> -{
> -	struct intel_runtime_pm_debug dbg =3D {};
> -	unsigned long flags;
> -
> -	spin_lock_irqsave(&rpm->debug.lock, flags);
> -	__untrack_all_wakerefs(&rpm->debug, &dbg);
> -	spin_unlock_irqrestore(&rpm->debug.lock, flags);
> +	if (saved.count) {
> +		struct drm_printer p =3D drm_debug_printer("i915");
>=20=20
> -	dump_and_free_wakeref_tracking(&dbg);
> +		__intel_wakeref_tracker_show(&saved, &p);
> +		intel_wakeref_tracker_fini(&saved);
> +	}
>  }
>=20=20
>  void print_intel_runtime_pm_wakeref(struct intel_runtime_pm *rpm,
>  				    struct drm_printer *p)
>  {
> -	struct intel_runtime_pm_debug dbg =3D {};
> -
> -	do {
> -		unsigned long alloc =3D dbg.count;
> -		depot_stack_handle_t *s;
> -
> -		spin_lock_irq(&rpm->debug.lock);
> -		dbg.count =3D rpm->debug.count;
> -		if (dbg.count <=3D alloc) {
> -			memcpy(dbg.owners,
> -			       rpm->debug.owners,
> -			       dbg.count * sizeof(*s));
> -		}
> -		dbg.last_acquire =3D rpm->debug.last_acquire;
> -		dbg.last_release =3D rpm->debug.last_release;
> -		spin_unlock_irq(&rpm->debug.lock);
> -		if (dbg.count <=3D alloc)
> -			break;
> -
> -		s =3D krealloc(dbg.owners,
> -			     dbg.count * sizeof(*s),
> -			     GFP_NOWAIT | __GFP_NOWARN);
> -		if (!s)
> -			goto out;
> -
> -		dbg.owners =3D s;
> -	} while (1);
> -
> -	__print_intel_runtime_pm_wakeref(p, &dbg);
> -
> -out:
> -	kfree(dbg.owners);
> +	intel_wakeref_tracker_show(&rpm->debug, p);
>  }
>=20=20
>  #else
> @@ -297,14 +113,14 @@ static void init_intel_runtime_pm_wakeref(struct in=
tel_runtime_pm *rpm)
>  {
>  }
>=20=20
> -static depot_stack_handle_t
> +static intel_wakeref_t
>  track_intel_runtime_pm_wakeref(struct intel_runtime_pm *rpm)
>  {
>  	return -1;
>  }
>=20=20
>  static void untrack_intel_runtime_pm_wakeref(struct intel_runtime_pm *rp=
m,
> -					     intel_wakeref_t wref)
> +					     intel_wakeref_t wakeref)
>  {
>  }
>=20=20
> @@ -349,9 +165,8 @@ intel_runtime_pm_release(struct intel_runtime_pm *rpm=
, int wakelock)
>  static intel_wakeref_t __intel_runtime_pm_get(struct intel_runtime_pm *r=
pm,
>  					      bool wakelock)
>  {
> -	struct drm_i915_private *i915 =3D container_of(rpm,
> -						     struct drm_i915_private,
> -						     runtime_pm);
> +	struct drm_i915_private *i915 =3D
> +		container_of(rpm, struct drm_i915_private, runtime_pm);
>  	int ret;
>=20=20
>  	ret =3D pm_runtime_get_sync(rpm->kdev);
> @@ -556,9 +371,8 @@ void intel_runtime_pm_put(struct intel_runtime_pm *rp=
m, intel_wakeref_t wref)
>   */
>  void intel_runtime_pm_enable(struct intel_runtime_pm *rpm)
>  {
> -	struct drm_i915_private *i915 =3D container_of(rpm,
> -						     struct drm_i915_private,
> -						     runtime_pm);
> +	struct drm_i915_private *i915 =3D
> +		container_of(rpm, struct drm_i915_private, runtime_pm);
>  	struct device *kdev =3D rpm->kdev;
>=20=20
>  	/*
> @@ -611,9 +425,8 @@ void intel_runtime_pm_enable(struct intel_runtime_pm =
*rpm)
>=20=20
>  void intel_runtime_pm_disable(struct intel_runtime_pm *rpm)
>  {
> -	struct drm_i915_private *i915 =3D container_of(rpm,
> -						     struct drm_i915_private,
> -						     runtime_pm);
> +	struct drm_i915_private *i915 =3D
> +		container_of(rpm, struct drm_i915_private, runtime_pm);
>  	struct device *kdev =3D rpm->kdev;
>=20=20
>  	/* Transfer rpm ownership back to core */
> @@ -628,9 +441,8 @@ void intel_runtime_pm_disable(struct intel_runtime_pm=
 *rpm)
>=20=20
>  void intel_runtime_pm_driver_release(struct intel_runtime_pm *rpm)
>  {
> -	struct drm_i915_private *i915 =3D container_of(rpm,
> -						     struct drm_i915_private,
> -						     runtime_pm);
> +	struct drm_i915_private *i915 =3D
> +		container_of(rpm, struct drm_i915_private, runtime_pm);
>  	int count =3D atomic_read(&rpm->wakeref_count);
>=20=20
>  	intel_wakeref_auto_fini(&rpm->userfault_wakeref);
> @@ -646,7 +458,7 @@ void intel_runtime_pm_driver_release(struct intel_run=
time_pm *rpm)
>  void intel_runtime_pm_init_early(struct intel_runtime_pm *rpm)
>  {
>  	struct drm_i915_private *i915 =3D
> -			container_of(rpm, struct drm_i915_private, runtime_pm);
> +		container_of(rpm, struct drm_i915_private, runtime_pm);

Lots of unrelated changes above that should be separate patches.

>  	struct pci_dev *pdev =3D to_pci_dev(i915->drm.dev);
>  	struct device *kdev =3D &pdev->dev;
>=20=20
> diff --git a/drivers/gpu/drm/i915/intel_runtime_pm.h b/drivers/gpu/drm/i9=
15/intel_runtime_pm.h
> index e592e8d6499a1f..a8dc2baf79844f 100644
> --- a/drivers/gpu/drm/i915/intel_runtime_pm.h
> +++ b/drivers/gpu/drm/i915/intel_runtime_pm.h
> @@ -83,15 +83,7 @@ struct intel_runtime_pm {
>  	 * paired rpm_put) we can remove corresponding pairs of and keep
>  	 * the array trimmed to active wakerefs.
>  	 */
> -	struct intel_runtime_pm_debug {
> -		spinlock_t lock;
> -
> -		depot_stack_handle_t last_acquire;
> -		depot_stack_handle_t last_release;
> -
> -		depot_stack_handle_t *owners;
> -		unsigned long count;
> -	} debug;
> +	struct intel_wakeref_tracker debug;

There's a lot going on in the patch all around. Adding the struct to a
separate file could maybe be an individual patch to simplify the actual
changes.

This doesn't include the file that defines struct intel_wakeref_tracker;
it's included via intel_wakeref.h. But only if=20

>  #endif
>  };
>=20=20
> diff --git a/drivers/gpu/drm/i915/intel_wakeref.h b/drivers/gpu/drm/i915/=
intel_wakeref.h
> index 71b8a63f6f104d..20720fbcc28d46 100644
> --- a/drivers/gpu/drm/i915/intel_wakeref.h
> +++ b/drivers/gpu/drm/i915/intel_wakeref.h
> @@ -17,7 +17,9 @@
>  #include <linux/timer.h>
>  #include <linux/workqueue.h>
>=20=20
> -#if IS_ENABLED(CONFIG_DRM_I915_DEBUG)
> +#include "intel_wakeref_tracker.h"
> +
> +#if IS_ENABLED(CONFIG_DRM_I915_DEBUG_WAKEREF)
>  #define INTEL_WAKEREF_BUG_ON(expr) BUG_ON(expr)
>  #else
>  #define INTEL_WAKEREF_BUG_ON(expr) BUILD_BUG_ON_INVALID(expr)
> @@ -26,8 +28,6 @@
>  struct intel_runtime_pm;
>  struct intel_wakeref;
>=20=20
> -typedef depot_stack_handle_t intel_wakeref_t;
> -
>  struct intel_wakeref_ops {
>  	int (*get)(struct intel_wakeref *wf);
>  	int (*put)(struct intel_wakeref *wf);
> diff --git a/drivers/gpu/drm/i915/intel_wakeref_tracker.c b/drivers/gpu/d=
rm/i915/intel_wakeref_tracker.c
> new file mode 100644
> index 00000000000000..a0bcef13a1085a
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/intel_wakeref_tracker.c
> @@ -0,0 +1,234 @@
> +// SPDX-License-Identifier: MIT
> +/*
> + * Copyright =C2=A9 2021 Intel Corporation
> + */
> +
> +#include <linux/slab.h>
> +#include <linux/stackdepot.h>
> +#include <linux/stacktrace.h>
> +#include <linux/sort.h>
> +
> +#include <drm/drm_print.h>
> +
> +#include "intel_wakeref.h"

This should really include the corresponding .h
i.e. intel_wakeref_tracker.h too. Now it gets included via
intel_wakeref.h but I'm not sure why.

> +
> +#define STACKDEPTH 8
> +
> +static noinline depot_stack_handle_t __save_depot_stack(void)
> +{
> +	unsigned long entries[STACKDEPTH];
> +	unsigned int n;
> +
> +	n =3D stack_trace_save(entries, ARRAY_SIZE(entries), 1);
> +	return stack_depot_save(entries, n, GFP_NOWAIT | __GFP_NOWARN);
> +}
> +
> +static void __print_depot_stack(depot_stack_handle_t stack,
> +				char *buf, int sz, int indent)
> +{
> +	unsigned long *entries;
> +	unsigned int nr_entries;
> +
> +	nr_entries =3D stack_depot_fetch(stack, &entries);
> +	stack_trace_snprint(buf, sz, entries, nr_entries, indent);
> +}
> +
> +static int cmphandle(const void *_a, const void *_b)
> +{
> +	const depot_stack_handle_t * const a =3D _a, * const b =3D _b;
> +
> +	if (*a < *b)
> +		return -1;
> +	else if (*a > *b)
> +		return 1;
> +	else
> +		return 0;
> +}
> +
> +void
> +__intel_wakeref_tracker_show(const struct intel_wakeref_tracker *w,
> +			     struct drm_printer *p)
> +{
> +	unsigned long i;
> +	char *buf;
> +
> +	buf =3D kmalloc(PAGE_SIZE, GFP_NOWAIT | __GFP_NOWARN);
> +	if (!buf)
> +		return;
> +
> +	if (w->last_acquire) {
> +		__print_depot_stack(w->last_acquire, buf, PAGE_SIZE, 2);
> +		drm_printf(p, "Wakeref last acquired:\n%s", buf);
> +	}
> +
> +	if (w->last_release) {
> +		__print_depot_stack(w->last_release, buf, PAGE_SIZE, 2);
> +		drm_printf(p, "Wakeref last released:\n%s", buf);
> +	}
> +
> +	drm_printf(p, "Wakeref count: %lu\n", w->count);
> +
> +	sort(w->owners, w->count, sizeof(*w->owners), cmphandle, NULL);
> +
> +	for (i =3D 0; i < w->count; i++) {
> +		depot_stack_handle_t stack =3D w->owners[i];
> +		unsigned long rep;
> +
> +		rep =3D 1;
> +		while (i + 1 < w->count && w->owners[i + 1] =3D=3D stack)
> +			rep++, i++;
> +		__print_depot_stack(stack, buf, PAGE_SIZE, 2);
> +		drm_printf(p, "Wakeref x%lu taken at:\n%s", rep, buf);
> +	}
> +
> +	kfree(buf);
> +}
> +
> +void intel_wakeref_tracker_show(struct intel_wakeref_tracker *w,
> +				struct drm_printer *p)
> +{
> +	struct intel_wakeref_tracker tmp =3D {};
> +
> +	do {
> +		unsigned long alloc =3D tmp.count;
> +		depot_stack_handle_t *s;
> +
> +		spin_lock_irq(&w->lock);
> +		tmp.count =3D w->count;
> +		if (tmp.count <=3D alloc)
> +			memcpy(tmp.owners, w->owners, tmp.count * sizeof(*s));
> +		tmp.last_acquire =3D w->last_acquire;
> +		tmp.last_release =3D w->last_release;
> +		spin_unlock_irq(&w->lock);
> +		if (tmp.count <=3D alloc)
> +			break;
> +
> +		s =3D krealloc(tmp.owners,
> +			     tmp.count * sizeof(*s),
> +			     GFP_NOWAIT | __GFP_NOWARN);
> +		if (!s)
> +			goto out;
> +
> +		tmp.owners =3D s;
> +	} while (1);
> +
> +	__intel_wakeref_tracker_show(&tmp, p);
> +
> +out:
> +	intel_wakeref_tracker_fini(&tmp);
> +}
> +
> +intel_wakeref_t intel_wakeref_tracker_add(struct intel_wakeref_tracker *=
w)
> +{
> +	depot_stack_handle_t stack, *stacks;
> +	unsigned long flags;
> +
> +	stack =3D __save_depot_stack();
> +	if (!stack)
> +		return -1;
> +
> +	spin_lock_irqsave(&w->lock, flags);
> +
> +	if (!w->count)
> +		w->last_acquire =3D stack;
> +
> +	stacks =3D krealloc(w->owners,
> +			  (w->count + 1) * sizeof(*stacks),
> +			  GFP_NOWAIT | __GFP_NOWARN);
> +	if (stacks) {
> +		stacks[w->count++] =3D stack;
> +		w->owners =3D stacks;
> +	} else {
> +		stack =3D -1;
> +	}
> +
> +	spin_unlock_irqrestore(&w->lock, flags);
> +
> +	return stack;
> +}
> +
> +void intel_wakeref_tracker_remove(struct intel_wakeref_tracker *w,
> +				  intel_wakeref_t stack)
> +{
> +	unsigned long flags, n;
> +	bool found =3D false;
> +
> +	if (unlikely(stack =3D=3D -1))
> +		return;
> +
> +	spin_lock_irqsave(&w->lock, flags);
> +	for (n =3D w->count; n--; ) {
> +		if (w->owners[n] =3D=3D stack) {
> +			memmove(w->owners + n,
> +				w->owners + n + 1,
> +				(--w->count - n) * sizeof(stack));
> +			found =3D true;
> +			break;
> +		}
> +	}
> +	spin_unlock_irqrestore(&w->lock, flags);
> +
> +	if (WARN(!found,
> +		 "Unmatched wakeref %x, tracking %lu\n",
> +		 stack, w->count)) {
> +		char *buf;
> +
> +		buf =3D kmalloc(PAGE_SIZE, GFP_NOWAIT | __GFP_NOWARN);
> +		if (!buf)
> +			return;
> +
> +		__print_depot_stack(stack, buf, PAGE_SIZE, 2);
> +		pr_err("wakeref %x from\n%s", stack, buf);
> +
> +		stack =3D READ_ONCE(w->last_release);
> +		if (stack && !w->count) {
> +			__print_depot_stack(stack, buf, PAGE_SIZE, 2);
> +			pr_err("wakeref last released at\n%s", buf);
> +		}
> +
> +		kfree(buf);
> +	}
> +}
> +
> +struct intel_wakeref_tracker
> +__intel_wakeref_tracker_reset(struct intel_wakeref_tracker *w)
> +{
> +	struct intel_wakeref_tracker saved;
> +
> +	lockdep_assert_held(&w->lock);
> +
> +	saved =3D *w;
> +
> +	w->owners =3D NULL;
> +	w->count =3D 0;
> +	w->last_release =3D __save_depot_stack();
> +
> +	return saved;
> +}
> +
> +void intel_wakeref_tracker_reset(struct intel_wakeref_tracker *w,
> +				 struct drm_printer *p)
> +{
> +	struct intel_wakeref_tracker tmp;
> +
> +	spin_lock_irq(&w->lock);
> +	tmp =3D __intel_wakeref_tracker_reset(w);
> +	spin_unlock_irq(&w->lock);
> +
> +	if (tmp.count)
> +		__intel_wakeref_tracker_show(&tmp, p);
> +
> +	intel_wakeref_tracker_fini(&tmp);
> +}
> +
> +void intel_wakeref_tracker_init(struct intel_wakeref_tracker *w)
> +{
> +	memset(w, 0, sizeof(*w));
> +	spin_lock_init(&w->lock);
> +	stack_depot_init();
> +}
> +
> +void intel_wakeref_tracker_fini(struct intel_wakeref_tracker *w)
> +{
> +	kfree(w->owners);
> +}
> diff --git a/drivers/gpu/drm/i915/intel_wakeref_tracker.h b/drivers/gpu/d=
rm/i915/intel_wakeref_tracker.h
> new file mode 100644
> index 00000000000000..61df68e28c0fbf
> --- /dev/null
> +++ b/drivers/gpu/drm/i915/intel_wakeref_tracker.h
> @@ -0,0 +1,76 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright =C2=A9 2019 Intel Corporation
> + */
> +
> +#ifndef INTEL_WAKEREF_TRACKER_H
> +#define INTEL_WAKEREF_TRACKER_H
> +
> +#include <linux/kconfig.h>
> +#include <linux/spinlock.h>
> +#include <linux/stackdepot.h>
> +
> +typedef depot_stack_handle_t intel_wakeref_t;
> +
> +struct drm_printer;
> +
> +struct intel_wakeref_tracker {
> +	spinlock_t lock;
> +
> +	depot_stack_handle_t last_acquire;
> +	depot_stack_handle_t last_release;
> +
> +	depot_stack_handle_t *owners;
> +	unsigned long count;
> +};
> +
> +#if IS_ENABLED(CONFIG_DRM_I915_TRACK_WAKEREF)
> +
> +void intel_wakeref_tracker_init(struct intel_wakeref_tracker *w);
> +void intel_wakeref_tracker_fini(struct intel_wakeref_tracker *w);
> +
> +intel_wakeref_t intel_wakeref_tracker_add(struct intel_wakeref_tracker *=
w);
> +void intel_wakeref_tracker_remove(struct intel_wakeref_tracker *w,
> +			   intel_wakeref_t handle);
> +
> +struct intel_wakeref_tracker
> +__intel_wakeref_tracker_reset(struct intel_wakeref_tracker *w);
> +void intel_wakeref_tracker_reset(struct intel_wakeref_tracker *w,
> +				 struct drm_printer *p);
> +
> +void __intel_wakeref_tracker_show(const struct intel_wakeref_tracker *w,
> +				  struct drm_printer *p);
> +void intel_wakeref_tracker_show(struct intel_wakeref_tracker *w,
> +				struct drm_printer *p);
> +
> +#else
> +
> +static inline void intel_wakeref_tracker_init(struct intel_wakeref_track=
er *w) {}
> +static inline void intel_wakeref_tracker_fini(struct intel_wakeref_track=
er *w) {}
> +
> +static inline intel_wakeref_t
> +intel_wakeref_tracker_add(struct intel_wakeref_tracker *w)
> +{
> +	return -1;
> +}
> +
> +static inline void
> +intel_wakeref_untrack_remove(struct intel_wakeref_tracker *w, intel_wake=
ref_t handle) {}
> +
> +static inline struct intel_wakeref_tracker
> +__intel_wakeref_tracker_reset(struct intel_wakeref_tracker *w)
> +{
> +	return (struct intel_wakeref_tracker){};
> +}
> +
> +static inline void intel_wakeref_tracker_reset(struct intel_wakeref_trac=
ker *w,
> +					       struct drm_printer *p)
> +{
> +}
> +
> +static inline void __intel_wakeref_tracker_show(const struct intel_waker=
ef_tracker *w, struct drm_printer *p) {}
> +static inline void intel_wakeref_tracker_show(struct intel_wakeref_track=
er *w, struct drm_printer *p) {}
> +
> +#endif
> +
> +#endif /* INTEL_WAKEREF_TRACKER_H */

--=20
Jani Nikula, Intel Open Source Graphics Center
