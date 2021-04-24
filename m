Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DEF5A369E6F
	for <lists+dri-devel@lfdr.de>; Sat, 24 Apr 2021 03:52:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D37A76EC64;
	Sat, 24 Apr 2021 01:52:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com
 [IPv6:2607:f8b0:4864:20::f34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D3AA6EC64
 for <dri-devel@lists.freedesktop.org>; Sat, 24 Apr 2021 01:52:40 +0000 (UTC)
Received: by mail-qv1-xf34.google.com with SMTP id l2so6851873qvb.7
 for <dri-devel@lists.freedesktop.org>; Fri, 23 Apr 2021 18:52:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UcY6Lu3u2CeikGQuheX4lmNqK8mFEGOt+ZAL+7yU8Dc=;
 b=Jauv+uflVnnVf1sTvIAuyx6lYbj+w3YEeYLPo30ZDB/TwQ6WEYsR8KqnHRlXLb4ub8
 SDsx7nH6WGGhkVhCfo0mwxG/SS1BUu821BVZwt7bQvJyAq+BUyN7U37Rwyx8t/1djF5a
 KANU7RYbWXYohZK0kWujMdPCE5/CkQ+JLc0D84W4IhL3UKcvxiCD5rVzfA0N/knyjZtM
 9k9JJDltJ8qzQXvWT/zm/c1vEDMTmTw2AqSzpwJvOUWdYx0OhJD2INBO+Vpt+xk6qHof
 UjLXc1WQXSGIqtFky0qu7VK0YYh7OvwP4/Y7qQZ3uNN67SaqiKmVn7rm0EM8xGhNMIF/
 t6Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=UcY6Lu3u2CeikGQuheX4lmNqK8mFEGOt+ZAL+7yU8Dc=;
 b=Fffbwpoznkb/apIDF/JdBPofv+10vOZAIl23Hiw/aYx3TsIlKsNtbt/Xe5OUbj0l3O
 3cVczN6twDxr1yOYpTc1uy9GqO/BX0C0/nt6ZSXLtKC4bkKkS8TLQsQsgpp3mWnUlvpN
 P4nP7pcqOl8lZ8JQ62ONFdI8TyvAaaBqxEAQT4ECNv0U2FFdfo8Slp6Kf9kjGvdzxlV5
 XwXvYcXRzEyswJ+fwxSXVFjKWgMsD1HphTQ2VcSgGz5hrnlg3RhQRaEk8NJ1l9e7vMLX
 /zRqNy3iUoTefhttZSJ64W+SPyMC7BdjUJ+X/AdwB0P+Wa1+xcegqjGDjIdVBW0j481K
 mUNw==
X-Gm-Message-State: AOAM530USzSaR/UTWTZ6JbZi3aIByUU8AFLl3GiKbOSEeu8cioXT2RHF
 366r8LzH7BNnESpWb72ctB5ORw==
X-Google-Smtp-Source: ABdhPJyiOw7t62EyD1lV8XxKfvCZk/P/OPh7hCDSf08Jt2OMZoHDkUXqS9tnOiWkNCEYbON1Z5kV/g==
X-Received: by 2002:ad4:5543:: with SMTP id v3mr7495429qvy.32.1619229159334;
 Fri, 23 Apr 2021 18:52:39 -0700 (PDT)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id r5sm5389259qtp.75.2021.04.23.18.52.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Apr 2021 18:52:38 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Subject: [PATCH] drm/msm: fix LLC not being enabled for mmu500 targets
Date: Fri, 23 Apr 2021 21:49:26 -0400
Message-Id: <20210424014927.1661-1-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

mmu500 targets don't have a "cx_mem" region, set llc_mmio to NULL in that
case to avoid the IS_ERR() condition in a6xx_llc_activate().

Fixes: 3d247123b5a1 ("drm/msm/a6xx: Add support for using system cache on MMU500 based targets")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 1716984c68a8..727d111a413f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1153,10 +1153,6 @@ static void a6xx_llc_slices_init(struct platform_device *pdev,
 {
 	struct device_node *phandle;
 
-	a6xx_gpu->llc_mmio = msm_ioremap(pdev, "cx_mem", "gpu_cx");
-	if (IS_ERR(a6xx_gpu->llc_mmio))
-		return;
-
 	/*
 	 * There is a different programming path for targets with an mmu500
 	 * attached, so detect if that is the case
@@ -1166,6 +1162,11 @@ static void a6xx_llc_slices_init(struct platform_device *pdev,
 		of_device_is_compatible(phandle, "arm,mmu-500"));
 	of_node_put(phandle);
 
+	if (a6xx_gpu->have_mmu500)
+		a6xx_gpu->llc_mmio = NULL;
+	else
+		a6xx_gpu->llc_mmio = msm_ioremap(pdev, "cx_mem", "gpu_cx");
+
 	a6xx_gpu->llc_slice = llcc_slice_getd(LLCC_GPU);
 	a6xx_gpu->htw_llc_slice = llcc_slice_getd(LLCC_GPUHTW);
 
-- 
2.26.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
