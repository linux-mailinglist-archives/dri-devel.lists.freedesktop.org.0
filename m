Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BA5A2A5CE8D
	for <lists+dri-devel@lfdr.de>; Tue, 11 Mar 2025 20:02:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 759EF10E67C;
	Tue, 11 Mar 2025 19:02:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="UlTjhGnG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
 [209.85.221.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDBB910E67C
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 19:02:46 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id
 ffacd0b85a97d-38c62ef85daso571854f8f.3
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Mar 2025 12:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741719765; x=1742324565; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=A0d0ZttAFtkwUxOwwsVTFt/HnprneOl6Wo5KShqPwIY=;
 b=UlTjhGnGjf3Bzb7WjrUpbdgmfd2s69/56mgnePwzUZ/Vj1qCUa2WABs64Sh/JDy1ng
 OlbL17eaRYKRYB8JRaL34l6QKwRd3aYb1OPw6PSlT/2qacUUysIyitOBbhNo3cT/V8pJ
 LoYeP4W+MwWyiFd+8pn01BlZ+rrP9UCKXblIU8yO4hRyG/TFMTECTSAbWVkzVnk7OKIg
 OC5awOB72sxM0rSh1laieQLwJVLP+XZMFdc/0wC+QEilKSRWZTsUxcXKp0uB6tarXvi2
 pwgUlHmteNpKfvYeQe7iNTno6l/lfX+1MnargzNj4GOXd3mbdfnXIBinNFX8lWd2hkBh
 Pbng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741719765; x=1742324565;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=A0d0ZttAFtkwUxOwwsVTFt/HnprneOl6Wo5KShqPwIY=;
 b=hmWLJqyDjtbBvLVd1Uf7hxIWnPGTPks1Fza5h6ZW+EZQDWA+dDHuXxBD5wSbzEjJ0Y
 PjLTI8Bc7Frq1dY1zfOv/4CuN/0LQ3+8vL7ijB2p4foNfh0ncRTZGoPgRAUAsLRAI1Nx
 wsk0tK1kPwLaYQKVs/zCy5lhBOxg+B7PKF+MTX2uVdlzRJVANx1ZNyyvMN5ha7d2/kTZ
 YWir/4SoIX3AJct4BG1IE5xNdIvqdWZA6RUyCby+KQ6E7AY5qJlqqL6j9dL3Iaw8ECTe
 pirGTpF3UH/MZ6eluJU8d4shTYgOemoGRrlYcFp3T2aCUvSzrOUm+3zrjsaHBCCI41AZ
 Xu3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFs8V4E/2coX6HRBS8n9RY2JCKTBWo5yRsRwt4Mm57b5BbYl4HUQFBc57jOx60BQhFX+8NEqHBfug=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyb7/dFUjQtHRsg1yLRDOWPUeRco/tYQrcCqZj0xDrH5pC0eMI+
 ccyadsbU7fYeJ5HnbO8KUDGGWtX4cdvm+hH+D8229Er4Vo7yO+VNOuHc/jPYvMY=
X-Gm-Gg: ASbGnctY3YOTCrc59S6zvvJKBltTuEcu6pga6DRv8XXdeiEE/rUo3lbC0FaDxQNgddm
 hLjufd4WYvOWWmvDL3w8YLLboTqzuQlZTp9nPay6uvW+OFNt2/2wUJqo/DUJ3c3RuRFbn5ZgJvG
 r7vaCrEmW6umFaOc5bi/MA/4a8bo+cZ8iV/+9xxu79UxaHxLbuFah6nb7zB6P7vvjHflWkpRZJ+
 W3hQlKKW/rvhj2XlXoWdsZpzjF11lZnju52WPhQiq7ipZnq5em9vpXv3NizSEzTjJlE4U9YnAgL
 FASY47By7DxErj4Hc4LmGpezoFh11oXVplgxBk033agnh4H0GFr6YRM7lH4=
X-Google-Smtp-Source: AGHT+IFTq1fzI9DkxH76SuI6zs9b5L+7VoKkIdA2FrUOKKcp1yLpAGWBZ+iTVuss7hP++dlwksCTTA==
X-Received: by 2002:a05:600c:1c1f:b0:439:a30f:2e49 with SMTP id
 5b1f17b1804b1-43ce6d46431mr46166985e9.5.1741719765380; 
 Tue, 11 Mar 2025 12:02:45 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.198.86]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43ce70d13b4sm127681155e9.38.2025.03.11.12.02.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Mar 2025 12:02:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Tue, 11 Mar 2025 20:02:01 +0100
Subject: [PATCH v4 11/19] drm/msm/dpu: Add LM_7, DSC_[67], PP_[67] and
 MERGE_3D_5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250311-b4-sm8750-display-v4-11-da6b3e959c76@linaro.org>
References: <20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org>
In-Reply-To: <20250311-b4-sm8750-display-v4-0-da6b3e959c76@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Rob Clark <robdclark@chromium.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1188;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=rbASTPjBDVDuXUnK84Co/5HFSWBJv467bNqZtllby24=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn0IiuAtRk7ULRCYHnIA+Yy3/Ys1ZPh0+TZ6jAi
 P/Zjo0rvv6JAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ9CIrgAKCRDBN2bmhouD
 1wEWD/9XY1AwSdm0gW7NukB2Yk9ql/zcWkUHY5jiG73tr03VG3aMj+LWrhmvCOQ4sn6OnBma8Ny
 15V9ldZXcpHXWklX4FE0zsluV1rll+L9GbUXN4xmo3GSLzqH96FdNJKpsMLoa8FGR93zt59O9ZK
 UJQvH9frlTY+jrfneZKUtSW46yIeX4P9DxFOLvKWyBU0olISugqyt6MhGTG0CoTHBFjfHDcnzhQ
 YNSo5st8TgNSUy4hUzh9V4bWC0P+ZQVes6DZ6cEvd1hDO1ryGIgPAoXwnpZdF/NJ7UY5GLiIQiw
 VTcNNzixZswnUejfRvdrrvkseYnKLYWwPzPdA6z6OridtQecwcfX8C/Bn49yRW2UucP1gt/jqqJ
 xb4BvVJkzoya3U5bLvugbhjZMWHXA7Sy448EDmIGCFroSCZsXLs4AbKa+W7iR+Fc+3PqG/wGhHN
 S/FcBjL0WCCwrxhes44a3tffmSeFlOefZ8TtxtpyzIMQtjZtn/MjWtXXLcCpwBDKfjni+vEEgEN
 GoD/Iev+vnVSmCiHGATQHkX94gK4hKp8sUUg4Bj2CEVJJ3j13r/2HdHiEbxgZN40A5IUT3RzByf
 7oLh/jj+OGSf4WMVosWDhUEplJwcOvXc12k2D4/I+9DKM8+0YjaeJXQfoJkx+wkXYws34QkqXDh
 Wdb/h1wX2bpPRWg==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
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

Add IDs for new blocks present in MDSS/MDP v12 for LM, DSC, PINGPONG and
MERGE_3D blocks.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
index 8d820cd1b5545d247515763039b341184e814e32..175639c8bfbb9bbd02ed35f1780bcbd869f08c36 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
@@ -125,6 +125,7 @@ enum dpu_lm {
 	LM_4,
 	LM_5,
 	LM_6,
+	LM_7,
 	LM_MAX
 };
 
@@ -169,6 +170,8 @@ enum dpu_dsc {
 	DSC_3,
 	DSC_4,
 	DSC_5,
+	DSC_6,
+	DSC_7,
 	DSC_MAX
 };
 
@@ -185,6 +188,8 @@ enum dpu_pingpong {
 	PINGPONG_3,
 	PINGPONG_4,
 	PINGPONG_5,
+	PINGPONG_6,
+	PINGPONG_7,
 	PINGPONG_CWB_0,
 	PINGPONG_CWB_1,
 	PINGPONG_CWB_2,
@@ -199,6 +204,7 @@ enum dpu_merge_3d {
 	MERGE_3D_2,
 	MERGE_3D_3,
 	MERGE_3D_4,
+	MERGE_3D_5,
 	MERGE_3D_MAX
 };
 

-- 
2.43.0

