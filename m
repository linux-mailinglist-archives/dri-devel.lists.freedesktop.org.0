Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4A33901DF
	for <lists+dri-devel@lfdr.de>; Tue, 25 May 2021 15:13:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD49689A60;
	Tue, 25 May 2021 13:13:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E51AC89A60
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 13:13:19 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id j6so43332912lfr.11
 for <dri-devel@lists.freedesktop.org>; Tue, 25 May 2021 06:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hJL+Uzw/r0kzj1iQLltCJOxsq9P55CtDFAUVNl5JQjU=;
 b=PfYI/8d1lZPks+9Vdpgd1k8YHa1+KvlIPpcZ3yQ+xjYNtdtld4C7r0gSjZQ+5QCy75
 jWF26RjNKZneKVFOPPsskK+1lUWUyaMarlLt4oFCXeXYymdq7JKGfys5DOid1wx6lPzq
 OwnhV9PNkI6NXLRlUmA1EClF0uMJkDtE2UcBt2+2p7xEv/AOs9s2DUrqOhnYT1rdNwSg
 INicbcOgJLfEkPRxv8GHZVxVOdmspYuKjXvKzPdsiu2k+wAedNwuIjglAaXL11EAcZVa
 +Qr2MPNx/xkW3i+GnkLJTQnzP6iZAjDpYT4nsUw/Qge+YQJrGlNJbHJcP1N6Omm03JSZ
 Xm6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hJL+Uzw/r0kzj1iQLltCJOxsq9P55CtDFAUVNl5JQjU=;
 b=rMFM/xTnz8oteUwAfJrOucMwj2BfEOcFNSRhDSkh3OCgPDZPZDWJNgnJI061Qopyb9
 NakXX1lB3fuAePeg04pvE009S3HCSCcDMruMxvZGvFwQuqxhJnpkQ3Ud33NKDAr5WS4y
 M64rNSw4LN9JXIcUdh53F6C5Rf0EbF1LVGdnASTZ3jU5HoJtcdKA0HQq3AqH2+P+CFmC
 dEDGD6xGPahtwz7B1mvT6FEgIPYAUuM+UeymcqomIAEO9BCPU5a7wrJOvuHALgpZicVJ
 YSLl9Q/Juu/NoJaY2/daK1B4HEdcsKCL7sWnSQH9oGqxJ/zl3v4Rxo9dCMCQs4ujpGis
 xQKg==
X-Gm-Message-State: AOAM531MJ3OBKM37PATC2dop9BIQdozA1UMUb96LcVtaeQ//qsrqi0z3
 98snapAkUhOMC9WofCTbuGWO3g==
X-Google-Smtp-Source: ABdhPJyLqqm8SZ2+GAzB/vRBl3YPCvaDaU9DFYRtpQJr62LEnKvMf8pXwgoXO2ZS17zZvgKdfCLa5g==
X-Received: by 2002:ac2:50da:: with SMTP id h26mr1845382lfm.390.1621948398298; 
 Tue, 25 May 2021 06:13:18 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id t20sm2101108lji.53.2021.05.25.06.13.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 May 2021 06:13:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Subject: [PATCH 0/7] drm/msm/mdp5: add properties and bandwidth management
Date: Tue, 25 May 2021 16:13:09 +0300
Message-Id: <20210525131316.3117809-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Update MDP5 display driver to support current implementation of
alpha/blend mode/zpos properties. On top of that port bandwidth
management from DPU display driver.

The following changes since commit 8dbde399044b0f5acf704ab5f8116bd8b1dfcf95:

  drm/msm/dp: handle irq_hpd with sink_count = 0 correctly (2021-05-24 16:08:33 -0700)

are available in the Git repository at:

  https://git.linaro.org/people/dmitry.baryshkov/kernel.git mdp5-update

for you to fetch changes up to 501c3f8c40e139d97b17240e0a5492a12b6c722d:

  drm/msm/mdp5: provide dynamic bandwidth management (2021-05-25 16:10:17 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (6):
      drm/msm/mdp5: use drm atomic helpers to handle base drm plane state
      drm/msm/mdp5: use drm_plane_state for storing alpha value
      drm/msm/mdp5: use drm_plane_state for pixel blend mode
      drm/msm/mdp5: add support for alpha/blend_mode properties
      drm/msm/mdp5: switch to standard zpos property
      drm/msm/mdp5: provide dynamic bandwidth management

James Willcox (1):
      drm/msm/mdp5: add perf blocks for holding fudge factors

 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c   |  35 ++++++
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h   |   7 ++
 drivers/gpu/drm/msm/disp/mdp5/mdp5_crtc.c  |  56 ++++++++-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c   | 119 +++++++++++++------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h   |  17 ++-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c | 177 ++++++++++-------------------
 6 files changed, 249 insertions(+), 162 deletions(-)


