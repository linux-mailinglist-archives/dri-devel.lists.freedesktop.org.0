Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3AEFDA14BCB
	for <lists+dri-devel@lfdr.de>; Fri, 17 Jan 2025 10:05:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABB1D10EAB7;
	Fri, 17 Jan 2025 09:05:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="hsgNbAAW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4115F10EAB4
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Jan 2025 09:05:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 7DDAF1C000E;
 Fri, 17 Jan 2025 09:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1737104703;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=t3rWvEZK60hQ17RBhmA2UVqEbd2qu3gk9uKimtSAsjs=;
 b=hsgNbAAWxM+8H1/qTTiBpmQE+Ahq6hCk9KKlzlYcVeL4bcAFfcuvYDMQbGMxh8eD5CTFic
 VMMduU0BgXjp8Z5gG6Uz+OeoEkFra+N8ZMfcE+WK23SYHIt/XSslkvAC3vfB8F/eNBOvXc
 VXoeUitvXsR8uLj0RyR9TuU7sk4SiMbjCmgBpZSK2g8F5Aq5gGhVq9UJ7udF1js9ELNnoh
 Ja6/exxPpjNZXwJ0hMk3/Y+7gAwjTOF9sL8VMvbE56bPfI6yO4d/DhMc64zS4u2p9CPuOC
 cMdy3Sv0sZXVKJyfvP10OxEAWYRZKRuUTIFPz1DNMNkxmObP89WEsXz4uZiOww==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH v4 0/3] drm/vkms: Switch to allocated for drm objects
Date: Fri, 17 Jan 2025 10:04:26 +0100
Message-Id: <20250117-b4-vkms-allocated-v4-0-8ec8fd21aaf6@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABsdimcC/23PwU7EIBQF0F9pWIsCBZWu/A/j4lEeM8RSRkAyZ
 tJ/l2mjJk5Z8SAc7r2QjMljJkN3IQmrzz7ObZB3HRmPMB+QettmIpiQTDNNjaT1PWQK0xRHKGi
 pdkqxZyfbAtLenRI6f17N17dtTvjx2eiyHRIDGekYQ/Bl6GwKNPg8Pvxs6IzncoUC5gxrgqFr/
 yvG+SM9xHiYcMsQYG73llZNGe1RAnJjmQL2YmIsk5/v2yfkmuHoc4npa61Z+Rpia8TFTqPKmyc
 0GAPAJTh941Xxa3Audg3RDOeejLXGMePMrdH/GaJne0bfDGUtyLEVk+pfjmVZvgGo1ceNwAEAA
 A==
X-Change-ID: 20240909-b4-vkms-allocated-9f5508f4444a
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>, 
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito89@gmail.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2456;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=PNKCSwgwfEkCp/cHhPKf+pX9Nl6OyTuv1qUYm8K1uwc=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnih0g5HcQlws8agV9hKok0MfECbFkvM1WDBHvl
 ipKAxOSszmJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ4odIAAKCRAgrS7GWxAs
 4mFoD/9sp0xpNG95H80X2PLJPcoXisIaQhFxZfLsEP9B44W+yhSHIY8Dh2vXIE/ea4SHmshH1S3
 nAI/himd2/OJdnFRZeZZdqWG+5vOhvqGZLGwsIt8mKPW+zHrm0GP1fxHe8y4JzbPh4KYnvB0ymA
 ASFfn4bAPXWHcqK1eQNSBRA0gNds10yCBWOYiyLCmmSjStGc3XoLS3npkyWcB4OR4hOP4T/+9Mc
 F5kW/aTFEQSx2WYQXdVEy8D23MFGw/6ZExNYEN4X+qzbbnor1vLJwCuh/VEb/PNDAqhnvJoGf+P
 AYxuJ/f27hs5b/OB2IL9ldWHNR9YvZhC9ZZg5YoovQhxd+aBN7BmqQGq/5FYimNDjvGoMyFIwhi
 G3cpO56gWnfxO0uYH+eyWGIky4+dWwShS5nzrOmAz+CWHTzS10BT4WC17Pvi9NicQWGTJSo7Nke
 1IeDqgbvXk+WJHjfKiPQnJYYt5+2s7Y2qmnljqx2k30bQdhO12z5G6J1DEGVblRfiY9zsGlCuWf
 jBet25dhHzAufAnHmgyTqtQvNAyqC0GjV9VyUtjx/wZNNB0p7CdlfkzYm+huGDT5hwW1VFN2o4K
 vviXoQ1vyKzEpFUFL5N0Jt67smaIbycaeHiBgFDTreckWrPdouIfyL+aDdWnCA/0tTdc+cXXV2U
 eEpkhj9/Wjl0gQw==
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

Specific allocations for each DRM object is not strictly needed in VKMS
right now, but in order to implement dynamic configuration of VKMS
(configFS), it will be easier to have one allocation per DRM object.

There is no need for a dynamic allocation for the writeback connector as
there can only be one per CRTC

No functionnal changes are intented in this series.

This series requires [1] to switch vkms objects to drm-managed objects.

[1]:https://lore.kernel.org/all/20250116-google-vkms-managed-v9-0-3e4ae1bd05a0@bootlin.com/

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
Changes in v4:
- Rebased
- Add R-by from Maxime
- Link to v3: https://lore.kernel.org/r/20241230-b4-vkms-allocated-v3-0-5dda4c1bd459@bootlin.com

Changes in v3:
- Add R-by
- Fix bug reported by José
- Remove patch to rename vkms_output to vkms_crtc
- Link to v2: https://lore.kernel.org/r/20241122-b4-vkms-allocated-v2-0-ff7bddbf0bfb@bootlin.com

Changes in v2:
- Rebased on drm-misc-next
- Apply comments from Jose
- Link to v1: https://lore.kernel.org/r/20240912-b4-vkms-allocated-v1-0-29abbaa14af9@bootlin.com

---
Louis Chauvet (3):
      drm/vkms: Switch to dynamic allocation for connector
      drm/vkms: Switch to dynamic allocation for encoder
      drm/vkms: Switch to dynamic allocation for CRTC

 drivers/gpu/drm/vkms/vkms_crtc.c      | 32 ++++++++++++++++--------------
 drivers/gpu/drm/vkms/vkms_drv.h       | 10 ++++------
 drivers/gpu/drm/vkms/vkms_output.c    | 37 +++++++++++++++++++++++------------
 drivers/gpu/drm/vkms/vkms_writeback.c | 23 +++++++++++-----------
 4 files changed, 58 insertions(+), 44 deletions(-)
---
base-commit: 6e11ce84c514f3ad8c8c766e1328bf49d80a0325
change-id: 20240909-b4-vkms-allocated-9f5508f4444a
prerequisite-message-id: 20250116-google-vkms-managed-v9-0-3e4ae1bd05a0@bootlin.com
prerequisite-patch-id: b608594ad493a41000ee703792eac4b23f9e35dc
prerequisite-patch-id: 5697aa87c44bbf3eda8a1ba424465dc792545d4c
prerequisite-patch-id: 274d0d4c603d6db7ced0b10153509c82b40ca274
prerequisite-patch-id: 5d35b764a11db0c22162acaf3524e0c6a40087b1
prerequisite-patch-id: ddaf2d9d6e6901923b3b84f0c32139e89a023132
prerequisite-patch-id: c309f210cafc91ec1dc91e4546cefe2b8d701b1f
prerequisite-patch-id: 1cc8ec3deb833570bf6fde605256bd9ddbf04083
prerequisite-patch-id: 52942106bbd11265737c0b41cd90c7b5ca04fd4d

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

