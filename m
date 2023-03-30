Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 136426D04E7
	for <lists+dri-devel@lfdr.de>; Thu, 30 Mar 2023 14:38:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A388610E2E6;
	Thu, 30 Mar 2023 12:38:12 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from 189.cn (ptr.189.cn [183.61.185.103])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0E6D810E2E6
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Mar 2023 12:38:11 +0000 (UTC)
HMM_SOURCE_IP: 10.64.8.43:54074.551065922
HMM_ATTACHE_NUM: 0000
HMM_SOURCE_TYPE: SMTP
Received: from clientip-114.242.206.180 (unknown [10.64.8.43])
 by 189.cn (HERMES) with SMTP id 5FC191001C8;
 Thu, 30 Mar 2023 20:38:08 +0800 (CST)
Received: from  ([114.242.206.180])
 by gateway-151646-dep-7b48884fd-tj646 with ESMTP id
 ca8e25cfaddb47b390d8dd18937cd7e5 for airlied@gmail.com; 
 Thu, 30 Mar 2023 20:38:09 CST
X-Transaction-ID: ca8e25cfaddb47b390d8dd18937cd7e5
X-Real-From: 15330273260@189.cn
X-Receive-IP: 114.242.206.180
X-MEDUSA-Status: 0
From: Sui Jingfeng <15330273260@189.cn>
To: David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/armada: fix compile warnings on 64-bit platform
Date: Thu, 30 Mar 2023 20:38:08 +0800
Message-Id: <20230330123808.1590848-1-15330273260@189.cn>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Signed-off-by: Sui Jingfeng <15330273260@189.cn>
---
 drivers/gpu/drm/armada/armada_debugfs.c | 2 +-
 drivers/gpu/drm/armada/armada_gem.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/armada/armada_debugfs.c b/drivers/gpu/drm/armada/armada_debugfs.c
index 29f4b52e3c8d..338f0f6ca441 100644
--- a/drivers/gpu/drm/armada/armada_debugfs.c
+++ b/drivers/gpu/drm/armada/armada_debugfs.c
@@ -48,7 +48,7 @@ static int armada_debugfs_crtc_reg_open(struct inode *inode, struct file *file)
 			   inode->i_private);
 }
 
-static int armada_debugfs_crtc_reg_write(struct file *file,
+static ssize_t armada_debugfs_crtc_reg_write(struct file *file,
 	const char __user *ptr, size_t len, loff_t *off)
 {
 	struct armada_crtc *dcrtc;
diff --git a/drivers/gpu/drm/armada/armada_gem.c b/drivers/gpu/drm/armada/armada_gem.c
index 26d10065d534..e9575ef5aaef 100644
--- a/drivers/gpu/drm/armada/armada_gem.c
+++ b/drivers/gpu/drm/armada/armada_gem.c
@@ -364,7 +364,7 @@ int armada_gem_pwrite_ioctl(struct drm_device *dev, void *data,
 
 	if (args->offset > dobj->obj.size ||
 	    args->size > dobj->obj.size - args->offset) {
-		DRM_ERROR("invalid size: object size %u\n", dobj->obj.size);
+		DRM_ERROR("invalid size: object size %zu\n", dobj->obj.size);
 		ret = -EINVAL;
 		goto unref;
 	}
-- 
2.25.1

