Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B66A1A57FE3
	for <lists+dri-devel@lfdr.de>; Sun,  9 Mar 2025 00:44:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6782410E0A0;
	Sat,  8 Mar 2025 23:44:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="otgD3b0c";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44AEC10E0A0
 for <dri-devel@lists.freedesktop.org>; Sat,  8 Mar 2025 23:44:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=PRNBdzFOkXTmT7dggCnLiOeBjPIbxamWaZHWg1YH34k=; b=otgD3b0cb2aOpsT0
 WKxWiPHF5ZlEABWoPsGTtyw6yK/Pk0t2DDmHfAdeBOUItOdWsw7XcHcWSbgNr31wsnwmvWRol3HXC
 pInLM2hoE9iQlNThDX7p5x/bEpvIlY6ChqcFRiBGx5ZI8SgDAMP3pXaqu+tqPguhYtdHEv5LDOGh3
 x/YhS0risjIKAey37wUSxJQdAwTiUpEvi2C7YLP5iGTv9F75Om6yt/lbhJh5ZHyzJpEWJL5UP4QiZ
 xSeRGnpzxwEW0+HvAc4OhSUnITezQBlYg6qyt9ziNyPv9crmvLrsep4FkT+3YiHmdP++a3G10NYq3
 W6/n2a7trbWve+xfHg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1tr3pl-003f0E-08;
 Sat, 08 Mar 2025 23:43:57 +0000
From: linux@treblig.org
To: patrik.r.jakobsson@gmail.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de
Cc: airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] drm/gma500/psb_intel_modes: Remove unused psb_intel_ddc_probe
Date: Sat,  8 Mar 2025 23:43:56 +0000
Message-ID: <20250308234356.255114-1-linux@treblig.org>
X-Mailer: git-send-email 2.48.1
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

psb_intel_ddc_probe() was added in 2011 by
commit 89c78134cc54 ("gma500: Add Poulsbo support")
but has remained unused (probably because drm_get_edid is used
instead).

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/gma500/psb_intel_drv.h   |  1 -
 drivers/gpu/drm/gma500/psb_intel_modes.c | 31 ------------------------
 2 files changed, 32 deletions(-)

diff --git a/drivers/gpu/drm/gma500/psb_intel_drv.h b/drivers/gpu/drm/gma500/psb_intel_drv.h
index 2499fd6a80c9..d80f2d0b712e 100644
--- a/drivers/gpu/drm/gma500/psb_intel_drv.h
+++ b/drivers/gpu/drm/gma500/psb_intel_drv.h
@@ -182,7 +182,6 @@ struct gma_i2c_chan *gma_i2c_create(struct drm_device *dev, const u32 reg,
 void gma_i2c_destroy(struct gma_i2c_chan *chan);
 int psb_intel_ddc_get_modes(struct drm_connector *connector,
 			    struct i2c_adapter *adapter);
-extern bool psb_intel_ddc_probe(struct i2c_adapter *adapter);
 
 extern void psb_intel_crtc_init(struct drm_device *dev, int pipe,
 			    struct psb_intel_mode_device *mode_dev);
diff --git a/drivers/gpu/drm/gma500/psb_intel_modes.c b/drivers/gpu/drm/gma500/psb_intel_modes.c
index 8be0ec340de5..45b10f30a2a9 100644
--- a/drivers/gpu/drm/gma500/psb_intel_modes.c
+++ b/drivers/gpu/drm/gma500/psb_intel_modes.c
@@ -11,37 +11,6 @@
 
 #include "psb_intel_drv.h"
 
-/**
- * psb_intel_ddc_probe
- * @adapter:   Associated I2C adaptor
- */
-bool psb_intel_ddc_probe(struct i2c_adapter *adapter)
-{
-	u8 out_buf[] = { 0x0, 0x0 };
-	u8 buf[2];
-	int ret;
-	struct i2c_msg msgs[] = {
-		{
-		 .addr = 0x50,
-		 .flags = 0,
-		 .len = 1,
-		 .buf = out_buf,
-		 },
-		{
-		 .addr = 0x50,
-		 .flags = I2C_M_RD,
-		 .len = 1,
-		 .buf = buf,
-		 }
-	};
-
-	ret = i2c_transfer(adapter, msgs, 2);
-	if (ret == 2)
-		return true;
-
-	return false;
-}
-
 /**
  * psb_intel_ddc_get_modes - get modelist from monitor
  * @connector: DRM connector device to use
-- 
2.48.1

