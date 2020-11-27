Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F36A42C697A
	for <lists+dri-devel@lfdr.de>; Fri, 27 Nov 2020 17:35:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 066466EE55;
	Fri, 27 Nov 2020 16:35:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4F436EE48
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 16:35:35 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 3so3328132wmg.4
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Nov 2020 08:35:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wbQDpsnNx6iEwLidL6DLURUpC2nhApCFYPCzt297AgQ=;
 b=hFlyhkgv/UKsp4jlIgNmlznoycZBXcZxFaAqGtjanshomvy+4uEKcgesEDVLcrT8vk
 QA7Ys8FVro7udTMJFSQ7y8MrprQ/5J2RNE9soMnSMnBeDQ8JhNieIvbYxZ6uLyP7wkiL
 QGUMXd7RqYb/1c3Pj9OB00M9h8AQQpPxxTgjg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wbQDpsnNx6iEwLidL6DLURUpC2nhApCFYPCzt297AgQ=;
 b=fb+vkR6AZwbSAvmKGkDQOJy6mINrO8yDaWFen1iG6IUrbbUqWfhaUfG+pXRUdtizJo
 cv9jOr5iZIOxxRW9Fa7d3QyuY4ZL4Ch8caelWxZO+ZL17EtI/X0FoIhzh4aNsuGKnW/n
 bUvNqGKY+SLHOA9UDZPyfs1/+UW1wHh845OPwwB7aL2KvdIsOLH4jGUQOgYHudcW3XzF
 PlggMB4vneV7sy3XmNEX4VP1R6EGQsQDisdUxq5D9TMWpH1Q7AjZrmWIqDEK5TvvUEdp
 ynI6YVdxdRtDiY8c6ipRWnPByZ+1ZgcC/5uIG+5rqPxtOxjDsnyVtYty3I62Xoe0DlQw
 hRKg==
X-Gm-Message-State: AOAM530VtVPERn+HKK0eUHTRtWcs7GyeX6Itj4EWaE1ipz5Zu6o8bZof
 UdzPvC67xoZzuTZKJBZr2+zO53DGvN0TpQ==
X-Google-Smtp-Source: ABdhPJzuLNM9EYTuTTLHSlGr2ozd09/eD3swjm8ptEHwhzLx5xhiHGzaF/RRUMAGf05+lO76W32ZhA==
X-Received: by 2002:a05:600c:2110:: with SMTP id
 u16mr10268028wml.4.1606494934178; 
 Fri, 27 Nov 2020 08:35:34 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q81sm14711898wme.34.2020.11.27.08.35.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Nov 2020 08:35:33 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH RESEND] drm/nouveau: Drop mutex_lock_nested for atomic
Date: Fri, 27 Nov 2020 17:35:28 +0100
Message-Id: <20201127163528.2221671-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
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
Cc: Maarten Lankhorst <m.b.lankhorst@gmail.com>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, Ben Skeggs <bskeggs@redhat.com>,
 nouveau@lists.freedesktop.org, Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Purely conjecture, but I think the original locking inversion with the
legacy page flip code between flipping and ttm's bo move function
shoudn't exist anymore with atomic: With atomic the bo pinning and
actual modeset commit is completely separated in the code patsh.

This annotation was originally added in

commit 060810d7abaabcab282e062c595871d661561400
Author: Ben Skeggs <bskeggs@redhat.com>
Date:   Mon Jul 8 14:15:51 2013 +1000

    drm/nouveau: fix locking issues in page flipping paths

due to

commit b580c9e2b7ba5030a795aa2fb73b796523d65a78
Author: Maarten Lankhorst <m.b.lankhorst@gmail.com>
Date:   Thu Jun 27 13:48:18 2013 +0200

    drm/nouveau: make flipping lockdep safe

Acked-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Maarten Lankhorst <m.b.lankhorst@gmail.com>
Cc: Ben Skeggs <bskeggs@redhat.com>
Cc: Dave Airlie <airlied@gmail.com>
Cc: nouveau@lists.freedesktop.org
---
 drivers/gpu/drm/nouveau/nouveau_bo.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 1386b0fc1640..43069dd8b027 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -774,7 +774,10 @@ nouveau_bo_move_m2mf(struct ttm_buffer_object *bo, int evict,
 			return ret;
 	}
 
-	mutex_lock_nested(&cli->mutex, SINGLE_DEPTH_NESTING);
+	if (drm_drv_uses_atomic_modeset(drm->dev))
+		mutex_lock(&cli->mutex);
+	else
+		mutex_lock_nested(&cli->mutex, SINGLE_DEPTH_NESTING);
 	ret = nouveau_fence_sync(nouveau_bo(bo), chan, true, ctx->interruptible);
 	if (ret == 0) {
 		ret = drm->ttm.move(chan, bo, &bo->mem, new_reg);
-- 
2.29.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
