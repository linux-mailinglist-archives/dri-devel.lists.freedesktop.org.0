Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CB4645A54C
	for <lists+dri-devel@lfdr.de>; Tue, 23 Nov 2021 15:21:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04D756E5A0;
	Tue, 23 Nov 2021 14:21:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 236806E525
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 14:21:27 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id i5so39317491wrb.2
 for <dri-devel@lists.freedesktop.org>; Tue, 23 Nov 2021 06:21:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UeVGp8prroNFBBkWzJroj9VafnuWlSITqFksKk2su68=;
 b=Iv/TxAnifxh6vEjMeYuZ6VDiXws0v9pyilzUms4criacfWdFgIHwDzUEWNw2Zyn+pz
 /PPD0mlLezrFH+YgYJKHorUsBH0V4Wuk0Vd30jgvh79S+r7kitwMigGIzu4VhRb6oXfN
 7zxOTOwr3I9IF6NraEtVNH/JdeYcSBssHUwpPDi9XFhWmINa8h2XAGNiNaYYwDWYK6a/
 jrW6STCbvvCJiCuPd9rX5D6W4rNttYQaqEzmlHbv43yxHisnW0+slFJfUHOpcOqk3Otj
 dj/1oaKtEFy872NPuZ61YUHSqgkywuPynxzIBZR1D2dhdy5Y7aHIlNsxatbGwpV+Q7Gb
 Rq/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UeVGp8prroNFBBkWzJroj9VafnuWlSITqFksKk2su68=;
 b=zDMkEzpEq5kqwK30p4s/E0dYcK4Y+3z6n7pFrxVFg3exDUnhDftx4sypjKPn8KKKWk
 EhJ4QpGTqFeNDOWEGYq4B9COZ0afziKLtNMgS9x+HvGU4eqM2bDrkpZQY8Catuqbf6Rt
 AcOHRyVkqX85Yk+fx7Sa9/C/XjzWwRBrhlnl1RcEa4ZBDOl8V1yDGrII9JHuuzA4+eeA
 XdaWbAHpqcArpG+Nduq2TqWRmrNNJJDB732+ZVoMbhHXFYIU8pYkmvHVxZkqjjW01yit
 TmFMlQAzDkws1W/fP9ADK1Hzrhq3Notq2Nh0v2H9QZDB7HC4QUQcX/Md7NS+gPHeFTwi
 VyZQ==
X-Gm-Message-State: AOAM531ykcxGa5aETQyWxBIj9VqeMHa2tzux2x1hSM/zCnBGlJJCBbto
 8MljDZ3xl9JKKBu6EC/45zc=
X-Google-Smtp-Source: ABdhPJydoWLun2Lona4C6JNk9ptBjjSxh1zZg9ZRryxr/+ClCo5eRph7eLxajU/yyhS7EUN9rcTUww==
X-Received: by 2002:adf:fb86:: with SMTP id a6mr7603351wrr.35.1637677285648;
 Tue, 23 Nov 2021 06:21:25 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id t8sm1645928wmq.32.2021.11.23.06.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Nov 2021 06:21:25 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: sumit.semwal@linaro.org,
	daniel@ffwll.ch
Subject: [PATCH 06/26] dma-buf: finally make the dma_resv_list private
Date: Tue, 23 Nov 2021 15:20:51 +0100
Message-Id: <20211123142111.3885-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211123142111.3885-1-christian.koenig@amd.com>
References: <20211123142111.3885-1-christian.koenig@amd.com>
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
Cc: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drivers should never touch this directly.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 26 ++++++++++++++++++++++++++
 include/linux/dma-resv.h   | 26 +-------------------------
 2 files changed, 27 insertions(+), 25 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 0daed67cab0e..611bba5528ad 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -56,6 +56,19 @@
 DEFINE_WD_CLASS(reservation_ww_class);
 EXPORT_SYMBOL(reservation_ww_class);
 
+/**
+ * struct dma_resv_list - a list of shared fences
+ * @rcu: for internal use
+ * @shared_count: table of shared fences
+ * @shared_max: for growing shared fence table
+ * @shared: shared fence table
+ */
+struct dma_resv_list {
+	struct rcu_head rcu;
+	u32 shared_count, shared_max;
+	struct dma_fence __rcu *shared[];
+};
+
 /**
  * dma_resv_list_alloc - allocate fence list
  * @shared_max: number of fences we need space for
@@ -161,6 +174,19 @@ void dma_resv_fini(struct dma_resv *obj)
 }
 EXPORT_SYMBOL(dma_resv_fini);
 
+/**
+ * dma_resv_shared_list - get the reservation object's shared fence list
+ * @obj: the reservation object
+ *
+ * Returns the shared fence list. Caller must either hold the objects
+ * through dma_resv_lock() or the RCU read side lock through rcu_read_lock(),
+ * or one of the variants of each
+ */
+static inline struct dma_resv_list *dma_resv_shared_list(struct dma_resv *obj)
+{
+	return rcu_dereference_check(obj->fence, dma_resv_held(obj));
+}
+
 /**
  * dma_resv_reserve_shared - Reserve space to add shared fences to
  * a dma_resv.
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index 0eb0c08c51c9..e0cec3a57c08 100644
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
@@ -440,19 +429,6 @@ dma_resv_excl_fence(struct dma_resv *obj)
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

