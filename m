Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4A87C68CC
	for <lists+dri-devel@lfdr.de>; Thu, 12 Oct 2023 11:01:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4571910E473;
	Thu, 12 Oct 2023 09:01:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4892D10E470
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 09:01:35 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-32003aae100so1207954f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 12 Oct 2023 02:01:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697101293; x=1697706093; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=q+pO3IusB6Bw/Hr5HARw2srJIw0uRRAbPFroWEjy80w=;
 b=pmYDIcVhkfbisfPVT09mTwF8NtucDAAk2jPiGucRarB3Gpd/VGhWhFmuDJx1RwQse8
 eNiUc1RwfNromdohNltDo01CzKYZ0MPgdA9A0c4d6Ypk4ziIg5Ed5Bbmu4rYg6sglFMx
 kZk7d0I0ffuyO4qNRv21Os5okL+8K2xfTl/owEMFePLDjXx75v8e08kys+evFlbsnz+/
 PPJ6ApGaxzodJn+oRD/B87m0+rOFYRQW34vPudp4CFQRSN1aWBgy5c+U8bl9ntU3QyJL
 QlhRtK3EDTBiBYfcJ6ThcqYV3gJrmARap9ASkqFwJ4GgWRNjxttsdkNxz5FEJqcgP2iL
 w9Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697101293; x=1697706093;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=q+pO3IusB6Bw/Hr5HARw2srJIw0uRRAbPFroWEjy80w=;
 b=xQvdU+sNkgMClDJImn/cPFLl426kByqzdnPVGmhxnc2loUYZLv6cVGv3WKdaTHEyLO
 qexurDqSh5LYUzvHDL/LkgOBVzFFYSI/BQRbOdDUtpqCkr62O7pP+VHuTHNHxUOAp+kl
 XYDhPwrH+T6aaN8sNPrQhgkYidZE+YcrKEcyuP5jchNhWkStKqaIcmZZAQLgasGVb/or
 2cPC+JQt65GJYylHU99XGpN0Qb8DI5ccwGqFKhVE8DjVhfz+72iNxLxUzITyK1aAkVin
 cEmdHEkBiumwL/keT/rAEEIPmBboFlFMDmxMREmz9a35f3KtLCM2/mwEgwBLnjWVLoO/
 a5WQ==
X-Gm-Message-State: AOJu0YwhvJpCooAZwADbkekTWbVppWjbdrb39TXbSLSC+eG9YLkwabvI
 VX5/H4vjL5tDhBMMs683fVDaWA==
X-Google-Smtp-Source: AGHT+IG8WccrRyCK/XDBM3PYDRcZNDL+ubfoPWuWJiH8G0N7gX1v/lDr8/+ydN3sEm7izyd6Uuqd+w==
X-Received: by 2002:a5d:595d:0:b0:31a:cca0:2f3a with SMTP id
 e29-20020a5d595d000000b0031acca02f3amr17203729wri.0.1697101293480; 
 Thu, 12 Oct 2023 02:01:33 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 c16-20020a5d4f10000000b00324ae863ac1sm17811176wru.35.2023.10.12.02.01.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 02:01:32 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v3 0/5] drm/msm/dpu: correctly implement SSPP & WB Clock
 Control Split
Date: Thu, 12 Oct 2023 11:01:26 +0200
Message-Id: <20231012-topic-sm8550-graphics-sspp-split-clk-v3-0-4bcad69812d3@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOa1J2UC/5XNyw6CMBCF4VchXTumF0Bw5XsYF7UMMBFp0yFEY
 3h3Cyvd6fKcxfe/BGMkZHHMXiLiTEx+TMPsMuF6O3YI1KQttNRGSVnD5AM54HtVFBK6aENPjoE
 5BOAw0ARuuEFunNFoDtfSWpGoELGlx5Y5X9LuiScfn1t1Vuv7Z2BWIKGSpZMNYo65OQ002uj3P
 nZiLcz6Q1XqR1Un9apV7eq8aNriW12W5Q2NO5sCLwEAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2419;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=xVwF2wCj+2epUmlO4jNCKz0K0MhWs+/80Nc2sJa8Kag=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBlJ7XpV569dzspU8hJgWuEwo8SdZzrDYfclZRso/u9
 HRViSGSJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZSe16QAKCRB33NvayMhJ0UDbD/
 0QQDRn+gUqbImdHyKol03IJh2u4YzK23wPoHQOWPjfG6OhkeER00qDRIWAwKhqj0pJq8vqhVCw1wRe
 3fRz1eb8RMkBhvUCaD343d+g2nr84RsynsilUmFn34YdnzK6wpKT9UV0OH2hfIRPP+IGXg/jA0WCvS
 yFLhkAgIwIDSCn80B5CWROwTr+Wx/AGO4OpqQB41vyZJX31KSGj861L0QxfaGJdEoMaR2vL+I3yfdp
 mvp4u8GWMA88UzN8c437LNRlXFGe4jhi4rQQQ062Tmz7V/aefh09I/6sR/2IH36pIfRyVexX6QUarW
 p8ZFe+sZJ9Ri3bLhyYUrAlF7HkHuUUveXpV3+rG07pEDLzmVle0wxb0bxChWMEAID66ZP0SGcWRHuO
 zOxNwcLQV7sI4R4u6lNslUTHqhRzMw72QIj583mzydiKLvyZGv1R7oS2/R+VqdtD7ztxc2BdGYYwLU
 z68/7DQmGwsrLb2N0AJPuzmiGjf7aXNKoJbiN2EnUKcKGziC+mNNJHfSmjb6eEpkt64+j0eEYd/+iC
 bFGn/w+UCkFNhZ9aZAZBWYXV/caCb22epHtqvkADhycxSBuZers26TaaQuadrr0ofRAJ+DHhxhRYe5
 O8jhfFFrNGixOOr/Gey7+cI90uub+2ncUtkXKs2o3hTG3l1lW1jx+l7j7ANA==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Starting with the SM8550 platform, the SSPP & WB Clock Controls are
no more in the MDP TOP registers, but in the SSPP & WB register space.

Add the corresponding SSPP & WB ops and use them before/after calling the
QoS and OT limit setup functions.

WB tested with:
$ modetest -M msm -a -s 40@103:1024x768 -o test.d -P 47@103:1024x768

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v3:
- Collected reviews
- Add static const to clk_ctrl struct in sspp/wb
- Link to v2: https://lore.kernel.org/r/20231011-topic-sm8550-graphics-sspp-split-clk-v2-0-b219c945df53@linaro.org

Changes in v2:
- moved all force_clk_ctrl code out of vbif
- use major ver test to add force_clk_ctrl op
- do not add clk_ctrl reg into sspp/wb cap struct
- add WB2 on sm8550
- Link to v1: https://lore.kernel.org/r/20231009-topic-sm8550-graphics-sspp-split-clk-v1-0-806c0dee4e43@linaro.org

---
Neil Armstrong (5):
      drm/msm/dpu: create a dpu_hw_clk_force_ctrl() helper
      drm/msm/dpu: add setup_clk_force_ctrl() op to sspp & wb
      drm/msm/dpu: move setup_force_clk_ctrl handling into plane and wb
      drm/msm/dpu: sm8550: remove unused VIG and DMA clock controls entries
      drm/msm/dpu: enable writeback on SM8550

 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h | 36 +++++++++----------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    | 37 +++++++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        | 21 +++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        | 12 ++++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         | 23 +-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c        | 21 +++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h        |  4 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          | 20 +++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h          |  7 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          | 42 +++++++++++++++++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |  4 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c           | 30 +++-------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.h           |  4 ---
 13 files changed, 173 insertions(+), 88 deletions(-)
---
base-commit: 9119cf579b4432b36be9d33a92f4331922067d92
change-id: 20231009-topic-sm8550-graphics-sspp-split-clk-43c32e37b6aa

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

