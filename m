Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67F4674A592
	for <lists+dri-devel@lfdr.de>; Thu,  6 Jul 2023 23:11:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9781610E0FD;
	Thu,  6 Jul 2023 21:11:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9F7E10E0FD;
 Thu,  6 Jul 2023 21:11:01 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id
 ca18e2360f4ac-783544a1c90so46238439f.1; 
 Thu, 06 Jul 2023 14:11:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1688677860; x=1691269860;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cYUcWwYzIGi22IoU+6D6M18c1PHnvf+NVM3aZcMVciw=;
 b=NJ6h4EgtHpmcS3r+/sTWzTOxngpVnD/XQi3SaCWXOCzgjWyUW59DXiIRpy4bATw7zP
 2RJCjujnfjD2ROdBhWhi+q2sWmin+TB5vjmFnuLU++YadiHBdABoiAZlslrnHqhdkjbm
 RprAl0f56jPdNiPzVFjDE66U86Qm9k9/sLx+X8R2skh0NKtP9YBxCi2AMKqopwyXlooy
 DT+ngyTY6246/sSN/oVKg3df/5fOzW/fc5fScxjXc4BCJlvKUA1INRdjQ4wUG3trcIJO
 9v3ycLE40PqI/JsCQlBcmfIRTXcjqgqOQjRuJyZYqp9RZVf/rxb9oVuVOvcU0xGuUfTq
 X1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688677860; x=1691269860;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cYUcWwYzIGi22IoU+6D6M18c1PHnvf+NVM3aZcMVciw=;
 b=IMp9ZQ8lQrW41hcxSmbmkKJQKb4o2g9lmRR+jIdIBQrpjyz0ewSQCLIUe4ps7xwOZH
 lMxxZ6zfXj6ZDXCQKTrIVNQXxrybtIM1AlPUauftLIF94cmMV7vzbzXCLYEaRIV1MqDK
 KN4XKRbFya13tlYOxbl6ry9UEbj5FhVj2dsDimEFyQluDEXddEM1TduK5cIDB/Gn/avj
 jpW8CuZunGyd+75Gstejm/NxvogAowDOGCe1sbwWQP5cKWPcTZZ+YecZy7GWlGblmjZE
 fkuHQCaxWkc6M6la3d+bqLBAnzgBiy6rZE+5ix8ggJpV1cNtwJPs3OWzN9kfkPLBKaZP
 SNtQ==
X-Gm-Message-State: ABy/qLax4qvKod8/vtbDaIyO5enfCrQAsf/2SYACso8+DObNG6Afi0uD
 /dSWcWTW7+59wW5LRKVeaXBlrx+dIzA=
X-Google-Smtp-Source: APBJJlGyhiRxbH/Xusdq63YAbGhrDNP3Dn+K2mFYcg1s76Il3dpekOhx72jdwI/0nEC3hGWW5LUqWA==
X-Received: by 2002:a92:c521:0:b0:340:8f2b:ad53 with SMTP id
 m1-20020a92c521000000b003408f2bad53mr4160815ili.18.1688677860487; 
 Thu, 06 Jul 2023 14:11:00 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:6c80:7c10:75a0:44f4])
 by smtp.gmail.com with ESMTPSA id
 a11-20020a63704b000000b00528513c6bbcsm1701472pgn.28.2023.07.06.14.10.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jul 2023 14:10:59 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 00/12] drm/msm/adreno: Move away from legacy revision matching
Date: Thu,  6 Jul 2023 14:10:33 -0700
Message-ID: <20230706211045.204925-1-robdclark@gmail.com>
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Downstream seems to be moving to using the chip_id as simply an opaque
identifier, and if we want to avoid headaches with userspace mesa
supporting both kgsl and upstream, we should move away from the
assumption that certain bits in the chip_id have a specific meaning.

Patches 6 and 7 were something that I came up with before Konrad
suggesting moving fuse/speedbin mapping to a separate per-SoC table.
Which I guess would also work.  But I guess if we did that, we'd want
to move things like whether cached-coherent is supported to that table
as well.  I'm not a huge fan of pretending that whether or not you have
cached-coherent is anything to do with GMU itself, rather than just a
happy coincidence.

Rob Clark (12):
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
  dt-bindings: drm/msm/gpu: Extend bindings for chip-id
  drm/msm/adreno: Switch to chip-id for identifying GPU

 .../devicetree/bindings/display/msm/gpu.yaml  |   6 +
 drivers/gpu/drm/msm/adreno/a2xx_gpu.c         |   2 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c         |   2 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c         |  13 +-
 drivers/gpu/drm/msm/adreno/a5xx_power.c       |   2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c         |  15 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         | 187 ++----------
 drivers/gpu/drm/msm/adreno/adreno_device.c    | 282 ++++++++++++------
 drivers/gpu/drm/msm/adreno/adreno_gpu.c       |  52 ++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.h       | 150 +++++++---
 10 files changed, 362 insertions(+), 349 deletions(-)

-- 
2.41.0

