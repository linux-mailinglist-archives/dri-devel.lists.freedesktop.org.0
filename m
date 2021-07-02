Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 797523B9C0A
	for <lists+dri-devel@lfdr.de>; Fri,  2 Jul 2021 07:45:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAFE58987A;
	Fri,  2 Jul 2021 05:45:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx2.smtp.larsendata.com (mx2.smtp.larsendata.com
 [91.221.196.228])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F75F8987A
 for <dri-devel@lists.freedesktop.org>; Fri,  2 Jul 2021 05:45:12 +0000 (UTC)
Received: from mail01.mxhotel.dk (mail01.mxhotel.dk [91.221.196.236])
 by mx2.smtp.larsendata.com (Halon) with ESMTPS
 id aad77b8e-daf8-11eb-8d1a-0050568cd888;
 Fri, 02 Jul 2021 05:45:11 +0000 (UTC)
Received: from ravnborg.org (80-162-45-141-cable.dk.customer.tdc.net
 [80.162.45.141])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 (Authenticated sender: sam@ravnborg.org)
 by mail01.mxhotel.dk (Postfix) with ESMTPSA id D4AB9194B00;
 Fri,  2 Jul 2021 07:45:14 +0200 (CEST)
Date: Fri, 2 Jul 2021 07:45:08 +0200
X-Report-Abuse-To: abuse@mxhotel.dk
From: Sam Ravnborg <sam@ravnborg.org>
To: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] drm/dbi: Print errors for mipi_dbi_command()
Message-ID: <YN6n5MzuwDNuJyW8@ravnborg.org>
References: <20210701222518.3895552-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210701222518.3895552-1-linus.walleij@linaro.org>
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
Cc: Thierry Reding <thierry.reding@gmail.com>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Noralf =?iso-8859-1?Q?Tr=F8nnes?= <noralf@tronnes.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi Linus,

On Fri, Jul 02, 2021 at 12:25:18AM +0200, Linus Walleij wrote:
> The macro mipi_dbi_command() does not report errors unless you wrap it
> in another macro to do the error reporting.
> 
> Report a rate-limited error so we know what is going on.
> 
> Drop the only user in DRM using mipi_dbi_command() and actually checking
> the error explicitly, let it use mipi_dbi_command_buf() directly
> instead.
> 
> After this any code wishing to send command arrays can rely on
> mipi_dbi_command() providing an appropriate error message if something
> goes wrong.
> 
> Suggested-by: Noralf Trønnes <noralf@tronnes.org>
> Suggested-by: Douglas Anderson <dianders@chromium.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  drivers/gpu/drm/drm_mipi_dbi.c | 2 +-
>  include/drm/drm_mipi_dbi.h     | 5 ++++-
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
> index 3854fb9798e9..c7c1b75df190 100644
> --- a/drivers/gpu/drm/drm_mipi_dbi.c
> +++ b/drivers/gpu/drm/drm_mipi_dbi.c
> @@ -645,7 +645,7 @@ static int mipi_dbi_poweron_reset_conditional(struct mipi_dbi_dev *dbidev, bool
>  		return 1;
>  
>  	mipi_dbi_hw_reset(dbi);
> -	ret = mipi_dbi_command(dbi, MIPI_DCS_SOFT_RESET);
> +	ret = mipi_dbi_command_buf(dbi, MIPI_DCS_SOFT_RESET, NULL, 0);
>  	if (ret) {
>  		DRM_DEV_ERROR(dev, "Failed to send reset command (%d)\n", ret);
>  		if (dbidev->regulator)
I do not see the value in this change??
There are many other mipi_dbi_command() users and the error return
continues to be checked?!??!


> diff --git a/include/drm/drm_mipi_dbi.h b/include/drm/drm_mipi_dbi.h
> index f543d6e3e822..2057ad32760c 100644
> --- a/include/drm/drm_mipi_dbi.h
> +++ b/include/drm/drm_mipi_dbi.h
> @@ -183,7 +183,10 @@ int mipi_dbi_buf_copy(void *dst, struct drm_framebuffer *fb,
>  #define mipi_dbi_command(dbi, cmd, seq...) \
>  ({ \
>  	const u8 d[] = { seq }; \
> -	mipi_dbi_command_stackbuf(dbi, cmd, d, ARRAY_SIZE(d)); \
> +	int ret; \
> +	ret = mipi_dbi_command_stackbuf(dbi, cmd, d, ARRAY_SIZE(d)); \
> +	if (ret) \
> +		pr_err_ratelimited("MIPI DBI: error %d when sending command\n", ret); \
>  })
Coud this be more informative if the spi device was printed, it is
available? Maybe in 99% of the cases there is only one user anyway so it
will not help?

	Sam
