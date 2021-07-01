Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90ADF3B9735
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jul 2021 22:25:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39D136EBC4;
	Thu,  1 Jul 2021 20:25:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90DDE6EB2C;
 Thu,  1 Jul 2021 20:25:21 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6200,9189,10032"; a="208567505"
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="208567505"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 13:25:20 -0700
X-IronPort-AV: E=Sophos;i="5.83,315,1616482800"; d="scan'208";a="644564428"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2021 13:25:19 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 11/53] drm/i915/xehp: Define multicast register ranges
Date: Thu,  1 Jul 2021 13:23:45 -0700
Message-Id: <20210701202427.1547543-12-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.25.4
In-Reply-To: <20210701202427.1547543-1-matthew.d.roper@intel.com>
References: <20210701202427.1547543-1-matthew.d.roper@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Cc: =?UTF-8?q?Jos=C3=A9=20Roberto=20de=20Souza?= <jose.souza@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since we can't steer multicast register reads during ring-based
workaround verification, we need to define the multicast ranges where
failure to steer could potentially cause us to read back from a
fused-off register instance.

As with gen12, we can ignore the multicast ranges that the bspec
describes as 'SQIDI' since all instances of those registers will always
be present and we'll always be able to read back a workaround value that
was written with multicast.

Bspec: 66534
Cc: José Roberto de Souza <jose.souza@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/intel_workarounds.c | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/intel_workarounds.c b/drivers/gpu/drm/i915/gt/intel_workarounds.c
index d9a5a445ceec..20c6ca28e407 100644
--- a/drivers/gpu/drm/i915/gt/intel_workarounds.c
+++ b/drivers/gpu/drm/i915/gt/intel_workarounds.c
@@ -2089,12 +2089,30 @@ static const struct mcr_range mcr_ranges_gen12[] = {
 	{},
 };
 
+static const struct mcr_range mcr_ranges_xehp[] = {
+	{ .start =  0x4000, .end =  0x4aff },
+	{ .start =  0x5200, .end =  0x52ff },
+	{ .start =  0x5400, .end =  0x7fff },
+	{ .start =  0x8140, .end =  0x815f },
+	{ .start =  0x8c80, .end =  0x8dff },
+	{ .start =  0x94d0, .end =  0x955f },
+	{ .start =  0x9680, .end =  0x96ff },
+	{ .start =  0xb000, .end =  0xb3ff },
+	{ .start =  0xc800, .end =  0xcfff },
+	{ .start =  0xd800, .end =  0xd8ff },
+	{ .start =  0xdc00, .end =  0xffff },
+	{ .start = 0x17000, .end = 0x17fff },
+	{ .start = 0x24a00, .end = 0x24a7f },
+};
+
 static bool mcr_range(struct drm_i915_private *i915, u32 offset)
 {
 	const struct mcr_range *mcr_ranges;
 	int i;
 
-	if (GRAPHICS_VER(i915) >= 12)
+	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 50))
+		mcr_ranges = mcr_ranges_xehp;
+	else if (GRAPHICS_VER(i915) >= 12)
 		mcr_ranges = mcr_ranges_gen12;
 	else if (GRAPHICS_VER(i915) >= 8)
 		mcr_ranges = mcr_ranges_gen8;
-- 
2.25.4

