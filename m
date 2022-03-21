Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C18E4E28DF
	for <lists+dri-devel@lfdr.de>; Mon, 21 Mar 2022 14:59:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB8B610E44D;
	Mon, 21 Mar 2022 13:59:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3613910E443
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 13:59:08 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id t11so20837561wrm.5
 for <dri-devel@lists.freedesktop.org>; Mon, 21 Mar 2022 06:59:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7to46O8RG6dT71znjHPQf3/Q3TCF+8UI82fc84yI2fc=;
 b=L2mTERb01ZwGUZmVGDv/TVYoufjbL66PFHUf7wC3MmZvN9CNBaTaCG2CbA+DymmBeO
 ljmM11VL1bWBuX3cHghE3DpFc2xO+SMm7tULHdnGRScKRUuTTBbhx4QfgMqCddMiaZpi
 RHCj8xV3m4UFAXND1UjhN3M1VjVrl8gn0dDw65pc9CyfOo4pg25E1nWQOXQJqPaYc2dQ
 KHk0R/Z3CDsuoVvhpikEBcN0KKpoLtONp+V4XipWdPRSXMABamYXXaj6mIXliIlwiBbA
 KvmCpa+loUrt5vhh9xcn4j0J6HLExrRdpJdjxXJVoYw3OVyh68B8Dopf7tLxAZtY8cWV
 wLgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7to46O8RG6dT71znjHPQf3/Q3TCF+8UI82fc84yI2fc=;
 b=sgn34Y3UOKA/OZ9Ro0Sb4hVTlLDZNmCzl7sS2AaApCI7YJStRoddKEpCoapaZVgdmi
 /ACkgtlY01JtCHgjQdhOOr5IlxVwtIaCWjxQm5za9OKnMTo7uyJbd93TjwFmePHH3cgf
 s0YiCykwDANRlXxlW2vgZJp+ZrJ5n+TFLOm27OBzk/TU9OY0+s+CdJ65DUuoZA+QI8P1
 Nx+fMmqijWxCkbq7pu7bdwVIZFDj0X7MlOn4ApwF23jMQLRuv6mFpRGvuqOsHUyAz7BQ
 V203pixNBOWbAL7vwYmAwHcswUnADRvI2RyysTxhb7r3mC4RR1YgX20LkUGX9QDTQcSe
 q/4Q==
X-Gm-Message-State: AOAM531gy29gmKJEBHiptwJvEyR1QehFKQ5FXTu/GKeTXVk14pvyzR4e
 5WWJBXSN7l+h4DjXpbxA+Jc=
X-Google-Smtp-Source: ABdhPJzBAlspMv7IPJpGkDleaOrpxLmLtwJBWlEY1eW96DAQgyfyFxDPDV0bGmvMEpqMMzD+pfyKGw==
X-Received: by 2002:a5d:6d44:0:b0:1e4:9a6d:c171 with SMTP id
 k4-20020a5d6d44000000b001e49a6dc171mr18989289wri.468.1647871146812; 
 Mon, 21 Mar 2022 06:59:06 -0700 (PDT)
Received: from able.fritz.box (p5b0eab60.dip0.t-ipconnect.de. [91.14.171.96])
 by smtp.gmail.com with ESMTPSA id
 m3-20020a5d6243000000b001e33760776fsm13317640wrv.10.2022.03.21.06.59.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Mar 2022 06:59:06 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 10/23] dma-buf: finally make dma_resv_excl_fence private v2
Date: Mon, 21 Mar 2022 14:58:43 +0100
Message-Id: <20220321135856.1331-10-christian.koenig@amd.com>
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

v2: fix rebase clash

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c |  6 ++++++
 include/linux/dma-resv.h   | 17 -----------------
 2 files changed, 6 insertions(+), 17 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index c09fd8da0c85..1c9af97fe904 100644
--- a/drivers/dma-buf/dma-resv.c
+++ b/drivers/dma-buf/dma-resv.c
@@ -140,6 +140,12 @@ void dma_resv_fini(struct dma_resv *obj)
 }
 EXPORT_SYMBOL(dma_resv_fini);
 
+static inline struct dma_fence *
+dma_resv_excl_fence(struct dma_resv *obj)
+{
+       return rcu_dereference_check(obj->fence_excl, dma_resv_held(obj));
+}
+
 static inline struct dma_resv_list *dma_resv_shared_list(struct dma_resv *obj)
 {
 	return rcu_dereference_check(obj->fence, dma_resv_held(obj));
diff --git a/include/linux/dma-resv.h b/include/linux/dma-resv.h
index 08512c1e215d..20e13f36710a 100644
--- a/include/linux/dma-resv.h
+++ b/include/linux/dma-resv.h
@@ -423,23 +423,6 @@ static inline void dma_resv_unlock(struct dma_resv *obj)
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

