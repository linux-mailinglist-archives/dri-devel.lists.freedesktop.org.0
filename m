Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1482A4E5C2F
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 01:09:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31C5E10E47B;
	Thu, 24 Mar 2022 00:09:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6533210E456;
 Thu, 24 Mar 2022 00:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648080577; x=1679616577;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=vDd32vI4mzc5F5uC4EE9i7SU/I8iRx/aSWPHKpqe7nQ=;
 b=cdPMd7rcKpYNN0w/Gj/+n+jRMn59EqTeTwBqexpEnTXd8knJZFvo5QBy
 jGE/RMTowziKE2/Sgh6iRE5EalS+j9y9dc4RYMKdo9Fv7LJRfYIM47f05
 SrF2nK3T3pQetUVgVuBhzDS/hpLem/k8l9slQhkAmRxuIhzgNq2FM1KfG
 92CN6Oo+MeIVkYQv+Qmd9ibG+GlqqDGFZkIgqXOF3LZuqdMbLvSsM7uVp
 1Hlc1ewuHq1/ywYd2n9sB6esKupkxowsjd0V4Tkpnq/1+p2fIy5SRPw+8
 id7kUpzdqVZ/2vzJS2+nV8c9/pcFNZsxpmVt5jvibCtKZ5uP0N++wzqKc Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10295"; a="257965560"
X-IronPort-AV: E=Sophos;i="5.90,205,1643702400"; d="scan'208";a="257965560"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 17:09:26 -0700
X-IronPort-AV: E=Sophos;i="5.90,205,1643702400"; d="scan'208";a="637663226"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 17:09:25 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/guc: Correctly free guc capture struct on error
Date: Wed, 23 Mar 2022 17:04:39 -0700
Message-Id: <20220324000439.2370440-1-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.25.1
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
Cc: John Harrison <john.c.harrison@intel.com>,
 Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 Alan Previn <alan.previn.teres.alexis@intel.com>,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On error the "new" allocation is not freed, so add the required kfree.

Fixes: 247f8071d5893 ("drm/i915/guc: Pre-allocate output nodes for extraction")
Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: Alan Previn <alan.previn.teres.alexis@intel.com>
Cc: John Harrison <john.c.harrison@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
index afdcbe63e9eb1..c4e25966d3e9f 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_capture.c
@@ -1040,6 +1040,7 @@ guc_capture_alloc_one_node(struct intel_guc *guc)
 		if (!new->reginfo[i].regs) {
 			while (i)
 				kfree(new->reginfo[--i].regs);
+			kfree(new);
 			return NULL;
 		}
 	}
-- 
2.25.1

