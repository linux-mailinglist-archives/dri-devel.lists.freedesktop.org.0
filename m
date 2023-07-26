Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE0D7763EEE
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jul 2023 20:50:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19D0810E4A2;
	Wed, 26 Jul 2023 18:50:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B1C10E4A2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 18:50:13 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4fe0e34f498so170405e87.2
 for <dri-devel@lists.freedesktop.org>; Wed, 26 Jul 2023 11:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690397412; x=1691002212;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dZFtPpEycyUP73hHueYUMOEZtObxKgPsuopyvRqVMTw=;
 b=YPUsaa19hOA0AaPt+cec1a/M9icU0sct9k9M+7u80F9v7iqC62zn4BOXT6WuWA3zUd
 PhKBN9ydN62UKdXDlnTQCncXScDeqkwHYMBodfIZXXmD/E7eeEq5qiy2724HOs1NBuqP
 DvuRF3dUes+PnbaHE4pkXejH3KZ1ZD3Wg4tphq0UI7xQ9GQjM5ff/55R0a27VaXrm+fj
 rSlQoGsug5ORC4EzXV/2BOf8HBcAmq1EZKQAwIvgu1C2NH/fy+NhuQ8h+BY8LK+HNFuF
 kCCm2YdHlYrASf7P+UqdCrnEZR8vb7zdt7eIuddV0gLQrYQcF6s+G47Ef0NDwtMtQk21
 2h5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690397412; x=1691002212;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dZFtPpEycyUP73hHueYUMOEZtObxKgPsuopyvRqVMTw=;
 b=hGQgk6yeY8150ACYK1oJ9LXwO3JlNYYEdTjEz6/q6ckRmXTk6afcMreqmDdF/AJyP4
 SFN22cl2eXDk9BwlZ+fLQrxPfdKrMu/z5hAKLmkDuPMQrB8vtWvlzbau7f0DA+4Bd+6x
 Kn3iqSbmYvmKx623DhsW6+SSUsCEtrwjI2VDGaMJF6Sx07h7GwlPHjXv9gOOqHoPqBWZ
 8Co+QotL+abhfzUjRhwRaeuN0rliRXlv8n/pVdIsZgKOoWJL+R2EbETDay4XP/2sUwnT
 vIKzmmJKJN1IKKBiO628LWe6B0cZkxXrw+CUlWRSoC0f+mCiN1nlf2rLy5IPgfAFVH+f
 /rIw==
X-Gm-Message-State: ABy/qLZXWzTUOG9K96jDXrW1AsZ45mKApcC7Fxis1B1ZjspFyJCr4glV
 XoxtzJYNFduV7u2JCN2VC74=
X-Google-Smtp-Source: APBJJlE+W7TOhUpEr5gF1XrOV/7mnzk+6EquVq88cSNssQjK5EMlhsYfc+/A/t1TJK0yI3B7v2Dutw==
X-Received: by 2002:a05:6512:3d0c:b0:4fb:96f3:2f4 with SMTP id
 d12-20020a0565123d0c00b004fb96f302f4mr16075lfv.51.1690397411409; 
 Wed, 26 Jul 2023 11:50:11 -0700 (PDT)
Received: from localhost
 (p200300e41f1bd600f22f74fffe1f3a53.dip0.t-ipconnect.de.
 [2003:e4:1f1b:d600:f22f:74ff:fe1f:3a53])
 by smtp.gmail.com with ESMTPSA id
 t23-20020a05640203d700b005223f398df1sm2903091edw.91.2023.07.26.11.50.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jul 2023 11:50:11 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Sam Ravnborg <sam@ravnborg.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Thierry Reding <thierry.reding@gmail.com>
Subject: [PATCH 1/3] dt-bindings: display: panel: Move Chunghwa CLAA070WP03XG
 to LVDS
Date: Wed, 26 Jul 2023 20:50:08 +0200
Message-ID: <20230726185010.2294709-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.41.0
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
Cc: linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
 Svyatoslav Ryhel <clamor95@gmail.com>, dri-devel@lists.freedesktop.org,
 Jon Hunter <jonathanh@nvidia.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

The Chunghwa CLAA070WP03XG is an LVDS panel, so move it to the correct
bindings file.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 Documentation/devicetree/bindings/display/panel/panel-lvds.yaml | 2 ++
 .../devicetree/bindings/display/panel/panel-simple.yaml         | 2 --
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
index 344e5df40c2f..dbbf32a8be87 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-lvds.yaml
@@ -40,6 +40,8 @@ properties:
     items:
       - enum:
           - auo,b101ew05
+          # Chunghwa Picture Tubes Ltd. 7" WXGA (800x1280) TFT LCD LVDS panel
+          - chunghwa,claa070wp03xg
           # HannStar Display Corp. HSD101PWW2 10.1" WXGA (1280x800) LVDS panel
           - hannstar,hsd101pww2
           - tbs,a711-panel
diff --git a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
index f4d9da4afefd..67959290b212 100644
--- a/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
+++ b/Documentation/devicetree/bindings/display/panel/panel-simple.yaml
@@ -103,8 +103,6 @@ properties:
       - cdtech,s070wv95-ct16
         # Chefree CH101OLHLWH-002 10.1" (1280x800) color TFT LCD panel
       - chefree,ch101olhlwh-002
-        # Chunghwa Picture Tubes Ltd. 7" WXGA TFT LCD panel
-      - chunghwa,claa070wp03xg
         # Chunghwa Picture Tubes Ltd. 10.1" WXGA TFT LCD panel
       - chunghwa,claa101wa01a
         # Chunghwa Picture Tubes Ltd. 10.1" WXGA TFT LCD panel
-- 
2.41.0

