Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1096B9D2D40
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 18:57:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BD2B10E6A3;
	Tue, 19 Nov 2024 17:57:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="U59u7jfy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3420210E2B9
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 17:56:47 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-3823e45339bso933213f8f.0
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 09:56:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1732039005; x=1732643805; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Uphaw+yejvZqKI/ifvkmuNUdnhaCioyIuvDRQApoKB0=;
 b=U59u7jfyOUobF2Es9CYT8/UAZerL+Hfijw4+U/9RLbMF5m/ptW940C9SSCcjwqLACH
 ftwzrl9ouvn6k6bNoulHKZjpOg/Z68UEWyKIHA5yYmrerLOgQYvlI73/PKF4Q0AdCVN8
 8z7nTgMa1y4Yno7xBSRBa8cQA3uNh7zz18iNJBbobimKtitTQY0tIYoFCc+X5k6YPskJ
 miScLN2BqCzcxU++cQBbOPL35S9z5Y5gTVASLZ7f129gf/V0PyIImM+x+fgkMaCbIiTJ
 gvOHI8wra3YejVv8OfqOVuwm1xhgJyO6CJ9PHSJZnDHJTbjFQXm4TAqRJr7AYkawAFnl
 bCPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732039005; x=1732643805;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Uphaw+yejvZqKI/ifvkmuNUdnhaCioyIuvDRQApoKB0=;
 b=a4HOJMlcBi30o3a9rcHq/CpB/QcviHl6fxA7x4wiWkmjBdDFLAERqTxBlOR0oEMNQo
 zAqrzKQmiKSgZpSmbmaMBh2JY0S8X97RknpK3iSGvN7/CwXWpIIsjz+HZhDyyAB4IgfG
 +6/n1YJqra+S+VdSwGHA2lYpcFKcDY2JstWU3uNp3AhmKUJf6Wa7jnVFjNR+s5Wtoirv
 xRGAFoP6TWz9QbM8QcXFt5z/q7DgqCjkYBFZfC87tQNWsO6ZAba9WzAV8/x91ZLWNcPX
 HAuYT4zaj1khFds7Muk/luYxemMG2eT4QM+gT++UAbPdjhtXzpQxDhghT0OkPmlSUnoq
 SVQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUPLveQHpg03seMa/GLLIn3eTXcp+0dfG9abWL7ue0+vbWxcgvFHlOVwtewJTaeVvOBIHyonNT32R8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxSkVwtq5+RPh9itWivcmqvFE63E1maUi+GVQ5AWjk34YbUJllZ
 FiADKXiNH2Fso0r0tGQyYUnVkNL0Ku09lnZw4b/kAJ2knSmQ9XFx8rehOmf/9Z0=
X-Google-Smtp-Source: AGHT+IGu2MTuaLa2s2Osy0xPHtiOF5pvDD946JFIP7glWAUn0hOLR3LKLl+1yNNeHEwt9KRH8mDxjg==
X-Received: by 2002:a5d:47a4:0:b0:37d:4e74:684 with SMTP id
 ffacd0b85a97d-38225aa59f8mr12911539f8f.52.1732039005191; 
 Tue, 19 Nov 2024 09:56:45 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432da27fe68sm208302275e9.24.2024.11.19.09.56.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2024 09:56:44 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 00/11] drm/msm: adreno: add support for DDR bandwidth
 scaling via GMU
Date: Tue, 19 Nov 2024 18:56:35 +0100
Message-Id: <20241119-topic-sm8x50-gpu-bw-vote-v2-0-4deb87be2498@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFPRPGcC/42NTQ6CMBBGr0Jm7Zj+QAquuIdhUWCASZSSFiuGc
 HcrJ3D5XvK9b4dAninALdvBU+TAbk6gLhl0k51HQu4TgxIql1JqXN3CHYZnuRUCx+WF7RujWwm
 HgoRSAxmbG0jzxdPA25m+N4knDqvzn/Mpyp/9IxolCtRt2evKaGOrtn7wbL27Oj9CcxzHF7b+q
 lHBAAAA
X-Change-ID: 20241113-topic-sm8x50-gpu-bw-vote-f5e022fe7a47
To: Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
 Stephen Boyd <sboyd@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Connor Abbott <cwabbott0@gmail.com>, linux-pm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3706;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=2ruzXwfCkgxcdUn05ISNMLUdnKZHWZlM4S6yJkpiAMg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBnPNFWISo88ZsLG6UgbcsukGsSBh5EXFE71ZgJjJ/e
 JtbsqaGJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZzzRVgAKCRB33NvayMhJ0auSEA
 Cj6pb8Bb61UNiFQWCsXiHBPNtyQrTaimhWr+qgdF3wJyBzhE9/on548kB7KyxvJPqEtZCevcAfLBwr
 yxH1kDB9kEtRjsSFylPhAWEHPiqiJzEcHEM8vPLWp0sQMvL9ut3DT35hcyqmYgOUi0c4/qAjMxmPnE
 qTX3KznoURrRFC8cRuK/UzGNUfjO/UM8QJYZVKW092WvVsy0JmTwW0UpXBRY+qKeOsN/sQkfH9i91N
 Cpx9cSSva3E+VvUMStKUaPaUTjudKRNInMdg5wBKXCIs5DNCnij+HG/3a+2Gkck+lpSEqLaEVPq4bs
 UHSzsycYPlAEnnHbXd0mj3n3rgrp07WBIEYptulzGiaGVAk5xD5gUu8gvomB2O5rOis4zwIvm61/JW
 HkogfvJsk82SBPHAXB/+XZ/zkXYngr6W8UjVyQ1s0p1K3puEAQ2lRdRpDh7IhnHWycWPvzwfkRAZLX
 rE2y9/bsHW4qJEsFBPKrYsp70oP8oUPZCSzoNXU22Mi+xzgBqNmaSOY4m9srD9ACgEZiXf+ZjnncEw
 Y1N4JBD5dM7bn55yjwTUowNtfHcB8gcPQ8D/TI/jXl2jlL99TRDT+xIsR+9NO7e9NGITUhdgKuzYU2
 XLH07egPhFXLtHgQOxZZpYFZ3X+dbXbR6x7sPZSh32smNHUjRngzrJUz0sdw==
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

The Adreno GMU Management Unit (GMU) can also vote for DDR Bandwidth
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

Ran full vulkan-cts-1.3.7.3-0-gd71a36db16d98313c431829432a136dbda692a08 with mesa 25.0.0+git3ecf2a0518 on:
- QRD8550
- QRD8650
- HDK8650

Patchset is based on current msm-next including preemption support.

Any feedback is welcome.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
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
Neil Armstrong (11):
      opp: core: implement dev_pm_opp_get_bw
      drm/msm: adreno: rename quirks that are features
      drm/msm: adreno: move features bits in a separate variable
      drm/msm: adreno: add GMU_BW_VOTE feature flag
      drm/msm: adreno: add plumbing to generate bandwidth vote table for GMU
      drm/msm: adreno: dynamically generate GMU bw table
      drm/msm: adreno: find bandwidth index of OPP and set it along freq index
      drm/msm: adreno: request for maximum bus bandwidth usage
      drm/msm: adreno: enable GMU bandwidth for A740 and A750
      arm64: qcom: dts: sm8550: add interconnect and opp-peak-kBps for GPU
      arm64: qcom: dts: sm8650: add interconnect and opp-peak-kBps for GPU

 arch/arm64/boot/dts/qcom/sm8550.dtsi       |  11 ++
 arch/arm64/boot/dts/qcom/sm8650.dtsi       |  14 +++
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c  |  84 ++++++++-----
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c      | 181 ++++++++++++++++++++++++++++-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h      |  16 ++-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |   4 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h      |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c      |  45 ++++++-
 drivers/gpu/drm/msm/adreno/a6xx_hfi.h      |   5 +
 drivers/gpu/drm/msm/adreno/adreno_device.c |   2 +-
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |   9 +-
 drivers/opp/core.c                         |  25 ++++
 include/linux/pm_opp.h                     |   7 ++
 13 files changed, 358 insertions(+), 46 deletions(-)
---
base-commit: 86313a9cd152330c634b25d826a281c6a002eb77
change-id: 20241113-topic-sm8x50-gpu-bw-vote-f5e022fe7a47

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

