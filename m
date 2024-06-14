Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90339907FFA
	for <lists+dri-devel@lfdr.de>; Fri, 14 Jun 2024 02:02:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F07E810EBEC;
	Fri, 14 Jun 2024 00:02:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eI5Sifgh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com
 [209.85.167.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0017110EBE0
 for <dri-devel@lists.freedesktop.org>; Fri, 14 Jun 2024 00:02:29 +0000 (UTC)
Received: by mail-lf1-f50.google.com with SMTP id
 2adb3069b0e04-52bd48cf36bso1979852e87.3
 for <dri-devel@lists.freedesktop.org>; Thu, 13 Jun 2024 17:02:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718323348; x=1718928148; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QW5kIhlLtmN+LhKlOvCDBjLYeT1B6YXu1fF/8F3k3UE=;
 b=eI5Sifghw77NsI4ODoE2WiBT3PZ4UlGqf3SHhcmkwl4JEOlr65/ha+cdKpp0eaubKA
 Tvt/f1m7EF7HugHcS3OO6J2eCkB5/HAVqMbe8N4vLq+FILkPH25Ua8SM2aKzywnMj2l8
 a3qQFWIWg/6Zk31j1+fVVRyhAtCOzVr/shQ9NEos6gCi02WldckDjLs0xhf3PnPcQ4p/
 TEOoic6Lfi/wpRAhzkSC2uPwm5hiyfIkyZ9ACh11rx2DiJz7NMBsN8B+rk/fQfhB7cik
 gXdOorMsl1cbSfXDAfoIjflfIaW6LcrrXX5LD0Wg2wxKkIGN626J+o18Rkg82SxXQgfZ
 Z6Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718323348; x=1718928148;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=QW5kIhlLtmN+LhKlOvCDBjLYeT1B6YXu1fF/8F3k3UE=;
 b=Si9sDnbiQEAZHmI01J3at9eOnLswCxWna/jIL/6+GYbWfuvAQ4QibohL2q9o4o35Cf
 AocaU6cSmZrUVu5o0aceA/zp/qPiv3ixDPv5sC3Rr3ZVzIl1aOiK5s+8013LHtQZTl8N
 RTxz3fGCWCkbBmkXz0a3sVEi+bwzAXX4FRr3jgmBHzqSPVdLKgrVlS7qaGQ9RyuawzTi
 rKl/+xNEWLUwtLM91g/+/54OZ17NjV9xW5qx5I+rccxGapSPJ4UTaLTY+CyWQrG4M3kM
 mz3HWTs9Ozv6H34p5slqkLnZFngpknzwTwkdMTOi7WWu4504xJ/TjSRW4XUEGsXw5Eby
 GH/Q==
X-Gm-Message-State: AOJu0YxINCiCo6N+OQ7cTPyHylmdoDT3OcRpCHTXb97pqwa7SgBcSMr7
 pdU9BRhvPBIixxS9+sENdHFLW4ddo+v3aj6mjdNwUq2DuN4iW9sFpzevQm7CiDo=
X-Google-Smtp-Source: AGHT+IGQH4BW4y0WPnlc1Nl7pxTM2sMPBBUkuGMWSdcd4CZu8tjjNu987+DcRlYaZvTaev4pZRs+dQ==
X-Received: by 2002:ac2:5a4b:0:b0:52c:884f:5a31 with SMTP id
 2adb3069b0e04-52ca6e6dc0fmr757866e87.30.1718323347843; 
 Thu, 13 Jun 2024 17:02:27 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52ca288804dsm374797e87.262.2024.06.13.17.02.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jun 2024 17:02:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH v4 0/3] drm/panel-edp: remove several legacy compatibles
 used by the driver
Date: Fri, 14 Jun 2024 03:02:19 +0300
Message-Id: <20240614-edp-panel-drop-v4-0-4e0a112eec46@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIuIa2YC/3XMSwrCMBSF4a2UjL2SZzWO3Ic4yLMNlKSkEpTSv
 Zt2VCkOz4Hvn9HkcnATujUzyq6EKaRYBz81yPQqdg6CrRtRTDkWlIGzI4wqugFsTiNgrBRlUjP
 TalTRmJ0P7y34eNbdh+mV8mfrF7K+f1OFAAHMhW2pIMRieR9CVDmdU+7Q2ip07+XBU8DgjTdcX
 Ly5WnvwbOcZOXhWPTfyqqmWwjH145dl+QKrLBKBLQEAAA==
To: Douglas Anderson <dianders@chromium.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 Jeffrey Hugo <quic_jhugo@quicinc.com>, devicetree@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2848;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=exeXDKeS5xI4dB9WYztmnec8kaBCqKApV9iGGnDjUeE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBma4iR8cQ2xeXd5K2/fhbfYL/Xxzbh7W+evYq1e
 9/805a2cw2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZmuIkQAKCRCLPIo+Aiko
 1WJECACy1Ogxdb/xLNEZk8RuzOmtxuBRF0sxevXZGZRGVis66bQoD2iWRfrVXrkWVh1lcLv5x4q
 uluGvNZ9O59OlSxWI8gvA6rUXbhT4v3ED+qH34ZrCdqWL1gWUWP95Slzh1ZxczjJao1jYHhLzjh
 c7VDu3zsm4u/R2R17xvdkzMUCDCt/u+/eGQiRoFJdFw5ZvvZdbQoIupCEYec2awpR3JrtqAq5pA
 eQnMH27+zXQXwzLyr+QdSZz9xXyz3q1OJJYLiorjcvghtKNITwo2yFbAiVQK+C7WD4GqCfsiDTX
 9gqk8AmBFWr0Ke/UPEK6MyA7mQNWoonPtOknG8IMFzIM+nlH
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

To: Douglas Anderson <dianders@chromium.org>
To: Neil Armstrong <neil.armstrong@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
To: Sam Ravnborg <sam@ravnborg.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
To: Maxime Ripard <mripard@kernel.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
To: David Airlie <airlied@gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-rockchip@lists.infradead.org
Cc: Jeffrey Hugo <quic_jhugo@quicinc.com>
Cc: devicetree@vger.kernel.org
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Changes in v4:
- Rebased on top of drm-misc-next
- Added devicetree maintainers to cc list, missed them for v2/v3
- Link to v3: https://lore.kernel.org/r/20240531-edp-panel-drop-v3-0-4c98b2b95e3a@linaro.org

Changes in v3:
- Rephrased the warning comment, following some of Doug's suggestions.
- Link to v2: https://lore.kernel.org/r/20240529-edp-panel-drop-v2-0-fcfc457fc8dd@linaro.org

Changes in v2:
- Actually drop support for five panels acked by Doug Andersson
- Link to v1: https://lore.kernel.org/r/20240523-edp-panel-drop-v1-1-045d62511d09@linaro.org

---
Dmitry Baryshkov (3):
      drm/panel-edp: add fat warning against adding new panel compatibles
      dt-bindings: display: panel-edp-legacy: drop several eDP panels
      drm/panel-edp: drop several legacy panels

 .../bindings/display/panel/panel-edp-legacy.yaml   |  10 --
 drivers/gpu/drm/panel/panel-edp.c                  | 192 +++------------------
 2 files changed, 25 insertions(+), 177 deletions(-)
---
base-commit: 9324410846e13595d453b7f34508b1f6b15fb1a7
change-id: 20240523-edp-panel-drop-00aa239b3c6b

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

