Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C257471B57
	for <lists+dri-devel@lfdr.de>; Sun, 12 Dec 2021 16:26:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4F9289C16;
	Sun, 12 Dec 2021 15:26:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 046C388089
 for <dri-devel@lists.freedesktop.org>; Sun, 12 Dec 2021 15:26:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1639322789; x=1670858789;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=oUSM3WJHmfPDs99/XnQblVNSNtTyrRI58YJ5gcqWrbU=;
 b=anVTrz2ranIsZBBic3pidJrJPgCE0GIu5L8fv7yJjQU0MOAz7t/oAFYQ
 3st62g+q8anAbFLWyQZ4BxT6HdfJ9gXT/E7FEYtnXC1olA2Rvmd+ePSWG
 BTpmbIqWHopyu7ZrBQI2rb80QiCeRg6RYHUdiMTh8cq0vL7GIP9x9fh9a
 xX16KMKVA1AqrvnLUIUg7q0BvdDMqY0DMyNT8j8uvsVwrSa7BzVT5bjBK
 dEV5Qbxm/YXJp618+alLBLMNpucJ5/klmwHvyEqCKX+Gbgek+qM3fOIE2
 Wk/FMPmzSSxQdf86c9TKeZUedDbvbOZnEhmn/V7VRkk3afmw3J15kRb8e A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10195"; a="238426008"
X-IronPort-AV: E=Sophos;i="5.88,200,1635231600"; d="scan'208";a="238426008"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Dec 2021 07:26:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,200,1635231600"; d="scan'208";a="602974965"
Received: from shawnle1-build-machine.itwn.intel.com ([10.5.253.78])
 by FMSMGA003.fm.intel.com with ESMTP; 12 Dec 2021 07:26:26 -0800
From: Lee Shawn C <shawn.c.lee@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/edid: Refine HDMI VSDB detect
Date: Sun, 12 Dec 2021 23:33:31 +0800
Message-Id: <20211212153331.15457-1-shawn.c.lee@intel.com>
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
Cc: Lee Shawn C <shawn.c.lee@intel.com>, Dave Airlie <airlied@redhat.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

According to CEA-861-F chapter 7.5.4. It says "The VSDB shall contain the
3 bytes of the IEEE OUI as well as any additional payload bytes needed."
Now DRM driver check HDMI OUI but VSDB payload size at least five bytes.
That may caused some HDMI monitors' audio feature can't be enabled.
Because of they only have three bytes payload (OUI only) in VSDB.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Cc: Adam Jackson <ajax@redhat.com>
Cc: Dave Airlie <airlied@redhat.com>
Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 12893e7be89b..5aa4a6bf4a13 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4205,7 +4205,7 @@ static bool cea_db_is_hdmi_vsdb(const u8 *db)
 	if (cea_db_tag(db) != VENDOR_BLOCK)
 		return false;
 
-	if (cea_db_payload_len(db) < 5)
+	if (cea_db_payload_len(db) < 3)
 		return false;
 
 	return oui(db[3], db[2], db[1]) == HDMI_IEEE_OUI;
-- 
2.31.1

