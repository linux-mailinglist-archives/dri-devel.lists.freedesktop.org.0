Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 289E74E28A6
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 14:59:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA16010E43B;
	Mon, 21 Mar 2022 13:59:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2601C10E434
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 13:59:00 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 m26-20020a05600c3b1a00b0038c8b999f58so3157992wms.1
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 06:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=B5VsSVv2zVLCKdnNlyHMjLOPL3+vkbC7VKPDHXQwkiY=;
 b=p2chKqhZ5G8ktiyuz5F852zJ4GPiOsrEiNLPkOUA+3mNqHWnaDkf1xlE1dDsPZ8MJa
 UhtXYrRn39yqw4VkeqEzC0zXfb0uIAmpZomtAi+z43dtuj5u/csQLtSSTbvko0FZTw3l
 KRw+FfDE4ZN+spHVy47Co3hpArBVv9U3VRNGcte8cjAEXGKli6q6kMEpNGDKugnUhO96
 OHShWn9nC8MU8pABm+AzPo+n+N5Osc5dCJtRZ9CATLNohRtm5sDmnVCAEYNdMgV8/ktN
 GoVxjWdkjn5/c9GRvTujbtJWIls4S2L80vdDEZR+7YX3gYvQoPAg7HaZhqokUZDbDNzb
 mvIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=B5VsSVv2zVLCKdnNlyHMjLOPL3+vkbC7VKPDHXQwkiY=;
 b=k+kH74tbaSXEovjwyHaR7U8FELDg2uy8ztUtGQ9ne/4kvXqhtw7u4AFPlBUmthhkr4
 IWlZLHvUQ7m1INV0KVaNSoJAYoyKHxqW4Tj4Ae5J6Jwxr+iFUZrJRBsfSJBaZxnRd1jr
 odl26PuKOzp2//sexkxBRXraTyaolzY/oSNIXpi6RtaKPhd4z08uilIhcXFnhZlCjvGF
 2u5U+IMMVGbTNcRzy8TXXIGHjd9pJ+BITlsct1qKMZhrhiC0EERprxz/ti2ydCU3r6Yu
 se2luYQDfdi/utkUMmMqt3CE0VzLx0q4lfr443tFLfR1l1ZPs+NTmKSHSo+XPzV+Hj9I
 ZHqA==
X-Gm-Message-State: AOAM531+kaXyVRtWiz9vAPeAF18Feo68lAL5kx7dfLmzs8+c7GES9Bkk
 dOderycyyWQjN6s2ckNT24uhl6WLU2g=
X-Google-Smtp-Source: ABdhPJxWtZHk9LvNvDgZ0RMuFd/lFlzd9n08oJ3ttKDSn6VfKHZDHpBCGDPL08FtUzQ02+s6wCXS3Q==
X-Received: by 2002:a05:600c:4f42:b0:38c:21:fffe with SMTP id
 m2-20020a05600c4f4200b0038c0021fffemr25660131wmq.63.1647871138669; 
 Mon, 21 Mar 2022 06:58:58 -0700 (PDT)
Received: from able.fritz.box (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a5d6243000000b001e33760776fsm13317640wrv.10.2022.03.21.06.58.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 06:58:58 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 02/23] dma-buf: finally make the dma_resv_list private v2
Date: Mon, 21 Mar 2022 14:58:35 +0100
Message-Id: <20220321135856.1331-2-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220321135856.1331-1-christian.koenig@amd.com>
References: <20220321135856.1331-1-christian.koenig@amd.com>
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

Drivers should never touch this directly.

v2: drop kerneldoc for now internal handling

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/dma-buf/dma-resv.c | 11 +++++++++++
 include/linux/dma-resv.h   | 26 +-------------------------
 2 files changed, 12 insertions(+), 25 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 509060861cf3..5001e9b4420a 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -56,6 +56,12 @@
 DEFINE_WD_CLASS(reservation_ww_class);
 EXPORT_SYMBOL(reservation_ww_class);
 
+struct dma_resv_list {
+	struct rcu_head rcu;
+	u32 shared_count, shared_max;
+	struct dma_fence __rcu *shared[];
+};
+
 /**
  * dma_resv_list_alloc - allocate fence list
  * @shared_max: number of fences we need space for
@@ -133,6 +139,11 @@ void dma_resv_fini(struct dma_resv *obj)
 }
 EXPORT_SYMBOL(dma_resv_fini);
 
+static inline struct dma_resv_list *dma_resv_shared_list(struct dma_resv *obj)
+{
+	return rcu_dereference_check(obj->fence, dma_resv_held(obj));
+}
+
 /**
  * dma_resv_reserve_shared - Reserve space to add shared fences to
  * a dma_resv.
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index 3f53177bdb46..202cc65d0621 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -47,18 +47,7 @@
 
 extern struct ww_class reservation_ww_class;
 
-/**
- * struct dma_resv_list - a list of shared fences
- * @rcu: for internal use
- * @shared_count: table of shared fences
- * @shared_max: for growing shared fence table
- * @shared: shared fence table
- */
-struct dma_resv_list {
-	struct rcu_head rcu;
-	u32 shared_count, shared_max;
-	struct dma_fence __rcu *shared[];
-};
+struct dma_resv_list;
 
 /**
  * struct dma_resv - a reservation object manages fences for a buffer
@@ -451,19 +440,6 @@ dma_resv_excl_fence(struct dma_resv *obj)
 	return rcu_dereference_check(obj->fence_excl, dma_resv_held(obj));
 }
 
-/**
- * dma_resv_shared_list - get the reservation object's shared fence list
- * @obj: the reservation object
- *
- * Returns the shared fence list. Caller must either hold the objects
- * through dma_resv_lock() or the RCU read side lock through rcu_read_lock(),
- * or one of the variants of each
- */
-static inline struct dma_resv_list *dma_resv_shared_list(struct dma_resv *obj)
-{
-	return rcu_dereference_check(obj->fence, dma_resv_held(obj));
-}
-
 void dma_resv_init(struct dma_resv *obj);
 void dma_resv_fini(struct dma_resv *obj);
 int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences);
-- 
2.25.1

