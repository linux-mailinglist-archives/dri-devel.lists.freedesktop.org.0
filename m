Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D9225D357
	for <lists+dri-devel@lfdr.de>; Fri,  4 Sep 2020 10:17:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B12F66E28E;
	Fri,  4 Sep 2020 08:17:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5BB86E28E
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Sep 2020 08:17:13 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id l9so800412plt.8
 for <dri-devel@lists.freedesktop.org>; Fri, 04 Sep 2020 01:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=idein-jp.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IsU/lTesxrJHtJsifPoUQaikOUBIO2uCBbf1RwnYScs=;
 b=F7jbJ5UIgSL9mD6ha15CKCm8vi8hPNFUgMyauBFEqN8Ech1vqH6vCHIR4c70zxdgzD
 HWhYh1wZHt62z3xSWD/UBqougIfmJc3+OpZ7b4A7hB5nJg/Ic+YfpTWLu+D7SXlSCpmv
 Bpw6tYfh+DiGrWx98y+QxjUTilD0GySEV+fWJMp9ZA7Ze2/jj5S2DfE8UurmH2jrk45g
 rc355y5W3kUl+Rhj1/Gn76oav1vHxO//xffN0oxmgKiHhiI/s5Bt1/JEvM9KEWLajdGq
 5dgpO4zbq6KEKzhkAWpc68zmIuM76aMFjhVTlkmjB6jTP40JTMHPHkUj31KXBKbnpJjs
 yVGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IsU/lTesxrJHtJsifPoUQaikOUBIO2uCBbf1RwnYScs=;
 b=WPecUOptI18Luyyl577rapqrdoG4uIl+rDdFxOiG+cvkLHBfbqojYqqKNjZN8ZIYZG
 WJhJ9i/QeJnwjBzceEovx5YknPyumR6ASroSQwt9TzeB3hO/qyl1ps4qhDR4ENUpmVt5
 p2KcIz5lUzgQdgBhc7CCkb3aEClLS85g1um1YtwCbDQjt9PJ3nKAa8r9AQ9Yl52Z0J8n
 hoJRmGOQFfEIm4Xy2HLIn8W4EjsRW6w1vLeQMI8qkQ67Z7MYVJE4wJD9F70NVqVKkJSg
 gjZZfsa0+StxL1D3cUph3+TIPj4cfMJMuM4AkzfFuNH3FGcGMAzOmWFLKojZvOLl8CQd
 sy5Q==
X-Gm-Message-State: AOAM530iPl+J/CPxZ9gGkM2KzgfcSPLF0/JdMNgsQIuP7iYMdpNdnAAq
 igaIVN98k0X+OkE9WFgE2RT5jzbz42tgkx0kRQ==
X-Google-Smtp-Source: ABdhPJwEkVQhOUuGRtt6sntpPjOqXjCmFM3D+15S2FI6gGkgEZOrmfj8sBfobukjSV26I37I3A0iEw==
X-Received: by 2002:a17:90a:aa8e:: with SMTP id
 l14mr7435155pjq.67.1599207432898; 
 Fri, 04 Sep 2020 01:17:12 -0700 (PDT)
Received: from localhost.localdomain
 (i220-221-200-167.s41.a008.ap.plala.or.jp. [220.221.200.167])
 by smtp.googlemail.com with ESMTPSA id i16sm20202630pjv.0.2020.09.04.01.17.10
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 04 Sep 2020 01:17:12 -0700 (PDT)
From: Yukimasa Sugizaki <ysugi@idein.jp>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 3/3] drm/v3d: Add job timeout module param
Date: Fri,  4 Sep 2020 17:15:53 +0900
Message-Id: <20200904081552.38052-4-ysugi@idein.jp>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200904081552.38052-1-ysugi@idein.jp>
References: <20200904081552.38052-1-ysugi@idein.jp>
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
Cc: David Airlie <airlied@linux.ie>, Yukimasa Sugizaki <ysugi@idein.jp>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

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
