Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5065A71723C
	for <lists+dri-devel@lfdr.de>; Wed, 31 May 2023 02:03:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C6EF10E44D;
	Wed, 31 May 2023 00:03:14 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 012EC10E449
 for <dri-devel@lists.freedesktop.org>; Wed, 31 May 2023 00:03:05 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4f4bd608cf4so5936418e87.1
 for <dri-devel@lists.freedesktop.org>; Tue, 30 May 2023 17:03:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685491381; x=1688083381;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SyeYlb9FLXi+8y9gS/n6CffUDb/849CEa87VxzBlg+w=;
 b=aQR2hrWUh8jQdjkkeYkALnCMN2H/8kl4x9v81f8W6hYJr8cl8C0APD2CvPDYkYeruG
 JnVmP8FOa3p+rbrwqYNBi+OLAFIXAhGJu3zb9xOveQaH+ocTVT0cj6iPuxx9n0o/LE2X
 Vl1rJx+ZfYSkQMliPlX4rS0AiFhcBXPY9YpkZuYSyERihibvcYbCxux2K037IzuF6zQk
 tmHM0MME/DwF8RNwQ8CFKgyyRn20jw+/XGaAKalqjBy3nRhZIuYqXkZciKidJutv6OjW
 kU6l3XTtNbKCm9wjRzSCjRROVBxlb/gLTVonT/YRaAaKMIlkyUL8YoizTb/nq0dLmZ+i
 dISw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685491381; x=1688083381;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SyeYlb9FLXi+8y9gS/n6CffUDb/849CEa87VxzBlg+w=;
 b=RW2pEvJ/yRGNoYozd5rhGSiZ0pWdfpQg1MkE682RJcSKxGk4dCKzmtH9KA2Qf3j/z1
 /lcpzv1fs7WUevm99GZmDtWLkrUtardMOWNlZuKjYK9Ic/hCLo3iAZvGzSnMGVH7m7fr
 JfcMbqHkka1AOsJJv2qxr2SYXOIgAPwgYNX4nRrU/AmxmRaQ8iYmVAqWV7xZrE5e+mLW
 0Qe4Dp0o5kVwxh51iqPtT0Lwhk3rO+Ak/YkYplLBsXcWySuH3GCyhqeiWfJUDWziaadD
 T7agGGpQt/adczOVINtoQxiIGm81/2R0e73Vm2q4dOQ/Knai9xQoSax8WnC/tCCGmNRS
 Kj8w==
X-Gm-Message-State: AC+VfDz92SAAJUHo3ltOv/qP4gpeEgVTWKsT0y6u1P+xwFIpoF5guMaL
 gOCTTeMh2qxN+wZZwAzludqVjg==
X-Google-Smtp-Source: ACHHUZ7TMrlUtUUdEq6/7cfDRR412NBdz8sutbip3bWYLwkw/XFfA6fK+rVZefHCVZdbxu5L8cdiUg==
X-Received: by 2002:ac2:539c:0:b0:4f4:df75:1f80 with SMTP id
 g28-20020ac2539c000000b004f4df751f80mr1295510lfh.5.1685491381405; 
 Tue, 30 May 2023 17:03:01 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::ab2]) by smtp.gmail.com with ESMTPSA id
 d30-20020ac25ede000000b004f13eff5375sm490388lfq.45.2023.05.30.17.03.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 May 2023 17:03:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH v3 0/3] drm/bridge: display-connector: add external supply
 support
Date: Wed, 31 May 2023 03:02:56 +0300
Message-Id: <20230531000259.3758235-1-dmitry.baryshkov@linaro.org>
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
Cc: devicetree@vger.kernel.org, freedreno@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On some devices the 5V pin of the HDMI connector and/or the ESD
protection logic is powered on by a separate regulator. The dp-connector
for such usecases provides dp-pwr supply support. Follow this example
and make hdmi-connector support the hdmi-pwr supply.

Changes since v2:
- Changed to use proper supply name instead of hardcoded "dp-pwr" (Neil)

Changes since v1:
- Changed the pin description to HDMI +5V Power
- Renamed 'connector_pwr' to simpler 'supply'
- Extracted the common supply-handling code for DP and HDMI

Dmitry Baryshkov (3):
  dt-bindings: display: hdmi-connector: add hdmi-pwr supply
  drm/bridge: display-connector: rename dp_pwr to connector_pwr
  drm/bridge: display-connector: handle hdmi-pwr supply

 .../display/connector/hdmi-connector.yaml     |  3 +
 drivers/gpu/drm/bridge/display-connector.c    | 61 ++++++++++---------
 2 files changed, 35 insertions(+), 29 deletions(-)

-- 
2.39.2

