Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 94A8C2178EC
	for <lists+dri-devel@lfdr.de>; Tue,  7 Jul 2020 22:13:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E24986E51B;
	Tue,  7 Jul 2020 20:12:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B05AD6E588
 for <dri-devel@lists.freedesktop.org>; Tue,  7 Jul 2020 20:12:52 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id g75so452863wme.5
 for <dri-devel@lists.freedesktop.org>; Tue, 07 Jul 2020 13:12:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eLBVqiQIsMtlYONLK2w+6GAazNNz+oaX8A8qo8Nlgow=;
 b=h8aTmKDumgx6uK3u1RBVVfOiqqCLYe0T9/bj69f9/X0ccNfTIXAmNn3Rg6ZXKJmB2w
 Fqh11hUx1o8VWrFql2F1WN5KSJ5pkx7hNX8LQoWTPt71oJyQRq22dMNefBPloJZbeTcp
 LrfOFV/DOPROglnZx10L3SEosAeq/TI99ybyk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eLBVqiQIsMtlYONLK2w+6GAazNNz+oaX8A8qo8Nlgow=;
 b=oOuonD6/+2OHH0xGo3xhyUmHZ4b29pXvQOrtVn179qy4oEv//IzHnZJZQG+654lUGM
 M36+d78jjgLn9g/zjH21AKOAtVTD2/oco1MwrXoBiEohRPJiuoNituRCN13YeDrJ2udb
 rAiIJBiOco/GTLuHaz7EP3dxjzmFHt6mVLr00zUTyJLmI/YSpNQuOlYshptPiosvYm3P
 0I1LidQbCG0sMrVS+nXdaRvOQEHiH2koD2q6SMwYtMeWlwetWcY9/2Tyz43qkozBCQBS
 vNYFPmRRaM7cf4IC2Rh2RJe66AacKbLFmKzfMpbKvGPm/HJ+bNuaOKRssKwEQ2+tGrrF
 PMTg==
X-Gm-Message-State: AOAM533kMsnAOoHiZJ9wi0/RmQh9jOXrnskevv8Zsq+zQbCPCDBswF3h
 xgaTRmT0d6Fu+ftee4fo5vU/9LBRUzY=
X-Google-Smtp-Source: ABdhPJwr5VodDUuWsEiTX9Us0Z+/3e4TMNgf3i7VpNciq6fTFlY5xqtBFVOJnix4uvw2QX/UJg2lfQ==
X-Received: by 2002:a1c:1bc6:: with SMTP id b189mr5582918wmb.166.1594152771107; 
 Tue, 07 Jul 2020 13:12:51 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id q7sm2515262wra.56.2020.07.07.13.12.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jul 2020 13:12:50 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 08/25] drm/malidp: Annotate dma-fence critical section in
 commit path
Date: Tue,  7 Jul 2020 22:12:12 +0200
Message-Id: <20200707201229.472834-9-daniel.vetter@ffwll.ch>
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
 Liviu Dudau <liviu.dudau@arm.com>,
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Daniel Vetter <daniel.vetter@intel.com>,
 Mihail Atanassov <mihail.atanassov@arm.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Again needs to be put right after the call to
drm_atomic_helper_commit_hw_done(), since that's the last thing which
can hold up a subsequent atomic commit.

No surprises here.

Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: "James (Qian) Wang" <james.qian.wang@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Mihail Atanassov <mihail.atanassov@arm.com>
---
 drivers/gpu/drm/arm/malidp_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index 69fee05c256c..26e60401a8e1 100644
--- a/drivers/gpu/drm/arm/malidp_drv.c
+++ b/drivers/gpu/drm/arm/malidp_drv.c
@@ -234,6 +234,7 @@ static void malidp_atomic_commit_tail(struct drm_atomic_state *state)
 	struct drm_crtc *crtc;
 	struct drm_crtc_state *old_crtc_state;
 	int i;
+	bool fence_cookie = dma_fence_begin_signalling();
 
 	pm_runtime_get_sync(drm->dev);
 
@@ -260,6 +261,8 @@ static void malidp_atomic_commit_tail(struct drm_atomic_state *state)
 
 	malidp_atomic_commit_hw_done(state);
 
+	dma_fence_end_signalling(fence_cookie);
+
 	pm_runtime_put(drm->dev);
 
 	drm_atomic_helper_cleanup_planes(drm, state);
-- 
2.27.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
