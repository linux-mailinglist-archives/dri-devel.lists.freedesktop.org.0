Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07FCD87FAB6
	for <lists+dri-devel@lfdr.de>; Tue, 19 Mar 2024 10:30:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E5A10F906;
	Tue, 19 Mar 2024 09:30:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fujitsu.com header.i=@fujitsu.com header.b="YnVwc5H0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 430 seconds by postgrey-1.36 at gabe;
 Tue, 19 Mar 2024 09:30:31 UTC
Received: from esa4.hc1455-7.c3s2.iphmx.com (esa4.hc1455-7.c3s2.iphmx.com
 [68.232.139.117])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A521010F903
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 09:30:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
 t=1710840631; x=1742376631;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=+G+/hjvdQsQIOwGVBqPAWDHYVXzep1SS6d6R6Wc6HgA=;
 b=YnVwc5H06Su106gYgi5YMKwAdkYUPqs6xRFB2K1orZJxzdBD11esZly8
 e1Dy8eGeY2DuVq4XCfvUNd3iRFThM8RqbATTlgucCFpv/Ug06btgFbBRo
 ZbCYp6EgTasIkoaHo5dKxSrv/BROKM+EUQaVjx4xvgNg04YunDpf0X1Vy
 OQp1nSUe59ZOMPgs6HbcZMe2fDWopVS4mxSvIogTFJ7qgMCtjszb4ngvp
 X8WbgSSlmfhEET3Z1BNX4Piye9mYjXMXg9eZB6ceUOIaRSh+60I4uNakB
 /my9/TKOSn2bEfKZHgUgskHQyI+R9NJuZSlv1KVaqVsKyxUgV0MDeBZP/ A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11017"; a="152991668"
X-IronPort-AV: E=Sophos;i="6.07,136,1708354800"; d="scan'208";a="152991668"
Received: from unknown (HELO yto-r3.gw.nic.fujitsu.com) ([218.44.52.219])
 by esa4.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 19 Mar 2024 18:23:18 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com
 [192.168.83.65])
 by yto-r3.gw.nic.fujitsu.com (Postfix) with ESMTP id 635D110A302
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 18:23:16 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com
 [192.51.206.21])
 by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id 9AF5DD419A
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 18:23:15 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
 by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 1B483200A7D71
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Mar 2024 18:23:15 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.226.45])
 by edo.cn.fujitsu.com (Postfix) with ESMTP id BF2271A006B;
 Tue, 19 Mar 2024 17:23:13 +0800 (CST)
From: Li Zhijian <lizhijian@fujitsu.com>
To: linux-kernel@vger.kernel.org
Cc: Li Zhijian <lizhijian@fujitsu.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, Sam Ravnborg <sam@ravnborg.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org
Subject: [PATCH v3] drm/panel: tpo-td043mtea1: Convert sprintf() family to
 sysfs_emit() family
Date: Tue, 19 Mar 2024 17:23:10 +0800
Message-Id: <20240319092310.1590270-1-lizhijian@fujitsu.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28260.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28260.006
X-TMASE-Result: 10--8.066400-10.000000
X-TMASE-MatchedRID: RKkR8WK0E1obO59FK9BdmJiHtCNYjckMjkDrBOJwwnQ8JmmJxjOaQXVX
 Q3/qdw5yDiqGKKMcNgRhoUIS5GGeEs1HQN/TlJ3ZOIQ9GP2P2u9hCyUKzFE4pMOmbgJn0O1cd5G
 gTXcmX3z/gi5MRR1gmuKPZyvBQlTFs+DazrJbzs47I8qKHhHKyIY+g3uPA6ifU5+divxV/ok6SI
 YaJ07sjyL637QCIVpi8vc3EUpCmrV8M8QL/JCA9N9JA2lmQRNUsWTnXVTJRGcGWfDd0b0zMaPFj
 JEFr+olwXCBO/GKkVqOhzOa6g8KrWfLZ4Cl6GGUpWdQGnu54z1xFDWqWkyrkRYZm7Em44odC3Ze
 sb9BtDs=
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
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

Per filesystems/sysfs.rst, show() should only use sysfs_emit()
or sysfs_emit_at() when formatting the value to be returned to user space.

coccinelle complains that there are still a couple of functions that use
snprintf(). Convert them to sysfs_emit().

sprintf() and scnprintf() will be converted as well if they have.

Generally, this patch is generated by
make coccicheck M=<path/to/file> MODE=patch \
COCCI=scripts/coccinelle/api/device_attr_show.cocci

No functional change intended

CC: Neil Armstrong <neil.armstrong@linaro.org>
CC: Jessica Zhang <quic_jesszhan@quicinc.com>
CC: Sam Ravnborg <sam@ravnborg.org>
CC: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
CC: Maxime Ripard <mripard@kernel.org>
CC: Thomas Zimmermann <tzimmermann@suse.de>
CC: David Airlie <airlied@gmail.com>
CC: Daniel Vetter <daniel@ffwll.ch>
CC: dri-devel@lists.freedesktop.org
Signed-off-by: Li Zhijian <lizhijian@fujitsu.com>
---
V3:
   split it from a mess of drm,fbdev because they are not the same subsystem.

This is a part of the work "Fix coccicheck device_attr_show warnings"[1]
Split them per subsystem so that the maintainer can review it easily
[1] https://lore.kernel.org/lkml/20240116041129.3937800-1-lizhijian@fujitsu.com/
---
 drivers/gpu/drm/panel/panel-tpo-td043mtea1.c | 13 ++++---------
 1 file changed, 4 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c b/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c
index cf4609bb9b1d..0983fe47eb5a 100644
--- a/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c
+++ b/drivers/gpu/drm/panel/panel-tpo-td043mtea1.c
@@ -242,16 +242,11 @@ static ssize_t gamma_show(struct device *dev, struct device_attribute *attr,
 	struct td043mtea1_panel *lcd = dev_get_drvdata(dev);
 	ssize_t len = 0;
 	unsigned int i;
-	int ret;
 
-	for (i = 0; i < ARRAY_SIZE(lcd->gamma); i++) {
-		ret = snprintf(buf + len, PAGE_SIZE - len, "%u ",
-			       lcd->gamma[i]);
-		if (ret < 0)
-			return ret;
-		len += ret;
-	}
-	buf[len - 1] = '\n';
+	for (i = 0; i < ARRAY_SIZE(lcd->gamma); i++)
+		len += sysfs_emit_at(buf, len, "%u ", lcd->gamma[i]);
+	if (len)
+		buf[len - 1] = '\n';
 
 	return len;
 }
-- 
2.29.2

