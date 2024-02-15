Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 988F3856059
	for <lists+dri-devel@lfdr.de>; Thu, 15 Feb 2024 11:56:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 980F710E43B;
	Thu, 15 Feb 2024 10:56:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="eqVViYzs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 568DA10E43B
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Feb 2024 10:56:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1707994613; x=1739530613;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ik7Pd0MNfZXFf7VuZbFLUSyWQSzP8IDEaUNL0W6PhQs=;
 b=eqVViYzsUuH1Ef78/hWPDcsg4NaprGSc17s0Fh9UoCM5rBEbWCFdYQeT
 QmEDFwijGDA6s83fAE4OUHzLOW+3M5iu4PYefQqNkASVO4JLOyu0jJeRf
 kOr1EsSb7UJZULzFk0akhK+jnOAxgybdsXTP7dd4BY3i5rMT+K4hYXA5/
 KjMuOLfLYfBB7grJZl0m4PCwuXWvGUR2COeJruaaEXwYP029tyZA5ELgk
 6LTwy5rM6fhiJ3qLymClW1Cqy4zQxNjrXz4GZq+SwIxUTekbQxukdvGQT
 zXhcIUTP7RLRXvIL0jwuSYoPBcvm2JCkLQGDAKILnj5yeJ//9FSVfY0Ob g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10984"; a="2219689"
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; 
   d="scan'208";a="2219689"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 02:56:53 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,161,1705392000"; d="scan'208";a="26653864"
Received: from marquiz-desk-2.fi.intel.com (HELO jhogande-mobl1.fi.intel.com)
 ([10.237.72.63])
 by fmviesa002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Feb 2024 02:56:51 -0800
From: =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: airlied@gmail.com, daniel@ffwll.ch,
 =?UTF-8?q?Jouni=20H=C3=B6gander?= <jouni.hogander@intel.com>
Subject: [PATCH 1/6] drm/display: Add missing aux less alpm wake related bits
Date: Thu, 15 Feb 2024 12:56:35 +0200
Message-Id: <20240215105635.2399824-1-jouni.hogander@intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

eDP1.5 adds some more bits into DP_RECEIVER_ALPM_CAP and
DP_RECEIVER_ALPM_CONFIG registers. Add definitions for these.

Signed-off-by: Jouni Högander <jouni.hogander@intel.com>
---
 include/drm/display/drm_dp.h | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/include/drm/display/drm_dp.h b/include/drm/display/drm_dp.h
index 281afff6ee4e..fcee8d7c4717 100644
--- a/include/drm/display/drm_dp.h
+++ b/include/drm/display/drm_dp.h
@@ -232,6 +232,8 @@
 
 #define DP_RECEIVER_ALPM_CAP		    0x02e   /* eDP 1.4 */
 # define DP_ALPM_CAP			    (1 << 0)
+# define DP_ALPM_PM_STATE_2A_SUPPORT	    (1 << 1) /* eDP 1.5 */
+# define DP_ALPM_AUX_LESS_CAP		    (1 << 2) /* eDP 1.5 */
 
 #define DP_SINK_DEVICE_AUX_FRAME_SYNC_CAP   0x02f   /* eDP 1.4 */
 # define DP_AUX_FRAME_SYNC_CAP		    (1 << 0)
@@ -677,7 +679,8 @@
 
 #define DP_RECEIVER_ALPM_CONFIG		    0x116   /* eDP 1.4 */
 # define DP_ALPM_ENABLE			    (1 << 0)
-# define DP_ALPM_LOCK_ERROR_IRQ_HPD_ENABLE  (1 << 1)
+# define DP_ALPM_LOCK_ERROR_IRQ_HPD_ENABLE  (1 << 1) /* eDP 1.5 */
+# define DP_ALPM_MODE_AUX_LESS		    (1 << 2) /* eDP 1.5 */
 
 #define DP_SINK_DEVICE_AUX_FRAME_SYNC_CONF  0x117   /* eDP 1.4 */
 # define DP_AUX_FRAME_SYNC_ENABLE	    (1 << 0)
-- 
2.34.1

