Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AD5554591
	for <lists+dri-devel@lfdr.de>; Wed, 22 Jun 2022 13:00:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78C2E10EB6D;
	Wed, 22 Jun 2022 11:00:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8E6810E28A;
 Wed, 22 Jun 2022 11:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1655895621; x=1687431621;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=n4SEc0jyzJMS+D9PeLLWV+3gULHKWjj/IW+riAQLO/A=;
 b=K4tVj3qpczEvXyhm7GLqetQRVHqa3YA0GH7RiS+tZAVkwXwf7bezc7/W
 IuozftF0OcF8srptVJ62nHm3GB4OLpmiQpD/a0h032Mvg+LRMA54u20vw
 EGP6lFr2fjyiGLSIT6m7ecUx8k09iyCAi+wfWdqjKCTdkdZWC5l9tmqDF
 Q3UpmK27l7+am1D+fG/74woWVoywKm3bOX+/zhH9ztWO7OOa5D+g4LuSO
 d1ANgci5bB5DGe44PHXtDyeM1kYCAV/IlsRDNWSZb2YZnrbnWQCEaBz8e
 rRrkH1guPOl4LnsFmYyKyZ+UTnxwtc3bXo3HfcY7MZ5dwhMz7Jm81Zhwk w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10385"; a="281461350"
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="281461350"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 04:00:21 -0700
X-IronPort-AV: E=Sophos;i="5.92,212,1650956400"; d="scan'208";a="615129706"
Received: from snowacki-mobl.ger.corp.intel.com (HELO localhost)
 ([10.252.59.111])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2022 04:00:19 -0700
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v3 12/13] drm/edid: take HF-EEODB extension count into account
Date: Wed, 22 Jun 2022 13:59:26 +0300
Message-Id: <6048bb510e9fe12ed65e39cffa8f6f3ad600504b.1655895388.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <cover.1655895388.git.jani.nikula@intel.com>
References: <cover.1655895388.git.jani.nikula@intel.com>
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

Take the HF-EEODB extension count override into account.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_edid.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index fa3a3e294560..bbc25e3b7220 100644
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

