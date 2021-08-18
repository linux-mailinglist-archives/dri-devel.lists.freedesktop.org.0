Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E153F020C
	for <lists+dri-devel@lfdr.de>; Wed, 18 Aug 2021 12:54:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9D266E532;
	Wed, 18 Aug 2021 10:54:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 514F46E52C
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 10:54:48 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id w24so1329984wmi.5
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Aug 2021 03:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=+kSxeYPH8CV+iqzlfochID5tK+dBNU1mNPOjXvv+41U=;
 b=RPJduCSD9q8r/Je8yCUYh7gLrcLVPGaEwhJ8PmTZI0OnLXjU5xbWA8WSkeIKMN+hL+
 ACP4+vS9QCSAWrfK9wsgw2fsEc7jfd17BQfSoFVC/TAzMu9TuDv9rW8kT91csEmMoXtl
 BLgCQtZCKGFiq94DdafvQdTbRe4RytRfgXpIyfMW1dR+KDvwNzD0stEQOnvhK0K6xjQv
 7uzRnxq+CVba+6DsrtnNmG64c1qogW4MU6nDB/pKq/D+X5Z794SgfHmJmIPqgjWmZV3N
 GcBSNHXvx4pkvsCzN2cPdm0D7d9wEem82GYnMJ3ore4H9gAOJRo8ihzAJ9/HVccpmGW+
 739w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+kSxeYPH8CV+iqzlfochID5tK+dBNU1mNPOjXvv+41U=;
 b=XowoNXioLHUuV+Kc4KnUVSHejL4w0Bq2QNyfuouh2Av3HerXHx+DfI2f8gjm78um8S
 Vo1hyj2Gte31CWfu6W/QkvQE9QnHzxCTtgUJi6jwAV8R25RVnfS0MuVV/qZZw8Jslc+i
 R/ozW1gAEzzEK01xB6CD69waZnEPqG1CtZhInWb87DY/aPRjOXorQizfCVYUIO3tJfRA
 sBxjSgpnAlNL+K6j0hD3Z1ZxV4aPJtF7T78PaqcEnuDOeZIimvWXwuVM2TzGR+iJ5VXh
 alvjQa630BsgY4UcRHfIRZEgBXKFraznyEmzuC6SJpIOO9+S/BpkDvTGjbmeIa9MNJQZ
 FKbQ==
X-Gm-Message-State: AOAM533AytKfGgenn/4TVv6Fy+S+qufrRfpl22S/6QqjwR+mTOH74I2y
 k+qygC20bpeaV9btp3kPyCS5yObgMQ2YJbmWf/yJKg==
X-Google-Smtp-Source: ABdhPJx6f9K9WsiJYEOOCqBwG5HtfeGGZLC6NrPvi/1y2P8nVp3YyMMHxAaZ03XqhpO3hMtXysKxog==
X-Received: by 2002:a7b:cb53:: with SMTP id v19mr7650538wmj.127.1629284086939; 
 Wed, 18 Aug 2021 03:54:46 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 y4sm4646352wmi.22.2021.08.18.03.54.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Aug 2021 03:54:46 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: hridya@google.com, john.stultz@linaro.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, gustavo@padovan.org,
 linux-media@vger.kernel.org, adelva@google.com, sspatil@google.com,
 daniel@ffwll.ch
Subject: [PATCH 2/2] dma-buf: taint the kernel on sw_sync use
Date: Wed, 18 Aug 2021 12:54:43 +0200
Message-Id: <20210818105443.1578-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210818105443.1578-1-christian.koenig@amd.com>
References: <20210818105443.1578-1-christian.koenig@amd.com>
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

As we now knew allowing userspace control over dma_fence synchronization
is fundamentally broken and can cause deadlocks inside the kernel memory
management.

Because of this harden the wording for CONFIG_SW_SYNC and taint the kernel
as soon as it is used.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/Kconfig   | 5 +++--
 drivers/dma-buf/sw_sync.c | 5 ++++-
 2 files changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/dma-buf/Kconfig b/drivers/dma-buf/Kconfig
index 9561e3d2d428..61e0f3c5ba8b 100644
--- a/drivers/dma-buf/Kconfig
+++ b/drivers/dma-buf/Kconfig
@@ -27,8 +27,9 @@ config SW_SYNC
 	  synchronization.  Useful when there is no hardware primitive backing
 	  the synchronization.
 
-	  WARNING: improper use of this can result in deadlocking kernel
-	  drivers from userspace. Intended for test and debug only.
+	  WARNING: improper use of this can result in deadlocking the kernel
+	  memory management from userspace. Intended for test and debug only.
+	  Use at your own risk.
 
 config UDMABUF
 	bool "userspace dmabuf misc driver"
diff --git a/drivers/dma-buf/sw_sync.c b/drivers/dma-buf/sw_sync.c
index 348b3a9170fa..c2bcb9062f51 100644
--- a/drivers/dma-buf/sw_sync.c
+++ b/drivers/dma-buf/sw_sync.c
@@ -286,7 +286,8 @@ static struct sync_pt *sync_pt_create(struct sync_timeline *obj,
 /*
  * *WARNING*
  *
- * improper use of this can result in deadlocking kernel drivers from userspace.
+ * improper use of this can result in deadlocking kernel memory management
+ * from userspace.
  */
 
 /* opening sw_sync create a new sync obj */
@@ -295,6 +296,8 @@ static int sw_sync_debugfs_open(struct inode *inode, struct file *file)
 	struct sync_timeline *obj;
 	char task_comm[TASK_COMM_LEN];
 
+	add_taint(TAINT_SOFTLOCKUP, LOCKDEP_STILL_OK);
+
 	get_task_comm(task_comm, current);
 
 	obj = sync_timeline_create(task_comm);
-- 
2.25.1

