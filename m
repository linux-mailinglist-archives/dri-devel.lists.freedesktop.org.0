Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDD602558B8
	for <lists+dri-devel@lfdr.de>; Fri, 28 Aug 2020 12:40:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 239246EBAA;
	Fri, 28 Aug 2020 10:40:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com
 [IPv6:2a00:1450:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 408216EBA1;
 Fri, 28 Aug 2020 10:40:35 +0000 (UTC)
Received: by mail-ed1-x542.google.com with SMTP id l23so710892edv.11;
 Fri, 28 Aug 2020 03:40:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=P+O8V1X7MBTktF9XMnw2YVO3ydklUiiCZukkmNGfxv8=;
 b=kpe8iI+ju0/L18uQrpDoRpTie6sjfKtakX7FNOoVET297lP66XrnAeEIBdn2iM/bzO
 w/vAahZHVS0ZO66fDoO/N/azg16w+LYL4JpeYxkoCANOIPaBBltO+LP6iXFdN/xrf2/5
 IDXPMxskspOdv3m5l+yXCtFKtVIhCRpIXPR/XuZULrXd6Tw4h5LL0KLAPpc5KCxYlXWb
 Dm9mhuaULwhXsv8MgOAB1/5z4v2jps+WPhnsMdwkMncvYN81kNrH37IieQUSsjmmApPS
 D6H8ZOVXl1PiAJF6PjtPBWLK3IU+O7TcWZ4X1941aoVt1L0IDU+BBSVIY9ClOWo02/cs
 ItvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=P+O8V1X7MBTktF9XMnw2YVO3ydklUiiCZukkmNGfxv8=;
 b=FL4pdogCJzzTqrLZL4XVGVTBbQlOSJ9j8mwSvBW5YN0ZXaznrDPoUpZFi7VmVmVdAx
 NoiilR3+fkxkRYGk6ZhfX5fVU9CIcjGUWKMT/u4dNs1zxvBij+QYXLyJwO8BweIut7Pm
 pjO6yqFWgLrf5JRrCZayMmq7xCwNBMPC+cDiVQvhe2IlmVGmNlNKxY9lBkXSeTvbeZA6
 GPHHzJXLBtGY0pm1lKb+P0BqzFAliJbCGuMkNOwIMtCopanGtQkAVbTn1AZQVGk3L0iq
 7pDGZkIWkUvlMXpYZc8VulmJXrWSkYEpeQ/sSgca5O2aBA0464P9Gpr4hPI5CZG1fW4Q
 B8EQ==
X-Gm-Message-State: AOAM533m6sd3/IXzgCp7j1D3xVXUKTdfSXjXdZGowQ6dYkP0uhjY1wm2
 PQqBUdi+nHaP1ufKzuYPvs4=
X-Google-Smtp-Source: ABdhPJy/xgk8g11Uq1IB1tRo9NIrAnLL+fazoNpZT+lg5SN7vMoPS5OMR57Bp309QhyNI6B0pKMjpg==
X-Received: by 2002:a50:d683:: with SMTP id r3mr1225620edi.150.1598611233918; 
 Fri, 28 Aug 2020 03:40:33 -0700 (PDT)
Received: from localhost ([62.96.65.119])
 by smtp.gmail.com with ESMTPSA id i25sm656243edt.1.2020.08.28.03.40.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 28 Aug 2020 03:40:33 -0700 (PDT)
From: Thierry Reding <thierry.reding@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>
Subject: [PATCH 5/6] drm/nouveau: Support DMA fence arrays
Date: Fri, 28 Aug 2020 12:40:15 +0200
Message-Id: <20200828104016.1672195-6-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200828104016.1672195-1-thierry.reding@gmail.com>
References: <20200828104016.1672195-1-thierry.reding@gmail.com>
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Thierry Reding <treding@nvidia.com>

A DMA fence can be composed of multiple fences in an array. Support this
in the Nouveau driver by iteratively synchronizing to each DMA fence in
the array.

Signed-off-by: Thierry Reding <treding@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 31 ++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index 8530c2684832..c0849e09279c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -24,6 +24,7 @@
  *
  */
 
+#include <linux/dma-fence-array.h>
 #include <linux/ktime.h>
 #include <linux/hrtimer.h>
 #include <linux/sched/signal.h>
@@ -338,9 +339,9 @@ nouveau_fence_wait(struct nouveau_fence *fence, bool lazy, bool intr)
 		return 0;
 }
 
-int
-nouveau_fence_sync(struct dma_fence *fence, struct nouveau_channel *chan,
-		   bool intr)
+static int
+__nouveau_fence_sync(struct dma_fence *fence, struct nouveau_channel *chan,
+		     bool intr)
 {
 	struct nouveau_fence_chan *fctx = chan->fence;
 	struct nouveau_channel *prev = NULL;
@@ -363,6 +364,30 @@ nouveau_fence_sync(struct dma_fence *fence, struct nouveau_channel *chan,
 	return ret;
 }
 
+int
+nouveau_fence_sync(struct dma_fence *fence, struct nouveau_channel *chan,
+		   bool intr)
+{
+	int ret = 0;
+
+	if (dma_fence_is_array(fence)) {
+		struct dma_fence_array *array = to_dma_fence_array(fence);
+		unsigned int i;
+
+		for (i = 0; i < array->num_fences; i++) {
+			struct dma_fence *f = array->fences[i];
+
+			ret = __nouveau_fence_sync(f, chan, intr);
+			if (ret < 0)
+				break;
+		}
+	} else {
+		ret = __nouveau_fence_sync(fence, chan, intr);
+	}
+
+	return ret;
+}
+
 struct nouveau_fence *
 nouveau_fence_ref(struct nouveau_fence *fence)
 {
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
