Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 380E77E0A2A
	for <lists+dri-devel@lfdr.de>; Fri,  3 Nov 2023 21:19:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E30310EAB3;
	Fri,  3 Nov 2023 20:18:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B9C610EA9C;
 Fri,  3 Nov 2023 20:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699042723; x=1730578723;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fTxFU5Jq+F2HECS3gMhdwvDnSHvLw8vHCQZKqBJV8HQ=;
 b=TdBXR+sPdXzSbMIMOaGcv8wKQjrBnBSKC0V7Ig+KT16QUfQODVs4v32k
 fwV17fb+HG2NzHLA6OuAbbInyva8HBEUzubr++PJaKOhniRSwsvveGQ4A
 exWUfeicK1Rl8BUNNVizpIOzuxZUxnJFGNLzECBMhSAYaVftt+3HrTNRv
 pBAf6yv/j9g/tEUnUp1Pti5VtKiSMPphNIABIXDbwIOiB6T+AKs5LhfgU
 UHFKlO3wafKuivu4g3LouztPs3+abf8eL3Ve7Osrw6quIXtcXShTgjgUC
 oJhoghZG37X11Wjn+xdJab7h6xRGOKU4v5o2HgNvL4BeHPJxVTG9Ee4Y3 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1896081"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; 
   d="scan'208";a="1896081"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2023 13:18:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="832131163"
X-IronPort-AV: E=Sophos;i="6.03,275,1694761200"; d="scan'208";a="832131163"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga004.fm.intel.com with ESMTP; 03 Nov 2023 13:18:38 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id DEFCC65B; Fri,  3 Nov 2023 22:18:33 +0200 (EET)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Jani Nikula <jani.nikula@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 06/16] drm/i915/dsi: Replace while(1) with one with clear
 exit condition
Date: Fri,  3 Nov 2023 22:18:21 +0200
Message-Id: <20231103201831.1037416-7-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20231103201831.1037416-1-andriy.shevchenko@linux.intel.com>
References: <20231103201831.1037416-1-andriy.shevchenko@linux.intel.com>
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
Acked-by: Jani Nikula <jani.nikula@intel.com>
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

