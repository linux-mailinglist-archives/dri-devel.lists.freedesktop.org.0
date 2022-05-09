Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EFD551F84A
	for <lists+dri-devel@lfdr.de>; Mon,  9 May 2022 11:31:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BBF810E6CE;
	Mon,  9 May 2022 09:30:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8734D10E659;
 Mon,  9 May 2022 09:30:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652088658; x=1683624658;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=bS3i03loPhRz4S7QF92jY1wgx96SHhDS5CgJGcN+lQY=;
 b=mL2j0v+Q/HFhLwwnCj9AhDyI5+qys804fQTZx3P2NE+qdTmIoI05PAO+
 gwy25cWh7bwk5buHB7SWO5qy2f6ADORnodJGo5PWuCug6HZVX+Ttq8KJ4
 +ujj2Vf5CFs7oqILs7Rdiiwqy0z2U2K/PAMShoneKvP3aW9+qq7mNFp2P
 eiIcwP6DeFXAQN2ClD9liXpn/KhamhybxklymXpHEFgDUjG6ehFC/pnI1
 hP4HwIzKosf5xLOXDOPuRlP2xDE7difbFlt+MElsFHRvsxx05elkj8nBC
 JharFdewC6PjQoKur2GNcl/Iyofs86fBGY1Pk5SOdLjnYtW0LEgJClOoH A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10341"; a="294218309"
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="294218309"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 02:30:50 -0700
X-IronPort-AV: E=Sophos;i="5.91,211,1647327600"; d="scan'208";a="591551230"
Received: from srr4-3-linux-103-aknautiy.iind.intel.com ([10.223.34.160])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2022 02:30:49 -0700
From: Ankit Nautiyal <ankit.k.nautiyal@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH 1/2] drm/edid: Fix minimum bpc supported with DSC1.2 for HDMI
 sink
Date: Mon,  9 May 2022 15:01:29 +0530
Message-Id: <20220509093130.3511032-2-ankit.k.nautiyal@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220509093130.3511032-1-ankit.k.nautiyal@intel.com>
References: <20220509093130.3511032-1-ankit.k.nautiyal@intel.com>
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
Cc: dri-devel@lists.freedesktop.org
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
index 47d121e99201..ce5e23897c9e 100644
--- a/drivers/gpu/drm/drm_edid.c
+++ b/drivers/gpu/drm/drm_edid.c
@@ -5288,7 +5288,8 @@ static void drm_parse_hdmi_forum_scds(struct drm_connector *connector,
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

