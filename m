Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE69F4F7B48
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 11:15:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83F3010E794;
	Thu,  7 Apr 2022 09:15:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3ECAC10E77A;
 Thu,  7 Apr 2022 09:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649322907; x=1680858907;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=KtaYKzrfzuyEFfSaeN3pyE4zQqrO5BqcVt4cGTB0xa8=;
 b=ccYib3YBQrP3E78zBHd7mSWOITUW+ItDG6pQOVVxbXa6EDaG+zUsEBVe
 1G+fZYuoplKK4cETtqdEdHwqyG6EeVRzlGGe5ouwTekvpFucc3QQuTrvR
 5HEch/BXpMG+sI5wS1nKgLeA0y3DQp0KK4lSwfvUi5M649cCyOL4MNgaS
 TmmZqTaQRzv9UIrgYij6TEaiWqck8QNuizMTn3LX34U2VUns4UXqLAYse
 lLhwaddQ2ewqIAzRQxuoKn/OHPK6x9De9EAi/xzf+s/7Va77u5elvslA2
 reCW50BShy195JL/vfxJFtjN9Y55ygK56dbzabwvMyvkxCW4+wuyToEHH w==;
X-IronPort-AV: E=McAfee;i="6200,9189,10309"; a="321964159"
X-IronPort-AV: E=Sophos;i="5.90,241,1643702400"; d="scan'208";a="321964159"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 02:14:49 -0700
X-IronPort-AV: E=Sophos;i="5.90,241,1643702400"; d="scan'208";a="549945616"
Received: from kgibala-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.142.48])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 02:14:47 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 01/12] drm/edid: convert edid_is_zero() to
 edid_block_is_zero() for blocks
Date: Thu,  7 Apr 2022 12:14:27 +0300
Message-Id: <4a5f816a3e0507a447aa2a040623055a4ffa6b3d.1649322799.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1649322799.git.jani.nikula@intel.com>
References: <cover.1649322799.git.jani.nikula@intel.com>
MIME-Version: 1.0
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

