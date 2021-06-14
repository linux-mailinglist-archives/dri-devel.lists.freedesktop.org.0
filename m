Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E4A53A5F0F
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jun 2021 11:22:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A061089D7C;
	Mon, 14 Jun 2021 09:22:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E3B689D7C;
 Mon, 14 Jun 2021 09:22:46 +0000 (UTC)
IronPort-SDR: wr0fOOcYSItQl30/QwfmGIMxyNA8evWSrqChBgL3aHRAin4AqWjLYB9Lo6DS8CU5ytMQRCZkyp
 +XUU1G0BNPfg==
X-IronPort-AV: E=McAfee;i="6200,9189,10014"; a="203951066"
X-IronPort-AV: E=Sophos;i="5.83,273,1616482800"; d="scan'208";a="203951066"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2021 02:22:45 -0700
IronPort-SDR: LGdL2WJWiMGi8tfogDPnOidkW/PIhK9wmi5QYs+UVC8cC2mQU1rBs2hTADiiS32iYBFItAZ57T
 nFE0dTj/Um1w==
X-IronPort-AV: E=Sophos;i="5.83,273,1616482800"; d="scan'208";a="403835129"
Received: from chanily-mobl.ger.corp.intel.com (HELO mwauld-desk1.intel.com)
 ([10.252.31.39])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Jun 2021 02:22:43 -0700
From: Matthew Auld <matthew.auld@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915: allow DG1 autoprobe for CONFIG_BROKEN
Date: Mon, 14 Jun 2021 10:22:27 +0100
Message-Id: <20210614092227.97421-1-matthew.auld@intel.com>
X-Mailer: git-send-email 2.26.3
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
Cc: =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Purely for CI so we can get some pre-merge results for DG1. This is
especially useful for cross driver TTM changes where CI can hopefully
catch regressions. This is similar to how we already handle the DG1
specific uAPI, which are also hidden behind CONFIG_BROKEN.

Signed-off-by: Matthew Auld <matthew.auld@intel.com>
Cc: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Dave Airlie <airlied@gmail.com>
---
 drivers/gpu/drm/i915/i915_pci.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index 83b500bb170c..78742157aaa3 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -1040,6 +1040,9 @@ static const struct pci_device_id pciidlist[] = {
 	INTEL_RKL_IDS(&rkl_info),
 	INTEL_ADLS_IDS(&adl_s_info),
 	INTEL_ADLP_IDS(&adl_p_info),
+#if IS_ENABLED(CONFIG_DRM_I915_UNSTABLE_FAKE_LMEM)
+	INTEL_DG1_IDS(&dg1_info),
+#endif
 	{0, 0, 0}
 };
 MODULE_DEVICE_TABLE(pci, pciidlist);
-- 
2.26.3

