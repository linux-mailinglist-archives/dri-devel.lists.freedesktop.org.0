Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 618B12BA549
	for <lists+dri-devel@lfdr.de>; Fri, 20 Nov 2020 09:57:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 982DC6E88F;
	Fri, 20 Nov 2020 08:57:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail2.protonmail.ch (mail2.protonmail.ch [185.70.40.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7C2E6E88F
 for <dri-devel@lists.freedesktop.org>; Fri, 20 Nov 2020 08:57:43 +0000 (UTC)
Date: Fri, 20 Nov 2020 08:57:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
 s=protonmail2; t=1605862661;
 bh=nazGHfs+T2CrLizZDgxs544QfEPZzJay/KETx2xVfD4=;
 h=Date:To:From:Cc:Reply-To:Subject:From;
 b=eLXURcGyy9s3BKT0aSSbk9ssxirqGGA9ODfrRDHAhLLQg7TI9/acQImV/lSTy5ZlF
 hazNAK6HIvz1E0Mfj8/957oxZvv5JJ6ghuL7BiyJihnR2DeYQN67bZzK5lUrWe23ch
 +ujtzUn85p3GZKA0/c1ytt5aVaSx0RKDyzoX6OEV0MScfj9Ff71vX3GF0MEP+OXbhm
 7WTswJ83X53TUbfEtiJCV0MYtMyTYpx7A2OOhHtSARm8el9f0K/2ma28yvhn9aSS1z
 /lYlwTJ0ShTKxfFPSullciOfio7PxvlLA54WMeaEL6jhkUJjclzC5F2AJKdQBvwDhp
 ZlOEhQbC5G5Dw==
To: dri-devel@lists.freedesktop.org
From: Simon Ser <contact@emersion.fr>
Subject: [PATCH v3] drm: document drm_mode_get_connector
Message-ID: <4NxrTtynzPiPX4SOCzxmA1sRB8fVLfeiabVpi5j3Y@cp7-web-041.plabs.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Document how to perform a GETCONNECTOR ioctl. Document the various
struct fields. Also document how to perform a forced probe, and when
should user-space do it.

Signed-off-by: Simon Ser <contact@emersion.fr>
Reviewed-by: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Pekka Paalanen <ppaalanen@gmail.com>
---
 include/uapi/drm/drm_mode.h | 78 ++++++++++++++++++++++++++++++++++---
 1 file changed, 73 insertions(+), 5 deletions(-)

diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index f29c1d37be67..3979389fcc4f 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -368,27 +368,95 @@ enum drm_mode_subconnector {
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
+ * A forced-probe can be slow and the ioctl will block. A force-probe can cause
+ * flickering and temporary freezes, so it should not be performed
+ * automatically.
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
 
+	/** @pad: Padding, must be zero. */
 	__u32 pad;
 };
 
-- 
2.29.2


_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
