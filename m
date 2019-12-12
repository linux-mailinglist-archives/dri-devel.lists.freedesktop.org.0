Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E38811D8D1
	for <lists+dri-devel@lfdr.de>; Thu, 12 Dec 2019 22:53:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E05376E20C;
	Thu, 12 Dec 2019 21:53:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BA806E101;
 Thu, 12 Dec 2019 21:53:08 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id D1C2820030;
 Thu, 12 Dec 2019 22:53:04 +0100 (CET)
Date: Thu, 12 Dec 2019 22:53:03 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Jani Nikula <jani.nikula@intel.com>
Subject: Re: [PATCH 1/8] drm/print: introduce new struct drm_device based
 logging macros
Message-ID: <20191212215303.GA11520@ravnborg.org>
References: <20191210123050.8799-1-jani.nikula@intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191210123050.8799-1-jani.nikula@intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=8nJEP1OIZ-IA:10 a=7gkXJVJtAAAA:8
 a=QyXUC8HyAAAA:8 a=WwEPFlQGcVPyZ2Fg1gUA:9 a=wPNLvfGTeEIA:10
 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: intel-gfx@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 dri-devel@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jani.

On Tue, Dec 10, 2019 at 02:30:43PM +0200, Jani Nikula wrote:
> Add new struct drm_device based logging macros modeled after the core
> kernel device based logging macros. These would be preferred over the
> drm printk and struct device based macros in drm code, where possible.
> =

> We have existing drm specific struct device based logging functions, but
> they are too verbose to use for two main reasons:
> =

>  * The names are unnecessarily long, for example DRM_DEV_DEBUG_KMS().
> =

>  * The use of struct device over struct drm_device is too generic for
>    most users, leading to an extra dereference.
> =

> For example:
> =

> 	DRM_DEV_DEBUG_KMS(drm->dev, "Hello, world\n");
> =

> vs.
> =

> 	drm_dbg_kms(drm, "Hello, world\n");
> =

> It's a matter of taste, but the SHOUTING UPPERCASE has been argued to be
> less readable than lowercase.
> =

> Some names are changed from old DRM names to be based on the core kernel
> logging functions. For example, NOTE -> notice, ERROR -> err, DEBUG ->
> dbg.
> =

> Due to the conflation of DRM_DEBUG and DRM_DEBUG_DRIVER macro use
> (DRM_DEBUG is used widely in drivers though it's supposed to be a core
> debugging category), they are named as drm_dbg_core and drm_dbg,
> respectively.
> =

> The drm_err and _once/_ratelimited variants no longer include the
> function name in order to be able to use the core device based logging
> macros. Arguably this is not a significant change; error messages should
> not be so common to be only distinguishable by the function name.
> =

> Ratelimited debug logging macros are to be added later.
> =

> Cc: Sam Ravnborg <sam@ravnborg.org>
> Acked-by: Ville Syrj=E4l=E4 <ville.syrjala@linux.intel.com>
> Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Acked-by: Sean Paul <sean@poorly.run>
> Signed-off-by: Jani Nikula <jani.nikula@intel.com>

To my sensitive eyes the lower case variants are much preferable.

As a follow-up it could be nice to clean up drm_print.h:
- Make it obvious that the old variants are deprecated
- Let the old variants use the new variants - to make it obvious they
  are obsolete wrappers.
- Add some intro that explains for newbies when to use what variant

And then add a todo item - so we can get some janitorials to help with the
conversion to the new varaints.


For logging we have three cases:
- We have a drm_device pointer - nicely covered by this patchset
- We have a device * - what do we do here?
- We have no pointers to device nor drm_device - what do we do here?

Would it be OK to consider drm variants for all the above - so we get
consistent prefix on logging?

Idea:

drm_<level>[_system] - example: drm_info(drm_device *, ..) or drm_info_core=
(drm_device *, ..)

drm_dev_<level>[_system] - example: drm_dev_info(device *, ..)

drm_pr_<level>[_system] - example: drm_pr_info(..)

level could be info, info_once, info_ratelimited and so on for dbg, err,
notice, warn

With the above I can see we can make a clean shift to drm based logging.
And we do not need to mix different ways to log stuf.

The preferred:
drm_info()
drm_dev_info()
drm_pr_info()

versus:
drm_info()
dev_info()
pr_info()

The patch is OK without the suggested change, but see this as
suggestions for improvements.
So patch as is has my:
Acked-by: Sam Ravnborg <sam@ravnborg.org>


	Sam


> =

> ---
> =

> With something like this, I think i915 could start migrating to
> drm_device based logging. I have a hard time convincing myself or anyone
> about migrating to the DRM_DEV_* variants.
> ---
>  include/drm/drm_print.h | 65 +++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
> =

> diff --git a/include/drm/drm_print.h b/include/drm/drm_print.h
> index 085a9685270c..8f99d389792d 100644
> --- a/include/drm/drm_print.h
> +++ b/include/drm/drm_print.h
> @@ -322,6 +322,8 @@ static inline bool drm_debug_enabled(enum drm_debug_c=
ategory category)
>  =

>  /*
>   * struct device based logging
> + *
> + * Prefer drm_device based logging over device or prink based logging.
>   */
>  =

>  __printf(3, 4)
> @@ -417,8 +419,71 @@ void drm_dev_dbg(const struct device *dev, enum drm_=
debug_category category,
>  	_DRM_DEV_DEFINE_DEBUG_RATELIMITED(dev, DRM_UT_PRIME,		\
>  					  fmt, ##__VA_ARGS__)
>  =

> +/*
> + * struct drm_device based logging
> + *
> + * Prefer drm_device based logging over device or prink based logging.
> + */
> +
> +/* Helper for struct drm_device based logging. */
> +#define __drm_printk(drm, level, type, fmt, ...)			\
> +	dev_##level##type((drm)->dev, "[drm] " fmt, ##__VA_ARGS__)
> +
> +
> +#define drm_info(drm, fmt, ...)					\
> +	__drm_printk((drm), info,, fmt, ##__VA_ARGS__)
> +
> +#define drm_notice(drm, fmt, ...)				\
> +	__drm_printk((drm), notice,, fmt, ##__VA_ARGS__)
> +
> +#define drm_warn(drm, fmt, ...)					\
> +	__drm_printk((drm), warn,, fmt, ##__VA_ARGS__)
> +
> +#define drm_err(drm, fmt, ...)					\
> +	__drm_printk((drm), err,, "*ERROR* " fmt, ##__VA_ARGS__)
> +
> +
> +#define drm_info_once(drm, fmt, ...)				\
> +	__drm_printk((drm), info, _once, fmt, ##__VA_ARGS__)
> +
> +#define drm_notice_once(drm, fmt, ...)				\
> +	__drm_printk((drm), notice, _once, fmt, ##__VA_ARGS__)
> +
> +#define drm_warn_once(drm, fmt, ...)				\
> +	__drm_printk((drm), warn, _once, fmt, ##__VA_ARGS__)
> +
> +#define drm_err_once(drm, fmt, ...)				\
> +	__drm_printk((drm), err, _once, "*ERROR* " fmt, ##__VA_ARGS__)
> +
> +
> +#define drm_err_ratelimited(drm, fmt, ...)				\
> +	__drm_printk((drm), err, _ratelimited, "*ERROR* " fmt, ##__VA_ARGS__)
> +
> +
> +#define drm_dbg_core(drm, fmt, ...)					\
> +	drm_dev_dbg((drm)->dev, DRM_UT_CORE, fmt, ##__VA_ARGS__)
> +#define drm_dbg(drm, fmt, ...)						\
> +	drm_dev_dbg((drm)->dev, DRM_UT_DRIVER, fmt, ##__VA_ARGS__)
> +#define drm_dbg_kms(drm, fmt, ...)					\
> +	drm_dev_dbg((drm)->dev, DRM_UT_KMS, fmt, ##__VA_ARGS__)
> +#define drm_dbg_prime(drm, fmt, ...)					\
> +	drm_dev_dbg((drm)->dev, DRM_UT_PRIME, fmt, ##__VA_ARGS__)
> +#define drm_dbg_atomic(drm, fmt, ...)					\
> +	drm_dev_dbg((drm)->dev, DRM_UT_ATOMIC, fmt, ##__VA_ARGS__)
> +#define drm_dbg_vbl(drm, fmt, ...)					\
> +	drm_dev_dbg((drm)->dev, DRM_UT_VBL, fmt, ##__VA_ARGS__)
> +#define drm_dbg_state(drm, fmt, ...)					\
> +	drm_dev_dbg((drm)->dev, DRM_UT_STATE, fmt, ##__VA_ARGS__)
> +#define drm_dbg_lease(drm, fmt, ...)					\
> +	drm_dev_dbg((drm)->dev, DRM_UT_LEASE, fmt, ##__VA_ARGS__)
> +#define drm_dbg_dp(drm, fmt, ...)					\
> +	drm_dev_dbg((drm)->dev, DRM_UT_DP, fmt, ##__VA_ARGS__)
> +
> +
>  /*
>   * printk based logging
> + *
> + * Prefer drm_device based logging over device or prink based logging.
>   */
>  =

>  __printf(2, 3)
> -- =

> 2.20.1
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
