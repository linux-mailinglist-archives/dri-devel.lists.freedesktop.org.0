Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14124744387
	for <lists+dri-devel@lfdr.de>; Fri, 30 Jun 2023 22:55:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F42510E190;
	Fri, 30 Jun 2023 20:55:28 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F306D10E186
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 20:55:26 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4f875b267d9so3742990e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 30 Jun 2023 13:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688158525; x=1690750525;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QYtFgFK+NL5eYqb4xNnzL2p3K6aTu66Q2w04c7k1+g0=;
 b=hBGmOE4VZlSKM8yX0Hgd2jtXMt/Ai4Yqe4ZnOi4wL6mfEKcO9u+LIdwcgLcBf1/IBN
 NPC5G6CoKXJOPXyt0Exy43x2LsvGasIzMOy5yH2OngeAYrfnEGM7h5OY4njC6J2ebdtr
 JkUe7IXoo18legdHyhPcpURRqNcvC5dUOVzjJHA/TKH0xIAy5Jrh/h/RHJtadqjarpCQ
 0L4FWWZd7JHQzzsQ/dd0Okdm13RExLY08vC6EkjdkYg9PH+akWXmnBbNQM+xtZ9RUmOT
 Z8khraeHR0xinbSlvr1IQY5IVmxd78G8V5SmKaMi++MLJPy3Jzg5dzejrPfI1stp3AYt
 VNTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688158525; x=1690750525;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QYtFgFK+NL5eYqb4xNnzL2p3K6aTu66Q2w04c7k1+g0=;
 b=j1haosh9L7z8hkGJ6GpwyNwMC+zs085ePb1Nda26GfJXDmVeW1UkRg97hdqrrwu+AX
 ASq8zbhQJF+U/NflAVcUb6M02YZ5paQlrD7/5wFpHZueq2TsbKvdqs+M4a38v8cCkTu7
 ZYHQmQ5KkaUX6StOb9vX0EcYLrGBQDW9WGWm1G1/St4nKnAov7oagFz8YvShzyYm1Nr0
 4xZ3JR4xjvDNQETyD5en/u3d7NG7ZU79eyB8CpbDPm3AlzD40Vx93zEbGCAqj14JjBEv
 vr9DRuZy/JbE+KFfZIClgsxT7va/7M+oARKWg9oJrw5agM93fQiC1s/Joudl6hD8WWih
 eHEw==
X-Gm-Message-State: ABy/qLZkDqYMNDEfodmVtQRfoGwrbhu4Gn+NyBYxN8KnsrT6zNjZv8CZ
 dVWcJ3+xNA3Ugi8MabkZVSQrCw==
X-Google-Smtp-Source: APBJJlEjJEJbzJFN8+cyZiTlliH1NT5AXfoP1N+rUDn6ZmsCYiVJ08mX8buEls2jbxnQX9a5hjGvCQ==
X-Received: by 2002:a05:6512:39c3:b0:4f9:570c:7b28 with SMTP id
 k3-20020a05651239c300b004f9570c7b28mr3756503lfu.32.1688158524685; 
 Fri, 30 Jun 2023 13:55:24 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z11-20020ac25deb000000b004fb75943aa0sm2252168lfq.196.2023.06.30.13.55.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 Jun 2023 13:55:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH 00/15] drm/msm/hdmi: rework and fix the HPD even generation
Date: Fri, 30 Jun 2023 23:55:08 +0300
Message-Id: <20230630205523.76823-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The MSM HDMI driver is plagued with the long-standing bug. If HDMI cable
is disconnected, in most of the cases cable reconnection will not be
detected properly. We have been carrying the patch from [1] in our
integration tree for ages. The time has come to fix the long-standing
bug and implement proper HPD handling.

This series was tested on msm8996 and apq8064 boards. On APQ8064 in some
rare cases I get the backtrace logged at [2]. It is unclear if it is a
result of this series or not. I'll investigate it further later on.

[1] https://lore.kernel.org/linux-arm-msm/20171027105732.19235-2-architt@codeaurora.org/
[2] https://gitlab.freedesktop.org/drm/msm/-/issues/27

Dmitry Baryshkov (15):
  drm/msm/hdmi: move the alt_iface clock to the hpd list
  drm/msm/hdmi: simplify extp clock handling
  drm/msm/hdmi: correct indentation of HDMI bridge functions
  drm/msm/hdmi: switch to atomic_pre_enable/post_disable
  drm/msm/hdmi: set infoframes on all pre_enable calls
  drm/msm/hdmi: drop clock frequency assignment
  drm/msm/hdmi: switch to clk_bulk API
  drm/msm/hdmi: switch to pm_runtime_resume_and_get()
  drm/msm/hdmi: add runtime PM calls to DDC transfer function
  drm/msm/hdmi: implement proper runtime PM handling
  drm/msm/hdmi: rename hpd_clks to pwr_clks
  drm/msm/hdmi: expand the HDMI_CFG macro
  drm/msm/hdmi: drop hpd-gpios support
  drm/msm/hdmi: ensure that HDMI is one if HPD is requested
  drm/msm/hdmi: wire in hpd_enable/hpd_disable bridge ops

 drivers/gpu/drm/msm/hdmi/hdmi.c        | 142 ++++++++++++-------------
 drivers/gpu/drm/msm/hdmi/hdmi.h        |  26 ++---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c |  91 ++++++++--------
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    | 141 +++++-------------------
 drivers/gpu/drm/msm/hdmi/hdmi_i2c.c    |  14 ++-
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c    |   6 +-
 6 files changed, 160 insertions(+), 260 deletions(-)

-- 
2.39.2

