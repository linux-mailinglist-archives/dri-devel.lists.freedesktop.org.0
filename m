Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A299408C54
	for <lists+dri-devel@lfdr.de>; Mon, 13 Sep 2021 15:17:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6726B6E1A4;
	Mon, 13 Sep 2021 13:17:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B74F76E199;
 Mon, 13 Sep 2021 13:17:26 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id s24so6631775wmh.4;
 Mon, 13 Sep 2021 06:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=SoAGyzr0AFHKUUA0vh6k3hC1t95HnGfzvSeL9OXTB3o=;
 b=Kh0OGoeXjzmmCZ0zjFYjMjhcLCSGakXHyJFBtgqCTcmXpUKYZV5H0OOwlCfY6fe9UW
 jh/OKomca4DKpPuZ/+ovaBWY2PF6EfRl8Y+h5iNUuQV0BoP4mjshAyuW4DuLQEGXQHrx
 hnNwydun9hTXd4TlI4ZGsZQ03xedApkQQCxHXuyBwGyAzmb8uOvNvdAW/crG/MKfLvnz
 vTA0nZdzBuax3McLso8eGXFQuQhsiF7nlUMrHxGBZNYOLwJT4xCvQ2mMnlRRNMDysznP
 Uks1ETS8osqd9cSSXZ1WuKsAOqw0/zBAnTXB9ox4c2fMgnBTAtM20DkT6qQhR/sLYZq/
 KwyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=SoAGyzr0AFHKUUA0vh6k3hC1t95HnGfzvSeL9OXTB3o=;
 b=rbiJLLrrtaJzScIiUAdxC7NUK7vH31bBdji5Pu61OOphEgR+v4wgkkF2jS/jp1JxAP
 zSYzTLNWeZhph0M71pSj86ifu1FB92tco3pLuOfO7lG2/aP2cLVg4Ehegg6z7DwiqBUs
 iWhUUMMrsOntLvzNqSYpsOA3XStdcu15rufXTvTYl9qvI+TmEcI9OyPTFIw0sIlaGAAB
 GwsIENChSXnqxHqgiDd//u7xzfisSSNhkQTCjZ5f8zaquhanfKp6zjZbexwOMN3Hl4V0
 JvYLJqphZrontwHccZuomiN2acRor00T32rKRx9xYJCQJ8vq1E4tNgOM2luidJv8g3vT
 at3g==
X-Gm-Message-State: AOAM530NHdLXry2knL4BYZAh5DWkegF7QdlKADHb0pk2cXBrbJ++jc3m
 dveUPfX/Lfy+v+Zu43kVz4o=
X-Google-Smtp-Source: ABdhPJzx3GYjZUiC7y9zv3TKie29kMObPXC3Pqr0OxTxbCQd7waFVUuKw2gckGGdNYEhwXhRnzNeWg==
X-Received: by 2002:a7b:c4d2:: with SMTP id g18mr11295003wmk.135.1631539045407; 
 Mon, 13 Sep 2021 06:17:25 -0700 (PDT)
Received: from abel.fritz.box (p5b0ea1b5.dip0.t-ipconnect.de. [91.14.161.181])
 by smtp.gmail.com with ESMTPSA id
 h18sm7602834wrb.33.2021.09.13.06.17.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Sep 2021 06:17:25 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: linaro-mm-sig@lists.linaro.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Cc: daniel@ffwll.ch,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH 10/26] drm/msm: use new iterator in msm_gem_describe
Date: Mon, 13 Sep 2021 15:16:51 +0200
Message-Id: <20210913131707.45639-11-christian.koenig@amd.com>
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

