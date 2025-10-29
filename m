Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CAAEC1B403
	for <lists+dri-devel@lfdr.de>; Wed, 29 Oct 2025 15:37:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5791610E7C3;
	Wed, 29 Oct 2025 14:36:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="BVEpfGO8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C37C89AAE
 for <dri-devel@lists.freedesktop.org>; Wed, 29 Oct 2025 14:36:53 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-04.galae.net (Postfix) with ESMTPS id 1145FC0DA83;
 Wed, 29 Oct 2025 14:36:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 44034606E8;
 Wed, 29 Oct 2025 14:36:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id A8108102F24F9; Wed, 29 Oct 2025 15:36:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1761748610; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=jmYUv2V00UoCMYbVhUgMXX8GG9XVWU7wTruT7EINe3I=;
 b=BVEpfGO8UFCpwaijw+FPufnafc1ANbfwMLb9V1FKdLUtqeiOylZYCo2fezC/KCivbabqgn
 /inS9Qaz9jKwINYN53it+6w8GNobhKXQutndQg6z5v18hy67Fx2n1DWIrPoB+Lq72DJ1LM
 RDS/mIadFYJD7SdBXnWe2eWtEqGLkPAK9WsMFF7biE6xdVbjImUQUZsyaazkhhDGtK9XVN
 kQPxmC252LnpXEwhpLrwcBGqwr2XG7XszunUyUzYLX+z4eLKAkoGjaBZk1SdW9y2UM300N
 VpAfFrNo3ngNpRMz9Rw6rquwNwltwZOAAnIedyrwtoLG0Yk+y4BkplFdrKNUlw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH RESEND v2 00/32] VKMS: Introduce multiple configFS attributes
Date: Wed, 29 Oct 2025 15:36:37 +0100
Message-Id: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com, 
 Jonathan Corbet <corbet@lwn.net>
Cc: victoria@system76.com, sebastian.wick@redhat.com, victoria@system76.com, 
 airlied@gmail.com, thomas.petazzoni@bootlin.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=5317;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=8k4lHzLT7neM0g0BzvOZmUmEADE2dPgk8M+AIwdzG0s=;
 b=owEBbQKS/ZANAwAKASCtLsZbECziAcsmYgBpAiZ6heT2hcGYscwlgCl5EEIjMrJRz6q2Jm3PK
 XwDX7iSAd6JAjMEAAEKAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaQImegAKCRAgrS7GWxAs
 4l7SD/9Blfc5w1B/UdufZVV8UmNkFROrrwX2c6584IO9UVmLLjjYBYVWM8PclIo5Cp5U21PJHgJ
 gRk0mijM+7idSrIkTvJR6PY4M5x26JN1UtYzU5eXDqPBqr7J+ConaVBOCBAuspWWb1lWrjj6Lsh
 L7K2mSo4ldOuwMclzTEQ+1sC+ChgMMKq/XYE5DJfJlmzUFAL5jdZ1knmlB1+3s+J58Y4hPtt27Y
 gBZsG4A8zj8riM1TlSRs7+gZ54vNst5GXDpl89wOTXzk8/e8XNMSrfczRRhW5jXyo/Wnw/oYYDK
 thoJv30bs3kFjx88OmuH/eeZ+6iYV/1/iYVDjo8ZRcgG/5/gZvcCC4BwR376vjPFFObgbZ3+qkX
 33kf15n44VvdGDAYA3gyu8R3ZuxqqqoQAghhpvDlOQwONAIcNwCmzxNffcERVMwOPLaITQngb0G
 wH/1B3H/EzPtzQBV8fj38rBl96uZgHa20JnJ1iJAe8P66mbjWw9p6TEFsJcvKAk/Ukkkel9/XIb
 7PXgs77C4/qHca0LtZPukhFuVFS1fvg5o6nWyYtMgJWdXjEayAZEgdGI1tolpMx5TEBYNO98ukM
 BZytMoifdl+9aWjXjqJiQ3Fu9X9cTXpf/8BCn8ALbmc9jerB9t7444QstYA2LW0ymoWQn2Uts6j
 JbrF1a6aOg2EVpg==
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

PPS: Resend because it was rejected by dri-devel

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
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
Louis Chauvet (32):
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

 Documentation/gpu/vkms.rst                      |  45 +-
 drivers/gpu/drm/drm_blend.c                     |  35 +-
 drivers/gpu/drm/drm_color_mgmt.c                |   4 +-
 drivers/gpu/drm/drm_connector.c                 |   1 +
 drivers/gpu/drm/drm_crtc_internal.h             |   6 -
 drivers/gpu/drm/drm_mode_config.c               |  13 +
 drivers/gpu/drm/vkms/tests/Makefile             |   1 +
 drivers/gpu/drm/vkms/tests/vkms_config_test.c   | 247 +++++++
 drivers/gpu/drm/vkms/tests/vkms_configfs_test.c | 102 +++
 drivers/gpu/drm/vkms/vkms_config.c              | 333 ++++++++-
 drivers/gpu/drm/vkms/vkms_config.h              | 577 +++++++++++++++
 drivers/gpu/drm/vkms/vkms_configfs.c            | 939 +++++++++++++++++++++++-
 drivers/gpu/drm/vkms/vkms_configfs.h            |   6 +
 drivers/gpu/drm/vkms/vkms_connector.c           | 168 ++++-
 drivers/gpu/drm/vkms/vkms_connector.h           |  38 +-
 drivers/gpu/drm/vkms/vkms_crtc.c                |  11 +-
 drivers/gpu/drm/vkms/vkms_drv.h                 |   5 +-
 drivers/gpu/drm/vkms/vkms_output.c              |  19 +-
 drivers/gpu/drm/vkms/vkms_plane.c               |  79 +-
 include/drm/drm_blend.h                         |   2 +
 include/drm/drm_color_mgmt.h                    |   3 +
 include/drm/drm_mode_config.h                   |   3 +
 22 files changed, 2534 insertions(+), 103 deletions(-)
---
base-commit: 57fe8285dc4764171fa9eb1f153cae3bb313d6fc
change-id: 20251017-vkms-all-config-bd0c2a01846f

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

