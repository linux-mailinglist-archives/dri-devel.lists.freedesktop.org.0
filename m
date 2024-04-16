Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A7288A7047
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 17:53:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CA6B10F19F;
	Tue, 16 Apr 2024 15:53:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="soq+eVxU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEE3B10F19F
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 15:53:37 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a51b008b3aeso565319866b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 08:53:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1713282816; x=1713887616;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rQKlqQdoXWwPEeES/FN9TpeW+WzqvlnmGreawKt4ncg=;
 b=soq+eVxUA7lY63TXpYUNR23rzci3PxPE/1ugGhCKWBzkhJk9ZkLKfhnvrpRbuKnrNV
 uV4ihZHFU8rwZGIyW7B8immvY1jTBrfIN1EN+Gu1zwpcXU8Q84E7t8e17pArvcC08Qk1
 3sBaEPu206slWr+EEWS8MpckV72PrWx/zTNT7RW/fNHSH0P9yIajPyOesW9lS+wLaHk7
 nN3O5akt/LaxaiSA59g1RRiVV6z838Oks3gL5w5xrXWv4gTxOTlSIM84I/5n7tsQiWog
 BwyD73ZqgLJM4yIndtkOM6nbLae783PUb62nTQf03WgXBI9Doe3G8WgZHjge+jPx8cdS
 5vBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713282816; x=1713887616;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rQKlqQdoXWwPEeES/FN9TpeW+WzqvlnmGreawKt4ncg=;
 b=wCT+XnviRAC9AU4NsyWW88eRUzurjubC+f4xSmhhUfiJqB5u2hQXCbtbyqtf7t/zoN
 AAw9V0gSvOOa/KPUF3sfM68aEf2d8orF5vkU8CKJvzwIiEsXEkqI/Q0RoXfavLlU6uK9
 lm6GULIr5jYtuVom3kA+ddA5i5y8+KjOQzhMvuhvowzTWRtWvcrNwUMcPBZvJChmS93u
 ryqLu24I4tQ2J1y+fHMWKJbkKRhzsWebr3Km4oCGABSX8vW03/krUWEYyuz+2oiU9EXB
 xypefySiVfEBqMSKFo8hpNMLipEsYkC0NNrmpqWfur4HEFhK85tSNLGlshywJxiBkTPe
 dbgA==
X-Gm-Message-State: AOJu0Ywld6WFQU/8qI1nae59VLfPa3imAm5nm8E5NxHtjDgWFHp6VbF6
 9yB6xI3iq6NBZrxZ8MOLGXecACv4y94OQDNEM2AlOGksSguuF/w1m3fPAlgkoZQ=
X-Google-Smtp-Source: AGHT+IG5OHqnqUsnTyNTrbs2nYwMJVuo+moQf2T02fHCNlrjfcuq4FRmRxDm22VoPJC4CBn7dugEWA==
X-Received: by 2002:a17:906:c094:b0:a52:3623:f498 with SMTP id
 f20-20020a170906c09400b00a523623f498mr9213020ejz.31.1713282816235; 
 Tue, 16 Apr 2024 08:53:36 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 d12-20020a170906174c00b00a52567ca1b6sm4156691eje.94.2024.04.16.08.53.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 08:53:35 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Tue, 16 Apr 2024 17:53:12 +0200
Subject: [PATCH v2 11/18] dt-bindings: pwm: mediatek,pwm-disp: add
 power-domains property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v2-11-33ce8864b227@baylibre.com>
References: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
In-Reply-To: <20231023-display-support-v2-0-33ce8864b227@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-pwm@vger.kernel.org, 
 linux-clk@vger.kernel.org, Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=962; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=ofdmgJd5VzPCJdOxt//1dMUAAyFDN3WtUwt9Q4Dw2mk=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmHp7qxOZhJwN+amyZRjgtZoEdl4pUWh8cCetZpi95
 2LCQ/KWJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZh6e6gAKCRArRkmdfjHURYIUEA
 DDUtcfuZO39u2gAlupF0qEhOdmTU7v1BrvGt7UBgJQNnNAIdJx4pwcw38kzaVcxs/VJwBF8kosuLCj
 dyeS+BSNX/sXe39SV13zv2A/7Cajr+FXat4cehh3PqXq+oem/pS46y2EjVSpuwig8WEzoMHWajg+IB
 bqgl2bUfXUxg7ZQX3u0+7FcdRTYBCkRHVwTROX0GlfXqsoIqGAUwD1gFdxqRPhr0jyVhklRZRN07CU
 s22WL8eZh+pTXSmYQmbtFFLF8KP5yC7Djn18HtKSuxbPNXNnjbaAZ79ouQ5dyCm6hhTtpaJEeBPOQ8
 BpnlJhYdDl5qb6IbzdaIK7sedFkzKwDuAmebP+ATxYNo5HwH8qkPNGryFKCB4JsIVaNDRNNt4CHt9r
 zrJxCxzpDOCN3vlyoOGQvjEyq7yoeVT8q6++i2ndmp8/MUgl3RFVbr1Qq8srLeyOn1hVC2RpevzT1S
 f3DyogERJynn30zh1Tb+3bkC7vwf9h4XR7259YLQA/RE3jEewRf0iAPxeUsYRrSQziWUW7fRe3d3pw
 j5aeQ+dnpnM4JFhAGYk2gs+fIa613ERanAJ2DzFOiC9+QWW+W96ha4Q/u27vi/uRsXnx35Mmj44myX
 vCuQGPTCjQsj6M1gvir5mdsnpeDwBeek2Lm/PcUPl8Bj9I6uq+p+ONja2rCQ==
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

According to the Mediatek MT8365 datasheet, the display PWM block has
a power domain.

Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
index afcdeed4e88a..f8988af05287 100644
--- a/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
+++ b/Documentation/devicetree/bindings/pwm/mediatek,pwm-disp.yaml
@@ -52,6 +52,12 @@ properties:
       - const: main
       - const: mm
 
+  power-domains:
+    maxItems: 1
+    description: A phandle and PM domain specifier as defined by bindings of
+      the power controller specified by phandle. See
+      Documentation/devicetree/bindings/power/power-domain.yaml for details.
+
 required:
   - compatible
   - reg

-- 
2.25.1

