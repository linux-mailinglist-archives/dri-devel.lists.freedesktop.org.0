Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DA44B263C
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 13:50:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC9E410EB97;
	Fri, 11 Feb 2022 12:50:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B277210EB8A
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 12:50:10 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id f17so16420999edd.2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 04:50:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=LMx9g6auTGQos2ixTpdRsDRCLAD6z8m8Q1+6qOerHCI=;
 b=qgJnU3sqxhclwPfnmb+HgzygociTO0RxC8EKglaiHSKyZMbSuVuluZtY/pyFUYvtR5
 1Yo/eZPVPNZ5THMj8rpIt24UAIhaWo41PiM+odECNZjmkjbty7rr+oLFWJKALO66lqVO
 GYoGxCDL6/KdQvwZkIIHJ1KHlvxux8KPtmg0MvvxYRAqg6r3SGd8QwqvbHNyIttze0XB
 0rkIMwK49ViBRDPsVh3KBtZQixLBQpfWmLkJkTQnKIQzQftc3W+w2DP8vOX735HNAJx8
 5us83a4HcJgzmNkeSpSj8nldpQ9R5f/R7bgZ31rTyYfl6P/kRc5Zrp/Fdy25nNEDblc8
 LYFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=LMx9g6auTGQos2ixTpdRsDRCLAD6z8m8Q1+6qOerHCI=;
 b=Qd2KPQIRESy2oYwzN24l8nTPB5pWdCosuM7BZ54B1I5LRZBjINv791113rEAv4RoM6
 EvLq4gK3wediGhgbk35LVGc+63LVkKCIBmXnDojPQx4DzOQfaWrrzdvU/kETY4NTwi7N
 Ok2flv4rF6n6Aoi7a0/xHp9z+5JMVqDp5X56VM3yOquuwCdm9iYXaygiF/ctJoosbzYW
 QVTxdC5WIU3IrJLvOuJEheJcD1+X4ZQ+7kf9ZVywL4dGbg8m7QExE3Yr5yaM4haHw2sq
 2N4HXPzf1ewlZ0rnfsQXU1TKwkKrWytHKwMIRxWo2L+YA+2KMj9JfydFLk72+cqmM7eu
 CNNA==
X-Gm-Message-State: AOAM531izK9sSzQpt6na0EKnP03FxAKmA+0E5EvBpIiSkt+nintvKWGb
 r1mRhd56c0pLNxB/sVJ5AYg=
X-Google-Smtp-Source: ABdhPJzPhjcyY27cxvBqmqE21HqSPw6J7erg8a2VIeX3ntjM4fvthVcPlo0fpx/kGxSnKfg+jjiWKw==
X-Received: by 2002:a05:6402:d75:: with SMTP id
 ec53mr1745321edb.446.1644583809199; 
 Fri, 11 Feb 2022 04:50:09 -0800 (PST)
Received: from able.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id w22sm7868604ejc.137.2022.02.11.04.50.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 04:50:08 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, sumit.semwal@linaro.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH 02/23] dma-buf: finally make the dma_resv_list private v2
Date: Fri, 11 Feb 2022 13:49:42 +0100
Message-Id: <20220211125003.918447-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220211125003.918447-1-christian.koenig@amd.com>
References: <20220211125003.918447-1-christian.koenig@amd.com>
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

Drivers should never touch this directly.

v2: drop kerneldoc for now internal handling

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/dma-buf/dma-resv.c | 11 +++++++++++
 include/linux/dma-resv.h   | 26 +-------------------------
 2 files changed, 12 insertions(+), 25 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 2230b8c4a595..bc652ce4e9a9 100644
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

