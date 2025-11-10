Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D80C47DD0
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 17:18:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70CC410E447;
	Mon, 10 Nov 2025 16:18:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Bt6elR8Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 366A010E444;
 Mon, 10 Nov 2025 16:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762791520; x=1794327520;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=yRYl+bg0qidiIYgq2+/L8BYxb5gaikePLG3GVPks0Ls=;
 b=Bt6elR8ZIuiVgRcIxsiIZUh7W4nRQYYgkVqWJw15Zwxd61c9hLg4ZTIq
 Esz/g8kakUf1Jw+xKXpKVdDKWIF+yjxtbudcB5cqdi3dBH96fdbKl8t72
 MxmK6OkxlL2OelBTZbzxEYugvAYwarIJ4yKYb6GV6VX3+fbh/vxforXVw
 I7yFaoecNsTg7HBMU6YhYl5mfdiOCVmzmuN7opetcMgC2Hs+yhcyrdQqK
 hmHSF60KCRfpS/GQwIvV6mfKjAnyp71zYc1ZjoMEAtx1WaZ66Ktu91y7o
 QexQZ9g7TgOwJ0eCNEyqfBIw3chjF3V1g5GfmsiirFHsDe6hRx6R2daSZ A==;
X-CSE-ConnectionGUID: YMFYGij5QQeuXGcPK31FuQ==
X-CSE-MsgGUID: FICFIoT2SZK3TfyxOhqRGw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64755493"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="64755493"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 08:18:36 -0800
X-CSE-ConnectionGUID: WjEJcAIeR8aH6MLCTNKOSw==
X-CSE-MsgGUID: yvqkvSpdRoWjWsXSPmpm6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="188351864"
Received: from ettammin-mobl2.ger.corp.intel.com (HELO localhost)
 ([10.245.246.202])
 by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 08:18:33 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 jani.nikula@intel.com, ville.syrjala@linux.intel.com,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 09/24] drm/vblank: pass vblank to drm_handle_vblank_events()
Date: Mon, 10 Nov 2025 18:17:27 +0200
Message-ID: <92cfbf5ee0b8b7c9a4df689b41cc3527d4fde4e4.1762791343.git.jani.nikula@intel.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1762791343.git.jani.nikula@intel.com>
References: <cover.1762791343.git.jani.nikula@intel.com>
MIME-Version: 1.0
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
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

Use the vblank pointer instead of a dev, pipe pair to simplify code.

Signed-off-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_vblank.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_vblank.c b/drivers/gpu/drm/drm_vblank.c
index d2748ed01c34..91bedf8e6ea8 100644
--- a/drivers/gpu/drm/drm_vblank.c
+++ b/drivers/gpu/drm/drm_vblank.c
@@ -1889,8 +1889,10 @@ int drm_wait_vblank_ioctl(struct drm_device *dev, void *data,
 	return ret;
 }
 
-static void drm_handle_vblank_events(struct drm_device *dev, unsigned int pipe)
+static void drm_handle_vblank_events(struct drm_vblank_crtc *vblank)
 {
+	struct drm_device *dev = vblank->dev;
+	unsigned int pipe = vblank->pipe;
 	struct drm_crtc *crtc = drm_crtc_from_index(dev, pipe);
 	bool high_prec = false;
 	struct drm_pending_vblank_event *e, *t;
@@ -1911,7 +1913,7 @@ static void drm_handle_vblank_events(struct drm_device *dev, unsigned int pipe)
 			     e->sequence, seq);
 
 		list_del(&e->base.link);
-		_drm_vblank_put(dev, pipe);
+		drm_vblank_put(vblank);
 		send_vblank_event(dev, e, seq, now);
 	}
 
@@ -1973,7 +1975,7 @@ bool drm_handle_vblank(struct drm_device *dev, unsigned int pipe)
 		       vblank->config.offdelay_ms > 0 &&
 		       !atomic_read(&vblank->refcount));
 
-	drm_handle_vblank_events(dev, pipe);
+	drm_handle_vblank_events(vblank);
 	drm_handle_vblank_works(vblank);
 
 	spin_unlock_irqrestore(&dev->event_lock, irqflags);
-- 
2.47.3

