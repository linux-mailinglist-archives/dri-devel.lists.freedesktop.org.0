Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 625BF3B3216
	for <lists+dri-devel@lfdr.de>; Thu, 24 Jun 2021 16:58:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE6F16EC17;
	Thu, 24 Jun 2021 14:58:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA1C56EC28
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 14:57:52 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id f13so8140425ljp.10
 for <dri-devel@lists.freedesktop.org>; Thu, 24 Jun 2021 07:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=7LSD+0UwStyFklWVh+hnsHGUn+QhdxgAc/M+GEYmbyE=;
 b=QgPVQOTtH26cXlqMiPK4vS6KzVyPJcDWVVUHj7L3iv/KjvaBF5FwCpaFl/9VPlnEGQ
 sZZT3Lf952DxjZAy4AWzu3g5REwDFnBhH8G0r9w7rOYJM1HZP/EF1UfT7pMsGsOnBYbv
 f+waMK10AUUAncvmNnzalptUejc0COvBtu551LzFJUmro2pNjxATyopoClq6PgJIpHVc
 a124A2dGbhvyzkbgMGxmrV5+annKHc+epI4eBoQwzkjNwlukiOTnHS559YEmERg29V27
 fUH90KAOu04JnUWj40DCYlQ06nnewiHVA5BXumteyePNtpIOenJhCsmLnmspIXpYZfS3
 Ao1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=7LSD+0UwStyFklWVh+hnsHGUn+QhdxgAc/M+GEYmbyE=;
 b=bX1+GPXe3pM4zVtYW85TeZcGfKsSW4Y02MuzQCmfBl8U/MNlscgv1B3bGbizMUH9wL
 bvjKQa5DH3XHptUxUm9d/NV0wx83TC+1c1jMuOAYtW84uLHPU3UItRMmJCK4ihw1wNcx
 dUrWIx3pU2xbI2kL0KkkBPfOu/GLG++XMKnpE6tYXG6TcEtCSpiPm0tJZkYKlEaZfOIP
 Cyp4VUx9+pWLGkzgjtR3FqAe1YZbe7o4F7VNs+V9Bc3Atp9Zni1sPEQAEMZ4oXdPfQPM
 yJHLw19CS+6By7fwjLBH3QlsTJLwRHkPw8LiMorVXYMGRLIumV0JEzUBrGTpMJqxLlL/
 V8uw==
X-Gm-Message-State: AOAM531F5/oMm+vqGE7XJYGhDAat2IVUFAzF1xCJUJEwjwZDKE/XRcen
 z/nV2jE6/CQ++mIOVgWb3qflzw==
X-Google-Smtp-Source: ABdhPJwA3u1lfwhABHDdSmtduAEq/8vtdNBzloSloIzE0i7sm7viYZEwKQqjku5laUXEXohfYsAHBg==
X-Received: by 2002:a2e:9088:: with SMTP id l8mr4188125ljg.144.1624546671130; 
 Thu, 24 Jun 2021 07:57:51 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id e17sm306329ljn.125.2021.06.24.07.57.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Jun 2021 07:57:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH 17/17] drm/msm/dpu: switch into using virtual planes
Date: Thu, 24 Jun 2021 17:57:33 +0300
Message-Id: <20210624145733.2561992-18-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210624145733.2561992-1-dmitry.baryshkov@linaro.org>
References: <20210624145733.2561992-1-dmitry.baryshkov@linaro.org>
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is a compile time #if for now, to be converted into proper module
parameter (or dropped if there is no more need for that).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 66a1c8889cf3..08b47609a315 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -611,6 +611,7 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 	for (i = 0; i < catalog->sspp_count; i++) {
 		enum drm_plane_type type;
 
+#if 0
 		if ((catalog->sspp[i].features & BIT(DPU_SSPP_CURSOR))
 			&& cursor_planes_idx < max_crtc_count)
 			type = DRM_PLANE_TYPE_CURSOR;
@@ -625,6 +626,19 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 
 		plane = dpu_plane_init(dev, catalog->sspp[i].id, type,
 				       (1UL << max_crtc_count) - 1);
+#else
+		if (primary_planes_idx < max_crtc_count)
+			type = DRM_PLANE_TYPE_PRIMARY;
+		else if (cursor_planes_idx < max_crtc_count)
+			type = DRM_PLANE_TYPE_CURSOR;
+		else
+			type = DRM_PLANE_TYPE_OVERLAY;
+
+		DPU_DEBUG("Create virtual plane type %d \n", type);
+
+		plane = dpu_plane_init(dev, SSPP_NONE, type,
+				       (1UL << max_crtc_count) - 1);
+#endif
 		if (IS_ERR(plane)) {
 			DPU_ERROR("dpu_plane_init failed\n");
 			ret = PTR_ERR(plane);
-- 
2.30.2

