Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA7BA699E1B
	for <lists+dri-devel@lfdr.de>; Thu, 16 Feb 2023 21:45:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E05410E383;
	Thu, 16 Feb 2023 20:45:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C606210E381;
 Thu, 16 Feb 2023 20:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1676580314; x=1708116314;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=5rKeKbYyTSnp03jUuXQlvxCtE71xDiyzLTaH5MlCc8c=;
 b=ZtrBk8rVvV+pe4i51JmVDSI76N4l/sRxGx8+PlKAVlhGhgMa1poGoufC
 JKFLibeG7oeYFxoZs7x8kiWbUY6yWRgepH0OugMNzTDQYMtzHlnwJI6xS
 pAHrlw5KHABB6QAVtm70oq1xi3p7cTDdsmQORLZ2DiSruDg+qNY1zF9A4
 31FzicGJbDsLqypzXVn1Y0KL6kKrhGnfxw8Q/rhw4vplfrw3uvGjbv29G
 m9MevZRnY6yWQm1euyqzrhPiEhdDvOniB+UzcO0iEv3EnhzxGyMrgcm4T
 JnFrfE6uaZbpIrPqM0AN8Rv2lGIpWsAKAuMZ6zkX6Hq8BHXDbYt6ppWkY g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="394308396"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="394308396"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Feb 2023 12:45:14 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="670311968"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; d="scan'208";a="670311968"
Received: from uwah-mobl.ger.corp.intel.com (HELO localhost) ([10.252.63.106])
 by orsmga002-auth.jf.intel.com with
 ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 12:45:12 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/4] drm/displayid: add displayid_get_header() and check
 bounds better
Date: Thu, 16 Feb 2023 22:44:58 +0200
Message-Id: <4a03b3a5132642d3cdb6d4c2641422955a917292.1676580180.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1676580180.git.jani.nikula@intel.com>
References: <cover.1676580180.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org,
 Iaroslav Boliukin <iam@lach.pw>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a helper to get a pointer to struct displayid_header. To be
pedantic, add buffer overflow checks to not touch the base if that
itself would overflow.

Cc: Iaroslav Boliukin <iam@lach.pw>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_displayid.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_displayid.c b/drivers/gpu/drm/drm_displayid.c
index 38ea8203df45..7d03159dc146 100644
--- a/drivers/gpu/drm/drm_displayid.c
+++ b/drivers/gpu/drm/drm_displayid.c
@@ -7,13 +7,28 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_print.h>
 
+static const struct displayid_header *
+displayid_get_header(const u8 *displayid, int length, int index)
+{
+	const struct displayid_header *base;
+
+	if (sizeof(*base) > length - index)
+		return ERR_PTR(-EINVAL);
+
+	base = (const struct displayid_header *)&displayid[index];
+
+	return base;
+}
+
 static int validate_displayid(const u8 *displayid, int length, int idx)
 {
 	int i, dispid_length;
 	u8 csum = 0;
 	const struct displayid_header *base;
 
-	base = (const struct displayid_header *)&displayid[idx];
+	base = displayid_get_header(displayid, length, idx);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
 
 	DRM_DEBUG_KMS("base revision 0x%x, length %d, %d %d\n",
 		      base->rev, base->bytes, base->prod_id, base->ext_count);
-- 
2.34.1

