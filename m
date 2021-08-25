Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A371C3F7E6B
	for <lists+dri-devel@lfdr.de>; Thu, 26 Aug 2021 00:24:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3169B6E42C;
	Wed, 25 Aug 2021 22:24:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32f.google.com (mail-ot1-x32f.google.com
 [IPv6:2607:f8b0:4864:20::32f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38A926E42E
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 22:24:45 +0000 (UTC)
Received: by mail-ot1-x32f.google.com with SMTP id
 x10-20020a056830408a00b004f26cead745so897802ott.10
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Aug 2021 15:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lsXe1e72wRkGIfMRaHX5V5OYsm6EaNn+8h1FDv1jEg8=;
 b=u3SuP2a+axhJJ3ZFEMFVhEpZAHwKfExb7Q1cnnzCtb3nQy4FMfuBD8YPhOjL4p1Suu
 SXRqPLGCZ0BZxQfJxAmnW0XQDcYtn9Bo/pd/MUIWpi34SdReEWfeVhgiRniKI/RQje6T
 yxDhU4iVyjE3FqfnPHKsFi/zvNKoADJ+daHM+jRKIgT0cT+GNQOpY1/Fgavt91L1G4ac
 5q8VCEb15WFvq53rok5lk7IqdqvLVczUkhX4sQuiDh0QppSAFzJH3wb63EaJk4g4QNiA
 4KDTwOfhxXPkfQ1hp5Z3rdYgf6Ql6pTzr5MpdPbckdsX3hEdUF0y2tY/Ksn13tc7XcR8
 V78A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lsXe1e72wRkGIfMRaHX5V5OYsm6EaNn+8h1FDv1jEg8=;
 b=Z6IgV5b9iF0XqtPi4qmPIihw//TXvCYl0jMRJOpzb20MyBeALFLNve5wefKxZ6u/Va
 96f2DH5pI7qzUbAaPD8tBseucN0mNcwAXINiixicCxO8DhhiVoBHqWK8pS6SRBuLW2cP
 f+V4BG4fRmLmOElxohlUDYzaNBJmDjP5WF4HV/kPLeRh7VqcW6F+F32oNOoHJCMJrmSE
 nR4LEtHIjGAVmLFplIwRMec/VOv9bspTumIZfkGbCXASGWD6jQZ2Md59Lfpj7/Hx4e/F
 hmNb2T4E3yDi4VsJqGqJfIpKSvfT0YmuDvW6ohHf2YUBIH27Ji4CBgU23Qoqg1x1To1A
 fUHg==
X-Gm-Message-State: AOAM533rt5bQ2ljX/eSUjGCoW1zBdIdLuHj7Djp50VNz7AOIMLlsGr05
 jb8mxjZryvcq8lwPiPcTcx1oyA==
X-Google-Smtp-Source: ABdhPJzxblTCS2xRcc4B1gj6x6TLZbGGe/ZkxV55c9Zg/bc+WmiakZRcH3jYSR1lzG2mYLzQvdoLAA==
X-Received: by 2002:a9d:4683:: with SMTP id z3mr542498ote.95.1629930284432;
 Wed, 25 Aug 2021 15:24:44 -0700 (PDT)
Received: from localhost.localdomain
 (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id u19sm263721oiv.28.2021.08.25.15.24.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 15:24:43 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Kuogee Hsieh <khsieh@codeaurora.org>, Tanmay Shah <tanmay@codeaurora.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/5] drm/msm/dp: Allow variation in register regions
Date: Wed, 25 Aug 2021 15:25:52 -0700
Message-Id: <20210825222557.1499104-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

It turns out that sc8180x (among others) doesn't have the same internal layout
of the 4 subblocks. This series therefor modifies the binding to require all
four regions to be described individually and then extends the driver to read
these four regions. The driver will fall back to read the old single-reg format
and apply the original offsets and sizes.

Bjorn Andersson (5):
  dt-bindings: msm/dp: Change reg definition
  drm/msm/dp: Use devres for ioremap()
  drm/msm/dp: Refactor ioremap wrapper
  drm/msm/dp: Store each subblock in the io region
  drm/msm/dp: Allow sub-regions to be specified in DT

 .../bindings/display/msm/dp-controller.yaml   |  13 ++-
 drivers/gpu/drm/msm/dp/dp_catalog.c           |  64 ++++-------
 drivers/gpu/drm/msm/dp/dp_parser.c            | 102 ++++++++++--------
 drivers/gpu/drm/msm/dp/dp_parser.h            |  11 +-
 4 files changed, 100 insertions(+), 90 deletions(-)

-- 
2.29.2

