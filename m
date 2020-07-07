Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A61852178E4
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 22:13:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03C7D6E5D4;
	Tue,  7 Jul 2020 20:13:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x441.google.com (mail-wr1-x441.google.com
 [IPv6:2a00:1450:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B75B56E588
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 20:12:58 +0000 (UTC)
Received: by mail-wr1-x441.google.com with SMTP id s10so46550500wrw.12
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jul 2020 13:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ufMaQijpZxkwPwAr9gZMUr6WxEnpa6HiMV9RcHXuTwM=;
 b=Jc8+1Bt4+yZ+72JwlaX/4LbCarKqgHkIvMH8RXH7ParTT0qyrwu7nDaqDYvK5TmYnN
 f4YXcswUT94xoP4KTTwyVIX0vAJHBeBnSm8VbvKA2lXaWW1d860dZpnC30Qwi8DKO7xS
 utUL879Q+0s6m0mBrBxYl8jOBXFwz6oarUdxM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ufMaQijpZxkwPwAr9gZMUr6WxEnpa6HiMV9RcHXuTwM=;
 b=D/kSG5Ral/CvbyBiumrle+krGJm87afiy741mJ+phUCWXxU+fCzElGgKUg5KmBLMcl
 a4J+EPQYKD1Rxb9L5FqskvIgposwnU+tzXUXHIp9CVDZ2HhNLGj6lg66eHjE2aBAbB02
 4fEZXohC9yAHDio+QqWyU16ZapMZkQJUAImd2mqVxyDfj8DNAiEDi0UnbjjMBUuiOzl7
 gAow33NWQNaND4s0NMOLE7j/vbY7dP+XldZQjYfCWTnNsFcT83pNhtUcfKa6JiP2kCxw
 V4nZWhNbD6tGFtV/jHeCERCFwR2taw3rBG4OC2Q6+2h8qh/8JITryIlsHwqgvidX8Wh9
 vXgg==
X-Gm-Message-State: AOAM5320uhA8niEdsP3rUG6stkbQ2R5m6/fkPpFbV+0cI7hF83vwnHGe
 uJrLD7qVbRHIK4nopQxP703LIqn9jH8=
X-Google-Smtp-Source: ABdhPJwuWb6pVb4wr6EdtDvBXcWINsi7MUjr5wmIW0V0ekFf31STAKNgPJW5XI7gRyMNJ5yiOX8/jA==
X-Received: by 2002:adf:8b5a:: with SMTP id v26mr54731394wra.165.1594152777136; 
 Tue, 07 Jul 2020 13:12:57 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q7sm2515262wra.56.2020.07.07.13.12.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 13:12:56 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 13/25] drm/tegra: Annotate dma-fence critical section in
 commit path
Date: Tue,  7 Jul 2020 22:12:17 +0200
Message-Id: <20200707201229.472834-14-daniel.vetter@ffwll.ch>
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
Cc: linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Thierry Reding <thierry.reding@gmail.com>, linux-tegra@vger.kernel.org,
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
index ba9d1c3e7cac..9aea8fe48db3 100644
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
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
