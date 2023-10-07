Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CED7BC4D7
	for <lists+dri-devel@lfdr.de>; Sat,  7 Oct 2023 07:41:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17A9110E589;
	Sat,  7 Oct 2023 05:41:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from m12.mail.163.com (m12.mail.163.com [220.181.12.196])
 by gabe.freedesktop.org (Postfix) with ESMTP id 3DD8510E058
 for <dri-devel@lists.freedesktop.org>; Sat,  7 Oct 2023 03:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=3NUit
 ICBhSCtbw7Vlya/QRr1+OuCRgNgVY92wWYt9kc=; b=A0/b+9/bwMMo9z9RmveY5
 Vh5zJx+MPY8ueuREbEXgcyhm5Mh6dCGoahMvd3WBpqmDj2kfkz6GMenAhGX9oDun
 cEo0CMLC1Y9g5y7tjvS97R+pEo+Dk68kH5it05ITg8S2Mwbly1I5WQWMOoCj+2BW
 Iw/SMAASS7tp/WH7jJPim4=
Received: from icess-ProLiant-DL380-Gen10.. (unknown [183.174.60.14])
 by zwqz-smtp-mta-g3-1 (Coremail) with SMTP id _____wDXbMK6zSBl0sglEA--.50228S4;
 Sat, 07 Oct 2023 11:17:23 +0800 (CST)
From: Ma Ke <make_ruc2021@163.com>
To: airlied@gmail.com, daniel@ffwll.ch, javierm@redhat.com, lyude@redhat.com,
 mripard@kernel.org, u.kleine-koenig@pengutronix.de, noralf@tronnes.org,
 tzimmermann@suse.de, make_ruc2021@163.com
Subject: [PATCH] drm/i2c/ch7006: fix a possible null pointer dereference
Date: Sat,  7 Oct 2023 11:17:12 +0800
Message-Id: <20231007031712.3997144-1-make_ruc2021@163.com>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: _____wDXbMK6zSBl0sglEA--.50228S4
X-Coremail-Antispam: 1Uf129KBjvdXoWrtF1rZr4fAF1kKw1xZr45trb_yoWDGrb_u3
 W0vr9xur4UZ3Z3Ar4jyFy3Ary0yF1UAFs3KrsIkay0ya9rXwnIq345Xa48XFW7uFWUAFn0
 qa43CF4fAFnrGjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRM189JUUUUU==
X-Originating-IP: [183.174.60.14]
X-CM-SenderInfo: 5pdnvshuxfjiisr6il2tof0z/1tbivgMCC1ZcjAI-mQAAsW
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
Cc: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In ch7006_encoder_get_modes(), the return value of drm_mode_duplicate()
is assigned to mode, which will lead to a NULL pointer dereference
on failure of drm_mode_duplicate(). Add a check to avoid npd.

Signed-off-by: Ma Ke <make_ruc2021@163.com>
---
 drivers/gpu/drm/i2c/ch7006_drv.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/i2c/ch7006_drv.c b/drivers/gpu/drm/i2c/ch7006_drv.c
index 131512a5f3bd..27c2f02f5b43 100644
--- a/drivers/gpu/drm/i2c/ch7006_drv.c
+++ b/drivers/gpu/drm/i2c/ch7006_drv.c
@@ -236,8 +236,10 @@ static int ch7006_encoder_get_modes(struct drm_encoder *encoder,
 		    ~mode->valid_norms & 1<<priv->norm)
 			continue;
 
-		drm_mode_probed_add(connector,
-				drm_mode_duplicate(encoder->dev, &mode->mode));
+		struct drm_display_mode *encoder_mode;
+		encoder_mode = drm_mode_duplicate(encoder->dev, &mode->mode);
+		if (!mode)
+			continue;
 
 		n++;
 	}
-- 
2.37.2

