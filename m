Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CDAF9D622F
	for <lists+dri-devel@lfdr.de>; Fri, 22 Nov 2024 17:25:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3BE010E110;
	Fri, 22 Nov 2024 16:25:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="IKw830vz";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1675A10E110
 for <dri-devel@lists.freedesktop.org>; Fri, 22 Nov 2024 16:25:05 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id D5666E0005;
 Fri, 22 Nov 2024 16:25:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1732292704;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=cmHLvQRID3FEQEwwvyLcoVQq/CH/RW/c2n0dDDi8tB0=;
 b=IKw830vz5d+u13bD/AgxPLXBxjNVRcAxcWwu0PWREDNFR0ESJmazF4LKQLx5hbI6chMf/8
 Mi2wkeRivfIChwHoadf+39RCJ8GnKRpX0Cu+FyqYCPEyI3H3Vb5NF863obgq0RXa9yb2nL
 m8RPeDyGXL+F8oBBiIX+RkWuCcVhGWKaUPKoSh3YuQGMtkFYmZGpDUPzm37SMR8xEkye86
 WPabHulfsiszOjCbYXHCvQQ26HgcXBWeVAhlB4I9EOUnvOOFoNGc+uggAbMJUnnxomiVnB
 lLWS55gxwEwRslaw2utL+fmNrwHnT+41YmT4mCU7q+t+gY0zmhZdSar+64/iig==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Subject: [PATCH v3 0/3] drm/vkms: Reimplement line-per-line pixel
 conversion for writeback
Date: Fri, 22 Nov 2024 17:24:59 +0100
Message-Id: <20241122-writeback_line_by_line-v3-0-085d5810f6e3@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFuwQGcC/3WQ3W6DMAyFXwXletnIDwS42ntMU0WCWaM1ZEvSt
 Kji3WdA07RKvUpsy985PjcSIViIpCtuJEC20foJC/FUEHPspw+gdsCa8JLLknNOL8Em0L35PJz
 sBAc9by9tpKrqstJsqAzB5a8Ao71u4Ld3rI82Jh/mTSeztbsjK1Y/QmZGS6o0B6HHdmSmfdXeJ
 xw9G+/ICs38D9Qw+RDEESTqSjKjGNq8Ay273QDfZzw/7Z6J7iNQnDubumIIjjobzcvvh05wTeu
 dDmLst5S6YvXBGGY0nzO6l6gKdT00YuDNUJp/qo9WtUT0BYVPPtDRB9enSLNAFBejUqpmrbpPY
 ll+APuDxUbHAQAA
X-Change-ID: 20240222-writeback_line_by_line-8475605b1d5c
To: Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>, 
 Melissa Wen <melissa.srw@gmail.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mairacanal@riseup.net>, 
 Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net, 
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com, 
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com, 
 seanpaul@google.com, nicolejadeyee@google.com, 
 Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2694;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=eaNKgDeGpchtLQ/lC1Y53hva6pEAQrbyqvD3im/Sq5o=;
 b=owEBbQKS/ZANAwAIASCtLsZbECziAcsmYgBnQLBdK2J5Agc/+lR3N9V+R8J4l4bct7v2tgu8P
 jFVV7IEfmyJAjMEAAEIAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCZ0CwXQAKCRAgrS7GWxAs
 4lpdD/4y8M/lqLkr7og/lSMo7ZpFpSrvXwAbRhsRxqQM/y1GyoijhS8Fq5sd2MHv59Jt4DqhsOY
 uhyMCUAYDOn7ONjtMmPW4J2o2a9d0Ikdtp7N3EHSEZRq012FcGwS1OvHGnjQM/QQ+EuY/5nfeil
 /7J2609yRvXYKfXa1S2BuvVwzYtsg94/+XYnyFxlZUUghmI8590FnrZxT6H9jKGe/4lvZwLhf+3
 y7MbwTFyzpfL9soQ+X9I5dywLpLZWZZJ/4TCefkisQDSrSIedsHcib4UNSz1ZrP5jeEXW8KlK/g
 IQZdWtaUaohSMfpmpFBxvu8ChuBr7+sDrFIa0KfCnz1UGXENyFQ6XbZ7p688VO1HoNapCbLFB/6
 SJJ5pHweuWyorxSgKzG2pjjuWsZtDlifnNoKJSE2pZ7/p+i5OItMf+oMecks25iN5MpI/Cf0gc3
 Mk4PG+ZGRkRmuzh5sClsUlux4/zQDxXAL2yn1jeyW5fv7FCadchYzr0+g7OpOXOYW0jyZDzaKMq
 CoNS0sukEZCEo9PLKbnKpZjeEZ8DYuaDyPZGGdHHoZFxfksNU3Ku8TAhiYYm7AHag2/5m5FvWeK
 6POEHZASKKQLhYAhN3CQQ3iBgd3lISH4uQZM2yB7GZBuUm9hLwxDJYdTqDVYJtCclRIKI3yL9vV
 2hbXCcUER1Ol31Q==
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

This series re-introduce the line-by-line algorithm. This is simpler than 
the read part because no rotation/translations are involved. 

PATCH 1/3 is the re-introduction itself
PATCH 2/3 is a proposition to avoid code repetition using a "big" macro.
PATCJ 3/3 is the usage of PATCH 2 to support a new format

This series depends on [1].

[1]:https://lore.kernel.org/all/20241122-b4-new-color-formats-v3-0-23f7776197c9@bootlin.com/

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
Changes in v3:
- Rebased on new iterations
- Link to v2: https://lore.kernel.org/r/20240814-writeback_line_by_line-v2-0-36541c717569@bootlin.com

Changes in v2:
- PATCH 2/3: Remove YUV from supported format list, it is not supported 
- Link to v1: https://lore.kernel.org/r/20240516-writeback_line_by_line-v1-0-7b2e3bf9f1c9@bootlin.com

---
Louis Chauvet (3):
      drm/vkms: Re-introduce line-by-line algorithm for writeback
      drm/vkms: Add a macro for write_line functions
      drm/vkms: Add support for XRGB2101010

 drivers/gpu/drm/vkms/vkms_composer.c  | 17 +++++++
 drivers/gpu/drm/vkms/vkms_drv.h       | 17 ++++---
 drivers/gpu/drm/vkms/vkms_formats.c   | 86 ++++++++++++++++++++++++-----------
 drivers/gpu/drm/vkms/vkms_formats.h   |  2 +-
 drivers/gpu/drm/vkms/vkms_writeback.c |  5 +-
 5 files changed, 92 insertions(+), 35 deletions(-)
---
base-commit: 98efdd02e220fea84c1491012d7292749a71faeb
change-id: 20240222-writeback_line_by_line-8475605b1d5c
prerequisite-message-id: 20241122-yuv-v14-0-e66d83d28d0c@bootlin.com
prerequisite-patch-id: d08b040cfd7aeba4a237029500f5aa8266450cbd
prerequisite-patch-id: deda292af6d8bbf6762b0bf4d351ffd2225995d8
prerequisite-patch-id: 6c2aa2645c7d854951608aa4d15a02e076abe1fe
prerequisite-patch-id: 62f509c48590dc333dc84e2185dc8b9edd61761b
prerequisite-patch-id: 7d988613c79a1ab056110418c04865bf019402cc
prerequisite-patch-id: 43f37e9c1bc041d491e41dfb59548ed258a1e071
prerequisite-patch-id: 1b2a3898d5f8c21b0d306c07b424414bcb14554b
prerequisite-message-id: 20241122-b4-new-color-formats-v3-0-23f7776197c9@bootlin.com
prerequisite-patch-id: e6717b75d79ae5cfb0815bab88d722082107dc0e
prerequisite-patch-id: 4b3b1ea5ad2e3ba1922cd4b3d3d46214b27c8c2d
prerequisite-patch-id: 060874d5a7433cc8cc654bc63e0b411036727ebb
prerequisite-patch-id: 43115d21842e508d9d8b0468e15f67d442bffe3c
prerequisite-patch-id: 627d0970e76d4154c982d0d4172e7a0c4dfb9a4c
prerequisite-patch-id: 582445144ac0ab11175ef96262060b08a5e1467e
prerequisite-patch-id: a98fac5a2c60fe23fbc6a455e9a4ab8b0f187ee8
prerequisite-patch-id: 62c8d109a22b9978f755255b67f13fe74fb7008d

Best regards,
-- 
Louis Chauvet <louis.chauvet@bootlin.com>

