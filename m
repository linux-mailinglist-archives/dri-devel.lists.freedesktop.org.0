Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9411258F75F
	for <lists+dri-devel@lfdr.de>; Thu, 11 Aug 2022 07:48:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 003B38BDB0;
	Thu, 11 Aug 2022 05:48:08 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87E7318BAC6
 for <dri-devel@lists.freedesktop.org>; Thu, 11 Aug 2022 05:47:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1660196875; x=1691732875;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ZHyEiSl0OKvhb4AgR6NaatiVZHh6ENhQctE+g5bS7Xc=;
 b=Xtzr8A+Gwp82dL7ky1uKORlh/WrX3xbfzdb0SPN1QztJdjvIrIZClahu
 Rm+1iukRhWgiFvbzbQBUxwmFl9MPUkiUPbdmcJjw57PrQj59YVmZX7Nhz
 NB83HQ/FUAyUmRmZ528W9+pWc7AfbUoJpU4vNjdQaklUdQbIpROoFipP0
 GLR4KZSOamfsyYCKu1DMYnc5KHb6RrCe0D2cCRQHk7Q75vSLKphCRDiWc
 aL+YcP9q+uta82X8mjqxI3SxaGWpoyWpg4zOUz4xU7a97o0Fp2KeIwFHk
 2kL6/4DVrH1Lw4AzQkc2x0ZK8vgmc6ZsUK36ZL8dKjt6LsnhsguRKaIO9 Q==;
X-IronPort-AV: E=McAfee;i="6400,9594,10435"; a="377555980"
X-IronPort-AV: E=Sophos;i="5.93,228,1654585200"; d="scan'208";a="377555980"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2022 22:47:55 -0700
X-IronPort-AV: E=Sophos;i="5.93,228,1654585200"; d="scan'208";a="747690437"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Aug 2022 22:47:53 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/4] drm/edid: Fix minimum bpc supported with DSC1.2 for HDMI
 sink
Date: Thu, 11 Aug 2022 11:17:15 +0530
Message-Id: <20220811054718.2115917-2-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220811054718.2115917-1-ankit.k.nautiyal@intel.com>
References: <20220811054718.2115917-1-ankit.k.nautiyal@intel.com>
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
Cc: uma.shankar@intel.com, swati2.sharma@intel.com, maarten.lankhorst@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

HF-VSDB/SCDB has bits to advertise support for 16, 12 and 10 bpc.
If none of the bits are set, the minimum bpc supported with DSC is 8.

This patch corrects the min bpc supported to be 8, instead of 0.

Fixes: 76ee7b905678 ("drm/edid: Parse DSC1.2 cap fields from HFVSDB block")
Cc: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
Cc: Uma Shankar <uma.shankar@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>

Signed-off-by: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
---
 drivers/gpu/drm/drm_edid.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_edid.c b/drivers/gpu/drm/drm_edid.c
index bbc25e3b7220..cdf10279e1bd 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5770,7 +5770,8 @@ static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
 			else if (hf_scds[11] & DRM_EDID_DSC_10BPC)
 				hdmi_dsc->bpc_supported = 10;
 			else
-				hdmi_dsc->bpc_supported = 0;
+				/* Supports min 8 BPC if DSC1.2 is supported*/
+				hdmi_dsc->bpc_supported = 8;
 
 			dsc_max_frl_rate = (hf_scds[12] & DRM_EDID_DSC_MAX_FRL_RATE_MASK) >> 4;
 			drm_get_max_frl_rate(dsc_max_frl_rate, &hdmi_dsc->max_lanes,
-- 
2.25.1

