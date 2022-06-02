Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A978E53BBBF
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jun 2022 17:43:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCDAC112FF8;
	Thu,  2 Jun 2022 15:43:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFF59112FEE
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jun 2022 15:43:00 +0000 (UTC)
Received: from vertex.vmware.com (pool-108-36-85-85.phlapa.fios.verizon.net
 [108.36.85.85]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id F162A335FFD;
 Thu,  2 Jun 2022 16:42:58 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1654184579; bh=6Spq6A9vTFFpAGEl1r7KhZu71nqVqrnjZ1RnnEFGgd4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Lca3oDYWKLtU6F6Vx53geZ6kdDpEJ8zvvQe9SWvKrBAq3a5gK12QQ28nSQ/waSET7
 YtvbvuTQ0IMAc6sV/vSXviGir3yU5RaK3tTS6mzTrGBloFBxX9oI7jZvDFrVlO8nZ8
 rtQp20sTm9z4NlfNIXsQxV9x0aQNOHMeuJPjYHbYQcTUPc3r+ZGvrcWi2hwaoIr5K2
 Did1BQ6YwfuyVFn26UBh3RvCOV/P2bg1XUSKUaHdz7Hk5XQ+y1DZ5mnnSGImzm3bqv
 UioV2pu6i1xR9ErqiGC5Ljo0YyS17Zt3uGncUj1Z3STE4HyfnzyHsWN7wSRdLJGDwA
 gepyioMePHPQw==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 4/6] drm/vboxvideo: Create mouse hotspot properties on cursor
 planes
Date: Thu,  2 Jun 2022 11:42:41 -0400
Message-Id: <20220602154243.1015688-5-zack@kde.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602154243.1015688-1-zack@kde.org>
References: <20220602154243.1015688-1-zack@kde.org>
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
Cc: Hans de Goede <hdegoede@redhat.com>, David Airlie <airlied@linux.ie>,
 krastevm@vmware.com, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

Atomic modesetting got support for mouse hotspots via the hotspot
properties. Drivers need to create those properties on cursor planes
which require the mouse hotspot coordinates.

Add the code creating hotspot properties and port away from old legacy
hotspot API. The legacy hotspot paths have an implementation that works
with new atomic properties so there's no reason to keep them and it
makes sense to unify both paths.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 drivers/gpu/drm/vboxvideo/vbox_mode.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
index 4017b0a621fc..4c0a01a18f5a 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
@@ -427,8 +427,8 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
 	flags = VBOX_MOUSE_POINTER_VISIBLE | VBOX_MOUSE_POINTER_SHAPE |
 		VBOX_MOUSE_POINTER_ALPHA;
 	hgsmi_update_pointer_shape(vbox->guest_pool, flags,
-				   min_t(u32, max(fb->hot_x, 0), width),
-				   min_t(u32, max(fb->hot_y, 0), height),
+				   min_t(u32, max(new_state->hotspot_x, 0), width),
+				   min_t(u32, max(new_state->hotspot_y, 0), height),
 				   width, height, vbox->cursor_data, data_size);
 
 	mutex_unlock(&vbox->hw_mutex);
@@ -575,6 +575,7 @@ static struct vbox_crtc *vbox_crtc_init(struct drm_device *dev, unsigned int i)
 			ret = PTR_ERR(cursor);
 			goto clean_primary;
 		}
+		drm_plane_create_hotspot_properties(cursor);
 	} else {
 		DRM_WARN("VirtualBox host is too old, no cursor support\n");
 	}
-- 
2.34.1

