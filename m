Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 99E803AE9A3
	for <lists+dri-devel@lfdr.de>; Mon, 21 Jun 2021 15:03:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7CA86E03C;
	Mon, 21 Jun 2021 13:03:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49BC689FDB;
 Mon, 21 Jun 2021 13:03:32 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id gt18so28630442ejc.11;
 Mon, 21 Jun 2021 06:03:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=TiHXO7JP6QF/TlhNPUn6GBOddFEqJ09ltmC4zViGvew=;
 b=iWZJnpSYvoIc7VR5hoZ6pVw0UObiHwYug2ePRkJevmFtNx7p+1gE4bqfB745LFm7Do
 fWDV001MXBdNnRQOwAibk1RS+vtfRDbm3wovAaVpDQKRRDQI+N2Ks77ji4FCT+ArjzR+
 JFcEMen4CfeGNtoQaIZqOO4wixrPMT0K05m6rzDUfFdT2G26A7JFljxILQ8L9wDVuOA3
 KroFRINXu3WvNJUEwUcxTwUKCbruDhwaxP+YoiO2ZVwhFbbht+OEXlwfHreGadXljVdn
 Nolmeg9G7Aofz43IG4XkCAV+rkYsScUM9G2vTI0sYxZDLs1IcHH5pGpzaQJu2Uy4AEI1
 sMzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=TiHXO7JP6QF/TlhNPUn6GBOddFEqJ09ltmC4zViGvew=;
 b=LetwoqbMAwTchwQtzpkGvMp7LpkK4Gqxm+Q6ubjfGqpll/yAyrg9Nef1CG9S+wdGeD
 5WmmO+tEu5akYf5cEAnUPd/IZeH2VWyK1Ivqib4Sc6iQ/Px8J5mHh9Hz99aGORDxYWUw
 bjzWIAcvAPyiaZmTowzCkrOHXtf6N9oBt8k/e2XFlFEaptR3hun5oZFhBTUw1OiH5Dg2
 sINppb8CSdDGq9Rl25+ETRxXQcn+V74D490+6drwVpyA1Tzz4ZpRGfebv5WBx0tQWXZg
 eZKQ0nZSkCqrROiH6Y4C5T6wnjMIfY/lc73NYfMp2wOtN+yXyp5h+uviRpCAUk4Y/x5z
 WJFA==
X-Gm-Message-State: AOAM532YXW57NsCZ7b9dF/KZRRFNosWyiPDJo+D4Ji/leHnIcXHit99h
 BwfbZNCtdrJXAV2CMuAVktB0xihZg08=
X-Google-Smtp-Source: ABdhPJwJUO1G99EcRo8+JIZJJJ9Z6wwTZVLD0RMA36aaD0El+Rln+vOVjF7PNnM2L0oihYfvhRMGnA==
X-Received: by 2002:a17:906:ce29:: with SMTP id
 sd9mr4775332ejb.56.1624280611016; 
 Mon, 21 Jun 2021 06:03:31 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:bd92:da7:4d23:8910])
 by smtp.gmail.com with ESMTPSA id w10sm5322375edv.34.2021.06.21.06.03.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 21 Jun 2021 06:03:30 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: dri-devel@lists.freedesktop.org, daniel.vetter@ffwll.ch,
 nouveau@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
Subject: [PATCH 3/3] drm/amdgpu: wait for moving fence after pinning
Date: Mon, 21 Jun 2021 15:03:28 +0200
Message-Id: <20210621130328.11070-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210621130328.11070-1-christian.koenig@amd.com>
References: <20210621130328.11070-1-christian.koenig@amd.com>
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

