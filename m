Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 622ED36A845
	for <lists+dri-devel@lfdr.de>; Sun, 25 Apr 2021 18:08:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36FBF6E4CA;
	Sun, 25 Apr 2021 16:08:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AF8B6E4D0
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Apr 2021 16:08:07 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id r128so57606922lff.4
 for <dri-devel@lists.freedesktop.org>; Sun, 25 Apr 2021 09:08:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2bBYyBWfbK+wEYQbw8AaPxoPO8CIW68ow2PmqcM84eQ=;
 b=QZNsTg/GLviItil3uPbGw5ywlauLi4QzZlLohHtzTp7VpSYjAAoL0PoVzxHSQUWZf+
 NiesYTT23TdHhVb9mS6O0hcqadDd/PoI541MyrhqdWD/dHU1Y0v4KDtDdnb7pRqMHXpp
 NnBxUnbX9xxjRWWPnnRuJL3v2VZrcFCum05AeLPQ0hXy/kFB5xj38Jo5wXFjEHijcAFy
 SPJezhaVqCJUShtX4nzW+eawkmWiGYDLscbdqKp5ntOr/Fk6/AJzqJmxSBHHtkfMYW2a
 pRvkXxFT+zNzQqV6jH1HHRp8w6X6r0buiguuYof6SJoS/sVyVYoH7+45dc+Gu7V2joHd
 3Fhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2bBYyBWfbK+wEYQbw8AaPxoPO8CIW68ow2PmqcM84eQ=;
 b=ct2QBQorr7iVuyfpLneublI8jeTmtskUdN50+MIjelp3WC3Vc65yITbdYCjIpba81I
 dDA2CPVsmjCO6ir6IXWoGX5aKB5J3MmNZwRLVTRI7joIL/WO++pFrewSX3Bp8so05XuP
 WTlzIUGF8lZrxNmXFIDhWVsfoQPObHPHA48NuY1rDOSwg3Ehwg4LXXHLg4Wl5Ak4fgNn
 gtmdpUg6jdDCM8hYpGGVEapMmVF3KrvKF1wLaj96MW53i3wCGGrfjIt0K2L8niMcOja/
 UbeJCMR6WlNPaBkk/G3AS4DbyNBlkDCN01pfRXWd7B1HvDkm9TtSHg6AigX25e0PyoTn
 w4rA==
X-Gm-Message-State: AOAM531KISvjnJkF5O4rOjCAyqMtHE1VnxTiL99tTaijFnPd1f7nSFjE
 MF4I9tp06/B+Py7uJPDtXcwcuA==
X-Google-Smtp-Source: ABdhPJxszE1EqzWKe5TN/602vRvJmUZlj7Z0UqhGhTg3AovEVkoRgJbBRQ2XVgsm0l3fxKBSA3bAig==
X-Received: by 2002:a19:7e97:: with SMTP id
 z145mr10363453lfc.280.1619366886087; 
 Sun, 25 Apr 2021 09:08:06 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id l24sm1141575lfc.23.2021.04.25.09.08.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Apr 2021 09:08:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH 2/2] drm/msm: make msm_disp_state transient data struct
Date: Sun, 25 Apr 2021 19:08:00 +0300
Message-Id: <20210425160800.1201337-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210425160800.1201337-1-dmitry.baryshkov@linaro.org>
References: <20210425160800.1201337-1-dmitry.baryshkov@linaro.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of allocating snapshotting structure at the driver probe time
and later handling concurrent access, actual state, etc, make
msm_disp_state transient struct. Allocate one when snapshotting happens
and free it after coredump data is read by userspace.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.c  | 87 ++++---------------
 drivers/gpu/drm/msm/disp/msm_disp_snapshot.h  | 13 +--
 .../gpu/drm/msm/disp/msm_disp_snapshot_util.c |  5 +-
 drivers/gpu/drm/msm/msm_kms.h                 |  5 +-
 4 files changed, 28 insertions(+), 82 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
index 70fd5a1fe13e..371358893716 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.c
@@ -7,8 +7,7 @@
 
 #include "msm_disp_snapshot.h"
 
-#ifdef CONFIG_DEV_COREDUMP
-static ssize_t disp_devcoredump_read(char *buffer, loff_t offset,
+static ssize_t __maybe_unused disp_devcoredump_read(char *buffer, loff_t offset,
 		size_t count, void *data, size_t datalen)
 {
 	struct drm_print_iterator iter;
@@ -29,24 +28,21 @@ static ssize_t disp_devcoredump_read(char *buffer, loff_t offset,
 	return count - iter.remain;
 }
 
-static void disp_devcoredump_free(void *data)
+static void _msm_disp_snapshot_work(struct kthread_work *work)
 {
+	struct msm_kms *msm_kms = container_of(work, struct msm_kms, dump_work);
+	struct drm_device *drm_dev = msm_kms->dev;
 	struct msm_disp_state *disp_state;
+	struct drm_printer p;
 
-	disp_state = data;
-
-	msm_disp_state_free(disp_state);
-
-	disp_state->coredump_pending = false;
-}
-#endif /* CONFIG_DEV_COREDUMP */
+	disp_state = kzalloc(sizeof(struct msm_disp_state), GFP_KERNEL);
+	if (!disp_state)
+		return;
 
-static void _msm_disp_snapshot_work(struct kthread_work *work)
-{
-	struct msm_disp_state *disp_state = container_of(work, struct msm_disp_state, dump_work);
-	struct drm_printer p;
+	disp_state->dev = drm_dev->dev;
+	disp_state->drm_dev = drm_dev;
 
-	mutex_lock(&disp_state->mutex);
+	INIT_LIST_HEAD(&disp_state->blocks);
 
 	msm_disp_snapshot_capture_state(disp_state);
 
@@ -55,26 +51,15 @@ static void _msm_disp_snapshot_work(struct kthread_work *work)
 		msm_disp_state_print(disp_state, &p);
 	}
 
-	/*
-	 * if devcoredump is not defined free the state immediately
-	 * otherwise it will be freed in the free handler.
-	 */
-#ifdef CONFIG_DEV_COREDUMP
+	/* If COREDUMP is disabled, the stub will call the free function. */
 	dev_coredumpm(disp_state->dev, THIS_MODULE, disp_state, 0, GFP_KERNEL,
-			disp_devcoredump_read, disp_devcoredump_free);
-	disp_state->coredump_pending = true;
-#else
-	msm_disp_state_free(disp_state);
-#endif
-
-	mutex_unlock(&disp_state->mutex);
+			disp_devcoredump_read, msm_disp_state_free);
 }
 
 void msm_disp_snapshot_state(struct drm_device *drm_dev)
 {
 	struct msm_drm_private *priv;
 	struct msm_kms *kms;
-	struct msm_disp_state *disp_state;
 
 	if (!drm_dev) {
 		DRM_ERROR("invalid params\n");
@@ -83,30 +68,13 @@ void msm_disp_snapshot_state(struct drm_device *drm_dev)
 
 	priv = drm_dev->dev_private;
 	kms = priv->kms;
-	disp_state = kms->disp_state;
-
-	if (!disp_state) {
-		DRM_ERROR("invalid params\n");
-		return;
-	}
-
-	/*
-	 * if there is a coredump pending return immediately till dump
-	 * if read by userspace or timeout happens
-	 */
-	if (disp_state->coredump_pending) {
-		DRM_DEBUG("coredump is pending read\n");
-		return;
-	}
 
-	kthread_queue_work(disp_state->dump_worker,
-			&disp_state->dump_work);
+	kthread_queue_work(kms->dump_worker, &kms->dump_work);
 }
 
 int msm_disp_snapshot_init(struct drm_device *drm_dev)
 {
 	struct msm_drm_private *priv;
-	struct msm_disp_state *disp_state;
 	struct msm_kms *kms;
 
 	if (!drm_dev) {
@@ -117,22 +85,11 @@ int msm_disp_snapshot_init(struct drm_device *drm_dev)
 	priv = drm_dev->dev_private;
 	kms = priv->kms;
 
-	disp_state = devm_kzalloc(drm_dev->dev, sizeof(struct msm_disp_state), GFP_KERNEL);
-
-	mutex_init(&disp_state->mutex);
-
-	disp_state->dev = drm_dev->dev;
-	disp_state->drm_dev = drm_dev;
-
-	INIT_LIST_HEAD(&disp_state->blocks);
-
-	disp_state->dump_worker = kthread_create_worker(0, "%s", "disp_snapshot");
-	if (IS_ERR(disp_state->dump_worker))
+	kms->dump_worker = kthread_create_worker(0, "%s", "disp_snapshot");
+	if (IS_ERR(kms->dump_worker))
 		DRM_ERROR("failed to create disp state task\n");
 
-	kthread_init_work(&disp_state->dump_work, _msm_disp_snapshot_work);
-
-	kms->disp_state = disp_state;
+	kthread_init_work(&kms->dump_work, _msm_disp_snapshot_work);
 
 	return 0;
 }
@@ -141,7 +98,6 @@ void msm_disp_snapshot_destroy(struct drm_device *drm_dev)
 {
 	struct msm_kms *kms;
 	struct msm_drm_private *priv;
-	struct msm_disp_state *disp_state;
 
 	if (!drm_dev) {
 		DRM_ERROR("invalid params\n");
@@ -150,12 +106,7 @@ void msm_disp_snapshot_destroy(struct drm_device *drm_dev)
 
 	priv = drm_dev->dev_private;
 	kms = priv->kms;
-	disp_state = kms->disp_state;
-
-	if (disp_state->dump_worker)
-		kthread_destroy_worker(disp_state->dump_worker);
-
-	list_del(&disp_state->blocks);
 
-	mutex_destroy(&disp_state->mutex);
+	if (kms->dump_worker)
+		kthread_destroy_worker(kms->dump_worker);
 }
diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
index 32f52799a1ba..c6174a366095 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot.h
@@ -41,26 +41,17 @@
  * struct msm_disp_state - structure to store current dpu state
  * @dev: device pointer
  * @drm_dev: drm device pointer
- * @mutex: mutex to serialize access to serialze dumps, debugfs access
- * @coredump_pending: coredump is pending read from userspace
  * @atomic_state: atomic state duplicated at the time of the error
- * @dump_worker: kworker thread which runs the dump work
- * @dump_work: kwork which dumps the registers and drm state
  * @timestamp: timestamp at which the coredump was captured
  */
 struct msm_disp_state {
 	struct device *dev;
 	struct drm_device *drm_dev;
-	struct mutex mutex;
-
-	bool coredump_pending;
 
 	struct list_head blocks;
 
 	struct drm_atomic_state *atomic_state;
 
-	struct kthread_worker *dump_worker;
-	struct kthread_work dump_work;
 	ktime_t timestamp;
 };
 
@@ -123,11 +114,11 @@ void msm_disp_snapshot_capture_state(struct msm_disp_state *disp_state);
 
 /**
  * msm_disp_state_free - free the memory after the coredump has been read
- * @disp_state:	    handle to struct msm_disp_state
+ * @data:	    handle to struct msm_disp_state
 
  * Returns: none
  */
-void msm_disp_state_free(struct msm_disp_state *disp_state);
+void msm_disp_state_free(void *data);
 
 /**
  * msm_disp_snapshot_add_block - add a hardware block with its register dump
diff --git a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
index ca6632550337..cabe15190ec1 100644
--- a/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
+++ b/drivers/gpu/drm/msm/disp/msm_disp_snapshot_util.c
@@ -142,8 +142,9 @@ void msm_disp_snapshot_capture_state(struct msm_disp_state *disp_state)
 	msm_disp_capture_atomic_state(disp_state);
 }
 
-void msm_disp_state_free(struct msm_disp_state *disp_state)
+void msm_disp_state_free(void *data)
 {
+	struct msm_disp_state *disp_state = data;
 	struct msm_disp_state_block *block, *tmp;
 
 	if (disp_state->atomic_state) {
@@ -156,6 +157,8 @@ void msm_disp_state_free(struct msm_disp_state *disp_state)
 		kfree(block->state);
 		kfree(block);
 	}
+
+	kfree(disp_state);
 }
 
 void msm_disp_snapshot_add_block(struct msm_disp_state *disp_state, u32 len,
diff --git a/drivers/gpu/drm/msm/msm_kms.h b/drivers/gpu/drm/msm/msm_kms.h
index 146dcab123f4..529b9dacf7ca 100644
--- a/drivers/gpu/drm/msm/msm_kms.h
+++ b/drivers/gpu/drm/msm/msm_kms.h
@@ -156,8 +156,9 @@ struct msm_kms {
 	/* mapper-id used to request GEM buffer mapped for scanout: */
 	struct msm_gem_address_space *aspace;
 
-	/* handle to disp snapshot state */
-	struct msm_disp_state *disp_state;
+	/* disp snapshot support */
+	struct kthread_worker *dump_worker;
+	struct kthread_work dump_work;
 
 	/*
 	 * For async commit, where ->flush_commit() and later happens
-- 
2.30.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
