Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D019D41EA90
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 12:07:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C77D6EDF9;
	Fri,  1 Oct 2021 10:06:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2E5A6EDE0;
 Fri,  1 Oct 2021 10:06:34 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 g19-20020a1c9d13000000b003075062d4daso6382237wme.0; 
 Fri, 01 Oct 2021 03:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=by8trJVpX1Yx/8GVC1WzD9CSlRZcllVkqP6ongV+oMI=;
 b=KXbwWoEASyQRsPuv46mUDMotK0Bcif+uiHZAp4YIIqwwTbHos+IZJPI4rZHU1TbmZJ
 1nJO6fk2NViAzlCQRF5SYfwt2q9eB7Fsb+Pe8b5ffcEcrJO1CcVK8Um2p733gPBiyz9c
 0gxWwQfNwHPheQEQsPoaxwI9d16TG35+ISWIdcvyFXtMFR9YpH5DECmihkGTLnLxmw7O
 +ogdMbOiQ5cX+QDXaJ0THmIjriLY2XxCJ6TXfdMhQLhkDyUwZMC9n5Q8XjjD0wHihjB8
 qY5xF+BJcdc4OcMXKvZOc2upqpirE/igGCZCNQcN9SEo5N4RFflm5Q7+B1NZiuzTYc9c
 xMRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=by8trJVpX1Yx/8GVC1WzD9CSlRZcllVkqP6ongV+oMI=;
 b=K9671//NzADU9Msp0KjUkGYEnLTpcbDdJPHRE7+kH7BDPy+ny10Q99Ws/5+Vrm50yr
 8F+s241ZTbb3zA7whFKaIXI2wl6MODPDAsIOcATQxyDdA/ONkv1m7PjnOAndYcTo7x8T
 hbhS0e2QuHmTaj5JKQltSGuFmAFWl1r6n5YCn/SAVq59BPWZ5WZurJZ450puRIpOXFEB
 VxNZsntCgDGQDHTEgnIGwlZ1XArSwGAcs3jyIA/X40fcd/5DwAa1b7e90lzd67pLlRYx
 AlQB7g+F4+oM9qb4EhRNJ+Dz91QtuFkvhpYaMn0sCl138LgC0VTuyZUZ6gao101NBpan
 gcqQ==
X-Gm-Message-State: AOAM530mxJyB13GtsP1RULYD7PkBROjH6ZUHpCGgwjbofXGnFMB2rrSE
 OmYJGsfi7J+BOtfz7IqPZnY=
X-Google-Smtp-Source: ABdhPJzm+JKATE43IbiivZ6as6JSo9Ps7DVTMr7G6kRy9LrsCmdMBrHvTDiQ4kirIRVSCjM/zx/b2w==
X-Received: by 2002:a1c:94:: with SMTP id 142mr3640878wma.87.1633082793441;
 Fri, 01 Oct 2021 03:06:33 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 v17sm5746069wro.34.2021.10.01.03.06.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 03:06:33 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 23/28] drm: use new iterator in
 drm_gem_fence_array_add_implicit v3
Date: Fri,  1 Oct 2021 12:06:05 +0200
Message-Id: <20211001100610.2899-24-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211001100610.2899-1-christian.koenig@amd.com>
References: <20211001100610.2899-1-christian.koenig@amd.com>
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

Simplifying the code a bit.

v2: add missing rcu_read_lock()/unlock()
v3: switch to locked version

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_gem.c | 26 +++++---------------------
 1 file changed, 5 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 09c820045859..4dcdec6487bb 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1340,31 +1340,15 @@ int drm_gem_fence_array_add_implicit(struct xarray *fence_array,
 				     struct drm_gem_object *obj,
 				     bool write)
 {
-	int ret;
-	struct dma_fence **fences;
-	unsigned int i, fence_count;
-
-	if (!write) {
-		struct dma_fence *fence =
-			dma_resv_get_excl_unlocked(obj->resv);
-
-		return drm_gem_fence_array_add(fence_array, fence);
-	}
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
+	int ret = 0;
 
-	ret = dma_resv_get_fences(obj->resv, NULL,
-						&fence_count, &fences);
-	if (ret || !fence_count)
-		return ret;
-
-	for (i = 0; i < fence_count; i++) {
-		ret = drm_gem_fence_array_add(fence_array, fences[i]);
+	dma_resv_for_each_fence(&cursor, obj->resv, write, fence) {
+		ret = drm_gem_fence_array_add(fence_array, fence);
 		if (ret)
 			break;
 	}
-
-	for (; i < fence_count; i++)
-		dma_fence_put(fences[i]);
-	kfree(fences);
 	return ret;
 }
 EXPORT_SYMBOL(drm_gem_fence_array_add_implicit);
-- 
2.25.1

