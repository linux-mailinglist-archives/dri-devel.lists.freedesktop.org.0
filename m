Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DB2C1847F3
	for <lists+dri-devel@lfdr.de>; Fri, 13 Mar 2020 14:22:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C31376E29A;
	Fri, 13 Mar 2020 13:22:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com
 [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6F5C6E29A
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Mar 2020 13:22:49 +0000 (UTC)
Received: from pendragon.ideasonboard.com (81-175-216-236.bb.dnainternet.fi
 [81.175.216.236])
 by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6C7325F;
 Fri, 13 Mar 2020 14:22:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
 s=mail; t=1584105767;
 bh=YsSJnqOem52J5XcE2z9PwyLe7bmOeaq2032U+FDlYZc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=p2eZS1R9/xxqvG4jVuAGZfQokN7bJveifCr8zVnnquZgKQlmFPUbzwie0fkA3tP0E
 ynh+AFi6wwlNq6/w9BohbS8vtlmHLB7hijbWjK1rqBl5GZzYxDeXkxU9W2LEar2ztq
 Sw+FeYAJIk4w5rrBP3REZhSwOhQdFSnbiJIRs5nw=
Date: Fri, 13 Mar 2020 15:22:44 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Re: [PATCH] omapfb: Remove unused writeback code
Message-ID: <20200313132244.GB4751@pendragon.ideasonboard.com>
References: <20200313122410.7528-1-tomi.valkeinen@ti.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200313122410.7528-1-tomi.valkeinen@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Tomi,

Thank you for the patch.

On Fri, Mar 13, 2020 at 02:24:10PM +0200, Tomi Valkeinen wrote:
> Remove unused writeback code. This code will never be used, as omapfb is
> being deprecated.

I'm fine with that, but out of curiosity, is there any particular reason
to remove that code now instead of letting omapfb bitrot slowly ?

> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ti.com>
> ---
>  drivers/video/fbdev/omap2/omapfb/dss/dispc.c | 114 -------------------
>  drivers/video/fbdev/omap2/omapfb/dss/dss.h   |  20 ----
>  2 files changed, 134 deletions(-)
> 
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dispc.c b/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
> index ce37da85cc45..4a16798b2ecd 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/dispc.c
> @@ -557,11 +557,6 @@ u32 dispc_mgr_get_sync_lost_irq(enum omap_channel channel)
>  }
>  EXPORT_SYMBOL(dispc_mgr_get_sync_lost_irq);
>  
> -u32 dispc_wb_get_framedone_irq(void)
> -{
> -	return DISPC_IRQ_FRAMEDONEWB;
> -}
> -
>  bool dispc_mgr_go_busy(enum omap_channel channel)
>  {
>  	return mgr_fld_read(channel, DISPC_MGR_FLD_GO) == 1;
> @@ -579,30 +574,6 @@ void dispc_mgr_go(enum omap_channel channel)
>  }
>  EXPORT_SYMBOL(dispc_mgr_go);
>  
> -bool dispc_wb_go_busy(void)
> -{
> -	return REG_GET(DISPC_CONTROL2, 6, 6) == 1;
> -}
> -
> -void dispc_wb_go(void)
> -{
> -	enum omap_plane plane = OMAP_DSS_WB;
> -	bool enable, go;
> -
> -	enable = REG_GET(DISPC_OVL_ATTRIBUTES(plane), 0, 0) == 1;
> -
> -	if (!enable)
> -		return;
> -
> -	go = REG_GET(DISPC_CONTROL2, 6, 6) == 1;
> -	if (go) {
> -		DSSERR("GO bit not down for WB\n");
> -		return;
> -	}
> -
> -	REG_FLD_MOD(DISPC_CONTROL2, 1, 6, 6);
> -}
> -
>  static void dispc_ovl_write_firh_reg(enum omap_plane plane, int reg, u32 value)
>  {
>  	dispc_write_reg(DISPC_OVL_FIR_COEF_H(plane, reg), value);
> @@ -1028,13 +999,6 @@ static enum omap_channel dispc_ovl_get_channel_out(enum omap_plane plane)
>  	}
>  }
>  
> -void dispc_wb_set_channel_in(enum dss_writeback_channel channel)
> -{
> -	enum omap_plane plane = OMAP_DSS_WB;
> -
> -	REG_FLD_MOD(DISPC_OVL_ATTRIBUTES(plane), channel, 18, 16);
> -}
> -
>  static void dispc_ovl_set_burst_size(enum omap_plane plane,
>  		enum omap_burst_size burst_size)
>  {
> @@ -2805,74 +2769,6 @@ int dispc_ovl_setup(enum omap_plane plane, const struct omap_overlay_info *oi,
>  }
>  EXPORT_SYMBOL(dispc_ovl_setup);
>  
> -int dispc_wb_setup(const struct omap_dss_writeback_info *wi,
> -		bool mem_to_mem, const struct omap_video_timings *mgr_timings)
> -{
> -	int r;
> -	u32 l;
> -	enum omap_plane plane = OMAP_DSS_WB;
> -	const int pos_x = 0, pos_y = 0;
> -	const u8 zorder = 0, global_alpha = 0;
> -	const bool replication = false;
> -	bool truncation;
> -	int in_width = mgr_timings->x_res;
> -	int in_height = mgr_timings->y_res;
> -	enum omap_overlay_caps caps =
> -		OMAP_DSS_OVL_CAP_SCALE | OMAP_DSS_OVL_CAP_PRE_MULT_ALPHA;
> -
> -	DSSDBG("dispc_wb_setup, pa %x, pa_uv %x, %d,%d -> %dx%d, cmode %x, "
> -		"rot %d, mir %d\n", wi->paddr, wi->p_uv_addr, in_width,
> -		in_height, wi->width, wi->height, wi->color_mode, wi->rotation,
> -		wi->mirror);
> -
> -	r = dispc_ovl_setup_common(plane, caps, wi->paddr, wi->p_uv_addr,
> -		wi->buf_width, pos_x, pos_y, in_width, in_height, wi->width,
> -		wi->height, wi->color_mode, wi->rotation, wi->mirror, zorder,
> -		wi->pre_mult_alpha, global_alpha, wi->rotation_type,
> -		replication, mgr_timings, mem_to_mem);
> -
> -	switch (wi->color_mode) {
> -	case OMAP_DSS_COLOR_RGB16:
> -	case OMAP_DSS_COLOR_RGB24P:
> -	case OMAP_DSS_COLOR_ARGB16:
> -	case OMAP_DSS_COLOR_RGBA16:
> -	case OMAP_DSS_COLOR_RGB12U:
> -	case OMAP_DSS_COLOR_ARGB16_1555:
> -	case OMAP_DSS_COLOR_XRGB16_1555:
> -	case OMAP_DSS_COLOR_RGBX16:
> -		truncation = true;
> -		break;
> -	default:
> -		truncation = false;
> -		break;
> -	}
> -
> -	/* setup extra DISPC_WB_ATTRIBUTES */
> -	l = dispc_read_reg(DISPC_OVL_ATTRIBUTES(plane));
> -	l = FLD_MOD(l, truncation, 10, 10);	/* TRUNCATIONENABLE */
> -	l = FLD_MOD(l, mem_to_mem, 19, 19);	/* WRITEBACKMODE */
> -	if (mem_to_mem)
> -		l = FLD_MOD(l, 1, 26, 24);	/* CAPTUREMODE */
> -	else
> -		l = FLD_MOD(l, 0, 26, 24);	/* CAPTUREMODE */
> -	dispc_write_reg(DISPC_OVL_ATTRIBUTES(plane), l);
> -
> -	if (mem_to_mem) {
> -		/* WBDELAYCOUNT */
> -		REG_FLD_MOD(DISPC_OVL_ATTRIBUTES2(plane), 0, 7, 0);
> -	} else {
> -		int wbdelay;
> -
> -		wbdelay = min(mgr_timings->vfp + mgr_timings->vsw +
> -			mgr_timings->vbp, 255);
> -
> -		/* WBDELAYCOUNT */
> -		REG_FLD_MOD(DISPC_OVL_ATTRIBUTES2(plane), wbdelay, 7, 0);
> -	}
> -
> -	return r;
> -}
> -
>  int dispc_ovl_enable(enum omap_plane plane, bool enable)
>  {
>  	DSSDBG("dispc_enable_plane %d, %d\n", plane, enable);
> @@ -2903,16 +2799,6 @@ bool dispc_mgr_is_enabled(enum omap_channel channel)
>  }
>  EXPORT_SYMBOL(dispc_mgr_is_enabled);
>  
> -void dispc_wb_enable(bool enable)
> -{
> -	dispc_ovl_enable(OMAP_DSS_WB, enable);
> -}
> -
> -bool dispc_wb_is_enabled(void)
> -{
> -	return dispc_ovl_enabled(OMAP_DSS_WB);
> -}
> -
>  static void dispc_lcd_enable_signal_polarity(bool act_high)
>  {
>  	if (!dss_has_feature(FEAT_LCDENABLEPOL))
> diff --git a/drivers/video/fbdev/omap2/omapfb/dss/dss.h b/drivers/video/fbdev/omap2/omapfb/dss/dss.h
> index a2269008590f..21cfcbf74a6d 100644
> --- a/drivers/video/fbdev/omap2/omapfb/dss/dss.h
> +++ b/drivers/video/fbdev/omap2/omapfb/dss/dss.h
> @@ -89,17 +89,6 @@ enum dss_dsi_content_type {
>  	DSS_DSI_CONTENT_GENERIC,
>  };
>  
> -enum dss_writeback_channel {
> -	DSS_WB_LCD1_MGR =	0,
> -	DSS_WB_LCD2_MGR =	1,
> -	DSS_WB_TV_MGR =		2,
> -	DSS_WB_OVL0 =		3,
> -	DSS_WB_OVL1 =		4,
> -	DSS_WB_OVL2 =		5,
> -	DSS_WB_OVL3 =		6,
> -	DSS_WB_LCD3_MGR =	7,
> -};
> -
>  enum dss_pll_id {
>  	DSS_PLL_DSI1,
>  	DSS_PLL_DSI2,
> @@ -403,15 +392,6 @@ int dispc_mgr_get_clock_div(enum omap_channel channel,
>  		struct dispc_clock_info *cinfo);
>  void dispc_set_tv_pclk(unsigned long pclk);
>  
> -u32 dispc_wb_get_framedone_irq(void);
> -bool dispc_wb_go_busy(void);
> -void dispc_wb_go(void);
> -void dispc_wb_enable(bool enable);
> -bool dispc_wb_is_enabled(void);
> -void dispc_wb_set_channel_in(enum dss_writeback_channel channel);
> -int dispc_wb_setup(const struct omap_dss_writeback_info *wi,
> -		bool mem_to_mem, const struct omap_video_timings *timings);
> -
>  u32 dispc_read_irqstatus(void);
>  void dispc_clear_irqstatus(u32 mask);
>  u32 dispc_read_irqenable(void);

-- 
Regards,

Laurent Pinchart
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
