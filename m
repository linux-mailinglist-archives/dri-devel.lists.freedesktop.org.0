Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CDC20296EA2
	for <lists+dri-devel@lfdr.de>; Fri, 23 Oct 2020 14:23:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C77AE6E52D;
	Fri, 23 Oct 2020 12:22:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 733E06E52F
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 12:22:37 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id l15so1296740wmi.3
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Oct 2020 05:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KECdI7UHy1NcU7aeE9FximYHTQ+5TI/l/3s4CqAmbMI=;
 b=Ahjvu946vE1T+xMU2k+XRI42eiLtxjGVWsVgyVwHJBIx77D6/C7dwj/Me/xCT09d+z
 aIONXVRCqC8lUNhvVhEtP/qvNG+eeRCX3vxDNaExszHac2/GbHhJqCl0wVuzBfiwm0q2
 9TU7pgTlpxZyVlswylTWMh0RiHYwIh8yTCf3k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KECdI7UHy1NcU7aeE9FximYHTQ+5TI/l/3s4CqAmbMI=;
 b=SBCf+/dDq1dRF1cMyi5rqdirPEviPZol+/EfGyYfO09c14xRJS5rqb+BfqCRWkUi6L
 /Zorm9JDTaxm+54CPDANOUqunRZm3kjjOieDjsyWAMh2IWDsDZFUCDWtnn0nAgVi/QcU
 wTsvwfvKkMRjmv8Vce+DBt7nekIecCHXYDOdqbrUzMTWqIZMZFUVjPo8MktUUkHy8MZ7
 ceSUNhINMgVnHAjvoeqQehAGdgbtumX4mWvvPoC0VIoWo5BqsIy3rplQde5P0r+a/0Kt
 48KESEmis1KdjHkeYd8Nlzkz7vlqBMo/B/dl+zk6L1ABiWYQn2rvcNmT1kCgPX0gB5Aj
 Ot+Q==
X-Gm-Message-State: AOAM533B7jjfeQifdVYe4XmYu1glqCvtcMxNkc6w23pMLAObNStAok6Z
 YGbkckK/WI57zByXRtxKRgNhAd0+1q8GbRnh
X-Google-Smtp-Source: ABdhPJwMomqCPl0n8vP9asLZ1SDNXT5ky/eYZSgG7qkX/A+gVEBjqXOzP0WvhSg8wJIRQx+wtE1AhA==
X-Received: by 2002:a1c:55c1:: with SMTP id j184mr2089050wmb.180.1603455755936; 
 Fri, 23 Oct 2020 05:22:35 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id y4sm3056484wrp.74.2020.10.23.05.22.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2020 05:22:35 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 12/65] drm/imx: Annotate dma-fence critical section in commit
 path
Date: Fri, 23 Oct 2020 14:21:23 +0200
Message-Id: <20201023122216.2373294-12-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
References: <20201021163242.1458885-1-daniel.vetter@ffwll.ch>
 <20201023122216.2373294-1-daniel.vetter@ffwll.ch>
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
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 NXP Linux Team <linux-imx@nxp.com>, Daniel Vetter <daniel.vetter@intel.com>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

drm_atomic_helper_commit_hw_done() is the last thing (no plane cleanup
apparrently), so it's the entire function. And a nice comment
explaining why thw wait_for_flip_done is ahead, unlike the usual
sequence.

Aside, I think since the atomic helpers do track plane disabling now
separately this might no longer be a real problem since:

commit 21a01abbe32a3cbeb903378a24e504bfd9fe0648
Author: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Date:   Mon Sep 4 12:48:37 2017 +0200

    drm/atomic: Fix freeing connector/plane state too early by tracking commits, v3.

Plus the subsequent bugfixes of course, this was tricky to get right.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: NXP Linux Team <linux-imx@nxp.com>
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/imx/imx-drm-core.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/imx/imx-drm-core.c b/drivers/gpu/drm/imx/imx-drm-core.c
index 7d00c49fd5a5..0a6db8eeb25d 100644
--- a/drivers/gpu/drm/imx/imx-drm-core.c
+++ b/drivers/gpu/drm/imx/imx-drm-core.c
@@ -80,6 +80,7 @@ static void imx_drm_atomic_commit_tail(struct drm_atomic_state *state)
 	struct drm_plane_state *old_plane_state, *new_plane_state;
 	bool plane_disabling = false;
 	int i;
+	bool fence_cookie = dma_fence_begin_signalling();
 
 	drm_atomic_helper_commit_modeset_disables(dev, state);
 
@@ -110,6 +111,7 @@ static void imx_drm_atomic_commit_tail(struct drm_atomic_state *state)
 	}
 
 	drm_atomic_helper_commit_hw_done(state);
+	dma_fence_end_signalling(fence_cookie);
 }
 
 static const struct drm_mode_config_helper_funcs imx_drm_mode_config_helpers = {
-- 
2.28.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
