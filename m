Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0074177BB
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 17:32:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56E706EE54;
	Fri, 24 Sep 2021 15:31:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D4E96E1D7;
 Fri, 24 Sep 2021 15:31:40 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id t7so28542862wrw.13;
 Fri, 24 Sep 2021 08:31:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=by8trJVpX1Yx/8GVC1WzD9CSlRZcllVkqP6ongV+oMI=;
 b=LqIJKlQBXsG7Yc8cj0wu8e+zpM+ggMNapNCxgSE3sA3BXCeRQfZXfYBiUMyShPkWwF
 oL0yYy6+FuFweL8evwpfXLe7KsUQT1cRcGwNKDJTayuWJMZxrmBssXfy6tNFistzneu5
 YIgCRNeoWDeSKToAGWUSON7PPEH9jzCqDSKnHBKgbbBYlKQCMubaJNoBBq67UsfHLVF/
 3A/cxE3KByKJtVe2TVdwchsrA3y+QM8ltA0GRo8u2gcNrsyppg05rDQxX/8TwDDWX+a9
 XWgey+cnt52gL738JuvwoyEVoRUu/YczhvzHO49m+ytujObmT4tU39KP9UwQQUr1o0UR
 o+ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=by8trJVpX1Yx/8GVC1WzD9CSlRZcllVkqP6ongV+oMI=;
 b=en9KpLXcb5U2OiaFASmutHklEWeE0daNxKvZexdmICYWe1avKspRd4nhCiU6moE3CG
 wBfzSZs1OO9rovMbRCQ75AxPABw26MYVN+j+UZd3xQ16iQzm8uJwBfa9yXUGfn3qFPBZ
 54Ndzz1N03eFXHMB3QmS+cx7e9YdR1w+jWdH5eZZW2wwL/YH++jfj9ZLoD+V/nd03t+3
 +0/hkDWg8ybJKSNGAXKYkmUt3/pwWCQk5LLviFdccStDS5+V8+d65RmpvyHrriFBrYnB
 G1t9ChErOm4b8E0wGyo+C6ebvQohBw6Kb+TWT9PFLZJJWft/LpsCwBIGcOIa8YnO0SoQ
 jGOQ==
X-Gm-Message-State: AOAM533ULbK4tzr+K8bmb0LrBwzZ+fnmt3w3kyQmdlv01542AfNvkX6I
 FM5RhhxulnZxYI8yMjwArXk=
X-Google-Smtp-Source: ABdhPJyy/4U2GaT2BMEka+ag/8o17YZY2/EO0i+JqubriX7iz9usIJ4MLyYl+KmBqFvgybBZUwg4AA==
X-Received: by 2002:a5d:58ef:: with SMTP id f15mr12367035wrd.160.1632497499033; 
 Fri, 24 Sep 2021 08:31:39 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 u25sm9902248wmm.5.2021.09.24.08.31.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 08:31:38 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 22/27] drm: use new iterator in
 drm_gem_fence_array_add_implicit v3
Date: Fri, 24 Sep 2021 17:31:08 +0200
Message-Id: <20210924153113.2159-22-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210924153113.2159-1-christian.koenig@amd.com>
References: <20210924153113.2159-1-christian.koenig@amd.com>
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

