Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5B8E5575BF
	for <lists+dri-devel@lfdr.de>; Thu, 23 Jun 2022 10:44:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D443113DBA;
	Thu, 23 Jun 2022 08:43:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75E45113DBA
 for <dri-devel@lists.freedesktop.org>; Thu, 23 Jun 2022 08:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655973836; x=1687509836;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=F9ewEiL6B3yhGSU5Sx5d3cuKZBIYPZln8nx7Pk7TwK4=;
 b=jl4EM0dIubphnbYfRnIAtDwXJaYvzYTRaCVmUsL5T1mOdbpJY2ZpquEz
 krRpjs4mVMz0DWVf9F2l8CjLqppR9ppuTtXZ6Rw9JRXls1OqsdJzYmTRW
 Y6Jxrw0G+vaAY9o0btD8y0/cELCcZOBsJWVl4eiziPTNeyI9AWroZZX/N
 Ri14Ew4MKiHwjFScG2xWWQqBW9UQ7tFfqlkzfd0fkgXFytUUpIhgHvB4N
 tkC1jodeZ9DuY8+edh3iwAMbdVZrkt93d/CJwZQKfqkK5QM9Fsp/zJUyC
 O2JeWaXuLippkV7OoF2DpjO/LirVrd8wsyGst5SovKBKJCHOWDcO4DSrc g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10386"; a="269388347"
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; d="scan'208";a="269388347"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 01:43:55 -0700
X-IronPort-AV: E=Sophos;i="5.92,215,1650956400"; d="scan'208";a="644635917"
Received: from gknielse-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.61.112])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Jun 2022 01:43:53 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Jouni =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 4/4] drm/i915: Use luminance range calculated during
 edid parsing
In-Reply-To: <20220620072019.2710652-5-jouni.hogander@intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220620072019.2710652-1-jouni.hogander@intel.com>
 <20220620072019.2710652-5-jouni.hogander@intel.com>
Date: Thu, 23 Jun 2022 11:43:50 +0300
Message-ID: <87k097rcqh.fsf@intel.com>
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
Cc: Jouni =?utf-8?Q?H=C3=B6gander?= <jouni.hogander@intel.com>,
 Manasi Navare <manasi.d.navare@intel.com>, Mika Kahola <mika.kahola@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, 20 Jun 2022, Jouni H=C3=B6gander <jouni.hogander@intel.com> wrote:
> Instead of using fixed 0 - 512 range use luminance range calculated
> as a part of edid parsing. As a backup fall back to static 0 - 512.
>
> v2: Use values calculated during edid parsing
>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Mika Kahola <mika.kahola@intel.com>
> Cc: Jani Nikula <jani.nikula@intel.com>
> Cc: Manasi Navare <manasi.d.navare@intel.com>
> Signed-off-by: Jouni H=C3=B6gander <jouni.hogander@intel.com>
> ---
>  .../drm/i915/display/intel_dp_aux_backlight.c   | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c b/driv=
ers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> index c92d5bb2326a..b2666bd67701 100644
> --- a/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> +++ b/drivers/gpu/drm/i915/display/intel_dp_aux_backlight.c
> @@ -276,8 +276,11 @@ intel_dp_aux_hdr_disable_backlight(const struct drm_=
connector_state *conn_state,
>  static int
>  intel_dp_aux_hdr_setup_backlight(struct intel_connector *connector, enum=
 pipe pipe)
>  {
> -	struct drm_i915_private *i915 =3D to_i915(connector->base.dev);
> +	struct drm_connector *conn_base =3D &connector->base;

Nitpick, we never call this "conn_base". Usually we try to avoid having
drm_connector as local variable altogether, but if you must, please name
it _connector or drm_connector.

> +	struct drm_i915_private *i915 =3D to_i915(conn_base->dev);
>  	struct intel_panel *panel =3D &connector->panel;
> +	struct drm_luminance_range_info *luminance_range =3D
> +		&conn_base->display_info.luminance_range;
>  	int ret;
>=20=20
>  	if (panel->backlight.edp.intel.sdr_uses_aux) {
> @@ -293,8 +296,16 @@ intel_dp_aux_hdr_setup_backlight(struct intel_connec=
tor *connector, enum pipe pi
>  		}
>  	}
>=20=20
> -	panel->backlight.max =3D 512;
> -	panel->backlight.min =3D 0;
> +	if (!luminance_range->max_luminance) {

Nitpick, I kind of dislike these "if (!something) ... else ..."
constructs when you could avoid the negative by switching it around.

> +		panel->backlight.max =3D 512;
> +		panel->backlight.min =3D 0;
> +	} else {
> +		panel->backlight.max =3D luminance_range->max_luminance;
> +		panel->backlight.min =3D luminance_range->min_luminance;
> +	}
> +
> +	drm_dbg(&i915->drm, "Using range %d..%d\n", panel->backlight.min, panel=
->backlight.max);

Please use drm_dbg_kms(). Please say *what* range this is. Otherwise,
you have to figure it out from the context and function names.

> +
>  	panel->backlight.level =3D intel_dp_aux_hdr_get_backlight(connector, pi=
pe);
>  	panel->backlight.enabled =3D panel->backlight.level !=3D 0;

--=20
Jani Nikula, Intel Open Source Graphics Center
