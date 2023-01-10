Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 37826664FB1
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jan 2023 00:14:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D69CE10E68F;
	Tue, 10 Jan 2023 23:14:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 454D510E68E;
 Tue, 10 Jan 2023 23:14:45 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 o7-20020a17090a0a0700b00226c9b82c3aso15202718pjo.3; 
 Tue, 10 Jan 2023 15:14:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kYQIennFxviwmYcSwf3vI6zjgdWqQpoESJjvtOEJngs=;
 b=QylWbY3EZHiwSX6vZUzNyhSVz8+6G5nB1q7XGH8P5SjVkZB+xBLLjm8cAJ+yqXI1mG
 yiPs5wWwRekqoHiWIeruX4iqoYQoT5zJOz1GiHaZRzo7XWFIaXaYgmoRZFrfv8UUvJA7
 dwECbRABKNDAnPIWp8iVqes5kS/QhHqkE8m/OgMBFSq9RZAixW2Yqd3EVz4bAtvI9I5A
 aH+Q/0fix/+uisYg0Q5xITINRZiRN2Nr5dsEf4xxHHvRsV5I6IOBt6vktYewLt4EnY+l
 UDGrL3KRDfSgcW3AUuEhFG9VEWgVs1yHOQikB/Hsfh82le238JnphMN+cSM/51KWKfM+
 +VKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kYQIennFxviwmYcSwf3vI6zjgdWqQpoESJjvtOEJngs=;
 b=0NoMfQshbmu5rBEzuikFPt+Y6+m1xrku1zUuv3qlNm7w7I48CSw+NgbO+cHG7xyYKs
 6WyjOs/7FtKihmaHMBCoQKpB5e2XCM7hpJXt8+tTlHiVmXZkS9n9KGAM1/x4fTAmKjL+
 CFbnYwwiLOobhvMC8KeRXK8X7+UUYx4oTYURPgrFbSAWOS4BDHkcyjBGcXfqjsUWX4+i
 iaPzlsKNQ9j3V1e6gfhq1jcUVAnDprF6pFLsZwYOu/lWfD/NUw1nqbKmvIgme9cjdaBx
 CgT3B9e0Lb8bdnbcUsr3ixTtyFW6PobCfLwSP+67U78GplXU0vEOQIEuZnCOR4tLJW1k
 JZ7Q==
X-Gm-Message-State: AFqh2kp1nyhqmZYH9igvRTpzaSor4FqTrzJotEJJETL8EBQHU25Y4QMt
 BPplhr6AHQN7Vk4W/1kcBmemuGr9K9U=
X-Google-Smtp-Source: AMrXdXuVr4+jnHInPBlky23R9pRNdzS5jz+U1t8ZEFU1/iKc1c6EHE7KAU090kQNoD+lqHx2oud4Zg==
X-Received: by 2002:a17:90a:5791:b0:227:1c85:f5f4 with SMTP id
 g17-20020a17090a579100b002271c85f5f4mr7019607pji.5.1673392484574; 
 Tue, 10 Jan 2023 15:14:44 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 5-20020a17090a098500b00216df8f03fdsm9379409pjo.50.2023.01.10.15.14.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 15:14:44 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/3] drm/msm/gpu: Devfreq fixes+tuning
Date: Tue, 10 Jan 2023 15:14:41 -0800
Message-Id: <20230110231447.1939101-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.38.1
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
Cc: Rob Clark <robdclark@chromium.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Rob Clark (3):
  drm/msm/gpu: Add devfreq tuning debugfs
  drm/msm/gpu: Bypass PM QoS constraint for idle clamp
  drm/msm/gpu: Add default devfreq thresholds

 drivers/gpu/drm/msm/Kconfig           |   1 +
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |   2 +-
 drivers/gpu/drm/msm/msm_debugfs.c     |  12 +++
 drivers/gpu/drm/msm/msm_drv.h         |   9 ++
 drivers/gpu/drm/msm/msm_gpu.h         |  15 ++-
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 148 ++++++++++++--------------
 6 files changed, 100 insertions(+), 87 deletions(-)

-- 
2.38.1

