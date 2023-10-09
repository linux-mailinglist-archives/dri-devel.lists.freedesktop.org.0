Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73ABB7BD6FF
	for <lists+dri-devel@lfdr.de>; Mon,  9 Oct 2023 11:29:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3233D10E252;
	Mon,  9 Oct 2023 09:29:27 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A509110E253
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 09:29:25 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-503397ee920so5407860e87.1
 for <dri-devel@lists.freedesktop.org>; Mon, 09 Oct 2023 02:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696843764; x=1697448564; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=TFZSXyW7mDU8fLlg9Pjl2rgEx6FwL8TS6MLs3Q8UKXw=;
 b=ycQrlxgbRqlRHCoAwgM3mvpgsp849fMOcDFcGpRWfHAjB5HTytpp3xyl0zZSOI6AGo
 t0ATo2QqaCskaZoSMiiRaRfMWorfKTqckmfIZnpWS9DUMvO5tUlo8Z1Of5ilvS8sRNtE
 ZvSR50B3UIiCVphN7Z4194Kon3TtLKEhdArqHp/iaVec241rdv80DyJoRKW/yBdha4Em
 pmjeAK+d84btYDhn+it19gEw/iGED2F/Hp6IGOAiFrg1GAVXPmVvsZ4fUW+onmJjTi5u
 YbR14R3U2SfmP1TsQ+wxkiDMMcAZeOuntPZbZX20E7GaL+3ESt1ddRj0Sc1artsEMAOS
 SsOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696843764; x=1697448564;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=TFZSXyW7mDU8fLlg9Pjl2rgEx6FwL8TS6MLs3Q8UKXw=;
 b=gNXdK98ghwF3aHhukVCJnKlIVj0SajOukOkmXsEsgyqeoHYapnJkUCgMwzp88PhoT7
 zuqj8ugfYicPNI7TpMAA3i8yyC6Unv2g77wHDCtV8N/0s6rUkwlo4rLaC9w1nZ0uAVwG
 k1nEKZpM3dNLQps26qxNQbneA3S1jwZMH1ZrnnT9YGpVBjKgy8QCn5Sw0xSAw7xFN0g6
 8/IXl+Y5yRHPWlyH9fEhH6KN1KLaACuc2YzHdrgwR43jYeYzcY//LwLezJQTdsZJtCc8
 abefiZD/VilHh+Nf3UqquPxej0jqwsUtCJ8TzWp5BdycebxyTc4yRSpL1o0AdFekFW6t
 0gTg==
X-Gm-Message-State: AOJu0YyIwU1RrQVLnp1F1fhZaiomZMaHr4EExK3kNqFvqfjtzELRNH1N
 Qsq5XK3csimBwIdz2yiLECwvQw==
X-Google-Smtp-Source: AGHT+IFM7Nc4d+4AL5b3aumuZpOu+FLtAHAHH85cINd1L6VlfgbTJxvBv2rLW6PbBbCcEomGQhU9Rw==
X-Received: by 2002:a05:6512:1153:b0:4fb:7559:aea3 with SMTP id
 m19-20020a056512115300b004fb7559aea3mr15444325lfg.39.1696843763703; 
 Mon, 09 Oct 2023 02:29:23 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 n24-20020a195518000000b004ff9ab6463fsm1377495lfe.87.2023.10.09.02.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 02:29:23 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH v2 0/3] drm/msm/dpu: remove
 dpu_encoder_phys_ops::atomic_mode_set callback
Date: Mon,  9 Oct 2023 12:29:19 +0300
Message-Id: <20231009092922.2590891-1-dmitry.baryshkov@linaro.org>
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

The dpu_encoder_phys_ops::atomic_mode_set() callback is mostly
redundant. Implementations only set the IRQ indices there. Move
statically allocated IRQs to dpu_encoder_phys_*_init() and set
dynamically allocated IRQs in the irq_enable() callback.

Changes since v1:
- Split trace events into enable/disable pairs (Abhinav).

Dmitry Baryshkov (3):
  drm/msm/dpu: split irq_control into irq_enable and _disable
  drm/msm/dpu: split _dpu_encoder_resource_control_helper()
  drm/msm/dpu: drop dpu_encoder_phys_ops.atomic_mode_set

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 79 +++++++++++-----
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  | 11 +--
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 93 +++++++++----------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  | 57 ++++++------
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   | 34 +++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     | 74 +++++++++++----
 6 files changed, 204 insertions(+), 144 deletions(-)

-- 
2.39.2

