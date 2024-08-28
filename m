Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A68C962B0D
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 17:04:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B50B892D2;
	Wed, 28 Aug 2024 15:04:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iNN97BKV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB0D4892D2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 15:04:26 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-428119da952so60335725e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 08:04:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724857465; x=1725462265; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=UGXjhFkocI+i08oV1NJCziTFyjsWoKBmQLNW2boCzlM=;
 b=iNN97BKVJT+iRnI2htJJzlyyA9H9lVkv1x5Ofv6+GLMzcZTYI6MCpbaHdl4MHlhWX+
 IAiC+H/cc513LS989xW+e6g7Badyz7dhfgmG+I6Vao7RpiFjQYB8efEnxGr6iASNkSu9
 GgKAsqnmuGgD/MtoT0e7y70CZpKmRlznreNUrzoQkEvPEjUmYPyzAoH+WhXOCrHnwHBe
 AZhdLbc+XQFESi66Btp2a0Uurp5XzWiutNBlrolPxL6/iLDfwpeEdl/9QmF6PLyJSlsC
 aK5LEimX/uM7s9paIo0oGx42pU6jXz7Wu7AU01GYwAb/i/YGx+fMcjPk8BNN1q0C9vL0
 XdCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724857465; x=1725462265;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UGXjhFkocI+i08oV1NJCziTFyjsWoKBmQLNW2boCzlM=;
 b=IBf5xuXuB2D/8DQosaDsiT4X/+OIrCx1pO6qGEl96Eey3tqPXeGjYq9W5iNg3VTfpB
 hMo0AwTGMcBvcKDaOXoDBFakwmEV1WFcm1Mp03pD1fiqnRPcHlmKnqFHHUWv/rajwPsV
 WmsMxBhhHiCfWaOvBJml+YziKxEMI0w9UofodRdq/kBRwV1aLzjDirEetrdqNqwm8gL0
 rFp9+kRjFHGRz8vq+Hy3QRudFcADIFsi0C2Hm/13uUtRNZFCOp0PXU21/BFWVrpKD7dX
 BeC7k3v0UT1kbJasiVi4C9wkbCJYZrVyp1ApfQ5LAUYYvukFYFmLE19hsn6WxqsWAqiM
 K5jA==
X-Gm-Message-State: AOJu0YwYPq8RqOxfobM3fD18+fGEAyC6Kzs753k2tIpOOv44mYAaX9PW
 UnW4f7deaBRJk/oZoWLZ9ZLkqLIaEfzARr8RkmxQ5xC9jpovbyJPCCCWZ9m8hcA=
X-Google-Smtp-Source: AGHT+IEvY10F1sZtPNF2MFzI/j5iEbNVcW6c+5O3H8h8FcEaTMnSUvyk6KIx7czphb4GnqAi796tcQ==
X-Received: by 2002:a05:600c:1d17:b0:426:64a2:5375 with SMTP id
 5b1f17b1804b1-42acc8d5247mr122882035e9.1.1724857464501; 
 Wed, 28 Aug 2024 08:04:24 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:8261:5fff:fe11:bdda])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ba63acd66sm24079315e9.23.2024.08.28.08.04.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 08:04:24 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v3 0/2] drm/panel: add support for the BOE TV101WUM-LL2 DSI
 Display Panel
Date: Wed, 28 Aug 2024 17:04:18 +0200
Message-Id: <20240828-topic-sdm450-upstream-tbx605f-panel-v3-0-b792f93e1d6b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHM8z2YC/5XNSw6CMBSF4a2Qjr3m0gcPR+7DOCi0hSZImxYJh
 rB3CxPjTIf/GXxnJVEHqyO5ZCsJerbRujEFO2Wk7eXYabAqNaFIOZZYw+S8bSGqBxcITx+noOU
 DpmYpUBjwctQDmJwpIUyjOOckST5oY5fj5XZP3ds4ufA6Tud8X//z5xwQpOElY3VZMaGugx1lc
 GcXOrIfzPSDVrT6DaUJRYmsVlhwnbMvdNu2NxGdgycsAQAA
To: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Doug Anderson <dianders@chromium.org>, David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1531;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=k90FJiYtmg/K/XsmEGN56aQzqI5ne2AB4Kxge98c3Tc=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmzzx12kbEcQt53kUvBa/axB+YrYmKf6QAEDSz71S6
 N8qrzISJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZs88dQAKCRB33NvayMhJ0UqtD/
 9DG3EG0GP+IOqYocy50ljwQpd+mT48OeDUFV5TCYjHvyILAwgH5aQ5jrqjEl9Fiq0NpaBd3psirbTC
 JbQIQl7MMB2CkvwUXAafkSGM+BKlnxuGCNnTOSCYpIotbmlfQQiuFqrJQTKHZpKbsKWFXquwIZnEXq
 p6JwBy+e6nUba4jO+bA9o+uEvvy1zjZTN4mrboAmhbt7ebGEOANHbg563GNreKE+OaPkQUpaD1urLe
 a1ObNd6wpFMu9KQBOO9ag98nGQnk9CuU47293iU55bt6piUMOhTXN6rcUTF8RUElfYxS4RiJKXNPoV
 2XUy4WPwzMb2pB7Rg/rkGwYGu4XX9WjPcKLrrYHZUz/CndQ6chK9Tv1cQzupATezE62mtnv6LaCYiJ
 nHXvT0GoVnUYN5TO05E6M8OcsPf5bJKM86tl5/MI+Erp1A3ksY5d8kIHJn2tmzAB1la7qq3yJXMS+8
 IrTneMAugBpy0nILH94NZJfWHhOMq13ftc7WZTCSKnW0x48VJTvEKyXK/BDydq1G5+wOh4lQ0Fx2NE
 QQs2bfVUQMqwko0FjOudT2wsKHfTXaMsGpVyoJlg/jmVGErLFHzpXdKyFOQNnn8fBonnLv6wDeCOSa
 lTH1xPKmuAUM8W96spgFEm4XgAH6IWxaqpWflGXfejytQnzrvAtA6dVssTQQ==
X-Developer-Key: i=neil.armstrong@linaro.org; a=openpgp;
 fpr=89EC3D058446217450F22848169AB7B1A4CFF8AE
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

Document and add support for the 1200x1920 BOE TV101WUM-LL2 DSI
Display Panel found in the Lenovo Smart Tab M10 tablet.
The controller powering the panel is unknown.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
Changes in v3:
- switch boe_tv101wum_ll2_off() to void
- add Doug's reviewed-by
- Link to v2: https://lore.kernel.org/r/20240828-topic-sdm450-upstream-tbx605f-panel-v2-0-0a039d064e13@linaro.org

Changes in v2:
- Collected bindings review tag
- Driver changes:
  - reorder makefile
  - reorder includes
  - switch to devm_regulator_bulk_get_const()
  - remove useless dev_err()
  - add comments why we ignore boe_tv101wum_ll2_off() return
  - add comment why we don't set bpc
  - fix MODULE_DESCRIPTION
- Link to v1: https://lore.kernel.org/r/20240709-topic-sdm450-upstream-tbx605f-panel-v1-0-af473397835d@linaro.org

---
Neil Armstrong (2):
      dt-bindings: display: panel: document BOE TV101WUM-LL2 DSI Display Panel
      drm/panel: add BOE tv101wum-ll2 panel driver

 .../bindings/display/panel/boe,tv101wum-ll2.yaml   |  63 ++++++
 drivers/gpu/drm/panel/Kconfig                      |   9 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c     | 241 +++++++++++++++++++++
 4 files changed, 314 insertions(+)
---
base-commit: ef14a2e943460970c95f7936fb3c26fcb223f76d
change-id: 20240709-topic-sdm450-upstream-tbx605f-panel-f13d55fbd444

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

