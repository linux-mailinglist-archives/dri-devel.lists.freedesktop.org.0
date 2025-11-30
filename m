Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C4D8C94F3C
	for <lists+dri-devel@lfdr.de>; Sun, 30 Nov 2025 13:11:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04B0110E132;
	Sun, 30 Nov 2025 12:11:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="QstWaQil";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBD2F10E132
 for <dri-devel@lists.freedesktop.org>; Sun, 30 Nov 2025 12:11:31 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 5B394600C4;
 Sun, 30 Nov 2025 12:11:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47ACFC4CEF8;
 Sun, 30 Nov 2025 12:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764504690;
 bh=pD+3UK8qUgnsBWqr+U+WVaR977MABOrEMHiqQn4DhpE=;
 h=From:Subject:Date:To:Cc:From;
 b=QstWaQilX///3ucVZau189nWyajX3mxV8OjUPVXFnHfO2jGJ6SjudP5lKYawrk5Z2
 xdxLneLIKYI5y3yWvJ6AsRz+FwKdSykyMT/qKpXoAp6qx6WPL++H7t2GhmiRYqv7bG
 2ecA+GBdr6ltda2tZz2SgPy1F52VSNGxmgds/19Vl5XafYeoWiScp94MT5KG6GAqNf
 9wEm/7N8pehet6G+/u1aIGKwMPO/gXUBH3+M5X2QFa8xcC70k6w7c6fa008C9C0/5C
 7KRo+HST0ocB2fFVQMmrmHQeolIhZkaqp2JaaCZdU6dDYjGujJQ+OXjiEeyjOFluSm
 hE4a7RkI1D8YA==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH v5 0/3] drm/atomic-helpers: Fix MCDE/R-Car DU regressions
Date: Sun, 30 Nov 2025 13:11:16 +0100
Message-Id: <20251130-mcde-drm-regression-thirdfix-v5-0-aed71a32981d@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NQQ6CMBCF4auYrh3TFtDiynsYF5ROYRKhZkoaD
 eHuFla60uX/MvlmFhGZMIrzbhaMiSKFMUe134m2b8YOgVxuoaWulNIShtYhOB6AsWOM6z1MPbH
 z9ARlZWO9rbSWtcjEgzHPG3+95e4pToFf27dUrOufcCpAgi6twtqYo7X+cqex4XAI3IlVTuWnp
 n5oZdacqa03rTp5U31py7K8AQZ/O0QXAQAA
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
 Linus Walleij <linusw@kernel.org>, 
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

Signed-off-by: Linus Walleij <linusw@kernel.org>
---
Changes in v5:
- Prefix all exported atomic commit helpers with drm_atomic_helper_commit_*
- Add kerneldoc to all new exported atmomic commit helpers.
- Add comments into the MCDE and Rcar DU quirks explaining what is
  altered as compared to the standard helper functions.
- Link to v4: https://lore.kernel.org/r/20251121-mcde-drm-regression-thirdfix-v4-0-d89bf8c17f85@linaro.org

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

 drivers/gpu/drm/drm_atomic_helper.c           | 122 +++++++++++++++++++++-----
 drivers/gpu/drm/mcde/mcde_drv.c               |  45 +++++++++-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c |  33 ++++++-
 include/drm/drm_atomic_helper.h               |  22 +++++
 4 files changed, 195 insertions(+), 27 deletions(-)
---
base-commit: 6548d364a3e850326831799d7e3ea2d7bb97ba08
change-id: 20251120-mcde-drm-regression-thirdfix-1b0abfb52209

Best regards,
-- 
Linus Walleij <linusw@kernel.org>

