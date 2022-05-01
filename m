Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA55516390
	for <lists+dri-devel@lfdr.de>; Sun,  1 May 2022 12:10:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 217C910EAC8;
	Sun,  1 May 2022 10:10:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F4CA10EAC8
 for <dri-devel@lists.freedesktop.org>; Sun,  1 May 2022 10:10:25 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id bu29so21029287lfb.0
 for <dri-devel@lists.freedesktop.org>; Sun, 01 May 2022 03:10:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G27wgdd/ZwvOWQ526mQM89rV7+V8FgRW2sR7NATsocw=;
 b=kU7AbjSRYqZGWt/IVMwirjrR6WpiCwboMH7bfBW5Rbpiby5hLkOivzIvjZ48wggzwm
 6AIffeWAwUsAeYXghedDZ9aAo0r6mXKoIv5vT6MpGL1TR45V9yNW12ayqvq24ZeZ2vEq
 sJHCqB06x+AJ4oaxHOJ1YNP8CIYuPTSUioee+YWuvYHyC2flphjSGKyzBu2cvxs6DpoT
 Vt0veVNY19khJQrPMl2Bo+eZFMBgq4btzYntwMjbIf9SJdXo6Bf6SiL+RynUYXjIaONu
 Dcp85ceB/yXnWmwQ7NjTbd7QlzulLQNZ0bOgB64mY8a7wQvRrqPidA5yZxSmNUgYSE2d
 BOqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=G27wgdd/ZwvOWQ526mQM89rV7+V8FgRW2sR7NATsocw=;
 b=GsFh5nUa592RiakKG26I7l2Sy1a+ZsGlsrFpb14RGtd5+z2IiMEQCzVn9tIZ9iXmf3
 kMuRnr2IGtqv4cQgd81oUQ2QBMsRzWhni6zzxV3Ldx+GsfKWnv2SWEe+gMuVZQeEB+Q/
 cC6OVijx/t03dMnfWn9KjBa4791n1l3nS48IVqgxsW49gDNGOCDVC+daj12UgvX7wSU0
 GyDQBOOi09zbg5xt9XEXC5GmIOITHrYgjR7jfM/WUc888HEdPuiBjYD/SjIzI3ESsnSZ
 vtch5a1hC/w7PhIYKN7sBzhgadi155YiNM/tTAl8nd+yBi0bmL+QyS/FvRBf123t6sRZ
 gOEA==
X-Gm-Message-State: AOAM531nFQZIywr4ajj4Ig4J0hCFPoUwJhUXOX4b7rZkWrih2DmzPb0I
 eaug9cBwhjbRou7CEAxU4CqTTg==
X-Google-Smtp-Source: ABdhPJxrVlSOlP2q+CFvx6DhukQA7dZ/3Eu8p4Ke5TIuXemYFkOZUSArjyxTEullMVARludl7N4Igw==
X-Received: by 2002:a05:6512:3e13:b0:471:f6a9:85d3 with SMTP id
 i19-20020a0565123e1300b00471f6a985d3mr5796824lfv.120.1651399823711; 
 Sun, 01 May 2022 03:10:23 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 h7-20020a2ea487000000b0024f3d1dae7csm766412lji.4.2022.05.01.03.10.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 01 May 2022 03:10:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH 0/3] drm/msm: fixes for KMS iommu handling
Date: Sun,  1 May 2022 13:10:19 +0300
Message-Id: <20220501101022.3931295-1-dmitry.baryshkov@linaro.org>
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
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series started from the applied and then reverted [2] patch by
Robin Murphy [1]. After the MDSS rework [3] has landed it is now
possible to reapply the extended version of the original patch. While we
are at it, also rework the IOMMU init code for DPU and MDP5 drivers.

For MDP5 this moves iommu_domain_alloc() call and removes struct
mdp5_cfg_platform remains.

For DPU this allows specifying the iommus = <...> either in the DPU
device (like all DPU devices do) or in the MDSS device (like MDP5
devices do).

[1] https://patchwork.freedesktop.org/patch/480707/
[2] https://patchwork.freedesktop.org/patch/482453/
[3] https://patchwork.freedesktop.org/series/98525/

Dmitry Baryshkov (3):
  drm/msm/dpu: check both DPU and MDSS devices for the IOMMU
  drm/msm/mdp5: move iommu_domain_alloc() call close to its usage
  drm/msm: Stop using iommu_present()

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 14 +++++++++++---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 16 ----------------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h |  6 ------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c |  6 ++++--
 drivers/gpu/drm/msm/msm_drv.c            | 10 ++++++++--
 5 files changed, 23 insertions(+), 29 deletions(-)

-- 
2.35.1
