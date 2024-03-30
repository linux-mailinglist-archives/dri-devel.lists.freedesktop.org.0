Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A436892D46
	for <lists+dri-devel@lfdr.de>; Sat, 30 Mar 2024 21:44:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFFC110E5EE;
	Sat, 30 Mar 2024 20:44:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="VUcTDIeV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBA5710E5AA
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 20:43:42 +0000 (UTC)
Received: by mail-wr1-f50.google.com with SMTP id
 ffacd0b85a97d-341c7c8adf3so1993674f8f.0
 for <dri-devel@lists.freedesktop.org>; Sat, 30 Mar 2024 13:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711831421; x=1712436221; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=KIExVlRuthKjEW06MrlFe0iZQElsYGeKhHET6Bz7z/I=;
 b=VUcTDIeVnnx7nRCjqSGk4RsVOZbHaJK/3HD3/yj7b24RszWAuMxNxImB5dRgTCdLXZ
 zdm/n2uNjJhg396cy/OfPoVX8VJCxhj91Bmi3/j/tZG6xPt/rW9EfMiAOn3wYoTGRuyH
 lKGpvgbhIpMJz1F0IAqWbKG2CgLO9fe2QEMyrHdfO++XbmbuPQlVLS9BY8KJetqgjvTD
 SYSFMvcTRk41WiAsaDPG0Bm2WLbbpsoec09GIxC0nBrqP25ugc3OrwXSmHQ7WK3w5qWI
 3wqh5va1ZIE+L8tBjNcTB1gJibAdldLlUZEYzdqTM9EXF/d2BHDz4MMhjwgkQdquojeE
 zHMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711831421; x=1712436221;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KIExVlRuthKjEW06MrlFe0iZQElsYGeKhHET6Bz7z/I=;
 b=A5Oaqjzefmbm6hEQEr+AjsdzSF8u21Hj/chUUvn2eJfdqWydxeVyPFrWmoK5Y1a3vZ
 nFQB144KNdDvFSbtVkTjYip5czhLunzwnP5tRvYuknffb3+4L02uyaXnrr+tf/j+VJsZ
 DlNgA5RmRF0TmvMPFJgtVZb+MQva8KkqOEnkPoctS5GeSbiB1tBMiGbjtMDYgwHs06FW
 wXNXZNnhTqZStc5RRLbqg17Kl6NJBn2X1ji7VHL1yQ4jHx9RqWduyTqj15oNTyIYrQcj
 YEYjo3mH/+LkaybUQatyn5WhFbZlZsJg1q0q1CVcrgIvf1FRtjKanzcmx3dFdFV6VDJf
 GO+Q==
X-Gm-Message-State: AOJu0Yylou/O+HMVcMURt2hvt9ksVI8lcGNEr8odsa1dLptuszMhL0V8
 ybMLaX/Cuhdbua0spddSpbqICEeR/PUtxI8lL+QshhwyFXSQnoCfOFrf7N4+Y3k=
X-Google-Smtp-Source: AGHT+IG9iuoUde1lAoly9jtwe67T5QJoT0i6GOQgmU6/FfQpixJJco2dyJL90gG9kOa3T1xDTvVHUQ==
X-Received: by 2002:adf:e4cd:0:b0:341:843e:6e4d with SMTP id
 v13-20020adfe4cd000000b00341843e6e4dmr3393582wrm.41.1711831421105; 
 Sat, 30 Mar 2024 13:43:41 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.223.16]) by smtp.gmail.com with ESMTPSA id
 o12-20020a5d4a8c000000b0033e7b05edf3sm7231299wrq.44.2024.03.30.13.43.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 13:43:40 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sat, 30 Mar 2024 21:43:20 +0100
Subject: [PATCH 09/11] drm/mediatek: ethdr: drop driver owner
 initialization
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240330-b4-module-owner-drm-mediatek-v1-9-fd5c4b8d633e@linaro.org>
References: <20240330-b4-module-owner-drm-mediatek-v1-0-fd5c4b8d633e@linaro.org>
In-Reply-To: <20240330-b4-module-owner-drm-mediatek-v1-0-fd5c4b8d633e@linaro.org>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=817;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=gYuLLFBbKL2GTlBDQbb3uSAqyMopOooAltsdvgRD2hw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBmCHlrjXt3AFiYBCnjyA6IB2F8XUw/XHWVM7c8W
 LQ1OsJvhACJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZgh5awAKCRDBN2bmhouD
 15RhD/wJdwHVbjfn9rfbn1/qZXPJDRjD9Y/CdHrL3zlzjsCuWuN+NrLnzSMijduiHF5jRWWsD7e
 M/qUoK7ZFgeX4NUYXPwnSv+FgBr+FT6hbwz3k79heTqQK2CSyV/QrBmkNcXOdy2B/Q0L+UonRnm
 EhJcvOhvdT4bgYcU890eCarOpT0cgdqwTsazJ86Kt3ZqGTQ89iRxzxlYTJxbG8ysTx9kyO9whWL
 S+tU84AnkxG74cZbo0xPzkkE7o/Z4nUCgPcAchM0LBhvnTXRagikXGT0Dw9WWT265sNjSMzfHaG
 1zndHVatcxz5Z4vYbekZb2KOV1gjaTJYoRcx1gCFw0e2KzSxf6DQp8lXnyhX7H2UzgqXpeDdnhD
 BQr2Fqx7Q45NbO5rjkAxQtqm9nxl7k8529Oryzz+kPjdgyYGLZJoZslxDXdWYzx2mZuK409xQwB
 XM8NCUWUNMuNS0QXAEE593gsy6PXgwgi/8jEkKzhExH2EsHD4dAHe9eYtZHdwZ2OiE5wUKGNPMN
 ZJQNs9NLukWNKuHLEm4nMmYm1Hy+gS9Vhu/8HU8HrX+wnM82gO/VcXF1qMzPvIXZLH5N3YGzu03
 KJ0hkQRxKV7xEpxLP5PfimY6CMYKvM4PPDrb9FmgYpYwyPKr2w1vRg9NrD/DR5roEIMm0sMT3gy
 nZVnGFLIwFd7lDg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Core in platform_driver_register() already sets the .owner, so driver
does not need to.  Whatever is set here will be anyway overwritten by
main driver calling platform_driver_register().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/mediatek/mtk_ethdr.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_ethdr.c b/drivers/gpu/drm/mediatek/mtk_ethdr.c
index 6a5d0c345aab..434ba8b055a4 100644
--- a/drivers/gpu/drm/mediatek/mtk_ethdr.c
+++ b/drivers/gpu/drm/mediatek/mtk_ethdr.c
@@ -363,7 +363,6 @@ struct platform_driver mtk_ethdr_driver = {
 	.remove_new	= mtk_ethdr_remove,
 	.driver		= {
 		.name	= "mediatek-disp-ethdr",
-		.owner	= THIS_MODULE,
 		.of_match_table = mtk_ethdr_driver_dt_match,
 	},
 };

-- 
2.34.1

