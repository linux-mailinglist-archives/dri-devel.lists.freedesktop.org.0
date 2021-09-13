Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BED8408C55
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 15:18:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E2526EC9D;
	Mon, 13 Sep 2021 13:17:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF0EB6E1B5;
 Mon, 13 Sep 2021 13:17:28 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id x6so14628871wrv.13;
 Mon, 13 Sep 2021 06:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+N6pI34ue5grUeX+sNiKUIx/zzj3XOBkLRGSUAp4Yz0=;
 b=QdkVW11wcMD2kRNQ2Xv7e/9VhlyaS+h+YV/huVDrKbjHmw2hxr2MhHdFcGDaG86Zzp
 2ejFzYfty4x5gxw3YkBF2Qy/0Emr7g/cn/E8vjFsnCkHubeT3Jd+RkX3wwlqVtYsrWcS
 yUI1GcKUCG8Lw5LPE/k36qjqPygJFijwLhrrmDeSLYNyh2TCm3AOK7w+rpOH2lDrRXwR
 YED2TGzSvAH5JAWzQLdvpYuhUCj0CMF20pxCgHD7CEKAGMiHjLMregiF+tjCRL32STtp
 xvPf3rc2qDLn4tCNE7jC/MswReDn4GVW6FSJ+yT7Mus5Dkoo6MU7kGRdoNAMTQgn9MBs
 6Pjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+N6pI34ue5grUeX+sNiKUIx/zzj3XOBkLRGSUAp4Yz0=;
 b=c2to9ilRhVmzCh+XOjYNLOK79UxANdxvtMR0kFDXNKnYZ2R/BJA225z7Wt+d910sS3
 HxrJEDRkdnjz9ubo4cWUZran8DpEqReBLrVKn/NGPMuB9NYwuWEDl32FMo+BX52mLTiy
 0jrcl03ucGddBmHT/2y2pj060KfvdGexStuFFcQB3UQnAdOiR6q8ZJEt75zc4ZQ6oCUN
 2Iv45PUwO5PVnWwmW9VSvzFon4dJXpks81Sug/olBaBPvEhL1w6hYEVYHXWOmVoQDzo/
 mUGLNoHkcDcPzdlbYi0ImIG5mKQz1t7sf7cE8svSQDWXH+mtAX5/z/U1LoU2+vbl0nzk
 ZTVw==
X-Gm-Message-State: AOAM5316crQEQr9HpgYVJnjNKlKIF1zEZ7A9bPyTdrsSDhjUegA/hADx
 +SYfLIFgP8UpTit2HaCpTsk=
X-Google-Smtp-Source: ABdhPJwa2Q1aKq0eaVUPc8t2uLS7a54jIFnxtQ+aHxJHb1BBQ5WJsoqxVWeV/vsbPbhiwfwyd23INQ==
X-Received: by 2002:adf:80e2:: with SMTP id 89mr12429172wrl.43.1631539047458; 
 Mon, 13 Sep 2021 06:17:27 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 h18sm7602834wrb.33.2021.09.13.06.17.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 06:17:27 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Cc: daniel@ffwll.ch,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 12/26] drm/scheduler: use new iterator in
 drm_sched_job_add_implicit_dependencies
Date: Mon, 13 Sep 2021 15:16:53 +0200
Message-Id: <20210913131707.45639-13-christian.koenig@amd.com>
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
 drivers/gpu/drm/scheduler/sched_main.c | 26 +++++++-------------------
 1 file changed, 7 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 6987d412a946..b64b673ed040 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -699,29 +699,17 @@ int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
 					    struct drm_gem_object *obj,
 					    bool write)
 {
+	struct dma_resv_cursor cursor;
+	struct dma_fence *fence;
 	int ret;
-	struct dma_fence **fences;
-	unsigned int i, fence_count;
-
-	if (!write) {
-		struct dma_fence *fence = dma_resv_get_excl_unlocked(obj->resv);
 
-		return drm_sched_job_add_dependency(job, fence);
-	}
-
-	ret = dma_resv_get_fences(obj->resv, NULL, &fence_count, &fences);
-	if (ret || !fence_count)
-		return ret;
-
-	for (i = 0; i < fence_count; i++) {
-		ret = drm_sched_job_add_dependency(job, fences[i]);
-		if (ret)
+	dma_resv_for_each_fence_unlocked(obj->resv, &cursor, write, fence) {
+		ret = drm_sched_job_add_dependency(job, fence);
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
 EXPORT_SYMBOL(drm_sched_job_add_implicit_dependencies);
-- 
2.25.1

