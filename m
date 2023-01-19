Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D58A0673297
	for <lists+dri-devel@lfdr.de>; Thu, 19 Jan 2023 08:38:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1CFC10E8C1;
	Thu, 19 Jan 2023 07:38:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CEE510E8C1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Jan 2023 07:38:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1674113907; x=1705649907;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DguvN7MN6DkWzkkyQGdyCqjifejirJBKi5y1WIl/2xk=;
 b=G4dGTsSJ9B7SVPKR5+08fI2+OgKrbdyBd2IXUC75mLm7MGknS6VYcEtz
 QAbnO86CFl+8ImWkgs/2Z+6nj3aMgHuJ6byPLO0agLqEXYNsjZONIr1RV
 xZxCJ1qo/3ve//YyEaGddP79sB4XISbSBbgPDZ24DFMzJmX/iLra28aHC
 PIZ8ndKwAczBGVAYLtTSMZaygubBGEWVdifVEU+UjIMhhdTImFQO9F5hZ
 dig/tzV4bjguooBF1Qx/DGeq69+IkG3yBxPKsOWgwmHPJQPtGbywbbmZk
 Hv9XW5Yi1uxukzvQaTMYG9slseWxBz2taOcEuUlgfqV3xLCQGKshv+mws Q==;
X-IronPort-AV: E=Sophos;i="5.97,228,1669071600"; d="scan'208";a="28521077"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
 by mx1-pgp.tq-group.com with ESMTP; 19 Jan 2023 08:38:25 +0100
Received: from mx1.tq-group.com ([192.168.6.7])
 by tq-pgp-pr1.tq-net.de (PGP Universal service);
 Thu, 19 Jan 2023 08:38:25 +0100
X-PGP-Universal: processed;
 by tq-pgp-pr1.tq-net.de on Thu, 19 Jan 2023 08:38:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
 t=1674113905; x=1705649905;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=DguvN7MN6DkWzkkyQGdyCqjifejirJBKi5y1WIl/2xk=;
 b=jBhhW4hXe0GuOGnIL3UJxKP+4YhBsn8lcIHKeongQoxeo35eNku7nXPX
 C7H8LiIXXFip5QTkvlnG8as/m42KvKOq+8BejCrbIwyu0iV6jfXickya6
 nRHnSCrPE0kNeMjyGzuLdglqFfphosfGKZLJhF/LswY15tX29fm1ehu6I
 vu6FMtSrGj/jYFItW0RYC4JVZ56ZBHUeJmk7ImYzFThXffQh5DHnIjrdG
 +4JUpZEDcL3yL1jJDDcBirW76MPV/vtVNIPfsi4BwJPA5+D9t4rg1oC6X
 mwKxs9Sew2fnOdK/OgjGzZRh6LhLdjiXczhWvkzagYJYUYzEicPcZ8pOo Q==;
X-IronPort-AV: E=Sophos;i="5.97,228,1669071600"; d="scan'208";a="28521076"
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
 by mx1.tq-group.com with ESMTP; 19 Jan 2023 08:38:25 +0100
Received: from steina-w.localnet (unknown [10.123.53.21])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
 (No client certificate requested)
 by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id 2A2E6280056;
 Thu, 19 Jan 2023 08:38:25 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <robert.foss@linaro.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 1/1] drm: bridge: ldb: Warn if LDB clock does not match
 requested link frequency
Date: Thu, 19 Jan 2023 08:38:23 +0100
Message-ID: <837062655.0ifERbkFSE@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20221208065538.1753666-1-alexander.stein@ew.tq-group.com>
References: <20221208065538.1753666-1-alexander.stein@ew.tq-group.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi everyone,

Am Donnerstag, 8. Dezember 2022, 07:55:38 CET schrieb Alexander Stein:
> The LDB clock needs to be exactly 7-times the pixel clock used by the
> display.

Any feedback on this?

Thanks
Alexander

> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> i.MX8MP has a dedicated LDB clock which defines the actual LVDS link
> frequency. This has to be (exactly) the 7-time of the pixel clock.
> Although the clock min/max range is available, panel-simple does not (yet)
> use the range to find a (perfect) frequency which can be used down the
> chain, which is also in range.
> Depending on the pixel clock the exact multiple might not be configured.
> Raise a warning if there is a mismatch, which might cause an invalid display
> image.
> 
>  drivers/gpu/drm/bridge/fsl-ldb.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c
> b/drivers/gpu/drm/bridge/fsl-ldb.c index f9e0f8d992680..9bcba8fc57e74
> 100644
> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c
> @@ -66,6 +66,14 @@ static inline struct fsl_ldb *to_fsl_ldb(struct
> drm_bridge *bridge) return container_of(bridge, struct fsl_ldb, bridge);
>  }
> 
> +static unsigned long fsl_ldb_link_frequency(struct fsl_ldb *fsl_ldb, int
> clock) +{
> +	if (fsl_ldb->lvds_dual_link)
> +		return clock * 3500;
> +	else
> +		return clock * 7000;
> +}
> +
>  static int fsl_ldb_attach(struct drm_bridge *bridge,
>  			  enum drm_bridge_attach_flags flags)
>  {
> @@ -85,6 +93,8 @@ static void fsl_ldb_atomic_enable(struct drm_bridge
> *bridge, const struct drm_display_mode *mode;
>  	struct drm_connector *connector;
>  	struct drm_crtc *crtc;
> +	unsigned long configured_link_freq;
> +	unsigned long requested_link_freq;
>  	bool lvds_format_24bpp;
>  	bool lvds_format_jeida;
>  	u32 reg;
> @@ -128,10 +138,15 @@ static void fsl_ldb_atomic_enable(struct drm_bridge
> *bridge, crtc_state = drm_atomic_get_new_crtc_state(state, crtc);
>  	mode = &crtc_state->adjusted_mode;
> 
> -	if (fsl_ldb->lvds_dual_link)
> -		clk_set_rate(fsl_ldb->clk, mode->clock * 3500);
> -	else
> -		clk_set_rate(fsl_ldb->clk, mode->clock * 7000);
> +	requested_link_freq = fsl_ldb_link_frequency(fsl_ldb, mode->clock);
> +	clk_set_rate(fsl_ldb->clk, requested_link_freq);
> +
> +	configured_link_freq = clk_get_rate(fsl_ldb->clk);
> +	if (configured_link_freq != requested_link_freq)
> +		dev_warn(fsl_ldb->dev, "Configured LDB clock (%lu Hz) does 
not match
> requested LVDS clock: %lu Hz", +			 
configured_link_freq,
> +			 requested_link_freq);
> +
>  	clk_prepare_enable(fsl_ldb->clk);
> 
>  	/* Program LDB_CTRL */




