Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A42496702
	for <lists+dri-devel@lfdr.de>; Fri, 21 Jan 2022 22:06:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35F4410E647;
	Fri, 21 Jan 2022 21:06:22 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDC3410E69A
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 21:06:21 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id m3so36592046lfu.0
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Jan 2022 13:06:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0vJ8DhwvnCQdnTeYuE3CkWRZJOO1ip2uJNFoaTJPamw=;
 b=rtY6myzx7rzb+2+xk/btRkYOxuVjnX/xNvgZHq4099bqiiGiiF3worWSzctzRLrHSh
 xan4nUgoHFhnpKtmeqC/5lPJNPFdrDJVAL0gW182Ccy7xGvaA33xIg2xrRTzA7Gzxyy8
 3x/eJODRgjvZpcP0AeqzmFw56uouUWtxeR93sxLLleYHds4pyWjgyT9ruygbdOPcIC25
 iizrN3zHKw77Sr/Cb64at+NdiW2U0A6GgN+qFXSKgR1rBlUg4qRe/EVdzOCULABzX3Si
 iYhHoJHrVjyGwdHQbOAT7oONNM29pY+Prncp9mIQDJGHYPZh8oIsfPf3hANiUZC3UUeS
 0D0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=0vJ8DhwvnCQdnTeYuE3CkWRZJOO1ip2uJNFoaTJPamw=;
 b=gmdXpoBXc/nxilOmBd0vSfb68FIfWF2XWCFVZafAiyQOizv9H1XaGjUUnsrcXBjMYG
 CLY+QvbdGLjoUxV5crvvSHsr1fHUIoptK06ZCpgdeqkmfhqWiFrDxs5wg2Vv40/KNR+u
 vI3NRib4sVb9gYg5WxwP0AWCaBSIhtyhrgFyUF6odJQTWio8pcIRIwCcSV+T7rY/rvKZ
 jfiSdRjlpH2KjmFQ05YMijePZr5QrgyQ3RtgwJTRbN6VKPq34o1EghFlw3r20m37alHX
 58adVh+O0+9T/Z0Lzk66QZTA69LBV3HDQrrU6C03rhwQeYUs7MEO0Qi9ru+xDCNJONPJ
 B8eA==
X-Gm-Message-State: AOAM5310kl2xmgL7KmO+cqKXPHu2U9Nat2tDEZly5A4MdYJyQ2lGvjhL
 HaXxPmbFtaFwpYNEG125t3ywPw==
X-Google-Smtp-Source: ABdhPJx49jz1SijSo8MyJjMx8hgsEJ6kEQlaDTIQslCRxiPxXAZdmi0yppHMtgeEBo8iwtFlG2h8zw==
X-Received: by 2002:a05:6512:c2a:: with SMTP id
 z42mr4974720lfu.329.1642799180056; 
 Fri, 21 Jan 2022 13:06:20 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id v10sm279125ljk.44.2022.01.21.13.06.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Jan 2022 13:06:19 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v5 0/6] drm/msm/dpu: simplify RM code
Date: Sat, 22 Jan 2022 00:06:12 +0300
Message-Id: <20220121210618.3482550-1-dmitry.baryshkov@linaro.org>
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

INTF blocks are not really handled by resource manager, they are
assigned at dpu_encoder_setup_display using dpu_encoder_get_intf().
Then this allocation is passed to RM and then returned to then
dpu_encoder. So allocate them outside of RM and use them directly.

While we are at it, drop the lm_max_width from the RM and simplify VBIF
handling (move creation/destruction to the RM too). Once this and SSPP
handling patches are merged, the RM would handle lifetime of all
dpu_hw_* objects.

Changes since v4:
 - Changes IS_ERR_OR_NULL() to IS_ERR() in dpu_rm_init()
 - Removed if(!null) conditions when calling dpu_hw_intf_destroy() and
   dpu_hw_vbif_destroy()

Changes since v3:
 - Add missing DSPP blocks teardown
 - Remove dpu_hw_blk from dpu_hw_intf
 - move dpu_hw_vbif creation/destruction to the RM

Changes since v2:
 - Dropped DSPP, PP and MERGE_3D patches for now.

Changes since v1:
 - Split into separate patch series to ease review.

Dmitry Baryshkov (6):
  drm/msm/dpu: drop unused lm_max_width from RM
  drm/msm/dpu: add DSPP blocks teardown
  drm/msm/dpu: get INTF blocks directly rather than through RM
  drm/msm/dpu: stop embedding dpu_hw_blk into dpu_hw_intf
  drm/msm/dpu: fix error handling in dpu_rm_init
  drm/msm/dpu: move VBIF blocks handling to dpu_rm

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  36 +----
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h   |  16 ---
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |   5 -
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |   8 --
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |   8 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h   |  11 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.h   |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  28 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |   2 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        | 126 +++++-------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |  31 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c      |  26 +---
 12 files changed, 73 insertions(+), 225 deletions(-)

-- 
2.34.1

