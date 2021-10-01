Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFACA41F41D
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 19:59:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BEBAA6EEA9;
	Fri,  1 Oct 2021 17:59:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x331.google.com (mail-ot1-x331.google.com
 [IPv6:2607:f8b0:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EB826EEAE
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 17:59:12 +0000 (UTC)
Received: by mail-ot1-x331.google.com with SMTP id
 l16-20020a9d6a90000000b0053b71f7dc83so12512322otq.7
 for <dri-devel@lists.freedesktop.org>; Fri, 01 Oct 2021 10:59:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tOEpp8U8xX+6/NOjtA3o9vPVh0Gxvu3XnufRMdc17ts=;
 b=VpKDdIERxN8vo/ULToynZ+l8fN3RR2TnS8NX7KSsSFiRalxivhNx+68K+vjjmJQ2vf
 aQgEaDQkWCe10d2uljIBR9dbopWyR6lTNRkh6gm82qm/vFoXqdtD1JKefZhVM94h+xFz
 CWl7PRS9+e2WpM/wb6zFQowu8Txsz+w7eFF4SLpVJ1SdGwVo/n2ZuRnjJySEjoQ+oMXW
 5p4zsSpDuNMKO83ipGowzGBsIvl87Z0YKpH1lzZb5sBDuxZG9W3yCvCAq6Wp1Q3UfeAr
 TKOqxs5A2x4pbBUEMlSCBfjoQIrjfhaWsSAo9jVD3lAOKHfH7bwUP9DkOvjYIZ4ig2sS
 f/sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=tOEpp8U8xX+6/NOjtA3o9vPVh0Gxvu3XnufRMdc17ts=;
 b=kKuMrLOIzr+zhZA240pLLDSmHYH6G/Pd6ih+emB0vxb/V6Qzz4X8/BSsPw7nMcYqJY
 QHcKKh/pwGyrrZyQkYq/LvthWgsmdAMgckgYrke0gfeadqJIlV/su/SKnfFpdB6aP82s
 ZpHFMXR94hfIO/UXVIB2ZG5tYT32FEytTft5K73JW0pe1p4FVRjuA7ayOqIpTS6bskEZ
 MtCOkmz/KHSQg138uBh47ZxX9TYNdjw5k1zqPs/Zlurtn0xAqfL8sI0tDSd46iX7YBlC
 0A1s/F4jpprwD9JU/pnHSfqj+ZVcm2W8jcH51pxBKdYZyV/XgtT6JnX6kXYGyHHuM/Fg
 1Yhw==
X-Gm-Message-State: AOAM533zdnOYVvnoZHZvicKVjknZQXPGnX6+msKjvz4LxjaQUqbYBSWP
 O/XD4DckoJ0yCt5ePAYaaxgLbg==
X-Google-Smtp-Source: ABdhPJy0f4QtOVsANWtDyoi86zc179vzJoaTYKeyXJEeqhBvho5HZ2MJ/DCOIFhb/oT9MOrv7y/LVw==
X-Received: by 2002:a9d:19c1:: with SMTP id k59mr11580550otk.348.1633111151822; 
 Fri, 01 Oct 2021 10:59:11 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 w2sm1284798oof.23.2021.10.01.10.59.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:59:11 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/5] drm/msm/dp: Support multiple DP instances and add
 sc8180x
Date: Fri,  1 Oct 2021 11:00:53 -0700
Message-Id: <20211001180058.1021913-1-bjorn.andersson@linaro.org>
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

The current implementation supports a single DP instance and the DPU code will
only match it against INTF_DP instance 0. These patches extends this to allow
multiple DP instances and support for matching against DP instances beyond 0.

With that in place add SC8180x DP and eDP controllers.

Bjorn Andersson (5):
  drm/msm/dp: Remove global g_dp_display variable
  drm/msm/dp: Modify prototype of encoder based API
  drm/msm/dp: Support up to 3 DP controllers
  dt-bindings: msm/dp: Add SC8180x compatibles
  drm/msm/dp: Add sc8180x DP controllers

 .../bindings/display/msm/dp-controller.yaml   |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  23 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  66 +++++----
 .../gpu/drm/msm/disp/msm_disp_snapshot_util.c |   8 +-
 drivers/gpu/drm/msm/dp/dp_display.c           | 131 +++++++++---------
 drivers/gpu/drm/msm/msm_drv.h                 |   4 +-
 6 files changed, 132 insertions(+), 102 deletions(-)

-- 
2.29.2

