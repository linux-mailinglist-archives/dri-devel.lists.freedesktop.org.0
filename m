Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96B5D46BB2D
	for <lists+dri-devel@lfdr.de>; Tue,  7 Dec 2021 13:34:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B9D96E08A;
	Tue,  7 Dec 2021 12:34:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EFA0572E42
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Dec 2021 12:34:17 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id u17so21837297wrt.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Dec 2021 04:34:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=X6ySwafYwpXOWfjGt/R2GvQ9sadn6tgCtihtrrGmV/M=;
 b=n3Gy/ka6VdwVP7M2WyGFmQXCIYUjd6zhDiH94PN4hUlhgnlMtv9QcHoLrguuBrEXhI
 zhTEwwlvW7KyHzd3CEWxkMucvQTjGjDQBBfhdW6zuX9rokj8TiaoDkFfXE72IqE5ZamK
 pi1H27XRVGM1S5lklqNxCY4QR70FYe9gxb9dgozRo4D8JPwoH7OdcJ+qPO1pU8CAP+ri
 OPy7MI/Pbc9f7xhnjqwVcNDQkpddupoZtaRIirzIYARaU4LHZGpCYpO76B0RBX8vwZzM
 onIznBCRx8Ft71ZpHGqrB8E7a9YkoykavkfBaITX2Ujunj/xHOcIhvUuD3MjDRsv3Z0E
 wwYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X6ySwafYwpXOWfjGt/R2GvQ9sadn6tgCtihtrrGmV/M=;
 b=xxdAu7PvMd7zCN+Cm1KIhYsadrFsboAzB0GLO5Zfay4Rqz0WURiNmaQkA+7geHDjAk
 9tNOAmgjufBTxPw5RXedpabntxMkdRXMbXBbVoqshJKYt5NPpVnrxwf5Gk8wq7O5brye
 J3V05bQL67llCqx8Vu98Fe0VXDMx3TjyIaQoVc+n+pq40h6PZUyS/bkKMmpvThbjE+Bq
 +TS5aD5E+wmN9IIHYCw8BnVBMJxRnTRvIfCgdqUt7yCZ0NrlHb3vNB7u4bGE/R2AkN8h
 lkenoVciM2oKiwP5Hy971UsB9a/DzMbx/Tru+3hLxCgpJgCyslG9aXEzWON8xp4JAa/O
 PgDg==
X-Gm-Message-State: AOAM532hRKXAXpFlDjgPD6AGzH6KCXlPwtwwjHynJFAbRBQo/spEeZ1a
 FEm1Kq4bU/zZPvjynB7Cs8+BPj8Ob00=
X-Google-Smtp-Source: ABdhPJwYtW7hTK0a47mT2MpXFFjWvLhSE9MJhTafxEYBh5i6Oc9qOl2cwig0KjhomRynszJC3m7J3A==
X-Received: by 2002:a05:6000:1681:: with SMTP id
 y1mr50887742wrd.52.1638880456600; 
 Tue, 07 Dec 2021 04:34:16 -0800 (PST)
Received: from abel.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id f19sm2802203wmq.34.2021.12.07.04.34.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Dec 2021 04:34:16 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org
Subject: [PATCH 02/24] dma-buf: finally make the dma_resv_list private
Date: Tue,  7 Dec 2021 13:33:49 +0100
Message-Id: <20211207123411.167006-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211207123411.167006-1-christian.koenig@amd.com>
References: <20211207123411.167006-1-christian.koenig@amd.com>
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

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c | 26 ++++++++++++++++++++++++++
 include/linux/dma-resv.h   | 26 +-------------------------
 2 files changed, 27 insertions(+), 25 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index a688dbded3d3..a12a3a39f280 100644
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
@@ -133,6 +146,19 @@ void dma_resv_fini(struct dma_resv *obj)
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
index e0be34265eae..3baf2a4a9a0d 100644
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

