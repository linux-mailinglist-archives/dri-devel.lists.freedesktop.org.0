Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAC8F92B59E
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jul 2024 12:45:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9633890C7;
	Tue,  9 Jul 2024 10:45:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="K5Li7k/H";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6FD110E4ED
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jul 2024 10:45:34 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-a77c4309fc8so533800166b.3
 for <dri-devel@lists.freedesktop.org>; Tue, 09 Jul 2024 03:45:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720521933; x=1721126733; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=N1Uy4SNyn83EE+iKJmeAoId3aAi1waClmvNIPZ5Lgz0=;
 b=K5Li7k/HSkmt6DLm/5uUQswbiamVxyI+DJR/AOt7byLWNKUxQRJS0oLyM4ImlU6FeV
 g6rD3ZgWgdAoQvBt54W5/Qrdi7xNocZui0aTvyus34U6ojAMCSGoNWqqgj9ZnGDykyN7
 rYI+PkSuZVS7PJv/eOtxaEFzf1DobFI+XhqJefYEQdUa7HGJ8Q38zwkkrUDzxiszABji
 IySEVL1uGVBEyA5NWB2uVDmWDPlc2W8VTGW8Zrpa4RO0BbPjA4/SiGrIiom+oLvhYRLa
 6adFaPGNuJkL13zK9YqIeXBO59bXxkm0RjkzjYy7A3H6E5u3ZisWYjwhtm3QGxSv844i
 vsvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720521933; x=1721126733;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=N1Uy4SNyn83EE+iKJmeAoId3aAi1waClmvNIPZ5Lgz0=;
 b=bQdfOwxYW5utHLh7K5ABnbRXy0fuPKDJa+wfZHD7xLts/Jrm1A0qYoq83qeqD/nPnZ
 csg8fA2keTR8ySHSNZzOJCQ9UpVx9W5jF0JhcFQ5d8CS57ApEjXkmb0lt4CzpvOBFUF5
 JSO9ejBsp1YfOzp8VE8RLLoq3VbDkPlOknpRNaBSQZ+2A5cT6SQWMNSfaymBbOHqcL71
 T/QNxhku0TM/KS4/3x0ptqbIDVc7pilij6q3lB9z/PGPjwDKcQBhK3Gt1OTwTIwMhp3i
 6ZAjba3QzwHLrNzJ148DULHNYZLmHCbdRb3tyytIdYdLBCaybyidm1H4rKAy3rOmHTEC
 p4ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSXu53elsDB802VLopWmG2CPgs0Y7G1hrmf2Zjd4FA72d81StFBXK2XnqMxthMC5GhMFMNxNWSpdUA88Qf5wdfo5irJwfiZwfIihplwwCb
X-Gm-Message-State: AOJu0YxF0rurEUa6rSx5MKl/ecsNFdo6z+TURooEL3SZCScq1HT74lOB
 nDwUEpAXcjGN+1HvT07tzs/RaoHZ2AktsBtjg6LAL2MoD/Yf1uAp1v+buT5m+LI=
X-Google-Smtp-Source: AGHT+IGkgRr67p/sC6tOf9bUtQJmcMceFqxyhsNdiCWp9IQntUPgK1fP32IeIXByAubS8QjEGDqQJA==
X-Received: by 2002:a17:907:724a:b0:a72:5a8c:87c6 with SMTP id
 a640c23a62f3a-a780b68a9d5mr160855866b.10.1720521932661; 
 Tue, 09 Jul 2024 03:45:32 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a7ff038sm66295466b.115.2024.07.09.03.45.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 03:45:32 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Subject: [PATCH v5 0/5] Add SMEM-based speedbin matching
Date: Tue, 09 Jul 2024 12:45:28 +0200
Message-Id: <20240709-topic-smem_speedbin-v5-0-e2146be0c96f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMgUjWYC/3XNUQvCIBDA8a8yfM5Qc8N66ntExNRzO2g6dEgx9
 t1zg4iguKf/wf1uJgkiQiKnaiYRMiYMvkS9q4jpW98BRVuaCCYkK0OnMKKhaYDhlkYAq9FTZQG
 MZRocA1IuxwgOH5t6uZbuMU0hPrcnma/bt1f/9DKnjBoQWjVS1Fzz8x19G8M+xI6sYJYfpBF/E
 FkQ1zglj4dWKy6/kGVZXgpKkof8AAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720521930; l=2800;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=DiKuajQjDvsPgnq/MT8rUGokqmDQszLk8ppgz/Da+oQ=;
 b=wJla8q9532uYuw6CKE5sv/3w36y0aZyhqGMRjEXDqC+Xaq4K9H5C/Bf7W6J/ovUdlL2BCJ0ms
 9XuL6HSJbyRCqB4H2hqDP/MhKQ1QDdeJfG56LRz2y6MmHwCeXk93YnQ
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
Changes in v5:
- Rebase
- Fix some unhandled cases (Elliot)
- Fix unused variable warning
- Touch up some comments
- Link to v4: https://lore.kernel.org/r/20240625-topic-smem_speedbin-v4-0-f6f8493ab814@linaro.org

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
 drivers/gpu/drm/msm/adreno/adreno_gpu.c    | 85 +++++++++++++++++++++++++++---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |  6 ++-
 8 files changed, 119 insertions(+), 97 deletions(-)
---
base-commit: 0b58e108042b0ed28a71cd7edf5175999955b233
change-id: 20240404-topic-smem_speedbin-8deecd0bef0e

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

