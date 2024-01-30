Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA3CC8421A5
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 11:41:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 423B0112F4C;
	Tue, 30 Jan 2024 10:41:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from coelho.fi (paleale.coelho.fi [176.9.41.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69FE310F883;
 Tue, 30 Jan 2024 10:41:18 +0000 (UTC)
Received: from 91-155-255-116.elisa-laajakaista.fi ([91.155.255.116]
 helo=RAVPPB-CIM.amr.corp.intel.com)
 by coelho.fi with esmtpsa (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
 (Exim 4.97-RC1) (envelope-from <luca@coelho.fi>)
 id 1rUl5d-00000001Xys-1gIB; Tue, 30 Jan 2024 12:11:38 +0200
Message-ID: <af97f8a21816578b32c3be96ea5f50eea6fc8a1b.camel@coelho.fi>
From: Luca Coelho <luca@coelho.fi>
To: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Date: Tue, 30 Jan 2024 12:11:36 +0200
In-Reply-To: <9d105014e3c90af13a874745d768212347f68283.1705410327.git.jani.nikula@intel.com>
References: <cover.1705410327.git.jani.nikula@intel.com>
 <9d105014e3c90af13a874745d768212347f68283.1705410327.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on farmhouse.coelho.fi
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=ALL_TRUSTED,BAYES_00,
 TVD_RCVD_IP autolearn=ham autolearn_force=no version=4.0.0
Subject: Re: [PATCH 02/10] drm/print: move enum drm_debug_category etc.
 earlier in drm_print.h
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
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 2024-01-16 at 15:07 +0200, Jani Nikula wrote:
> Avoid forward declarations in subsequent changes, but separate this
> movement to an independent change.
>=20
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>
> ---
>  include/drm/drm_print.h | 190 ++++++++++++++++++++--------------------
>  1 file changed, 95 insertions(+), 95 deletions(-)
>=20
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index 1040213d02a4..b8b4cb9bb878 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -69,6 +69,101 @@ extern unsigned long __drm_debug;
>   *     }
>   */
> =20
> +/**
> + * enum drm_debug_category - The DRM debug categories
> + *
> + * Each of the DRM debug logging macros use a specific category, and the=
 logging
> + * is filtered by the drm.debug module parameter. This enum specifies th=
e values
> + * for the interface.
> + *
> + * Each DRM_DEBUG_<CATEGORY> macro logs to DRM_UT_<CATEGORY> category, e=
xcept
> + * DRM_DEBUG() logs to DRM_UT_CORE.
> + *
> + * Enabling verbose debug messages is done through the drm.debug paramet=
er, each
> + * category being enabled by a bit:
> + *
> + *  - drm.debug=3D0x1 will enable CORE messages
> + *  - drm.debug=3D0x2 will enable DRIVER messages
> + *  - drm.debug=3D0x3 will enable CORE and DRIVER messages
> + *  - ...
> + *  - drm.debug=3D0x1ff will enable all messages
> + *
> + * An interesting feature is that it's possible to enable verbose loggin=
g at
> + * run-time by echoing the debug value in its sysfs node::
> + *
> + *   # echo 0xf > /sys/module/drm/parameters/debug
> + *
> + */
> +enum drm_debug_category {
> +	/* These names must match those in DYNAMIC_DEBUG_CLASSBITS */
> +	/**
> +	 * @DRM_UT_CORE: Used in the generic drm code: drm_ioctl.c, drm_mm.c,
> +	 * drm_memory.c, ...
> +	 */
> +	DRM_UT_CORE,
> +	/**
> +	 * @DRM_UT_DRIVER: Used in the vendor specific part of the driver: i915=
,
> +	 * radeon, ... macro.
> +	 */
> +	DRM_UT_DRIVER,
> +	/**
> +	 * @DRM_UT_KMS: Used in the modesetting code.
> +	 */
> +	DRM_UT_KMS,
> +	/**
> +	 * @DRM_UT_PRIME: Used in the prime code.
> +	 */
> +	DRM_UT_PRIME,
> +	/**
> +	 * @DRM_UT_ATOMIC: Used in the atomic code.
> +	 */
> +	DRM_UT_ATOMIC,
> +	/**
> +	 * @DRM_UT_VBL: Used for verbose debug message in the vblank code.
> +	 */
> +	DRM_UT_VBL,
> +	/**
> +	 * @DRM_UT_STATE: Used for verbose atomic state debugging.
> +	 */
> +	DRM_UT_STATE,
> +	/**
> +	 * @DRM_UT_LEASE: Used in the lease code.
> +	 */
> +	DRM_UT_LEASE,
> +	/**
> +	 * @DRM_UT_DP: Used in the DP code.
> +	 */
> +	DRM_UT_DP,
> +	/**
> +	 * @DRM_UT_DRMRES: Used in the drm managed resources code.
> +	 */
> +	DRM_UT_DRMRES
> +};
> +
> +static inline bool drm_debug_enabled_raw(enum drm_debug_category categor=
y)
> +{
> +	return unlikely(__drm_debug & BIT(category));
> +}
> +
> +#define drm_debug_enabled_instrumented(category)			\
> +	({								\
> +		pr_debug("todo: is this frequent enough to optimize ?\n"); \
> +		drm_debug_enabled_raw(category);			\
> +	})
> +
> +#if defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
> +/*
> + * the drm.debug API uses dyndbg, so each drm_*dbg macro/callsite gets
> + * a descriptor, and only enabled callsites are reachable.  They use
> + * the private macro to avoid re-testing the enable-bit.
> + */
> +#define __drm_debug_enabled(category)	true
> +#define drm_debug_enabled(category)	drm_debug_enabled_instrumented(categ=
ory)
> +#else
> +#define __drm_debug_enabled(category)	drm_debug_enabled_raw(category)
> +#define drm_debug_enabled(category)	drm_debug_enabled_raw(category)
> +#endif
> +
>  /**
>   * struct drm_printer - drm output "stream"
>   *
> @@ -255,101 +350,6 @@ static inline struct drm_printer drm_err_printer(st=
ruct drm_device *drm,
>  	return p;
>  }
> =20
> -/**
> - * enum drm_debug_category - The DRM debug categories
> - *
> - * Each of the DRM debug logging macros use a specific category, and the=
 logging
> - * is filtered by the drm.debug module parameter. This enum specifies th=
e values
> - * for the interface.
> - *
> - * Each DRM_DEBUG_<CATEGORY> macro logs to DRM_UT_<CATEGORY> category, e=
xcept
> - * DRM_DEBUG() logs to DRM_UT_CORE.
> - *
> - * Enabling verbose debug messages is done through the drm.debug paramet=
er, each
> - * category being enabled by a bit:
> - *
> - *  - drm.debug=3D0x1 will enable CORE messages
> - *  - drm.debug=3D0x2 will enable DRIVER messages
> - *  - drm.debug=3D0x3 will enable CORE and DRIVER messages
> - *  - ...
> - *  - drm.debug=3D0x1ff will enable all messages
> - *
> - * An interesting feature is that it's possible to enable verbose loggin=
g at
> - * run-time by echoing the debug value in its sysfs node::
> - *
> - *   # echo 0xf > /sys/module/drm/parameters/debug
> - *
> - */
> -enum drm_debug_category {
> -	/* These names must match those in DYNAMIC_DEBUG_CLASSBITS */
> -	/**
> -	 * @DRM_UT_CORE: Used in the generic drm code: drm_ioctl.c, drm_mm.c,
> -	 * drm_memory.c, ...
> -	 */
> -	DRM_UT_CORE,
> -	/**
> -	 * @DRM_UT_DRIVER: Used in the vendor specific part of the driver: i915=
,
> -	 * radeon, ... macro.
> -	 */
> -	DRM_UT_DRIVER,
> -	/**
> -	 * @DRM_UT_KMS: Used in the modesetting code.
> -	 */
> -	DRM_UT_KMS,
> -	/**
> -	 * @DRM_UT_PRIME: Used in the prime code.
> -	 */
> -	DRM_UT_PRIME,
> -	/**
> -	 * @DRM_UT_ATOMIC: Used in the atomic code.
> -	 */
> -	DRM_UT_ATOMIC,
> -	/**
> -	 * @DRM_UT_VBL: Used for verbose debug message in the vblank code.
> -	 */
> -	DRM_UT_VBL,
> -	/**
> -	 * @DRM_UT_STATE: Used for verbose atomic state debugging.
> -	 */
> -	DRM_UT_STATE,
> -	/**
> -	 * @DRM_UT_LEASE: Used in the lease code.
> -	 */
> -	DRM_UT_LEASE,
> -	/**
> -	 * @DRM_UT_DP: Used in the DP code.
> -	 */
> -	DRM_UT_DP,
> -	/**
> -	 * @DRM_UT_DRMRES: Used in the drm managed resources code.
> -	 */
> -	DRM_UT_DRMRES
> -};
> -
> -static inline bool drm_debug_enabled_raw(enum drm_debug_category categor=
y)
> -{
> -	return unlikely(__drm_debug & BIT(category));
> -}
> -
> -#define drm_debug_enabled_instrumented(category)			\
> -	({								\
> -		pr_debug("todo: is this frequent enough to optimize ?\n"); \
> -		drm_debug_enabled_raw(category);			\
> -	})
> -
> -#if defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
> -/*
> - * the drm.debug API uses dyndbg, so each drm_*dbg macro/callsite gets
> - * a descriptor, and only enabled callsites are reachable.  They use
> - * the private macro to avoid re-testing the enable-bit.
> - */
> -#define __drm_debug_enabled(category)	true
> -#define drm_debug_enabled(category)	drm_debug_enabled_instrumented(categ=
ory)
> -#else
> -#define __drm_debug_enabled(category)	drm_debug_enabled_raw(category)
> -#define drm_debug_enabled(category)	drm_debug_enabled_raw(category)
> -#endif
> -
>  /*
>   * struct device based logging
>   *

Reviewed-by: Luca Coelho <luciano.coelho@intel.com>

--
Cheers,
Luca.
