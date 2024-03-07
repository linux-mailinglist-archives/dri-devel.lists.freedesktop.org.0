Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09BDC874993
	for <lists+dri-devel@lfdr.de>; Thu,  7 Mar 2024 09:27:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CBB910F202;
	Thu,  7 Mar 2024 08:27:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YBd2WnFW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2BCC10F202;
 Thu,  7 Mar 2024 08:27:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1709800059; x=1741336059;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:to:subject:from:cc:message-id:date;
 bh=ulYlFZq32K9jOmqyoqOs/Z5jeTVGLC6Oth42YMlqJT4=;
 b=YBd2WnFWfeeQuqyAPBMXSXaeUksN3MCptiYQ4Lml9rVzBd1VO/nlFnUa
 krRtBkAQ85UPZeF7AZrVAnU01qgbzBELgIiSSupJIwYhhM2ogcaLE4s4D
 ox12NgrQCCcSHaGUia1FFLRQwQW9WNY5LGeWOLDeqCD0WP7NS5zsdvTx5
 YC264dE0McEvnCMop0NFke0Pe8yFwGq67IAFGGxAhK/yt4yxsCdI+3wFx
 KK9pW7RBp3aLjA+D86/UCMvEa2JwLHi9kFKLTRnefAqweELT6Orzq2JUH
 14RfVA5rWp6ac2JSjMXPi2hYWQuB4OA6h3kG2O1/+BuI+NPcq/ka55Wel g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11005"; a="26930909"
X-IronPort-AV: E=Sophos;i="6.06,210,1705392000"; d="scan'208";a="26930909"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 00:27:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,210,1705392000"; d="scan'208";a="33192969"
Received: from unknown (HELO localhost) ([10.245.244.162])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Mar 2024 00:27:35 -0800
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240307131027.66be2266@canb.auug.org.au>
References: <20240307131027.66be2266@canb.auug.org.au>
To: Daniel Vetter <daniel.vetter@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: linux-next: manual merge of the drm tree with the drm-intel-fixes
 tree
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Intel Graphics <intel-gfx@lists.freedesktop.org>,
 DRI <dri-devel@lists.freedesktop.org>, Animesh Manna <animesh.manna@intel.com>,
 Imre Deak <imre.deak@intel.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Linux Next Mailing List <linux-next@vger.kernel.org>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <170980005216.6042.11359885960417882116@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Thu, 07 Mar 2024 10:27:32 +0200
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

Quoting Stephen Rothwell (2024-03-07 04:10:27)
> Hi all,
>=20
> Today's linux-next merge of the drm tree got a conflict in:
>=20
>   drivers/gpu/drm/i915/display/intel_dp.c
>=20
> between commit:
>=20
>   984318aaf7b6 ("drm/i915/panelreplay: Move out psr_init_dpcd() from init=
_connector()")
>=20
> from the drm-intel-fixes tree and commit:
>=20
>   e60cff453b82 ("drm/i915/dp: Enable DP tunnel BW allocation mode")
>=20
> from the drm tree.
>=20
> I fixed it up (see below) and can carry the fix as necessary. This
> is now fixed as far as linux-next is concerned, but any non trivial
> conflicts should be mentioned to your upstream maintainer when your tree
> is submitted for merging.  You may also want to consider cooperating
> with the maintainer of the conflicting tree to minimise any particularly
> complex conflicts.
>=20
> --=20
> Cheers,
> Stephen Rothwell
>=20
> diff --cc drivers/gpu/drm/i915/display/intel_dp.c
> index 94d2a15d8444,6ece2c563c7a..000000000000
> --- a/drivers/gpu/drm/i915/display/intel_dp.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
> @@@ -5699,9 -5702,13 +5702,16 @@@ intel_dp_detect(struct drm_connector *c
>                 goto out;
>         }
>  =20
> +       ret =3D intel_dp_tunnel_detect(intel_dp, ctx);
> +       if (ret =3D=3D -EDEADLK)
> +               return ret;
> +=20
> +       if (ret =3D=3D 1)
> +               intel_connector->base.epoch_counter++;
> +=20
>  +      if (!intel_dp_is_edp(intel_dp))
>  +              intel_psr_init_dpcd(intel_dp);
>  +

Hi,

This is the right resolution, should be cleared up shortly once the
drm-intel-fixes PR is pulled.

Regards, Joonas

>         intel_dp_detect_dsc_caps(intel_dp, intel_connector);
>  =20
>         intel_dp_configure_mst(intel_dp);
