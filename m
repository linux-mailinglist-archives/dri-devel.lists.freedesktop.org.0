Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C061B718F3F
	for <lists+dri-devel@lfdr.de>; Thu,  1 Jun 2023 01:55:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B605810E517;
	Wed, 31 May 2023 23:55:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05FA710E129;
 Wed, 31 May 2023 23:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1685577270; x=1717113270;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+udcl7GkglUOwqBqtPikunHOfK6Y/Tqg0Xs/zqCOrZM=;
 b=X/JjdQI0rDzUDqc3MCAmZi61pdrn9WKyNYaZkkfqk0IqZMa3ajwUiSjs
 m+b+sZgdFlUzKu2XQQquQc6lxcb2t1D51LaMRs9g9SpcHfu4ETUeKrk2e
 HWfu7O2y+CZDaCN18bACW5+3/vFHSSwYI/vmYzgQIEL6x6US63M2myhr5
 Z04NKmwySs5Y329bYoBo0Z9T7xZy2zJFkURtqzTu0C0hu11ts5NtKUhVQ
 Tn8Ebip7E+y4kz9og6MJ7BGNcXlzM2KrATUv64Ufzjz6eb/BLKRnXL5B2
 PiHQQgbe7h361DGPZi8WtOPlEf6XsgqAwdYXxxvjPKbwINTG3cj3ayWva Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="335747063"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="335747063"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 16:54:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10727"; a="707109973"
X-IronPort-AV: E=Sophos;i="6.00,207,1681196400"; d="scan'208";a="707109973"
Received: from valcore-skull-1.fm.intel.com ([10.1.27.19])
 by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 31 May 2023 16:54:29 -0700
From: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v5 6/7] drm/i915/mtl/huc: Use the media gt for the HuC getparam
Date: Wed, 31 May 2023 16:54:14 -0700
Message-Id: <20230531235415.1467475-7-daniele.ceraolospurio@intel.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230531235415.1467475-1-daniele.ceraolospurio@intel.com>
References: <20230531235415.1467475-1-daniele.ceraolospurio@intel.com>
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
Cc: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>,
 John Harrison <John.C.Harrison@Intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On MTL, for obvious reasons, HuC is only available on the media tile.
We already disable SW support for HuC on the root gt due to the
absence of VCS engines, but we also need to update the getparam to point
to the HuC struct in the media GT.

Signed-off-by: Daniele Ceraolo Spurio <daniele.ceraolospurio@intel.com>
Cc: John Harrison <John.C.Harrison@Intel.com>
Reviewed-by: John Harrison <John.C.Harrison@Intel.com>
---
 drivers/gpu/drm/i915/i915_getparam.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/i915/i915_getparam.c b/drivers/gpu/drm/i915/i915_getparam.c
index 6f11d7eaa91a..890f2b382bee 100644
--- a/drivers/gpu/drm/i915/i915_getparam.c
+++ b/drivers/gpu/drm/i915/i915_getparam.c
@@ -100,7 +100,11 @@ int i915_getparam_ioctl(struct drm_device *dev, void *data,
 		value = sseu->min_eu_in_pool;
 		break;
 	case I915_PARAM_HUC_STATUS:
-		value = intel_huc_check_status(&to_gt(i915)->uc.huc);
+		/* On platform with a media GT, the HuC is on that GT */
+		if (i915->media_gt)
+			value = intel_huc_check_status(&i915->media_gt->uc.huc);
+		else
+			value = intel_huc_check_status(&to_gt(i915)->uc.huc);
 		if (value < 0)
 			return value;
 		break;
-- 
2.40.0

