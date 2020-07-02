Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 890852135F8
	for <lists+dri-devel@lfdr.de>; Fri,  3 Jul 2020 10:12:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 26D776EB47;
	Fri,  3 Jul 2020 08:12:05 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED1896E07B
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 09:08:05 +0000 (UTC)
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 0DE9EB761AB513D54E7F;
 Thu,  2 Jul 2020 17:08:04 +0800 (CST)
Received: from kernelci-master.huawei.com (10.175.101.6) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.487.0; Thu, 2 Jul 2020 17:07:57 +0800
From: Wei Yongjun <weiyongjun1@huawei.com>
To: Hulk Robot <hulkci@huawei.com>, Jakub Kicinski <kuba@kernel.org>, "Sumit
 Semwal" <sumit.semwal@linaro.org>, zhong jiang <zhongjiang@huawei.com>,
 Shannon Nelson <snelson@pensando.io>, Nikolay Aleksandrov
 <nikolay@cumulusnetworks.com>, Vaibhav Gupta <vaibhavgupta40@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Julian Wiedmann <jwi@linux.ibm.com>
Subject: [PATCH net-next] ksz884x: mark pcidev_suspend() as __maybe_unused
Date: Thu, 2 Jul 2020 17:18:10 +0800
Message-ID: <20200702091810.4999-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 03 Jul 2020 08:12:01 +0000
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
Cc: linaro-mm-sig@lists.linaro.org, netdev@vger.kernel.org,
 Wei Yongjun <weiyongjun1@huawei.com>, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

In certain configurations without power management support, gcc report
the following warning:

drivers/net/ethernet/micrel/ksz884x.c:7182:12: warning:
 'pcidev_suspend' defined but not used [-Wunused-function]
 7182 | static int pcidev_suspend(struct device *dev_d)
      |            ^~~~~~~~~~~~~~

Mark pcidev_suspend() as __maybe_unused to make it clear.

Fixes: 64120615d140 ("ksz884x: use generic power management")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
---
 drivers/net/ethernet/micrel/ksz884x.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/micrel/ksz884x.c b/drivers/net/ethernet/micrel/ksz884x.c
index 24901342ecc0..2ce7304d3753 100644
--- a/drivers/net/ethernet/micrel/ksz884x.c
+++ b/drivers/net/ethernet/micrel/ksz884x.c
@@ -7179,7 +7179,7 @@ static int __maybe_unused pcidev_resume(struct device *dev_d)
 	return 0;
 }
 
-static int pcidev_suspend(struct device *dev_d)
+static int __maybe_unused pcidev_suspend(struct device *dev_d)
 {
 	int i;
 	struct platform_info *info = dev_get_drvdata(dev_d);

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
