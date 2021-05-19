Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E2D5389586
	for <lists+dri-devel@lfdr.de>; Wed, 19 May 2021 20:35:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 242806EE4B;
	Wed, 19 May 2021 18:35:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9762D6EDB4;
 Wed, 19 May 2021 18:35:13 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id g18so8846052pfr.2;
 Wed, 19 May 2021 11:35:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dyRDajTFtNR7qr6Z/Z6izOc/ls5KixsyxM2Zqyhcyx0=;
 b=eOZsGbrygtGS4/kxKpqgyGbe/Fo5x0P2lHIMmrcJXGV4SpQSKMRgmMAlrfW4oJ4Vys
 8yqjqUz7iOcvEESiU0uY6nMb1DtkN48S3Ka8KXU45JEkNzxxoYKSscD257Kskkhkc8d3
 hYgJXTGHdxlSs/+XDhBwZElkhnm0Fgu6puwguzM/9SP7rZHf5yDKL7GPS0qyplg2yg71
 aKeajdjSsmVwqtCXsOodXYd/R2oKE4LkPfNaPG1U7xvCJeaatTKHiyAJxy1nPONQeaxV
 pK0pIU/EWGQrOvgqFwdOovX3DyX4ZZpWXhlKtSLY0Aqj4Ev6Gh2xyrAM78nLLMmxWKy+
 tZTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dyRDajTFtNR7qr6Z/Z6izOc/ls5KixsyxM2Zqyhcyx0=;
 b=n2on6uutBENH9F+6fpsjGacBlJMOCSVmutonFiBPvR11s4qz2dfZljsT7x3QlR6Y7d
 4llTR6AAN1GVJGc0dpj6MDQrFlxZrc4kMgICjDrpMtnCtO3WFNG7ZaZp/UJx9PnjybSp
 Y+6egE0loxCWYYskVZLecuowTEhWlMxoV/YKy67QeGbmsJs3HCRckxeHG8U5G1sKleC+
 f4t/Ym7hHDLiIPvmfO2IzyZo+nS38+FQeyyTbMQxnW20XICbI7lOhJps/97OZlj7lZ0M
 GlBnsBILJYnEwNyA87DQf2kd+57xoeIiF6I+jNxGs1fOXWHnC4NRHMmnbFttiuChKFek
 JmCQ==
X-Gm-Message-State: AOAM532YUHaTV9byBP9ShDSHH5vgy+GlLH2bFeUdGIHc38Wdt2j20rAq
 JiozWxmLyB1D+C5mL1lXedAEL+fu8v+NXg==
X-Google-Smtp-Source: ABdhPJz070ZMP7NkCwg2+MzB3JAsmbQUlCPKYZE6FXutZqjSQPpc/vo/B9BYHb7ZffVGJDNYLhVs9Q==
X-Received: by 2002:aa7:920d:0:b029:2d9:2ead:70dd with SMTP id
 13-20020aa7920d0000b02902d92ead70ddmr453130pfo.67.1621449312453; 
 Wed, 19 May 2021 11:35:12 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 k13sm115340pfg.31.2021.05.19.11.35.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 May 2021 11:35:11 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [RFC 2/3] drm/atomic: Call dma_fence_boost() when we've missed a
 vblank
Date: Wed, 19 May 2021 11:38:53 -0700
Message-Id: <20210519183855.1523927-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210519183855.1523927-1-robdclark@gmail.com>
References: <20210519183855.1523927-1-robdclark@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, open list <linux-kernel@vger.kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/drm_atomic_helper.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index 560aaecba31b..fe10fc2e7f86 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1435,11 +1435,15 @@ int drm_atomic_helper_wait_for_fences(struct drm_device *dev,
 	int i, ret;
 
 	for_each_new_plane_in_state(state, plane, new_plane_state, i) {
+		u64 vblank_count;
+
 		if (!new_plane_state->fence)
 			continue;
 
 		WARN_ON(!new_plane_state->fb);
 
+		vblank_count = drm_crtc_vblank_count(new_plane_state->crtc);
+
 		/*
 		 * If waiting for fences pre-swap (ie: nonblock), userspace can
 		 * still interrupt the operation. Instead of blocking until the
@@ -1449,6 +1453,13 @@ int drm_atomic_helper_wait_for_fences(struct drm_device *dev,
 		if (ret)
 			return ret;
 
+		/*
+		 * Check if we've missed a vblank while waiting, and if we have
+		 * signal the fence that it's signaler should be boosted
+		 */
+		if (vblank_count != drm_crtc_vblank_count(new_plane_state->crtc))
+			dma_fence_boost(new_plane_state->fence);
+
 		dma_fence_put(new_plane_state->fence);
 		new_plane_state->fence = NULL;
 	}
-- 
2.30.2

