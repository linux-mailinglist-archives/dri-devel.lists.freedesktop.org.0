Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 302763773DF
	for <lists+dri-devel@lfdr.de>; Sat,  8 May 2021 21:53:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F136A6E055;
	Sat,  8 May 2021 19:52:58 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25D196E055;
 Sat,  8 May 2021 19:52:58 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id i13so10797904pfu.2;
 Sat, 08 May 2021 12:52:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=52/BODVej/sAPj1HAsVHhcFR3RxERy74g5pEGd5eMWs=;
 b=Lckz/cwvu9w/BaykBLqzfMjsL/UzQqsU+MmTCjOI6K9UxxSYmFuzeX2FoFWqqSHg+2
 InT7fyulz7rhUb0jU3JAmCtfarUKA4v4x09Z1Ka70powvuTaJSSwjiO36xdDagFCSTxK
 6moDnOuYz2a4wG6eP8UTr+7SDYQ6BmDSavDu/a1BxvZjD7DyMMVVrP5XU5ebIoIKab04
 s6Efs7s2NKzeKkIK8mloBupy3sUVKI2dmWS92vY+h60yKMmM7J4hFoSeZQObY8twiX4u
 YfOXkgLjEjPe3WMYhn/0p31S9ihmVQXjBH42wAq7j7QoeR9vcBFQY+j99ayowT/2hv8q
 pLMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=52/BODVej/sAPj1HAsVHhcFR3RxERy74g5pEGd5eMWs=;
 b=AKutjqzCGBurmwD1YSssaK44oM3ALhu400jsutn8Vf3Ze4191MABj75LqDsAV3/uLh
 AAzOVrXVrM5/IIZwE0Xo6pzeO7FFiZu55/1kazDVemN8qDZ9DNvEijG9qN7LoazSgNzu
 BD5AQRsc6wKQRaxtBXmnwvxKI34qhSJvHiYqXLu+rHKBE6WBXibVORgAENl7sx36e7Lf
 WnXbQWiTJA/Ovxn+LZNQ6N3Hw/XNZcE6Z6v0K6BO7BEWjUWWjI1VhuBiGBjnrsgjmvKu
 sUzCXTX+umiSpYWzktQu11yMLpoPEYcMSfE/0pMxRuQADyXHDnt/WK7Qu4kj6MHYzmI7
 Gzew==
X-Gm-Message-State: AOAM530ypaKZGo7SfC6ijtSsNl+vMkeXqjCwFBTD29T3QsoU2X51I94B
 nLR3+yj8rl83og9fGKPkBFsuav/T643XMA==
X-Google-Smtp-Source: ABdhPJzShZqZ9yJXLeSXzV96pkdUxCEhyW3PchhSSkpkvoHPAOi4i4qCubtWTJgzZb+0BE3AedNzcw==
X-Received: by 2002:a62:8208:0:b029:289:112f:d43d with SMTP id
 w8-20020a6282080000b0290289112fd43dmr16583052pfd.61.1620503576956; 
 Sat, 08 May 2021 12:52:56 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 u1sm7543017pgh.80.2021.05.08.12.52.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 May 2021 12:52:55 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 0/2] drm: Fix atomic helper dirtyfb stalls
Date: Sat,  8 May 2021 12:56:37 -0700
Message-Id: <20210508195641.397198-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.30.2
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
Cc: Rob Clark <robdclark@chromium.org>, Bernard <bernard@vivo.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Hongbo Yao <yaohongbo@huawei.com>, open list <linux-kernel@vger.kernel.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Qinglang Miao <miaoqinglang@huawei.com>, Maxime Ripard <maxime@cerno.tech>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

Someone on IRC once asked an innocent enough sounding question:  Why
with xf86-video-modesetting is es2gears limited at 120fps.

So I broke out the perfetto tracing mesa MR and took a look.  It turns
out the problem was drm_atomic_helper_dirtyfb(), which would end up
waiting for vblank.. es2gears would rapidly push two frames to Xorg,
which would blit them to screen and in idle hook (I assume) call the
DIRTYFB ioctl.  Which in turn would do an atomic update to flush the
dirty rects, which would stall until the next vblank.  And then the
whole process would repeat.

But this is a bit silly, we only need dirtyfb for command mode DSI
panels.  So lets just skip it otherwise.

Rob Clark (2):
  drm: Fix dirtyfb stalls
  drm/msm/dpu: Wire up needs_dirtyfb

 drivers/gpu/drm/drm_damage_helper.c      |  8 ++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 14 ++++++++++++++
 include/drm/drm_modeset_helper_vtables.h | 14 ++++++++++++++
 3 files changed, 36 insertions(+)

-- 
2.30.2

