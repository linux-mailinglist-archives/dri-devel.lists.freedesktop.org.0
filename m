Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67834A9164E
	for <lists+dri-devel@lfdr.de>; Thu, 17 Apr 2025 10:17:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83AC110E1AB;
	Thu, 17 Apr 2025 08:17:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ae7TWsXa";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6A0410E1AB
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Apr 2025 08:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744877859; x=1776413859;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version:content-transfer-encoding;
 bh=famL4S7dSUz6ZqSkOhO5qr/jBogojbZQw/LDmQPBaJY=;
 b=ae7TWsXab04i3Di06yJcmGEn8Xx2UjBXnkC7++cV1jHNaM0bDINJQpyW
 pf1ckwEl0Kjgxi4U74wGa+7QyaoPf43oXnTOj4iqQLVfGCEmEViad42JZ
 hgAXktyb5WqAf0Zw+HU8g1ex4KCOuJ8CNtFfUySp3v2gSDrTi7HDs0TSV
 e95+vGPZMTbb+IrV1vGLABgVdD0j7WfTVG878PmHsMCUCRBFo6CuHQ34B
 rQqXQKsFhkYIUCt0k5Qz8kkHVfzVAHZOIRF9D3LuRuB1Xxcb7JPizM4ww
 1rZKavIZjTHmkn4yF+KyRG8i7RzI0b8Y/PaCjgaNGcXshr7me5rmDlVOS A==;
X-CSE-ConnectionGUID: +LXBxI82RgC1ygBudDusBw==
X-CSE-MsgGUID: 8QGQ/BokQ6OTlFReqG25Yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11405"; a="46350303"
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="46350303"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 01:17:37 -0700
X-CSE-ConnectionGUID: 1dMtVV7VSHycZhybUS0TLg==
X-CSE-MsgGUID: YKdHnijbSj63DUoadOSldA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,218,1739865600"; d="scan'208";a="131264234"
Received: from dprybysh-mobl.ger.corp.intel.com (HELO localhost)
 ([10.245.246.139])
 by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Apr 2025 01:17:26 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: feijuan.li@samsung.com, "jingoohan1@gmail.com" <jingoohan1@gmail.com>,
 "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
 "mripard@kernel.org" <mripard@kernel.org>, "tzimmermann@suse.de"
 <tzimmermann@suse.de>, "airlied@gmail.com" <airlied@gmail.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>, "dri-devel@lists.freedesktop.org"
 <dri-devel@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
Cc: =?utf-8?B?5ZSQ57qi6aOe?= <hongfei.tang@samsung.com>, =?utf-8?B?5Lil?=
 =?utf-8?B?5piO6LS1?= <minggui.yan@samsung.com>
Subject: Re: [PATCH] drm/edid: fixed the bug that hdr metadata was not cleared
In-Reply-To: <20250416093607epcms5p344bcffd7430fe5e30ef9b73db73f7388@epcms5p3>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <CGME20250416093607epcms5p344bcffd7430fe5e30ef9b73db73f7388@epcms5p3>
 <20250416093607epcms5p344bcffd7430fe5e30ef9b73db73f7388@epcms5p3>
Date: Thu, 17 Apr 2025 11:17:23 +0300
Message-ID: <87cydbp5gs.fsf@intel.com>
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

On Wed, 16 Apr 2025, =E6=9D=8E=E9=A3=9E=E5=A8=9F <feijuan.li@samsung.com> w=
rote:
> From a34a1e2dd7aacd45f18775564fce12b03ae4009c Mon Sep 17 00:00:00 2001
> From: "feijuan.li" <feijuan.li@samsung.com>
> Date: Wed, 16 Apr 2025 11:07:39 +0000
> Subject: [PATCH] drm/edid: fixed the bug that hdr metadata was not cleared
>
> When DP connected to a device with HDR capability,
> the hdr structure was filled.Then connected to another
> sink device without hdr capability, but the hdr info
> still exist.
>
> Signed-off-by: feijuan.li <feijuan.li@samsung.com>
> ---
>  drivers/gpu/drm/drm_edid.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
> index 13bc4c290b17..5cf5d30321b6 100644
> --- a/drivers/gpu/drm/drm_edid.c
> +++ b/drivers/gpu/drm/drm_edid.c
> @@ -5607,6 +5607,7 @@ static void clear_eld(struct drm_connector *connect=
or)
>  {
>  	mutex_lock(&connector->eld_mutex);
>  	memset(connector->eld, 0, sizeof(connector->eld));
> +	memset(&connector->hdr_sink_metadata, 0, sizeof(connector->hdr_sink_met=
adata));

hdr_sink_metadata is not related to ELD, and should not be cleared
within clear_eld().

I think this should be cleared in drm_reset_display_info(), and
long-term fields like this should be moved within display info.

BR,
Jani.

>  	mutex_unlock(&connector->eld_mutex);
>=20=20
>  	connector->latency_present[0] =3D false;

--=20
Jani Nikula, Intel
