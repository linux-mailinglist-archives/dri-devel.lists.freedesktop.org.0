Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3665D8CFBD1
	for <lists+dri-devel@lfdr.de>; Mon, 27 May 2024 10:43:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF7B410F97D;
	Mon, 27 May 2024 08:43:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="WLClGxnQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F54210EF96;
 Mon, 27 May 2024 08:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1716799389; x=1748335389;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=dNPMe/f+pjUVEjS0qbFeFzxhuh7+5l3O3WZciVoD/E0=;
 b=WLClGxnQAVmbTah7qDyxIMzzAAUV4BkNpAsky0gVUPuwSziRzSlpD7xW
 ME1yl5QWadF+c8Go81a8aZaKGoGLEdegxx8hFcn6qiQOy6MieAgUC6P3+
 rBE8aR5KwKlKanY12cGtRfcbkCfXtasdwOxU+syCkdFyUuTW/loyD3moL
 hw20nwuhu0UklAGiJYgnO3+DiPMcogQ5vyUKhSXzRUBKuJPpXtvHVWVcW
 kfj9wZ6jZ7hHRfazo/Bqj8kbhgsne8AvAX+Qy9Aqiohj7mHUODJa6+KCl
 5vMNNZP+d9Oep0JxXImy8K5CZ7OViL17nsF37d4smqBnF1n94gV32FT20 w==;
X-CSE-ConnectionGUID: MmZc1KgkQMybnxqWupx2aA==
X-CSE-MsgGUID: opm/nM3+TKaZd9+DRTAu2Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11084"; a="13048997"
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="13048997"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 May 2024 01:42:59 -0700
X-CSE-ConnectionGUID: wbdjtc+ISYiHUkn3PmSPpQ==
X-CSE-MsgGUID: uzME2/pQQI2dfHx8dvg+pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,192,1712646000"; d="scan'208";a="34676841"
Received: from srr4-3-linux-101-amanna.iind.intel.com ([10.223.74.76])
 by fmviesa008.fm.intel.com with ESMTP; 27 May 2024 01:42:57 -0700
From: Animesh Manna <animesh.manna@intel.com>
To: intel-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org
Cc: jani.nikula@intel.com, jouni.hogander@intel.com, arun.r.murthy@intel.com
Subject: [PATCH v6 3/6] drm/display: Add missing aux less alpm wake related
 bits
Date: Mon, 27 May 2024 13:56:33 +0530
Message-Id: <20240527082636.1519057-4-animesh.manna@intel.com>
X-Mailer: git-send-email 2.29.0
In-Reply-To: <20240527082636.1519057-1-animesh.manna@intel.com>
References: <20240527082636.1519057-1-animesh.manna@intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Jouni Högander <jouni.hogander@intel.com>

eDP1.5 adds some more bits into DP_RECEIVER_ALPM_CAP and
DP_RECEIVER_ALPM_CONFIG registers. Add definitions for these.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 include/drm/display/drm_dp.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index 906949ca3cee..3317ff88ed59 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -232,6 +232,8 @@
 
 #define DP_RECEIVER_ALPM_CAP		    0x02e   /* eDP 1.4 */
 # define DP_ALPM_CAP			    (1 << 0)
+# define DP_ALPM_PM_STATE_2A_SUPPORT	    (1 << 1) /* eDP 1.5 */
+# define DP_ALPM_AUX_LESS_CAP		    (1 << 2) /* eDP 1.5 */
 
 #define DP_SINK_DEVICE_AUX_FRAME_SYNC_CAP   0x02f   /* eDP 1.4 */
 # define DP_AUX_FRAME_SYNC_CAP		    (1 << 0)
@@ -683,7 +685,8 @@
 
 #define DP_RECEIVER_ALPM_CONFIG		    0x116   /* eDP 1.4 */
 # define DP_ALPM_ENABLE			    (1 << 0)
-# define DP_ALPM_LOCK_ERROR_IRQ_HPD_ENABLE  (1 << 1)
+# define DP_ALPM_LOCK_ERROR_IRQ_HPD_ENABLE  (1 << 1) /* eDP 1.5 */
+# define DP_ALPM_MODE_AUX_LESS		    (1 << 2) /* eDP 1.5 */
 
 #define DP_SINK_DEVICE_AUX_FRAME_SYNC_CONF  0x117   /* eDP 1.4 */
 # define DP_AUX_FRAME_SYNC_ENABLE	    (1 << 0)
-- 
2.29.0

