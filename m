Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E11C40D89C
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 13:31:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCABD6ECE8;
	Thu, 16 Sep 2021 11:31:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 814456ECE7;
 Thu, 16 Sep 2021 11:30:54 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 l7-20020a1c2507000000b002e6be5d86b3so4232383wml.3; 
 Thu, 16 Sep 2021 04:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pfuQ70G8qZBcSy6i6jiB1XWyfMlicGj3imcgWE25C/A=;
 b=GXUnq4eCavRvuIAsIj7oteC1ah6Hq+BO23uIZ0VjvkSRl1dk49E+iJvuN/ogUxbjU/
 J7vaeKTbfZx4OeH7QIW3ZSNCK6IRA93Jj1ua4vjlDH5XfaiWqUHg1kqYREXprZY1GtGR
 9lCrPAV/AfMoogQ/HVuynYXxuFMKamgDv769H00vAAiohPYSwaNq4RIj1NXHaxhU4HLN
 pet/kNKzGXPfjiQc6pX9+mxu4CxpA4fxLlX7q2MzjZT/0z5Aoedra/osBcraVXnQYbdl
 28cXjzlqKe4UoZa5cbsFH3U/4ziP3xvZHZDK31YXCWc1hLBwucNj32k9Dh3tl95dUXy+
 5prQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pfuQ70G8qZBcSy6i6jiB1XWyfMlicGj3imcgWE25C/A=;
 b=T6M7NLa8fe4Z2lyobfpxKh5zakddSGam9fVyclCM5uRD7fxYUxoGMQxxpynH9UFjoO
 +MUk8Yz8tnu9Zb9qn0WQR89zU645K9TzeXHPQPAD09sYS4Stp+Uuzm2r8swGSIYjkRT4
 c2CV2w2ilxJohN3RLcHDiIJO/rtYAEaAhKRe5oODwi7fLsfWHBXLgk0XCgbWaY6EGklc
 wWEgzzS+8j0oJNbcQmf5dxtMUNSjpdLvqh2Q+QBlEVr1rTqOlZXjRafwZ1ASeqLgvWPv
 I9p81hDVBsYXpdMf1OrOYH0SvO6+B50pweUf4aqnDqvxzktfRyEP4bUleP4r+382+e2j
 q32A==
X-Gm-Message-State: AOAM533+VrLl34CEc6NFdqBfZpZaHqos/9pn5qUe/0HOtOHodlR2W7fX
 cby6mTqqAQ8f+0r/RXL0FNA=
X-Google-Smtp-Source: ABdhPJxlBKNnYEhWH7vMm/DryGngoKWGeLHl+0nC7uWSV8U39RJo8QfsJZ73TAh5zjIKeo1P8tF34Q==
X-Received: by 2002:a05:600c:1c26:: with SMTP id
 j38mr7661642wms.12.1631791853035; 
 Thu, 16 Sep 2021 04:30:53 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 c17sm3803674wrn.54.2021.09.16.04.30.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 04:30:52 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 08/26] drm/amdgpu: use the new iterator in amdgpu_sync_resv
Date: Thu, 16 Sep 2021 13:30:24 +0200
Message-Id: <20210916113042.3631-9-christian.koenig@amd.com>
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

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c | 44 ++++++++----------------
 1 file changed, 14 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c
index 862eb3c1c4c5..e5d8bb11a14a 100644
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
+	dma_resv_for_each_fence(resv, &cursor, true, f) {
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

