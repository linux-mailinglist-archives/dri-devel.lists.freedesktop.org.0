Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 484CD790FD4
	for <lists+dri-devel@lfdr.de>; Mon,  4 Sep 2023 04:06:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E818210E274;
	Mon,  4 Sep 2023 02:05:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2202610E27D
 for <dri-devel@lists.freedesktop.org>; Mon,  4 Sep 2023 02:04:57 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2bbbda48904so14970721fa.2
 for <dri-devel@lists.freedesktop.org>; Sun, 03 Sep 2023 19:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693793096; x=1694397896; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=D1nAMmRQCWVsoeyuEdqi5PFFET6oxn1mJnH5bH17bkA=;
 b=C0Fld7oy5RUd4bJa2W0EeFXeOkxymGJdJSlxuY3sW6giYcR53IAe2Pj9Kt9sFetCzj
 nvZ856WTvyQqsXgAiSC6yL9jLJErTxg1hSP3WkFYaV9SlMityhWUKWePWFwleLbbw9eo
 3wnQI5vDnYBS+0tZOD8Iy3ionflKQlVscyFxAlrqz+6ZLDBH5QAwUa3cMApV5cB4J6Us
 0pXGZZEvU9lEhuiX3a20P2gAvn7fnGLGxGnacvHO5HYk9robteHL+DpG+qVOd62YFquU
 t8tXNtrE0dgJo446LPUiF/fXLgMVJmVs0o9ASSxlUNZBJZL+/fjB3Uz69dpZYazUrG90
 yKsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693793096; x=1694397896;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D1nAMmRQCWVsoeyuEdqi5PFFET6oxn1mJnH5bH17bkA=;
 b=JewNmPAInzBiv72/MbpyO9S20FZB+B0rgagRJj7IM2e36JW8UeOuUG+oryUr5iGfAI
 hyxrGfMTzowJip7aHP/hM8e3vJdc6jOjHqNVU32bEqxDcq7y6ZbuTdFaIa9F+pAapbVg
 P+EYvWLDzAD2yyhlRjkj7VUHYc7TW032dpK2iaVYQNiaJjBoHrDywiE9L35kHrgqkImz
 vFLPvZ+CINwyvcKKCRSc9K4C4ubx7MhpiKDX+ucFS6oyWWVI0M7/GmYvcH5s5H+Vb1aY
 5/AuOngO6vv75+DEC0QxBsRLM6jMrGpA1jBuedcmMpgzNyAlTWp1HNsEwRJZsxJS82Xi
 l5eg==
X-Gm-Message-State: AOJu0YzmxtjYW82KFUdNv+ebut4Zktn2MIFrbSaF0Wd3NTuhMtMlB4VO
 zim9hscTUj6NbIjEgikOdn7zHA==
X-Google-Smtp-Source: AGHT+IEz5VP4VAQtWkB9LUVf53ub9h4E1B6a1uLgeIkljMWf2NqCyovPBlaN3j3OvIlRlVZP+98fDA==
X-Received: by 2002:a2e:8515:0:b0:2bc:e808:e735 with SMTP id
 j21-20020a2e8515000000b002bce808e735mr5731279lji.21.1693793095254; 
 Sun, 03 Sep 2023 19:04:55 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a2e9c4d000000b002bce0e9385asm1818237ljj.9.2023.09.03.19.04.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 19:04:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v3 0/8] drm/msm/dpu: move INTF tearing checks to
 dpu_encoder_phys_cmd_ini
Date: Mon,  4 Sep 2023 05:04:46 +0300
Message-Id: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
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

rop two feature flags, DPU_INTF_TE and DPU_PINGPONG_TE, in favour of
performing the MDSS revision checks instead.

Changes since v2:
- Added guarding checks for hw_intf and hw_pp in debug print (Marijn)
- Removed extra empty lines (Marijn)

Changes since v1:
- Added missing patch
- Reworked commit messages (following suggestions by Marijn)
- Changed code to check for major & INTF type rather than checking for
  intr presence in catalog. Added WARN_ON()s instead. (Marijn)
- Added severall comments & TODO item.

Dmitry Baryshkov (8):
  drm/msm/dpu: inline _setup_pingpong_ops()
  drm/msm/dpu: enable PINGPONG TE operations only when supported by HW
  drm/msm/dpu: drop the DPU_PINGPONG_TE flag
  drm/msm/dpu: inline _setup_intf_ops()
  drm/msm/dpu: enable INTF TE operations only when supported by HW
  drm/msm/dpu: drop DPU_INTF_TE feature flag
  drm/msm/dpu: drop useless check from
    dpu_encoder_phys_cmd_te_rd_ptr_irq()
  drm/msm/dpu: move INTF tearing checks to dpu_encoder_phys_cmd_init

 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 52 +++++++++----------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  3 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  6 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   | 51 +++++++++---------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   | 41 +++++++--------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h   |  3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  2 +-
 7 files changed, 75 insertions(+), 83 deletions(-)

-- 
2.39.2

