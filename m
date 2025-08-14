Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 045B9B2608F
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 11:18:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B8D10E828;
	Thu, 14 Aug 2025 09:18:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="edGoFBpX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
 [209.85.221.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D4CD10E828
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 09:18:19 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id
 ffacd0b85a97d-3b9e4193083so562619f8f.3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 02:18:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755163097; x=1755767897; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ffaHlWpu8RE7aequBY+27dl9SNuH9GqRdQDvB6bAj+s=;
 b=edGoFBpXxFU5m+2UmlufMG3MHVBQzJwzWeSKqUKX6hBTB08ozcawhTh+IMfdK0wma9
 fQDM6pDdzX5VY4KuL3TCCSI4DAAr7P2zi1A0i+FkT6uPFYF8/Kq5lBoLHSjEN6pvubjm
 r3ZJvuIRjhbY8Ld5zW+nhw4QWQvmr/n0sbGmG66EVCr8vKoRyoFt0EN8ULupb8pl9A1/
 Nk8cg4Ec/KXVqEpmoH1yRIjiXxngtIBg7jH86XhPRpaQ0W3GZwrjaSIDhnXnrOlBIwg8
 c5prEtp8+m0c7WjtP466imp54r3WatF3fPTyvBk5B6fs1R0Nif1BtwMR9aCKPLXd+U+w
 53rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755163097; x=1755767897;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ffaHlWpu8RE7aequBY+27dl9SNuH9GqRdQDvB6bAj+s=;
 b=LqK/oRGD0tYU1WMn4gsJY63ordFVIkBay41Lee+BkPu3FX4SxJIfBvn2gg1e97k/Ud
 ViIKrcuTEUYO1TTUM8YJSAkXtxQVZYK9I0aqMoBqQ9NM/8zqMWX4p3KPeT/vO7tKYWDX
 5tHwfONvMYuQtyMxJrjaqde1sRAIPw8yqlNCdKDJS0FAXepld1qB3movBFYMqdGsA1+l
 aBdD9dhIhqByexbRfxgTas5LTW+pTyEZb3oCxO2br4HezBUEOIvsC46RSZLwN2mezHnA
 9y3I3eY6YjiC3gCYPpN1ifl7tsH6Yr5BMRd+KW+bAfqJgh0QWdB/qw7mR/XvZ6MNB4s0
 oP6g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWt2/fJIaNHgxxR3A+I1fZ+hSrLjR7ABg8VDwrMLl9CgBFx9ksdnGpvaRLHmav/nA/Zn9nG7A9dmco=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxj6xE/tl0pcFiKO51JJcCPim9CVduxXGtxCzpuzzwr9Jpb9ZUC
 iahpopPBgqmsatt8IKxg+DFCNO1tEl2Q8CrM0LiC1OHpN0Uyp63YN3SLj/tFWPgFAAg=
X-Gm-Gg: ASbGnctbnm2BcXGjLRcmz36gCnSzkWahL42UriqjePJFPPUp0dfgu+4AXO6rGttEanf
 8VQszbuWvze/5QTEAnd05PD3HXI8hkaUbQ049Fzu6h6CKSItAhF9xVwBV94+WVYtdXHtPuxbvpJ
 Ksfwcv18+n3dI8Su293TwyczPx4v2EEGyeO/yrXmFfPKmuk+ca5kgG7snrj0uMDZfJgnaPqAtzH
 DR4YGo4k2MEQNUwUyxbzqtGSHoz5n9uvmOHUQRzQLnWSTa7CFQ1ULV6tl74uXtMvaFr5upDsIyD
 2ZJEDelM5KZ5tfWTThdPTS4a08tvIgVdeHsATSgDxLJ8JUITz2yhYBIjxuPECQcCrBny3QKBXhh
 iBgS4WLMKR9GX1kBwgfSkfccFiIlJbQifcIjOoZoUiM7e/Uc=
X-Google-Smtp-Source: AGHT+IGCOwNbc5nUe5UXc9T+LlZ8/LSjfCjdWogYZwRPwtV/r3ZErXEW4EvaurTmA3Z5w5QHIDd2wA==
X-Received: by 2002:a05:6000:420b:b0:3b7:76e8:b9f7 with SMTP id
 ffacd0b85a97d-3b9e414d51emr1806910f8f.10.1755163097393; 
 Thu, 14 Aug 2025 02:18:17 -0700 (PDT)
Received: from [127.0.0.2] ([2a02:2454:ff21:ef41:ea13:2485:4711:708])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-45a1c74876csm13861925e9.14.2025.08.14.02.18.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Aug 2025 02:18:17 -0700 (PDT)
From: Stephan Gerhold <stephan.gerhold@linaro.org>
Subject: [PATCH 0/2] driver core: platform: / drm/msm: dp: Delay applying
 clock defaults
Date: Thu, 14 Aug 2025 11:18:05 +0200
Message-Id: <20250814-platform-delay-clk-defaults-v1-0-4aae5b33512f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAM2pnWgC/x3MQQqAIBBA0avErBswSbCuEi3ExhoyC60oorsn7
 f7b/AcSRaYEbfFApJMTryGjKguwkwkjIQ/ZIIVUQlcSN292t8YFB/LmRuvnXM4cfk9Y10JIrRq
 nrIJ82CI5vv5717/vBzozBnltAAAA
X-Change-ID: 20250812-platform-delay-clk-defaults-44002859f5c5
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, 
 Abhinav Kumar <abhinav.kumar@linux.dev>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Michael Walle <mwalle@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.14.2
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

Currently, the platform driver core always calls of_clk_set_defaults()
before calling the driver probe() function. This will apply any
"assigned-clock-parents" and "assigned-clock-rates" specified in the device
tree. However, in some situations, these defaults cannot be safely applied
before the driver has performed some early initialization. Otherwise, the
clock operations might fail or the device could malfunction.

This is the case for the DP/DSI controller on some Qualcomm platforms. We
use assigned-clock-parents there to bind the DP/DSI link clocks to the PHY,
but this fails if the PHY is not already powered on. We often bypass this
problem because the boot firmware already sets up the correct clock parent,
but this is not always the case.

Michael had a somewhat related problem in the PVR driver recently [1],
where of_clk_set_defaults() needs to be called a second time from the PVR
driver (after the GPU has been powered on) to make the assigned-clock-rates
work correctly.

I propose adding a simple flag to the platform_driver struct that skips the
call to of_clk_set_defaults(). The platform driver can then call it later
after the necessary initialization was performed (in my case: after the PHY
was fully enabled for the first time).

There are also alternative solutions that I considered, but so far
I discarded them in favor of this simple one:

 - Avoid use of assigned-clock-parents: We could move the clocks from
   "assigned-clock-parents" to "clocks" and call clk_set_parent() manually
   from the driver. This is what we did for DSI on SM8750 (see commit
   80dd5911cbfd ("drm/msm/dsi: Add support for SM8750")).

   This is the most realistic alternative, but it has a few disadvantages:

    - We need additional boilerplate in the driver to assign all the clock
      parents, that would be normally hidden by of_clk_set_defaults().

    - We need to change the existing DT bindings for a number of platforms
      just to workaround this limitation in the Linux driver stack. The DT
      does not specify when to apply the assigned-clock-parents, so there
      is nothing wrong with the current hardware description.

 - Use clock subsystem CLK_OPS_PARENT_ENABLE flag: In theory, this would
   enable the new parent before we try to reparent to it. It does not work
   in this situation, because the clock subsystem does not have enough
   information to power on the PHY. Only the DP/DSI driver has.

 - Cache the new parent in the clock driver: We could try to workaround
   this problem in the clock driver, by delaying application of the new
   clock parent until the parent actually gets enabled. From the
   perspective of the clock subsystem, the clock would be already
   reparented. This would create an inconsistent state: What if the clock
   is already running off some other parent and we get a clk_set_rate()
   before the parent clock gets enabled? It would operate on the new
   parent, but the actual rate is still being derived from the old parent.

[1]: https://lore.kernel.org/r/20250716134717.4085567-3-mwalle@kernel.org/

Signed-off-by: Stephan Gerhold <stephan.gerhold@linaro.org>
---
Stephan Gerhold (2):
      driver core: platform: Add option to skip/delay applying clock defaults
      drm/msm: dp: Delay applying clock defaults until PHY is fully enabled

 drivers/base/platform.c             |  8 +++++---
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 10 ++++++++++
 drivers/gpu/drm/msm/dp/dp_display.c |  2 ++
 include/linux/platform_device.h     |  6 ++++++
 4 files changed, 23 insertions(+), 3 deletions(-)
---
base-commit: 8f5ae30d69d7543eee0d70083daf4de8fe15d585
change-id: 20250812-platform-delay-clk-defaults-44002859f5c5

Best regards,
-- 
Stephan Gerhold <stephan.gerhold@linaro.org>

