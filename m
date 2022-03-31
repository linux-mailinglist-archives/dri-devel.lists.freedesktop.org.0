Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 933404EE0F7
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 20:46:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 211F610F480;
	Thu, 31 Mar 2022 18:46:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4566E10F480;
 Thu, 31 Mar 2022 18:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648752368; x=1680288368;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I2MQNoQcU9RRZI0i0XgrxX9NiVM1o/EA1egRGwCD4kg=;
 b=NqA0X6L/VJpPbjD4uXdUyGBO2wUwnzHmxVCEQBaGmyov8YWJdnkArM6G
 VG+Hw/9q0EThm5Dp12RMHjK4HEr3bWVTPDKiqHLGQSeksS9ZhcgNfKAQd
 6D+elDb7EnNsbOLJlXOz8WHgVy3F9plEKNNPmIQM7QhYHNHHRBt0vNzAp
 Oq4hL4EZ1BdXYMgN7MYbwLrYdYEOmakXCX41Ch0WC5J0KUltIfGkYKbyt
 BjEXrGNlPGDUSuOKk+P3YvI0vfAqcBcoYV+TKYwFja4P+3on6PAjWaCPw
 qDJ5alxUFJV4c1+G6CHilK11JyHT6HRXu020TtRDfoqy/6BHCQfxqRvPk g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="346364730"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="346364730"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 11:45:37 -0700
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="720574376"
Received: from gluca-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.48.194])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 11:45:35 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 05/12] drm/edid: clean up edid_is_zero()
Date: Thu, 31 Mar 2022 21:45:02 +0300
Message-Id: <15220580f07b63c92a3e448347cf59b297990407.1648752228.git.jani.nikula@intel.com>
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

Simplify, rename, take void pointer. No need for the drm_ prefix for
internal helpers.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_edid.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 92e51f502fde..081aff2d1068 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1627,12 +1627,9 @@ static int edid_block_tag(const void *_block)
 	return block[0];
 }
 
-static bool drm_edid_is_zero(const u8 *in_edid, int length)
+static bool edid_is_zero(const void *edid, int length)
 {
-	if (memchr_inv(in_edid, 0, length))
-		return false;
-
-	return true;
+	return !memchr_inv(edid, 0, length);
 }
 
 /**
@@ -1750,7 +1747,7 @@ bool drm_edid_block_valid(u8 *raw_edid, int block, bool print_bad_edid,
 
 bad:
 	if (print_bad_edid) {
-		if (drm_edid_is_zero(raw_edid, EDID_LENGTH)) {
+		if (edid_is_zero(raw_edid, EDID_LENGTH)) {
 			pr_notice("EDID block is all zeroes\n");
 		} else {
 			pr_notice("Raw EDID:\n");
@@ -1878,7 +1875,7 @@ static void connector_bad_edid(struct drm_connector *connector,
 		u8 *block = edid + i * EDID_LENGTH;
 		char prefix[20];
 
-		if (drm_edid_is_zero(block, EDID_LENGTH))
+		if (edid_is_zero(block, EDID_LENGTH))
 			sprintf(prefix, "\t[%02x] ZERO ", i);
 		else if (!drm_edid_block_valid(block, i, false, NULL))
 			sprintf(prefix, "\t[%02x] BAD  ", i);
@@ -1955,7 +1952,7 @@ static struct edid *drm_do_get_edid_base_block(struct drm_connector *connector,
 			goto out;
 		if (drm_edid_block_valid(edid, 0, false, edid_corrupt))
 			break;
-		if (i == 0 && drm_edid_is_zero(edid, EDID_LENGTH)) {
+		if (i == 0 && edid_is_zero(edid, EDID_LENGTH)) {
 			if (null_edid_counter)
 				(*null_edid_counter)++;
 			goto carp;
-- 
2.30.2

