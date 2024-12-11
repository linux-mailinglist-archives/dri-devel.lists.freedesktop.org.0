Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A5E909EC733
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 09:30:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8DA9010EAA3;
	Wed, 11 Dec 2024 08:30:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="TNTXy61p";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com
 [209.85.221.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FAA110EAA3
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 08:30:01 +0000 (UTC)
Received: by mail-wr1-f53.google.com with SMTP id
 ffacd0b85a97d-38633b5dbcfso3639930f8f.2
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 00:30:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733905800; x=1734510600; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uN5AdeRScLJtHfsSOT+MoztnVZIiM+ZCP6fGO7QOEEw=;
 b=TNTXy61p1M45Rs+GQJ0OqP+iiTF65ioPPfB8128o3/5dpv0Q7ATK59YpoVLwj542Ve
 oAsR9T7PQ1s3Hf+MRh5/58PTMyYiU53GohX79hSm5LqxNI2K1T//TrvrMNe2zmq97ulo
 QU4iG0mRVopxxzovn3pMojPb83niSHpj3syVfjImNjxLnA3A79RN+nK+FTDPBvJg0igo
 cScRnQPM84FgzaRfIo4+YQpQrDETmjP4A1zdugA/GsuokMSYCpaKx+yZl6QB19ASDY+u
 Hui2qFjmtzdsoSuKOdGIADRKQYd+1x3KnCdeRsEXkC/CZ7Z+JDA+0gpr5116P+08P4TW
 fiwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733905800; x=1734510600;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uN5AdeRScLJtHfsSOT+MoztnVZIiM+ZCP6fGO7QOEEw=;
 b=QGPcyOf0n8J0bUDBjqLeyBf4/bUx37m+SfvZOnOvONs/Fp74vhBu4YaYIvt5aVgEhs
 5vNOq0bbiyziLoUdOMs7zV5ATQ9KnSDZB0LtM3IuHojDOAra3bDyJLyIA12ApgCNgnGF
 9Yhjfglqb4RA5DzaefaU2VwMfq7Mgcg+0HWK/pHgYklDg5NEvSuVYbHD0Cy/tYlzrWkZ
 5n8Bl/77mM5uQ67Lrg/oUP8Jt2/O43rGFznABiYbuIOoyxD5g/HkaMt1GwsmqEWDQGMP
 3NtTs1lnjVYz0JUO9JlYkdSh+iMg6J/R7tnXnw8CFHmfCZCEtqNkZPQDl+JROYxO3iMc
 0oag==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbyFBX6tqVj472kszNAM389Ba26YDTW6lGDcYqkSb4clJZPNmB+7XoedC5oKze1QyIZCxgS4QSIvY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwErEKg8jy/scgk8n4KL/GsHlZ8ud9H786R2GnmZnsU+bhgqRdy
 uWeWeGdPfpDlaryF7H/bLhLDFxh8trKfFTfOGtCrixodLofy7LDP8ysUBURFO9Q=
X-Gm-Gg: ASbGnculaa2MvWa9uEroYg6/ViqGoDedpLl6WNiSL4dSNBnQtko6RS7/1bbOIu2NQg9
 na3oBYRJ6Zew8hp9wS12Q4YYgkeCE7SfGfpOWYxkTZ1btESx8QL1mBpM04Q9IX+ShxWyA4/D719
 LfuHZ5Uy8kZPLh9qSG3randRUC1neODrcBAbDUk64TTu4uNQANOxCAufYHOJ6HGF3aaRXOKAfyI
 Tuc9InHkm9bups+eRGeVSlbFZO1binCq8IU4iSEB9oAQ+4HkkjEPK5n1qifFrtiFLNa5DoUkFI=
X-Google-Smtp-Source: AGHT+IGvKUv7p0bySo4rj/rZSBrceXdME0hrdstc13IuQeGdJAJK/A7l8wW6sihQ18u8uzyhFCb/lg==
X-Received: by 2002:a5d:5f91:0:b0:382:46ea:113f with SMTP id
 ffacd0b85a97d-3864ce86a3fmr1725077f8f.10.1733905799294; 
 Wed, 11 Dec 2024 00:29:59 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-387824a3e38sm735687f8f.23.2024.12.11.00.29.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 00:29:58 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v5 0/7] drm/msm: adreno: add support for DDR bandwidth
 scaling via GMU
Date: Wed, 11 Dec 2024 09:29:50 +0100
Message-Id: <20241211-topic-sm8x50-gpu-bw-vote-v5-0-6112f9f785ec@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAH5NWWcC/43NQW7DIBCF4atErDsVDBAgq94j6sKYsYPUGgtck
 iry3UuyaapIVpf/k+abKyuUIxV22F1ZphpLTFML/bJj/ambRoIYWjPkqIQQEpY0xx7Kp71oDuP
 8Bf4MNS0EgyaOOJDplGHtfM40xMudPr63PsWypPx9/1TFbf0HWgVwkN4G6Yw0nfNvH3HqcnpNe
 WQ3teKj5DYkbJIK5K3xhMrZJ0k+SGg3JNkkK8Ke94IP3sgnSf1KyPWGpJrk9poHoUNQUv+R1nX
 9AZlHnqqfAQAA
X-Change-ID: 20241113-topic-sm8x50-gpu-bw-vote-f5e022fe7a47
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4929;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=ghVOoUCP6ClulQHKSlvN1uTAOqfE8YlIThvntPRyWMk=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnWU2Cia4TKjc0Ij6gMzsPHdLygGocf+k8W30t9bd/
 H4zFC2GJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZ1lNggAKCRB33NvayMhJ0XA4D/
 4qDdfOHr4uO7VFWs4QAIMuSpAsaARTcV3cNztIoVua7vvMixLg4wt641nl6a6oLQlwDKLImfuv49+u
 IVbbITNnANRFvHAqRJas3dif+WKOyz70U7zWvSB8iZPmiecX8Xw5etHb91wWWDfJ4Xh48Vz7E6FGxk
 zA+V9/w8HKFpZCeqFsKrQDE0miY2bMLPb7Agjug+y7YA2DEg32JWpGQ8nSNrWGrxsRgSCHYv4WF8wy
 Ob1I20jPHcZ5zpktuN4QFAwA+Y4SJUK91dITaoIL+O+5G7WkpGBoLs7bg8JrpsI8G33/v6sITgfzX5
 KxPoECeY4zj76rO67O5OC1z4wxWSU29/FCUPX09ZcIJyHD6Ldv/qQ+r7hsPhfKWzoAHrIxQrlHkQZg
 P0rgq4207sXXNC0lJy28EyPnNgipX1Us2kZN39RjEQO+RCvXRyZGySJ1d+3FaEkMmeqCVCy7wxc7xJ
 /rx4a9gVPwMPQLqqf9EX0RZMCxA23yTLbiBjzyToJGlrcKQQa+Sbsypq0lPwVBtV7FqwQvAzfQ75bd
 /LcmrARqy3Iv91ZLr1QWxmq0l8mZinvSXEf+rDph3PwuOhXFlr6qTkYIx9GSrPVo0IgklVUt5NjlbM
 o8GLhXca4StR8amW0tM2IQN352Z+BAHxlau03DO4RJk5aNDonffT4UK+3LAg==
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The Adreno GPU Management Unit (GMU) can also vote for DDR Bandwidth
along the Frequency and Power Domain level, but by default we leave the
OPP core scale the interconnect ddr path.

While scaling the interconnect path was sufficient, newer GPUs
like the A750 requires specific vote parameters and bandwidth to
achieve full functionnality.

In order to get the vote values to be used by the GPU Management
Unit (GMU), we need to parse all the possible OPP Bandwidths and
create a vote value to be send to the appropriate Bus Control
Modules (BCMs) declared in the GPU info struct.
The added dev_pm_opp_get_bw() is used in this case.

The vote array will then be used to dynamically generate the GMU
bw_table sent during the GMU power-up.

Those entries will then be used by passing the appropriate
bandwidth level when voting for a GPU frequency.

This will make sure all resources are equally voted for a
same OPP, whatever decision is done by the GMU, it will
ensure all resources votes are synchronized.

Depends on [1] to avoid crashing when getting OPP bandwidths.

[1] https://lore.kernel.org/all/20241203-topic-opp-fix-assert-index-check-v3-0-1d4f6f763138@linaro.org/

Ran full vulkan-cts-1.3.7.3-0-gd71a36db16d98313c431829432a136dbda692a08 with mesa 25.0.0+git3ecf2a0518 on:
- QRD8550
- QRD8650
- HDK8650

Any feedback is welcome.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v5:
- Dropped bogus qcom,icc.h flags
- Properly calculate _wait_bitmask from votes
- Switch DT to qcom,bus-freq values from downstream
- Added review tags
- Link to v4: https://lore.kernel.org/r/20241205-topic-sm8x50-gpu-bw-vote-v4-0-9650d15dd435@linaro.org

Changes in v4:
- Collected review tags
- Dropped bcm_div() and switched to clamp() instead
- Dropped pre-calculation of AB votes
- Instead calculate a 25% floor vote in a6xx_gmu_set_freq() as recommended
- Use QCOM_ICC_TAG_ALWAYS in DT
- Made a740_generate_bw_table() generic, using defines to fill the table
- Link to v3: https://lore.kernel.org/r/20241128-topic-sm8x50-gpu-bw-vote-v3-0-81d60c10fb73@linaro.org

Changes in v3:
- I didn't take Dmitry's review tags since I significantly changed the patches
- Dropped applied OPP change
- Dropped QUIRK/FEATURE addition/rename in favor of checking the a6xx_info->bcms pointer
- Switch a6xx_info->bcms to a pointer, so it can be easy to share the table
- Generate AB votes in advance, the voting was wrong in v2 we need to quantitiwe each bandwidth value
- Do not vote via GMU is there's only the OFF vote because DT doesn't have the right properties
- Added defines for the a6xx_gmu freqs tables to not have magic 16 and 4 values
- Renamed gpu_bw_votes to gpu_ib_votes to match the downstream naming
- Changed the parameters of a6xx_hfi_set_freq() to u32 to match the data type we pass
- Drop "request for maximum bus bandwidth usage" and merge it in previous changes
- Link to v2: https://lore.kernel.org/r/20241119-topic-sm8x50-gpu-bw-vote-v2-0-4deb87be2498@linaro.org

Changes in v2:
- opp: rename to dev_pm_opp_get_bw, fix commit message and kerneldoc
- remove quirks that are features and move them to a dedicated .features bitfield
- get icc bcm kerneldoc, and simplify/cleanup a6xx_gmu_rpmh_bw_votes_init()
  - no more copies of data
  - take calculations from icc-rpmh/bcm-voter
  - move into a single cleaner function
- fix a6xx_gmu_set_freq() but not calling dev_pm_opp_set_opp() if !bw_index
- also vote for maximum bus bandwidth usage (AB)
- overall fix typos in commit messages
- Link to v1: https://lore.kernel.org/r/20241113-topic-sm8x50-gpu-bw-vote-v1-0-3b8d39737a9b@linaro.org

---
Neil Armstrong (7):
      drm/msm: adreno: add defines for gpu & gmu frequency table sizes
      drm/msm: adreno: add plumbing to generate bandwidth vote table for GMU
      drm/msm: adreno: dynamically generate GMU bw table
      drm/msm: adreno: find bandwidth index of OPP and set it along freq index
      drm/msm: adreno: enable GMU bandwidth for A740 and A750
      arm64: qcom: dts: sm8550: add interconnect and opp-peak-kBps for GPU
      arm64: qcom: dts: sm8650: add interconnect and opp-peak-kBps for GPU

 arch/arm64/boot/dts/qcom/sm8550.dtsi      |  13 +++
 arch/arm64/boot/dts/qcom/sm8650.dtsi      |  15 +++
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c |  22 ++++
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c     | 183 +++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h     |  26 ++++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h     |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c     |  54 ++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h     |   5 +
 8 files changed, 308 insertions(+), 11 deletions(-)
---
base-commit: df210b30304e9113866a213363894a6d768411ec
change-id: 20241113-topic-sm8x50-gpu-bw-vote-f5e022fe7a47

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

