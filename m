Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 865C27A25C5
	for <lists+dri-devel@lfdr.de>; Fri, 15 Sep 2023 20:31:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C74610E672;
	Fri, 15 Sep 2023 18:31:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 433CF10E66E;
 Fri, 15 Sep 2023 18:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694802654; x=1726338654;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=EBNKzArPXv349cguQR4fY8oUg9L3uz3WXLjap2MYTyk=;
 b=aHy6IfdU0Eg0fkm2ge0F83ZkYs3cPnW9KGuKhQwqWqv/Dg/UFDDxvF5a
 oq8BIp0CA4XyBCo/XNABxQB4JV5n8l5uAgkwEt+c+G8zYwHCpWqBp918b
 YA4TOVidwD51JmU20+ALWYVpuUbk+1jlcMrM6LWeMzyr0EOwPBsY5xa8v
 lehXL6EJuX5JhTWzyvjaadO02k1k6vwmNp16dqPz1SoTvbmmfss+tXtg5
 Ql6EQUBTEbT5zmETX0/9Brvam0wz/Ty1tD7Hdjm39VspRZu/inXqP2+Pm
 YNi+AHFgoJo6Kfugtt1u64wU9Y3SDHd4I12uuVsOPhh43wovK4ZqYhJ49 w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="445789294"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="445789294"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Sep 2023 11:30:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10834"; a="991949761"
X-IronPort-AV: E=Sophos;i="6.02,149,1688454000"; d="scan'208";a="991949761"
Received: from aalteres-desk.fm.intel.com ([10.80.57.53])
 by fmsmga006.fm.intel.com with ESMTP; 15 Sep 2023 11:30:53 -0700
From: Alan Previn <alan.previn.teres.alexis@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v6 2/3] drm/i915/pxp/mtl: Update pxp-firmware packet size
Date: Fri, 15 Sep 2023 11:30:50 -0700
Message-Id: <20230915183051.1232026-3-alan.previn.teres.alexis@intel.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230915183051.1232026-1-alan.previn.teres.alexis@intel.com>
References: <20230915183051.1232026-1-alan.previn.teres.alexis@intel.com>
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
Cc: Vivaik Balasubrawmanian <vivaik.balasubrawmanian@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org,
 Alan Previn <alan.previn.teres.alexis@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update the GSC-fw input/output HECI packet size to match
updated internal fw specs.

Signed-off-by: Alan Previn <alan.previn.teres.alexis@intel.com>
Reviewed-by: Vivaik Balasubrawmanian <vivaik.balasubrawmanian@intel.com>
---
 drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h
index 0165d38fbead..329b4fcdc040 100644
--- a/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h
+++ b/drivers/gpu/drm/i915/pxp/intel_pxp_cmd_interface_43.h
@@ -14,8 +14,8 @@
 #define PXP43_CMDID_NEW_HUC_AUTH 0x0000003F /* MTL+ */
 #define PXP43_CMDID_INIT_SESSION 0x00000036
 
-/* PXP-Packet sizes for MTL's GSCCS-HECI instruction */
-#define PXP43_MAX_HECI_INOUT_SIZE (SZ_32K)
+/* PXP-Packet sizes for MTL's GSCCS-HECI instruction is spec'd at 65K before page alignment*/
+#define PXP43_MAX_HECI_INOUT_SIZE (PAGE_ALIGN(SZ_64K + SZ_1K))
 
 /* PXP-Packet size for MTL's NEW_HUC_AUTH instruction */
 #define PXP43_HUC_AUTH_INOUT_SIZE (SZ_4K)
-- 
2.39.0

