Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1744411E92B
	for <lists+dri-devel@lfdr.de>; Fri, 13 Dec 2019 18:26:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33AC46EB75;
	Fri, 13 Dec 2019 17:26:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E0A46EB6B
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 17:26:30 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id b6so305581wrq.0
 for <dri-devel@lists.freedesktop.org>; Fri, 13 Dec 2019 09:26:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=+V1N6V09AnDWHP5ygK/oqJXsT6Me79yFsJqWmOiifFk=;
 b=YBMnyOLTfxX6KPb1tX4qXf+wH7bhin/8WvLWlfju6Y3hKg5leqiUthtoQdbja94HMK
 1QsxnFgt23VF3CxXx9fXPN78A3bNWCeiP3DFN+vb6JCSrt+uICgwZpBDkpDxhjccjJuq
 P83zlUMIyAfig2lyIvc1cVIHpSSjpay14QRzE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=+V1N6V09AnDWHP5ygK/oqJXsT6Me79yFsJqWmOiifFk=;
 b=fmWo9JWkwQ+W6bM4Z+Nx4bYufrxUI1SNtwgVV8qqqIgGN7X758dzYgGiOmqvUrWOSD
 eG8bk5MAM3DFw/rh9K0Ka+vLI61vJzGM15SGEsFcljBZQ7axO316fAcZkGhPgJhCDCaF
 1HEFnntppZsjo7GJHEnGor9f33Q6Iua/RV2MMIYYF2WMHAHloBTWVr0rlZybBQTt98Fy
 PcbGNCy1zhQ8POENuVxT7EP5TEs8iBPAJIfOCs6OOQHVb0Jn7ljChhe6qaN2hsHtFD/t
 NihQhcrtXN8OR4OCRKNp2FpiNDJ1ENAGMtwbyvh8AZPvu/X2t1ZvlS30ZO5Vc9CDuGh5
 W+BA==
X-Gm-Message-State: APjAAAUAUmoKgjQ6RJnFKjAKRpea7LWFNLsBIFGy7CaWYsV4E5Wsgt4T
 7IT5Nv71FwLrHA177V9eqYJxlwj8zko=
X-Google-Smtp-Source: APXvYqzQW5LghQu4ylCHb2OGId8yVF+jZPfQYcD24aT9rIBNVEVju1GCfSkIw+jQhPBzxZQxeJOHWA==
X-Received: by 2002:adf:e683:: with SMTP id r3mr13917025wrm.38.1576257988718; 
 Fri, 13 Dec 2019 09:26:28 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:564b:0:7567:bb67:3d7f:f863])
 by smtp.gmail.com with ESMTPSA id q15sm10689669wrr.11.2019.12.13.09.26.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2019 09:26:28 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 10/10] drm/zte: plane_state->fb iff plane_state->crtc
Date: Fri, 13 Dec 2019 18:26:12 +0100
Message-Id: <20191213172612.1514842-10-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191213172612.1514842-1-daniel.vetter@ffwll.ch>
References: <20191213172612.1514842-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, Shawn Guo <shawnguo@kernel.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Checking both is one too much, so wrap a WARN_ON around it to stope
the copypasta.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Shawn Guo <shawnguo@kernel.org>
---
 drivers/gpu/drm/zte/zx_plane.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/zte/zx_plane.c b/drivers/gpu/drm/zte/zx_plane.c
index 086c50fac689..c8f7b21fa09e 100644
--- a/drivers/gpu/drm/zte/zx_plane.c
+++ b/drivers/gpu/drm/zte/zx_plane.c
@@ -54,7 +54,7 @@ static int zx_vl_plane_atomic_check(struct drm_plane *plane,
 	int min_scale = FRAC_16_16(1, 8);
 	int max_scale = FRAC_16_16(8, 1);
 
-	if (!crtc || !fb)
+	if (!crtc || WARN_ON(!fb))
 		return 0;
 
 	crtc_state = drm_atomic_get_existing_crtc_state(plane_state->state,
@@ -281,7 +281,7 @@ static int zx_gl_plane_atomic_check(struct drm_plane *plane,
 	struct drm_crtc *crtc = plane_state->crtc;
 	struct drm_crtc_state *crtc_state;
 
-	if (!crtc || !fb)
+	if (!crtc || WARN_ON(!fb))
 		return 0;
 
 	crtc_state = drm_atomic_get_existing_crtc_state(plane_state->state,
-- 
2.24.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
