Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9395B625EF3
	for <lists+dri-devel@lfdr.de>; Fri, 11 Nov 2022 16:59:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 833F710E89E;
	Fri, 11 Nov 2022 15:59:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 769EC10E875;
 Fri, 11 Nov 2022 15:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1668182352; x=1699718352;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=z2kT0bQZvocH3okAW+0SZfN2R5pq5QWrNUFJDy4VNMI=;
 b=iWjXmqnFFlChLP0emRWCi1UnKRLmu6Oyt9awa5UKhHP146CuVOxPD5Cf
 ClwBltJtQgVXS0XgqRoA2OOqApkc8wfmoOkLKGzhcTshy85nnFYP4qdz+
 0mEQii80lZ/c38khVOJVzUAqLvyy/vw2JzoNkQSKYFedSAeuqXYBLaDB0
 a3Wrmxo25167vTSzbbGa6JuMozd2YGWsKnWhNz7l+iWarLQ08TDBAdObp
 HUZws0tBUfYkUwiDrnnYCH0WaHUSU2E50TBHXlb3mHBN1XCyUCRYQo35k
 OCbJCD/VNdyiiaQklygEiF64NerrzmWGBrbl0BjOvS/bAeIN7/oGT2Jvy A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10528"; a="375883656"
X-IronPort-AV: E=Sophos;i="5.96,156,1665471600"; d="scan'208";a="375883656"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2022 07:59:12 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10528"; a="706577583"
X-IronPort-AV: E=Sophos;i="5.96,156,1665471600"; d="scan'208";a="706577583"
Received: from eharkin-mobl.ger.corp.intel.com (HELO localhost.localdomain)
 ([10.213.208.27])
 by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2022 07:59:10 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org, Intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Subject: [PATCH i-g-t 5/8] libdrmfdinfo: Track largest engine index
Date: Fri, 11 Nov 2022 15:58:41 +0000
Message-Id: <20221111155844.3290531-6-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221111155844.3290531-1-tvrtko.ursulin@linux.intel.com>
References: <20221111155844.3290531-1-tvrtko.ursulin@linux.intel.com>
MIME-Version: 1.0
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Prep code for incoming work.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
---
 lib/igt_drm_fdinfo.c | 2 ++
 lib/igt_drm_fdinfo.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/lib/igt_drm_fdinfo.c b/lib/igt_drm_fdinfo.c
index 68c89ad2c17e..b850d2210ae7 100644
--- a/lib/igt_drm_fdinfo.c
+++ b/lib/igt_drm_fdinfo.c
@@ -162,6 +162,8 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
 					info->capacity[idx] = 1;
 				info->busy[idx] = val;
 				info->num_engines++;
+				if (idx > info->last_engine_index)
+					info->last_engine_index = idx;
 			}
 		} else if (!strncmp(l, "drm-engine-capacity-", 20)) {
 			idx = parse_engine(l, info,
diff --git a/lib/igt_drm_fdinfo.h b/lib/igt_drm_fdinfo.h
index fa4982f4030e..6284e05e868a 100644
--- a/lib/igt_drm_fdinfo.h
+++ b/lib/igt_drm_fdinfo.h
@@ -38,6 +38,7 @@ struct drm_client_fdinfo {
 	unsigned long id;
 
 	unsigned int num_engines;
+	unsigned int last_engine_index;
 	unsigned int capacity[DRM_CLIENT_FDINFO_MAX_ENGINES];
 	char names[DRM_CLIENT_FDINFO_MAX_ENGINES][256];
 	uint64_t busy[DRM_CLIENT_FDINFO_MAX_ENGINES];
-- 
2.34.1

