Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6898F61550E
	for <lists+dri-devel@lfdr.de>; Tue,  1 Nov 2022 23:33:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DA5410E42F;
	Tue,  1 Nov 2022 22:33:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0B6C10E42F;
 Tue,  1 Nov 2022 22:33:45 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 u8-20020a17090a5e4800b002106dcdd4a0so400170pji.1; 
 Tue, 01 Nov 2022 15:33:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jGENntLfOCR8ozrjU0gP3ahdz7LS9qRpY/T4IjONjfE=;
 b=ePNbBYmMrBWf14035Ml6F9See1fo11rsu5nojA/frdjk6+kB6ylOkz0WOOtInV2YUw
 k8uE+nlZiPdngARdYCJel4lYD1k+mFF16JBtSIQVlx4ueuc9jPQ32mrSme0y5RRIAxod
 MiZF7abfG/tVvGmF/f338+N2d2SQvzMqQsOtLT6bAAh9v4qcDeOrI5nHi4RkFEGcnWKz
 cf0KCti865++nvT9QL0QhYqqUQttK8NWlxZt0PRJC/ojNhtqDzjxIgR57Q4C+uSGJ4HE
 Z/Di7T9DiUE/eVPhAiyZ/rzyTvj7RlWXaXA06Lpsa3Ko91F2mXRuVPUD3ux/O7VKooUi
 VOBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jGENntLfOCR8ozrjU0gP3ahdz7LS9qRpY/T4IjONjfE=;
 b=Rjwcn+aAoyctpqPqh6a7djvrkLi/RJqrAxoTzWCydMuBIjjOPA9oWSoY6FE8KUvOme
 sH5orZLJc0ii4eOiQrHoVvei4qAUE1Wxn8lT/e8ZXpnC2lZvd1c1y2Ekyq2Z9EptvRSL
 mCipdpR6MLJl9ZUhzfp3uoHy2il68Ht8SBR1sRnnR6VetkCVby5az4PzhXhnbGKIBcKA
 HPim3Hjaq6nRPpU1Yo3P/eeArv/7kfjgCAPOIs6FX3hXaeSTSJk71U9q6biWm91q4seI
 pbpt6tZ5wPQjD2zZf+85zBilr8zF6qkhBaKYfhPARDupATd1VtXIexyR/OwfbTPN+QbK
 t3oQ==
X-Gm-Message-State: ACrzQf3fj2i0UkZKel5DysFvV+07en/24msiI/xTHOtUm6b5BXnMSpf5
 v+C82sYpTf/8XQySeGvCWODkAWGp6yw=
X-Google-Smtp-Source: AMsMyM7RCutusfpBemA0YCYWXd5vhzuK8RyIImMWAWCB3UJilDp/SJYM0ty/SZsO8O7AN1t1HSfQkA==
X-Received: by 2002:a17:902:e8c4:b0:186:6d63:7e with SMTP id
 v4-20020a170902e8c400b001866d63007emr22106758plg.122.1667342025099; 
 Tue, 01 Nov 2022 15:33:45 -0700 (PDT)
Received: from localhost ([2a00:79e1:abd:4a00:2703:3c72:eb1a:cffd])
 by smtp.gmail.com with ESMTPSA id
 j4-20020a170902c3c400b001754064ac31sm6821074plj.280.2022.11.01.15.33.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Nov 2022 15:33:44 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/2] drm/msm: Improved hang detection
Date: Tue,  1 Nov 2022 15:33:08 -0700
Message-Id: <20221101223319.165493-1-robdclark@gmail.com>
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
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Try to detect when submit jobs are making forward progress and give them
a bit more time.

Rob Clark (2):
  drm/msm/adreno: Simplify read64/write64 helpers
  drm/msm: Hangcheck progress detection

 drivers/gpu/drm/msm/adreno/a4xx_gpu.c       |  3 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c       | 43 +++++++++------
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c   |  4 +-
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c       | 58 +++++++++++++++------
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c |  3 +-
 drivers/gpu/drm/msm/msm_drv.h               |  8 ++-
 drivers/gpu/drm/msm/msm_gpu.c               | 20 ++++++-
 drivers/gpu/drm/msm/msm_gpu.h               | 17 +++---
 drivers/gpu/drm/msm/msm_ringbuffer.h        | 24 +++++++++
 9 files changed, 131 insertions(+), 49 deletions(-)

-- 
2.38.1

