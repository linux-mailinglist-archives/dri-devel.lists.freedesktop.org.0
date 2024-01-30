Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A43E3842FC1
	for <lists+dri-devel@lfdr.de>; Tue, 30 Jan 2024 23:37:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C348C113697;
	Tue, 30 Jan 2024 22:36:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6B3D10E3A3;
 Tue, 30 Jan 2024 22:36:39 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-1d70b0e521eso32106775ad.1; 
 Tue, 30 Jan 2024 14:36:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706654138; x=1707258938; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nQdNB3amLD3wgWN5nJoJwd+J8vfuxzeUi86+HaqASZA=;
 b=OKUIXhk+GfnLoxZKcklSDeqdoEtKMTofjoaosz0fjvqmb82XBStTxG5YRt5zuWwQR3
 NoubzBME9OfjqLZwYAyM+0aX/f1ZFv30F0KzkbA8Ra/kHNqg+TPrXxlbjj56Z9XJJWC1
 JAq0FcgvEgQQddoRF99pigGv/cUzqHCREssEd1dUjB8/Ng9OnQ0sE1Hmjzegbw6XNh6w
 tS/hiTfrh7/pA6Xz9cPYmiUB/apSIRXkKrySt/XKI3jW5UbwyO4rxRasogUiUnoUXRpx
 gHrkvfcXrwdR9B43lHBrc0bIoVkbKTocHsiBNTd8AdIfNe7X/QliHcqWZQiY1iRKQTaO
 ARSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706654138; x=1707258938;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nQdNB3amLD3wgWN5nJoJwd+J8vfuxzeUi86+HaqASZA=;
 b=UU0c5xtd9vyqwKouzEhFHiiHATG4fIuU2FKuHFkUkVc1eEnoN/giVyTRnCJxHq66Cp
 jMWdtKSYYr7ABTwnkyWHF9dKI0/Ed92uGoTCdkP/Y3ck58VPtp5kC5YIqwcyIUPVH242
 0yugJ6pkegrDdAlNCu9tWXTKQ99n8pGcS6LMWsnRtrodXIcTLBVz1rpcE2uHX9jh6yi6
 ZihHpaUUISGYM+SNVawyu22jgpX5BGw7UzKeH+q0NvBxBb1WE2BkUiZ5y3S1tArmXscS
 yh7ukN2kV516CsVKd99Iy2dR3Y45gMnRdq2qhdldL2y6VD/yjZHrdeP4/wMwBE7firVS
 Pi9w==
X-Gm-Message-State: AOJu0YwLs+EsCWuTnPMV8owagkx/VgM9K/p74v5LS+qIxcXxYuUJYkIc
 r0ZmcFaFMu/pk7o+E83Yw3aYjlzEPsIdxYxZZshRXvyGH+MHrSR6qBV5jh2k
X-Google-Smtp-Source: AGHT+IFkj+E3wXJek3COMk2XISaWLhZObNoUmBCYA2ECXaBh+4x1L68p53d2Yn6DikZr614ZjhXc1w==
X-Received: by 2002:a17:902:780f:b0:1d8:d6b9:c0c0 with SMTP id
 p15-20020a170902780f00b001d8d6b9c0c0mr5944770pll.46.1706654137509; 
 Tue, 30 Jan 2024 14:35:37 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
 by smtp.gmail.com with ESMTPSA id
 k11-20020a170902f28b00b001d8e4b85636sm4115407plc.138.2024.01.30.14.35.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Jan 2024 14:35:36 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm/msm/gem: Fix double resv lock aquire
Date: Tue, 30 Jan 2024 14:35:33 -0800
Message-ID: <20240130223533.25713-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.43.0
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
Cc: Rob Clark <robdclark@chromium.org>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sumit Semwal <sumit.semwal@linaro.org>, Sean Paul <sean@poorly.run>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Since commit 56e5abba8c3e ("dma-buf: Add unlocked variant of vmapping
functions"), the resv lock is already held in the prime vmap path, so
don't try to grab it again.

Fixes: 56e5abba8c3e ("dma-buf: Add unlocked variant of vmapping functions")
Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/gpu/drm/msm/msm_gem_prime.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gem_prime.c b/drivers/gpu/drm/msm/msm_gem_prime.c
index 5f68e31a3e4e..8a27b57a5bea 100644
--- a/drivers/gpu/drm/msm/msm_gem_prime.c
+++ b/drivers/gpu/drm/msm/msm_gem_prime.c
@@ -26,7 +26,7 @@ int msm_gem_prime_vmap(struct drm_gem_object *obj, struct iosys_map *map)
 {
 	void *vaddr;
 
-	vaddr = msm_gem_get_vaddr(obj);
+	vaddr = msm_gem_get_vaddr_locked(obj);
 	if (IS_ERR(vaddr))
 		return PTR_ERR(vaddr);
 	iosys_map_set_vaddr(map, vaddr);
-- 
2.43.0

