Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10618C328E6
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 19:10:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1748A10E65F;
	Tue,  4 Nov 2025 18:10:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="FxtTzNZd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com
 [209.85.128.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E6C110E65F
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 18:10:40 +0000 (UTC)
Received: by mail-wm1-f41.google.com with SMTP id
 5b1f17b1804b1-475db4ad7e4so23047725e9.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 10:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762279838; x=1762884638; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZdGrKH1QE0kG7REtfLe4gBCoW5I7PDPHN1PH2jaotk0=;
 b=FxtTzNZdCuldKgvzpAqPl1cAMWGt1JsfTjrqc+eg3GQ97pPvDpvJnw7QuOJQjsWnnb
 Vk/NoQhhA7dySLu9XjjVwUAzOkK8u9EitR0JjnrIBOWc42qHFP4h1qvZu1z99IOM76fR
 YR/EdHqVQUlhAwotSfk/JLNoJfmebqLYED5vaA8c3HT9roy+1st2JULylu1BlYXRTh+A
 1ITqND7PQaB+7waF1pSfFgZN17ZU6sYZV1aZNM5vhSV+X2V2R+5/ftIp3+Y4TEzANJpg
 Z6IFZZ7OoDszo1MVHc+Q/UvbXzWw/YQkBX0d6OgYUBFY0BpdnF6RlTc4ECen/E0yJwAB
 jcpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762279838; x=1762884638;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZdGrKH1QE0kG7REtfLe4gBCoW5I7PDPHN1PH2jaotk0=;
 b=lB/kA4fPiaLxeIx5dfLxxLMRC3zsjNeyW3Bcc6BJDGwBGr0fdCB4lWaIqPbPKYWdLy
 xg7hyoeYhDmlhnGJMfAKcJ9dyggTxyNfq7VuuuEveXtaonDTdai9r9g5GI2ZSKCEsS5m
 UXa3zhT3KW3VIdoNGwMKRADqEd1vz50UZTNlFYYaZW3y0w8mi17T+qtFLSDnvQjLZrQP
 JZtSfuVl0OcfWAkawsytVt8ZjiJXApRxEgGswKty8jYbcZX5B4qyolQ/zcXt+RPJTbW3
 jekIFaZYlAQGpIcW0Czxauk0GPmjqPTddtnDJGI6zFCyHSQ/rAJ3WHIKjPGOQoCQOLfL
 u5lg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNTPJHxnvVZYNeKyXX7WwWCfmuGIH/Vrxg25a4e2y2SJgQblHUOAK0EQvl1s3Iqwqy6JtryPGF8xA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBtNyjZpmRd0MMr5hXfHbCXqHSxcFkh0+GECDdNjBde3cO2YHi
 L9JVHcaQGS4hk1RbHjFKIklGzGFtSUtcyNNfNkIyJuAWJTOuueroFnin
X-Gm-Gg: ASbGncue7tt6RoSJhCdXhXxEyLL1yJ7A1sa706w2yduhGEWU8/fO92h05F7UMjAUSFh
 NIVQB/Do7VQpl6b30x4ylKA5i9+PHaQSUawnRkTECqQdQRD34mdmg6PK3C/QdtHp/vZHk7LYS1r
 atPXr9nii4rCKjB9MrTL7+005McKKoAqzZxgoCBuWLTYUpJfYDWVRi9ks8+7KhGREnHNeZIftG1
 4df18D2VGByDj+2IBDZBUgF30aAasGeoHvw5DhCew8mcRQ+9tZpiSuLMx4vhjrWqY0D/YeS2NvH
 znlX/CSQeHgQ9CpagDo4U12HLdhNveiaMpPJoYmb74PzPnvHGc5rNyWiP+t08yEKawEeZwZHUFY
 /1xbJbsdHL6AcGOSVljDSorj1NhA2OUOcVWFkMyNcCcBCIuw8s0ATsOCUiliE7DWFe8/rE9sLtL
 JFubZQKG8Ijq3ZBxIOOg==
X-Google-Smtp-Source: AGHT+IE6YV6xR2I6/+NCWHLkg0DglaeA9v7PSL0SkiyT31i7Bh4LMca9EcGx6brDtSF2nS0sWtPQUg==
X-Received: by 2002:a05:600c:620d:b0:475:f16b:bcbf with SMTP id
 5b1f17b1804b1-4775cdc148dmr2023655e9.14.1762279838428; 
 Tue, 04 Nov 2025 10:10:38 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 10:10:38 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 29/30] drm/sun4i: vi_scaler: Find mixer from crtc
Date: Tue,  4 Nov 2025 19:09:41 +0100
Message-ID: <20251104180942.61538-30-jernej.skrabec@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251104180942.61538-1-jernej.skrabec@gmail.com>
References: <20251104180942.61538-1-jernej.skrabec@gmail.com>
MIME-Version: 1.0
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

With "floating" planes in DE33, mixer can't be stored in layer structure
anymore. Find mixer using currently bound crtc.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index afe38ea03beb..4534998af825 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -13,6 +13,7 @@
 #include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_probe_helper.h>
 
+#include "sun4i_crtc.h"
 #include "sun8i_csc.h"
 #include "sun8i_mixer.h"
 #include "sun8i_vi_layer.h"
@@ -62,8 +63,9 @@ static void sun8i_vi_layer_update_coord(struct sun8i_layer *layer,
 					struct drm_plane *plane)
 {
 	struct drm_plane_state *state = plane->state;
+	struct sun4i_crtc *scrtc = drm_crtc_to_sun4i_crtc(state->crtc);
+	struct sun8i_mixer *mixer = engine_to_sun8i_mixer(scrtc->engine);
 	const struct drm_format_info *format = state->fb->format;
-	struct sun8i_mixer *mixer = layer->mixer;
 	u32 src_w, src_h, dst_w, dst_h;
 	u32 outsize, insize;
 	u32 hphase, vphase;
-- 
2.51.2

