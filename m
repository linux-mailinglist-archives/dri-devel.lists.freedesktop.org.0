Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21AD951FBE4
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 14:03:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 833D710EE50;
	Mon,  9 May 2022 12:03:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB25610EE4B;
 Mon,  9 May 2022 12:03:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652097820; x=1683633820;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+I/C+1PUxSZTnur4lDxq85dL5tzYTSnZQZIvhIOkCD0=;
 b=SiJlYw1QsFN+t4IojmA1qgfXPMX9x8lbhj31UQ7EYfmNkVARNAWhfSbA
 dDEqgHcmdskAaIwCd/gLSIXbiAbvlRtA5g3B4BQIHS+YMveE4fEd0gblp
 2US42GDtznsZFpF4BcNYeRdPjQXQ2WxuUezXWPS+5dbTv+Spmf2cmegov
 doyMCzIsFO+n+Ktb0Yt3OwBbzr3SwdlCNd7AqvLdtD6s1CVCksL504HhP
 rb9Qajdq4NzdXc3ENanQp20gub+NTI9k3MPh5GtygPJFxEFWTLQo4NwiA
 mwZpq/8GLY7i+OiUMcUvNzvt7QuohhQ32KvZl3V3TytcN5AqO9CabDH/d w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10341"; a="256563567"
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="256563567"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 05:03:40 -0700
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="565030951"
Received: from csawicki-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.129.3])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 05:03:38 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 02/25] drm/edid: convert drm_for_each_detailed_block() to
 edid iter
Date: Mon,  9 May 2022 15:03:01 +0300
Message-Id: <a68718819a3dbfbdaaaddca7f73afa5ac6b33d07.1652097712.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1652097712.git.jani.nikula@intel.com>
References: <cover.1652097712.git.jani.nikula@intel.com>
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

We have an iterator for this, use it. It does include the base block,
but its tag is 0 and will be skipped.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_edid.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index efc1999b9573..dcef92c8887a 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2574,6 +2574,8 @@ vtb_for_each_detailed_block(const u8 *ext, detailed_cb *cb, void *closure)
 static void
 drm_for_each_detailed_block(const struct edid *edid, detailed_cb *cb, void *closure)
 {
+	struct drm_edid_iter edid_iter;
+	const u8 *ext;
 	int i;
 
 	if (edid == NULL)
@@ -2582,9 +2584,8 @@ drm_for_each_detailed_block(const struct edid *edid, detailed_cb *cb, void *clos
 	for (i = 0; i < EDID_DETAILED_TIMINGS; i++)
 		cb(&(edid->detailed_timings[i]), closure);
 
-	for (i = 0; i < edid_extension_block_count(edid); i++) {
-		const u8 *ext = edid_extension_block_data(edid, i);
-
+	drm_edid_iter_begin(edid, &edid_iter);
+	drm_edid_iter_for_each(ext, &edid_iter) {
 		switch (*ext) {
 		case CEA_EXT:
 			cea_for_each_detailed_block(ext, cb, closure);
@@ -2596,6 +2597,7 @@ drm_for_each_detailed_block(const struct edid *edid, detailed_cb *cb, void *clos
 			break;
 		}
 	}
+	drm_edid_iter_end(&edid_iter);
 }
 
 static void
-- 
2.30.2

