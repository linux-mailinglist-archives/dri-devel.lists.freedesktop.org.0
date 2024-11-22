Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA089D6243
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 17:28:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 400EC10EC10;
	Fri, 22 Nov 2024 16:28:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="XYlXDhrJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net
 [217.70.183.199])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1155310EC10
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 16:28:02 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A7082FF80A;
 Fri, 22 Nov 2024 16:27:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732292881;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LU6gbsQShqZCx3WrJuxI/JRiigMCYgE3TNnA7yxnsb8=;
 b=XYlXDhrJ5XnMql26AwcYg/+8bqgUD2W0T+Oi6QCOGbInqV69zQkQOLkTLUP/vDHlEQZR6N
 QFbXz3nwN1yxKPk1DRRZVH7U8GgfQ5qHgeRwTtIPxkMI/iho2afDvccHaQpvXI2eiePNBj
 yJxlfEza7Ot4uAF3MEjJ2zsB4Bcf9y4I4ouGUPI3WYiNff32e2Ab+sBv/0Uc08CzHDLgOQ
 UXrTEqB2yQZJJgJBPnfZ+tNcFizxmr/c+C9DMQjn3vycj0cmo6fIOAQ8bkQrPhSrlfeguz
 RfrSixOCngZmP+NhhSiMJYi4pHHF7+HBIQ6sVUXv8NInDThnpIPHx9B7xKHMmQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH v5 0/5] drm/vkms: Switch all vkms object to DRM managed objects
Date: Fri, 22 Nov 2024 17:27:55 +0100
Message-Id: <20241122-google-vkms-managed-v5-0-1ab60403e960@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAuxQGcC/23PTW7DIBQE4KtYrEsLz9jYWfUeVRdgXhzUAClQl
 Cry3Usc9UeNdwzSfAwXkjBaTGTXXEjEYpMNvobuoSHTQfkZqTU1E2AgWAecziHMR6TlzSXqlFc
 zGioUTuMoeq6kJLV5iri351V9eb3liO8fFc+3S6JVQjoF52zeNSY66myanr4P1OM5k2vzYFMO8
 XOdV/haXZcMXGwuKZwyKpUe9DAC56x91iHko/WP9bFVLPBHAbmtQFX2ovZF17UK9b3S/iojh22
 lvW6RbDC9MtCDuVfEj8IZZ9uKqAoaJlQPlcF/P1qW5Qu/J07vxAEAAA==
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
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2863;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=ZhfnABr7/0v+IKoElmwmDDns/QME0eBgVjAC+RDBUrM=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQLENlewUY9ZaxyWAoiGc7hbws81gacGor/kB/
 gxFoQmajmSJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0CxDQAKCRAgrS7GWxAs
 4rbUEACpMmTvptfzfmQ1qjJsGJndT4acpMhmnI0yh5gim8oY0i7Y+KVbA2kVwvd4uXNTj3OL1QM
 Ak9NB7v2WM9Rg/1xzaFoaH4UDop1QhLL+KYOUnINpSgr7wa65B47x71UGgvxXPEuq6IhL3G0KTn
 OZMhCyjmVsvFlf/HGNQhE7Re6Daflnun7W16dzNpL0ApLmkTxmP4MQVFd0OFaKFVQTVph9W1+jg
 0MAi7cgq1KCxYpaxTMaLh+MJDGoNLtTeeQjfLVsKhzpEhuSPBr4YU0gEg0t9e6zwn+2LLo2Wfza
 hf8men2vW/WNL3YTLzQqU+hXfm7MCyBeVgPuskxSHU7YcnQiTxyiZnWjHV84nsTBNelJqJ6eFZl
 J9hjfSUzmWZuw38j8K1lO/vaEFHH0nIQ7REgUCQv+XYqh/4q6G8ObQdNSLHlv+l7/YXoKBlabK6
 BwJAQkuTjppcJnvPARx2O6MVk75vkb4ecydEFK0o3n1FyshSLByGXlVJ63mG4sN2KuSmSjCWhAA
 4q3Dt/vDp9WgvqBatk/HhmdHZj9sLJY6qmPO8pWdpMiKgWAYRWC+71d6G5+TDOamX9HoCQkd2Q8
 zEo9uTh16+rEbS+lMWoRvCNBx96FTewa1JRQ4RsUzBldeQhBm4A3mcQxF76nx0eKkR8anRZVUTs
 wEIp8EpzUccYxGQ==
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

To simplify the memory managment this series replace all manual drm 
object managment by drm-managed one. This way the VKMS code don't have to 
manage it directly and the DRM core will handle the object destruction.

No functional changes are intended in this series. 

PATCH 1/5: Migrate connector managment to drmm
PATCH 2/5: Migrate encoder managment to drmm
PATCH 3/5: Migrate connector management to drm
PATCH 4/5: Introduce drmm_writeback helpers
PATCH 5/5: Migrate writeback connector management to drm

For the drmm_writeback helpers, you can find some discussions here [3].

[3]:https://lore.kernel.org/all/20240906-writeback-drmm-v1-1-01ede328182c@bootlin.com/

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
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
Louis Chauvet (5):
      drm/vkms: Switch to managed for connector
      drm/vkms: Switch to managed for encoder
      drm/vkms: Switch to managed for crtc
      drm: writeback: Introduce drm managed helpers
      drm/vkms: Switch to managed for writeback connector

 drivers/gpu/drm/drm_connector.c       |   4 +
 drivers/gpu/drm/drm_writeback.c       | 224 +++++++++++++++++++++++++++++-----
 drivers/gpu/drm/vkms/vkms_crtc.c      |  14 +++
 drivers/gpu/drm/vkms/vkms_drv.c       |   9 --
 drivers/gpu/drm/vkms/vkms_output.c    |  24 ++--
 drivers/gpu/drm/vkms/vkms_writeback.c |  13 +-
 include/drm/drm_writeback.h           |  10 ++
 7 files changed, 235 insertions(+), 63 deletions(-)
---
base-commit: 98efdd02e220fea84c1491012d7292749a71faeb
change-id: 20240521-google-vkms-managed-4aec99461a77

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

