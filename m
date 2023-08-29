Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A803F78C908
	for <lists+dri-devel@lfdr.de>; Tue, 29 Aug 2023 17:59:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07E3710E3DF;
	Tue, 29 Aug 2023 15:59:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E10910E3DD;
 Tue, 29 Aug 2023 15:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1693324742; x=1724860742;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FTnaNI/dqfL0mN5AB3xSetNKJE1kZExcpPoMiYYhpds=;
 b=ISgcOQKKNPRjca/MLpzACLi0yW+YooOH5dar98eNT1hfdxvBMojAOfFR
 w3uIFVWwvvg/kW9b4bteTw6Wwt0fERCKqFH5RTeNxPjKdDmf9X3l5R4Go
 rHfmnzO3WxoLz1PX4yC84zywe6AoQXa67gxMewmWCLT9p7tfpUHjKiy1T
 BnQKxCq57LgU2oUnAk1hfSj7QOwg+U0FzWdL+NiIfd57376MPyBX17Rxv
 XRRU3X04ec3Il3JYhz8995lpqsa/4o6jhICHMRLPUqEhsQ+8XyUbljcyA
 7na1PTmPUmyCQFQcZYcdrMRuU7d8r0P8LRnWoglNJ6ITVqVbvMCh2mwUj Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="441769266"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="441769266"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2023 08:59:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10817"; a="688554999"
X-IronPort-AV: E=Sophos;i="6.02,210,1688454000"; d="scan'208";a="688554999"
Received: from cfl-desktop.iind.intel.com ([10.190.239.20])
 by orsmga003.jf.intel.com with ESMTP; 29 Aug 2023 08:59:00 -0700
From: Uma Shankar <uma.shankar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [RFC 09/33] drm: Add color information to plane state
Date: Tue, 29 Aug 2023 21:33:58 +0530
Message-ID: <20230829160422.1251087-10-uma.shankar@intel.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20230829160422.1251087-1-uma.shankar@intel.com>
References: <20230829160422.1251087-1-uma.shankar@intel.com>
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
Cc: Uma Shankar <uma.shankar@intel.com>,
 Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>,
 wayland-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a new structure drm_plane_color to plane state. It consists
of blobs with data needed for respective color HW blocks.

Currently defining below blobs

  pre-csc: can be used to linearize the input frame buffer data.

  csc: used for color space conversion.

  post-csc: can be used non-linearize frame buffer data or
            to perform Tone mapping for HDR use-cases

  private: can be used for vendor specific fixed function operations

This can be extended to include other color operations as well.

Co-developed-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Chaitanya Kumar Borah <chaitanya.kumar.borah@intel.com>
Signed-off-by: Uma Shankar <uma.shankar@intel.com>
---
 include/drm/drm_plane.h | 41 +++++++++++++++++++++++++++++++++++++++++
 1 file changed, 41 insertions(+)

diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index fcd589cb38f2..601b01e47a93 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -245,6 +245,47 @@ struct drm_plane_state {
 	 */
 	struct drm_property_blob *set_color_pipeline_data;
 
+	/**
+	 * @drm_plane_color:
+	 *
+	 * Encapsulates all color states.
+	 */
+	struct drm_plane_color {
+		/**
+		 * @pre_csc_lut:
+		 *
+		 * Lookup table for converting framebuffer pixel data before apply the
+		 * color conversion matrix @ctm. See drm_plane_enable_color_mgmt(). The
+		 * blob (if not NULL) is an array of &struct drm_color_lut_ext.
+		 */
+		struct drm_property_blob *pre_csc_lut;
+
+		/**
+		 * @ctm:
+		 *
+		 * Color transformation matrix. See drm_plane_enable_color_mgmt(). The
+		 * blob (if not NULL) is a &struct drm_color_ctm.
+		 */
+		struct drm_property_blob *ctm;
+
+		/**
+		 * @post_csc_lut:
+		 *
+		 * Lookup table for converting framebuffer pixel data after applying the
+		 * color conversion matrix @ctm. See drm_plane_enable_color_mgmt(). The
+		 * blob (if not NULL) is an array of &struct drm_color_lut_ext.
+		 */
+		struct drm_property_blob *post_csc_lut;
+
+		/**
+		 * @private_color_op_data:
+		 *
+		 * This blob is intended for drivers to implement driver private color operations.
+		 * For example: Parameterized/non-parameterized fixed function operations
+		 */
+		struct drm_property_blob *private_color_op_data;
+	} color;
+
 	/**
 	 * @color_mgmt_changed: Plane color pipeline state has changed
 	 * Used by the atomic helpers and
-- 
2.38.1

