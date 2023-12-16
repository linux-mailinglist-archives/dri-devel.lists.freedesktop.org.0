Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2024815CE9
	for <lists+dri-devel@lfdr.de>; Sun, 17 Dec 2023 02:05:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1C5310E3CE;
	Sun, 17 Dec 2023 01:05:06 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5223510E3CE
 for <dri-devel@lists.freedesktop.org>; Sun, 17 Dec 2023 01:05:05 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-3363aa2bbfbso1765684f8f.0
 for <dri-devel@lists.freedesktop.org>; Sat, 16 Dec 2023 17:05:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702775044; x=1703379844; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EORJjch+kRHuve9tu+TzRixoDnkZ1DPCxZXBpooX2uA=;
 b=hVkHuBeu27Y4PvLBFr/UEVVdIsXq5VMrbHtNpVw77qUYyJXdLREWHh1ttPaP0PCZi5
 KknaVLsvCBZzdhb5GLNW7EXBkm2cEj+lb6tq1RtfKtfI5B+NoNeZPM4la1xxHaTdhuy+
 sZlmH+6jkbHqd+JEnX7Dx+Gs1aAoxlanC4V+Yf+PqdUU0JL5Pm78tEhAedOSqpDu+0MY
 YV5aE5e8mRJtHq8alIylCtrpPnYtzS7yGG62qgCHzkHsAiBg41rxFxmWFr6+Qe2RaU0Y
 1oIZrgPe1rSvdPBOZtlw+fnarVvnoRJJnaBaZ8FYh26V+uGsNCAKBN+4d/NPWUB4eG4W
 eJvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702775044; x=1703379844;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EORJjch+kRHuve9tu+TzRixoDnkZ1DPCxZXBpooX2uA=;
 b=kao+y1HeSm8VAlwl8j3/8mPjp073Ya5w7hKypkh85anJHOh6dcGyszUd+962d2Hrc5
 NUsXrNkaDSyw1bvLdFVudZzVJr81b2M3O7KBkxhSG6+y1lFarC180YvT7GpcEpN8VPbD
 qLMenW1/IpLCpv3r1VMeE+4LfxyD/i558At4fuL5S0hwP9Y9+/F1IoVGYPEK2xJn5X7y
 GrU0rAIUwtQAwPoL3HWmeMYeObHaWUmb0i9Bjtdka22Hh27eWknsVi6Xz2sgpdSEnNOK
 BSHmCATqBTpbcBmMAX33WcI99GVHp4cRfbthYZSNtd+2+9C2SrPMCAbsX41fdsPQUkRb
 Btgg==
X-Gm-Message-State: AOJu0Yz5KwAVEyxpUAmzJ6W5fGoRSp/LeKGm4G7o51UkIvbcsXbpdHuO
 lu/7HKJWsP1Q/M8JxaUhaFAjMwCWY47mi1WRvx4=
X-Google-Smtp-Source: AGHT+IEnQkmrsNJ9hVsfbCKkIsEeu+nZ5bTu4VgzAc0L6WjUXz9o6uCxqdywfG2uf/4EhzNmoYDb+Q==
X-Received: by 2002:a05:6512:ba8:b0:50c:d30:3a05 with SMTP id
 b40-20020a0565120ba800b0050c0d303a05mr8894366lfv.25.1702771152155; 
 Sat, 16 Dec 2023 15:59:12 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 v11-20020ac2592b000000b0050bfda10057sm2506647lfi.85.2023.12.16.15.59.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 16 Dec 2023 15:59:11 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/bridge: properly refcount DT nodes in aux bridge drivers
Date: Sun, 17 Dec 2023 01:59:10 +0200
Message-Id: <20231216235910.911958-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
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
Cc: dri-devel@lists.freedesktop.org, Luca Weiss <luca.weiss@fairphone.com>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The aux-bridge and aux-hpd-bridge drivers didn't call of_node_get() on
the device nodes further used for dev->of_node and platform data. When
bridge devices are released, the reference counts are decreased,
resulting in refcount underflow / use-after-free warnings. Get
corresponding refcounts during AUX bridge allocation.

Reported-by: Luca Weiss <luca.weiss@fairphone.com>
Fixes: 2a04739139b2 ("drm/bridge: add transparent bridge helper")
Fixes: 26f4bac3d884 ("drm/bridge: aux-hpd: Replace of_device.h with explicit include")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/bridge/aux-bridge.c     | 2 +-
 drivers/gpu/drm/bridge/aux-hpd-bridge.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/aux-bridge.c b/drivers/gpu/drm/bridge/aux-bridge.c
index 49d7c2ab1ecc..54d721db0ea6 100644
--- a/drivers/gpu/drm/bridge/aux-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-bridge.c
@@ -57,7 +57,7 @@ int drm_aux_bridge_register(struct device *parent)
 	adev->id = ret;
 	adev->name = "aux_bridge";
 	adev->dev.parent = parent;
-	adev->dev.of_node = parent->of_node;
+	adev->dev.of_node = of_node_get(parent->of_node);
 	adev->dev.release = drm_aux_bridge_release;
 
 	ret = auxiliary_device_init(adev);
diff --git a/drivers/gpu/drm/bridge/aux-hpd-bridge.c b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
index 1999a053d59b..bb55f697a181 100644
--- a/drivers/gpu/drm/bridge/aux-hpd-bridge.c
+++ b/drivers/gpu/drm/bridge/aux-hpd-bridge.c
@@ -68,9 +68,9 @@ struct device *drm_dp_hpd_bridge_register(struct device *parent,
 	adev->id = ret;
 	adev->name = "dp_hpd_bridge";
 	adev->dev.parent = parent;
-	adev->dev.of_node = parent->of_node;
+	adev->dev.of_node = of_node_get(parent->of_node);
 	adev->dev.release = drm_aux_hpd_bridge_release;
-	adev->dev.platform_data = np;
+	adev->dev.platform_data = of_node_get(np);
 
 	ret = auxiliary_device_init(adev);
 	if (ret) {
-- 
2.39.2

