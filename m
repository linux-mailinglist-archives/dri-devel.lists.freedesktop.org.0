Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 168F24A612A
	for <lists+dri-devel@lfdr.de>; Tue,  1 Feb 2022 17:16:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B6A810E6CC;
	Tue,  1 Feb 2022 16:16:10 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D28B710E2C0;
 Tue,  1 Feb 2022 16:16:08 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id d187so16290344pfa.10;
 Tue, 01 Feb 2022 08:16:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1z552m5AcP5etVlHRK0+tWqqO0U3d4xBy54uwMDmgho=;
 b=ZAqR/gBucsSsJR+hfxdCZop70afx4XfLHuzI5FzWwFFvIx7fOq2pgoItRMdOUyGsLO
 jp1PfISnjETOzfDS0NCLofIAApK3cQfKbrAEDs3tUwMwdUlocO+XLtfQkFhCjOjvOllj
 pk5Ysmrk4+xHtFO04jCd0//spn1e4BDyJ08wU7XYyD+Jya1k/GfMohxn69t3Q8ZtfgP9
 PnG7nvuS0PUhniLgWQ35Gu+DYj8ntJ5aM/8C7Gl77iYNZXkDPC3Z6E1/cUqBgghMqVML
 u54dffPiF5fRKnxn1ra8GIFzmCiV7eWkzdqAIynI5HjA/5LoadVPXgxOUvppnTWPNLFR
 J/6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1z552m5AcP5etVlHRK0+tWqqO0U3d4xBy54uwMDmgho=;
 b=oTMTcpZb/Jsoho6sdjtl40aw+I1uSasQ9XOqU5r35vFahi2emnA8Y9Xb/b3cCtRQ4Z
 ZWN3x+AU6LX3LCq4FFn9seycLdc7jxI2aqlYakF0QPFP3EUxous8DbZfzO0gR9QdZOCm
 Qm90MvDD7kqYfbzLglZE2l9GqIDCHm/HEPtg8hYpXJNmcUKkJOExulqb3E/aQI2ZLDXD
 HAVgP20Ca2YhCcDMzWddT2EJahZ4G8Nqajf0IHF4c+u9g0npsU4Ge/Td7kje6F+Thx0o
 5qV7CaYOBeYpOV66jWzCduRgCQTwMMx8GjQybD98TTXHaXs69gr83wJS9LAOAiqa519E
 BTFg==
X-Gm-Message-State: AOAM533MYLudXKOrjaCFG+nr3z+yNEs18BMtLpsgKtujQFWTnQofTnrC
 sQpTbsO7/VfkG9Woj0dL0JlK66CMlpY=
X-Google-Smtp-Source: ABdhPJwHJOa8LNQvh6cGDOag9uq3jkCN051+pZ3ohETZm4elKnh1tepyZ8ZsPt2+XaN8I6ZI0MH9LA==
X-Received: by 2002:a05:6a00:1ac9:: with SMTP id
 f9mr23920358pfv.65.1643732167741; 
 Tue, 01 Feb 2022 08:16:07 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 a1sm31503548pgg.18.2022.02.01.08.16.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 08:16:06 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 0/2] drm/msm: Add tracking for faults associated with an
 address space
Date: Tue,  1 Feb 2022 08:16:10 -0800
Message-Id: <20220201161618.778455-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Cc: Rob Clark <robdclark@chromium.org>, Jonathan Marek <jonathan@marek.ca>,
 Emma Anholt <emma@anholt.net>, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 linux-arm-msm@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
 Vladimir Lypak <vladimir.lypak@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Yangtao Li <tiny.windzz@gmail.com>, Yiwei Zhang <zzyiwei@chromium.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, freedreno@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Currently, for GL_EXT_robustness userspace uses the global and per-
submitqueue fault counters to determine GUILTY_CONTEXT_RESET_EXT vs
INNOCENT_CONTEXT_RESET_EXT.  But that is a bit overly paranoid, in
that a fault in a different process's context (when it has it's own
isolated address space) should not hurt anything.

This is particularly annoying with CrOS and chrome's exit_on_context_lost quirk,
while running deqp in the android container, as the deqp-egl suite has
tests that intentionally trigger gpu hangs (for the purpose of testing
the robustness extension), which triggers chrome to restart, which
restarts the android container!

But chrome doesn't need to know about these faults, thanks to address
space isolation.

Applies on top of https://patchwork.freedesktop.org/series/98907/

Rob Clark (2):
  drm/msm/gpu: Add ctx to get_param()
  drm/msm/gpu: Track global faults per address-space

 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 5 +++--
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 3 ++-
 drivers/gpu/drm/msm/msm_drv.c           | 3 ++-
 drivers/gpu/drm/msm/msm_gem.h           | 3 +++
 drivers/gpu/drm/msm/msm_gpu.c           | 8 +++++++-
 drivers/gpu/drm/msm/msm_gpu.h           | 8 ++++++--
 drivers/gpu/drm/msm/msm_rd.c            | 6 ++++--
 7 files changed, 27 insertions(+), 9 deletions(-)

-- 
2.34.1

