Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 904E587AF36
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 19:19:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9046010F577;
	Wed, 13 Mar 2024 18:19:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RLY1BytD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2C2010F43B
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 18:19:39 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-413e93b0f54so994475e9.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 11:19:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710353978; x=1710958778; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SwM77+n02Bo5Xptc9aWDNDUBbm1WtjmR5t0ZnrE2toM=;
 b=RLY1BytDTa5AqD1wKOMmdbmEq8QK7OjBTUvva3XxcitBX7e/bU8Uw6Be2ZntEXHFjz
 AZYAY2MLiTHhQTrWOIrIJ5bpVP30/WfGV6Um8bnoAIrDHObrCqDeMBjj6NeP4yKHdRxF
 BCPo067bVCErvD8OUyNnAWFwbI8m+7sVStiCMroFNBH0s15JyovrHvvrdRlP4V9HWFlu
 2xhq/RjZfCfhOuYBPxkcEQykXviAx6PT2XUQ6HaYuz27dxSq9PzYILCTiB9V5l8/rHJy
 743WE/JoYV7EtpBB7tDbc+930wV99GzCkvKs+r3DYoqXTFeAnx4yh46EJwDytEdebDoV
 NfBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710353978; x=1710958778;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SwM77+n02Bo5Xptc9aWDNDUBbm1WtjmR5t0ZnrE2toM=;
 b=ll5vo3tR1QtraGyqPZsF5CXq9FT0QTDpOgC98WKLwlXSDYVNi5HEC7H1rptWYj786f
 qvgXNibXudyVzfAhj8a6O3cYsxh2q87M/qAe0NuMSscs4usYgOk6jPeF65smah2GSfqn
 6ktT6hmWzqqDSfvBdD/60vIL6aiT0nbndVKZn59luvHeN3RA+x64IVtVmfU2fO9vDJEb
 8k5efBx8PFeVmyBtIDDmjyGyFOHNNJPL8YoLHNJ4KdklBzyg4k45C3aLjqYJRgyoFqYe
 uVFjZKtgSHT1RMx4+ZGwW0EjETpvDvN95cL9oslRsOnaBxRQxO5Lau9+CdWM1WoBp7xT
 i4CA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXF0xyLtDp/3XjONAm6DveQKM7pnnM+BV5RVWijdz0Tkjkbg/mfI1SlAJnGQgImv/m6nbuyvNnfG2yaoDCSdJZkSG/TcA6oJGNYZjC3pxGp
X-Gm-Message-State: AOJu0YwcOu/8oqw8SPY64sKwFr3fQx9WwwRaWr3ay704IZayZOI229Tg
 d+kXRbBqrRvtLPf6eGq/k8bxuBOskVXxj+TMkbsoiOrXLrS3pUgb
X-Google-Smtp-Source: AGHT+IFlvx5P3FvCMw0RLTEExCoJ3AlezUzg/TACD26EKiNO9ZAOgIth5qkO0ze33vBplTbp7wq6XQ==
X-Received: by 2002:a05:600c:45c8:b0:413:3890:25f4 with SMTP id
 s8-20020a05600c45c800b00413389025f4mr539775wmo.36.1710353977808; 
 Wed, 13 Mar 2024 11:19:37 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net.
 [86.58.6.171]) by smtp.gmail.com with ESMTPSA id
 q6-20020a05600c46c600b004132aa2f857sm3034508wmo.17.2024.03.13.11.19.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 11:19:37 -0700 (PDT)
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
 Frank Oltmanns <frank@oltmanns.dev>, Erico Nunes <nunes.erico@gmail.com>
Subject: Re: [PATCH v4 5/5] arm64: dts: allwinner: a64: Run GPU at 432 MHz
Date: Wed, 13 Mar 2024 19:19:35 +0100
Message-ID: <1978377.usQuhbGJ8B@jernej-laptop>
In-Reply-To: <20240310-pinephone-pll-fixes-v4-5-46fc80c83637@oltmanns.dev>
References: <20240310-pinephone-pll-fixes-v4-0-46fc80c83637@oltmanns.dev>
 <20240310-pinephone-pll-fixes-v4-5-46fc80c83637@oltmanns.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
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

Dne nedelja, 10. marec 2024 ob 14:21:15 CET je Frank Oltmanns napisal(a):
> The Allwinner A64's GPU has currently three operating points. However,
> the BSP runs the GPU fixed at 432 MHz. In addition, at least one of the
> devices using that SoC - the pinephone - shows unstabilities (see link)
> that can be circumvented by running the GPU at a fixed rate.
> 
> Therefore, remove the other two operating points from the GPU OPP table,
> so that the GPU runs at a fixed rate of 432 MHz.
> 
> Link: https://gitlab.com/postmarketOS/pmaports/-/issues/805
> Acked-by: Erico Nunes <nunes.erico@gmail.com>
> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>

Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi | 8 --------
>  1 file changed, 8 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> index 57ac18738c99..c810380aab6d 100644
> --- a/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> +++ b/arch/arm64/boot/dts/allwinner/sun50i-a64.dtsi
> @@ -107,14 +107,6 @@ de: display-engine {
>  	gpu_opp_table: opp-table-gpu {
>  		compatible = "operating-points-v2";
>  
> -		opp-120000000 {
> -			opp-hz = /bits/ 64 <120000000>;
> -		};
> -
> -		opp-312000000 {
> -			opp-hz = /bits/ 64 <312000000>;
> -		};
> -
>  		opp-432000000 {
>  			opp-hz = /bits/ 64 <432000000>;
>  		};
> 
> 




