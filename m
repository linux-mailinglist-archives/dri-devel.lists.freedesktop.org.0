Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F8AA17C56
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 11:55:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E136E10E561;
	Tue, 21 Jan 2025 10:55:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="WjpoBy81";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay2-d.mail.gandi.net (relay2-d.mail.gandi.net
 [217.70.183.194])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C108E10E560
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 10:55:36 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D5D7140005;
 Tue, 21 Jan 2025 10:55:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737456935;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=lEkb89BSyl8mQqbz4TYHWgwfhqI/R1RhrSZlRBYI3/k=;
 b=WjpoBy81OQhXa74d8bo6w8ArL1gXs8cSnrG6qMfSS0FwlvmCQrUKeMuOGjQiq/AFnuy61u
 aGuI1ZZf8x9ambGdbaKRgwTXeaNPj5sMfzCqr+RebG6G+Di2oBwNVjd2vxNcm/EESXp701
 px2XdwNLB2Rg/oeoqWQ+aq18AF5Ba4A7jOLgBe13Dp97mFP3pyjPF5eqkxboqE0hUuqiI3
 2w3UpP5uWI6Kcpwd2bo068ITqQ9mpLZEOWlWP4hb23lnuKpeSnhRJZK4X7X4iW10iPZnJC
 Et0I8jadXZk4PN0wVW/zH3nPOhxwMV3qusQ4fj/gY3+VfPRpnX8rUqsqhRB2zw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH v3 00/16] drm/vkms: Introduce detailed configuration
Date: Tue, 21 Jan 2025 11:55:24 +0100
Message-Id: <20250121-google-remove-crtc-index-from-parameter-v3-0-cac00a3c3544@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABx9j2cC/42OQW7DIBBFr2Kx7rSGQG1n1XtUXWA8OEgBkoEiV
 5HvXkrUSt1lN3+k//67sYTkMLFjd2OExSUXQw2Hp46Zkw4rgltqZqIXsleCwxrjekYg9LEgGMo
 GXFhwA0vRw0WT9piRwE7azoKbQY+KVdqF0LqtLb1/3DPh9bMO5vuTzTpVYPTe5WO3kAfvknn5P
 SDgltlP8+RSjvTVlAtv1WY3cvmwXeHQwyvyYdKznewi3+YY89mF5yrQVor4I3MuxONkUckjV7I
 fpFAHpf+T933/BshjbUd0AQAA
X-Change-ID: 20240521-google-remove-crtc-index-from-parameter-f9afb21c7a85
To: =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: arthurgrillo@riseup.net, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, Louis Chauvet <louis.chauvet@bootlin.com>, 
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3099;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=UWvvBnCH3LnNOfm+MamiYUnO0Kb+vgf8W4LaXoD2xAc=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnj30fSRhN8HfBuf893AQKWsaWOWccJbMPFPsgC
 OljRx5PP7CJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ499HwAKCRAgrS7GWxAs
 4qV1EADO61gsHDfXqoIpeO3t2vy5yUhjfxNq68ncMuXHbq0RIpbMHH7sAYY4oXXeEufBi6KMjKO
 wyyvAbNl+gCl1xT6HSwiLARfABeVawsBZzlqH2SVKX0L9joC8mekSyb76nXiAbYhf3+o6Q7HSUu
 7kEXzgVOzFxPqeLJkL6MQMCAmrokrf6xFbIHRy2mUbejwUBsSnoZgfb/S9kpg8TlPc50OBdnrk9
 UMUqxqlXGbWJHSv1vMk+RDK2PgrMD19VQJChAGbqi4IjESNqQWvhhOyoElyGBdEKci4agaDR7ga
 rixmmd89tqfVXm92HTmZHy/3VUusphbs2i7JEfi5gDIlTnS2i2FZMLnnfzhftFhczeLQ92Sk5rF
 CS/Wc6O10AjUVwimWDgMnjFdUJSXEbcLG0FpV9ph6caClAtHDtECBBCovOKE6hRWfO6O6jOhU0F
 v3zr6NwsrPtoz3N5qT+QAivtMeEk4jRkDbm7b5CKOHNIwWDYOlhvMrGDerPbeNKhJ88GTAOChMw
 AhKSjUX8Q37YpgJ2XK7yNgQAPyQNNotkgLJukdQyJ8+vmnsO16TEEgnPeOBf0oOQaJZ11v8ugtp
 7+Z/NEwW3kOkluyQcvHpfabtXPCcfyFUGbiyiaTVXZLRnCpM6pBiebmEbIa/XooDTqxpi7nlk/C
 +CW9T3qqO+pUpHQ==
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

The current code is not flexible to configure the VKMS device. In
preparation for ConfigFS interface introduce few structure that can be
used to configure the device creation: `vkms_config`.

This part is splitted from the ConfigFS implementation itself to avoid
mixing two complex interfaces.

The vkms_config structure will allows the configuration of:
- planes
    - name
    - possible_crtcs
    - supported_rotations
    - default_rotation
    - type
    - format
- crtcs
    - name
    - possible_planes [automatically filled by helpers]
    - possible_encoders [automatically filled by helpers]
- encoders
    - name
    - type
    - possible_crtcs
- connectors:
    - type
    - status
    - EDID

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
Changes in v3:
- Remove the plane color encoding/range and not yet supported formats so 
  it does not have any dependencies
- Created a helper to get config for a connector
- Rebased on drm-misc-next
- Link to v2: https://lore.kernel.org/r/20241122-google-remove-crtc-index-from-parameter-v2-0-81540742535a@bootlin.com

Changes in v2:
- Rebased on drm-misc-next
- Added support for many new configuration
- Link to v1: https://lore.kernel.org/r/20240814-google-remove-crtc-index-from-parameter-v1-0-6e179abf9fd4@bootlin.com

---
Louis Chauvet (16):
      drm/vkms: Extract vkms_config header
      drm/vkms: Add a validation function for vkms configuration
      drm/vkms: Move default_config creation to its own function
      drm/vkms: Introduce config for plane
      drm/vkms: Introduce config for plane name
      drm/vkms: Introduce config for plane rotation
      drm/vkms: Introduce config for CRTCs and encoders
      drm/vkms: Introduce config for encoder name
      drm/vkms: Introduce config for CRTC name
      drm/vkms: Add test for config structure
      drm/vkms: Introduce config for connector
      drm/vkms: Introduce config for connector type
      drm/vkms: Introduce config for plane format
      drm/vkms: Introduce config for connector status
      drm/vkms: Introduce config for connector EDID
      drm/vkms: Introduce config for encoder type

 drivers/gpu/drm/vkms/Makefile                 |   3 +-
 drivers/gpu/drm/vkms/tests/Makefile           |   3 +
 drivers/gpu/drm/vkms/tests/vkms_config_test.c | 137 +++++++
 drivers/gpu/drm/vkms/vkms_config.c            | 556 ++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.h            | 237 +++++++++++
 drivers/gpu/drm/vkms/vkms_crtc.c              |  10 +-
 drivers/gpu/drm/vkms/vkms_drv.c               |  42 +-
 drivers/gpu/drm/vkms/vkms_drv.h               |  25 +-
 drivers/gpu/drm/vkms/vkms_output.c            | 192 +++++----
 drivers/gpu/drm/vkms/vkms_plane.c             |  21 +-
 10 files changed, 1088 insertions(+), 138 deletions(-)
---
base-commit: 49a167c393b0ceb592b9d2e65cc4f46bcc707108
change-id: 20240521-google-remove-crtc-index-from-parameter-f9afb21c7a85

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

