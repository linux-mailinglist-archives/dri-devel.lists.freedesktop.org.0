Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6A098D065
	for <lists+dri-devel@lfdr.de>; Wed,  2 Oct 2024 11:47:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C4D910E1FD;
	Wed,  2 Oct 2024 09:47:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b+1uwqNI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72D9510E1FD
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Oct 2024 09:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727862430; x=1759398430;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=XyurVa8vYczAlrYAS0phuWQWZQvHbMQRuvs3FL6u+HE=;
 b=b+1uwqNIIo0zo2b5hAnbEHHXgrUx4+pp+qIDzVIq3aa/gPsU9yuKCuSZ
 hVGo34aaHlOR0FYsw5scQaM5xGed475PMHzGLBIJbrKgAJNyb9cFqCwsP
 1lIOJI7Dk7q9OHvKMWveZBnHrw4clQhLnFDoij3TcoaJakBNrANL7fUtP
 GSFVl7WWNDI9ShiSjj/Q46e7Ck+qDgV/VKdLSKehyA3HibzpI4RiCKP4N
 Oazar4fRYqEVVYIetwy73PmmyIDyE0pzmsuCpj2I+LUcx6LnqK9MvHMz1
 SaIIgvWicCR5B8dznL3KBiEDIx3rzNJvk5UeSK0QU8UNQL8W/KWEATsSL Q==;
X-CSE-ConnectionGUID: iI3C1/74Sym3tkWK0d1QFw==
X-CSE-MsgGUID: M+jlwLFjQGe82octYH74zA==
X-IronPort-AV: E=McAfee;i="6700,10204,11212"; a="30905597"
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="30905597"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 02:47:09 -0700
X-CSE-ConnectionGUID: PGBZ4HCrQMmasu3DCvrD9Q==
X-CSE-MsgGUID: olV7U+jISF6QbBeswjZoBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,171,1725346800"; d="scan'208";a="74065627"
Received: from lbogdanm-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.246.49])
 by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2024 02:47:07 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Brahmajit Das <brahmajit.xyz@gmail.com>
Cc: ville.syrjala@linux.intel.com, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v3] drm/display: Fix building with GCC 15
In-Reply-To: <20241002092311.942822-1-brahmajit.xyz@gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20241002090703.919591-1-brahmajit.xyz@gmail.com>
 <20241002092311.942822-1-brahmajit.xyz@gmail.com>
Date: Wed, 02 Oct 2024 12:47:04 +0300
Message-ID: <871q0yvntz.fsf@intel.com>
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

On Wed, 02 Oct 2024, Brahmajit Das <brahmajit.xyz@gmail.com> wrote:
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
> dp_dual_mode_hdmi_id array by one, so that it can accommodate the NULL
> line character. This should let us build the kernel with GCC 15.

Still s/NULL line/NUL/ but this can be fixed while applying, no need to
resend.

Reviewed-by: Jani Nikula <jani.nikula@intel.com>


>
> Signed-off-by: Brahmajit Das <brahmajit.xyz@gmail.com>
> ---
>  drivers/gpu/drm/display/drm_dp_dual_mode_helper.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c b/drivers/=
gpu/drm/display/drm_dp_dual_mode_helper.c
> index 14a2a8473682..c491e3203bf1 100644
> --- a/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
> +++ b/drivers/gpu/drm/display/drm_dp_dual_mode_helper.c
> @@ -160,11 +160,11 @@ EXPORT_SYMBOL(drm_dp_dual_mode_write);
>=20=20
>  static bool is_hdmi_adaptor(const char hdmi_id[DP_DUAL_MODE_HDMI_ID_LEN])
>  {
> -	static const char dp_dual_mode_hdmi_id[DP_DUAL_MODE_HDMI_ID_LEN] =3D
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
