Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F06AA1412F
	for <lists+dri-devel@lfdr.de>; Thu, 16 Jan 2025 18:50:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 444AB10E9EB;
	Thu, 16 Jan 2025 17:50:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="dyd6j68+";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF25E10E576
 for <dri-devel@lists.freedesktop.org>; Thu, 16 Jan 2025 17:50:23 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id AE86A60005;
 Thu, 16 Jan 2025 17:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737049822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=HBxAStw6moC217ysLhiJXvWgQj4tsyuq5fAMuICm8Jo=;
 b=dyd6j68+Rxpfh9WZdU5WulUwfb+lhxa9D53wmXgSJgHtitmr4lb5KSP/FyZpVDQBT2jp1/
 aHC6qhgCBOK0YWzV19c3u1SsIn0NH5/bO+7ceubPKQJGI3bgQeTgvOOOVtkEMMka9uymLI
 r/4ng5I3OlGPst/9XHYq6PUSPSxktFlPH59/z7Jp9Tze8gT9tRLbzIT1XYWIC/d2u8bAnS
 oPFrNh4EKmcKhBT7Uv96ba9SI9b73FD4moUwCUuIzDqYx/mIbLy2emPM+/ftq+9zksWMLM
 wqWPUXkpGi4w8KmwDjDXwgr0nCgoshP7KTHJbD9FgCuOAwVYIGVUWntnxJLnSA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH v9 0/8] drm/vkms: Switch all vkms object to DRM managed objects
Date: Thu, 16 Jan 2025 18:47:12 +0100
Message-Id: <20250116-google-vkms-managed-v9-0-3e4ae1bd05a0@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIACFGiWcC/3XR327CIBQG8FcxXI+Nw3+82nssu6DlWMls2UrXu
 BjffVjjdBHvOCTfjw84kIxjxEzWqwMZcY45pqEM7mlF2q0fOqQxlJlwxiVTHGiXUrdDOn/0mfZ
 +8B0GKj22zkkN3hhSkp8jbuJ+Ud/ez/OIX98Fn86bpPEZaZv6Pk7rVRh72sfcvlwWdMD9RE7Jb
 cxTGn+WejMs0aWJBVltMgNl1PjGNtZxACZem5SmXRyey2GLOPMbhZu6wouykSUvlRIem3tFXBU
 HvK6IUxfDbNA+cM3DvSL/FGDA6oosCgYmveaFwcqN1FUB/qCLKgr4RjPJBDrN7hV9Vbh40EWfF
 NWaoFUbtKi8i7koigGIumKKIjcWAlgnkFUUe6s8+GlblOAlV9J7EYL6rxyPx19Y2O4o3AIAAA=
 =
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4625;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=1LqDkUyC1T9ATtmz6aZhffvBm+d9qX71YDflW8os5gQ=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBniUbOThOpAbAAPiISNGEnVejjeJz29NMwM4NGc
 3QkoLX9a++JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ4lGzgAKCRAgrS7GWxAs
 4g+yEACLhyQcm1+ZFQQlLOneCv1ZeOzzzbYUHpzZqHsZXCmIozvzMaC1YYPu6yidWjm42JExrAC
 /B3vT8bH/aKM5vVpBkRnTER91Yr3mKzDyKaVQdffHaWEtWeRg9BIUr1h0HnYokVG/dxhdo7n22l
 yh2RQLwqO9ZJM/ZmX+LhcG+B+wFooX9bF9Gj5x8J3vP1hBOuEH6dLtqMO0ZXZldR0/wP5QEoS4v
 4w9bvvcmOLD+inccyMwHRYeRSy8IgHl+KY3Vh9LPEsTkpdLZLowZj7SA5jwLCl2Vh7qD5IZd3Se
 vJZFPbbUglRlouc2CN10DAFt1DlybOPprKMvHtfDsyVJh/JkNMLFtDY6P4ZUIerh57S/2dVjjVI
 7CpP0Dx7lR/U/KU3AhPIo/7Z0mMbfNieUCHpTkKVfAx9GlWsocHdf29BIeqrrytiZI9hPR1h/df
 aNw+tDymq1HJ27PKjp+pdq5IQiSdhEMRQ1ziSbe0cmwAyf24LAJvtNVVZKXPZXlnk6F4Nwnxzvz
 3yG3RAmKstk7FWpHrmy6RgGaEsivwfQa3PEcplHvXkeyIRBA10sP4Jof1nMWtbe5hvxZ5wDxqL1
 WLhR2BHP6lJjxIcwfc8WHKxOwqQi5NwvX/sO91fO01JVStqneG7QxD1F0G1SJ6Wrhp9HcTDkPrL
 SV9DacM3/KygjPg==
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
PATCH 3/8: Add helper to allocate workqueue
PATCH 4/8: Migrate CRTC management to drm
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
Changes in v9:
- Move function definition in the correct patch (they were not used 
  anymore in the original patch, I missed this since the v7, thanks 
  kernel bot)
- Link to v8: https://lore.kernel.org/r/20250114-google-vkms-managed-v8-0-da4254aa3dd5@bootlin.com

Changes in v8:
- Add the helper to allocate workqueue with drmm managment
- Reorder includes
- Link to v7: https://lore.kernel.org/r/20250113-google-vkms-managed-v7-0-4f81d1893e0b@bootlin.com

Changes in v7:
- Add Reviewed-by
- Merge PATCH 4/8 and 5/8 as the function were statics
- PATCH 6/7: Remove optional parameter for encoder
- PATCH 7/7: Create dedicated encoder for vkms writeback connector
- Removed useless cleanup in PATCH 6/8
- Link to v6: https://lore.kernel.org/r/20241230-google-vkms-managed-v6-0-15c7d65cd63b@bootlin.com

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
      drm/managed: Add DRM-managed alloc_ordered_workqueue
      drm/vkms: Switch to managed for crtc
      drm: writeback: Create an helper for drm_writeback_connector initialization
      drm: writeback: Add missing cleanup in case of initialization failure
      drm: writeback: Create drmm variants for drm_writeback_connector initialization
      drm/vkms: Switch to managed for writeback connector

 drivers/gpu/drm/drm_managed.c         |   8 ++
 drivers/gpu/drm/drm_writeback.c       | 184 +++++++++++++++++++++++++++++-----
 drivers/gpu/drm/vkms/vkms_crtc.c      |   5 +-
 drivers/gpu/drm/vkms/vkms_drv.c       |   9 --
 drivers/gpu/drm/vkms/vkms_drv.h       |   3 +-
 drivers/gpu/drm/vkms/vkms_output.c    |  26 ++---
 drivers/gpu/drm/vkms/vkms_writeback.c |  21 ++--
 include/drm/drm_managed.h             |  12 +++
 include/drm/drm_writeback.h           |   6 ++
 9 files changed, 210 insertions(+), 64 deletions(-)
---
base-commit: 6e11ce84c514f3ad8c8c766e1328bf49d80a0325
change-id: 20240521-google-vkms-managed-4aec99461a77

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

