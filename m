Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EB17C79FA5
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 15:08:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7548210E898;
	Fri, 21 Nov 2025 14:08:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LUlWfSce";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11CD710E898
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 14:08:53 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-5957e017378so2125891e87.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 06:08:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763734131; x=1764338931; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=m+ZjUWJm6P1oGOGSuKn7/ISLOSqUPpPqyf4Rr3+u0z0=;
 b=LUlWfSceQUiKOLkzdIpizRNW+6sxlLR/Sz+F1PYlt4Er/9cwI5GFSLOFV+DfPU1mKM
 91rhRYFBQq1ECEfVj6u2X0VkxWeB1GMTjLkiNXscWZCiDTQ+3TFb6MdXuifbZs6AxcB5
 sxzNaqOG7WEk1u1oqBA7qd9BlG9b8YMIyo8ltCbaziGiaZl4+Ll5sfJo4nPxEjwBkljD
 jo7W0rMT/jTFUSPXNmy7Koo76PevWB11nTlPlxHjV0k4xE8okOuiANd0pU8FECUtJj48
 qB9fct4fUMA6B+sbACcmG1CJUZd2WPAM3/rqgvr9NHxSkdZagYznvXEeMWuGbT7HV/WH
 WXZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763734131; x=1764338931;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=m+ZjUWJm6P1oGOGSuKn7/ISLOSqUPpPqyf4Rr3+u0z0=;
 b=Lc4/D0LdkZF3drp+thv/u5E02krJlpEfyCiYn866VyTlX03oTfa37U6ZB9XR24Oo+7
 11/GvO2iAf2kcDNuD6s1vSZlX5BOvhZd47F+OASG+XvuZ5tB/xlmSv5QWtoPA0sIqxF8
 5EUs+cVRZHVRaxRDVTLxRxwn3DOldsPfn2qxATKTV8iQ+9oYR8gS/L9FwC9AuhIpBOmq
 vOnGjEseLSIScEFQNDbOzkIe7T9VoZEfHOmBSwSJ1DvYMPV+0liRnoBgKBG6A+aH7mQr
 5ckY717g6XVDBRsUSGPEhIbPxCfJL+A8sfz0q6xBQkZDwutsxh20lTpIzcMpoozBA14X
 NTQQ==
X-Gm-Message-State: AOJu0YxyFdQ9AZ4v6VoPONUdonTrzYmc5jiStMs1OTnvUJXnlYNLQisN
 BX0LFq+NY4J/Z20yQK+Tnk3pK6Nn0Yz+iUPpT5ME769sS9T7aZpJ1AIkDX6uGqCHlmB5xp4KZ5l
 /oprletBZsg==
X-Gm-Gg: ASbGnctLUsFln4L3g0lZqi2z5XWSKWfQ9qVAHi5TRtBCZFZEXSfiq6kVU9eEIoCcwJx
 tP0ZcazoS6chSp8do+aigc8LE9Lswe1YElS5wCHkMlN9VKP/A8e23QsQrdE714d3NSeSnYQ5AtI
 1K2TarJSxY1nHTXKnpO3jj33TNI/emkgQ4rKVW+d+2WDl4DFke4RYiq44bN3FcOZnRNydfF5mvU
 Yu2dfBxtfQhU7Ztpp5g5yq2YLd1/QbXssZ07eT93tyPSZXNSBzHrnKy7Df1FhEUipq8LtsVJx0G
 e027yA03iFYYBCuhW2E4Dw+xwjQo7OtoX9101oxQzZGrpSjNFSl17UCLfazloV5QPhNpIg53Rd9
 c2x50yvOfjR+RrBghPwO0rC2/zbAEpv1bZ7GPGah4Kzx7eX310ZwWarkV9Boprep7a4tH0QO6Ij
 U2lLtiZ+5S8LDZMmyErdsAPYamtauQCApVgw40tbn4SGRoDq7wGJgI0jI=
X-Google-Smtp-Source: AGHT+IHTiD2eeWptx+78bN/r1/j0tHK/N89W2MgpMAdrnSKRFy5gp7i+RvTRr0KQyLU/9Z9FAUDwlg==
X-Received: by 2002:a05:6512:15a6:b0:591:eab5:d8dc with SMTP id
 2adb3069b0e04-596a3ee2f7dmr951571e87.35.1763734130181; 
 Fri, 21 Nov 2025 06:08:50 -0800 (PST)
Received: from [192.168.1.2] (c-92-34-217-190.bbcust.telenor.se.
 [92.34.217.190]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5969db8718csm1668421e87.30.2025.11.21.06.08.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Nov 2025 06:08:34 -0800 (PST)
From: Linus Walleij <linus.walleij@linaro.org>
Subject: [PATCH v4 0/3] drm/atomic-helpers: Fix MCDE/R-Car DU regressions
Date: Fri, 21 Nov 2025 15:08:30 +0100
Message-Id: <20251121-mcde-drm-regression-thirdfix-v4-0-d89bf8c17f85@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQqDMBBFryKz7pQkatGueo/iwphJHKimTERax
 Ls3eoIu3+Pz/gaJhCnBvdhAaOXEcc5QXQoYxn4OhOwyg1Gm1toonAZH6GRCoSCUjj0uI4vz/EF
 tVW+9rY1RLeTEWyjrM//sMo+clijf820tD/tneC1RoamsprZpbtb6x4vnXuI1SoBu3/cf8teJS
 skAAAA=
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
 Linus Walleij <linus.walleij@linaro.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>
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
Changes in v4:
- Fix a copypaste-bug in the Renesas Rcar-DU driver.
- Actually compile this using the shmobile defconfig and make
  sure it works.
- Collect Geert's Tested-by.
- Link to v3: https://lore.kernel.org/r/20251120-mcde-drm-regression-thirdfix-v3-0-24b1e9886bbf@linaro.org

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
      drm/rcar-du: Modify custom commit tail

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

