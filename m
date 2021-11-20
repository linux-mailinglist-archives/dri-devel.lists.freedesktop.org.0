Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C49ED45803A
	for <lists+dri-devel@lfdr.de>; Sat, 20 Nov 2021 20:56:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99E726E1B6;
	Sat, 20 Nov 2021 19:55:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 305C96E128;
 Sat, 20 Nov 2021 19:55:58 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id g18so12244376pfk.5;
 Sat, 20 Nov 2021 11:55:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3B9R8wmPt5FiY3+8DpmPyX4kLYpyKeoK4xVcuXGAELc=;
 b=nD/OFAmEjlXdlhnR0EIWcKCOjCOpynXRiCQ3L5b/NryZEFW7aGN27xk4nHOKfeuhse
 mZk0p5lIsEsob6VGHCAJPr/eoALBiLSDq62hlJNNKrCR2r9DpFVI1lIyMV9cLbXbV/CJ
 bHvSMVxvejnHY8y0jHPVRD1oZ1D9xSZ9GAP48Qwlp5Gpx2J33IrOqBl+5T/PYD2q7pAV
 Actp2SiKFF0pcq0+0JBkiGaV7FpnCxZP2GEsh2g0T5tfZGDwYYzB57jwDbQg2EX4rsR3
 Gaegv6w8zrw6oW7sQ81izSqO6kJRrldI4NjDCBOw3wDSYFMqMlVJZuY/+saKP7YRllL0
 x1VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=3B9R8wmPt5FiY3+8DpmPyX4kLYpyKeoK4xVcuXGAELc=;
 b=aW/F1L4IK4IHjrcjpEKhTOwCGlU5gZ3rY8zbWhohYcve6uu1rWGZYaAvKExkR1v90h
 SgO28ofdEWzDG7S7D/qvppxxjpkYdsVeKx9YtzOoF9e4dEX++hvxYVO22GsmJwsnKd+E
 rlShPJIP2VK27iG3E+aVF5Rf4rHrGdoPSxrrnQ/WxPeEltCqXSV3XUWDMtv/q6v0L4B+
 Hdk99zs4+XT/hvYY8ZWmFpSQmNpm9Pv5TV0yTcbdWq+6ZPiovrSvZNa5VWKkz0k0XDkF
 TjCHOgM79odgAq6L96CEAaMmr+Dkwf8fX04/bjMDgBfT8OmkFS6WtlIny8cxMIHi4/UQ
 SlPw==
X-Gm-Message-State: AOAM533AN8UJdRerQm+IL9pkjmohR13Z6+dtvY4EbnEybV20sY0FrhoT
 37FTJnY2r/vrd/QAAwMJQDkGIHuv2gE=
X-Google-Smtp-Source: ABdhPJxrc0BlTm1p/mAREngPYj1AozJJkBDsUTlgiy4iQ8gEIX+Ko3GmA3AOSxR7OjuFJGd4WFiAVg==
X-Received: by 2002:a63:85c6:: with SMTP id
 u189mr23809628pgd.344.1637438157101; 
 Sat, 20 Nov 2021 11:55:57 -0800 (PST)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 y130sm3397659pfg.202.2021.11.20.11.55.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Nov 2021 11:55:56 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH v2 1/3] drm/msm/gpu: Fix idle_work time
Date: Sat, 20 Nov 2021 12:01:01 -0800
Message-Id: <20211120200103.1051459-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.33.1
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Doug Anderson <dianders@chromium.org>,
 open list <linux-kernel@vger.kernel.org>, Sean Paul <sean@poorly.run>,
 freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

This was supposed to be a relative timer, not absolute.

Fixes: 658f4c829688 ("drm/msm/devfreq: Add 1ms delay before clamping freq")
Signed-off-by: Rob Clark <robdclark@chromium.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 drivers/gpu/drm/msm/msm_gpu_devfreq.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_gpu_devfreq.c b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
index 43468919df61..7285041c737e 100644
--- a/drivers/gpu/drm/msm/msm_gpu_devfreq.c
+++ b/drivers/gpu/drm/msm/msm_gpu_devfreq.c
@@ -228,5 +228,5 @@ void msm_devfreq_idle(struct msm_gpu *gpu)
 	struct msm_gpu_devfreq *df = &gpu->devfreq;
 
 	msm_hrtimer_queue_work(&df->idle_work, ms_to_ktime(1),
-			       HRTIMER_MODE_ABS);
+			       HRTIMER_MODE_REL);
 }
-- 
2.33.1

