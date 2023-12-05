Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5487806155
	for <lists+dri-devel@lfdr.de>; Tue,  5 Dec 2023 23:05:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0685210E62D;
	Tue,  5 Dec 2023 22:05:51 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x52a.google.com (mail-pg1-x52a.google.com
 [IPv6:2607:f8b0:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF00410E62D;
 Tue,  5 Dec 2023 22:05:48 +0000 (UTC)
Received: by mail-pg1-x52a.google.com with SMTP id
 41be03b00d2f7-5c1a75a4b6cso2453665a12.2; 
 Tue, 05 Dec 2023 14:05:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1701813947; x=1702418747; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Lt1kIBCZQd3LG/iBwo/J1swllC6IeMh/7niRSSG8eSM=;
 b=CbCuniAS8QJyIYLP0ccHrOYpXsuh6jJz2cR1rxk+gbH/mjcLCEpRRunayv7Q4AbqDu
 sIupHdTCP6rDC+eCCj5Zbka+QNYxKLYLlY9tPns7NzLfC4WUyu8t8cOP46Sg/4XURzNh
 Ic1G+IXS4B0Yz3L8pxPgkGZEIlGpLO0mRN8y+OOQD14IbwGKBpfpZtjcIt1LdDJMJhew
 TnjMsLKmxWFlWbjiI8ktQT3KYsGlMBB7Gw54g8QpkOoi8VN4hmcC6NxuQg6ywYtBKnn7
 x/gtkLCVKHOV/7h+DfVVANM6lAYkTkP7uSo7XKdFg2HUCASB0nlBdPELibiBLFya6t9n
 N2pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701813947; x=1702418747;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Lt1kIBCZQd3LG/iBwo/J1swllC6IeMh/7niRSSG8eSM=;
 b=k2VoIX/Vd5eQu5SpWfEXva6nYjj66mh81K7ZBX3ISWbFKyY57DHY/4zhwtU/HXFI03
 ewPyua+6ufzb2KL3QvaIMlotLyDA/qSTEsCRByYogrLLw6pa1jaDJq6D3Ls8/eEGjMbV
 iVFtyrJOynYNH+6ypFBdkUiTLZ/6ZxaiOxnzgQAkK6IamgCSjNWqpS4ecnIMVoCd4E7G
 AByyZPtyvqdz36IW7eZA1zb7a2eUfaFXXoyswP4Ue4mrjc1m/Ut/BfeFiKyjE+XQptj+
 J0daj8atcZM8s84xgd57XrWZeRAdghz+fYyN250jAKHrVC734IqkbSOdDnUHfLebwKsb
 HpzQ==
X-Gm-Message-State: AOJu0YwaSxOOIKsNrYNAoDH/P/unIOfIjWLnLDgK0JhisIvp77B4EYX5
 +8PalxiJGUw81fib6MfRPWFH57YmQcU=
X-Google-Smtp-Source: AGHT+IGCYdrq8ZCbOguCKZk5oP4hEivw111igFkO+eYDHvqYTmFBPkRzxrRBea62JTpfvkPxKwziLA==
X-Received: by 2002:a17:90b:1e0b:b0:286:bd82:1435 with SMTP id
 pg11-20020a17090b1e0b00b00286bd821435mr1671891pjb.22.1701813947284; 
 Tue, 05 Dec 2023 14:05:47 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:e1c5:6354:b45d:8ffc])
 by smtp.gmail.com with ESMTPSA id
 bt10-20020a17090af00a00b00286e69c8fb1sm1498921pjb.52.2023.12.05.14.05.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Dec 2023 14:05:46 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/5] drm/msm/adreno: Introduce/rework device hw catalog
Date: Tue,  5 Dec 2023 14:03:26 -0800
Message-ID: <20231205220526.417719-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.42.0
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
 "open list:SUSPEND TO RAM" <linux-pm@vger.kernel.org>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Douglas Anderson <dianders@chromium.org>,
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 "Joel Fernandes \(Google\)" <joel@joelfernandes.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org,
 Johan Hovold <johan+linaro@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Split the single flat gpulist table into per-gen tables that exist in
their own per-gen files, and start moving more info into the device
table.  This at least gets all the big tables of register settings out
of the heart of the a6xx_gpu code.  Probably more could be moved, to
remove at least some of the per-gen if/else ladders, but this seemed
like a reasonably good start.

Rob Clark (5):
  drm/msm/adreno: Split up giant device table
  drm/msm/adreno: Split catalog into separate files
  drm/msm/adreno: Move hwcg regs to a6xx hw catalog
  drm/msm/adreno: Move hwcg table into a6xx specific info
  drm/msm/adreno: Move CP_PROTECT settings to hw catalog

 drivers/gpu/drm/msm/Makefile               |    5 +
 drivers/gpu/drm/msm/adreno/a2xx_catalog.c  |   53 +
 drivers/gpu/drm/msm/adreno/a3xx_catalog.c  |   75 ++
 drivers/gpu/drm/msm/adreno/a4xx_catalog.c  |   51 +
 drivers/gpu/drm/msm/adreno/a5xx_catalog.c  |  145 +++
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c  | 1118 ++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c      |  817 +-------------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h      |   11 +
 drivers/gpu/drm/msm/adreno/adreno_device.c |  559 +---------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h    |   22 +-
 10 files changed, 1506 insertions(+), 1350 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/adreno/a2xx_catalog.c
 create mode 100644 drivers/gpu/drm/msm/adreno/a3xx_catalog.c
 create mode 100644 drivers/gpu/drm/msm/adreno/a4xx_catalog.c
 create mode 100644 drivers/gpu/drm/msm/adreno/a5xx_catalog.c
 create mode 100644 drivers/gpu/drm/msm/adreno/a6xx_catalog.c

-- 
2.42.0

