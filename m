Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C833AADD2
	for <lists+dri-devel@lfdr.de>; Thu, 17 Jun 2021 09:39:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1118A6E88D;
	Thu, 17 Jun 2021 07:39:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 481 seconds by postgrey-1.36 at gabe;
 Thu, 17 Jun 2021 07:18:09 UTC
Received: from zg8tmty1ljiyny4xntqumjca.icoremail.net
 (zg8tmty1ljiyny4xntqumjca.icoremail.net [165.227.154.27])
 by gabe.freedesktop.org (Postfix) with SMTP id 0A8896E884
 for <dri-devel@lists.freedesktop.org>; Thu, 17 Jun 2021 07:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fudan.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
 Message-Id; bh=RptfClq4lVC//Zpto1J6NX77le/xD91mEpWrmjb1RGA=; b=C
 uZLQzNduNuyMh9i1HqU9MxtAnSBl+/+KRfqtdowwn8HhLDnrYy0IvxdTeVaAQ6Cf
 wlnOGv1PjxHsbnfkjWb56Ngqzp/DqmacJpbiU3lHOerIEsBkVkeZYzfB3mhNnvRA
 rO1r/ou9ZZZ7K8X6t4hUv6qRgYiNZlADquOmcEhh/Q=
Received: from ubuntu (unknown [10.177.89.109])
 by app1 (Coremail) with SMTP id XAUFCgAH6SFA9cpgKJl6AA--.64384S3;
 Thu, 17 Jun 2021 15:09:52 +0800 (CST)
From: Jiajun Cao <jjcao20@fudan.edu.cn>
To: 
Subject: [PATCH] drm/meson: fix potential NULL pointer exception in
 meson_drv_unbind()
Date: Thu, 17 Jun 2021 15:07:37 +0800
Message-Id: <20210617070737.50171-1-jjcao20@fudan.edu.cn>
X-Mailer: git-send-email 2.17.1
X-CM-TRANSID: XAUFCgAH6SFA9cpgKJl6AA--.64384S3
X-Coremail-Antispam: 1UD129KBjvdXoWrtryrKF1kZryrArW8CFyfWFg_yoWDKFg_CF
 W8Xrn7ur1Dur1Dtr429FW7ZFy2kF18ZF1fCw1kt3yfGFn7Zr1UZFWkuw1kXryfXr43ZFZx
 Z34kGr4rury7GjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbSxFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_tr0E3s1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_GcCE
 3s1l84ACjcxK6I8E87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s
 1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqx4xG64xvF2IE
 w4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_Jr0_Jr4lYx0Ex4A2jsIE14v26r1j6r4UMc
 vjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwIxGrwACjI8F5VA0II8E6IAqYI8I648v
 4I1lFIxGxcIEc7CjxVA2Y2ka0xkIwI1lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxC20s
 026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_
 JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwC2zVAIFx02awCIc40Y0x0EwIxGrwCI42IY6x
 IIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAI
 w20EY4v20xvaj40_WFyUJVCq3wCI42IY6I8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6x
 kF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjTRAl1kUUUUU
X-CM-SenderInfo: isqsiiasuqikmw6i3vldqovvfxof0/
X-Mailman-Approved-At: Thu, 17 Jun 2021 07:39:18 +0000
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
 drivers/gpu/drm/meson/meson_drv.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/meson/meson_drv.c b/drivers/gpu/drm/meson/meson_drv.c
index 07fcd12dca16..adea6a2b28f5 100644
--- a/drivers/gpu/drm/meson/meson_drv.c
+++ b/drivers/gpu/drm/meson/meson_drv.c
@@ -380,6 +380,8 @@ static int meson_drv_bind(struct device *dev)
 static void meson_drv_unbind(struct device *dev)
 {
 	struct meson_drm *priv = dev_get_drvdata(dev);
+	if (!priv)
+		return;
 	struct drm_device *drm = priv->drm;
 
 	if (priv->canvas) {
-- 
2.17.1

