Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CD3098A18E
	for <lists+dri-devel@lfdr.de>; Mon, 30 Sep 2024 14:09:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4307F10E40D;
	Mon, 30 Sep 2024 12:09:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ctHPOOVX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1726510E40C;
 Mon, 30 Sep 2024 12:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1727698186; x=1759234186;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=66Gpn3Z+P9WB7V6XC2MntK3wRYKHyN7IlAHqDWL3r7s=;
 b=ctHPOOVXlReFBKwsYJuvy8YjUChQ5JfbbbPvMI9jUHTriJr7X29ZxsTh
 rNCUfHjD1ZXuV/f9d4we6WaMT7PX9cW90jlZk/YqIGBBpvnie/G7dxfgF
 HmcOeonNYudwmM12ZVpI/carR43xhdcr9tbqlQX0mjEThYomgQex/z/uS
 s1nMOLhM6MkE0nZrTTOBvmatEw6Xzkqdenuugt9EfR1C+ClV0rZCvE0rW
 AxualizsLpaHcGCH+6U6qh2WYLhFJr1Vf7L8kK0SI63NCT8ihtE+ng/3g
 utzQw7J6N02rDu2ZkTZYtLm4trnKEMTFjK2YJecND20cmKcId88Pc5FIK g==;
X-CSE-ConnectionGUID: gYLroGSaSnG2UEiJFX9P4Q==
X-CSE-MsgGUID: g1DHDeO9RpKchyFfA6sOHg==
X-IronPort-AV: E=McAfee;i="6700,10204,11210"; a="14407880"
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="14407880"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 05:09:46 -0700
X-CSE-ConnectionGUID: AiJIV5/uTAGI75st/HVEng==
X-CSE-MsgGUID: 3HZ/FjWGQUWdlxmIwUidsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,165,1725346800"; d="scan'208";a="73247159"
Received: from baradhya-z690i-a-ultra-plus.iind.intel.com ([10.145.169.55])
 by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Sep 2024 05:09:41 -0700
From: Aradhya Bhatia <aradhya.bhatia@intel.com>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: Intel XE List <intel-xe@lists.freedesktop.org>,
 DRI Devel List <dri-devel@lists.freedesktop.org>,
 Linux Kernel List <linux-kernel@vger.kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Matt Roper <matthew.d.roper@intel.com>,
 Tejas Upadhyay <tejas.upadhyay@intel.com>,
 Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>,
 Gustavo Sousa <gustavo.sousa@intel.com>,
 Aradhya Bhatia <aradhya.bhatia@intel.com>
Subject: [PATCH] drm/xe/xe2lpg: Add WA 15016589081
Date: Mon, 30 Sep 2024 17:36:02 +0530
Message-Id: <20240930120602.1720218-1-aradhya.bhatia@intel.com>
X-Mailer: git-send-email 2.34.1
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add workaround (wa) 15016589081 which applies to Xe2_v3_LPG_MD.

Xe2_v3_LPG_MD is a Lunar Lake platform with GFX version: 20.04.
This wa is type: permanent, and hence is applicable on all steppings.

Signed-off-by: Aradhya Bhatia <aradhya.bhatia@intel.com>
---
 drivers/gpu/drm/xe/xe_wa.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
index 22c148b1e996..2f9cde4b7d45 100644
--- a/drivers/gpu/drm/xe/xe_wa.c
+++ b/drivers/gpu/drm/xe/xe_wa.c
@@ -710,6 +710,10 @@ static const struct xe_rtp_entry_sr lrc_was[] = {
 			     DIS_PARTIAL_AUTOSTRIP |
 			     DIS_AUTOSTRIP))
 	},
+	{ XE_RTP_NAME("15016589081"),
+	  XE_RTP_RULES(GRAPHICS_VERSION(2004), ENGINE_CLASS(RENDER)),
+	  XE_RTP_ACTIONS(SET(CHICKEN_RASTER_1, DIS_CLIP_NEGATIVE_BOUNDING_BOX))
+	},
 
 	/* Xe2_HPG */
 	{ XE_RTP_NAME("15010599737"),

base-commit: 0c8650b09a365f4a31fca1d1d1e9d99c56071128
-- 
2.34.1

