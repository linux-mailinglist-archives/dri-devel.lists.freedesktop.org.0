Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B875380C2E2
	for <lists+dri-devel@lfdr.de>; Mon, 11 Dec 2023 09:16:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB62710E34D;
	Mon, 11 Dec 2023 08:16:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D400310E34C;
 Mon, 11 Dec 2023 08:16:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1702282589; x=1733818589;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=ywo7wd+Xtw6xaZ7BQ+4PbxGvYxNCLgjkctluObVHMX8=;
 b=FER41EjmHF9tUQV8DKuW9TUXmGgajRVd4wM3dPQOc7hckI3gOoBqYE3o
 F+DiPNKm3kTlMmFBg+zGI/GtWzfEz7kTCQqhpu78q87ws8t4eSwzatXS7
 E/lR+cSXK9J4ZtsyMyZ68bRe50hC+tSPop6qeSeLj6KaME3/n7ex3ds/j
 1uS7z7FEdKouHNLc75gAtM4TjIJuI+i8NqPIRCXmU2g7yedB2fFGHglbL
 dYzpwRqlbDOELNd3WqwbeSTfZnipefBZ1viD5CDS2xcaap+15Elu0pbzg
 mXx3uKADP96cSlP0C4BP9fT0a74wjnt2FnNqHeZMyd0EtLk+SChzjP7aI A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="461088724"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; d="scan'208";a="461088724"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Dec 2023 00:16:29 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="766285626"
X-IronPort-AV: E=Sophos;i="6.04,267,1695711600"; d="scan'208";a="766285626"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga007.jf.intel.com with SMTP; 11 Dec 2023 00:16:26 -0800
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 11 Dec 2023 10:16:25 +0200
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 1/2] drm: Don't unref the same fb many times by mistake due to
 deadlock handling
Date: Mon, 11 Dec 2023 10:16:24 +0200
Message-ID: <20231211081625.25704-1-ville.syrjala@linux.intel.com>
X-Mailer: git-send-email 2.41.0
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
Cc: intel-gfx@lists.freedesktop.org, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Ville Syrjälä <ville.syrjala@linux.intel.com>

If we get a deadlock after the fb lookup in drm_mode_page_flip_ioctl()
we proceed to unref the fb and then retry the whole thing from the top.
But we forget to reset the fb pointer back to NULL, and so if we then
get another error during the retry, before the fb lookup, we proceed
the unref the same fb again without having gotten another reference.
The end result is that the fb will (eventually) end up being freed
while it's still in use.

Reset fb to NULL once we've unreffed it to avoid doing it again
until we've done another fb lookup.

This turned out to be pretty easy to hit on a DG2 when doing async
flips (and CONFIG_DEBUG_WW_MUTEX_SLOWPATH=y). The first symptom I
saw that drm_closefb() simply got stuck in a busy loop while walking
the framebuffer list. Fortunately I was able to convince it to oops
instead, and from there it was easier to track down the culprit.

Cc: stable@vger.kernel.org
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/drm_plane.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 9e8e4c60983d..672c655c7a8e 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -1503,6 +1503,7 @@ int drm_mode_page_flip_ioctl(struct drm_device *dev,
 out:
 	if (fb)
 		drm_framebuffer_put(fb);
+	fb = NULL;
 	if (plane->old_fb)
 		drm_framebuffer_put(plane->old_fb);
 	plane->old_fb = NULL;
-- 
2.41.0

