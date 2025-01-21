Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EDBD3A17FF7
	for <lists+dri-devel@lfdr.de>; Tue, 21 Jan 2025 15:38:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24C0610E1F6;
	Tue, 21 Jan 2025 14:38:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="M4U7Kpk7";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::226])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D302210E1F6
 for <dri-devel@lists.freedesktop.org>; Tue, 21 Jan 2025 14:37:59 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7B02FC0013;
 Tue, 21 Jan 2025 14:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737470278;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=i+47+HuB3ZtyAbPzcwUAwbH9v/j+FLax5ctnw2Ib6Lo=;
 b=M4U7Kpk7+5/ONCnuDNZ/GB188F3vrbIHHgPBFk6znywUL+Kvk09Bk3r3YWsNe2KgL5u5Km
 3hI8lROUErrPrmCNTFe7ZjZxsBK/eziS1qLrZqP3g+GKOK0/QSzpFzUDclWGddqNTb3Ikl
 d7KNKJ9iqixOk7a/1emhOetWHb+rAdIl9HX00S1O8HAij49GnyRoiHuvK8IF087fhOX8rF
 DllopERd2FjBT/8CrlNxMs3mJQm5u2+rBy2vZiQ4Qa4IdgENp6SX5lRLi6NoqQNpdf8+Gz
 +lYUEb1c1VfVReTlIvSiM3Xj0BV+2YuG14G3XcrDtthUxk1a7VqTrWZVwcA89g==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH RFC v3 00/14] drm/vkms: ConfigFS interface
Date: Tue, 21 Jan 2025 15:34:44 +0100
Message-Id: <20250121-google-config-fs-v3-0-8154a6945142@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAISwj2cC/23Py07EIBQG4FdpWHuUS9vpdGVi4gO4NS6AnnZIB
 hgBSc2k7y6Dt5hxx+GEj/8/k4jBYCRjcyYBs4nGuzKIm4bog3QLgpnKTDjlLe04g8X75YigvZv
 NAnMEtRed6ns1TDtFyrNTwNmslXwmT48P5OXzMuDrW+HT10bJeFGsNWlspmDBmqjvvg/gcE0Xz
 WKMsqYYm5Kho+w3Q0Drc0FC0mDchCvMwVs4ySAtJgyQBVDQUlMqhRZd294r79PRuNvycc11MDH
 58F7rZ1aD1aYDa6+bZla4QfSCDWxPd7K/4jL/IRjj/B+CF6JVO+xnNgjB6V9i27YPLdXIF5IBA
 AA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4610;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=XJgeK1X12z5Mi6DOWRYHKT1SQFsFHMWBRayIsrdswgc=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnj7E/RMFEU/lpCV+xdxsXPFHfPXHoashgI0t8w
 RHYQy779UWJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ4+xPwAKCRAgrS7GWxAs
 4iU4D/9++Dc4NYhYbMu1MPfiEIPuHTgzzxYLVOaa4lNMh85DJ5J6XyWnoPYVfLGRpRLuXX5H6yJ
 fMrqLXFKuXyyzC708w3NUYTDegk0FgQKaUVXr4+l05R5oRgLoP1qPYsIzaF3rzqvSaG1eloCQlw
 rIeC2h9zzJvo/jcw+L6Z2D9Uk/ILRGX0C736qAiI/f/mu8jQ28/w9XLi/IU0NxO1hRKpSW2lZ8j
 HeXNY8dooarlDBjSVwExPWFkmV40hUB8pJaFSYA+7cSgy8vKikKC9ZztXQZ4ibNV/K21aXVvgUd
 9WAPKYjg1anqxdpE2j3n/MWorfN2eivbk/he3mTONIYmZDzOFdGGuvp8cqwnXgOe9SVWwIYxWDQ
 YWNmZcpwkVCzUWxaFp/dEYNnCjDYbNewsir08+BfLf+1QLUOwHfxz4JIYYIE3HV8Rl9l+Yhrcne
 Cy71asGjnxdcqPVnaPaALPtqE5qqSfm18dPtvSU69ehF3ostoaLzGFmsZEkn3/TjMu0wzrA8LQF
 sfJ65KzB5v/+21tIDLSIau+ObbGde+9b8hBE62DsRjpx8fL3LjTEWvHuJ8mgoV6SKOPTg5FLwXH
 3rfzJrKRcK1LS8lkSS7kW6af+kMGlY6SwD+fk2nNTOoxEukDpHCaSYSn8AouEpkaj4sGtp+js4B
 PVaHQiUIZI5EFpA==
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
	┃  ┃  ┣━ default_rotations
	┃  ┃  ┣━ supported_formats
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
https://lore.kernel.org/all/20250121-google-remove-crtc-index-from-parameter-v3-0-cac00a3c3544@bootlin.com/

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
Changes in v3:
- Rebased on drm-misc-next and 
  https://lore.kernel.org/all/20250121-google-remove-crtc-index-from-parameter-v3-0-cac00a3c3544@bootlin.com/
- Remove color encoding and color range configuration
- Link to v2: https://lore.kernel.org/r/20241122-google-config-fs-v2-0-4b7e6f183320@bootlin.com

Changes in v2:
- Added many new configuration (mainly connector)
- Link to v1: https://lore.kernel.org/r/20240814-google-config-fs-v1-0-8363181907a6@bootlin.com

---
Louis Chauvet (14):
      drm/vkms: Add vkms_delete/create_device helper
      drm/vkms: Cleanup configuration field on device destroy
      drm/vkms: Introduce ConfigFS interface
      drm/vkms: Introduce configfs for plane
      drm/vkms: Introduce configfs for plane rotation
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
 drivers/gpu/drm/vkms/vkms_configfs.c | 1194 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_configfs.h |  128 ++++
 drivers/gpu/drm/vkms/vkms_drv.c      |   21 +-
 drivers/gpu/drm/vkms/vkms_drv.h      |    3 +
 8 files changed, 1384 insertions(+), 6 deletions(-)
---
base-commit: 49a167c393b0ceb592b9d2e65cc4f46bcc707108
change-id: 20240521-google-config-fs-b935b66b8d7b
prerequisite-message-id: 20250121-google-remove-crtc-index-from-parameter-v3-0-cac00a3c3544@bootlin.com
prerequisite-patch-id: f4e26c103417f44bb47682d43e6550299e58b857
prerequisite-patch-id: aefc656e8bc9edfd5527971231b7db23b416a19a
prerequisite-patch-id: 5d4cef18db0f817bc0e9074987c725a9b7739ab0
prerequisite-patch-id: a74401787cc57fd29164dcea46aca9cee3ac50f8
prerequisite-patch-id: f0d5640738b5947ab84272c458a2f729a611ab0f
prerequisite-patch-id: 91ba55d575e4d85500c713079455b112695abecc
prerequisite-patch-id: d8210f842130e4d0b47ef25b4aa1ec41a7e53db3
prerequisite-patch-id: 83a4752516471b5152d5e2cb6b56d7ecaae70f66
prerequisite-patch-id: 5b6aaa13b3e61cee85de8739cc9fa9f0d86e4ac0
prerequisite-patch-id: a65a919c52e47b81af3adaf660f18b4a6f107492
prerequisite-patch-id: d85cd3d48810fa53bda9e97928249c1899898b24
prerequisite-patch-id: c47a619ac3b9b244375776aa03b6c19c32108cca
prerequisite-patch-id: ef3b0b41bcf9e770319b72d866cef880088bdff0
prerequisite-patch-id: d1d7c3323f1a0690f94220e9eb9cc4d6a28df112
prerequisite-patch-id: c87e20092e0a2f6d657837dbf1611b9dbf100b2c
prerequisite-patch-id: c12f46d01d578587d93d20e9d987394ab63a65ab

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

