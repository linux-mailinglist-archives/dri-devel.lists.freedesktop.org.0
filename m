Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51141A84A09
	for <lists+dri-devel@lfdr.de>; Thu, 10 Apr 2025 18:34:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98AED10EA26;
	Thu, 10 Apr 2025 16:34:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Wd4JHyTk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DAF3610EA51;
 Thu, 10 Apr 2025 16:34:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1744302841; x=1775838841;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=iXkFpIjkNQupDHIbKTtZG5uBDm4sQMU34vpCb8rCbNQ=;
 b=Wd4JHyTk01C+tcnD69jy2VonxzzyS66a4r6S57IBNUaGMHV2F9cL42kD
 3qibxax5g5Goukh9ujUwd20bU40bVTBOtIgDwICUvRJ8goHbibxZxtHvB
 /SiOMFezzI9c0/ZHi/qdI24PMQcrKgcKP2UXaSjtGGwC98r0oUyN6jlbs
 qqtOz0tIjz/2/FPAAdA5nsTF+/nkKhjqCO/mvp2yEZkvZYsZ/ss2/42Yg
 bUsjlM8YY9QvhLGGroTs8Gezbm0e4cgeMfZGIKTF2a+BR1uSmHUunJsS8
 Tsqg4L06yiyurnrFhdnWyPoZCux8guI6htw4ZYY0JjCA5zhdNL1Y+0PEL A==;
X-CSE-ConnectionGUID: fcCEncVnTLeUrkS4jeRvGQ==
X-CSE-MsgGUID: Iq3bK9jFREiRBC1xzsDeVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11400"; a="57220165"
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="57220165"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2025 09:34:00 -0700
X-CSE-ConnectionGUID: FDBloIzISW+dvK4UH9iHdQ==
X-CSE-MsgGUID: cdvE9WyoS6S4ickvN44/lQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,202,1739865600"; d="scan'208";a="134129442"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orviesa005.jf.intel.com with SMTP; 10 Apr 2025 09:33:59 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Thu, 10 Apr 2025 19:33:57 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org
Subject: [PATCH 19/19] drm: Make passing of format info to
 drm_helper_mode_fill_fb_struct() mandatory
Date: Thu, 10 Apr 2025 19:32:18 +0300
Message-ID: <20250410163218.15130-20-ville.syrjala@linux.intel.com>
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

Now that everyone passes along the format info to
drm_helper_mode_fill_fb_struct() we can make this behaviour
mandatory and drop the extra lookup.

Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_modeset_helper.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_modeset_helper.c b/drivers/gpu/drm/drm_modeset_helper.c
index ae2a83ecb1cf..3c153d420822 100644
--- a/drivers/gpu/drm/drm_modeset_helper.c
+++ b/drivers/gpu/drm/drm_modeset_helper.c
@@ -86,8 +86,7 @@ void drm_helper_mode_fill_fb_struct(struct drm_device *dev,
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

