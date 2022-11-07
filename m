Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 059D561FE91
	for <lists+dri-devel@lfdr.de>; Mon,  7 Nov 2022 20:26:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9936210E392;
	Mon,  7 Nov 2022 19:26:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76E0110E37A
 for <dri-devel@lists.freedesktop.org>; Mon,  7 Nov 2022 19:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1667849156; x=1699385156;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=f9STN1h40wlSiMTp21PbvVzTvhlcNYbhKzH5LjJ8lww=;
 b=IjWoUwkhJepYoRViz3zE5tLqFXcdQgoJwpFGskenEhN+B75jw7VxH5i7
 t4oo12sVWFBWcbiUwBy3GXUQNDXkj3199KERE3+9CrslxC311wRUEpPcl
 wFFBnU9oQtfOCfrhs8whHBz1cEryqqjS1jUFOSY2BU0SVadsFon7eEPHP
 ps+cCRpy2QgMk0l5MKpO2XwpkgUG5NSMG+Uf5LtmTTyn49dw3XX+rxYKe
 744Frs1sjbJJrT0YxBePlgo55rm6aRp6byT4N4J+MhboGuDETJa9hsyvS
 QYY5P5y/Fot5IzkANpE9bzkMchYcv8q87X6f9Qgzd25tyFwf7AgphCycg w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="308125566"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="308125566"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2022 11:25:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10524"; a="705009769"
X-IronPort-AV: E=Sophos;i="5.96,145,1665471600"; d="scan'208";a="705009769"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.191])
 by fmsmga004.fm.intel.com with SMTP; 07 Nov 2022 11:25:53 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 07 Nov 2022 21:25:52 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 2/7] drm/hisilicon: Use drm_mode_init() for on-stack modes
Date: Mon,  7 Nov 2022 21:25:40 +0200
Message-Id: <20221107192545.9896-3-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.37.4
In-Reply-To: <20221107192545.9896-1-ville.syrjala@linux.intel.com>
References: <20221107192545.9896-1-ville.syrjala@linux.intel.com>
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
Cc: Xinliang Liu <xinliang.liu@linaro.org>, Tian Tao <tiantao6@hisilicon.com>,
 Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 John Stultz <john.stultz@linaro.org>, Chen Feng <puck.chen@hisilicon.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Initialize on-stack modes with drm_mode_init() to guarantee
no stack garbage in the list head.

Cc: Xinliang Liu <xinliang.liu@linaro.org>
Cc: Tian Tao <tiantao6@hisilicon.com>
Cc: John Stultz <john.stultz@linaro.org>
Cc: Xinwei Kong <kong.kongxinwei@hisilicon.com>
Cc: Chen Feng <puck.chen@hisilicon.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
index a0d5aa727d58..d9978b79828c 100644
--- a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
+++ b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
@@ -658,7 +658,7 @@ static enum drm_mode_status dsi_encoder_mode_valid(struct drm_encoder *encoder,
 		 * reset adj_mode to the mode value each time,
 		 * so we don't adjust the mode twice
 		 */
-		drm_mode_copy(&adj_mode, mode);
+		drm_mode_init(&adj_mode, mode);
 
 		crtc_funcs = crtc->helper_private;
 		if (crtc_funcs && crtc_funcs->mode_fixup)
-- 
2.37.4

