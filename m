Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BA1379F9DF
	for <lists+dri-devel@lfdr.de>; Thu, 14 Sep 2023 07:07:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA1ED10E509;
	Thu, 14 Sep 2023 05:07:18 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF1F010E501
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Sep 2023 05:07:16 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2bcb0b973a5so7738011fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 22:07:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694668035; x=1695272835; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vs/sONTuFxT7d70u1Gf/NsyWFVFvMq5cvgFjVG2LwcQ=;
 b=yVlkhchEjBq3cUbhKHPdcPh6sxoYe5xlsBDnh4+bUsGBQFvxxYuxs190zF7XWMN5kz
 oN9W6J3J9ioMm/3WPOyIP7ERbKzmP4oKB/iUqWswDEc50UPeqj8i/vhV5kyLicAe0JBl
 GZTKiZOovBPxOXoeXV8c7bhcCBT0GX30t6VzzQz2ENfS9zWRAnOsUNgofl8+XT8y0RfJ
 CTOBjrg8jY49gb65qw4GDZer5SeVLGKLif345fpF6K/xootiW5Q3opWkxUQmh83V12uf
 9/T7g6PEasmqAIm76K/LXGs8aVkSGeukMnUyaNslFxHX5QBtxIyvKhF0aLWQ2jj/Vav9
 BujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694668035; x=1695272835;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vs/sONTuFxT7d70u1Gf/NsyWFVFvMq5cvgFjVG2LwcQ=;
 b=DpAFPdApnXJGI6ZZD1SqC9LzvuK/EF5IQ6rNeOzfEd1oVqO3/HjNEMqXPElmeVT6iR
 V7ABZfU9cCX4TH8UCzOuv6MHnhMbHXBIGjnr/DlNT1s4FD+i7K0XZIFYeE8CnMnVn4MD
 6HTnMDED0gOzgcVeTbxPN8rU8nh5vu5fnUc9/wTWdiz+gLzDFVcoB3CQIx4KboK+6Fog
 4oKkzuWr5xUFcvHBHjILVBwTACPLoPa/a0Hf5jEkAqIFZbgBwvQhZmqSLp7yLGnLGk0Q
 Vah6+eYC3NYFjnJ7XpAgi5FBajj01O0SveFMqttKIZfPD0jk4lEwV/yJltflzAoJqLBZ
 JxmQ==
X-Gm-Message-State: AOJu0Yy4VFlYyq2PVqKTVoMWf3Nn8uv8qecqaIrf4n63iy6Nti8mpXNh
 kNHUi3yd7Q3TycBwWjB+gHdgZA==
X-Google-Smtp-Source: AGHT+IH6O2piTZHZwFIo2Fwlnt1svDph1VIWIMOW7X+81g9pVSFKKiUOqkbXGM1zyqhxiI+oTigCGQ==
X-Received: by 2002:a2e:3602:0:b0:2b6:e283:32cb with SMTP id
 d2-20020a2e3602000000b002b6e28332cbmr3871107lja.23.1694668035351; 
 Wed, 13 Sep 2023 22:07:15 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 y15-20020a2e978f000000b002bce38190a3sm124777lji.34.2023.09.13.22.07.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Sep 2023 22:07:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 10/12] drm/msm/dpu: create additional virtual planes
Date: Thu, 14 Sep 2023 08:07:04 +0300
Message-Id: <20230914050706.1058620-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230914050706.1058620-1-dmitry.baryshkov@linaro.org>
References: <20230914050706.1058620-1-dmitry.baryshkov@linaro.org>
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Since we have enabled sharing of SSPP blocks between two planes, it is
now possible to use twice as much planes as there are hardware SSPP
blocks. Create additional overlay planes.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index 5106abe366a3..a6cd1346b298 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -792,6 +792,18 @@ static int _dpu_kms_drm_obj_init(struct dpu_kms *dpu_kms)
 			primary_planes[primary_planes_idx++] = plane;
 	}
 
+	if (dpu_use_virtual_planes) {
+		for (i = 0; i < catalog->sspp_count; i++) {
+			plane = dpu_plane_init_virtual(dev, DRM_PLANE_TYPE_OVERLAY,
+						       (1UL << max_crtc_count) - 1);
+			if (IS_ERR(plane)) {
+				DPU_ERROR("dpu_plane_init failed\n");
+				ret = PTR_ERR(plane);
+				return ret;
+			}
+		}
+	}
+
 	max_crtc_count = min(max_crtc_count, primary_planes_idx);
 
 	/* Create one CRTC per encoder */
-- 
2.39.2

