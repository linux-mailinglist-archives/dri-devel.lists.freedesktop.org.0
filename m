Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22BE87D9E59
	for <lists+dri-devel@lfdr.de>; Fri, 27 Oct 2023 18:59:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD0B810EA1F;
	Fri, 27 Oct 2023 16:59:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD52B10EA1D;
 Fri, 27 Oct 2023 16:59:25 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-280208d0679so139584a91.3; 
 Fri, 27 Oct 2023 09:59:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698425965; x=1699030765; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2BA1fIFWWJwK3F1h9NsiUN1cc0sAjE3mQ5LVwLgXV8Q=;
 b=Ec5oCFSDOBihlIiFRsq3UnPFPVvLK10ul2bocPgT0YAfxt65re8m5p1ci9rlxEk1Hy
 YOf4/RaDRO+dbpMuGp+GvRRPgZwDJYAcw4h+9kf25LlRHnRru+yojvuyRyUWzN/OE06f
 bPsqnhHtTDy5pgnv2b4+krp0EW06fjuWWgZqJzLR4gwSNmNXOimVPdn5+ssVi7YqgkFW
 +E1Pr1pld9uBCPzf0cvPaIueCSXbg2SYRGx3Cyh2EJ58pwGbnRGTpBYqn6/w3Q1fx1fT
 svE6YVAr5mJd4ACtM1asP/0u/vRb5JjWG5+/T9e6S5TuwEqm+6RSDkIqffAx3Hq/wI1M
 2uJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698425965; x=1699030765;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2BA1fIFWWJwK3F1h9NsiUN1cc0sAjE3mQ5LVwLgXV8Q=;
 b=nifJ8n1zg4Th9HPPa1O1fPyAtD8IHSbTj3YnZ52vjbtIu+nNSY991tJBFgaefEEqAr
 1wG4FT9AGoDcKRSOqA7xNX7JTX31NNoIBKGtrKTQkbvNmeS2DMf6BafpRZQvZDMQjAS4
 VkdVCpeqJra2kd6FIkDxSJuU12uK9FhCUV84cl8wEqEBAWHRSESzsigy8s8GDYcgj1Ri
 vQX1rO3ixN78ZnUSh69XIVKw5t2re0zL3qZR/UljDOkDaPR/FViQ+QwkJfyN/S4L62Al
 90nsS8sUaiDGunl5cdusIITKnbKeeii8YhSdyDI5UEnQ1G+OlD22FaEz1R7Mag8U4Ynr
 CEwQ==
X-Gm-Message-State: AOJu0YwUWdxOIVcOzCoCFiz9lstCv5AgXa/PETWJf2R127uf2y3wJyk1
 9vb8aXLrD8xCCAOLfJPoYkxPko7+DXY=
X-Google-Smtp-Source: AGHT+IH/uki0khux3haTMmLK51tgfszYjsxvRsbP4tOoqeorUKEKoGJdToiXOeNo+Y2KebPoIO/3GA==
X-Received: by 2002:a17:90a:6e48:b0:27d:9f6:47b1 with SMTP id
 s8-20020a17090a6e4800b0027d09f647b1mr2892882pjm.33.1698425964884; 
 Fri, 27 Oct 2023 09:59:24 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 e4-20020a17090301c400b001bd99fd1114sm1780352plh.288.2023.10.27.09.59.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Oct 2023 09:59:24 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 5/7] drm/msm/gem: Cleanup submit_cleanup_bo()
Date: Fri, 27 Oct 2023 09:58:39 -0700
Message-ID: <20231027165859.395638-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231027165859.395638-1-robdclark@gmail.com>
References: <20231027165859.395638-1-robdclark@gmail.com>
MIME-Version: 1.0
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Now that it only handles unlock duty, drop the superfluous arg and
rename it.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_submit.c | 15 +++++----------
 1 file changed, 5 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_submit.c b/drivers/gpu/drm/msm/msm_gem_submit.c
index d001bf286606..603f04d851d9 100644
--- a/drivers/gpu/drm/msm/msm_gem_submit.c
+++ b/drivers/gpu/drm/msm/msm_gem_submit.c
@@ -248,14 +248,10 @@ static int submit_lookup_cmds(struct msm_gem_submit *submit,
 	return ret;
 }
 
-/* Unwind bo state, according to cleanup_flags.  In the success case, only
- * the lock is dropped at the end of the submit (and active/pin ref is dropped
- * later when the submit is retired).
- */
-static void submit_cleanup_bo(struct msm_gem_submit *submit, int i,
-		unsigned cleanup_flags)
+static void submit_unlock_bo(struct msm_gem_submit *submit, int i)
 {
 	struct drm_gem_object *obj = submit->bos[i].obj;
+	unsigned cleanup_flags = BO_LOCKED;
 	unsigned flags = submit->bos[i].flags & cleanup_flags;
 
 	/*
@@ -304,10 +300,10 @@ static int submit_lock_objects(struct msm_gem_submit *submit)
 	}
 
 	for (; i >= 0; i--)
-		submit_cleanup_bo(submit, i, BO_LOCKED);
+		submit_unlock_bo(submit, i);
 
 	if (slow_locked > 0)
-		submit_cleanup_bo(submit, slow_locked, BO_LOCKED);
+		submit_unlock_bo(submit, slow_locked);
 
 	if (ret == -EDEADLK) {
 		struct drm_gem_object *obj = submit->bos[contended].obj;
@@ -533,7 +529,6 @@ static int submit_reloc(struct msm_gem_submit *submit, struct drm_gem_object *ob
  */
 static void submit_cleanup(struct msm_gem_submit *submit, bool error)
 {
-	unsigned cleanup_flags = BO_LOCKED;
 	unsigned i;
 
 	if (error)
@@ -541,7 +536,7 @@ static void submit_cleanup(struct msm_gem_submit *submit, bool error)
 
 	for (i = 0; i < submit->nr_bos; i++) {
 		struct drm_gem_object *obj = submit->bos[i].obj;
-		submit_cleanup_bo(submit, i, cleanup_flags);
+		submit_unlock_bo(submit, i);
 		if (error)
 			drm_gem_object_put(obj);
 	}
-- 
2.41.0

