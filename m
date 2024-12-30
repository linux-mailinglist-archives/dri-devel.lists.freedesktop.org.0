Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B24A9FE9F0
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 19:37:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1464C10E123;
	Mon, 30 Dec 2024 18:37:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="mTFqka9M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17EFC10E123
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 18:37:44 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5C931E0002;
 Mon, 30 Dec 2024 18:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1735583863;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=OfPhtlj4RK1NhUNwWSH6wzWva+O9DfCSP/CUOSqjQ9M=;
 b=mTFqka9Mov1d1rTKD0D4oVUxIrBJHTacW0nyrBYKl72OrD75Q0+U6saaXGc/0H/RfZudro
 ba/u91Ecb+HGHCZQjRt7r+7D7g4h99SkOcUCfBObXoCRigV+Vdd8EjIp3kZNhR85DfQSbD
 Q4B53xPs8V5Lnc3HN8S8eDZIGPPCP2gD99yJOheTL0RYViuxsQVtRhA8GXuXQo70qGHSYF
 0QicQUcbFHokc+vk/GDP2MkhonwiSU5luLmB8SPyR5WB95X013ATFnk6Ne0GnzlZ3TGW/R
 Sgvh5+LfYZ/bf74heRIkvcDlrN4TDYYIkdGje+BTgiB2IrfvdUfCoLteib54Zg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH v6 0/8] drm/vkms: Switch all vkms object to DRM managed objects
Date: Mon, 30 Dec 2024 19:37:30 +0100
Message-Id: <20241230-google-vkms-managed-v6-0-15c7d65cd63b@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAGrocmcC/3XPQW7DIBAF0KtYrEvLjDG2s+o9oi7ATBzUYFJwr
 FSR717iqE2ruDs+0n98LixRdJTYpriwSJNLLgw5qKeCdXs99MSdzZmhQCkqBN6H0B+IT+8+ca8
 H3ZPlUlPXtlKBrmuWm8dIO3de1O3bLUf6OGV8vF0yoxPxLnjvxk1ho+fepe7l+8AHOo/s2ty7N
 Ib4ucybYKkuSxqQq0sm4ILX2jSmaRFAlK8mhPHghuf82CJO+EvBel3BrOxk7suqKjWZR6W8Ky3
 gulJet9SisUpbVGgfFfmjgACxrsiskBVSK8wMrfyouiuA/2ypsgLaKCFFSa0Sf5V5nr8ARyYSv
 goCAAA=
X-Change-ID: 20240521-google-vkms-managed-4aec99461a77
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net, 
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3669;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=XEffkfIGTq6OZiobiuMbIjc9iv3EtqjsrhANehD++p0=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBncuhwJ3XjY5XlpQmjx/Zmbop+8SlgvtjidKg6c
 zSzdBFb+GyJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ3LocAAKCRAgrS7GWxAs
 4r5OD/0YqpCtkvLxz3Xu98krtdTMfbPKf7tvlQpIo71eejIs7jXNKo14MJzr8izRSwpUFSFrLKI
 1GAYDDHYeosgoUztE36FVJR8k1lRuNn7u3woDwdORpyQkThb/ywOplm0vOyaXfdnNRLx32VUpyv
 OsKTyVqAIfNdOt6peGWwsvweUJX96r+CpIaY0fF3c0+01LnC1n690Vl0vM0JBBssgrMUAVwtxtg
 dE+au01dLiLqcHnWRslvF+E5GwuHGLfucPTutuT/Og2rPEat7ufooRrJrDTXzyFT37w6xZOiXTN
 ZK5re4xkGGtA8N5wb1xv0KCGbZSbAhe2QCNjikOILBvVrrf3jZDtbENs7zery8kcGVwp8qhppjF
 kasQ+lk/EASQgRwPfkn3hlZbidPP0Z/KlfcQC6ptD/DaHPjlmgDMyKVKrOgBew6gzjJ/ZuUwTYn
 Hvjh3MUMhgHSZUQkJ1PLbjLeXs1WAjj64TEmZIqqfPVB8J1pkCi2+YEAUTnikYKwXbqwSxVY4Rd
 QoFxUZc7r64SWwhGBW3UQDQiu+U90xjdwDdBvSj5jmV8bu7vGkcc9lo7//fw0OvvbJu0e/0btZn
 RAD56TC2mD0wqTFhjCMQQbEAZgmmzT7WNKpTpfdGzoKPo2othrFWkfM/wlldWeVVwRCc5ZBxESR
 5qPeqQfxO85uPqw==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-Sasl: louis.chauvet@bootlin.com
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

To simplify the memory managment, this series replace all manual drm
object managment by drm-managed one. This way the VKMS code don't have to
manage it directly and the DRM core will handle the object destruction.

No functional changes are intended in this series.

PATCH 1/8: Migrate connector managment to drmm
PATCH 2/8: Migrate encoder managment to drmm
PATCH 3/8: Migrate connector management to drm
PATCH 4/8: Introduce cleanup function for drm_writeback_connector
PATCH 5/8: Create a helper to initialize drm_writeback_connector (common
           part between drmm and normal variants)
PATCH 6/8: Ensure the proper clean of drm_writeback_connector after a
           failure during init
PATCH 7/8: Create the drmm initialization for drm_writeback_connector
PATCH 8/8: Migrate writeback connector management to drm

For the drmm_writeback helpers, you can find some discussions here [3].

[3]:https://lore.kernel.org/all/20240906-writeback-drmm-v1-1-01ede328182c@bootlin.com/

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
Changes in v6:
- Added R-by
- Splited the drmm_writeback_connector init in multiple commits + rework 
  how it is done. This time it should not change the behavior of existing 
  drivers
- Link to v5: https://lore.kernel.org/r/20241122-google-vkms-managed-v5-0-1ab60403e960@bootlin.com

Changes in v5:
- Rebased on drm-misc-next
- Link to v4: https://lore.kernel.org/r/20241010-google-vkms-managed-v4-0-ed04a62ad2e3@bootlin.com

Changes in v4:
- No changes for the managed part
- Add the patch to introduce drmm_writeback helpers
- Link to v3: https://lore.kernel.org/r/20240912-google-vkms-managed-v3-0-7708d6ad262d@bootlin.com

Changes in v3:
- As suggested by Maxime, split the managed and the dynamic allocation
  parts in different series
- To reduce the diff in this series, extract the "remove crtc index" part,
  see https://lore.kernel.org/all/20240906-vkms-remove-index-v1-1-3cfedd8ccb2f@bootlin.com/
- Link to v2: https://lore.kernel.org/r/20240827-google-vkms-managed-v2-0-f41104553aeb@bootlin.com

Changes in v2:
- Applied comments from José
- Extract the rename vkms_output -> vkms_crtc to avoid useless changes in
  the last commit
- Extract the rename to_vkms_crtc_state to
  drm_crtc_state_to_vkms_crtc_state to avoid useless changes in last
  commit
- Extract the drm_mode_crtc_set_gamma_size result check in its own commit
- Rebased on drm-misc/drm-misc-next
- Link to v1: https://lore.kernel.org/r/20240814-google-vkms-managed-v1-0-7ab8b8921103@bootlin.com

---
Louis Chauvet (8):
      drm/vkms: Switch to managed for connector
      drm/vkms: Switch to managed for encoder
      drm/vkms: Switch to managed for crtc
      drm: writeback: Introduce cleanup function
      drm: writeback: Create an helper for drm_writeback_connector initialization
      drm: writeback: Add missing cleanup in case of initialization failure
      drm: writeback: Create drmm variants for drm_writeback_connector initialization
      drm/vkms: Switch to managed for writeback connector

 drivers/gpu/drm/drm_writeback.c       | 208 +++++++++++++++++++++++++++++-----
 drivers/gpu/drm/vkms/vkms_crtc.c      |  14 +++
 drivers/gpu/drm/vkms/vkms_drv.c       |   9 --
 drivers/gpu/drm/vkms/vkms_output.c    |  24 ++--
 drivers/gpu/drm/vkms/vkms_writeback.c |  13 +--
 include/drm/drm_writeback.h           |   8 ++
 6 files changed, 216 insertions(+), 60 deletions(-)
---
base-commit: f8a2397baf041a5cee408b082334bb09c7e161df
change-id: 20240521-google-vkms-managed-4aec99461a77

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

