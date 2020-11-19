Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA8FD2B93EC
	for <lists+dri-devel@lfdr.de>; Thu, 19 Nov 2020 14:52:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BB806E527;
	Thu, 19 Nov 2020 13:52:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail1.protonmail.ch (mail1.protonmail.ch [185.70.40.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3728B6E527
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Nov 2020 13:52:39 +0000 (UTC)
Date: Thu, 19 Nov 2020 13:52:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1605793956;
 bh=g1+X6TTger+Gk/4e83toapH4gygeF0OqX021q1ThXrY=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=J76scfCPI2TwKZgo0UCDcSwx/uM5BKnKpS+t+6G9rWCHLDrYOadDJKnmSigS/Ol5l
 OO/WvstZLflDFB1gkb8cAN8jecY5ZN8gX/hZ/7aMI7yGqm5KWRPBCC4eblFJvlBUcx
 fsp7sIJ0XlyeQEZ1yS5aA4gOX3M7AY9uEjuHtCHHihD8EXjSkHR+ts59pMJa4uuYTt
 vvzuGRWqOOVXvxVGCjkN44zZlG3zQpGLzJUU+FrettyuOTj0z3aK6FIUmmOnrUHdJ8
 MEC6Ye434z/VyGh+R6qTaWfhMCU8fkiRZC0R0jxRxoy6Cc/v1tzw7NhUdzsQ3x5MQr
 yxImX8m7tzCMw==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v2] drm: document drm_mode_get_connector
Message-ID: <PwfAVfVzxSH9UbOc2njhv2b7Kislwt2Xq4HBGrGBSc@cp4-web-040.plabs.ch>
MIME-Version: 1.0
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF shortcircuit=no
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
 mailout.protonmail.ch
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
Reply-To: Simon Ser <contact@emersion.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document how to perform a GETCONNECTOR ioctl. Document the various
struct fields. Also document how to perform a forced probe, and when
should user-space do it.

Signed-off-by: Simon Ser <contact@emersion.fr>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
---
 include/uapi/drm/drm_mode.h | 76 ++++++++++++++++++++++++++++++++++---
 1 file changed, 71 insertions(+), 5 deletions(-)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index 5ad10ab2a577..cd97c5671c75 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -368,27 +368,93 @@ enum drm_mode_subconnector {
 #define DRM_MODE_CONNECTOR_WRITEBACK	18
 #define DRM_MODE_CONNECTOR_SPI		19
 
+/**
+ * struct drm_mode_get_connector - Get connector metadata.
+ *
+ * User-space can perform a GETCONNECTOR ioctl to retrieve information about a
+ * connector. User-space is expected to retrieve encoders, modes and properties
+ * by performing this ioctl at least twice: the first time to retrieve the
+ * number of elements, the second time to retrieve the elements themselves.
+ *
+ * To retrieve the number of elements, set @count_props and @count_encoders to
+ * zero, set @count_modes to 1, and set @modes_ptr to a temporary struct
+ * drm_mode_modeinfo element.
+ *
+ * To retrieve the elements, allocate arrays for @encoders_ptr, @modes_ptr,
+ * @props_ptr and @prop_values_ptr, then set @count_modes, @count_props and
+ * @count_encoders to their capacity.
+ *
+ * Performing the ioctl only twice may be racy: the number of elements may have
+ * changed with a hotplug event in-between the two ioctls. User-space is
+ * expected to retry the last ioctl until the number of elements stabilizes.
+ * The kernel won't fill any array which doesn't have the expected length.
+ *
+ * **Force-probing a connector**
+ *
+ * If the @count_modes field is set to zero, the kernel will perform a forced
+ * probe on the connector to refresh the connector status, modes and EDID.
+ * A forced-probe can be slow and the ioctl will block.
+ *
+ * User-space shouldn't need to force-probe connectors in general: the kernel
+ * will automatically take care of probing connectors that don't support
+ * hot-plug detection when appropriate. However, user-space may force-probe
+ * connectors on user request (e.g. clicking a "Scan connectors" button, or
+ * opening a UI to manage screens).
+ */
 struct drm_mode_get_connector {
-
+	/** @encoders_ptr: Pointer to ``__u32`` array of object IDs. */
 	__u64 encoders_ptr;
+	/** @modes_ptr: Pointer to struct drm_mode_modeinfo array. */
 	__u64 modes_ptr;
+	/** @props_ptr: Pointer to ``__u32`` array of property IDs. */
 	__u64 props_ptr;
+	/** @prop_values_ptr: Pointer to ``__u64`` array of property values. */
 	__u64 prop_values_ptr;
 
+	/** @count_modes: Number of modes. */
 	__u32 count_modes;
+	/** @count_props: Number of properties. */
 	__u32 count_props;
+	/** @count_encoders: Number of encoders. */
 	__u32 count_encoders;
 
-	__u32 encoder_id; /**< Current Encoder */
-	__u32 connector_id; /**< Id */
+	/** @encoder_id: Object ID of the current encoder. */
+	__u32 encoder_id;
+	/** @connector_id: Object ID of the connector. */
+	__u32 connector_id;
+	/**
+	 * @connector_type: Type of the connector.
+	 *
+	 * See DRM_MODE_CONNECTOR_* defines.
+	 */
 	__u32 connector_type;
+	/**
+	 * @connector_type_id: Type-specific connector number.
+	 *
+	 * This is not an object ID. This is a per-type connector number. Each
+	 * (type, type_id) combination is unique across all connectors of a DRM
+	 * device.
+	 */
 	__u32 connector_type_id;
 
+	/**
+	 * @connection: Status of the connector.
+	 *
+	 * See enum drm_connector_status.
+	 */
 	__u32 connection;
-	__u32 mm_width;  /**< width in millimeters */
-	__u32 mm_height; /**< height in millimeters */
+	/** @mm_width: Width of the connected sink in millimeters. */
+	__u32 mm_width;
+	/** @mm_height: Height of the connected sink in millimeters. */
+	__u32 mm_height;
+	/**
+	 * @subpixel: Subpixel order of the connected sink.
+	 *
+	 * See enum subpixel_order.
+	 */
 	__u32 subpixel;
 
+	/** @pad: Padding. */
 	__u32 pad;
 };
 
-- 
2.29.2


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
