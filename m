Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B098388950
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 10:24:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04CAF6ECDE;
	Wed, 19 May 2021 08:24:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 914E66ECDE
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 08:24:15 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 f6-20020a1c1f060000b0290175ca89f698so2904055wmf.5
 for <dri-devel@lists.freedesktop.org>; Wed, 19 May 2021 01:24:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pt9LL0+CuDm+kdoZO8QVUQbhMgcl5obcxGIsILddiNI=;
 b=MQ9aFrBz0PeaXFmhxuJJKRsXWsV4ojKWOestex1JmpswITEMtO7NyCITY+f/B6cfEd
 YuaJOcN4AJzF/aASgepJ5vLaUTnCWQGxKO2WN7amvEcX41c5CUOL0a+UegdDJJS99tcR
 1QmoE4V0/6jWslb0qdA4Hn0PMftILf1T7rg6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=pt9LL0+CuDm+kdoZO8QVUQbhMgcl5obcxGIsILddiNI=;
 b=fyTM+SIkYKFMkI1Ivsi4Y+4g/+vNA4eFsocH/Kltwe4ZdJnhsvkHHjHlYraUcro+Ap
 /g1RKP+cjfRxFG8TzGP2L+o9Mnl3+sd+SszqHFTRwJXA3msTkJnT4z+vqE5TVlXgp1F6
 oFFEPAVpU+NQO8wAxlg3If8rXkNCj6GFxm3F8GU3LTxKKefthi3MGbzZ2WJsPS23YCaR
 OdABwqLG2lJbWQvOZCZl3WEttj7768nWL69Jd+mM2vHEoA/I0Tnw+pr7fnbDIyoRfpcl
 lRofPdrhXytVhzJtoIPisOFEjPnR1jZsGwySRyEoyMm8dD+zSXRyBUBywRjJQwvtHorQ
 syYw==
X-Gm-Message-State: AOAM531RA80o710N0czP89npq8StTYDkN9BebFyO6GLplJ/y2n6J+dx9
 1npti2jPtgDWg4bmxDYG9V6wN96Yj5kCXA==
X-Google-Smtp-Source: ABdhPJy60MiCzS26siZjbWIAx4MDQVgb7vOKb6uiXB4Ce87EFFEx9z+DjmAN9pkVppwvnVbK/nrSBQ==
X-Received: by 2002:a05:600c:896:: with SMTP id
 l22mr10257596wmp.164.1621412654302; 
 Wed, 19 May 2021 01:24:14 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id v18sm29602687wro.18.2021.05.19.01.24.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 01:24:13 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/ttm: Explain why ttm_bo_add_move_fence uses a shared slot
Date: Wed, 19 May 2021 10:24:09 +0200
Message-Id: <20210519082409.672016-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.31.0
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Huang Rui <ray.huang@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Christian Koenig <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Motivated because I got confused and Christian confirmed why this
works. I think this is non-obvious enough that it merits a slightly
longer comment.

Cc: Christian König <ckoenig.leichtzumerken@gmail.com>
Cc: Christian Koenig <christian.koenig@amd.com>
Cc: Huang Rui <ray.huang@amd.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/ttm/ttm_bo.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
index ca1b098b6a56..51a94fd63bd7 100644
--- a/drivers/gpu/drm/ttm/ttm_bo.c
+++ b/drivers/gpu/drm/ttm/ttm_bo.c
@@ -682,7 +682,9 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
 }
 
 /*
- * Add the last move fence to the BO and reserve a new shared slot.
+ * Add the last move fence to the BO and reserve a new shared slot. We only use
+ * a shared slot to avoid unecessary sync and rely on the subsequent bo move to
+ * either stall or use an exclusive fence respectively set bo->moving.
  */
 static int ttm_bo_add_move_fence(struct ttm_buffer_object *bo,
 				 struct ttm_resource_manager *man,
-- 
2.31.0

