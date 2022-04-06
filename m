Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FCB24F63F2
	for <lists+dri-devel@lfdr.de>; Wed,  6 Apr 2022 17:50:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CDCF89CE3;
	Wed,  6 Apr 2022 15:49:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 429 seconds by postgrey-1.36 at gabe;
 Wed, 06 Apr 2022 15:49:57 UTC
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44FC389CE3
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Apr 2022 15:49:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1649260197; x=1680796197;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yoWQS375k6Bct//fOUq6wyC92yT/JmkkW99BDjLep74=;
 b=g8NbSOjvrIAXL9Vtb3bKnW9+HrMJQy9Ys9Gx+G9aOHryQMswv/km1FXe
 gnp92NjPtoTpBTYQJG3vv4PLKEM6sHInzOxtTsNhIBAbe+nBHEJags/+E
 YDQkTigzh9fJo9K3wL+ibN8yzphMauelbqunC6R7L7Yl4a/jSubsXKXXn
 MCG/kv8skSkLS5wJoGXZPoMC51Mf5ZKQoEBu1iQAKP674wc92wKaSwbWB
 awBYydmxiF7w9X+nDy7OYZ2MbFPrbt4KRStFi7T7yp8DhWDtXMD+RnGOv
 d3IMcp1D6/7VYa+SUJ6k1HJsIqiWNJhE/3AkGVQY6VSjphTOJE2iqkbJL A==;
X-IronPort-AV: E=Sophos;i="5.90,240,1643670000"; d="scan'208";a="23136578"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 06 Apr 2022 17:42:45 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Wed, 06 Apr 2022 17:42:45 +0200
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Wed, 06 Apr 2022 17:42:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1649259765; x=1680795765;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yoWQS375k6Bct//fOUq6wyC92yT/JmkkW99BDjLep74=;
 b=kX193QNI0oNB7l01R6PXhOAGN5tXcW04Oq7AnnPKV+1G5v2KYEThwLKy
 M84V+B+93iZuS2X7qF4xbZZGkRP5Q3t0Eup5rDnnT4f7AZiW5O/5mb5Z9
 f8jOW4qrPNLoVY+g5fA+93hlb6C14wiPMIc4flmHmMXPqz/4Oih6Anmie
 Y1icd3Ltryw65NZnJjKdA+puaeNvcoU/Xa60y9x4RXKpbM1vLT+tooM2R
 DRyFQYjwLFKD0JcjGOe4dCXpE4/6jUPVcVKNrxc/SgibYQ/NXIdEwjdeL
 40uoIR3TiXq8Qp4vnNwsIlkMcXw+Hc6KrBgQyWwRONTh5ZmW+2MZSWQ3H Q==;
X-IronPort-AV: E=Sophos;i="5.90,240,1643670000"; d="scan'208";a="23136577"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 06 Apr 2022 17:42:45 +0200
Received: from steina-w.localnet (unknown [10.123.49.12])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id F261A280065;
 Wed,  6 Apr 2022 17:42:44 +0200 (CEST)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Marek Vasut <marex@denx.de>
Subject: Re: [PATCH] drm: mxsfb: Obtain bus flags from bridge state
Date: Wed, 06 Apr 2022 17:42:42 +0200
Message-ID: <3171078.44csPzL39Z@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20220406092929.17498-1-marex@denx.de>
References: <20220406092929.17498-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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
Cc: Marek Vasut <marex@denx.de>, Peng Fan <peng.fan@nxp.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, robert.foss@linaro.org,
 dri-devel@lists.freedesktop.org, Robby Cai <robby.cai@nxp.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am Mittwoch, 6. April 2022, 11:29:29 CEST schrieb Marek Vasut:
> In case the MXSFB is connected to a bridge, attempt to obtain bus flags
> from that bridge state too. The bus flags may specify e.g. the DE signal
> polarity.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Alexander Stein <alexander.stein@ew.tq-group.com>
> Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Cc: Lucas Stach <l.stach@pengutronix.de>
> Cc: Peng Fan <peng.fan@nxp.com>
> Cc: Robby Cai <robby.cai@nxp.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Stefan Agner <stefan@agner.ch>
> ---
>  drivers/gpu/drm/mxsfb/mxsfb_kms.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> b/drivers/gpu/drm/mxsfb/mxsfb_kms.c index 4baa3db1f3d10..c7f14ef1edc25
> 100644
> --- a/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> +++ b/drivers/gpu/drm/mxsfb/mxsfb_kms.c
> @@ -298,6 +298,7 @@ static int mxsfb_reset_block(struct mxsfb_drm_private
> *mxsfb) }
> 
>  static void mxsfb_crtc_mode_set_nofb(struct mxsfb_drm_private *mxsfb,
> +				     struct drm_bridge_state 
*bridge_state,
>  				     const u32 bus_format)
>  {
>  	struct drm_device *drm = mxsfb->crtc.dev;
> @@ -307,6 +308,8 @@ static void mxsfb_crtc_mode_set_nofb(struct
> mxsfb_drm_private *mxsfb,
> 
>  	if (mxsfb->bridge && mxsfb->bridge->timings)
>  		bus_flags = mxsfb->bridge->timings->input_bus_flags;
> +	else if (bridge_state)
> +		bus_flags = bridge_state->input_bus_cfg.flags;
> 
>  	DRM_DEV_DEBUG_DRIVER(drm->dev, "Pixel clock: %dkHz (actual: %dkHz)
\n",
>  			     m->crtc_clock,
> @@ -365,7 +368,7 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc
> *crtc, {
>  	struct mxsfb_drm_private *mxsfb = to_mxsfb_drm_private(crtc->dev);
>  	struct drm_display_mode *m = &mxsfb->crtc.state->adjusted_mode;
> -	struct drm_bridge_state *bridge_state;
> +	struct drm_bridge_state *bridge_state = NULL;
>  	struct drm_device *drm = mxsfb->drm;
>  	u32 bus_format = 0;
> 
> @@ -399,7 +402,7 @@ static void mxsfb_crtc_atomic_enable(struct drm_crtc
> *crtc,
> 
>  	pm_runtime_get_sync(drm->dev);
> 
> -	mxsfb_crtc_mode_set_nofb(mxsfb, bus_format);
> +	mxsfb_crtc_mode_set_nofb(mxsfb, bridge_state, bus_format);
> 
>  	/* Write cur_buf as well to avoid an initial corrupt frame */
>  	mxsfb_update_buffer(mxsfb, crtc->primary, true);

I only have boards with an lvds-encoder bridge connected, which provides the 
timings, so I can't test it. Otherwise LGTM.

Acked-by: Alexander Stein <alexander.stein@ew.tq-group.com>


