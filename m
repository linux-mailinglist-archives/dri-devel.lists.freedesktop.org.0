Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E909E9D625B
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 17:35:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDDCD10EC15;
	Fri, 22 Nov 2024 16:35:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="IiQIUBUJ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4977610EC0D
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 16:35:14 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0B3D8E0006;
 Fri, 22 Nov 2024 16:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732293313;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=EU4DnaB/CA53h0OcQFrCX75CUQhx9xDEfk3liT83+mA=;
 b=IiQIUBUJZfuwhDaagzN1rvoElRm17ZsDCI994fGk4ih6fjKYXieFtSRjAH+6j2ILusupUf
 Du9BEzs7oxb4EBFBlrDf+799Kd7jpbYsNOCronuY8dNNFAWoZRcRrymup6Z76nFI49EXz0
 rIOIUuLz4H14z4Y8NUXZEvighRXmxL5wka/5fJ4ErBK/KCoevhLFoxGVk5wp2gCZZDFviJ
 XLQc/9El0GE26ezzk4rEzVA7mpuwXGyGmln56hBvcQ5x53Wiuem/zxyi24WTvHIoXBTOSn
 hv+TIgZP2zWfwusFYesBGB4Kc8cLIdOoCweTPqaAVPYjjoTGqEtYBbgKXS8XuQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH v2 0/4] drm/vkms: Switch to allocated for drm objects
Date: Fri, 22 Nov 2024 17:35:08 +0100
Message-Id: <20241122-b4-vkms-allocated-v2-0-ff7bddbf0bfb@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALyyQGcC/22PQW7DIBBFr2Kx7rRAcVSy6j2iLgZ77KAaSIGgV
 JHv3omtLiqVFX8Qb96/i0LZUxHH7i4yNV98ihz0UyeGM8aZwI+chZbaSCstOAPtMxTAZUkDVhr
 BTn0v3ybDBwX/u2Sa/G1jnj72nOnryui6D4XDQjCkEHw9dmMOEHwZXn4vEOlWH6BApeBmwEK8X
 ymtYU5pXmh3CBj5fYTWgwSF7iCNfCV7kO8upbr4+MxLxMPh7EtN+Xur2dQmsTdS+p9GTTFPW3Q
 OURmc7F/euq4/bJBrOjgBAAA=
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
 linux-kernel@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1983;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=5/hbZ+E9BqSb3A600Iqwyv3NoK2rcGUGx/rP095HNXA=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQLK+FwJVDvWLWMSXnTlA1WdOzqsB3odboUWnl
 sgdOkeP6jiJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0CyvgAKCRAgrS7GWxAs
 4l8WD/4rqL7I83iwPXi5DARD+/5Y8ahY9RxM4auBKuphvVgJ/UUGoq7UXFWLsXYMlIlvjgJD+Ly
 S9w/4IoVdW4XNIpLJsSSTpfdHqaI8vyN/74TYbxTG64AsS2eUCHKFZFP7WUVUCsfEaqi5GwzhcS
 5yGf0vC0O5346goPJDoU2e/TwgrCpkZeOMc7CkIXxGvER1bCqt4trgo2Horw/ZE1fY7kkqQCYe6
 hpYOAAqgmZI2uKqVz1nDKu9fJFvSXyjkYBtQnOBG6oNA0GTQXm2W4/7Xl5msvK3IqrnBCnByITX
 JA6ukL2bhUdcvTDBPhVhOexrKzGvmozH430Jdsq6rAzhR+lp8sOdfWyxLVSIeL8o9Cxv9MQFeC0
 wnHn8KCwJp15ef/7cZYds3nKEftffD36VPgfM2AN0QpRg8YBbGg+waugWwOJsi1D9kiXx/OQiwr
 D5K+GYvCW7fmmEN2qanbdaYe3lvBMkJ0AqFWKmA275GmmhYlFoBBRESr0RS+eC/8p5x1GuaRyiy
 DshZRPfuJCqkUjOrLWJx8/5No6pVTqhWslQLdW9oG9SCXIsmLYbjBcCJ3Y3JYHp21BLLjg2V9b7
 p1kUvKySFJQsqwGJPOB23gEJnK6313WoD7Qu1+AEJcBMsqksVkxEmjbpd5FD5LCGCCJdxiMSnzd
 5Sg17qrSO5DkPhQ==
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

[1]:https://lore.kernel.org/all/20241122-google-vkms-managed-v5-0-1ab60403e960@bootlin.com/

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
Changes in v2:
- Rebased on drm-misc-next
- Apply comments from Jose
- Link to v1: https://lore.kernel.org/r/20240912-b4-vkms-allocated-v1-0-29abbaa14af9@bootlin.com

---
Louis Chauvet (4):
      drm/vkms: Switch to dynamic allocation for connector
      drm/vkms: Switch to dynamic allocation for encoder
      drm/vkms: Switch to dynamic allocation for CRTC
      drm/vkms: Rename vkms_output to vkms_crtc

 drivers/gpu/drm/vkms/vkms_composer.c  |  30 +++++-----
 drivers/gpu/drm/vkms/vkms_crtc.c      | 100 ++++++++++++++++++----------------
 drivers/gpu/drm/vkms/vkms_drv.h       |  21 ++++---
 drivers/gpu/drm/vkms/vkms_output.c    |  41 +++++++++-----
 drivers/gpu/drm/vkms/vkms_writeback.c |  25 +++++----
 5 files changed, 118 insertions(+), 99 deletions(-)
---
base-commit: 98efdd02e220fea84c1491012d7292749a71faeb
change-id: 20240909-b4-vkms-allocated-9f5508f4444a
prerequisite-message-id: 20241122-google-vkms-managed-v5-0-1ab60403e960@bootlin.com
prerequisite-patch-id: b608594ad493a41000ee703792eac4b23f9e35dc
prerequisite-patch-id: 5697aa87c44bbf3eda8a1ba424465dc792545d4c
prerequisite-patch-id: 223d59c407ce28dacf3f563b5c0148d2398303f1
prerequisite-patch-id: 720b75b21d06ce3d3f060fb9238f7903834da0e1
prerequisite-patch-id: 30a1e033fa43241ca6a43006fd4f29f8e9217224

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

