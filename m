Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 106DA1A27DD
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 19:22:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30D386E1B8;
	Wed,  8 Apr 2020 17:22:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from asavdk4.altibox.net (asavdk4.altibox.net [109.247.116.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 549A16E1B8
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 17:22:52 +0000 (UTC)
Received: from ravnborg.org (unknown [158.248.194.18])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by asavdk4.altibox.net (Postfix) with ESMTPS id 036F380519;
 Wed,  8 Apr 2020 19:22:47 +0200 (CEST)
Date: Wed, 8 Apr 2020 19:22:41 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH] fbdev: mx3fb: avoid warning about psABI change
Message-ID: <20200408172241.GA8826@ravnborg.org>
References: <20200408162551.3928330-1-arnd@arndb.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200408162551.3928330-1-arnd@arndb.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CMAE-Score: 0
X-CMAE-Analysis: v=2.3 cv=XpTUx2N9 c=1 sm=1 tr=0
 a=UWs3HLbX/2nnQ3s7vZ42gw==:117 a=UWs3HLbX/2nnQ3s7vZ42gw==:17
 a=jpOVt7BSZ2e4Z31A5e1TngXxSK0=:19 a=kj9zAlcOel0A:10 a=e5mUnYsNAAAA:8
 a=OoO7JsEZVcoAkVdgrb8A:9 a=CjuIK1q_8ugA:10 a=Vxmtnl_E_bksehYqCbjh:22
 a=pHzHmUro8NiASowvMSCR:22 a=nt3jZW36AmriUCFCBwmW:22
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
Cc: linux-fbdev@vger.kernel.org,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jani Nikula <jani.nikula@intel.com>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Enrico Weigelt <info@metux.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Arnd.

On Wed, Apr 08, 2020 at 06:25:38PM +0200, Arnd Bergmann wrote:
> The arm64 gcc-9 release warns about a change in the calling
> conventions:
> 
> drivers/video/fbdev/mx3fb.c: In function 'sdc_init_panel':
> drivers/video/fbdev/mx3fb.c:506:12: note: parameter passing for argument of type 'struct ipu_di_signal_cfg' changed in GCC 9.1
>   506 | static int sdc_init_panel(struct mx3fb_data *mx3fb, enum ipu_panel panel,
>       |            ^~~~~~~~~~~~~~
> drivers/video/fbdev/mx3fb.c: In function '__set_par':
> drivers/video/fbdev/mx3fb.c:848:7: note: parameter passing for argument of type 'struct ipu_di_signal_cfg' changed in GCC 9.1
> 
> Change the file to just pass the struct by reference, which is
> unambiguous and avoids the warning.
> 
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Simple fix - thanks.
Applied and pushed to drm-misc-next.

I did not queue this in -fixes as it is no regression
just a compiler trying to help a bit more.

	Sam

> ---
>  drivers/video/fbdev/mx3fb.c | 20 ++++++++++----------
>  1 file changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/video/fbdev/mx3fb.c b/drivers/video/fbdev/mx3fb.c
> index 4af28e4421e5..e13fea3a292f 100644
> --- a/drivers/video/fbdev/mx3fb.c
> +++ b/drivers/video/fbdev/mx3fb.c
> @@ -509,7 +509,7 @@ static int sdc_init_panel(struct mx3fb_data *mx3fb, enum ipu_panel panel,
>  			  uint16_t h_start_width, uint16_t h_sync_width,
>  			  uint16_t h_end_width, uint16_t v_start_width,
>  			  uint16_t v_sync_width, uint16_t v_end_width,
> -			  struct ipu_di_signal_cfg sig)
> +			  struct ipu_di_signal_cfg *sig)
>  {
>  	unsigned long lock_flags;
>  	uint32_t reg;
> @@ -591,17 +591,17 @@ static int sdc_init_panel(struct mx3fb_data *mx3fb, enum ipu_panel panel,
>  
>  	/* DI settings */
>  	old_conf = mx3fb_read_reg(mx3fb, DI_DISP_IF_CONF) & 0x78FFFFFF;
> -	old_conf |= sig.datamask_en << DI_D3_DATAMSK_SHIFT |
> -		sig.clksel_en << DI_D3_CLK_SEL_SHIFT |
> -		sig.clkidle_en << DI_D3_CLK_IDLE_SHIFT;
> +	old_conf |= sig->datamask_en << DI_D3_DATAMSK_SHIFT |
> +		sig->clksel_en << DI_D3_CLK_SEL_SHIFT |
> +		sig->clkidle_en << DI_D3_CLK_IDLE_SHIFT;
>  	mx3fb_write_reg(mx3fb, old_conf, DI_DISP_IF_CONF);
>  
>  	old_conf = mx3fb_read_reg(mx3fb, DI_DISP_SIG_POL) & 0xE0FFFFFF;
> -	old_conf |= sig.data_pol << DI_D3_DATA_POL_SHIFT |
> -		sig.clk_pol << DI_D3_CLK_POL_SHIFT |
> -		sig.enable_pol << DI_D3_DRDY_SHARP_POL_SHIFT |
> -		sig.Hsync_pol << DI_D3_HSYNC_POL_SHIFT |
> -		sig.Vsync_pol << DI_D3_VSYNC_POL_SHIFT;
> +	old_conf |= sig->data_pol << DI_D3_DATA_POL_SHIFT |
> +		sig->clk_pol << DI_D3_CLK_POL_SHIFT |
> +		sig->enable_pol << DI_D3_DRDY_SHARP_POL_SHIFT |
> +		sig->Hsync_pol << DI_D3_HSYNC_POL_SHIFT |
> +		sig->Vsync_pol << DI_D3_VSYNC_POL_SHIFT;
>  	mx3fb_write_reg(mx3fb, old_conf, DI_DISP_SIG_POL);
>  
>  	map = &di_mappings[mx3fb->disp_data_fmt];
> @@ -855,7 +855,7 @@ static int __set_par(struct fb_info *fbi, bool lock)
>  				   fbi->var.upper_margin,
>  				   fbi->var.vsync_len,
>  				   fbi->var.lower_margin +
> -				   fbi->var.vsync_len, sig_cfg) != 0) {
> +				   fbi->var.vsync_len, &sig_cfg) != 0) {
>  			dev_err(fbi->device,
>  				"mx3fb: Error initializing panel.\n");
>  			return -EINVAL;
> -- 
> 2.26.0
> 
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
