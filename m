Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35D47A849FF
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 18:33:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50A4B10EA42;
	Thu, 10 Apr 2025 16:33:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="iaQEsRoV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0393B10EA42;
 Thu, 10 Apr 2025 16:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744302820; x=1775838820;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=4fJiNDL7ZN3xDpIBq+o6h6kkLoegjAj5MpqlC77xpbs=;
 b=iaQEsRoVY/8Life5p+8/zcJoRyrOXCT9llWKp5G53kc9TdJY6Cz0KMxR
 ufLAn8JYJyTlxK+9aAxIpJJwwrfb87NP8X1eFeFdT67ahlQHYAsISzWDp
 +vH1BUPXMQ7w1QXhKuVIi/bgrwVfj0xh1BqbaWjo6+7UtXZMr4Dgwi9yR
 fMswZzQxuMeUgMxBeMFLSIZrGupXk1j5sHmFjlqmmWzh+RxMJYBXfv3Cl
 RhtaRE8inV0XLKLxwXFTINIVgawSmZqFBfwI2B4awjXQ/NS12DzHWLL4e
 T6noXVsv6iF5Ufgg8uDuzp0Xu4EaYUch8uDDlNYvaLdjlwM838hoi0YdS w==;
X-CSE-ConnectionGUID: z/Jfgpk7RYqorOy88K8sAw==
X-CSE-MsgGUID: ZRZIMVG3QoqMhJZwTdleqA==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="57220113"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="57220113"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 09:33:39 -0700
X-CSE-ConnectionGUID: JJ0/u0LOS5GXM3dtJH5YJQ==
X-CSE-MsgGUID: W4BepAmeRM2bAHn1AMhuPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="134129369"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 10 Apr 2025 09:33:38 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 10 Apr 2025 19:33:36 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Liviu Dudau <liviu.dudau@arm.com>
Subject: [PATCH 14/19] drm/komeda: Pass along the format info from
 .fb_create() to drm_helper_mode_fill_fb_struct()
Date: Thu, 10 Apr 2025 19:32:13 +0300
Message-ID: <20250410163218.15130-15-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250410163218.15130-1-ville.syrjala@linux.intel.com>
References: <20250410163218.15130-1-ville.syrjala@linux.intel.com>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

Plumb the format info from .fb_create() all the way to
drm_helper_mode_fill_fb_struct() to avoid the redundant
lookup.

Cc: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
index acd8e505ebc7..901f938aefe0 100644
--- a/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
+++ b/drivers/gpu/drm/arm/display/komeda/komeda_framebuffer.c
@@ -178,7 +178,7 @@ komeda_fb_create(struct drm_device *dev, struct drm_file *file,
 		return ERR_PTR(-EINVAL);
 	}
 
-	drm_helper_mode_fill_fb_struct(dev, &kfb->base, NULL, mode_cmd);
+	drm_helper_mode_fill_fb_struct(dev, &kfb->base, info, mode_cmd);
 
 	if (kfb->base.modifier)
 		ret = komeda_fb_afbc_size_check(kfb, file, mode_cmd);
-- 
2.49.0

