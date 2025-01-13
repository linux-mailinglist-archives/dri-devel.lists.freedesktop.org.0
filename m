Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6062A0BE56
	for <lists+dri-devel@lfdr.de>; Mon, 13 Jan 2025 18:09:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B0510E741;
	Mon, 13 Jan 2025 17:09:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="oAG6UWF7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44D4E10E741
 for <dri-devel@lists.freedesktop.org>; Mon, 13 Jan 2025 17:09:13 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 099B61C000D;
 Mon, 13 Jan 2025 17:09:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1736788151;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xeK4ybvTc0aT9fu2l4Odc4MItpznwrSqWdmIurvT5jI=;
 b=oAG6UWF7fHRO4VXkj1Mw6gWcz4tqR+MURyMzJZ4HLxlff8wy8ayepdx16QgkAfCl3WvScm
 tXG8W1D99E0tR/slPKU4xGcp+Z7Ux+2Ni4JIqFgR7zuruxebR8dMmhiexiWVxaMufJsP7D
 /uJQDfpSaAh7SXacDRUOf90vxZTaRUZaiKpkHcTUKuuKJm/mIlfDrehtXEt2tjNaIttP4o
 XLWZImhLA+VEEkaEoAngo9cxP+YFvH/YZ9FdzMRHThaHQm3w6DW+7hmn6qjDQrgB0oH7A8
 7vFnDiD4iy4HrqD2Hw6MiPuhHG+7NQI0JIos0HHisdE0SYgxeJumY0V8rQ7A3A==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH v7 0/7] drm/vkms: Switch all vkms object to DRM managed objects
Date: Mon, 13 Jan 2025 18:09:01 +0100
Message-Id: <20250113-google-vkms-managed-v7-0-4f81d1893e0b@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAK1IhWcC/3XQ3U6EMBAF4FchvbbaTv9gr3wP40Whs2zjlipFs
 mbDu1vYKEbYu06T8/VMryRh7zGRQ3ElPY4++djlwTwUpDnZrkXqXZ4JMJBMAadtjO0Z6fgWEg2
 2sy06Ki02VSU1t8aQnHzv8egvi/ryept7/PjM+HC7JLVNSJsYgh8OhesDDT41Tz8H2uFlIHPy5
 NMQ+6+l3siX6NKk5HK3ycgpo8bWZV1WwDkTz3WMw9l3j/mxRRzhjwJmX4GsHGXOS6WExXqriFW
 pOOwrYu5iWOm0daDBbRX5q3DG2b4is4KOSashM7izkVoVDne6qKxwW2smmcBKs62iVwXEnS56V
 lRjnFaN0+Lfv0zT9A2NLH26UAIAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3956;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=rBpz8DpQMPrfunB8FYT/56fa5yAGFi6jKRWISgq4hNk=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnhUizsFA2DVMCRycKM33CYjDLdYUuZckV6Whz/
 vNnZNQW8S6JAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ4VIswAKCRAgrS7GWxAs
 4s1lD/9OkyCvwptT5kDps9cf9XGyiFm0+8bOyAeu+l4MOXR/IbMYKaRUdS9OOx4PAVwZioniuXV
 /R0Ebge7vAgKUxJC4+AYChRYcoCGgxEphEckrHmsOAgngDCZT5rr3dmZwBX4vJM+Svcg/LFhsI7
 w2mp1vCs/EqowDNd9GKRvWbimKbo2Cd4RNlk3Gji/ZhCyY9/QejSdZVW3c9cp1XIubIcs4/vHgK
 SdQ/p80qeooVDa6x38YbWF99nmn1YSPBfWDsVFatPLq20X0S50j5+11Ocrt7YWkncOw43Q2xNKG
 yC68IwecpNMeaMY+e34mV/kk4J824fmtzPVB+xb0rItOv395pja6+XAZpW4MB+5gOd8fJdxT3jT
 a7AbmIynBnOhcjLOIZhCcy4WzU7eXYGLn6mnB35ocr+2AutIxXU4yQaJyZIxCe7jFD+/kWbXmcm
 CP7GXSTMFf/qKorH/TSqpQZXnQm9hJ2fZRoyMZ509MterOx9Xk9KtDYAwOwlJIPsIHORN04oVOT
 PiIWxD230MvnBWVjnmsGtKCZZrO/XqTe2p6dcY6WcZGzJ3wd2RdNTIDCvxOCEDoV/Y1LggPci+e
 3+AOdPeozbhd/fUg20R5p2cqGbYvH74yyA/2q0qLtjaUCOxZsMUqtiiCN3XIQjKM0qABVfisOzP
 WPkLCFjZnLe4mQg==
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

PATCH 1/7: Migrate connector managment to drmm
PATCH 2/7: Migrate encoder managment to drmm
PATCH 3/7: Migrate connector management to drm
PATCH 4/7: Create a helper to initialize drm_writeback_connector (common
           part between drmm and normal variants)
PATCH 5/7: Ensure the proper clean of drm_writeback_connector after a
           failure during init
PATCH 6/7: Create the drmm initialization for drm_writeback_connector
PATCH 7/7: Migrate writeback connector management to drm

For the drmm_writeback helpers, you can find some discussions here [3].

[3]:https://lore.kernel.org/all/20240906-writeback-drmm-v1-1-01ede328182c@bootlin.com/

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
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
Louis Chauvet (7):
      drm/vkms: Switch to managed for connector
      drm/vkms: Switch to managed for encoder
      drm/vkms: Switch to managed for crtc
      drm: writeback: Create an helper for drm_writeback_connector initialization
      drm: writeback: Add missing cleanup in case of initialization failure
      drm: writeback: Create drmm variants for drm_writeback_connector initialization
      drm/vkms: Switch to managed for writeback connector

 drivers/gpu/drm/drm_writeback.c       | 185 +++++++++++++++++++++++++++++-----
 drivers/gpu/drm/vkms/vkms_crtc.c      |  14 +++
 drivers/gpu/drm/vkms/vkms_drv.c       |   9 --
 drivers/gpu/drm/vkms/vkms_drv.h       |   3 +-
 drivers/gpu/drm/vkms/vkms_output.c    |  26 ++---
 drivers/gpu/drm/vkms/vkms_writeback.c |  21 ++--
 include/drm/drm_writeback.h           |   6 ++
 7 files changed, 201 insertions(+), 63 deletions(-)
---
base-commit: f8a2397baf041a5cee408b082334bb09c7e161df
change-id: 20240521-google-vkms-managed-4aec99461a77

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

