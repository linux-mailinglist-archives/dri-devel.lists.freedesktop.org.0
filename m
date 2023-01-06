Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 846EB6605E1
	for <lists+dri-devel@lfdr.de>; Fri,  6 Jan 2023 18:47:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F344B10E0C2;
	Fri,  6 Jan 2023 17:47:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailrelay6-1.pub.mailoutpod2-cph3.one.com
 (mailrelay6-1.pub.mailoutpod2-cph3.one.com [IPv6:2a02:2350:5:405::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D89010E0C2
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Jan 2023 17:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ravnborg.org; s=rsa2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=3ZkqwT//XG7BkpEaYP0t4/kQtbvC2cyH6nezkShj9GI=;
 b=CruGeZf3paWALutax0NxS9pNV1Lqs5S/DiNm+fMDSUuipD67l5jEADRaEHFPmzczMfTBfeE92VSTt
 X8eWLfcALcVDyhkyf68AhUj/hEG2mv5eGI0GKDWeZqkOsZmiGonwHr6u+8qrhDzmAXsQSB07FD1gx2
 YXvaIPdfFdcGJiKhEKONe0J3MNBaqaoOayBLvM3aOzL5BC9GXjxNseNvsNQPTc5dKWVcfDV29ZCdhH
 JIh/FRP4CGczAIaTHHTLcHXsIntRzgZDT5bUMM0Rjn436EpxjUEI+SCDxV8lco24XpkKHwXh47vyBD
 GB3vE0Z2ePsxuNK4djOwjvpRjD68uvA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
 d=ravnborg.org; s=ed2;
 h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
 from:date:from;
 bh=3ZkqwT//XG7BkpEaYP0t4/kQtbvC2cyH6nezkShj9GI=;
 b=nT+VcIthoxhA8MnyKlBmjy04KeOPZMlHZv6M0+Vn/Scdjhuz3MDsqEzh6fZvTAmwNqGWCA8VWyn5o
 +FqYDFPBw==
X-HalOne-ID: 2298574e-8dea-11ed-af8f-cde5ad41a1dd
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
 by mailrelay6 (Halon) with ESMTPSA
 id 2298574e-8dea-11ed-af8f-cde5ad41a1dd;
 Fri, 06 Jan 2023 17:47:09 +0000 (UTC)
Date: Fri, 6 Jan 2023 18:47:07 +0100
From: Sam Ravnborg <sam@ravnborg.org>
To: Stephen Kitt <steve@sk2.org>
Subject: Re: [PATCH RESEND 4/4] backlight: tosa: Use backlight helper
Message-ID: <Y7hem+T16FixeT0q@ravnborg.org>
References: <20230106164856.1453819-5-steve@sk2.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230106164856.1453819-5-steve@sk2.org>
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Lee Jones <lee@kernel.org>, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jan 06, 2023 at 05:48:55PM +0100, Stephen Kitt wrote:
> Instead of retrieving the backlight brightness in struct
> backlight_properties manually, and then checking whether the backlight
> should be on at all, use backlight_get_brightness() which does all
> this and insulates this from future changes.
> 
> Signed-off-by: Stephen Kitt <steve@sk2.org>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>
> ---
>  drivers/video/backlight/tosa_bl.c | 7 +------
>  1 file changed, 1 insertion(+), 6 deletions(-)
> 
> diff --git a/drivers/video/backlight/tosa_bl.c b/drivers/video/backlight/tosa_bl.c
> index 77b71f6c19b5..e338b1f00f6a 100644
> --- a/drivers/video/backlight/tosa_bl.c
> +++ b/drivers/video/backlight/tosa_bl.c
> @@ -50,13 +50,8 @@ static void tosa_bl_set_backlight(struct tosa_bl_data *data, int brightness)
>  
>  static int tosa_bl_update_status(struct backlight_device *dev)
>  {
> -	struct backlight_properties *props = &dev->props;
>  	struct tosa_bl_data *data = bl_get_data(dev);
> -	int power = max(props->power, props->fb_blank);
> -	int brightness = props->brightness;
> -
> -	if (power)
> -		brightness = 0;
> +	int brightness = backlight_get_brightness(dev);
>  
>  	tosa_bl_set_backlight(data, brightness);
>  
> -- 
> 2.30.2
