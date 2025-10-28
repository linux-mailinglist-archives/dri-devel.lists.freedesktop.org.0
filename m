Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B100C14083
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 11:16:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D17210E1A7;
	Tue, 28 Oct 2025 10:16:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="y+8Q+f4+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF7B210E1A7
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 10:16:33 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 9696AC0BE99;
 Tue, 28 Oct 2025 10:16:11 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id D17CA606AB;
 Tue, 28 Oct 2025 10:16:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2136F1179B0FD; Tue, 28 Oct 2025 11:16:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761646590; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=2y1VguXNadgmHV2MWfLxtHciagEfpDNKLtcTFrx9gQY=;
 b=y+8Q+f4+NyMBaI+oxtSqrmK40IPdzftk2i35ILp1mrzE1MtTvNNT2ZCztpZi7zowEFLzuk
 oiEQhsdjmNbXD2SyY4akCxVrmPgrlisRUbdzYuGNl97B+waeLpyRVBstpvylD0CaNWxrg8
 5SOTPVtt7O7TNgXIFtY740KDEHoTgf4iKGRrceD8UhH66nWnP8FZKeCiz0e8qMpoQNxqT4
 WBXUsn35LTLje4cB/nrYhZVTbCBmfRD8coW4iQaCvHD4J2paHoBeJUmwgf6YDMsGx/YCBn
 iijusX4eL6AszOvIZm3zo6vbow3B63MTv+llABtVDGO/yDMPHLAhibtPYziceA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v3 0/6] drm/bridge: enforce drm_bridge_add() before
 drm_bridge_attach()
Date: Tue, 28 Oct 2025 11:15:41 +0100
Message-Id: <20251028-b4-drm-bridge-alloc-add-before-attach-v3-0-bb8611acbbfb@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAM2XAGkC/5WNwQ7CIBAFf8Vwdg1sa6ie/A/jARawJG0xQIim6
 b9Le9KbHue9ZGZmyUZvEzvvZhZt8cmHqUKz3zHq1XS34E1lhhyPgvMGdAsmjqCjN/VUwxAIlDG
 grQuxDjkr6sG6RiBx3amOWHU9onX+uXWut8q9TznE15YtYl3/LRQBHE7odMsNSsnbiw4hD346U
 BjZ2ij44UXxqxerl4QkElo7J/HbuyzLG55mbsY0AQAA
X-Change-ID: 20251003-b4-drm-bridge-alloc-add-before-attach-ef312c0b8a8c
To: Alain Volmat <alain.volmat@foss.st.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Andy Yan <andy.yan@rock-chips.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-Last-TLS-Session-Version: TLSv1.3
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

This small series enforces that DRM bridges must be added before they are
attached as discussed in [1].

This is part of the work towards removal of bridges from a still existing
DRM pipeline without use-after-free. The grand plan was discussed in [0].
Here's the work breakdown (➜ marks the current series):

 1. ➜ add refcounting to DRM bridges (struct drm_bridge)
    (based on devm_drm_bridge_alloc() [0])
    A. ✔ add new alloc API and refcounting (v6.16)
    B. ✔ convert all bridge drivers to new API (v6.17)
    C. ✔ kunit tests (v6.17)
    D. ✔ add get/put to drm_bridge_add/remove() + attach/detach()
         and warn on old allocation pattern (v6.17)
    E. ➜ add get/put on drm_bridge accessors
       1. ✔ drm_bridge_chain_get_first_bridge(), add cleanup action (v6.18)
       2. ✔ drm_bridge_get_prev_bridge() (v6.18)
       3. ✔ drm_bridge_get_next_bridge() (v6.19)
       4. ✔ drm_for_each_bridge_in_chain() (v6.19)
       5. ✔ drm_bridge_connector_init (v6.19)
       6. … protect encoder bridge chain with a mutex
       7. of_drm_find_bridge
       8. drm_of_find_panel_or_bridge, *_of_get_bridge
       9. ➜ enforce drm_bridge_add before drm_bridge_attach
    F. ✔ debugfs improvements
       1. ✔ add top-level 'bridges' file (v6.16)
       2. ✔ show refcount and list lingering bridges (v6.19)
 2. … handle gracefully atomic updates during bridge removal
    A. … Add drm_dev_enter/exit() to protect device resources
    B. … protect private_obj removal from list
 3. … DSI host-device driver interaction
 4. ✔ removing the need for the "always-disconnected" connector
 5. finish the hotplug bridge work, moving code to the core and potentially
    removing the hotplug-bridge itself (this needs to be clarified as
    points 1-3 are developed)

Series layout:
 - patches 1-2: add missing drm_bridge_add() to the 2 drivers known for not
                calling it
 - patch 3: document that drm_bridge_add() is required before attach
 - patch 4: add a warning in drm_bridge_attach() is drm_bridge_add() was
            not called	    
 - patch 5: add a warning for bridges missing both devm_drm_bridge_alloc()
            and drm_bridge_add()

The added warning might reveal more non-compliant drivers, in that case
they will be fixed as they are found.

[0] https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com/#t
[1] https://lore.kernel.org/all/20250709-sophisticated-loon-of-rain-6ccdd8@houat/

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Changes in v3:
- Searched for any remaining drivers not calling drm_bridge_add(); found 1,
  added patch 6 to convert it
- Added Suggested-by which was missing in patch 4, removed misplaced Link: tags
- Added review tags to patches 1-2
- Link to v2: https://lore.kernel.org/r/20251021-b4-drm-bridge-alloc-add-before-attach-v2-0-c17cc1bbff72@bootlin.com

Changes in v2:
- Added patch 5
- Added review tags to patches 1-4 (patches unchanged)
- Link to v1: https://lore.kernel.org/r/20251003-b4-drm-bridge-alloc-add-before-attach-v1-0-92fb40d27704@bootlin.com

---
Luca Ceresoli (6):
      drm/sti: hda: add bridge before attaching
      drm/sti: hdmi: add bridge before attaching
      drm/bridge: document that adding a bridge is mandatory before attach
      drm/bridge: add warning for bridges attached without being added
      drm/bridge: add warning for bridges using neither devm_drm_bridge_alloc() nor drm_bridge_add()
      drm/bridge: synopsys: dw-dp: add bridge before attaching

 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 2 ++
 drivers/gpu/drm/drm_bridge.c            | 9 +++++++++
 drivers/gpu/drm/sti/sti_hda.c           | 5 +++++
 drivers/gpu/drm/sti/sti_hdmi.c          | 2 ++
 4 files changed, 18 insertions(+)
---
base-commit: 761105adbbac91d00a9662e54de1c55513556a48
change-id: 20251003-b4-drm-bridge-alloc-add-before-attach-ef312c0b8a8c

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

