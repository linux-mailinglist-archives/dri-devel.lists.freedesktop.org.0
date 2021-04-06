Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81C74355C31
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 21:33:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 566BD890B1;
	Tue,  6 Apr 2021 19:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C57916E88B
 for <dri-devel@lists.freedesktop.org>; Tue,  6 Apr 2021 19:21:42 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2804:431:e7dc:9ef6:7b41:f88b:5bc5:8ea5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: leandrohrb)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 856061F44BA6;
 Tue,  6 Apr 2021 20:21:39 +0100 (BST)
From: Leandro Ribeiro <leandro.ribeiro@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/doc: emphasize difference between plane formats and
 IN_FORMATS blob
Date: Tue,  6 Apr 2021 16:21:18 -0300
Message-Id: <20210406192118.12313-3-leandro.ribeiro@collabora.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210406192118.12313-1-leandro.ribeiro@collabora.com>
References: <20210406192118.12313-1-leandro.ribeiro@collabora.com>
MIME-Version: 1.0
X-Mailman-Approved-At: Tue, 06 Apr 2021 19:33:23 +0000
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
Cc: airlied@linux.ie, pekka.paalanen@collabora.co.uk, kernel@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Emphasize how userspace should use the plane format list
(format_type_ptr) and the IN_FORMATS blob property.

Formats exposed in the plane format list (format_type_ptr) do not
require modifiers, and formats that are present in the IN_FORMATS blob
property support modifiers.

Note that these are not disjoint sets. If a format supports modifiers
but the driver can also handle it without a modifier, it should be
present in both the IN_FORMATS blob property and the plane format list.

Signed-off-by: Leandro Ribeiro <leandro.ribeiro@collabora.com>
---
 drivers/gpu/drm/drm_plane.c | 4 ++++
 include/uapi/drm/drm_mode.h | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 0dd43882fe7c..b48d9bd81a59 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -128,6 +128,10 @@
  *     pairs supported by this plane. The blob is a struct
  *     drm_format_modifier_blob. Without this property the plane doesn't
  *     support buffers with modifiers. Userspace cannot change this property.
+ *
+ *     To find out the list of buffer formats which are supported without a
+ *     modifier, userspace should not look at this blob property, but at the
+ *     formats list of the plane: &drm_mode_get_plane.format_type_ptr.
  */
 
 static unsigned int drm_num_planes(struct drm_device *dev)
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 96fc9a6da608..4293800ec095 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -340,6 +340,9 @@ struct drm_mode_get_plane {
 	/**
 	 * @format_type_ptr: Pointer to ``__u32`` array of formats that are
 	 * supported by the plane. These formats do not require modifiers.
+	 *
+	 * To find out the list of formats that support modifiers, userspace
+	 * must use the plane IN_FORMATS blob property.
 	 */
 	__u64 format_type_ptr;
 };
-- 
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
