Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0A52FEEBC
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 16:30:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 31FB96E90A;
	Thu, 21 Jan 2021 15:30:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 478AA6E90A
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 15:30:17 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id a9so2143754wrt.5
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 07:30:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=uQAzN8UBAsfdTXTkBZ6dRfrmqRnXTSBrjsAJTZ8P6uc=;
 b=Q7JvDVtO9Hpd4ANQi8haeAjFqk3Kc4dn2LfwFNdTZI58dVN0BgNEpMsQC1MZOntBqy
 C5t2klIBa+KAwE7BfUDvlyZvAfuSIRblAtIg8Lh4rYvPuErcu/3fzwVfna8LBufm9MLH
 syWX28nrY8r8xj9XJ+gVp2cmsMl7rapMpN9XY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=uQAzN8UBAsfdTXTkBZ6dRfrmqRnXTSBrjsAJTZ8P6uc=;
 b=YDgXD+1aTcoQS0ItpiETI5W6rgZIIsrTCHuNutGu22+oheeF5az7j2N+UvcSX6tAJf
 87hYu707RsGPQEJa3j67ZSDq9zXSQmJlXxHOIKr2zmnJOdgUDWA8OpWP3MlTTYqilHzd
 eS8QnULAx4ecrn1AIr+EjMQga1wAqYTLDETW1O5M0vXwGVjv0CVn1Dr7c6oqwEfbBLUd
 uzRGXGWuNC4ULwi1Soz6/gZnyJE+rmEwXnNzqZVAUMlCMDpZ4CRkywKfDWhR2IsV4x3x
 fnVJ+WsnGPNPnUq1/Le6SHzUW9pTf4K08gPc0/UK3xZUVmWpoJKxgXdGMS94fnf/GIon
 y/pA==
X-Gm-Message-State: AOAM5307Iq6kX4BjXwlz02eFdcvwryLGmhcpPoI5ybFdOJZ2QBnzOie/
 VnwFRVvWOoydZNbKynOt6G0/WgL76BhrBC9i
X-Google-Smtp-Source: ABdhPJySIeyjU0DFttJ/Gjez4wLoefZbF6u4HTwPeLiDhJXWujZCiZceqpEWSmZjYBYD23R3v7FuEw==
X-Received: by 2002:a5d:6289:: with SMTP id k9mr16176wru.200.1611243015928;
 Thu, 21 Jan 2021 07:30:15 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f14sm8269866wre.69.2021.01.21.07.30.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 07:30:15 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 10/11] drm/tegra: Annotate dma-fence critical section in
 commit path
Date: Thu, 21 Jan 2021 16:29:58 +0100
Message-Id: <20210121152959.1725404-11-daniel.vetter@ffwll.ch>
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
Cc: linux-tegra@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Again ends just after drm_atomic_helper_commit_hw_done(), but with the
twist that we need to make sure we're only annotate the custom
version. And not the other clause which just calls
drm_atomic_helper_commit_tail_rpm(), which is already annotated.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: Thierry Reding <thierry.reding@gmail.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>
Cc: linux-tegra@vger.kernel.org
---
 drivers/gpu/drm/tegra/drm.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/tegra/drm.c b/drivers/gpu/drm/tegra/drm.c
index e45c8414e2a3..ef2b79a903b1 100644
--- a/drivers/gpu/drm/tegra/drm.c
+++ b/drivers/gpu/drm/tegra/drm.c
@@ -65,11 +65,14 @@ static void tegra_atomic_commit_tail(struct drm_atomic_state *old_state)
 	struct tegra_drm *tegra = drm->dev_private;
 
 	if (tegra->hub) {
+		bool fence_cookie = dma_fence_begin_signalling();
+
 		drm_atomic_helper_commit_modeset_disables(drm, old_state);
 		tegra_display_hub_atomic_commit(drm, old_state);
 		drm_atomic_helper_commit_planes(drm, old_state, 0);
 		drm_atomic_helper_commit_modeset_enables(drm, old_state);
 		drm_atomic_helper_commit_hw_done(old_state);
+		dma_fence_end_signalling(fence_cookie);
 		drm_atomic_helper_wait_for_vblanks(drm, old_state);
 		drm_atomic_helper_cleanup_planes(drm, old_state);
 	} else {
-- 
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
