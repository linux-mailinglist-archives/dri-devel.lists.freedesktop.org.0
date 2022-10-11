Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C59015FB3CE
	for <lists+dri-devel@lfdr.de>; Tue, 11 Oct 2022 15:51:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B008410E815;
	Tue, 11 Oct 2022 13:50:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F95010E807;
 Tue, 11 Oct 2022 13:50:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1665496243; x=1697032243;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=eVLXQ8YbBVSpWTF/1zXfxXZaIjynA/4UdJRxfzyx0RQ=;
 b=CcQKOogRBVZlPGxAVtKKh3h55uUo7m01mKpUrD498S1IxrfZO/0cOhyp
 cvbfmjsPfdCz7wt7+MtT69gIny1tiRA0U4/0e1nF6Eok4YVFeep4N+y6J
 5aDx/bVuXyQDX8cdSC/P6UQmmA1kx0qpAy2eBLOinxYq5SYW4N1kz45gD
 FiQPvta/1cU0DeTLVOnqDkx3GQ2ZGXA9aEx7MegKp9ipExs4WvAIVGyrX
 PSDgSic0Kf527EPk8e04v3pTj4Iv2LE+6P9s3zY2aQolkPQegTBYO/jXJ
 qQI329t2FlZRpqH49pMzHh6TdrnfTzx5a+5T5tcX6XAnajERfsJpDqzUs g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="304494540"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="304494540"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 06:50:28 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10497"; a="659539872"
X-IronPort-AV: E=Sophos;i="5.95,176,1661842800"; d="scan'208";a="659539872"
Received: from milawils-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.40.183])
 by orsmga001-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Oct 2022 06:50:26 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 07/15] drm/edid: split drm_edid block count helper
Date: Tue, 11 Oct 2022 16:49:41 +0300
Message-Id: <d573b83a4a55f3da6949b2e89c001a74d1932d96.1665496046.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1665496046.git.jani.nikula@intel.com>
References: <cover.1665496046.git.jani.nikula@intel.com>
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

Split the drm_edid block count helper to a base version that reports the
block count indicated by EDID contents, and another on top that limits
the block count based on size allocated for the EDID.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 15 +++++++++++----
 1 file changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 8baa46dc2537..616c1cdc7507 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1613,7 +1613,8 @@ static const void *edid_extension_block_data(const struct edid *edid, int index)
 	return edid_block_data(edid, index + 1);
 }
 
-static int drm_edid_block_count(const struct drm_edid *drm_edid)
+/* EDID block count indicated in EDID, may exceed allocated size */
+static int __drm_edid_block_count(const struct drm_edid *drm_edid)
 {
 	int num_blocks;
 
@@ -1633,12 +1634,18 @@ static int drm_edid_block_count(const struct drm_edid *drm_edid)
 			num_blocks = eeodb;
 	}
 
-	/* Limit by allocated size */
-	num_blocks = min(num_blocks, (int)drm_edid->size / EDID_LENGTH);
-
 	return num_blocks;
 }
 
+/* EDID block count, limited by allocated size */
+static int drm_edid_block_count(const struct drm_edid *drm_edid)
+{
+	/* Limit by allocated size */
+	return min(__drm_edid_block_count(drm_edid),
+		   (int)drm_edid->size / EDID_LENGTH);
+}
+
+/* EDID extension block count, limited by allocated size */
 static int drm_edid_extension_block_count(const struct drm_edid *drm_edid)
 {
 	return drm_edid_block_count(drm_edid) - 1;
-- 
2.34.1

