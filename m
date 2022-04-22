Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA9550C087
	for <lists+dri-devel@lfdr.de>; Fri, 22 Apr 2022 21:50:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 135E610E66B;
	Fri, 22 Apr 2022 19:50:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B245E10E626;
 Fri, 22 Apr 2022 19:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1650657021; x=1682193021;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HVns9C+wVSYG1swLjui8REBT2rszVQsq6+BzuOThcBM=;
 b=cXvZOI5n7UO3S/hHQ+eFyxJb6C7f8BsLGagA61KrHPa1aSXf9SeIBgSE
 BpnZAhD2ERgXD1/DXcrfnRlJRAfplGPaBgSFtMSDGyTt6xImJ3n0y8imy
 709pwA9WUAwCzEXqFq7GYh6ljdG4hwjKB3uZ8xOiRG1JhR4o+s1C9Q1lA
 jbXJ/PnCUKd3geOwHsUUTA+I5NtJZadeIHxGX8+Q+C4N07L3zX4J88F5p
 6Qy/riR2/3XV1cu4R4HZcISsQ3H9vBgS/0fkP4KeMgl8Kvkmnw779Z9T0
 KnehMPUZKvRNZbjKlz64pmEltQ97cQ2LOs0QzY8y7IfJMeo38fmiZ7Zrp g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10324"; a="351219970"
X-IronPort-AV: E=Sophos;i="5.90,282,1643702400"; d="scan'208";a="351219970"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2022 12:50:21 -0700
X-IronPort-AV: E=Sophos;i="5.90,282,1643702400"; d="scan'208";a="672595756"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2022 12:50:20 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 2/2] drm/i915: Xe_HP SDV and DG2 have up to 4 CCS engines
Date: Fri, 22 Apr 2022 12:50:07 -0700
Message-Id: <20220422195007.4019661-3-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220422195007.4019661-1-matthew.d.roper@intel.com>
References: <20220422195007.4019661-1-matthew.d.roper@intel.com>
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
Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>

Cc: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
Reviewed-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/i915_pci.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index b60492826478..7739d6c33481 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -1037,7 +1037,8 @@ static const struct intel_device_info xehpsdv_info = {
 		BIT(RCS0) | BIT(BCS0) |
 		BIT(VECS0) | BIT(VECS1) | BIT(VECS2) | BIT(VECS3) |
 		BIT(VCS0) | BIT(VCS1) | BIT(VCS2) | BIT(VCS3) |
-		BIT(VCS4) | BIT(VCS5) | BIT(VCS6) | BIT(VCS7),
+		BIT(VCS4) | BIT(VCS5) | BIT(VCS6) | BIT(VCS7) |
+		BIT(CCS0) | BIT(CCS1) | BIT(CCS2) | BIT(CCS3),
 	.require_force_probe = 1,
 };
 
@@ -1056,7 +1057,8 @@ static const struct intel_device_info xehpsdv_info = {
 	.platform_engine_mask = \
 		BIT(RCS0) | BIT(BCS0) | \
 		BIT(VECS0) | BIT(VECS1) | \
-		BIT(VCS0) | BIT(VCS2)
+		BIT(VCS0) | BIT(VCS2) | \
+		BIT(CCS0) | BIT(CCS1) | BIT(CCS2) | BIT(CCS3)
 
 static const struct intel_device_info dg2_info = {
 	DG2_FEATURES,
-- 
2.35.1

