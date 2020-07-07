Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37E882178FD
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 22:14:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 850ED6E588;
	Tue,  7 Jul 2020 20:12:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x444.google.com (mail-wr1-x444.google.com
 [IPv6:2a00:1450:4864:20::444])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64A426E53C
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 20:12:55 +0000 (UTC)
Received: by mail-wr1-x444.google.com with SMTP id k6so46612661wrn.3
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jul 2020 13:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ccq2vLhORCvzbowlNkHW/GWZWfo0NUEsItyCBi/7QQc=;
 b=GtoTLLcN+6IDWQipx40CILNYaoxWkS3MLVhVJd7iis9W01KxUynXNAhouGbJKVNJnA
 pqiV/TDfqcFVxGmpHLYoJqPrsDhJqeSMlWnG/asxpaZ0in/bD9RKRrHnxrozGHE5d7Ao
 OlSC/3EBkkn4FUkdzjwg0xoW3sX1fkZL+juHU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ccq2vLhORCvzbowlNkHW/GWZWfo0NUEsItyCBi/7QQc=;
 b=OXvN5H6oag+U4lIFE95p2Qo/KrxDSw/k7iddER63n+BgwGkAMH1yl1nQATsXkh8tuY
 FB3BKOYvIKr+4/6yHx4pvFxOOh2gu3RpapHTorpBLRJveflb5wgQST/5C8ARPOYcTAsk
 D6EJ6bjmQXIGifAxYrEvGz9AYG+5dYxwB+NVnFZm04gp87ndS7TuJYbbY2H8dXR3bjjN
 WL/aiItmj11swKTuD5tzjZBAPpp6M5K1cvWlXcBnGCwvJg4q+sDpxMwTt3AwINguCwoU
 SrGmua+JkD++cxLcorgTq8lDd81GJW6J5e0CsHgM5MkZyvGL0a20N/+SrEz8Q0Z7Lt4U
 Ym1Q==
X-Gm-Message-State: AOAM532+8SIVFkBRw5qF0hmpGUQdHLbqxktq1Jso67XsDqE9NPoFrnGi
 nxPQfXtwreoV19N1pSuXxzTwP4ZH+sM=
X-Google-Smtp-Source: ABdhPJywrqcDHWLumfWRYpTNsuFaPCinzpmk8UNMIb1Hji0hkX9CsoZGh1QMqsBfNGQxIXDLsi54eQ==
X-Received: by 2002:adf:f20a:: with SMTP id p10mr58701351wro.41.1594152773878; 
 Tue, 07 Jul 2020 13:12:53 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q7sm2515262wra.56.2020.07.07.13.12.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 13:12:52 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 10/25] drm/imx: Annotate dma-fence critical section in commit
 path
Date: Tue,  7 Jul 2020 22:12:14 +0200
Message-Id: <20200707201229.472834-11-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20200707201229.472834-1-daniel.vetter@ffwll.ch>
References: <20200707201229.472834-1-daniel.vetter@ffwll.ch>
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
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, linux-rdma@vger.kernel.org,
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
index 36037b2e6564..8c209bd36780 100644
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
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
