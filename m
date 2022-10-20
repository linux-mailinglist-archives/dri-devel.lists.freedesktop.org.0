Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E8136068EA
	for <lists+dri-devel@lfdr.de>; Thu, 20 Oct 2022 21:32:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB75110E678;
	Thu, 20 Oct 2022 19:32:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D72810E471
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 19:32:00 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id c20so765886ljj.7
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Oct 2022 12:31:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=3FLf2jGC6agDdYJZ5+vrm0x/EXG2lDA+AUkXWt5l31g=;
 b=y3EJkcit7qMxi0ZUqMGyQ5B8T+E5Oc1h6eVpWTrnAV1LyDSWdoquwKXUAR/rgrcRUc
 +SSjPYqzf+zZqdE+1Vd77V39xZ2pu8OpiYK1DHGQTBH401edZFlM1v70YVBfFj7w0tjJ
 wt5Tg9/A+9YOLEJP/TVl+Ki9pyfGz+a4nRw8VGX7pLu0VGG0jWZktaUyxmty7++hjgxo
 aiH83ytM2oJmZLJZrDLma0pkktA0eFkQmLF/NJq1SBHvWRRj6oLX/MXPutaWdo/QOPj+
 pY+I50NQS6fcFZreuNPgulVTM64HgH6+L17z3bwSvo+O6LnskfDq65vo/SsXQCQXeH6F
 feBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3FLf2jGC6agDdYJZ5+vrm0x/EXG2lDA+AUkXWt5l31g=;
 b=Jbfsvt1t7UBMylEnki4KjvTDQvF+CBfVyPvSE9r8WEc3cZo9YD8bd3rEzUrvz88Q0M
 6PL+30iNI9Xr7h9uLXxsMh3zBOovEqLE0Jh6yyPkZ1XxZN6/+FlvTeGacUDv3eYIES2l
 m14aerNLUvjtj4jIQFspt5GqiGH65xdQ+zDVummwEbyf5OC0USPBkYJAlYKhNir/5abE
 OjEDSbtb5dBu0srf3XvL70cKTrL7q9ELpM+MhQ88xnrnyeUktGRuirvyHsiQJxLg13Xh
 IQjl9uNcw5RBA7tPTI4uhweQT7nQSYDs0ZPHTSoFbB5ICaUS9kKzJW+JOqcX9VjKL/ik
 CnTg==
X-Gm-Message-State: ACrzQf18enQ0C3oBufFFxNnpftR3oBmOYK+MVP4Cu3/VtdUzumAPih7q
 WKS0UxGq5QKGkvJRAUEH59OIlQ==
X-Google-Smtp-Source: AMsMyM6t3LA7a7zZSUSBM/G1xeBu4xoo9Q22Su/3RoL/L+68pvp6cD2qKCooKmyhCpVP9iNPsxmTEw==
X-Received: by 2002:a2e:809a:0:b0:26f:c1a0:2557 with SMTP id
 i26-20020a2e809a000000b0026fc1a02557mr5139227ljg.54.1666294318354; 
 Thu, 20 Oct 2022 12:31:58 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d7-20020ac25ec7000000b004a2c3fd32edsm2830652lfq.144.2022.10.20.12.31.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Oct 2022 12:31:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 0/2] drm/msm: clean up iommu interface a bit
Date: Thu, 20 Oct 2022 22:31:55 +0300
Message-Id: <20221020193157.2147112-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series started as an attempt to rework the drivers usage of IOMMU
domains. While the idea ended up to be wrong, these two provide a
sensibly looking cleanup.

Dmitry Baryshkov (2):
  drm/msm: remove duplicated code from a6xx_create_address_space
  drm/msm: move domain allocation into msm_iommu_new()

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c    |  7 +++---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c    | 31 +++---------------------
 drivers/gpu/drm/msm/adreno/adreno_gpu.c  | 24 +++++++++---------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h  |  2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 19 ++++++++-------
 drivers/gpu/drm/msm/msm_drv.c            | 18 ++++++--------
 drivers/gpu/drm/msm/msm_iommu.c          | 25 ++++++++++++++++---
 drivers/gpu/drm/msm/msm_mmu.h            |  4 ++-
 8 files changed, 63 insertions(+), 67 deletions(-)

-- 
2.35.1

