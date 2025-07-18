Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C693B0A0DC
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jul 2025 12:43:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 989E810E142;
	Fri, 18 Jul 2025 10:43:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=tecnico.ulisboa.pt header.i=@tecnico.ulisboa.pt header.b="fKkWo/Q3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtp1.tecnico.ulisboa.pt (smtp1.tecnico.ulisboa.pt
 [193.136.128.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F19510E94F
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jul 2025 10:43:26 +0000 (UTC)
Received: from localhost (localhost.localdomain [127.0.0.1])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTP id 77C99600343C;
 Fri, 18 Jul 2025 11:43:24 +0100 (WEST)
X-Virus-Scanned: by amavis-2.13.0 (20230106) (Debian) at tecnico.ulisboa.pt
Received: from smtp1.tecnico.ulisboa.pt ([127.0.0.1])
 by localhost (smtp1.tecnico.ulisboa.pt [127.0.0.1]) (amavis, port 10025)
 with LMTP id 6DHWSyV4V5To; Fri, 18 Jul 2025 11:43:22 +0100 (WEST)
Received: from mail1.tecnico.ulisboa.pt (mail1.ist.utl.pt [193.136.128.10])
 by smtp1.tecnico.ulisboa.pt (Postfix) with ESMTPS id 0103B600024F;
 Fri, 18 Jul 2025 11:43:21 +0100 (WEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tecnico.ulisboa.pt;
 s=mail; t=1752835402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=okyo7RN/5T+nGVlbhx/5uQVBucvQdaKOetxBZHKb90k=;
 b=fKkWo/Q3KTDG0gtM4VokVwM87V7Y+7gIgSWh3BtCsJcOmIra1sreIdBbp1S/w4cwjpCF6f
 LqQpyO3LjLGiw2gAcTsZUj7494Ju/02pGU3XIS9tU2obYbgyj99wORdkxDmvqApODbWAKl
 q6wyffoGPRBMc88fuMg40JeXR5xdQZ0=
Received: from [IPV6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde] (unknown
 [IPv6:2001:8a0:57db:f00:3ee2:38aa:e2c9:7dde])
 (Authenticated sender: ist187313)
 by mail1.tecnico.ulisboa.pt (Postfix) with ESMTPSA id 898A3360071;
 Fri, 18 Jul 2025 11:43:20 +0100 (WEST)
Message-ID: <fe1d5f6b-006e-494f-8d07-e6c751d4c694@tecnico.ulisboa.pt>
Date: Fri, 18 Jul 2025 11:43:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/4] drm/panel: jdi-lpm102a188a: Fix bug and clean up
 driver
To: Brigham Campbell <me@brighamcampbell.com>, dianders@chromium.org,
 tejasvipin76@gmail.com, skhan@linuxfoundation.org,
 linux-kernel-mentees@lists.linux.dev, dri-devel@lists.freedesktop.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
References: <20250717164053.284969-1-me@brighamcampbell.com>
 <20250717164053.284969-3-me@brighamcampbell.com>
Content-Language: en-US
From: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
In-Reply-To: <20250717164053.284969-3-me@brighamcampbell.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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



On 7/17/25 5:40 PM, Brigham Campbell wrote:
> Fix bug in unprepare() which causes the function's return value to be
> that of the last mipi "enter sleep mode" command.
> 
> Update driver to use the "multi" variant of MIPI functions in order to
> facilitate improved error handling and remove the panel's dependency on
> deprecated MIPI functions.
> 
> Use the new mipi_dsi_dual macro to reduce code duplication.
> 
> Signed-off-by: Brigham Campbell <me@brighamcampbell.com>

Reviewed-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>
Tested-by: Diogo Ivo <diogo.ivo@tecnico.ulisboa.pt>

Thanks for the patch! Just the smallest of nits in the review but it's
fine by me if this goes in as is.

> ---
>   drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c | 197 ++++++------------
>   1 file changed, 60 insertions(+), 137 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
> index 5b5082efb282..9df67facdc47 100644
> --- a/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
> +++ b/drivers/gpu/drm/panel/panel-jdi-lpm102a188a.c
> @@ -81,25 +81,25 @@ static int jdi_panel_disable(struct drm_panel *panel)
>   static int jdi_panel_unprepare(struct drm_panel *panel)
>   {
>   	struct jdi_panel *jdi = to_panel_jdi(panel);
> -	int ret;
>   
> -	ret = mipi_dsi_dcs_set_display_off(jdi->link1);
> -	if (ret < 0)
> -		dev_err(panel->dev, "failed to set display off: %d\n", ret);
> +	/*
> +	 * One context per panel since we'll continue trying to shut down the
> +	 * other panel even if one isn't responding.
> +	 */
> +	struct mipi_dsi_multi_context dsi_ctx1 = { .dsi = jdi->link1 };
> +	struct mipi_dsi_multi_context dsi_ctx2 = { .dsi = jdi->link2 };
>   
> -	ret = mipi_dsi_dcs_set_display_off(jdi->link2);
> -	if (ret < 0)
> -		dev_err(panel->dev, "failed to set display off: %d\n", ret);
> +	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx1);
> +	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx2);
>   
>   	/* Specified by JDI @ 50ms, subject to change */
>   	msleep(50);
>   
> -	ret = mipi_dsi_dcs_enter_sleep_mode(jdi->link1);
> -	if (ret < 0)
> -		dev_err(panel->dev, "failed to enter sleep mode: %d\n", ret);
> -	ret = mipi_dsi_dcs_enter_sleep_mode(jdi->link2);
> -	if (ret < 0)
> -		dev_err(panel->dev, "failed to enter sleep mode: %d\n", ret);
> +	/* Doesn't hurt to try sleep mode even if display off fails */
> +	dsi_ctx1.accum_err = 0;
> +	dsi_ctx2.accum_err = 0;
> +	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx1);
> +	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx2);
>   
>   	/* Specified by JDI @ 150ms, subject to change */
>   	msleep(150);
> @@ -123,72 +123,47 @@ static int jdi_panel_unprepare(struct drm_panel *panel)
>   	/* Specified by JDI @ 20ms, subject to change */
>   	msleep(20);
>   
> -	return ret;
> -}
> -
> -static int jdi_setup_symmetrical_split(struct mipi_dsi_device *left,
> -				       struct mipi_dsi_device *right,
> -				       const struct drm_display_mode *mode)
> -{
> -	int err;
> -
> -	err = mipi_dsi_dcs_set_column_address(left, 0, mode->hdisplay / 2 - 1);
> -	if (err < 0) {
> -		dev_err(&left->dev, "failed to set column address: %d\n", err);
> -		return err;
> -	}
> -
> -	err = mipi_dsi_dcs_set_column_address(right, 0, mode->hdisplay / 2 - 1);
> -	if (err < 0) {
> -		dev_err(&right->dev, "failed to set column address: %d\n", err);
> -		return err;
> -	}
> -
> -	err = mipi_dsi_dcs_set_page_address(left, 0, mode->vdisplay - 1);
> -	if (err < 0) {
> -		dev_err(&left->dev, "failed to set page address: %d\n", err);
> -		return err;
> -	}
> -
> -	err = mipi_dsi_dcs_set_page_address(right, 0, mode->vdisplay - 1);
> -	if (err < 0) {
> -		dev_err(&right->dev, "failed to set page address: %d\n", err);
> -		return err;
> -	}
> -
>   	return 0;
>   }
>   
> -static int jdi_write_dcdc_registers(struct jdi_panel *jdi)
> +static void jdi_setup_symmetrical_split(struct mipi_dsi_multi_context *dsi_ctx,
> +					struct mipi_dsi_device *left,
> +					struct mipi_dsi_device *right,
> +					const struct drm_display_mode *mode)
> +{
> +	mipi_dsi_dual(mipi_dsi_dcs_set_column_address_multi,
> +		      left, right, dsi_ctx,
> +		      0, mode->hdisplay / 2 - 1);
> +	mipi_dsi_dual(mipi_dsi_dcs_set_page_address_multi,
> +		      left, right, dsi_ctx,
> +		      0, mode->vdisplay - 1);
> +}
> +
> +static void jdi_write_dcdc_registers(struct mipi_dsi_multi_context *dsi_ctx,
> +				     struct jdi_panel *jdi)
>   {
>   	/* Clear the manufacturer command access protection */
> -	mipi_dsi_generic_write_seq(jdi->link1, MCS_CMD_ACS_PROT,
> -				   MCS_CMD_ACS_PROT_OFF);
> -	mipi_dsi_generic_write_seq(jdi->link2, MCS_CMD_ACS_PROT,
> -				   MCS_CMD_ACS_PROT_OFF);
> +	mipi_dsi_dual(mipi_dsi_generic_write_seq_multi,
> +		      jdi->link1, jdi->link2, dsi_ctx,
> +		      MCS_CMD_ACS_PROT, MCS_CMD_ACS_PROT_OFF);
>   	/*
> -	 * Change the VGH/VGL divide rations to move the noise generated by the
> +	 * Change the VGH/VGL divide ratios to move the noise generated by the
>   	 * TCONN. This should hopefully avoid interaction with the backlight
>   	 * controller.
>   	 */
> -	mipi_dsi_generic_write_seq(jdi->link1, MCS_PWR_CTRL_FUNC,
> -				   MCS_PWR_CTRL_PARAM1_VGH_330_DIV |
> -				   MCS_PWR_CTRL_PARAM1_DEFAULT,
> -				   MCS_PWR_CTRL_PARAM2_VGL_410_DIV |
> -				   MCS_PWR_CTRL_PARAM2_DEFAULT);
> -
> -	mipi_dsi_generic_write_seq(jdi->link2, MCS_PWR_CTRL_FUNC,
> -				   MCS_PWR_CTRL_PARAM1_VGH_330_DIV |
> -				   MCS_PWR_CTRL_PARAM1_DEFAULT,
> -				   MCS_PWR_CTRL_PARAM2_VGL_410_DIV |
> -				   MCS_PWR_CTRL_PARAM2_DEFAULT);
> -
> -	return 0;
> +	mipi_dsi_dual(mipi_dsi_generic_write_seq_multi,
> +		      jdi->link1, jdi->link2, dsi_ctx,
> +		      MCS_PWR_CTRL_FUNC,
> +		      MCS_PWR_CTRL_PARAM1_VGH_330_DIV |
> +		      MCS_PWR_CTRL_PARAM1_DEFAULT,
> +		      MCS_PWR_CTRL_PARAM2_VGL_410_DIV |
> +		      MCS_PWR_CTRL_PARAM2_DEFAULT);
>   }
>   
>   static int jdi_panel_prepare(struct drm_panel *panel)
>   {
>   	struct jdi_panel *jdi = to_panel_jdi(panel);
> +	struct mipi_dsi_multi_context dsi_ctx = { .accum_err = 0 };

Technically this should be in reverse christmas tree order but it is
just a tiny nitpick.

>   	int err;
>   
>   	/* Disable backlight to avoid showing random pixels
> @@ -231,88 +206,36 @@ static int jdi_panel_prepare(struct drm_panel *panel)
>   	 * put in place to communicate the configuration back to the DSI host
>   	 * controller.
>   	 */
> -	err = jdi_setup_symmetrical_split(jdi->link1, jdi->link2,
> -					  jdi->mode);
> -	if (err < 0) {
> -		dev_err(panel->dev, "failed to set up symmetrical split: %d\n",
> -			err);
> -		goto poweroff;
> -	}
> +	jdi_setup_symmetrical_split(&dsi_ctx, jdi->link1, jdi->link2,
> +				    jdi->mode);
>   
> -	err = mipi_dsi_dcs_set_tear_scanline(jdi->link1,
> -					     jdi->mode->vdisplay - 16);
> -	if (err < 0) {
> -		dev_err(panel->dev, "failed to set tear scanline: %d\n", err);
> -		goto poweroff;
> -	}
> +	mipi_dsi_dual(mipi_dsi_dcs_set_tear_scanline_multi,
> +		      jdi->link1, jdi->link2, &dsi_ctx,
> +		      jdi->mode->vdisplay - 16);
>   
> -	err = mipi_dsi_dcs_set_tear_scanline(jdi->link2,
> -					     jdi->mode->vdisplay - 16);
> -	if (err < 0) {
> -		dev_err(panel->dev, "failed to set tear scanline: %d\n", err);
> -		goto poweroff;
> -	}
> +	mipi_dsi_dual(mipi_dsi_dcs_set_tear_on_multi,
> +		      jdi->link1, jdi->link2, &dsi_ctx,
> +		      MIPI_DSI_DCS_TEAR_MODE_VBLANK);
>   
> -	err = mipi_dsi_dcs_set_tear_on(jdi->link1,
> -				       MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> -	if (err < 0) {
> -		dev_err(panel->dev, "failed to set tear on: %d\n", err);
> -		goto poweroff;
> -	}
> +	mipi_dsi_dual(mipi_dsi_dcs_set_pixel_format_multi,
> +		      jdi->link1, jdi->link2, &dsi_ctx,
> +		      MIPI_DCS_PIXEL_FMT_24BIT);
>   
> -	err = mipi_dsi_dcs_set_tear_on(jdi->link2,
> -				       MIPI_DSI_DCS_TEAR_MODE_VBLANK);
> -	if (err < 0) {
> -		dev_err(panel->dev, "failed to set tear on: %d\n", err);
> -		goto poweroff;
> -	}
> +	mipi_dsi_dual(mipi_dsi_dcs_exit_sleep_mode_multi,
> +		      jdi->link1, jdi->link2, &dsi_ctx);
>   
> -	err = mipi_dsi_dcs_set_pixel_format(jdi->link1, MIPI_DCS_PIXEL_FMT_24BIT);
> -	if (err < 0) {
> -		dev_err(panel->dev, "failed to set pixel format: %d\n", err);
> -		goto poweroff;
> -	}
> -
> -	err = mipi_dsi_dcs_set_pixel_format(jdi->link2, MIPI_DCS_PIXEL_FMT_24BIT);
> -	if (err < 0) {
> -		dev_err(panel->dev, "failed to set pixel format: %d\n", err);
> -		goto poweroff;
> -	}
> -
> -	err = mipi_dsi_dcs_exit_sleep_mode(jdi->link1);
> -	if (err < 0) {
> -		dev_err(panel->dev, "failed to exit sleep mode: %d\n", err);
> -		goto poweroff;
> -	}
> -
> -	err = mipi_dsi_dcs_exit_sleep_mode(jdi->link2);
> -	if (err < 0) {
> -		dev_err(panel->dev, "failed to exit sleep mode: %d\n", err);
> -		goto poweroff;
> -	}
> -
> -	err = jdi_write_dcdc_registers(jdi);
> -	if (err < 0) {
> -		dev_err(panel->dev, "failed to write dcdc registers: %d\n", err);
> -		goto poweroff;
> -	}
> +	jdi_write_dcdc_registers(&dsi_ctx, jdi);
>   	/*
> -	 * We need to wait 150ms between mipi_dsi_dcs_exit_sleep_mode() and
> -	 * mipi_dsi_dcs_set_display_on().
> +	 * We need to wait 150ms between mipi_dsi_dcs_exit_sleep_mode_multi()
> +	 * and mipi_dsi_dcs_set_display_on_multi().
>   	 */
> -	msleep(150);
> +	mipi_dsi_msleep(&dsi_ctx, 150);
>   
> -	err = mipi_dsi_dcs_set_display_on(jdi->link1);
> -	if (err < 0) {
> -		dev_err(panel->dev, "failed to set display on: %d\n", err);
> -		goto poweroff;
> -	}
> +	mipi_dsi_dual(mipi_dsi_dcs_set_display_on_multi,
> +		      jdi->link1, jdi->link2, &dsi_ctx);
>   
> -	err = mipi_dsi_dcs_set_display_on(jdi->link2);
> -	if (err < 0) {
> -		dev_err(panel->dev, "failed to set display on: %d\n", err);
> +	if (dsi_ctx.accum_err < 0)
>   		goto poweroff;
> -	}
>   
>   	jdi->link1->mode_flags &= ~MIPI_DSI_MODE_LPM;
>   	jdi->link2->mode_flags &= ~MIPI_DSI_MODE_LPM;
