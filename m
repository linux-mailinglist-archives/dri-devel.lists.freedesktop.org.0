Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 42BBA6BCC7A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Mar 2023 11:20:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D76AA10EC45;
	Thu, 16 Mar 2023 10:20:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF6EB10EC45
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Mar 2023 10:20:49 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it
 [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: kholk11)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E845C66030A0;
 Thu, 16 Mar 2023 10:20:47 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1678962048;
 bh=vym02gfUeFtMkZA43yUlFdqpHJiV8QIzeChJfzjI5R4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kpuX2RQEQblFvVlA7uJOEnSjVUFXexzWEE/YHcNPmudmm7wBcVbhDyeCcz0HytihH
 QYyQvyV1KUPfBuFYVRXjYBWitRc1/PDQVEoJ3NwwBdlagUZLljRznoSR9VBltb115K
 sSIb8uAvevtYftC68I6ie/HvBHpjGLp3GDzeN7VwZC6QKZwBs4Tt7akIlqvaMdGgYg
 9wUqlcy4JrZGu5PCvcsn45YWj80jUHqUoSXEnH5CVmUYUyB+TJ0mXOdlNvGbaRPTqq
 i442BMbVucu3fEyfzp45+wMpBVdKbUA54NgVaZfU3/d60oaM7ykeJnezgsvJAa97lk
 5ZmtnXLNoHEhA==
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: airlied@gmail.com
Subject: [PATCH v5 03/12] dt-bindings: gpu: mali-bifrost: Fix
 power-domain-names validation
Date: Thu, 16 Mar 2023 11:20:32 +0100
Message-Id: <20230316102041.210269-4-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230316102041.210269-1-angelogioacchino.delregno@collabora.com>
References: <20230316102041.210269-1-angelogioacchino.delregno@collabora.com>
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
Tested-by: Chen-Yu Tsai <wenst@chromium.org>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/gpu/arm,mali-bifrost.yaml          | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
index 5b7f1c9d2b30..7c61524aae26 100644
--- a/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
+++ b/Documentation/devicetree/bindings/gpu/arm,mali-bifrost.yaml
@@ -65,6 +65,10 @@ properties:
     minItems: 1
     maxItems: 5
 
+  power-domain-names:
+    minItems: 2
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

