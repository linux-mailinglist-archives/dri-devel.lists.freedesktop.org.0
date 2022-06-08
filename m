Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 02A67542863
	for <lists+dri-devel@lfdr.de>; Wed,  8 Jun 2022 09:51:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94BD910EE77;
	Wed,  8 Jun 2022 07:51:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F8CE10EE71;
 Wed,  8 Jun 2022 07:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1654674660; x=1686210660;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qXo3+dxVUh1IV0UkSBtqOI/XGvWDIINbClNWbxvPFmU=;
 b=AbR3jwm0hNtGpghmwh0k3E9IA573sIwpEz6+FZDgxlkAeuiNR15otuuB
 Vi+hIpQ7HbPPqTBD4/5bXypYMyIkHAV4ZqD0xA3MayGgzRdW1GC4BlxFJ
 PNHeNUiRxTTDZTX8v9U4LT8Yi5C6MsXFTsLIcHxQMMLNJou4SAsSVoQzZ
 HpAe1BOE8uakLKBYN3Ry0PPG2VKMjoHk6Ed1oFldHzMJCuYeYF9N+rELB
 aNZTSCHi+lEEGNZenMJejlc1nHoNxm7f/HtRHcOeU/UPwYIfsggCCqk+t
 IHAYpEEyymmpA8+su2h0N4Esza4EiW5bF5rA5Ho5DR7k8Zg/3YCXU1Z7A A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10371"; a="277645926"
X-IronPort-AV: E=Sophos;i="5.91,285,1647327600"; d="scan'208";a="277645926"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 00:51:00 -0700
X-IronPort-AV: E=Sophos;i="5.91,285,1647327600"; d="scan'208";a="826808009"
Received: from jkosticx-mobl.amr.corp.intel.com (HELO localhost)
 ([10.252.58.130])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Jun 2022 00:50:57 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 02/15] drm/edid: abstract cea data block collection size
Date: Wed,  8 Jun 2022 10:50:32 +0300
Message-Id: <5339ab3249400a3c41001967e7ff2611b58e0425.1654674560.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1654674560.git.jani.nikula@intel.com>
References: <cover.1654674560.git.jani.nikula@intel.com>
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

Add a function to get the cea data block collection size.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 24 +++++++++++++++++++++---
 1 file changed, 21 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index c57f6333ea7d..002816509fc8 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4482,6 +4482,20 @@ __cea_db_iter_current_block(const struct cea_db_iter *iter)
 	return NULL;
 }
 
+/*
+ * References:
+ * - CTA-861-H section 7.3.3 CTA Extension Version 3
+ */
+static int cea_db_collection_size(const u8 *cta)
+{
+	u8 d = cta[2];
+
+	if (d < 4 || d > 127)
+		return 0;
+
+	return d - 4;
+}
+
 /*
  * References:
  * - VESA E-EDID v1.4
@@ -4492,15 +4506,19 @@ static const void *__cea_db_iter_edid_next(struct cea_db_iter *iter)
 	const u8 *ext;
 
 	drm_edid_iter_for_each(ext, &iter->edid_iter) {
+		int size;
+
 		/* Only support CTA Extension revision 3+ */
 		if (ext[0] != CEA_EXT || cea_revision(ext) < 3)
 			continue;
 
-		iter->index = 4;
-		iter->end = ext[2];
-		if (iter->end < 4 || iter->end > 127)
+		size = cea_db_collection_size(ext);
+		if (!size)
 			continue;
 
+		iter->index = 4;
+		iter->end = iter->index + size;
+
 		return ext;
 	}
 
-- 
2.30.2

