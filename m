Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 585134E5E68
	for <lists+dri-devel@lfdr.de>; Thu, 24 Mar 2022 07:02:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E78510E1E5;
	Thu, 24 Mar 2022 06:01:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3BAB10E198;
 Thu, 24 Mar 2022 06:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648101713; x=1679637713;
 h=from:to:cc:subject:date:message-id:in-reply-to: references;
 bh=4EkRrEkFTgkOjfmRXgbne2YXQ+qZ1rLI365rc7YDlRM=;
 b=czYcUrRnIrZT/oBV9kEgP/8lERV2eMsO1u13bWm/lkU1xUkMdEFqF8iZ
 a0vj4QMAtSuBtn+RXo2aoCAkqGHl0Vxf22eFHqv2NV+Mie7n4/Y9OZN4H
 jHMbZNGZqEVigW+6DeE62h+9VFdoo82PrjDG5qHZNJr5WUredIl56OlPz
 1gPZnOdv6RznaTOwU9WfKF02Dj4zLXO+glBS2mfppiG8b+9Z25z/PwL3p
 v2ZkIDzM+wXpB9910+XXimOqWTpmvmSCGdWwNcJNez0YhDGm/JSEbU71S
 fhBZr/AtX/A0ez1HzFu1nFRjsVv8VAXXpZ8qQRDLsMoWl1OBYX7ifU20f g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10295"; a="240452910"
X-IronPort-AV: E=Sophos;i="5.90,206,1643702400"; d="scan'208";a="240452910"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Mar 2022 23:01:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,206,1643702400"; d="scan'208";a="786050551"
Received: from shawnle1-build-machine.itwn.intel.com ([10.5.253.78])
 by fmsmga006.fm.intel.com with ESMTP; 23 Mar 2022 23:01:51 -0700
From: Lee Shawn C <shawn.c.lee@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [v3] drm/edid: check basic audio support on CEA extension block
Date: Thu, 24 Mar 2022 14:16:35 +0800
Message-Id: <20220324061635.328-1-shawn.c.lee@intel.com>
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
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Shawn C Lee <shawn.c.lee@intel.com>, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Cooper Chiou <cooper.chiou@intel.com>

Tag code stored in bit7:5 for CTA block byte[3] is not the same as
CEA extension block definition. Only check CEA block has
basic audio support.

v3: update commit message.

Cc: stable@vger.kernel.org
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Shawn C Lee <shawn.c.lee@intel.com>
Cc: intel-gfx <intel-gfx@lists.freedesktop.org>
Signed-off-by: Cooper Chiou <cooper.chiou@intel.com>
Signed-off-by: Lee Shawn C <shawn.c.lee@intel.com>
Fixes: e28ad544f462 ("drm/edid: parse CEA blocks embedded in DisplayID")
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
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

