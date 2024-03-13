Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07DB887AF25
	for <lists+dri-devel@lfdr.de>; Wed, 13 Mar 2024 19:18:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B1AE10E677;
	Wed, 13 Mar 2024 18:18:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="RBaOjG1N";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AD2E10E677
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 18:18:22 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-33e92b3b5c9so70831f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Mar 2024 11:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710353901; x=1710958701; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9yCc0/S0zgq2oMArP0ajpR3WFLegRCSHAl26z/qpqpk=;
 b=RBaOjG1NMZMf1A3jCD6iHpbvZi6D87SdYtJaz0lBvuqVqAYcaEpxo2gs7q8TxGAg9g
 xy7wKpZpHlAf2jubs9d8jiqIKSw9528fteOqYLDlLx0KejXCcyaBktKrbIJdos5bsQ9U
 4oHkHscoTd/8icyk8cNmFhOzbBc1+9oWsWD1YAVl6En5MrUp90VmTbkK6QeGzyjVxEdz
 EtzT2pMIbkVMJBOnzhEfF+h6FDE/MANFz3VubJrvV/nMK2OuBuBvV69e67lSPXQERuEn
 +K7Y7oPhr1EaWYMs+1VNoY7N7sEB5wNA92xnioASuYn5x30CVdhwpVq4CwWyImvB+WVv
 JFVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710353901; x=1710958701;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9yCc0/S0zgq2oMArP0ajpR3WFLegRCSHAl26z/qpqpk=;
 b=GmOnsEtfadYKew1xqTUCOX+mvqulQMWtlJZ7xbrIgiF0qJEA8s3yBTPQALkbiwpbPK
 gwgBLaHmn841dylcLQrZtzJJNksHAkrEO9XdLiIax6SrImw4MVU5sO2bVuFysA4gDz7B
 tF9t7rHK8gAw3zmDdsNoL8QdRU9hip8TVk+OqT6o6F7U0p5nS+q9il/qH13J1HQEYC7J
 +3poTLvqk/8fAJW01VYwjVtrJur/Ac5PaDiYQq3QeALK/iBWievdBrm+EFYfAPbYXClz
 h7bnxD2G2C8K28qTm/51+4FHDbaUq8pJwGRRfVWLUeywTPC7/h/oVhqfGsw1pIg2/uLk
 Rwqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWVgMlkPPPwYnO3JwYJmGAqqaQhWoF0HFqqNvRqf3Fb0fX20nUMckSs6D6tcqW0d1QBzZzAMu2fm9/cdQxrcLjvdP3SgGt0lcNEc4FxUmev
X-Gm-Message-State: AOJu0YyAFssPoDxiwVnmWO91yhcHHNumlwA6pbNWFCENGCCoQqGw2Y0/
 2fvNaV52A3GPOgIq3rB6Hbi75fvhAJtKahG7IsW28LetghiI4DAP
X-Google-Smtp-Source: AGHT+IEINZzKrCwt57AAp8s6840j6RZ2WxfBjoKO1fAuijCL24OCWLtQpTpKGO8XI3jgUHD+eLF9Zw==
X-Received: by 2002:a5d:4d42:0:b0:33d:a190:f0c with SMTP id
 a2-20020a5d4d42000000b0033da1900f0cmr1974873wru.16.1710353900734; 
 Wed, 13 Mar 2024 11:18:20 -0700 (PDT)
Received: from jernej-laptop.localnet (86-58-6-171.dynamic.telemach.net.
 [86.58.6.171]) by smtp.gmail.com with ESMTPSA id
 h4-20020a05600c350400b00413177c3f1dsm2962129wmq.18.2024.03.13.11.18.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 11:18:20 -0700 (PDT)
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
 Frank Oltmanns <frank@oltmanns.dev>, Diego Roversi <diegor@tiscali.it>,
 stable@vger.kernel.org
Subject: Re: [PATCH v4 2/5] clk: sunxi-ng: a64: Set minimum and maximum rate
 for PLL-MIPI
Date: Wed, 13 Mar 2024 19:18:18 +0100
Message-ID: <1784566.VLH7GnMWUR@jernej-laptop>
In-Reply-To: <20240310-pinephone-pll-fixes-v4-2-46fc80c83637@oltmanns.dev>
References: <20240310-pinephone-pll-fixes-v4-0-46fc80c83637@oltmanns.dev>
 <20240310-pinephone-pll-fixes-v4-2-46fc80c83637@oltmanns.dev>
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

Dne nedelja, 10. marec 2024 ob 14:21:12 CET je Frank Oltmanns napisal(a):
> When the Allwinner A64's TCON0 searches the ideal rate for the connected
> panel, it may happen that it requests a rate from its parent PLL-MIPI
> which PLL-MIPI does not support.
> 
> This happens for example on the Olimex TERES-I laptop where TCON0
> requests PLL-MIPI to change to a rate of several GHz which causes the
> panel to stay blank. It also happens on the pinephone where a rate of
> less than 500 MHz is requested which causes instabilities on some
> phones.
> 
> Set the minimum and maximum rate of Allwinner A64's PLL-MIPI according
> to the Allwinner User Manual.
> 
> Fixes: ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in TCON0 mux")
> Reported-by: Diego Roversi <diegor@tiscali.it>
> Closes: https://groups.google.com/g/linux-sunxi/c/Rh-Uqqa66bw
> Tested-by: Diego Roversi <diegor@tiscali.it>
> Cc: stable@vger.kernel.org
> Reviewed-by: Maxime Ripard <mripard@kernel.org>
> Signed-off-by: Frank Oltmanns <frank@oltmanns.dev>

Reviewed-by: Jernej Skrabec <jernej.skrabec@gmail.com>

Best regards,
Jernej

> ---
>  drivers/clk/sunxi-ng/ccu-sun50i-a64.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> index 8951ffc14ff5..6a4b2b9ef30a 100644
> --- a/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> +++ b/drivers/clk/sunxi-ng/ccu-sun50i-a64.c
> @@ -182,6 +182,8 @@ static struct ccu_nkm pll_mipi_clk = {
>  					      &ccu_nkm_ops,
>  					      CLK_SET_RATE_UNGATE | CLK_SET_RATE_PARENT),
>  		.features	= CCU_FEATURE_CLOSEST_RATE,
> +		.min_rate	= 500000000,
> +		.max_rate	= 1400000000,
>  	},
>  };
>  
> 
> 




