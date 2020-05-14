Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B53101D2721
	for <lists+dri-devel@lfdr.de>; Thu, 14 May 2020 08:08:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE51F89294;
	Thu, 14 May 2020 06:07:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7FBA89113;
 Thu, 14 May 2020 06:07:45 +0000 (UTC)
IronPort-SDR: tPYAUghtSwESQcCvQN2POHmJQwdIaqbBckvO3U8eEZ2KfQFj9kC8F2UkIGlkw5YlSKwYW+AwRO
 di1yhP1lClxA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 May 2020 23:07:45 -0700
IronPort-SDR: awqU3iguvo9jY1AW2biSmkD9hIEzCbtIaNrQcT2H6O5XPMLAwXmIO0YudMxES+TUhbO49WSuzE
 Vk4RHUpicaug==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.73,390,1583222400"; d="scan'208";a="409956986"
Received: from bgodonne-mobl.amr.corp.intel.com (HELO
 helsinki.ger.corp.intel.com) ([10.252.18.167])
 by orsmga004.jf.intel.com with ESMTP; 13 May 2020 23:07:43 -0700
From: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
To: intel-gfx@lists.freedesktop.org
Subject: [PATCH v12 04/14] drm/i915: Include HDMI DRM infoframe in the crtc
 state dump
Date: Thu, 14 May 2020 09:07:22 +0300
Message-Id: <20200514060732.3378396-5-gwan-gyeong.mun@intel.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200514060732.3378396-1-gwan-gyeong.mun@intel.com>
References: <20200514060732.3378396-1-gwan-gyeong.mun@intel.com>
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
Cc: linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
 laurent.pinchart@ideasonboard.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Dump out the HDMI Dynamic Range and Mastering (DRM) infoframe in the
normal crtc state dump.

Signed-off-by: Gwan-gyeong Mun <gwan-gyeong.mun@intel.com>
Reviewed-by: Uma Shankar <uma.shankar@intel.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 432b4eeaf9f6..80b1439c0d88 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -13023,6 +13023,9 @@ static void intel_dump_pipe_config(const struct intel_crtc_state *pipe_config,
 	if (pipe_config->infoframes.enable &
 	    intel_hdmi_infoframe_enable(HDMI_INFOFRAME_TYPE_VENDOR))
 		intel_dump_infoframe(dev_priv, &pipe_config->infoframes.hdmi);
+	if (pipe_config->infoframes.enable &
+	    intel_hdmi_infoframe_enable(HDMI_INFOFRAME_TYPE_DRM))
+		intel_dump_infoframe(dev_priv, &pipe_config->infoframes.drm);
 
 	drm_dbg_kms(&dev_priv->drm, "requested mode:\n");
 	drm_mode_debug_printmodeline(&pipe_config->hw.mode);
-- 
2.25.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
