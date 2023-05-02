Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC776F469F
	for <lists+dri-devel@lfdr.de>; Tue,  2 May 2023 17:05:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2DA3E10E579;
	Tue,  2 May 2023 15:05:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5EFF10E579
 for <dri-devel@lists.freedesktop.org>; Tue,  2 May 2023 15:05:36 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id
 38308e7fff4ca-2a8c28158e2so37843701fa.0
 for <dri-devel@lists.freedesktop.org>; Tue, 02 May 2023 08:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683039934; x=1685631934;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=er6uZ2Jm9haTMcFY7KD9AAR3BYHrxeDV+fDEIq+qzbU=;
 b=lwvMRaTbj6M2HCTghvl8PCWKQb9xxtECbfnG/oj529Mz2WWUhUo2u1UKfYuh8pQU1+
 mZDLHQwoLJ7e7dqsmCKkuVtTpqrbo48LR3k9rR7VbyeaqOn1v2O7QrddsZipwn8DUAOL
 kDhjseYlcnkrkgwUljCA8t2b4dKmhU/ESppGfjw+BiF9hGWqEXztYwRF9A9xKrS75joW
 jnh7MywkbmMlBg2DesIQeWOudFsISLa8fkRE/2pVp7jHwC9sAgu5NdJVgwL3yH7C26Tc
 uh6KR85RCFWfS3JkPAD3HK1kmjAOtnt7mNxPTST41EQ7KXc+Rg/1JO3SVH5TV+PkXVI2
 TBXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683039934; x=1685631934;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=er6uZ2Jm9haTMcFY7KD9AAR3BYHrxeDV+fDEIq+qzbU=;
 b=PnD6ORVcY2SeLOQS1Ixb8oLaecY1HT4CB8fj47yUt4vXMO/w1BoIPDef5O2wDRTYsP
 Jo9F1cI+sBmbSW88ybrgBZ8+tPWlSSGA+5LgQyW4tJzKEOpMT7HAoELCuji5QysqCWFd
 WyLBrQngorv6o0wCa7qOF95X1tN3cHDVivfn+4k4dOVtYAhUHUISkdly3R1D95bfkK+E
 KlxjVyFJhPzJL9j23qrLe4fOzarm+QVRVqk0BZZRJtZdVYs21TL2ZejgO6WaAm4pJBRC
 ib7EPXueh7BAc4gZzGVlbDRxvgA+PFiQqBn66uLjvdW5354kh4zNo5kCGDwn6ZCKgjJt
 O6zw==
X-Gm-Message-State: AC+VfDzg2qHwQxDebfJMpfb0emyZdJ2x4lWr3hvT1UxWjo2ncNDS+Aiq
 /hUOwwBx2lWTkCQs7MBn3mA07A==
X-Google-Smtp-Source: ACHHUZ4Y2KzHHTiUxhebn6B6ijI7/6qVJ3xvmzPc5H3/8SF5nY/wKX7Z0R7LOIxWrQclhtp99uBiKw==
X-Received: by 2002:a2e:b00e:0:b0:2a8:b286:826e with SMTP id
 y14-20020a2eb00e000000b002a8b286826emr4642926ljk.33.1683039934435; 
 Tue, 02 May 2023 08:05:34 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 a22-20020a2e8316000000b002a8bb52d994sm5341659ljh.25.2023.05.02.08.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 May 2023 08:05:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 0/9] drm/msm/dpu: simplify QoS/CDP programming
Date: Tue,  2 May 2023 18:05:24 +0300
Message-Id: <20230502150533.3672840-1-dmitry.baryshkov@linaro.org>
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

Merge SSPP and WB code programming QoS and CDP. This allows us to drop
intermediate structures and duplicate code.

Changes since v1:
- Fixed kerneldoc for _dpu_plane_set_qos_ctrl()
- Fixed danger_safe_en programming conditions (Jeykumar)
- Simplified the code surrounding setup_cdp() calls (Jeykumar)

Dmitry Baryshkov (9):
  drm/msm/dpu: fix SSPP register definitions
  drm/msm/dpu: simplify CDP programming
  drm/msm/dpu: fix the condition for (not) applying QoS to CURSOR SSPP
  drm/msm/dpu: rearrange QoS setting code
  drm/msm/dpu: drop DPU_PLANE_QOS_VBLANK_CTRL
  drm/msm/dpu: simplify qos_ctrl handling
  drm/msm/dpu: drop DPU_PLANE_QOS_PANIC_CTRL
  drm/msm/dpu: remove struct dpu_hw_pipe_qos_cfg
  drm/msm/dpu: use common helper for WB and SSPP QoS setup

 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  21 +--
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   4 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 142 +++++----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  52 ++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  52 ++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |  32 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     |  48 +----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h     |  27 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 165 +++++-------------
 9 files changed, 194 insertions(+), 349 deletions(-)

-- 
2.39.2

