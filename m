Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 493B37BC4D4
	for <lists+dri-devel@lfdr.de>; Sat,  7 Oct 2023 07:41:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4500F10E104;
	Sat,  7 Oct 2023 05:41:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.215])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0AFC110E562
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Oct 2023 03:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=4RsFb
 4cDEF9CsE4C+nnjJIb297G75Zf5+DKvSCmQ53c=; b=mREDyS4DY/EfF2DRysC/g
 LAjiSHvUCiXp3JpUOjVjNculFvsl1pUPYNsYJrxEtuuJWJgFtnwiq48c/kLsl5ZX
 Jn+lHoMmc0gXes/GfPzSIzbD1vkb1si4J/5q8LOBUNXS7qd/6WEmK+rdt8MuqOrd
 SMZ8xhwuqVQkjynucmYzNU=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
 by zwqz-smtp-mta-g4-0 (Coremail) with SMTP id _____wDHeIn60CBlKTcrEA--.50449S4;
 Sat, 07 Oct 2023 11:31:15 +0800 (CST)
From: Ma Ke <make_ruc2021@163.com>
To: linus.walleij@linaro.org, neil.armstrong@linaro.org, sam@ravnborg.org,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/panel: fix a possible null pointer dereference
Date: Sat,  7 Oct 2023 11:31:05 +0800
Message-Id: <20231007033105.3997998-1-make_ruc2021@163.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDHeIn60CBlKTcrEA--.50449S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF1rZr4fAF1DGF47Cry8Zrb_yoWDWwb_Gr
 18Xasrur4UX3WxursFyw15Aryayrs5ZF4kuw1Ska42kr9rGr13XFn2gryUua4UZF17AryD
 u343ZFyY9FsrGjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRKzVbJUUUUU==
X-Originating-IP: [183.174.60.14]
X-CM-SenderInfo: 5pdnvshuxfjiisr6il2tof0z/1tbiyAMCC1p7MCCE3AAAsr
X-Mailman-Approved-At: Sat, 07 Oct 2023 05:41:36 +0000
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ma Ke <make_ruc2021@163.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In versatile_panel_get_modes(), the return value of drm_mode_duplicate()
is assigned to mode, which will lead to a NULL pointer dereference
on failure of drm_mode_duplicate(). Add a check to avoid npd.

Signed-off-by: Ma Ke <make_ruc2021@163.com>
---
 drivers/gpu/drm/panel/panel-arm-versatile.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-arm-versatile.c b/drivers/gpu/drm/panel/panel-arm-versatile.c
index abb0788843c6..1811bfaeb9c7 100644
--- a/drivers/gpu/drm/panel/panel-arm-versatile.c
+++ b/drivers/gpu/drm/panel/panel-arm-versatile.c
@@ -267,6 +267,8 @@ static int versatile_panel_get_modes(struct drm_panel *panel,
 	connector->display_info.bus_flags = vpanel->panel_type->bus_flags;
 
 	mode = drm_mode_duplicate(connector->dev, &vpanel->panel_type->mode);
+	if (!mode)
+		return -ENOMEM;
 	drm_mode_set_name(mode);
 	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
 
-- 
2.37.2

