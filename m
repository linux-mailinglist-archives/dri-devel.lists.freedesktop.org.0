Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OHwyGUOxd2k3kQEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 19:24:03 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4CFC8C0E8
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jan 2026 19:24:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4103F10E45D;
	Mon, 26 Jan 2026 18:24:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=nfraprado@collabora.com header.b="lMJVcvAP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-op-o10.zoho.com (sender4-op-o10.zoho.com
 [136.143.188.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1BEA910E45D
 for <dri-devel@lists.freedesktop.org>; Mon, 26 Jan 2026 18:23:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1769451824; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=SARI57JCNzYUUJvgh5eiMna3J/xzOo986mBnMyrAONQhI5Ckq1wW+md4pBj1D04wWCFgQk+ASsX/JkWViCpLqa8+V75LsyVjSPilsQawwi0Xtndi5X94D+e6u9/S4+x2xtyeI06vlzxIEZgwx+Zi6tc94erz6MvOOLJxT26Sg2c=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1769451824;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=BCcFyc82BL5NjswhEby+qpxccQGrfqrQSMirNpyrbzw=; 
 b=NzZXtJEyPvI5ud8vMlfP/9ZgKDH/t2ffp68CjMpG8UGpyZSflFkvJFa1K2wyk/V/qTvudZu8j+JhGHcnX25rENNSrDJ1BoD0HjYoepXHybwB+UXYD9Lt/RnRQoIQcBouG8XKLI92QgtQ1VtO4qfbk9aT+ptTzdY9lo+FPQguJjw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=nfraprado@collabora.com;
 dmarc=pass header.from=<nfraprado@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769451824; 
 s=zohomail; d=collabora.com; i=nfraprado@collabora.com;
 h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
 bh=BCcFyc82BL5NjswhEby+qpxccQGrfqrQSMirNpyrbzw=;
 b=lMJVcvAPA4rxh1kwJCUc8CEOB2ucn9J16f4xqryuUecWSHSQ05a8RjLJ7VVfmpnM
 x4zAGt0gsDnHAsXY3WNm7f2sjzEejobAv+luekczVyTceEi1b8865LHIlOxl2Cs4KC0
 xKYI3BQKMVIjVuFFVD+l+dEOxI5BTunLnlAAhlRU=
Received: by mx.zohomail.com with SMTPS id 176945182249825.35003191071928;
 Mon, 26 Jan 2026 10:23:42 -0800 (PST)
Message-ID: <1425ed35a21bcd9633524d4fc747b71a17068363.camel@collabora.com>
Subject: Re: [PATCH v4 2/4] drm: Add CRTC background color property
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
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Matt Roper <matthew.d.roper@intel.com>
Date: Mon, 26 Jan 2026 15:23:35 -0300
In-Reply-To: <20251219-rk3588-bgcolor-v4-2-2ff1127ea757@collabora.com>
References: <20251219-rk3588-bgcolor-v4-0-2ff1127ea757@collabora.com>
 <20251219-rk3588-bgcolor-v4-2-2ff1127ea757@collabora.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[collabora.com:s=zohomail];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:cristian.ciocaltea@collabora.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:hjc@rock-chips.com,m:heiko@sntech.de,m:andy.yan@rock-chips.com,m:louis.chauvet@bootlin.com,m:hamohammed.sa@gmail.com,m:melissa.srw@gmail.com,m:robert.mader@collabora.com,m:kernel@collabora.com,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-rockchip@lists.infradead.org,m:matthew.d.roper@intel.com,m:hamohammedsa@gmail.com,m:melissasrw@gmail.com,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[3];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[collabora.com,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,rock-chips.com,sntech.de,bootlin.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[intel.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C4CFC8C0E8
X-Rspamd-Action: no action

On Fri, 2025-12-19 at 23:46 +0200, Cristian Ciocaltea wrote:
> Some display controllers can be hardware programmed to show non-black
> colors for pixels that are either not covered by any plane or are
> exposed through transparent regions of higher planes.=C2=A0 This feature
> can
> help reduce memory bandwidth usage, e.g. in compositors managing a UI
> with a solid background color while using smaller planes to render
> the
> remaining content.
>=20
> To support this capability, introduce the BACKGROUND_COLOR standard
> DRM
> mode property, which can be attached to a CRTC through the
> drm_crtc_attach_background_color_property() helper function.
>=20
> Additionally, define a 64-bit ARGB format value to be built with the
> help of a couple of dedicated DRM_ARGB64_PREP*() helpers.=C2=A0 Individua=
l
> color components can be extracted with desired precision using the
> corresponding DRM_ARGB64_GET*() macros.
>=20
> Co-developed-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
> =C2=A0drivers/gpu/drm/drm_atomic_state_helper.c |=C2=A0 1 +
> =C2=A0drivers/gpu/drm/drm_atomic_uapi.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 4 ++
> =C2=A0drivers/gpu/drm/drm_blend.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 39 ++++++++++++++++--
> =C2=A0drivers/gpu/drm/drm_mode_config.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 6 +++
> =C2=A0include/drm/drm_blend.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 =
4 +-
> =C2=A0include/drm/drm_crtc.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 12 =
++++++
> =C2=A0include/drm/drm_mode_config.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 5 +++
> =C2=A0include/uapi/drm/drm_mode.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 67
> +++++++++++++++++++++++++++++++
> =C2=A08 files changed, 133 insertions(+), 5 deletions(-)

You should also add a dump for this property in
drm_atomic_crtc_print_state().

>=20
> diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
> index 66278ffeebd6..d99a74258d3d 100644
> --- a/include/drm/drm_crtc.h
> +++ b/include/drm/drm_crtc.h
> @@ -274,6 +274,18 @@ struct drm_crtc_state {
> =C2=A0	 */
> =C2=A0	struct drm_property_blob *gamma_lut;
> =C2=A0
> +	/**
> +	 * @background_color:
> +	 *
> +	 * RGB value representing the pipe's background color.=C2=A0 The
> background
> +	 * color (aka "canvas color") of a pipe is the color that
> will be used
> +	 * for pixels not covered by a plane, or covered by
> transparent pixels
> +	 * of a plane.=C2=A0 The value here should be built using
> DRM_ARGB64_PREP*()
> +	 * helpers, while the individual color components can be
> extracted with
> +	 * desired precision via the DRM_ARGB64_GET*() macros.
> +	 */
> +	u64 background_color;
> +

/s/pipe/CRTC/ . pipe is an intel term but this is a generic CRTC
property.


Other than that,

Reviewed-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>

--=20
Thanks,

N=C3=ADcolas
