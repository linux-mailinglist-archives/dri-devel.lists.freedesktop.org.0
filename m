Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A3691AEF2BD
	for <lists+dri-devel@lfdr.de>; Tue,  1 Jul 2025 11:09:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76ED210E580;
	Tue,  1 Jul 2025 09:09:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="kHIatlvj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2722910E57F;
 Tue,  1 Jul 2025 09:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751360955; x=1782896955;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=FrfjJJnouuxGCdL2h2tdZJ+mC2yN9qtKD1DgtGHeWDc=;
 b=kHIatlvj8WxW3eFeiK+KMQi0Znf1Dd4ygaXyDWyyKBJJakJLUIp4Q7Ht
 IhR2iHKA0UqZdfxReBvxLUu6ldIiHlILPHz0RMJZa8zvrXI9aZT2jQVwK
 wp+mGMU1NJ1BbL3i4VrsUMuNnLDC+qYFmxCHD0u7LQH+IDAN+Ia0ZLSM5
 CKUTFtKq0ZGgbh6YHv3sJcMLHSu8BJSTA5V+Tly3dy9OouDKr2fbXbjiV
 +Qsp0jQ2nhKWZ917z6l8GY7JIM08sNYABOD1BtPgRTi+u5/BRdeKMOZMs
 mRwylSnfTQBKsHd9dX742qnWgeb9J0O6J/Iiz/0ho7GLxjG7grm9Wkw2D w==;
X-CSE-ConnectionGUID: bMo+boDaSouNfKY49jFjcQ==
X-CSE-MsgGUID: gLspmGn0QvCceYkgY6FhYQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="64218648"
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="64218648"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 01 Jul 2025 02:09:15 -0700
X-CSE-ConnectionGUID: UpzcO0kuTMKFr9qDJXDwZA==
X-CSE-MsgGUID: OX+YrKmWRs2CdRps3ZJEgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,279,1744095600"; d="scan'208";a="159427410"
Received: from zzombora-mobl1.ger.corp.intel.com (HELO stinkbox)
 ([10.245.245.11])
 by orviesa005.jf.intel.com with SMTP; 01 Jul 2025 02:09:12 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Tue, 01 Jul 2025 12:09:10 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Subject: [PATCH v2 19/19] drm: Make passing of format info to
 drm_helper_mode_fill_fb_struct() mandatory
Date: Tue,  1 Jul 2025 12:07:22 +0300
Message-ID: <20250701090722.13645-20-ville.syrjala@linux.intel.com>
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

Now that everyone passes along the format info to
drm_helper_mode_fill_fb_struct() we can make this behaviour
mandatory and drop the extra lookup.

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_modeset_helper.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_modeset_helper.c b/drivers/gpu/drm/drm_modeset_helper.c
index 89ba99970735..988735560570 100644
--- a/drivers/gpu/drm/drm_modeset_helper.c
+++ b/drivers/gpu/drm/drm_modeset_helper.c
@@ -88,8 +88,7 @@ void drm_helper_mode_fill_fb_struct(struct drm_device *dev,
 	int i;
 
 	fb->dev = dev;
-	fb->format = info ? : drm_get_format_info(dev, mode_cmd->pixel_format,
-						  mode_cmd->modifier[0]);
+	fb->format = info;
 	fb->width = mode_cmd->width;
 	fb->height = mode_cmd->height;
 	for (i = 0; i < 4; i++) {
-- 
2.49.0

