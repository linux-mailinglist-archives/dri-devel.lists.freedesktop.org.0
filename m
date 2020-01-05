Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 618431307BB
	for <lists+dri-devel@lfdr.de>; Sun,  5 Jan 2020 12:32:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9193E89FD4;
	Sun,  5 Jan 2020 11:32:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk3.altibox.net (asavdk3.altibox.net [109.247.116.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C579789FD4
 for <dri-devel@lists.freedesktop.org>; Sun,  5 Jan 2020 11:32:38 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk3.altibox.net (Postfix) with ESMTPS id B53EC20052;
 Sun,  5 Jan 2020 12:32:36 +0100 (CET)
Date: Sun, 5 Jan 2020 12:32:35 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Jitao Shi <jitao.shi@mediatek.com>
Subject: Re: [PATCH v7 8/8] drm/panel: support for auo,b101uan08.3 wuxga dsi
 video mode panel
Message-ID: <20200105113235.GC16043@ravnborg.org>
References: <20191012030720.27127-1-jitao.shi@mediatek.com>
 <20191012030720.27127-9-jitao.shi@mediatek.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191012030720.27127-9-jitao.shi@mediatek.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=eMA9ckh1 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=mpaa-ttXAAAA:8
 a=7gkXJVJtAAAA:8 a=FdkQ6FN8FfoDwbS2zlMA:9 a=CjuIK1q_8ugA:10
 a=6heAxKwa5pAsJatQ0mat:22 a=E9Po1WZjFZOl8hwRPBS3:22
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
Cc: srv_heupstream@mediatek.com, David Airlie <airlied@linux.ie>,
 stonea168@163.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, cawa.cheng@mediatek.com,
 linux-mediatek@lists.infradead.org, yingjoe.chen@mediatek.com,
 eddie.huang@mediatek.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Jitao.

Looks good.

On Sat, Oct 12, 2019 at 11:07:20AM +0800, Jitao Shi wrote:
> Auo,auo,b101uan08.3's connector is same as boe,tv101wum-nl6.
> The most codes can be reuse.
> So auo,b101uan08.3 and boe,tv101wum-nl6 use one driver file.
> Add the different parts in driver data.
> 
> Signed-off-by: Jitao Shi <jitao.shi@mediatek.com>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

> ---
>  .../gpu/drm/panel/panel-boe-tv101wum-nl6.c    | 78 +++++++++++++++++++
>  1 file changed, 78 insertions(+)
> 
> diff --git a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> index 7b47619675f5..e2496a334ab6 100644
> --- a/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> +++ b/drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c
> @@ -382,6 +382,53 @@ static const struct panel_init_cmd auo_kd101n80_45na_init_cmd[] = {
>  	{},
>  };
>  
> +static const struct panel_init_cmd auo_b101uan08_3_init_cmd[] = {
> +	_INIT_DELAY_CMD(24),
> +	_INIT_DCS_CMD(0xB0, 0x01),
> +	_INIT_DCS_CMD(0xC0, 0x48),
> +	_INIT_DCS_CMD(0xC1, 0x48),
> +	_INIT_DCS_CMD(0xC2, 0x47),
> +	_INIT_DCS_CMD(0xC3, 0x47),
> +	_INIT_DCS_CMD(0xC4, 0x46),
> +	_INIT_DCS_CMD(0xC5, 0x46),
> +	_INIT_DCS_CMD(0xC6, 0x45),
> +	_INIT_DCS_CMD(0xC7, 0x45),
> +	_INIT_DCS_CMD(0xC8, 0x64),
> +	_INIT_DCS_CMD(0xC9, 0x64),
> +	_INIT_DCS_CMD(0xCA, 0x4F),
> +	_INIT_DCS_CMD(0xCB, 0x4F),
> +	_INIT_DCS_CMD(0xCC, 0x40),
> +	_INIT_DCS_CMD(0xCD, 0x40),
> +	_INIT_DCS_CMD(0xCE, 0x66),
> +	_INIT_DCS_CMD(0xCF, 0x66),
> +	_INIT_DCS_CMD(0xD0, 0x4F),
> +	_INIT_DCS_CMD(0xD1, 0x4F),
> +	_INIT_DCS_CMD(0xD2, 0x41),
> +	_INIT_DCS_CMD(0xD3, 0x41),
> +	_INIT_DCS_CMD(0xD4, 0x48),
> +	_INIT_DCS_CMD(0xD5, 0x48),
> +	_INIT_DCS_CMD(0xD6, 0x47),
> +	_INIT_DCS_CMD(0xD7, 0x47),
> +	_INIT_DCS_CMD(0xD8, 0x46),
> +	_INIT_DCS_CMD(0xD9, 0x46),
> +	_INIT_DCS_CMD(0xDA, 0x45),
> +	_INIT_DCS_CMD(0xDB, 0x45),
> +	_INIT_DCS_CMD(0xDC, 0x64),
> +	_INIT_DCS_CMD(0xDD, 0x64),
> +	_INIT_DCS_CMD(0xDE, 0x4F),
> +	_INIT_DCS_CMD(0xDF, 0x4F),
> +	_INIT_DCS_CMD(0xE0, 0x40),
> +	_INIT_DCS_CMD(0xE1, 0x40),
> +	_INIT_DCS_CMD(0xE2, 0x66),
> +	_INIT_DCS_CMD(0xE3, 0x66),
> +	_INIT_DCS_CMD(0xE4, 0x4F),
> +	_INIT_DCS_CMD(0xE5, 0x4F),
> +	_INIT_DCS_CMD(0xE6, 0x41),
> +	_INIT_DCS_CMD(0xE7, 0x41),
> +	_INIT_DELAY_CMD(150),
> +	{},
> +};
> +
>  static inline struct boe_panel *to_boe_panel(struct drm_panel *panel)
>  {
>  	return container_of(panel, struct boe_panel, base);
> @@ -652,6 +699,34 @@ static const struct panel_desc boe_tv101wum_n53_desc = {
>  	.init_cmds = boe_init_cmd,
>  };
>  
> +static const struct drm_display_mode auo_b101uan08_3_default_mode = {
> +	.clock = 159667,
> +	.hdisplay = 1200,
> +	.hsync_start = 1200 + 60,
> +	.hsync_end = 1200 + 60 + 4,
> +	.htotal = 1200 + 60 + 4 + 80,
> +	.vdisplay = 1920,
> +	.vsync_start = 1920 + 34,
> +	.vsync_end = 1920 + 34 + 2,
> +	.vtotal = 1920 + 34 + 2 + 24,
> +	.vrefresh = 60,
> +	.type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED,
> +};
> +
> +static const struct panel_desc auo_b101uan08_3_desc = {
> +	.modes = &auo_b101uan08_3_default_mode,
> +	.bpc = 8,
> +	.size = {
> +		.width_mm = 135,
> +		.height_mm = 216,
> +	},
> +	.lanes = 4,
> +	.format = MIPI_DSI_FMT_RGB888,
> +	.mode_flags = MIPI_DSI_MODE_VIDEO | MIPI_DSI_MODE_VIDEO_SYNC_PULSE |
> +		      MIPI_DSI_MODE_LPM,
> +	.init_cmds = auo_b101uan08_3_init_cmd,
> +};
> +
>  static int boe_panel_get_modes(struct drm_panel *panel)
>  {
>  	struct boe_panel *boe = to_boe_panel(panel);
> @@ -782,6 +857,9 @@ static const struct of_device_id boe_of_match[] = {
>  	{ .compatible = "boe,tv101wum-n53",
>  	  .data = &boe_tv101wum_n53_desc
>  	},
> +	{ .compatible = "auo,b101uan08.3",
> +	  .data = &auo_b101uan08_3_desc
> +	},
>  	{ /* sentinel */ }
>  };
>  MODULE_DEVICE_TABLE(of, boe_of_match);
> -- 
> 2.21.0
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
