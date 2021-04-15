Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5E6360F66
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 17:50:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25CF56EA7A;
	Thu, 15 Apr 2021 15:50:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDCB56EA79;
 Thu, 15 Apr 2021 15:50:45 +0000 (UTC)
IronPort-SDR: xqUY0gqXfyrFnOOMm9ZxmTlzhWDN+9qvvGUwHh3+gfePNwQuZloFzb45PhFM1iLItTu/iE3Caa
 pcXC+pQIJkiw==
X-IronPort-AV: E=McAfee;i="6200,9189,9955"; a="191687754"
X-IronPort-AV: E=Sophos;i="5.82,225,1613462400"; d="scan'208";a="191687754"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Apr 2021 08:50:42 -0700
IronPort-SDR: lhluqeXrSSgzmFMmrkJm9YGQF6Ah1BYE/QTlAHpmuvIDMXRnpQoJV872zukMofZbYqmeIddV2D
 7MvpaAqiXWDg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,225,1613462400"; d="scan'208";a="384053803"
Received: from stinkbox.fi.intel.com (HELO stinkbox) ([10.237.72.171])
 by orsmga006.jf.intel.com with SMTP; 15 Apr 2021 08:50:38 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 15 Apr 2021 18:50:37 +0300
Date: Thu, 15 Apr 2021 18:50:37 +0300
From: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
To: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
Subject: Re: [PATCH v2] drm/i915: Fix "mitigations" parsing if i915 is builtin
Message-ID: <YHhgzVkSDDkm95FJ@intel.com>
References: <20210414140643.620c3adb@xhacker.debian>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210414140643.620c3adb@xhacker.debian>
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
Cc: David Airlie <airlied@linux.ie>, intel-gfx@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Chris Wilson <chris@chris-wilson.co.uk>,
 Jon Bloomfield <jon.bloomfield@intel.com>, dri-devel@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Apr 14, 2021 at 02:06:43PM +0800, Jisheng Zhang wrote:
> I met below error during boot with i915 builtin if pass
> "i915.mitigations=3Doff":
> [    0.015589] Booting kernel: `off' invalid for parameter `i915.mitigati=
ons'
> =

> The reason is slab subsystem isn't ready at that time, so kstrdup()
> returns NULL. Fix this issue by using stack var instead of kstrdup().
> =

> Fixes: 984cadea032b ("drm/i915: Allow the sysadmin to override security m=
itigations")
> Signed-off-by: Jisheng Zhang <Jisheng.Zhang@synaptics.com>
> ---
> Since v1:
>  - Ensure "str" is properly terminated. Thanks Ville for pointing this ou=
t.
> =

>  drivers/gpu/drm/i915/i915_mitigations.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
> =

> diff --git a/drivers/gpu/drm/i915/i915_mitigations.c b/drivers/gpu/drm/i9=
15/i915_mitigations.c
> index 84f12598d145..231aad5ff46c 100644
> --- a/drivers/gpu/drm/i915/i915_mitigations.c
> +++ b/drivers/gpu/drm/i915/i915_mitigations.c
> @@ -29,15 +29,14 @@ bool i915_mitigate_clear_residuals(void)
>  static int mitigations_set(const char *val, const struct kernel_param *k=
p)
>  {
>  	unsigned long new =3D ~0UL;
> -	char *str, *sep, *tok;
> +	char str[64], *sep, *tok;
>  	bool first =3D true;
>  	int err =3D 0;
>  =

>  	BUILD_BUG_ON(ARRAY_SIZE(names) >=3D BITS_PER_TYPE(mitigations));
>  =

> -	str =3D kstrdup(val, GFP_KERNEL);
> -	if (!str)
> -		return -ENOMEM;
> +	strncpy(str, val, sizeof(str) - 1);
> +	str[sizeof(str) - 1] =3D '\0';

Looks correct, however strscpy() seems to be the thing we should
be using these days.

>  =

>  	for (sep =3D str; (tok =3D strsep(&sep, ","));) {
>  		bool enable =3D true;
> @@ -86,7 +85,6 @@ static int mitigations_set(const char *val, const struc=
t kernel_param *kp)
>  			break;
>  		}
>  	}
> -	kfree(str);
>  	if (err)
>  		return err;
>  =

> -- =

> 2.31.0

-- =

Ville Syrj=E4l=E4
Intel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
