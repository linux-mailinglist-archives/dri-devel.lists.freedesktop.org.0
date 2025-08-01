Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE260B18478
	for <lists+dri-devel@lfdr.de>; Fri,  1 Aug 2025 17:08:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E1A910E8A7;
	Fri,  1 Aug 2025 15:08:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ip2oZSJn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
 [209.85.214.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A25A510E8A4
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Aug 2025 15:08:00 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id
 d9443c01a7336-24049d1643aso14321575ad.3
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Aug 2025 08:08:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754060880; x=1754665680; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=M7fMxwobhtU9Fs42SW34CXR4Ei37EeIi3/yq4e+ZyyI=;
 b=ip2oZSJnMipqtoy1LE99G1tyUpsUi9IAlHIdQDOiNwFOzIxutsOEnCgCRiCoMnxYH5
 Q+o7Zc9rNy7cbw5vXU+dgmv+E+/MRJWbhDN5v8U6gVFObXXOt2riL8owtRs+bhBQGe6/
 67NxP0LE63zb7nKuJjBa6vdD7VTHVFOzW/ic4d5B6dQYwrsPauAziNtBTV/J19Bz/P5b
 WkxFPk/WGJmlsbkEtTapG/EU+Mphh+4AW97ujK6phDcbZ1bjzAAd9qNjzLP9/Vk5jIR9
 K5Nxk13Ao1Dp0bCvW0HkRRvP39VIrEfogoMh0meTiXMAYU2YdMpRwxDklWm9lkSBNbgM
 vn7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754060880; x=1754665680;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M7fMxwobhtU9Fs42SW34CXR4Ei37EeIi3/yq4e+ZyyI=;
 b=CbHR/J8JtPsIKm/psQpu/k0tW8xNC8Q46di99nNOnCcs8LS2vnTKDpqO7qjdgiAYJ8
 uEGFspmpvfTiWg3VBoGPx3np31vgf2FkczGEp/PPP9zPXvYrQDsTAjq3ZjRkA9njvyKa
 z/BYejo3brC+JuqAzUjAZ2mNTLOY5P84+/UqLQIpP9R7sxIT7zlwXYXspcV/ehvfdXOB
 zJJle08c6S5nAMCHffd9h9Se7rDvpw6VVFUxv6IMJgUvcywVjdBve8A1qWEkDPqRUSe4
 I5UTaohqSpTWnQeXV8CK5b5lj06PhXOmXv7gGjDdLdh2c8XLpdCNupTwb3SY+Ks5q0Iz
 4ImQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUC2bZdvR+qnxAPRjE3xxkPpwAe3leGPYP74f/4t6pgAhKwpArul2iDFSbT1Tni8DrTQw0Z7tGv/Ls=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzjgn8e1v6VGO0XMTahZG8/nmmQmB9EzUO1qekTZ+6vmUWd9NNU
 ig+6o8LM74r8oShwYeU4GObKWJfTtDcxqTMcI6c8BPdOuTkvQlQu6/9TQSBb2uiLeto=
X-Gm-Gg: ASbGncuqOU9gVU7xApMjrTLEJ4uUJP4iPxfe9xSqyz4nTB/d9QMmnSKwaWqryP8IDaC
 iZiCBf7Itb1MCBMmtUbbmGBp8/nxgAYWyhlHAUAyeztyBVNQQfEMwyThc04ejN/IbUHsfvibBSN
 dgfiDbV+Ilf6BT7GeTD7FlG1JuLqZXO946VLW/IGWwf1mEahQXS4ziDgK60UMXSFIzLJohooGNX
 lg/O1/IPf5cSZ+HbjTWiOM5Xd6Te5xklvNqxHxGsddr2me7JKjfJPa96b6TFVoPSUNHRBbk7q/d
 dMEQeAdUnZMomgtjEyr8vvwubqVVJJp2JmwxL5R3foFwcT551paPAPqjzhElp31i7A4ABeezqzj
 xr6asUsmWIFNIFkeznA==
X-Google-Smtp-Source: AGHT+IH3qH1C2C/DUvH+RVcCZ2KshGNz0QCudBxgmDLP9cSlPWRBKjVKTxVWslYj7VJGc7sAdPEqKQ==
X-Received: by 2002:a17:903:2351:b0:234:f580:a11 with SMTP id
 d9443c01a7336-2422a44b2efmr47017025ad.19.1754060880024; 
 Fri, 01 Aug 2025 08:08:00 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.60.64]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8aafa11sm45639705ad.172.2025.08.01.08.07.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 08:07:59 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 01 Aug 2025 23:07:26 +0800
Subject: [PATCH v14 02/13] drm/msm/dpu: polish log for resource allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-v6-16-rc2-quad-pipe-upstream-v14-2-b626236f4c31@linaro.org>
References: <20250801-v6-16-rc2-quad-pipe-upstream-v14-0-b626236f4c31@linaro.org>
In-Reply-To: <20250801-v6-16-rc2-quad-pipe-upstream-v14-0-b626236f4c31@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754060859; l=2319;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=xSbmnUPPIXthlmIB0KVW45Mr6GQu0WXNqCZGA6y0yZ0=;
 b=uf55jKKnEF2lP7JtE+vnAiUK5b0V6GRdSs6zOt8Wg4FWSYO07vZYpVojDvT59dzvoc6lrnj5W
 14tQZKfsvBtD+dC47ohiCQYc9/Y7qa6qnvsoojWR2ih1yZn1HVbdN8/
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

