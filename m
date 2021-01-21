Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A92D2FEEB8
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 16:30:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F66A6E909;
	Thu, 21 Jan 2021 15:30:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4277B6E908
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 15:30:14 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id v15so2149239wrx.4
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 07:30:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7nrYkMQbuVgfvxrNAaxj1DJfSWzLfMGK2H67+P9eVec=;
 b=MdVP3BiEfvBL7u05q3cxfqSP8KxzxIt6ZCiJsGes3iM6JOYlSNQsJLzWu6AHyBPi45
 rpK6XfZ9BcoPVOWjNw+SdaOO6wSxEORBqFh11IwYn10xcl4kWRMu7a6HXSoQ08wa9ETT
 nZnhsPGCiBJLKc5zKiQQEt3cKZM8U7wzSadC8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7nrYkMQbuVgfvxrNAaxj1DJfSWzLfMGK2H67+P9eVec=;
 b=l3feA9mTDnkHc8k4Us8Vql9uTSrKicwxCyuNEGf1ghogMNkgiRKFElHG9a/zHIkqv4
 C4Dmige1VDQtb9GST1fM0GNBzljzQoyuWAlFpznyvBCOvmJtbDHDG55HommqYnbC6RDb
 71MejUygyGP6Jky4alGBbkSYKwyvPlRm5L5+u9Mfg5wv/MOwibufuQg1I5rFYK2gUlpI
 hvnMyyNGd7c6D7sgaeLehC3VctqNKzXopJV/uoGe/ZuKHLbWfRDX036NxT7s1CKupLp3
 4Gs7nuEB2QrnGpWdeYtbRSRLBeGzGrd79GTZEUJ3ThrsD8e2D6c6iFY278luR38h9fIo
 HFqA==
X-Gm-Message-State: AOAM531HCCXbCA6MmAroKVNEw+pSDprQ7yaQP2+oPOUb5toVM9EPffZ+
 DByyDSll2pyv8piDTJxeTHqTnECa4IApOgHs
X-Google-Smtp-Source: ABdhPJwmn73GygtDXRM97hI2/oCQgUugFzapvV6cWgd9qQYKv79LTFcBpZbBdCvrSwQzTDIcgBpfXA==
X-Received: by 2002:adf:cc8f:: with SMTP id p15mr14876332wrj.199.1611243013004; 
 Thu, 21 Jan 2021 07:30:13 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f14sm8269866wre.69.2021.01.21.07.30.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 07:30:12 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 07/11] drm/imx: Annotate dma-fence critical section in commit
 path
Date: Thu, 21 Jan 2021 16:29:55 +0100
Message-Id: <20210121152959.1725404-8-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210121152959.1725404-1-daniel.vetter@ffwll.ch>
References: <20210121152959.1725404-1-daniel.vetter@ffwll.ch>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 Sascha Hauer <s.hauer@pengutronix.de>, NXP Linux Team <linux-imx@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Daniel Vetter <daniel.vetter@intel.com>, Shawn Guo <shawnguo@kernel.org>,
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
index d1a9841adeed..3ed1cc07cad1 100644
--- a/drivers/gpu/drm/imx/imx-drm-core.c
+++ b/drivers/gpu/drm/imx/imx-drm-core.c
@@ -81,6 +81,7 @@ static void imx_drm_atomic_commit_tail(struct drm_atomic_state *state)
 	struct drm_plane_state *old_plane_state, *new_plane_state;
 	bool plane_disabling = false;
 	int i;
+	bool fence_cookie = dma_fence_begin_signalling();
 
 	drm_atomic_helper_commit_modeset_disables(dev, state);
 
@@ -111,6 +112,7 @@ static void imx_drm_atomic_commit_tail(struct drm_atomic_state *state)
 	}
 
 	drm_atomic_helper_commit_hw_done(state);
+	dma_fence_end_signalling(fence_cookie);
 }
 
 static const struct drm_mode_config_helper_funcs imx_drm_mode_config_helpers = {
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
