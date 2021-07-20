Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 076303D0520
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jul 2021 01:24:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD94789ED3;
	Tue, 20 Jul 2021 23:24:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CD3E589E7B;
 Tue, 20 Jul 2021 23:24:39 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10051"; a="209441158"
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="209441158"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 16:24:38 -0700
X-IronPort-AV: E=Sophos;i="5.84,256,1620716400"; d="scan'208";a="632477382"
Received: from lucas-s2600cw.jf.intel.com ([10.165.21.202])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Jul 2021 16:24:37 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/4] drm/i915/gt: nuke unused legacy engine hw_id
Date: Tue, 20 Jul 2021 16:20:12 -0700
Message-Id: <20210720232014.3302645-3-lucas.demarchi@intel.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210720232014.3302645-1-lucas.demarchi@intel.com>
References: <20210720232014.3302645-1-lucas.demarchi@intel.com>
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
Cc: Tomas Winkler <tomas.winkler@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, dri-devel@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The engine hw_id is only used by RING_FAULT_REG(), which is not used
since GRAPHICS_VER == 8. We tend to keep adding new defines just to be
consistent, but let's try to remove them and let them defined to 0 when
not used.

Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_engine_cs.c    | 4 ----
 drivers/gpu/drm/i915/gt/intel_engine_types.h | 4 ----
 2 files changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_engine_cs.c b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
index d561573ed98c..a11f69f2e46e 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_cs.c
+++ b/drivers/gpu/drm/i915/gt/intel_engine_cs.c
@@ -80,7 +80,6 @@ static const struct engine_info intel_engines[] = {
 		},
 	},
 	[VCS1] = {
-		.hw_id = VCS1_HW,
 		.class = VIDEO_DECODE_CLASS,
 		.instance = 1,
 		.mmio_bases = {
@@ -89,7 +88,6 @@ static const struct engine_info intel_engines[] = {
 		},
 	},
 	[VCS2] = {
-		.hw_id = VCS2_HW,
 		.class = VIDEO_DECODE_CLASS,
 		.instance = 2,
 		.mmio_bases = {
@@ -97,7 +95,6 @@ static const struct engine_info intel_engines[] = {
 		},
 	},
 	[VCS3] = {
-		.hw_id = VCS3_HW,
 		.class = VIDEO_DECODE_CLASS,
 		.instance = 3,
 		.mmio_bases = {
@@ -114,7 +111,6 @@ static const struct engine_info intel_engines[] = {
 		},
 	},
 	[VECS1] = {
-		.hw_id = VECS1_HW,
 		.class = VIDEO_ENHANCEMENT_CLASS,
 		.instance = 1,
 		.mmio_bases = {
diff --git a/drivers/gpu/drm/i915/gt/intel_engine_types.h b/drivers/gpu/drm/i915/gt/intel_engine_types.h
index 1cb9c3b70b29..a107eb58ffa2 100644
--- a/drivers/gpu/drm/i915/gt/intel_engine_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_engine_types.h
@@ -34,10 +34,6 @@
 #define VCS0_HW		1
 #define BCS0_HW		2
 #define VECS0_HW	3
-#define VCS1_HW		4
-#define VCS2_HW		6
-#define VCS3_HW		7
-#define VECS1_HW	12
 
 /* Gen11+ HW Engine class + instance */
 #define RENDER_CLASS		0
-- 
2.31.1

