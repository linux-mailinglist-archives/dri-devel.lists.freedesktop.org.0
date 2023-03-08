Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 202556B0EE3
	for <lists+dri-devel@lfdr.de>; Wed,  8 Mar 2023 17:40:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD5A310E68E;
	Wed,  8 Mar 2023 16:40:23 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BE4610E68E
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Mar 2023 16:40:21 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 6-20020a17090a190600b00237c5b6ecd7so2967342pjg.4
 for <dri-devel@lists.freedesktop.org>; Wed, 08 Mar 2023 08:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1678293621;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uStuQWLPamCtqTgyfCCLlARBeEJ/VwnOwbsUlq7p83Q=;
 b=ZjiHB3eaenisra6g8sXMoW5pKd5W82Rh+vX66LvISPmYSNLzt+fLBsLyETnS+4IFfm
 3fPVos8CjdpsoDNllvmBHchAwvxbML/d1oHFYih60/dXsUkDQwTQTRd37sGusyN2O6KN
 Z2+LRd8/Dcuqy+dka1fjPgh0y9eXR3V0CzVKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678293621;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uStuQWLPamCtqTgyfCCLlARBeEJ/VwnOwbsUlq7p83Q=;
 b=F9bt5qGCPdGH2BLkXSZfdA0OVU98PxY6Ru15omicEh+7SntbmOIDsdE3zUs519URSk
 1Ergnud7JSPCFZkS2KOY3Tfba0mtf6s3lSIxgBvwNqT5UiQH2JExJ6X2QKyakDigmBkZ
 qo6IaAsgWGPK/8iuJOo7LNntHsLt+YxfkGKQUobiGCZU718/Ql/3ik1xLD08LxuyKSWb
 aHm9yNC4hLoZSoZSbnZfKLqUp3t08CQwn7I87n4YsQDMbH3IszCjl6dihnZ0WHUpBrbg
 iZdj/uEvLVdL5ubARlmcxgvBTf9HZR9+8SZy5dgA3VytAUA2SjkYLpCdk9QB+IwU12EY
 OPLg==
X-Gm-Message-State: AO0yUKU0EB1rkFvPfg2EbaLvUd/GEW2UXwPw93XmKCZ819ISgXq6S8go
 XgqIrXCTJmj0uTQaviKvTYlEJg==
X-Google-Smtp-Source: AK7set+MGS/+fqIN07aReA+M98T9ywqeXtMD/yZIqEW3Ld2dLCLX6VJs9aAzQO4Yx6nXbkwV6UtNXw==
X-Received: by 2002:a17:902:6bc6:b0:19d:138b:7c41 with SMTP id
 m6-20020a1709026bc600b0019d138b7c41mr15866572plt.64.1678293620940; 
 Wed, 08 Mar 2023 08:40:20 -0800 (PST)
Received: from localhost.localdomain ([2405:201:c00a:a8a1:b545:91cc:80b2:f9fe])
 by smtp.gmail.com with ESMTPSA id
 kq3-20020a170903284300b0019b9a075f1fsm10046540plb.80.2023.03.08.08.40.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Mar 2023 08:40:20 -0800 (PST)
From: Jagan Teki <jagan@amarulasolutions.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, Inki Dae <inki.dae@samsung.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Marek Vasut <marex@denx.de>,
 Maxime Ripard <mripard@kernel.org>
Subject: [PATCH v16 00/16] drm: Add Samsung MIPI DSIM bridge
Date: Wed,  8 Mar 2023 22:09:37 +0530
Message-Id: <20230308163953.28506-1-jagan@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
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
Cc: linux-samsung-soc@vger.kernel.org, Matteo Lisi <matteo.lisi@engicam.com>,
 linux-amarula <linux-amarula@amarulasolutions.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>,
 Frieder Schrempf <frieder.schrempf@kontron.de>,
 Kyungmin Park <kyungmin.park@samsung.com>, dri-devel@lists.freedesktop.org,
 Adam Ford <aford173@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This series supports common bridge support for Samsung MIPI DSIM
which is used in Exynos and i.MX8MM SoC's.

The final bridge supports both the Exynos and i.MX8M Mini/Nano/Plus.

Inki Dae: please note that this series added on top of exynos-drm-next
since few exynos dsi changes are not been part of drm-misc-next.
Request you to pick these via exynos-drm-next, or let me know if you
have any comments?

Patch 0001 - 0002: find child DSI bridge and panel

Patch 0003 - 0004: optional PHY, PMS_P offset

Patch 0005       : introduce hw_type

Patch 0006	 : fixing host init

Patch 0007	 : atomic_check

Patch 0008	 : input_bus_flags

Patch 0009	 : atomic_get_input_bus_fmts

Patch 0010 - 0011: component vs bridge

Patch 0012	 : DSIM bridge

Patch 0013 - 0014: i.MX8M Mini/Nano

Patch 0015 - 0016: i.MX8M Plus

Changes for v16:
- collect RB from Marek V
- collect TB from Marek S 
- fix multiline comment
- fix explicit bridge detach
- properly handle TE_GPIO

Changes for v15:
- drop drm_of helpers
- re-added find DSI bridge/Panel helper in dsim
- collect RB from Marek V
- fixed leading underscore in function names
- commit messages updated
- rebased on exynos-drm-next

Changes for v13:
- remove devm call for DSI panel or bridge finding
- rebased on drm-misc-next

Changes for v12:
- collect RB from Marek V
- add te_irq_handler hook
- fix comments from Marek V
- update atomic_get_input_bus_fmts logic

Changes for v11:
- collect RB from Frieder Schrempf
- collect ACK from Rob
- collect ACK from Robert
- fix BIT macro replacements
- fix checkpatch --strict warnings
- fix unneeded commit text
- drop extra lines

Changes for v10:
- rebase on drm-misc-next
- add drm_of_dsi_find_panel_or_bridge
- add devm_drm_of_dsi_get_bridge
- fix host initialization (Thanks to Marek Szyprowski)
- rearrange the tiny patches for easy to review
- update simple names for enum hw_type
- add is_hw_exynos macro
- rework on commit messages

Changes for v9:
- rebase on drm-misc-next
- drop drm bridge attach fix for Exynos
- added prepare_prev_first flag
- added pre_enable_prev_first flag
- fix bridge chain order for exynos
- added fix for Exynos host init for first DSI transfer
- added MEDIA_BUS_FMT_FIXED
- return MEDIA_BUS_FMT_RGB888_1X24 output_fmt if supported output_fmt
  list is unsupported.
- added MEDIA_BUS_FMT_YUYV10_1X20
- added MEDIA_BUS_FMT_YUYV12_1X24

Changes for v8:
* fixed comment lines
* fixed commit messages
* fixed video mode bits
* collect Marek Ack
* fixed video mode bit names
* update input formats logic
* added imx8mplus support

Changes for v7:
* fix the drm bridge attach chain for exynos drm dsi driver
* fix the hw_type checking logic

Changes for v6:
* handle previous bridge for exynos dsi while attaching bridge 

Changes for v5:
* bridge changes to support multi-arch
* updated and clear commit messages
* add hw_type via plat data
* removed unneeded quirk
* rebased on linux-next

Changes for v4:
* include Inki Dae in MAINTAINERS
* remove dsi_driver probe in exynos_drm_drv to support multi-arch build
* update init handling to ensure host init done on first cmd transfer

Changes for v3:
* fix the mult-arch build
* fix dsi host init
* updated commit messages

Changes for v2:
* fix bridge handling
* fix dsi host init
* correct the commit messages

Tested in Engicam i.Core MX8M Mini SoM.

Repo:
https://github.com/openedev/kernel/tree/imx8mm-dsi-v16

v15:
https://lore.kernel.org/all/20230303145138.29233-1-jagan@amarulasolutions.com/

Any inputs?
Jagan.

Jagan Teki (14):
  drm: exynos: dsi: Drop explicit call to bridge detach
  drm: exynos: dsi: Lookup OF-graph or Child node devices
  drm: exynos: dsi: Mark PHY as optional
  drm: exynos: dsi: Add platform PLL_P (PMS_P) offset
  drm: exynos: dsi: Introduce hw_type platform data
  drm: exynos: dsi: Add atomic check
  drm: exynos: dsi: Add input_bus_flags
  drm: exynos: dsi: Add atomic_get_input_bus_fmts
  drm: exynos: dsi: Consolidate component and bridge
  drm: exynos: dsi: Add host helper for te_irq_handler
  drm: bridge: Generalize Exynos-DSI driver into a Samsung DSIM bridge
  dt-bindings: display: exynos: dsim: Add NXP i.MX8M Mini/Nano support
  drm: bridge: samsung-dsim: Add i.MX8M Mini/Nano support
  dt-bindings: display: exynos: dsim: Add NXP i.MX8M Plus support

Marek Szyprowski (1):
  drm: exynos: dsi: Handle proper host initialization

Marek Vasut (1):
  drm: bridge: samsung-dsim: Add i.MX8M Plus support

 .../bindings/display/exynos/exynos_dsim.txt   |    2 +
 MAINTAINERS                                   |    9 +
 drivers/gpu/drm/bridge/Kconfig                |   12 +
 drivers/gpu/drm/bridge/Makefile               |    1 +
 drivers/gpu/drm/bridge/samsung-dsim.c         | 1967 +++++++++++++++++
 drivers/gpu/drm/exynos/Kconfig                |    1 +
 drivers/gpu/drm/exynos/exynos_drm_dsi.c       | 1813 +--------------
 include/drm/bridge/samsung-dsim.h             |  115 +
 8 files changed, 2191 insertions(+), 1729 deletions(-)
 create mode 100644 drivers/gpu/drm/bridge/samsung-dsim.c
 create mode 100644 include/drm/bridge/samsung-dsim.h

-- 
2.25.1

