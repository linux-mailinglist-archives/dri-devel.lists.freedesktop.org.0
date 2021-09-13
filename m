Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85F61408C56
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 15:18:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24AD36EC9A;
	Mon, 13 Sep 2021 13:17:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DE7A6E1A5;
 Mon, 13 Sep 2021 13:17:39 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id m9so14677068wrb.1;
 Mon, 13 Sep 2021 06:17:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=cqrPgfWJBnrlrJStbHT4p1XHhorqFS0NFap8w3SO71w=;
 b=dVp9YQTGSPQdK6XKvV0Dou4jqoLAYTi0I3Dt7ZW6manhGGTT0tHQyzVs19XZA6acv/
 W6T1Jkz2TC1YngzprtNG+UWiiozq8pALeSGRfsqvgk1rWOf4cQXdaJmu5omeDBtS2WOH
 vjBSbKel/plaBmCnJn+MGaC+9wHGEw39H2EEFlZYbk/QYJtB2iMzbP+xgDsACUyYMm+S
 klRFfyLN9G4QIN8AJnNpuB4rTJJ6I8lWXS1G8giLTUPc3N1axuOZDlHLB2WuHl7P3ov5
 VjLCxI5MGwU+AeC+tnYFKpGVxCtkgyOvfDTPWBP60ZsueKCoAlKjQUlxz3LCk62d675a
 Uwiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=cqrPgfWJBnrlrJStbHT4p1XHhorqFS0NFap8w3SO71w=;
 b=Ns2UI0tyxJi3UwhVg/KBQ006EI6amYLB2FwS2enqqbu/CKWC44LcLTAeHveD+J7H+m
 DDVX8CB2lkDQjxsQMiJaTkHy3bAIfu0UinG14uDpqy1Eg39yqCkVQsETRKJsJMiuxMaw
 ZwXna+KLlJjX+xG+2ZD7nwmXAhiTIyMCrbKs2hgc4nrSoucE+rlcCAXrhpVeAs1TdFq6
 c2+JgxK+B2M99QZfn6mHtXAbi5sFebuILHd72XRYYb3UGimyhpP/ZvbzWGzICK7TMuRe
 AjvdXB/FkJI3MK1fez4M3y9UfZLgxrYt6OTholXAt2buQxtxqys/OlTjcyRrGciyIgJo
 Fo5Q==
X-Gm-Message-State: AOAM531wH8xNz4Eh85tXVBgV7O9JRDcbTC30sh822aCrbkLYEyBkP3eA
 3MnwT/F+2pYeYErasdq45mc=
X-Google-Smtp-Source: ABdhPJzR6Mgxb45Lu2WU1DaeNVT4R7szGLx4B2hlz5wyz1oQoklArO9DPkMc6QvaZrE8NwiXbnSE/Q==
X-Received: by 2002:adf:9e0b:: with SMTP id u11mr12590484wre.85.1631539058200; 
 Mon, 13 Sep 2021 06:17:38 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 h18sm7602834wrb.33.2021.09.13.06.17.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 06:17:37 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Cc: daniel@ffwll.ch,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 20/26] drm: use new iterator in
 drm_gem_fence_array_add_implicit
Date: Mon, 13 Sep 2021 15:17:01 +0200
Message-Id: <20210913131707.45639-21-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210913131707.45639-1-christian.koenig@amd.com>
References: <20210913131707.45639-1-christian.koenig@amd.com>
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
 drivers/gpu/drm/drm_gem.c | 30 ++++++++----------------------
 1 file changed, 8 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
index 09c820045859..6e3b8491be68 100644
--- a/drivers/gpu/drm/drm_gem.c
+++ b/drivers/gpu/drm/drm_gem.c
@@ -1340,31 +1340,17 @@ int drm_gem_fence_array_add_implicit(struct xarray *fence_array,
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
+	struct dma_resv_cursor cursor;
+	struct dma_fence *fence;
+	int ret = 0;
 
-	for (i = 0; i < fence_count; i++) {
-		ret = drm_gem_fence_array_add(fence_array, fences[i]);
-		if (ret)
+	dma_resv_for_each_fence_unlocked(obj->resv, &cursor, write, fence) {
+		ret = drm_gem_fence_array_add(fence_array, fence);
+		if (ret) {
+			dma_fence_put(fence);
 			break;
+		}
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

