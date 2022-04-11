Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B9FF4FBE05
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 16:00:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D6DF10F25F;
	Mon, 11 Apr 2022 14:00:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C43810F25F;
 Mon, 11 Apr 2022 14:00:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649685649; x=1681221649;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OtDkyGNJI75dSVKuN1HxN3qyhIDQs0bLdtAi38sFg5A=;
 b=DwUnHwilhdOmYs23fY1HwVYDrGC/IXTNA48Xg0l3ZntBN9qcsA2fb8ol
 6MXzvl3naLgpgOkXpk7t6glYHo2J1mD22POuzpYm/CHORH/+eSP3yzPYW
 m3F0rWvZ2THhUanT1nfbanILsuzIWEGze9RRnwNOwwS8vbLlVTSqOC//v
 pfcDNZM1IpqsnpEgVkoFDzz/fqwXF0N5/a2mbZO7ySa40iTaPV3DEPHV7
 o7JzVGObwj26p0v/6g3X+iDFq4zRU0Yvqfra0UUKyIBih3GkWm6BhvaD0
 wNsRoQ486GJIY/ynHrM7Jn+gUDXoj2dtMCpb1UZhcnQQYj7nZFbW5993A Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="261560005"
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="261560005"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 07:00:49 -0700
X-IronPort-AV: E=Sophos;i="5.90,252,1643702400"; d="scan'208";a="551151115"
Received: from lwit-desk1.ger.corp.intel.com (HELO localhost) ([10.249.143.43])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 07:00:44 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [CI v3 01/12] drm/edid: convert edid_is_zero() to
 edid_block_is_zero() for blocks
Date: Mon, 11 Apr 2022 17:00:24 +0300
Message-Id: <5cc9387e22b4a61243df4053d1ebcc14b0007dc8.1649685475.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1649685475.git.jani.nikula@intel.com>
References: <cover.1649685475.git.jani.nikula@intel.com>
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

As edid_is_zero() is only ever used on EDID blocks, convert it to
edid_block_is_zero() with implicit block size.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_edid.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 04e818ecd662..f4da3f92f41b 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1632,9 +1632,9 @@ static int edid_block_tag(const void *_block)
 	return block[0];
 }
 
-static bool edid_is_zero(const void *edid, int length)
+static bool edid_block_is_zero(const void *edid)
 {
-	return !memchr_inv(edid, 0, length);
+	return !memchr_inv(edid, 0, EDID_LENGTH);
 }
 
 /**
@@ -1785,7 +1785,7 @@ bool drm_edid_block_valid(u8 *_block, int block_num, bool print_bad_edid,
 	}
 
 	if (!valid && print_bad_edid) {
-		if (edid_is_zero(block, EDID_LENGTH)) {
+		if (edid_block_is_zero(block)) {
 			pr_notice("EDID block is all zeroes\n");
 		} else {
 			pr_notice("Raw EDID:\n");
@@ -1942,7 +1942,7 @@ static void connector_bad_edid(struct drm_connector *connector,
 		u8 *block = edid + i * EDID_LENGTH;
 		char prefix[20];
 
-		if (edid_is_zero(block, EDID_LENGTH))
+		if (edid_block_is_zero(block))
 			sprintf(prefix, "\t[%02x] ZERO ", i);
 		else if (!drm_edid_block_valid(block, i, false, NULL))
 			sprintf(prefix, "\t[%02x] BAD  ", i);
@@ -2019,7 +2019,7 @@ static struct edid *drm_do_get_edid_base_block(struct drm_connector *connector,
 			goto out;
 		if (drm_edid_block_valid(edid, 0, false, edid_corrupt))
 			break;
-		if (try == 0 && edid_is_zero(edid, EDID_LENGTH)) {
+		if (try == 0 && edid_block_is_zero(edid)) {
 			if (null_edid_counter)
 				(*null_edid_counter)++;
 			goto carp;
-- 
2.30.2

