Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8CE3EF248
	for <lists+dri-devel@lfdr.de>; Tue, 17 Aug 2021 20:53:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72F926E231;
	Tue, 17 Aug 2021 18:53:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 336AC6E231
 for <dri-devel@lists.freedesktop.org>; Tue, 17 Aug 2021 18:53:56 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 71b0b081-ff8c-11eb-aa7e-0050568cd888;
 Tue, 17 Aug 2021 18:53:43 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 267AA194B17;
 Tue, 17 Aug 2021 20:54:03 +0200 (CEST)
Date: Tue, 17 Aug 2021 20:53:52 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
Cc: dri-devel@lists.freedesktop.org, edmund.j.dea@intel.com
Subject: Re: [PATCH v2 1/8] drm/kmb: Work around for higher system clock
Message-ID: <YRwFwGY7BsO7CoO+@ravnborg.org>
References: <20210803220452.52379-1-anitha.chrisanthus@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210803220452.52379-1-anitha.chrisanthus@intel.com>
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

Hi Anitha,

On Tue, Aug 03, 2021 at 03:04:45PM -0700, Anitha Chrisanthus wrote:
> Use a different value for system clock offset in the
> ppl/llp ratio calculations for clocks higher than 500 Mhz.
> 
> Fixes: 98521f4d4b4c ("drm/kmb: Mipi DSI part of the display driver")
> Signed-off-by: Anitha Chrisanthus <anitha.chrisanthus@intel.com>
> ---
>  drivers/gpu/drm/kmb/kmb_dsi.c | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/kmb/kmb_dsi.c b/drivers/gpu/drm/kmb/kmb_dsi.c
> index 231041b269f5..7e2371ffcb18 100644
> --- a/drivers/gpu/drm/kmb/kmb_dsi.c
> +++ b/drivers/gpu/drm/kmb/kmb_dsi.c
> @@ -482,6 +482,10 @@ static u32 mipi_tx_fg_section_cfg(struct kmb_dsi *kmb_dsi,
>  	return 0;
>  }
>  
> +#define CLK_DIFF_LOW 50
> +#define CLK_DIFF_HI 60
> +#define SYSCLK_500  500
> +
>  static void mipi_tx_fg_cfg_regs(struct kmb_dsi *kmb_dsi, u8 frame_gen,
>  				struct mipi_tx_frame_timing_cfg *fg_cfg)
>  {
> @@ -492,7 +496,12 @@ static void mipi_tx_fg_cfg_regs(struct kmb_dsi *kmb_dsi, u8 frame_gen,
>  	/* 500 Mhz system clock minus 50 to account for the difference in
>  	 * MIPI clock speed in RTL tests
>  	 */
The comment should be updated to match the code.

	Sam

> -	sysclk = kmb_dsi->sys_clk_mhz - 50;
> +	if (kmb_dsi->sys_clk_mhz == SYSCLK_500) {
> +		sysclk = kmb_dsi->sys_clk_mhz - CLK_DIFF_LOW;
> +	} else {
> +		/* 700 Mhz clk*/
> +		sysclk = kmb_dsi->sys_clk_mhz - CLK_DIFF_HI;
> +	}
>  
>  	/* PPL-Pixel Packing Layer, LLP-Low Level Protocol
>  	 * Frame genartor timing parameters are clocked on the system clock,
> -- 
> 2.25.1
