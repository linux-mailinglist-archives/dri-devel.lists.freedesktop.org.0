Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BA7406873
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 10:27:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D13B36E99B;
	Fri, 10 Sep 2021 08:27:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B103F6E992
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 08:27:09 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 l18-20020a05600c4f1200b002f8cf606262so839462wmq.1
 for <dri-devel@lists.freedesktop.org>; Fri, 10 Sep 2021 01:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SoAGyzr0AFHKUUA0vh6k3hC1t95HnGfzvSeL9OXTB3o=;
 b=Z3iC+Swm/AAIJ5S/nzJFDgKB/1deDYDWIvJHSIZZkReTUl7PpCdA2jxrlDFfpdmiOu
 t2YqkLV2EsTZ24/oR/1LWA3s34bUo7ah3JCqtEYlKQYP2qZX3AUrz6c3mIfNmhUoW/ur
 +mWRK2K0hsLLLEGoycitOQMzkxR4XHi/SdaDjfz18w+KlI6c9THsDdBR2izyAPt4ZKuz
 Bb7zoYOn32kZb3XSBl51sQklFUjKJiVnnnarZgV73OpFnuPz/ifQHmyUOE2fzD2GCgdQ
 YQDVJOGJLvzv04xFF0NO+xbiwvkuQ22hVCYBc4Vr7jeNeHmM/QzrQz6fZ9LTbHXVs6As
 d9iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SoAGyzr0AFHKUUA0vh6k3hC1t95HnGfzvSeL9OXTB3o=;
 b=5Wz71vzpcJDZy3wQH0XPl7waFI7HNOwIzSKr6nS8h7/JPMDt0KqVbLfRLrwTwNkSLA
 VzcLE+W5bqMMXOUqAnM2kCjZvsuXC4DQM1m7QJzjKLj2CgRGfqq9Q/kbe0qNbgXnM5fc
 DNmnG+ocWjrcXWXSENJMr12VUkjxJ6+1NRDHpbO8Ssnk4dx5ZcomNP84Y0WbS/VBRTbC
 LiM251F8FbE1mkNR5OlTpNHYn00oAggXuoI4DzaPKnyGPAG1fSHWJeBdRZe7O4AlxWsj
 m1WVcRZNt2oOb3cvp3+Ijr/6zVm8BAnVDcEA30HXllpQz+RleuhoAfyrFi/xvZksENZp
 pDXw==
X-Gm-Message-State: AOAM532PyY96N/otrmxL2JjgdG4vI3AQWLvWou1/pqME6P/fGYWjHDrE
 Oe6NB1BGxnJ7GJZ3wwprvFs=
X-Google-Smtp-Source: ABdhPJyp1TSwidEpj8PAEswJmvQlCFP+0w3GyUfxZc/HjYy4dAcrjUXWhYXK4rt7EyLcq3pk+9dAGw==
X-Received: by 2002:a1c:2b04:: with SMTP id r4mr7169119wmr.89.1631262428260;
 Fri, 10 Sep 2021 01:27:08 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 l10sm4429756wrg.50.2021.09.10.01.27.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 01:27:07 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Cc: daniel@ffwll.ch
Subject: [PATCH 12/14] drm/msm: use new iterator in msm_gem_describe
Date: Fri, 10 Sep 2021 10:26:53 +0200
Message-Id: <20210910082655.82168-12-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210910082655.82168-1-christian.koenig@amd.com>
References: <20210910082655.82168-1-christian.koenig@amd.com>
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

Simplifying the code a bit. Also drop the RCU read side lock since the
object is locked anyway.

Untested since I can't get the driver to compile on !ARM.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 5db07fc287ad..8ee4e8881b03 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -906,7 +906,7 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 {
 	struct msm_gem_object *msm_obj = to_msm_bo(obj);
 	struct dma_resv *robj = obj->resv;
-	struct dma_resv_list *fobj;
+	struct dma_resv_cursor cursor;
 	struct dma_fence *fence;
 	struct msm_gem_vma *vma;
 	uint64_t off = drm_vma_node_start(&obj->vma_node);
@@ -981,22 +981,13 @@ void msm_gem_describe(struct drm_gem_object *obj, struct seq_file *m,
 		seq_puts(m, "\n");
 	}
 
-	rcu_read_lock();
-	fobj = dma_resv_shared_list(robj);
-	if (fobj) {
-		unsigned int i, shared_count = fobj->shared_count;
-
-		for (i = 0; i < shared_count; i++) {
-			fence = rcu_dereference(fobj->shared[i]);
+	dma_resv_for_each_fence(robj, &cursor, true, fence) {
+		if (cursor.is_exclusive)
+			describe_fence(fence, "Exclusive", m);
+		else
 			describe_fence(fence, "Shared", m);
-		}
 	}
 
-	fence = dma_resv_excl_fence(robj);
-	if (fence)
-		describe_fence(fence, "Exclusive", m);
-	rcu_read_unlock();
-
 	msm_gem_unlock(obj);
 }
 
-- 
2.25.1

