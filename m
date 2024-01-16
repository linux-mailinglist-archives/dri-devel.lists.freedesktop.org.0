Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C5A82EAB2
	for <lists+dri-devel@lfdr.de>; Tue, 16 Jan 2024 09:12:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF98810E3F1;
	Tue, 16 Jan 2024 08:12:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 429 seconds by postgrey-1.36 at gabe;
 Tue, 16 Jan 2024 04:59:47 UTC
Received: from esa9.hc1455-7.c3s2.iphmx.com (esa9.hc1455-7.c3s2.iphmx.com
 [139.138.36.223])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DEE910E304
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 04:59:47 +0000 (UTC)
X-IronPort-AV: E=McAfee;i="6600,9927,10954"; a="134631019"
X-IronPort-AV: E=Sophos;i="6.04,198,1695654000"; d="scan'208";a="134631019"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
 by esa9.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jan 2024 13:52:30 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com
 [192.168.83.66])
 by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 31C8CD618B
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 13:52:28 +0900 (JST)
Received: from kws-ab4.gw.nic.fujitsu.com (kws-ab4.gw.nic.fujitsu.com
 [192.51.206.22])
 by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 755E1D9742
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 13:52:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
 by kws-ab4.gw.nic.fujitsu.com (Postfix) with ESMTP id 151596B4C9
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Jan 2024 13:52:27 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.226.45])
 by edo.cn.fujitsu.com (Postfix) with ESMTP id 97D7B1A015F;
 Tue, 16 Jan 2024 12:52:26 +0800 (CST)
From: Li Zhijian <lizhijian@fujitsu.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH 41/42] drivers/video/fbdev/uvesafb: Convert snprintf to
 sysfs_emit
Date: Tue, 16 Jan 2024 12:51:50 +0800
Message-Id: <20240116045151.3940401-39-lizhijian@fujitsu.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240116045151.3940401-1-lizhijian@fujitsu.com>
References: <20240116041129.3937800-1-lizhijian@fujitsu.com>
 <20240116045151.3940401-1-lizhijian@fujitsu.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28122.005
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28122.005
X-TMASE-Result: 10--9.874000-10.000000
X-TMASE-MatchedRID: i5zBIT546Mc4ibokZ3+Q0CoiRKlBVkYIBXngI6jFvpfvd49YGReckE1N
 J2MN+nPkgxCMf8A0YpR5sRK06wHV4TBF7stuNMMx7pujb8urdzbBOVz0Jwcxl6vCrG0TnfVUg9x
 e4gtUJtpqw4mhfH/Cj7xaYlLIzqlbxrdsXS7GN2R85pjA/x1xfh+KaaVwAG43myiLZetSf8nyb6
 HMFK1qe11j5mhaIsibIAcCikR3vq/kMPXp0aB3ELYviMHenHfbKLjGgcED+8Cce8i7phl3Cch2t
 Yr3dvi2
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
X-Mailman-Approved-At: Tue, 16 Jan 2024 08:12:15 +0000
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
Cc: dri-devel@lists.freedesktop.org, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, Li Zhijian <lizhijian@fujitsu.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Per filesystems/sysfs.rst, show() should only use sysfs_emit()
or sysfs_emit_at() when formatting the value to be returned to user space.

coccinelle complains that there are still a couple of functions that use
snprintf(). Convert them to sysfs_emit().

> ./drivers/video/fbdev/uvesafb.c:1549:8-16: WARNING: please use sysfs_emit

No functional change intended

CC: Helge Deller <deller@gmx.de>
CC: linux-fbdev@vger.kernel.org
CC: dri-devel@lists.freedesktop.org
Signed-off-by: Li Zhijian <lizhijian@fujitsu.com>
---
 drivers/video/fbdev/uvesafb.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/uvesafb.c b/drivers/video/fbdev/uvesafb.c
index e1f421e91b4f..73f00c079a94 100644
--- a/drivers/video/fbdev/uvesafb.c
+++ b/drivers/video/fbdev/uvesafb.c
@@ -1546,7 +1546,7 @@ static ssize_t uvesafb_show_vbe_ver(struct device *dev,
 	struct fb_info *info = dev_get_drvdata(dev);
 	struct uvesafb_par *par = info->par;
 
-	return snprintf(buf, PAGE_SIZE, "%.4x\n", par->vbe_ib.vbe_version);
+	return sysfs_emit(buf, "%.4x\n", par->vbe_ib.vbe_version);
 }
 
 static DEVICE_ATTR(vbe_version, S_IRUGO, uvesafb_show_vbe_ver, NULL);
-- 
2.29.2

