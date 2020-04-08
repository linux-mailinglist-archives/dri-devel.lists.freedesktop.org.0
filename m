Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 412C21A27D9
	for <lists+dri-devel@lfdr.de>; Wed,  8 Apr 2020 19:20:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BB9D6EAA4;
	Wed,  8 Apr 2020 17:20:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C21D06EAA4
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Apr 2020 17:20:19 +0000 (UTC)
IronPort-SDR: tsAR2vajmgcVRTPjHDId9zkmRp03WxyY2JY1S+S32zVFrVAaCk82vzBDz8CR/45Wurw6aJK787
 j7193D/ssJ0Q==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2020 10:20:19 -0700
IronPort-SDR: alANrSFQ+jAPj75SvasTFxKWiusMNUm7sDiMVunglpcRpH3YPg0qXdJUn1i88hu299MGPKZ9nm
 1wY0wwYKR0mQ==
X-IronPort-AV: E=Sophos;i="5.72,359,1580803200"; d="scan'208";a="425211159"
Received: from slinke-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.60.237])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2020 10:20:15 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: Arnd Bergmann <arnd@arndb.de>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH] fbdev: mx3fb: avoid warning about psABI change
In-Reply-To: <20200408162551.3928330-1-arnd@arndb.de>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20200408162551.3928330-1-arnd@arndb.de>
Date: Wed, 08 Apr 2020 20:20:11 +0300
Message-ID: <87pnchhp2s.fsf@intel.com>
MIME-Version: 1.0
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
Cc: linux-fbdev@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Enrico Weigelt <info@metux.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 08 Apr 2020, Arnd Bergmann <arnd@arndb.de> wrote:
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

I have no idea why get_maintainer.pl (I presume) is Cc'ing me... but
since it is, I'll note that the pointer could be const, while the patch
is

Reviewed-by: Jani Nikula <jani.nikula@intel.com>

either way.

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

-- 
Jani Nikula, Intel Open Source Graphics Center
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
