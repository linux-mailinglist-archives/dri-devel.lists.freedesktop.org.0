Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BCF34E90F4
	for <lists+dri-devel@lfdr.de>; Mon, 28 Mar 2022 11:17:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E480D10EA5B;
	Mon, 28 Mar 2022 09:17:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4629610EA5B;
 Mon, 28 Mar 2022 09:17:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1648459066; x=1679995066;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=34wm7PMDXhmWzJ1ooXIZN30UnR2cVvWB6aIqcj4XevI=;
 b=lbae414RYJNDt1FO+wJvSktDAKESe+pHXmBINqTeAL2yYT9QtaGx9jYd
 sIzAps3DwFv0q4ke/uAFbBmZnMRyk/Hac3AZZ5vVEhxOx6J9hTEv/RNZE
 EKFqgih8xBWb8e22OD+CwgRNv9KJ10Zc2VjjIhJqLC2FV9jGxos2SO0Vc
 ruSC2UlKwZUhMt3miqAIUqIKZy/f9D+CI7YsF86OSdnNw5j0Cttly0Z7C
 v6CyoSwO8V8tt+wDAO9i3mQG8xzBsC2l9hEYtYg0PKpqfyRYYmWELiIr4
 IZFwpzjIzSxt6RkyyzVmiDPflqsIlMFriICh2/uv9B4JMNDKY4T5C+9q+ g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10299"; a="319655745"
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="319655745"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 02:17:45 -0700
X-IronPort-AV: E=Sophos;i="5.90,217,1643702400"; d="scan'208";a="502447399"
Received: from aysivtso-mobl.ccr.corp.intel.com (HELO localhost)
 ([10.252.62.56])
 by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Mar 2022 02:17:43 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 02/11] drm/edid: fix reduced blanking support check
Date: Mon, 28 Mar 2022 12:17:16 +0300
Message-Id: <8bb6a4997680685e1a6b8978ac34befd955578f4.1648458971.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1648458971.git.jani.nikula@intel.com>
References: <cover.1648458971.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The reduced blanking bit is valid only for CVT, indicated by display
range limits flags 0x04.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 1b552fe54f38..13d05062d68c 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -2408,7 +2408,7 @@ is_rb(struct detailed_timing *t, void *data)
 	if (!is_display_descriptor(r, EDID_DETAIL_MONITOR_RANGE))
 		return;
 
-	if (r[15] & 0x10)
+	if (r[10] == DRM_EDID_CVT_SUPPORT_FLAG && r[15] & 0x10)
 		*(bool *)data = true;
 }
 
-- 
2.30.2

