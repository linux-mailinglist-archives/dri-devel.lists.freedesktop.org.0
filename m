Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 17986532804
	for <lists+dri-devel@lfdr.de>; Tue, 24 May 2022 12:41:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F8F010F54F;
	Tue, 24 May 2022 10:41:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AD4910F54F;
 Tue, 24 May 2022 10:41:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1653388865; x=1684924865;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=wo+3CFaO/0urwWplVGx3rR0erSjhHgz5Klcse8I9E04=;
 b=hA7pRN/AftYxSsE8+sEkQ88hQmYQBwH/TJXIvd58WLRd7bqB5HhvC1N1
 zrP1eekrV23jMLIp9mQVe7dddKs/48JxQW47tJFcGMAYrbKl7ETsp1Mlq
 5MGNukSJ4SHyp6DQ4y6O+YgkmMQmwAIGe2UT/9UKaEJkj9uRijQGgkSW5
 HEPgzB+4vY5KKtdacalfqiTcm1ZyOnjZZFB0EL/gdi1KNxEVuaZIlwBGw
 0AT55FEXoB5kBMVrPTclF9BEEVFTyCTooUrxuPCqv9bhHlf7fMEktRInF
 0PXl431B5FxCffgzJlgTNvjwvNKMi+KojNfSJLu99xJgwAxXV7p/4N6Fw A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10356"; a="336548204"
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="336548204"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 03:41:04 -0700
X-IronPort-AV: E=Sophos;i="5.91,248,1647327600"; d="scan'208";a="663858683"
Received: from zychseba-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.136.104])
 by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 May 2022 03:41:02 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org
Subject: [PATCH v1 12/13] drm/edid: take HF-EEODB extension count into account
Date: Tue, 24 May 2022 13:39:34 +0300
Message-Id: <3a37356e6f9ca2bbeb629e6e1d61c3b44a29692c.1653381821.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1653381821.git.jani.nikula@intel.com>
References: <cover.1653381821.git.jani.nikula@intel.com>
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
Cc: jani.nikula@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Take the HF-EEODB extension count override into account.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index ba0c880dc133..6b1284b895eb 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -1629,6 +1629,19 @@ static int drm_edid_block_count(const struct drm_edid *drm_edid)
 	/* Starting point */
 	num_blocks = edid_block_count(drm_edid->edid);
 
+	/* HF-EEODB override */
+	if (drm_edid->size >= edid_size_by_blocks(2)) {
+		int eeodb;
+
+		/*
+		 * Note: HF-EEODB may specify a smaller extension count than the
+		 * regular one. Unlike in buffer allocation, here we can use it.
+		 */
+		eeodb = edid_hfeeodb_block_count(drm_edid->edid);
+		if (eeodb)
+			num_blocks = eeodb;
+	}
+
 	/* Limit by allocated size */
 	num_blocks = min(num_blocks, (int)drm_edid->size / EDID_LENGTH);
 
-- 
2.30.2

