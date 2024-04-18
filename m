Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C45388A9C79
	for <lists+dri-devel@lfdr.de>; Thu, 18 Apr 2024 16:17:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D478A113CCF;
	Thu, 18 Apr 2024 14:17:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="fGozSLJc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com
 [209.85.128.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 40C9F113CD4
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 14:17:16 +0000 (UTC)
Received: by mail-wm1-f43.google.com with SMTP id
 5b1f17b1804b1-418dc00a31dso7533685e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Apr 2024 07:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713449834; x=1714054634;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=dyegayfB1y9965dzTGr/j6svW4ieRpTfgrhf50HfpFk=;
 b=fGozSLJcLRRuOMBz0pBC+IZjNxCr76IPPNfRuoKDo18RKf6aVWLfXBkC4iMO8gvn3G
 mKq193HpAwEg/CozCvUuveM5mldPhm//O0NXDbPh5Dv93iHSDOqyohL1GsyHvPGN8BqK
 WoY38CSvvtJTpaaF2ILPjDeM323/mVlhrV32GiOhjxQLlJrUCH8Saf+MIFB7iS1hy6Vz
 LIXGfQPzDs9vOSFzdJcUK/Qm7DFmYes0c7zeB2Ss+rtwqbDGp3hXg27ISbBWZkI97B1Z
 dq3dDw7VBwPMj51V43mAP4MrnAeKuTRiUS3nBAaCVTAKD2gphoMmn+SOO9A/SvXzP5Oz
 3NHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713449834; x=1714054634;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dyegayfB1y9965dzTGr/j6svW4ieRpTfgrhf50HfpFk=;
 b=mXhimkhYaiI1SPQKjBsBLi99tjWpJy9xIPtgOMB1ngdNE5yaIv4dU7yHHOqY5GnZnW
 E5dp7Jl2AYftzG73Z+yqPOq3WVusThD1Es34Tbjq3ECGHm5vCmWnDgfC3+fRyXcjhvSK
 2eAZ9xs0x61lcKwONRqGTqHeHZI1irU3gwI8x+qwvdVFdRoTZ79nnM/0MDHmbPBefDow
 mntzo53zWeX0I+PZlgR5jDe1kkfoCMjJILBPfWYxk53yKc6EMxK62j9borgAxQmPhBfE
 bMges4f9o/n1rj0VxpJHvf88+W6XAHNduE0tSYS7Wn+SzkrEtyNnt0iquWTK6nFu7cv8
 z5aQ==
X-Gm-Message-State: AOJu0Yzx9VYtBv5fLhBKzfSpWqDu8auXpsiSieGAxB4Zz2RVwpm5aKQs
 cDaVxZQVDwEoMq9Du3DoggxUbZV9G6QKvVyJAR6npjvGEzxmazK7mTcTbMJW5Ng=
X-Google-Smtp-Source: AGHT+IEsM9iGSZG6iMHAcf9KGu692TY/H0uIe2sVr5xtzSaWVovohbIcJe5VQO0JAYzGjB4DDgOfag==
X-Received: by 2002:a05:600c:a12:b0:415:46be:622f with SMTP id
 z18-20020a05600c0a1200b0041546be622fmr2167234wmp.14.1713449833987; 
 Thu, 18 Apr 2024 07:17:13 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 i9-20020a05600c354900b004180c6a26b4sm6267510wmq.1.2024.04.18.07.17.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Apr 2024 07:17:13 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 18 Apr 2024 16:16:51 +0200
Subject: [PATCH v3 03/17] dt-bindings: display: mediatek: color: add
 compatible for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v3-3-53388f3ed34b@baylibre.com>
References: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
In-Reply-To: <20231023-display-support-v3-0-53388f3ed34b@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Fabien Parent <fparent@baylibre.com>, 
 Markus Schneider-Pargmann <msp@baylibre.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1050; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=YXHTuzshsIEn0rNsq24IlHvsgB1HSvJsHYliNaoUyEM=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmIStiBs53eAY3DeO13tdL6QI+Znbz5FwIwD/YoB8q
 OCNZARyJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZiErYgAKCRArRkmdfjHURTRxD/
 4gQQKtDeVST7qS57VlXtgagtFc35imlFj4VzD0seKTLL22adDD+Ip+d+eb0gMs01I7sN8dXFEh5bvg
 YHauScLtPi02KVPxokKXYmQlf2Hnia3Ac4U2CIqQn9qx7ESmnekahSlsMSi/ZDGNJe2E3jC0Nouumr
 2GoLrM+cEvvITmIQGxQ0qBYTBFfozVIOnREKwm6q5u1hFe4qm93B8LmboqwV7vnhREXHIpV6jbrNM7
 fBILeMgLC9B2iVowiB85EkDYAFkSVRDwLIlPrxWyV4vzmBJiMqKrUxxiZBucBBnDwuEMCCEk45jicD
 gpt8ZNl2Su+SQ0eZ0II7t2SQAwq/QU3gqqk9bQ0QgIGTZhXXHPd77oOQN79mBqp+Bv1g9kmE0njfQ2
 PnxBPb54W6L3g8wPEKq2rpY5FXHfmX8jG6aegE+zbORBnFCapLwB//4rRsRwgT2mOsuIQHZPmYjdfT
 9PIwunu5UQr3olFVkGjxPcUpa39bUs5PQzRDsAK3Q0eqixnGSaPsfYJUPUiCx2JjN+TLjVdhT7nIHh
 6z83C+zeIX6GFmoqhiGvaA9OtHzgux+kntZFd+kage5z3q2BASkPXoQlxIJpeuNJoMVsgU4k6FmBRY
 j9+0Orj4mpUdqNvzLk5YXv6L+BccO9fYqL9Hc979dnUF2953s1vxf74BTmKw==
X-Developer-Key: i=amergnat@baylibre.com; a=openpgp;
 fpr=231B5ED7F3EAAA700E60FE8B2B46499D7E31D445
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

Document the display Color on MT8365, which is compatible
with that of the MT8173.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
index b886ca0d89ea..7df786bbad20 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,color.yaml
@@ -40,6 +40,7 @@ properties:
               - mediatek,mt8188-disp-color
               - mediatek,mt8192-disp-color
               - mediatek,mt8195-disp-color
+              - mediatek,mt8365-disp-color
           - const: mediatek,mt8173-disp-color
   reg:
     maxItems: 1

-- 
2.25.1

