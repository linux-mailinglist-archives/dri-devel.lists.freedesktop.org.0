Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D5504DE02D
	for <lists+dri-devel@lfdr.de>; Fri, 18 Mar 2022 18:43:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 751AF10E181;
	Fri, 18 Mar 2022 17:43:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org
 [IPv6:2001:41c9:1:41e::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A567410E181
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Mar 2022 17:43:49 +0000 (UTC)
Received: from vertex.localdomain (pool-108-36-85-85.phlapa.fios.verizon.net
 [108.36.85.85]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 1332228934A;
 Fri, 18 Mar 2022 17:43:47 +0000 (GMT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1647625428; bh=eKRFO0G+Df36yvCa2A5eAoAghVfWlOTfZgXMgMwAa14=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=FJThjqMM6Oj6q6siHVhNR5Z68nDRNYrO6wPUJATX5sDj69MTTAZeBiRaYf/Ykfrhg
 qxQnLVEJmwKqn5S5cKtAGzp2RaKFZvyx6jP+opqLyg/wimjJHMrQBuX9lL/9gad5mi
 2Int2ONKV+aNtA6vRmDbizjdkvWd097kVU+Af2YeCFlkMgc0Y38Aej6f7DCPyPo2Zl
 ONo2o14yXUnc9jIGsvTnM9q8w1nKR7kqIpKX9Av1JRjDkSbIVYiGykoIUoPGebcyPL
 5ZbXXW0W03u5u927IO1MTrPe1FJ6L+I8M5YgNDrXUCO2YtMizOHrcMxzMkaCwysj/3
 bS+7eNZ8jXk/Q==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/5] drm/vmwgfx: Fix mob cursor allocation race
Date: Fri, 18 Mar 2022 13:43:29 -0400
Message-Id: <20220318174332.440068-3-zack@kde.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220318174332.440068-1-zack@kde.org>
References: <20220318174332.440068-1-zack@kde.org>
MIME-Version: 1.0
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
Reply-To: Zack Rusin <zackr@vmware.com>
Cc: krastevm@vmware.com, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

Writes to SVGA_REG_CURSOR_MOBID did not wait for the buffers to be fully
populated. This sometimes results in the device not being aware of
the buffer when the cursor mob register was written.
Properly wait for the buffer to be fully populated before setting it
as a cursor mob.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Fixes: 485d98d472d5 ("drm/vmwgfx: Add support for CursorMob and CursorBypass 4")
Reviewed-by: Martin Krastev <krastevm@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index af252210ef84..7a23f252d212 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -602,6 +602,14 @@ vmw_du_cursor_plane_prepare_fb(struct drm_plane *plane,
 
 			ret = ttm_bo_kmap(cm_bo, 0, PFN_UP(size), &vps->cm_map);
 
+			/*
+			 * We just want to try to get mob bind to finish
+			 * so that the first write to SVGA_REG_CURSOR_MOBID
+			 * is done with a buffer that the device has already
+			 * seen
+			 */
+			(void) ttm_bo_wait(cm_bo, false, false);
+
 			ttm_bo_unreserve(cm_bo);
 
 			if (unlikely(ret != 0)) {
-- 
2.32.0

