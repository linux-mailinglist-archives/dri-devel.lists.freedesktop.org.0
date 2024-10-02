Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4AC98CEBC
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 10:26:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1ABD10E306;
	Wed,  2 Oct 2024 08:26:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="J97ivb0I";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A770E10E306
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 08:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727857576; x=1759393576;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=lEmUZm2JXAlECUx2uKMZXJKbUvtfduKbG5PUIAcQEPU=;
 b=J97ivb0IvGBE1WxmcdefRDwbVfcK034HVOWJ049tNgnT0tPgo01yynzP
 4O5Q3gJOtj1L0A0EAzJRYy3Vskcbgy6iGBLKPAPorZZmHj9H6hc9q71xa
 Lmol37VhZlF280IYYfy2ocywgS26RGFfTA2uvO7HeB5kBkEJ+5xo7FoKU
 FJWXPFRgXtmJPQRrwlY8++PynTrNQmEu/q0o7mj25KQ9JMsgZPa/SKEBh
 o7869BKCvnDqIfqXKYKO42si3ptXuchUXGLQfc16by1menet0G57SD6/D
 +/Crr07KIzFv2rGrwYZ1lch+v0U3Z9fw8D7x+SKtUzHwDv7+ObTGt+NRP g==;
X-CSE-ConnectionGUID: iv+qO6WDRziLHGr27pdEmg==
X-CSE-MsgGUID: IP/8rIUsRiafPNXXEk+z6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="26480052"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="26480052"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 01:26:15 -0700
X-CSE-ConnectionGUID: GToK5MA0S+ywKOXYgvptRg==
X-CSE-MsgGUID: ciOSX0zkSt2aRbAYXlnpnA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="74050689"
Received: from lbogdanm-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.49])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 01:26:13 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Brahmajit Das <brahmajit.xyz@gmail.com>, dri-devel@lists.freedesktop.org
Cc: ville.syrjala@linux.intel.com
Subject: Re: [PATCH 1/1] drm/display: Fix building with GCC 15
In-Reply-To: <20241001144224.3492196-1-brahmajit.xyz@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241001144224.3492196-1-brahmajit.xyz@gmail.com>
Date: Wed, 02 Oct 2024 11:26:10 +0300
Message-ID: <87a5fmvrkt.fsf@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 01 Oct 2024, Brahmajit Das <brahmajit.xyz@gmail.com> wrote:
> GCC 15 enables -Werror=3Dunterminated-string-initialization by default.
> This results in the following build error
>
> drivers/gpu/drm/display/drm_dp_dual_mode_helper.c: In function =E2=80=98i=
s_hdmi_adaptor=E2=80=99:
> drivers/gpu/drm/display/drm_dp_dual_mode_helper.c:164:17: error: initiali=
zer-string for array of
>  =E2=80=98char=E2=80=99 is too long [-Werror=3Dunterminated-string-initia=
lization]
>   164 |                 "DP-HDMI ADAPTOR\x04";
>       |                 ^~~~~~~~~~~~~~~~~~~~~
>
> After discussion with Ville, the fix was to increase the size of
> dp_dual_mode_hdmi_id array by one, so that it can accommodate the new
> line character. This should let us build the kernel with GCC 15.

Should be terminating NUL, not new line.

>
> Signed-off-by: Brahmajit Das <brahmajit.xyz@gmail.com>
> ---
>  drivers/gpu/drm/display/drm_dp_dual_mode_helper.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c b/drivers/=
gpu/drm/display/drm_dp_dual_mode_helper.c
> index 14a2a8473682..295375868db6 100644
> --- a/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
> @@ -160,11 +160,12 @@ EXPORT_SYMBOL(drm_dp_dual_mode_write);
>=20=20
>  static bool is_hdmi_adaptor(const char hdmi_id[DP_DUAL_MODE_HDMI_ID_LEN])
>  {
> -	static const char dp_dual_mode_hdmi_id[DP_DUAL_MODE_HDMI_ID_LEN] =3D
> +	//+1 to avaoid spurious -Werror=3Dunterminated-string-initialization wa=
rning

If we added comments for every little thing like this, there'd be more
comments than code. ;)

> +	static const char dp_dual_mode_hdmi_id[DP_DUAL_MODE_HDMI_ID_LEN + 1] =3D
>  		"DP-HDMI ADAPTOR\x04";
>=20=20
>  	return memcmp(hdmi_id, dp_dual_mode_hdmi_id,
> -		      sizeof(dp_dual_mode_hdmi_id)) =3D=3D 0;
> +		      DP_DUAL_MODE_HDMI_ID_LEN) =3D=3D 0;
>  }
>=20=20
>  static bool is_type1_adaptor(uint8_t adaptor_id)

--=20
Jani Nikula, Intel
