Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 148C94CCC29
	for <lists+dri-devel@lfdr.de>; Fri,  4 Mar 2022 04:21:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A920210E430;
	Fri,  4 Mar 2022 03:21:11 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4EB710E430
 for <dri-devel@lists.freedesktop.org>; Fri,  4 Mar 2022 03:21:10 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id v28so9313072ljv.9
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Mar 2022 19:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VOWV7C6h8OK7d5WgsEprucgKoMSzgsCgN5s8IESXVy0=;
 b=dUBwxc7/qrZsXjGcIjSV4S49rKng1t/itdAaLrWnEkANrcLTCzTXry71ldoWGlkT+t
 sjn3aJmtZHKhXiErzYtK5zE7UsS/GrTdW4FwO+lnp2/6twzyCNQWdfb0jPEjoLPa+Uwy
 pAundMC9RJ9vW5LUbKBlLiXSaoe7Q2cNEz8HJv4aLPuWes517V9YsbvqpIRTyd+xBx5/
 jehupD8RwYHrXuCb4dBov+8oW6lL7I3EbyyqWkOVZFbh4zZILkvhFy/wIrMkTzUuKaDQ
 oK8W98B3Hj3SyxJWOzbiL/LS1z5xjTXM5YY3cCb9mWM6xKPPkH/Lswpje+xBQe5esYHH
 jZcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=VOWV7C6h8OK7d5WgsEprucgKoMSzgsCgN5s8IESXVy0=;
 b=cJK6z7IzpFU6WaqLStsfTI4xJ45tSjtvKjC22JHzN71sTv+1Ti2tFkBPRBdGxorCkv
 uOEeb1sG1+8yE46wy74ZZGW3uwie7LcqyzFrRO/QghVEokmlDs8hzstOhsggoqJ3Dl4k
 VSIjHqxjxZsawHBUqIXkNcmuE3w5iDEMWgOuJvn0o32cOuxFT9RMPupo+cUhSM8dmYR/
 2SVVpQPdpdV4aRu04qShzHScFPXKOlkPH05IxBpkXqCqGAJqOXvBfXO/vUL/toIaXmhp
 Jc/NQ/5DRozC0/VSxXj/Nb7tFM15CH1j0KaGW6ew1rn7Bcoaf/GApRDRjURbloKpuqUT
 j/8Q==
X-Gm-Message-State: AOAM5328dw1VpE94Ftfam591bmviAL4t9kXaNZ3PZdRpfwx2KmYN4lRq
 nEKnHXPB0XJ2H6gxIjbzm8v69w==
X-Google-Smtp-Source: ABdhPJxDzpboT908tsOfBQcz56xSS2l1xy1LG3Y8QEagg0n5ntQ8oQXnUUxZh3kLkXu1iqQqKtsjXA==
X-Received: by 2002:a2e:9c82:0:b0:23a:eea8:cd0f with SMTP id
 x2-20020a2e9c82000000b0023aeea8cd0fmr25580665lji.218.1646364068868; 
 Thu, 03 Mar 2022 19:21:08 -0800 (PST)
Received: from eriador.lan ([2001:470:dd84:abc0::8a5])
 by smtp.gmail.com with ESMTPSA id
 w24-20020ac254b8000000b00445b7d115efsm772079lfk.301.2022.03.03.19.21.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 19:21:08 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v3 0/5] drm/msm: rework MDSS drivers
Date: Fri,  4 Mar 2022 06:21:01 +0300
Message-Id: <20220304032106.2866043-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These patches coninue work started by AngeloGioacchino Del Regno in the
previous cycle by further decoupling and dissecting MDSS and MDP drivers
probe/binding paths.

This removes code duplication between MDP5 and DPU1 MDSS drivers, by
merging them and moving to the top level.

This patchset depends on the patches 1 and 2 from [1]

Changes since v2:
 - Rebased on top of current msm/msm-next(-staging)
 - Allow disabling MDP4/MDP5/DPU/HDMI components (like we do for DP and
   DSI)
 - Made mdp5_mdss_parse_clock() static
 - Changed mdp5 to is_mdp5 argument in several functions
 - Dropped boolean device data from the mdss driver
 - Reworked error handling in msm_pdev_probe()
 - Removed unused header inclusion
 - Dropped __init/__exit from function prototypes

Changes since v1:
 - Rebased on top of [2] and [1]

[1] https://patchwork.freedesktop.org/series/99066/
[2] https://patchwork.freedesktop.org/series/98521/

Dmitry Baryshkov (5):
  drm/msm: unify MDSS drivers
  drm/msm: remove extra indirection for msm_mdss
  drm/msm: split the main platform driver
  drm/msm: stop using device's match data pointer
  drm/msm: allow runtime selection of driver components

 drivers/gpu/drm/msm/Kconfig               |  50 ++-
 drivers/gpu/drm/msm/Makefile              |  19 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c   |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c  | 260 -------------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c  |  68 +++-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c  |  11 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c | 252 -------------
 drivers/gpu/drm/msm/msm_drv.c             | 263 +++----------
 drivers/gpu/drm/msm/msm_drv.h             |  57 ++-
 drivers/gpu/drm/msm/msm_kms.h             |  18 -
 drivers/gpu/drm/msm/msm_mdss.c            | 429 ++++++++++++++++++++++
 11 files changed, 667 insertions(+), 770 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
 delete mode 100644 drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c
 create mode 100644 drivers/gpu/drm/msm/msm_mdss.c


base-commit: 8ddb80c5fcf455fe38156636126a83eadacfb743
-- 
2.34.1

