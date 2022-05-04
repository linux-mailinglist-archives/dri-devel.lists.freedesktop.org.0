Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CA5519F2B
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 14:23:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BAAA10F141;
	Wed,  4 May 2022 12:23:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7037C10EED8
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 12:23:01 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id k2so1779877wrd.5
 for <dri-devel@lists.freedesktop.org>; Wed, 04 May 2022 05:23:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=smZ0gPWNwgVHNUbqNV9nPBAq01gHQFd4S8+q2+TY58s=;
 b=JTj8tgy5CRpWboVU8mK1T6TSdxlr429iQ+B9CpuHuCPZqBUbqsZ2g6eoZA1M8cFXvc
 oLCffs8PAbcSyFPI7WsWoSmkpFJu3oBVW/nS7VofEoKthNl1iYlYEny/FPNQObHo3Km5
 mnZfC/mtDll7+9QWuZ370zTxHOrfaJiTfb4WDlx1WDfwA8PSJs1l/+7zkA6GKfxvEYH4
 iOdHPMdFYrYrdFOazj5TgXJ+cmVjKm3GdIAnqYycX44iQYacKFqc+WYJM6ZJw8s+x6lw
 FoQwFrvHSMXWmh/VwbnJbzz8aRsRrkQ7nq0fWl8CPHuUE9rmpDp7SovVzojnSe8mFgCc
 uZXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=smZ0gPWNwgVHNUbqNV9nPBAq01gHQFd4S8+q2+TY58s=;
 b=r7ZeE3kaTPn7trzcTU4YMRYOFK8PlPNBPcpQCV5dhCASNoIWsWN6wYscErn0WHByEb
 RaIgn0X7td2ESbAQ6F/4n1WCEwy720ltFZsO1cHh+3rT3D6KFbv001/dDD666V1ys04p
 N1rPwl1u9KMnvZcm2F57Ju1/okbSEhdQXoZd1B4GHPKC2w++RjASze4v6M1LdKE+ZFEK
 oFxOmotrzhMheQPvYJvF/jF+E1mjweFgyo6Z9awuoy14OD75rKijEzzCP6gHu+mr3ut0
 aRkm97fEXyQT6L3N3EwH0jv7+DcvJxNLnVREPVMOQv5yzmDRR8X1NTXpM+gFctFBxUpN
 YR1A==
X-Gm-Message-State: AOAM533HbQmsh6jHs7sIeIoE0dAKV0AGJ8Yh98hQWxAaD1kVBj1VJqE5
 UEleGUWndz0jWWecJGn3o5k=
X-Google-Smtp-Source: ABdhPJzLsQZjFJcpUbgh8ffoMhaIOj98eLnhdS9WN3QPlPkOAOLEcagEhhOLkhmNl9emK5oICD4jlQ==
X-Received: by 2002:a5d:6e90:0:b0:20a:ce36:48fb with SMTP id
 k16-20020a5d6e90000000b0020ace3648fbmr16160339wrz.628.1651666980017; 
 Wed, 04 May 2022 05:23:00 -0700 (PDT)
Received: from able.fritz.box (p57b0b7c9.dip0.t-ipconnect.de. [87.176.183.201])
 by smtp.gmail.com with ESMTPSA id
 l28-20020a05600c1d1c00b003942a244ed1sm1462119wms.22.2022.05.04.05.22.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 05:22:59 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, linux-media@vger.kernel.org
Subject: [PATCH 3/5] dma-buf: return only unsignaled fences in
 dma_fence_unwrap_for_each
Date: Wed,  4 May 2022 14:22:54 +0200
Message-Id: <20220504122256.1654-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220504122256.1654-1-christian.koenig@amd.com>
References: <20220504122256.1654-1-christian.koenig@amd.com>
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
Cc: =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dma_fence_chain containers cleanup signaled fences automatically, so
filter those out from arrays as well.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-fence-unwrap.c | 23 ++++++++++++++++-------
 include/linux/dma-fence-unwrap.h   |  4 ++--
 2 files changed, 18 insertions(+), 9 deletions(-)

diff --git a/drivers/dma-buf/dma-fence-unwrap.c b/drivers/dma-buf/dma-fence-unwrap.c
index 711be125428c..7b0b91086ded 100644
--- a/drivers/dma-buf/dma-fence-unwrap.c
+++ b/drivers/dma-buf/dma-fence-unwrap.c
@@ -32,8 +32,13 @@ __dma_fence_unwrap_array(struct dma_fence_unwrap *cursor)
 struct dma_fence *dma_fence_unwrap_first(struct dma_fence *head,
 					 struct dma_fence_unwrap *cursor)
 {
+	struct dma_fence *tmp;
+
 	cursor->chain = dma_fence_get(head);
-	return __dma_fence_unwrap_array(cursor);
+	tmp = __dma_fence_unwrap_array(cursor);
+	if (tmp && dma_fence_is_signaled(tmp))
+		tmp = dma_fence_unwrap_next(cursor);
+	return tmp;
 }
 EXPORT_SYMBOL_GPL(dma_fence_unwrap_first);
 
@@ -48,12 +53,16 @@ struct dma_fence *dma_fence_unwrap_next(struct dma_fence_unwrap *cursor)
 {
 	struct dma_fence *tmp;
 
-	++cursor->index;
-	tmp = dma_fence_array_next(cursor->array, cursor->index);
-	if (tmp)
-		return tmp;
+	do {
+		++cursor->index;
+		tmp = dma_fence_array_next(cursor->array, cursor->index);
+		if (tmp && !dma_fence_is_signaled(tmp))
+			return tmp;
+
+		cursor->chain = dma_fence_chain_walk(cursor->chain);
+		tmp = __dma_fence_unwrap_array(cursor);
+	} while (tmp && dma_fence_is_signaled(tmp));
 
-	cursor->chain = dma_fence_chain_walk(cursor->chain);
-	return __dma_fence_unwrap_array(cursor);
+	return tmp;
 }
 EXPORT_SYMBOL_GPL(dma_fence_unwrap_next);
diff --git a/include/linux/dma-fence-unwrap.h b/include/linux/dma-fence-unwrap.h
index e7c219da4ed7..e9d114637294 100644
--- a/include/linux/dma-fence-unwrap.h
+++ b/include/linux/dma-fence-unwrap.h
@@ -41,8 +41,8 @@ struct dma_fence *dma_fence_unwrap_next(struct dma_fence_unwrap *cursor);
  * @head: starting point for the iterator
  *
  * Unwrap dma_fence_chain and dma_fence_array containers and deep dive into all
- * potential fences in them. If @head is just a normal fence only that one is
- * returned.
+ * potential none signaled fences in them. If @head is just a normal fence only
+ * that one is returned.
  */
 #define dma_fence_unwrap_for_each(fence, cursor, head)			\
 	for (fence = dma_fence_unwrap_first(head, cursor); fence;	\
-- 
2.25.1

