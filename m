Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30330743C30
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 14:51:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F36310E46C;
	Fri, 30 Jun 2023 12:51:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F005210E464;
 Fri, 30 Jun 2023 12:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1688129466; x=1719665466;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4y42pTh9XibSH+4YiOHfWb5JVrl2VSe96evi/Hs1YUE=;
 b=D6jQMaoDosT/+AUlu2noQwQptyEodyv0DAVD6YQtcMIyK9tq7G6ti8z4
 RZF8hbiK9IwaUP5WVf+Wf4NdzjBSzbuXkC0FR+bdZkBo+cHZCn7Q2MH+5
 +We41ggpb+WwkDIRsCYnpQdhyErrfFaWqboXJ5Mki/iJkOR3x+yy8fOae
 v8Qg68S5yPcCg7k+NQ0l0gr+e6Cg6eQRPilzMpLcLsNYZv7HcDA49fu0u
 wkkkAuzvrOsY5Sc4l8FQVmvryxSFM0XFflmV5xYCuvmBbdkXmZb3udu3H
 IZNnaCMyhhMT/m9l5KODvGQpfvkjwciOK52i6dM1nlOoiOI2u3cG4b+Dj A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="361232187"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; d="scan'208";a="361232187"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 05:51:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10756"; a="1048219067"
X-IronPort-AV: E=Sophos;i="6.01,170,1684825200"; d="scan'208";a="1048219067"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2023 05:51:03 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 09/19] drm/display/dp: Fix the DP DSC Receiver cap size
Date: Fri, 30 Jun 2023 18:16:41 +0530
Message-Id: <20230630124652.4140932-10-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230630124652.4140932-1-ankit.k.nautiyal@intel.com>
References: <20230630124652.4140932-1-ankit.k.nautiyal@intel.com>
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
Cc: stanislav.lisovskiy@intel.com, anusha.srivatsa@intel.com,
 navaremanasi@google.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

DP DSC Receiver Capabilities are exposed via DPCD 60h-6Fh.
Fix the DSC RECEIVER CAP SIZE accordingly.

Fixes: ffddc4363c28 ("drm/dp: Add DP DSC DPCD receiver capability size define and missing SHIFT")
Cc: Anusha Srivatsa <anusha.srivatsa@intel.com>
Cc: Manasi Navare <manasi.d.navare@intel.com>
Cc: <stable@vger.kernel.org> # v5.0+

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 include/drm/display/drm_dp.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index 02f2ac4dd2df..e69cece404b3 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -1537,7 +1537,7 @@ enum drm_dp_phy {
 
 #define DP_BRANCH_OUI_HEADER_SIZE	0xc
 #define DP_RECEIVER_CAP_SIZE		0xf
-#define DP_DSC_RECEIVER_CAP_SIZE        0xf
+#define DP_DSC_RECEIVER_CAP_SIZE        0x10 /* DSC Capabilities 0x60 through 0x6F */
 #define EDP_PSR_RECEIVER_CAP_SIZE	2
 #define EDP_DISPLAY_CTL_CAP_SIZE	3
 #define DP_LTTPR_COMMON_CAP_SIZE	8
-- 
2.40.1

