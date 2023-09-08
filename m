Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EDFDE7980C5
	for <lists+dri-devel@lfdr.de>; Fri,  8 Sep 2023 05:05:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B05A710E853;
	Fri,  8 Sep 2023 03:05:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C0D810E57E
 for <dri-devel@lists.freedesktop.org>; Fri,  8 Sep 2023 03:05:24 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2bccda76fb1so28220461fa.2
 for <dri-devel@lists.freedesktop.org>; Thu, 07 Sep 2023 20:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694142322; x=1694747122; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5o+SPaUCffB9wFtrSLZVybbJbjD0ZXPNdB88Cfri9WY=;
 b=OLw28sQiz7c383yZr+nf+SwzfE5qNU95vg4Lkj754qbvFP9Tg+YKZiXlD24MPoXPmD
 REYLeP/lr5CbBp/QWm9NjM0M+COr2z4wMxFXeZFaDv984BYPZ35bOUC0tT+BcVk6HXTK
 jPcCh2n6Hnv26/RRBKqh/dEelk/Xht09Z87N2+fcb1VIskwFC+w2WM0ZgRuZJTTOlXfs
 mLu2F3GfcSCvuLBNrQ9d0ikzQfVUR4mpGhbKqhwSrwz9+naXFFoWiixRkILpuc5OAahN
 GGWpJ6QfxP7a9sNAoQUFxnDcH3AmDzqb75WTFMwLGTetI3euAubJkCol5NJ5rI8EbKLn
 X2WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694142322; x=1694747122;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5o+SPaUCffB9wFtrSLZVybbJbjD0ZXPNdB88Cfri9WY=;
 b=VxElZ0hg3xWv6swcRSATKlVXY6c0N1v2Yqli/H02fsjY/Pe/sX8JQ7K3RewgNwQhH+
 SnLW1hbGbu5A/RX886gtRyKQA+NHt7D+HT8TBNbHoLUYvS2Qtscv8HmgG+qVGgss8mVT
 dhFcTzR/MUxdZ2JHonGkIETeiQc9n6vdP01RU5yUsXleHZKk0bktU5pfRGr0h6lYliKl
 ZioJ/RLE5tCQd4FdkAGosSqU2PvPnNjHXm79LE0+KHFiDHYPIg72RFAT/WDqfk1MEIJP
 y/o38n8GLrabuoKpx3TPzyOq6pN6qBt7zYNATvk9xhwvEM8tHtsWowV7tPXKTOetnqZn
 JqLg==
X-Gm-Message-State: AOJu0Yxy9gzX6biY4bro88mTop/SezMmgJNn7qJgscfaoabJgL1RiLS/
 eWgjW+AoJNnKmlUHsz+C9niqnw==
X-Google-Smtp-Source: AGHT+IHGkh/WaT5fi2tv+g9ZoxjNNOQzvf8MVWos7gGhrta4aPejRWa4/qo9xN2YnHu/3XzvVEVFDg==
X-Received: by 2002:a2e:9012:0:b0:2bc:db5a:9540 with SMTP id
 h18-20020a2e9012000000b002bcdb5a9540mr646083ljg.42.1694142322434; 
 Thu, 07 Sep 2023 20:05:22 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z10-20020a2e8e8a000000b002b93d66b82asm128332ljk.112.2023.09.07.20.05.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Sep 2023 20:05:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH 0/5] drm/msm: cleanup private obj handling
Date: Fri,  8 Sep 2023 06:05:16 +0300
Message-Id: <20230908030521.236309-1-dmitry.baryshkov@linaro.org>
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

While debugging one of the features in DRM/MSM I noticed that MSM
subdrivers still wrap private object access with manual modeset locking.
Since commit b962a12050a3 ("drm/atomic: integrate modeset lock with
private objects") this is no longer required, as the DRM framework
handles private objects internally. Drop these custom locks, while also
cleaning up the surrounding code.

Dmitry Baryshkov (5):
  drm/atomic: add private obj state to state dump
  drm/msm/dpu: finalise global state object
  drm/msm/dpu: drop global_state_lock
  drm/msm/mdp5: migrate SMP dumping to using atomic_print_state
  drm/msm/mdp5: drop global_state_lock

 drivers/gpu/drm/drm_atomic.c             |  9 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 14 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h  |  1 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c |  2 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 54 +++++-------------------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h |  1 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c | 12 +-----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.h |  4 +-
 8 files changed, 31 insertions(+), 66 deletions(-)

-- 
2.39.2

