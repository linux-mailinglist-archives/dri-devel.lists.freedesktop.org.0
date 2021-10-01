Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A1C741EA7D
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 12:07:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F5676EDE1;
	Fri,  1 Oct 2021 10:06:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8C546EDCA;
 Fri,  1 Oct 2021 10:06:24 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id d6so14549657wrc.11;
 Fri, 01 Oct 2021 03:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=RSipxlf8Rt1aqHkUOElk7qKJcjfTHCxexIhn6lnwGw0=;
 b=X3REhpDlVS9wIOne/RNjbJmWqf4pS8COhuSJuljJkQs36loC2xUyvxhwrAkwFnXfQ4
 WhItcIOHXFQ+J/XU0dNuURjauprDX/PchS89rW9dl9Ph5q0AYkizqqR+Ckkej4fNU5ze
 2UeyStYcoP1QsJUzuVa8cKuUZHK1siDvXW3xdTHwoz33ZHZrVx3HeE2PVSf09uSfNGZZ
 MN1mRHOGXjlW0E/0pHkO/Xf++MISf45UPyhYro7bkuAdoeQD1kVuc/FrIeGs6Ggm25SY
 FGgt5GB5ffo9/rdXivPFP5HvW4O1sZ9wedRGj4Kq4awx/lDT7C+aFKSZfSUR6wqo0rIn
 bw1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=RSipxlf8Rt1aqHkUOElk7qKJcjfTHCxexIhn6lnwGw0=;
 b=7yKNWav5/SkJKVclGaTj5CcjdsWINYcIb7D94pDUayF37ZjWD6ZW4NUPMJtfmy3L20
 FAdyhtSgjexG/PV8QdMuV4txYVZ4FstVKVFq3uh3j3zkXtjw/7NFGR5bf1WbMPjRzB0c
 3a4A0hkF7EGf8r6uDLN0UQlTiYmR5FRfC1edwUXJ6JiTOtfrFUu1pAx/fNiMlRd1O715
 mQj+k7dugB4USauD+WeS79d3SkQq3CGXravrVPXMPEARS3/ATBKx/12Gr+U3q+FQVuaV
 WfHpSn84JYRj6VSoGcSYxgEai+yKmoqFBm3z2Lckn0e0Wov3Qf41ZuIOsGvYyMzdDaXt
 +/TQ==
X-Gm-Message-State: AOAM532UlhIy5CMHc9hvV/qNyS7hcnSnmvC/lqexcPGpW7Vthsnjph8H
 bUJowSONdEMmrCt1k/4f8lk=
X-Google-Smtp-Source: ABdhPJxkclJUwXiD8adtQWL2MmswZa03hGkkN/MaPO7pzJbsoLrk9yT4EdDewfRqp5qIEMwOCW0Xkw==
X-Received: by 2002:adf:eac8:: with SMTP id o8mr10547558wrn.273.1633082783149; 
 Fri, 01 Oct 2021 03:06:23 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 v17sm5746069wro.34.2021.10.01.03.06.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 03:06:22 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 11/28] drm/amdgpu: use the new iterator in amdgpu_sync_resv
Date: Fri,  1 Oct 2021 12:05:53 +0200
Message-Id: <20211001100610.2899-12-christian.koenig@amd.com>
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

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c | 44 ++++++++----------------
 1 file changed, 14 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
index 862eb3c1c4c5..f7d8487799b2 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
@@ -252,41 +252,25 @@ int amdgpu_sync_resv(struct amdgpu_device *adev, struct amdgpu_sync *sync,
 		     struct dma_resv *resv, enum amdgpu_sync_mode mode,
 		     void *owner)
 {
-	struct dma_resv_list *flist;
+	struct dma_resv_iter cursor;
 	struct dma_fence *f;
-	unsigned i;
-	int r = 0;
+	int r;
 
 	if (resv == NULL)
 		return -EINVAL;
 
-	/* always sync to the exclusive fence */
-	f = dma_resv_excl_fence(resv);
-	dma_fence_chain_for_each(f, f) {
-		struct dma_fence_chain *chain = to_dma_fence_chain(f);
-
-		if (amdgpu_sync_test_fence(adev, mode, owner, chain ?
-					   chain->fence : f)) {
-			r = amdgpu_sync_fence(sync, f);
-			dma_fence_put(f);
-			if (r)
-				return r;
-			break;
-		}
-	}
-
-	flist = dma_resv_shared_list(resv);
-	if (!flist)
-		return 0;
-
-	for (i = 0; i < flist->shared_count; ++i) {
-		f = rcu_dereference_protected(flist->shared[i],
-					      dma_resv_held(resv));
-
-		if (amdgpu_sync_test_fence(adev, mode, owner, f)) {
-			r = amdgpu_sync_fence(sync, f);
-			if (r)
-				return r;
+	dma_resv_for_each_fence(&cursor, resv, true, f) {
+		dma_fence_chain_for_each(f, f) {
+			struct dma_fence_chain *chain = to_dma_fence_chain(f);
+
+			if (amdgpu_sync_test_fence(adev, mode, owner, chain ?
+						   chain->fence : f)) {
+				r = amdgpu_sync_fence(sync, f);
+				dma_fence_put(f);
+				if (r)
+					return r;
+				break;
+			}
 		}
 	}
 	return 0;
-- 
2.25.1

