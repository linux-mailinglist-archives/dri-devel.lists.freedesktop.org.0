Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C14FFCD579E
	for <lists+dri-devel@lfdr.de>; Mon, 22 Dec 2025 11:11:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B465F10E270;
	Mon, 22 Dec 2025 10:11:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="fMOECZ/s";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C2DA10E270
 for <dri-devel@lists.freedesktop.org>; Mon, 22 Dec 2025 10:11:13 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id 7352E1A236D;
 Mon, 22 Dec 2025 10:11:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 3D091606C1;
 Mon, 22 Dec 2025 10:11:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 1E99610AB0199; Mon, 22 Dec 2025 11:11:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1766398270; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=Jh3eRDw2XWfRehNAGfzcGYKG8Odq8fhw8NowBDA6wAw=;
 b=fMOECZ/sbBnYIuPFApgH//qSP4WHiksb/lesOuY2hOu0zYzQpUiy6NesQhrg2PwKdOntP3
 OI+VsQgQNU7UUkswqmeGVMJNfsV3KUXXrFEfd5nFqAOczwDACKujLxy0vnj2FZM1tNCm0D
 xqQ1hLyuepgNpFDI+ByZzHH8VbGq0sXeDW71HszcbnGcO2dAhRHI5APGSyb6O0Rc7GXebt
 n7YDbBHrQbiDdTmLxM196VtKxzxcUF149lZoEOwz5icpP8Fq2OVQGlhIEHGcJp4pqXbn61
 /JHM1d2wfLevK1lOGRIgoAPIJNUsnZNIGQ7U1aWLaojq2MMuBnBUp6LNjpjfqw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH v3 00/33] VKMS: Introduce multiple configFS attributes
Date: Mon, 22 Dec 2025 11:11:02 +0100
Message-Id: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIADYZSWkC/2WO0Y7CIBBFf6Xh2XGBta31yf8wPkCZ6sQCu4DEj
 em/i1UTN77NneSce68sYiCMbFNdWcBMkbwr4XtRsf6o3AGBTMlMclkLLlrIJxtBjSP03g10AG1
 4LxUX61UzsEL9BBzoMht3+0cO+Hsu4vR4Mq0iFtpaSpvKBAuWYv/1OsDhJbE7eaSYfPibp2Uxo
 88V648VWQAH1bYNb+vadNJstfdpJLcsRbMtyzeD7D4Nshg0Sq47PYhVg/8N0zTdANXyGRwsAQA
 A
X-Change-ID: 20251017-vkms-all-config-bd0c2a01846f
To: Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com, 
 Jonathan Corbet <corbet@lwn.net>
Cc: victoria@system76.com, sebastian.wick@redhat.com, victoria@system76.com, 
 airlied@gmail.com, thomas.petazzoni@bootlin.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>, 
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito@redhat.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6712;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=XCHr5I3duMEU8g2MaGBn8/hL+yd1k5QgRHLjF7eeXyw=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpSRk/abtc9nSJuxfAtzBG7UKsgjDXME74+ZdDZ
 UuZUL3dlgWJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaUkZPxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOLbeBAAoCUPDr4BEQ07Dz+T9CIQLA+TZNs1ch7
 AFf4ET2zlBatcq2Qdw+3dO7DhUWGjq3s1rxZ14aUfZBGa/o+HhbGpXP5BkXTMHJKryu8hbucsX/
 iun7SdyZYa6t+lBp25D/PcOqlP46JGxUMfLxz5+dT/s7P2aHDtC7Ryd71Rz8CE6p5CI+qWfnFeW
 JoB1ywfOgVaKZfy9L4yIOXtjO6JjizmCV/gR7JUu3k5zn6cV8NuwDxjiNhJpc+o2fV2ZZrJuAx6
 zHEbADAQJ3KEq+jrZ0Oop0B5/Qj3ym9V3nFurXUPREryvfpkii2Jh1KOtCLgwngX7pYHNazTsCM
 7dQk20Dizyr0CjWFCOlwbSGr6bFLxS22BCekdCmHDkur7ksM/Slgmu/WwbcVv4JIdhIOuhTw9R9
 wnFTSWY2RhT08DR/FRONpeU6Fc3rpA6h1c0gthuFmz/7NTVMomLj8WPh9+vz7gLiMfm1Eqyf+12
 O1ZmpTcYvN6ODIqcN6Gk6/P7HFUdCnRKMQvSSE2W9cFmimuOpCXMTKpxhmcFhafgDlty9E9Ym2w
 Z+ittGqCQTZqFrNH8ikMJInSjg4k6Oth6C3w4bHpARmRWOFK+Je4KwZ5Cbjr8LgdMMBntrUdqzb
 9/ROhqHTDi4lLQyYYoxTXE39ljZN/M8M1Q1ExR5igCmAS+jS3lRE=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
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

VKMS have a wide range of options. The aim of this series is to introduce
many configfs attribute so VKMS can be used to test a wide range of
configurations.

PATCH 1,7,10,13,23 are to expose human readable strings from drm core
PATCH 2-4 are to expose human readable plane type in debugfs
PATCH 5,6 plane attribute
PATCH 8,9 plane rotation
PATCH 11,12 plane color encoding
PATCH 14,15 plane color range
PATCH 16,17 plane format
PATCH 18 properly use zpos
PATCH 19,20 plane zpos
PATCH 21,22 connector type
PATCH 24,25 connector supported colorspace
PATCH 26,27 connector EDID
PATCH 28,29 preparatory work for dynamic connectors
PATCH 30,31 dynamic connectors

PS: Each pair of config/configfs patch are independant. I could
technically create ≈10 different series, but there will be a lot of
(trivial) conflicts between them. I will be happy to reordoer, split and
partially apply this series to help the review process.

PS2: I will apply the patches 1..5 after my holidays, they are reviewed
twice.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
Changes in v3:
- Added Documentation/ABI (Thomas Petazzoni)
- PATCH 2: Clarify return value
- PATCH 6,7: Avoid passing null to printf
- PATCH 7: Restrict plane name to A-Za-z0-9
- PATCH 12: Fix missing s
- PATCH 13: Add macro to avoid repetition, fix missing s, make code
  consistent, remove wrong comment, properly check bit values
- PATCH 15: Fix missing s
- PATCH 16: Fix missing s, make code consistent, remove wrong comments,
  properly check value and fix default_color_range value
- PATCH 17: Create function to reduce code complexity, fix missing s
- PATCH 18: Fix parsing, rename data, reject strings > 4 chars
- PATCH 20: Remove duplicated lines, fix test comments simplify conditions,
  remove useless documentation, 
- PATCH 21: {Min,Max}imal -> {Min,Max}imum, simplify commit log
- PATCH 25: Fix wrong comment
- PATCH 26: Rename type to colorspaces
- PATCH 27: Improve comment, avoid useless iterations
- PATCH 28: Fix typo in commit log
- PATCH 29: Fix typo in commit log
- PATCH 30: Remove useless include and move it to proper commit
- PATCH 32: Clarify documentation
- PATCH 33: Simplify code and use better variable names
- PATCH *: Fix EINVAL/EBUSY
- Link to v2: https://lore.kernel.org/r/20251029-vkms-all-config-v2-0-be20b9bf146e@bootlin.com

Changes in v2:
- PATCH 1: reorder includes (José)
- PATCH 2: use name property instead of folder name (José)
- PATCH 3: Fix default rotations (José)
- PATCH 3,5,7,12: Add tests and extract validation for planes (José)
- PATCH 3,5: Do not create color range/encoding properties if not set
- PATCH 5,6,7,8: Set plural form for vkms_config_plane fields (José)
- PATCH 4,6,8,13: Remove checking for default in supported (José)
- PATCH 9: Add break in vkms_config_plane_add_format (José)
- PATCH 12: fix zpos_enabled typo (José)
- PATCH 13: fix documentation (José)
- Add debug display (José)
- PATCH 20: use drmm_kzalloc instead of kzalloc (José)
- PATCH 22: simplify the code (José)
- Link to v1: https://lore.kernel.org/r/20251018-vkms-all-config-v1-0-a7760755d92d@bootlin.com

---
Louis Chauvet (33):
      Documentation: ABI: vkms: Add current VKMS ABI documentation
      drm/drm_mode_config: Add helper to get plane type name
      drm/vkms: Explicitly display plane type
      drm/vkms: Use enabled/disabled instead of 1/0 for debug
      drm/vkms: Explicitly display connector status
      drm/vkms: Introduce config for plane name
      drm/vkms: Introduce configfs for plane name
      drm/blend: Get a rotation name from it's bitfield
      drm/vkms: Introduce config for plane rotation
      drm/vkms: Introduce configfs for plane rotation
      drm/drm_color_mgmt: Expose drm_get_color_encoding_name
      drm/vkms: Introduce config for plane color encoding
      drm/vkms: Introduce configfs for plane color encoding
      drm/drm_color_mgmt: Expose drm_get_color_range_name
      drm/vkms: Introduce config for plane color range
      drm/vkms: Introduce configfs for plane color range
      drm/vkms: Introduce config for plane format
      drm/vkms: Introduce configfs for plane format
      drm/vkms: Properly render plane using their zpos
      drm/vkms: Introduce config for plane zpos property
      drm/vkms: Introduce configfs for plane zpos property
      drm/vkms: Introduce config for connector type
      drm/vkms: Introduce configfs for connector type
      drm/connector: Export drm_get_colorspace_name
      drm/vkms: Introduce config for connector supported colorspace
      drm/vkms: Introduce configfs for connector supported colorspace
      drm/vkms: Introduce config for connector EDID
      drm/vkms: Introduce configfs for connector EDID
      drm/vkms: Store the enabled/disabled status for connector
      drm/vkms: Rename vkms_connector_init to vkms_connector_init_static
      drm/vkms: Extract common code for connector initialization
      drm/vkms: Allow to hot-add connectors
      drm/vkms: Introduce configfs for dynamic connector creation

 Documentation/ABI/testing/configfs-vkms         | 256 +++++++
 Documentation/gpu/vkms.rst                      |  45 +-
 drivers/gpu/drm/drm_blend.c                     |  35 +-
 drivers/gpu/drm/drm_color_mgmt.c                |   4 +-
 drivers/gpu/drm/drm_connector.c                 |   1 +
 drivers/gpu/drm/drm_crtc_internal.h             |   6 -
 drivers/gpu/drm/drm_mode_config.c               |  16 +
 drivers/gpu/drm/vkms/tests/Makefile             |   3 +-
 drivers/gpu/drm/vkms/tests/vkms_config_test.c   | 244 ++++++
 drivers/gpu/drm/vkms/tests/vkms_configfs_test.c | 102 +++
 drivers/gpu/drm/vkms/vkms_config.c              | 340 ++++++++-
 drivers/gpu/drm/vkms/vkms_config.h              | 573 ++++++++++++++
 drivers/gpu/drm/vkms/vkms_configfs.c            | 953 +++++++++++++++++++++++-
 drivers/gpu/drm/vkms/vkms_configfs.h            |   6 +
 drivers/gpu/drm/vkms/vkms_connector.c           | 170 ++++-
 drivers/gpu/drm/vkms/vkms_connector.h           |  39 +-
 drivers/gpu/drm/vkms/vkms_crtc.c                |  11 +-
 drivers/gpu/drm/vkms/vkms_output.c              |  13 +-
 drivers/gpu/drm/vkms/vkms_plane.c               |  72 +-
 include/drm/drm_blend.h                         |   2 +
 include/drm/drm_color_mgmt.h                    |   3 +
 include/drm/drm_mode_config.h                   |   3 +
 22 files changed, 2796 insertions(+), 101 deletions(-)
---
base-commit: 8e7460eac786c72f48c4e04ce9be692b939428ce
change-id: 20251017-vkms-all-config-bd0c2a01846f

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

