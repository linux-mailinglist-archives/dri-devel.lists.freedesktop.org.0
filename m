Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3935A352FC
	for <lists+dri-devel@lfdr.de>; Fri, 14 Feb 2025 01:34:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EE4910EBCA;
	Fri, 14 Feb 2025 00:34:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="v7uWzTaT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFA0110E131
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 21:32:45 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-4396740abe9so886895e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Feb 2025 13:32:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1739482364; x=1740087164;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=E9Cksr5sI5tujPp8b/uuWc+Q85liEnv8iPKnjQVPTio=;
 b=v7uWzTaTh8L5Ph29WWKIO0gElFVSgk77ECEf8+1rjRPtAwsR3lgDwyZwjG6WjDDHlW
 KP9UAlZgNMfNGr6s2x88Z14sw/5beDqAazekdgWdaZV89utbHLn0JukV1xP0fSVY0kmC
 IAKuD/Gk6+diHGpZAorqWkLaYAnushgvTClbivk1WQRPiX4U8qgiLpWPfKl5GzO0gT3N
 XJuzafyD9sSHB0heApd+vbftbst6wDag8+rDO3SSyMFbzobE8Tu+qsadvIvQsePCDk5r
 WHRfQdfudvpFOrtv2Ot0OX+kPbDXEv7cQvpe1Dpa5MoUigtIGvsyW8Cr6+ARBGlxP1eD
 iPcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739482364; x=1740087164;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E9Cksr5sI5tujPp8b/uuWc+Q85liEnv8iPKnjQVPTio=;
 b=D1yZTsnN9u16XVqwoN2ETuGdTozpi8n1AS4H+iegehftDxUwH2REPmmBp3On/dhw5w
 c8tI39HJM7tKZgPOiv/IYKXQWazYT97P0pqW5xDlot23d7whnSfEUesvjeXd5b66LrfD
 4Zqd79P+doJaq6kdwialnJsdJSRx2qEhfBoi2BfXoK7OKArMh8ATIjqo4LoZxJYyxmc5
 8sO5tAYeop3ps23XFjiJunUB0bvdI2xVVd57m/e49ytMwHXZ76n7v61m8ePPLbNVHzK5
 0vTlooRTJ3EjPcHbcUQ0bDZ21ZJfTfDK78Erh2wPodf2bgdlZw7N9IGw4xOyrQTGKOdv
 Z6/w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUla6Zy/bWY63Ss2siu2ccC9XrEXOZvjJ+dN6uCdcm1Ualdqu2MrWQRt71YrysSINg6T7qLgMVFvzA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyMVHiV22Ue1yj/cyAC55RDZ//OxL8/xtVcJUcugxG1FveupPdQ
 jBl7LQ6p5tPPB0HUzqbgas6PFR8ZVob1lqv8K16WgIOchXBx7Px9g6xT8xfHC80=
X-Gm-Gg: ASbGnct+E/vP7X1HndxBO2zxrH4JM2CCJ8yINkQ/LY6L+D4iu+XramhhdPf9fYQ/ewH
 qb3qq7J1cHGafdEYmMhza3x+ndnYxqCTEcKsecczWepjrWLf+2YXBvBqlZsp4v++/7TTLsWsidw
 corPrs0MmcxM/hi1plEPJP96ABAFmmtIMJBxTpypLKnBEuwynARi0SAHAU/0MAkJQYqMyICj2m4
 Ih4XYbEZIwcrBz52zn62mb7KL8M9ygxps7/XMmHkCyqq55QAZb4Y5cE7F7xz4Lu+X/bvh6nIEe6
 iQudHiDdWBsv+lxBQkS6uQGsJljYxu8RnD6QhDUvYDRxzg6wkKUQ4bDo777/zW0bBCmz4VGEEA=
 =
X-Google-Smtp-Source: AGHT+IHeCTtwq1iNXSF1fUZIaS/4CGI5trwsdX8zzJ/YF5He2ktcc89iauHD10dC77CQia9erjfZIA==
X-Received: by 2002:a05:600c:46cc:b0:439:31e0:d9a2 with SMTP id
 5b1f17b1804b1-43960169738mr60413745e9.3.1739482364316; 
 Thu, 13 Feb 2025 13:32:44 -0800 (PST)
Received: from aspen.lan
 (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4395a1aa7d2sm59583405e9.25.2025.02.13.13.32.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Feb 2025 13:32:43 -0800 (PST)
Date: Thu, 13 Feb 2025 21:32:41 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Cameron <jic23@kernel.org>,
 Lars-Peter Clausen <lars@metafoo.de>, Pavel Machek <pavel@ucw.cz>,
 Daniel Thompson <danielt@kernel.org>,
 Jingoo Han <jingoohan1@gmail.com>, Helge Deller <deller@gmx.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org, linux-leds@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v1 1/2] dt-bindings: mfd: Document TI LM3533 MFD
Message-ID: <Z65k-fi78DnKVN1K@aspen.lan>
References: <20250212075845.11338-1-clamor95@gmail.com>
 <20250212075845.11338-2-clamor95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250212075845.11338-2-clamor95@gmail.com>
X-Mailman-Approved-At: Fri, 14 Feb 2025 00:33:52 +0000
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

On Wed, Feb 12, 2025 at 09:58:41AM +0200, Svyatoslav Ryhel wrote:
> Add bindings for the LM3533 - a complete power source for
> backlight, keypad, and indicator LEDs in smartphone handsets.
> The high-voltage inductive boost converter provides the
> power for two series LED strings display backlight and keypad
> functions.
>
> Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
> ---
>  .../devicetree/bindings/mfd/ti,lm3533.yaml    | 221 ++++++++++++++++++
>  include/dt-bindings/mfd/lm3533.h              |  19 ++
>  2 files changed, 240 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/ti,lm3533.yaml
>  create mode 100644 include/dt-bindings/mfd/lm3533.h
>
> diff --git a/Documentation/devicetree/bindings/mfd/ti,lm3533.yaml b/Documentation/devicetree/bindings/mfd/ti,lm3533.yaml
> new file mode 100644
> index 000000000000..d0307e5894f8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/ti,lm3533.yaml
> @@ -0,0 +1,221 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/mfd/ti,lm3533.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TI LM3533 Complete Lighting Power Solution
> +
> +description: |
> +  The LM3533 is a complete power source for backlight,
> +  keypad, and indicator LEDs in smartphone handsets. The
> +  high-voltage inductive boost converter provides the
> +  power for two series LED strings display backlight and
> +  keypad functions.
> +  https://www.ti.com/product/LM3533
> +
> +maintainers:
> +  - Johan Hovold <jhovold@gmail.com>

This looks like it has been copied from the lm3533 driver. Did Johan
agree to this?


Daniel.
