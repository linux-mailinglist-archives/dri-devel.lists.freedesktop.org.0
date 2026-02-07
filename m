Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DWmASeTh2kYaAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Sat, 07 Feb 2026 20:31:51 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92E2A106F91
	for <lists+dri-devel@lfdr.de>; Sat, 07 Feb 2026 20:31:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D37F10E2B1;
	Sat,  7 Feb 2026 19:31:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="evBJTQV4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-g125.zoho.com (sender4-pp-g125.zoho.com
 [136.143.188.125])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DABC10E2B1;
 Sat,  7 Feb 2026 19:31:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1770492691; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=RdYdF7c/7RKURWe83WyERwWuC0yeeolV/HdBzGsCxqcpxL0mkFACmfTt3/4NpZ3OPDinHq6e5n7zbReS59t8n4L15hQO7U4nS8Fn2tTltElnkncw44fcngP1AzCyfoM7c8XaQUiSPZqkbCiCu1DktWNekdpxcACDCAt59MRy8aI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1770492691;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=BWnnE4c8SQWwH+plB/G8amDEzU/xZKpBUTD5dL9L0SU=; 
 b=Re6ehi0jHhfhcXeU5/Wcel1vSM/nbf3eUn4zLT2HuBpR8KwW09QN7DLyDHZbf6ijMUCiRxsF+PCikeRSy3usv/g319xt3au/Kl8FUvyYtHLKZtOGDNMFRu2qD7kpUxw8NRT2SKuuUMvUnFdxsfzPvDT5EKE3EJPl0JkSQmFBjik=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
 dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1770492691; 
 s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-ID:In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:Content-Type:Message-Id:Reply-To;
 bh=BWnnE4c8SQWwH+plB/G8amDEzU/xZKpBUTD5dL9L0SU=;
 b=evBJTQV48BJoXeW9eksUfGNDL8f9WrQ191uHnGjm27R4bEhAOi3K2P49kQH5poEp
 yBkUs87eqn4KX7O6Iw+RewkgV9Vptiu/GBndvntL5vn5lDe9fPnEXqpBgml8bLsfbTW
 4iwQ1sonD2B0Akv+l6dv8Hf85aL9HNlIGFgwCxX0=
Received: by mx.zohomail.com with SMTPS id 1770492689402527.0990853831929;
 Sat, 7 Feb 2026 11:31:29 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
To: Andy Yan <andyshrk@163.com>
Cc: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?UTF-8?B?S8O2bmln?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Sandy Huang <hjc@rock-chips.com>,
 Heiko =?UTF-8?B?U3TDvGJuZXI=?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, kernel@collabora.com,
 amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v7 10/22] drm/rockchip: vop2: Fix YUV444 output
Date: Sat, 07 Feb 2026 20:31:21 +0100
Message-ID: <1945994.tdWV9SEqCh@workhorse>
In-Reply-To: <4c9ce287.fbb.19be87814b8.Coremail.andyshrk@163.com>
References: <20260121-color-format-v7-0-ef790dae780c@collabora.com>
 <6631107.DvuYhMxLoT@workhorse>
 <4c9ce287.fbb.19be87814b8.Coremail.andyshrk@163.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.31 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[163.com];
	RCVD_COUNT_THREE(0.00)[3];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	RCPT_COUNT_TWELVE(0.00)[37];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[nicolas.frattaroli@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[amd.com,igalia.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,suse.de,intel.com,linaro.org,ideasonboard.com,kwiboo.se,rock-chips.com,sntech.de,ursulin.net,pengutronix.de,lwn.net,collabora.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 92E2A106F91
X-Rspamd-Action: no action

Hi Andy,

On Friday, 23 January 2026 02:29:02 Central European Standard Time Andy Yan=
 wrote:
>=20
> Hello Nicolas,
>=20
> =E5=9C=A8 2026-01-22 20:59:41=EF=BC=8C"Nicolas Frattaroli" <nicolas.fratt=
aroli@collabora.com> =E5=86=99=E9=81=93=EF=BC=9A
> >On Thursday, 22 January 2026 09:28:54 Central European Standard Time And=
y Yan wrote:
> >>=20
> >> Hello Nicolas=EF=BC=8C
> >>=20
> >> At 2026-01-21 22:45:17, "Nicolas Frattaroli" <nicolas.frattaroli@colla=
bora.com> wrote:
> >> >YUV444 (aka YCbCr444) output isn't working quite right on RK3588. The
> >> >resulting image on the display, while identifying itself as YUV444, h=
as
> >> >some components swapped, even after adding the necessary DRM formats =
to
> >> >the conversion functions.
> >> >
> >> >Judging by downstream, this is because YUV444 also needs an rb swap
> >> >performed in the AFBC case.
> >> >
> >> >Add the DRM formats to the appropriate switch statements, and add a
> >> >function for checking whether an rb swap needs to be performed in the
> >> >AFBC case.
> >> >
> >> >Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")
> >> >Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
> >> >---
> >> > drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 19 +++++++++++++++++++
> >> > 1 file changed, 19 insertions(+)
> >> >
> >> >diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/g=
pu/drm/rockchip/rockchip_drm_vop2.c
> >> >index ec3b4fde10db..469c63dd97d5 100644
> >> >--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> >> >+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> >> >@@ -176,6 +176,7 @@ static enum vop2_data_format vop2_convert_format(=
u32 format)
> >> > 	case DRM_FORMAT_ARGB2101010:
> >> > 	case DRM_FORMAT_XBGR2101010:
> >> > 	case DRM_FORMAT_ABGR2101010:
> >> >+	case DRM_FORMAT_VUY101010:
> >> > 		return VOP2_FMT_XRGB101010;
> >> > 	case DRM_FORMAT_XRGB8888:
> >> > 	case DRM_FORMAT_ARGB8888:
> >> >@@ -184,6 +185,7 @@ static enum vop2_data_format vop2_convert_format(=
u32 format)
> >> > 		return VOP2_FMT_ARGB8888;
> >> > 	case DRM_FORMAT_RGB888:
> >> > 	case DRM_FORMAT_BGR888:
> >> >+	case DRM_FORMAT_VUY888:
> >> > 		return VOP2_FMT_RGB888;
> >> > 	case DRM_FORMAT_RGB565:
> >> > 	case DRM_FORMAT_BGR565:
> >> >@@ -225,6 +227,7 @@ static enum vop2_afbc_format vop2_convert_afbc_fo=
rmat(u32 format)
> >> > 	case DRM_FORMAT_ARGB2101010:
> >> > 	case DRM_FORMAT_XBGR2101010:
> >> > 	case DRM_FORMAT_ABGR2101010:
> >> >+	case DRM_FORMAT_VUY101010:
> >> > 		return VOP2_AFBC_FMT_ARGB2101010;
> >> > 	case DRM_FORMAT_XRGB8888:
> >> > 	case DRM_FORMAT_ARGB8888:
> >> >@@ -233,6 +236,7 @@ static enum vop2_afbc_format vop2_convert_afbc_fo=
rmat(u32 format)
> >> > 		return VOP2_AFBC_FMT_ARGB8888;
> >> > 	case DRM_FORMAT_RGB888:
> >> > 	case DRM_FORMAT_BGR888:
> >> >+	case DRM_FORMAT_VUY888:
> >>=20
> >> How did you test this format? It seems tools like modetest don=E2=80=
=99t support testing this pattern.
> >>=20
> >
> >Hi Andy,
> >
> >using the rest of this series, which implements the "color format"
> >DRM property, and the corresponding weston MR that makes use of it[1].
> >
> >I create a ~/.config/weston.ini with the following contents:
> >
> >    [output]
> >    name=3DHDMI-A-1
> >    color-format=3Dyuv444
> >
> >This will make Weston try to set the output format to 10-bit YUV444. To
> >limit it to 8-bit, you can add `max-bpc=3D8`. The monitor's EDID needs to
> >report YUV444 support, otherwise that Weston version won't let you set
> >this property.
> >
>=20
>=20
> This looks a bit strange. Your commit message and the Weston configuratio=
n here both target the output format,=20
> but the patch modifies the functions vop2_convert_format and vop2_convert=
_afbc_format, which are responsible for
> converting the data formats of planes/framebuffers (fb)=E2=80=94these hav=
e nothing to do with the output format.

Yep, I've now re-tested this in various ways and this commit doesn't do
what I thought it did. I think when I authored it, this was still doing
BCSH based conversion and may have depended on this at some stage. Also
possible that I didn't do a clean test run of solely these changes to
come to my conclusions.

YUV444 primary planes aren't supported by RK3588 at all from what I gather,
so I have no clue where I ran into this and how this fixed it.

Testing on RK3576 without this, and also playing around with gbm-format,
I also don't ever get into the situation where this is needed for correct
output; it seems like EGLConfig always only exposes RGBA formats anyway,
so Panfrost may still lack YUV format support for the buffers.

I'll drop this patch on the next revision, but I'll keep the changes in
mind if an atomic modesetting test workload that sets YUV plane formats
ever comes to be.

Thanks for the reviews!

Kind regards,
Nicolas Frattaroli

>=20
>=20
> >Link: https://gitlab.freedesktop.org/wayland/weston/-/merge_requests/185=
9 [1]
> >
> >Kind regards,
> >Nicolas Frattaroli
> >
> >>=20
> >>=20
> >> > 		return VOP2_AFBC_FMT_RGB888;
> >> > 	case DRM_FORMAT_RGB565:
> >> > 	case DRM_FORMAT_BGR565:
> >> >@@ -270,6 +274,19 @@ static bool vop2_win_rb_swap(u32 format)
> >> > 	}
> >> > }
> >> >=20
> >> >+static bool vop2_afbc_rb_swap(u32 format)
> >> >+{
> >> >+	switch (format) {
> >> >+	case DRM_FORMAT_NV24:
> >> >+	case DRM_FORMAT_NV30:
> >> >+	case DRM_FORMAT_VUY888:
> >> >+	case DRM_FORMAT_VUY101010:
> >> >+		return true;
> >> >+	default:
> >> >+		return false;
> >> >+	}
> >> >+}
> >> >+
> >> > static bool vop2_afbc_uv_swap(u32 format)
> >> > {
> >> > 	switch (format) {
> >> >@@ -1291,6 +1308,7 @@ static void vop2_plane_atomic_update(struct drm=
_plane *plane,
> >> > 		 /* It's for head stride, each head size is 16 byte */
> >> > 		stride =3D ALIGN(stride, block_w) / block_w * 16;
> >> >=20
> >> >+		rb_swap =3D vop2_afbc_rb_swap(fb->format->format);
> >> > 		uv_swap =3D vop2_afbc_uv_swap(fb->format->format);
> >> > 		/*
> >> > 		 * This is a workaround for crazy IC design, Cluster
> >> >@@ -1308,6 +1326,7 @@ static void vop2_plane_atomic_update(struct drm=
_plane *plane,
> >> > 			vop2_win_write(win, VOP2_WIN_AFBC_ENABLE, 1);
> >> > 		vop2_win_write(win, VOP2_WIN_AFBC_FORMAT, afbc_format);
> >> > 		vop2_win_write(win, VOP2_WIN_AFBC_UV_SWAP, uv_swap);
> >> >+		vop2_win_write(win, VOP2_WIN_AFBC_RB_SWAP, rb_swap);
> >> > 		/*
> >> > 		 * On rk3566/8, this bit is auto gating enable,
> >> > 		 * but this function is not work well so we need
> >> >
> >>=20
> >
> >
> >
> >
>=20




