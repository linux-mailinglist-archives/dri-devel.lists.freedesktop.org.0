Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE30A95184F
	for <lists+dri-devel@lfdr.de>; Wed, 14 Aug 2024 12:06:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8881F10E27A;
	Wed, 14 Aug 2024 10:06:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="Rn42RNkl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net
 [217.70.183.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C86010E27A
 for <dri-devel@lists.freedesktop.org>; Wed, 14 Aug 2024 10:06:46 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id A0043240004;
 Wed, 14 Aug 2024 10:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1723630004;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=NYc690m3jlqMQIbbYnvvIiqzbdiOT8lJJYhlVIWqL+4=;
 b=Rn42RNklbrjC6iMYoxN6SRytNi7lbUOSp1GpODKA3kK8AWKXiz0kMNKb3g03GRMOxAM/Ix
 tGoTeONI9Mso+M/Yl7mOIm9EYoXA8UphpCNqq9OnZUIc3BIgq4yestU2kjfKAV6UfuUEZF
 BM6WikvbdLu8DP1EYENP/fu3VS7/6Lu2mm47sJurArGGyxOITEcmgmEc26MJ+iY+VmmAEV
 0o8rVMRwe0GM5JDoOf5uOqQJFMIDWep/ZgbfH5hQoVGFLFjPDEoU/wrdOj+pIySI4taCIe
 3P86JVVUQvLcgDwP0vh94fskkS/3PGSm4c3mF0KiUwhIo8ih1xytrFrHOdFW0w==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH RFC 0/4] drm/vkms: Switch all vkms object to DRM managed
 objects
Date: Wed, 14 Aug 2024 12:06:33 +0200
Message-Id: <20240814-google-vkms-managed-v1-0-7ab8b8921103@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKmBvGYC/5XRUWvDIBAA4L8SfN5tmhpNwhiDwX7AXkcpxlxSa
 Yyd2rSl9L/Ppt3DHgbdk5563516IgG9wUDq7EQ8TiYYN6aAPWREr9XYI5g2xSSnOadFzqB3rh8
 Qpo0NYNWoemyBK9RVxQVTUpKUufXYmcOsfpKP9zeyvC56/NqlCvG206iAoJ21JtZZ6y1YE/TTz
 wRGPMSLZjEENTdSZ89zHyWt4LibYGIUKKSqWgrOhOjka+NcHMz4mNiXP5IZh4YnfZ9qD85D57x
 VMcCUJ6xsFryqdIcVxTuxvU83apTerNJZXDXHebxyC1FwpiWThaju5G4PrAflTWe0iulHUnPso
 iFK0cqW6rz8nxa2g4mwRtWiv2EFkyzvaFl2RfsbW57P37M//k4YAgAA
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
 seanpaul@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4173;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=GVE1bZ9+AZQFWtRaVy0kBd4xiNgOmkYOy/TyzCncui4=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBmvIGy3jon50JgOL+Sh1RQtoBD8Zmd8ON8rUOq+
 nS+4BdgwjaJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZryBsgAKCRAgrS7GWxAs
 4jIAD/wOL1SEfnxDYQHb0I3lhzDwbcGcr6FXSQIRc9EUpqT0FgKSBfCo3XX+9fWglShZkipJxGf
 /QtqUuCfZnQ8WzB4B7QcLb7yuH7be3lGGRsstE6ALtxrvwZ/G/TCnfi33VtfWozm/1zdEEFx0Gj
 +O3PgIaI7EEeQd1cqLYhpEUlH07j/VjzjAvb04NkpUy2lupx5ZWIfkpNXiYQwPgjc0hN4EIuzZN
 N7Ml0HFLAeIIErcvTeaorD6X/ufk8uS2POUxKxTlDsjN3/TIXBymzzPCjWlm5hCtSq1237NTxnB
 5bqo8KxXn8wOZrUxyUZU66GyaNG0PcaH5ucwgjjO9IbqNakBhxsGWh1Ft/Nl7rVd4gkGcfhbi5m
 RW8g7vSjuNUOlqd8gAw0gB2bTQX6/TVX1cZc/iwCypRVE5uAMMH4E/LnW1KUkk7NbJzFqEIsh8d
 IGKvhV6S/6Nviek98lJDsAc7gAj70UvV71U/87zB2h4VhoXvoy/gxRGYJqMkLdH/TGFzoBePRED
 /E80PcWe/aJb0s4d7PICCdYIneti0DiAZH0HcDLrJCYDpbGNvqqDxMFDmQ5M1ShoONlc2RjApbY
 vwg3ymZ8WCsssTO8rtN8zNzwedzANtr/XffiyG2cxOkxlF9OySCvPis0AH3FTgXqr2PVXMU0JSS
 wDEuAjdHeRCEkew==
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

To simplify the memory managment this series replace all allocation by 
drm-managed one. This way the VKMS code don't have to manage it directly 
and the DRM core will handle the object destruction.

This series depends on [1].

[1]: https://lore.kernel.org/all/20240814-google-split-headers-v1-0-51712f088f5d@bootlin.com/

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
Louis Chauvet (4):
      drm/vkms: Switch to managed for connector
      drm/vkms: Switch to managed for encoder
      drm/vkms: Switch to managed for crtc
      drm/vkms: Rename all vkms_crtc instance to be consistent

 drivers/gpu/drm/vkms/vkms_composer.c  |  30 ++++----
 drivers/gpu/drm/vkms/vkms_composer.h  |   2 +-
 drivers/gpu/drm/vkms/vkms_crtc.c      | 111 ++++++++++++++++-----------
 drivers/gpu/drm/vkms/vkms_crtc.h      |  19 +++--
 drivers/gpu/drm/vkms/vkms_drv.c       | 134 +++++++++++++++++++++++++++++---
 drivers/gpu/drm/vkms/vkms_drv.h       |  45 -----------
 drivers/gpu/drm/vkms/vkms_output.c    | 140 ----------------------------------
 drivers/gpu/drm/vkms/vkms_writeback.c |  28 ++++---
 drivers/gpu/drm/vkms/vkms_writeback.h |   2 +-
 9 files changed, 229 insertions(+), 282 deletions(-)
---
base-commit: 219b45d023ed0902b05c5902a4f31c2c38bcf68c
change-id: 20240521-google-vkms-managed-4aec99461a77
prerequisite-message-id: <20240809-yuv-v10-0-1a7c764166f7@bootlin.com>
prerequisite-patch-id: ae2d8b2efbbaa9decce56632c498c87e708288b3
prerequisite-patch-id: c26b6d4867eaf6566195aa0002765357d4f69f8c
prerequisite-patch-id: 8791d34a6f3148dc518da5249453067e40d346e3
prerequisite-patch-id: 26ec7cd5a449004bcfd6ce483671f87655f8635c
prerequisite-patch-id: 2e855ba871f2e99d4b6b7d85da2ddac6bb32262e
prerequisite-patch-id: 82523a917646793deeec7cdcc7ff286bd924fd21
prerequisite-patch-id: 0e355e5316281f53ab5e97ab6e63b0a682f3eb9e
prerequisite-patch-id: 7a63d245a377d5f5283f48e8f52421b912811752
prerequisite-patch-id: dda6bf4692cd1795c489ff58e72c0841ea8ffbc4
prerequisite-patch-id: f70e535b6086cc587975fbfa75741f485f679a32
prerequisite-patch-id: 6c2aa2645c7d854951608aa4d15a02e076abe1fe
prerequisite-patch-id: dc61c6d3db73053fc36e115af561e0c42b467de2
prerequisite-patch-id: deda292af6d8bbf6762b0bf4d351ffd2225995d8
prerequisite-patch-id: 18554f49b53cbcfd4a8ca50dc83b17dd3cf96474
prerequisite-patch-id: 5633292e10132d29be2467812e6e2e824cfedb67
prerequisite-patch-id: 43f37e9c1bc041d491e41dfb59548ed258a1e071
prerequisite-message-id: <20240814-b4-new-color-formats-v2-0-8b3499cfe90e@bootlin.com>
prerequisite-patch-id: d10db4cb12a88de2e5f6440e9fcf5ddda191e3cd
prerequisite-patch-id: 16bac0ef1f1dc010a72ce2faae66631797d23d3f
prerequisite-patch-id: 8e0e5cc0727e8fd2d14ebafc5538fd987c2dd38e
prerequisite-patch-id: 32bad3bf3df46d042e9edd4c1259c2e2a3fb8975
prerequisite-patch-id: 4bd9e4cef308abd17b7b274a5575a3de73a1503b
prerequisite-patch-id: a98fac5a2c60fe23fbc6a455e9a4ab8b0f187ee8
prerequisite-patch-id: 62c8d109a22b9978f755255b67f13fe74fb7008d
prerequisite-patch-id: baa8da4871dd90b03a07c6d9ddb45e10929ee70a
prerequisite-message-id: <20240814-writeback_line_by_line-v2-0-36541c717569@bootlin.com>
prerequisite-patch-id: df699289213021fa202fcdf1b4bdff513d09caa2
prerequisite-patch-id: 59d021ccb166fbe2962de9cda72aceb3caa9cabe
prerequisite-patch-id: 895ace6d58b3776798791705b7b05e26b8d37c7b
prerequisite-message-id: <20240814-google-clarifications-v1-0-3ee76d7d0c28@bootlin.com>
prerequisite-patch-id: a4408d1de7730262456bdd618d3cb86f5f5b01ba
prerequisite-patch-id: f215b5aee5644d2e5b1b2af0bb0f4f1e7609558b
prerequisite-patch-id: d4f3b4c714324c5f326af3daba394899e6663d75
prerequisite-message-id: <20240814-google-split-headers-v1-0-51712f088f5d@bootlin.com>
prerequisite-patch-id: 55e5c2ded8332cd6600d9c0c2b7be657c793e2a0
prerequisite-patch-id: 88323ab9ea04fb21a0a4c65642bcd499f2354042
prerequisite-patch-id: 437b67cf9bdc036fa7c5e11b5c9ab387b10cc151
prerequisite-patch-id: d34801b7f3035ab15facd42281c1c96e61d35a4c
prerequisite-patch-id: 37862a6437ff407a42e5aaff0b8e742fc9901e03
prerequisite-patch-id: 43a5079497a1579aef713ea9c4ec47ef53a177a2

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

