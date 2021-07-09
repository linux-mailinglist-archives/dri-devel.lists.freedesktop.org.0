Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9938F3C2940
	for <lists+dri-devel@lfdr.de>; Fri,  9 Jul 2021 20:53:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C32976EA58;
	Fri,  9 Jul 2021 18:53:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 196996EA58
 for <dri-devel@lists.freedesktop.org>; Fri,  9 Jul 2021 18:53:28 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id f5c9269f-e0e6-11eb-8d1a-0050568cd888;
 Fri, 09 Jul 2021 18:53:33 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id B6AFE194B06;
 Fri,  9 Jul 2021 20:53:36 +0200 (CEST)
Date: Fri, 9 Jul 2021 20:53:25 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH 02/12] drm/mgag200: Return errno codes from PLL compute
 functions
Message-ID: <YOibJbgFFfqQ6VqS@ravnborg.org>
References: <20210705124515.27253-1-tzimmermann@suse.de>
 <20210705124515.27253-3-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210705124515.27253-3-tzimmermann@suse.de>
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
 airlied@redhat.com, emil.velikov@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Jul 05, 2021 at 02:45:05PM +0200, Thomas Zimmermann wrote:
> Return -EINVAL if there's no PLL configuration for the given pixel
> clock.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>  drivers/gpu/drm/mgag200/mgag200_mode.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
> index 482843ebb69f..045a20055515 100644
> --- a/drivers/gpu/drm/mgag200/mgag200_mode.c
> +++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
> @@ -134,7 +134,7 @@ static int mgag200_g200_set_plls(struct mga_device *mdev, long clock)
>  
>  	if (clock > p_clk_max) {
>  		drm_err(dev, "Pixel Clock %ld too high\n", clock);
> -		return 1;
> +		return -EINVAL;
>  	}
>  
>  	if (clock < p_clk_min >> 3)
> @@ -293,7 +293,7 @@ static int mga_g200se_set_plls(struct mga_device *mdev, long clock)
>  
>  	if (delta > permitteddelta) {
>  		pr_warn("PLL delta too large\n");
> -		return 1;
> +		return -EINVAL;
>  	}
>  
>  	misc = RREG8(MGA_MISC_IN);

The return value is ignored but I assume it makes sense in a later
patch. Should mgag200_crtc_set_plls() return -EINVAL if there was no
match? Today it returns 0 - which is not an error.

	Sam
