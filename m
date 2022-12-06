Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15E69644C6A
	for <lists+dri-devel@lfdr.de>; Tue,  6 Dec 2022 20:21:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E79F10E349;
	Tue,  6 Dec 2022 19:21:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4AEA110E345;
 Tue,  6 Dec 2022 19:21:23 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 u15-20020a17090a3fcf00b002191825cf02so15758453pjm.2; 
 Tue, 06 Dec 2022 11:21:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kCOE6UB3AU4sZjM0eLrxIRHE8DSLTlCxmBapLp+bPNQ=;
 b=oxisaQx/rtHyRTCMpb85wCfSx3JaiXt6gpFSAXSp4FBtH8KRxOuGMFodPB4T4nmghi
 LcuqFFHpATlLWmrV7wfOj+JZrOaYqN7hKH40bPzvwfkj09li3lm2tueUfFt/orlTAFyT
 tvxrbkSNTTXmQ/0GakqDsx0uzmMHOh07GiNu540gt6qTrdXvItuM50ztfPXxxZBhCkMQ
 phB/7HgkIHCFtm2GWm9HjrDIrNaywELLXZVvacLeV4cp2oAz4NCBlxWaPI4ynblR3n2q
 GsIfFyt8NS6Q7XBycZrQLky8jXgBpCr0adp6/sflDfVKMoDMgF30XtMMM6BRZIWBfDLA
 hbmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kCOE6UB3AU4sZjM0eLrxIRHE8DSLTlCxmBapLp+bPNQ=;
 b=hiz41uoLycL03dU9bkcriNm3FAPvVbP8p+dR1J27DepwLNzlr0xix+hdCDjNNRlUq8
 Z6GoolE9Uwlqcvr9m1lLFD391FZeaxfx7bOOnvYvCe96O0vq88uW4kuDfac76M7jZ4cD
 8yJyJOqSDkj1nTJNHNL3/Yz0NJVVF9f/iAPTWw+giRHeV/7R3pvedIoRaGzGzdo/MZ7N
 UYVVMD6RFzesR3lznlS0Tmq+k9xnMKwnxxDVXyNW4npcjdd4hPdG3Cb3Qxl3VDpokkEO
 9qCgHAZ0wSkJuj3x+Z7UskpSMF6+o499oSPnMRduCQoHEqhTYReAocv0VnwW+tFwXUI/
 LEzw==
X-Gm-Message-State: ANoB5plOOqLuGCFeLUercs62G6qZ07otL1wTYzqMJK9TI5zLv8YlCTOl
 ASCXbRu6VtGr+xYgPHvlJsariKfYH1Q=
X-Google-Smtp-Source: AA0mqf6exKLZJ3n5EhVh3nDm8ZR2z+CSHRWSi0xA8aPelGwpxWfZfGSsbERAoO8DlqExqBSnR0M+ig==
X-Received: by 2002:a17:902:f7ca:b0:189:b203:9e2f with SMTP id
 h10-20020a170902f7ca00b00189b2039e2fmr382970plw.56.1670354482458; 
 Tue, 06 Dec 2022 11:21:22 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 v25-20020a634659000000b00473c36ea150sm5434632pgk.92.2022.12.06.11.21.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 11:21:21 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm: Add MSM_SUBMIT_BO_NO_IMPLICIT
Date: Tue,  6 Dec 2022 11:21:23 -0800
Message-Id: <20221206192123.661448-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.38.1
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

In cases where implicit sync is used, it is still useful (for things
like sub-allocation, etc) to allow userspace to opt-out of implicit
sync on per-BO basis.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.c        |  3 ++-
 drivers/gpu/drm/msm/msm_gem_submit.c | 11 +++++++++++
 include/uapi/drm/msm_drm.h           |  4 +++-
 3 files changed, 16 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 017a512982a2..e0e1199a822f 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -45,9 +45,10 @@
  * - 1.7.0 - Add MSM_PARAM_SUSPENDS to access suspend count
  * - 1.8.0 - Add MSM_BO_CACHED_COHERENT for supported GPUs (a6xx)
  * - 1.9.0 - Add MSM_SUBMIT_FENCE_SN_IN
+ * - 1.10.0 - Add MSM_SUBMIT_BO_NO_IMPLICIT
  */
 #define MSM_VERSION_MAJOR	1
-#define MSM_VERSION_MINOR	9
+#define MSM_VERSION_MINOR	10
 #define MSM_VERSION_PATCHLEVEL	0
 
 static const struct drm_mode_config_funcs mode_config_funcs = {
diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index eb3536e3d66a..8bad07a04f85 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -334,9 +334,20 @@ static int submit_fence_sync(struct msm_gem_submit *submit, bool no_implicit)
 		if (ret)
 			return ret;
 
+		/* If userspace has determined that explicit fencing is
+		 * used, it can disable implicit sync on the entire
+		 * submit:
+		 */
 		if (no_implicit)
 			continue;
 
+		/* Otherwise userspace can ask for implicit sync to be
+		 * disabled on specific buffers.  This is useful for internal
+		 * usermode driver managed buffers, suballocation, etc.
+		 */
+		if (submit->bos[i].flags & MSM_SUBMIT_BO_NO_IMPLICIT)
+			continue;
+
 		ret = drm_sched_job_add_implicit_dependencies(&submit->base,
 							      obj,
 							      write);
diff --git a/include/uapi/drm/msm_drm.h b/include/uapi/drm/msm_drm.h
index f54b48ef6a2d..329100016e7c 100644
--- a/include/uapi/drm/msm_drm.h
+++ b/include/uapi/drm/msm_drm.h
@@ -222,10 +222,12 @@ struct drm_msm_gem_submit_cmd {
 #define MSM_SUBMIT_BO_READ             0x0001
 #define MSM_SUBMIT_BO_WRITE            0x0002
 #define MSM_SUBMIT_BO_DUMP             0x0004
+#define MSM_SUBMIT_BO_NO_IMPLICIT      0x0008
 
 #define MSM_SUBMIT_BO_FLAGS            (MSM_SUBMIT_BO_READ | \
 					MSM_SUBMIT_BO_WRITE | \
-					MSM_SUBMIT_BO_DUMP)
+					MSM_SUBMIT_BO_DUMP | \
+					MSM_SUBMIT_BO_NO_IMPLICIT)
 
 struct drm_msm_gem_submit_bo {
 	__u32 flags;          /* in, mask of MSM_SUBMIT_BO_x */
-- 
2.38.1

