Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D8B5D9E6F20
	for <lists+dri-devel@lfdr.de>; Fri,  6 Dec 2024 14:17:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAC1A10F0D5;
	Fri,  6 Dec 2024 13:17:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="N1mHhMaE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5032210F0D5
 for <dri-devel@lists.freedesktop.org>; Fri,  6 Dec 2024 13:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SINW3DKIYuMLtUwv00EkdgQxf7jWNB9RNblxSXozEpM=; b=N1mHhMaEZ6jp4UYyK2z/m81bQh
 kGvmkVXV/wqqeaO28rrrBUB3AycLqlTznXh1cpw5AXtmRM1FhH+FYjKTcMKhCmGSApH8h37OcPxlo
 fkPbpA8Rkl92fII1GuQ4ilXId7y6dOorikaboEPR7/HsBtJF3jIkZjjd8B+C5QP4C1LBSKK6eqdVR
 UD7mbEirxjTTVLdFr0Spz+G/7fOZ1LudTOgoOZQWaczHOyhKQ4TsdpxnYiwMShPKwe0BdA2ElGj//
 Ad0NzI+k4HOsN+8adse2rJLzgJn9bmI3Q7EqknOb1mRMAnmxuQlGpum2vF2+C+QFj/z5r+CFHkJac
 RATAHvdA==;
Received: from [187.36.213.55] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tJYD3-00HQHu-H7; Fri, 06 Dec 2024 14:17:30 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH 2/4] drm/vc4: Use DMA Resv to implement VC4 wait BO IOCTL
Date: Fri,  6 Dec 2024 10:12:35 -0300
Message-ID: <20241206131706.203324-3-mcanal@igalia.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241206131706.203324-1-mcanal@igalia.com>
References: <20241206131706.203324-1-mcanal@igalia.com>
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

As the BOs used by VC4 have DMA Reservation Objects attached to it,
there is no need to use seqnos wait for the BOs availability. Instead,
we can use `dma_gem_dma_resv_wait()`.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/vc4/vc4_drv.h | 10 ++++++++++
 drivers/gpu/drm/vc4/vc4_gem.c | 31 +++++++++++++++++++------------
 2 files changed, 29 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_drv.h b/drivers/gpu/drm/vc4/vc4_drv.h
index 4a078ffd9f82..03ed40ab9a93 100644
--- a/drivers/gpu/drm/vc4/vc4_drv.h
+++ b/drivers/gpu/drm/vc4/vc4_drv.h
@@ -924,6 +924,16 @@ struct vc4_validated_shader_info {
 						   (Wmax))
 #define wait_for(COND, MS)		_wait_for((COND), (MS) * 1000, 10, 1000)
 
+static inline unsigned long nsecs_to_jiffies_timeout(const u64 n)
+{
+	/* nsecs_to_jiffies64() does not guard against overflow */
+	if ((NSEC_PER_SEC % HZ) != 0 &&
+	    div_u64(n, NSEC_PER_SEC) >= MAX_JIFFY_OFFSET / HZ)
+		return MAX_JIFFY_OFFSET;
+
+	return min_t(u64, MAX_JIFFY_OFFSET, nsecs_to_jiffies64(n) + 1);
+}
+
 /* vc4_bo.c */
 struct drm_gem_object *vc4_create_object(struct drm_device *dev, size_t size);
 struct vc4_bo *vc4_bo_create(struct drm_device *dev, size_t size,
diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
index 2e5477b1c73a..256af016ade0 100644
--- a/drivers/gpu/drm/vc4/vc4_gem.c
+++ b/drivers/gpu/drm/vc4/vc4_gem.c
@@ -1022,11 +1022,13 @@ int
 vc4_wait_bo_ioctl(struct drm_device *dev, void *data,
 		  struct drm_file *file_priv)
 {
-	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	int ret;
+	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	struct drm_vc4_wait_bo *args = data;
-	struct drm_gem_object *gem_obj;
-	struct vc4_bo *bo;
+	unsigned long timeout_jiffies =
+		nsecs_to_jiffies_timeout(args->timeout_ns);
+	ktime_t start = ktime_get();
+	u64 delta_ns;
 
 	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return -ENODEV;
@@ -1034,17 +1036,22 @@ vc4_wait_bo_ioctl(struct drm_device *dev, void *data,
 	if (args->pad != 0)
 		return -EINVAL;
 
-	gem_obj = drm_gem_object_lookup(file_priv, args->handle);
-	if (!gem_obj) {
-		DRM_DEBUG("Failed to look up GEM BO %d\n", args->handle);
-		return -EINVAL;
-	}
-	bo = to_vc4_bo(gem_obj);
+	ret = drm_gem_dma_resv_wait(file_priv, args->handle,
+				    true, timeout_jiffies);
 
-	ret = vc4_wait_for_seqno_ioctl_helper(dev, bo->seqno,
-					      &args->timeout_ns);
+	/* Decrement the user's timeout, in case we got interrupted
+	 * such that the ioctl will be restarted.
+	 */
+	delta_ns = ktime_to_ns(ktime_sub(ktime_get(), start));
+	if (delta_ns < args->timeout_ns)
+		args->timeout_ns -= delta_ns;
+	else
+		args->timeout_ns = 0;
+
+	/* Asked to wait beyond the jiffy/scheduler precision? */
+	if (ret == -ETIME && args->timeout_ns)
+		ret = -EAGAIN;
 
-	drm_gem_object_put(gem_obj);
 	return ret;
 }
 
-- 
2.47.1

