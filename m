Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AE3A21E560
	for <lists+dri-devel@lfdr.de>; Tue, 14 Jul 2020 03:51:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 959BE6E878;
	Tue, 14 Jul 2020 01:51:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 32A7D6E878;
 Tue, 14 Jul 2020 01:51:01 +0000 (UTC)
IronPort-SDR: ODJT/sgzUunBfYk4LU/JiqUf5krjZnRV0WnJ/PnkCkJ3bzKpeBTZnNgsYuZikt2VAjaO9UBFAn
 hj+6hatiNlNw==
X-IronPort-AV: E=McAfee;i="6000,8403,9681"; a="136245095"
X-IronPort-AV: E=Sophos;i="5.75,349,1589266800"; d="scan'208";a="136245095"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Jul 2020 18:51:00 -0700
IronPort-SDR: I7G9wDHubCxKUN0A3kJ6sM9XNQGdcn/Uj0BHXgjV8wkdDrmvArUgS1CO4dj9Qrq7m6B8HS+LmU
 GdDeGdPy3xVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,349,1589266800"; d="scan'208";a="307680310"
Received: from unknown (HELO karthik-2012-Client-Platform.iind.intel.com)
 ([10.223.74.217])
 by fmsmga004.fm.intel.com with ESMTP; 13 Jul 2020 18:50:58 -0700
From: Karthik B S <karthik.b.s@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v4 5/5] drm/i915: Enable async flips in i915
Date: Tue, 14 Jul 2020 06:57:25 +0530
Message-Id: <20200714012725.18383-6-karthik.b.s@intel.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20200714012725.18383-1-karthik.b.s@intel.com>
References: <20200714012725.18383-1-karthik.b.s@intel.com>
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
Cc: paulo.r.zanoni@intel.com, Karthik B S <karthik.b.s@intel.com>,
 dri-devel@lists.freedesktop.org, vandita.kulkarni@intel.com,
 uma.shankar@intel.com, daniel.vetter@intel.com, nicholas.kazlauskas@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Enable asynchronous flips in i915 for gen9+ platforms.

v2: -Async flip enablement should be a stand alone patch (Paulo)

v3: -Move the patch to the end of the serires (Paulo)

v4: -Rebased.

Signed-off-by: Karthik B S <karthik.b.s@intel.com>
Signed-off-by: Vandita Kulkarni <vandita.kulkarni@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index fe06db9cf38e..c9abba98ad22 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -17886,6 +17886,9 @@ static void intel_mode_config_init(struct drm_i915_private *i915)
 
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
