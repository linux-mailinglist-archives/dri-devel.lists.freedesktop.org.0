Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 034D7CF2DD6
	for <lists+dri-devel@lfdr.de>; Mon, 05 Jan 2026 10:55:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4208B10E00C;
	Mon,  5 Jan 2026 09:55:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="NPsm3u20";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com
 [209.85.128.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23DEB10E00C
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Jan 2026 09:55:05 +0000 (UTC)
Received: by mail-wm1-f48.google.com with SMTP id
 5b1f17b1804b1-47775fb6c56so109975835e9.1
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Jan 2026 01:55:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1767606903; x=1768211703;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8EEV3Yajgow2Le02Xox/uVz7KgADcHkRJO8r3JoHZTc=;
 b=NPsm3u20+k54rf5JnNTds3RdRjBetHG3/GJe1WNAnSCC/fphTvc1xDtH20NVuOKZ6e
 bWGmn/CuP8YO2jZWxT/JiGa/3DIyydBMn+oEg7nPfsvfSdwdMR3qWlcKeLNLGkHeGFY0
 QHLUa/X8tu0UNNIjDoZeh22mnPVR+YoEcnog5pQAg4Y+sNIca/q6b/RBsAqMybwruLs6
 lEPZEgm07NX+D3nCURenI5ssZSp6aqAmDIgVzN9/jHtpdWQCbolObMC4AU+LgRQTC2KE
 vDhLiib8HAOmz1sUkIVLhb9Jjm9MwX9d6MluLPHAGM9iuhE3UPdviAzI2ra6dRtFv4A+
 RQqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767606903; x=1768211703;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8EEV3Yajgow2Le02Xox/uVz7KgADcHkRJO8r3JoHZTc=;
 b=DWGBNFOcHjEUS9hYEwsDYJ22FH3C3PXDHkjXfGf5qlVtTQEqkLzZfGFe6/ogQ7iQDN
 KBORbuyPgfJeSzCxB+1gtEh5XD357TV0oz/qviVwIBTYmjXfct1D4/k/K9cjWgcgO8lQ
 LDzm4Pn+tXVAGe0XInFvIIeDSdWEnk8SU99Dz6e+GSKFFwImyujCoblP46DnrkiI/dQE
 4M5jNOgvATuJnCoADZ8LaLc7B0a5sAjS4uU0Nwst7FJNKsn0TpGxFYrioto3onydGOG6
 f9R7y4uJ7tUeqa2/uR9ckoWtEvlKi64W08dvVithR6/xg1qvEc+LywwIvfsUKZvlg142
 yVSg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVpWmNBjVhmPTGlirk8TpqeCEcvrD06vg/d5BguS8Rzu6esDRXCaJE6DjbELdZcPtyOauq2k8oFOgQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwCgAHszKQ7pOngYN6Ygbiew3IA581hp5hUmXG3+Epo1ZMbUaov
 rf8cSotBLcrggls5HeqNTMwlj7gTB98QreORRNDrZvOZbEGso3VX5vGDrL5/wUrsF1Y=
X-Gm-Gg: AY/fxX6cb39TMUmdLy8TKg7G7867loEDuPa7z4WLO0h24J6T56rphnCaEx7Bdb2aMMk
 YMEqBEAfnxfszq6uuJalRd+5IBJetKDN3oNnazUeesvexbTcToii2MQzXz2OHmM2C8W/ue/eLCd
 MRFStLvkbSMpF2wndaFdQdZ+P9Qq8scgx0Dbe8dHk1uzRAW+x8BRquntYaAMUh2NPKXJiwvUrUZ
 B1vB3ZaS5JtPZOtxbTEoOlQaRH0ldvYzflHhmG73CTF8UHcflyiMBY7yi/jrYNYsLBkl6AjApk3
 hE58+WaPAh2ywfkQ3xTTNA5AmtaXxb7ZBiTEgXy2InNr/ihn2/d1vlpKyniGDlLfhzg1znXNd2L
 eq6LjZK8u4DrorfCsrrOfDHDH308/ui9HKE2/2RZ3p/SFH7oxSpTflP+oNfMe5JyAa6C46Q4FpV
 txopV4jtNqpRzCR/RyvrHi3VOOt4PyBdrY2SCOlbcYv5is/KEcJrQ2BR1R1hYc41hDOwZAKQ8+q
 aNh3+bb6AQ7z7wk3/LzMA74pNmhPCv82naFQI8AR4rnBLPuuH5qyeSdenJdkkKCb05RpnTR
X-Google-Smtp-Source: AGHT+IEDntn78ZAZ+9BLk0OP0TDSrFfpGHytu7a8eXwL+wuSz/sJ8bMiyLl9n++coQm1Y605Eud1ag==
X-Received: by 2002:a05:600c:4446:b0:475:e007:bae0 with SMTP id
 5b1f17b1804b1-47d1956f896mr636890455e9.16.1767606903267; 
 Mon, 05 Jan 2026 01:55:03 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47d6be5e2eesm55247805e9.5.2026.01.05.01.55.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jan 2026 01:55:02 -0800 (PST)
Date: Mon, 5 Jan 2026 09:55:00 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: Sudarshan Shetty <tessolveupstream@gmail.com>
Cc: lee@kernel.org, danielt@kernel.org, jingoohan1@gmail.com, deller@gmx.de,
 pavel@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-leds@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: backlight: gpio-backlight: allow
 multiple GPIOs
Message-ID: <aVuKdAyXfWLs-WJI@aspen.lan>
References: <20260105085120.230862-1-tessolveupstream@gmail.com>
 <20260105085120.230862-2-tessolveupstream@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260105085120.230862-2-tessolveupstream@gmail.com>
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

On Mon, Jan 05, 2026 at 02:21:19PM +0530, Sudarshan Shetty wrote:
> Update the gpio-backlight binding to support configurations that require
> more than one GPIO for enabling/disabling the backlight.
>
> Signed-off-by: Sudarshan Shetty <tessolveupstream@gmail.com>
> ---
>  .../bindings/leds/backlight/gpio-backlight.yaml      | 12 +++++++++++-
>  1 file changed, 11 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
> index 584030b6b0b9..1483ce4a3480 100644
> --- a/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
> +++ b/Documentation/devicetree/bindings/leds/backlight/gpio-backlight.yaml
> @@ -17,7 +17,8 @@ properties:
>
>    gpios:
>      description: The gpio that is used for enabling/disabling the backlight.
> -    maxItems: 1
> +    minItems: 1
> +    maxItems: 2

Why 2?


Daniel.
