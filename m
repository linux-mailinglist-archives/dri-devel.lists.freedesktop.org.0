Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EA82AD9465
	for <lists+dri-devel@lfdr.de>; Fri, 13 Jun 2025 20:27:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73FC910E8F3;
	Fri, 13 Jun 2025 18:27:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="eYMjH+Py";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 570C110E8F3;
 Fri, 13 Jun 2025 18:27:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Jw6eTSGfc4LaSGLZJqS1CUGcSRHDcI0cmlisVpdZ69E=; b=eYMjH+Pysm5yO3qLIkENlqwKrC
 0C0wl7zz5jYJQwc7wvrINNDlammEszgL63jIdHnpa1Ri2Nm8cKWVmLCkWUrwqzrVtyMpsdxdsW9+V
 HUSqC4wCt2aTfAcn5QsU90+6BaF2RBXC1QbEGjZHsrmFAWyVyLczDS7B+89hdpO3WvV0xnVANax01
 gYJZHAVeN1xD5MXem9aRLfwxkaD0PJO8uxt9qTLBqcVuQ3qxlAg0rDeH7vHiwD/yQ+hMtHHiV+oS4
 c0q2tgmAdiCW/cFcYVdPneR0sIz5KAXFdP2YUua4mwVrzDqbdg/HJijUc5JB1rDpOby8gcgVXdVkb
 R4Vq1UQg==;
Received: from [191.204.192.64] (helo=localhost.localdomain)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1uQ97I-0039wK-GK; Fri, 13 Jun 2025 20:27:04 +0200
From: =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
To: "Alex Deucher" <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 =?UTF-8?q?Andr=C3=A9=20Almeida?= <andrealmeid@igalia.com>
Subject: [PATCH 1/2] drm/amd: Do not include <linux/export.h> when unused
Date: Fri, 13 Jun 2025 15:26:50 -0300
Message-ID: <20250613182651.1758760-2-andrealmeid@igalia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613182651.1758760-1-andrealmeid@igalia.com>
References: <20250613182651.1758760-1-andrealmeid@igalia.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix the following compile time warning when building with W=1:

warning: EXPORT_SYMBOL() is not used, but #include <linux/export.h> is present

Signed-off-by: André Almeida <andrealmeid@igalia.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c      | 1 -
 drivers/gpu/drm/amd/amdkfd/kfd_chardev.c     | 1 -
 drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c | 1 -
 3 files changed, 3 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c
index 8179d0814db9..57101d24422f 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_i2c.c
@@ -24,7 +24,6 @@
  *          Alex Deucher
  */
 
-#include <linux/export.h>
 #include <linux/pci.h>
 
 #include <drm/drm_edid.h>
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
index a2149afa5803..828a9ceef1e7 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_chardev.c
@@ -22,7 +22,6 @@
  */
 
 #include <linux/device.h>
-#include <linux/export.h>
 #include <linux/err.h>
 #include <linux/fs.h>
 #include <linux/file.h>
diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c b/drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c
index dbcb60eb54b2..1d170dc50df3 100644
--- a/drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c
+++ b/drivers/gpu/drm/amd/amdkfd/kfd_flat_memory.c
@@ -23,7 +23,6 @@
  */
 
 #include <linux/device.h>
-#include <linux/export.h>
 #include <linux/err.h>
 #include <linux/fs.h>
 #include <linux/sched.h>
-- 
2.49.0

