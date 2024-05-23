Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC22C8CD2AA
	for <lists+dri-devel@lfdr.de>; Thu, 23 May 2024 14:50:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B506510E404;
	Thu, 23 May 2024 12:49:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Ok3gRmpy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 572AA10E20F
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 12:49:41 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-354e22bc14bso1554062f8f.1
 for <dri-devel@lists.freedesktop.org>; Thu, 23 May 2024 05:49:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1716468580; x=1717073380;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0hq7fu9lKeXTgrshzdpFsaVgKo6fIiiCmJ+5OHF+gZs=;
 b=Ok3gRmpyuFE1GY/8vX1vMixextLUqb0DlAXp/gr48NmHDnWCpkFoPio4AdjEGnRp03
 l1iyt03YT1V3wHZ+0KUFPv1YdOsTgBocp59aowT+7k/3v0csva+DE3Lh7x0+eC09GlRr
 3BNuIvF03Frwp5p5ewgwP7jePW0/1h25y+oo+m4ufnwedlTWJTzaEWJHjveRQJHKfdBn
 NV2NGgmJiwIA3YCsGPsESMlC9Kt3Z3fpuiLMcFF951IsUrrP++uRqUZzSTuGjX/4OIyC
 6KMx1GKM/RXZ4gsjJEgxUML0VRbpiyBaPK9RNXAUuFsZBjcGlM+4nTOZDpUZ8jYijqjP
 4WMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716468580; x=1717073380;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0hq7fu9lKeXTgrshzdpFsaVgKo6fIiiCmJ+5OHF+gZs=;
 b=OxafXi6HIfIsepfCOor1eDA8Cnx+SCNjAu4sRu2dea1pPPtUY3pHS4wt8UCxD+PyAr
 mFEmJ32wk/D9d6jVlHKtvJsGKtI9WbzHhxsf8+tgNCHdB3ttiSBzQhbK4/ve1Nwkc+sr
 6UegsWZIkHmH0XhmH1KP4FmMzyv1wRip6c/P7/kA6gfnTzrHSf/crIq61+Xz5qzDSkGy
 u1JJttpnhpBlXdfuNflRfU9QJFTxEQL9zmWLvjYHus2rDwIDIjFR7rpgsHNDFVkQck8j
 KooyyXzCJFjDG5Im/32i7FBF1XieGwLyJpa6WN0QBLMjhzR2Vg2+xnLCyWNQE/bQV/q6
 QBOA==
X-Gm-Message-State: AOJu0YzYEiPYhN6BzwTBk581A4P23VEUOqQizlHcV6XwQ2xCSU3Ut5G/
 H/mN+gJzhlf68qjU8iYTGug2JOqSOfMyBKkMt8hV5FlfnIu4Y3pDfbN2RWl8xO4=
X-Google-Smtp-Source: AGHT+IHtfgcFAHCNKc1JJLUdRiLvcwprOJFdCfAdBFglIGxFEJ4vrqXkikSCSJEtDhSqbfnzmVOiFw==
X-Received: by 2002:adf:ab18:0:b0:354:de96:d26a with SMTP id
 ffacd0b85a97d-354de96d776mr2915534f8f.17.1716468579794; 
 Thu, 23 May 2024 05:49:39 -0700 (PDT)
Received: from [127.0.1.1] ([93.5.22.158])
 by smtp.googlemail.com with ESMTPSA id
 ffacd0b85a97d-354faf3fa68sm1259611f8f.116.2024.05.23.05.49.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 May 2024 05:49:39 -0700 (PDT)
From: Alexandre Mergnat <amergnat@baylibre.com>
Date: Thu, 23 May 2024 14:49:23 +0200
Subject: [PATCH v4 10/15] dt-bindings: display: mediatek: rdma: add
 compatible for MT8365 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-display-support-v4-10-ed82eb168fb1@baylibre.com>
References: <20231023-display-support-v4-0-ed82eb168fb1@baylibre.com>
In-Reply-To: <20231023-display-support-v4-0-ed82eb168fb1@baylibre.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jitao Shi <jitao.shi@mediatek.com>, CK Hu <ck.hu@mediatek.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Alexandre Mergnat <amergnat@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1014; i=amergnat@baylibre.com; 
 h=from:subject:message-id;
 bh=9RgySSODKXDFtNBIppDoD83d/BgQN7IfDe8Mj9kVPEc=; 
 b=owEBbQKS/ZANAwAKAStGSZ1+MdRFAcsmYgBmTztTqPg+oDl98yeTzoXSSrSOvhaYdFezpli0P5FR
 JKM6KpCJAjMEAAEKAB0WIQQjG17X8+qqcA5g/osrRkmdfjHURQUCZk87UwAKCRArRkmdfjHURcEQD/
 9EtbGsiu3ulrzzGjMJ5wGDXHsuyanF+WSqI4Z5YunbLAde+LdkO85gVphFDcYO0YIWuC9O42glwNHG
 y/TXwlPvfq9vD06dRmVngxd2P9BxMQQe4Ewsu0Tx/pXqaQZlJuO6xFXSLi73EjcfrACF+LXwFFSo3s
 /yvIZbuFDuqPO4l+fISmSq26J1z3rqPPVvdD1ZgKyjvEWg7MGsQ+RaHPhhuet4vU+S+SNjojFMQpJA
 YjCctmauXTlMyYkt16f41ffwOadhdgF0dPMJYGr2jLMN77d74XDGQ2ZrGqqeTgJ5ReMSls215GFtgR
 nWcLvLbv7dvRQ7DAM0Ie0XpXxkQqowIe3sz8SwpGkutorS28xGe2lYy3s3+FuKi03neXlPmnKO40UE
 vYCZtzy0NEziDBPwTDwiI4z7Pe/Xivpm6eonaEcI5x3bFIndvdP44rjNl97teO6vcfjCP5QRDiNGGU
 WHJwbRtl8ZZyfXp1FZFnNWzUfcsM/DyHtnBqpCorGoz3sgoS/InosNtERdgZKdBwaSFBrzcOrKyg9b
 9FpcYphA399Icm1nHIDqKnFvWrCps0aBliBj82wUnp1mbiHSQIAISFpd1/L9DYlqI+x9vbxhHjNTqU
 u9LXP46Bh5oZGiXUKLnnpKoflsjNGN0pMoml7UHpEXqjGyHR7v8lphTIRbOA==
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

Document the display Data Path Read DMA on MT8365, which is compatible
with that of the MT8183.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
---
 Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
index edb8d3b67025..878f676b581f 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
@@ -45,6 +45,7 @@ properties:
           - enum:
               - mediatek,mt8186-disp-rdma
               - mediatek,mt8192-disp-rdma
+              - mediatek,mt8365-disp-rdma
           - const: mediatek,mt8183-disp-rdma
 
   reg:

-- 
2.25.1

