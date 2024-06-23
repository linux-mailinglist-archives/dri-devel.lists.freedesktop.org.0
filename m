Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B03C9137D7
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jun 2024 07:27:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 208F310E168;
	Sun, 23 Jun 2024 05:27:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="kTQjUcfD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFA2510E048
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jun 2024 05:27:40 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-52c94cf4c9bso4217852e87.2
 for <dri-devel@lists.freedesktop.org>; Sat, 22 Jun 2024 22:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719120458; x=1719725258; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LVAL5mslFEILc/7J/ilzR8hF7Wd9A0knVqrCwFF7a8k=;
 b=kTQjUcfD7c7KS+Y8jh1WFB/oOKfLdVa1qTnsXGjIR0UVk3C0XMLdmjWTmAHHgXOkiN
 ESAIPfsLoNL2lVnFmI+FOTPgTZ22gimSs32SP0uFMayAdm1rUaKvf3U9hILW+ahU1R/M
 hbQbqKbk0GGCPu1Khbp/mCETgCf/U0koBPjQpKRIOSwKh6mirKhn8t5pD9S18Dyxi+jR
 9mPoO2bKOrBpzINNLgoWmoDpFaHc5TQ/fGibX1mXoZmWBmN/uKfcPOQVijynSpf74cFg
 jBdz6mbzpP+ZQSPx7MYc5DrS/J64vy/u6en/2a/okSZpoYaybuTU5TWA6fnrBHucACE8
 5uZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719120458; x=1719725258;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LVAL5mslFEILc/7J/ilzR8hF7Wd9A0knVqrCwFF7a8k=;
 b=lUiy3i+Ao6sc5MvUVtqBrM9vDHsSzCydBZAvd9Q0oeQL7ln9q3xaZoexleou8FoY/a
 k+C0O6INdp7Egae+rnMXj5TthrHgF4Povsh6N807wqwnL6MUBuCpM76BGk8mzZlkTkch
 e7YJMYnUbL1Bwz7o7m1eXAgl8fB8oEXOqn2KFljCsqtxPRe7OTgdsazZrxePoVm7Iqk+
 HzUyVzbMMwjIzpH4CrPyTbNofqaYypTZ9WqeKJm3oqgseGHP6+qSNXl1nYrAw0tJsmGo
 aVKKji9mmc5fNcJjFgigdcQiKxO5r0LjvqMo50jHGgU4bwAI6PCBBPziX40HaJF8Yj7h
 68vw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0CLS5aBQkQ6JoiGx7fev2vieac1rgGbsQmf0YY/j+kxuyx3omiYW/xoA7aQoV5FQwGAsLNrPxGFwhpKM7/o29rtln/BO0BRsY/k6l3jJM
X-Gm-Message-State: AOJu0Yx+Q6mOKR6gqu08wrbGm0yq4uerS080osRI5tyXrkGaUFB7BTmh
 beq/IohzB/Z3TEt1mK1Fm8HEtgJs+GBIXyBM3joFT0azeFkjw/wAE62RZEYX7RM=
X-Google-Smtp-Source: AGHT+IEU3dRYcuKIxDZCaoumBhvHMhR5hsmhogChQ/yKxr+nuwKSL/e5bj5MwiA1Bx/1nKPuyNraRg==
X-Received: by 2002:a05:6512:1cb:b0:52c:dd59:6784 with SMTP id
 2adb3069b0e04-52ce183c00bmr942505e87.40.1719120458160; 
 Sat, 22 Jun 2024 22:27:38 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52cd6432006sm657651e87.194.2024.06.22.22.27.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 Jun 2024 22:27:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/2] drm: fix two issues related to HDMI Connector
 implementation
Date: Sun, 23 Jun 2024 08:27:34 +0300
Message-Id: <20240623-drm-bridge-connector-fix-hdmi-reset-v1-0-41e9894dcdec@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEayd2YC/x2NywqDMBBFf0Vm3YE0Pij9FekiJtc6CxOZiAjiv
 3fo8nAP91xUoYJK7+YixSFVSjZ4PhqKS8hfsCRj8s53bvAtJ115Ukm2xJIz4l6UZzl5SauwomJ
 nF/Eawuz6NgSyp01hxr8yfu77B2jEylF1AAAA
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1068;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=bUab8eZo5zd7axeNt57zTJfAqfjDozucTQKMhG84tSw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmd7JIkQxHOJAfU5GQNKIRtya8MW/CuGqj9HEGw
 MkLtjzsA5+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZneySAAKCRCLPIo+Aiko
 1du4B/0SzvgMTO6mpyNVCqXIulJxkFeWxTc7+c3rJic556COfQByFQ6u1NMyE3tFVaUn5l+HLkV
 eFFObocMqlbzxkd2RE7sRxLdbr6P76hGaVjrwXs4s6E5/VplzcjgRikfLfqXGZLh8rX/Gg4fLRi
 Z4BPZwUuiYWp4XJs0ncgMmnZ4ZGGg2xQx8p4ovicyGfW8JI1qaHrdOe/HM3NsG1N2vxzTqeTc3w
 X/1yXwitAlCKHl8k3/cEPUSBfWyHBiQmmVeftefDENcct38Q1o7Xn6bWBqzmR/5tk04C7riFpfP
 OujDtvvsvm5LIa5ebgiH0GFXx11IjtA6q5AsguZJmYYlO9CI
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

Running IGT tests on Qualcomm Dragonboard820c uncovered two issues with
the HDMI Connector implementation and with its integration into the
drm_bridge_connector. Fix those issues.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (2):
      drm/bridge-connector: reset the HDMI connector state
      drm/connector: automatically set immutable flag for max_bpc property

 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 21 ---------------------
 drivers/gpu/drm/drm_atomic_state_helper.c       | 21 +++++++++++++++++++++
 drivers/gpu/drm/drm_bridge_connector.c          | 13 ++++++++++++-
 drivers/gpu/drm/drm_connector.c                 |  5 +++++
 include/drm/display/drm_hdmi_state_helper.h     |  3 ---
 include/drm/drm_atomic_state_helper.h           |  2 ++
 6 files changed, 40 insertions(+), 25 deletions(-)
---
base-commit: 2102cb0d050d34d50b9642a3a50861787527e922
change-id: 20240623-drm-bridge-connector-fix-hdmi-reset-0ce86af053aa

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

