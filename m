Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3F05962348
	for <lists+dri-devel@lfdr.de>; Wed, 28 Aug 2024 11:22:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 793BE10E4E8;
	Wed, 28 Aug 2024 09:22:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="KS94oqnW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 46B1C10E4E8
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 09:22:50 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-42816ca797fso58282505e9.2
 for <dri-devel@lists.freedesktop.org>; Wed, 28 Aug 2024 02:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724836968; x=1725441768; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WC0YyaWNeGaRZmj/c+pPkh76XagmEuPA1fGxZmPr34E=;
 b=KS94oqnWcthM36UkWDdBNvE6Y1hC8/gN8JmTvGoX+w97Duwe47Y+GkwMhqRpiN6dn1
 wXMT/MlVh351kTECW8LfbTJZvJJpM2T/h5zSy1y47rC6JYoEnlO+RBP88JnCmUJMUISx
 nzjVKsSsEN5LAqBiamDN7ps1aLAA5NDF1t+Yd1jSPAqMv0cnqIAYBMMExjQrXWsdMjfa
 FZT/i4NzuZ9Mefl2UVGYQBCiAbZ8B2SsG4UlL9WPiavqqedPmKS1AnfoyT+9zLFTUBqr
 bZ+tcWfVxFfMPAfiUJqzTjGizcqKy0RC+vuNDq7MXuf1RiSoZ7yfsw9Mwe6kTCiAuQMi
 T3Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724836968; x=1725441768;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WC0YyaWNeGaRZmj/c+pPkh76XagmEuPA1fGxZmPr34E=;
 b=AQ1ypB+rcEJ93w4xSTfoSzn5GHMp1WwK0k1UK2qmuaA4t2wnS3/0QPoMAEIdxVsQCW
 BdxaHlA2IBLBscm1kpiDX3Nq0l+NLUR3lJC5BN2PHQpRrf2uH/RSojg8GSXktQYBHNou
 Q0c/8L2+MPKT5W535k69VLh0nwv1XWyZvFOtEPUxf1QbHZL2rgdG7XsP2iTd6CRvWMbi
 n8R4ZnBJw9nyGMYhTTRxLL/+1JxkqE0ZzosW93mZf2Kirgqp30SU/Ne/5mwc92L0x4Rk
 RqXlefUlATIMA3Q7Xdz9nJO6NtxOECll+SHiyBRlqFbGKJ+ku9eWOaMC2UXIXTRitF5C
 TfOQ==
X-Gm-Message-State: AOJu0Yw46RBAtvujb8O4nMILGwkQN8Mrw6rcZuFRElmOMSR5XZORjJLV
 W9J/qYfNKRoSJ26Gl7bGL0tTbJ171ML/yGC7LIOuEoiOiL3t1xX1aFs4gq/gVDM=
X-Google-Smtp-Source: AGHT+IFX1FA9HUNp1LKGe/n4Z9bMvhLEG2OIuGgo1b76+7MtrQQtPNCYfn0O1mpiHQz4kKaPs1hLKg==
X-Received: by 2002:a05:600c:4f94:b0:426:6eae:6596 with SMTP id
 5b1f17b1804b1-42ba66ab79fmr9245115e9.25.1724836967925; 
 Wed, 28 Aug 2024 02:22:47 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42ba639687csm15002435e9.8.2024.08.28.02.22.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2024 02:22:47 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: [PATCH v2 0/2] drm/panel: add support for the BOE TV101WUM-LL2 DSI
 Display Panel
Date: Wed, 28 Aug 2024 11:22:39 +0200
Message-Id: <20240828-topic-sdm450-upstream-tbx605f-panel-v2-0-0a039d064e13@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF/szmYC/5WNSw6DIBQAr2JY9zXIp9aueo/GBQroSxQIUGNjv
 HupN+hyZjGzk2QimkQe1U6iWTGhdwXYpSLDpNxoAHVhwigTtKEtZB9wgKQXISm8Q8rRqAVyv92
 otBCUMzPYmmspba+FEKSUQjQWt/Py6gpPmLKPn3O61j/7X3+tgYKyouG8be5c6ueMTkV/9XEk3
 XEcX/VzvPPXAAAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1331;
 i=neil.armstrong@linaro.org; h=from:subject:message-id;
 bh=NcdndycIESQOX9Mj7FCc+DKu0ULe0CFRP323XsfVbhg=;
 b=owEBbQKS/ZANAwAKAXfc29rIyEnRAcsmYgBmzuxlasynx9hKB8kvoIGry6jIcn19wCT4NazNTCPX
 wq2sHvOJAjMEAAEKAB0WIQQ9U8YmyFYF/h30LIt33NvayMhJ0QUCZs7sZQAKCRB33NvayMhJ0QTmD/
 4iQlb6f27Ft2xA0ojZIld1xOXn7lRvII1qRGlqa35D16tzKpsi/lDpt8eRbGKWw/+mC1+YfpSTtAIi
 8T71/D6XPlqRMxvL6TNBfgO1JkRP3zE5UFMd/tPu/w/7klUxhWQZEAUTLUbf6mwCho+eCHvU8RwIeO
 YBMl0mNUcGTEPA2+inkVMlRYmpZHMSI9AyetbMKovYT0Nf+CDkjlLxuoN2Hccaz3jItvL+n5S5cNud
 lsBkSbBqyL/XoD8/G3XQ1jOUoK6ZfvxZpxv8n05Fo4Z/tyEM6HPRi1Cg8TQRUYhWfrjWAOlRUgm19B
 0GydYcbRapumLufZ1R7jGcjLkc6d7uwBb6+sobOLdZgCG+PywBvpDHFJNQunPFmCaUc3OE084J9uW4
 P0Nv4Swiaw7ifEgY0oJc8zzqDctVPPCQm6rxGwn8QtFeA4FRr/vVandDEuQXzkgUnCq5Wap/giOdt+
 F1IPoTEQwJS5x/5TlyfVtUVJx10i9XxdMlsC8ootZt17dHannPhaN60vp/eIWygudS5xhkDnXGxeWP
 xg/nzhc4+HB5NNNSH4kHckTygowuQ+6KnrIKalMcSnk5nNfn5VZ40SvwW2pP1GI3Le6NzTUSY+8NTk
 ibCuvSsfAx642c7JoPjR6tbcRZeWFsllG8wIkmQQu04J5caYK2q4tXPQXAew==
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
 drivers/gpu/drm/panel/panel-boe-tv101wum-ll2.c     | 243 +++++++++++++++++++++
 4 files changed, 316 insertions(+)
---
base-commit: ef14a2e943460970c95f7936fb3c26fcb223f76d
change-id: 20240709-topic-sdm450-upstream-tbx605f-panel-f13d55fbd444

Best regards,
-- 
Neil Armstrong <neil.armstrong@linaro.org>

