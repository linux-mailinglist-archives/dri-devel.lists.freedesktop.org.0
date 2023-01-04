Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 002C465D03E
	for <lists+dri-devel@lfdr.de>; Wed,  4 Jan 2023 11:06:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9936F10E543;
	Wed,  4 Jan 2023 10:06:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06BAB10E548;
 Wed,  4 Jan 2023 10:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1672826787; x=1704362787;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=jKw79yLFqQvPWP3NCpOtnBqOw4lNV5bawrH9mRnF7CI=;
 b=ejBN1EceJls+ALJnaqqNMYwYAkWQVitMH1XBB9LdwbRjbhejvf49HEOJ
 61DZf9XIjTOMt1chEf5nCtaX9gn0OxuUZnrubOiCDCrMYVPJCzFXtrwNA
 nRGUJj172dnvRB/epK2RAs2yrlT7dq53ZkIDgFstLTd3ntRbJGFjemzaV
 d3nLMSuS1cVN5Fel70XCfKWzFiyNIwJkmmeU10w2vn106NMuunAZC83Ve
 /86iAPBXfSV8jiwMefluGW1v7KTfg/J2irZU5Wr6GCY0ii9rYgpfW6eD0
 mukq9VdP+hBXb/ss3wgtQZ1NYyV3oj3tAhSIYOOTAUMQABF+BnlZ+Y5po Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="301588817"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; d="scan'208";a="301588817"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 02:06:26 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10579"; a="762627661"
X-IronPort-AV: E=Sophos;i="5.96,299,1665471600"; d="scan'208";a="762627661"
Received: from mkabdel-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.25.63])
 by fmsmga002-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Jan 2023 02:06:25 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v7 10/22] drm/edid: add helper for HDMI VSDB audio latency
 field length
Date: Wed,  4 Jan 2023 12:05:25 +0200
Message-Id: <da4293203ef2ddeb0bf66a2bfdbc129ab609c543.1672826282.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1672826282.git.jani.nikula@intel.com>
References: <cover.1672826282.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com, intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Add a helper for skipping the HDMI VSDB audio latency fields.

There's a functional change for HDMI VSDB blocks that do not respect the
spec: "I_Latency_Fields_Present shall be zero if Latency_Fields_Present
is zero". We assume this to hold when skipping the latency fields, and
ignore non-zero I_Latency_Fields_Present if Latency_Fields_Present is
zero.

Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index 847076b29594..93067b8dd9f6 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -4695,6 +4695,16 @@ static bool hdmi_vsdb_i_latency_present(const u8 *db)
 	return hdmi_vsdb_latency_present(db) && db[8] & BIT(6);
 }
 
+static int hdmi_vsdb_latency_length(const u8 *db)
+{
+	if (hdmi_vsdb_i_latency_present(db))
+		return 4;
+	else if (hdmi_vsdb_latency_present(db))
+		return 2;
+	else
+		return 0;
+}
+
 /*
  * do_hdmi_vsdb_modes - Parse the HDMI Vendor Specific data block
  * @connector: connector corresponding to the HDMI sink
@@ -4720,13 +4730,7 @@ do_hdmi_vsdb_modes(struct drm_connector *connector, const u8 *db, u8 len)
 	if (!(db[8] & (1 << 5)))
 		goto out;
 
-	/* Latency_Fields_Present */
-	if (db[8] & (1 << 7))
-		offset += 2;
-
-	/* I_Latency_Fields_Present */
-	if (db[8] & (1 << 6))
-		offset += 2;
+	offset += hdmi_vsdb_latency_length(db);
 
 	/* the declared length is not long enough for the 2 first bytes
 	 * of additional video format capabilities */
-- 
2.34.1

