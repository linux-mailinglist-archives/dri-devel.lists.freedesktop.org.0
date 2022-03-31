Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1F154EDB32
	for <lists+dri-devel@lfdr.de>; Thu, 31 Mar 2022 16:04:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D400910F3FA;
	Thu, 31 Mar 2022 14:04:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8EA110F3E7;
 Thu, 31 Mar 2022 14:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648735460; x=1680271460;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=D5S4W/HNVTQ+KLF9VD20tKomJ0DvLFrzK2wte8e4wbs=;
 b=S0KhYHrLIn1ZNxUBo9ipNW9NoJqLbtOvbHx7LasD59lCNlXgSZpAVqij
 fv2mk3vG+Rq5eM5S+T5tUWLmH8G9ZFKcpHSoDN6jeBSWjyg1mkyQFZJE+
 m7vBwFg5lqtuiDMkQCF0+Wh4sd838ts9tEPew4yn0akL0ZaKAChPY3b85
 goT8jpk1s0vDCCAFJqkTZCCyQlFDGq+u294Vcj2nzqtqFMfHFeYP+RZXD
 5DjfyuqshVfv4KBLNbiFISGDyzRrp0wHYZQMdsHmmL2Gr1DeQvjvE9RRX
 PWfRkPBNiDmYl64XL8tGBMSgSCT5jmkni2fZbi6a3Gmhf35EdthKrniz7 A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10302"; a="260027262"
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="260027262"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 07:04:11 -0700
X-IronPort-AV: E=Sophos;i="5.90,225,1643702400"; d="scan'208";a="547347326"
Received: from juanniex-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.215.247])
 by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 Mar 2022 07:04:10 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 08/12] libdrmfdinfo: Track largest engine index
Date: Thu, 31 Mar 2022 15:03:44 +0100
Message-Id: <20220331140348.2985832-9-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220331140348.2985832-1-tvrtko.ursulin@linux.intel.com>
References: <20220331140348.2985832-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
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
index d5c66881ed43..3926cbd25ecf 100644
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
index 4d14e7931532..e567600fe53b 100644
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
2.32.0

