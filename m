Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7DB640D8C8
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 13:31:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC7F88427;
	Thu, 16 Sep 2021 11:31:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E1D56ECE7;
 Thu, 16 Sep 2021 11:31:05 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id w29so8926457wra.8;
 Thu, 16 Sep 2021 04:31:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9NhP0KemkDYjvJFJ1qOIIarsOUWVW1ocIDtArvNA068=;
 b=P54eRNRDIILCiWfnHFMaUtJoPi/+1chXerdoAKRheG5qRgJSm27QG+fFzoTdKUnDg7
 0a5ICJiheo1lcAdbXf/YTdLwxtdQC3a4syLbG0OvUvfMcLqxJcKIYPlvT+G6UHKKwg2H
 rodUnd97bSnySzg+j/9R3TNtXnxSHU+/ubzGWRbVPaBWNOC3tTaPYECcDVw+05e3Fo0C
 iUHa3oPuAfeUAHGSW/rg5JyUBIEa0Iqyg9OZDO2gymyCeEXh0WgpAbtQ6G0M961YwVWo
 gUVep6XXi7LNVCi7wKZ6XhBmgrBxjL28R3Q3Gs50HogNNeMjb8j7bequaPsXiHIQAgSk
 C/wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9NhP0KemkDYjvJFJ1qOIIarsOUWVW1ocIDtArvNA068=;
 b=CP52kE2brDQhlfOFEDZSUYNLwkLogAlt/tbuQDcFVbJ04+PXYMvaZIAI3ZmTKwbtHa
 6hF2ro5oJjrEX78zIBdLN+npb2nZVvpeYpGeGXROWHx0uuI9ojWKQhF328qakTw15jRU
 ilt9RkWJnASNzyZFkq9tRZG+3ya/KG8Z0h3vIS4MkjCICkKqYpiE8SbsSQ97Uq7EqyqX
 2BU717/1fn75wzt71eV6ab7OsnCAlrCWj4eZQVnx2BL6QxG9ecJC+HYwoXAhI3ftQ1DJ
 lxYo8H+jqp/IbVVU7K9sKNAiPGDbxCVlubrsUxTC4ffYhTVVNdK/3pvhEADsg4FF/hlC
 0U9g==
X-Gm-Message-State: AOAM530rbOV8gTlK/f9/MjDBqqbCh8dJlC1UZ4kDx+FVw9KCesyHjShi
 DrV/6QJ6T24oKNh1G7kpfqY=
X-Google-Smtp-Source: ABdhPJwrkyAg3w90rMzWPvNlNb8unGCndntK/rO+r83tG4dJ1qU//0NAk8tLvxnaagiUmcZ3mzAcSg==
X-Received: by 2002:a5d:568a:: with SMTP id f10mr5516399wrv.314.1631791863816; 
 Thu, 16 Sep 2021 04:31:03 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 c17sm3803674wrn.54.2021.09.16.04.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 04:31:03 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 20/26] drm: use new iterator in
 drm_gem_fence_array_add_implicit v2
Date: Thu, 16 Sep 2021 13:30:36 +0200
Message-Id: <20210916113042.3631-21-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210916113042.3631-1-christian.koenig@amd.com>
References: <20210916113042.3631-1-christian.koenig@amd.com>
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

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_gem.c | 36 +++++++++++++-----------------------
 1 file changed, 13 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 09c820045859..8c3ff098e49e 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1340,31 +1340,21 @@ int drm_gem_fence_array_add_implicit(struct xarray *fence_array,
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
-
-	ret = dma_resv_get_fences(obj->resv, NULL,
-						&fence_count, &fences);
-	if (ret || !fence_count)
-		return ret;
-
-	for (i = 0; i < fence_count; i++) {
-		ret = drm_gem_fence_array_add(fence_array, fences[i]);
-		if (ret)
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
+	int ret = 0;
+
+	rcu_read_lock();
+	dma_resv_for_each_fence_unlocked(obj->resv, &cursor, write, fence) {
+		rcu_read_unlock();
+		ret = drm_gem_fence_array_add(fence_array, fence);
+		rcu_read_lock();
+		if (ret) {
+			dma_fence_put(fence);
 			break;
+		}
 	}
-
-	for (; i < fence_count; i++)
-		dma_fence_put(fences[i]);
-	kfree(fences);
+	rcu_read_unlock();
 	return ret;
 }
 EXPORT_SYMBOL(drm_gem_fence_array_add_implicit);
-- 
2.25.1

