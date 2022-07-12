Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E0C5710E3
	for <lists+dri-devel@lfdr.de>; Tue, 12 Jul 2022 05:33:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDB1610F5D7;
	Tue, 12 Jul 2022 03:33:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from letterbox.kde.org (letterbox.kde.org [46.43.1.242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9AB610F573
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Jul 2022 03:33:07 +0000 (UTC)
Received: from vertex.vmware.com (pool-173-49-113-140.phlapa.fios.verizon.net
 [173.49.113.140]) (Authenticated sender: zack)
 by letterbox.kde.org (Postfix) with ESMTPSA id B75F5321FE7;
 Tue, 12 Jul 2022 04:33:05 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kde.org; s=users;
 t=1657596786; bh=IqanmTkB+pSccxXf+sNG7q67HtCj2Ye0f/XGzgW8BTM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Ty3xPLSGuft+44UnWWt7tvgNvy23biJ45Z8lWjgxPpToz88QCb7VflLJk+c4QKfLR
 PEstNqNaD5F4smUewRlcO6+mkzw8XhuqPjDWEC6id9Qv9MsFGKk9ryr9Wv5N3nMkgX
 PxdtDqpHQ7a3varLweah5nuhie780zE31fYEJ/sZBzTigCzTsdlhsdM3yQqaOrDL97
 s2ELtZpNH1W6YOsy1309Vfu7Oa0Dm5gMFwDT1SaWj8dSuEwIAGoGOlMnVYZrsz1MwK
 jhtHxNF3vpWfkVrDQaDyDEnvX3WrSz/RouWQn2E8QTvB+n0J6ARdiFoWUIkq7RXTkB
 STdSwazZpinXA==
From: Zack Rusin <zack@kde.org>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 5/8] drm/vboxvideo: Use the hotspot properties from cursor
 planes
Date: Mon, 11 Jul 2022 23:32:43 -0400
Message-Id: <20220712033246.1148476-6-zack@kde.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220712033246.1148476-1-zack@kde.org>
References: <20220712033246.1148476-1-zack@kde.org>
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
 krastevm@vmware.com, ppaalanen@gmail.com, mombasawalam@vmware.com
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
---
 drivers/gpu/drm/vboxvideo/vbox_mode.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vboxvideo/vbox_mode.c b/drivers/gpu/drm/vboxvideo/vbox_mode.c
index fa0d73ce07bc..ca3134adb104 100644
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
2.34.1

