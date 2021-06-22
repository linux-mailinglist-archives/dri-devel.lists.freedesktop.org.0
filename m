Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A8363B031A
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jun 2021 13:45:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D01E6E4AB;
	Tue, 22 Jun 2021 11:45:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC1856E4AA
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 11:45:10 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id gn32so6640871ejc.2
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jun 2021 04:45:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=hfQZpeDBNoKOQXnE845lT5OFQM2A8FzjYlPs5kzvoZE=;
 b=VBR6o6ohQgIg08FZHSJ4Ql5/vMlWrIEC/vsBmpz3Aipg1oKWpD+e1fIuL+dzLSSkXl
 gwuRmmVCXUd3nUck5nL1YerRLup0EilXCXSI1fChSG4oMhdjO2Ks7wVwhWL44x2EbOB+
 LTo0sPsXUpqshtpD1s6letr8YXlDOuYKMB2ySo7xt2DDPgObr7Rdjs3HL0RcPoylOTzn
 p3M0il0+mMYlAWgz5jOUUDnwVDNitYbLAYKZ23Ceq9b9rnwj4wM5bJN1d6iiZY5bMisI
 5Wk6cP3ehabvsVw8tCUFkEd9p8yPKaTNc8iLT/iEBvPE/kfmv9IaDSVle1B/bK/sXPgd
 2hEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hfQZpeDBNoKOQXnE845lT5OFQM2A8FzjYlPs5kzvoZE=;
 b=QPPMjJu+K6NpvjQXagx/AoG7ocprP8MjdrlZoVuq1XOZGTSNxwashuMzrzz5sYhJjF
 6mEWZdVEYWd/QUWjB84hhFvvu2cuCPEzsRmL26z90F99kqL/mmQtgYEVTa8h3RoVdUTE
 0lX9XfwNCLJFAPHXc8afflCodfqH9HzzRnOi/r3srgnGRzQv5Yvemu6cDTFIxRg/GXzP
 C6o+0LcICgE5D0gsMaXZS1IVq+cVxFtoi+fog44wm3GYXt63Y/HEDik8ZdvU8PUq20k6
 zw+beySBAArzKaLt4fwkaM0MWigs2HdDqaIcQFSlyrl5fLvh06VY6hLcefI6virwAncg
 oBOw==
X-Gm-Message-State: AOAM533RFCeVUUk9dekB8V0ljc7EM99YMmvAoACDTRVpqLM9h6/w0E2i
 fpc6AK4Qjgk9Gu2CR+UnCj5AjtX8PnI=
X-Google-Smtp-Source: ABdhPJw2abiBHmbNK/h8hYMBFgMAM+fM+bTtO0khoZZwkS+/ItiOvbvkiPUnThNUitFqzurrqzKxHQ==
X-Received: by 2002:a17:906:f990:: with SMTP id
 li16mr3569793ejb.387.1624362309570; 
 Tue, 22 Jun 2021 04:45:09 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:19f5:e310:467b:783d])
 by smtp.gmail.com with ESMTPSA id hg25sm5939086ejc.51.2021.06.22.04.45.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jun 2021 04:45:09 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org,
	daniel.vetter@ffwll.ch
Subject: [PATCH 3/3] drm/amdgpu: wait for moving fence after pinning
Date: Tue, 22 Jun 2021 13:45:06 +0200
Message-Id: <20210622114506.106349-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210622114506.106349-1-christian.koenig@amd.com>
References: <20210622114506.106349-1-christian.koenig@amd.com>
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

We actually need to wait for the moving fence after pinning
the BO to make sure that the pin is completed.

Signed-off-by: Christian König <christian.koenig@amd.com>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
References: https://lore.kernel.org/dri-devel/20210621151758.2347474-1-daniel.vetter@ffwll.ch/
CC: stable@kernel.org
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
index baa980a477d9..37ec59365080 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_dma_buf.c
@@ -214,9 +214,21 @@ static int amdgpu_dma_buf_pin(struct dma_buf_attachment *attach)
 {
 	struct drm_gem_object *obj = attach->dmabuf->priv;
 	struct amdgpu_bo *bo = gem_to_amdgpu_bo(obj);
+	int r;
 
 	/* pin buffer into GTT */
-	return amdgpu_bo_pin(bo, AMDGPU_GEM_DOMAIN_GTT);
+	r = amdgpu_bo_pin(bo, AMDGPU_GEM_DOMAIN_GTT);
+	if (r)
+		return r;
+
+	if (bo->tbo.moving) {
+		r = dma_fence_wait(bo->tbo.moving, true);
+		if (r) {
+			amdgpu_bo_unpin(bo);
+			return r;
+		}
+	}
+	return 0;
 }
 
 /**
-- 
2.25.1

