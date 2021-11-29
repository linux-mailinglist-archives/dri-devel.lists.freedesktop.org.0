Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA38D4614A7
	for <lists+dri-devel@lfdr.de>; Mon, 29 Nov 2021 13:08:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 977A76F42C;
	Mon, 29 Nov 2021 12:08:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA2786FA5F
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 12:07:25 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 77-20020a1c0450000000b0033123de3425so16670744wme.0
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Nov 2021 04:07:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ao0QlwnIR0BPrNFzKmnkW6LgKGwtPEdX/Cj9AXAbbyo=;
 b=jevFp14fe/qtyapDl2L94QQ1SJX8LTYt3/+Rk4yVNJ3D2j5rmp+A8waLILQZZN8qma
 lpSd5jyBKq6/U5YB0uJt2bFs5rd+tzmIAdq34vOZV0VzBln/Xd9KeLJ2mwUMwehhm/UM
 oB4hERJvA5y/cggH8/Qs/BnimO8KVZW+3N9amUOAyc2lmiPsPbyrg0uRuK61mWnLeTJJ
 RGQGh7lgy6gFq6OqFrcb/5DP/vYw1xI6uRaOU/UxUH/uzJ0nAUVDyoldPUMSrpWzkQqt
 +b3y5OGU7wX8o3T6ub4a9aJunF4d6Kes/W69EwIZzrYW5YpdRudDZrs2CRzgN7kLWxUn
 zTPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ao0QlwnIR0BPrNFzKmnkW6LgKGwtPEdX/Cj9AXAbbyo=;
 b=HQhLXRb20k189IxKQTrlXpSNyuPDcAW45n3r632UenawDwecl9WneCqobDKhircDYH
 swpdcwOiJeZPImGRb6qhrNfGeLoEQbAtNfQd4CqjDqZTuktfppsL4++X+CrkQmlSdphp
 YJrRYQsFjPamjxLBsbCB2FieMU7dJaRaCI4mvU86j71XY7E9pZdCE7dw/4l4IerJ9wo2
 KE/PxiH3rAy9kNjE0LxQHUj180EeWwF+W9VgGoJsn0SjB/CxR700qjKHZrowAX58kaAp
 l4ZkYDWlZpmbBJZB7pxDSrSg7ORko+spPFeONU9UIwgNR22Ojm10YIOLQW3icRgNepuz
 RgTg==
X-Gm-Message-State: AOAM5326A0QcbV06WzPz06iozTpwYHBQERx5sR7QoUUi2WHaI3A9tSQK
 3LTvdI4mIuEeOJ1+diycgL4=
X-Google-Smtp-Source: ABdhPJyrnR/81obxJKIzYMVAvUsSU+yK/bVJWztl2phcRNfRcgdST2eKpZZ6arJm8pKSG7JHstJPaQ==
X-Received: by 2002:a1c:448b:: with SMTP id r133mr36603134wma.85.1638187643831; 
 Mon, 29 Nov 2021 04:07:23 -0800 (PST)
Received: from abel.fritz.box (p57b0b77b.dip0.t-ipconnect.de. [87.176.183.123])
 by smtp.gmail.com with ESMTPSA id b6sm20415234wmq.45.2021.11.29.04.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 04:07:23 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch
Subject: [PATCH 16/28] dma-buf: finally make dma_resv_excl_fence private
Date: Mon, 29 Nov 2021 13:06:47 +0100
Message-Id: <20211129120659.1815-17-christian.koenig@amd.com>
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
 drivers/dma-buf/dma-resv.c | 17 +++++++++++++++++
 include/linux/dma-resv.h   | 17 -----------------
 2 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 694716a3d66d..9acceabc9399 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -147,6 +147,23 @@ void dma_resv_fini(struct dma_resv *obj)
 }
 EXPORT_SYMBOL(dma_resv_fini);
 
+/**
+ * dma_resv_excl_fence - return the object's exclusive fence
+ * @obj: the reservation object
+ *
+ * Returns the exclusive fence (if any). Caller must either hold the objects
+ * through dma_resv_lock() or the RCU read side lock through rcu_read_lock(),
+ * or one of the variants of each
+ *
+ * RETURNS
+ * The exclusive fence or NULL
+ */
+static inline struct dma_fence *
+dma_resv_excl_fence(struct dma_resv *obj)
+{
+	return rcu_dereference_check(obj->fence_excl, dma_resv_held(obj));
+}
+
 /**
  * dma_resv_shared_list - get the reservation object's shared fence list
  * @obj: the reservation object
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index cdfbbda6f600..40ac9d486f8f 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -412,23 +412,6 @@ static inline void dma_resv_unlock(struct dma_resv *obj)
 	ww_mutex_unlock(&obj->lock);
 }
 
-/**
- * dma_resv_excl_fence - return the object's exclusive fence
- * @obj: the reservation object
- *
- * Returns the exclusive fence (if any). Caller must either hold the objects
- * through dma_resv_lock() or the RCU read side lock through rcu_read_lock(),
- * or one of the variants of each
- *
- * RETURNS
- * The exclusive fence or NULL
- */
-static inline struct dma_fence *
-dma_resv_excl_fence(struct dma_resv *obj)
-{
-	return rcu_dereference_check(obj->fence_excl, dma_resv_held(obj));
-}
-
 void dma_resv_init(struct dma_resv *obj);
 void dma_resv_fini(struct dma_resv *obj);
 int dma_resv_reserve_shared(struct dma_resv *obj, unsigned int num_fences);
-- 
2.25.1

