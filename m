Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 415CB4EE0EA
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 20:45:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AEBE10F46D;
	Thu, 31 Mar 2022 18:45:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 310C510F46E;
 Thu, 31 Mar 2022 18:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648752342; x=1680288342;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=pab0HoPiudRwEZNuX76X/fe7O8kkDYLJOvbBO1L97bo=;
 b=Ex0p1snbnyM+3qYMHFvQV8Gty2lHcAcyfD8bc7Jv5GRd+4xJA82GAKlD
 AcqgPPXEbdbUpqYyJA/h/6X9Q2hcV+Afto2L9TmLfncPH9Xqu4Jnq2+WD
 cLDpnw/vkLH9itsJC1z0Oyrb1sKDuHd4Mn/BVGwWJ9DDo0wmyRX8fdOmU
 P+yLA0+Cve7rHVPdRvHCK+TGkSqUIR/9CP1yvh3jcyoWZK50+JeUVG6+r
 j+TJ7nCw1TOnFMXTzKP4M0tKurIhw5+Ql0CEGEyR6Xdz/kz6E09t//XE/
 fgzp9pwyOMq9jdcjxfeAWkIkDOR7Hr1NvGewHSMWEzZ+KntZV28j28HBE Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="320615362"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="320615362"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 11:45:41 -0700
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="654984968"
Received: from gluca-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.48.194])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 11:45:39 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 06/12] drm/edid: split out edid_header_fix()
Date: Thu, 31 Mar 2022 21:45:03 +0300
Message-Id: <c10c24b179e942548cd5d693d159bb0d12be4d26.1648752228.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1648752228.git.jani.nikula@intel.com>
References: <cover.1648752228.git.jani.nikula@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Give a name to the EDID header fixup instead of having an inline memcpy.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_edid.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 081aff2d1068..f8169ffd062d 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1572,6 +1572,11 @@ static const u8 edid_header[] = {
 	0x00, 0xff, 0xff, 0xff, 0xff, 0xff, 0xff, 0x00
 };
 
+static void edid_header_fix(void *edid)
+{
+	memcpy(edid, edid_header, sizeof(edid_header));
+}
+
 /**
  * drm_edid_header_is_valid - sanity check the header of the base EDID block
  * @raw_edid: pointer to raw base EDID block
@@ -1702,7 +1707,7 @@ bool drm_edid_block_valid(u8 *raw_edid, int block, bool print_bad_edid,
 			if (edid_corrupt)
 				*edid_corrupt = true;
 			DRM_DEBUG("Fixing EDID header, your hardware may be failing\n");
-			memcpy(raw_edid, edid_header, sizeof(edid_header));
+			edid_header_fix(raw_edid);
 		} else {
 			if (edid_corrupt)
 				*edid_corrupt = true;
-- 
2.30.2

