Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69F5E4144D0
	for <lists+dri-devel@lfdr.de>; Wed, 22 Sep 2021 11:12:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A08436EB41;
	Wed, 22 Sep 2021 09:11:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADC476EB30;
 Wed, 22 Sep 2021 09:11:08 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id u15so4675945wru.6;
 Wed, 22 Sep 2021 02:11:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=embkrJo3e9xiJFTU9PfC3+rsuixYC3ybu+PUBE5n6do=;
 b=F49lYkFnegWrd3qlgnPML+3pWBFlCxQi8hPaL3IkY/T2Pu5Uk48yZxjGan3ZATjgup
 C5QHTbAIRs6YBAYc5r+6aCxI6MlQd7EoU6PCUc1gWbKrwZGdNgIXh0k3NQY/6eRyP/L9
 p+P5/V8ruIZgg+g3JbYRDaqsT5mnV+cO72Y9jRWnJQErZFwER5hxnwlSdyEcO5pNXPAo
 NzrWk8jy4KYGg42GWQb4iEMnMcxFUzTTs+QaE7e1czoM2oziMOMAzK2q9Y0rHgKcjncy
 54enIupRT4JkkAKl5i9mWHFyExSYKKv6xTS244XoWaAzZbtHlupuZGVtqQ31O+ai1Gh9
 e+Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=embkrJo3e9xiJFTU9PfC3+rsuixYC3ybu+PUBE5n6do=;
 b=OMHjPuOpzUxkGTwCDlixw+sNLpARqT9BsSP2zsAoaGMSi+AaBIyeyeih+633E+tMI1
 V+OSGMY45Ym0S0aSUnV3uEkON9k0ngWCX0LplI8ndkd7xSK1ba0oJQldVpf0VFWZjyii
 ykoLi3uznMdE0p+GmwYS5E8CD7lNAYGnbW1pgv/j3IKdqlpFqgFPsV7nevCPhTqRLrh7
 XO4pN+uZPcDbPII5+ptDK8vMRk0FbqX1lyJHAVOLuxnUnGJE/2WJxBqDUfM4gbgtAPRt
 t6oh25PIn7jXGl1TPCm0zrioApQY9wf2pq49dPARqkaFeQkbljsHpRFWyVC93t8qYo9O
 GG9A==
X-Gm-Message-State: AOAM532mU07cWcLIpBaEmv/2LRStIh50/hCd67CH1PWQS9VivxhQpC28
 gKn+GLU6hkI3jq1uMenpcu4=
X-Google-Smtp-Source: ABdhPJxij0X4NLln6Bo5kmljRQhXFJ9MHnIUuxMtJ74eTJreF8hiz8KXvjUOfJEZ57PoSPjj7S6XKg==
X-Received: by 2002:adf:dc43:: with SMTP id m3mr22345425wrj.66.1632301867335; 
 Wed, 22 Sep 2021 02:11:07 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 r25sm1535515wra.76.2021.09.22.02.11.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 02:11:06 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 21/26] drm: use new iterator in drm_gem_plane_helper_prepare_fb
Date: Wed, 22 Sep 2021 11:10:39 +0200
Message-Id: <20210922091044.2612-22-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210922091044.2612-1-christian.koenig@amd.com>
References: <20210922091044.2612-1-christian.koenig@amd.com>
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

