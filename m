Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C25B28DFCC
	for <lists+dri-devel@lfdr.de>; Wed, 14 Oct 2020 13:26:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A67806EA56;
	Wed, 14 Oct 2020 11:26:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49E006EA58
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Oct 2020 11:26:48 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id h5so3357760wrv.7
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Oct 2020 04:26:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=W1Xb3EWi6oK1/DaQpKgXiT3NvJEd5yovI30IklakN70=;
 b=GL3cQIAWf+VkmTeQG0gsRX2Df5rOkHjVJgrZqtAvyztHNcswl+uQuyzfuCGZ28KJkL
 YAVgHVyzwVNQnjrp/DnSi4KG5rjbY8W869ipmyC/6FFxwG69MB3cvEUntMDLrJfv61Hw
 IpruzSz+SkXcFjCOe6Xm/pUOha4tQ5ZpAuWK2gC43lYOrlBc4GC9zhTwC5ZV3nWapFoi
 Ieizbagbsy8em+AlXNhlaurWUvIxETXGz7dpGQxQtNVNgUoWpJIgAdli2zVdRjF80fir
 F/XuWKaYccCX4k+QWfqdZatva20JKp+pUz2zjHWuwyq2HrWYNg9h6DhmNy8Le/89diCc
 QHzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=W1Xb3EWi6oK1/DaQpKgXiT3NvJEd5yovI30IklakN70=;
 b=kKYxukKXUPnfPTy6Xt4DKshgYhs9IrCrJJSr5f9CCsRRbs7kkZpZWo3ODZYxA2gpc7
 YY3tysD8KNBEEw7YbnrVcFzk3KQSL09lhagWd7zMqUy7+2JDyKodxyyn97Nd5gClbTla
 4QtOZ+97b2jkzyLP2WxO8GOLWsQlKbyxVEC+efILFI2M2/MrOY+inaGP/GY/35P+eALz
 koA4a6B2hDEi6NxO9FjopywRirN1P2bApb8J2d90b8F/v77S4cOJtnVNmncGxYY/G8Bb
 dr4hH3zyyJnWCPlqfCA7UJ8GzGURO/t2JgAPerP8NCW2m1n7KFkBGhLAycsi06TVknHQ
 A/bA==
X-Gm-Message-State: AOAM533nttPR+HFCwuYS2nJ7nPq70q5CE78pCFu/aL+O1lH30gDJfAhU
 4RzPYOuGmqPlW6UKYOwDaHwbbg==
X-Google-Smtp-Source: ABdhPJxgbrMq6ekWxBaMVjFkqS5MobV4c/7LwKcL+o1Ew8C+9mI/Vc0Clz/IN3aydIhGSZtLH/UCfA==
X-Received: by 2002:adf:ed07:: with SMTP id a7mr5235113wro.326.1602674806848; 
 Wed, 14 Oct 2020 04:26:46 -0700 (PDT)
Received: from holly.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id f7sm4690901wrx.64.2020.10.14.04.26.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Oct 2020 04:26:45 -0700 (PDT)
Date: Wed, 14 Oct 2020 12:26:43 +0100
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Alexandru Stan <amstan@chromium.org>
Subject: Re: [PATCH v2 1/3] backlight: pwm_bl: Fix interpolation
Message-ID: <20201014112643.grd2x5jj33turihb@holly.lan>
References: <20201013080103.410133-1-amstan@chromium.org>
 <20201013010056.v2.1.I4dcea1c90e9da3902d466033aa73351e19e49c49@changeid>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201013010056.v2.1.I4dcea1c90e9da3902d466033aa73351e19e49c49@changeid>
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
Cc: linux-pwm@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Douglas Anderson <dianders@chromium.org>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 Jingoo Han <jingoohan1@gmail.com>, Andy Gross <agross@kernel.org>,
 Rob Herring <robh+dt@kernel.org>, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>, dri-devel@lists.freedesktop.org,
 Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Enric Balletbo i Serra <enric.balletbo@collabora.com>,
 Lee Jones <lee.jones@linaro.org>, Matthias Kaehlcke <mka@chromium.org>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Oct 13, 2020 at 01:01:01AM -0700, Alexandru Stan wrote:
> Whenever num-interpolated-steps was larger than the distance
> between 2 consecutive brightness levels the table would get really
> discontinuous. The slope of the interpolation would stick with
> integers only and if it was 0 the whole line segment would get skipped.
> 
> Example settings:
> 	brightness-levels = <0 1 2 4 8 16 32 64 128 256>;
> 	num-interpolated-steps = <16>;
> 
> The distances between 1 2 4 and 8 would be 1, and only starting with 16
> it would start to interpolate properly.

Both comments a perilously close to nitpicking but enough that I wanted
to reply...

I'd suggest that the current behaviour as having two properties.

1. It was designed to generate strictly increasing tables (no repeated
   values).

2. It's implementation contains quantization errors when calculating the
   step size. This results in both the discards of some interpolated
   steps you mentioned (it is possible to insert extra steps between 4
   and 8 whilst retaining a strictly increasing table). It also
   results in a potentially large undershoot when multiplying a step
   size (64 interpolated steps and a gap of 127 is likely to get a visual
   jump as we hop through 63 physical steps in one go).

#1 can is a policy that can be changed. #2 is a bug that could be fixed.

To be clear I don't object to generating a monotonically increasing
table but I'd prefer the policy change to be explicitly described in
the description.


> Let's change it so there's always interpolation happening, even if
> there's no enough points available (read: values in the table would
> appear more than once). This should match the expected behavior much
> more closely.
> 
> Signed-off-by: Alexandru Stan <amstan@chromium.org>
> ---
> 
>  drivers/video/backlight/pwm_bl.c | 70 ++++++++++++++------------------
>  1 file changed, 31 insertions(+), 39 deletions(-)
> 
> diff --git a/drivers/video/backlight/pwm_bl.c b/drivers/video/backlight/pwm_bl.c
> index dfc760830eb9..3e77f6b73fd9 100644
> --- a/drivers/video/backlight/pwm_bl.c
> +++ b/drivers/video/backlight/pwm_bl.c
> @@ -230,8 +230,7 @@ static int pwm_backlight_parse_dt(struct device *dev,
>  				  struct platform_pwm_backlight_data *data)
>  {
>  	struct device_node *node = dev->of_node;
> -	unsigned int num_levels = 0;
> -	unsigned int levels_count;
> +	unsigned int num_levels;
>  	unsigned int num_steps = 0;
>  	struct property *prop;
>  	unsigned int *table;
> @@ -260,12 +259,11 @@ static int pwm_backlight_parse_dt(struct device *dev,
>  	if (!prop)
>  		return 0;
>  
> -	data->max_brightness = length / sizeof(u32);
> +	num_levels = length / sizeof(u32);
>  
>  	/* read brightness levels from DT property */
> -	if (data->max_brightness > 0) {
> -		size_t size = sizeof(*data->levels) * data->max_brightness;
> -		unsigned int i, j, n = 0;
> +	if (num_levels > 0) {
> +		size_t size = sizeof(*data->levels) * num_levels;
>  
>  		data->levels = devm_kzalloc(dev, size, GFP_KERNEL);
>  		if (!data->levels)
> @@ -273,7 +271,7 @@ static int pwm_backlight_parse_dt(struct device *dev,
>  
>  		ret = of_property_read_u32_array(node, "brightness-levels",
>  						 data->levels,
> -						 data->max_brightness);
> +						 num_levels);
>  		if (ret < 0)
>  			return ret;
>  
> @@ -298,7 +296,13 @@ static int pwm_backlight_parse_dt(struct device *dev,
>  		 * between two points.
>  		 */
>  		if (num_steps) {
> -			if (data->max_brightness < 2) {
> +			unsigned int num_input_levels = num_levels;
> +			unsigned int i;
> +			u32 x1, x2, x, dx;
> +			u32 y1, y2;
> +			s64 dy;
> +
> +			if (num_input_levels < 2) {
>  				dev_err(dev, "can't interpolate\n");
>  				return -EINVAL;
>  			}
> @@ -308,14 +312,7 @@ static int pwm_backlight_parse_dt(struct device *dev,
>  			 * taking in consideration the number of interpolated
>  			 * steps between two levels.
>  			 */
> -			for (i = 0; i < data->max_brightness - 1; i++) {
> -				if ((data->levels[i + 1] - data->levels[i]) /
> -				   num_steps)
> -					num_levels += num_steps;
> -				else
> -					num_levels++;
> -			}
> -			num_levels++;
> +			num_levels = (num_input_levels - 1) * num_steps + 1;
>  			dev_dbg(dev, "new number of brightness levels: %d\n",
>  				num_levels);
>  
> @@ -327,24 +324,25 @@ static int pwm_backlight_parse_dt(struct device *dev,
>  			table = devm_kzalloc(dev, size, GFP_KERNEL);
>  			if (!table)
>  				return -ENOMEM;
> -
> -			/* Fill the interpolated table. */
> -			levels_count = 0;
> -			for (i = 0; i < data->max_brightness - 1; i++) {
> -				value = data->levels[i];
> -				n = (data->levels[i + 1] - value) / num_steps;
> -				if (n > 0) {
> -					for (j = 0; j < num_steps; j++) {
> -						table[levels_count] = value;
> -						value += n;
> -						levels_count++;
> -					}
> -				} else {
> -					table[levels_count] = data->levels[i];
> -					levels_count++;
> +			/*
> +			 * Fill the interpolated table[x] = y
> +			 * by draw lines between each (x1, y1) to (x2, y2).
> +			 */
> +			dx = num_steps;
> +			for (i = 0; i < num_input_levels - 1; i++) {
> +				x1 = i * dx;
> +				x2 = x1 + dx;
> +				y1 = data->levels[i];
> +				y2 = data->levels[i + 1];
> +				dy = (s64)y2 - y1;
> +
> +				for (x = x1; x < x2; x++) {
> +					table[x] = y1 +
> +						div_s64(dy * ((s64)x - x1), dx);

I don't think it is possible for x - x1 to be negative (e.g. what is the
s64 for). Obviously it makes little functional difference whether the
cast is there or not but I don't like fixed point code that has been
written with "just in case" casts.


Daniel.


>  				}
>  			}
> -			table[levels_count] = data->levels[i];
> +			/* Fill in the last point, since no line starts here. */
> +			table[x2] = y2;
>  
>  			/*
>  			 * As we use interpolation lets remove current
> @@ -353,15 +351,9 @@ static int pwm_backlight_parse_dt(struct device *dev,
>  			 */
>  			devm_kfree(dev, data->levels);
>  			data->levels = table;
> -
> -			/*
> -			 * Reassign max_brightness value to the new total number
> -			 * of brightness levels.
> -			 */
> -			data->max_brightness = num_levels;
>  		}
>  
> -		data->max_brightness--;
> +		data->max_brightness = num_levels - 1;
>  	}
>  
>  	return 0;
> -- 
> 2.28.0
> 
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
