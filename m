Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A04B9054F8
	for <lists+dri-devel@lfdr.de>; Wed, 12 Jun 2024 16:19:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C770E10E86C;
	Wed, 12 Jun 2024 14:19:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NHJur5I/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A35A310E86D;
 Wed, 12 Jun 2024 14:19:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1718201948; x=1749737948;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=iTfX0OGo7mQkt1Hu+39Yef2nNTH1EActMfkzmyvQNQA=;
 b=NHJur5I/Zxi+Ii23dulJ4JmKvesp/v2H7Q4cVhCitlSLnYvGgtLw36pw
 Mqqci2i94y9mHQaqy1S3pDLg0/tnrivqnQfWMuXfi1iA0Tc0AAu9K0c5f
 FSty1BLERI4xJb9FUnjboDk+f8Z/faKjN4UrFYnB9w2swS0URQsWhj0qK
 iDK102lTXN8aNaYDyF68Lwtdrn0oegNM6MbsA4Yi/yTR+0tP7/vv0BroA
 0KwGCpGWOFtPU0ys+JVJcFLVaX/yvMME26HPEDFzTVhx06KORmSXQ/1n+
 Qpqxz+Z8fJN9qgEGYzt1ZmkQc5KtpX8W/mzj2DDg/+VF+x5RQu5jK1RCs A==;
X-CSE-ConnectionGUID: xQpD1hyFR7aY7uxTfVQuYA==
X-CSE-MsgGUID: NQj3lyVHQO+ikAqUPyDZrg==
X-IronPort-AV: E=McAfee;i="6700,10204,11101"; a="25600424"
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="25600424"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jun 2024 07:19:07 -0700
X-CSE-ConnectionGUID: QcGlkbX4TZKrAcRWwg512Q==
X-CSE-MsgGUID: BvfBQtiMQq6o9Gw9TUfS0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,233,1712646000"; d="scan'208";a="39760161"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by fmviesa008.fm.intel.com with SMTP; 12 Jun 2024 07:19:04 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Wed, 12 Jun 2024 17:19:03 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Simon Ser <contact@emersion.fr>,
 Daniel Stone <daniels@collabora.com>
Subject: [PATCH 1/2] drm/doc: Document drm_get_encoder ioctl more thoroughly
Date: Wed, 12 Jun 2024 17:19:02 +0300
Message-ID: <20240612141903.17219-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.44.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Document all the fields of the drm_get_encoder ioctl.

Cc: Simon Ser <contact@emersion.fr>
Cc: Daniel Stone <daniels@collabora.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 Documentation/gpu/drm-uapi.rst | 13 +++++++++++++
 include/uapi/drm/drm_mode.h    | 22 +++++++++++++++++++++-
 2 files changed, 34 insertions(+), 1 deletion(-)

diff --git a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
index 370d820be248..ebe318757b2a 100644
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -564,6 +564,19 @@ CRTC ID's, and the CRTC index is its position in this array.
 .. kernel-doc:: include/uapi/drm/drm_mode.h
    :internal:
 
+encoder index
+-------------
+
+encoders have both an object ID and an index, and they are not the same thing.
+The index is used in cases where a densely packed identifier for an encoder is
+needed, for instance a bitmask of encoders. The member possible_clones of struct
+drm_mode_get_encoder is an example.
+
+:c:macro:`DRM_IOCTL_MODE_GETRESOURCES` populates a structure with an array of
+encoder IDs, and the encoder index is its position in this array.
+
+.. kernel-doc:: include/uapi/drm/drm_mode.h
+   :internal:
 
 dma-buf interoperability
 ========================
diff --git a/include/uapi/drm/drm_mode.h b/include/uapi/drm/drm_mode.h
index d390011b89b4..fe5e210396b2 100644
--- a/include/uapi/drm/drm_mode.h
+++ b/include/uapi/drm/drm_mode.h
@@ -373,12 +373,32 @@ struct drm_mode_get_plane_res {
 #define DRM_MODE_ENCODER_DPI	8
 
 struct drm_mode_get_encoder {
+	/**
+	 * @encoder_id: Object ID of the encoder whose information
+	 * should be retrieved. Set by caller.
+	 */
 	__u32 encoder_id;
+	/** @encoder_type: Type of the encoder */
 	__u32 encoder_type;
 
-	__u32 crtc_id; /**< Id of crtc */
+	/** @crtc_id: Object ID of the current CRTC. */
+	__u32 crtc_id;
 
+	/**
+	 * @possible_crtcs: Bitmask of CRTCs compatible with the encoder.
+	 * CRTCs are created and they receive an index, which corresponds
+	 * to their position in the bitmask. Bit N corresponds to
+	 * :ref:`CRTC index<crtc_index>` N.
+	 */
 	__u32 possible_crtcs;
+	/**
+	 * @possible_clones: Bitmask of encoders compatible with the
+	 * encoder for cloning. A set of cloned encoders all source
+	 * their data from the same CRTC.
+	 * Encoders are created and they receive an index, which corresponds
+	 * to their position in the bitmask. Bit N corresponds to
+	 * :ref:`encoder index<encoder_index>` N.
+	 */
 	__u32 possible_clones;
 };
 
-- 
2.44.2

