Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6214E4159B0
	for <lists+dri-devel@lfdr.de>; Thu, 23 Sep 2021 10:01:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9C0A6ECFC;
	Thu, 23 Sep 2021 08:01:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D51DB6ECF6;
 Thu, 23 Sep 2021 08:01:06 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10115"; a="246237859"
X-IronPort-AV: E=Sophos;i="5.85,316,1624345200"; 
 d="asc'?scan'208";a="246237859"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Sep 2021 01:01:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,316,1624345200"; 
 d="asc'?scan'208";a="550748427"
Received: from zhen-hp.sh.intel.com (HELO zhen-hp) ([10.239.160.143])
 by FMSMGA003.fm.intel.com with ESMTP; 23 Sep 2021 01:01:03 -0700
Date: Thu, 23 Sep 2021 15:36:59 +0800
From: Zhenyu Wang <zhenyuw@linux.intel.com>
To: Jim Cromie <jim.cromie@gmail.com>
Cc: jbaron@akamai.com, gregkh@linuxfoundation.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, daniel@ffwll.ch
Subject: Re: [PATCH v8 10/16] i915/gvt: remove spaces in pr_debug "gvt:
 core:" etc prefixes
Message-ID: <20210923073659.GZ14689@zhen-hp.sh.intel.com>
References: <20210915163957.2949166-1-jim.cromie@gmail.com>
 <20210915163957.2949166-11-jim.cromie@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature"; boundary="Bu8it7iiRSEf40bY"
Content-Disposition: inline
In-Reply-To: <20210915163957.2949166-11-jim.cromie@gmail.com>
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
Reply-To: Zhenyu Wang <zhenyuw@linux.intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


--Bu8it7iiRSEf40bY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 2021.09.15 10:39:51 -0600, Jim Cromie wrote:
> Taking embedded spaces out of existing prefixes makes them better
> class-prefixes; simplifying the extra quoting needed otherwise:
>=20
>   $> echo format "^gvt: core:" +p >control
>=20
> Dropping the internal spaces means any trailing space in a query will
> more clearly terminate the prefix being searched for.
>=20
> Consider a generic drm-debug example:
>=20
>   # turn off ATOMIC reports
>   echo format "^drm:atomic: " -p > control
>=20
>   # turn off all ATOMIC:* reports, including any sub-categories
>   echo format "^drm:atomic:" -p > control
>=20
>   # turn on ATOMIC:FAIL: reports
>   echo format "^drm:atomic:fail: " +p > control
>=20
> Removing embedded spaces in the class-prefixes simplifies the
> corresponding match-prefix.  This means that "quoted" match-prefixes
> are only needed when the trailing space is desired, in order to
> exclude explicitly sub-categorized pr-debugs; in this example,
> "drm:atomic:fail:".
>=20
> RFC: maybe the prefix catenation should paste in the " " class-prefix
> terminator explicitly.  A pr_debug_() flavor could exclude the " ",
> allowing ad-hoc sub-categorization by appending for example, "fail:"
> to "drm:atomic:" without the default " " insertion.
>=20
> Signed-off-by: Jim Cromie <jim.cromie@gmail.com>
> ---
> v8:
> . fix patchwork CI warning
> ---
>  drivers/gpu/drm/i915/gvt/debug.h | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/i915/gvt/debug.h b/drivers/gpu/drm/i915/gvt/=
debug.h
> index c6027125c1ec..bbecc279e077 100644
> --- a/drivers/gpu/drm/i915/gvt/debug.h
> +++ b/drivers/gpu/drm/i915/gvt/debug.h
> @@ -36,30 +36,30 @@ do {									\
>  } while (0)
> =20
>  #define gvt_dbg_core(fmt, args...) \
> -	pr_debug("gvt: core: "fmt, ##args)
> +	pr_debug("gvt:core: " fmt, ##args)
> =20
>  #define gvt_dbg_irq(fmt, args...) \
> -	pr_debug("gvt: irq: "fmt, ##args)
> +	pr_debug("gvt:irq: " fmt, ##args)
> =20
>  #define gvt_dbg_mm(fmt, args...) \
> -	pr_debug("gvt: mm: "fmt, ##args)
> +	pr_debug("gvt:mm: " fmt, ##args)
> =20
>  #define gvt_dbg_mmio(fmt, args...) \
> -	pr_debug("gvt: mmio: "fmt, ##args)
> +	pr_debug("gvt:mmio: " fmt, ##args)
> =20
>  #define gvt_dbg_dpy(fmt, args...) \
> -	pr_debug("gvt: dpy: "fmt, ##args)
> +	pr_debug("gvt:dpy: " fmt, ##args)
> =20
>  #define gvt_dbg_el(fmt, args...) \
> -	pr_debug("gvt: el: "fmt, ##args)
> +	pr_debug("gvt:el: " fmt, ##args)
> =20
>  #define gvt_dbg_sched(fmt, args...) \
> -	pr_debug("gvt: sched: "fmt, ##args)
> +	pr_debug("gvt:sched: " fmt, ##args)
> =20
>  #define gvt_dbg_render(fmt, args...) \
> -	pr_debug("gvt: render: "fmt, ##args)
> +	pr_debug("gvt:render: " fmt, ##args)
> =20
>  #define gvt_dbg_cmd(fmt, args...) \
> -	pr_debug("gvt: cmd: "fmt, ##args)
> +	pr_debug("gvt:cmd: " fmt, ##args)
> =20
>  #endif
> --=20

Looks good to me. Thanks!

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>

--Bu8it7iiRSEf40bY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQTXuabgHDW6LPt9CICxBBozTXgYJwUCYUwulgAKCRCxBBozTXgY
J8qzAJ9cfZulZLyzqg5hhI9G1fLDqKMDlQCgi+YapDkpvZuzya6guQeaCyf+Nps=
=+ZKA
-----END PGP SIGNATURE-----

--Bu8it7iiRSEf40bY--
