Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AB79F936D
	for <lists+dri-devel@lfdr.de>; Fri, 20 Dec 2024 14:42:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96C0210E37B;
	Fri, 20 Dec 2024 13:42:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=igalia.com header.i=@igalia.com header.b="MRp2i/KY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 527BB10E37F
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Dec 2024 13:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xdzGVLihKWjYoO590geUl+fFQhFkf6YTYSnEMKD204k=; b=MRp2i/KYCrPEZPGHWSluy6hnRq
 y0eVIbiAznAz/BpgNmPsSYCl1gtj+V3ON70pHsGUP2x5Gx+hZRNSrosi+vjCgkSNk6/26Vtr9tOWD
 dig5u2AhI/CI0WM8vc+UpLSL2dMH27lYKXAvEer2W5yylsKUmzAjlqyrD6yaCIHB0HfhpbVMCDXo/
 gczIe8kzZxRfE7ANGWTlTk1dxUsrFjpkj8A8bEyPNPUIkffzEsyFrpkQh+Hev6D6+lcJ+iqqVBM5r
 1NBWTp8CnxmSn/U/rpPf1D20zHcMlHyibTCjOAsASiZfI11IPBXw+l1vgkoER/3Qdb7W6asOJzPwS
 MjWvP2uw==;
Received: from [187.36.213.55] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1tOdGy-005n05-1b; Fri, 20 Dec 2024 14:42:32 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, kernel-dev@igalia.com,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
Subject: [PATCH v3 2/3] drm/vc4: Use DMA Resv to implement VC4 wait BO IOCTL
Date: Fri, 20 Dec 2024 10:37:08 -0300
Message-ID: <20241220134204.634577-3-mcanal@igalia.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241220134204.634577-1-mcanal@igalia.com>
References: <20241220134204.634577-1-mcanal@igalia.com>
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

Since the BOs used by VC4 have DMA Reservation Objects attached to
them, waiting for seqnos to check BO availability is unnecessary.
Instead, `drm_gem_dma_resv_wait()` can be used.

Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/vc4/vc4_gem.c | 25 ++++++++++++++-----------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/vc4/vc4_gem.c b/drivers/gpu/drm/vc4/vc4_gem.c
index 1021f45cb53c..de7be9942c13 100644
--- a/drivers/gpu/drm/vc4/vc4_gem.c
+++ b/drivers/gpu/drm/vc4/vc4_gem.c
@@ -1020,8 +1020,10 @@ vc4_wait_bo_ioctl(struct drm_device *dev, void *data,
 	struct vc4_dev *vc4 = to_vc4_dev(dev);
 	int ret;
 	struct drm_vc4_wait_bo *args = data;
-	struct drm_gem_object *gem_obj;
-	struct vc4_bo *bo;
+	unsigned long timeout_jiffies =
+		usecs_to_jiffies(div_u64(args->timeout_ns, 1000));
+	ktime_t start = ktime_get();
+	u64 delta_ns;
 
 	if (WARN_ON_ONCE(vc4->gen > VC4_GEN_4))
 		return -ENODEV;
@@ -1029,17 +1031,18 @@ vc4_wait_bo_ioctl(struct drm_device *dev, void *data,
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
 
-	drm_gem_object_put(gem_obj);
 	return ret;
 }
 
-- 
2.47.1

