Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BBD41EA81
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 12:07:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60F976EDD6;
	Fri,  1 Oct 2021 10:06:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB4A46EDCA;
 Fri,  1 Oct 2021 10:06:28 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id m22so9154385wrb.0;
 Fri, 01 Oct 2021 03:06:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d730QTcA12WB0FxkhM0n+vEOwpHIgTa3YH56dqVvnac=;
 b=aLz6htSFtsiJnmZk6iPAAcargupnOFJsx0x5S20/nkp2OEcsstBr3b46ddds+UNSB+
 kPQgf7O5UHAQyWsoRD4CbVGZyrHxHCY+V5qBwggSJkqt7dQjdnjQ2v287HDIUs/smbiQ
 zWsSDNB8ooRKxv60yqwYZHnzZYbeocAIJnmG6ELZtaJHUnCV7jlPCtjjHcrYzhS9b+Ed
 FNilwvj+wOLBK/f5gTC1VDaltB0FO9qldFrYqbU4MWQRycQaH/qWFCutT7+tH7BOw4AT
 OH/y7bZyJSY8mKvGlf3p2zcgvJiDMV4G9LDbbYWf4WXP2N79Gh9uBgaXT3uhY4WnKWSK
 HI8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d730QTcA12WB0FxkhM0n+vEOwpHIgTa3YH56dqVvnac=;
 b=zRYw+yFGc3lDa1vupJRselLMjMgWmeArgw2fncFVBsF4YJ1xZj4NAUz0h1elxJMuvD
 OenBNpNAANVWUAnCV0SZ7pDYO529JQbnKyBhYsPWrjPVTsEV48r2dpV9s0KCUaAHQo22
 mwdy3JcpUQBXoFHUvaXX5UNu8FYE+wAmpmoZ14+NuRQqas2nOk17TWJgeqUXi+90oEfW
 aUxh/8wBtijgQiM54rm2rImxZHHTAUPAvIWwbAIYqCGOAuL0NNgnn7plv35vv4WZRuoG
 0gHgk9f8PC+XURfRVphp0cfjsD9N74EUPOwHzVQKoX9OvEHSpgkHAWopTtdgBL4BvmDj
 CKkg==
X-Gm-Message-State: AOAM533Xf/agKlCvzhAA9NgcTUO3OcAGekvX51K4wcyLX0NvKIq9FBU9
 S8hoO/GaQ9riFW7TF6zoAJgc/AHxmB8=
X-Google-Smtp-Source: ABdhPJwgWXQpla7lMGDPPe0fAEP9N6dAexMHV3C4YjWZP22yd+DnwSODgfTN4bxkkGbD2Y6yAclTxg==
X-Received: by 2002:a05:6000:144e:: with SMTP id
 v14mr9975574wrx.228.1633082787356; 
 Fri, 01 Oct 2021 03:06:27 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 v17sm5746069wro.34.2021.10.01.03.06.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 03:06:27 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org, intel-gfx@lists.freedesktop.org
Cc: daniel@ffwll.ch,
	tvrtko.ursulin@linux.intel.com
Subject: [PATCH 16/28] drm/scheduler: use new iterator in
 drm_sched_job_add_implicit_dependencies v2
Date: Fri,  1 Oct 2021 12:05:58 +0200
Message-Id: <20211001100610.2899-17-christian.koenig@amd.com>
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

v2: use dma_resv_for_each_fence

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
---
 drivers/gpu/drm/scheduler/sched_main.c | 26 ++++++--------------------
 1 file changed, 6 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/scheduler/sched_main.c b/drivers/gpu/drm/scheduler/sched_main.c
index 042c16b5d54a..5bc5f775abe1 100644
--- a/drivers/gpu/drm/scheduler/sched_main.c
+++ b/drivers/gpu/drm/scheduler/sched_main.c
@@ -699,30 +699,16 @@ int drm_sched_job_add_implicit_dependencies(struct drm_sched_job *job,
 					    struct drm_gem_object *obj,
 					    bool write)
 {
+	struct dma_resv_iter cursor;
+	struct dma_fence *fence;
 	int ret;
-	struct dma_fence **fences;
-	unsigned int i, fence_count;
-
-	if (!write) {
-		struct dma_fence *fence = dma_resv_get_excl_unlocked(obj->resv);
-
-		return drm_sched_job_add_dependency(job, fence);
-	}
-
-	ret = dma_resv_get_fences(obj->resv, NULL, &fence_count, &fences);
-	if (ret || !fence_count)
-		return ret;
 
-	for (i = 0; i < fence_count; i++) {
-		ret = drm_sched_job_add_dependency(job, fences[i]);
+	dma_resv_for_each_fence(&cursor, obj->resv, write, fence) {
+		ret = drm_sched_job_add_dependency(job, fence);
 		if (ret)
-			break;
+			return ret;
 	}
-
-	for (; i < fence_count; i++)
-		dma_fence_put(fences[i]);
-	kfree(fences);
-	return ret;
+	return 0;
 }
 EXPORT_SYMBOL(drm_sched_job_add_implicit_dependencies);
 
-- 
2.25.1

