Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5202425D233
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 09:14:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8D426EB1C;
	Fri,  4 Sep 2020 07:12:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32F866EA12
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Sep 2020 16:49:58 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id l191so2600434pgd.5
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Sep 2020 09:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=idein-jp.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9bodQ/ib1T+7rn6F/WtSC31J9eedNDc9gub5rD/BQcA=;
 b=uaA7KtPH9XozSkDO7Detxw+nSg7r37JfL2uNhwhRuG//YOtbbYYiAq6TxWfnnvpcPX
 w8hMn+SWt8BqsaXo21SXawEz612b1YfbQby8WYdNl2t2+fuAi1o4a7Eh6qxV4pzWg/y+
 HnySZmyFyENqAC2/EHAXDI5Vf/Zr2skZnU89I1QCe+nDa8+l6GCeNQz7KlYJJyE6jyxB
 ueg6YMUCkrK6H21ZNPbG7whyjD1RuDYZVI7GVzQ/okQaVvuKEBLxuXrdmAb5umihOBtR
 hY7lp08cKgbrTIntqPrrN2jBboEjk8E5Mnqgzh4P1YU7daDvE4wy2H1jmSJ4cXBa9OiY
 WsPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9bodQ/ib1T+7rn6F/WtSC31J9eedNDc9gub5rD/BQcA=;
 b=mId6kOnjyM5IZuOo7ftRWf9ln769vvYN508RY6W48CGAAGxFLUcrPYPlFoh9r6ik17
 fjIxgAFrd19dT2bz0C/SX6iaIXchXA4MVUp/gyW1qb/xhRTDIl77pXBlkh3K8ykslrI+
 Pls3OUz1qhV4T9ZHDdQ1I8O15n0eqIUYTRmbMdD4mfX1+7bOCDRNx1d3jIMYGD5uyjHH
 9ag5jVbTnKP44yXGjux2GwABDST2GTmLF1CMdOU2IrehvrXju7EgV90v9EcITAAkgeAs
 KmATcLKZmF8mHvz9iynFJfkbtU7bKGBiHPGGdNfY6yUYwq6QV9gc5pX+Kt04qJk2dCdc
 aKZg==
X-Gm-Message-State: AOAM532PKtIGk4fGwV/eD5LYwJyAYHKX2b0AMTRq8rE48536iMdPoWOv
 67Vmrh5h27tg7SIQGKa/v5gfDz7E55M9Odw=
X-Google-Smtp-Source: ABdhPJyr0GJs3TAFGieMJ4wzRpc0i6YyDf9aFyn7Ouxd9GMatQjU2RflnmkMHLH2Vx+yfGt9QN4xdw==
X-Received: by 2002:a63:31d2:: with SMTP id x201mr3841752pgx.263.1599151797348; 
 Thu, 03 Sep 2020 09:49:57 -0700 (PDT)
Received: from localhost.localdomain
 (i220-221-200-167.s41.a008.ap.plala.or.jp. [220.221.200.167])
 by smtp.googlemail.com with ESMTPSA id mw8sm2897411pjb.47.2020.09.03.09.49.54
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 03 Sep 2020 09:49:56 -0700 (PDT)
From: Yukimasa Sugizaki <ysugi@idein.jp>
X-Google-Original-From: Yukimasa Sugizaki <i.can.speak.c.and.basic@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/v3d: Add job timeout module param
Date: Fri,  4 Sep 2020 01:48:21 +0900
Message-Id: <20200903164821.2879-4-i.can.speak.c.and.basic@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200903164821.2879-1-i.can.speak.c.and.basic@gmail.com>
References: <20200903164821.2879-1-i.can.speak.c.and.basic@gmail.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Fri, 04 Sep 2020 07:11:34 +0000
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
Cc: David Airlie <airlied@linux.ie>, Yukimasa Sugizaki <ysugi@idein.jp>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Yukimasa Sugizaki <ysugi@idein.jp>

The default timeout is 500 ms which is too short for some workloads
including Piglit.  Adding this parameter will help users to run heavier
tasks.

Signed-off-by: Yukimasa Sugizaki <ysugi@idein.jp>
---
 drivers/gpu/drm/v3d/v3d_sched.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_sched.c b/drivers/gpu/drm/v3d/v3d_sched.c
index feef0c749e68..983efb018560 100644
--- a/drivers/gpu/drm/v3d/v3d_sched.c
+++ b/drivers/gpu/drm/v3d/v3d_sched.c
@@ -19,11 +19,17 @@
  */

 #include <linux/kthread.h>
+#include <linux/moduleparam.h>

 #include "v3d_drv.h"
 #include "v3d_regs.h"
 #include "v3d_trace.h"

+static uint timeout = 500;
+module_param(timeout, uint, 0444);
+MODULE_PARM_DESC(timeout,
+	"Timeout for a job in ms (0 means infinity and default is 500 ms)");
+
 static struct v3d_job *
 to_v3d_job(struct drm_sched_job *sched_job)
 {
@@ -432,13 +438,13 @@ v3d_sched_init(struct v3d_dev *v3d)
 {
 	int hw_jobs_limit = 1;
 	int job_hang_limit = 0;
-	int hang_limit_ms = 500;
+	long timeout_jiffies = timeout ?
+			msecs_to_jiffies(timeout) : MAX_SCHEDULE_TIMEOUT;
 	int ret;

 	ret = drm_sched_init(&v3d->queue[V3D_BIN].sched,
 			     &v3d_bin_sched_ops,
-			     hw_jobs_limit, job_hang_limit,
-			     msecs_to_jiffies(hang_limit_ms),
+			     hw_jobs_limit, job_hang_limit, timeout_jiffies,
 			     "v3d_bin");
 	if (ret) {
 		dev_err(v3d->drm.dev, "Failed to create bin scheduler: %d.", ret);
@@ -447,8 +453,7 @@ v3d_sched_init(struct v3d_dev *v3d)

 	ret = drm_sched_init(&v3d->queue[V3D_RENDER].sched,
 			     &v3d_render_sched_ops,
-			     hw_jobs_limit, job_hang_limit,
-			     msecs_to_jiffies(hang_limit_ms),
+			     hw_jobs_limit, job_hang_limit, timeout_jiffies,
 			     "v3d_render");
 	if (ret) {
 		dev_err(v3d->drm.dev, "Failed to create render scheduler: %d.",
@@ -459,8 +464,7 @@ v3d_sched_init(struct v3d_dev *v3d)

 	ret = drm_sched_init(&v3d->queue[V3D_TFU].sched,
 			     &v3d_tfu_sched_ops,
-			     hw_jobs_limit, job_hang_limit,
-			     msecs_to_jiffies(hang_limit_ms),
+			     hw_jobs_limit, job_hang_limit, timeout_jiffies,
 			     "v3d_tfu");
 	if (ret) {
 		dev_err(v3d->drm.dev, "Failed to create TFU scheduler: %d.",
@@ -472,8 +476,7 @@ v3d_sched_init(struct v3d_dev *v3d)
 	if (v3d_has_csd(v3d)) {
 		ret = drm_sched_init(&v3d->queue[V3D_CSD].sched,
 				     &v3d_csd_sched_ops,
-				     hw_jobs_limit, job_hang_limit,
-				     msecs_to_jiffies(hang_limit_ms),
+				     hw_jobs_limit, job_hang_limit, timeout_jiffies,
 				     "v3d_csd");
 		if (ret) {
 			dev_err(v3d->drm.dev, "Failed to create CSD scheduler: %d.",
@@ -484,8 +487,7 @@ v3d_sched_init(struct v3d_dev *v3d)

 		ret = drm_sched_init(&v3d->queue[V3D_CACHE_CLEAN].sched,
 				     &v3d_cache_clean_sched_ops,
-				     hw_jobs_limit, job_hang_limit,
-				     msecs_to_jiffies(hang_limit_ms),
+				     hw_jobs_limit, job_hang_limit, timeout_jiffies,
 				     "v3d_cache_clean");
 		if (ret) {
 			dev_err(v3d->drm.dev, "Failed to create CACHE_CLEAN scheduler: %d.",
--
2.7.4

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
