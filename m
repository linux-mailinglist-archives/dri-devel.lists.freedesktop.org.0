Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 549683A2077
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jun 2021 01:01:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA1316EB6F;
	Wed,  9 Jun 2021 23:01:15 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk
 [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 905BE6EB38
 for <dri-devel@lists.freedesktop.org>; Wed,  9 Jun 2021 23:01:13 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2804:431:e7dc:1201:ddd3:c6b:bb28:7501])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: leandrohrb)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id D9CCF1F4387E;
 Thu, 10 Jun 2021 00:01:10 +0100 (BST)
From: Leandro Ribeiro <leandro.ribeiro@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v4 1/2] drm/doc: document how userspace should find out CRTC
 index
Date: Wed,  9 Jun 2021 20:00:38 -0300
Message-Id: <20210609230039.73307-2-leandro.ribeiro@collabora.com>
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

In this patch we add a section to document what userspace should do to
find out the CRTC index. This is important as they may be many places in
the documentation that need this, so it's better to just point to this
section and avoid repetition.

Signed-off-by: Leandro Ribeiro <leandro.ribeiro@collabora.com>
---
 Documentation/gpu/drm-uapi.rst    | 13 +++++++++++++
 drivers/gpu/drm/drm_debugfs_crc.c |  8 ++++----
 include/uapi/drm/drm.h            |  4 ++--
 3 files changed, 19 insertions(+), 6 deletions(-)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 04bdc7a91d53..7e51dd40bf6e 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -457,6 +457,19 @@ Userspace API Structures
 .. kernel-doc:: include/uapi/drm/drm_mode.h
    :doc: overview

+.. _crtc_index:
+
+CRTC index
+----------
+
+CRTC's have both an object ID and an index, and they are not the same thing.
+The index is used in cases where a densely packed identifier for a CRTC is
+needed, for instance a bitmask of CRTC's. The member possible_crtcs of struct
+drm_mode_get_plane is an example.
+
+DRM_IOCTL_MODE_GETRESOURCES populates a structure with an array of CRTC ID's,
+and the CRTC index is its position in this array.
+
 .. kernel-doc:: include/uapi/drm/drm.h
    :internal:

diff --git a/drivers/gpu/drm/drm_debugfs_crc.c b/drivers/gpu/drm/drm_debugfs_crc.c
index 3dd70d813f69..bbc3bc4ba844 100644
--- a/drivers/gpu/drm/drm_debugfs_crc.c
+++ b/drivers/gpu/drm/drm_debugfs_crc.c
@@ -46,10 +46,10 @@
  * it reached a given hardware component (a CRC sampling "source").
  *
  * Userspace can control generation of CRCs in a given CRTC by writing to the
- * file dri/0/crtc-N/crc/control in debugfs, with N being the index of the CRTC.
- * Accepted values are source names (which are driver-specific) and the "auto"
- * keyword, which will let the driver select a default source of frame CRCs
- * for this CRTC.
+ * file dri/0/crtc-N/crc/control in debugfs, with N being the :ref:`index of
+ * the CRTC<crtc_index>`. Accepted values are source names (which are
+ * driver-specific) and the "auto" keyword, which will let the driver select a
+ * default source of frame CRCs for this CRTC.
  *
  * Once frame CRC generation is enabled, userspace can capture them by reading
  * the dri/0/crtc-N/crc/data file. Each line in that file contains the frame
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 67b94bc3c885..bbf4e76daa55 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -635,8 +635,8 @@ struct drm_gem_open {
 /**
  * DRM_CAP_VBLANK_HIGH_CRTC
  *
- * If set to 1, the kernel supports specifying a CRTC index in the high bits of
- * &drm_wait_vblank_request.type.
+ * If set to 1, the kernel supports specifying a :ref:`CRTC index<crtc_index>`
+ * in the high bits of &drm_wait_vblank_request.type.
  *
  * Starting kernel version 2.6.39, this capability is always set to 1.
  */
--
2.31.1

