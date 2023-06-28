Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DD3874093D
	for <lists+dri-devel@lfdr.de>; Wed, 28 Jun 2023 07:22:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9121110E355;
	Wed, 28 Jun 2023 05:21:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB48B10E352
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Jun 2023 05:21:52 +0000 (UTC)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id 92AFF324F84;
 Wed, 28 Jun 2023 06:21:50 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1687929711; bh=N5cwHdI6M95RDVh89UJsg+VEuuNlJteezYnhe7c8m+0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GV6XTEd7ez6HxlLwablT1Q3eElFkBfnESc1wtMlzitxXeYZ410ZLrVV3a1pFQ1XCC
 FFAR2EONUAEILwgkYbW9ht/7IrARNkMQ/ROP1iPluIBgXyJYOE6U0F7+HArH6SzYk/
 OI2SEFCRJSWF07WrfPlviBxrQiogdklVcDv7BN+6UjqvqnAAa6l4Hn3mDLBkJfuUow
 UClw7FBg+KlaX0VBawyc5YXF0yJNQBK1ymCarzoApJUA0xfkYcljt1SmKEibH9S8Z3
 crFRF+wOtYNzSdV+3DIdCam/C4M7Qlk+A/SSzpOftOnmByVvhc4ANCPXJlgqojG7aH
 xu6R8wGQUqnJw==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 5/8] drm/vboxvideo: Use the hotspot properties from cursor
 planes
Date: Wed, 28 Jun 2023 01:21:30 -0400
Message-Id: <20230628052133.553154-6-zack@kde.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230628052133.553154-1-zack@kde.org>
References: <20230628052133.553154-1-zack@kde.org>
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
 javierm@redhat.com, banackm@vmware.com, krastevm@vmware.com,
 ppaalanen@gmail.com, iforbes@vmware.com, mombasawalam@vmware.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

Atomic modesetting got support for mouse hotspots via the hotspot
properties. Port the legacy kms hotspot handling to the new properties
on cursor planes.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/vboxvideo/vbox_mode.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
index 341edd982cb3..9ff3bade9795 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_mode.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_mode.c
@@ -429,8 +429,8 @@ static void vbox_cursor_atomic_update(struct drm_plane *plane,
 	flags = VBOX_MOUSE_POINTER_VISIBLE | VBOX_MOUSE_POINTER_SHAPE |
 		VBOX_MOUSE_POINTER_ALPHA;
 	hgsmi_update_pointer_shape(vbox->guest_pool, flags,
-				   min_t(u32, max(fb->hot_x, 0), width),
-				   min_t(u32, max(fb->hot_y, 0), height),
+				   min_t(u32, max(new_state->hotspot_x, 0), width),
+				   min_t(u32, max(new_state->hotspot_y, 0), height),
 				   width, height, vbox->cursor_data, data_size);
 
 	mutex_unlock(&vbox->hw_mutex);
-- 
2.39.2

