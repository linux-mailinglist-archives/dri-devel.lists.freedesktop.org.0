Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F03A751D538
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 12:10:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7B6D10F902;
	Fri,  6 May 2022 10:10:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4889610F902;
 Fri,  6 May 2022 10:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651831845; x=1683367845;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=YSF6EXWMygRJqQnago2VW8CgqHc4czun6T28YcvVB9Q=;
 b=hMKUNJRfeClWQvNQGv/8QhA3v4j/WTgsZhe7+d36nclXEE4ve15cJpkF
 BYt6dW6DpqMEI6e9zeGUuRs4CQUqEju+VClTmj2gJndw7fxcdlCuTL8rF
 6K0bW5Bw+YG8eha/SNg20+hQ5KqsVJ+6tnPAcP+3SDJO8mt39UfpN9ruI
 TilOlItldTuyI9hkZ5SLQMDKYHjSepFm8xaBmvfEjE9jOCZXce5DzsMgE
 5m+SEd2zRbeXu6Drho+vurp7YTXrz67Qt7mzt9E044GaWmYBOJDcFm7e3
 lGk/WTfdEg36cbAGa67VPTK07Z+503g0qU07sYQfiRFuiIcfOh3GrObMY Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="266016448"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="266016448"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 03:10:44 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="563751882"
Received: from psikora-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.157.88])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 03:10:42 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 01/25] drm/edid: use else-if in CTA extension parsing
Date: Fri,  6 May 2022 13:10:08 +0300
Message-Id: <569616c0e79b981092b5ff37f905b6fdc19b231b.1651830938.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1651830938.git.jani.nikula@intel.com>
References: <cover.1651830938.git.jani.nikula@intel.com>
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

Only one of the conditions can be true.

Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 47d121e99201..efc1999b9573 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5473,16 +5473,16 @@ static void drm_parse_cea_ext(struct drm_connector *connector,
 
 		if (cea_db_is_hdmi_vsdb(db))
 			drm_parse_hdmi_vsdb_video(connector, data);
-		if (cea_db_is_hdmi_forum_vsdb(db) ||
-		    cea_db_is_hdmi_forum_scdb(db))
+		else if (cea_db_is_hdmi_forum_vsdb(db) ||
+			 cea_db_is_hdmi_forum_scdb(db))
 			drm_parse_hdmi_forum_scds(connector, data);
-		if (cea_db_is_microsoft_vsdb(db))
+		else if (cea_db_is_microsoft_vsdb(db))
 			drm_parse_microsoft_vsdb(connector, data);
-		if (cea_db_is_y420cmdb(db))
+		else if (cea_db_is_y420cmdb(db))
 			drm_parse_y420cmdb_bitmap(connector, data);
-		if (cea_db_is_vcdb(db))
+		else if (cea_db_is_vcdb(db))
 			drm_parse_vcdb(connector, data);
-		if (cea_db_is_hdmi_hdr_metadata_block(db))
+		else if (cea_db_is_hdmi_hdr_metadata_block(db))
 			drm_parse_hdr_metadata_block(connector, data);
 	}
 	cea_db_iter_end(&iter);
-- 
2.30.2

