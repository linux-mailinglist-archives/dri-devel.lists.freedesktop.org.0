Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CC9397EC7
	for <lists+dri-devel@lfdr.de>; Wed,  2 Jun 2021 04:17:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA6C96EB59;
	Wed,  2 Jun 2021 02:17:30 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6028E6EB59
 for <dri-devel@lists.freedesktop.org>; Wed,  2 Jun 2021 02:17:30 +0000 (UTC)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4Fvsyb0xLrz66rD;
 Wed,  2 Jun 2021 10:13:43 +0800 (CST)
Received: from dggpemm500006.china.huawei.com (7.185.36.236) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 2 Jun 2021 10:17:27 +0800
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 dggpemm500006.china.huawei.com (7.185.36.236) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Wed, 2 Jun 2021 10:17:26 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Sam Ravnborg <sam@ravnborg.org>, Jani Nikula <jani.nikula@intel.com>,
 "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, dri-devel
 <dri-devel@lists.freedesktop.org>, linux-fbdev <linux-fbdev@vger.kernel.org>, 
 linux-kernel <linux-kernel@vger.kernel.org>
Subject: [PATCH 1/1] video: fbdev: w100fb: use DEVICE_ATTR_WO macro
Date: Wed, 2 Jun 2021 10:17:16 +0800
Message-ID: <20210602021716.10640-1-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.174.177.72]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpemm500006.china.huawei.com (7.185.36.236)
X-CFilter-Loop: Reflected
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
Cc: Zhen Lei <thunder.leizhen@huawei.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Use DEVICE_ATTR_WO macro helper instead of plain DEVICE_ATTR, which makes
the code a bit shorter and easier to read.

Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/video/fbdev/w100fb.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/w100fb.c b/drivers/video/fbdev/w100fb.c
index d96ab28f8ce4ae5..64a5e048c13f76a 100644
--- a/drivers/video/fbdev/w100fb.c
+++ b/drivers/video/fbdev/w100fb.c
@@ -108,7 +108,7 @@ static ssize_t flip_store(struct device *dev, struct device_attribute *attr, con
 
 static DEVICE_ATTR_RW(flip);
 
-static ssize_t w100fb_reg_read(struct device *dev, struct device_attribute *attr, const char *buf, size_t count)
+static ssize_t reg_read_store(struct device *dev, struct device_attribute *attr, const char *buf, size_t count)
 {
 	unsigned long regs, param;
 	regs = simple_strtoul(buf, NULL, 16);
@@ -117,9 +117,9 @@ static ssize_t w100fb_reg_read(struct device *dev, struct device_attribute *attr
 	return count;
 }
 
-static DEVICE_ATTR(reg_read, 0200, NULL, w100fb_reg_read);
+static DEVICE_ATTR_WO(reg_read);
 
-static ssize_t w100fb_reg_write(struct device *dev, struct device_attribute *attr, const char *buf, size_t count)
+static ssize_t reg_write_store(struct device *dev, struct device_attribute *attr, const char *buf, size_t count)
 {
 	unsigned long regs, param;
 	sscanf(buf, "%lx %lx", &regs, &param);
@@ -132,7 +132,7 @@ static ssize_t w100fb_reg_write(struct device *dev, struct device_attribute *att
 	return count;
 }
 
-static DEVICE_ATTR(reg_write, 0200, NULL, w100fb_reg_write);
+static DEVICE_ATTR_WO(reg_write);
 
 
 static ssize_t fastpllclk_show(struct device *dev, struct device_attribute *attr, char *buf)
-- 
2.26.0.106.g9fadedd


