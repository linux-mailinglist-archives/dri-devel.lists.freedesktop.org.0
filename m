Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E493C4F7B54
	for <lists+dri-devel@lfdr.de>; Thu,  7 Apr 2022 11:15:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 992EE10E7D4;
	Thu,  7 Apr 2022 09:15:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20AED10E7D4;
 Thu,  7 Apr 2022 09:15:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649322933; x=1680858933;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=1YRG9/E/AgN+IW+J+9Icyvq2eZYsr+QAHV2A3mqYlAM=;
 b=DkTxI+JQNynDiOoXniknBARIi0HaNPQVbOydcWyGxMLZbLTaDmadNCow
 98WG8cZPPxt7xuJg+WqO2nWHHR1QXcrskYSXmwDZmsKAghLoDvBmYzW9h
 K0URGTBSXpdO85jbwyXVcYq+fvqtV5QdL9V/R1em7Mnh9NAGGB5TGza93
 7HTqBa0lBP+/R4ohJrMdsQ+ugvwcsZuzRCV2RoEiE7f5X6MI6v0KoGdk6
 RauKDaDYNAZGBkrA9qvRzSQulNlo0LjnwvjzibwxZo4kpGcvwLfVIxadN
 mbxPuKe9WPzI7Ri3IcTk0jyXlgpIMakBoXBcjfmb2585JBmtL8lOC6BXy A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10309"; a="324434459"
X-IronPort-AV: E=Sophos;i="5.90,241,1643702400"; d="scan'208";a="324434459"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 02:15:32 -0700
X-IronPort-AV: E=Sophos;i="5.90,241,1643702400"; d="scan'208";a="722886270"
Received: from kgibala-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.142.48])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Apr 2022 02:15:30 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 09/12] drm/edid: convert extension block read to EDID block
 read helper
Date: Thu,  7 Apr 2022 12:14:35 +0300
Message-Id: <464387f15ebcba39e424a7e15bbf59f0c1ba1717.1649322799.git.jani.nikula@intel.com>
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

Use the EDID block read helper also for extension block reads, making
edid_block_read() the only place with the read retry logic.

Note: We observe that drm_do_get_edid() does not use invalid extension
blocks to flag the EDID as corrupt.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index bffb8a599cda..6fa17084af02 100644
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

