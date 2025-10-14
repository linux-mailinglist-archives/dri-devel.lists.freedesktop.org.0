Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82315BD9099
	for <lists+dri-devel@lfdr.de>; Tue, 14 Oct 2025 13:31:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6D8910E213;
	Tue, 14 Oct 2025 11:31:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=bootlin.com header.i=@bootlin.com header.b="MFJvYsc6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E934C10E213
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Oct 2025 11:31:17 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 757BB4E4108E;
 Tue, 14 Oct 2025 11:31:16 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 48E46606EC;
 Tue, 14 Oct 2025 11:31:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 16468102F2298; 
 Tue, 14 Oct 2025 13:31:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
 t=1760441475; h=from:subject:date:message-id:to:cc:mime-version:content-type:
 content-transfer-encoding; bh=6p8WMfmPS/2ENAV2cQiuR3uNGwiPH4kh/nqLPv36UjI=;
 b=MFJvYsc63DmUpUkpCKHQjuI/RLnMI17jrS5/jJUT8DRfNGXMIzmthheE7w4LzLqwHC3IMm
 y7R4pOQTiMiChEj5glwZ4fHyPYaJvgdBpIiSzC20ONyWYDFRZbl82IyUUzPJ7EYns56TdV
 xdFsFSXr25J3Rzqlob7LrEjEVqq2E/SOlv8rQo4yDJKFPFgPV3G92CcrYOhCobjJZaHzgV
 b9TSxh8rOwq5tgkxjEndTgluNftA6FDVSGmpI50WESXJqZEN9zdayy7LvACxIrIxhHNOIj
 k34PxeHOYjOX7Ww2NDHhXL7B1Y1DPgf5g1vBaSHuvld4DDIjVqydaF7QFsBruQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH 0/2] drm/imx: parallel-display: fix drm/panel/panel-simple
 v6.17 WARNING regression
Date: Tue, 14 Oct 2025 13:30:50 +0200
Message-Id: <20251014-drm-bridge-alloc-imx-ipuv3-v1-0-a1bb1dcbff50@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGo07mgC/x3MSQqAMAxA0atI1gZsnahXERfaphpwIkURine3u
 Hx8+BECCVOALosgdHPgY09QeQZ2GfeZkF0y6ELXqlAVOtlwEnapjOt6WOTtQT6vu0QztUb7pjb
 WG0iDU8jz88/74X0/M86X3mwAAAA=
X-Change-ID: 20251014-drm-bridge-alloc-imx-ipuv3-9b792f659cf9
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
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

This series fixes the WARNING regressions reported by Ernest [0] and due to
the missing conversion of the DRM_IMX driver to the new
devm_drm_bridge_alloc() API.

The second patch also adds drm_bridge_add(), which is a good practice and
proposed to become mandatory [1].

[0] https://lore.kernel.org/all/hlf4wdopapxnh4rekl5s3kvoi6egaga3lrjfbx6r223ar3txri@3ik53xw5idyh/
[1] https://lore.kernel.org/lkml/20251003-b4-drm-bridge-alloc-add-before-attach-v1-0-92fb40d27704@bootlin.com/

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Luca Ceresoli (2):
      drm/imx: parallel-display: convert to devm_drm_bridge_alloc() API
      drm/imx: parallel-display: add the bridge before attaching it

 drivers/gpu/drm/imx/ipuv3/parallel-display.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)
---
base-commit: 48a710760e10a4f36e11233a21860796ba204b1e
change-id: 20251014-drm-bridge-alloc-imx-ipuv3-9b792f659cf9

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

