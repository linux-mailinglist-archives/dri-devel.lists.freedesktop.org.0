Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D4E36E107
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 23:37:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E47B66EC4C;
	Wed, 28 Apr 2021 21:37:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 258756EC4C
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 21:37:24 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2804:431:e7dd:b215:2a57:79ce:97d1:4a15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: leandrohrb)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 585D01F42BDD;
 Wed, 28 Apr 2021 22:37:21 +0100 (BST)
From: Leandro Ribeiro <leandro.ribeiro@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 2/2] drm/doc: document drm_mode_get_plane
Date: Wed, 28 Apr 2021 18:36:51 -0300
Message-Id: <20210428213651.55467-3-leandro.ribeiro@collabora.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210428213651.55467-1-leandro.ribeiro@collabora.com>
References: <20210428213651.55467-1-leandro.ribeiro@collabora.com>
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
Cc: airlied@linux.ie, pekka.paalanen@collabora.co.uk, kernel@collabora.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a small description and document struct fields of
drm_mode_get_plane.

Signed-off-by: Leandro Ribeiro <leandro.ribeiro@collabora.com>
---
 include/uapi/drm/drm_mode.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index a5e76aa06ad5..8fa6495cd948 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -312,16 +312,38 @@ struct drm_mode_set_plane {
 	__u32 src_w;
 };

+/**
+ * struct drm_mode_get_plane - Get plane metadata.
+ *
+ * Userspace can perform a GETPLANE ioctl to retrieve information about a
+ * plane.
+ */
 struct drm_mode_get_plane {
+	/** @plane_id: Object ID of the plane. */
 	__u32 plane_id;

+	/** @crtc_id: Object ID of the current CRTC. */
 	__u32 crtc_id;
+	/** @fb_id: Object ID of the current fb. */
 	__u32 fb_id;

+	/**
+	 * @possible_crtcs: Bitmask of CRTC's compatible with the plane. CRTC's
+	 * are created and they receive an index, which corresponds to their
+	 * position in the bitmask. CRTC with index 0 will be in bit 0, and so
+	 * on. To learn how to find out the index of a certain CRTC, please see
+	 * :ref:`crtc_index`.
+	 */
 	__u32 possible_crtcs;
+	/** @gamma_size: Number of entries of the legacy gamma lookup table. */
 	__u32 gamma_size;

+	/** @count_format_types: Number of formats. */
 	__u32 count_format_types;
+	/**
+	 * @format_type_ptr: Pointer to ``__u32`` array of formats that are
+	 * supported by the plane. These formats do not require modifiers.
+	 */
 	__u64 format_type_ptr;
 };

--
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
