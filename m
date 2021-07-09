Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 724093C293D
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 20:50:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C075B6E951;
	Fri,  9 Jul 2021 18:50:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22DDC6E951
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 18:50:15 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id 82be386e-e0e6-11eb-8d1a-0050568cd888;
 Fri, 09 Jul 2021 18:50:20 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id 2A1C1194B06;
 Fri,  9 Jul 2021 20:50:18 +0200 (CEST)
Date: Fri, 9 Jul 2021 20:50:07 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 01/12] drm/mgag200: Select clock in PLL update functions
Message-ID: <YOiaX7UJ9Ka5xTM2@ravnborg.org>
References: <20210705124515.27253-1-tzimmermann@suse.de>
 <20210705124515.27253-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210705124515.27253-2-tzimmermann@suse.de>
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
Cc: John.p.donnelly@oracle.com, dri-devel@lists.freedesktop.org,
 airlied@redhat.com, stable@vger.kernel.org, emil.velikov@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Thomas,

On Mon, Jul 05, 2021 at 02:45:04PM +0200, Thomas Zimmermann wrote:
> Put the clock-selection code into each of the PLL-update functions to
> make them select the correct pixel clock.
> 
> The pixel clock for video output was not actually set before programming
> the clock's values. It worked because the device had the correct clock
> pre-set.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> Fixes: db05f8d3dc87 ("drm/mgag200: Split MISC register update into PLL selection, SYNC and I/O")
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Emil Velikov <emil.velikov@collabora.com>
> Cc: Dave Airlie <airlied@redhat.com>
> Cc: dri-devel@lists.freedesktop.org
> Cc: <stable@vger.kernel.org> # v5.9+
> ---
>  drivers/gpu/drm/mgag200/mgag200_mode.c | 47 ++++++++++++++++++++------
>  1 file changed, 37 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index 3b3059f471c2..482843ebb69f 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -130,6 +130,7 @@ static int mgag200_g200_set_plls(struct mga_device *mdev, long clock)
>  	long ref_clk = mdev->model.g200.ref_clk;
>  	long p_clk_min = mdev->model.g200.pclk_min;
>  	long p_clk_max =  mdev->model.g200.pclk_max;
> +	u8 misc;
>  
>  	if (clock > p_clk_max) {
>  		drm_err(dev, "Pixel Clock %ld too high\n", clock);
> @@ -174,6 +175,11 @@ static int mgag200_g200_set_plls(struct mga_device *mdev, long clock)
>  	drm_dbg_kms(dev, "clock: %ld vco: %ld m: %d n: %d p: %d s: %d\n",
>  		    clock, f_vco, m, n, p, s);
>  
> +	misc = RREG8(MGA_MISC_IN);
> +	misc &= ~MGAREG_MISC_CLK_SEL_MASK;
> +	misc |= MGAREG_MISC_CLK_SEL_MGA_MSK;
> +	WREG8(MGA_MISC_OUT, misc);

This chunk is repeated a number of times.
Any good reason why this is not a small helper?

	Sam
