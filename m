Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 903FEA7E610
	for <lists+dri-devel@lfdr.de>; Mon,  7 Apr 2025 18:19:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C5E710E4C5;
	Mon,  7 Apr 2025 16:19:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="AcN3isyY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com
 [209.85.221.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 061F710E4C5
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Apr 2025 16:19:01 +0000 (UTC)
Received: by mail-wr1-f44.google.com with SMTP id
 ffacd0b85a97d-391342fc0b5so3605036f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Apr 2025 09:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744042739; x=1744647539;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=FlvRbUOqYjIG9Hb+k1k+g6fdWn9FeWH5VnocqRc/bEs=;
 b=AcN3isyYfOqajSRfmFIG70OSs61FPs/U1Nl7ps51Uf9Aw194DPAuoYbePpYTykIC/b
 xN2jMvMPoQpGWHQ0VywmqPmXSCfWS4lqBZ2fsCJqBm8/ZZEq3Z+prjNhDLpIJGd9Pg/f
 ECFvSkBZ8X5/N/S+NFGxFWqsq7EgLNzVuzlTZ2ZCRrQcnm1r33BdRDoMPrTzv8pdc3id
 WZPafIeheqP6CC860fNUlWPM6CrRbgea7D7+HwbGA6kH2vzIY1auqodWUNiIHbmDxBEg
 HWkj0qwfYk94QsK4xr3fn4eZDs1qb+lFCuqBZQKnyUsq39ICZ8XGF5NMXTs7NQH0Wzxx
 JAOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744042739; x=1744647539;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FlvRbUOqYjIG9Hb+k1k+g6fdWn9FeWH5VnocqRc/bEs=;
 b=FFk82X1PlY6ktQaGSuXcSaO2ey7Fn1QsrmNYjq6gKirZcDYI5v886A43xXmJx5ecnB
 Zvq8mefkBxGp/QgNO+9KIri2VH372S4GltcKb62IIi/ETFk6b0+LuV07w9kX+swwsMLE
 aGYVaDCEkTQP+CYYyMiXv0+GCNSreM8Nr3niZmBPBruPjcEsr80YdZhC2Dn00btGT29O
 rBaS2mXeU55qQ48EwxXT9J+jub6F6OZxOqPWzToW82IrI45CAk+lDLgMDbqFDi5jixzt
 4U+1YF7uppysgZ4UsEH5ZW5psOXeVLZUFnKj4ewbiV+1C07WnK+/Rz98kh7hSgCWdv1w
 eKhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0ONyTeAsCrRXAeFmbzKcqQUH1kXDR/c7MfIOx5fz3NnbgG5QKyUxyV3fE+2d9A2qaVDEsP/LfaTY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzPSpbcezF7fFaV2JQod4MWyMgL1MSO9YOGN7vVeSVWlBSwyDcn
 x7oCChI8sW8JK4FTpU6cHHsPjTw03JcDpT7/OoaYyVIgxH6HTSvYCoimaFuklts=
X-Gm-Gg: ASbGnctSFPlq483fENCekROm6dbZUNBvS/3QmoXTA20GfVxUh5vPv21iJJyS4vKuesd
 RfI/TGzWnP9rDcDx5RMhDRcwz9g8JMjXaKIdBB/ZaPVnooH3I4Lv/s8PzTAx1dL/NZCB3zLcjH/
 kGKoIylTYxKmhHBC718WpdZGAVaMcF0o2rxnBpo2kiiG/LJgZX+bIQZVsOAU7WNLpHVI3X0gFRf
 S/Z1PbL6tqIZU0LfAm8mnJm1m6pROXEllpRe6qLUKuOw1VUnXJ83mDIO0mAd8M3wdF9uT7EVyqm
 W8Nt8d4ivIlyDQqcsXSCiNp5mgdQhhNjCQcXfmYXWiIQAVMM45Xn0/I0BuH7HJyVGuKjG/DJgT4
 lcw+YPqvK6elkCoI4wnYCBb0AMWyNNQouI3vfLA==
X-Google-Smtp-Source: AGHT+IGAiFgCHKC4NxdMI0XYxiblAlo6teR2sZ4ryX4FXGKNTm7nHjhUAQ7KJxNf9HDeA8CDyhXndw==
X-Received: by 2002:a05:6000:2285:b0:391:3049:d58d with SMTP id
 ffacd0b85a97d-39cadc85ab6mr11452084f8f.0.1744042739225; 
 Mon, 07 Apr 2025 09:18:59 -0700 (PDT)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39c30226da7sm12857720f8f.98.2025.04.07.09.18.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Apr 2025 09:18:58 -0700 (PDT)
Date: Mon, 7 Apr 2025 17:18:56 +0100
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
Subject: Re: [PATCH 4/4] backlight: ktz8866: add definitions to make it more
 readable
Message-ID: <Z_P68OP1c8XcbXle@aspen.lan>
References: <20250407095119.588920-1-mitltlatltl@gmail.com>
 <20250407095119.588920-5-mitltlatltl@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250407095119.588920-5-mitltlatltl@gmail.com>
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

On Mon, Apr 07, 2025 at 05:51:19PM +0800, Pengyu Luo wrote:
> LSB, MSB and their handling are slightly confused, so improve it.
>
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  drivers/video/backlight/ktz8866.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/video/backlight/ktz8866.c b/drivers/video/backlight/ktz8866.c
> index b67ca136d..5364ecfc0 100644
> --- a/drivers/video/backlight/ktz8866.c
> +++ b/drivers/video/backlight/ktz8866.c
> @@ -24,7 +24,9 @@
>  #define DEVICE_ID 0x01
>  #define BL_CFG1 0x02
>  #define BL_CFG2 0x03
> +/* least significant byte */
>  #define BL_BRT_LSB 0x04
> +/* most significant byte */

I'm not convinced these comments are necessary.


>  #define BL_BRT_MSB 0x05
>  #define BL_EN 0x08
>  #define LCD_BIAS_CFG1 0x09
> @@ -47,6 +49,8 @@
>  #define PWM_HYST 0x5
>
>  #define CURRENT_SINKS_MASK GENMASK(5, 0)
> +#define LOWER_BYTE GENMASK(2, 0)

I like using masks and FIELD_GET() but this is not a byte. These are
the least significant bits.


Daniel.
