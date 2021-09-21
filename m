Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8F714138A8
	for <lists+dri-devel@lfdr.de>; Tue, 21 Sep 2021 19:38:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 838296E9EB;
	Tue, 21 Sep 2021 17:37:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88A1A6E9E7;
 Tue, 21 Sep 2021 17:37:23 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id g16so41544230wrb.3;
 Tue, 21 Sep 2021 10:37:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=embkrJo3e9xiJFTU9PfC3+rsuixYC3ybu+PUBE5n6do=;
 b=Fky4pf4ngQguMJBw1bj6vYQCTyG249/SrogqIKPRbmf5GRnkG5Fd8rGoJAbHx4UJva
 GlDBpCf21MvVefbquWTEGm1LEqqPX4SOD3D+WPpJPtd1DoDACKV6/VHDn8WeAXDhspia
 9RApRTJljhGb7ldXlRsVnNiXe7hxzc0SdNkpdNSAhUkE1XAbPf8Ft680BZH3UNcfRr0/
 MMIks68SCcCU5hpihva7eobNBM+NunbzBK8500je4cbZbxaNJ+xT91XOpqJXReXLqTqF
 EmBr8gzM9mMuIlHfQnavQSqhQMwCdt8zLpwSSa2gg92VdGVMpZiQDdWhzVP1/SFmicQt
 kxHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=embkrJo3e9xiJFTU9PfC3+rsuixYC3ybu+PUBE5n6do=;
 b=i/Jn+kyXasMO8PKehfVpOC4afDlMNJnC1QXdhyJ196NPZ5J9k81tgmwk3QcxvMHnDa
 suWjoeijbsS8RL4BD0rh7vCi+jFnWlxY8kN+tQbhiiS4y4k8NL4wvYWZmPq46TAEDNN2
 Xm0kL0o9ylbv847oNeXOKCxTkl7saPjZ1CsL5BQZl4PpZ73yhYOITKrI1tO7HVj4MFs8
 i9QS7WOCuxVzEZCrIKfkIjourkvRCqlxix5WjxiP7LWC9087NmSz9QdwIgciFkOfTRhR
 IO+DxJdi8jn7RsqVQJ6PSjsm4ldFEXc29FH2W7EgTvdAk+516jZNX/Yjwj9Jllt4Pb9D
 JH7Q==
X-Gm-Message-State: AOAM533yOeji6cLZNvaLXeFQxhYFwDn2rZjJJ+3Xv5IOTV9UapbQwgJ2
 AeEzP19zynw2LdtonTXu0ag=
X-Google-Smtp-Source: ABdhPJzJ0hUrY2I6QXHaNYOd04kPKO6ECbWkuoehbNz9R6rGxkvX88xzbhI9KtrqoxK9t7M2cxSz5g==
X-Received: by 2002:a5d:64a3:: with SMTP id m3mr24548370wrp.157.1632245842138; 
 Tue, 21 Sep 2021 10:37:22 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 z13sm23310477wrs.90.2021.09.21.10.37.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Sep 2021 10:37:21 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: ckoenig.leichtzumerken@gmail.com, linaro-mm-sig@lists.linaro.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 21/26] drm: use new iterator in drm_gem_plane_helper_prepare_fb
Date: Tue, 21 Sep 2021 19:36:54 +0200
Message-Id: <20210921173659.246165-21-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210921173659.246165-1-christian.koenig@amd.com>
References: <20210921173659.246165-1-christian.koenig@amd.com>
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

Makes the handling a bit more complex, but avoids the use of
dma_resv_get_excl_unlocked().

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_gem_atomic_helper.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
index e570398abd78..21ed930042b8 100644
--- a/drivers/gpu/drm/drm_gem_atomic_helper.c
+++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
@@ -143,6 +143,7 @@
  */
 int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 {
+	struct dma_resv_iter cursor;
 	struct drm_gem_object *obj;
 	struct dma_fence *fence;
 
@@ -150,9 +151,17 @@ int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_st
 		return 0;
 
 	obj = drm_gem_fb_get_obj(state->fb, 0);
-	fence = dma_resv_get_excl_unlocked(obj->resv);
-	drm_atomic_set_fence_for_plane(state, fence);
+	dma_resv_iter_begin(&cursor, obj->resv, false);
+	dma_resv_for_each_fence_unlocked(&cursor, fence) {
+		dma_fence_get(fence);
+		dma_resv_iter_end(&cursor);
+		/* TODO: We only use the first write fence here */
+		drm_atomic_set_fence_for_plane(state, fence);
+		return 0;
+	}
+	dma_resv_iter_end(&cursor);
 
+	drm_atomic_set_fence_for_plane(state, NULL);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(drm_gem_plane_helper_prepare_fb);
-- 
2.25.1

