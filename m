Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id yKXELCztgWkFMAMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 13:42:20 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38B8CD9254
	for <lists+dri-devel@lfdr.de>; Tue, 03 Feb 2026 13:42:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 791C510E638;
	Tue,  3 Feb 2026 12:42:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="kssnCyTG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABDC810E638
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Feb 2026 12:42:16 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 9FD19C211FF;
 Tue,  3 Feb 2026 12:42:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 5D4AA60728;
 Tue,  3 Feb 2026 12:42:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 641AA119A8888; Tue,  3 Feb 2026 13:42:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1770122533; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding:in-reply-to:references;
 bh=mjD/XeGsaFZTGLaSJ1QT/vbx0pLPYMqPljpuTVuY9Vs=;
 b=kssnCyTG1OTqgCpgTxqn0mZt70/JjYnao9N82p5/0ro7b5HeMHncSVb+y4JP5r+KjgK+OY
 mBTwqweLrzP1zwHpnsAR2c+vKHReh2BM7alEJNAUekMfitLovdIsfEGvtE5ugkw+sYghXN
 jfRapWPH0TuW/zkB/GZY65wxkOZiWWLobRRJQMmN2PzLZg8eCZ1Wlbmr3KrxX3E49XRKie
 0NAhrgXsT7IrfeAaxxkOzS8pAf6UEUZzIU0dt89koD+tH/cHDjIHeULrOBBoH3LUQHd6NE
 jR+1F6LYXeoVcvzigIr0LAssOwaqyvp5r6Pzh5Q2C8DI6pgXHs9qmBPQ2irC6Q==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 03 Feb 2026 13:42:05 +0100
Message-Id: <DG5C2DXQUVNX.39GKXFD2JZOKI@bootlin.com>
To: "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>, "Inki Dae"
 <inki.dae@samsung.com>, "Jagan Teki" <jagan@amarulasolutions.com>, "Marek
 Szyprowski" <m.szyprowski@samsung.com>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Laurent Pinchart"
 <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman" <jonas@kwiboo.se>,
 "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Aradhya Bhatia"
 <a-bhatia1@ti.com>, "Dmitry Baryshkov" <lumag@kernel.org>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH] drm/bridge: samsung-dsim: Fix init order
Cc: <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 "Hiago De Franco" <hiagofranco@gmail.com>, "Francesco Dolcini"
 <francesco@dolcini.it>
X-Mailer: aerc 0.20.1
References: <20250619-samsung-dsim-fix-v1-1-6b5de68fb115@ideasonboard.com>
In-Reply-To: <20250619-samsung-dsim-fix-v1-1-6b5de68fb115@ideasonboard.com>
X-Last-TLS-Session-Version: TLSv1.3
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[bootlin.com,reject];
	MV_CASE(0.50)[];
	R_DKIM_ALLOW(-0.20)[bootlin.com:s=dkim];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:tomi.valkeinen@ideasonboard.com,m:inki.dae@samsung.com,m:jagan@amarulasolutions.com,m:m.szyprowski@samsung.com,m:andrzej.hajda@intel.com,m:neil.armstrong@linaro.org,m:rfoss@kernel.org,m:Laurent.pinchart@ideasonboard.com,m:jonas@kwiboo.se,m:jernej.skrabec@gmail.com,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:a-bhatia1@ti.com,m:lumag@kernel.org,m:linux-kernel@vger.kernel.org,m:hiagofranco@gmail.com,m:francesco@dolcini.it,m:jernejskrabec@gmail.com,s:lists@lfdr.de];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FREEMAIL_TO(0.00)[ideasonboard.com,samsung.com,amarulasolutions.com,intel.com,linaro.org,kernel.org,kwiboo.se,gmail.com,linux.intel.com,suse.de,ffwll.ch,ti.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[lists.freedesktop.org,vger.kernel.org,gmail.com,dolcini.it];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[luca.ceresoli@bootlin.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[bootlin.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,ideasonboard.com:email,bootlin.com:dkim,bootlin.com:url,bootlin.com:mid]
X-Rspamd-Queue-Id: 38B8CD9254
X-Rspamd-Action: no action

Hello Tomi,

On Thu Jun 19, 2025 at 2:27 PM CEST, Tomi Valkeinen wrote:
> The commit c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain
> pre-enable and post-disable") changed the order of enable/disable calls.
> Previously the calls (on imx8mm) were:
>
> mxsfb_crtc_atomic_enable()
> samsung_dsim_atomic_pre_enable()
> samsung_dsim_atomic_enable()
>
> now the order is:
>
> samsung_dsim_atomic_pre_enable()
> mxsfb_crtc_atomic_enable()
> samsung_dsim_atomic_enable()
>
> On imx8mm (possibly on imx8mp, and other platforms too) this causes two
> issues:
>
> 1. The DSI PLL setup depends on a refclk, but the DSI driver does not
> set the rate, just uses it with the rate it has. On imx8mm this refclk
> seems to be related to the LCD controller's video clock. So, when the
> mxsfb driver sets its video clock, DSI's refclk rate changes.
>
> Earlier this mxsfb_crtc_atomic_enable() set the video clock, so the PLL
> refclk rate was set (and didn't change) in the DSI enable calls. Now the
> rate changes between DSI's pre_enable() and enable(), but the driver
> configures the PLL in the pre_enable().
>
> Thus you get a black screen on a modeset. Doing the modeset again works,
> as the video clock rate stays the same.
>
> 2. The image on the screen is shifted/wrapped horizontally. I have not
> found the exact reason for this, but the documentation seems to hint
> that the LCD controller's pixel stream should be enabled first, before
> setting up the DSI. This would match the change, as now the pixel stream
> starts only after DSI driver's pre_enable().
>
> The main function related to this issue is samsung_dsim_init() which
> will do the clock and link configuration. samsung_dsim_init() is
> currently called from pre_enable(), but it is also called from
> samsung_dsim_host_transfer() to set up the link if the peripheral driver
> wants to send a DSI command.
>
> This patch fixes both issues by moving the samsung_dsim_init() call from
> pre_enable() to enable().
>
> However, to deal with the case where the samsung_dsim_init() has already
> been called from samsung_dsim_host_transfer() and the refclk rate has
> changed, we need to make sure we re-initialize the DSI with the new rate
> in enable(). This is achieved by clearing the DSIM_STATE_INITIALIZED
> flag and uninitializing the clocks and irqs before calling
> samsung_dsim_init().
>
> Fixes: c9b1150a68d9 ("drm/atomic-helper: Re-order bridge chain pre-enable=
 and post-disable")
> Reported-by: Hiago De Franco <hiagofranco@gmail.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Is this old patch still valid, or outdated/superseded?

Assuming it is still valid, I tested on an i.MX8MP and I'm afraid my
display stops working. :-(

My pipeline is:

  i.MX8MP LCDIF -> samsung-dsim -> TI SN65DSI84 -> dual-LVDS panel

Using either 'modetest -s' or weston, the result is:

 * backlight turns on
 * the TI bridge logs:
    sn65dsi83 4-002c: failed to lock PLL, ret=3D-110
    sn65dsi83 4-002c: Unexpected link status 0x01
 * panel stays black

Running multiple tests one after another (e.g. modetest -s, exit, modetest
-s, exit, repeat) the display keeps on staying black. In other words the
"Doing the modeset again works, as the video clock rate stays the same"
does not seem to apply here.

I haven't investigated further but I'm available to do any specific test
you may suggest.

I have an additional question about your patch, see below.

> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1473,22 +1473,31 @@ static void samsung_dsim_atomic_pre_enable(struct=
 drm_bridge *bridge,
>  	}
>
>  	dsi->state |=3D DSIM_STATE_ENABLED;
> -
> -	/*
> -	 * For Exynos-DSIM the downstream bridge, or panel are expecting
> -	 * the host initialization during DSI transfer.
> -	 */
> -	if (!samsung_dsim_hw_is_exynos(dsi->plat_data->hw_type)) {
> -		ret =3D samsung_dsim_init(dsi);
> -		if (ret)
> -			return;
> -	}

The code being removed here is only for the non-exynos case...

>  }
>
>  static void samsung_dsim_atomic_enable(struct drm_bridge *bridge,
>  				       struct drm_atomic_state *state)
>  {
>  	struct samsung_dsim *dsi =3D bridge_to_dsi(bridge);
> +	int ret;
> +
> +	/*
> +	 * The DSI bridge may have already been initialized in
> +	 * samsung_dsim_host_transfer(). It is possible that the refclk rate ha=
s
> +	 * changed after that due to the display controller configuration, and
> +	 * thus we need to reinitialize the DSI bridge to ensure the correct
> +	 * clock settings.
> +	 */
> +
> +	if (dsi->state & DSIM_STATE_INITIALIZED) {
> +		dsi->state &=3D ~DSIM_STATE_INITIALIZED;
> +		samsung_dsim_disable_clock(dsi);
> +		samsung_dsim_disable_irq(dsi);
> +	}
> +
> +	ret =3D samsung_dsim_init(dsi);
> +	if (ret)
> +		return;

...but the added code is for all variants. Is this correct?

Note this is not the cause of the problem I reported with the i.MX8MP
because thats a non-exynos case anyway.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
