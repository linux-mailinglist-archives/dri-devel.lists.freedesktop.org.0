Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8343519932
	for <lists+dri-devel@lfdr.de>; Wed,  4 May 2022 10:04:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED96310F48A;
	Wed,  4 May 2022 08:04:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E41F810F48A
 for <dri-devel@lists.freedesktop.org>; Wed,  4 May 2022 08:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651651490; x=1683187490;
 h=resent-to:resent-from:resent-date:resent-message-id:
 mime-version:from:to:cc:subject:date:message-id:
 in-reply-to:references:content-transfer-encoding;
 bh=FgHdZNLN31+//9bdXVMVdxznrDWOyAsCeNM60kOhUkw=;
 b=FCfta6PRfsJp7WNBwYFTW6QvGMrpIRGm6F3tHUAjjliocEQAFJ4YAIew
 6M/fsBZ6O4YWXAO7vok4xN8RaZB6u3a3yOBhXYUJfYcBFYj6dnP0ksGSJ
 JX+uk0nWCFrB0iJ5rWD2gwjd4bi4IAPh1D+Pq8N0Qd/vejytQ27dft4xV
 FlYy9hEoMcVmgD2l6lmjfIVM/1GZL81ORUB0peyex4iRLJ/g2tPC4EYGR
 qFcEgY4Tzh9a/nGL9xe/w/Bw0fDHZBAmhlbR2E7rjp3HytYAid8rq/x90
 xLAwmbhfaXjgDEtLcTQ8W/7VGUqtd+T2aPgFDRYJkEej/DzbqxNi4pTrJ w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10336"; a="328238138"
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="328238138"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 01:04:47 -0700
X-IronPort-AV: E=Sophos;i="5.91,197,1647327600"; d="scan'208";a="620707506"
Received: from adobrowo-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.156.70])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 01:04:46 -0700
Resent-Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7,
 02160 Espoo
Resent-To: dri-devel@lists.freedesktop.org
Resent-From: Jani Nikula <jani.nikula@intel.com>
Resent-Date: Wed, 04 May 2022 11:04:43 +0300
Resent-Message-ID: <87levhn2p0.fsf@intel.com>
MIME-Version: 1.0
Received: from outlook.iglb.intel.com [163.33.184.135]
 by jnikula-mobl4.ger.corp.intel.com with IMAP (fetchmail-6.4.23)
 for <jani@localhost> (single-drop); Tue, 03 May 2022 12:28:39 +0300 (EEST)
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Mailbox Transport; Tue, 3 May 2022 02:25:51 -0700
Received: from orsmsx609.amr.corp.intel.com (10.22.229.22) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27; Tue, 3 May 2022 02:25:50 -0700
Received: from orsmga003.jf.intel.com (10.7.209.27) by
 orsmsx609.amr.corp.intel.com (10.22.229.89) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.27 via Frontend Transport; Tue, 3 May 2022 02:25:50 -0700
X-IronPort-AV: E=Sophos;i="5.91,194,1647327600"; d="scan'208";a="516490533"
Received: from jasinski-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.249.133.126])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 May 2022 02:25:48 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: <intel-gfx@lists.freedesktop.org>
Subject: [PATCH v2 20/20] drm/edid: sunset drm_find_cea_extension()
Date: Tue, 3 May 2022 12:24:05 +0300
Message-ID: <a5bf228942e6bd0fc70d5cf7a14c249a14a7afcd.1651569697.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1651569697.git.jani.nikula@intel.com>
References: <cover.1651569697.git.jani.nikula@intel.com>
Content-Type: text/plain; charset="UTF-8"
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Content-Transfer-Encoding: 8bit
X-MS-Exchange-Organization-Network-Message-Id: 0b7635a4-1cb4-4c2a-b17a-08da2ce6ea1a
X-MS-Exchange-Organization-AuthSource: ORSMSX609.amr.corp.intel.com
X-MS-Exchange-Organization-AuthAs: Internal
X-MS-Exchange-Organization-AuthMechanism: 10
X-MS-Exchange-Organization-AVStamp-Enterprise: 1.0
X-MS-Exchange-Organization-SCL: -1
X-MS-Exchange-Transport-EndToEndLatency: 00:00:00.7796760
X-MS-Exchange-Processed-By-BccFoldering: 15.01.2308.027
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
Cc: jani.nikula@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Convert drm_find_cea_extension() to a predicate function to check if the
EDID has a CTA extension or a DisplayID CTA data block. This is mainly
to avoid adding new users that only find the first CTA extension.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 391c91199aa2..d2f64c321a13 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -3558,30 +3558,29 @@ const u8 *drm_find_edid_extension(const struct edid *edid,
 	return edid_ext;
 }
 
-static const u8 *drm_find_cea_extension(const struct edid *edid)
+/* Return true if the EDID has a CTA extension or a DisplayID CTA data block */
+static bool drm_edid_has_cta_extension(const struct edid *edid)
 {
 	const struct displayid_block *block;
 	struct displayid_iter iter;
-	const u8 *cea;
 	int ext_index = 0;
+	bool found = false;
 
 	/* Look for a top level CEA extension block */
-	/* FIXME: make callers iterate through multiple CEA ext blocks? */
-	cea = drm_find_edid_extension(edid, CEA_EXT, &ext_index);
-	if (cea)
-		return cea;
+	if (drm_find_edid_extension(edid, CEA_EXT, &ext_index))
+		return true;
 
 	/* CEA blocks can also be found embedded in a DisplayID block */
 	displayid_iter_edid_begin(edid, &iter);
 	displayid_iter_for_each(block, &iter) {
 		if (block->tag == DATA_BLOCK_CTA) {
-			cea = (const u8 *)block;
+			found = true;
 			break;
 		}
 	}
 	displayid_iter_end(&iter);
 
-	return cea;
+	return found;
 }
 
 static __always_inline const struct drm_display_mode *cea_mode_for_vic(u8 vic)
@@ -3854,8 +3853,8 @@ add_alternate_cea_modes(struct drm_connector *connector, const struct edid *edid
 	LIST_HEAD(list);
 	int modes = 0;
 
-	/* Don't add CEA modes if the CEA extension block is missing */
-	if (!drm_find_cea_extension(edid))
+	/* Don't add CTA modes if the CTA extension block is missing */
+	if (!drm_edid_has_cta_extension(edid))
 		return 0;
 
 	/*
-- 
2.30.2

