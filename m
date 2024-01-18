Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70EA9832235
	for <lists+dri-devel@lfdr.de>; Fri, 19 Jan 2024 00:20:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E513610E930;
	Thu, 18 Jan 2024 23:19:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C92710E92D;
 Thu, 18 Jan 2024 23:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1705619996; x=1737155996;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=AiRsb1h9NwKiQPU+CJQovyxYTdeMA4YDTY2dLwm3+jQ=;
 b=VKw0IX4QEVfJ6j3bsyTKqPcYKSh9QWCKYiBXyp+FolmfM0sUpgL9+Hzg
 yK5fFvBU5tunNLN/FLKDhBKjcyMpMpgQvDoRWp/taA5hJx4NjE0GdRODj
 RlOrtA8B1x175U36DXXbKcpUqpYLw24CRlhnaBAfVmcjNW2dCwZcGKI5N
 l/zLEfhY2q+u5mWSCGUH3N3azwQqTZJ+UTGdv9FHZgxGg2xd6fR7KkgqL
 rqyoWiat1TGqOhxDMZNl0bLtWt/3fT/6R0Bkydyr3uwwVjavN2uJ3TTCw
 GX6Ipt4XFTL3OBC0pMQge11LH89aKQVjTUf6ag706yRt5WEDxA7gnTUpn g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="7296631"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; 
   d="scan'208";a="7296631"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Jan 2024 15:19:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10956"; a="818913009"
X-IronPort-AV: E=Sophos;i="6.05,203,1701158400"; d="scan'208";a="818913009"
Received: from vbelgaum-ubuntu.fm.intel.com ([10.1.27.27])
 by orsmga001.jf.intel.com with ESMTP; 18 Jan 2024 15:19:54 -0800
From: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/i915/mtl: Wake GT before sending H2G message
Date: Thu, 18 Jan 2024 15:17:28 -0800
Message-Id: <20240118231728.3817168-1-vinay.belgaumkar@intel.com>
X-Mailer: git-send-email 2.38.1
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Instead of waiting until the interrupt reaches GuC, we can grab a
forcewake while triggering the H2G interrupt. GEN11_GUC_HOST_INTERRUPT
is inside an "always on" domain with respect to RC6. However, there
could be some delays when platform is entering/exiting some higher
level platform sleep states and a H2G is triggered. A forcewake
ensures those sleep states have been fully exited and further
processing occurs as expected.

This will have an official WA soon so adding a FIXME in the comments.

Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
---
 drivers/gpu/drm/i915/intel_uncore.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/intel_uncore.c b/drivers/gpu/drm/i915/intel_uncore.c
index dfefad5a5fec..121458a31886 100644
--- a/drivers/gpu/drm/i915/intel_uncore.c
+++ b/drivers/gpu/drm/i915/intel_uncore.c
@@ -1800,7 +1800,10 @@ static const struct intel_forcewake_range __mtl_fw_ranges[] = {
 	GEN_FW_RANGE(0x24000, 0x2ffff, 0), /*
 		0x24000 - 0x2407f: always on
 		0x24080 - 0x2ffff: reserved */
-	GEN_FW_RANGE(0x30000, 0x3ffff, FORCEWAKE_GT)
+	GEN_FW_RANGE(0x30000, 0x3ffff, FORCEWAKE_GT),
+	GEN_FW_RANGE(0x40000, 0x1901ec, 0),
+	GEN_FW_RANGE(0x1901f0, 0x1901f0, FORCEWAKE_GT)
+		/* FIXME: WA to wake GT while triggering H2G */
 };
 
 /*
-- 
2.38.1

