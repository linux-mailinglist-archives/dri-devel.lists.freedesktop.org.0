Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBE694F3CF6
	for <lists+dri-devel@lfdr.de>; Tue,  5 Apr 2022 19:35:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1C6810EDD4;
	Tue,  5 Apr 2022 17:35:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga06.intel.com (mga06.intel.com [134.134.136.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 333A110EDC7;
 Tue,  5 Apr 2022 17:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1649180130; x=1680716130;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=F5CsRy04P7ZdZyjojTCQo9ChClz8SuQhJcBwtp5cbH8=;
 b=BQfRwBX7Sfvd9Di1mSAEaKmdLme37fK5tmPPF8R5ZmwTughaBj5+X2kx
 YJ32xlsuTf3/LYGhNn3/JrOqF2xpd2YC4HxvIAwKCx8nE/D2M6prdH7vS
 ASGjJ13cP8ARnfhruaflyYg7WlgMGT74yAXWmjn2clhe0JDS2UqSUgAOm
 MvuaT2ny2kXqQUaWsUNm5mhBOedbDNFxEEQEmSblwMURQnTVOs8uhHEhb
 Af71bCKVsyTOxZpXXcQ5b3rTBz7xTGY9KI6rRn3FXpMnMbRfTMiq/lryN
 EQ+JSV4O03b2aI7vc/8Xvt86iIhhQcO/YaR5L+9hn6yUEVitqrn86wT+F g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10308"; a="321513782"
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="321513782"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Apr 2022 10:35:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.90,236,1643702400"; d="scan'208";a="556611106"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.51])
 by fmsmga007.fm.intel.com with SMTP; 05 Apr 2022 10:35:13 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 05 Apr 2022 20:35:12 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v2 21/22] drm/edid: Extract drm_edid_decode_mfg_id()
Date: Tue,  5 Apr 2022 20:34:09 +0300
Message-Id: <20220405173410.11436-22-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220405173410.11436-1-ville.syrjala@linux.intel.com>
References: <20220405173410.11436-1-ville.syrjala@linux.intel.com>
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Make the PNPID decoding available for other users.

Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 include/drm/drm_edid.h | 21 +++++++++++++++++----
 1 file changed, 17 insertions(+), 4 deletions(-)

diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index b7e170584000..5e9d7fcda8e7 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -508,6 +508,22 @@ static inline u8 drm_eld_get_conn_type(const uint8_t *eld)
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
@@ -548,10 +564,7 @@ static inline u8 drm_eld_get_conn_type(const uint8_t *eld)
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

