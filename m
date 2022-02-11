Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED364B2646
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 13:50:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF0B710EBCE;
	Fri, 11 Feb 2022 12:50:25 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC79410EBC9
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 12:50:16 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id p24so22744331ejo.1
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 04:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=Q7yk9iPGieyJW2jMldb0VRidwZ4CAUl2DRMH9n+c1uY=;
 b=MiIQ60cBry7DfoxslGQe7AOopiQhbOsB2Bf9OihICnauA1gh0takjU/SmIcoqdsspV
 UniRP5doSdSwQKmoOM5myJgdPdG8xtb//GFdnMDe8phtWm/Y9O/OsQ8ctv/Ccgs1NPLJ
 rYlXwO/TySPsKzBY1RHnyWXXv93NcN6f6+t+e0VedDul3Zn3pWBKtuHtBj8GdEYiw1Tt
 jNk21EY/RGsaN3lmz+tTRaC/9UOe9rC2N6/wDbERcNb0FMyqMlZ1dCXWwEAMAq01kFEk
 7Jauwwq78PYQe5pesQwjyAdU8y5aMKKTTsURicFhF2o/ybNyxlIP2BL0ePP4YNpI13+a
 joFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Q7yk9iPGieyJW2jMldb0VRidwZ4CAUl2DRMH9n+c1uY=;
 b=xCxUCG2Gb2NW8hFDoDLsDoj8JTQf0AlrFnnoLYak9MH4SptT3HqrLWnai2qpGFQi1Q
 vNVrr4mB8q+gO2S9omm0gRvTOYOVAmsviBpsolQLXS6+BB/uHOon9tCpXhCHc6Xcb9Te
 hN1A4AQiKLFShEL3gbRvj5rzh/oykyO98KgGXOO1xVSta6rmOkjmbbJwG0dZxa8i9f8f
 NzHVKYnja/VQ8e3JzALhm9cricw7bJ9a1M0i+ojXtj03SGskJDcdQVSPP48q4xikttom
 uV8sSwVP/0CK8pAhvNL6dI5PeghtMAvGbZmxfp6OvxPYLnrl9+d3gDcbCkz8xe6SbB0+
 377A==
X-Gm-Message-State: AOAM5303FNcKwvvl1p3zI47NoF7SXdgVzjHc12OfFfduPcWzXl7av/+o
 6iE1ldUlsVo3OJWG+DdvebObU3CSvRs=
X-Google-Smtp-Source: ABdhPJyqNeBrZSbQYzXLmb9sFmH+NDSRDeOLRWrmaTWuBqIGQmoQdbAWV1hMSrpXe1B4PEEQqPPUjQ==
X-Received: by 2002:a17:906:5186:: with SMTP id
 y6mr1281644ejk.210.1644583815286; 
 Fri, 11 Feb 2022 04:50:15 -0800 (PST)
Received: from able.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id w22sm7868604ejc.137.2022.02.11.04.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 04:50:14 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, sumit.semwal@linaro.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH 10/23] dma-buf: finally make dma_resv_excl_fence private v2
Date: Fri, 11 Feb 2022 13:49:50 +0100
Message-Id: <20220211125003.918447-11-christian.koenig@amd.com>
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

v2: fix rebase clash

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/dma-buf/dma-resv.c |  6 ++++++
 include/linux/dma-resv.h   | 17 -----------------
 2 files changed, 6 insertions(+), 17 deletions(-)

diff --git a/drivers/dma-buf/dma-resv.c b/drivers/dma-buf/dma-resv.c
index 005fbe61103e..16ad98fd3130 100644
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

