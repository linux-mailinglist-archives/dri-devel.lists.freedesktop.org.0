Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF94BEC41A
	for <lists+dri-devel@lfdr.de>; Sat, 18 Oct 2025 04:01:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEB4F10E1C8;
	Sat, 18 Oct 2025 02:01:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="wkwf6Z8o";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FAB010E02A
 for <dri-devel@lists.freedesktop.org>; Sat, 18 Oct 2025 02:01:49 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id B1B6E1A14AA;
 Sat, 18 Oct 2025 02:01:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 6F9DC60701;
 Sat, 18 Oct 2025 02:01:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2897E102F236C; 
 Sat, 18 Oct 2025 04:01:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1760752907; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=0rJ/ZQA81E9vXEaDFgAcdrOIrS3KjGGGT4lotjatE8I=;
 b=wkwf6Z8oyG3oJkIvsZ84hlNcL07i4cfRsT/jOVe/9ujKaQbmxfY+IzXtfNDb04aMXDpRAr
 PGtJWa5QCI8Er073AaBnaPIve+fiR+ys/NQuSZhyr/3mebke/qeQdcyxcfDWAHhTOCj6eU
 x8EdT1BKCq6dxNGFMjLHiio0GT8JSAJfrlFTcQMmVLjO2j7pdy944+aUf/1hR57XMNgs+W
 nJUS1pHehkPQlGBl98xBjVFdIt9f9M+832B7Fcs+0hJaQ+bDtoKn76e7aW+J+l1OjbaF5R
 s+2YJO1S+5v2t/kYbKwK0x3jSTPyKFGaFSetNz+KuWaQUlKu/mGgDxxYJpJyxg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH 00/22] VKMS: Introduce multiple configFS attributes
Date: Sat, 18 Oct 2025 04:01:00 +0200
Message-Id: <20251018-vkms-all-config-v1-0-a7760755d92d@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/zWNwQ6CMBBEf4X07GKXCCIn/8N4KLDgKqXaRUJC+
 Hcr6G3eJPNmVkKeSVQRzcrTyMKuD4C7SFU307cEXAdWiU5S1HiE8WEFTNdB5fqGWyhrXSVGY37
 IGhVWT08NT6vxct3Y0+sdxMNWqtIIhbW1PBRR7S1Ylmr/D9DTNHxFlkTM+l9Ev/cMj2mGeYxap
 wgIdycU0/R0Qe7y07m1hrs4qNV1WT68/65z2wAAAA==
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
 linux-doc@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4176;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=003LFn2uy5fqD8k7Z23R5zJkloWbJtxKJcMPqbbJ2ag=;
 b=owEBbQKS/ZANAwAKASCtLsZbECziAcsmYgBo8vT9xPMAzWlcyPCRmLateEQE6vEF/B+OE+RwS
 V1Mhv4JKV6JAjMEAAEKAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaPL0/QAKCRAgrS7GWxAs
 4jroEACf6xghvV2Do8ngGOUIDS4bqHcNRnNW9n14MYRWBInOKrPfdW34NfbDGA3+cFaVu94fkl2
 kNz2kxKYgEOv1OKZnxo1NdU2z2+KiJoocWs5Ppwt4Wo059a3yJWgwXGyUw0I+qACmJ5P2wem+p2
 fb4MiTcXgpZ3HbLs2oZjwow2FuSjjayjm/KJvPuK3vLjJEWNqiSouEp4aHgcLOzuv227nASgBkl
 mP5tVcUbfaLE7v5C2NAwiRAxh/Hzpm2onI4UR7I0QYkcFeSUjXeJFjqs/8ZGJP60zDEflBgNs7l
 +R1AKyTPU4TVZ2XmWaMcCeNRd9aG+Nk76MJaaf1SrHZQAQhbu+8SMRDfyMfvP2WFZBCCFIVZiOv
 xf8P9zw3zC+SPg6fMBgIV+uejEx8TNiC7rpmv/WcFBlAWSLnmc39+bETYMGjmX+xj4oNa48wEOf
 n9hNvzAspEkkjr0lNTwg5SkxTYvra5Iw5isJUc7J5bTS6ho+3jWKgt9hiF1oRjfh5/XMDFu7dZF
 KRaboJUBcGQ+AoCNYWx5KKQ8ikxnboXgAIvRm3yP57DyHtNPrn0UDSKbhoGP8M2k85fHPkEJVqL
 ec8SjWCtql4gR7C+SCGMiQ+q0zyTCY/1UmvgPDXv10u0WTEAyz+vuee8sz7NVKBXfKptWBmq1fH
 6hSo9rbbOY9pQgQ==
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

This series depends on [1] that should be applied soon.

PATCH 1-13 are for configuring planes
- name
- rotation
- color encoding
- color range
- plane formats
- zpos
PATCH 14-19 are for configuring the connector
- type
- supported colorspace
- edid
PATCH 20-22 are to enable dynamic connectors

[1]:https://lore.kernel.org/all/20251016175618.10051-1-jose.exposito89@gmail.com

PS: Each pair of config/configfs patch are independant. I could
technically create ≈10 different series, but there will be a lot of
(trivial) conflicts between them. I will be happy to reordoer, split and
partially apply this series to help the review process.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
Louis Chauvet (22):
      drm/vkms: Introduce config for plane name
      drm/vkms: Introduce configfs for plane name
      drm/vkms: Introduce config for plane rotation
      drm/vkms: Introduce configfs for plane rotation
      drm/vkms: Introduce config for plane color encoding
      drm/vkms: Introduce configfs for plane color encoding
      drm/vkms: Introduce config for plane color range
      drm/vkms: Introduce configfs for plane color range
      drm/vkms: Introduce config for plane format
      drm/vkms: Introduce configfs for plane format
      drm/vkms: Properly render plane using their zpos
      drm/vkms: Introduce config for plane zpos property
      drm/vkms: Introduce configfs for plane zpos property
      drm/vkms: Introduce config for connector type
      drm/vkms: Introduce configfs for connector type
      drm/vkms: Introduce config for connector supported colorspace
      drm/vkms: Introduce configfs for connector supported colorspace
      drm/vkms: Introduce config for connector EDID
      drm/vkms: Introduce configfs for connector EDID
      drm/vkms: Store the enabled/disabled status for connector
      drm/vkms: Allow to hot-add connectors
      drm/vkms: Allows the creation of connector at runtime

 Documentation/gpu/vkms.rst                    |  42 +-
 drivers/gpu/drm/vkms/tests/vkms_config_test.c |  18 +
 drivers/gpu/drm/vkms/vkms_config.c            | 183 ++++++
 drivers/gpu/drm/vkms/vkms_config.h            | 524 +++++++++++++++
 drivers/gpu/drm/vkms/vkms_configfs.c          | 893 +++++++++++++++++++++++++-
 drivers/gpu/drm/vkms/vkms_connector.c         | 137 +++-
 drivers/gpu/drm/vkms/vkms_connector.h         |  36 +-
 drivers/gpu/drm/vkms/vkms_crtc.c              |  11 +-
 drivers/gpu/drm/vkms/vkms_drv.h               |   6 +-
 drivers/gpu/drm/vkms/vkms_output.c            |  19 +-
 drivers/gpu/drm/vkms/vkms_plane.c             |  73 +--
 11 files changed, 1865 insertions(+), 77 deletions(-)
---
base-commit: b291e4f1a4951204ce858cd01801291d34962a33
change-id: 20251017-vkms-all-config-bd0c2a01846f
prerequisite-message-id: 20251016175618.10051-1-jose.exposito89@gmail.com
prerequisite-patch-id: 74083a8806b1f26d9b4cd2a5107c756b971c4d11
prerequisite-patch-id: f982390487699921b625b413e8460d67ca7a74c9
prerequisite-patch-id: 0afca639e43c8fbfea2af1bc395e489efc8e1f10
prerequisite-patch-id: 6285108b2fd90d30d15d4cb4fdddfef953fad51b
prerequisite-patch-id: 2eacf5ad4f25f54a60958aa7a2df633d5642ce2f
prerequisite-patch-id: 81e98ac3aeb3b6128098ab7bab56d3446a3a2705
prerequisite-patch-id: 973f94c4edb4a5822c84a57d4479ca40e9cf25de
prerequisite-patch-id: 0efbaf1b0e962a1c40bf5a744b5089d8be696f62
prerequisite-patch-id: afa0cff94085e6ab216ffd9b99cd3dc882a0a687
prerequisite-patch-id: 3561347f2b586392985a8e3af9ed1c5c7d3eefd5
prerequisite-patch-id: 94030044ae8d404f7cdaed9137bddd59cfb22e79
prerequisite-patch-id: a54b483797d5ffb7ce13b56a8943025181cd0d7a
prerequisite-patch-id: f148fe7f445cb42437e7e2ba8b59e7e0fd40da8b
prerequisite-patch-id: 1ef2045872843670c452816c5d6187b713c9258c
prerequisite-patch-id: 3b9963ea3ae3455ae15ee36b67042c06a2ef6006
prerequisite-patch-id: 519ee42dfabb4de734e41e59bd07d7a723d810bb

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

