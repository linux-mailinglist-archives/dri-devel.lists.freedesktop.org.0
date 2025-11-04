Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06650C328C5
	for <lists+dri-devel@lfdr.de>; Tue, 04 Nov 2025 19:10:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C20CA10E29B;
	Tue,  4 Nov 2025 18:10:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="X4dnSBHc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEACE10E29B
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Nov 2025 18:10:29 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-47754e9cc7fso7993375e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Nov 2025 10:10:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762279828; x=1762884628; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uxUKDaL1Q7bL2awForB4PNE5HPywXNIJXgBLrPAkKJk=;
 b=X4dnSBHc4I3eh4hXB0D0Irm7uQMqL6bCKuLMjfss05uS1BeZMxhdyLKoYdj6yRE4zo
 FYMNySPriGgG8xUQDOdTMCY1tFuP4g9echZyiRtaqTE4vVl4ZTOeNdfn9iYE3DhE8t7w
 nE1Y/QzghrdyUACDv5TA7JSOcGFmtdlCUEAHMvUJIF9o0JEMpA/MiqgPbVsfhyWG5V4l
 OwpG/+xiLn0a1NgKT4HfdCLcdXVfikI76E4xZ37bigA7SZOeGadDG+eYSEjD0vN6CZwC
 g0Ur6hcn+rks9fQMTyShTyxCWCPl23xx+lqZOQzg3ml++6TVUauD3B7zPDd+3JdSffdf
 yGIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762279828; x=1762884628;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uxUKDaL1Q7bL2awForB4PNE5HPywXNIJXgBLrPAkKJk=;
 b=bzzgO+cAnS/8AIxYYGaWNP75qBn4qpS9LJ6F+7xDT8ePuctzJ5GXqWApH4rVW7EFW5
 Q4PYnlCwSW7EYh6Aof0hc+MAl/WS8THoQ00zdGe8sj1JXvEIjnJyRPjiL/1o02VIS5ny
 uXZn/uemh+Oto+jJMu3DbjjswHr1+gy27duczSIUqaKSbUeQ0proZcdVYETM6l/bF9xx
 NpvtIEQxWkKGXEIJfI9RM3FWWcH+kj4N3GSbhoaXcwR95qHA7qSW+uWTM0dbNTKXMKRB
 olai9mFBOQqGDD7KltJkBORHCN6K+uMBYrjjzJxcdpWXL0SEpcBUqCloACH8DuVumtJR
 ScAA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmb/OLWsaklJq/z7Dh0UbhKlM0A8+lkv+B5k0t+hq1Ge3H5ra9/Pugk3tcL3g22xKLq+J2QvFCKFY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw5arJspl97MbPOU5qB0RUmr1iN3ThqgUhcUwQjt0KtFdu5HJg5
 V1nXgPACYoPL5gUBoQl6Nz1ixHlPN2u3ipBF8V5g7Ho2F/5avwKiDNei
X-Gm-Gg: ASbGncvYm07smKaYZjYHTzmlmIxMsP8+xoPaDxzhYUs+LLeV0WQ9VnvM+YhHVWDQaO6
 6uKwetrtsOKtD8ReD4FDSKDJdS5fK/2p8N2EmBANJeX8kO37k096NHUZCqivI5o6YuGiH2NU3Jn
 7qfSI0rloCCZCEYYpl10sYUhye+ckj7w6XCo4SFSrorLmEJjBMDlz/zpcZhZuQ9iUTQ5GPzU7sD
 1qhqs1lUZ8HRBcWinnjLSWtpwKGrkE3VQmUpa64p1wFLDuF61V55RrmtnC9r5r3wARBsdPnzpzW
 2Al4o1wwJQ//YWpXOvidYbxE0Olyn/bAsgGhBbbaa+apWxns59ToVWuaBVL2Cxhs5/PVv+yT/05
 kN/Q+mYplJq0NxY53oqXXoMjVEeZ4KxmmY5gUUo4/Zljjq8n7jjvfo3lLGj34hleQYykih3GU9d
 7g/m9F81HUQLWygx6n7FvPcqu1j3nB
X-Google-Smtp-Source: AGHT+IF5c8+mHZzz90mVXQjinbLLHXZDEwGQ66eyEvr+K8f4HxTWYfLZ4fwJ/Z+IpDrhmhZsMsoK/A==
X-Received: by 2002:a05:600c:64cd:b0:475:d917:7218 with SMTP id
 5b1f17b1804b1-4775ce7df88mr2080215e9.36.1762279828376; 
 Tue, 04 Nov 2025 10:10:28 -0800 (PST)
Received: from jernej-laptop ([178.79.73.218])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-477558c1a03sm24688685e9.2.2025.11.04.10.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Nov 2025 10:10:28 -0800 (PST)
From: Jernej Skrabec <jernej.skrabec@gmail.com>
To: wens@csie.org
Cc: mripard@kernel.org, maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch, samuel@sholland.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
 Ryan Walklin <ryan@testtoast.com>
Subject: [PATCH v2 21/30] drm/sun4i: csc: use layer arg instead of mixer
Date: Tue,  4 Nov 2025 19:09:33 +0100
Message-ID: <20251104180942.61538-22-jernej.skrabec@gmail.com>
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

Layer will be more universal, due to DE33 support.

Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
Tested-by: Ryan Walklin <ryan@testtoast.com>
Signed-off-by: Jernej Skrabec <jernej.skrabec@gmail.com>
---
 drivers/gpu/drm/sun4i/sun8i_csc.c      | 10 +++++-----
 drivers/gpu/drm/sun4i/sun8i_csc.h      |  4 ++--
 drivers/gpu/drm/sun4i/sun8i_vi_layer.c |  2 +-
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.c b/drivers/gpu/drm/sun4i/sun8i_csc.c
index ac7b62adc7df..c371e94b95bd 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.c
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.c
@@ -227,22 +227,22 @@ static u32 sun8i_csc_get_mode(struct drm_plane_state *state)
 	}
 }
 
-void sun8i_csc_config(struct sun8i_mixer *mixer, int layer,
+void sun8i_csc_config(struct sun8i_layer *layer,
 		      struct drm_plane_state *state)
 {
 	u32 mode = sun8i_csc_get_mode(state);
 	u32 base;
 
-	if (mixer->cfg->de_type == SUN8I_MIXER_DE3) {
-		sun8i_de3_ccsc_setup(mixer->engine.regs, layer,
+	if (layer->mixer->cfg->de_type == SUN8I_MIXER_DE3) {
+		sun8i_de3_ccsc_setup(layer->regs, layer->channel,
 				     mode, state->color_encoding,
 				     state->color_range);
 		return;
 	}
 
-	base = ccsc_base[mixer->cfg->ccsc][layer];
+	base = ccsc_base[layer->mixer->cfg->ccsc][layer->channel];
 
-	sun8i_csc_setup(mixer->engine.regs, base,
+	sun8i_csc_setup(layer->regs, base,
 			mode, state->color_encoding,
 			state->color_range);
 }
diff --git a/drivers/gpu/drm/sun4i/sun8i_csc.h b/drivers/gpu/drm/sun4i/sun8i_csc.h
index ce921521aaca..2a4b79599610 100644
--- a/drivers/gpu/drm/sun4i/sun8i_csc.h
+++ b/drivers/gpu/drm/sun4i/sun8i_csc.h
@@ -9,7 +9,7 @@
 #include <drm/drm_color_mgmt.h>
 
 struct drm_plane_state;
-struct sun8i_mixer;
+struct sun8i_layer;
 
 /* VI channel CSC units offsets */
 #define CCSC00_OFFSET 0xAA050
@@ -23,7 +23,7 @@ struct sun8i_mixer;
 
 #define SUN8I_CSC_CTRL_EN		BIT(0)
 
-void sun8i_csc_config(struct sun8i_mixer *mixer, int layer,
+void sun8i_csc_config(struct sun8i_layer *layer,
 		      struct drm_plane_state *state);
 
 #endif
diff --git a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
index 2290c983e177..4f0c929faf36 100644
--- a/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
+++ b/drivers/gpu/drm/sun4i/sun8i_vi_layer.c
@@ -301,7 +301,7 @@ static void sun8i_vi_layer_atomic_update(struct drm_plane *plane,
 
 	sun8i_vi_layer_update_attributes(layer, plane);
 	sun8i_vi_layer_update_coord(layer, plane);
-	sun8i_csc_config(layer->mixer, layer->channel, new_state);
+	sun8i_csc_config(layer, new_state);
 	sun8i_vi_layer_update_buffer(layer, plane);
 }
 
-- 
2.51.2

