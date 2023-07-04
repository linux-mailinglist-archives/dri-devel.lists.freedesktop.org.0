Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 77D567474B8
	for <lists+dri-devel@lfdr.de>; Tue,  4 Jul 2023 17:04:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F02610E1B0;
	Tue,  4 Jul 2023 15:03:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D88510E1B0
 for <dri-devel@lists.freedesktop.org>; Tue,  4 Jul 2023 15:03:57 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2b699a2fe86so95196331fa.3
 for <dri-devel@lists.freedesktop.org>; Tue, 04 Jul 2023 08:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688483035; x=1691075035;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tj0LTLAfRW3eN7Hujj5ZWhl9+2Sp6toZsHXLprydla0=;
 b=Oc0Ht0ENmTOi5FbZB1qXkgsXbGSfj290T9ms1fVGyZjAf+TvXYp+/XVxkzCCIUGrSN
 EXJ8sKyrnhtEvoNXAWvuVh5zypAQ9dnK+/nrEJM0S90TWQRgERdcDwt1rJGSR3OtB1GJ
 c8HsekoMrsGgyoXLkej8cT4EiZGmXZFuy7F8Fpf+2O6unmIpqpzCA3jXn2tUvxji+tEc
 vblq4c3eF+JzahrKDenDiKVi087tZQT66kmUdvBPD+h5gbPz5Xx33t3bUqOTRXNZ/T7P
 yUQCpke/VbNqgNBt3L8JccyC0TlbqEDDFSpx9UwY2wtpdt83wBG8jIJZQo3atPTPfMRv
 h91Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688483035; x=1691075035;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tj0LTLAfRW3eN7Hujj5ZWhl9+2Sp6toZsHXLprydla0=;
 b=FIqTdsV7AUYQeH5yn0iuy3BmeoQl++8WMm2IYMrbf4318gRinGqYBUAMbJAcnHUKvy
 nW2By8/vZ5j02gj0bY4xi8QqW5UDiZ6vZlDkvPbUqtnsNfQ2e38r0d+cuvSxed8Jwn93
 PoPjjXZuQeguS5yVDAsAUsS6q2NqKltGRSiRzF/jNqdSCf6HAZPE0FXC2tQFi07s2dCJ
 RxjSS10mzjeV7hqFFIgUvI3rMSYgh4fKsSbXut9dBH510c2hqp0p0nhMVYq5jdVh7Wea
 q6Z+vgvEaeFlAWjwKqvzHUkeokbzbs9232JEHYKBgr1Fqrs4ciHVqNhM2J+MBgXlPuAO
 VwcQ==
X-Gm-Message-State: ABy/qLb/ghaNnkwCZd+gV7Ln4GxAfc5CLoa7eTi0B+p4Xkkb0KdHmJcB
 Y2JB4xAxt5hsft9cEmYaG2uSCg==
X-Google-Smtp-Source: APBJJlH/fz7KgnfYa/G7+IktCfZ+NwjetuSkB8OLYtVtfbCSbvd92lztcnUZLLzQ8pUrqydS/i56Fg==
X-Received: by 2002:a2e:b606:0:b0:2b6:bf9c:d025 with SMTP id
 r6-20020a2eb606000000b002b6bf9cd025mr9182116ljn.8.1688483035336; 
 Tue, 04 Jul 2023 08:03:55 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a2e850a000000b002b6ca539d92sm3337354lji.138.2023.07.04.08.03.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jul 2023 08:03:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 00/14] drm/msm/dpu: cleanup dpu_core_perf module
Date: Tue,  4 Jul 2023 18:03:40 +0300
Message-Id: <20230704150354.159882-1-dmitry.baryshkov@linaro.org>
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

Apply several cleanups to the DPU's core_perf module.

Changes since v1:
- Reworked overrides for the perf parameters instead of completely
  dropping them. Abhinav described why these overrides are useful.
- Moved max clock rate determination to dpu_kms.c

Dmitry Baryshkov (14):
  drm/msm/dpu: drop enum dpu_core_perf_data_bus_id
  drm/msm/dpu: core_perf: extract bandwidth aggregation function
  drm/msm/dpu: core_perf: bail earlier if there are no ICC paths
  drm/msm/dpu: drop separate dpu_core_perf_tune overrides
  drm/msm/dpu: handle perf mode in _dpu_core_perf_crtc_update_bus()
  drm/msm/dpu: rework core_perf debugfs overrides
  drm/msm/dpu: drop dpu_core_perf_params::max_per_pipe_ib
  drm/msm/dpu: rework indentation in dpu_core_perf
  drm/msm/dpu: drop the dpu_core_perf_crtc_update()'s stop_req param
  drm/msm/dpu: use dpu_perf_cfg in DPU core_perf code
  drm/msm/dpu: remove unused fields from struct dpu_core_perf
  drm/msm/dpu: core_perf: remove extra clk_round_rate() call
  drm/msm/dpu: move max clock decision to dpu_kms.
  drm/msm/dpu: drop dpu_core_perf_destroy()

 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 265 +++++-------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  60 +---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  14 +-
 4 files changed, 96 insertions(+), 251 deletions(-)

-- 
2.39.2

