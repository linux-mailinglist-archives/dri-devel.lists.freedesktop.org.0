Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qDX/Mcqyd2l2kQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 19:30:34 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 377888C1A0
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 19:30:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73D8D10E460;
	Mon, 26 Jan 2026 18:30:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nfraprado@collabora.com header.b="AcaowKzp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-e105.zoho.com (sender4-pp-e105.zoho.com
 [136.143.188.105])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0353110E46F
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 18:30:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1769452215; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=nTShMgbUt3DXdgrTr8iXm4Y4DAOwXbPQU9MUY2TK0SxsMMgXv3PdAbEPwsbQUapdCyaXm4N4+HLA+ZlYOzC0m2k2tedIIeK7lwLTM0QFXB0OKm0Vgoj1JIyU4m0nMgxF1FAH+3/VicisnpIxq0Q1cwXg/XplCYn6iWCxZ07v28I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1769452215;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=hVd6diwc3mTM+TJy/I3dVmE0Ngl9ll/ws0dV8fch0dw=; 
 b=lcTAcL1SKd8QSh1VmvxeHjesbMxCMrLMnNxOfHdmbXzx1HET4G9agqSleiWQVeX9V8BFNt4t45qvf9GKrkyuIApz9Uu6S6151GXZ6CrtUNfQ3tWJAvIh+QiMkWOvbKBQQvshFaiTGn44rra7RJQiOREcsAyP7CYBBMokqkO+DCk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nfraprado@collabora.com;
 dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769452215; 
 s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=hVd6diwc3mTM+TJy/I3dVmE0Ngl9ll/ws0dV8fch0dw=;
 b=AcaowKzpQTCzeaB33CnHLyfNtNEUQwRSJaQc72i/QVBSZhd4ZuO11PF1wE3OY3EC
 LfAEjmuT+Pk43Ht3wyJKPX6B72EWLGqjUeaj8SoOxT+JUfDpnEus+IUIC0Vc335TQ5C
 Nwb8YuSs/OLWlMHMaIkQSXEyoD6kytPui3Gm0A08=
Received: by mx.zohomail.com with SMTPS id 1769452213766652.6163551638421;
 Mon, 26 Jan 2026 10:30:13 -0800 (PST)
Message-ID: <d85cf4b299e929770a1b7f5be7ae61d76306e7d1.camel@collabora.com>
Subject: Re: [PATCH v4 4/4] drm/rockchip: vop2: Support setting custom
 background color
From: =?ISO-8859-1?Q?N=EDcolas?= "F. R. A. Prado" <nfraprado@collabora.com>
To: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sandy Huang	 <hjc@rock-chips.com>, Heiko
 =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>,  Andy Yan
 <andy.yan@rock-chips.com>, Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed	 <hamohammed.sa@gmail.com>, Melissa Wen
 <melissa.srw@gmail.com>
Cc: Robert Mader <robert.mader@collabora.com>, kernel@collabora.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
Date: Mon, 26 Jan 2026 15:30:07 -0300
In-Reply-To: <20251219-rk3588-bgcolor-v4-4-2ff1127ea757@collabora.com>
References: <20251219-rk3588-bgcolor-v4-0-2ff1127ea757@collabora.com>
 <20251219-rk3588-bgcolor-v4-4-2ff1127ea757@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-8 
MIME-Version: 1.0
X-ZohoMailClient: External
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
X-Spamd-Result: default: False [-0.81 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[zohomail.com:s=zohoarc:i=1];
	DMARC_POLICY_ALLOW(-0.50)[collabora.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:cristian.ciocaltea@collabora.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:louis.chauvet@bootlin.com,m:hamohammed.sa@gmail.com,m:melissa.srw@gmail.com,m:robert.mader@collabora.com,m:kernel@collabora.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:hamohammedsa@gmail.com,m:melissasrw@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[collabora.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,rock-chips.com,sntech.de,bootlin.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	FORGED_SENDER(0.00)[nfraprado@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[collabora.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[nfraprado@collabora.com,dri-devel-bounces@lists.freedesktop.org];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,collabora.com:email,collabora.com:dkim,collabora.com:mid]
X-Rspamd-Queue-Id: 377888C1A0
X-Rspamd-Action: no action

On Fri, 2025-12-19 at 23:47 +0200, Cristian Ciocaltea wrote:
> The Rockchip VOP2 display controller allows configuring the
> background
> color of each video output port.
>=20
> Since a previous patch introduced the BACKGROUND_COLOR CRTC property,
> which defaults to solid black, make use of it when programming the
> hardware.
>=20
> Note the maximum precision allowed by the display controller is
> 10bpc,
> while the alpha component is not supported, hence ignored.
>=20
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
> =C2=A0drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 13 ++++++++++++-
> =C2=A0drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |=C2=A0 4 ++++
> =C2=A02 files changed, 16 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> index 498df0ce4680..3a232d0d4acb 100644
> --- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> +++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
> @@ -1554,6 +1554,7 @@ static void vop2_post_config(struct drm_crtc
> *crtc)
> =C2=A0	struct vop2_video_port *vp =3D to_vop2_video_port(crtc);
> =C2=A0	struct vop2 *vop2 =3D vp->vop2;
> =C2=A0	struct drm_display_mode *mode =3D &crtc->state->adjusted_mode;
> +	u64 bgcolor =3D crtc->state->background_color;
> =C2=A0	u16 vtotal =3D mode->crtc_vtotal;
> =C2=A0	u16 hdisplay =3D mode->crtc_hdisplay;
> =C2=A0	u16 hact_st =3D mode->crtc_htotal - mode->crtc_hsync_start;
> @@ -1599,7 +1600,11 @@ static void vop2_post_config(struct drm_crtc
> *crtc)
> =C2=A0		vop2_vp_write(vp, RK3568_VP_POST_DSP_VACT_INFO_F1,
> val);
> =C2=A0	}
> =C2=A0
> -	vop2_vp_write(vp, RK3568_VP_DSP_BG, 0);
> +	/* Background color is programmed with 10 bits of precision
> */
> +	val =3D FIELD_PREP(RK3568_VP_DSP_BG__DSP_BG_RED,
> DRM_ARGB64_GETR(bgcolor) >> 6);
> +	val |=3D FIELD_PREP(RK3568_VP_DSP_BG__DSP_BG_GREEN,
> DRM_ARGB64_GETG(bgcolor) >> 6);
> +	val |=3D FIELD_PREP(RK3568_VP_DSP_BG__DSP_BG_BLUE,
> DRM_ARGB64_GETB(bgcolor) >> 6);

Why aren't the DRM_ARGB64_GET*_BPC() helpers used here to get the
values with a custom precision?

--=20
Thanks,

N=C3=ADcolas
