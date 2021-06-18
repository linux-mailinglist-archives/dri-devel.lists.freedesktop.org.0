Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D70A3AC2D9
	for <lists+dri-devel@lfdr.de>; Fri, 18 Jun 2021 07:28:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 869A16E84E;
	Fri, 18 Jun 2021 05:28:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from zg8tmty1ljiyny4xntqumjca.icoremail.net
 (zg8tmty1ljiyny4xntqumjca.icoremail.net [165.227.154.27])
 by gabe.freedesktop.org (Postfix) with SMTP id 4D0E46E84E
 for <dri-devel@lists.freedesktop.org>; Fri, 18 Jun 2021 05:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fudan.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
 Message-Id; bh=1u3WcLuOIJNGanaGygETlZ8Gs0rz5+WZUbX217nJS8o=; b=o
 qd4DHwHdcrz5/5likLjUyapj4zUeZE97fP35r3ayeiEQIErXGO391UfDxcRBvIpi
 n586LBomQiO3vbgQobSxxE8BeVUBjzuaLOhCkP4dRxQV5GZ9kWF0S3bfr20QQB0l
 ZwJitaHqC+hU3PAID23xMoWK5hZaV+5BpK27CLwnK0=
Received: from ubuntu (unknown [10.177.89.109])
 by app1 (Coremail) with SMTP id XAUFCgDnmDLjLsxgjEGFAA--.13317S3;
 Fri, 18 Jun 2021 13:28:03 +0800 (CST)
From: Jiajun Cao <jjcao20@fudan.edu.cn>
To: 
Subject: [PATCH v2] drm/meson: fix potential NULL pointer exception in
 meson_drv_unbind()
Date: Fri, 18 Jun 2021 13:28:00 +0800
Message-Id: <20210618052800.89007-1-jjcao20@fudan.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: XAUFCgDnmDLjLsxgjEGFAA--.13317S3
X-Coremail-Antispam: 1UD129KBjvJXoW7uw4xZw48CFWfuF4rGr48JFb_yoW8Xr1fpF
 4fGryjkrWktFWUt34DAa17AFy3Jw47CFy7uF4UKwsa9r4akFyxJa4ftFWUtry5Zry0q3WS
 vF98KF48uFW5Ar7anT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDU0xBIdaVrnRJUUUBa14x267AKxVW8JVW5JwAFc2x0x2IEx4CE42xK8VAvwI8IcIk0
 rVWrJVCq3wAFIxvE14AKwVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK02
 1l84ACjcxK6xIIjxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4U
 JVW0owA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oV
 Cq3wAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc02F40EFcxC
 0VAKzVAqx4xG6I80ewAv7VC0I7IYx2IY67AKxVWUJVWUGwAv7VC2z280aVAFwI0_Jr0_Gr
 1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcxkI7VAKI48JM4x0x7Aq67IIx4CEVc8vx2IE
 rcIFxwACI402YVCY1x02628vn2kIc2xKxwCY02Avz4vE-syl42xK82IYc2Ij64vIr41l4I
 8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AK
 xVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MI8E62xC7I0kMIIYrxkI7VAKI48JMIIF0x
 vE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14v26r4j6F4UMIIF0xvE
 42xK8VAvwI8IcIk0rVWrZr1j6s0DMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2js
 IEc7CjxVAFwI0_Gr0_Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0pRcAw7UUUUU=
X-CM-SenderInfo: isqsiiasuqikmw6i3vldqovvfxof0/
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
Cc: Xin Tan <tanxin.ctf@gmail.com>, Neil Armstrong <narmstrong@baylibre.com>,
 David Airlie <airlied@linux.ie>, Kevin Hilman <khilman@baylibre.com>,
 yuanxzhang@fudan.edu.cn, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Jiajun Cao <jjcao20@fudan.edu.cn>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Jerome Brunet <jbrunet@baylibre.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Fix a potential NULL pointer exception when meson_drv_unbind()
attempts to operate on the driver_data priv which may be NULL.
Add a null pointer check on the priv struct to avoid the NULL
pointer dereference after calling dev_get_drvdata(), just like
the null pointer checks done on the struct priv in the function
meson_drv_shutdown(), meson_drv_pm_suspend() and meson_drv_pm_resume().

Signed-off-by: Jiajun Cao <jjcao20@fudan.edu.cn>
Signed-off-by: Xin Tan <tanxin.ctf@gmail.com>
---
 drivers/gpu/drm/meson/meson_drv.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 07fcd12dca16..f544fba8c44e 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -380,7 +380,10 @@ static int meson_drv_bind(struct device *dev)
 static void meson_drv_unbind(struct device *dev)
 {
 	struct meson_drm *priv = dev_get_drvdata(dev);
-	struct drm_device *drm = priv->drm;
+	struct drm_device *drm;
+
+	if (!priv)
+		return;
 
 	if (priv->canvas) {
 		meson_canvas_free(priv->canvas, priv->canvas_id_osd1);
@@ -389,6 +392,7 @@ static void meson_drv_unbind(struct device *dev)
 		meson_canvas_free(priv->canvas, priv->canvas_id_vd1_2);
 	}
 
+	drm = priv->drm;
 	drm_dev_unregister(drm);
 	drm_kms_helper_poll_fini(drm);
 	drm_atomic_helper_shutdown(drm);
-- 
2.17.1

