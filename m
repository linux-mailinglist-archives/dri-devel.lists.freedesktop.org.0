Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 13EAC8CBF7C
	for <lists+dri-devel@lfdr.de>; Wed, 22 May 2024 12:51:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36B2D10F4BC;
	Wed, 22 May 2024 10:51:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="daBKH8C1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CCFC10F4B5
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 10:51:00 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2e72224c395so36420521fa.3
 for <dri-devel@lists.freedesktop.org>; Wed, 22 May 2024 03:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716375058; x=1716979858; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WLMrKIIqKe3GpiO1YTS+FO5sczDX1G6WDYwUlpVeq9s=;
 b=daBKH8C1+QCE+Z5Czmr5Xixad+bRvPuxsQvXcFjJrKZkgbYkiTd2vF0YWVr0X0Gk94
 Ef62aRictFRhYBZsM0owk+NTKEelgvMG9YChJ6XylPO2wkPNRgKYf8BQUN9DRWUUtZ9o
 Z7xNC5scwWTR/lcMaJINsxgoq8wIPP6GST/bMxZ7cqcodsc3TtcwnpkoCbSBivJ6fTnq
 NnBh7SB1+qZDdFNkJ4CPhEs4tX92p0PQLlLJ0nuSMdRnCqGfPCqHSz0Cy0Wif916swk+
 Q+CDRfxuMjgmrIRabCiNF3c0I3f1SyI7f72X9n/JZPzTM9oB8TDJA6o11B6w2rpwx49f
 EcqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716375058; x=1716979858;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WLMrKIIqKe3GpiO1YTS+FO5sczDX1G6WDYwUlpVeq9s=;
 b=LYBlr4VEWX63pQ05YANZ3Hz37ccSQ06Mj+xmQPDT2S6fmQ0LQ/LsLQLKACq4jxbw8f
 EP/stgvHXAhPhOdPbGkYE+ttZQhPZ53ZUqttKV8xX6PeupWrTrCyJG3y0XUAixauoTe+
 +lxFCqlvlkBJHuReF80AapRzG0/91EuhDkNOqLqqtKHLGbgMj4Vy99c6AuD1X9qB2SNC
 Xy0HPZiWjNXCiDjwtriZCOmGX83cpPidYiGcgXJTQt6PgdBFyTrb7E54AqZsDelIyUdq
 xjWH8eeCpnABbsUwDdK9/EO5WKsijoOFAzbenw6yE21oT0K6meA1y7Ic/LVF4nRP1d/Q
 iJag==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWCwN8Jh1JrK4y4iYiEWmfezBDwdsIrj8wmWwaoYgsuhTTOXV/8us+GMW00MhAZurlY8xNFSitNfj5HOAWPsZFdZqScLDm+g6UZ9WN/8ud
X-Gm-Message-State: AOJu0YwYHyBVL95J9sQZ+RgUrvi1gQYkkcYm0YhJs9OT8z4wJujS7J7O
 0hNnP5RaTlSSM9ztwa2LTuBYLpIMKQOnj+zayXvfWpZYNn8Mo2sIY4oq9StdRuo=
X-Google-Smtp-Source: AGHT+IFh9Ye33hh7xt+BanfOhr8q/w6KH/QL7wGsUwxCgNJjCTFqNI8vXbmEH4ajxIiyKiqGhLoWpQ==
X-Received: by 2002:a05:6512:10d2:b0:523:8712:f500 with SMTP id
 2adb3069b0e04-526bc1810f6mr1046685e87.0.1716375058192; 
 Wed, 22 May 2024 03:50:58 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52431778ec8sm1279126e87.194.2024.05.22.03.50.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 03:50:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v2 00/14] drm/msm/hdmi: rework and fix the HPD even generation
Date: Wed, 22 May 2024 13:50:52 +0300
Message-Id: <20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAzOTWYC/zXMQQ6CMBBA0auYWTukTqUSV97DuCh2oBOFkikhE
 sLdbUxcvsX/G2RW4QzXwwbKi2RJYwEdD/CMfuwZJRQDGTqbmgi7gDEMgnEKyLZxTeDWeTZQikm
 5k8/vdn8Ud5oGnKOy/z+scdaQqWuy1cU1ZPGE5TbrWrVe1xxfabm9ZfSaqqQ97PsXAveJhaIAA
 AA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2022;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=eIKy2wBcaIR5N0rjjHKg6yf8hYS5copaiT9LRBhrUSo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmTc4PNbnq5cIBEGub6xOmedby/kcYkUvbbLmhO
 AEslgI1n0eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZk3ODwAKCRCLPIo+Aiko
 1WckCACArlw5q/C37Z6bmwDWaXeoQ0NFyUTYd5pocPEs8HlMv2q7iBQXrz0+pMKOHggj4qOcFKv
 XV3tFqoL6QEJwoy/3vrKvpRT1ei8t5V6WbZEPitVNUsyqY4/5pr9Fo1BMEcdZU2uzReMit0bCfk
 z60XGFUlGeGNQFR/qItE6Sp+S5jruxvwqrnDqd5UTGi+EgW5P4vAE8wgEhtn6N21wfU4VKDBhhf
 5HxWnrepdSUG/gMvjaCTwDKlqvjV8g//n0dcYwR1Z/RZDPRUOLDQ2fH/3kLrXhjwc30yMJrmTL2
 86IP5yUP0ZlRm9b7OkU16/iXCqSTQEDhSiUp2/To9h2y0hyX
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

The MSM HDMI driver is plagued with the long-standing bug. If HDMI cable
is disconnected, in most of the cases cable reconnection will not be
detected properly. We have been carrying the patch from [1] in our
integration tree for ages. The time has come to fix the long-standing
bug and implement proper HPD handling.

This series was tested on msm8996 and apq8064 boards. Previously HPD
handling sometimes could trigger in the CRTC event handling, however I
can no longer reproduce it now.

[1] https://lore.kernel.org/linux-arm-msm/20171027105732.19235-2-architt@codeaurora.org/

---
Dmitry Baryshkov (14):
      drm/msm/hdmi: move the alt_iface clock to the hpd list
      drm/msm/hdmi: simplify extp clock handling
      drm/msm/hdmi: switch to atomic_pre_enable/post_disable
      drm/msm/hdmi: set infoframes on all pre_enable calls
      drm/msm/hdmi: drop clock frequency assignment
      drm/msm/hdmi: switch to clk_bulk API
      drm/msm/hdmi: switch to pm_runtime_resume_and_get()
      drm/msm/hdmi: add runtime PM calls to DDC transfer function
      drm/msm/hdmi: implement proper runtime PM handling
      drm/msm/hdmi: rename hpd_clks to pwr_clks
      drm/msm/hdmi: expand the HDMI_CFG macro
      drm/msm/hdmi: drop hpd-gpios support
      drm/msm/hdmi: ensure that HDMI is one if HPD is requested
      drm/msm/hdmi: wire in hpd_enable/hpd_disable bridge ops

 drivers/gpu/drm/msm/hdmi/hdmi.c        | 145 ++++++++++++++++-----------------
 drivers/gpu/drm/msm/hdmi/hdmi.h        |  26 ++----
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c |  80 +++++++++---------
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    | 142 ++++++--------------------------
 drivers/gpu/drm/msm/hdmi/hdmi_i2c.c    |  14 +++-
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c    |   6 +-
 6 files changed, 157 insertions(+), 256 deletions(-)
---
base-commit: 8314289a8d50a4e05d8ece1ae0445a3b57bb4d3b
change-id: 20240522-fd-hdmi-hpd-e3868deb6ae0

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

