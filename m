Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 750A4AB4E1E
	for <lists+dri-devel@lfdr.de>; Tue, 13 May 2025 10:31:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68E0E10E1D8;
	Tue, 13 May 2025 08:31:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="U3XOp6Sg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF27E10E1D8
 for <dri-devel@lists.freedesktop.org>; Tue, 13 May 2025 08:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747125084; x=1778661084;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=7xVkCv5/WtRaQADfBp06Txnipb0t0/dIJvMLX4GArzg=;
 b=U3XOp6Sgb6N7S9/7oOHkUqzasWbV0R0ldM0+xT7UjNimughs6QO+P59V
 +XH2CIXQAXR2GRQVvzsKpMm+Skv6Q5hpIebnlTRHa8AilBOvYBKWq2kQZ
 uFCiN7nnON/VfEz93VRZpaeQ0BJ2j7OI6skrulqvPGGELVKXuYMnDPcGO
 8td6aQZx8uqwHr2UG9CUtFx+Pf+Zg8izUgTU5aNh0QoDMpUxhnI/z4rzv
 VrcLvQaIxQY30P8qgXUwDKhz9Knw5xE9VxnxUNPs4dQDJMfE7fcHBchfq
 r/qvf+MfNsdE9ZVoFloXniWNNM42Qgz6LFmBwLLKF/wN83dEHG3k3swlc A==;
X-CSE-ConnectionGUID: PGeGn4tITFOWBxYyJQldlA==
X-CSE-MsgGUID: 0hsaVrQGRiqwypW8okny8g==
X-IronPort-AV: E=McAfee;i="6700,10204,11431"; a="48854692"
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; d="scan'208";a="48854692"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 01:31:23 -0700
X-CSE-ConnectionGUID: RORnQEJ9Q0SC/t43H+X+FA==
X-CSE-MsgGUID: E/YNyvopT/6G2+YQY2Ub0Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,284,1739865600"; d="scan'208";a="137497947"
Received: from dalessan-mobl3.ger.corp.intel.com (HELO localhost)
 ([10.245.244.175])
 by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2025 01:31:19 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: feijuan.li@samsung.com, "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Cc: Hongfei Tang <hongfei.tang@samsung.com>, Minggui Yan
 <minggui.yan@samsung.com>, Qilin Wang <qilin.wang@samsung.com>
Subject: Re: [PATCH v2] drm/edid: fixed the bug that hdr metadata was not
 cleared
In-Reply-To: <20250513011145epcms5p84bf94d5c03933fd61f4abf1fadab5016@epcms5p8>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CGME20250416093607epcms5p344bcffd7430fe5e30ef9b73db73f7388@epcms5p8>
 <20250513011145epcms5p84bf94d5c03933fd61f4abf1fadab5016@epcms5p8>
Date: Tue, 13 May 2025 11:31:16 +0300
Message-ID: <87sel8j4iz.fsf@intel.com>
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

On Tue, 13 May 2025, Feijuan Li <feijuan.li@samsung.com> wrote:
> Dear maintainer:
>
> I have changed the patch as your suggestion.
> v1->v2:make a new function for hdr info reset.
>
>
> From: "feijuan.li" <feijuan.li@samsung.com>
> Date: Fri, 18 Apr 2025 14:56:49 +0000
> Subject: [PATCH v2] drm/edid: fixed the bug that hdr metadata was not res=
et
>
> When DP connected to a device with HDR capability,
> the hdr structure was filled.Then connected to another
> sink device without hdr capability, but the hdr info
> still exist.
>
> Signed-off-by: feijuan.li <feijuan.li@samsung.com>
> ---
> =C2=A0drivers/gpu/drm/drm_edid.c 6 ++++++
> =C2=A01 file changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 13bc4c290b17..cd0e4148f6b0 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -6576,6 +6576,11 @@ static void drm_update_mso(struct drm_connector *c=
onnector,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0displayid_iter_end(&iter);
> =C2=A0}
> =C2=A0
> +static void drm_reset_hdr_sink_metadata(struct drm_connector *connector)
> +{
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 memset(&connector->hdr_sink_metadata, 0, siz=
eof(connector->hdr_sink_metadata));

Please just put this memset inside drm_reset_display_info() right after:

	memset(&info->hdmi, 0, sizeof(info->hdmi));

I have local patches to move hdr_sink_metadata as part of display info
anyway. Adding an extra function here is a bit much.

There's also something wrong with the formatting here. Please use git
send-email.

BR,
Jani.

> +}
> +
> =C2=A0/* A connector has no EDID information, so we've got no EDID to com=
pute quirks from. Reset
> =C2=A0 * all of the values which would have been set from EDID
> =C2=A0 */
> @@ -6651,6 +6656,7 @@ static void update_display_info(struct drm_connecto=
r *connector,
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0struct drm_display_info *info =3D &conn=
ector->display_info;
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0const struct edid *edid;
> =C2=A0
> +=C2=A0 =C2=A0 =C2=A0 =C2=A0 drm_reset_hdr_sink_metadata(connector);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0drm_reset_display_info(connector);
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0clear_eld(connector);
> =C2=A0
> --=C2=A0
> 2.25.1
>
>

--=20
Jani Nikula, Intel
