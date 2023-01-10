Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E38A066497F
	for <lists+dri-devel@lfdr.de>; Tue, 10 Jan 2023 19:22:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7BD010E153;
	Tue, 10 Jan 2023 18:22:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5018A10E145;
 Tue, 10 Jan 2023 18:22:05 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id q9so8826180pgq.5;
 Tue, 10 Jan 2023 10:22:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ogmFOZWIzMj+3duLrX2EZxxcGOpiQSLfwLDfrMyX4OM=;
 b=iTBfyH3WDaC7OnWboyWtpdRAh2d4mpfK+qixKoD9Q0ueYMxJIRO2z6FJCJhJl+tyKb
 FXzKhD87IMvMRgbJlA3TPk7VHbUW+NH+kFN6Uzjy2dXkUTtyVUkjGdjGBkbZIELB6Xq9
 yanOd9AyVREOZyuM1AlouGJO6wdflEYt5lHTemDontXABXAK2fp/pEzB1FyTZizl/Yy4
 GxO/FX3h9RQTiKwW0hfNkyT4aFyDj41XGvYoGKmuV9liaoyvM6x5+xNwY/Khd/XUtWjy
 gWExAJSr3G3rJGMGIs9E3mhcVvY7yDIJNKSGySbH5d7XhZodjW5E8hAJQjXjePueeMyw
 aCNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ogmFOZWIzMj+3duLrX2EZxxcGOpiQSLfwLDfrMyX4OM=;
 b=XdEVgCFjqzrAYrmgl9Tvuj01M2Iy/fDZo/KIxXH8JQSdATpVAP/8Zcqw+o1Awf5Zml
 Mw1bV1uhWLbjMjLGm3mNpKh4ZYalblm4fBWJSlgeIdH02tycgCHK48t01ePJQar4FPYI
 cdUvo96Q25Z/roKvdioMGy8dKevWROJrdu4cPy7/hYWuyNA3AlwC2MqYO2y6PfyPwZQY
 xFrdsVJNybot00WmpYttN4GkzLNQp7Q2Gmm6VVCGJ0k5wzJGtF+Jp/6JqzMARAO8UcIn
 G/UUt01BiAQk2xzBCkfhrGrOGpbu1GkmmWjlwuGeMDVB7uEqPxpboBBXQTvH+llZVKw/
 bZHw==
X-Gm-Message-State: AFqh2kp09oGf10/zdmHQij5ybRHWtVV2AGV7WVcfY21uOdSlKxWc94iS
 mOfaZgB0SnVle5fHtWYciN2cVl5m+Mc=
X-Google-Smtp-Source: AMrXdXtQ5GUYXPLIFkdMD5Z6fjHsPDPbiLd3VACxOqDo5SU3z6yDVttD03dV+GYCTOyCEd7P0t0WUQ==
X-Received: by 2002:a05:6a00:c5:b0:582:6173:c6c5 with SMTP id
 e5-20020a056a0000c500b005826173c6c5mr36566828pfj.14.1673374924464; 
 Tue, 10 Jan 2023 10:22:04 -0800 (PST)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 a28-20020aa78e9c000000b005774f19b41csm8369815pfr.88.2023.01.10.10.22.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Jan 2023 10:22:04 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] drm/msm/gpu: Devfreq fixes+tuning
Date: Tue, 10 Jan 2023 10:21:44 -0800
Message-Id: <20230110182150.1911031-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.38.1
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
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Rob Clark (3):
  drm/msm/gpu: Add devfreq tuning debugfs
  drm/msm/gpu: Bypass PM QoS constraint for idle clamp
  drm/msm/gpu: Add default devfreq thresholds

 drivers/gpu/drm/msm/adreno/a6xx_gpu.c |   2 +-
 drivers/gpu/drm/msm/msm_debugfs.c     |  12 +++
 drivers/gpu/drm/msm/msm_drv.h         |   9 ++
 drivers/gpu/drm/msm/msm_gpu.h         |  15 ++-
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 148 ++++++++++++--------------
 5 files changed, 99 insertions(+), 87 deletions(-)

-- 
2.38.1

