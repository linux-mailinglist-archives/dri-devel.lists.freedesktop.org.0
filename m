Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AD7F4177BE
	for <lists+dri-devel@lfdr.de>; Fri, 24 Sep 2021 17:32:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C23B06EE4A;
	Fri, 24 Sep 2021 15:31:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C31889EFF;
 Fri, 24 Sep 2021 15:31:36 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id u18so28725872wrg.5;
 Fri, 24 Sep 2021 08:31:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=y78+lw9uajwG2nya7zXv9lL0eVUeHEAbTx0GIeLnzI0=;
 b=iO4CmtdNAnL4uuv8xgnCB16BsxNVtl9ibKpLd6ayJybZbrebzBGngjD239pa1XN9vn
 RESwql8n+MLOmofxMqnr5ZJtbNSAjAp+LM1rba73yQYAR1d5zQk62rr2v+ZChdv+v2FW
 kXM2uIQd8P2iXiVKkNl5y2xUHltmfphvSXBvVHTeJT5fXvF5sIpXasUG3dj9Vmy65iyf
 U8FM+VLTayiyUbzxVG95NIo/rcX9u6mCgbf+aTdIM6NaghwdvhA2Qe7bm3HpjQ/3aKqY
 XtZZiHLMMT2B/EsfYvK+8RPtydU7Hu9eflzOgSMklpRKcaX7bf6c4qX5jQ3lwBpwOPtR
 Fi3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=y78+lw9uajwG2nya7zXv9lL0eVUeHEAbTx0GIeLnzI0=;
 b=3tM/DOK1hGDBfrrHdB1wok0K7erpqPMHSVXJFDLDZMA+B38G9bUQ41luuERzXHEBt4
 +J/Lsla7PH2v6eERf/S0nqOOyJkakRzrpzQyr54DLoV5ILDQIB8s2cPZR16tSvnx84Do
 3L2irjAcXdFXkAv3ZX8oiBhimBsUu10fQKEtgHDDT5bQENsNLy9AqIFfl8umeDjt89ix
 dYIwch9hUyc7flat0Kj4dNKFEJ6e0oU3Ij1uobDzy6z50b3Sd950rVXh6li41emEPO2f
 U07EWW8XmzNMNhZ+YZk4iGMaVHhSTcx/LgvrE4RGCPBFKeGZStMAKXzOhSqh2PB2Pr79
 L/Ow==
X-Gm-Message-State: AOAM530U4aa13iJICY/uWfgRcB3wRnq67HK4TeriBnl72btpDFG79agq
 aS9GUIfD6jIYz4cZ2pgXD7w=
X-Google-Smtp-Source: ABdhPJyxcD57OlJxWG3U4RdnHWzhMBXfGvx5jpnBs0+/4OjO0WJtsxhWnDdkItuAS//GCUb3gqE/Gg==
X-Received: by 2002:a5d:460a:: with SMTP id t10mr12532920wrq.145.1632497495158; 
 Fri, 24 Sep 2021 08:31:35 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 u25sm9902248wmm.5.2021.09.24.08.31.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Sep 2021 08:31:34 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 18/27] drm/i915: use the new iterator in
 i915_request_await_object v2
Date: Fri, 24 Sep 2021 17:31:04 +0200
Message-Id: <20210924153113.2159-18-christian.koenig@amd.com>
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

v2: add missing rcu_read_lock()/rcu_read_unlock()
v3: use dma_resv_for_each_fence instead

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 drivers/gpu/drm/i915/i915_request.c | 34 +++++------------------------
 1 file changed, 5 insertions(+), 29 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_request.c b/drivers/gpu/drm/i915/i915_request.c
index ce446716d092..3839712ebd23 100644
--- a/drivers/gpu/drm/i915/i915_request.c
+++ b/drivers/gpu/drm/i915/i915_request.c
@@ -1509,38 +1509,14 @@ i915_request_await_object(struct i915_request *to,
 			  struct drm_i915_gem_object *obj,
 			  bool write)
 {
-	struct dma_fence *excl;
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
 	int ret = 0;
 
-	if (write) {
-		struct dma_fence **shared;
-		unsigned int count, i;
-
-		ret = dma_resv_get_fences(obj->base.resv, &excl, &count,
-					  &shared);
+	dma_resv_for_each_fence(&cursor, obj->base.resv, write, fence) {
+		ret = i915_request_await_dma_fence(to, fence);
 		if (ret)
-			return ret;
-
-		for (i = 0; i < count; i++) {
-			ret = i915_request_await_dma_fence(to, shared[i]);
-			if (ret)
-				break;
-
-			dma_fence_put(shared[i]);
-		}
-
-		for (; i < count; i++)
-			dma_fence_put(shared[i]);
-		kfree(shared);
-	} else {
-		excl = dma_resv_get_excl_unlocked(obj->base.resv);
-	}
-
-	if (excl) {
-		if (ret == 0)
-			ret = i915_request_await_dma_fence(to, excl);
-
-		dma_fence_put(excl);
+			break;
 	}
 
 	return ret;
-- 
2.25.1

