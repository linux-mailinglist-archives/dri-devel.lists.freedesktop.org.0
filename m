Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB9C64949E5
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jan 2022 09:47:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D89A10E91B;
	Thu, 20 Jan 2022 08:47:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F3C710EEEA
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 10:24:02 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id c24so6558903edy.4
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 02:24:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=nkuGN1Vnj60Rd4SqRXwo3p9yx1/wd6axZJItw3JdV2k=;
 b=QjRCQfkITJNswVCv4WP2utOD+TASiUHrDW4E/0BRSnF2bndoxWm9TG7jcmj/iP//Jb
 oVd1JUi4DlDUDjqrpuBGtr+QnMgOSRewo+UGFuTjxsuRmO0xvC7it630J6+581UJHj0c
 B+km9Wy2X0IQisS1zYMi19G0R6OgKtLBcXeHevadPO+fdhPpsmG1vr97G6PSzPewN10W
 o800vy+MSF1xeb2CrXlTkwWByGu+cn3mrn0vu0TWG84KO2/KWJ/kvWhudeihpiRo+H/u
 BZlRWMln1cqce3hISefkAA1owntSY+M/KxMg01OFdqub83UzFjNyRlBZUE5eRtHNlVRw
 fjsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=nkuGN1Vnj60Rd4SqRXwo3p9yx1/wd6axZJItw3JdV2k=;
 b=L1ti38qUeFNJ4RK4CATrsqkC16PiX84b/5chvaLJO8vDqufuXiVDZgZuRqOy2tFdXH
 r1QCJObxKh23gUeZ7t4oC+9XMQNSm/zly8BRDR+9y4olUkQWa8K4nwucMtPgTg0lAZ8C
 9t0pE0VQnQc+U2mes+1azFzDaEwiCVFcUqBjZBq8KQC4RdZFDyL8n3SBwtkSKaXuy6cK
 g6sYqKPy8U/8e+qUIdPGR3dIhygPZjm59Dd3oEjis9ARxLrhcEBHBxEG/0784VkpCEcb
 MMzzZkD6lqWsgI36zKgjIsc/QnFx56fsDy1iegsgoakZEvSgYlnK1fA1RGrQitA63z2R
 +7Jw==
X-Gm-Message-State: AOAM530w1ISeq6P0K5K2aN44Cmv59imaM2HW4sA0003RFbC11ayDAMFz
 DI5fe1YwNtWrE10mahQ2+84=
X-Google-Smtp-Source: ABdhPJzz7piW2gj8TZNGzs1Q3d9+NIMTM4qEqQxe1jsFAfModjFtnvfuwrnq6rZOqzTvAH4KspNzLA==
X-Received: by 2002:a17:906:950e:: with SMTP id
 u14mr1062606ejx.550.1642587841272; 
 Wed, 19 Jan 2022 02:24:01 -0800 (PST)
Received: from localhost.localdomain ([46.249.74.23])
 by smtp.gmail.com with ESMTPSA id b4sm3456546ejb.131.2022.01.19.02.23.59
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 19 Jan 2022 02:24:00 -0800 (PST)
From: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
To: tomba@kernel.org,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH 3/3] drm: omapdrm: Do no allocate non-scanout GEMs through
 DMM/TILER
Date: Wed, 19 Jan 2022 12:23:11 +0200
Message-Id: <1642587791-13222-4-git-send-email-ivo.g.dimitrov.75@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1642587791-13222-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
References: <1642587791-13222-1-git-send-email-ivo.g.dimitrov.75@gmail.com>
X-Mailman-Approved-At: Thu, 20 Jan 2022 08:47:25 +0000
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
Cc: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>, tony@atomide.com,
 merlijn@wizzup.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-omap@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On devices with DMM, all allocations are done through either DMM or TILER.
DMM/TILER being a limited resource means that such allocations will start
to fail before actual free memory is exhausted. What is even worse is that
with time DMM/TILER space gets fragmented to the point that even if we have
enough free DMM/TILER space and free memory, allocation fails because there
is no big enough free block in DMM/TILER space.

Such failures can be easily observed with OMAP xorg DDX, for example -
starting few GUI applications (so buffers for their windows are allocated)
and then rotating landscape<->portrait while closing and opening new
windows soon results in allocation failures.

Fix that by mapping buffers through DMM/TILER only when really needed,
like, for scanout buffers.

Signed-off-by: Ivaylo Dimitrov <ivo.g.dimitrov.75@gmail.com>
---
 drivers/gpu/drm/omapdrm/omap_gem.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/omapdrm/omap_gem.c b/drivers/gpu/drm/omapdrm/omap_gem.c
index 41c1a6d..cf57179 100644
--- a/drivers/gpu/drm/omapdrm/omap_gem.c
+++ b/drivers/gpu/drm/omapdrm/omap_gem.c
@@ -821,10 +821,12 @@ int omap_gem_pin(struct drm_gem_object *obj, dma_addr_t *dma_addr)
 			if (ret)
 				goto fail;
 
-			if (priv->has_dmm) {
-				ret = omap_gem_pin_tiler(obj);
-				if (ret)
-					goto fail;
+			if (omap_obj->flags & OMAP_BO_SCANOUT) {
+				if (priv->has_dmm) {
+					ret = omap_gem_pin_tiler(obj);
+					if (ret)
+						goto fail;
+				}
 			}
 		} else {
 			refcount_inc(&omap_obj->pin_cnt);
@@ -861,6 +863,8 @@ static void omap_gem_unpin_locked(struct drm_gem_object *obj)
 			kfree(omap_obj->sgt);
 			omap_obj->sgt = NULL;
 		}
+		if (!(omap_obj->flags & OMAP_BO_SCANOUT))
+			return;
 		if (priv->has_dmm) {
 			ret = tiler_unpin(omap_obj->block);
 			if (ret) {
-- 
1.9.1

