Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1455C15A6F
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 17:02:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E02A10E5FD;
	Tue, 28 Oct 2025 16:02:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=antispam.mailspamprotection.com header.i=@antispam.mailspamprotection.com header.b="R0SBADWC";
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=valla.it header.i=@valla.it header.b="LAjIXLYA";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from delivery.antispam.mailspamprotection.com
 (delivery.antispam.mailspamprotection.com [185.56.87.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBE9910E5FD
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 16:02:18 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256;
 d=outgoing.instance-europe-west4-4wj9.prod.antispam.mailspamprotection.com;
 s=arckey; t=1761667338; 
 b=PqZ6o0VOiUA2Lo3abifWLsqNcXQrFKMzeeA9cjO9DKOwxA5V1qjbWND8uTOhNokfVkHknEKcKO
 C+e5Bw6GkaVPkyVzvEvtyw4IiYUb+J3hFBM8pHf7Y+eO1eUDB3AKstU9M7FpA1qOn3lkhExNnp
 0ffENRy6Rd0anTOBKy+yLSHMeTPl8w7rr7+uk/3NCEV6/Toc7aKA3owvMWPF6bxsUEdGlOzNMu
 IUYhoSeJt4DMr5xQT3RoeRFQzCaZP1q7xVovxgM9GahQfUjxp6lBCdgZX3r58CznbprvqSBTPp
 Xg9+acpfivZuRM9GXRQEiRSFCJMDlyjYvnZAnPswUNNPzw==;
ARC-Authentication-Results: i=1;
 outgoing.instance-europe-west4-4wj9.prod.antispam.mailspamprotection.com;
 smtp.remote-ip=35.214.173.214; 
 iprev=pass (214.173.214.35.bc.googleusercontent.com)
 smtp.remote-ip=35.214.173.214; 
 auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
 dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
 arc=none
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed;
 d=outgoing.instance-europe-west4-4wj9.prod.antispam.mailspamprotection.com;
 s=arckey; t=1761667338; 
 bh=OZ0ZtiH9Ffd/H3YhMXhZvm8XE+UAipi6AHVisU+hxWU=;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
 To:From:DKIM-Signature:DKIM-Signature;
 b=jiGWydqE0t6IWP8znV8qIbTP0AYfqJOQZmwlD5bmyVEK7w13b/p8zEccL6V+UbsD+dRo15qF1C
 e6+ccH+hGBdpPcsDqBKD0/g+StkwcKoU92x07bqfHv3bOyqjNhMJN12xA3OrgacIIaUiDXPNJN
 SraZrL4/GgZnMw8d8kZzLQIpzOekebI/Wz1SZDgCcmLKn43ECY/AR83Xd6JIg2M7CtBCa9STYv
 7dYye9PQxMTlfN5iIeiYaxThPcQ35JUDQ3u1Rq0FcE9K9fkTqOdSREYzEgFsm9TcRSsF82KI23
 hVF0L3lKYkzdsTG56S1X8rhmS65HZbWVsm3UZnySeEBBtg==;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=antispam.mailspamprotection.com; s=default; h=CFBL-Feedback-ID:CFBL-Address
 :Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
 List-Unsubscribe:Content-Transfer-Encoding;
 bh=nFXGsd0wvJCB2aoq6ydUjxoEpP8AS5JY0g0UJ7Jo4rk=; b=R0SBADWC4VK6Hisq6MebjVpjEi
 0odXcFdi6CIGG9IqRln4RnC5vAKtwlMpm0GPgseI12sF6fqfHcMYT32LzYyzWStB7tywlMCGlmwpu
 rH9aKBOCtIs3VKqwFE13ZaCzb4MlMFYWbdZ0L2RSGEyhtkJQk25v9gzQypRJ2UscDuQc=;
Received: from 214.173.214.35.bc.googleusercontent.com ([35.214.173.214]
 helo=esm19.siteground.biz)
 by instance-europe-west4-4wj9.prod.antispam.mailspamprotection.com with
 esmtpsa (TLS1.3) tls TLS_AES_256_GCM_SHA384 (Exim 4.98.1)
 (envelope-from <francesco@valla.it>) id 1vDm9G-0000000F3wb-1R0u
 for dri-devel@lists.freedesktop.org; Tue, 28 Oct 2025 16:02:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=valla.it;
 s=default; h=Date:Subject:Cc:To:From:list-help:list-unsubscribe:
 list-subscribe:list-post:list-owner:list-archive;
 bh=nFXGsd0wvJCB2aoq6ydUjxoEpP8AS5JY0g0UJ7Jo4rk=; b=LAjIXLYAuKe+nn91fplPC8zwte
 Ub+TSBb3J+TqyLvVF4RU3DTnoGllzWP9T+jeUeALMF3MBgHttDcK3t6DYSFJnb/+D3Bp41AiTeG1l
 xWRwKT05PmIKAGN487/QO54yYlwiqTgVuLa29SgACOLG1ZQO7W3YCgvCS2xQGS4abhg0=;
Received: from [87.17.42.198] (port=63724 helo=fedora.localnet)
 by esm19.siteground.biz with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
 (Exim 4.98.1) (envelope-from <francesco@valla.it>)
 id 1vDm8f-000000009YH-2cLa; Tue, 28 Oct 2025 16:01:37 +0000
From: Francesco Valla <francesco@valla.it>
To: Liu Ying <victor.liu@nxp.com>, Marek Vasut <marex@denx.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Fabian Pflug <f.pflug@pengutronix.de>, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: ldb: add support for an external bridge
Date: Tue, 28 Oct 2025 17:01:24 +0100
Message-ID: <2860884.vuYhMxLoTh@fedora>
In-Reply-To: <1944228.tdWV9SEqCh@steina-w>
References: <20251028-imx93_ldb_bridge-v1-1-fca2e7d60e0a@valla.it>
 <1944228.tdWV9SEqCh@steina-w>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart5090209.OV4Wx5bFTl";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - esm19.siteground.biz
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - valla.it
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SGantispam-id: f1c04a5ec7258d140d08597da0069ce2
AntiSpam-DLS: false
AntiSpam-DLSP: 
AntiSpam-DLSRS: 
AntiSpam-TS: 1.0
CFBL-Address: feedback@antispam.mailspamprotection.com; report=arf
CFBL-Feedback-ID: 1vDm9G-0000000F3wb-1R0u-feedback@antispam.mailspamprotection.com
Authentication-Results: outgoing.instance-europe-west4-4wj9.prod.antispam.mailspamprotection.com; 
 iprev=pass (214.173.214.35.bc.googleusercontent.com)
 smtp.remote-ip=35.214.173.214; 
 auth=pass (LOGIN) smtp.auth=esm19.siteground.biz;
 dkim=pass header.d=valla.it header.s=default header.a=rsa-sha256;
 arc=none
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

--nextPart5090209.OV4Wx5bFTl
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"; protected-headers="v1"
From: Francesco Valla <francesco@valla.it>
Date: Tue, 28 Oct 2025 17:01:24 +0100
Message-ID: <2860884.vuYhMxLoTh@fedora>
In-Reply-To: <1944228.tdWV9SEqCh@steina-w>
MIME-Version: 1.0

Hi,

On Tuesday, 28 October 2025 at 13:27:37 Alexander Stein <alexander.stein@ew.tq-group.com> wrote:
> Hi Francesco,
> 
> Am Dienstag, 28. Oktober 2025, 13:12:29 CET schrieb Francesco Valla:
> > One option for the LVDS port of the LDB is to be connected to an
> > additional bridge, such as a LVDS to HDMI converter. Add support for
> > such case, along with the direct connection to a panel.
> > 
> > Signed-off-by: Francesco Valla <francesco@valla.it>
> > ---
> > I was trying to add display support for the i.MX93 FRDM on top of the
> > patch sent some time ago by Fabian Pflug [1], using some of the work
> > already done by Alexander Stein but not yet merged [2], but then I
> > noticed that the support for LVDS-HDMI converter bridges was missing
> > from the LDB driver already present for the i.MX93.
> > 
> > Not a fail of the driver itself, obviously, but I wonder if/how the
> > existing i.MX8MP setups (e.g.: [3]), which use the same driver, work
> > correclty. Unfortunately I don't have the i.MX8MP hardware to test them.
> > 
> > Anyhow, a patch for such setup is attached; it was tested on the i.MX93
> > FRDM using [1] and [2] plus some more devicetree modifications.
> > 
> > [1] https://lore.kernel.org/all/20251022-fpg-nxp-imx93-frdm-v3-1-03ec40a1ccc0@pengutronix.de
> > [2] https://lore.kernel.org/all/20250304154929.1785200-1-alexander.stein@ew.tq-group.com
> > [3] https://elixir.bootlin.com/linux/v6.17.5/source/arch/arm64/boot/dts/freescale/imx8mp-evk-lvds0-imx-dlvds-hdmi-channel0.dtso
> > 
> > Regards,
> > Francesco
> > ---
> >  drivers/gpu/drm/bridge/fsl-ldb.c | 26 +++++++++++++++++---------
> >  1 file changed, 17 insertions(+), 9 deletions(-)
> > 
> > diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fsl-ldb.c
> > index 5c3cf37200bcee1db285c97e2b463c9355ee6acb..fad436f2e0bfac8b42096a6fcd0022da0f35284e 100644
> > --- a/drivers/gpu/drm/bridge/fsl-ldb.c
> > +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
> > @@ -294,7 +294,6 @@ static int fsl_ldb_probe(struct platform_device *pdev)
> >  	struct device *dev = &pdev->dev;
> >  	struct device_node *panel_node;
> >  	struct device_node *remote1, *remote2;
> > -	struct drm_panel *panel;
> >  	struct fsl_ldb *fsl_ldb;
> >  	int dual_link;
> >  
> > @@ -335,15 +334,24 @@ static int fsl_ldb_probe(struct platform_device *pdev)
> >  		fsl_ldb_is_dual(fsl_ldb) ? "dual-link mode" :
> >  		fsl_ldb->ch0_enabled ? "channel 0" : "channel 1");
> >  
> > -	panel = of_drm_find_panel(panel_node);
> > -	of_node_put(panel_node);
> > -	if (IS_ERR(panel))
> > -		return PTR_ERR(panel);
> > -
> > -	fsl_ldb->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
> > -	if (IS_ERR(fsl_ldb->panel_bridge))
> > -		return PTR_ERR(fsl_ldb->panel_bridge);
> > +	/* First try to get an additional bridge, if not found go for a panel */
> > +	fsl_ldb->panel_bridge = of_drm_find_bridge(panel_node);
> > +	if (fsl_ldb->panel_bridge) {
> > +		of_node_put(panel_node);
> > +	} else {
> > +		struct drm_panel *panel;
> >  
> > +		panel = of_drm_find_panel(panel_node);
> > +		of_node_put(panel_node);
> > +		if (IS_ERR(panel))
> > +			return dev_err_probe(dev, PTR_ERR(panel),
> > +					     "Failed to find panel");
> > +
> > +		fsl_ldb->panel_bridge = devm_drm_panel_bridge_add(dev, panel);
> > +		if (IS_ERR(fsl_ldb->panel_bridge))
> > +			return dev_err_probe(dev, PTR_ERR(fsl_ldb->panel_bridge),
> > +					     "Failed to add panel bridge");
> > +	}
> 
> Without looking into the details this somehow looks similar to
> drm_of_find_panel_or_bridge(), or drmm_of_get_bridge for the managed variant.
> 
> Best regards,
> Alexander
> 
> >  
> >  	if (fsl_ldb_is_dual(fsl_ldb)) {
> >  		struct device_node *port1, *port2;
> > 
> > ---
> > base-commit: fd57572253bc356330dbe5b233c2e1d8426c66fd
> > change-id: 20251028-imx93_ldb_bridge-3c011e7856dc
> > 
> > Best regards,
> > 
> 
> 
> 

Well, I did not know of devm_drm_of_get_bridge(), and unfortunately the
driver I checked (Samsung DSIM) has not yet been updated to use it.
Sorry for the noise.

I'll wait for more feedback (if any) and then send a v2 - which looks
much cleaner now.

Thank you!

Regards,
Francesco

--nextPart5090209.OV4Wx5bFTl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRUrtjevJ039mawAeLir2xSXEi5AAUCaQDo1AAKCRDir2xSXEi5
AA83AP0VODlMOPiFo+Etj7oaFVsgFDTnwBhEX54ICokuPyWjewEA/RnsnW2CT6zy
NlUewINvfCea60Pz3od7UPV/AbPhvgg=
=eIuv
-----END PGP SIGNATURE-----

--nextPart5090209.OV4Wx5bFTl--



