Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 540F73D5BE0
	for <lists+dri-devel@lfdr.de>; Mon, 26 Jul 2021 16:39:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 748A06EBA8;
	Mon, 26 Jul 2021 14:39:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CF026EBA7;
 Mon, 26 Jul 2021 14:39:50 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id b6so13152970pji.4;
 Mon, 26 Jul 2021 07:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yYvK9aTzc6a6mw4NkjoqvsdrfloQMHrbtNcPQkcDqvs=;
 b=sNrV1hIjNLb+jarQ5Td+Ia164crR90C5uz98OgfCVUBSZZB7/clHXhcPJv6x8DJbuN
 rKAl8/Ar8I6pkKdPNSovPLl7JlOOgFjvJXzAuW26ut/CUiuT1JWum4Hevp1VNL0gph5m
 GmmJSTraAZ+BgqAIvbTV6c1bYkAKqAsESejOKo/kIlGO5LEBQJpHURthQyl65kK0s2vs
 TdMMaM4c4ifKl6/FWHeBy4+0vUT59SfiX1RCnXvuXjBbVqCohj7oQObXCI/3vERRIifH
 K6xvLCFG790+7pwl0Wr+ujMKC14Q3gls9yn+gHe4y7PvpALLJSMTDYylu+L2Ut6CFo+4
 jGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=yYvK9aTzc6a6mw4NkjoqvsdrfloQMHrbtNcPQkcDqvs=;
 b=AUVvICANMT+z6+qm227uY/nn2kDBdjlhMTO0P3YEod63nzBPc/aDomXQllIu4aOJqs
 H2Xvhbq4OVgQCv0pDTZmdOrcnVWomvyFHbGvCmXaJTYfJf/HjVz/Mxn4yLN2MsyTSm2O
 OPgPWRE9S0eIElD2wBslDPxNr/nu/bfns4IhfgjG3VH4rvFOBgXDshGrjqdrLnE/hr72
 X/vQhCDthJBeEu8jJB/MOJeTZPlRSs8csC//0xgsYw2Ix8QmUKy1IHsflmu2/WCp+XkZ
 KHv12Jk5Muw8zIngJIRrNhdm9rUMlaGpNTBwoRtq+cBXoeTVm65w0Ales5eFMgofFVdv
 BWGQ==
X-Gm-Message-State: AOAM5311AQNKCN7+3kjlA0XOxcTAsMCjWI2wemH6sXaa8ui3VCewBICT
 i3+XUQerz5qG0wmZyfOyS0n6I6kW6j2USA==
X-Google-Smtp-Source: ABdhPJyANxBEIcujpjY/aUnkk7Nm6OAiHljjrusdLSVto/jwB7ZIzT4K22rrIQ3wqUrjA6/cHXMBeg==
X-Received: by 2002:a17:90b:1e46:: with SMTP id
 pi6mr8048098pjb.57.1627310389230; 
 Mon, 26 Jul 2021 07:39:49 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id d31sm28342226pgd.33.2021.07.26.07.39.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 07:39:48 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] drm/msm: Reduce fence signal latency
Date: Mon, 26 Jul 2021 07:43:56 -0700
Message-Id: <20210726144359.2179302-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
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
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:DMA BUFFER SHARING FRAMEWORK" <linaro-mm-sig@lists.linaro.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 "open list:DMA BUFFER SHARING FRAMEWORK" <linux-media@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

A couple tweaks to reduce fence signal latency.

Rob Clark (2):
  drm/msm: Let fences read directly from memptrs
  drm/msm: Signal fences sooner

 drivers/gpu/drm/msm/msm_fence.c      | 11 +++++--
 drivers/gpu/drm/msm/msm_fence.h      | 41 +++++++++++++++++++++++---
 drivers/gpu/drm/msm/msm_gpu.c        | 44 ++++++++++++++++------------
 drivers/gpu/drm/msm/msm_ringbuffer.c |  2 +-
 4 files changed, 73 insertions(+), 25 deletions(-)

-- 
2.31.1

