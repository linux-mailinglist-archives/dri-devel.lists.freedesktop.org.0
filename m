Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 158C9848790
	for <lists+dri-devel@lfdr.de>; Sat,  3 Feb 2024 17:54:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32A2910EA08;
	Sat,  3 Feb 2024 16:54:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WpxgNQGH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com
 [209.85.166.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 066AA10E9F6
 for <dri-devel@lists.freedesktop.org>; Sat,  3 Feb 2024 16:54:04 +0000 (UTC)
Received: by mail-il1-f179.google.com with SMTP id
 e9e14a558f8ab-3639aa6a54fso10651835ab.1
 for <dri-devel@lists.freedesktop.org>; Sat, 03 Feb 2024 08:54:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706979243; x=1707584043; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JtGhKs15Hj8i5RJ5ho6JwLU0TmKEm52r/T9AweQyD3U=;
 b=WpxgNQGHmuuRi7M7APWEihbCfnRMY7B72017WybZLkrV9ZmXfoVVatyLwGeo8zzr2p
 4fqmCh8JssDb83MvEdDGnVTRiMno3SKgtUIMXDBIYvQHTjGLngV5NKoppl96hYmNJa/R
 y57KFDK2VVgJb3P1A5pzMHAko7Vt0p4Xn8tcC0M1ZPZc3tFgwIz0GEgrOIWAJF6iQCWA
 FVx8w0K/mcrQmPkFkYe/uslHCPF+im42z8eqXDx4Aebv/5Ghe5vqsUnrqb716kL8vICv
 CwZ+AYA22RHoR81/quboKDWuXhfA3bxDgTD1xLG/KBszphwU9bafB3G/G4u9Jq1+wRdS
 krOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706979243; x=1707584043;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JtGhKs15Hj8i5RJ5ho6JwLU0TmKEm52r/T9AweQyD3U=;
 b=L7rgE0dWUHPQ/E1vfgHMbCaPruBvLI/vipL51KDiSi6v9wfASV0atEPcSDKYNfy4fi
 KHZe9zQABShx3Yr9UY5N/064ZgjTmVF9W7O3UORc/1unjMj16yAT6Bi/bQ2wwEKiGyEr
 VbL5AFSBRp/5Ukm7ASuVg0WPI0C+RYPeTFV4eWHY8XrLR3eojQZ1QunLNMbhwQTeXQdG
 jmEu6FUGtYgiNKxFqEgjsYOkdo+FVWap/YbTZIrfuu3SFc+erSBeb8DQhbui+IV5Iz/D
 ZvslTl1+LP9Kpkf7dJnp9JTs7zxV6vSuQ2cdNeFMF22kn3F/FoxOBLouLYOzXxozsJPz
 IuBw==
X-Gm-Message-State: AOJu0YwTiljgP3w1KjLH7vj49TA+XWC1l75PXj8qBf0Cry7RE/NAB6Ok
 sXXnwgpAnYJA3Ic+C/+E3rMFreMs5mDY8uQAlsurtgatDzyVnQFX
X-Google-Smtp-Source: AGHT+IEtUlUuWsf9Gbr9GJbRlc1FEcGkrsmzLVx90UiAKNG3C5GbacaJqKTLB3V+VnaauWFjXUN5Nw==
X-Received: by 2002:a92:d3cf:0:b0:363:81df:3d3 with SMTP id
 c15-20020a92d3cf000000b0036381df03d3mr5301076ilh.4.1706979243145; 
 Sat, 03 Feb 2024 08:54:03 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCU/UwDB46wLoYIFz3O6l5HXVdZUTuSGDGGNGDOBmA1nI1v32qlpxeuKPfkKPapsxAKPEyV6GPHaDnimTNr3DbJrYuloAkEnRbdSF2fb4CuRVyDXSHYK2eHAj/DTf82WRn6QOBFR5iwj2elDQNofClJ97c127Khba7hPCHaIlPasYNq2qlgRpAe3cwfen4EiVjlNaH4EfMYkZWjk/HYMl0zDZBa/UgXs6nqfuXwFARAOWRxFGSFfyowwZVJF3kfGTotEIkCx2VRUu5lOCSshBDa2s1TZVeZklv0lOBCQgeq2YYhVWTR0bj49etVariQ5188+WbNbo6s3wS0WDD27C7xTyep7AKf1ozf5xpunMCecoMQIZdeooVqkuvOeAarWQ6LbtFZldbUz1p4tfaiY/RL+R3e0HKdB0SEQfup7eprMSVdd2qtIMqi64bzq74UM3/P4HgBRcZlf16SZeUZ8oGeBnGKvp3E1GToJqiOk8A8K9SyHSsQXKJX/rVYQ/tfwLPDt3RTCtGUJZ7rmlNxDJXZu5etd7fWDAcCIJgiT3rXAlT4YRnFwWtdICYcfItQokTzmrNE5QZXYdSP6oc2uAkMUfqd2rYHvSzQpoi53MwL+SYArEuvYM5+ePpPj0XleBmwr6Q2aWPhEQiNFbT0UJFo9vkFus0VAOYDq4KJSKXXDvtp03Q8q6nfhzdIbf/ty5SeTXaiDo7vGDKgOARera2E+oLcjiw2QSr+7HzADqONxj94o8TWoUIjFN/+o6mvZbmaT5dwL95LBBD48M0cEGfDvHAF9Q6eaPC1CthonwR93ceLtw5fmr1u4ReEB9ENscdoRdfFjzMp26HdZhHmF7Kwb2AVHcafwsOLyjSdRUgGR2Ystz8uLQGuHxLwwS/pViR3hkiRxruq+4cKnGxmOnLyOgIUOL1Z93q2KFjHW9hJ9d0ntICMUPEbe4O/xrJzko/4NAo
 zKTMm/HRtldmfyvTUtcKEXGp1JpMp5rUj4zBHe5CyHWYwb8SeNSFH+sXwQPOBCSupIPgOw3CnTspR5lOggwYfaNWyhC7GD4aoUU0Irb4Dj7KPDYSGx7gRih9Mw4rrejlDGk57IACnM1O8zQE8s/o48ubKXEXq0CzXFZbAioDyJSkJ4R4u613NpycCar9bMYqVgC10=
Received: from aford-System-Version.lan
 ([2601:447:d002:5be:d9b2:bb4f:5531:6aa9])
 by smtp.gmail.com with ESMTPSA id
 t30-20020a05663836de00b00470b29b82b1sm1086256jau.154.2024.02.03.08.53.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Feb 2024 08:54:01 -0800 (PST)
From: Adam Ford <aford173@gmail.com>
To: linux-arm-kernel@lists.infradead.org
Cc: marex@denx.de, alexander.stein@ew.tq-group.com,
 frieder.schrempf@kontron.de, Lucas Stach <l.stach@pengutronix.de>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Liu Ying <victor.liu@nxp.com>, Ulf Hansson <ulf.hansson@linaro.org>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-pm@vger.kernel.org
Subject: [PATCH V8 06/12] arm64: dts: imx8mp: add HDMI irqsteer
Date: Sat,  3 Feb 2024 10:52:46 -0600
Message-ID: <20240203165307.7806-7-aford173@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240203165307.7806-1-aford173@gmail.com>
References: <20240203165307.7806-1-aford173@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

From: Lucas Stach <l.stach@pengutronix.de>

The HDMI irqsteer is a secondary interrupt controller within the HDMI
subsystem that maps all HDMI peripheral IRQs into a single upstream
IRQ line.

Signed-off-by: Lucas Stach <l.stach@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/imx8mp.dtsi | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mp.dtsi b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
index 5c54073de615..5e51a766f3d9 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mp.dtsi
@@ -1399,6 +1399,19 @@ hdmi_blk_ctrl: blk-ctrl@32fc0000 {
 						     "hdcp", "hrv";
 				#power-domain-cells = <1>;
 			};
+
+			irqsteer_hdmi: interrupt-controller@32fc2000 {
+				compatible = "fsl,imx-irqsteer";
+				reg = <0x32fc2000 0x44>;
+				interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+				interrupt-controller;
+				#interrupt-cells = <1>;
+				fsl,channel = <1>;
+				fsl,num-irqs = <64>;
+				clocks = <&clk IMX8MP_CLK_HDMI_APB>;
+				clock-names = "ipg";
+				power-domains = <&hdmi_blk_ctrl IMX8MP_HDMIBLK_PD_IRQSTEER>;
+			};
 		};
 
 		aips5: bus@30c00000 {
-- 
2.43.0

