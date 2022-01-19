Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DD63B49340F
	for <lists+dri-devel@lfdr.de>; Wed, 19 Jan 2022 05:40:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5301B10EB96;
	Wed, 19 Jan 2022 04:40:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net
 (zg8tmtyylji0my4xnjeumjiw.icoremail.net [162.243.161.220])
 by gabe.freedesktop.org (Postfix) with SMTP id 307AA10E9FA
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Jan 2022 04:39:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=pku.edu.cn; s=dkim; h=Received:From:To:Cc:Subject:Date:
 Message-Id; bh=y1hemmePM7Xjg0f3s8jaqMRTXVn6dAbm/Z+ayCU8xH0=; b=s
 w2ySzFstYpNHwvMGaWjFJM1T188dfiUkM+wSC92uX51QYp9ZVbxBUb7fhyvsfnqV
 tSxln+EO/vCKqDBgBxQNWzHCOLc7f1JM8pyN2ZAORPQKJX1nS1a4n2ccFI+EhWmb
 ekaugMp/eNX8x0UN33vv6KPguf7xOrruKl0nyGlenQ=
Received: from localhost (unknown [10.129.21.144])
 by front02 (Coremail) with SMTP id 54FpogAXHPSiledhXDl7AA--.29466S2;
 Wed, 19 Jan 2022 12:37:54 +0800 (CST)
From: Yongzhi Liu <lyz_cs@pku.edu.cn>
To: hjc@rock-chips.com,
	heiko@sntech.de,
	airlied@linux.ie,
	daniel@ffwll.ch
Subject: [PATCH] drm/rockchip: Fix runtime PM imbalance on error
Date: Tue, 18 Jan 2022 20:37:53 -0800
Message-Id: <1642567073-25784-1-git-send-email-lyz_cs@pku.edu.cn>
X-Mailer: git-send-email 2.7.4
X-CM-TRANSID: 54FpogAXHPSiledhXDl7AA--.29466S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZrW3Aw4rurW8GF1kAr48tFb_yoWDWFc_Kw
 1jqrnrWr4Sqan8Xa17Cay5uryIvF1q9a1xua10vanxAayxJr1DXrWrZFn5Za15Xa17AFnF
 k3W0vFy5CFs5WjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUb4kFc2x0x2IEx4CE42xK8VAvwI8IcIk0rVWrJVCq3wAFIxvE14AK
 wVWUJVWUGwA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjxv20x
 vE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4UJVWxJr1l84ACjcxK6I8E
 87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_GcCE3s1le2I262IYc4CY6c
 8Ij28IcVAaY2xG8wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0E2Ix0cI8IcVAFwI0_JrI_
 JrylYx0Ex4A2jsIE14v26r1j6r4UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvY0x0EwI
 xGrwACjI8F5VA0II8E6IAqYI8I648v4I1lc2xSY4AK6svPMxAIw28IcxkI7VAKI48JMxAI
 w28IcVCjz48v1sIEY20_Kr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_Gr1lx2IqxVAqx4xG67
 AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17CE14v26r1q6r43MIIY
 rxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0I7IYx2IY6xkF7I0E14
 v26r4j6F4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I8E87Iv67AKxVWUJVW8
 JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73UjIFyTuYvjfUF9a9DU
 UUU
X-CM-SenderInfo: irzqijirqukmo6sn3hxhgxhubq/1tbiAwEKBlPy7uA+KwATsn
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
Cc: Yongzhi Liu <lyz_cs@pku.edu.cn>, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

pm_runtime_get_sync() will increase the rumtime PM counter
even it returns an error. Thus a pairing decrement is needed
to prevent refcount leak. Fix this by replacing this API with
pm_runtime_resume_and_get(), which will not change the runtime
PM counter on error.

Signed-off-by: Yongzhi Liu <lyz_cs@pku.edu.cn>
---
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index 4ed7a68..9cf53f0 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -1188,7 +1188,7 @@ static int dw_mipi_dsi_dphy_power_on(struct phy *phy)
 		return i;
 	}
 
-	ret = pm_runtime_get_sync(dsi->dev);
+	ret = pm_runtime_resume_and_get(dsi->dev);
 	if (ret < 0) {
 		DRM_DEV_ERROR(dsi->dev, "failed to enable device: %d\n", ret);
 		return ret;
-- 
2.7.4

