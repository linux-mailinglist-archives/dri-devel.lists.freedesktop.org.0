Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1186FB9A76B
	for <lists+dri-devel@lfdr.de>; Wed, 24 Sep 2025 17:08:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5166710E742;
	Wed, 24 Sep 2025 15:08:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lC5yQ43p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 677DC10E742
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 15:08:27 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-267fac63459so64756885ad.1
 for <dri-devel@lists.freedesktop.org>; Wed, 24 Sep 2025 08:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758726507; x=1759331307; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4cPuMIb0mZC5xOmyRNwA38vJPNTs1ammKswmchiIKuo=;
 b=lC5yQ43pAnN8S8v0otAtWLwqhVrz/O8N/Y+Vq41+7zpc2vJ/xZJdojXpF2v7jN46yW
 QnreeFYxdskMqlhWN4zOqRwimeNn7DDCzYooUsFuaQ8w/Mszs2tEBKFjWYgvfV7x5S4t
 Q9KGP1GURL2mOcg8pJmUxmnZSanRHNbrk+GRjM8t+HvPG1ydie+MVV4Y6ruFFuZmhlmF
 tJDOWE2glBUzJdL4sHRq7zt1pxz3/poZYTIWnxi+GMk8yNinuLGvhGY6QXTAUi7Tdxuj
 x5lNIWcmfGNSH7eegkEpUCmRpWGQPYM7MyPvPt6Rd+m5fcd46qV6OqS3mnyKwyNKcbE8
 QUaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758726507; x=1759331307;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4cPuMIb0mZC5xOmyRNwA38vJPNTs1ammKswmchiIKuo=;
 b=sD8fWnJFLJVuzzr/eKzqDWSxUfTcnIIt7z7qDR/47W3/0R/W/vNbFf1aMuxw52aYfU
 YaWV48KT99dnvbQMVzFufrtqYNgGpo1qyG2R/GjV8q0qhGM6Edenx+mwVKqcQ+MYpM/a
 oIsvtVvsAZlVoK6gDZ/sE9q662IF7T8hYR3CTJIzqsoqU+MOy5yz2yTT1aaJoQy8xGun
 quhx4pbD+bhdDnV98QUe5ad/ktHVkuu6L/wuBtV7z1C+nWzPAvVjEAFHVPaaChxX3MDI
 TEWznlGAw5nhZWbmCF1M8NozhPLL/XGUNql/ygSduRYERRr0sNycCf6c0ax4xfxlwnpq
 kdbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVfwuuVHJFFwflYvYYGZ4EhSvZOb4h22hDdqVZJgqAo3Kg2bh9+DzC/af3nw//yKSXZdBezzgf20/Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwYq0joWuRDJ+vibvBKiDfxjpxbkr5pmEQqJi1sxMw8a6TQCAiH
 k4zl/7lqmrdGn4jYtJkaOnPzKrnUXsoJY0FAoEbRcofghv9e2Nu5HJT9HGFiSPCXAAc=
X-Gm-Gg: ASbGncvz3it164OS7FN7RvANBPAT9QseN3HT19gEYNPq1o3/NANA47aCw3Vq7jsj0bF
 vT624SfFXKK2Jcd1SfWxIxKOevi4L3CGsaGF9KjLV1VHEcD6bKgiyjiaiww1yeKkoQdeOPXyNF8
 msdzcmcfnuLn0hyYqsbeTAdfpqq0evDUa+itwPutagAzs3GFQBke+ktmeUZCNHPNAg2wcA0NvD0
 897xUpXiJHEucSpXEwXq+Grm5iPabA35mtwAuiFpoL27YfxHATQ1DslyGwWVCwvBd15Q9Pxg7me
 81DbCBaEC4CidHjmUPkuLSqZPgk7DkD7PArCHlMA+zsgvMETy5CS+DQGRhSQaCkSLI8DW2lMKmC
 mbAnVlKvT0pDRzXqF
X-Google-Smtp-Source: AGHT+IGdO7AHe6Adr0JVRoWrxVhan7hdmVuVEYOGDB1J6Z6YlniOSroTOkT9XhR+htou4GY59pzHXg==
X-Received: by 2002:a17:903:244a:b0:25c:d4b6:f117 with SMTP id
 d9443c01a7336-27ed4a3de3cmr643585ad.35.1758726506852; 
 Wed, 24 Sep 2025 08:08:26 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.61.5]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-26b59d6538bsm158717445ad.82.2025.09.24.08.08.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Sep 2025 08:08:26 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Subject: [PATCH v3 0/3] drm/msm/dsi: Add support to 2 panels in bonded-DSI mode
Date: Wed, 24 Sep 2025 23:08:09 +0800
Message-Id: <20250924-dsi-dual-panel-upstream-v3-0-6927284f1098@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFkJ1GgC/x3MwQrCMAyA4VcpOS9Q2k5wryIeookaqF1pNhHK3
 t3i8Tv8fweTpmKwuA5NPmq6loE4Obi/qDwFlYch+DD7c0jIpsg7ZaxUJONebWtCb0zEwqd448A
 zjLo2eej3f75cj+MHs2l9smkAAAA=
X-Change-ID: 20250924-dsi-dual-panel-upstream-4aded63bd2d5
To: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jun Nie <jun.nie@linaro.org>, 
 Jonathan Marek <jonathan@marek.ca>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758726499; l=1682;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=iNszQabvn/lRi8yKKlr/FXddBVqjWQ7NUr1nerkkTZw=;
 b=R2JXFonK7pFkgd4mj9wIsv4DU1DOmzP4CuuDG3BZ/JK6k5rr3gcqHOzQEIW1nXqyTrVMHMRSN
 vZyLYGivB+2CKc7hjk474vCOrc4Ysh6AtEp/hbcX0DDEj6SpaIaO1sL
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

The 2 DSI interfaces may be connected to 2 independent panels in bonded-DSI
mode. Horizontal timing and DSC configuration are adjusted per individual
panel in DSI host side. Support to multiple slice per packet is added for
the device setup to test the usage case.

Changes vs v2:
- Polish commit message to describe usage case and requirements to
  panel driver.
- Remove changes in device tree and add dual_panel flag in mipi_dsi_device
  to pass information from panel to dsi host.
- Drop the register programming to DSI_VBIF_CTRL, as no issue is seen
  in latest test.
- Link to v2: https://lore.kernel.org/r/20250220-dual-dsi-v2-0-6c0038d5a2ef@linaro.org

Change vs v1:
- Add device tree binding for dual panel case in handling frame width for
  DSC to avoid breaking existing dual-DSI case.
- Leverage Marijn's patch to configure proper slice per interface in
  dsi_update_dsc_timing().
- Polish commit comments.
- Link to v1: https://lore.kernel.org/all/20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org/

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
Jun Nie (3):
      drm/msm/dsi: support DSC configurations with slice_per_pkt > 1
      drm/mipi-dsi: Add flag to support dual-panel configurations
      drm/msm/dsi: Support dual panel use case with single CRTC

 drivers/gpu/drm/msm/dsi/dsi_host.c | 35 +++++++++++++++++++----------------
 include/drm/drm_mipi_dsi.h         |  4 ++++
 2 files changed, 23 insertions(+), 16 deletions(-)
---
base-commit: a3306041f55d0f86c40d06eaad1d4e8f06e4483d
change-id: 20250924-dsi-dual-panel-upstream-4aded63bd2d5

Best regards,
-- 
Jun Nie <jun.nie@linaro.org>

