Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7FE34BF9FB
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 14:56:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97D9510E7A7;
	Tue, 22 Feb 2022 13:56:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D37210E7A7;
 Tue, 22 Feb 2022 13:56:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645538187; x=1677074187;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=I5y4Mh3PMqWbY4qE2u76ped8l/y82udnPQYa1A1vBcg=;
 b=WUgri66x7UfouA8/GRz/tzOTB/175FpxaUKGFEgko2H6q7P0AnnZasEH
 tEU/fiBvXJrkmzf+IZN5QtRA3Lts59udbtz7Kjj8BBzFel+doV/eQDl2t
 nmE6FC0yY0aErDSN6bak81V2QqgS1VNfesfObZYJcBgl/J52k1cTF9AKM
 tG8UgWriqzzOlHDE1GVQ/fYNtxZq2lem16B6GMA2QXx6BYOFNwv0j1gZ5
 apSFxg1TJD4KbipmITHA594F22kFuhmR0X7GqG99Kt3aiqmZQBL+jlprg
 NrOoYY45OXPmYAXe8jzSkj2xFWpvMVayV70zmaBxR5BfWC/WCANLK+W4b Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="232326509"
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="232326509"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 05:56:27 -0800
X-IronPort-AV: E=Sophos;i="5.88,387,1635231600"; d="scan'208";a="505534108"
Received: from sjgillin-mobl.ger.corp.intel.com (HELO tursulin-mobl2.home)
 ([10.213.218.63])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Feb 2022 05:56:25 -0800
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: igt-dev@lists.freedesktop.org
Subject: [PATCH i-g-t 08/11] libdrmfdinfo: Track largest engine index
Date: Tue, 22 Feb 2022 13:56:02 +0000
Message-Id: <20220222135605.1120767-9-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220222135605.1120767-1-tvrtko.ursulin@linux.intel.com>
References: <20220222135605.1120767-1-tvrtko.ursulin@linux.intel.com>
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
index 96a8b768a4b1..964c6b708960 100644
--- a/lib/igt_drm_fdinfo.c
+++ b/lib/igt_drm_fdinfo.c
@@ -159,6 +159,8 @@ __igt_parse_drm_fdinfo(int dir, const char *fd, struct drm_client_fdinfo *info,
 					info->capacity[idx] = 1;
 				info->busy[idx] = val;
 				info->num_engines++;
+				if (idx > info->last_engine_index)
+					info->last_engine_index = idx;
 			}
 		} else if (!strncmp(l, "drm-engine-capacity-", 20)) {
 			idx = parse_engine(l, info,
diff --git a/lib/igt_drm_fdinfo.h b/lib/igt_drm_fdinfo.h
index bea4a6304734..804e8e1aa333 100644
--- a/lib/igt_drm_fdinfo.h
+++ b/lib/igt_drm_fdinfo.h
@@ -36,6 +36,7 @@ struct drm_client_fdinfo {
 	unsigned long id;
 
 	unsigned int num_engines;
+	unsigned int last_engine_index;
 	unsigned int capacity[16];
 	char names[16][256];
 	uint64_t busy[16];
-- 
2.32.0

