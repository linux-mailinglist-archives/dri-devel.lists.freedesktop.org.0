Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A4ACAAEF2AC
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 11:08:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5F3510E573;
	Tue,  1 Jul 2025 09:08:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dKb3NS6z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DD8A10E56D;
 Tue,  1 Jul 2025 09:08:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751360931; x=1782896931;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OH714uL0ogjpBUrL5VwRt8735JEkNrCFoxDkeXJkgug=;
 b=dKb3NS6zrqx/MYMll/7SxYC4GG5D3bKpBhBZsjPnLkt/pH+NHYNGGBqi
 9ClqDs7UMj5DC2DwYgRaAoHWogsqGM/PWO3Bpmj4aYd8NgKik37N+5mf/
 H71gHZ4t7dSi6zKEyywDLdiF3h4BuNzdljhbWheJEcAUhrCFCH7x2Fs/i
 SLjTI4mSX9yuEzkbRdwIpKO4sDW2Ciz/oyBw9WuLYylZaAVKqNmWfZSWM
 0xVNEoIWkS+l55q9Rtl0Es8OYqQHM5X3I7372CrSXamdGeyE2cMqpOWMr
 uF1ZsMqOF/t1HWJ3dG7WWuDxO7hdk0pxdCQTsPVYos/Ve3V7m6ZyvFOr0 g==;
X-CSE-ConnectionGUID: 2E4+IYIdRjePegCDPpBEJQ==
X-CSE-MsgGUID: wkHp7KIZSNCYRmx+9l6o5g==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="64218561"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="64218561"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 02:08:50 -0700
X-CSE-ConnectionGUID: HpIVcd2oQ1q3yzcEK+EAeA==
X-CSE-MsgGUID: WbZ5+zv6SGeNEgld2mPEcw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="159427285"
Received: from zzombora-mobl1.ger.corp.intel.com (HELO stinkbox)
 ([10.245.245.11])
 by orviesa005.jf.intel.com with SMTP; 01 Jul 2025 02:08:48 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 01 Jul 2025 12:08:46 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Liviu Dudau <liviu.dudau@arm.com>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 14/19] drm/komeda: Pass along the format info from
 .fb_create() to drm_helper_mode_fill_fb_struct()
Date: Tue,  1 Jul 2025 12:07:17 +0300
Message-ID: <20250701090722.13645-15-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250701090722.13645-1-ville.syrjala@linux.intel.com>
References: <20250701090722.13645-1-ville.syrjala@linux.intel.com>
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
Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
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

