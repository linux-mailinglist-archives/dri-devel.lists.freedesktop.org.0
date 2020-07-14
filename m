Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0640721E58C
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 04:18:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90D6D6E516;
	Tue, 14 Jul 2020 02:17:55 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8359B6E516
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Jul 2020 02:17:54 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id q5so19374507wru.6
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jul 2020 19:17:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=yIvsoqIpU7YuxmuFEhotjfR8B82cxw6wItzsKtbJuqM=;
 b=SW6yBePs7xOC7cXsFyAdunMnAKXHnXUNwR/t5Y+otvk1j1CuS8G/hIGv+zKVtE/CNM
 N4CNi0Lp51J60V+5JLzv15NydvTDuwQItk/3fgi5Fe+iiETzkamURDYLY6Fm0rvWz7ET
 LDor2WeRgYsfFhRCN4dyF6KiYjUE9BNr9Wo1HZ1mSLZ5XmxNPMBdWurU14yNTOS3NvRa
 im/TYqUDwAalrAccMs/lJHTr+LElBt0PmMvyxVIGeIDWtq2fBx4M0Rn5EgCcddZGaG5P
 JJGQThUKKcZtXJn434XNtnJZlE0QEzOv5S80PUCdblT0V0/cJ0CjPCzurIOhmoEsHA+6
 DsBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=yIvsoqIpU7YuxmuFEhotjfR8B82cxw6wItzsKtbJuqM=;
 b=sjqqL6ySjTAOLqfp4vMEm97yRH9CXyr+7IVLXgGhAjJRGd826AzMLFADjIc9RItzCE
 gjHw0PZX6/gOTpFc77Y/Qc1EC7SBqZTg1zqbjMhmambI6xVfx6kU65r7I6KfB++RSYUa
 iaAWaLDWBEbMknAPKul5iv58k8Y3FxXDZz22eJtRCFJNZu8pz8JQSX/o5sfcy6E6XyTQ
 Ahkrobecnp3+jbvX31XxRVfv/VDdFm+L7eA1k45MWMn1YEO0rmap0hu2t7DYFOVkHdnh
 Qgs3gfdjxFQm7w3iVRABqVXgE9g6TmaAc5imsOfr2TmO8xA2w6NY1naMewJ1fUh7qj/N
 54Ww==
X-Gm-Message-State: AOAM533Otz07mgZiS/hSdIEcvguCKs4kA/Y4tP54JG2Asj+Hxwa/Hxju
 F+26s5qB1rAlz9QXWYFfY+1w9IzV
X-Google-Smtp-Source: ABdhPJzsEDTbjlrUS5ovEXyY5WohVHmpV0Walb/bXxD/VYxToimEHBcU+aeaNhnZcngpOMWWKBnA9A==
X-Received: by 2002:a5d:4002:: with SMTP id n2mr2519709wrp.255.1594693072972; 
 Mon, 13 Jul 2020 19:17:52 -0700 (PDT)
Received: from sroland-t5810.vmware.com (46-126-183-173.dynamic.hispeed.ch.
 [46.126.183.173])
 by smtp.gmail.com with ESMTPSA id z63sm2255072wmb.2.2020.07.13.19.17.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jul 2020 19:17:52 -0700 (PDT)
From: "Roland Scheidegger (VMware)" <rscheidegger.oss@gmail.com>
To: dri-devel@lists.freedesktop.org,
	airlied@redhat.com,
	daniel@ffwll.ch
Subject: [PATCH] drm/vmwgfx: fix update of display surface when resolution
 changes
Date: Tue, 14 Jul 2020 04:17:47 +0200
Message-Id: <20200714021747.11151-1-rscheidegger.oss@gmail.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Roland Scheidegger <sroland@vmware.com>,
 linux-graphics-maintainer@vmware.com, stable@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Roland Scheidegger <sroland@vmware.com>

The assignment of metadata overwrote the new display resolution values,
hence we'd miss the size actually changed and wouldn't redefine the
surface. This would then lead to command buffer error when trying to
update the screen target (due to the size mismatch), and result in a
VM with black screen.

Fixes: 504901dbb0b5 ("drm/vmwgfx: Refactor surface_define to use vmw_surface_metadata")
Reviewed-by: Charmaine Lee <charmainel@vmware.com>
Signed-off-by: Roland Scheidegger <sroland@vmware.com>
Cc: stable@vger.kernel.org
---
 drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
index 9ffa9c75a5da..16b385629688 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
@@ -1069,10 +1069,6 @@ vmw_stdu_primary_plane_prepare_fb(struct drm_plane *plane,
 	if (new_content_type != SAME_AS_DISPLAY) {
 		struct vmw_surface_metadata metadata = {0};
 
-		metadata.base_size.width = hdisplay;
-		metadata.base_size.height = vdisplay;
-		metadata.base_size.depth = 1;
-
 		/*
 		 * If content buffer is a buffer object, then we have to
 		 * construct surface info
@@ -1104,6 +1100,10 @@ vmw_stdu_primary_plane_prepare_fb(struct drm_plane *plane,
 			metadata = new_vfbs->surface->metadata;
 		}
 
+		metadata.base_size.width = hdisplay;
+		metadata.base_size.height = vdisplay;
+		metadata.base_size.depth = 1;
+
 		if (vps->surf) {
 			struct drm_vmw_size cur_base_size =
 				vps->surf->metadata.base_size;
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
