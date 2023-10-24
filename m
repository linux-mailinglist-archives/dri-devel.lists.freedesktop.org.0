Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85A087D570E
	for <lists+dri-devel@lfdr.de>; Tue, 24 Oct 2023 17:57:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66D9210E0B9;
	Tue, 24 Oct 2023 15:57:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82B9A10E0C9;
 Tue, 24 Oct 2023 15:57:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1698163067; x=1729699067;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=CGHK9hVViLLRXP1qkBxDzBZsDUdNwG2+XztuBNrzymU=;
 b=dYm6W+TioAhJprMmfDWw9LJwR2KUqpOCCeXWaSbKWDmnxHZ7K2Tb/VOQ
 sQguHy8+e8VX5wg/0fTi7ujETNqzqFZJQY1w7Id/FTIF7ILp612suSnxx
 xB5Qe3gYKMXvlyvLnnUbCyhDbhVfUKeL4fBMF6ZDF8zH/twgMIYBOWoYy
 Zx8BgliFATA3/46Te4J27pPtPAuv8cSu2yEdBpubS6MaIcZcfs3ywFED9
 t3546oJBY3AoOueaM1TpHJhWeBpNyA8tb+Oue0pYQYr7Jed85Br7sjB9+
 K0+cynmWc3G1pp1pMLxr4+Wz2ziYrQuyTpCjcPkBTuvEWxnSSzaEyH6iS g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="8649783"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; 
   d="scan'208";a="8649783"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Oct 2023 08:57:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="902233850"
X-IronPort-AV: E=Sophos;i="6.03,248,1694761200"; d="scan'208";a="902233850"
Received: from black.fi.intel.com ([10.237.72.28])
 by fmsmga001.fm.intel.com with ESMTP; 24 Oct 2023 08:55:22 -0700
Received: by black.fi.intel.com (Postfix, from userid 1003)
 id 094E814F; Tue, 24 Oct 2023 18:57:41 +0300 (EEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, intel-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/7] drm/i915/dsi: Replace while(1) with one with clear
 exit condition
Date: Tue, 24 Oct 2023 18:57:33 +0300
Message-Id: <20231024155739.3861342-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.40.0.1.gaa8946217a0b
In-Reply-To: <20231024155739.3861342-1-andriy.shevchenko@linux.intel.com>
References: <20231024155739.3861342-1-andriy.shevchenko@linux.intel.com>
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
 Hans de Goede <hdegoede@redhat.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Move existing condition to while(), so it will be clear on what
circumstances the loop is successfully finishing.

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_dsi_vbt.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
index 24b2cbcfc1ef..a6a6f1814967 100644
--- a/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
+++ b/drivers/gpu/drm/i915/display/intel_dsi_vbt.c
@@ -707,13 +707,10 @@ static void intel_dsi_vbt_exec(struct intel_dsi *intel_dsi,
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

