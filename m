Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B11F73F313
	for <lists+dri-devel@lfdr.de>; Tue, 27 Jun 2023 05:59:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C247410E286;
	Tue, 27 Jun 2023 03:58:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6790810E281
 for <dri-devel@lists.freedesktop.org>; Tue, 27 Jun 2023 03:58:49 +0000 (UTC)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 28FE0324915;
 Tue, 27 Jun 2023 04:58:47 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1687838328; bh=2HdPkbfOqrJvIN0C+ct/4CqjZTYBN5DFxqzA9wRr8JU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RRQZYXOF/EOM4u0/aR+kYWUJFJASdjLkDwLOu/TCXOhTw0G54ElKENlLu7ikC8jbd
 OYsWXMOhQWrG4Cg5OT9g2RUz3G1Y5dqTpE/dSfpeSilrb0snpcWkb5iRb+CHK5ouLZ
 z/MwtfhNqSSkrwwYKoDkmsKsqNj7F6NK5izJkhp6i+jGptmwvJ+v+M2AQiGP4tPK+u
 fZnz6Tj4Zws3JqTaf5B5PSkte1lEBHFibeiCvr1ruEx1tTzfCuPeAJsDrF+VjvoPsF
 O6+iTgJnHIstxt4Ok7wM//K0tFxWrl8PNJuxk8Zkc9YJrYOgjeURLdjtNMIjj+Ersm
 1FkDFUsAlJtwQ==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 3/8] drm/vmwgfx: Use the hotspot properties from cursor
 planes
Date: Mon, 26 Jun 2023 23:58:34 -0400
Message-Id: <20230627035839.496399-4-zack@kde.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230627035839.496399-1-zack@kde.org>
References: <20230627035839.496399-1-zack@kde.org>
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
Cc: javierm@redhat.com, banackm@vmware.com, krastevm@vmware.com,
 ppaalanen@gmail.com, iforbes@vmware.com, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

Atomic modesetting got support for mouse hotspots via the hotspot
properties. Port the legacy kms hotspot handling to the new properties
on cursor planes.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Cc: Martin Krastev <krastevm@vmware.com>
Cc: Maaz Mombasawala <mombasawalam@vmware.com>
---
 drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
index b62207be3363..de294dfe05d0 100644
--- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
+++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
@@ -768,13 +768,8 @@ vmw_du_cursor_plane_atomic_update(struct drm_plane *plane,
 	struct vmw_plane_state *old_vps = vmw_plane_state_to_vps(old_state);
 	s32 hotspot_x, hotspot_y;
 
-	hotspot_x = du->hotspot_x;
-	hotspot_y = du->hotspot_y;
-
-	if (new_state->fb) {
-		hotspot_x += new_state->fb->hot_x;
-		hotspot_y += new_state->fb->hot_y;
-	}
+	hotspot_x = du->hotspot_x + new_state->hotspot_x;
+	hotspot_y = du->hotspot_y + new_state->hotspot_y;
 
 	du->cursor_surface = vps->surf;
 	du->cursor_bo = vps->bo;
-- 
2.39.2

