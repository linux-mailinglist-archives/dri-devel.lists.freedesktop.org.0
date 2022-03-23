Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C72534E4C49
	for <lists+dri-devel@lfdr.de>; Wed, 23 Mar 2022 06:30:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D1AF10E5E8;
	Wed, 23 Mar 2022 05:30:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D89910E5E8;
 Wed, 23 Mar 2022 05:30:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648013455; x=1679549455;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=g1Px5gall8AndCDCyr3VWLpWw0PPvdxx3qhAAugZMgM=;
 b=hKfaT8aN/JlNyC1u0RORP6OkSbB1b56A8skrEhyNTz+e9qiLlPFyrTJJ
 +bCNCRwV0yexxZfFhkO4nvo5UW/BoiSb27f2kzVcL1utKe+OTMKksfoDT
 LNVt6S6Bpu2rp7+31KanqktQfjRKI6lyVXSRv3olXHf1lEyeIS35xDGT4
 t2By1cAwbjqpI769QRmFabX+S0mGy7bcK7D4SC3yT6GvubA/SqYYsy3vg
 dIjrd2TRrc5K/CztuKOs1JzVWiq51xRqm1OZQ6JQHvTM/e/hLwICal1Rj
 +PyLwNJh8hcf3cv0V2XkykwTLHKKa1qGGuCINuO6NGLuSMNUbgKgMnE2Z A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10294"; a="237967789"
X-IronPort-AV: E=Sophos;i="5.90,203,1643702400"; d="scan'208";a="237967789"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2022 22:30:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,203,1643702400"; d="scan'208";a="560744489"
Received: from shawnle1-build-machine.itwn.intel.com ([10.5.253.78])
 by orsmga008.jf.intel.com with ESMTP; 22 Mar 2022 22:30:53 -0700
From: Lee Shawn C <shawn.c.lee@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [v2] drm/edid: check basic audio support on CEA extension block
Date: Wed, 23 Mar 2022 13:45:32 +0800
Message-Id: <20220323054532.19840-1-shawn.c.lee@intel.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20220321044330.27723-1-cooper.chiou@intel.com>
References: <20220321044330.27723-1-cooper.chiou@intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, Cooper Chiou <cooper.chiou@intel.com>,
 Shawn C Lee <shawn.c.lee@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Cooper Chiou <cooper.chiou@intel.com>

Tag code stored in bit7:5 for CTA block byte[3] is not the same as
CEA extension block definition. Only check CEA block has
basic audio support.

Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Shawn C Lee <shawn.c.lee@intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>
Signed-off-by: Cooper Chiou <cooper.chiou@intel.com>
Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 561f53831e29..f07af6786cec 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4859,7 +4859,8 @@ bool drm_detect_monitor_audio(struct edid *edid)
 	if (!edid_ext)
 		goto end;
 
-	has_audio = ((edid_ext[3] & EDID_BASIC_AUDIO) != 0);
+	has_audio = (edid_ext[0] == CEA_EXT &&
+		    (edid_ext[3] & EDID_BASIC_AUDIO) != 0);
 
 	if (has_audio) {
 		DRM_DEBUG_KMS("Monitor has basic audio support\n");
-- 
2.17.1

