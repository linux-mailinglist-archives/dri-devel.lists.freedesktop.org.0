Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DE0988C646
	for <lists+dri-devel@lfdr.de>; Tue, 26 Mar 2024 16:06:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5C5E10EB6A;
	Tue, 26 Mar 2024 15:06:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="YdAyhnSI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F22910EB17;
 Tue, 26 Mar 2024 15:06:43 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id AE41D6123D;
 Tue, 26 Mar 2024 15:06:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93676C433F1;
 Tue, 26 Mar 2024 15:06:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1711465602;
 bh=WmNiMtGDvNIqOuw0hY+smIdzoUtjfSFeYRQC6xh4Hz8=;
 h=From:Subject:Date:To:Cc:From;
 b=YdAyhnSI2E95pDDtosE2XKa4KlrVw6uB9EdAlNc5LweIuC4wkSVPFig1ZELG4Omjj
 SZ7qNrQs9LK1I9jwWbwdqGicy+zZzeXFAZ5Ys9A2iwxfIgEMzMGEkJhhez34mBaeo1
 2YVuRy8FMO46v3VzYvS77tpchP+lTeTl5vnEe43AaukHkfzSclYMKldyTQ9ie05+Ni
 gdtZgDJZdurPPDbc+WdfNYKduJ9xr38xtWjYiPdxywxiYeic49/6k/gOQ1TAT17BBi
 G1SNfIw6Mr/e3+7ibl7wCd37v2uUyKufF3YWxOe3VL5/4n/3UmWwn/OZZm/0mQ8gyn
 bCr4daqBwTdsQ==
From: Bjorn Andersson <andersson@kernel.org>
Subject: [PATCH 0/6] drm/msm/dp: Spring cleaning
Date: Tue, 26 Mar 2024 08:11:28 -0700
Message-Id: <20240326-msm-dp-cleanup-v1-0-e775556ecec0@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKDlAmYC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxMDYyNj3dziXN2UAt3knNTEvNIC3TSLpERjozQzo7QkSyWgpoKi1LTMCrC
 B0bG1tQCcAFK9YAAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Bjorn Andersson <quic_bjorande@quicinc.com>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=1577;
 i=quic_bjorande@quicinc.com; h=from:subject:message-id;
 bh=WmNiMtGDvNIqOuw0hY+smIdzoUtjfSFeYRQC6xh4Hz8=;
 b=owEBgwJ8/ZANAwAIAQsfOT8Nma3FAcsmYgBmAuWiYj3RLwGpOhxIEW7T2SOQ84wLGP58ADzl7
 pJz4nX1ygyJAkkEAAEIADMWIQQF3gPMXzXqTwlm1SULHzk/DZmtxQUCZgLlohUcYW5kZXJzc29u
 QGtlcm5lbC5vcmcACgkQCx85Pw2ZrcVd9g/8C0cZzaUvCibCedahgHhwt1L8hzPUs0r/axyvoML
 z+JT4IKVfaXPJrsiUDa1/zKu8kVC7Z5nYWMGUaLRFXVNuP3Fciug8/8f7ClWtpgSxuNunDuJdjj
 XtAe63xUiCNji1Ag9XIwat2u8i/RJbVex3XviTuF8QmJzWqBOTAR+Rf1Su/tN9xDdbZENmMF0QU
 i8fcQ3Y07pirEkiDIOU5NFAthxTfvEKFXhJf82DNDCfb4CNe80hytj8HpyRxwXsQ2p2g+fhpBBO
 R8HLZhQCrnH9VrYhRYGTfHtDsyPbpi6Nl4OkzhPYYdSgbktU78GpwQpg8WHOGfws/fGpNT3I8rz
 23zDBocNGgEN/oWqlnuIRA3HD2ctoxIO2uaRcjA3cRSv9eRwKK5vfWgCZGEotaDRYjFdUozlK3V
 G3VUbFHbdDbVS1yg2UpRlU+8nBFHU6DNA3lTXuuCmal89f/E7BKc6CMR1afomVYn+Ze7OElxC7b
 Dmx3VMciv8gFK8YjWYeUjGwkUKWvgcTC1V9zA6Bh9AxP1dPP/SKLJhQk6Qvesrr1RL5GByx0xGo
 ovPVkLHPbKpFXjWyDtoZd+SAt9mByJOr6G0DQXaMMi9TUV6Fe44V+P9rx1q0QUjmTXxarO6R3+n
 O4K+UQmsV/PRSIreRQgPso3Woec8RpKkpTNKeQXvC9ks=
X-Developer-Key: i=quic_bjorande@quicinc.com; a=openpgp;
 fpr=05DE03CC5F35EA4F0966D5250B1F393F0D99ADC5
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

Spring is in the air, clean out some dust that has accumulated in the
Qualcomm DP driver.

Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
---
Bjorn Andersson (6):
      drm/msm/dp: Drop unused dp_debug struct
      drm/msm/dp: Removed fixed nvid "support"
      drm/msm/dp: Remove unused defines and members
      drm/msm/dp: Use function arguments for aux writes
      drm/msm/dp: Use function arguments for timing configuration
      drm/msm/dp: Use function arguments for audio operations

 drivers/gpu/drm/msm/dp/dp_audio.c   | 25 +++------------
 drivers/gpu/drm/msm/dp/dp_aux.c     |  9 ++----
 drivers/gpu/drm/msm/dp/dp_catalog.c | 64 ++++++++++++++-----------------------
 drivers/gpu/drm/msm/dp/dp_catalog.h | 49 +++++++++-------------------
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 17 +---------
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |  1 -
 drivers/gpu/drm/msm/dp/dp_debug.c   | 38 ++++++----------------
 drivers/gpu/drm/msm/dp/dp_debug.h   | 38 +++++++---------------
 drivers/gpu/drm/msm/dp/dp_display.c | 15 ++-------
 drivers/gpu/drm/msm/dp/dp_display.h |  3 --
 drivers/gpu/drm/msm/dp/dp_drm.c     |  2 --
 drivers/gpu/drm/msm/dp/dp_link.c    |  4 ---
 drivers/gpu/drm/msm/dp/dp_link.h    |  1 -
 drivers/gpu/drm/msm/dp/dp_panel.c   | 14 +++++---
 drivers/gpu/drm/msm/dp/dp_panel.h   |  3 --
 15 files changed, 80 insertions(+), 203 deletions(-)
---
base-commit: 084c8e315db34b59d38d06e684b1a0dd07d30287
change-id: 20240323-msm-dp-cleanup-f8ba32f62fb9

Best regards,
-- 
Bjorn Andersson <quic_bjorande@quicinc.com>

