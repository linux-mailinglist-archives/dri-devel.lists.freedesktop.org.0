Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0DB9FEF09
	for <lists+dri-devel@lfdr.de>; Tue, 31 Dec 2024 12:11:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E9ACC10E654;
	Tue, 31 Dec 2024 11:11:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="PYNHhCJI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C0FF10E651
 for <dri-devel@lists.freedesktop.org>; Tue, 31 Dec 2024 11:11:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1735643504; x=1767179504;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=oSpNPhnSapEL+6s0xCNCbShAPfua6b3WeA39udNkqW0=;
 b=PYNHhCJIc724W8R2MuZwu5rBcwIGnp1Vb0166XNmV7Knutoi8ZYqmyXi
 aqbwzbP/yXZDSl8E+OZ06r1e6KuL9lH4dUGAmNHTjck534A07XfBGEYJK
 OZOEBhOOi9qzhOoCeT4/uozcCGJDEBPMNz/wZs27pH/aw0dHllRTAKkKU
 2bTWme2m0/BPrhHjgKvpDv8tAghOmCkBQk+XJ6FOY4Zrw+ZphMK+yOVe8
 iZV3MBLMYxUrMBA/OM0x+F/P674vEyvLVPunrkDEFVXDGHpY43d9aY01H
 kJoYKycRQ5fFDQNNKv4FomdLftHJuf7coHxNgbo32FFJqK8SbQ3NCukiD Q==;
X-CSE-ConnectionGUID: OiI+FFOGTaykgqZbWlCNVg==
X-CSE-MsgGUID: flzdRc2KRFmn4lYpTARXLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="36081938"
X-IronPort-AV: E=Sophos;i="6.12,279,1728975600"; d="scan'208";a="36081938"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2024 03:11:44 -0800
X-CSE-ConnectionGUID: qMIJUrvISe2wGpdHdO1FmQ==
X-CSE-MsgGUID: M9eNjBZRQZKSnFG3PD+VDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="105652701"
Received: from iklimasz-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.245.246.180])
 by fmviesa005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Dec 2024 03:11:34 -0800
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Simona Vetter
 <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, Jagan Teki
 <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
 <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Paul Kocialkowski <contact@paulk.fr>, Maxime Ripard
 <mripard@kernel.org>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>, Thomas Zimmermann
 <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, =?utf-8?Q?Herv?=
 =?utf-8?Q?=C3=A9?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni
 <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, Paul
 Kocialkowski <paul.kocialkowski@bootlin.com>, Luca Ceresoli
 <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v5 03/10] drm/bridge: add support for refcounted DRM
 bridges
In-Reply-To: <20241231-hotplug-drm-bridge-v5-3-173065a1ece1@bootlin.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com>
 <20241231-hotplug-drm-bridge-v5-3-173065a1ece1@bootlin.com>
Date: Tue, 31 Dec 2024 13:11:31 +0200
Message-ID: <87seq4nm3g.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
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

On Tue, 31 Dec 2024, Luca Ceresoli <luca.ceresoli@bootlin.com> wrote:
> DRM bridges are currently considered as a fixed element of a DRM card, and
> thus their lifetime is assumed to extend for as long as the card
> exists. New use cases, such as hot-pluggable hardware with video bridges,
> require DRM bridges to be added and removed to a DRM card without tearing
> the card down. This is possible for connectors already (used by DP MST), so
> add this possibility to DRM bridges as well.
>
> Implementation is based on drm_connector_init() as far as it makes sense,
> and differs when it doesn't. A difference is that bridges are not exposed
> to userspace,hence struct drm_bridge does not embed a struct
> drm_mode_object which would provide the refcount and the free_cb. So here
> we add to struct drm_bridge just the refcount and free_cb fields (we don't
> need other struct drm_mode_object fields here) and instead of using the
> drm_mode_object_*() functions we reimplement from those functions the few
> lines that drm_bridge needs for refcounting.
>
> The function to enroll a private bridge driver data structure into
> refcounting is based on drm_connector_init() and so called
> drm_bridge_init() for symmetry, even though it does not initialize anything
> except the refcounting and the funcs pointer which is needed to access
> funcs->destroy.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>
> ---
>
> This patch was added in v5.
> ---
>  drivers/gpu/drm/drm_bridge.c |  87 ++++++++++++++++++++++++++++++++++++
>  include/drm/drm_bridge.h     | 102 +++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 189 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index b1f0d25d55e23000521ac2ac37ee410348978ed4..6255ef59f73d8041a8cb7f2c6e23e5a67d1ae926 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -198,6 +198,85 @@
>  static DEFINE_MUTEX(bridge_lock);
>  static LIST_HEAD(bridge_list);
>  
> +static void drm_bridge_put_void(void *data)
> +{
> +	struct drm_bridge *bridge = (struct drm_bridge *)data;
> +
> +	drm_bridge_put(bridge);
> +}
> +
> +static void drm_bridge_free(struct kref *kref)
> +{
> +	struct drm_bridge *bridge = container_of(kref, struct drm_bridge, refcount);
> +
> +	DRM_DEBUG("bridge=%p\n", bridge);
> +
> +	WARN_ON(!bridge->funcs->destroy);

Please don't add new DRM_DEBUG or WARN_ON where you can use the
drm_dbg_* or drm_WARN_ON variants.

> +
> +	if (bridge->funcs->destroy)
> +		bridge->funcs->destroy(bridge);
> +}
> +
> +/**
> + * drm_bridge_init - Initialize bridge and move private driver data
> + *                   lifetime management to the DRM bridge core
> + *
> + * @dev: struct device of the device whose removal shall trigger deallocation
> + * @bridge: the bridge to initialize
> + * @funcs: funcs structure for @bridge, which must have a valid .destroy func
> + *
> + * Takes over lifetime of a private bridge driver struct which embeds a
> + * struct drm_bridge. To be called by bridge drivers just after having
> + * allocated such a private structure. Initializes refcount to 1 and
> + * installs a callback which will call funcs->destroy when refcount drops
> + * to zero.
> + *
> + * After calling this function a bridge becomes a bridge with dynamic
> + * lifetime (aka a refcounted bridge).
> + *
> + * Drivers calling this function:
> + *  - must not allocate the private structure using devm_*() functions
> + *  - must not deallocate the private structure on device removal
> + *  - must deallocate the private structure in funcs->destroy
> + *
> + * Drivers not calling this function:
> + *  - must take care of freeing their private structure either by allocating
> + *    it using devm_*() functions or free it explicitly on device removal
> + *    using kfree()
> + *  - must set funcs->destroy to NULL
> + *
> + * On failure, calls funcs->destroy, thus the caller does not need to free
> + * the driver private struct in case of error.
> + *
> + * Returns:
> + * Zero on success, error code on failure.
> + */
> +int drm_bridge_init(struct device *dev,
> +		    struct drm_bridge *bridge,
> +		    const struct drm_bridge_funcs *funcs)
> +{
> +	int err;
> +
> +	DRM_DEBUG("bridge=%p, funcs=%ps\n", bridge, funcs);
> +
> +	if (!(funcs && funcs->destroy)) {
> +		dev_warn(dev, "Missing funcs or destroy func pointer\n");
> +		return -EINVAL;
> +	}
> +
> +	bridge->free_cb = drm_bridge_free;
> +	kref_init(&bridge->refcount);
> +
> +	err = devm_add_action_or_reset(dev, drm_bridge_put_void, bridge);
> +	if (err)
> +		return err;
> +
> +	bridge->funcs = funcs;
> +
> +	return 0;
> +}
> +EXPORT_SYMBOL(drm_bridge_init);
> +
>  /**
>   * drm_bridge_add - add the given bridge to the global bridge list
>   *
> @@ -207,6 +286,10 @@ void drm_bridge_add(struct drm_bridge *bridge)
>  {
>  	struct drm_bridge *br, *tmp;
>  
> +	DRM_DEBUG("bridge=%p\n", bridge);
> +
> +	drm_bridge_get(bridge);
> +
>  	mutex_init(&bridge->hpd_mutex);
>  
>  	list_for_each_entry_safe(br, tmp, &bridge_list, list)
> @@ -251,6 +334,8 @@ void drm_bridge_remove(struct drm_bridge *bridge)
>  {
>  	struct drm_bridge *br, *tmp;
>  
> +	DRM_DEBUG("bridge=%p\n", bridge);
> +
>  	mutex_lock(&bridge_lock);
>  	list_del_init(&bridge->list);
>  	mutex_unlock(&bridge_lock);
> @@ -260,6 +345,8 @@ void drm_bridge_remove(struct drm_bridge *bridge)
>  			br->funcs->bridge_event_notify(br, DRM_EVENT_BRIDGE_REMOVE, bridge);
>  
>  	mutex_destroy(&bridge->hpd_mutex);
> +
> +	drm_bridge_put(bridge);
>  }
>  EXPORT_SYMBOL(drm_bridge_remove);
>  
> diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> index 6976bd842cedf9ce06abfb7306e7a3b4915f0378..a548a6acb02e3d70c8e34de965f648320420a7d5 100644
> --- a/include/drm/drm_bridge.h
> +++ b/include/drm/drm_bridge.h
> @@ -31,6 +31,7 @@
>  #include <drm/drm_encoder.h>
>  #include <drm/drm_mode_object.h>
>  #include <drm/drm_modes.h>
> +#include <drm/drm_print.h>
>  
>  struct device_node;
>  
> @@ -89,6 +90,18 @@ struct drm_bridge_funcs {
>  	 */
>  	void (*detach)(struct drm_bridge *bridge);
>  
> +	/**
> +	 * @destroy:
> +	 *
> +	 * Clean up bridge resources for bridges with dynamic
> +	 * lifetime. This is called when the bridge refcount drops to
> +	 * zero. It is never called for bridges without dynamic lifetime.
> +	 *
> +	 * See drm_bridge_init() for info about bridges with dynamic
> +	 * lifetime.
> +	 */
> +	void (*destroy)(struct drm_bridge *bridge);
> +
>  	/**
>  	 * @mode_valid:
>  	 *
> @@ -810,6 +823,18 @@ struct drm_bridge {
>  	const struct drm_bridge_timings *timings;
>  	/** @funcs: control functions */
>  	const struct drm_bridge_funcs *funcs;
> +
> +	/**
> +	 * @refcount: reference count for bridges with dynamic lifetime
> +	 * (see drm_bridge_init)
> +	 */
> +	struct kref refcount;
> +	/**
> +	 * @free_cb: free function callback, only set for bridges with
> +	 * dynamic lifetime
> +	 */
> +	void (*free_cb)(struct kref *kref);
> +
>  	/** @driver_private: pointer to the bridge driver's internal context */
>  	void *driver_private;
>  	/** @ops: bitmask of operations supported by the bridge */
> @@ -890,6 +915,83 @@ drm_priv_to_bridge(struct drm_private_obj *priv)
>  	return container_of(priv, struct drm_bridge, base);
>  }
>  
> +static inline bool drm_bridge_is_refcounted(struct drm_bridge *bridge)
> +{
> +	return bridge->free_cb;
> +}
> +
> +/**
> + * drm_bridge_get - Acquire a bridge reference
> + * @bridge: DRM bridge
> + *
> + * This function increments the bridge's refcount.
> + *
> + * It does nothing on non-refcounted bridges. See drm_bridge_init().
> + */
> +static inline void drm_bridge_get(struct drm_bridge *bridge)
> +{
> +	if (!drm_bridge_is_refcounted(bridge))
> +		return;
> +
> +	DRM_DEBUG("bridge=%p GET\n", bridge);
> +
> +	kref_get(&bridge->refcount);
> +}
> +
> +/**
> + * drm_bridge_put - Release a bridge reference
> + * @bridge: DRM bridge
> + *
> + * This function decrements the bridge's reference count and frees the
> + * object if the reference count drops to zero.
> + *
> + * It does nothing on non-refcounted bridges. See drm_bridge_init().
> + *
> + * See also drm_bridge_put_and_clear() which is more handy in many cases.
> + */
> +static inline void drm_bridge_put(struct drm_bridge *bridge)
> +{
> +	if (!drm_bridge_is_refcounted(bridge))
> +		return;
> +
> +	DRM_DEBUG("bridge=%p PUT\n", bridge);
> +
> +	kref_put(&bridge->refcount, bridge->free_cb);
> +}
> +
> +/**
> + * drm_bridge_put_and_clear - Given a bridge pointer, clear the pointer
> + *                            then put the bridge
> + *
> + * @br_ptr: pointer to a struct drm_bridge (must be != NULL)
> + *
> + * Helper to put a DRM bridge (whose pointer is passed), but only after
> + * setting its pointer to NULL. Useful for drivers having struct drm_bridge
> + * pointers they need to dispose of, without leaving a use-after-free
> + * window where the pointed bridge might have been freed while still
> + * holding a pointer to it.
> + *
> + * For example a driver having this private struct::
> + *
> + *     struct my_bridge {
> + *         struct drm_bridge *remote_bridge;
> + *         ...
> + *     };
> + *
> + * can dispose of remote_bridge using::
> + *
> + *     drm_bridge_put_and_clear(my_bridge->remote_bridge);
> + */
> +#define drm_bridge_put_and_clear(br_ptr) do { \
> +	struct drm_bridge **brpp = &(br_ptr); \
> +	struct drm_bridge *brp = *brpp; \
> +	*brpp = NULL; \
> +	drm_bridge_put(brp); \
> +} while (0)
> +
> +int drm_bridge_init(struct device *dev,
> +		    struct drm_bridge *bridge,
> +		    const struct drm_bridge_funcs *funcs);
>  void drm_bridge_add(struct drm_bridge *bridge);
>  int devm_drm_bridge_add(struct device *dev, struct drm_bridge *bridge);
>  void drm_bridge_remove(struct drm_bridge *bridge);

-- 
Jani Nikula, Intel
