Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BF8321790F
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 22:14:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FFA86E7DA;
	Tue,  7 Jul 2020 20:13:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B22B16E5CD
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 20:12:59 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id z13so46596442wrw.5
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jul 2020 13:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+kL+RB1KM4/yl8RLrIa4baCeHAlTavvqJM6Ze/i1mrs=;
 b=S2CyXGvGn8x8BbuCBF1Dlhba4g73zGpswHnSigIvgpr794NnK/Fz7C7N4d0t29msnq
 tAFBjh4EOBDQSY00bzCCqXCB7FYhI3NIQV0WcMubzFw1HljERMzMfxnWaGkv+vSqLlY1
 9aK1NpWlbcyF84913acyjAiEw/27hrZSgVyls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+kL+RB1KM4/yl8RLrIa4baCeHAlTavvqJM6Ze/i1mrs=;
 b=Fdy+zUSvnrhdqx6WAwkjMMvJZQ1hbzxGKYSQRHJD1MfucI6NFwF3Na9nz858OQRLVb
 1hLNhzOb4Hw3dbm7B3t43vFAy2zrhEdJcXHefoRwfHM7wA0bebFtCPRaolKkGoS6NQhs
 piKiOjsWDJKPkxzdygVpnttkDVYNEHPtE/IwNMnutzNIqK+0K60KjCs2Ik0mzCw2imvB
 THRnYPJsXVPV1KmlXnNtc2/1/ZEsE7X3lK4FklMV5M1WRSpe6KypDQqBXoeoKZ3FXCZM
 0g70KtkatCT/FY61YMyXeXCe/VQGL7RZhnDh1XvMVctMm4NxTf820KFYN9U3HX4JkM7C
 5B2g==
X-Gm-Message-State: AOAM532He0nZpsaIOsZbAW5y9Ft6IS0mFSspJL2NdRhM8/k5raD8B6R3
 JhyohOCPtITfFyWIIgAbKMH4Xw+r758=
X-Google-Smtp-Source: ABdhPJwYZihW6MCohjBA3hUxjm67Ec/Qq2NSVmrLJez6834kk1mvXyOLiuF0oNDVSFbqQlkZZuJycw==
X-Received: by 2002:a5d:4603:: with SMTP id t3mr59616866wrq.38.1594152778138; 
 Tue, 07 Jul 2020 13:12:58 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q7sm2515262wra.56.2020.07.07.13.12.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 13:12:57 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 14/25] drm/tidss: Annotate dma-fence critical section in
 commit path
Date: Tue,  7 Jul 2020 22:12:18 +0200
Message-Id: <20200707201229.472834-15-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200707201229.472834-1-daniel.vetter@ffwll.ch>
References: <20200707201229.472834-1-daniel.vetter@ffwll.ch>
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
Cc: linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jyri Sarha <jsarha@ti.com>, Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ends right after hw_done(), totally standard case.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Jyri Sarha <jsarha@ti.com>
Cc: Tomi Valkeinen <tomi.valkeinen@ti.com>
---
 drivers/gpu/drm/tidss/tidss_kms.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/tidss/tidss_kms.c b/drivers/gpu/drm/tidss/tidss_kms.c
index b6e61d6cf60f..556bc801b77c 100644
--- a/drivers/gpu/drm/tidss/tidss_kms.c
+++ b/drivers/gpu/drm/tidss/tidss_kms.c
@@ -4,6 +4,8 @@
  * Author: Tomi Valkeinen <tomi.valkeinen@ti.com>
  */
 
+#include <linux/dma-fence.h>
+
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
 #include <drm/drm_bridge.h>
@@ -26,6 +28,7 @@ static void tidss_atomic_commit_tail(struct drm_atomic_state *old_state)
 {
 	struct drm_device *ddev = old_state->dev;
 	struct tidss_device *tidss = to_tidss(ddev);
+	bool fence_cookie = dma_fence_begin_signalling();
 
 	dev_dbg(ddev->dev, "%s\n", __func__);
 
@@ -36,6 +39,7 @@ static void tidss_atomic_commit_tail(struct drm_atomic_state *old_state)
 	drm_atomic_helper_commit_modeset_enables(ddev, old_state);
 
 	drm_atomic_helper_commit_hw_done(old_state);
+	dma_fence_end_signalling(fence_cookie);
 	drm_atomic_helper_wait_for_flip_done(ddev, old_state);
 
 	drm_atomic_helper_cleanup_planes(ddev, old_state);
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
