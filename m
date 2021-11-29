Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65CA8461490
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 13:07:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0504E6FA69;
	Mon, 29 Nov 2021 12:07:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7B446FA5B
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 12:07:09 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id o13so36150010wrs.12
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 04:07:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=X6ySwafYwpXOWfjGt/R2GvQ9sadn6tgCtihtrrGmV/M=;
 b=UeZryZJHfTmF8fPhMaF6TBuRW/W96jpGtczNhEPhy1TYcEbhpyZSwD0kUioV/HHryK
 LFEL6CI2FTynk+RGLVIunP2cldCN8EFuB0S8nGuYB5TtBukEaWa44B12cfKAopZgn4mU
 e+Ma0ud5GWGG0xHNn6ALSyUy8tD0Sdck2FyxeqGSIAMpzllXtOdxVQmixwAgTArdZpDK
 q0h+dS2DoRCWyUmQeNAXWiSCIXlnEiBRbeLZrFzg6odhr4EMPMoUhan3If2f5nHdLl6Z
 wAYJ8Yng0qGxR+xvEYsl8EvjOEQ+Ut8bRfmEWKPe5sAW/sYmOC5s5haH0RPPFg8fZVom
 1bjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=X6ySwafYwpXOWfjGt/R2GvQ9sadn6tgCtihtrrGmV/M=;
 b=wxsdqequdUYVPP1R1kaFa42rHjagOhDuhXrEbc1yQaxmBoBS0uOAxIXz6ZI01Lthj7
 Ad/2pfd67GOmMXHqfKdhtQbwDU7ypBj6kemWpxpk3W5wvFWfRouBIaApxwHSb1TLD9HW
 1bswfXr6+335f3X7XFy4iVzmzucTsAvrru+Tz3r7ns3YbhW+QsvD37hdzZYlh7U7ewWD
 //h/vaJ4RHssFMJD9tsbmPXNuAfwmKNsehYoG5Nb5aOSL45mUany4drQvF37xLmyMSI8
 FAgVQc3E7heAfn5dVwDjic2rPgxGqWHzCdViONDjR22aNYD+irT6mzYblMNhWN0lmg/f
 bmow==
X-Gm-Message-State: AOAM532ug4WOCC2bfneWRsFYJpWi14q7LyLsynR2u3YRNw/5DzdcQrHH
 YQwLpdkqqP9yKb2THQZCDeo=
X-Google-Smtp-Source: ABdhPJwsfjTSI+Z+n7IWuo7CoBW7/ZRoSaoue71ExheG8op170QO+gs/hv21daWUTwzXUtMnI0feIg==
X-Received: by 2002:a05:6000:2ae:: with SMTP id
 l14mr33386653wry.142.1638187628520; 
 Mon, 29 Nov 2021 04:07:08 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id b6sm20415234wmq.45.2021.11.29.04.07.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 04:07:08 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch
Subject: [PATCH 06/28] dma-buf: finally make the dma_resv_list private
Date: Mon, 29 Nov 2021 13:06:37 +0100
Message-Id: <20211129120659.1815-7-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211129120659.1815-1-christian.koenig@amd.com>
References: <20211129120659.1815-1-christian.koenig@amd.com>
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

