Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 088847D2BAF
	for <lists+dri-devel@lfdr.de>; Mon, 23 Oct 2023 09:47:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E32CF10E164;
	Mon, 23 Oct 2023 07:46:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB73310E163
 for <dri-devel@lists.freedesktop.org>; Mon, 23 Oct 2023 07:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698047215;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=UMT8ba+r9A0Dp8O1xMjPSLzWa5y2hkT59m9kkQX4WYk=;
 b=YjYwAFYlH4vDZQYjPRweM7/IYy5kWEIWKA3Ulsnz/vEAn7zLWWZG0mcqwD+wZIxSzL99FU
 YtULfx9W0ehWfepPXf7sq/YpjqQjNBdFj3qfcz1fRxBYCIWShTePJOrstvPiw7V5siG3CZ
 brelsFq8Z2k9Dnj1edcH9b6xGyIsZZw=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-222-igkbjBZZMaO3OTy9IkNl7w-1; Mon, 23 Oct 2023 03:46:42 -0400
X-MC-Unique: igkbjBZZMaO3OTy9IkNl7w-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com
 [10.11.54.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E55FE299E759;
 Mon, 23 Oct 2023 07:46:40 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.45.225.243])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4C936503B;
 Mon, 23 Oct 2023 07:46:36 +0000 (UTC)
From: Albert Esteve <aesteve@redhat.com>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 4/9] drm/qxl: Use the hotspot properties from cursor planes
Date: Mon, 23 Oct 2023 09:46:08 +0200
Message-ID: <20231023074613.41327-5-aesteve@redhat.com>
In-Reply-To: <20231023074613.41327-1-aesteve@redhat.com>
References: <20231023074613.41327-1-aesteve@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.5
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
Cc: linux-doc@vger.kernel.org, banackm@vmware.com,
 virtualization@lists.linux-foundation.org, Gerd Hoffmann <kraxel@redhat.com>,
 mombasawalam@vmware.com, iforbes@vmware.com, Jonathan Corbet <corbet@lwn.net>,
 javierm@redhat.com,
 VMware Graphics Reviewers <linux-graphics-maintainer@vmware.com>,
 David Airlie <airlied@redhat.com>, Maxime Ripard <mripard@kernel.org>,
 Hans de Goede <hdegoede@redhat.com>, ppaalanen@gmail.com,
 dri-devel@lists.freedesktop.org, spice-devel@lists.freedesktop.org,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Matt Roper <matthew.d.roper@intel.com>, linux-kernel@vger.kernel.org,
 krastevm@vmware.com, Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Zack Rusin <zackr@vmware.com>

Atomic modesetting got support for mouse hotspots via the hotspot
properties. Port the legacy kms hotspot handling to the new properties
on cursor planes.

Signed-off-by: Zack Rusin <zackr@vmware.com>
Reviewed-by: Gerd Hoffmann <kraxel@redhat.com>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: virtualization@lists.linux-foundation.org
Cc: spice-devel@lists.freedesktop.org
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
---
 drivers/gpu/drm/qxl/qxl_display.c | 14 ++++++--------
 1 file changed, 6 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/qxl/qxl_display.c b/drivers/gpu/drm/qxl/qxl_display.c
index 6492a70e3c396..5d689e0d3586c 100644
--- a/drivers/gpu/drm/qxl/qxl_display.c
+++ b/drivers/gpu/drm/qxl/qxl_display.c
@@ -485,7 +485,6 @@ static int qxl_primary_atomic_check(struct drm_plane *plane,
 static int qxl_primary_apply_cursor(struct qxl_device *qdev,
 				    struct drm_plane_state *plane_state)
 {
-	struct drm_framebuffer *fb = plane_state->fb;
 	struct qxl_crtc *qcrtc = to_qxl_crtc(plane_state->crtc);
 	struct qxl_cursor_cmd *cmd;
 	struct qxl_release *release;
@@ -510,8 +509,8 @@ static int qxl_primary_apply_cursor(struct qxl_device *qdev,
 
 	cmd = (struct qxl_cursor_cmd *)qxl_release_map(qdev, release);
 	cmd->type = QXL_CURSOR_SET;
-	cmd->u.set.position.x = plane_state->crtc_x + fb->hot_x;
-	cmd->u.set.position.y = plane_state->crtc_y + fb->hot_y;
+	cmd->u.set.position.x = plane_state->crtc_x + plane_state->hotspot_x;
+	cmd->u.set.position.y = plane_state->crtc_y + plane_state->hotspot_y;
 
 	cmd->u.set.shape = qxl_bo_physical_address(qdev, qcrtc->cursor_bo, 0);
 
@@ -531,7 +530,6 @@ static int qxl_primary_apply_cursor(struct qxl_device *qdev,
 static int qxl_primary_move_cursor(struct qxl_device *qdev,
 				   struct drm_plane_state *plane_state)
 {
-	struct drm_framebuffer *fb = plane_state->fb;
 	struct qxl_crtc *qcrtc = to_qxl_crtc(plane_state->crtc);
 	struct qxl_cursor_cmd *cmd;
 	struct qxl_release *release;
@@ -554,8 +552,8 @@ static int qxl_primary_move_cursor(struct qxl_device *qdev,
 
 	cmd = (struct qxl_cursor_cmd *)qxl_release_map(qdev, release);
 	cmd->type = QXL_CURSOR_MOVE;
-	cmd->u.position.x = plane_state->crtc_x + fb->hot_x;
-	cmd->u.position.y = plane_state->crtc_y + fb->hot_y;
+	cmd->u.position.x = plane_state->crtc_x + plane_state->hotspot_x;
+	cmd->u.position.y = plane_state->crtc_y + plane_state->hotspot_y;
 	qxl_release_unmap(qdev, release, &cmd->release_info);
 
 	qxl_release_fence_buffer_objects(release);
@@ -851,8 +849,8 @@ static int qxl_plane_prepare_fb(struct drm_plane *plane,
 		struct qxl_bo *old_cursor_bo = qcrtc->cursor_bo;
 
 		qcrtc->cursor_bo = qxl_create_cursor(qdev, user_bo,
-						     new_state->fb->hot_x,
-						     new_state->fb->hot_y);
+						     new_state->hotspot_x,
+						     new_state->hotspot_y);
 		qxl_free_cursor(old_cursor_bo);
 	}
 
-- 
2.41.0

