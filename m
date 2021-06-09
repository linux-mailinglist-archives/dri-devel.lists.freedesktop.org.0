Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A793B3A1BC9
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jun 2021 19:29:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DC3E6EA00;
	Wed,  9 Jun 2021 17:29:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE3206E9F9;
 Wed,  9 Jun 2021 17:29:04 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id q5so26397742wrm.1;
 Wed, 09 Jun 2021 10:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hisQDQi2+qRJM6f0zvtzRz/avVS3f798AS+aYM2Iq80=;
 b=J3x9CdeBpq+5uCmg69UOOA+CCvqmLVZmMtJbo2BeBn33JUlCbULGgK6jzjNw+kk7lc
 6XWAbz852Q41K5al5xO7F5i+ggLcin9N4KsgPX77Qp03+aA3PCLcwAr9AkZF/Ry+2/Lp
 sumWm5XvkviOOVlZc/i6abIxDBUcu0nuPotCtP2P6LMaHgNijFkuRQs7l/rIc+xdqsg4
 2t1SY1aU6ixWWrORWV0lSV6fjbqlIrp8vlfyC6PSmgcubA5EZWVh4yAq0TvBJwWQ1VOz
 RLbA8OYolfH1n/3q9HU3J2+XNZ/5HLuEN6reYV7QvYKobDdzueIV7xM4vSUJckdUKuZz
 3XKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hisQDQi2+qRJM6f0zvtzRz/avVS3f798AS+aYM2Iq80=;
 b=XToxRcpgbTdfHK5CIOJxCd2cCwhDZJP01ppG3aE9eg2tEhTNX1kcTXrsC+z9QfgY4n
 RHm8xq/xuYzoUjm4uhpkTDm+SrVG6BGUvry5FKGXkTW2b5ZQlQSAwbmkYLyiF50Lwcnl
 CKJbYBdJMXg5538+dVNKgUbvkKv+3smC6K7ZVLwT/h8gEsOGxTLqDX6nDULVW09QAFip
 1aiPDDTwepq0RGaMV4diwo4iAooIzUiiryMRTPVfNMhSC0+ZmdwnaVr+SO2/4VNwSkfE
 DsKMSjC9K7QGVLFDniS2lFTKSl1A+TDRXLi0XO5LAUex1t1hYJKBL6FQi2NvjDLSCFzd
 7blQ==
X-Gm-Message-State: AOAM530D5GDmNt5uPbHC7/4yOZTtP3Cqo7uAfa4M8CNcGAjJpSR2Dqtd
 QS/LGo/aovaggsSZnkbRWo4=
X-Google-Smtp-Source: ABdhPJy85u2jsCOke2wD/gZLF8ArY3JCZKYO07JVfhpzyRmDf61JGNZzvRYD4gJ3l5dxpgdnH44+cA==
X-Received: by 2002:a5d:5585:: with SMTP id i5mr884648wrv.371.1623259743420;
 Wed, 09 Jun 2021 10:29:03 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:b195:7245:6855:de04])
 by smtp.gmail.com with ESMTPSA id w13sm364488wmi.48.2021.06.09.10.29.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 10:29:02 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: imirkin@alum.mit.edu, cyndis@kapsi.fi, linux-tegra@vger.kernel.org,
 nouveau@lists.freedesktop.org, ray.huang@amd.com, matthew.auld@intel.com,
 dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/nouveau: init the base GEM fields for internal BOs
Date: Wed,  9 Jun 2021 19:29:02 +0200
Message-Id: <20210609172902.1937-1-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
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

TTMs buffer objects are based on GEM objects for quite a while
and rely on initializing those fields before initializing the TTM BO.

Noveau now doesn't init the GEM object for internally allocated BOs,
so make sure that we at least initialize some necessary fields.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 520b1ea9d16c..085023624fb0 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -149,6 +149,8 @@ nouveau_bo_del_ttm(struct ttm_buffer_object *bo)
 	 */
 	if (bo->base.dev)
 		drm_gem_object_release(&bo->base);
+	else
+		dma_resv_fini(&bo->base._resv);
 
 	kfree(nvbo);
 }
@@ -330,6 +332,10 @@ nouveau_bo_new(struct nouveau_cli *cli, u64 size, int align,
 	if (IS_ERR(nvbo))
 		return PTR_ERR(nvbo);
 
+	nvbo->bo.base.size = size;
+	dma_resv_init(&nvbo->bo.base._resv);
+	drm_vma_node_reset(&nvbo->bo.base.vma_node);
+
 	ret = nouveau_bo_init(nvbo, size, align, domain, sg, robj);
 	if (ret)
 		return ret;
-- 
2.25.1

