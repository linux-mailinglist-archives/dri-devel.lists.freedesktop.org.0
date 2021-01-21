Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 915F82FEEB6
	for <lists+dri-devel@lfdr.de>; Thu, 21 Jan 2021 16:30:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95F2A6E908;
	Thu, 21 Jan 2021 15:30:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BDBA6E8FF
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 15:30:12 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id q7so2129367wre.13
 for <dri-devel@lists.freedesktop.org>; Thu, 21 Jan 2021 07:30:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=87thFbxNpQ3GyR284LFWelhr5kNGk4keutufFiULjoQ=;
 b=VLKb2iqmtBmYrrw2U4w2fUCb58KMiwdlXrT5r3X8/Ka4we7WsXWr0P9hua4CntM+7G
 fcJVyf7T0yk0jkx/hUTPWtl3w80Gn+QDgfNBmNtaE1LODpVNk/AvFKlddc4YFYt4Hq8C
 Od49bocdwBY46qjtwI/sJcZTGy++otJbFIXR4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=87thFbxNpQ3GyR284LFWelhr5kNGk4keutufFiULjoQ=;
 b=HGVxcBPSbdqnkFmu98yEA3FnmnP1KzNlK7wy/sWrRBjOnDfO4wD0IlMXUcqGyMM91E
 4LxcylETsvc6JuL8qyeTg+2fwaTIJ39BYdRB1eIPbta67OQYoKjsW+ICWLbMYoD/6YXZ
 4G17XpOqSHU43Vc/ar/fFS8aX+veo2RnVOHLnYDNXKC+mWzRr6WwKt+MBsU/EAzMt4/Q
 xyZvswFSwl3QJXRecnRRowTrxqpr/TfyPtqsKfbpLNUtVsLi64xZyOL28fF7sFnetuFM
 lUWA0AukzMwMaJC69IIJlh+9st/XkyHbAoMDmOa6enOc5Z7LFfwtu3TpV5X9mmsHhrtA
 z4Xg==
X-Gm-Message-State: AOAM530RpmETTC7hpCo37Vf/00gfIfCzOPXvI8AvFs1Jqbcsd6ZP9eab
 QF9TWow6ALM8s9GOOtJEhfuIyi+PyvK+zPxm
X-Google-Smtp-Source: ABdhPJwW5JL0Qox6lpfbv8k5qf+ZEJKCLK/OmDap9o7zb9wAXhnFr1NKVMP/f9Mo+dpv+lwYCvX3CA==
X-Received: by 2002:a5d:5704:: with SMTP id a4mr14868504wrv.37.1611243010953; 
 Thu, 21 Jan 2021 07:30:10 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id f14sm8269866wre.69.2021.01.21.07.30.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 07:30:10 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH 05/11] drm/malidp: Annotate dma-fence critical section in
 commit path
Date: Thu, 21 Jan 2021 16:29:53 +0100
Message-Id: <20210121152959.1725404-6-daniel.vetter@ffwll.ch>
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
 "James \(Qian\) Wang" <james.qian.wang@arm.com>,
 Liviu Dudau <liviu.dudau@arm.com>, Mihail Atanassov <mihail.atanassov@arm.com>,
 Daniel Vetter <daniel.vetter@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Again needs to be put right after the call to
drm_atomic_helper_commit_hw_done(), since that's the last thing which
can hold up a subsequent atomic commit.

No surprises here.

Acked-by: Liviu Dudau <liviu.dudau@arm.com>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
Cc: "James (Qian) Wang" <james.qian.wang@arm.com>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Mihail Atanassov <mihail.atanassov@arm.com>
---
 drivers/gpu/drm/arm/malidp_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/arm/malidp_drv.c b/drivers/gpu/drm/arm/malidp_drv.c
index fceda010d65a..d83c7366b348 100644
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
2.30.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
