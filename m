Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1ED4084A196
	for <lists+dri-devel@lfdr.de>; Mon,  5 Feb 2024 18:58:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F001910FB4F;
	Mon,  5 Feb 2024 17:58:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RH9+laJg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF1B210FB4F
 for <dri-devel@lists.freedesktop.org>; Mon,  5 Feb 2024 17:57:59 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-51142b5b76dso3354385e87.2
 for <dri-devel@lists.freedesktop.org>; Mon, 05 Feb 2024 09:57:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707155878; x=1707760678; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i34tZ3FFPbhGf8aLiNBH7cN2Fd7/KOwTUUwg6OHr+K8=;
 b=RH9+laJgKU9RSfAB5iFWKZUrXT3ZZjWyzLx4a7NR5sUaN+rcHsu88xll2BsyVVpxUh
 qGlHZ0/SiIBzaO2iJwuGzcDTkz4oOPkQd9cAswp66hZGb3L66vV8w515FAIWdJooje2V
 ZYW8UtlFZr0x+umhHFsGoWOIOz9BYyYvGqn6hP9tLy/QC0dYGoq4kj9Xw4qsYrF8yeoG
 0qLaZuYk7DkhsA3PoR32ayUKcjCd2dJsx7gPsDDGxjw5Hbq5ndgeuGZxfoga+JdiHs/P
 Kk6auQiUIWCbJN1+C5moM/f/+cm3cb5mOwInMJKRZ+0jVfCD1Yq078lv1xjcSh1Ly/+i
 Vp+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707155878; x=1707760678;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i34tZ3FFPbhGf8aLiNBH7cN2Fd7/KOwTUUwg6OHr+K8=;
 b=Ux34yCSd98KYoUgMQvGqwmnt1mN6v3WSS5qIJbyHbeYHUQkpW/Q1B6FDNinxPlGczt
 r9hzTahhy0jLF98xD2Fa+ewNHkFh7aMzLP7AJl3YhEZLGpoQQJSyOLyiWmj1CJiIEB7J
 2gDddXFMcCA1PR1YCGh/p4BB6KZzHuhQ1cAebPPj944Be3eHt4qu1EQhhfyZGaAJOOuZ
 EngBG0fG8P9cL9PWWC9e8JLe8JvOF759eUXVEGQxBOk6H7m9LyQjCvXN7E6MOadKY0i9
 G7jKx9DZIfYJnfe//u9eaELDiR2+l+yCuWfgrvKRyaZ8GXqLkiPeCeSXRCgC64HSt2Cu
 a5ew==
X-Gm-Message-State: AOJu0Ywp3OrwTuvfbnVLas0C6UAH8Jyhus3eDE6AHa8UnJWo6pieWkS0
 FfBmkaOu3/rbUuOQfLYZ6fdI7hWDtFdmeFtt8eWK0m3WIeM4iuAB
X-Google-Smtp-Source: AGHT+IGoPOkUhCufoS6lCIs5EGArZvJVv922FEUcsxMUGIhQXY+AjR81U8jTSaoj3gJj/4rMS1O5tw==
X-Received: by 2002:a19:6451:0:b0:511:49d9:fedf with SMTP id
 b17-20020a196451000000b0051149d9fedfmr251422lfj.13.1707155877476; 
 Mon, 05 Feb 2024 09:57:57 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCXGCK7tf1Ptyz6HmhmmygivSkZttogyHu1TyMDdDQ5Nu8eevB8TjC9ST/lb4I2sK2ORVanShf4tAR8h+88kfXIXB7IedBlO6CdVJTs9VbezYULqUYzMQt5n4PD4A7MsN3Fa6KsCPQMzz9tMOhlKZaFekVgW2wlECNYyCRFLwrInpCrUXkvaHKm4LFzTyVyCbG0d2ApzCkMTk6XK7sYwpllH0iRhxhGVmDxPcrozhyj+VvHLb2WyR1qXuMV+bGFM6firFlILkD9zesHbMrG/b0/FeqSifxG/2UYuX3eqPZyNyY90Z5srLZC9V0BD458p2oUE4snRo9BRj2qVKksVB0/R/+RqIxOaDUlxURN2rmXd4OQFyYsWU2ZL0/bYZjT0GUf9Kk0oJ9UPSfP7o95qiTDOACza5f7mc0cJ0ebko6KKCNkUXGzptbKQ+T92kFH6XPZVVPoUAUj99fRlwAkflkqraPD5kuIcOfX32YJ+mkpFeFoY2DreE6/cfq5hRo/vnZoL8kKsOsixux4ip8p8YeK5cf8afv/p1dRllJ6p9KDBLNdamy7kdAXdrCzXlbZt8dGcPhVkMhh4mBoKnuBkRpw0jX+zV7GRhwtJ53lU9VEle4navhVDjF5Y/rtrNu9e0D9YDMKCccO0bBinK68q2A2Wjw/1070BcyyM2pxBRuh3FTqYMQLcao7vo/yCuCzj9aphfjcEi531FnGXoEdnC0ecyojAG7cIn86l1Jfb3K1Z+eHwE2U10AT7QPWlZHFxrhV90LswemmmJg==
Received: from jernej-laptop.localnet (82-149-13-182.dynamic.telemach.net.
 [82.149.13.182]) by smtp.gmail.com with ESMTPSA id
 o13-20020a05600c4fcd00b0040fccf7e8easm9068610wmq.36.2024.02.05.09.57.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Feb 2024 09:57:57 -0800 (PST)
From: Jernej =?utf-8?B?xaBrcmFiZWM=?= <jernej.skrabec@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
 Samuel Holland <samuel@sholland.org>,
 Guido =?ISO-8859-1?Q?G=FCnther?= <agx@sigxcpu.org>,
 Purism Kernel Team <kernel@puri.sm>, Ondrej Jirman <megi@xff.cz>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Frank Oltmanns <frank@oltmanns.dev>
Cc: linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 Frank Oltmanns <frank@oltmanns.dev>
Subject: Re: [PATCH v2 4/6] clk: sunxi-ng: a64: Set minimum and maximum rate
 for PLL-MIPI
Date: Mon, 05 Feb 2024 18:57:55 +0100
Message-ID: <1877423.tdWV9SEqCh@jernej-laptop>
In-Reply-To: <20240205-pinephone-pll-fixes-v2-4-96a46a2d8c9b@oltmanns.dev>
References: <20240205-pinephone-pll-fixes-v2-0-96a46a2d8c9b@oltmanns.dev>
 <20240205-pinephone-pll-fixes-v2-4-96a46a2d8c9b@oltmanns.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
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

Dne ponedeljek, 05. februar 2024 ob 16:22:27 CET je Frank Oltmanns napisal(a):
> Set the minimum and maximum rate of Allwinner A64's PLL-MIPI according
> to the Allwinner User Manual.
> 
> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej



