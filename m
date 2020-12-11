Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2A5A2D7966
	for <lists+dri-devel@lfdr.de>; Fri, 11 Dec 2020 16:33:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C99BD6E842;
	Fri, 11 Dec 2020 15:33:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC4276E842
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Dec 2020 15:33:21 +0000 (UTC)
IronPort-SDR: Cadv96qsRxd/sFIFfeZN6ocwhqrHzyPdTEUtmxGBYxImHEKlZ1rnX9Mguxz/9v9mkkQnzzPnD4
 jXknc7K6mkuA==
X-IronPort-AV: E=McAfee;i="6000,8403,9832"; a="174594065"
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; d="scan'208";a="174594065"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2020 07:30:31 -0800
IronPort-SDR: sud/gx2DkmOYPu6zNeA/cfbA3SsUZTOq1vp4hJ00ByPeHNZVu1jsq+YCvkirxSYJelySQL7UEo
 h2bEcDxcCDLg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.78,411,1599548400"; d="scan'208";a="409282889"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.174])
 by orsmga001.jf.intel.com with SMTP; 11 Dec 2020 07:30:28 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 11 Dec 2020 17:30:27 +0200
Date: Fri, 11 Dec 2020 17:30:27 +0200
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Subject: Re: [RFC PATCH 1/2] drm: RFC add choice to use dynamic debug in
 drm-debug
Message-ID: <X9OQkyWYBpBb+PDC@intel.com>
References: <20201204035318.332419-1-jim.cromie@gmail.com>
 <20201204035318.332419-2-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201204035318.332419-2-jim.cromie@gmail.com>
X-Patchwork-Hint: comment
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
Cc: David Airlie <airlied@linux.ie>, Thomas Zimmermann <tzimmermann@suse.de>,
 jbaron@akamai.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Dec 03, 2020 at 08:53:17PM -0700, Jim Cromie wrote:
> drm's debug system uses distinct categories of debug messages, mapped
> to bits in drm.debug.  Currently, code does a lot of unlikely bit-mask
> checks on drm.debug (in drm_debug_enabled), we can use dynamic debug
> instead, and get all that jump_label goodness.
> =

> RFC: dynamic debug has no concept of category, but we can do without
> one if we can prepend a class-prefix to each printk format.  Then we
> can use "format ^prefix" to select the whole category with one query.
> This is a log-facing and user visible change, but it seems unlikely to
> cause trouble for log watchers; they're not relying on the absence of
> class prefix strings.
> =

> This conversion yields ~2100 new callsites on my i7 laptop:
> =

>   dyndbg: 195 debug prints in module drm_kms_helper
>   dyndbg: 298 debug prints in module drm
>   dyndbg: 1630 debug prints in module i915
> =

> Since this change has wide-ranging effects (many drm drivers, with
> many callsites, and kernel image growth), and most vendors don't
> enable DYNAMIC_DEBUG, we supplement the existing mechanism, adding
> CONFIG_DRM_USE_DYNAMIC_DEBUG to enable the new one.
> =

> The indirection/switchover has a few parts:
> =

> 1 a new callback on drm.debug which calls dynamic_debug_exec_queries
>   to map those bits to specific query/commands
>   dynamic_debug_exec_queries("format ^drm:kms: +p", "drm*");
> =

> 2 a "converted" or "classy" DRM_UT_* map
>   similar to DRM_UT_* ( symbol =3D> bit-mask )
>   named it  cDRM_UT_* ( symbol =3D> format-class-prefix-string )
> =

>   cDRM_UT_* is either ( CONFIG_DRM_USE_DYNAMIC_DEBUG )
>   legacy: cDRM_UT_* <-- DRM_UT_*
>   enabled:
>   +#define cDRM_UT_KMS    "drm:kms: "
>   +#define cDRM_UT_PRIME  "drm:prime: "
>   +#define cDRM_UT_ATOMIC "drm:atomic: "
> =

>   these are similar to "gvt: cmd:" in i915/gvt
>   and effectively a replacement for DRM_NAME
>   please bikeshed on keys, values. latter are log-facing.
> =

> 3 drm_dev_dbg & drm_debug are renamed (prefixed with '_')
>   old names are now macros, which are ifdefd
>   legacy:  -> to renamed fn
>   enabled: -> dev_dbg & pr_debug, after prepending prefix to format.
> =

> 4 names in (2) are called from DRM_DEBUG_<Category> and drm_dbg_<Category=
>.
>   all these get "converted" to use cDRM_UT_*, to get right token type.
> =

> RFC: for dynamic debug, category is a source-facing addition;
> something like pr_debug_cat(cat, ...) would do it, iff cat is a
> compile-time const.  Note that cat isn't needed in the printing, it
> would be saved into a new field in struct _ddebug, and used only for
> callsite selection, activation and control.
> =

> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---
>  drivers/gpu/drm/Kconfig     | 13 ++++++
>  drivers/gpu/drm/drm_print.c | 75 ++++++++++++++++++++++++++++--
>  include/drm/drm_print.h     | 92 +++++++++++++++++++++++++++----------
>  3 files changed, 153 insertions(+), 27 deletions(-)
> =

> diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
> index 147d61b9674e..854bc1ad21fb 100644
> --- a/drivers/gpu/drm/Kconfig
> +++ b/drivers/gpu/drm/Kconfig
> @@ -54,6 +54,19 @@ config DRM_DEBUG_MM
>  =

>  	  If in doubt, say "N".
>  =

> +config DRM_USE_DYNAMIC_DEBUG
> +	bool "use dynamic debug to implement drm.debug"
> +	default n
> +	depends on DRM
> +	depends on DYNAMIC_DEBUG
> +	depends on JUMP_LABEL
> +	help
> +	  The drm debug category facility does a lot of unlikely bit-field
> +	  tests at runtime; while cheap individually, the cost accumulates.
> +	  This option uses dynamic debug facility (if configured and
> +	  using jump_label) to avoid those runtime checks, patching
> +	  the kernel when those debugs are desired.
> +
>  config DRM_DEBUG_SELFTEST
>  	tristate "kselftests for DRM"
>  	depends on DRM
> diff --git a/drivers/gpu/drm/drm_print.c b/drivers/gpu/drm/drm_print.c
> index 111b932cf2a9..e2acdfc7088b 100644
> --- a/drivers/gpu/drm/drm_print.c
> +++ b/drivers/gpu/drm/drm_print.c
> @@ -52,8 +52,75 @@ MODULE_PARM_DESC(debug, "Enable debug output, where ea=
ch bit enables a debug cat
>  "\t\tBit 5 (0x20)  will enable VBL messages (vblank code)\n"
>  "\t\tBit 7 (0x80)  will enable LEASE messages (leasing code)\n"
>  "\t\tBit 8 (0x100) will enable DP messages (displayport code)");
> +
> +#ifndef CONFIG_DRM_USE_DYNAMIC_DEBUG
>  module_param_named(debug, __drm_debug, int, 0600);
>  =

> +#else
> +static char *format_class_prefixes[] =3D {
> +	cDRM_UT_CORE,
> +	cDRM_UT_DRIVER,
> +	cDRM_UT_KMS,
> +	cDRM_UT_PRIME,
> +	cDRM_UT_ATOMIC,
> +	cDRM_UT_VBL,
> +	cDRM_UT_STATE,
> +	cDRM_UT_LEASE,
> +	cDRM_UT_DP,
> +	cDRM_UT_DRMRES
> +};
> +
> +#define OUR_QUERY_SIZE 64 /* > strlen "format '^%s' %cp" + longest prefi=
x */
> +
> +static int param_set_dyndbg(const char *instr, const struct kernel_param=
 *kp)
> +{
> +	unsigned int val;
> +	unsigned long changes, result;
> +	int rc, chgct =3D 0, totct =3D 0, bitpos;
> +	char query[OUR_QUERY_SIZE];
> +
> +	rc =3D kstrtouint(instr, 0, &val);
> +	if (rc) {
> +		pr_err("%s: failed\n", __func__);
> +		return -EINVAL;
> +	}
> +	result =3D val;
> +	changes =3D result ^ __drm_debug;
> +
> +	pr_debug("changes:0x%lx from result:0x%lx\n", changes, result);
> +
> +	for_each_set_bit(bitpos, &changes, ARRAY_SIZE(format_class_prefixes)) {
> +
> +		sprintf(query, "format '^%s' %cp", format_class_prefixes[bitpos],
> +			test_bit(bitpos, &result) ? '+' : '-');
> +
> +		chgct =3D dynamic_debug_exec_queries(query, "drm*");
> +		if (chgct < 0) {
> +			pr_err("%s: exec err:%d on: %s\n", __func__, chgct, query);
> +			continue;
> +		}
> +		pr_debug("change ct:%d on %s\n", chgct, query);
> +		totct +=3D chgct;
> +	}
> +	pr_debug("total changes: %d\n", totct);
> +	__drm_debug =3D result;
> +	return 0;
> +}

Is there an actual need to go through dyndbg and do all this stringy
stuff, or would just eg. a static keys array for the debug categories
get us the benefits of jump_label?

> +
> +static int param_get_dyndbg(char *buffer, const struct kernel_param *kp)
> +{
> +	pr_debug("debug-val:0x%x %u\n", __drm_debug, *((unsigned int *)kp->arg)=
);
> +	return scnprintf(buffer, PAGE_SIZE, "%u\n",
> +			 *((unsigned int *)kp->arg));
> +}
> +static const struct kernel_param_ops param_ops_debug =3D {
> +	.set =3D param_set_dyndbg,
> +	.get =3D param_get_dyndbg,
> +};
> +module_param_cb(debug, &param_ops_debug, &__drm_debug, 0644);
> +
> +#endif /* CONFIG_DRM_USE_DYNAMIC_DEBUG */
> +
>  void __drm_puts_coredump(struct drm_printer *p, const char *str)
>  {
>  	struct drm_print_iterator *iterator =3D p->arg;
> @@ -256,7 +323,7 @@ void drm_dev_printk(const struct device *dev, const c=
har *level,
>  }
>  EXPORT_SYMBOL(drm_dev_printk);
>  =

> -void drm_dev_dbg(const struct device *dev, enum drm_debug_category categ=
ory,
> +void _drm_dev_dbg(const struct device *dev, enum drm_debug_category cate=
gory,
>  		 const char *format, ...)
>  {
>  	struct va_format vaf;
> @@ -278,9 +345,9 @@ void drm_dev_dbg(const struct device *dev, enum drm_d=
ebug_category category,
>  =

>  	va_end(args);
>  }
> -EXPORT_SYMBOL(drm_dev_dbg);
> +EXPORT_SYMBOL(_drm_dev_dbg);
>  =

> -void __drm_dbg(enum drm_debug_category category, const char *format, ...)
> +void ___drm_dbg(enum drm_debug_category category, const char *format, ..=
.)
>  {
>  	struct va_format vaf;
>  	va_list args;
> @@ -297,7 +364,7 @@ void __drm_dbg(enum drm_debug_category category, cons=
t char *format, ...)
>  =

>  	va_end(args);
>  }
> -EXPORT_SYMBOL(__drm_dbg);
> +EXPORT_SYMBOL(___drm_dbg);
>  =

>  void __drm_err(const char *format, ...)
>  {
> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index f32d179e139d..2bd5c38aa100 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -319,6 +319,51 @@ enum drm_debug_category {
>  	DRM_UT_DRMRES		=3D 0x200,
>  };
>  =

> +#if !defined(CONFIG_DRM_USE_DYNAMIC_DEBUG)
> +
> +/* Use legacy drm-debug functions, implying drm_debug_enabled().
> + * For cDRM_UT_* (converted category), identity map to DRM_UT_*
> + */
> +#define __drm_dbg(cls, fmt, ...)					\
> +	___drm_dbg(cls, fmt, ##__VA_ARGS__)
> +#define drm_dev_dbg(dev, cls, fmt, ...)					\
> +	_drm_dev_dbg(dev, cls, fmt, ##__VA_ARGS__)
> +
> +#define cDRM_UT_CORE	DRM_UT_CORE
> +#define cDRM_UT_DRIVER	DRM_UT_DRIVER
> +#define cDRM_UT_KMS	DRM_UT_KMS
> +#define cDRM_UT_PRIME	DRM_UT_PRIME
> +#define cDRM_UT_ATOMIC	DRM_UT_ATOMIC
> +#define cDRM_UT_VBL	DRM_UT_VBL
> +#define cDRM_UT_STATE	DRM_UT_STATE
> +#define cDRM_UT_LEASE	DRM_UT_LEASE
> +#define cDRM_UT_DP	DRM_UT_DP
> +#define cDRM_UT_DRMRES	DRM_UT_DRMRES
> +
> +#else /* CONFIG_DRM_USE_DYNAMIC_DEBUG */
> +
> +/* use dynamic_debug to avoid drm_debug_enabled.
> + * dyndbg has no category, so we prefix format with a class-string,
> + * and alter cDRM_UT_* to provide those class strings
> + */
> +#define __drm_dbg(cls, fmt, ...)					\
> +	pr_debug(cls # fmt, ##__VA_ARGS__)
> +#define drm_dev_dbg(dev, cls, fmt, ...)					\
> +	dev_dbg(dev, cls fmt, ##__VA_ARGS__)
> +
> +#define cDRM_UT_CORE	"drm:core: "
> +#define cDRM_UT_DRIVER	"drm:drvr: "
> +#define cDRM_UT_KMS	"drm:kms: "
> +#define cDRM_UT_PRIME	"drm:prime: "
> +#define cDRM_UT_ATOMIC	"drm:atomic: "
> +#define cDRM_UT_VBL	"drm:vbl: "
> +#define cDRM_UT_STATE	"drm:state: "
> +#define cDRM_UT_LEASE	"drm:lease: "
> +#define cDRM_UT_DP	"drm:dp: "
> +#define cDRM_UT_DRMRES	"drm:res "
> +
> +#endif /* !CONFIG_DRM_USE_DYNAMIC_DEBUG */
> +
>  static inline bool drm_debug_enabled(enum drm_debug_category category)
>  {
>  	return unlikely(__drm_debug & category);
> @@ -334,7 +379,7 @@ __printf(3, 4)
>  void drm_dev_printk(const struct device *dev, const char *level,
>  		    const char *format, ...);
>  __printf(3, 4)
> -void drm_dev_dbg(const struct device *dev, enum drm_debug_category categ=
ory,
> +void _drm_dev_dbg(const struct device *dev, enum drm_debug_category cate=
gory,
>  		 const char *format, ...);
>  =

>  /**
> @@ -383,7 +428,7 @@ void drm_dev_dbg(const struct device *dev, enum drm_d=
ebug_category category,
>   * @fmt: printf() like format string.
>   */
>  #define DRM_DEV_DEBUG(dev, fmt, ...)					\
> -	drm_dev_dbg(dev, DRM_UT_CORE, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg(dev, cDRM_UT_CORE, fmt, ##__VA_ARGS__)
>  /**
>   * DRM_DEV_DEBUG_DRIVER() - Debug output for vendor specific part of the=
 driver
>   *
> @@ -391,7 +436,7 @@ void drm_dev_dbg(const struct device *dev, enum drm_d=
ebug_category category,
>   * @fmt: printf() like format string.
>   */
>  #define DRM_DEV_DEBUG_DRIVER(dev, fmt, ...)				\
> -	drm_dev_dbg(dev, DRM_UT_DRIVER,	fmt, ##__VA_ARGS__)
> +	drm_dev_dbg(dev, cDRM_UT_DRIVER, fmt, ##__VA_ARGS__)
>  /**
>   * DRM_DEV_DEBUG_KMS() - Debug output for modesetting code
>   *
> @@ -443,25 +488,25 @@ void drm_dev_dbg(const struct device *dev, enum drm=
_debug_category category,
>  =

>  =

>  #define drm_dbg_core(drm, fmt, ...)					\
> -	drm_dev_dbg((drm)->dev, DRM_UT_CORE, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg((drm)->dev, cDRM_UT_CORE, fmt, ##__VA_ARGS__)
>  #define drm_dbg(drm, fmt, ...)						\
> -	drm_dev_dbg((drm)->dev, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg((drm)->dev, cDRM_UT_DRIVER, fmt, ##__VA_ARGS__)
>  #define drm_dbg_kms(drm, fmt, ...)					\
> -	drm_dev_dbg((drm)->dev, DRM_UT_KMS, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg((drm)->dev, cDRM_UT_KMS, fmt, ##__VA_ARGS__)
>  #define drm_dbg_prime(drm, fmt, ...)					\
> -	drm_dev_dbg((drm)->dev, DRM_UT_PRIME, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg((drm)->dev, cDRM_UT_PRIME, fmt, ##__VA_ARGS__)
>  #define drm_dbg_atomic(drm, fmt, ...)					\
> -	drm_dev_dbg((drm)->dev, DRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg((drm)->dev, cDRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
>  #define drm_dbg_vbl(drm, fmt, ...)					\
> -	drm_dev_dbg((drm)->dev, DRM_UT_VBL, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg((drm)->dev, cDRM_UT_VBL, fmt, ##__VA_ARGS__)
>  #define drm_dbg_state(drm, fmt, ...)					\
> -	drm_dev_dbg((drm)->dev, DRM_UT_STATE, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg((drm)->dev, cDRM_UT_STATE, fmt, ##__VA_ARGS__)
>  #define drm_dbg_lease(drm, fmt, ...)					\
> -	drm_dev_dbg((drm)->dev, DRM_UT_LEASE, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg((drm)->dev, cDRM_UT_LEASE, fmt, ##__VA_ARGS__)
>  #define drm_dbg_dp(drm, fmt, ...)					\
> -	drm_dev_dbg((drm)->dev, DRM_UT_DP, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg((drm)->dev, cDRM_UT_DP, fmt, ##__VA_ARGS__)
>  #define drm_dbg_drmres(drm, fmt, ...)					\
> -	drm_dev_dbg((drm)->dev, DRM_UT_DRMRES, fmt, ##__VA_ARGS__)
> +	drm_dev_dbg((drm)->dev, cDRM_UT_DRMRES, fmt, ##__VA_ARGS__)
>  =

>  =

>  /*
> @@ -471,7 +516,7 @@ void drm_dev_dbg(const struct device *dev, enum drm_d=
ebug_category category,
>   */
>  =

>  __printf(2, 3)
> -void __drm_dbg(enum drm_debug_category category, const char *format, ...=
);
> +void ___drm_dbg(enum drm_debug_category category, const char *format, ..=
.);
>  __printf(1, 2)
>  void __drm_err(const char *format, ...);
>  =

> @@ -500,29 +545,30 @@ void __drm_err(const char *format, ...);
>  #define DRM_ERROR_RATELIMITED(fmt, ...)					\
>  	DRM_DEV_ERROR_RATELIMITED(NULL, fmt, ##__VA_ARGS__)
>  =

> +
>  #define DRM_DEBUG(fmt, ...)						\
> -	__drm_dbg(DRM_UT_CORE, fmt, ##__VA_ARGS__)
> +	__drm_dbg(cDRM_UT_CORE, fmt, ##__VA_ARGS__)
>  =

>  #define DRM_DEBUG_DRIVER(fmt, ...)					\
> -	__drm_dbg(DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
> +	__drm_dbg(cDRM_UT_DRIVER, fmt, ##__VA_ARGS__)
>  =

>  #define DRM_DEBUG_KMS(fmt, ...)						\
> -	__drm_dbg(DRM_UT_KMS, fmt, ##__VA_ARGS__)
> +	__drm_dbg(cDRM_UT_KMS, fmt, ##__VA_ARGS__)
>  =

>  #define DRM_DEBUG_PRIME(fmt, ...)					\
> -	__drm_dbg(DRM_UT_PRIME, fmt, ##__VA_ARGS__)
> +	__drm_dbg(cDRM_UT_PRIME, fmt, ##__VA_ARGS__)
>  =

>  #define DRM_DEBUG_ATOMIC(fmt, ...)					\
> -	__drm_dbg(DRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
> +	__drm_dbg(cDRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
>  =

>  #define DRM_DEBUG_VBL(fmt, ...)						\
> -	__drm_dbg(DRM_UT_VBL, fmt, ##__VA_ARGS__)
> +	__drm_dbg(cDRM_UT_VBL, fmt, ##__VA_ARGS__)
>  =

>  #define DRM_DEBUG_LEASE(fmt, ...)					\
> -	__drm_dbg(DRM_UT_LEASE, fmt, ##__VA_ARGS__)
> +	__drm_dbg(cDRM_UT_LEASE, fmt, ##__VA_ARGS__)
>  =

>  #define DRM_DEBUG_DP(fmt, ...)						\
> -	__drm_dbg(DRM_UT_DP, fmt, ## __VA_ARGS__)
> +	__drm_dbg(cDRM_UT_DP, fmt, ## __VA_ARGS__)
>  =

>  =

>  #define DRM_DEBUG_KMS_RATELIMITED(fmt, ...)				\
> @@ -531,7 +577,7 @@ void __drm_err(const char *format, ...);
>  				      DEFAULT_RATELIMIT_INTERVAL,       \
>  				      DEFAULT_RATELIMIT_BURST);         \
>  	if (__ratelimit(&_rs))						\
> -		drm_dev_dbg(NULL, DRM_UT_KMS, fmt, ##__VA_ARGS__);	\
> +		drm_dev_dbg(NULL, cDRM_UT_KMS, fmt, ##__VA_ARGS__);	\
>  })
>  =

>  /*
> -- =

> 2.28.0
> =

> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
