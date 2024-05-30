Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 765FD8D5612
	for <lists+dri-devel@lfdr.de>; Fri, 31 May 2024 01:13:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 63EBC10E784;
	Thu, 30 May 2024 23:13:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IQEb8rlm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com
 [209.85.208.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B95CE10E698
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 23:12:59 +0000 (UTC)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2e95a60454fso16114661fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 30 May 2024 16:12:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717110777; x=1717715577; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BxC+zkRQtnEbqEOZ0TSkFRxCG7VsNA8jgi0zgdIyDnk=;
 b=IQEb8rlmUXykIFtRMazs84eTXIEbdyz4KmlL/G4K3ZFTE7bJrskQvUrWTolMRP7yuk
 wvXmCGfuW2E2kt5d1sQa7uuaroxohblPhwh6OF/v5MckRlYKDndlm8pS5xy0feZzu3+/
 rkMQH4VGEw6Pmdb5+lkVPQO2ayrsY2Im9tbeJlhfWP6hvkCVKHhMhRvtGOxc9PioeukM
 UtU21n9Au+aZtstfGsP1Ub2akd1qIhX4XRueG+FsBZwF1yJS9LGqRKYhucCyKNFRBrVM
 XNHPvB/MmZjAZ0VD/P0OVRvFdR8q67M0S7BQoKJYIfSdwchC74AGH4sXOs07bD3CBcn3
 u/iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717110777; x=1717715577;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BxC+zkRQtnEbqEOZ0TSkFRxCG7VsNA8jgi0zgdIyDnk=;
 b=YTdxAYXCMNQVGYGH3sIiMxHbZVZgJewSm2iKZ/sSUEBc97mB+uKQvRZz3EX8AsiHwU
 Ptu9Ccmbd77cskHxdrFob58ZgARiK1reDKBV/WcJhwKDFZ/5LAqlZY8cT50yUDVKf6lU
 5Lhd00SJUx0n5bH3dvuKLMUu4JH4UpmOW4gwo0W33nmXpDfqN/8wcGsG48KN8matrtHw
 uEDCiEJ5sS+OVsuL5vX7DbK6qhqCEliLaIJqjeKrblz3UfHA6ZxECBlOppFV5Qm1eA2v
 +sx5aQQ9CLLOV8kDvj3F+11ZBNsqqjyHVCpxevfLWKhaXBKLHcCxbsnotK1/zvGdqTxp
 9+xw==
X-Gm-Message-State: AOJu0YyKr48/7Mtx+GlH4hhHmCQvPkk1MuGRSbovW3rwLOciVWq6UeAI
 FHt3Q4PY2cIUrBaRqqzU3XupHId71KWoWMsrn0mNYJp5kLghuOZplyreuAJJEbAPohKadeqncc/
 S
X-Google-Smtp-Source: AGHT+IGGLsAMHbk6z9ggkIBZMdQMqoAHVm39g6bHGA+HdZAGC5BH/XBCKbp32FpXhgClt94lctQK5g==
X-Received: by 2002:a05:6512:2085:b0:529:bc99:1cd8 with SMTP id
 2adb3069b0e04-52b896d917bmr39787e87.59.1717110777383; 
 Thu, 30 May 2024 16:12:57 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52b84d75d96sm119005e87.120.2024.05.30.16.12.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 May 2024 16:12:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v3 0/3] drm/panel-edp: remove several legacy compatibles
 used by the driver
Date: Fri, 31 May 2024 02:12:54 +0300
Message-Id: <20240531-edp-panel-drop-v3-0-4c98b2b95e3a@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPYHWWYC/3WMSwrCMBQAr1Ky9kk+TbWuvIe4SPNpH5QkJBKU0
 rubdqWIyxmYWUi2CW0ml2YhyRbMGHwFcWiInpQfLaCpTDjlLZVcgDURovJ2BpNCBEqV4qIfhO4
 GUqOYrMPnPrzdK0+YHyG99n9hm/27KgwY0FaajkvGDO2vM3qVwjGkkWyvwj/7/qfnQMFpp1t5c
 vpszFe/rusbZq2K++0AAAA=
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1895;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=VvftgDyvPN2Jo+dzgQt64qBzdF1Q5SyfOzczZqaDLmk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmWQf4bgvbfxFD+03kBTAzGeWGmj39F9t7kiqCY
 mEAskW2zLeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZlkH+AAKCRCLPIo+Aiko
 1b/LB/9dVqU653u3o+awrMXOsZ2xSPBHZpil6qLXw6GtARRG1dtdPHMwF2rxdPdl6v62vVz/zgt
 xEA0N8hJPiquSjd22b4m+xShUbX4PMurjMqHnhxDX4+M1tWGeri67i4SkB1AZHxqTcb1076jJcq
 Y46FhaBvHYCToEdZnSJDXBKCcaYqw5DBL0hBpv5BjT4wRlsIW1HldEBHV+g2JGcVDoUu3C2j6P9
 ZfM/vgWE/UatGfLdjV6As/gGbDOV72Ts+LOPl0/wb/zp3Cob6JKWrM9sywDlM2fSzf6oOf76BF5
 FJlGkS4BpBJHSzoa+fmoJVUKLBGHOYSLNw4OMLrnsG924fo5
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

There are two ways to describe an eDP panel in device tree. The
recommended way is to add a device on the AUX bus, ideally using the
edp-panel compatible. The legacy way is to define a top-level platform
device for the panel.

Document that adding support for eDP panels in a legacy way is strongly
discouraged (if not forbidden at all).

While we are at it, also drop legacy compatible strings and bindings for
five panels. These compatible strings were never used by a DT file
present in Linux kernel and most likely were never used with the
upstream Linux kernel.

The following compatibles were never used by the devices supported by
the upstream kernel and are a subject to possible removal:

- lg,lp097qx1-spa1
- samsung,lsn122dl01-c01
- sharp,ld-d5116z01b

I'm considering dropping them later, unless there is a good reason not
to do so.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Changes in v3:
- Rephrased the warning comment, following some of Doug's suggestions.
- Link to v2: https://lore.kernel.org/r/20240529-edp-panel-drop-v2-0-fcfc457fc8dd@linaro.org

Changes in v2:
- Actually drop support for five panels acked by Doug Andersson
- Link to v1: https://lore.kernel.org/r/20240523-edp-panel-drop-v1-1-045d62511d09@linaro.org

---
Dmitry Baryshkov (3):
      drm/panel-edp: add fat warning against adding new panel compatibles
      dt-bindings: display: panel-simple: drop several eDP panels
      drm/panel-edp: drop several legacy panels

 .../bindings/display/panel/panel-simple.yaml       |  10 --
 drivers/gpu/drm/panel/panel-edp.c                  | 192 +++------------------
 2 files changed, 25 insertions(+), 177 deletions(-)
---
base-commit: 6dc544b66971c7f9909ff038b62149105272d26a
change-id: 20240523-edp-panel-drop-00aa239b3c6b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

