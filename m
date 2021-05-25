Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 648953901E9
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 15:13:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DAEE6EA16;
	Tue, 25 May 2021 13:13:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DFCA16EA13
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 13:13:22 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id v8so41021381lft.8
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 06:13:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2n7j6woRRD2/J1RIFUHaJx0Us+qgUiMCWnRykbRfses=;
 b=NBzon7rqI1R9tCWpkRhk/EXuCfNF+AicrV7Gd/HCTnSZPRHtM8Rgv9Y566E7+1UA++
 pIPU0r++SaV9/6pXcLM2bwKKMiU0eUtC2LTUnzT9zRSwEyZCsa7/gce4sxmEgYUK4vFx
 VFMq/sGn8o3aIgtNlraSPWXOG6jJ+28OSUdDZ3JA3fYtcEzAnotVwxv8eoSSVoG1+Zf4
 3bvnCTiHhXjmnPd9H42sqwZj+LbPWaxFV7cG9YR/eR9uxhWKJcIpGmlWWCcFw8BmHqD9
 iI5STAQ+P8+RIn8f5zKhHJIvfDpzA2enhj3pVseF0hq/MVntuhMS4/4MaiE2Mm3M18vC
 qj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2n7j6woRRD2/J1RIFUHaJx0Us+qgUiMCWnRykbRfses=;
 b=hulP4RYwCNXYD0aYKlA4049TbansSfr0+4I9wEsDAjT8+fzjXBT8W5Ezehjp19Vo2R
 FLrYyg4qVu1y1JX4X9dN630q6hu8ee2WGbn+NRssYT4FlYof4chZ+afnLBjZyGjxlQmW
 kuGaDOtKSTYjzuwmVUyLPn7vTeC2KZUsbNnWWJnrc8Us5TJeQLJjZzgLO4QBztO7w1WA
 cZ+Nj2xngr7iEYvKqKDxo9As9BV8oQYAvxzNkhNuGO6SvaQulXxn7NrpKd1qQA5LGpbX
 1L/9gYZbevw+g+XeBNaBwPe9PzcF3rChcDuwSolfsXMPPiL23eOCAvbX7r5GiNaDvLLV
 AYsQ==
X-Gm-Message-State: AOAM530uIKDXg3fxLcHVgSrP9wak246cMmQ1vJzWw+dfbTYdL8IVCFKY
 KSQgjEXFX5j0cJPX3YYy5pQ8Lw==
X-Google-Smtp-Source: ABdhPJzTbNh3h70xYjMmgR0V7fYwVmNYQf+kSeh1zKBJpeS2uzDsqwIXtoAgPiuIzDsV89zLPAn3hA==
X-Received: by 2002:ac2:561a:: with SMTP id v26mr14551043lfd.602.1621948401346; 
 Tue, 25 May 2021 06:13:21 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id t20sm2101108lji.53.2021.05.25.06.13.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 06:13:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH 4/7] drm/msm/mdp5: add support for alpha/blend_mode properties
Date: Tue, 25 May 2021 16:13:13 +0300
Message-Id: <20210525131316.3117809-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210525131316.3117809-1-dmitry.baryshkov@linaro.org>
References: <20210525131316.3117809-1-dmitry.baryshkov@linaro.org>
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

Hook alpha and pixel blend mode support to be exported as proper DRM
plane properties. This allows using this functionality from the
userspace.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
index 90cd825df16b..9c678e336e7a 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c
@@ -91,6 +91,11 @@ static void mdp5_plane_install_properties(struct drm_plane *plane,
 	INSTALL_RANGE_PROPERTY(zpos, ZPOS, 1, 255, 1);
 
 	mdp5_plane_install_rotation_property(dev, plane);
+	drm_plane_create_alpha_property(plane);
+	drm_plane_create_blend_mode_property(plane,
+			BIT(DRM_MODE_BLEND_PIXEL_NONE) |
+			BIT(DRM_MODE_BLEND_PREMULTI) |
+			BIT(DRM_MODE_BLEND_COVERAGE));
 
 #undef INSTALL_RANGE_PROPERTY
 #undef INSTALL_ENUM_PROPERTY
-- 
2.30.2

