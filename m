Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 635A389CC3D
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 21:06:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC2CE10F874;
	Mon,  8 Apr 2024 19:06:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="A35BH2al";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B345F112942;
 Mon,  8 Apr 2024 19:06:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712603190; x=1744139190;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=qd2mOofz2eNc9Qw85grCoUgsywew+5chLlSHFR0+KIs=;
 b=A35BH2alasEDpputHisD+xESKerXFDh3+oeXhzUw5ot4mvFJFvZywJF9
 0LbyD419H8VdvzTwIc5Z9RkcohzGNGo8GjqcV7lTYDQ6lgfrKx4+qfjIC
 s8cw6MH4Kejx9/4KbIKdZlCHqzFW2Cm3RtCNiUbQvFtY5ZX7Iq7fDEViO
 6DBjRxaKNwUzqgc5bTYJO1IFp5MraFP39qHV8jT/mNQlzRfDcoIlCw8rb
 kW7OHyIg5R5TLtdRvCB9mTvmIKb6ZBF1cjjCB8oi4noFOtCa79RpBXS1J
 K8EwqRO3qHevwMmSqJRXhAD8wcr4iipLfZF3bfZpr4BD7KOs7PZRJhQwV Q==;
X-CSE-ConnectionGUID: tPDeHazjTIiSwJF9MueA7g==
X-CSE-MsgGUID: qIE34v9zQFiC8KqcKHxb7Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="19278651"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="19278651"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 12:06:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="827792380"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="827792380"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 08 Apr 2024 12:06:26 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 08 Apr 2024 22:06:25 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 =?UTF-8?q?Ma=C3=ADra=20Canal?= <mairacanal@riseup.net>,
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 5/5] drm/vkms: Use drm_crtc_vblank_crtc()
Date: Mon,  8 Apr 2024 22:06:11 +0300
Message-ID: <20240408190611.24914-5-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.43.2
In-Reply-To: <20240408190611.24914-1-ville.syrjala@linux.intel.com>
References: <20240408190611.24914-1-ville.syrjala@linux.intel.com>
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

Replace the open coded drm_crtc_vblank_crtc() with the real
thing.

Cc: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>
Cc: Melissa Wen <melissa.srw@gmail.com>
Cc: "Maíra Canal" <mairacanal@riseup.net>
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/vkms/vkms_crtc.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index 61e500b8c9da..40b4d084e3ce 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -61,9 +61,7 @@ static enum hrtimer_restart vkms_vblank_simulate(struct hrtimer *timer)
 
 static int vkms_enable_vblank(struct drm_crtc *crtc)
 {
-	struct drm_device *dev = crtc->dev;
-	unsigned int pipe = drm_crtc_index(crtc);
-	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
+	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
 	struct vkms_output *out = drm_crtc_to_vkms_output(crtc);
 
 	drm_calc_timestamping_constants(crtc, &crtc->mode);
@@ -88,10 +86,9 @@ static bool vkms_get_vblank_timestamp(struct drm_crtc *crtc,
 				      bool in_vblank_irq)
 {
 	struct drm_device *dev = crtc->dev;
-	unsigned int pipe = crtc->index;
 	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
 	struct vkms_output *output = &vkmsdev->output;
-	struct drm_vblank_crtc *vblank = &dev->vblank[pipe];
+	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
 
 	if (!READ_ONCE(vblank->enabled)) {
 		*vblank_time = ktime_get();
-- 
2.43.2

