Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00A1CC768DB
	for <lists+dri-devel@lfdr.de>; Thu, 20 Nov 2025 23:55:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79FB810E0F5;
	Thu, 20 Nov 2025 22:55:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MTGwerBl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com
 [209.85.167.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4ECCE10E0F5
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 22:55:40 +0000 (UTC)
Received: by mail-lf1-f41.google.com with SMTP id
 2adb3069b0e04-594285c6509so1382339e87.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Nov 2025 14:55:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763679338; x=1764284138; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=g0jynR1GhgSehXxo6CUevrfdzDryZKs3WqkhN5eRj/c=;
 b=MTGwerBlGQPj5ukd9na3DEgHPSGLqlntlyP5AUpCkzhb4/U65SWW7/9dRF/bPiDpqO
 EA4KS+Ig7/W8qcKsYMxepdwRQk/hZv0xGgVj32eeDKXknCUjbuBX+TgwekNuCftClyFk
 kVDxFVxuO2FvFuXlebV+D5Kmh17AOsZuq7qitDzeHe7Tx+xpOZZM+kj+wYw8BLxCGr6G
 C8aVYSEH0/dPOv9/lxL5+u2tJahI74PJdNywP66QrG8hEBtr4xgAGCT2Agw/vST0Sbba
 rtTDa0Fsy19vel0tNnDS3kGuwNbUMX8MB9pZTKIRDG+knH5Ig+YfQVi76K1A3ymrJaiU
 Qq3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763679338; x=1764284138;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=g0jynR1GhgSehXxo6CUevrfdzDryZKs3WqkhN5eRj/c=;
 b=FWywtZJDHB+zL5H75pGiOrAImbRZ3Er0lqzrhokKxW19gAo1cMyo6+GbrXvGtsB/qd
 gvLrXp50ftL522zF1DkpAcfGx3WCtemXJdoDK9xgmRIprXOhbaliWS7wl9SoH+UzZrzf
 lr5vV/CZy85ZQtdhO3R+KP7ia407lCiDl9MuKzKHNkiZxU5r3SAp1Gz+8bPTF6Cryosg
 VeUYgVSedR3BgTZfc01F16qeSfNe0X3Dx0WMXCpbcbiWt8eRSjZtbvDEvMIJai2quRuO
 MfPUSCJCUqToKxMu0s20T+IreN7HMiCNR546DSTS8ezxP0WSN3N6kTlwFhr6JzRuQjCK
 CCvw==
X-Gm-Message-State: AOJu0YzIiBxDJSvKwcKDfMbS1WBLd3zHpmhpYGOleQKKSrCTYJ/5iwnX
 CKwIvt3iZr8aFtpUmiRLvPn5VBbQAx79ZCxMKehn2WNuMm0fbw8WRt4IQ8//S0dWwus=
X-Gm-Gg: ASbGncv87Q+X9n1SYxeA08purzniXMM66WwbtshyMhP8ZrUiz63t8dJtA7adeqOBpwQ
 j97oceh4I7+z5e0/B9tgmvi8FrZIC43kM62Lpp3ecOa0bLdms1A9R8Y9ob8xaImRv3jxIJmsQE1
 CO+eXY4zQXZHVhplaIavyUkb00BnzykyovLpCVpXwq0aqgKXYy3lFAMfJ/6C/XB6+8KAtuVZSBv
 5QblhYA7LOYBiDygCxzUcCYyBTSFvhNOTr0aRwFXYBdcYKwL5uuj63ITKikqkz5WylsVeM7NnIx
 wAB102zG63Ba6qavlAYqngvdNasf8mXs0fHmWL6sBxf/JisQWp3hlnBQAcyQjxsRUO2J7yhOnHi
 knrI0jsf13PIkKWzlTwCsDFwmS1D7UOCRKP6rScSUMCWVB8sUdcLBkA7vwSArBLqkgi0Qd9Xvd+
 0qv0fA1lGkm2erZEeEdEouNzCN1Bd64A7dGNlz40LEfbjVAqV3yoUx2ZM=
X-Google-Smtp-Source: AGHT+IH8hoRXfeg1Ob+1mb5sV1mPrvjyeqaOtQq+MyHyGiLcaWDYW5x/5+TOPHeF93s776SkRBKdiQ==
X-Received: by 2002:a05:6512:138c:b0:594:493a:a27f with SMTP id
 2adb3069b0e04-5969e30d852mr1714824e87.36.1763679338495; 
 Thu, 20 Nov 2025 14:55:38 -0800 (PST)
Received: from [192.168.1.2] (c-92-34-217-190.bbcust.telenor.se.
 [92.34.217.190]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5969db75705sm1066877e87.15.2025.11.20.14.55.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Nov 2025 14:55:34 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v3 0/3] drm/atomic-helpers: Fix MCDE/R-Car DU regressions
Date: Thu, 20 Nov 2025 23:55:31 +0100
Message-Id: <20251120-mcde-drm-regression-thirdfix-v3-0-24b1e9886bbf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/x2MuwqAMAwAf0UyG2gjDvor4mDbVDP4IBURpP9ud
 bzjuAcSq3CCvnpA+ZIk+1agqSvwy7TNjBIKAxlqrSWDqw+MQVdUnpXT1+O5iIYoN1pnJhddS2Q
 6KItDueh/P4w5v9dTERluAAAA
X-Change-ID: 20251120-mcde-drm-regression-thirdfix-1b0abfb52209
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Aradhya Bhatia <a-bhatia1@ti.com>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 Linus Walleij <linus.walleij@linaro.org>
X-Mailer: b4 0.14.3
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

This fixes two regressions experienced in the MCDE and
R-Car DU DRM drivers after
commit c9b1150a68d9362a0827609fc0dc1664c0d8bfe1
"drm/atomic-helper: Re-order bridge chain pre-enable and post-disable"
caused a series of regressions in all panels that send
DSI commands in their .prepare() and .unprepare()
callbacks.

This series make it possible to selectively bring back the
old behaviour with explicit semantics and implements
the old behaviour as modified commit tails in MCDE and
R-Car DU.

Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
---
Changes in v3:
- Switch to a new approach: export helper functions and create the
  special helper directly in the driver instead.
- Drop Marek's patch and write a new RFT patch with the same
  semantic content as the MCDE patch.
- Link to v2: https://lore.kernel.org/r/20251118-mcde-drm-regression-v2-0-4fedf10b18f6@linaro.org

Changes in v2:
- Queue Marek's patch first in the series for coherency.
- Add a patch to also preserve the late CRTC disablement
  semantic.
- Rename helper function to reflect the new semantic.
- Update the MCDE patch to use the new callbacks.
- Link to v1: https://lore.kernel.org/r/20251118-mcde-drm-regression-v1-1-ed5583efbd68@linaro.org

---
Linus Walleij (3):
      drm/atomic-helper: Export and namespace some functions
      drm/mcde: Create custom commit tail
      RFT: drm/rcar-du: Modify custom commit tail

 drivers/gpu/drm/drm_atomic_helper.c           | 54 +++++++++++++++------------
 drivers/gpu/drm/mcde/mcde_drv.c               | 37 +++++++++++++++++-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c | 25 +++++++++++--
 include/drm/drm_atomic_helper.h               | 19 ++++++++++
 4 files changed, 108 insertions(+), 27 deletions(-)
---
base-commit: 6548d364a3e850326831799d7e3ea2d7bb97ba08
change-id: 20251120-mcde-drm-regression-thirdfix-1b0abfb52209

Best regards,
-- 
Linus Walleij <linus.walleij@linaro.org>

