Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6037C91702D
	for <lists+dri-devel@lfdr.de>; Tue, 25 Jun 2024 20:28:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86F2910E70A;
	Tue, 25 Jun 2024 18:28:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bCHCDpNj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com
 [209.85.208.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 385CC10E70A
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 18:28:16 +0000 (UTC)
Received: by mail-ed1-f48.google.com with SMTP id
 4fb4d7f45d1cf-57d106e69a2so766190a12.0
 for <dri-devel@lists.freedesktop.org>; Tue, 25 Jun 2024 11:28:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719340094; x=1719944894; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bfK5oQFXpCisBGUPV0qRGTBcMOIBNALBqfecObZ2uqg=;
 b=bCHCDpNjwHlLmkdS++Kf2XcRhcoC8sMtoo7U5Zr4n/W4RFDxaW3VJkLtsQWnjEvcSF
 nVpnZAXFJaev7sjIh3SKVBO132lXqJLpmwbQqpaPhPWDhqdG2CmyLrXJNaI8WyDTgYOt
 2IPKQly9sQrncidjn6GQJjZAvo/pGK8/wEF6VYakizLcOpPMzVVPI4E3uDMveUObv7tJ
 A1WQtJWhg4PXSgIdFu9yR3LOjPf4SADe+tfOGWnOYc3PyZZZUxCzHQyPsuBNnZLE5w5R
 mSvJzjiJ+8VAbwxpMPmTbpmM1x3kKE6/fXIbqJ3ziwlIrtAAF3YVSCYQSiyXwROai8ot
 PRGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719340094; x=1719944894;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bfK5oQFXpCisBGUPV0qRGTBcMOIBNALBqfecObZ2uqg=;
 b=ncDmYd5NUTRUuG9kvyHeJOgJ4QEdsb+JID5uu2lHGo8apTP7rcZsDI5F9DI4m0SRdO
 vP0/HyK+p8Epnr0xdBzZlDFqXx7/tQFV9OOrGOQ3UjFAXEMJtfNqX+fc5ES2wZbIX0GV
 dr5sRrUsprE+IB6fQ4UuXtxzLbcjXDxzCgLV9ZhJpjM6G5HctVbhnvwfbPKfGq5yLBQL
 a+vmE06NGOzuvht+0Vz5JVIHg4ZyIO8tHz18ztLdyfj4eVeJjqNn/i5HZeuEEXzN3Z9r
 G+BZpAxx+1sNBCWYylUIxghSkXkf77azgrOwSY1bqxExsvb1iptpaWvin8sV6mbiy+VR
 1OsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2YWvoac7Bd9SzahvOCdL7+u62f1zQdpVKqyIGh6KYVI2DiuHoGyZCc1aVR0INLRJsMMypED8nJhn2Ftomr9I5cvRuqJOdg0sTrCcsFXWw
X-Gm-Message-State: AOJu0YxFKu0eqEEUb4+bjmD7d5+dMgJhTFmX37j1JFaxnkTcNF07Ol1g
 D9DsUWbaPG5O85G99sLiiBg9yCgna2mfQlXYqx5kLzkyj7pjqrOH2nzJtWY9j3ESmfJ73pe+QDo
 yBYo=
X-Google-Smtp-Source: AGHT+IGYcPfGhxR2qd9lV9RQpT/kfz8AAlMutIlIqRMdGFSuAXPYnXUh75y4GKOhz84HlYitRV3xoA==
X-Received: by 2002:aa7:d3d3:0:b0:57d:4340:7269 with SMTP id
 4fb4d7f45d1cf-57d44a302d2mr7098674a12.14.1719340094143; 
 Tue, 25 Jun 2024 11:28:14 -0700 (PDT)
Received: from [192.168.215.29] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57d3042fd72sm6323136a12.48.2024.06.25.11.28.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 11:28:13 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v4 0/5] Add SMEM-based speedbin matching
Date: Tue, 25 Jun 2024 20:28:05 +0200
Message-Id: <20240625-topic-smem_speedbin-v4-0-f6f8493ab814@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADUMe2YC/22NQQqDMBREryJ/3ZQkaJGueo8ixSSjfqiJJBJax
 Ls3Fbors3oD82ajhMhIdK02isicOPgC9akiO/V+hGBXmLTUtSwRa1jYijRjfqQFcIa9aB1gnTQ
 YJKgsl4iBX4f13hWeOK0hvo+TrL7tz9f89WUlpLDQpr3UulFG3Z7s+xjOIY7U7fv+AdJ3CbG3A
 AAA
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719340091; l=2579;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=q0yzDllR7onfBxBeyrsV8zllafTESKitM/Jyq0s9Emo=;
 b=JpscgSq2npI58xUw7s5ODs4eaHFpU60RrwK7wt+iCLtnc4alqW1yzeSbp4IicnuHW33OHT9cx
 TdPQeojNOYjAao4bhOjQLWkZE7s4MEyzgVdw6s2U2WYiI+bU0eEJuie
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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

Newer (SM8550+) SoCs don't seem to have a nice speedbin fuse anymore,
but instead rely on a set of combinations of "feature code" (FC) and
"product code" (PC) identifiers to match the bins. This series adds
support for that.

I suppose a qcom/for-soc immutable branch would be in order if we want
to land this in the upcoming cycle.

FWIW I preferred the fuses myself..

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
Changes in v4:
- Drop applied qcom patches
- Make the fuse/speedbin fields u16 again (as Pcode is unused)
- Add comments explaining why there's only speedbin0 for 8550
- Fix some checkpatch fluff (code style)
- Rebase on next-20240625

Changes in v3:
- Wrap the argument usage in new preprocessor macros in braces (Bjorn)
- Make the SOCINFO_FC_INT_MAX define inclusive, adjust .h and .c (Bjorn)
- Pick up rbs
- Rebase on next-20240605
- Drop the already-applied ("Avoid a nullptr dereference when speedbin
  setting fails")

Changes in v2:
- Separate moving existing and adding new defines
- Fix kerneldoc copypasta
- Remove some wrong comments and defines
- Remove assumed "max" values for PCs and external FCs
- Improve some commit messages
- Return -EOPNOTSUPP instead of -EINVAL when calling p/fcode getters
  on socinfo older than v16
- Drop pcode getters and evaluation (doesn't matter for Adreno on
  non-proto SoCs)
- Rework the speedbin logic to be hopefully saner
- Link to v1: https://lore.kernel.org/r/20240405-topic-smem_speedbin-v1-0-ce2b864251b1@linaro.org

---
Konrad Dybcio (5):
      drm/msm/adreno: Implement SMEM-based speed bin
      drm/msm/adreno: Add speedbin data for SM8550 / A740
      drm/msm/adreno: Define A530 speed bins explicitly
      drm/msm/adreno: Redo the speedbin assignment
      arm64: dts: qcom: sm8550: Wire up GPU speed bin & more OPPs

 arch/arm64/boot/dts/qcom/sm8550.dtsi       | 21 +++++++-
 drivers/gpu/drm/msm/adreno/a5xx_catalog.c  |  6 +++
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c      | 34 ------------
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c  |  8 +++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 54 -------------------
 drivers/gpu/drm/msm/adreno/adreno_device.c |  2 +
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 84 +++++++++++++++++++++++++++---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  6 ++-
 8 files changed, 118 insertions(+), 97 deletions(-)
---
base-commit: 0fc4bfab2cd45f9acb86c4f04b5191e114e901ed
change-id: 20240404-topic-smem_speedbin-8deecd0bef0e

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

