Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 74B989A4818
	for <lists+dri-devel@lfdr.de>; Fri, 18 Oct 2024 22:34:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 815B210E982;
	Fri, 18 Oct 2024 20:34:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="I95QQOv+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F06F510E982
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 20:34:33 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-539f72c8fc1so3009571e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Oct 2024 13:34:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729283672; x=1729888472; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sCcPwV47XH0yJdbksS/rJtyE3ZkZ9IgFn3oQZBYAYBs=;
 b=I95QQOv+Ju3ouSlKRyowJuhBPVu7nt7lmMwwjxLuGCb4O+Pv156AKUhAojjDS3U7PR
 eNQmqgQblRS07GcyxfjRYmAQ59anFvvmrxzised65GtNI6ZBEUCrUQA3ikUvfUTPM2z6
 Rg1ti244SppnF5R2uNDdKaIcuBqcgcGG3TxIWbKTSaKKtGWmlNyVAMYSvl8/x8kXn8Mv
 ChGnV1WO4mb2Wu8jWcTCc58uxM8o4ltSNkCOX6b9Az/Cns/+JDWypf7EOtuT9vDkj2Ac
 fTI/xEW9I70R8MpSkAGToln0zQVqiHDOizE2Lnry8du4pZROc+A0FJXLqYf8gc5jJ0Q/
 t9ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729283672; x=1729888472;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sCcPwV47XH0yJdbksS/rJtyE3ZkZ9IgFn3oQZBYAYBs=;
 b=KQf/aIVO71C+E3cOF0wyEwFlQb7lQeyQRKpeg9lWFwQEgyvu96k0vqZBS4HdTVqBSk
 eZn1r7y29ccqiiX8W+re1xBA64VMV09NJzvHu02jZCAedzt1TVvQnLvvGSKzLSUwFdns
 A7rilJXs1c+w9qV781o8Svf3cMpPOtzwJle18GOkBJpQ0Zphiqha1OpkRUFYUuP6653V
 xHI/+pK55z3OkWL/DRMdEuociTFZZBIH5LHBQCguwxj3Rjm81nHJVWdln8cbdkrafFbI
 t/QOv95lCfAxqy4DI1FFRKodSa2gmW/b7ncEBPDcG1SZ84lujH0xKl51OlzENsT4ywaT
 g0bg==
X-Gm-Message-State: AOJu0YzYhhIolfZR679CviwYeneLE2cEMHkSNnvFlvQCdLXPTHTPWMzD
 ythEHWcbiqY2w7H6Msi6hskg+w3F4Y9nMMHXn6j1JG39C7pXIb9eA5EtbxpCtYw=
X-Google-Smtp-Source: AGHT+IELPtenzGW4LLaGWUAYzBlOsnHcuhLHJ49lUB7TfHK/mvIGRg0GSftC9WVPQgye44/HgrcATg==
X-Received: by 2002:a05:6512:1387:b0:539:d428:fbf2 with SMTP id
 2adb3069b0e04-53a152170ccmr2519278e87.13.1729283672001; 
 Fri, 18 Oct 2024 13:34:32 -0700 (PDT)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53a151f0e09sm314047e87.146.2024.10.18.13.34.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Oct 2024 13:34:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 0/6] drm/display: hdmi: add drm_hdmi_connector_mode_valid()
Date: Fri, 18 Oct 2024 23:34:18 +0300
Message-Id: <20241018-hdmi-mode-valid-v1-0-6e49ae4801f7@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAErGEmcC/x3MQQqAIBBA0avErBtQMZCuEi1EpxxIDQUJwrsnL
 d/i/xcqFaYK6/RCocaVcxqQ8wQu2HQSsh8GJZSWQhoMPjLG7AmbvdijteS0VmYR0sGo7kIHP/9
 x23v/AGP7nrlhAAAA
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1527;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=NVgLRwt8YngxLk2l766d34PGqOxCoja034TmXCo3gEs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnEsZWTzWWmG5oZnAvNyyF1pWnZXCGdwJa35Rle
 GgQVwoA06yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZxLGVgAKCRCLPIo+Aiko
 1YBNB/9soM6Y9tnx5H+1z9yVAqXzFA2tjpHv/OUSQ/QJrgTGwHmMNVvs8UGD+b5nNxwZIi06/eG
 mlCQ67VnWcoy9ujIYfTcMYLozAEAZ01tgSB9DR7HObujc/XwiC+X8gWLQdPxV4FJ9tNHy/KCzr7
 dujoIoUyiNpD4N5o+67DuTbxTptGAwxhyYT5pP9qVNFXGom7P2bmDPQzaWzVV6tyhcKI1tVTy3b
 liBsVRSceDQf4G/OX/tYWsOxp4ZogmNzFLtny0b0eMGaWJkGgLLn4AnwgMP/LuJTbA4wfa5X1bt
 ZfojiYFL+0Hgx2XNPRHTvRLcpebRRnTE6IML2YkVsDihRZan
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

Several HDMI drivers have common code pice in the .mode_valid function
that validates RGB / 8bpc rate using the TMDS char rate callbacks.

Move this code piece to the common helper and remove the need to perform
this check manually. In case of DRM_BRIDGE_OP_HDMI bridges the check can
be dropped in favour of performing it in drm_bridge_connector.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (6):
      drm/display: hdmi: add generic mode_valid helper
      drm/sun4i: use drm_hdmi_connector_mode_valid()
      drm/vc4: use drm_hdmi_connector_mode_valid()
      drm/display: bridge_connector: use drm_bridge_connector_mode_valid()
      drm/bridge: lontium-lt9611: drop TMDS char rate check in mode_valid
      drm/bridge: dw-hdmi-qp: replace mode_valid with tmds_char_rate

 drivers/gpu/drm/bridge/lontium-lt9611.c        |  4 +---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c   | 12 +++++-------
 drivers/gpu/drm/display/drm_bridge_connector.c | 16 +++++++++++++++-
 drivers/gpu/drm/display/drm_hdmi_helper.c      | 25 +++++++++++++++++++++++++
 drivers/gpu/drm/sun4i/sun4i_hdmi_enc.c         | 12 +-----------
 drivers/gpu/drm/vc4/vc4_hdmi.c                 |  4 +---
 include/drm/display/drm_hdmi_helper.h          |  4 ++++
 7 files changed, 52 insertions(+), 25 deletions(-)
---
base-commit: af44b5b5776cc6ac1891393a37b1424509f07b35
change-id: 20241018-hdmi-mode-valid-aaec4428501c

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

