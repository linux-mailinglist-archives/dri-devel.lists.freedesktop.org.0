Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3CE46F4631
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 16:39:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23D0910E57C;
	Tue,  2 May 2023 14:39:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8575610E579;
 Tue,  2 May 2023 14:39:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683038360; x=1714574360;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=fj9vzX4IF/JA5GqYvQwRfMOI/+LSj8b0oLjGBvFBBkY=;
 b=W7PJJ8edw64BPn3lvI3kjJEvU3THHzUCdC5l9r8yO3nR2Kjw+zSPQf2t
 ptVAOFqfYUV4RGA7WPCSMivkxqSskbOnkA4liUd/tfM6eDRZGCbohmeqR
 kfUzg4muAHe/S0DOLaKO5s+UroxuV1P30mRvUZT/SJWTu/is+ydtk39l+
 JREb6e6MCIsut9NN5t75LASfRElW0cLTt/cLgbitzFx3guL1wCppzatFD
 e1ojfNdBOe0ckmuG8jgTWJa/wiptGKn0lqymHvkWNiGfBMWLyNw24gciL
 xKEmplix6/5gmQJ6JtmjlwWvHumKQJB/DI/5n1kuV54P9Be0zezPPAL1F g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="351396869"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; d="scan'208";a="351396869"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 07:39:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="698991747"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; d="scan'208";a="698991747"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by fmsmga007.fm.intel.com with SMTP; 02 May 2023 07:39:18 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 02 May 2023 17:39:17 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 03/11] drm/i915/mst: Read out FEC state
Date: Tue,  2 May 2023 17:38:58 +0300
Message-Id: <20230502143906.2401-4-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230502143906.2401-1-ville.syrjala@linux.intel.com>
References: <20230502143906.2401-1-ville.syrjala@linux.intel.com>
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
Cc: intel-gfx@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

The MST codepath is missing FEC readout. Add it.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 55f36d9d509c..41cfa28166e4 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3763,6 +3763,11 @@ static void intel_ddi_read_func_ctl(struct intel_encoder *encoder,
 		intel_cpu_transcoder_get_m1_n1(crtc, cpu_transcoder,
 					       &pipe_config->dp_m_n);
 
+		if (DISPLAY_VER(dev_priv) >= 11)
+			pipe_config->fec_enable =
+				intel_de_read(dev_priv,
+					      dp_tp_ctl_reg(encoder, pipe_config)) & DP_TP_CTL_FEC_ENABLE;
+
 		pipe_config->infoframes.enable |=
 			intel_hdmi_infoframes_enabled(encoder, pipe_config);
 		break;
-- 
2.39.2

