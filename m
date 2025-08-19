Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF551B2B604
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 03:31:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16D8F10E504;
	Tue, 19 Aug 2025 01:31:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="luZvikdq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB49C10E505
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Aug 2025 01:31:16 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-b47174beccfso4047580a12.2
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Aug 2025 18:31:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755567076; x=1756171876; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=M7fMxwobhtU9Fs42SW34CXR4Ei37EeIi3/yq4e+ZyyI=;
 b=luZvikdqiHJXvCucuzZwXBcJoLtrlGu9KjSldveLs3SkQq1MSLtDPg4S98QGg8sZkU
 wDW2Y3gTvJViPZuizi3wLdTPYea8lPiOFmIJkpfJQQgUOFxcOe0lPapTru7aB9NRJbHA
 eBWAY65E67c8U35hb/i+KBBgrD1kU9UzP40nvtfZzxhv4GR8r03dzrQpWE21Ydm5Jz6U
 402KIx7MEL+pqyU5GXwQqk87DXAR12qET31UMSFQFmeDd4C9JZwNnZ4I+S6ewnr6qp14
 yuZ0/0AjYeiVqYtSCy2cw9YJx7+2gLYKj5V5repyeX6u4Sw8SZapuPdWipbnxwzwrSyT
 zQMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755567076; x=1756171876;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M7fMxwobhtU9Fs42SW34CXR4Ei37EeIi3/yq4e+ZyyI=;
 b=VnGJn56OwPhDlKGJuBuGJvaGJC45BWXg6ABYmIbiwEXAJWZdmSVt0evJs9Jr969Xd2
 VdAqlO2dybiRjdHgR7HMzkIt0no3oEBudwR+EOqD72ytgoKd43BxlWKCYhsN2LL4sXgu
 MdKIqrl8UxxAaMeyPb5LCE7ctb+hw9qOo67XC9Fl0lfs9p2H63E+9Yd9bXCKd8Nph9e9
 YX4XsbL6iBBj4yTz3PfmIfojOZ5IPt121SUyb7gfb1M61/jPKeiPwgpCOf8f2qjq+q/G
 vR6rnyndiFdKyvs2Fv+0jwqkeNh2R6tpvqBWvQfJaKUaJxmJizGQ2rNu27c5iExM0DxZ
 UjFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUv5FPSPgH0RFgq/JVTm8cce+qPM+dXbBY8gPLwwBDSscud2apBBvqLMw/YcoQeWCCrk7346RTzIaI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzUlZ+fFr7TtykEC+ZL9VkvZ3ZsiC6IIi9if8wq0VObvD0mRlmm
 f1EIBLQxWZ9tPUZ7d6Z4p149YeOaXEXWBju0G0VCkkuCDq9HcQq2FbEqe7BdapLgcj4=
X-Gm-Gg: ASbGncsOIVSDPVVVHWG8uuKxb3kKDKMezxdVJ1GYcEwXmS9fuIZ8Fji1UeUG688AYdy
 yvj3pEZNY04lt6ZHUzPzlPFQmANgctHm8TyRI7JZ85tz2H0H9yu/1ZdvcWLH4sDNlHsb75wyana
 sMB8PDQvWzK64ihdfT2UJcMPD4VgWvyh63NxX14DEc2CHr7NxSETiri8vgEGW45uUNs40DG5XDq
 7fuADlNgJsQ4GZ4ATcbC9P5ixMzR+VXzz1DMbXr6fyKcW5HZZsYC+Rhj4QJNY7u7UDEw9fZKE3V
 BpI7PcyRgP2/lhFUuAeO4p6hOQoiF/Cs6WvkiaAgdEwH4MATUC0asTcPORcyiLMuKVOeXf4pzOl
 Q66bv16M+U+bGNFp6iQ==
X-Google-Smtp-Source: AGHT+IGc62f0FENRiq1iJJCyeR6zVE6dbm5+xvtOaOIx8+XYv0D6voNmLjx95QQEIkkIIzZusMZnOQ==
X-Received: by 2002:a17:903:17c4:b0:240:3dbb:7603 with SMTP id
 d9443c01a7336-245e02cdb41mr10161765ad.19.1755567076089; 
 Mon, 18 Aug 2025 18:31:16 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.60.64]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3245e4faf80sm248637a91.5.2025.08.18.18.31.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 18:31:15 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 19 Aug 2025 09:30:56 +0800
Subject: [PATCH v15 02/13] drm/msm/dpu: polish log for resource allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-v6-16-rc2-quad-pipe-upstream-v15-2-2c7a85089db8@linaro.org>
References: <20250819-v6-16-rc2-quad-pipe-upstream-v15-0-2c7a85089db8@linaro.org>
In-Reply-To: <20250819-v6-16-rc2-quad-pipe-upstream-v15-0-2c7a85089db8@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755567061; l=2319;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=xSbmnUPPIXthlmIB0KVW45Mr6GQu0WXNqCZGA6y0yZ0=;
 b=TPHShK0eb/kc94OcL5srQlXFgh8cNETflmBhCcqX/LqO47k+aMecMT7R+mdU+DBvAU41VKW3R
 g3fgYyMrSAJCGTgfX4myvRhkkQwXXYvkI3EFbw9xIYQKRt/DkLP/AQO
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
index 25382120cb1a4f2b68b0c6573371f75fb8d489ea..2c77c74fac0fda649da8ce19b7b3c6cb32b9535c 100644
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

