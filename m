Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 592688C7764
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 15:18:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1292D10E048;
	Thu, 16 May 2024 13:18:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="F+ojAwUo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1BCD10E048
 for <dri-devel@lists.freedesktop.org>; Thu, 16 May 2024 13:18:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 208996000B;
 Thu, 16 May 2024 13:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1715865506;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=r38SkWJT02vzVpsmmgCroScC+y7qjcBjpOzpqydv7Sw=;
 b=F+ojAwUoeZ2cK2lcdDB8q9C4mA4HBH28l76bKz9J5pBIbSvs3pO9Lbe/CbESvDEz6HR7hw
 R4aINJV/+DVgznc7mndYkPQml1gurnSgpgIYVd2rEnN+AImSiFrHLAUxkLzge1XIhN1mQu
 42wFbvuqHmJNC4eSZxaIbRalZGHvaoHzZWfb2C41ZsrEb26qprAo41nmTAWPJcAmxNFvep
 AlrdPVBRNjRxYfJW8Ld2ELdYijS/AnGhS0OicysjOEYkgO35sFGmtGRPgnZpCTeXR+bv/h
 TeGTSf9XaRzQfMbb4pYOBBHV6NxssX+Zh70w4qWA4/uhtS262+EolzdVahC6lA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH 0/5] drm/vkms: Add support for multiple plane formats
Date: Thu, 16 May 2024 15:18:16 +0200
Message-Id: <20240516-b4-new-color-formats-v1-0-74cf9fe07317@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJgHRmYC/x3MQQ5AMBBA0avIrE2iJYKriEVbg0loZSpIxN01l
 m/x/wORhClClz0gdHLk4BNUnoFbjJ8JeUwGXeiqKJVGW6GnC11Yg+AUZDNHRGWpHeumsVoZSOk
 uNPH9b/vhfT/vQ0jzZgAAAA==
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net, 
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, marcheu@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1163;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=tpNWq4ftrFqRCR+aYnNeh53y/OzEFOCXCa12GAa39cc=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmRgee9I8KcghLcV1lL784C81VLb+SXgvfsg1PV
 WNGQ4bKygeJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZkYHngAKCRAgrS7GWxAs
 4mjsD/9ZxGZ7N4ptv1rZ0ieeGNM2Tm4ozk7M1neTAKtDdvtHH5f5f/rsBZzRDYUhul94NC5snLQ
 tqvJGWRntfXxV8qzzl/aBkaFx27yqySocjszW74+tGOX4ngo9JzRzXwc3lPXhK4ih4zavJNIrQd
 vsFdyxg9fqThh+wHpecC0Ok8cATeDAANUPq55jqT+SVgluBRuUEv6irCFiQHPm3zKJsJrnrBbJn
 Y3mjvSLyZmSJMoAjIW8NyoovvL9PXFu0QpbyUTnJknOGPspQPg+CM4giVQmkqtp/uDr8/YHujrX
 TRopciFXnzXpmzr2bc5auiDmGunqhHtjN81vXdDgau/W5+YBN/uibv4fL4HgMkLfc8tUQB9+FSj
 7RQjdd62s31SfACqrMlgPLIXmdWJXFQPyEMQq9GCuM32SLAM4ms3JVmZvsVTz5LS8I5z2RWwu9/
 tA4x4e3HFFvhhJVoftiJkPpHCSXLzlpHGJMKMFI8lv6JYYZVbjEV0Ag5vunGtc89DA3c3nsyyYz
 lOrCKJJD3/5/2Iq1QkvYTOZiBIraOjoR7tW0KsQr8XjDoazLwNhGId12A+qqDvyIzEdU4LYt6LU
 qUkwDU2Tr+40+l+okzACkjG/+QXQPH+g1/Y7Qb6BF2CGtcij27LaD5PB5q9THiyQ+bsENQDBR1u
 5CJpsZl+INcY7HA==
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

This series introduce a macro to generate a function to read simple
formats. It avoid duplication of the same logic for similar formats.

PATCH 1 is the introduction of the macro and adaptation of the existing
code to avoid duplication
PATCH 2-5 introduce new formats with the help of this macro.

This series must be applied on top of [1].

[1] https://lore.kernel.org/all/20240516-yuv-v8-0-cf8d6f86430e@bootlin.com/

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
Louis Chauvet (5):
      drm/vkms: Create helpers macro to avoid code duplication in format  callbacks
      drm/vkms: Add support for ARGB8888 formats
      drm/vkms: Add support for ARGB16161616 formats
      drm/vkms: Add support for RGB565 formats
      drm/vkms: Add support for RGB888 formats

 drivers/gpu/drm/vkms/vkms_formats.c | 218 ++++++++++++++++++------------------
 drivers/gpu/drm/vkms/vkms_plane.c   |  11 ++
 2 files changed, 123 insertions(+), 106 deletions(-)
---
base-commit: 96b4d11bd9ea36c20bd3428e0932c209ce2e2d36
change-id: 20240312-b4-new-color-formats-1be9d688b21a

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

