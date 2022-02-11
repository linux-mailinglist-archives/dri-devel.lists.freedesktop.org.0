Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA46F4B264A
	for <lists+dri-devel@lfdr.de>; Fri, 11 Feb 2022 13:50:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AED6D10EBCD;
	Fri, 11 Feb 2022 12:50:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3647310EBC3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 12:50:19 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id p15so22679843ejc.7
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Feb 2022 04:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=ilcOGSqnxUqFL0ayC9N1nKoW8foqX4Z1qTckrM2yJmE=;
 b=qfe+tZtSogUA0PsviBqXTXrBsfr862yvLtbpjPr5xMmTftODtX3zYH1NoWY6C5lI10
 s+gDJXlLTQrzLYVg4B/NIb3LUNkAxzyEAJd47tUOrcLYoF/AGJSynPdDvD9ZUtQlxkH1
 Kxj/mV8xkvV/vWONhGX80mi1MFQDHxWZ1u8Iy9c5SoiLiB5brXT5/PdBgKwgqObhthgK
 JAb18ZJ8YXxXLnQT7BPpasmqFN8B7Np4rEFohcFAhAMBRVx3QG/kHiGW15OTT4g1DMft
 fv2VWQO2Vjxl8+OaJChX2yV3000v6l2auRYBkiXv8JPOFfjpLsUWEpFoJ2bYNl5jwM7e
 yHOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ilcOGSqnxUqFL0ayC9N1nKoW8foqX4Z1qTckrM2yJmE=;
 b=XBQFRjCWWROqGxqE0Vc48aoHvnSoskj0XhZpbJqKflt+wo0jIvcPbjvCR4gKlnqHfN
 rRoImHvPgkWt4JeAv4MUoqickLu2HYUjbdPEZsCRpCKm5QhumxKuE4jbPtCfS7EAa3Rv
 RQpMckI6KpIsT+qs/lZQuLwKRa7NGF/4sVSbWXofx9PmxSFeRHQ2XjZKttjLsLoHKpYM
 qyo6gpwKz0rHbeqBnOttxl703Rg2KvmPf2NEzWbtv0A7+kGlgEhoVoJX5ngOXXHALZS4
 a8VO/XrdG9295Wt8yiDRJ+se7pRQ/JBVpbDXtJYoWzCf9nHNO4Qkfen2kUm+As4NQioB
 GGVA==
X-Gm-Message-State: AOAM5338q5Cg/bF/vmOkWQp/8aH4ZA6ftiSIf63fmDOWitN+doH8bEVm
 9ah8UPw40/uvvn7fbbSlDWY=
X-Google-Smtp-Source: ABdhPJzJmm1EQmSN6DgHEwNvQkgzNJN1E+ISc1wgjEf0JBsqERRZ2Xv8wHx0YNN+qXthy90BUmiXvA==
X-Received: by 2002:a17:907:29d7:: with SMTP id
 ev23mr1276590ejc.674.1644583817819; 
 Fri, 11 Feb 2022 04:50:17 -0800 (PST)
Received: from able.fritz.box (p57b0bff8.dip0.t-ipconnect.de. [87.176.191.248])
 by smtp.gmail.com with ESMTPSA id w22sm7868604ejc.137.2022.02.11.04.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Feb 2022 04:50:17 -0800 (PST)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel@ffwll.ch, sumit.semwal@linaro.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org
Subject: [PATCH 13/23] drm/atomic-helper: support more than one write fence in
 drm_gem_plane_helper_prepare_fb
Date: Fri, 11 Feb 2022 13:49:53 +0100
Message-Id: <20220211125003.918447-14-christian.koenig@amd.com>
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

Use dma_resv_get_singleton() here to eventually get more than one write
fence as single fence.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/drm_gem_atomic_helper.c | 18 +++++++-----------
 1 file changed, 7 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
index c3189afe10cb..9338ddb7edff 100644
--- a/drivers/gpu/drm/drm_gem_atomic_helper.c
+++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
@@ -143,25 +143,21 @@
  */
 int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 {
-	struct dma_resv_iter cursor;
 	struct drm_gem_object *obj;
 	struct dma_fence *fence;
+	int ret;
 
 	if (!state->fb)
 		return 0;
 
 	obj = drm_gem_fb_get_obj(state->fb, 0);
-	dma_resv_iter_begin(&cursor, obj->resv, false);
-	dma_resv_for_each_fence_unlocked(&cursor, fence) {
-		/* TODO: Currently there should be only one write fence, so this
-		 * here works fine. But drm_atomic_set_fence_for_plane() should
-		 * be changed to be able to handle more fences in general for
-		 * multiple BOs per fb anyway. */
-		dma_fence_get(fence);
-		break;
-	}
-	dma_resv_iter_end(&cursor);
+	ret = dma_resv_get_singleton(obj->resv, false, &fence);
+	if (ret)
+		return ret;
 
+	/* TODO: drm_atomic_set_fence_for_plane() should be changed to be able
+	 * to handle more fences in general for multiple BOs per fb.
+	 */
 	drm_atomic_set_fence_for_plane(state, fence);
 	return 0;
 }
-- 
2.25.1

