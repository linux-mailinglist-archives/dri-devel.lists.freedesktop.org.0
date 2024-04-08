Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 139E289CC3B
	for <lists+dri-devel@lfdr.de>; Mon,  8 Apr 2024 21:06:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B6FA112949;
	Mon,  8 Apr 2024 19:06:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KEGRTZpD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AFD010F874;
 Mon,  8 Apr 2024 19:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1712603186; x=1744139186;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=My5Ks8kFnEsyCNsr1i1Bkc0LNiYr8HU1BXwLK6q8ZdQ=;
 b=KEGRTZpDK70PSgqiECAfG7/UMIzAPbwVGET1zrHpSTVhXAaAQ5bvuf51
 iG+/hVmDGREboks/5bakSwAFR/tkq6D+1W9P60r0dbVpIo9ah3bsa353A
 yCOInDJ7leicpQgQbgqYwoKKyY0vMHCYnNUJjhbRc3XPqtTtJ8AQgGcRJ
 kMbGI5qY9bHDMr/b+PqXW3kJzLcfZ5d25qB7+RKbWWvPjblk6+hN1M6kx
 aq9iojjEAb3gqsqY+bxYOldMzoMnjlgrao3DoERxiUHTfboMKzOCz819Q
 g8cxenBEn8ofefnTdW5s8yujFjeLOxqkA37u/feyuQ4pZJ/T1XGRzcHdV w==;
X-CSE-ConnectionGUID: pWfMGgKTSJu/hXZwTTJA4Q==
X-CSE-MsgGUID: LSUueU+YTaOmM+N9MdsL4Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="19278645"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="19278645"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
 by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Apr 2024 12:06:25 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="827792379"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; d="scan'208";a="827792379"
Received: from stinkpipe.fi.intel.com (HELO stinkbox) ([10.237.72.74])
 by orsmga001.jf.intel.com with SMTP; 08 Apr 2024 12:06:22 -0700
Received: by stinkbox (sSMTP sendmail emulation);
 Mon, 08 Apr 2024 22:06:21 +0300
From: Ville Syrjala <ville.syrjala@linux.intel.com>
To: dri-devel@lists.freedesktop.org
Cc: intel-gfx@lists.freedesktop.org, Karol Herbst <kherbst@redhat.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>,
 nouveau@lists.freedesktop.org
Subject: [PATCH 4/5] drm/nouveau: Use drm_crtc_vblank_crtc()
Date: Mon,  8 Apr 2024 22:06:10 +0300
Message-ID: <20240408190611.24914-4-ville.syrjala@linux.intel.com>
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

Cc: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@redhat.com>
Cc: nouveau@lists.freedesktop.org
Signed-off-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
---
 drivers/gpu/drm/nouveau/nouveau_display.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index f28f9a857458..aed5d5b51b43 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -83,7 +83,7 @@ static bool
 nouveau_display_scanoutpos_head(struct drm_crtc *crtc, int *vpos, int *hpos,
 				ktime_t *stime, ktime_t *etime)
 {
-	struct drm_vblank_crtc *vblank = &crtc->dev->vblank[drm_crtc_index(crtc)];
+	struct drm_vblank_crtc *vblank = drm_crtc_vblank_crtc(crtc);
 	struct nvif_head *head = &nouveau_crtc(crtc)->head;
 	struct nvif_head_scanoutpos_v0 args;
 	int retry = 20;
-- 
2.43.2

