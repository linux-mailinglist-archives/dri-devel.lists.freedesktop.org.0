Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F749FEA08
	for <lists+dri-devel@lfdr.de>; Mon, 30 Dec 2024 19:40:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A9910E56E;
	Mon, 30 Dec 2024 18:40:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="duDPXQKf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net
 [217.70.183.195])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 819E210E56E
 for <dri-devel@lists.freedesktop.org>; Mon, 30 Dec 2024 18:40:20 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 83A2460005;
 Mon, 30 Dec 2024 18:40:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1735584017;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=xRqoRr37s8xkDK/aKhYVqrRdCjno2O/Tcp7fTHQISVI=;
 b=duDPXQKfirBgDtxSF1e+ppV/NNDQabWyBs36kD/WPyODzW/UqG+SSaG38VTd4D8gzjzVeA
 D3+4mK4+YeyWcdthJ37Rk1nctOs4Dxy4toJ865E/wiM5GpXgWpjfGq5k2GVkX53QmNRdrr
 xLmDEvlqYSdFYUwelPS0aBxBRSTZ2F4bGswoTjA/EufaNKHsjSOQouRV8bbnc2xsP3DCik
 ZdV6w4eA9pSENbBPT/kyzFk3cl/odtk1mec4QAVvA56WsLHU6AhDqj5jgDX/U2tqqvt2cI
 JTXlEKfq0lMsIfr2uDHAfoZBLweEVTr51NKgMtxLxX/oBMRB3aIo/MElOV9ehA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH v3 0/3] drm/vkms: Switch to allocated for drm objects
Date: Mon, 30 Dec 2024 19:39:43 +0100
Message-Id: <20241230-b4-vkms-allocated-v3-0-5dda4c1bd459@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAPDocmcC/22Py1LEIBBFfyXF2lYgjzFZ+R+Wi+aVoQwwAlJjT
 eXfJUnpQocVtylOn3sjSUerE5maG4m62GSDr6F9aIg8o581WFUz4ZR3dKQjiA7Ku0uAyxIkZq1
 gNH1Pn01XD5L67xK1sded+fp25Kg/Pis6H0MiMGmQwTmbp0ZFB84m+fRzAa+veQM5nRLuBlOz7
 We8pTCHMC/6cHDo67uCMgAF1suTGnqphla8iBDyYv1jXUI2h7NNOcSvvWZhu8TRiPE7jQqrPD6
 iEIisQzP+4xX+y2CM32XwyjDmJJQShgrzx2ld129HS7SkfAEAAA==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2300;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=IoMDkFrX+35DSAYKRfTKXciRPtM6EHaoMz01RzJVwKU=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBncukOZRPgIytCN0yZHVWVobGPyLs6f3w0lSFDQ
 Ltzuq6RebOJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ3LpDgAKCRAgrS7GWxAs
 4rMcEACGZKKzxsv8nd1Nh1DjR2QgAUWvL4vCv7oaSoJXjua0hWzopuw73zAG8+82unhEzilxrcu
 hc/EIls2L48vtHyeZPkBSgYfXzaabdo/COWDVjZwQTmb0tN/pDb7TkjmMvTcXAlbBmp0W3ZA90A
 5EgRhvUNPWP+6qjvq6guW2uWLsIXDTDaB+Sj2dZy6m/vpmSHUfD5A7c4SPlVrAW9ProBxDc9ile
 hGSQiRF0pFWIu4czbvdiEsKkSHo14j3kakR8foCxZ+eJXMJUPgZsneRL45JLJG/rn8OU24eDxtg
 ZzcHAeI4W9zO67J7f5p57w7ASQh6+idPBuijiprdMi+hHq7KXWAwzuhxM9bMuHe/Jos7W+qzZZl
 VkpWD08o8Vn4pDlxMxpCZd4/omD8+Rj/ldcwmI6fTiQCkM2vVbFiXtmZXA12HUpkii+Jux5pKeb
 5gS020g7uhI8VJKIeoxRPjSdZmDHyEk12O6COcKcNOh+hCChZERASGvV8P2SP5aMTqm9yTD7VFO
 F/wW3Ew8fjUcwLki0XEs60SK8RVjEGyR3Sub3aLHSCrn4R6aUbrrEkxF5DYA6jSE++5tzEtWnXp
 3hwmJHX1t2+yj1apdyTB28JDOwSQS7dT2x/YjpK4tBLx56LI+rD8HV9Q2j5w4vDoWcFqWx9Y7LH
 7CDZtYDUtYeI9Sg==
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
 drivers/gpu/drm/vkms/vkms_drv.h       | 11 +++++------
 drivers/gpu/drm/vkms/vkms_output.c    | 37 +++++++++++++++++++++++------------
 drivers/gpu/drm/vkms/vkms_writeback.c | 17 ++++++++--------
 4 files changed, 56 insertions(+), 41 deletions(-)
---
base-commit: f8a2397baf041a5cee408b082334bb09c7e161df
change-id: 20240909-b4-vkms-allocated-9f5508f4444a
prerequisite-message-id: 20241230-google-vkms-managed-v6-0-15c7d65cd63b@bootlin.com
prerequisite-patch-id: b608594ad493a41000ee703792eac4b23f9e35dc
prerequisite-patch-id: 5697aa87c44bbf3eda8a1ba424465dc792545d4c
prerequisite-patch-id: 223d59c407ce28dacf3f563b5c0148d2398303f1
prerequisite-patch-id: 852b8a54fb933d66592df19aadc551827f719029
prerequisite-patch-id: 8763b3f1494bcb5fddf298f1df429293f2838806
prerequisite-patch-id: 5ab0f908802d3977c60b03e7c5f2631163b4e15e
prerequisite-patch-id: 7f411c316bee613498134279d6b6aa87b58df531
prerequisite-patch-id: 30a1e033fa43241ca6a43006fd4f29f8e9217224

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

