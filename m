Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DBBF1F6420
	for <lists+dri-devel@lfdr.de>; Thu, 11 Jun 2020 10:59:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A40E56E8B6;
	Thu, 11 Jun 2020 08:59:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F8E36E8B6
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 08:59:29 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id l26so4230181wme.3
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Jun 2020 01:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Vkpecle/NufRhIWFw6o8Icsy3Vg8yQBJnNwa3m6TOrY=;
 b=B5T4TeklMK2kiPUFPKuuVP7i4B9RaICOLmQ0X69pyuhRLLiYf66zl/t9yQbxri1F6x
 hhbN1Jtyz6XDvHQJMaZWpIo6w1GL4iKvhxLlinIrodsKoW2vSITvlTkWlfvkbvMvowKg
 FruLct+0aI/LfplSLqucAjJdDDa1Fq+j5pd/kuutGlFTwNx39exJ1+LtTp5exE1Q5XjG
 GaIrWDswsYmKIR11ri1CuhU3/PQRJHSzO6qOn+g+dSIE6/DT4553GanI+L0rcD13XLcn
 okgjyULRPyGPAFBnD/VaWjNnk/WDAPPFzueKAwimNMBfDm4+OQxPB4rjioBVVmASEHgs
 T0CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=Vkpecle/NufRhIWFw6o8Icsy3Vg8yQBJnNwa3m6TOrY=;
 b=nU68kTwsiHHUWIglA3qxEpq1KHW1GwoRH/yzxoPK5rqcTH82vFI5w5f23OLyOttWih
 K1gp0IemuGy7bHjH94aIOsCBjcl4QGFp1kC28E7jgeRYfj9az9uOywPgWXynwnBt8lIZ
 KqKBuwBeRZ5ME+Yeqwf6aAiSVNL8HESsP/a8QOFJrA9tDCej+g8+Om6wkDl3TZRTfxdT
 f5YmaZmPvaneIs23HcGZVwSM3g+5e6JNFSn0+ZGaGxbD0EII1IksGnPHOcyAL6+t9s/d
 cCQTwr0PJ4DTrsEKicS3m4UkJPX/cOUD4HgtZDjc95s/bSxJrNflui0pZHPSU2oCLqiB
 0aMg==
X-Gm-Message-State: AOAM5306I1OgfKRex6F/GVejEiu80LvAS33Ky1q/PGAGWiPdu8aFhHhq
 bet5opsqxawcf3cC36KKH70TYVXP
X-Google-Smtp-Source: ABdhPJwa3GUi28/rl/kCJZRru/8f/xiKju5uiGyA5/rHbxua8XuJbAeq6aH2xxRhczSk1eclm+DSMQ==
X-Received: by 2002:a1c:7414:: with SMTP id p20mr7011193wmc.124.1591865968099; 
 Thu, 11 Jun 2020 01:59:28 -0700 (PDT)
Received: from cizrna.lan ([109.72.12.141])
 by smtp.gmail.com with ESMTPSA id o20sm4205023wra.29.2020.06.11.01.59.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jun 2020 01:59:27 -0700 (PDT)
From: Tomeu Vizoso <tomeu.vizoso@collabora.com>
To: LKML <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/2] panfrost: Make sure GPU is powered on when reading
 GPU_LATEST_FLUSH_ID
Date: Thu, 11 Jun 2020 10:58:43 +0200
Message-Id: <20200611085900.49740-1-tomeu.vizoso@collabora.com>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
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
Cc: Tomeu Vizoso <tomeu.vizoso@collabora.com>, David Airlie <airlied@linux.ie>,
 dri-devel@lists.freedesktop.org, Steven Price <steven.price@arm.com>,
 Alyssa Rosenzweig <alyssa.rosenzweig@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Bifrost devices do support the flush reduction feature, so on first job
submit we were trying to read the register while still powered off.

If the GPU is powered off, the feature doesn't bring any benefit, so
don't try to read.

Signed-off-by: Tomeu Vizoso <tomeu.vizoso@collabora.com>
---
 drivers/gpu/drm/panfrost/panfrost_gpu.c | 14 ++++++++++++--
 1 file changed, 12 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/panfrost/panfrost_gpu.c b/drivers/gpu/drm/panfrost/panfrost_gpu.c
index f2c1ddc41a9b..e0f190e43813 100644
--- a/drivers/gpu/drm/panfrost/panfrost_gpu.c
+++ b/drivers/gpu/drm/panfrost/panfrost_gpu.c
@@ -10,6 +10,7 @@
 #include <linux/io.h>
 #include <linux/iopoll.h>
 #include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
 
 #include "panfrost_device.h"
 #include "panfrost_features.h"
@@ -368,7 +369,16 @@ void panfrost_gpu_fini(struct panfrost_device *pfdev)
 
 u32 panfrost_gpu_get_latest_flush_id(struct panfrost_device *pfdev)
 {
-	if (panfrost_has_hw_feature(pfdev, HW_FEATURE_FLUSH_REDUCTION))
-		return gpu_read(pfdev, GPU_LATEST_FLUSH_ID);
+	u32 flush_id;
+
+	if (panfrost_has_hw_feature(pfdev, HW_FEATURE_FLUSH_REDUCTION)) {
+		/* Flush reduction only makes sense when the GPU is kept powered on between jobs */
+		if (pm_runtime_get_if_in_use(pfdev->dev)) {
+			flush_id = gpu_read(pfdev, GPU_LATEST_FLUSH_ID);
+			pm_runtime_put(pfdev->dev);
+			return flush_id;
+		}
+	}
+
 	return 0;
 }
-- 
2.21.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
