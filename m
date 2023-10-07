Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10F987BC4D5
	for <lists+dri-devel@lfdr.de>; Sat,  7 Oct 2023 07:41:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E497510E158;
	Sat,  7 Oct 2023 05:41:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m15.mail.163.com (m15.mail.163.com [45.254.50.219])
 by gabe.freedesktop.org (Postfix) with ESMTP id AFE8910E058
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Oct 2023 03:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=eXdTM
 qOTVo37Vuo+Ii2+2vMJv7kgRRnrVpWPIL1gsDI=; b=KZJxd/jdNVT4o+gYnm2IU
 GxGA/ZihRg6oC6c1CYAFJEvZymE3+T/a5mGXdIXI3OaH70JOdyMhvI1vAeqlffH0
 IlztKSKbbbJHWo5lDB0TNFfONMjm2lTxBz3h48bmebY4J8j6KHdJnk+Xfc12TmdL
 APzyao2b1ME89Rbe5yCrW0=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
 by zwqz-smtp-mta-g2-2 (Coremail) with SMTP id _____wDnFXp4yiBl5FAoEA--.48757S4;
 Sat, 07 Oct 2023 11:03:29 +0800 (CST)
From: Ma Ke <make_ruc2021@163.com>
To: linus.walleij@linaro.org, neil.armstrong@linaro.org, sam@ravnborg.org,
 airlied@gmail.com, daniel@ffwll.ch
Subject: [PATCH] drm/panel/panel-tpo-tpg110: fix a possible null pointer
 dereference
Date: Sat,  7 Oct 2023 11:03:18 +0800
Message-Id: <20231007030318.3996798-1-make_ruc2021@163.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDnFXp4yiBl5FAoEA--.48757S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrZrW8KFyfCw18AF47KFWrAFb_yoWDJFb_uF
 18XasrWr47W3Z7CF4Iva13Ar1ayFs8AF4kZ3WSkayIkrykGF17Jr1DWr909a4UuF17uFs8
 Aa4xAF1YvFnrGjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRKLvK7UUUUU==
X-Originating-IP: [183.174.60.14]
X-CM-SenderInfo: 5pdnvshuxfjiisr6il2tof0z/xtbBFR4CC2B9oZk1SgAAsY
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

In radeon_fp_native_mode(), the return value of drm_mode_duplicate()
is assigned to mode, which will lead to a NULL pointer dereference
on failure of drm_mode_duplicate(). Add a check to avoid npd.

Signed-off-by: Ma Ke <make_ruc2021@163.com>
---
 drivers/gpu/drm/panel/panel-tpo-tpg110.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-tpo-tpg110.c b/drivers/gpu/drm/panel/panel-tpo-tpg110.c
index 845304435e23..f6a212e542cb 100644
--- a/drivers/gpu/drm/panel/panel-tpo-tpg110.c
+++ b/drivers/gpu/drm/panel/panel-tpo-tpg110.c
@@ -379,6 +379,8 @@ static int tpg110_get_modes(struct drm_panel *panel,
 	connector->display_info.bus_flags = tpg->panel_mode->bus_flags;
 
 	mode = drm_mode_duplicate(connector->dev, &tpg->panel_mode->mode);
+	if (!mode)
+		return -ENOMEM;
 	drm_mode_set_name(mode);
 	mode->type = DRM_MODE_TYPE_DRIVER | DRM_MODE_TYPE_PREFERRED;
 
-- 
2.37.2

