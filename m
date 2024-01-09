Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC83E82851D
	for <lists+dri-devel@lfdr.de>; Tue,  9 Jan 2024 12:31:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB34010E082;
	Tue,  9 Jan 2024 11:31:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EAAD10E082
 for <dri-devel@lists.freedesktop.org>; Tue,  9 Jan 2024 11:31:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com; 
 s=20170329;
 h=Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=BLlNyqXSMPeXf2Yq0+/+unEawpONZ+G2IC4XjpTWBLQ=; b=mKE2/4XvTJmeYVxrS3u/UuktmG
 3HFpMVqjK0EL1FbxRjevy36a9kgZt6+TC8mh7ZEb/NdSJVCW3Y95sY8YR5k9x+RTWQ/lC8DsBuK+h
 u55Qw8FO/FkfzoTBwRgSyDrUuLuBtesVQtzu9arTTbhZSugMTdopI7kB/DLrSNc4gGU0AR/04P8fX
 A5G7VqPJ7Z8l9UQOha/EfnQmLgJ0OrhGRrWs3oE1fyrLgCngdwRfWF5UvWJQdPZeilxEPEmTByBMc
 IoBf1N2zXyAnXgVyjFn4WHEcRnnAl6+55d2f+af5p8OiUDWA0lJjhmfafAW+yXpFB9Pmz6CNuTZ1C
 4PM+9Gng==;
Received: from [179.234.233.159] (helo=morissey..)
 by fanzine2.igalia.com with esmtpsa 
 (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
 id 1rNAKW-004XYv-8P; Tue, 09 Jan 2024 12:31:36 +0100
From: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>
To: Melissa Wen <mwen@igalia.com>, Iago Toral <itoral@igalia.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH] drm/v3d: Fix support for register debugging on the RPi 4
Date: Tue,  9 Jan 2024 08:30:40 -0300
Message-ID: <20240109113126.929446-1-mcanal@igalia.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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
Cc: =?UTF-8?q?Ma=C3=ADra=20Canal?= <mcanal@igalia.com>, kernel-dev@igalia.com,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

RPi 4 uses V3D 4.2, which is currently not supported by the register
definition stated at `v3d_core_reg_defs`. We should be able to support
V3D 4.2, therefore, change the maximum version of the register
definition to 42, not 41.

Fixes: 0ad5bc1ce463 ("drm/v3d: fix up register addresses for V3D 7.x")
Signed-off-by: Maíra Canal <mcanal@igalia.com>
---
 drivers/gpu/drm/v3d/v3d_debugfs.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/v3d/v3d_debugfs.c b/drivers/gpu/drm/v3d/v3d_debugfs.c
index f843a50d5dce..94eafcecc65b 100644
--- a/drivers/gpu/drm/v3d/v3d_debugfs.c
+++ b/drivers/gpu/drm/v3d/v3d_debugfs.c
@@ -62,9 +62,9 @@ static const struct v3d_reg_def v3d_core_reg_defs[] = {
 	REGDEF(33, 71, V3D_PTB_BPCA),
 	REGDEF(33, 71, V3D_PTB_BPCS),

-	REGDEF(33, 41, V3D_GMP_STATUS(33)),
-	REGDEF(33, 41, V3D_GMP_CFG(33)),
-	REGDEF(33, 41, V3D_GMP_VIO_ADDR(33)),
+	REGDEF(33, 42, V3D_GMP_STATUS(33)),
+	REGDEF(33, 42, V3D_GMP_CFG(33)),
+	REGDEF(33, 42, V3D_GMP_VIO_ADDR(33)),

 	REGDEF(33, 71, V3D_ERR_FDBGO),
 	REGDEF(33, 71, V3D_ERR_FDBGB),
@@ -74,13 +74,13 @@ static const struct v3d_reg_def v3d_core_reg_defs[] = {

 static const struct v3d_reg_def v3d_csd_reg_defs[] = {
 	REGDEF(41, 71, V3D_CSD_STATUS),
-	REGDEF(41, 41, V3D_CSD_CURRENT_CFG0(41)),
-	REGDEF(41, 41, V3D_CSD_CURRENT_CFG1(41)),
-	REGDEF(41, 41, V3D_CSD_CURRENT_CFG2(41)),
-	REGDEF(41, 41, V3D_CSD_CURRENT_CFG3(41)),
-	REGDEF(41, 41, V3D_CSD_CURRENT_CFG4(41)),
-	REGDEF(41, 41, V3D_CSD_CURRENT_CFG5(41)),
-	REGDEF(41, 41, V3D_CSD_CURRENT_CFG6(41)),
+	REGDEF(41, 42, V3D_CSD_CURRENT_CFG0(41)),
+	REGDEF(41, 42, V3D_CSD_CURRENT_CFG1(41)),
+	REGDEF(41, 42, V3D_CSD_CURRENT_CFG2(41)),
+	REGDEF(41, 42, V3D_CSD_CURRENT_CFG3(41)),
+	REGDEF(41, 42, V3D_CSD_CURRENT_CFG4(41)),
+	REGDEF(41, 42, V3D_CSD_CURRENT_CFG5(41)),
+	REGDEF(41, 42, V3D_CSD_CURRENT_CFG6(41)),
 	REGDEF(71, 71, V3D_CSD_CURRENT_CFG0(71)),
 	REGDEF(71, 71, V3D_CSD_CURRENT_CFG1(71)),
 	REGDEF(71, 71, V3D_CSD_CURRENT_CFG2(71)),
--
2.43.0

