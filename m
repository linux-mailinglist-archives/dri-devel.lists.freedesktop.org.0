Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 33734A33339
	for <lists+dri-devel@lfdr.de>; Thu, 13 Feb 2025 00:13:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC00510E2A5;
	Wed, 12 Feb 2025 23:13:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="GKK3SeJ5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 065D310E294;
 Wed, 12 Feb 2025 23:04:42 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-220c8cf98bbso4023355ad.1; 
 Wed, 12 Feb 2025 15:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739401482; x=1740006282; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=izwOSozCDTiy2Nz+ObEcnYlYVvdl0bBlgB59WdBOADk=;
 b=GKK3SeJ5ObBNPnVFbKuVOnQK8qygX3ALsZo4pvV/ATkb/jBOuvhjqcWvM8EltDyrr6
 Csjaa6qGdkQuTeVfnK87pysq1yAO726e3iMCGdiVQgy7r0ZmpPfiVpT9hCz+bvHorctW
 KQTFwyMSW6N4c8yQLUd9tZdOdzx8n1/EYkxuXtRDjmHGRiNgdNgj3jcJDQg5JB01qdLC
 0yQLNe8e0bFUKEjGQsJwFAo6e7KQT3Qu8vSXEKLYDG/wBi3gqwklh+xitHaWdcLJIJf4
 TVkKSIZy6atKbcZ1T66j6n5gFW3y/99quhT2csHdEGe7bItyirKQ3wx1k/9wi+eR+tEO
 qHTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739401482; x=1740006282;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=izwOSozCDTiy2Nz+ObEcnYlYVvdl0bBlgB59WdBOADk=;
 b=DdsbSU0GBF6McgEaQQzRO4WQ3BWqctRv60h8Z+l8BiRaHZYZpbOlwRpFprCXl1P5gz
 ieDLRh1rMURFVnzRVD0QUMDCcz084hDlYPFXm6sgEsisj927yjP4WCQDcCPyt4Z3VgJi
 IqPR/mEgozZDyPcrkDXRwQ337Ws2Z5XcBeQHuTUiwgFiZYUeJmZJmMUQtJQtIKX+yvu4
 XlVG4lFuaPNQ5YxiNVt/ZPLyl5y81T+52vLwSWm/lHWKP6wzIKkPMKXPzSaCi0NqnfHV
 6OV3LMSpQz/ZMewsCx2asFwQ1lzJWu/b0vC5fMc1NiPOHnA7SieUF+OTzOGgsydKPD8H
 gCyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWLe1dHYFbujtfQOiJ6fPe29+SyuzSJXOo+Fl8VCT3XYjcwAdPuGrJTxnuaTnfIxx4xBBdygoE4jGM=@lists.freedesktop.org,
 AJvYcCWa90ICX1PCQ2Wk6iHuRgAhy5hgmKYNfYE1sDVvNw9n2lpcjo5fEv1/6bNe2b7+MdFqdrMSrNMn8ySS@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybRGHtA7bVVZEEy6sACcPcyZHr2GFIwYuJPBflDLM+pvQOItxi
 o5UPcepFC56xkbXI3xoPlGZ3cr5pkJDewGK8LZNDYJaSuRRt8sBQ
X-Gm-Gg: ASbGncu/QkvasF1jKmVy3tQXnh5SBm//ZqXBpPx+k2oKG3kBofCUnjlQLBJw7QmQBKj
 X/aN7F7m3kyZ/X9GkgJcMwWV64vw0hEbcdTM9I139C1HQ2CGWKLQZ/KUj5nilj1Cdo9AOywr2kl
 naolvL3w3y9R/ZLmK/LHoRxV7gr7JJ5OtgnXmbhYPAIyoItFXQ0gK9EVTaN+yEC1oIj3ifq+0YV
 krEZgJxIHfyExJ1EQQD74GTzySdjYFrRyLHpmGWTBzTWpwERPpL2c1qWrp/JmjJI1LaUeFKAmt5
 /tPV9sdXSp9i2ngX49xbFe+b
X-Google-Smtp-Source: AGHT+IHYVNpBJ+hs2SKF43WLDbYcsITXIHpe9AoNBckhGg8EsmihGHFjjFi/bOt0ArQ9OzpKlr29tQ==
X-Received: by 2002:a17:902:f541:b0:220:c067:7be0 with SMTP id
 d9443c01a7336-220c0677e32mr45783155ad.6.1739401482397; 
 Wed, 12 Feb 2025 15:04:42 -0800 (PST)
Received: from [127.0.1.1] ([66.119.214.127]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-220d556da47sm695655ad.187.2025.02.12.15.04.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Feb 2025 15:04:42 -0800 (PST)
From: "James A. MacInnes" <james.a.macinnes@gmail.com>
Subject: [PATCH v2 0/2] drm/msm/dp: Fix Type-C Timing
Date: Wed, 12 Feb 2025 15:03:45 -0800
Message-Id: <20250212-sdm845_dp-v2-0-4954e51458f4@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANEorWcC/x3N0QqDIBTG8VcJrye0Y+ba1d5jjNHyaEJlO7oyo
 nefdPmDj/+3s4DkMLB7sTPCxQXnpwy4FKzr28kidzqbQQmyhCvwoMdbJd965jXqphGNUq0ULO9
 nQuPS2Xq+sg35kceesD0LlYFVbR8wwixWRtFvJPLZ1H2tsW746Yq26GNaxkS1kqDg4XFak+xMP
 cSBHccfhiwtAq0AAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, 
 Stephen Boyd <swboyd@chromium.org>, Vara Reddy <quic_varar@quicinc.com>, 
 Tanmay Shah <tanmay@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Guenter Roeck <groeck@chromium.org>, Rob Clark <robdclark@chromium.org>, 
 "James A. MacInnes" <james.a.macinnes@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739401480; l=2022;
 i=james.a.macinnes@gmail.com; h=from:subject:message-id;
 bh=whc0meljq8d//xyWaoGWRpTBZvYd9FKdXjbcFve5bNw=;
 b=/+dHVSi8w/zrS8YQiMpVK5J8B8OGqD9Fv40WhguqSpTjkv8yGf9TRXrA9AHGFEAiU5FDMMShT
 z3G7HubmMjpDk5krBpgj3hlVsYK8Y85dMXvheX1MU6UZ+9wOGk5NWEL
X-Developer-Key: i=james.a.macinnes@gmail.com; a=ed25519;
 pk=3z+XoIMKkNT7N5GL2WOp/Lcz2ghtr7b8RBCa1usTz9U=
X-Mailman-Approved-At: Wed, 12 Feb 2025 23:13:20 +0000
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

SDM845 Type-C DisplayPort output inactive on DP Monitor and tears on HDMI.

During testing and research found that the dp and dpu drivers more
closely match later incarnations of the Android driver.
Compared against the 4.9 Android and found the porch timing and
wide bus elements were disabled.
Tested by commenting out code and the graphical glitches on
HDMI improved.
Fully turning off wide_bus resolved the single vertical line and
vblank errors when using non-native resolutions.
Removing the porch adjustment fixed HDMI and DisplayPort operated
correctly (for the first time) for all monitor supported resolutions.

Changes v1:
- Patch 1/2: Separated the descriptor from the sc7180 and turned off
             wide_bus support.
- Patch 2/2: Removed porch timing adjustment.

Changes v2:
- Patch 1/2: Removed unneeded assignment.
             Increased verbosity of commit message.
- Patch 2/2: Added comments to explain use of wide_bus_en.
             Increased verbosity of commit message.

Verified functionality on SDM845 using Lantronix SOM.
Tested with Type-C to DisplayPort and Dell Monitor.
Tested with Type-C hub with HDMI to Samsung 4k TV.

James A. MacInnes (2):
  drm/msm/dp: Disable wide bus support for SDM845
  drm/msm/disp: Correct porch timing for SDM845

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 8 ++++----
 drivers/gpu/drm/msm/dp/dp_display.c                  | 7 ++++++-
 2 files changed, 10 insertions(+), 5 deletions(-)

--
2.43.0

---
James A. MacInnes (2):
      drm/msm/dp: Disable wide bus support for SDM845
      drm/msm/disp: Correct porch timing for SDM845

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 14 +++++++++-----
 drivers/gpu/drm/msm/dp/dp_display.c                  |  7 ++++++-
 2 files changed, 15 insertions(+), 6 deletions(-)
---
base-commit: ffd294d346d185b70e28b1a28abe367bbfe53c04
change-id: 20250212-sdm845_dp-6ed993977a53

Best regards,
-- 
James A. MacInnes <james.a.macinnes@gmail.com>

