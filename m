Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85E404BB633
	for <lists+dri-devel@lfdr.de>; Fri, 18 Feb 2022 11:04:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F02310EED1;
	Fri, 18 Feb 2022 10:04:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9E4A10EEC7;
 Fri, 18 Feb 2022 10:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1645178687; x=1676714687;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=HgofiklkZU/wUapOOk0VrLsbW7cZXYGKaJuL4jViu/o=;
 b=frEDAdAPpSFd4tE0+TzdF+4Gm55bSb0ra0sP2EqSKCWn6bThDnQQ4S/4
 QOaCZsni508PGf1Zx4XG3/NaeLvq7X7WYg0pzNioevc9mS4EIvYtjANtp
 WkzXTglXY6kvrVE3CV6+pgxjcz1oNCJBlpamaVw7FmbZPA3xwnf4G1lsq
 /UpQu3FmM4NWkymTbjRYAK987Q8F1Jy1QT6dNHNq69lLNjRzmxVcitnpp
 kLTsKwxuetkXvoW96WkBNrAe6IKbjcjRRB7iSbUz9o8XipyDM0EFAwRcu
 lRHPL/wQPRgrvpvCKE/bnDQKKU6Pk04xS0ECO6ztICVGYWXeZcOyQjXAz g==;
X-IronPort-AV: E=McAfee;i="6200,9189,10261"; a="251296831"
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="251296831"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
 by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2022 02:04:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,378,1635231600"; d="scan'208";a="635674026"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.151])
 by fmsmga002.fm.intel.com with SMTP; 18 Feb 2022 02:04:43 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Fri, 18 Feb 2022 12:04:42 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 08/22] drm/hisilicon: Use drm_mode_init() for on-stack modes
Date: Fri, 18 Feb 2022 12:03:49 +0200
Message-Id: <20220218100403.7028-9-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
References: <20220218100403.7028-1-ville.syrjala@linux.intel.com>
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
Cc: Xinliang Liu <xinliang.liu@linaro.org>, Chen Feng <puck.chen@hisilicon.com>,
 intel-gfx@lists.freedesktop.org, Xinwei Kong <kong.kongxinwei@hisilicon.com>,
 Tian Tao <tiantao6@hisilicon.com>
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
index 1d556482bb46..53bd2dbf38cd 100644
--- a/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
+++ b/drivers/gpu/drm/hisilicon/kirin/dw_drm_dsi.c
@@ -657,7 +657,7 @@ static enum drm_mode_status dsi_encoder_mode_valid(struct drm_encoder *encoder,
 		 * reset adj_mode to the mode value each time,
 		 * so we don't adjust the mode twice
 		 */
-		drm_mode_copy(&adj_mode, mode);
+		drm_mode_init(&adj_mode, mode);
 
 		crtc_funcs = crtc->helper_private;
 		if (crtc_funcs && crtc_funcs->mode_fixup)
-- 
2.34.1

