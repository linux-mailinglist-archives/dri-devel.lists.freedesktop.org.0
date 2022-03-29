Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D67CC4EB386
	for <lists+dri-devel@lfdr.de>; Tue, 29 Mar 2022 20:42:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83F3C10E60A;
	Tue, 29 Mar 2022 18:42:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 607ED10E60A;
 Tue, 29 Mar 2022 18:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648579370; x=1680115370;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Kh2KS7UaT0XDUFCWdzs353K2T03bjA1CfSlyh2iV9j8=;
 b=PZKZ4R+gS6xk0K9ew3kvnGTg3yax5TkuhlvW/Glqsm72R1QcgtMssRZ3
 XnU4S4CD/tY36IElGH18pciqCX+WTGLOErRyAhjaLWO6UQmkrsPv39YIY
 5rG6PLB7HOnIYKhAJqkSagqLGaPJeV0k2+s/+WAVhENZ3EiSVCeZ+x4je
 BZDoGzcqPEmcw3cU2UlMlJ8Vub7h9wr+/FsI4vyB6rfr2Ss5FSVVrkPDS
 B2xJ71n7qmuV6jn+KnXJfqmApTycmplLZKuk2yTjkOV83pSOIwPW3KC1N
 pIfzaIhTQfRZbc0AFiRACzFREyb/GHAOIdc21AeAmbN+qWuAroIDOY/zP g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10301"; a="258163719"
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="258163719"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 11:42:49 -0700
X-IronPort-AV: E=Sophos;i="5.90,220,1643702400"; d="scan'208";a="719650406"
Received: from dmendyk-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.63.121])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Mar 2022 11:42:47 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 05/12] drm/edid: clean up edid_is_zero()
Date: Tue, 29 Mar 2022 21:42:12 +0300
Message-Id: <a2dea8a701d64db9da1fa3e75a3345796f6ede2f.1648578814.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1648578814.git.jani.nikula@intel.com>
References: <cover.1648578814.git.jani.nikula@intel.com>
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
---
 drivers/gpu/drm/drm_edid.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index b5b21b50e476..422db8ae0ac1 100644
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

