Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 957CA533425
	for <lists+dri-devel@lfdr.de>; Wed, 25 May 2022 01:59:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E343010E400;
	Tue, 24 May 2022 23:59:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FE4D10E29E;
 Tue, 24 May 2022 23:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653436759; x=1684972759;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=rtpJwwAy5VXKeTiRNQKVq843YOp/n/x6dFdM0pYgrJw=;
 b=AGv4BeB92s9a1BIY7wYAcXQW7vK386kqaxMXIzTZ5mrYA1DN4x/ejjuU
 tCd9p8j/tZHNL5sB7ShXpHTviqf1MDZb7A0nY+CL3C6YrH/XzSBwpGMWy
 BbHfV8BNK9HyD45EYgTUZOIxEZDSIberliOuluHUr2m0qTXdtqUdnab+T
 Zu1FP95dLRkndJb1+b0BY1x71tyY8yirlv9NR4bsnbw8wc9B/pNKMqJ1R
 XgS0aQFZzy5Ul3ueabMXO81kJc0Ec9e4BJ2a0MeouQ9VXIjEFpQ68WIOp
 k4L1FHO7KFNFTYL7N9XnuvCzs1z0E/QW5k0gbB8OP7xHpjUj5JTw+5RXm w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10357"; a="255739766"
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; d="scan'208";a="255739766"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 16:59:18 -0700
X-IronPort-AV: E=Sophos;i="5.91,250,1647327600"; d="scan'208";a="676627410"
Received: from mdroper-desk1.fm.intel.com ([10.1.27.134])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 16:59:18 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH] drm/i915/hwconfig: Future-proof platform checks
Date: Tue, 24 May 2022 16:59:06 -0700
Message-Id: <20220524235906.529771-1-matthew.d.roper@intel.com>
X-Mailer: git-send-email 2.35.3
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
Cc: John Harrison <john.c.harrison@intel.com>, dri-devel@lists.freedesktop.org,
 Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

PVC also has a hwconfig table.  Actually the current expectation is that
all future platforms will have hwconfig, so let's just change the
condition to an IP version check so that we don't need to keep updating
this for each new platform that shows up.

Cc: John Harrison <john.c.harrison@intel.com>
Cc: Radhakrishna Sripada <radhakrishna.sripada@intel.com>
Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
---
 drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
index 5aaa3948de74..4781fccc2687 100644
--- a/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
+++ b/drivers/gpu/drm/i915/gt/uc/intel_guc_hwconfig.c
@@ -96,7 +96,7 @@ static bool has_table(struct drm_i915_private *i915)
 {
 	if (IS_ALDERLAKE_P(i915) && !IS_ADLP_N(i915))
 		return true;
-	if (IS_DG2(i915))
+	if (GRAPHICS_VER_FULL(i915) >= IP_VER(12, 55))
 		return true;
 
 	return false;
-- 
2.35.3

