Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D6C2ACC0D1
	for <lists+dri-devel@lfdr.de>; Tue,  3 Jun 2025 09:10:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD1D710E6B5;
	Tue,  3 Jun 2025 07:10:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KnPmXMlN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com
 [209.85.210.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EBA110E683
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Jun 2025 07:10:33 +0000 (UTC)
Received: by mail-pf1-f177.google.com with SMTP id
 d2e1a72fcca58-742c9907967so5312603b3a.1
 for <dri-devel@lists.freedesktop.org>; Tue, 03 Jun 2025 00:10:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748934633; x=1749539433; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1t7c3igEg2x4olSUhClV/gNMpW/HqELZn2hx26e4MFw=;
 b=KnPmXMlNkugw6ZsoUehuDqkc5v29ldOJKLeOxNLrWS5+FlA7xQSkBuUuuZ+k+64NAt
 88eXBDJVy2dvVpF/k7wOH3xULZtwAjeLUc69Y2I2BoUy+HviRHPzxi+xIUt1+UCsXKtv
 7Y0ugEka86CMRJkH7uc6ed0tkiZVeUSXWIKyEYT3M3FXf2v8NClFzrjmok0ZVt0X+afD
 sqNff28VXMNk4RyFaQ7LdvXCg3MC40jxbaSh4nczdxYDBaUjvPqR6TJanWUDoYlsi6rd
 pImOLrO8cUWeAkEZ5Crny3KYKg9PdjFLhItNhAn52wCtMaT3APICiyVCnBH0H8uTM+Hb
 WI7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748934633; x=1749539433;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1t7c3igEg2x4olSUhClV/gNMpW/HqELZn2hx26e4MFw=;
 b=ihXkSvlJNAPsFEzMcaNsQygUxYEYXoSc4JbiDPwg1s3H+qc2GdevCC6EuVfiT/sLve
 ithHh5fk0SMKyEigDTtSgWIHBQ/do8KkOEWP/5nJxaYpyog7WyxsXNO5L1SxYI8eal3W
 KiNNXsIIZhbt4Lu/QYI+Xu2kNYtcqwhFjMd7WrvDNWAWmCv8o6jTB5i7GB5xbInmuGt7
 YpDUcGROaL/REMoPp3284abOigK+4kzvcw+NN/woO/Y26xoWv9G2Oa5XnmQrez3DeoG9
 NGPdo9LuEeRG2aea4LiQJbvTBtrGbV8u/qFbv6Moh9SuKghpElPuMYGP9ZzJBbKVgvyV
 1GKw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKMXjxKOTkngEptcLftOEjuxUq6fIVS1Dyl/cJyDK3x6oNiijUGwl7VJzupzwlzg/ypHz6m4grKlQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxTUjk1vnusp+1FWWtGrcUvlQyXeVduoyZhJAq1kmaOgMA3mOD3
 poWMuTYmKsnev7qgG5F8gX0kArpS9fqk3yEwnypaEH56pz5NlMMHDNdttRqgCjlecRg=
X-Gm-Gg: ASbGnctyYyQpLBZKCbWz849LDVNVbJhaR17DJ2BZW2sjAjMXdMcgd4Dzr3b7Mq2xnvI
 HTuaJO07iPD1gIBYO6OW38UScHfaqJujZ7JTZKXitRtMfjVu5GwkFDoJS7qx64KTOdObaz6CvPt
 t4YUURnO691/gpLII6po2eZRULkubhav4W3Fs0jnElYuj0xTeAhT4eYib1FLGB2+g+CE24Gg+04
 ZQk2WIhC3jWU7oCYllT974lqfgSDyRdd9UXwyvW72H2ZElqercX1qLcYejFSL3OcKrhFAkQfSx2
 n6qG7X9RHb88Ws1xP+9PANt7G0SUJs1iBeZ76yzuPGbmyNOLdw==
X-Google-Smtp-Source: AGHT+IGhn186Cm+vnsoRHYjc9kosc4UetejN+c6qUOaBl7dOWEiJ887EOTjGiRAG+l5vo7CHPAcTlw==
X-Received: by 2002:a05:6a00:cd1:b0:740:6fa3:e429 with SMTP id
 d2e1a72fcca58-747d18b7edbmr14666552b3a.11.1748934633144; 
 Tue, 03 Jun 2025 00:10:33 -0700 (PDT)
Received: from [127.0.1.1] ([104.234.225.11]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747afed360fsm8746481b3a.81.2025.06.03.00.10.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 00:10:32 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 03 Jun 2025 15:10:00 +0800
Subject: [PATCH v11 01/12] drm/msm/dpu: polish log for resource allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-v6-15-quad-pipe-upstream-v11-1-c3af7190613d@linaro.org>
References: <20250603-v6-15-quad-pipe-upstream-v11-0-c3af7190613d@linaro.org>
In-Reply-To: <20250603-v6-15-quad-pipe-upstream-v11-0-c3af7190613d@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748934620; l=2319;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=2tgdYLNBOLqvrFN89J2Z5WKCnyYFo8/7L7F+T0zCRyk=;
 b=au9Cd5Hg3dt74qPm3iY/6P6rtbXTzZrVAS6Bm9TdMAbVIWHpvB/yR93ZFE46uoxfineTAi2CN
 tm/s4x2z6UZDsE/ka42UYtvzrR7t7epECJHkjsZGaDX/ZIZfNiGtmjn
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It is more likely that resource allocation may fail in complex usage
case, such as quad-pipe case, than existing usage cases.
A resource type ID is printed on failure in the current implementation,
but the raw ID number is not explicit enough to help easily understand
which resource caused the failure, so add a table to match the type ID
to an human readable resource name and use it in the error print.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 23 +++++++++++++++++++----
 1 file changed, 19 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 2e296f79cba1437470eeb30900a650f6f4e334b6..2d8ff4b524715c658188fe56bc337e3ffa831c0a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -865,6 +865,21 @@ void dpu_rm_release_all_sspp(struct dpu_global_state *global_state,
 		ARRAY_SIZE(global_state->sspp_to_crtc_id), crtc_id);
 }
 
+static char *dpu_hw_blk_type_name[] = {
+	[DPU_HW_BLK_TOP] = "TOP",
+	[DPU_HW_BLK_SSPP] = "SSPP",
+	[DPU_HW_BLK_LM] = "LM",
+	[DPU_HW_BLK_CTL] = "CTL",
+	[DPU_HW_BLK_PINGPONG] = "pingpong",
+	[DPU_HW_BLK_INTF] = "INTF",
+	[DPU_HW_BLK_WB] = "WB",
+	[DPU_HW_BLK_DSPP] = "DSPP",
+	[DPU_HW_BLK_MERGE_3D] = "merge_3d",
+	[DPU_HW_BLK_DSC] = "DSC",
+	[DPU_HW_BLK_CDM] = "CDM",
+	[DPU_HW_BLK_MAX] = "unknown",
+};
+
 /**
  * dpu_rm_get_assigned_resources - Get hw resources of the given type that are
  *     assigned to this encoder
@@ -946,13 +961,13 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
 		}
 
 		if (num_blks == blks_size) {
-			DPU_ERROR("More than %d resources assigned to crtc %d\n",
-				  blks_size, crtc_id);
+			DPU_ERROR("More than %d %s assigned to crtc %d\n",
+				  blks_size, dpu_hw_blk_type_name[type], crtc_id);
 			break;
 		}
 		if (!hw_blks[i]) {
-			DPU_ERROR("Allocated resource %d unavailable to assign to crtc %d\n",
-				  type, crtc_id);
+			DPU_ERROR("%s unavailable to assign to crtc %d\n",
+				  dpu_hw_blk_type_name[type], crtc_id);
 			break;
 		}
 		blks[num_blks++] = hw_blks[i];

-- 
2.34.1

