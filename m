Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5A35F1CE3
	for <lists+dri-devel@lfdr.de>; Sat,  1 Oct 2022 16:39:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ABCE10E411;
	Sat,  1 Oct 2022 14:39:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3709210E3F6;
 Sat,  1 Oct 2022 14:38:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1664635138; x=1696171138;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ZvmnKlBOEJQV03vypnRoR8Ba2QSzMp3+FTy2heXqD60=;
 b=V827RwarkSmdqRWJ0PK+3OH+9tJNXN9qhW3iz9giyTAeBARLVR5L5W1I
 eZrvrFpd+BKWIU1nvXgHKkWLSlg3XDdyuNJ6FaL3dpfNoWH6ziWO+RQTY
 uLSZeorhaHyDLdj9I+Fkx3A5oPs4qQARM4N6+Gt+CU79PZ9h3MftQTsIn
 +BzcrrYLarvBUbxVRRDPtyy2+Vu1OMibmyDfQ6u+nX+9vgEgzITNIeIyk
 u2yRaLe+zKIihr3XOA3eEX+1X3GNilqpUN+SJihmuMPANH6lvRRi2UAh3
 58y6l4zlOlk8ZvOGTvHCVzuOJoQHYaqYDnst4kjoHlEL/pNhc/VLFcDFM g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10487"; a="302364173"
X-IronPort-AV: E=Sophos;i="5.93,361,1654585200"; d="scan'208";a="302364173"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Oct 2022 07:38:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10487"; a="653868403"
X-IronPort-AV: E=Sophos;i="5.93,361,1654585200"; d="scan'208";a="653868403"
Received: from shawnle1-build-machine.itwn.intel.com ([10.5.253.78])
 by orsmga008.jf.intel.com with ESMTP; 01 Oct 2022 07:38:56 -0700
From: Lee Shawn C <shawn.c.lee@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: Add 64:27 and 256:135 picture aspect ratio support
Date: Sat,  1 Oct 2022 22:38:39 +0800
Message-Id: <20221001143839.22397-1-shawn.c.lee@intel.com>
X-Mailer: git-send-email 2.17.1
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
Cc: Shankar Uma <uma.shankar@intel.com>, Lee Shawn C <shawn.c.lee@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Drm driver did not report connector can support 64:27 and 256:135 picture
aspect ratio. Even if drm_edid driver already have those modes in
CEA table. Add both of them then user space application would program
proper picture apsect ratio when HDMI 2.1 monitor connected.

Cc: Shankar Uma <uma.shankar@intel.com>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
---
 drivers/gpu/drm/drm_connector.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index e3142c8142b3..45078d11c7d3 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -948,6 +948,8 @@ static const struct drm_prop_enum_list drm_aspect_ratio_enum_list[] = {
 	{ DRM_MODE_PICTURE_ASPECT_NONE, "Automatic" },
 	{ DRM_MODE_PICTURE_ASPECT_4_3, "4:3" },
 	{ DRM_MODE_PICTURE_ASPECT_16_9, "16:9" },
+	{ DRM_MODE_PICTURE_ASPECT_64_27, "64:27" },
+	{ DRM_MODE_PICTURE_ASPECT_256_135, "256:135" },
 };
 
 static const struct drm_prop_enum_list drm_content_type_enum_list[] = {
-- 
2.31.1

