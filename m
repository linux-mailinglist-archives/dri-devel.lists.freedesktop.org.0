Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9779897E496
	for <lists+dri-devel@lfdr.de>; Mon, 23 Sep 2024 03:25:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 13BA910E359;
	Mon, 23 Sep 2024 01:25:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=treblig.org header.i=@treblig.org header.b="Y59K7PX4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8901E10E359;
 Mon, 23 Sep 2024 01:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
 ; s=bytemarkmx;
 h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
 :Subject; bh=Kc9zefA0QswG8gCmJgyLW5CUDw57gg8nkHoO6NYXt7k=; b=Y59K7PX4yi5wXvuT
 d3Jt+iWNwUU/7nb1YkuN5P/ehVQgu8Aq5K3qnsr35Cbbls12+bG3Jb9UuFL1H+fmUJEZsHHKtX2ta
 Q7iakA5ZMCgYtcwdVK1UEPRLR/gQx/n7H4NCSsBdeEZXlX36M/Dh5YGUUKzpIhRIQT8/k1wxy7hdO
 uSl7o1HURYQxH6x9n7sye5Kd6otF6STv+TknDHBGXo4uymjz51HU29R0aoxpmVpLjhdl8GbHUCcrj
 gebo5MBfHQQSYaS5IYgldpcJiMiqsn32lNNVAVBs1lpmiVPaFD+HKAPE7+sxkDF9rU3BpkpHqhHSy
 ZvO2diVG4x6KFsFoTg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
 by mx.treblig.org with esmtp (Exim 4.96)
 (envelope-from <linux@treblig.org>) id 1ssXoz-006k2k-2F;
 Mon, 23 Sep 2024 01:25:01 +0000
From: linux@treblig.org
To: alexander.deucher@amd.com,
	christian.koenig@amd.com,
	Xinhui.Pan@amd.com
Cc: airlied@gmail.com, simona@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 5/5] drm/amdgpu: Remove unused amdgpu_i2c functions
Date: Mon, 23 Sep 2024 02:24:46 +0100
Message-ID: <20240923012446.4965-6-linux@treblig.org>
X-Mailer: git-send-email 2.46.1
In-Reply-To: <20240923012446.4965-1-linux@treblig.org>
References: <20240923012446.4965-1-linux@treblig.org>
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

amdgpu_i2c_add and amdgpu_i2c_init were added in 2015's commit
d38ceaf99ed0 ("drm/amdgpu: add core driver (v4)")
but never used.

Remove them.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c | 25 -------------------------
 drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.h |  4 ----
 2 files changed, 29 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c
index 00d6211e0fbf..f0765ccde668 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c
@@ -225,15 +225,6 @@ void amdgpu_i2c_destroy(struct amdgpu_i2c_chan *i2c)
 	kfree(i2c);
 }
 
-/* Add the default buses */
-void amdgpu_i2c_init(struct amdgpu_device *adev)
-{
-	if (amdgpu_hw_i2c)
-		DRM_INFO("hw_i2c forced on, you may experience display detection problems!\n");
-
-	amdgpu_atombios_i2c_init(adev);
-}
-
 /* remove all the buses */
 void amdgpu_i2c_fini(struct amdgpu_device *adev)
 {
@@ -247,22 +238,6 @@ void amdgpu_i2c_fini(struct amdgpu_device *adev)
 	}
 }
 
-/* Add additional buses */
-void amdgpu_i2c_add(struct amdgpu_device *adev,
-		    const struct amdgpu_i2c_bus_rec *rec,
-		    const char *name)
-{
-	struct drm_device *dev = adev_to_drm(adev);
-	int i;
-
-	for (i = 0; i < AMDGPU_MAX_I2C_BUS; i++) {
-		if (!adev->i2c_bus[i]) {
-			adev->i2c_bus[i] = amdgpu_i2c_create(dev, rec, name);
-			return;
-		}
-	}
-}
-
 /* looks up bus based on id */
 struct amdgpu_i2c_chan *
 amdgpu_i2c_lookup(struct amdgpu_device *adev,
diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.h
index 63c2ff7499e1..21e3d1dad0a1 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.h
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.h
@@ -28,11 +28,7 @@ struct amdgpu_i2c_chan *amdgpu_i2c_create(struct drm_device *dev,
 					  const struct amdgpu_i2c_bus_rec *rec,
 					  const char *name);
 void amdgpu_i2c_destroy(struct amdgpu_i2c_chan *i2c);
-void amdgpu_i2c_init(struct amdgpu_device *adev);
 void amdgpu_i2c_fini(struct amdgpu_device *adev);
-void amdgpu_i2c_add(struct amdgpu_device *adev,
-		    const struct amdgpu_i2c_bus_rec *rec,
-		    const char *name);
 struct amdgpu_i2c_chan *
 amdgpu_i2c_lookup(struct amdgpu_device *adev,
 		  const struct amdgpu_i2c_bus_rec *i2c_bus);
-- 
2.46.1

