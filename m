Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D32D854287E
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 09:51:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4EF2C10EF17;
	Wed,  8 Jun 2022 07:51:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF28510EEF6;
 Wed,  8 Jun 2022 07:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654674711; x=1686210711;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5viE9T8Z6AUsdld1aFrrxiDXPXR8laMBneLEjuvCW9U=;
 b=XUkAAScwc2WbCEzCRgbbbsHVILcknfqAuv5j5NAwSCcrS4y+OWA5VETV
 K5n+AhnPgDy+m+KosWu5nbUV55vkeFUKhpZ7EX4RwhqTn7y858nwHrVh5
 Mk7j4SNEu/RZzVKxz5OSQsctRkiOMeqnkZg8k6rTvWrOgkMEzv2oELh22
 MwolgKUY76Op1/dRrWf4QqbvhfxQ0jT5qEPN11YHcyzJco2bApRGLNvqg
 7jvIojFSfRL4fTvE2pqREhPmUP60XSU08bd6GyKX8l63rzlqp11tIXhfp
 CHs2A77yhkzbf2BheoT+b1GjBfz8qgzReDG9/17NdFrhMXJoVUWD+MrvJ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="256634432"
X-IronPort-AV: E=Sophos;i="5.91,285,1647327600"; d="scan'208";a="256634432"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 00:51:50 -0700
X-IronPort-AV: E=Sophos;i="5.91,285,1647327600"; d="scan'208";a="584720366"
Received: from jkosticx-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.58.130])
 by fmsmga007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 00:51:49 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 14/15] drm/edid: take HF-EEODB extension count into account
Date: Wed,  8 Jun 2022 10:50:44 +0300
Message-Id: <6b9ba99d9cc269e05aecf29e81566fc8ce9745a6.1654674560.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1654674560.git.jani.nikula@intel.com>
References: <cover.1654674560.git.jani.nikula@intel.com>
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

Take the HF-EEODB extension count override into account.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 5cac357e50b0..b7b1f0639115 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1629,6 +1629,19 @@ static int drm_edid_block_count(const struct drm_edid *drm_edid)
 	/* Starting point */
 	num_blocks = edid_block_count(drm_edid->edid);
 
+	/* HF-EEODB override */
+	if (drm_edid->size >= edid_size_by_blocks(2)) {
+		int eeodb;
+
+		/*
+		 * Note: HF-EEODB may specify a smaller extension count than the
+		 * regular one. Unlike in buffer allocation, here we can use it.
+		 */
+		eeodb = edid_hfeeodb_block_count(drm_edid->edid);
+		if (eeodb)
+			num_blocks = eeodb;
+	}
+
 	/* Limit by allocated size */
 	num_blocks = min(num_blocks, (int)drm_edid->size / EDID_LENGTH);
 
-- 
2.30.2

