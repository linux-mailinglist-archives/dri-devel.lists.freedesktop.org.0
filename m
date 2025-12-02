Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9AC1C9CFE9
	for <lists+dri-devel@lfdr.de>; Tue, 02 Dec 2025 22:02:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D0D0610E6C0;
	Tue,  2 Dec 2025 21:02:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="nMGPHKyo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sea.source.kernel.org (sea.source.kernel.org [172.234.252.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77B2410E6C0
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Dec 2025 21:02:48 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 417B8443A7;
 Tue,  2 Dec 2025 21:02:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CED8C16AAE;
 Tue,  2 Dec 2025 21:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764709368;
 bh=+NfOB79/o1jXB8edhjztknXizC2rmKHoxYfSHOGDDqs=;
 h=From:Subject:Date:To:Cc:From;
 b=nMGPHKyo2KbjnEW5ciedGnBqtSQXBdQA9itsILcXPhwZdGORjZPg/nLIUXx3/fzgi
 yaQLufUm1bMw9xqM+Y8kZlLTGb9PoRSFiWlsJqaTY/EFfRLXjUbnf/MM1pbVozT0S+
 HJI4dovti6l4sTq9dHm295v02EFNkBMzPUfngiOXa+LqiREUSuYUy7oI2+3me1RAu2
 4UrYLoOYyGkYaYSd/cYxqIw0/Eb6JAt4WUch1WxIw4J/xRZd1PPuPGh2M4OG8u/dhV
 OmMn57uk2a27vHMglXnFbrwCh0NVEWTG6CipyfIzna0MbD9oA1y4i6Z3d7h8Wx0dEO
 TGpSgCsexVT9A==
From: Linus Walleij <linusw@kernel.org>
Subject: [PATCH v6 0/4] drm/atomic-helpers: Fix MCDE/R-Car DU regressions
Date: Tue, 02 Dec 2025 22:02:39 +0100
Message-Id: <20251202-mcde-drm-regression-thirdfix-v6-0-f1bffd4ec0fa@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43OTQ6DIBAF4Ks0rEsDKIpdeY+mC5BBSf1pBmPaG
 O9etBuTLuzyvUy+NzMJgB4CuZ5mgjD54Ic+hux8IlWj+xqotzETwYTkXDDaVRaoxY4i1Ahhvad
 j49E6/6LcMG2ckUKwgkTiiRDrjb/dY258GAd8b2tTsrZ/wlNCGRWp4VAolRnjytb3GofLgDVZ5
 Snda/xAS6NmVWGcqnjulPzR5E5Ljn6TUdNgc64TUShuywdgD+1XW5blA/JCci1lAQAA
X-Change-ID: 20251120-mcde-drm-regression-thirdfix-1b0abfb52209
To: Vicente Bergas <vicencb@gmail.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Marek Vasut <marek.vasut+renesas@mailbox.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Magnus Damm <magnus.damm@gmail.com>, Aradhya Bhatia <a-bhatia1@ti.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-renesas-soc@vger.kernel.org, 
 linux-rockchip@lists.infradead.org, Linus Walleij <linusw@kernel.org>, 
 Geert Uytterhoeven <geert@linux-m68k.org>, 
 Aradhya Bhatia <aradhya.bhatia@linux.dev>
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
Changes in v6:
- As this problem has (probably) also appeared in the Rockchip
  driver, append an RFT patch for the Rockchip DRI driver at the
  end of the series.
- Ask Rockchip people if this solves their issue too.
- I was about to apply this with all the ACKs it had gotten,
  but let's decide what to do based on the Rockchip situation that
  appeared right now.
- Link to v5: https://lore.kernel.org/r/20251130-mcde-drm-regression-thirdfix-v5-0-aed71a32981d@kernel.org

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
Linus Walleij (4):
      drm/atomic-helper: Export and namespace some functions
      drm/mcde: Create custom commit tail
      drm/rcar-du: Modify custom commit tail
      RFT: drm/rockchip: Create custom commit tail

 drivers/gpu/drm/drm_atomic_helper.c           | 122 +++++++++++++++++++++-----
 drivers/gpu/drm/mcde/mcde_drv.c               |  45 +++++++++-
 drivers/gpu/drm/renesas/rcar-du/rcar_du_kms.c |  33 ++++++-
 drivers/gpu/drm/rockchip/rockchip_drm_fb.c    |  50 ++++++++++-
 include/drm/drm_atomic_helper.h               |  22 +++++
 5 files changed, 244 insertions(+), 28 deletions(-)
---
base-commit: 6548d364a3e850326831799d7e3ea2d7bb97ba08
change-id: 20251120-mcde-drm-regression-thirdfix-1b0abfb52209

Best regards,
-- 
Linus Walleij <linusw@kernel.org>

