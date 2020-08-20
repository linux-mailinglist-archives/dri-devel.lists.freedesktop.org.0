Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 220FC24C297
	for <lists+dri-devel@lfdr.de>; Thu, 20 Aug 2020 17:54:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 070936E39E;
	Thu, 20 Aug 2020 15:54:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3CDE6E39E
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Aug 2020 15:54:00 +0000 (UTC)
Received: from ravnborg.org (unknown [188.228.123.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id CEB0C8050D;
 Thu, 20 Aug 2020 17:53:58 +0200 (CEST)
Date: Thu, 20 Aug 2020 17:53:57 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Paul Cercueil <paul@crapouillou.net>
Subject: Re: [PATCH v2 2/2] drm/panel: novatek, nt39016: Remove 'dev' field in
 priv struct
Message-ID: <20200820155357.GB194134@ravnborg.org>
References: <20200820121256.32037-1-paul@crapouillou.net>
 <20200820121256.32037-3-paul@crapouillou.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200820121256.32037-3-paul@crapouillou.net>
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=aP3eV41m c=1 sm=1 tr=0
 a=S6zTFyMACwkrwXSdXUNehg==:117 a=S6zTFyMACwkrwXSdXUNehg==:17
 a=kj9zAlcOel0A:10 a=ER_8r6IbAAAA:8 a=7gkXJVJtAAAA:8
 a=uqUkV8MoBaGHgs4G9lkA:9 a=CjuIK1q_8ugA:10 a=9LHmKk7ezEChjTCyhBa9:22
 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: Thierry Reding <thierry.reding@gmail.com>, od@zcrc.me,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Aug 20, 2020 at 02:12:56PM +0200, Paul Cercueil wrote:
> There is already a 'struct device' pointer in the drm_panel structure,
> that we can access easily from our priv structure, so there's no need
> for a separate 'dev' field there.
> 
> v2: Don't initialize drm_panel->dev manually, it is done by
> drm_panel_init().
> 
> Signed-off-by: Paul Cercueil <paul@crapouillou.net>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/gpu/drm/panel/panel-novatek-nt39016.c | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-novatek-nt39016.c b/drivers/gpu/drm/panel/panel-novatek-nt39016.c
> index daa583030246..f8151fe3ac9a 100644
> --- a/drivers/gpu/drm/panel/panel-novatek-nt39016.c
> +++ b/drivers/gpu/drm/panel/panel-novatek-nt39016.c
> @@ -56,7 +56,6 @@ struct nt39016_panel_info {
>  
>  struct nt39016 {
>  	struct drm_panel drm_panel;
> -	struct device *dev;
>  	struct regmap *map;
>  	struct regulator *supply;
>  	const struct nt39016_panel_info *panel_info;
> @@ -124,7 +123,7 @@ static int nt39016_prepare(struct drm_panel *drm_panel)
>  
>  	err = regulator_enable(panel->supply);
>  	if (err) {
> -		dev_err(panel->dev, "Failed to enable power supply: %d\n", err);
> +		dev_err(drm_panel->dev, "Failed to enable power supply: %d\n", err);
>  		return err;
>  	}
>  
> @@ -143,7 +142,7 @@ static int nt39016_prepare(struct drm_panel *drm_panel)
>  	err = regmap_multi_reg_write(panel->map, nt39016_panel_regs,
>  				     ARRAY_SIZE(nt39016_panel_regs));
>  	if (err) {
> -		dev_err(panel->dev, "Failed to init registers: %d\n", err);
> +		dev_err(drm_panel->dev, "Failed to init registers: %d\n", err);
>  		goto err_disable_regulator;
>  	}
>  
> @@ -173,7 +172,7 @@ static int nt39016_enable(struct drm_panel *drm_panel)
>  	ret = regmap_write(panel->map, NT39016_REG_SYSTEM,
>  			   NT39016_SYSTEM_RESET_N | NT39016_SYSTEM_STANDBY);
>  	if (ret) {
> -		dev_err(panel->dev, "Unable to enable panel: %d\n", ret);
> +		dev_err(drm_panel->dev, "Unable to enable panel: %d\n", ret);
>  		return ret;
>  	}
>  
> @@ -193,7 +192,7 @@ static int nt39016_disable(struct drm_panel *drm_panel)
>  	err = regmap_write(panel->map, NT39016_REG_SYSTEM,
>  			   NT39016_SYSTEM_RESET_N);
>  	if (err) {
> -		dev_err(panel->dev, "Unable to disable panel: %d\n", err);
> +		dev_err(drm_panel->dev, "Unable to disable panel: %d\n", err);
>  		return err;
>  	}
>  
> @@ -252,7 +251,6 @@ static int nt39016_probe(struct spi_device *spi)
>  	if (!panel)
>  		return -ENOMEM;
>  
> -	panel->dev = dev;
>  	spi_set_drvdata(spi, panel);
>  
>  	panel->panel_info = of_device_get_match_data(dev);
> -- 
> 2.28.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
