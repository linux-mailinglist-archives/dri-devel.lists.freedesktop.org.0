Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9CA444B25A
	for <lists+dri-devel@lfdr.de>; Tue,  9 Nov 2021 19:06:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E793589356;
	Tue,  9 Nov 2021 18:06:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9501F892FD;
 Tue,  9 Nov 2021 18:06:15 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id x64so78874pfd.6;
 Tue, 09 Nov 2021 10:06:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ubdL9EpbHiKFQ/ensyE1OL+6p1VDVmYl0vsSWhTLLJk=;
 b=p0ckCqL5xUa6CraKVoJJL+4JKcqnSmBpaWTXjRixdPhVKx6qzuiACq/eCbiDn3lsr3
 26gEdWkJSy5ZqrXASLm1kLFml3T+JPOHpwKB8R0RfLop8VB8maMH6CEL4s8r65MPhuN0
 G1g7Er+zfMvrqQf+A5TwR2ZtIXXJkbftDCIj0KzDrCi/rFWfg8M0jCrnMjbJEywFWMs2
 UjeTzC0wXz/Fj25sCD8etz2PE9CZTv98c62p4C1+g6GIJbZtaZ8pw5QxjRhB0yYIZVZ1
 /dMFwnmKBbSVXPbcyFiCLYlRYiwXJr+IzfdrtayotabGJE/oRJlF2ST2tYg19v4lQjc4
 Umyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ubdL9EpbHiKFQ/ensyE1OL+6p1VDVmYl0vsSWhTLLJk=;
 b=3MCrn7o2ISbbJ4UNW3Y/cifS2dZslDXqazbIq5hycBmEZNzeDpfCHHPqsCxONspU8g
 8MQx4Fm8OnMHtJ1x6BwlZqL6jp3hn3kI7OOM1RbBaDJkF13wBCKbpLsSnf44TiJ/hb5B
 3FxVz/+SciRDFSG0uDltQM6N7M/u4JeMkyg7OmEaA/f4VrAXRaqtdmb7uJ51hp2fng4r
 yik+L1u/suCCe8Z8nMspwUxgS1XNv2p9lvbVLSnIH7ovUZ/BrmFGyoGxolaZL3bvHI2I
 5hS8zf5V+IhYwQw6H+08IxUfbcQq3DYnckuLLEHaSpeAz3+N+gETxppqMGbtg0U85VJM
 9jSA==
X-Gm-Message-State: AOAM531lHopZxAPZ1ToEXjDX362BGhBFX1Z0VtmqbBSYB4wm8IF+jtHk
 na7NP3U6n9VfePynViZlWDtUwYjXgIQ=
X-Google-Smtp-Source: ABdhPJwLLPUvZmt5B7b+jswBMoOvniAjaKjIuCbEPUB+zZaNWf1gYTzeEKAmYtyUolGk6qUxom2XIA==
X-Received: by 2002:a05:6a00:887:b0:474:1f41:2293 with SMTP id
 q7-20020a056a00088700b004741f412293mr9936007pfj.44.1636481174453; 
 Tue, 09 Nov 2021 10:06:14 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 c25sm19259837pfn.159.2021.11.09.10.06.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 10:06:13 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/5] drm/msm: Cleanup and drm/sched tdr prep
Date: Tue,  9 Nov 2021 10:11:00 -0800
Message-Id: <20211109181117.591148-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
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
 Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>,
 open list <linux-kernel@vger.kernel.org>,
 Deepak R Varma <mh12gx2825@gmail.com>, Jonathan Marek <jonathan@marek.ca>,
 Yangtao Li <tiny.windzz@gmail.com>, linux-arm-msm@vger.kernel.org,
 Sharat Masetty <smasetty@codeaurora.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Eric Anholt <eric@anholt.net>,
 Iskren Chernev <iskren.chernev@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Dan Carpenter <dan.carpenter@oracle.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

This started out as conversion to using drm/sched to handle job timeout,
recovery, and retire (and delete a bunch of code), but the latter part
is on hold until drm/sched is fixed to properly handle job retire/
cleanup before deciding which job triggered the fault/timeout[1].  But
the rest is worthwhile cleanup, and the last patch is needed for an igt
test that I'm working on to exercise timeout/fault recovery[2].

[1] https://lore.kernel.org/all/1630457207-13107-2-git-send-email-Monk.Liu@amd.com/
[2] https://patchwork.freedesktop.org/series/96722/

Rob Clark (5):
  drm/msm: Remove unnecessary struct_mutex
  drm/msm: Drop priv->lastctx
  drm/msm: Remove struct_mutex usage
  drm/msm: Handle fence rollover
  drm/msm: Add debugfs to disable hw err handling

 drivers/gpu/drm/msm/adreno/a2xx_gpu.c      |  3 +-
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c      |  3 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c      |  3 +-
 drivers/gpu/drm/msm/adreno/a5xx_debugfs.c  |  4 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c      | 14 +++---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      | 13 +++---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h      | 10 -----
 drivers/gpu/drm/msm/adreno/adreno_device.c |  4 +-
 drivers/gpu/drm/msm/msm_debugfs.c          | 52 +++++++++-------------
 drivers/gpu/drm/msm/msm_drv.c              |  6 ---
 drivers/gpu/drm/msm/msm_drv.h              | 11 ++++-
 drivers/gpu/drm/msm/msm_fbdev.c            | 13 ++----
 drivers/gpu/drm/msm/msm_fence.h            | 12 +++++
 drivers/gpu/drm/msm/msm_gpu.c              | 22 ++++-----
 drivers/gpu/drm/msm/msm_gpu.h              | 33 +++++++++++---
 drivers/gpu/drm/msm/msm_perf.c             |  9 ++--
 drivers/gpu/drm/msm/msm_rd.c               | 16 ++++---
 drivers/gpu/drm/msm/msm_ringbuffer.c       |  4 +-
 18 files changed, 125 insertions(+), 107 deletions(-)

-- 
2.31.1

