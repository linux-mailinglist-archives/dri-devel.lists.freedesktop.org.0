Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 63AFE6F463D
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 16:39:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C4F510E594;
	Tue,  2 May 2023 14:39:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5294310E594;
 Tue,  2 May 2023 14:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1683038389; x=1714574389;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=ep5rKcbUKd1pNOAj46qTGtt2Th3Lt2JLdcODKkaP1iM=;
 b=L/NOjOim1C/Vo9WNCHtvS+U3GpxkFolHrHh0oHivhAq0hYd8kN2aY5gB
 jGIWxlmZ3+wwiG7A+PwISum6Vrs6VXvMZrabrOaKHVCBxAgZXJOAwRSy+
 3n+/LyX6TWkxpPnlrdJiQMOeURVOVBLjfNt0NHDsGmWKPpwIpx2MqkUbn
 UVDQqClCxznmIkykWGMyTr8ry6pZt4LaxB0mqjvtU+bOMCtR7OQGuB7zw
 uY/rtrggXrnBCQcpDmmNQLOd9MeJDi2Dy9GnAjb98DeTZ8/5tMocGI2OE
 XeeHPXdU+idd4zfdnaUwH8IUwa1iGVyBdxKKZ6b9iFl2BE00Y6ljF5uJK A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="351396971"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; d="scan'208";a="351396971"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 May 2023 07:39:47 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10698"; a="698991848"
X-IronPort-AV: E=Sophos;i="5.99,244,1677571200"; d="scan'208";a="698991848"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.70])
 by fmsmga007.fm.intel.com with SMTP; 02 May 2023 07:39:41 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 02 May 2023 17:39:40 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 09/11] drm/i915: Stop spamming the logs with PLL state
Date: Tue,  2 May 2023 17:39:04 +0300
Message-Id: <20230502143906.2401-10-ville.syrjala@linux.intel.com>
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

encoder->get_config() is not the place where the state
should be dumped. Get rid of the spam.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/i915/display/intel_ddi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
index 51ae1aad7cc7..65e031ff740c 100644
--- a/drivers/gpu/drm/i915/display/intel_ddi.c
+++ b/drivers/gpu/drm/i915/display/intel_ddi.c
@@ -3863,11 +3863,9 @@ static void mtl_ddi_get_config(struct intel_encoder *encoder,
 		crtc_state->port_clock = intel_mtl_tbt_calc_port_clock(encoder);
 	} else if (intel_is_c10phy(i915, phy)) {
 		intel_c10pll_readout_hw_state(encoder, &crtc_state->cx0pll_state.c10);
-		intel_c10pll_dump_hw_state(i915, &crtc_state->cx0pll_state.c10);
 		crtc_state->port_clock = intel_c10pll_calc_port_clock(encoder, &crtc_state->cx0pll_state.c10);
 	} else {
 		intel_c20pll_readout_hw_state(encoder, &crtc_state->cx0pll_state.c20);
-		intel_c20pll_dump_hw_state(i915, &crtc_state->cx0pll_state.c20);
 		crtc_state->port_clock = intel_c20pll_calc_port_clock(encoder, &crtc_state->cx0pll_state.c20);
 	}
 
-- 
2.39.2

