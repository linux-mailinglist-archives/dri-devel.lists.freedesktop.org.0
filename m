Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EBE147B307
	for <lists+dri-devel@lfdr.de>; Mon, 20 Dec 2021 19:42:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 02391113614;
	Mon, 20 Dec 2021 18:42:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from ixit.cz (ixit.cz [94.230.151.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34821113636
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Dec 2021 18:42:30 +0000 (UTC)
Received: from localhost.localdomain (ip-89-176-96-70.net.upcbroadband.cz
 [89.176.96.70])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by ixit.cz (Postfix) with ESMTPSA id 3B95C24CB8;
 Mon, 20 Dec 2021 19:42:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ixit.cz; s=dkim;
 t=1640025744;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding;
 bh=8lLaEbe6zO/dNVFXETC3vvS91flMZIkSgtxhlgijaBI=;
 b=O/nTMXOh0L4yVt/ba+OTySWFCswCAWyMwcQiTsXiuiSwtHUCMCvKbEIPq0RpfUY6+wiluB
 FNhhU7d37vVrmYSG9aYvR7Yx5750HAHxgf8BSzPaBNe+xP46z6VMLqIlYOyiQXBGXX/aAx
 45YnzSIb1qRgb8+JAv3TAe0V0Kqs8b4=
From: David Heidelberg <david@ixit.cz>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <mkrishn@codeaurora.org>
Subject: [PATCH] dt-bindings: msm: disp: remove bus from dpu bindings
Date: Mon, 20 Dec 2021 19:42:20 +0100
Message-Id: <20211220184220.86328-1-david@ixit.cz>
X-Mailer: git-send-email 2.34.1
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Heidelberg <david@ixit.cz>, freedreno@lists.freedesktop.org,
 ~okias/devicetree@lists.sr.ht
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Driver and dts has been already adjusted and bus moved out of dpu, let's
update also dt-bindings.

Fixes warnings as:
arch/arm64/boot/dts/qcom/sdm845-oneplus-fajita.dt.yaml: mdss
@ae00000: clock-names: ['iface', 'core'] is too short
        From schema: Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml

Ref: https://lore.kernel.org/all/20210803101657.1072358-1-dmitry.baryshkov@linaro.org/

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../devicetree/bindings/display/msm/dpu-sdm845.yaml          | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
index b4ea7c92fb3d..0dca4b3d66e4 100644
--- a/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dpu-sdm845.yaml
@@ -31,13 +31,11 @@ properties:
   clocks:
     items:
       - description: Display AHB clock from gcc
-      - description: Display AXI clock
       - description: Display core clock
 
   clock-names:
     items:
       - const: iface
-      - const: bus
       - const: core
 
   interrupts:
@@ -160,9 +158,8 @@ examples:
           power-domains = <&dispcc MDSS_GDSC>;
 
           clocks = <&gcc GCC_DISP_AHB_CLK>,
-                   <&gcc GCC_DISP_AXI_CLK>,
                    <&dispcc DISP_CC_MDSS_MDP_CLK>;
-          clock-names = "iface", "bus", "core";
+          clock-names = "iface", "core";
 
           interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
           interrupt-controller;
-- 
2.34.1

