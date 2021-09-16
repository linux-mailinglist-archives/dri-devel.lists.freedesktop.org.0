Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6477240D8C5
	for <lists+dri-devel@lfdr.de>; Thu, 16 Sep 2021 13:31:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1755E6ECE7;
	Thu, 16 Sep 2021 11:31:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DA016ECF6;
 Thu, 16 Sep 2021 11:31:06 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id d6so8877518wrc.11;
 Thu, 16 Sep 2021 04:31:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kyOleDVWOJBAX5Al9bzCsD71zDRQwDAxTJRFXlsx32E=;
 b=nH6Fv1srD6vAMImVhu4qkDwJ1DeJ6EHRkTvSHSAiPq1DizBUmg4INVBj7TmvQfN1wk
 s7JN6sTZIm9dz1n5q79HkQJgPRvUic/5SWooR9JTzKPBxkDlM4Vu2E0wd7EDNJkKmJ98
 /M06J8x2kU/X6HhpeOZSK0dF3w7YFWt8WWEhC4a5m4CTDdw7rQ+PzbYLb3TURDnZVYWj
 SXCw6wK6rWrnT1EsKBXe/c6HbppvFPKhPqIgS7EC50/Vy/0lcQW+ToemKTfL2OTQMGO2
 55aVzZQxbqGneo9E5u/wZv2butWkkQeDIumjyOWFVcIzxmesLz+XSneo4DPscDGkAtT4
 o7uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kyOleDVWOJBAX5Al9bzCsD71zDRQwDAxTJRFXlsx32E=;
 b=AFIOoaqlvIVuW0wUSFUy+97VDsu8SNSXXHukyh8YZ0PulU8z1DZ5AyHCNYA6fQZESx
 ekOJ48QF6M5C7hBniAGo+cR5T6xhK60Mb1oK2xn22iAyzYJAy/PJ/KrqbAe3pPWXz9bQ
 uKXUMs9UPpL6FKgXQy1BfZcz8/DlGSF1lU4S0J/mMW5tKlyg9rMnsBH61PE4MDQI5oxi
 2BZP8SC5M7aZNMY7IdWsYP1eaftmgyVW2XIV/e6SJuu29JmK3lyz0nEeQyqw9U+EA9DK
 ZoX9lMJHu3nApl2qyo9cq24i/87LBV7dqjSPtfrx9nyVFsf9lo/psnv7pAr5moYBEzME
 Q6vA==
X-Gm-Message-State: AOAM533W1rRGfYq0q77mgR9f9cDcOFOyd0oVhuc7qAtFJR9XI3Jn5Gqw
 OsiKH7JQU20wCd3p5/bKFdU=
X-Google-Smtp-Source: ABdhPJy866PHT8ShEH7QsAqiVUda4amf1rPNdv5LwqdkBFidDrfgrIhuDY1ULhqtsFASvUk9b2bsHg==
X-Received: by 2002:adf:e406:: with SMTP id g6mr5582396wrm.172.1631791864748; 
 Thu, 16 Sep 2021 04:31:04 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 c17sm3803674wrn.54.2021.09.16.04.31.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Sep 2021 04:31:04 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 21/26] drm: use new iterator in
 drm_gem_plane_helper_prepare_fb v2
Date: Thu, 16 Sep 2021 13:30:37 +0200
Message-Id: <20210916113042.3631-22-christian.koenig@amd.com>
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

Makes the handling a bit more complex, but avoids the use of
dma_resv_get_excl_unlocked().

v2: add missing rcu_read_lock()/unlock()

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/drm_gem_atomic_helper.c | 12 ++++++++++--
 1 file changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_atomic_helper.c b/drivers/gpu/drm/drm_gem_atomic_helper.c
index e570398abd78..86df75b2f8eb 100644
--- a/drivers/gpu/drm/drm_gem_atomic_helper.c
+++ b/drivers/gpu/drm/drm_gem_atomic_helper.c
@@ -143,6 +143,7 @@
  */
 int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 {
+	struct dma_resv_iter cursor;
 	struct drm_gem_object *obj;
 	struct dma_fence *fence;
 
@@ -150,9 +151,16 @@ int drm_gem_plane_helper_prepare_fb(struct drm_plane *plane, struct drm_plane_st
 		return 0;
 
 	obj = drm_gem_fb_get_obj(state->fb, 0);
-	fence = dma_resv_get_excl_unlocked(obj->resv);
-	drm_atomic_set_fence_for_plane(state, fence);
+	rcu_read_lock();
+	dma_resv_for_each_fence_unlocked(obj->resv, &cursor, false, fence) {
+		rcu_read_unlock();
+		/* TODO: We only use the first write fence here */
+		drm_atomic_set_fence_for_plane(state, fence);
+		return 0;
+	}
+	rcu_read_unlock();
 
+	drm_atomic_set_fence_for_plane(state, NULL);
 	return 0;
 }
 EXPORT_SYMBOL_GPL(drm_gem_plane_helper_prepare_fb);
-- 
2.25.1

