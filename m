Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BACD43A2078
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 01:01:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27DD76EB38;
	Wed,  9 Jun 2021 23:01:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 849DD6EB5A
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 23:01:15 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2804:431:e7dc:1201:ddd3:c6b:bb28:7501])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: leandrohrb)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id DFD951F43883;
 Thu, 10 Jun 2021 00:01:12 +0100 (BST)
From: Leandro Ribeiro <leandro.ribeiro@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 2/2] drm/doc: document drm_mode_get_plane
Date: Wed,  9 Jun 2021 20:00:39 -0300
Message-Id: <20210609230039.73307-3-leandro.ribeiro@collabora.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210609230039.73307-1-leandro.ribeiro@collabora.com>
References: <20210609230039.73307-1-leandro.ribeiro@collabora.com>
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
Cc: airlied@linux.ie, pekka.paalanen@collabora.co.uk, kernel@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a small description and document struct fields of
drm_mode_get_plane.

Signed-off-by: Leandro Ribeiro <leandro.ribeiro@collabora.com>
---
 include/uapi/drm/drm_mode.h | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index a5e76aa06ad5..67bcd8e1931c 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -312,16 +312,52 @@ struct drm_mode_set_plane {
 	__u32 src_w;
 };

+/**
+ * struct drm_mode_get_plane - Get plane metadata.
+ *
+ * Userspace can perform a GETPLANE ioctl to retrieve information about a
+ * plane.
+ *
+ * To retrieve the number of formats supported, set @count_format_types to zero
+ * and call the ioctl. @count_format_types will be updated with the value.
+ *
+ * To retrieve these formats, allocate an array with the memory needed to store
+ * @count_format_types formats. Point @format_type_ptr to this array and call
+ * the ioctl again (with @count_format_types still set to the value returned in
+ * the first ioctl call).
+ *
+ * Between one ioctl and the other, the number of formats may change.
+ * Userspace should retry the last ioctl until this number stabilizes. The
+ * kernel won't fill any array which doesn't have the expected length.
+ */
 struct drm_mode_get_plane {
+	/**
+	 * @plane_id: Object ID of the plane whose information should be
+	 * retrieved. Set by caller.
+	 */
 	__u32 plane_id;

+	/** @crtc_id: Object ID of the current CRTC. */
 	__u32 crtc_id;
+	/** @fb_id: Object ID of the current fb. */
 	__u32 fb_id;

+	/**
+	 * @possible_crtcs: Bitmask of CRTC's compatible with the plane. CRTC's
+	 * are created and they receive an index, which corresponds to their
+	 * position in the bitmask. Bit N corresponds to
+	 * :ref:`CRTC index<crtc_index>` N.
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

