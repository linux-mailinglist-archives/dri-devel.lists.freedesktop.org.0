Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1BBB2765DE4
	for <lists+dri-devel@lfdr.de>; Thu, 27 Jul 2023 23:22:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D98210E604;
	Thu, 27 Jul 2023 21:22:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8F6210E604;
 Thu, 27 Jul 2023 21:22:37 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id
 d2e1a72fcca58-686bea20652so1463092b3a.1; 
 Thu, 27 Jul 2023 14:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690492957; x=1691097757;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=AW9Y79n7Axnf4OMyAvU6E9fxTGTVMF/uH4OXVJGy0wc=;
 b=LoQO9MruCx3aDX53QSt31jjbpqI7Vjb69Z3uSMTxVty0V9yJrQgPTvrfQu4/IsKKCa
 c7H0MlcS6fR41OmXGSkhIRHRmrnTH5HkihdTYHpm/rVKDQ7GsQmhynlaGpD0RtNl4mWx
 w0JK8qHntfJP2Nmx8nSju3jlJlGsk3chkC/pbIWURgdr9jsd5D4cmXUmAUPYCqtsVvhs
 Zddz6UBSLk4ZYehSsWx5V3GYHPM13r8WtBa/hMfjSiw+QlB9oC801VZk1FUfZTWDLUKg
 o2SeGIsAGwkehzUHHvvDdu3W90RJAfkf+B2bTF0Olfws1V0vYW1wkCURwJjCGeAPTZYW
 g58A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690492957; x=1691097757;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AW9Y79n7Axnf4OMyAvU6E9fxTGTVMF/uH4OXVJGy0wc=;
 b=fWIOLtxP9y+QRH12DRZEXlwZI0lEHaKEPk4U27jnVWHvGCkrCnenhMa8lilX2zbkU0
 jg05LxMLGtucMlQncDbveW9WHK8JQEZO2FnhvrEpl7K9VVQDDdX6JEhnN7NKGgdQlZpP
 8AnVqhBXY6cSS4kFWKjeBnlHnafMGdbuQMxaCzApFO/uvfEaS4n9XLhRmrYXL5qB/u0j
 VMWn7C8TX8WKie/Pk0QQYNNiGgnb5/kVq7hRBUfliPi5Pqi9QdGqqhC3Y9gX9EgWk6UH
 30LY2ldk/pRWRe8OcN2aLq+Rsbn4KfjoVi3kqjPzeoOKoHjnTvdrpZMMrlcZOPQ/VpVt
 reGw==
X-Gm-Message-State: ABy/qLb/3CZY1EoU6YyQqfN2x4NST6iWvB/HVilAtqr+KOijOfF/k74A
 2X25YYvxbHI0lw6TECZ7Ml8nNhc3q/aBYA==
X-Google-Smtp-Source: APBJJlFHi1voxlxXheXlidoFFam4W3IYbNYZSFTSlKjdlMcn4KoCpsM8VrL8jH/ByC1+CMZirkg6PQ==
X-Received: by 2002:a05:6a21:329c:b0:12f:6aee:7e43 with SMTP id
 yt28-20020a056a21329c00b0012f6aee7e43mr316185pzb.57.1690492956735; 
 Thu, 27 Jul 2023 14:22:36 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:69d1:d8aa:25be:a2b6])
 by smtp.gmail.com with ESMTPSA id
 u8-20020a62ed08000000b00666912d8a52sm1869099pfh.197.2023.07.27.14.22.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 14:22:36 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 00/13] drm/msm/adreno: Move away from legacy revision
 matching
Date: Thu, 27 Jul 2023 14:20:05 -0700
Message-ID: <20230727212208.102501-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.41.0
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
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
 Guru Das Srinagesh <quic_gurus@quicinc.com>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 open list <linux-kernel@vger.kernel.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Clark <robdclark@chromium.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
 <devicetree@vger.kernel.org>, linux-arm-msm@vger.kernel.org,
 Adam Skladowski <a39.skl@gmail.com>, Sean Paul <sean@poorly.run>,
 Johan Hovold <johan+linaro@kernel.org>,
 Elliot Berman <quic_eberman@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Mukesh Ojha <quic_mojha@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Downstream seems to be moving to using the chip_id as simply an opaque
identifier, and if we want to avoid headaches with userspace mesa
supporting both kgsl and upstream, we should move away from the
assumption that certain bits in the chip_id have a specific meaning.

v2 adds a patch to move adreno_info to adreno_platform_config rather
than needing to look it up in multiple places.

Rob Clark (13):
  drm/msm/adreno: Remove GPU name
  drm/msm/adreno: Remove redundant gmem size param
  drm/msm/adreno: Remove redundant revn param
  drm/msm/adreno: Use quirk identify hw_apriv
  drm/msm/adreno: Use quirk to identify cached-coherent support
  drm/msm/adreno: Allow SoC specific gpu device table entries
  drm/msm/adreno: Move speedbin mapping to device table
  drm/msm/adreno: Bring the a630 family together
  drm/msm/adreno: Add adreno family
  drm/msm/adreno: Add helper for formating chip-id
  drm/msm/adreno: Move adreno info to config
  dt-bindings: drm/msm/gpu: Extend bindings for chip-id
  drm/msm/adreno: Switch to chip-id for identifying GPU

 .../devicetree/bindings/display/msm/gpu.yaml  |   6 +
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c         |   2 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c         |   2 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |   4 +-
 drivers/gpu/drm/msm/adreno/a5xx_power.c       |   2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c         |  16 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         | 189 ++---------
 drivers/gpu/drm/msm/adreno/adreno_device.c    | 294 ++++++++++++------
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |  53 ++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       | 154 ++++++---
 10 files changed, 365 insertions(+), 357 deletions(-)

-- 
2.41.0

