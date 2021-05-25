Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BB36390B32
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 23:18:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 260CF89358;
	Tue, 25 May 2021 21:18:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B8FC6EB52
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 21:18:12 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 pi6-20020a17090b1e46b029015cec51d7cdso13900560pjb.5
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 14:18:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=CbePMyIlBcQSF8R+LXMprWheoIU4n7xx3MVF6E4IC+Y=;
 b=ZIuTqBc1fm8r/v+UNhuaoyRwvkdsZmJ1eny412qRypVYvPFZ/YCsH0OK38v6TTVFkS
 yLOjv6RFfYqJbIFMwgiOwULstCDj8ANE6WS7xeBlh668ZyRZ0heW4cMmal3xnHID6ezB
 Aisw3Mgvx+0H/WmBr9HgtY1kqzjZS+xslpwMGEINc39lY0X/ppMCyHGxRBUEn7zHj9MX
 sxPj8k25y3PqrdfxSMK3mSCMLvGA9ywzMR9/pkv4GICsn1cG5ImdSOMF8liMsSOS4S8K
 aTU/gAq4Blc7GWHXkU51x8ZsF/0EyBFFT8aLj8BbLPm9kKcywTTM+U2zgSYJjIbSn4qt
 gijQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=CbePMyIlBcQSF8R+LXMprWheoIU4n7xx3MVF6E4IC+Y=;
 b=AsrYfj6SpIMgNX8ozPox/BD0F3CrB8yn+COUEMKfhW14CXndWs/4znIeTyCcE5dVLG
 I+J02ZdQSga3GYElShyNlVZ1eg1lL8r0LpCJv59RsAlHPtkiv6fjLHMWvE1o3VcUATAl
 ppNBn82x7aZZ/EAd4f7bMUaS9twbWCqicXJLohmUniH7nMRLQsxDGDopaaNHedhsfP9r
 XU9wrQala/vN55R3jxxRiaI1B4dcIYd85Kw1TavKUorGl+p+g3ZQ0l1u8zoKZNub++yb
 NrynKlOfS4G6yItFB4sMAv3T5fydHN2qHjfmB6qqpBZd0RiAoa8rhslv7i8fqaHzktjD
 hfuw==
X-Gm-Message-State: AOAM533jDit1L2Mwo0anRyz9vL4+CgxVNY99Guc2SH6o7+m8/cNf8I3Z
 opoyafii7L8ICLYytdwbpVo3wIM7bYcrpQ==
X-Google-Smtp-Source: ABdhPJwUc8EpMlwJiEyLt62zniksrdoI8IOw579MwiSPzkd612GnTa5JiMDouq0QB3r2n0AiDpjrLA==
X-Received: by 2002:a17:90b:128d:: with SMTP id
 fw13mr305667pjb.211.1621977491633; 
 Tue, 25 May 2021 14:18:11 -0700 (PDT)
Received: from omlet.lan ([134.134.139.83])
 by smtp.gmail.com with ESMTPSA id e186sm14342278pfa.145.2021.05.25.14.18.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 14:18:11 -0700 (PDT)
From: Jason Ekstrand <jason@jlekstrand.net>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 6/7] RFC: dma-buf: Add an extra fence to
 dma_resv_get_singleton_unlocked
Date: Tue, 25 May 2021 16:17:52 -0500
Message-Id: <20210525211753.1086069-7-jason@jlekstrand.net>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210525211753.1086069-1-jason@jlekstrand.net>
References: <20210525211753.1086069-1-jason@jlekstrand.net>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Jason Ekstrand <jason@jlekstrand.net>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

For dma-buf sync_file import, we want to get all the fences on a
dma_resv plus one more.  We could wrap the fence we get back in an array
fence or we could make dma_resv_get_singleton_unlocked take "one more"
to make this case easier.

Signed-off-by: Jason Ekstrand <jason@jlekstrand.net>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Christian König <christian.koenig@amd.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
---
 drivers/dma-buf/dma-buf.c  |  2 +-
 drivers/dma-buf/dma-resv.c | 23 +++++++++++++++++++++--
 include/linux/dma-resv.h   |  3 ++-
 3 files changed, 24 insertions(+), 4 deletions(-)

diff --git a/drivers/dma-buf/dma-buf.c b/drivers/dma-buf/dma-buf.c
index 65a9574ee04ed..ea117de962903 100644
--- a/drivers/dma-buf/dma-buf.c
+++ b/drivers/dma-buf/dma-buf.c
@@ -389,7 +389,7 @@ static long dma_buf_export_sync_file(struct dma_buf *dmabuf,
 		return fd;
 
 	if (arg.flags & DMA_BUF_SYNC_WRITE) {
-		fence = dma_resv_get_singleton_unlocked(dmabuf->resv);
+		fence = dma_resv_get_singleton_unlocked(dmabuf->resv, NULL);
 		if (IS_ERR(fence)) {
 			ret = PTR_ERR(fence);
 			goto err_put_fd;
diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 23db2181c8ad8..5a5e13a01e516 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -527,6 +527,7 @@ EXPORT_SYMBOL_GPL(dma_resv_get_fences_unlocked);
 /**
  * dma_resv_get_singleton_unlocked - get a single fence for the dma_resv object
  * @obj: the reservation object
+ * @extra: extra fence to add to the resulting array
  *
  * Get a single fence representing all unsignaled fences in the dma_resv object
  * plus the given extra fence. If we got only one fence return a new
@@ -535,7 +536,8 @@ EXPORT_SYMBOL_GPL(dma_resv_get_fences_unlocked);
  * RETURNS
  * The singleton dma_fence on success or an ERR_PTR on failure
  */
-struct dma_fence *dma_resv_get_singleton_unlocked(struct dma_resv *obj)
+struct dma_fence *dma_resv_get_singleton_unlocked(struct dma_resv *obj,
+						  struct dma_fence *extra)
 {
 	struct dma_fence *result, **resv_fences, *fence, *chain, **fences;
 	struct dma_fence_array *array;
@@ -546,7 +548,7 @@ struct dma_fence *dma_resv_get_singleton_unlocked(struct dma_resv *obj)
 	if (err)
 		return ERR_PTR(err);
 
-	if (num_resv_fences == 0)
+	if (num_resv_fences == 0 && !extra)
 		return NULL;
 
 	num_fences = 0;
@@ -562,6 +564,16 @@ struct dma_fence *dma_resv_get_singleton_unlocked(struct dma_resv *obj)
 		}
 	}
 
+	if (extra) {
+		dma_fence_deep_dive_for_each(fence, chain, j, extra) {
+			if (dma_fence_is_signaled(fence))
+				continue;
+
+			result = fence;
+			++num_fences;
+		}
+	}
+
 	if (num_fences <= 1) {
 		result = dma_fence_get(result);
 		goto put_resv_fences;
@@ -582,6 +594,13 @@ struct dma_fence *dma_resv_get_singleton_unlocked(struct dma_resv *obj)
 		}
 	}
 
+	if (extra) {
+		dma_fence_deep_dive_for_each(fence, chain, j, extra) {
+			if (dma_fence_is_signaled(fence))
+				fences[num_fences++] = dma_fence_get(fence);
+		}
+	}
+
 	if (num_fences <= 1) {
 		result = num_fences ? fences[0] : NULL;
 		kfree(fences);
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index c5fa09555eca5..4b1dabfa7017d 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -285,7 +285,8 @@ int dma_resv_get_fences_unlocked(struct dma_resv *obj,
 
 int dma_resv_copy_fences(struct dma_resv *dst, struct dma_resv *src);
 
-struct dma_fence *dma_resv_get_singleton_unlocked(struct dma_resv *obj);
+struct dma_fence *dma_resv_get_singleton_unlocked(struct dma_resv *obj,
+						  struct dma_fence *extra);
 
 long dma_resv_wait_timeout_unlocked(struct dma_resv *obj, bool wait_all, bool intr,
 				    unsigned long timeout);
-- 
2.31.1

