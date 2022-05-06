Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C21651D53A
	for <lists+dri-devel@lfdr.de>; Fri,  6 May 2022 12:10:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C15C10F930;
	Fri,  6 May 2022 10:10:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0F7810F930;
 Fri,  6 May 2022 10:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1651831850; x=1683367850;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=rndbY+3ZzrQsLz9c3gIiVS2AZeARlCtBeiD3s1y8Xcg=;
 b=i+7FUqSE6PmUZkD5sgU6mNMfmb5QbFpGEKewlgBMZF8ZNY97xb0MahSW
 KDstXrqAJHI6qmWHV4S7oOQtdmEUEYQbDeeoE2lDriDq6pp3PCJmamWbG
 RjC+hbKo69X1hUgUMNvzCkUHDHNbXE/sF88MRTILKcwhXU5Uiwrhs1WDG
 bLDKZdFVFzZ2tY9E2d7Ndv0P/DdgYcQtowVWmFjP1Uhz0TIhUU1SWH0xc
 fJiky8TF3wm3WcPZRMDqZb2dBYrjgF87B6/Om7fECO+0y4cNf4F1YXgTk
 Uoy1AYfa6gO5cM7w6n7uo+JQ33p9ohiVnrTIyVWRXCvmOaI99uP+bKekJ g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10338"; a="248959256"
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="248959256"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 03:10:50 -0700
X-IronPort-AV: E=Sophos;i="5.91,203,1647327600"; d="scan'208";a="735566922"
Received: from psikora-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.157.88])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 May 2022 03:10:48 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 02/25] drm/edid: convert drm_for_each_detailed_block() to edid
 iter
Date: Fri,  6 May 2022 13:10:09 +0300
Message-Id: <26e5a04f13803a151ff832e0bccde06e44768c38.1651830938.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1651830938.git.jani.nikula@intel.com>
References: <cover.1651830938.git.jani.nikula@intel.com>
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

We have an iterator for this, use it. It does include the base block,
but its tag is 0 and will be skipped.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
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

