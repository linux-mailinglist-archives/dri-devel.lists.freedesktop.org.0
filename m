Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 188217BD17F
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 02:51:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6E6A10E215;
	Mon,  9 Oct 2023 00:51:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B92D10E210
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 00:51:51 +0000 (UTC)
Received: from localhost.localdomain (unknown [179.221.49.143])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id 82C3D660708F;
 Mon,  9 Oct 2023 01:51:45 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1696812709;
 bh=YlrmObl+V8+O2Q33dquJjN5GhRz2SQOuwYCfJfNcc7I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FtqphMBUdFwBMxT9NMJHCOYt83yRevFAXF4cXCVRgMLPIsstGSfuQfg64gpL9qNUf
 oNX28wx6u51TdtOgB/oxjFy5eV2unDl6lO7Ox+c5MJZSwRFlAT2zt4GqFKfQGzFcpf
 x4vlvtW1pOVS9pOBK9L05SFxeGpPn9M3Cbm5yNZeKroDFdLwdPj6/wA9cAXpItxLBj
 EevAyZpxDaHSW+GgEqoeel6UB7F4LAtGSDwln5QPZMKhBn28usQADZ2DqT1NDzlAia
 X9A5Z5QQH7S0L33fkbtOMZWZafI543uTQSLjwumQQTjx6lT7iYGlO8GFV7gUmFw7T7
 K8h3oBxlSwDtQ==
From: Helen Koike <helen.koike@collabora.com>
To: Helen Koike <helen.koike@collabora.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 6/9] drm/ci: adjust the number of shards
Date: Sun,  8 Oct 2023 21:49:51 -0300
Message-Id: <20231009004953.203576-7-helen.koike@collabora.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231009004953.203576-1-helen.koike@collabora.com>
References: <20231009004953.203576-1-helen.koike@collabora.com>
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
Cc: robdclark@chromium.org, vignesh.raman@collabora.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, david.heidelberg@collabora.com,
 dmitry.baryshkov@linaro.org, quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Adjust the number of shards to the number of available devices in the
farm.

Signed-off-by: Helen Koike <helen.koike@collabora.com>
---
 drivers/gpu/drm/ci/test.yml | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 3479d2a0108d..a94af2f99d75 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -155,7 +155,7 @@ rockchip:rk3399:
   extends:
     - .lava-igt:arm64
   stage: rockchip
-  parallel: 3
+  parallel: 4
   variables:
     DRIVER_NAME: rockchip
     DEVICE_TYPE: rk3399-gru-kevin
@@ -178,7 +178,7 @@ rockchip:rk3399:
 i915:apl:
   extends:
     - .i915
-  parallel: 12
+  parallel: 6
   variables:
     DEVICE_TYPE: asus-C523NA-A20057-coral
     GPU_VERSION: apl
@@ -187,7 +187,7 @@ i915:apl:
 i915:glk:
   extends:
     - .i915
-  parallel: 5
+  parallel: 4
   variables:
     DEVICE_TYPE: hp-x360-12b-ca0010nr-n4020-octopus
     GPU_VERSION: glk
@@ -196,7 +196,7 @@ i915:glk:
 i915:amly:
   extends:
     - .i915
-  parallel: 8
+  parallel: 5
   variables:
     DEVICE_TYPE: asus-C433TA-AJ0005-rammus
     GPU_VERSION: amly
@@ -205,7 +205,7 @@ i915:amly:
 i915:kbl:
   extends:
     - .i915
-  parallel: 5
+  parallel: 6
   variables:
     DEVICE_TYPE: hp-x360-14-G1-sona
     GPU_VERSION: kbl
@@ -214,7 +214,7 @@ i915:kbl:
 i915:whl:
   extends:
     - .i915
-  parallel: 8
+  parallel: 4
   variables:
     DEVICE_TYPE: dell-latitude-5400-8665U-sarien
     GPU_VERSION: whl
@@ -223,7 +223,7 @@ i915:whl:
 i915:cml:
   extends:
     - .i915
-  parallel: 6
+  parallel: 5
   variables:
     DEVICE_TYPE: asus-C436FA-Flip-hatch
     GPU_VERSION: cml
@@ -251,6 +251,7 @@ i915:tgl:
 amdgpu:stoney:
   extends:
     - .amdgpu
+  parallel: 2
   variables:
     DEVICE_TYPE: hp-11A-G6-EE-grunt
     GPU_VERSION: stoney
-- 
2.34.1

