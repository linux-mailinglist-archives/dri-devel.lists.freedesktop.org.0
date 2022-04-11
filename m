Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E73154FB81A
	for <lists+dri-devel@lfdr.de>; Mon, 11 Apr 2022 11:48:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CDAC10F2E2;
	Mon, 11 Apr 2022 09:48:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6779210F138;
 Mon, 11 Apr 2022 09:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649670507; x=1681206507;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=Gp56NpPmP+iA4JNYKh3FzfQpdyY9ywX++fF8huTw2ek=;
 b=lkI2Pjtufvg0KssjBB+BdfkD6yhUw26WrprFfxr7qKW0rBIjVy8PMJmF
 84a0Z60M0mKcvZ2Vwwmr8sLW52RXFpfxp8TtJMebAidKdKSwUKyLdgiFy
 BkPlNxji740JypjnCBELJSf+H/HTAxgahN9ln8HGiT+4fsaWqhDPRQwVA
 oIPqpeh20Pzl+UC2wfU/B2OGOdVneogycEYbMo3m2+Lrq+NCOuCtx1fBM
 6jjgXyjec8/uFhUwKfispzg/g5/gQwOSdX0RGxUHDfw2XU6QoNvtG5eHv
 9jJc1XIBYtDrY5UFOLEQ/qj2fLiGz+1d1zUZkLXAnej3hoZmlNjur1P0b Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10313"; a="322522288"
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="322522288"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 02:48:26 -0700
X-IronPort-AV: E=Sophos;i="5.90,251,1643702400"; d="scan'208";a="723902245"
Received: from lwit-desk1.ger.corp.intel.com (HELO localhost) ([10.249.143.43])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Apr 2022 02:48:25 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [CI v2 09/12] drm/edid: convert extension block read to EDID block
 read helper
Date: Mon, 11 Apr 2022 12:47:30 +0300
Message-Id: <dc3354184660537d8c7edb5dbbab8b89db60d013.1649670305.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1649670305.git.jani.nikula@intel.com>
References: <cover.1649670305.git.jani.nikula@intel.com>
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

Use the EDID block read helper also for extension block reads, making
edid_block_read() the only place with the read retry logic.

Note: We observe that drm_do_get_edid() does not use invalid extension
blocks to flag the EDID as corrupt.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_edid.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 359d3d6f216e..8a050b65c06a 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2143,17 +2143,16 @@ struct edid *drm_do_get_edid(struct drm_connector *connector,
 
 	for (j = 1; j <= edid->extensions; j++) {
 		void *block = edid + j;
-		int try;
 
-		for (try = 0; try < 4; try++) {
-			if (read_block(context, block, j, EDID_LENGTH))
-				goto out;
-			if (drm_edid_block_valid(block, j, false, NULL))
-				break;
-		}
+		status = edid_block_read(block, j, read_block, context);
 
-		if (try == 4)
+		edid_block_status_print(status, block, j);
+
+		if (!edid_block_status_valid(status, edid_block_tag(block))) {
+			if (status == EDID_BLOCK_READ_FAIL)
+				goto out;
 			invalid_blocks++;
+		}
 	}
 
 	if (invalid_blocks) {
-- 
2.30.2

