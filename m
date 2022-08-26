Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F16C15A24A3
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 11:39:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0248E10E7E3;
	Fri, 26 Aug 2022 09:39:36 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6A7E10E7E2
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 09:39:30 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id x10so1052933ljq.4
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 02:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc;
 bh=VeJT6TambDYpE2R29D5H9btEkRqd26ppCcO4LObDeKk=;
 b=PqHJaHohZYwsm/CV439/jAsas87s0RNPbSrywTlt2XGjyomH/MTwJqOrsWzSFFQMTQ
 vaZmlQdxuPI7z3gmHCq3pbqaXk6Z2esxQhDPy7ETKu0O/Yo3My7k8JfAflQ//2hHenTy
 XMtzeSsgDdsn4VXR22zoazGO7Zy0hT52NHsfzgG8JV0MR3LQSdbJBqpZ8wj+uzxx542r
 ppMVtgIVH0sCPyzk4PHyrtgBBrX29Ap8PyM6QWxRclJYeBVU8t4sIm7sRDHi4e2X1JCb
 cM7ZY8VirzSqE6h9GyPWmR8mvCOVsyRu3Qr1Gae+I95bVyGN5kidODIYsmXxU0Fi0y3u
 bmoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc;
 bh=VeJT6TambDYpE2R29D5H9btEkRqd26ppCcO4LObDeKk=;
 b=FYJ56+6wEM0SFpCWJWFrXhMGSkkyZNBaNFcYU0KiCOiAACvIbj5iiQFEDtxDUlszVu
 wC5ee7irPLB+MssuEWWmtOF3VxOeO4OD/A/WxXSrFM4qj3LFuz24E/MZT+I414RPDd7p
 pUS/LhvcYoD0F9FJgEAhz68eYldSHgXzbvshfOThDTjKu2nux8X02ewHmM/ShQZuUN9G
 7DE6P2TD1pAZUGeA3PWj4QTV4KwZcSG7g8jkD1amxXMHWZjevULUPkexjNbNd74+kDCb
 DtaISiQYKiVzukoGNyJ6OHAUDbeQFLq/proAoPtLUVLVTa8ALdEwOqXPwJ5gbb/rOm51
 3KBg==
X-Gm-Message-State: ACgBeo2hX3SQiJ0C71Fthr9H9p7FckrVPQtfi4vUODf+qpwW4Z5fU1s4
 iLR7vTTDE9r7H7zhuRj4BlJRig==
X-Google-Smtp-Source: AA6agR6PiH5e9EgjVJ3S1NHkzUw9Zid8iMhCu5LWfb+2bIn5w5XIKzzL7wkJNzmFuI8/wm+2YKr8gw==
X-Received: by 2002:a2e:8443:0:b0:25e:21ef:952d with SMTP id
 u3-20020a2e8443000000b0025e21ef952dmr2213447ljh.403.1661506769254; 
 Fri, 26 Aug 2022 02:39:29 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 m6-20020a195206000000b004886508ca5csm329055lfb.68.2022.08.26.02.39.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 02:39:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Subject: [PATCH v2 0/5] drm/msm/hdmi: move resource allocation to probe
 function
Date: Fri, 26 Aug 2022 12:39:22 +0300
Message-Id: <20220826093927.851597-1-dmitry.baryshkov@linaro.org>
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
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

As pointed several times in the discussions, start moving resource
allocation from component bind to the probe function. This simplifies
boot process, as the component will not be registered until all
resources (clocks, regulators, IRQ, etc.) are not registered.

Changes since v1:
 - Moved a call to msm_hdmi_get_phy() to msm_hdmi_dev_probe() too.

Dmitry Baryshkov (5):
  drm/msm/hdmi: use devres helper for runtime PM management
  drm/msm/hdmi: drop constant resource names from platform config
  drm/msm/hdmi: move resource allocation to probe function
  drm/msm/hdmi: don't take extra reference on PHY device
  drm/msm/hdmi: move msm_hdmi_get_phy() to msm_hdmi_dev_probe()

 drivers/gpu/drm/msm/hdmi/hdmi.c | 348 +++++++++++++++-----------------
 drivers/gpu/drm/msm/hdmi/hdmi.h |   3 -
 2 files changed, 161 insertions(+), 190 deletions(-)

-- 
2.35.1

