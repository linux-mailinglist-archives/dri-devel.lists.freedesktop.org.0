Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A2F187BDE8
	for <lists+dri-devel@lfdr.de>; Thu, 14 Mar 2024 14:41:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E488810FB30;
	Thu, 14 Mar 2024 13:41:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=fujitsu.com header.i=@fujitsu.com header.b="B9L0hPqx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 430 seconds by postgrey-1.36 at gabe;
 Thu, 14 Mar 2024 10:05:43 UTC
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com
 [207.54.90.137])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3301610FA1E
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 10:05:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
 t=1710410743; x=1741946743;
 h=from:to:cc:subject:date:message-id:mime-version:
 content-transfer-encoding;
 bh=sfMWZ8DddWL1BUlbNGcxm5ArLRc2O1z6QCNIA8SoAxU=;
 b=B9L0hPqxhni8sCYyKpTIlH1c5IkAQGTjf8QObrl3Y7h9qroxisEMG5fF
 VATdDRT2CikTiOn1cJphZXKXOPAq7QYta2fXCGF/MDhVFl5g2bzHrcbCt
 fi4h4itfX+rJIGiDb0lM+qX8/ckgwGonr+p2RmJHVchFaUA8S1wK8OTY/
 mf06orRXnrs1JefWk08PZZMLiG5WeXbN0TvXN+j2Nso4/qyXimHXml25h
 hepSsaXXB2K/YkEWYws+kIVo4zVrwekZ2i3lCOTrH5vcXKj2p24u5z+RZ
 bIXafk/EFyU1LZ/mC4wFdvuwajiVsX/ZV9wXbE82JxGexxRdSOCgLCGVM g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11012"; a="131625026"
X-IronPort-AV: E=Sophos;i="6.07,125,1708354800"; d="scan'208";a="131625026"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
 by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Mar 2024 18:58:30 +0900
Received: from yto-m3.gw.nic.fujitsu.com (yto-nat-yto-m3.gw.nic.fujitsu.com
 [192.168.83.66])
 by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id 072BA232AC
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 18:58:28 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com
 [192.51.206.21])
 by yto-m3.gw.nic.fujitsu.com (Postfix) with ESMTP id 42599E6268
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 18:58:27 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
 by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id C297320099062
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Mar 2024 18:58:26 +0900 (JST)
Received: from localhost.localdomain (unknown [10.167.226.45])
 by edo.cn.fujitsu.com (Postfix) with ESMTP id 087CE1A006B;
 Thu, 14 Mar 2024 17:58:26 +0800 (CST)
From: Li Zhijian <lizhijian@fujitsu.com>
To: linux-kernel@vger.kernel.org
Cc: Li Zhijian <lizhijian@fujitsu.com>, Helge Deller <deller@gmx.de>,
 linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [PATCH v2] fbdev: uvesafb: Convert sprintf/snprintf to sysfs_emit
Date: Thu, 14 Mar 2024 17:58:13 +0800
Message-Id: <20240314095813.1326057-1-lizhijian@fujitsu.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28250.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28250.006
X-TMASE-Result: 10--7.635400-10.000000
X-TMASE-MatchedRID: /mcjwogdDrk4ibokZ3+Q0CoiRKlBVkYIBXngI6jFvpfDqO6/8R69QE8U
 roFNOGp7a6aAZTOwtJmRloiW1Kgftd2ZdKe8BPbSrMZ+BqQt2NoUifIaLms/Ai99T+uJIleRfDo
 fTpsyCK+KztDhRgoFQW4suX2uLJTkj56IjTnLR+lO5y1KmK5bJRSLgSFq3Tnj31GU/N5W5BDIvl
 CZY6Ax8M4b571oAikePJ5LkgpVFu/+0jQufZU6FHaNJ/iTxXCafS0Ip2eEHnwj/1Rbkzl1E2nuo
 SGaY+DLjoczmuoPCq3KpKCvtpEvkcjF1BMed4zx9dOhdW325xZyoiRfQZLwqQ5tS3rRqe7L
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
X-Mailman-Approved-At: Thu, 14 Mar 2024 13:41:30 +0000
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

sprintf() will be converted as weel if they have.

Generally, this patch is generated by
make coccicheck M=<path/to/file> MODE=patch \
COCCI=scripts/coccinelle/api/device_attr_show.cocci

No functional change intended

CC: Helge Deller <deller@gmx.de>
CC: linux-fbdev@vger.kernel.org
CC: dri-devel@lists.freedesktop.org
Signed-off-by: Li Zhijian <lizhijian@fujitsu.com>
---
This is a part of the work "Fix coccicheck device_attr_show warnings"[1]
Split them per subsystem so that the maintainer can review it easily
[1] https://lore.kernel.org/lkml/20240116041129.3937800-1-lizhijian@fujitsu.com/
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

