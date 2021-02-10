Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4619B31604B
	for <lists+dri-devel@lfdr.de>; Wed, 10 Feb 2021 08:48:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F16B6E81E;
	Wed, 10 Feb 2021 07:48:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC5F689CB8
 for <dri-devel@lists.freedesktop.org>; Wed, 10 Feb 2021 07:47:01 +0000 (UTC)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4DbBdC1sD3zjLJb;
 Wed, 10 Feb 2021 15:45:35 +0800 (CST)
Received: from localhost.localdomain (10.175.102.38) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Wed, 10 Feb 2021 15:46:51 +0800
From: Wei Yongjun <weiyongjun1@huawei.com>
To: Hulk Robot <hulkci@huawei.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>, David Airlie
 <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, Philipp Zabel
 <p.zabel@pengutronix.de>
Subject: [PATCH -next] drm/rockchip: cdn-dp: Mark cdn_dp_resume as
 __maybe_unused
Date: Wed, 10 Feb 2021 07:55:24 +0000
Message-ID: <20210210075524.1096128-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.102.38]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 10 Feb 2021 07:48:28 +0000
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
Cc: linux-rockchip@lists.infradead.org, Wei Yongjun <weiyongjun1@huawei.com>,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The function cdn_dp_resume() may have no callers depending
on configuration, so it must be marked __maybe_unused to
avoid harmless warning:

drivers/gpu/drm/rockchip/cdn-dp-core.c:1124:12: warning:
 'cdn_dp_resume' defined but not used [-Wunused-function]
 1124 | static int cdn_dp_resume(struct device *dev)
      |            ^~~~~~~~~~~~~

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/gpu/drm/rockchip/cdn-dp-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/cdn-dp-core.c b/drivers/gpu/drm/rockchip/cdn-dp-core.c
index a4a45daf93f2..1162e321aaed 100644
--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -1121,7 +1121,7 @@ static int cdn_dp_suspend(struct device *dev)
 	return ret;
 }
 
-static int cdn_dp_resume(struct device *dev)
+static int __maybe_unused cdn_dp_resume(struct device *dev)
 {
 	struct cdn_dp_device *dp = dev_get_drvdata(dev);
 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
