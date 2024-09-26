Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 86D09987479
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 15:33:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F96610EB45;
	Thu, 26 Sep 2024 13:33:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="haCQZjHI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1188810EB45
 for <dri-devel@lists.freedesktop.org>; Thu, 26 Sep 2024 13:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727357585; x=1758893585;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=YOgC32gAmpeXbxPkVnLE/oUOJEOVfJhzmIJefnPP7c0=;
 b=haCQZjHIb8XRloyZai7GN+UfiGXURAQL9SJQQlM4l6ARnanXBO45OyYj
 ggQjY5XyJK3MTcsjFd59ZdQ56KaefeRIG7IYtzRZTEORXLoS+Lnq2aSAr
 kUuTXmaPuXtNW8AZ9x78QFwiVChfvPELyFaL5aDd9Ron5BZI5A63x/kx8
 sMLLpetqXmkVG9wHTKE4jaE/9LuS0KT0ooT1Ft7W9p2/FxTlcFpUjxxPe
 EZVyzjbgAaO6nDA45KAEpzKNMS9bJC/c6DHQUPX8KNVEffw92C5ueXLw7
 Tk900hdBM80lpQqCumT8DbDPUGLX03OkR/JL09MYnRoPUqHhCvbzoHrST g==;
X-CSE-ConnectionGUID: KkAmB6/ARy2ppq9+XCQ12g==
X-CSE-MsgGUID: pPPCR1FmRuy4QGY7DsxX4A==
X-IronPort-AV: E=McAfee;i="6700,10204,11207"; a="37831732"
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; d="scan'208";a="37831732"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 06:33:05 -0700
X-CSE-ConnectionGUID: HLBFofWbRaKHthtU8SRT7A==
X-CSE-MsgGUID: OFY6ENobTTa4DmnRK8ovaA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; d="scan'208";a="76237598"
Received: from tassilo.jf.intel.com ([10.54.38.190])
 by fmviesa003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Sep 2024 06:33:04 -0700
From: Andi Kleen <ak@linux.intel.com>
To: maarten.lankhorst@linux.intel.com
Cc: mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
 simona@ffwll.ch, dri-devel@lists.freedesktop.org,
 Andi Kleen <ak@linux.intel.com>
Subject: [PATCH] drm: Print bad EDID notices only once
Date: Thu, 26 Sep 2024 06:32:53 -0700
Message-ID: <20240926133253.2623342-1-ak@linux.intel.com>
X-Mailer: git-send-email 2.46.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I have an old monitor that reports a zero EDID block, which results in a
warning message. This happens on every screen save cycle, and maybe in
some other situations, and over time the whole kernel log gets filled
with these redundant messages. Printing it only once should be
sufficient.

Mark all the bad EDID notices as _once.

Signed-off-by: Andi Kleen <ak@linux.intel.com>
---
 drivers/gpu/drm/drm_edid.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 855beafb76ff..d6b47bdcd5d7 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1916,10 +1916,10 @@ static void edid_block_status_print(enum edid_block_status status,
 		pr_debug("EDID block %d pointer is NULL\n", block_num);
 		break;
 	case EDID_BLOCK_ZERO:
-		pr_notice("EDID block %d is all zeroes\n", block_num);
+		pr_notice_once("EDID block %d is all zeroes\n", block_num);
 		break;
 	case EDID_BLOCK_HEADER_CORRUPT:
-		pr_notice("EDID has corrupt header\n");
+		pr_notice_once("EDID has corrupt header\n");
 		break;
 	case EDID_BLOCK_HEADER_REPAIR:
 		pr_debug("EDID corrupt header needs repair\n");
@@ -1933,13 +1933,13 @@ static void edid_block_status_print(enum edid_block_status status,
 				 block_num, edid_block_tag(block),
 				 edid_block_compute_checksum(block));
 		} else {
-			pr_notice("EDID block %d (tag 0x%02x) checksum is invalid, remainder is %d\n",
+			pr_notice_once("EDID block %d (tag 0x%02x) checksum is invalid, remainder is %d\n",
 				  block_num, edid_block_tag(block),
 				  edid_block_compute_checksum(block));
 		}
 		break;
 	case EDID_BLOCK_VERSION:
-		pr_notice("EDID has major version %d, instead of 1\n",
+		pr_notice_once("EDID has major version %d, instead of 1\n",
 			  block->version);
 		break;
 	default:
-- 
2.46.1

