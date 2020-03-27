Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C72F41951F1
	for <lists+dri-devel@lfdr.de>; Fri, 27 Mar 2020 08:28:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E93AC6E99E;
	Fri, 27 Mar 2020 07:28:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE5936E99E;
 Fri, 27 Mar 2020 07:28:49 +0000 (UTC)
IronPort-SDR: 463yd1xk2glf6uhT+IGraieB2qp6fJx3aNAWs4e0X51t0ewGpNoxraK0QJZ2p7kpk8mbcUOhem
 M+xpaijU3IbQ==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Mar 2020 00:28:49 -0700
IronPort-SDR: L3jDpuecUljYh55P0v+rutEogexKW/GrM5KXfwbWMDeN4Kfzw3CC0BDgTf19GcLHNzVsXYusy8
 /tul0ggL+9pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,311,1580803200"; d="scan'208";a="394292030"
Received: from aburk3x-mobl1.ger.corp.intel.com (HELO
 helsinki.ger.corp.intel.com) ([10.252.26.111])
 by orsmga004.jf.intel.com with ESMTP; 27 Mar 2020 00:28:47 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v8 05/14] drm/i915: Include DP HDR Metadata Infoframe SDP in
 the crtc state dump
Date: Fri, 27 Mar 2020 09:29:08 +0200
Message-Id: <20200327072917.3676391-6-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200327072917.3676391-1-gwan-gyeong.mun@intel.com>
References: <20200327072917.3676391-1-gwan-gyeong.mun@intel.com>
MIME-Version: 1.0
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
Cc: jani.nikula@intel.com, linux-fbdev@vger.kernel.org, uma.shankar@intel.com,
 laurent.pinchart@ideasonboard.com, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dump out the DP HDR Metadata Infoframe SDP in the normal crtc state dump.

HDMI Dynamic Range and Mastering (DRM) infoframe and DP HDR Metadata
Infoframe SDP use the same member variable in infoframes of crtc state.

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index abe9425d815f..ed331f4b78ac 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -13076,6 +13076,9 @@ static void intel_dump_pipe_config(const struct intel_crtc_state *pipe_config,
 	if (pipe_config->infoframes.enable &
 	    intel_hdmi_infoframe_enable(HDMI_INFOFRAME_TYPE_DRM))
 		intel_dump_infoframe(dev_priv, &pipe_config->infoframes.drm);
+	if (pipe_config->infoframes.enable &
+	    intel_hdmi_infoframe_enable(HDMI_PACKET_TYPE_GAMUT_METADATA))
+		intel_dump_infoframe(dev_priv, &pipe_config->infoframes.drm);
 
 	drm_dbg_kms(&dev_priv->drm, "requested mode:\n");
 	drm_mode_debug_printmodeline(&pipe_config->hw.mode);
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
