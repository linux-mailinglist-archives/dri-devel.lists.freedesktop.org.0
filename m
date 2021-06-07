Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDCDD39E601
	for <lists+dri-devel@lfdr.de>; Mon,  7 Jun 2021 19:57:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF9F76E9A5;
	Mon,  7 Jun 2021 17:57:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8B3E6E9A5
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Jun 2021 17:57:39 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 v206-20020a1cded70000b02901a586d3fa23so167017wmg.4
 for <dri-devel@lists.freedesktop.org>; Mon, 07 Jun 2021 10:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1u+ckWwthwNK3SRed0B5Kc4CE3s0y8cz4/Ch47hZvr4=;
 b=qKCIurkMBAv/Q6gsO5vKlM/gWR48sRrFHCa+L8uCPq4sB6+d0imqJ5kzgzoRIHrYE0
 NRM8CcL4jWTt5c8Xwir3wqRyYYYsIcuPTcxK25nn67k3wQB9kBObq+IMF6Xh6kOj2iMs
 iTuNO4RNchCZ+holHyARfxuLDZ78+pqM2sNCX+PFQIjHB/SrzfpmUccE6DR1xW3of67z
 Wt6ac9lLQbrQOZBx9gEPJHS7Kdlv/nNORvYmsIOEgP19vykBhhHE20Hbpp4Yx4YTITGO
 5BHVmuJTk3lCJ15Nqhu1KXVkEhDW9OHmtqYKmKwBQuW1YLnuQ1bmQqBBKTueCWmJSxu/
 ThRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1u+ckWwthwNK3SRed0B5Kc4CE3s0y8cz4/Ch47hZvr4=;
 b=FsRxkN1/blx33kbyNpn1Zsk5tyxWF014Xlll2nmzwgDUO5EBXlIoYcovObo01EB+bD
 g36DKY6tWrZ/U1G5nkpNIiXf6b86bf745pdCzGCNt/KXTOTFSooUDwRCwoWS+wjtSypu
 RlUVDWLMd5sKyl07III+zVI6UXEq7/CHWl/lYQaIAljcNAlqt9aGiErVnENytl0JkQ32
 DykYABLQqmyoiK1giI8ejOWfruRABnEhlrD4ElYOxvpVg8MaX8z2EM148bJMfvGX1TGZ
 q/4E8+RDcFltcUsCWt+qmbGxERPbzSkdKozr10+qolbJOGiODvNU7qyDbMcgjH1VhmcS
 bXbQ==
X-Gm-Message-State: AOAM530axz2FYnxxZzh38JUMFPmClaeOsI+8TvbdsWBqMopjjE6NmRJ4
 DrP3qjs0s/m6sFhJBk4DIVE=
X-Google-Smtp-Source: ABdhPJzw/yrAzJFr0c0COEOfOOYsBlPuF1SjIklkpkQH/y4W4FZhNdhR5PUTUhVNdpI392mDCRZvUA==
X-Received: by 2002:a05:600c:3544:: with SMTP id
 i4mr327386wmq.112.1623088658233; 
 Mon, 07 Jun 2021 10:57:38 -0700 (PDT)
Received: from abel.fritz.box ([2a02:908:1252:fb60:13d5:cbb0:b736:cf3e])
 by smtp.gmail.com with ESMTPSA id z19sm215157wmf.31.2021.06.07.10.57.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jun 2021 10:57:37 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: thomas_os@shipmail.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/ttm: fix warning after moving resource to ghost obj
Date: Mon,  7 Jun 2021 19:57:37 +0200
Message-Id: <20210607175737.1405-1-christian.koenig@amd.com>
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

After we moved the resource to the ghost the bo->resource pointer needs
to be resetted since the owner of the resource is now the ghost.

Signed-off-by: Christian König <christian.koenig@amd.com>
---
 drivers/gpu/drm/ttm/ttm_bo_util.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
index 1b326e70cb02..a2b97cd84d8f 100644
--- a/drivers/gpu/drm/ttm/ttm_bo_util.c
+++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
@@ -603,6 +603,7 @@ static int ttm_bo_move_to_ghost(struct ttm_buffer_object *bo,
 		ghost_obj->ttm = NULL;
 	else
 		bo->ttm = NULL;
+	bo->resource = NULL;
 
 	dma_resv_unlock(&ghost_obj->base._resv);
 	ttm_bo_put(ghost_obj);
-- 
2.25.1

