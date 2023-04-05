Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94BAC6D76A1
	for <lists+dri-devel@lfdr.de>; Wed,  5 Apr 2023 10:16:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF97F10E878;
	Wed,  5 Apr 2023 08:16:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9C49310E878
 for <dri-devel@lists.freedesktop.org>; Wed,  5 Apr 2023 08:16:55 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-4fd1f2a0f82so7208a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 05 Apr 2023 01:16:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1680682614; x=1683274614;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qP3CRuOXtd0j8FH60pKDaapzSWilH3ybWh3D2BA2OVg=;
 b=GjLl3ua24l4Ov2GQ+uRq2bGA8FFfCelF7z+YR0ZN0ez6Tb4K/TAjDMG+xwe6+xxnVB
 zDKECAoNBIqH/aGbAtpyUXhaguJpZGG0JAO+CKxjhC0A6uMVAxvdMKJLve7rhnouoiMz
 MgVPIGv0iQKsnn1XemqCEGw2vg0Ipw9iOiJkk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680682614; x=1683274614;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qP3CRuOXtd0j8FH60pKDaapzSWilH3ybWh3D2BA2OVg=;
 b=0xac6T9ho0So/zwmTF+5Uc6OKUru1LOfPLZdgS7F5zt1eZKUytCF3ZukJDG3mxFHAW
 Gpq6b2lAmD6QNg5LLY5tB8cporbuQOFc+oUdbPSvjsp/mWUuZLtEIMyf/2Uv/X8E17Gp
 pYStQaaK576n/sTqeJu9bFYgC0GDHfBxWOJLHcNOtubd3+5z9N/QcjfOvXattb0SyrM5
 mB10uzOANKJHYrKJAMcshEXmN+B03Z2Is2XIPhyti7E2dGTC3mXMc4tv2ZcpdU2YkkSL
 7Xe3+5Jt/XbEBeV+uR9d/I3ERYs+Mkk8h8g46CDm/BeGYs/7FMs7oKcbdsCKSxSq1R9I
 Hhcg==
X-Gm-Message-State: AAQBX9cyknxZTrfmmmzkg97GU/E2l5No3hdgvbw+wsys30FHenU67/WF
 RSrRAiXlCEV1eTaj2Tg3+f5tE1AbfOtRR0N0amY=
X-Google-Smtp-Source: AKy350ZYz7OQVeF14jLM9v6G4L5hAkxBt0za08VJNASxD8vm5spaVp2Ou8H/3c31A0MGkaLzR96a3g==
X-Received: by 2002:a05:6402:524e:b0:4fd:2978:d80 with SMTP id
 t14-20020a056402524e00b004fd29780d80mr1086176edd.1.1680682614011; 
 Wed, 05 Apr 2023 01:16:54 -0700 (PDT)
Received: from phenom.ffwll.local (212-51-149-33.fiber7.init7.net.
 [212.51.149.33]) by smtp.gmail.com with ESMTPSA id
 sz22-20020a1709078b1600b00948da767832sm2748474ejc.152.2023.04.05.01.16.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Apr 2023 01:16:53 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Subject: [PATCH] drm/atomic-helper: Don't set deadline for modesets
Date: Wed,  5 Apr 2023 10:16:50 +0200
Message-Id: <20230405081650.797972-1-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.40.0
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
Cc: Rob Clark <robdclark@chromium.org>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If the crtc is being switched on or off then the semantics of
computing the timestampe of the next vblank is somewhat ill-defined.
And indeed, the code splats with a warning in the timestamp
computation code. Specifically it hits the check to make sure that
atomic drivers have full set up the timing constants in the drm_vblank
structure, and that's just not the case before the crtc is actually
on.

For robustness it seems best to just not set deadlines for modesets.

Link: https://lore.kernel.org/dri-devel/dfc21f18-7e1e-48f0-c05a-d659b9c90b91@linaro.org/
Fixes: d39e48ca80c0 ("drm/atomic-helper: Set fence deadline for vblank")
Cc: Rob Clark <robdclark@chromium.org>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Reported-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # test patch only
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Daniel Vetter <daniel.vetter@intel.com>
---
 drivers/gpu/drm/drm_atomic_helper.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index f21b5a74176c..6640d80d84f3 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -1528,6 +1528,9 @@ static void set_fence_deadline(struct drm_device *dev,
 	for_each_new_crtc_in_state (state, crtc, new_crtc_state, i) {
 		ktime_t v;
 
+		if (drm_atomic_crtc_needs_modeset(new_crtc_state))
+			continue;
+
 		if (drm_crtc_next_vblank_start(crtc, &v))
 			continue;
 
-- 
2.40.0

