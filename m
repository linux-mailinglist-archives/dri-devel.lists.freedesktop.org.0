Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 39AF270BCBE
	for <lists+dri-devel@lfdr.de>; Mon, 22 May 2023 13:59:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C965E10E2FC;
	Mon, 22 May 2023 11:59:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD4C10E011;
 Mon, 22 May 2023 11:59:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1684756779; x=1716292779;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FKRdg8VmZo13GX+128rG9PWvcW98EFy69cDYg6IojMo=;
 b=NHsbbbiX7OyO5qtH4asF55pXSPEO4lgGUQzsNx0djb4n1x52+1k16CW/
 7M6JxkRs2NOot6svYpGXWA1RMZ/KNJTZvijmoeLrOhq0JedAtY7Tt9f16
 +UuxWmiPAs3BS6LGNNFz/UnYTA1O7A5D7Gmo2wj+v2DmtN0b7THN0Friy
 Wzwy4YUUih3vN6ZfSbZ0zlt8p/29JZASpgLlc1s0wxZ8nFWUQzZbGiFKU
 wB7HW6LpYaxNi0aficQOvvTgm60XeYF0tSSjEX6oyuG2B8Y8q0KQyaAXZ
 EJgOEvA+IVf8L3cZO+N5HVziskqrbT8YlqayEqpzBEnoj6rrvwc+/nSvo Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="351749724"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="351749724"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 04:59:39 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10717"; a="793261523"
X-IronPort-AV: E=Sophos;i="6.00,184,1681196400"; d="scan'208";a="793261523"
Received: from tjepsen-mobl.amr.corp.intel.com (HELO localhost.localdomain)
 ([10.252.45.96])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 May 2023 04:59:38 -0700
From: Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>
To: Intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH 2/4] drm/i915: Record default rps threshold values
Date: Mon, 22 May 2023 12:59:26 +0100
Message-Id: <20230522115928.588793-2-tvrtko.ursulin@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230522115928.588793-1-tvrtko.ursulin@linux.intel.com>
References: <20230522115928.588793-1-tvrtko.ursulin@linux.intel.com>
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
Cc: Rodrigo Vivi <rodrigo.vivi@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Tvrtko Ursulin <tvrtko.ursulin@intel.com>

Record the default values as preparation for exposing the sysfs controls.

Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@intel.com>
Cc: Rodrigo Vivi <rodrigo.vivi@kernel.org>
---
 drivers/gpu/drm/i915/gt/intel_gt_types.h | 3 +++
 drivers/gpu/drm/i915/gt/intel_rps.c      | 2 ++
 2 files changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/gt/intel_gt_types.h b/drivers/gpu/drm/i915/gt/intel_gt_types.h
index f08c2556aa25..1b22d7a50665 100644
--- a/drivers/gpu/drm/i915/gt/intel_gt_types.h
+++ b/drivers/gpu/drm/i915/gt/intel_gt_types.h
@@ -83,6 +83,9 @@ enum intel_submission_method {
 struct gt_defaults {
 	u32 min_freq;
 	u32 max_freq;
+
+	u8 rps_up_threshold;
+	u8 rps_down_threshold;
 };
 
 enum intel_gt_type {
diff --git a/drivers/gpu/drm/i915/gt/intel_rps.c b/drivers/gpu/drm/i915/gt/intel_rps.c
index 791097eb9bfd..333abc8f7ecb 100644
--- a/drivers/gpu/drm/i915/gt/intel_rps.c
+++ b/drivers/gpu/drm/i915/gt/intel_rps.c
@@ -2016,7 +2016,9 @@ void intel_rps_init(struct intel_rps *rps)
 
 	/* Set default thresholds in % */
 	rps->power.up_threshold = 95;
+	rps_to_gt(rps)->defaults.rps_up_threshold = rps->power.up_threshold;
 	rps->power.down_threshold = 85;
+	rps_to_gt(rps)->defaults.rps_down_threshold = rps->power.down_threshold;
 
 	/* Finally allow us to boost to max by default */
 	rps->boost_freq = rps->max_freq;
-- 
2.39.2

