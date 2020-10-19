Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4793B293038
	for <lists+dri-devel@lfdr.de>; Mon, 19 Oct 2020 23:09:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 74ECD6EAB2;
	Mon, 19 Oct 2020 21:09:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com
 [IPv6:2607:f8b0:4864:20::1041])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 976456EAB0;
 Mon, 19 Oct 2020 21:09:32 +0000 (UTC)
Received: by mail-pj1-x1041.google.com with SMTP id p3so458981pjd.0;
 Mon, 19 Oct 2020 14:09:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5YrNKJ5OY6r1EDWREJJiTgfyOgLrR9oDoJHGUldK/KM=;
 b=sk1vZAZt6nDJGI3DN3CsUkDQqQewUoz6UX8weV2SBLNaljJS6JGOjgrTRmCB9+pRc1
 tAfxb4KVqB6XKsnRAtJ2pJMdfwYe7SDlrGabiMyLVme7rNNsBXgHkxYtTvoa6pFhx7+T
 YaqYgvnatV1kLkpCMXyy/KwWCJ0mKhTsy1zFHWXkoXcOJvUorwVCYjNoKc0v/u/9+f/D
 gLM4xrEV9TQCpD+YJ/1Yiw68F2P50wvRAXeh+IIvqLlJ8pPjmDqWE7Co5T+bojzrUT3A
 pZN6upIMy1lmoMjm7FFJ2CO02CHQkXQG/bhLk6kfOmoUCsDLju9fkc0rXYYVz+nhB/fz
 ecqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5YrNKJ5OY6r1EDWREJJiTgfyOgLrR9oDoJHGUldK/KM=;
 b=MvOc7u9BjFKmovhPbswUXrbOO0/SKVZf9DBf4HMWJzijbwejwGhUWpXOe+GlExYfzL
 AZd4aNRR9B7gUtwG/Vln77tv4LMipr/mRR2/PnhjVcR9yRDWoBdY4ltmJ/4ptmPF64Vm
 Jeph8pvtR8UqmNTYpTiDhIUMtBmt5VGEBja/UERDc7n+f8cDLCmvSX8uRcRz4a/S9jjr
 laE3GsXzycqkHRWhmBmiypR/kCcHP7UgEWT4nfI4Z1F/o6meO/tek5z8yT9WOW16qD5O
 N/joRKO2SbgIPviBZY+shTclvOp9pWkPZFCY+LS38NoDWeoWwqOJDFYyucJ0ESiSSLlk
 wP4Q==
X-Gm-Message-State: AOAM5328h+9xgM/mZilrMkcWFfrhhg8lQV7Ez8U/y3xamDYkP7UXYQ6b
 9gVKCDORGqzwsftQ611zgz22kOC55U8KFomJ
X-Google-Smtp-Source: ABdhPJw6ZFvgJemAeXDfkdT7lTJg210w4NPRNngz9bDCEpAh6Hlfhey2JHH001X+x6eJZMUkM0IyPQ==
X-Received: by 2002:a17:902:c313:b029:d4:b6ac:7b5d with SMTP id
 k19-20020a170902c313b02900d4b6ac7b5dmr1778668plx.63.1603141771529; 
 Mon, 19 Oct 2020 14:09:31 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 i1sm330102pjh.52.2020.10.19.14.09.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Oct 2020 14:09:30 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/3] drm/msm: kthread_worker conversion
Date: Mon, 19 Oct 2020 14:10:50 -0700
Message-Id: <20201019211101.143327-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
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
Cc: Akhil P Oommen <akhilpo@codeaurora.org>,
 Tanmay Shah <tanmay@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 AngeloGioacchino Del Regno <kholk11@gmail.com>,
 Sam Ravnborg <sam@ravnborg.org>, Emil Velikov <emil.velikov@collabora.com>,
 Rob Clark <robdclark@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 Qinglang Miao <miaoqinglang@huawei.com>, Roy Spliet <nouveau@spliet.org>,
 Wambui Karuga <wambui.karugax@gmail.com>, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>, Rajendra Nayak <rnayak@codeaurora.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 open list <linux-kernel@vger.kernel.org>, tongtiangen <tongtiangen@huawei.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Drew Davenport <ddavenport@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

In particular, converting the async atomic commit (for cursor updates,
etc) to SCHED_FIFO kthread_worker helps with some cases where we
wouldn't manage to flush the updates within the 1ms-before-vblank
deadline resulting in fps drops when there is cursor movement.

Rob Clark (3):
  drm/msm/gpu: Convert retire/recover work to kthread_worker
  drm/msm/kms: Update msm_kms_init/destroy
  drm/msm/atomic: Convert to per-CRTC kthread_work

 drivers/gpu/drm/msm/adreno/a5xx_gpu.c     |  3 +--
 drivers/gpu/drm/msm/adreno/a5xx_preempt.c |  6 ++---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c     |  4 +--
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c     |  4 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c   |  8 +++++-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c  |  8 +++++-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c  | 11 ++++++---
 drivers/gpu/drm/msm/disp/mdp_kms.h        |  9 +++++--
 drivers/gpu/drm/msm/msm_atomic.c          | 25 +++++++++++++++----
 drivers/gpu/drm/msm/msm_drv.h             |  3 ++-
 drivers/gpu/drm/msm/msm_gpu.c             | 30 +++++++++++++++--------
 drivers/gpu/drm/msm/msm_gpu.h             | 13 +++++++---
 drivers/gpu/drm/msm/msm_kms.h             | 23 ++++++++++++++---
 13 files changed, 104 insertions(+), 43 deletions(-)

-- 
2.26.2

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
