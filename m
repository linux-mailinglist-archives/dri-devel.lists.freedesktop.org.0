Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A772AEC2BA
	for <lists+dri-devel@lfdr.de>; Sat, 28 Jun 2025 00:45:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CCD410EA77;
	Fri, 27 Jun 2025 22:45:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="SfqDyySQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F385B10EA2E
 for <dri-devel@lists.freedesktop.org>; Fri, 27 Jun 2025 22:45:24 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id BE35442FD8;
 Fri, 27 Jun 2025 22:45:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1751064323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=fBhEk0y+kkG2NO+CwyuA0MeXWNge8cPWA71miayVRGo=;
 b=SfqDyySQtqXPqOpMTg5DoPuNPeUv8Rvr2WNwvFwBPOE/0IsbTGkOAQ80fiSTKWFeLQ+kxD
 mLIxgrqMQrGSkj3CqmC/qCCYAcZSj+BhF6X3YWiJZ/0pbTYiuW223/gT2vyW3dpPnUG3GK
 SeLPpIPtvtRBtN5Ya2ZFEwbPMleiBP7pdU5X+O4yW+akVjQMhBR4ygrwofre39qGDY7vuE
 2pqXM1ME27jA+ApD1db56r5iVQ6sQALi405n4BtUvwrWU2oofrukWsmZEASlKOdv9WwTEu
 1lEoi840+mUsjNnnACs5aNlzKswCWD/m/wSJjmYCK6RaW7diz+FoRVtPAlg5TQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH v6 0/8] drm/vkms: Add support for multiple plane formats
Date: Sat, 28 Jun 2025 00:45:14 +0200
Message-Id: <20250628-b4-new-color-formats-v6-0-2125b193f91a@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPoeX2gC/33SwW7DIAwA0F+JOJcNg4HQ0/5j2iEhsCI1oYMs6
 1T130cbdVWVZTeM5GdscyLZpeAy2VYnktwUcohDCdSmInbXDO+Ohq7EhDOOTACnLdLBfVEb9zF
 RH1PfjJlC60yn6rrl0JCSekjOh+OVfX0r8S7kMabva5UJLrczKEH9DU5AGdVovfGOaQH6pY1x3
 IfhycaeXMiJ35kacIXhhalbgcZY7wxzD8xmbgsY0/+kd6i7RrIOlcblK8TvKwD4ynQmURguvNZ
 agdHWLBm8MZJJwVYYLIzzsswEa6GVXTLyzii+1pQsjEGU3AMYq/kjc57Xl9zHZ/kM47xD0jbZF
 afvw7itutTTPmT7fDuUKsexpJ5/AI27FEBPAgAA
X-Change-ID: 20240312-b4-new-color-formats-1be9d688b21a
To: Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net, 
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2894;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=njBSJ7jWH4s1wRr0+Er7niaoVYJmsTfHwo/9xh9DICM=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBoXx791t2lVD3wLDgYSZCnjraoI8T3jKkABi4s9
 K5uSNczOSqJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaF8e/QAKCRAgrS7GWxAs
 4oLFD/sEUjUbLgTAozg62kCj0Yeg6bhtZW8+isVNBSZWDhpXJHjy+MThYLqjf6ZeEco6T0g/a1H
 LvjrtmvMLuyWrBS66QECTVK9dpAJw2TXqJxZulpm762XAvZoyLWOS42OvZN0lfVuMlWgA6LiO7o
 bt8gm/T6VgVkodfMG/OsAOTIT1XXmWzu/nrjzALLSHbJ49Auk8y8dCeIAOxJTnSvWmOMcnHhjxi
 +ckwFP6ffwyRPQuMSfTLa1x3KLvMrejh7K/2Y9HziryqXgymU0V8mhHX5Tg4ecjs3xqFyTmEQLK
 f6Sleaqt8QjTrAh9Vq299lZ6XI01oXJ5dzYdjtrph+pB2QmDCGaMHAoDmmhdrhGsa7i1z7puEJ3
 DFen9pIVn7nSlQuJkvSVGOHoEb/d3hmu0TZ0s8F20gL0UmvvwDgkVBXLiZtXwx36zHByA5ZxWql
 QITKHh3MvFYKor2i9QFjMPUZLmvLwWXVrPJ5KTmbvJ05dz/pkLND6UfEcZ3FgRL+/NK5vC1Gj+/
 Vg/H4LJyzbV2HsmzkTh9xQdYd4vV+msARuQh54tdkUkWDyco4v6tACzQ154YZslw8uUXI4bPu03
 zZBFgfZva7oAyKCdm50mCHPwVJuymNJ7nlcIkh7zEiI9uvXUVWeCFBelvRmLSg/qU+XUi+qLiN3
 Y7w5pEvdVYyCLpg==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdegvdelucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuifetpfffkfdpucggtfgfnhhsuhgsshgtrhhisggvnecuuegrihhlohhuthemuceftddunecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpefhufffkfggtgfgvfevofesthekredtredtjeenucfhrhhomhepnfhouhhishcuvehhrghuvhgvthcuoehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpeetueefgfeffffgjeegjeevledvffdvhefguefgieeufeffleejteeggfelueevveenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecukfhppedvtddtudemkeeiudemgedugedtmegtkeeitdemheguiedumeeifeefleemieeirgeimegvtdejheenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvtddtudemkeeiudemgedugedtmegtkeeitdemheguiedumeeifeefleemieeirgeimegvtdejhedphhgvlhhopegludelvddrudeikedruddrvdejngdpmhgrihhlfhhrohhmpehlohhuihhsrdgthhgruhhvvghtsegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopedvtddprhgtphhtthhopehmrhhiphgrrhgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehsvggrnhhprghulhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepjhgvrhgvmhhivgdruggruhhthhgvrhhisggvs
 hessghoohhtlhhinhdrtghomhdprhgtphhtthhopehsihhquhgvihhrrgesihhgrghlihgrrdgtohhmpdhrtghpthhtohepshhimhhonhgrrdhvvghtthgvrhesfhhffihllhdrtghhpdhrtghpthhtohepthiiihhmmhgvrhhmrghnnhesshhushgvrdguvgdprhgtphhtthhopehhrghmohhhrghmmhgvugdrshgrsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghrthhhuhhrghhrihhllhhosehrihhsvghuphdrnhgvth
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

@maíra: For the patch 6/8 I just removed the comment about yuv input 
size, is it good for you?

This series introduce a macro to generate a function to read simple
formats. It avoid duplication of the same logic for similar formats.

In addition, it also introduce multiple "easy" formats (rgb888 variants)
and also 16 bits yuv support (P01* formats).

PATCH 1 is the introduction of the macro and adaptation of the existing
code to avoid duplication
PATCH 2-5 introduce new formats with the help of this macro.
PATCH 6 adds support for 16-bit yuv formats
PATCH 7 introduces a macro to reduce code duplication between yuv formats
PATCH 8 adds support for P01* formats

I tested the implementation using kms_plane.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
Changes in v6:
- Reformat commit message
- Remove outdated comment
- Link to v5: https://lore.kernel.org/r/20250627-b4-new-color-formats-v5-0-94452f119c72@bootlin.com

Changes in v5:
- Avoid code duplication in RGB565 and BRG565 readline functions
- Properly rename yuv_u8 to yuv_u16
- Fix useless indentatin
- Remove untested formats
- Link to v4: https://lore.kernel.org/r/20250530-b4-new-color-formats-v4-0-ef5f9f48376c@bootlin.com

Changes in v4:
- Update tests to test yuv 16 bits conversions, not only 8 bits
- Link to v3: https://lore.kernel.org/r/20241122-b4-new-color-formats-v3-0-23f7776197c9@bootlin.com

Changes in v3:
- Rebased on new YUV iterations
- Link to v2: https://lore.kernel.org/r/20241007-b4-new-color-formats-v2-0-d47da50d4674@bootlin.com

Changes in v2:
- Add proper casting/type to __le16 when needed to avoid warnings with
  sparse
- Change the function argb_u16_from_yuv8888 to argb_u16_from_yuv161616 to
  support 16 bits values.
- Add support for P010/P012/P016 format
- Link to v1: https://lore.kernel.org/r/20240516-b4-new-color-formats-v1-0-74cf9fe07317@bootlin.com

---
Louis Chauvet (8):
      drm/vkms: Create helpers macro to avoid code duplication in format callbacks
      drm/vkms: Add support for ARGB8888 formats
      drm/vkms: Add support for ARGB16161616 formats
      drm/vkms: Add support for RGB565 formats
      drm/vkms: Add support for RGB888 formats
      drm/vkms: Change YUV helpers to support u16 inputs for conversion
      drm/vkms: Create helper macro for YUV formats
      drm/vkms: Add P01* formats

 drivers/gpu/drm/vkms/tests/vkms_format_test.c | 143 ++++++------
 drivers/gpu/drm/vkms/vkms_formats.c           | 325 +++++++++++++-------------
 drivers/gpu/drm/vkms/vkms_formats.h           |   4 +-
 drivers/gpu/drm/vkms/vkms_plane.c             |  13 +-
 4 files changed, 245 insertions(+), 240 deletions(-)
---
base-commit: bb8aa27eff6f3376242da37c2d02b9dcc66934b1
change-id: 20240312-b4-new-color-formats-1be9d688b21a

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

