Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAC5C497595
	for <lists+dri-devel@lfdr.de>; Sun, 23 Jan 2022 21:52:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C0F1E10E22B;
	Sun, 23 Jan 2022 20:52:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 456 seconds by postgrey-1.36 at gabe;
 Sun, 23 Jan 2022 20:52:29 UTC
Received: from mail.z3ntu.xyz (mail.z3ntu.xyz [128.199.32.197])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D865210E22B
 for <dri-devel@lists.freedesktop.org>; Sun, 23 Jan 2022 20:52:29 +0000 (UTC)
Received: from localhost.localdomain (ip-213-127-106-2.ip.prioritytelecom.net
 [213.127.106.2])
 by mail.z3ntu.xyz (Postfix) with ESMTPSA id E2DEDCE792;
 Sun, 23 Jan 2022 20:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=z3ntu.xyz; s=z3ntu;
 t=1642970692; bh=Pz8Rr0gE1WWTUWJgZZYIwX9EYZcudB1mDd1+9t7DnGk=;
 h=From:To:Cc:Subject:Date;
 b=O3dMVzDCrTDe2kJ9DXp6XL1Ps797A/hGgiMdIYJXDsoeDtz6OOkQPyt2CRFis+MjR
 Gv0QEYK4TKALhfCt1yzauhgrMVekMVlbxZd90DdjoRw/ndWA/XahxOsCB4KeKTdWRM
 a5zVrMBABimkB+2ZRMRVpqKutdQtJQa8kaXzgqLw=
From: Luca Weiss <luca@z3ntu.xyz>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH] drm: add missing dependency to DRM_PANEL_EDP
Date: Sun, 23 Jan 2022 21:43:23 +0100
Message-Id: <20220123204322.345725-1-luca@z3ntu.xyz>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
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
Cc: David Airlie <airlied@linux.ie>, linux-kernel@vger.kernel.org,
 Luca Weiss <luca@z3ntu.xyz>, Thierry Reding <thierry.reding@gmail.com>,
 ~postmarketos/upstreaming@lists.sr.ht, Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

With CONFIG_DRM_PANEL_EDP=y and CONFIG_DRM_KMS_HELPER=m the compilation
fails:

  drivers/gpu/drm/panel/panel-edp.c:843: undefined reference to `drm_panel_dp_aux_backlight'

Add a dependency on DRM_KMS_HELPER to fix this.

Signed-off-by: Luca Weiss <luca@z3ntu.xyz>
---
I briefly tried "select DRM_KMS_HELPER" but that causes a circular
dependency.
If someone has a better idea how to solve this, feel free correct me.

 drivers/gpu/drm/panel/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/panel/Kconfig b/drivers/gpu/drm/panel/Kconfig
index 434c2861bb40..fda97837ecb3 100644
--- a/drivers/gpu/drm/panel/Kconfig
+++ b/drivers/gpu/drm/panel/Kconfig
@@ -102,6 +102,7 @@ config DRM_PANEL_SIMPLE
 config DRM_PANEL_EDP
 	tristate "support for simple Embedded DisplayPort panels"
 	depends on OF
+	depends on DRM_KMS_HELPER
 	depends on BACKLIGHT_CLASS_DEVICE
 	depends on PM
 	select VIDEOMODE_HELPERS
-- 
2.34.1

