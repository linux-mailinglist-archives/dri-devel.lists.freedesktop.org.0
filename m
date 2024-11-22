Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC8FB9D6349
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 18:39:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C70510EC34;
	Fri, 22 Nov 2024 17:39:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="PVVZ35LG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [217.70.183.198])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2AD910E1DD
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 17:38:57 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7E5AEC0007;
 Fri, 22 Nov 2024 17:38:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732297136;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=LA6OyakLQuvSrHMabZthBSfmVd6arfCjXXmOVmw2gb4=;
 b=PVVZ35LGBIUKI5BxqhhnJYRmsfSV4A9qHQ/JntEY1HswTKEEv+cSEGl71JXa1wplBrCIbX
 H4z9XqxzAzHKG9jIOh9GPYQZ+UGn0byvofmTVlG5DP5b2PveAJu7kiBvcQTI8sB5oE86N/
 tknCjBrAyQRd450UZTylTeKga6xoEV9ZBrnUducABxZi+d9SnA18MCx8UOH82lp4/vHQGV
 GqqF6CdlZncJPFSe22lCyXhCuH2cpu4sU9lpWS9tfa18J8hC1NPe4iDnN/P4d1mP9eqfhx
 Uztf5POzGiVC4v255YCtJix1gl6i+oOHyb8lvpZkLDBp0HS6LiDPFgAY7ljghA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH RFC v2 00/16] drm/vkms: ConfigFS interface
Date: Fri, 22 Nov 2024 18:38:26 +0100
Message-Id: <20241122-google-config-fs-v2-0-4b7e6f183320@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAJPBQGcC/43SS27DIBAA0KtErEvLxzZ2VpUq9QDdVlUEZnBQj
 EmBOomi3L3YThZRVSkr/o9hmDOKECxEtF6dUYDRRuuHPGBPK9Ru5dABtjqPESOsICWjuPO+6wG
 3fjC2wyZi1fBSVZWqtVAoH9sHMPY4k5/o4/0NfS2TAb5/Mp+uK0rGSXHOpvVKB4edje3LrYMHO
 KZJcxCjnKPIQeUYKGXsFsO4cxE7OeR1jccSE0ylqkhBODQVeVXep94Oz/mSfyVVLIrse9/KNDk
 sO8YIpbUyRBn1qDPAIb+n9wEbH5xMEY88U4wbIURFG9E2D1GHkHOkZLvb5J2wUae5XTBSl7qsK
 TEV8Iewa6YCOD/mdIfUYjtoOGITvMN7GaSDBGF5dU3LgoiClbyUd/r0g1sbkw+nuVBGOn/hXBM
 1Lf7WxEgnjlec1rQhQlb33OVy+QW2V/mBeQIAAA==
X-Change-ID: 20240521-google-config-fs-b935b66b8d7b
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: jose.exposito89@gmail.com, dri-devel@lists.freedesktop.org, 
 arthurgrillo@riseup.net, linux-kernel@vger.kernel.org, 
 jeremie.dautheribes@bootlin.com, miquel.raynal@bootlin.com, 
 thomas.petazzoni@bootlin.com, seanpaul@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=6450;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=xAuQUHlK03hRjN4XOmIoNH00RPPPEDERRG2D5e/jGXw=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQMGocGsLnX49GezVDJjRfKs/ayRSlCVCQWaCt
 i8N0mYQVnGJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0DBqAAKCRAgrS7GWxAs
 4oEKEACQ4TMs4xTrXTdFhpQutabKQghs79orZoVOZk0Uz/zlza7hqnZf8V6CpvQEFx4VnQX2gc7
 ozCUkn7iTSSmIgxzKhQ7dkQX6TlGTEa04/AuE2zid38feZD+J4N/2Qi+UBIldpOdIcTZsR4cGhC
 TGMEUKHujuBgTOsnv9hVAbR0eRUGjoHcVNiE6uyFFG/5twNaXOME3t7lywGpHdhzDLp5rCm6ywI
 mPK3bAUSPwqR2MmGhxdnkk8bNY1H50dyw7hNGDhjP3bU883OFrgsSvlO1IgzYcP3G46AZ3UXvn+
 UnN3TSs9qEgBS+SOQ7ruzmgPiO3hpqeM4WcNXu8BkWvFlJksZw+LqWnTsRlgGnT3loUTJM7XeUk
 JsJcHVoNJk/PH7oEZ5c9aYMqsZYSt4R1xcFbFj8vyhtPwvQ/Ejwfap44LVP424Z3Yiq9eyTRBaY
 GC7DKxg6mlzKrNdAhBurxynIlXisUTBa/dmFTB4c3PHE21NGowtG9egBYpVtDqnt2h3wG/ccmoO
 quTODjVjj/mbQDWFof/tmZU2J95jp+YIGU/7Hcvup40iWE5/M8CuHPLY4StlItS2LTtrQY39iTP
 h3cfnDK5nUiCVhQ88QK6nrXxdK/vkju4Oa6ZZUtjmImZLtveMgKQcGt3+d5Wnjkq0mS0YeO/Nu0
 ouK5bH2M+GtZ65g==
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

VKMS is manly used to test userspace program and its behavior. The current 
implementation is not very configurable as you can only have one device, 
with few specific planes.

This series aims to introduce a new interface, using ConfigFS, to create 
and configure more devices. This will introduce:
- Device creation
- Plane creation
- Plane configuration (type, color encoding, color range, rotations)
- Encoder creation
- CRTC creation
- Linking between CRTC and planes/encoders

The proposition is:
/config/vkms
	DEVICE_1
	┣━ enable
	┣━ writeback
	┣━ planes
	┃  ┣━ PLANE_1
	┃  ┃  ┣━ type
	┃  ┃  ┣━ supported_rotations
	┃  ┃  ┣━ color_range
	┃  ┃  ┣━ color_encoding
	┃  ┃  ┣━ default_color_encoding
	┃  ┃  ┣━ default_rotations
	┃  ┃  ┣━ default_color_range
	┃  ┃  ┗━ possible_crtcs
	┃  ┃     ┗━ >> /config/vkms/DEVICE_1/crtc/CRTC_1 
	┃  ┣━ PLANE_2
	┃  ┃  ┗━ ditto
	┃  ┗━ PLANE_3
	┃     ┗━ ditto
	┃
	┣━ encoders
	┃  ┣━ ENCODER_1
	┃  ┃  ┗━ possible_crtcs
	┃  ┃     ┗━ >> /config/vkms/DEVICE_1/crtc/CRTC_1
	┃  ┗━ ENCODER_2
	┃     ┗━ ditto
	┃
	┗━ crtc
	   ┗━ CRTC_1
	
This interface aims to be extendable (new property can easly be added in 
objects) and easy to use (objects are created simply by creating folders, 
and configured by writing files).

This series depends on 
https://lore.kernel.org/all/20241122-google-remove-crtc-index-from-parameter-v2-0-81540742535a@bootlin.com
but as this is a bit complex to rebase, you can find a working branch 
here:
https://gitlab.freedesktop.org/louischauvet/kernel/-/tree/b4/vkms-configfs

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
Changes in v2:
- Added many new configuration (mainly connector)
- Link to v1: https://lore.kernel.org/r/20240814-google-config-fs-v1-0-8363181907a6@bootlin.com

---
Louis Chauvet (16):
      drm/vkms: Add vkms_delete/create_device helper
      drm/vkms: Cleanup configuration field on device destroy
      drm/vkms: Introduce ConfigFS interface
      drm/vkms: Introduce configfs for plane
      drm/vkms: Introduce configfs for plane rotation
      drm/vkms: Introduce configfs for plane color encoding
      drm/vkms: Introduce configfs for plane color range
      drm/vkms: Introduce configfs for crtc and encoder
      drm/vkms: Introduce configfs for connectors
      drm/vkms: Introduce configfs for connector type
      drm/vkms: Introduce configfs for plane format
      drm/vkms: Introduce configfs for device name
      drm/vkms: Introduce configfs for connector status
      drm/vkms: Introduce configfs for connector id
      drm/vkms: Introduce configfs for connector EDID
      drm/vkms: Introduce configfs for encoder type

 drivers/gpu/drm/vkms/Kconfig         |    1 +
 drivers/gpu/drm/vkms/Makefile        |    1 +
 drivers/gpu/drm/vkms/vkms_config.c   |   36 +
 drivers/gpu/drm/vkms/vkms_config.h   |    6 +-
 drivers/gpu/drm/vkms/vkms_configfs.c | 1404 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_configfs.h |  128 ++++
 drivers/gpu/drm/vkms/vkms_drv.c      |   21 +-
 drivers/gpu/drm/vkms/vkms_drv.h      |    3 +
 8 files changed, 1594 insertions(+), 6 deletions(-)
---
base-commit: 98efdd02e220fea84c1491012d7292749a71faeb
change-id: 20240521-google-config-fs-b935b66b8d7b
prerequisite-message-id: 20241122-google-vkms-managed-v5-0-1ab60403e960@bootlin.com
prerequisite-patch-id: b608594ad493a41000ee703792eac4b23f9e35dc
prerequisite-patch-id: 5697aa87c44bbf3eda8a1ba424465dc792545d4c
prerequisite-patch-id: 223d59c407ce28dacf3f563b5c0148d2398303f1
prerequisite-patch-id: 720b75b21d06ce3d3f060fb9238f7903834da0e1
prerequisite-patch-id: 30a1e033fa43241ca6a43006fd4f29f8e9217224
prerequisite-message-id: 20241122-b4-vkms-allocated-v2-0-ff7bddbf0bfb@bootlin.com
prerequisite-patch-id: 9741873a5f0a7a3cf117dec7837354c3ad38ac3a
prerequisite-patch-id: 1a383d1494e4f2142b62822f2ba482a3b813563a
prerequisite-patch-id: 7d3f49fee4d3553d52fc075b7868da9dea9209cd
prerequisite-patch-id: 57f5aeff2a9e8f2b6f47569e44dcd8fa587ed4bf
prerequisite-message-id: 20241122-b4-new-color-formats-v3-0-23f7776197c9@bootlin.com
prerequisite-patch-id: e6717b75d79ae5cfb0815bab88d722082107dc0e
prerequisite-patch-id: 4b3b1ea5ad2e3ba1922cd4b3d3d46214b27c8c2d
prerequisite-patch-id: 060874d5a7433cc8cc654bc63e0b411036727ebb
prerequisite-patch-id: 43115d21842e508d9d8b0468e15f67d442bffe3c
prerequisite-patch-id: 627d0970e76d4154c982d0d4172e7a0c4dfb9a4c
prerequisite-patch-id: 582445144ac0ab11175ef96262060b08a5e1467e
prerequisite-patch-id: a98fac5a2c60fe23fbc6a455e9a4ab8b0f187ee8
prerequisite-patch-id: 62c8d109a22b9978f755255b67f13fe74fb7008d
prerequisite-message-id: 20241122-writeback_line_by_line-v3-0-085d5810f6e3@bootlin.com
prerequisite-patch-id: 07868dd9c7bbb1ed96d675c689de86f0cf293248
prerequisite-patch-id: 736638b76050ef7a99cfad2c1560f7af114d5fbd
prerequisite-patch-id: 20d8823f9c1d372ab2b88f969f5110f77e49c7f9
prerequisite-message-id: 20241122-google-remove-crtc-index-from-parameter-v2-0-81540742535a@bootlin.com
prerequisite-patch-id: a71faf4da3bf2d2e3e8744d9ca688d7ad47d86a1
prerequisite-patch-id: aefc656e8bc9edfd5527971231b7db23b416a19a
prerequisite-patch-id: f17cbbe9923f78e4d5fdce56d0fb3c3af1fa3b82
prerequisite-patch-id: d7a7e404fcb1656d722b59ef13da771e6156916f
prerequisite-patch-id: f0d5640738b5947ab84272c458a2f729a611ab0f
prerequisite-patch-id: 26b9a61db21be516a2c84072a71f2c11d21a828d
prerequisite-patch-id: 93571d6f80d345fa5d705d8a677bca183852554f
prerequisite-patch-id: 9c8bee631c4a466b195adbfadb62eb15fa371cce
prerequisite-patch-id: b098550055ebeabd85bc5a5ea7c9aae2a52a4ac8
prerequisite-patch-id: 83a4752516471b5152d5e2cb6b56d7ecaae70f66
prerequisite-patch-id: f02ce6f3ffcb94f955f7b51f6d2120b93cc9f76e
prerequisite-patch-id: 75a8bb8ced4d23de2de8b5355b395171a7782981
prerequisite-patch-id: a6b7a6442de27a3815985a1857ae6eceecc3687a
prerequisite-patch-id: c47a619ac3b9b244375776aa03b6c19c32108cca
prerequisite-patch-id: 4a5efd82cc55ea5897e8bffad0d12f22e4ee3fd7
prerequisite-patch-id: c0de37e1ddbb9c040820a341284cb5814ceb4d71
prerequisite-patch-id: c87e20092e0a2f6d657837dbf1611b9dbf100b2c
prerequisite-patch-id: c12f46d01d578587d93d20e9d987394ab63a65ab

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

