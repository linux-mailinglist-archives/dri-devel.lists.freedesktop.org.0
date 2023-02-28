Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A5316A56B9
	for <lists+dri-devel@lfdr.de>; Tue, 28 Feb 2023 11:27:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13BE610E67A;
	Tue, 28 Feb 2023 10:27:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02FE010E674
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Feb 2023 10:27:13 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 01DB46602FDA;
 Tue, 28 Feb 2023 10:27:10 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1677580031;
 bh=IUwSDoZ0KzMAk6G35a7rYGldsO2EXTi5ixj8lVj11EM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=S8Eds0pn6StacRidqZGXiX9a612WEx1EH26yZRBqyAP74bbjvEgbKJTpWdOVcnk3k
 4r21SW3n48f0VBiyTwGIMgLDxASk32LY0CqLzSnmqnjm42qDhDoeqk8iAPNmrduvsq
 8oMChUnwHmO324BfRJ76hwV4dyh06bEzl2scsCSGpXxcvulEoUuJsaIQ9mdrF4iBz/
 Nwd3CqURq4E5cOg2w8vAp0ltFLi5qLNJ8ORVj12bTXXbitwOKIMHxp4OWFGjRZoSfe
 C+FfmzyBZ0qR6J+qwkGC6Xd7VFmGt0lNygeNbG/qRRvaiG5dVPP0pu2Z/BzKog21T7
 1V5sIotQniwjQ==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: airlied@gmail.com
Subject: [PATCH v4 03/12] dt-bindings: gpu: mali-bifrost: Fix
 power-domain-names validation
Date: Tue, 28 Feb 2023 11:26:55 +0100
Message-Id: <20230228102704.708150-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230228102704.708150-1-angelogioacchino.delregno@collabora.com>
References: <20230228102704.708150-1-angelogioacchino.delregno@collabora.com>
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
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, steven.price@arm.com, robh+dt@kernel.org,
 linux-mediatek@lists.infradead.org, alyssa.rosenzweig@collabora.com,
 krzysztof.kozlowski+dt@linaro.org, wenst@chromium.org, matthias.bgg@gmail.com,
 linux-arm-kernel@lists.infradead.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Commit ("dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183")
incorrectly introduced power domain names for MT8183, causing
validation issues.

Add power-domain-names to the base schema, allowing a maximum of
five elements; since platforms having a single power domain don't
need any actual domain name, disallow that for each sub-schema.

Fixes: a7a596cd3115 ("dt-bindings: gpu: mali-bifrost: Add Mediatek MT8183")
Signed-off-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
---
 .../devicetree/bindings/gpu/arm,mali-bifrost.yaml          | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 5b7f1c9d2b30..bf0f7f1f71e0 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -65,6 +65,10 @@ properties:
     minItems: 1
     maxItems: 5
 
+  power-domain-names:
+    minItems: 1
+    maxItems: 5
+
   resets:
     minItems: 1
     maxItems: 3
@@ -112,6 +116,7 @@ allOf:
       properties:
         power-domains:
           maxItems: 1
+        power-domain-names: false
       required:
         - resets
   - if:
@@ -136,6 +141,7 @@ allOf:
             - const: bus_ace
         power-domains:
           maxItems: 1
+        power-domain-names: false
         resets:
           minItems: 3
         reset-names:
@@ -186,6 +192,7 @@ allOf:
             - const: bus
         power-domains:
           maxItems: 1
+        power-domain-names: false
       required:
         - clock-names
 
-- 
2.39.2

