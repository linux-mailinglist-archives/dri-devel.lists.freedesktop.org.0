Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 643FE7D4436
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 02:46:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8079610E27A;
	Tue, 24 Oct 2023 00:46:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from madras.collabora.co.uk (madras.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DAE910E27A
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Oct 2023 00:46:55 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2804:14d:e646:872b:1c98:7e30:3cb0:3153])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested) (Authenticated sender: koike)
 by madras.collabora.co.uk (Postfix) with ESMTPSA id E4B7566072A7;
 Tue, 24 Oct 2023 01:46:49 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
 s=mail; t=1698108414;
 bh=oDu2b92asyQScoXwVX/AR6Q3MwzRzsA7i8kOKu/ClnQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Dc1QzgQb+5Fhbv34veXa1B676uaE7n1jDFN0wOVrdN6njKYFhfpT9kO+yGt/0KKAG
 au0mj2HOa1atu1lev2fF7efePhMb3x5wSulmbV5H601fdp5z/SMbFpHUi/mJGmWZlg
 4J64w0byHrCZsKHYn8Ea0HOEPYv1dSvHIv6eMEURZcJs3C3TU3UE3tj/tg1/spBCP8
 ZeEH3Y8aWgemskXSiYAcdlqrlAW/8tZcJU77dih/V0Iz3OUtodRuPam/KWwyKaH8bu
 shb3Gj2pdrmtl6DPzWDhpi3JCIRSRadOWRWY5dcPX5V9ld8gEScpRxUZBRqqNSUbYr
 uu0orsliH2Wiw==
From: Helen Koike <helen.koike@collabora.com>
To: dri-devel@lists.freedesktop.org, Helen Koike <helen.koike@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 07/10] drm/ci: increase i915 job timeout to 1h30m
Date: Mon, 23 Oct 2023 21:45:22 -0300
Message-Id: <20231024004525.169002-8-helen.koike@collabora.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231024004525.169002-1-helen.koike@collabora.com>
References: <20231024004525.169002-1-helen.koike@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: robdclark@chromium.org, daniels@collabora.com, vignesh.raman@collabora.com,
 guilherme.gallo@collabora.com, sergi.blanch.torne@collabora.com,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 david.heidelberg@collabora.com, dmitry.baryshkov@linaro.org,
 quic_jesszhan@quicinc.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With the new sharding, the default job timeout is not enough for i915
and their jobs are failing before completing.

See below the current execution time:

🞋 job i915:tgl 8/8 has new status: success (37m3s)
🞋 job i915:tgl 7/8 has new status: success (19m43s)
🞋 job i915:tgl 6/8 has new status: success (21m47s)
🞋 job i915:tgl 5/8 has new status: success (18m16s)
🞋 job i915:tgl 4/8 has new status: success (21m43s)
🞋 job i915:tgl 3/8 has new status: success (17m59s)
🞋 job i915:tgl 2/8 has new status: success (22m15s)
🞋 job i915:tgl 1/8 has new status: success (18m52s)
🞋 job i915:cml 2/2 has new status: success (1h19m58s)
🞋 job i915:cml 1/2 has new status: success (55m45s)
🞋 job i915:whl 2/2 has new status: success (1h8m56s)
🞋 job i915:whl 1/2 has new status: success (54m3s)
🞋 job i915:kbl 3/3 has new status: success (37m43s)
🞋 job i915:kbl 2/3 has new status: success (36m37s)
🞋 job i915:kbl 1/3 has new status: success (34m52s)
🞋 job i915:amly 2/2 has new status: success (1h7m60s)
🞋 job i915:amly 1/2 has new status: success (59m18s)
🞋 job i915:glk 2/2 has new status: success (58m26s)
🞋 job i915:glk 1/2 has new status: success (50m23s)
🞋 job i915:apl 3/3 has new status: success (1h6m39s)
🞋 job i915:apl 2/3 has new status: success (1h4m45s)
🞋 job i915:apl 1/3 has new status: success (1h7m38s)

(generated with ci_run_n_monitor.py script)

The longest job is 1h19m58s, so adjust the timeout.

Signed-off-by: Helen Koike <helen.koike@collabora.com>

---

v3:
- new patch
---
 drivers/gpu/drm/ci/test.yml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/ci/test.yml b/drivers/gpu/drm/ci/test.yml
index 19dc0862e710..f285ed67eb3d 100644
--- a/drivers/gpu/drm/ci/test.yml
+++ b/drivers/gpu/drm/ci/test.yml
@@ -179,6 +179,7 @@ i915:apl:
   extends:
     - .i915
   parallel: 3
+  timeout: "1h30m"
   variables:
     DEVICE_TYPE: asus-C523NA-A20057-coral
     GPU_VERSION: apl
@@ -188,6 +189,7 @@ i915:glk:
   extends:
     - .i915
   parallel: 2
+  timeout: "1h30m"
   variables:
     DEVICE_TYPE: hp-x360-12b-ca0010nr-n4020-octopus
     GPU_VERSION: glk
@@ -197,6 +199,7 @@ i915:amly:
   extends:
     - .i915
   parallel: 2
+  timeout: "1h30m"
   variables:
     DEVICE_TYPE: asus-C433TA-AJ0005-rammus
     GPU_VERSION: amly
@@ -215,6 +218,7 @@ i915:whl:
   extends:
     - .i915
   parallel: 2
+  timeout: "1h30m"
   variables:
     DEVICE_TYPE: dell-latitude-5400-8665U-sarien
     GPU_VERSION: whl
@@ -224,6 +228,7 @@ i915:cml:
   extends:
     - .i915
   parallel: 2
+  timeout: "1h30m"
   variables:
     DEVICE_TYPE: asus-C436FA-Flip-hatch
     GPU_VERSION: cml
-- 
2.39.2

