Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECA947DF5FC
	for <lists+dri-devel@lfdr.de>; Thu,  2 Nov 2023 16:13:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 789E110E928;
	Thu,  2 Nov 2023 15:12:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AD7710E909;
 Thu,  2 Nov 2023 15:12:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698937960; x=1730473960;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EwelSoZ61k9tZJuVFvgxr/RQChgXvtfD52YtSTJ+m/s=;
 b=l9Fi5n6o+TfkAU9pkf80VdYNMTzbZlBTHCatc8s/N2egSxm+ccGeublw
 jhMX2+A0HsRhp01YzrBc3KfXMN6wa5sK48y2JCj638ukU9G/uf055xoq7
 izYOv1iRF5u7oT26ijQG/d6UOZJUIZIjNqjmI16xBUPM7+k1D+tHL0M1O
 zMyA9c4FBUuTQ8SNPXfpcrPYV7RoLrHzVVLjghbx+U5fEeob8qh9O5/vk
 xqqFdfRIp1cgfWtVE/tmZci8Nau+d91eT+Y0rnGG4Edyz0cxFszzSwbW0
 7LtBPCdey2ozTR5dxbC7r5BhfY+1a5TCjmtDDrga5l+hvw2A1hX/n9lh1 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="373773464"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="373773464"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2023 08:12:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10882"; a="711174065"
X-IronPort-AV: E=Sophos;i="6.03,271,1694761200"; d="scan'208";a="711174065"
Received: from black.fi.intel.com ([10.237.72.28])
 by orsmga003.jf.intel.com with ESMTP; 02 Nov 2023 08:12:36 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id D074C618; Thu,  2 Nov 2023 17:12:30 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v3 06/15] drm/i915/dsi: Replace while(1) with one with clear
 exit condition
Date: Thu,  2 Nov 2023 17:12:19 +0200
Message-Id: <20231102151228.668842-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20231102151228.668842-1-andriy.shevchenko@linux.intel.com>
References: <20231102151228.668842-1-andriy.shevchenko@linux.intel.com>
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
Cc: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Andi Shyti <andi.shyti@linux.intel.com>, Hans de Goede <hdegoede@redhat.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move existing condition to while(), so it will be clear on what
circumstances the loop is successfully finishing.

Reviewed-by: Andi Shyti <andi.shyti@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
index 4af43cf3cee0..290a112f1b63 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
+++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
@@ -702,13 +702,10 @@ static void intel_dsi_vbt_exec(struct intel_dsi *intel_dsi,
 	if (connector->panel.vbt.dsi.seq_version >= 3)
 		data += 4;
 
-	while (1) {
+	while (*data != MIPI_SEQ_ELEM_END) {
 		u8 operation_byte = *data++;
 		u8 operation_size = 0;
 
-		if (operation_byte == MIPI_SEQ_ELEM_END)
-			break;
-
 		if (operation_byte < ARRAY_SIZE(exec_elem))
 			mipi_elem_exec = exec_elem[operation_byte];
 		else
-- 
2.40.0.1.gaa8946217a0b

