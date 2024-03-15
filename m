Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71DA987D63F
	for <lists+dri-devel@lfdr.de>; Fri, 15 Mar 2024 22:37:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB30111259A;
	Fri, 15 Mar 2024 21:37:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="AG4jRRLP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38C61112599
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 21:37:38 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-6e6ee9e3cffso1432871b3a.1
 for <dri-devel@lists.freedesktop.org>; Fri, 15 Mar 2024 14:37:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1710538658; x=1711143458;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=JcjIzpIf3M0tslD3zrN0DmNXzOjKP0xQjzG1iMsY+AU=;
 b=AG4jRRLPFIhvRFmIwJwQ6bIChV99lFMjsRHiD/V4zbIEYWXMUQYdizQtC2njlBwaGi
 mMsWZBelbIoQXRbWESDe13/UEaEFzWWIhqEMuhJoHDbJpP0uWdSucER9h9CTOkyD/DpN
 GL43KOtNzSqB48zk99KocEdsEudAfaKgrp3/c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710538658; x=1711143458;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JcjIzpIf3M0tslD3zrN0DmNXzOjKP0xQjzG1iMsY+AU=;
 b=w+VEEB+c44nUg/UCPMWc5Lvr7rU9EK8E0b1UCoAHaWTBFPYwfRSHYj4Ye5q0T1li2d
 VlNwNmSdtxp6Lyl4/aTLrudWnbVnFJd5f6GswTGB554u0KlLcvbTTQiR+LDkoTObEJD3
 2AZEEr20/56kkABZhe9+MlLsiE5XWXCXopMRJOzHktGL4IKf8B752WNhAcDDgTgfHXM6
 JOyud+WjPdHmRC8lrG5RuP6SbDpMzgJFwcuhhsUZjqNTK53Swe9nGe8sgH2NyHJXAxsc
 Fmx/6AeBNesEFCrmER3+5l5hBY0q2/qe45uvFLUPUL02do17FwIxiqIkhsFPVwdI+/Lr
 N3aQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGDRjcjXoO4kGms1aBpLQaDdcFcG9sNLC4myR+hZsWicd/cjJa4tTyq+WnGrZ3SW/xKGfyM8hgFaMq/L1BqvcE6llwh0fVCZEN/NevZNoa
X-Gm-Message-State: AOJu0YyKGtaIjq8OweaM6S/xvu5pmTLfwDiCEFsDjL1plcb2lWGIkzK8
 SZQivubWOBiL1D69oUBmN35drIGyjlFhzs+oVysWhx5xwKKK2J4bX1r5yxYeDw==
X-Google-Smtp-Source: AGHT+IFjUmHac2Bq6KdiZW/REPm92doVaTzd5QixixIP9P8bacTyl7uoL/ZLpufE9uq3gSzkN3xgmQ==
X-Received: by 2002:a05:6a00:2d1d:b0:6e6:fb9a:fb45 with SMTP id
 fa29-20020a056a002d1d00b006e6fb9afb45mr3949524pfb.1.1710538657710; 
 Fri, 15 Mar 2024 14:37:37 -0700 (PDT)
Received: from dianders.sjc.corp.google.com
 ([2620:15c:9d:2:b23e:e8dc:3df4:aa2a])
 by smtp.gmail.com with ESMTPSA id
 a26-20020aa7865a000000b006e6b5e65579sm3837142pfo.106.2024.03.15.14.37.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Mar 2024 14:37:37 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Douglas Anderson <dianders@chromium.org>,
 Bjorn Andersson <quic_bjorande@quicinc.com>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>,
 Guenter Roeck <groeck@chromium.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>, Stephen Boyd <swboyd@chromium.org>,
 Vara Reddy <quic_varar@quicinc.com>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/4] drm/msm/dp: Improve DP AUX transfer vs. HPD
 interactions
Date: Fri, 15 Mar 2024 14:36:28 -0700
Message-ID: <20240315213717.1411017-1-dianders@chromium.org>
X-Mailer: git-send-email 2.44.0.291.gc1ea87d7ee-goog
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>


The main goal of this patch series is to avoid problems running
"fwupd" on Qualcomm devices. Right now several of the plugins used
with fwupd try talking over all DP AUX busses and this results in a
very long timeout on Qualcomm devices.

As part of fixing this, I noticed a case where the MSM DP code wasn't
respecing the timeout properly when asked to wait for HPD. I also
noticed that, now that we've implemented wait_hpd_asserted(), we no
longer need the long hardcoded timeout / special case for eDP in the
AUX transfer function.

NOTE: I managed to dig up some hardware to test the eDP case and my
basic testing shows that everything still works fine there after this
series.

Changes in v2:
- Don't look at the HPD line directly; have dp_display call us.
- ("Fix typo in static function (ststus => status)") new for v2.

Douglas Anderson (4):
  drm/msm/dp: Avoid a long timeout for AUX transfer if nothing connected
  drm/msm/dp: Account for the timeout in wait_hpd_asserted() callback
  drm/msm/dp: Delete the old 500 ms wait for eDP HPD in aux transfer
  drm/msm/dp: Fix typo in static function (ststus => status)

 drivers/gpu/drm/msm/dp/dp_aux.c     | 30 ++++++++++++++++-------------
 drivers/gpu/drm/msm/dp/dp_aux.h     |  1 +
 drivers/gpu/drm/msm/dp/dp_catalog.c |  7 ++++---
 drivers/gpu/drm/msm/dp/dp_catalog.h |  3 ++-
 drivers/gpu/drm/msm/dp/dp_display.c |  8 ++++++--
 5 files changed, 30 insertions(+), 19 deletions(-)

-- 
2.44.0.291.gc1ea87d7ee-goog

