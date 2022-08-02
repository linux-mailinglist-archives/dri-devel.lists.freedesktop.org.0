Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 516D0588347
	for <lists+dri-devel@lfdr.de>; Tue,  2 Aug 2022 23:02:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6FE89782C;
	Tue,  2 Aug 2022 21:02:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com
 [IPv6:2001:4860:4864:20::35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85DA89782C
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Aug 2022 21:02:01 +0000 (UTC)
Received: by mail-oa1-x35.google.com with SMTP id
 586e51a60fabf-10cf9f5b500so18634741fac.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Aug 2022 14:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20210112.gappssmtp.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=cqlmT3jWhMKLE77ppAPsKc6glmiiFJRSY/jXVMeDL88=;
 b=qXuRxyAaDMLXJNxIbu9TblDZbADaNyTFbtgcAuRwWZuehkS68QxGJMiudSL1H3o0tQ
 /iT9YgWJAHPeH7lwJNvCjkox8kli6u9aQA3CeSJISllZNNzRKYYhrswC9FHtJGcnl98z
 C2ej1pFnuR2dB4wjjaSgZZDoFG5bkxwlj/wKIrmvdi20u6qMrzQ2cYTEzc3fYZdoHjgN
 7Jjr+URCkq5n/VeNXbFnDwZSCDo2NY1mPTA7rdSQ5sSoFjfDYQrIFhncg2YhVeWsc1hj
 DXTZ8Qpf5uN0hIf8yS1BprqVyFxZvyv3KZDnAxQD6dZdtCjepCY/K8LAREz5tjtMWcnw
 18dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=cqlmT3jWhMKLE77ppAPsKc6glmiiFJRSY/jXVMeDL88=;
 b=W83NRc9o0Jic313ccene5w6RrTu92/X72B41C3I8ennXTRqE6bNqgpEZd425X9820H
 P2576jUyWF4YQo5WePwZEgB6gOz42xbs3/x29XRq8cirqT/jbb4zkG1bJ/6Y6aIC5bkS
 kch3MeZZ4PMF5XzaV5CPlBQYHOxhg6t3GButPx7b2f4wcSvX9Xzc6xzFEU85v/NbNHjf
 Tjf3NfvzTJfBrUFimOgjpR8MDV+1eSi3a1TA+4Sfynp00MGhFwJ4HVdRctzh5K5tkhk3
 zBXuqcCL1jo6nbgwAOtcsvgRH9NGcBOLZuehLMkPYEsjHsjGOvO9kR9o8RzVexrjEJdY
 QBzQ==
X-Gm-Message-State: ACgBeo0vjWehDCC/WppdVUoUtUp+IrUyQV90wlKRkjqELULCm8jtyf0v
 /1LAZInhchVx/raDn8R3CgEhSEfXCix5LQ==
X-Google-Smtp-Source: AA6agR7jJV76MbNjfDQMF2vVmka0j7C6OBp+bC2HaXfQaqiu3qxqiAffWYwiFMUYBMFcJYNcNvXKnQ==
X-Received: by 2002:a05:6870:b609:b0:f2:74e7:9bf1 with SMTP id
 cm9-20020a056870b60900b000f274e79bf1mr527810oab.141.1659474120422; 
 Tue, 02 Aug 2022 14:02:00 -0700 (PDT)
Received: from animal.lan
 (2603-8080-2102-63d7-a603-c311-740a-6dbf.res6.spectrum.com.
 [2603:8080:2102:63d7:a603:c311:740a:6dbf])
 by smtp.gmail.com with ESMTPSA id
 g9-20020acab609000000b0033adb68db2dsm3179875oif.29.2022.08.02.14.01.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 14:02:00 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
X-Google-Original-From: Jason Ekstrand <jason.ekstrand@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] dma-buf: Use dma_fence_unwrap_for_each when importing fences
Date: Tue,  2 Aug 2022 16:01:58 -0500
Message-Id: <20220802210158.4162525-1-jason.ekstrand@collabora.com>
X-Mailer: git-send-email 2.36.1
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
Cc: Jason Ekstrand <jason.ekstrand@collabora.com>,
 Sarah Walker <Sarah.Walker@imgtec.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Ever since 68129f431faa ("dma-buf: warn about containers in dma_resv object"),
dma_resv_add_shared_fence will warn if you attempt to add a container fence.
While most drivers were fine, fences can also be added to a dma_resv via the
recently added DMA_BUF_IOCTL_IMPORT_SYNC_FILE.  Use dma_fence_unwrap_for_each
to add each fence one at a time.

Fixes: 594740497e99 ("dma-buf: Add an API for importing sync files (v10)")
Signed-off-by: Jason Ekstrand <jason.ekstrand@collabora.com>
Reported-by: Sarah Walker <Sarah.Walker@imgtec.com>
Cc: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-buf.c | 23 +++++++++++++++++------
 1 file changed, 17 insertions(+), 6 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 630133284e2b..8d5d45112f52 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -15,6 +15,7 @@
 #include <linux/slab.h>
 #include <linux/dma-buf.h>
 #include <linux/dma-fence.h>
+#include <linux/dma-fence-unwrap.h>
 #include <linux/anon_inodes.h>
 #include <linux/export.h>
 #include <linux/debugfs.h>
@@ -391,8 +392,10 @@ static long dma_buf_import_sync_file(struct dma_buf *dmabuf,
 				     const void __user *user_data)
 {
 	struct dma_buf_import_sync_file arg;
-	struct dma_fence *fence;
+	struct dma_fence *fence, *f;
 	enum dma_resv_usage usage;
+	struct dma_fence_unwrap iter;
+	unsigned int num_fences;
 	int ret = 0;
 
 	if (copy_from_user(&arg, user_data, sizeof(arg)))
@@ -411,13 +414,21 @@ static long dma_buf_import_sync_file(struct dma_buf *dmabuf,
 	usage = (arg.flags & DMA_BUF_SYNC_WRITE) ? DMA_RESV_USAGE_WRITE :
 						   DMA_RESV_USAGE_READ;
 
-	dma_resv_lock(dmabuf->resv, NULL);
+	num_fences = 0;
+	dma_fence_unwrap_for_each(f, &iter, fence)
+		++num_fences;
 
-	ret = dma_resv_reserve_fences(dmabuf->resv, 1);
-	if (!ret)
-		dma_resv_add_fence(dmabuf->resv, fence, usage);
+	if (num_fences > 0) {
+		dma_resv_lock(dmabuf->resv, NULL);
 
-	dma_resv_unlock(dmabuf->resv);
+		ret = dma_resv_reserve_fences(dmabuf->resv, num_fences);
+		if (!ret) {
+			dma_fence_unwrap_for_each(f, &iter, fence)
+				dma_resv_add_fence(dmabuf->resv, f, usage);
+		}
+
+		dma_resv_unlock(dmabuf->resv);
+	}
 
 	dma_fence_put(fence);
 
-- 
2.36.1

