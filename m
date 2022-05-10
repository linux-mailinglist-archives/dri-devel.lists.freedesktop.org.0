Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 906BA52127A
	for <lists+dri-devel@lfdr.de>; Tue, 10 May 2022 12:43:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 618FA10E170;
	Tue, 10 May 2022 10:43:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD1C710E35B;
 Tue, 10 May 2022 10:43:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652179424; x=1683715424;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=tB4uLRME3PUAds1LwM5IxIPN/1RmiiXuYmIUkg6WBGg=;
 b=mHU7W9YT26NuQrx7zNxiL2bdZFKwoEL7GIYvt5tXCFLwhxHVgHk1K03q
 lsnQTmmnyW6faJQ9MmYifpwCGDS3BBqwFFI2YhFeeig55fKqHpxM4txBz
 y2lGXH6Qv+Ba6joyWyoYYVTypYAKKgmqhv/W8YhSlix+BS5viCalf67xF
 MDYnsjHS8Rf2tBDQtrFMkq2B83J0DbvbU0piL2OXvbyHkLao4ZxJFpTAZ
 dMHEO8t2BoXW/ptPy/TOF2V+nrWy3/7Ch2/xyO+iXUk9vWkkb8yipxlsI
 ZVybiwEbSJIU9/jLZlvtjYeGPtIczJLCvi3nSR7dMJBTc9L7MHUYa2yyV w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10342"; a="268174186"
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="268174186"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 May 2022 03:43:30 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.91,214,1647327600"; d="scan'208";a="570617859"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.51])
 by fmsmga007.fm.intel.com with SMTP; 10 May 2022 03:43:27 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 10 May 2022 13:43:26 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 14/15] drm/edid: Extract drm_edid_decode_mfg_id()
Date: Tue, 10 May 2022 13:42:41 +0300
Message-Id: <20220510104242.6099-15-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220510104242.6099-1-ville.syrjala@linux.intel.com>
References: <20220510104242.6099-1-ville.syrjala@linux.intel.com>
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
Cc: Jani Nikula <jani.nikula@intel.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Make the PNPID decoding available for other users.

Cc: dri-devel@lists.freedesktop.org
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 include/drm/drm_edid.h | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index c3204a58fb09..e92385a13d2a 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -496,6 +496,22 @@ static inline u8 drm_eld_get_conn_type(const uint8_t *eld)
 	return eld[DRM_ELD_SAD_COUNT_CONN_TYPE] & DRM_ELD_CONN_TYPE_MASK;
 }
 
+/**
+ * drm_edid_decode_mfg_id - Decode the manufacturer ID
+ * @mfg_id: The manufacturer ID
+ * @vend: A 4-byte buffer to store the 3-letter vendor string plus a '\0'
+ *	  termination
+ */
+static inline const char *drm_edid_decode_mfg_id(u16 mfg_id, char vend[4])
+{
+	vend[0] = '@' + ((mfg_id >> 10) & 0x1f);
+	vend[1] = '@' + ((mfg_id >> 5) & 0x1f);
+	vend[2] = '@' + ((mfg_id >> 0) & 0x1f);
+	vend[3] = '\0';
+
+	return vend;
+}
+
 /**
  * drm_edid_encode_panel_id - Encode an ID for matching against drm_edid_get_panel_id()
  * @vend_chr_0: First character of the vendor string.
@@ -536,10 +552,7 @@ static inline u8 drm_eld_get_conn_type(const uint8_t *eld)
 static inline void drm_edid_decode_panel_id(u32 panel_id, char vend[4], u16 *product_id)
 {
 	*product_id = (u16)(panel_id & 0xffff);
-	vend[0] = '@' + ((panel_id >> 26) & 0x1f);
-	vend[1] = '@' + ((panel_id >> 21) & 0x1f);
-	vend[2] = '@' + ((panel_id >> 16) & 0x1f);
-	vend[3] = '\0';
+	drm_edid_decode_mfg_id(panel_id >> 16, vend);
 }
 
 bool drm_probe_ddc(struct i2c_adapter *adapter);
-- 
2.35.1

