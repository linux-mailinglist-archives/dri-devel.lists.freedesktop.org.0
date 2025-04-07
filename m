Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A98FDA7E5CF
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 18:13:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 362FC10E46D;
	Mon,  7 Apr 2025 16:13:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="h5mNXUyF";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com
 [209.85.128.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3401C10E46D
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 16:13:49 +0000 (UTC)
Received: by mail-wm1-f47.google.com with SMTP id
 5b1f17b1804b1-43d0782d787so31643115e9.0
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 09:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744042428; x=1744647228;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=hAlufBsPlnjuTWbgusP8CYnzhAGj3Mnwll46JdWGBbE=;
 b=h5mNXUyF5Atoq2vq+RQm4/uD2rkuWxa1Vs3EaxwkC/JuXSmnpKEa8wvaPXFQGVboaw
 4ljtL6IJH265Pc767JamHMiMBUIScpWq9VyxJFlCwRNKXPMfD5Zo8hUo2+gbIIkDwHVD
 i2Da18V0Y41yXQfzu2jY4decIV+f7CCbyumHio/HkH+5i/c1106Idc5scbM2TOLsMVFF
 ghC4m6YtHt9no8lGXEazoBS96nhkb4vrmuu6Fa/p0wBhTqIGwlibrr5tuO+u0rXL2E6W
 Lr0DRCOqygekJrUGt5dsYXLIkoCDgwy7eIjZ/TTi6wwZtMVY1G1v1UbycpkHU53Ycxi+
 qdKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744042428; x=1744647228;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hAlufBsPlnjuTWbgusP8CYnzhAGj3Mnwll46JdWGBbE=;
 b=Uaf6vHi3ecVEFYqKAn5SB2R1u14NZcF0NH19DYfycVKMKR9vYiSJz448HhPxvjqbAR
 IlUMngwDsBOiv+eyeTWBCCeQ64qi8z5XKXpPS7E23iMd5lmXNIllNzCq0g22OdNOu6qi
 qSea7dFqe62OuhN4Z93o5VXGNH0ixRm7zNuB29/XYYAHBHazlzrb+BWzLtT/Ycm+wWeF
 NAVV8ZCr/C8kesT0C2Hgl16t0qp+VCMq9QFIsjsh47h0LnivtmRf8oPboo7vbbjkam8X
 JVpaOVdDDiPrsuxsjR8od1n0VjuTSuiCU5puYF5eSo8n6egGVYZmRvaP7CLAznDfPBy6
 ggeA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXeXtZsbtCS9Vd97DkByP/+4BK7MgqFuIvPVva3hKgkYbo57Drm0veQ72qLTz+Fx8CTA6R6H/h1RLQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVhQN9IdbzFvhclXPTdFm1OTUYwLvGYCmblvc4nO5Pp5fqPJrw
 7gbAHToPCeEWJeIe435DD5OKBkYCT6uU2EcBwZ/CGjn6WOk/3Sjy0uamjGBQYdA=
X-Gm-Gg: ASbGncsZaJ4OsNXvRQxxOB/lqTVrsrcuS83+YOqsaLBHF8C1isStxQ3ctIwDA8Qx6cA
 fi9tcnonRFOfod2rugzqV4lhhc3Ypv6FtD0QKWQ3A7icAJNbPP3U8pAtWcrhnYZk5ld848E09ei
 hYW8gL7reTG6vC6eBIaM7givxzPVWPiEBa5BNycBpyHVQGb9p8gCXVHxzMBBepceYpa6Vm3IiJr
 qU6TNP9ezUj/h/ldX87vuBrtDMfXdTUea45nPt+Ni83xZjUJ0MsgmKPTOzAmhmeLCmWCWubzRau
 z+IjTh9j/EYXZG6YIzgkicochvMU0upKR8AC+UzDsYCH64KEQ4neriEWMOVY61nTdgCjwwOXgsa
 J+JbpBxxBt6xP5bsVWLm58jGRoZQ=
X-Google-Smtp-Source: AGHT+IF9E+Yu68SivmKTZ/2oBu6XpMDyufJhLClsxWUTbSHDLDqi5DwsmXJhaL8CEGG/v/moBPNDvw==
X-Received: by 2002:a05:600c:1d28:b0:43c:fad6:fa5a with SMTP id
 5b1f17b1804b1-43ed0d9ce1dmr107471025e9.24.1744042427942; 
 Mon, 07 Apr 2025 09:13:47 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ec1630ddesm137924675e9.5.2025.04.07.09.13.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 09:13:46 -0700 (PDT)
Date: Mon, 7 Apr 2025 17:13:44 +0100
From: Daniel Thompson <daniel@riscstar.com>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: Jianhua Lu <lujianhua000@gmail.com>, Lee Jones <lee@kernel.org>,
 Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Pavel Machek <pavel@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-fbdev@vger.kernel.org
Subject: Re: [PATCH 3/4] backlight: ktz8866: improve current sinks setting
Message-ID: <Z_P5uLrGiQWez0jv@aspen.lan>
References: <20250407095119.588920-1-mitltlatltl@gmail.com>
 <20250407095119.588920-4-mitltlatltl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407095119.588920-4-mitltlatltl@gmail.com>
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

On Mon, Apr 07, 2025 at 05:51:18PM +0800, Pengyu Luo wrote:
> I polled all registers when the module was loading, found that
> current sinks have already been configured. Bootloader would set
> when booting. So checking it before setting the all channels.

Can you rephrase this so the problem and solution are more clearly
expressed. Perhaps template Ingo suggests here would be good:
https://www.spinics.net/lists/kernel/msg1633438.html


> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  drivers/video/backlight/ktz8866.c | 23 +++++++++++++++++++----
>  1 file changed, 19 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/video/backlight/ktz8866.c b/drivers/video/backlight/ktz8866.c
> index 017ad80dd..b67ca136d 100644
> --- a/drivers/video/backlight/ktz8866.c
> +++ b/drivers/video/backlight/ktz8866.c
> @@ -46,6 +46,8 @@
>  #define LCD_BIAS_EN 0x9F
>  #define PWM_HYST 0x5
>
> +#define CURRENT_SINKS_MASK GENMASK(5, 0)
> +

Call this BL_EN_CURRENT_SINKS_MASK and keep it next to the register it
applies to.


>  struct ktz8866_slave {
>  	struct i2c_client *client;
>  	struct regmap *regmap;
> @@ -112,11 +120,18 @@ static void ktz8866_init(struct ktz8866 *ktz)
>  {
>  	unsigned int val = 0;
>
> -	if (!of_property_read_u32(ktz->client->dev.of_node, "current-num-sinks", &val))
> +	if (!of_property_read_u32(ktz->client->dev.of_node, "current-num-sinks", &val)) {
>  		ktz8866_write(ktz, BL_EN, BIT(val) - 1);
> -	else
> -		/* Enable all 6 current sinks if the number of current sinks isn't specified. */
> -		ktz8866_write(ktz, BL_EN, BIT(6) - 1);
> +	} else {
> +		/*
> +		 * Enable all 6 current sinks if the number of current
> +		 * sinks isn't specified and the bootloader didn't set
> +		 * the value.
> +		 */
> +		ktz8866_read(ktz, BL_EN, &val);
> +		if (!(val && CURRENT_SINKS_MASK))

This is the wrong form of AND.

> +			ktz8866_write(ktz, BL_EN, CURRENT_SINKS_MASK);
> +	}


Daniel.
