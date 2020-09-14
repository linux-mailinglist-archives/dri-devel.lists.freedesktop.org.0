Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F2FC2684CE
	for <lists+dri-devel@lfdr.de>; Mon, 14 Sep 2020 08:23:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D91D6E1B5;
	Mon, 14 Sep 2020 06:23:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F8F36E1B3;
 Mon, 14 Sep 2020 06:23:49 +0000 (UTC)
IronPort-SDR: Dy76PvpzM6KmZs7gBXVcKCEc+jOw5VlRpRCiypTrr6gwhetgRge/8eG9dnzFCMwBf7xyvNxzNJ
 Pqpu1+YRfw4Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9743"; a="146769849"
X-IronPort-AV: E=Sophos;i="5.76,425,1592895600"; d="scan'208";a="146769849"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2020 23:23:48 -0700
IronPort-SDR: ZNNjoOKo92NV7z0ykyPEdZD9XmYIjW6cUap/FwF8aDnfnLs5wTNimHC6+Ea8gWO0ZYacB0AKeX
 IUqfZkKAuDEw==
X-IronPort-AV: E=Sophos;i="5.76,425,1592895600"; d="scan'208";a="287536729"
Received: from karthik-2012-client-platform.iind.intel.com ([10.223.74.217])
 by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-SHA;
 13 Sep 2020 23:23:45 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v8 8/8] drm/i915: Enable async flips in i915
Date: Mon, 14 Sep 2020 11:26:33 +0530
Message-Id: <20200914055633.21109-9-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200914055633.21109-1-karthik.b.s@intel.com>
References: <20200914055633.21109-1-karthik.b.s@intel.com>
MIME-Version: 1.0
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
Cc: paulo.r.zanoni@intel.com, michel@daenzer.net,
 Karthik B S <karthik.b.s@intel.com>, dri-devel@lists.freedesktop.org,
 vandita.kulkarni@intel.com, uma.shankar@intel.com, daniel.vetter@intel.com,
 nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable asynchronous flips in i915 for gen9+ platforms.

v2: -Async flip enablement should be a stand alone patch (Paulo)

v3: -Move the patch to the end of the series (Paulo)

v4: -Rebased.

v5: -Rebased.

v6: -Rebased.

v7: -Rebased.

v8: -Rebased.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index b7e24dff0772..453ab23d5451 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -18019,6 +18019,9 @@ static void intel_mode_config_init(struct drm_i915_private *i915)
 
 	mode_config->funcs = &intel_mode_funcs;
 
+	if (INTEL_GEN(i915) >= 9)
+		mode_config->async_page_flip = true;
+
 	/*
 	 * Maximum framebuffer dimensions, chosen to match
 	 * the maximum render engine surface size on gen4+.
-- 
2.22.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
