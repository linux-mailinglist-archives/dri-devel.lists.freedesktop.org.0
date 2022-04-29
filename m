Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5417514AED
	for <lists+dri-devel@lfdr.de>; Fri, 29 Apr 2022 15:42:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE51110EC3B;
	Fri, 29 Apr 2022 13:42:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 362B210E887
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 13:42:37 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id k2so10859239wrd.5
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Apr 2022 06:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+0RT6wkMwjHddK5IvHEpRi9BBKSKu9G1PdCalYT+pBI=;
 b=BldXf8IcqKrXADPsoQqlGMMFC3sG+u2Xv8G8//5oRRFCHoHSOXEaeZIazhRO5q5BUC
 amuXGaPGXmlznHhoLBCssZNqfhPyK0ry8iG6BrtaQFuaLmbEZ/MgywF/pAVrOSUHX/UQ
 Wqy6dfNLosCWZnenxIScVppt6btO/HW8UcPZRNSrVJ7Hi+0JJD76WAFNfuXx5Hmk54yH
 2InJbm6+Wp/bGeJQcLspO8g4u6Vj4vBH2038Y8bt5VbRS3XGNvvqjeVhjxzpXdljrnZC
 j3wsIM889sBOYbxSoj/EnVZDznQ4GxyKzfkh0ug3pnbRl7tfYaSkV5jGOgAfAbc5NKrt
 hz1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+0RT6wkMwjHddK5IvHEpRi9BBKSKu9G1PdCalYT+pBI=;
 b=lzlN9rkn8I6qNNBeTpYrtAz507fCEeQnLvrmQS8RQP9Gwp9f9QbQ7nAarppeSnLrkD
 qabluiiXsrdxvZ14XzYfgIK7THW4Pp2rExtjNg+xx1ZbiiHzMFfDUk8QQWtkwcR7cJM/
 npnnUfOMKmP+gZ46mr9pXSYgUXqXm+IyIYRKl/xcgTExW3AIymLoiB/AtTBVqBH4Xk8I
 eS+lOwruYqE5VZTvYHGNBmvih4e2kvInUBwKPRhmyHNPyUUjPm42HmERyYHq8yEzUPQv
 vrNHmoLqGzV2y9G7KJD8t98g+CKTWF9Cve/Uc9oVnLBeJathh9RwSUHmF34cx36e1gOJ
 0i7Q==
X-Gm-Message-State: AOAM5310dDGKgSYkd4CGUjisd48WK6mIkSgyCPcK/5yzRV+07qVWjNfV
 D82XvpODlnRgS5budrsKmCo=
X-Google-Smtp-Source: ABdhPJypa2lUBF3qjxgPDH/DlljKKnKMy4Scpo6bEJgMdKbZ8PzxYtyk596rTwAMQNWfb0PMWh2IXQ==
X-Received: by 2002:a5d:6481:0:b0:20c:40dd:59f5 with SMTP id
 o1-20020a5d6481000000b0020c40dd59f5mr5200278wri.230.1651239755829; 
 Fri, 29 Apr 2022 06:42:35 -0700 (PDT)
Received: from able.fritz.box (p57b0b9e1.dip0.t-ipconnect.de. [87.176.185.225])
 by smtp.gmail.com with ESMTPSA id
 u19-20020a05600c19d300b00393f081d49fsm7301227wmq.2.2022.04.29.06.42.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Apr 2022 06:42:35 -0700 (PDT)
From: "=?UTF-8?q?Christian=20K=C3=B6nig?=" <ckoenig.leichtzumerken@gmail.com>
X-Google-Original-From: =?UTF-8?q?Christian=20K=C3=B6nig?=
 <christian.koenig@amd.com>
To: daniel.vetter@ffwll.ch,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 3/4] drm/nouveau: use drm_gem_plane_helper_prepare_fb
Date: Fri, 29 Apr 2022 15:42:29 +0200
Message-Id: <20220429134230.24334-3-christian.koenig@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220429134230.24334-1-christian.koenig@amd.com>
References: <20220429134230.24334-1-christian.koenig@amd.com>
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
Cc: Maxime Ripard <maxime@cerno.tech>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Karol Herbst <kherbst@redhat.com>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of manually adjusting the plane state.

Signed-off-by: Christian König <christian.koenig@amd.com>
Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Maxime Ripard <maxime@cerno.tech>
---
 drivers/gpu/drm/nouveau/dispnv50/wndw.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index 8642b84ea20c..bb8a4601e0d9 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -32,6 +32,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_gem_atomic_helper.h>
 #include <drm/drm_fourcc.h>
 
 #include "nouveau_bo.h"
@@ -558,9 +559,7 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 			asyw->image.handle[0] = ctxdma->object.handle;
 	}
 
-	ret = dma_resv_get_singleton(nvbo->bo.base.resv,
-				     DMA_RESV_USAGE_WRITE,
-				     &asyw->state.fence);
+	ret = drm_gem_plane_helper_prepare_fb(plane, state);
 	if (ret)
 		return ret;
 
-- 
2.25.1

