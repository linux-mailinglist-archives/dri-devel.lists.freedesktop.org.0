Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mEwkONxEk2kP3AEAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:25:00 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66C851461A5
	for <lists+dri-devel@lfdr.de>; Mon, 16 Feb 2026 17:25:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A2FB10E3B4;
	Mon, 16 Feb 2026 16:24:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="IWqO27t9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1676910E3B5
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 16:24:56 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-4359228b7c6so2533107f8f.2
 for <dri-devel@lists.freedesktop.org>; Mon, 16 Feb 2026 08:24:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1771259094; x=1771863894; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sYr4kH26Cd3kQ0Yi5Y6B01aBIxSE1jviWCAWWKW+n5w=;
 b=IWqO27t9CCpWQizDcZlxoqyZtjF+uyNiNeWE8AtO6XkvDucKwFwPDH/Gh+ytFbFcCV
 T1VuCzquaLNbpncgTZuvFUodK457rv28OLBnTYTACrBsO4TIDo9JoClXb7By0bdMQCtB
 KKjEvqbbzSDNFPvT1inx2CIBnfuWnEa+aL7CojO2hqLz8kRFdAw0/qOVbYczU/e1VFu7
 SPnIucFaIrY4Sl7yg1i7pMkGyPAeoXVMU01bnSUK7MRJazMPITEZvQAqGcuBPZhJ+cnQ
 QqtAhZ4Tb4KYUGABp2Lecq3Fqc2A9jxAR1tsvLB13nscAseJ1xjqiDsq/odHbeXHmbi6
 1SCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771259094; x=1771863894;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sYr4kH26Cd3kQ0Yi5Y6B01aBIxSE1jviWCAWWKW+n5w=;
 b=oBB1uqWmcX9ogn8Y8h1k9yGbsXd/97Cu0A5IFGR2UxQcgrxyNhGH30lyayi9jlu/Ge
 X5K3QUsyKxpNgb3L4zdOqR2LZ4Y9ALfbZx/fX5jgS1PnmpyExHhRYcwgTCN8efliu2At
 HckjiENjHaV/Sz+O1AZ38nlfPQWer0F74pN8fY5NfLNeUixIPlsTVAZXWrXTE1zr5HqA
 BsMhP8WLYRAfuVhO2CbE+nZNAlAS6eKBXf9N/jOOWiaJMb+1/0LLsmnU5n2xJECAVCur
 xgMVO+4Uh/92EvP3I7/IcoDirPA/1si/xGVE3ccskVF3cdPP1B4Q5JnYsdBgSe34/WTH
 aK1w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5GSPgAvacYEL8p4GoohlWFiI1yJTGUic+kcWwhtuIjja11UARp9CW6sH9sf9DEPsbNLbZu0GAX2s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxHj8k5X9MLm6fEwD4fn2DqdjQ0JvtJSoGw0cHQKjxEdlsJ+v5O
 awUQAJ8O8HppbnBh3IU6EA/H3OnUuXJMF3FHFKn9mBi5bevmXYLMMM2Z
X-Gm-Gg: AZuq6aLkcNFlLK0CDulaNV7/BtaRHpc/boo9j7rAYVnLNJhq9q+wVehIrhZjVUaF0DH
 MQCEvnLExNYJfonRbBwMXFJyBmYRd2LdP2KumrzYqgfmRSAIeLN0WAai6r53UR1gNVUZcsN2Jjw
 63Sftbj7hRie+NTOwgVsP1s8VnvjjAgZcSxk87qTde5Lc3OHkAa0/+cydbiJYQ5/11sT8p+D0bA
 hT06wlVSNV/sjlpuaCHG5hY012d4xg03uqbMJER7b5eGDG0d/9tpSTiv5VPXo1cNN/nyB7dDCEW
 fdvZu+MZRt1nTp7QL+H3Bhid3WrYc6t98m2PaeyO/X00fPf1egoZAXhcZZrYBS6gKm3gY+d8ly7
 KJyC9yr1rH6+vFGGtyrQwQYyxLocj36ukY5XwTlYb0DLlohlyr+8aJ5NkbrfdGWb7wa0caZZ0vS
 JuPSiXj2pcPvDr3FbO+2VjaTDWMOazFw==
X-Received: by 2002:a5d:64e7:0:b0:437:8f98:8c91 with SMTP id
 ffacd0b85a97d-4379db34172mr14117696f8f.3.1771259094415; 
 Mon, 16 Feb 2026 08:24:54 -0800 (PST)
Received: from luca-vm.lan ([154.61.61.58]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43796a6a6desm28775962f8f.10.2026.02.16.08.24.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Feb 2026 08:24:54 -0800 (PST)
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
To: linux-mediatek@lists.infradead.org
Cc: Luca Leonardo Scorcia <l.scorcia@gmail.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Jitao Shi <jitao.shi@mediatek.com>, Fabien Parent <fparent@baylibre.com>,
 dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-phy@lists.infradead.org
Subject: [PATCH v2 2/6] dt-bindings: display: mediatek: Add compatibles for
 MediaTek mt8167
Date: Mon, 16 Feb 2026 16:22:13 +0000
Message-ID: <8f86f229e564723b424b4d621244cfbe158c0f08.1771258407.git.l.scorcia@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1771258407.git.l.scorcia@gmail.com>
References: <cover.1771258407.git.l.scorcia@gmail.com>
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[25];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:linux-mediatek@lists.infradead.org,m:l.scorcia@gmail.com,m:krzysztof.kozlowski@oss.qualcomm.com,m:chunkuang.hu@kernel.org,m:p.zabel@pengutronix.de,m:maarten.lankhorst@linux.intel.com,m:mripard@kernel.org,m:tzimmermann@suse.de,m:airlied@gmail.com,m:simona@ffwll.ch,m:robh@kernel.org,m:krzk+dt@kernel.org,m:conor+dt@kernel.org,m:chunfeng.yun@mediatek.com,m:vkoul@kernel.org,m:neil.armstrong@linaro.org,m:matthias.bgg@gmail.com,m:angelogioacchino.delregno@collabora.com,m:jitao.shi@mediatek.com,m:fparent@baylibre.com,m:devicetree@vger.kernel.org,m:linux-kernel@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-phy@lists.infradead.org,m:lscorcia@gmail.com,m:krzk@kernel.org,m:conor@kernel.org,m:matthiasbgg@gmail.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[lscorcia@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_FROM(0.00)[gmail.com];
	ARC_NA(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[lscorcia@gmail.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[gmail.com,oss.qualcomm.com,kernel.org,pengutronix.de,linux.intel.com,suse.de,ffwll.ch,mediatek.com,linaro.org,collabora.com,baylibre.com,lists.freedesktop.org,vger.kernel.org,lists.infradead.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel,dt];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,qualcomm.com:email]
X-Rspamd-Queue-Id: 66C851461A5
X-Rspamd-Action: no action

Add compatibles for various display-related blocks of MediaTek mt8167.

Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/display/mediatek/mediatek,aal.yaml    | 1 +
 .../devicetree/bindings/display/mediatek/mediatek,ccorr.yaml  | 4 +++-
 .../devicetree/bindings/display/mediatek/mediatek,dither.yaml | 1 +
 .../devicetree/bindings/display/mediatek/mediatek,gamma.yaml  | 1 +
 .../devicetree/bindings/display/mediatek/mediatek,ovl.yaml    | 1 +
 .../devicetree/bindings/display/mediatek/mediatek,rdma.yaml   | 1 +
 .../devicetree/bindings/display/mediatek/mediatek,wdma.yaml   | 4 +++-
 7 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
index daf90ebb39bf..4bbea72b292a 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,aal.yaml
@@ -33,6 +33,7 @@ properties:
           - enum:
               - mediatek,mt2712-disp-aal
               - mediatek,mt6795-disp-aal
+              - mediatek,mt8167-disp-aal
           - const: mediatek,mt8173-disp-aal
       - items:
           - enum:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
index fca8e7bb0cbc..5c5068128d0c 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ccorr.yaml
@@ -25,7 +25,9 @@ properties:
           - mediatek,mt8183-disp-ccorr
           - mediatek,mt8192-disp-ccorr
       - items:
-          - const: mediatek,mt8365-disp-ccorr
+          - enum:
+              - mediatek,mt8167-disp-ccorr
+              - mediatek,mt8365-disp-ccorr
           - const: mediatek,mt8183-disp-ccorr
       - items:
           - enum:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
index abaf27916d13..891c95be15b9 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,dither.yaml
@@ -26,6 +26,7 @@ properties:
           - mediatek,mt8183-disp-dither
       - items:
           - enum:
+              - mediatek,mt8167-disp-dither
               - mediatek,mt8186-disp-dither
               - mediatek,mt8188-disp-dither
               - mediatek,mt8192-disp-dither
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
index 48542dc7e784..ec1054bb06d4 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,gamma.yaml
@@ -28,6 +28,7 @@ properties:
       - items:
           - enum:
               - mediatek,mt6795-disp-gamma
+              - mediatek,mt8167-disp-gamma
           - const: mediatek,mt8173-disp-gamma
       - items:
           - enum:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
index 4f110635afb6..679f731f0f15 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,ovl.yaml
@@ -23,6 +23,7 @@ properties:
     oneOf:
       - enum:
           - mediatek,mt2701-disp-ovl
+          - mediatek,mt8167-disp-ovl
           - mediatek,mt8173-disp-ovl
           - mediatek,mt8183-disp-ovl
           - mediatek,mt8192-disp-ovl
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
index 878f676b581f..cb187a95c11e 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,rdma.yaml
@@ -36,6 +36,7 @@ properties:
           - enum:
               - mediatek,mt7623-disp-rdma
               - mediatek,mt2712-disp-rdma
+              - mediatek,mt8167-disp-rdma
           - const: mediatek,mt2701-disp-rdma
       - items:
           - enum:
diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
index a3a2b71a4523..816841a96133 100644
--- a/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
+++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,wdma.yaml
@@ -24,7 +24,9 @@ properties:
       - enum:
           - mediatek,mt8173-disp-wdma
       - items:
-          - const: mediatek,mt6795-disp-wdma
+          - enum:
+              - mediatek,mt6795-disp-wdma
+              - mediatek,mt8167-disp-wdma
           - const: mediatek,mt8173-disp-wdma
 
   reg:
-- 
2.43.0

