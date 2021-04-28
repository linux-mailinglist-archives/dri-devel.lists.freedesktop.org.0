Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A72E36E108
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 23:37:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1ABE16EC56;
	Wed, 28 Apr 2021 21:37:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [46.235.227.227])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEA7789100
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Apr 2021 21:37:22 +0000 (UTC)
Received: from localhost.localdomain (unknown
 [IPv6:2804:431:e7dd:b215:2a57:79ce:97d1:4a15])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested) (Authenticated sender: leandrohrb)
 by bhuna.collabora.co.uk (Postfix) with ESMTPSA id 680221F4198E;
 Wed, 28 Apr 2021 22:37:19 +0100 (BST)
From: Leandro Ribeiro <leandro.ribeiro@collabora.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm/doc: document how userspace should find out CRTC index
Date: Wed, 28 Apr 2021 18:36:50 -0300
Message-Id: <20210428213651.55467-2-leandro.ribeiro@collabora.com>
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

In this patch we add a section to document what userspace should do to
find out the CRTC index. This is important as there are multiple places
in the documentation that need this, so it's better to just point to
this section and avoid repetition.

Signed-off-by: Leandro Ribeiro <leandro.ribeiro@collabora.com>
---
 Documentation/gpu/drm-uapi.rst    | 14 ++++++++++++++
 drivers/gpu/drm/drm_debugfs_crc.c |  9 +++++----
 include/uapi/drm/drm.h            |  3 ++-
 3 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 04bdc7a91d53..1aa52a6ac567 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -457,6 +457,20 @@ Userspace API Structures
 .. kernel-doc:: include/uapi/drm/drm_mode.h
    :doc: overview

+.. _crtc_index:
+
+CRTC index
+----------
+
+In some situations, it is important for userspace to find out the index of a
+CRTC. The CRTC index should not be confused with its object id.
+
+In order to do this, userspace should first query the resources object
+from the device that owns the CRTC (using the DRM_IOCTL_MODE_GETRESOURCES
+ioctl). The resources object contains a pointer to an array of CRTC's, and also
+the number of entries of the array. The index of the CRTC is the same as its
+position in this array.
+
 .. kernel-doc:: include/uapi/drm/drm.h
    :internal:

diff --git a/drivers/gpu/drm/drm_debugfs_crc.c b/drivers/gpu/drm/drm_debugfs_crc.c
index 3dd70d813f69..9575188d97ee 100644
--- a/drivers/gpu/drm/drm_debugfs_crc.c
+++ b/drivers/gpu/drm/drm_debugfs_crc.c
@@ -46,10 +46,11 @@
  * it reached a given hardware component (a CRC sampling "source").
  *
  * Userspace can control generation of CRCs in a given CRTC by writing to the
- * file dri/0/crtc-N/crc/control in debugfs, with N being the index of the CRTC.
- * Accepted values are source names (which are driver-specific) and the "auto"
- * keyword, which will let the driver select a default source of frame CRCs
- * for this CRTC.
+ * file dri/0/crtc-N/crc/control in debugfs, with N being the index of the
+ * CRTC. To learn how to find out the index of a certain CRTC, please see
+ * :ref:`crtc_index`. Accepted values are source names (which are
+ * driver-specific) and the "auto" keyword, which will let the driver select a
+ * default source of frame CRCs for this CRTC.
  *
  * Once frame CRC generation is enabled, userspace can capture them by reading
  * the dri/0/crtc-N/crc/data file. Each line in that file contains the frame
diff --git a/include/uapi/drm/drm.h b/include/uapi/drm/drm.h
index 67b94bc3c885..6944f08ab1a6 100644
--- a/include/uapi/drm/drm.h
+++ b/include/uapi/drm/drm.h
@@ -636,7 +636,8 @@ struct drm_gem_open {
  * DRM_CAP_VBLANK_HIGH_CRTC
  *
  * If set to 1, the kernel supports specifying a CRTC index in the high bits of
- * &drm_wait_vblank_request.type.
+ * &drm_wait_vblank_request.type. To learn how to find out the index of a
+ * certain CRTC, please see :ref:`crtc_index`.
  *
  * Starting kernel version 2.6.39, this capability is always set to 1.
  */
--
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
