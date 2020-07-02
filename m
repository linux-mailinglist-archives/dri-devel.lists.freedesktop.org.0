Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ED73F21250C
	for <lists+dri-devel@lfdr.de>; Thu,  2 Jul 2020 15:44:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAF306E942;
	Thu,  2 Jul 2020 13:44:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com
 [210.118.77.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76D516E942
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 13:44:37 +0000 (UTC)
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20200702134435euoutp02fb4c954cb1eacbdf1898f828ccb23f72~d82kIuReQ3220232202euoutp02h
 for <dri-devel@lists.freedesktop.org>; Thu,  2 Jul 2020 13:44:35 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20200702134435euoutp02fb4c954cb1eacbdf1898f828ccb23f72~d82kIuReQ3220232202euoutp02h
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1593697475;
 bh=Wcn/fZwn0l0I3UrXznsXGlfRgX1zzz/eHT6cU1JUJ98=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=coTUImIXandF5sPwA8906cKi/QS9cqx/iqXawoGD7LBBvkCASPVFfheEvILlvt4J8
 Y0IHpte5+lkdtPjPpDN9luu9X5+Fq4h9flkYlViCWI1JYmezY1ZHYmowZqLBlLmp+r
 aUimFdb7LptZhIDZQFTsESvS/hzZgIQxD6/78Pto=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20200702134435eucas1p277a21a6696e124b42c102540c6665951~d82j2tuHL1813018130eucas1p2-;
 Thu,  2 Jul 2020 13:44:35 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id 92.F2.05997.3C4EDFE5; Thu,  2
 Jul 2020 14:44:35 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20200702134434eucas1p233a3f66f5bdb4b97f4f49d2d43d45297~d82je7wnZ3023830238eucas1p2_;
 Thu,  2 Jul 2020 13:44:34 +0000 (GMT)
Received: from eusmgms2.samsung.com (unknown [182.198.249.180]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20200702134434eusmtrp21c06ae96bce6fb9cbe4c5cc8fdfb920f~d82jeDPk60528405284eusmtrp2c;
 Thu,  2 Jul 2020 13:44:34 +0000 (GMT)
X-AuditID: cbfec7f4-677ff7000000176d-fd-5efde4c3265d
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms2.samsung.com (EUCPMTA) with SMTP id D4.94.06017.2C4EDFE5; Thu,  2
 Jul 2020 14:44:34 +0100 (BST)
Received: from AMDC3748.digital.local (unknown [106.120.51.74]) by
 eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20200702134434eusmtip2c307019c112809392842a9a51d543146~d82ivfvFs2865128651eusmtip2L;
 Thu,  2 Jul 2020 13:44:34 +0000 (GMT)
From: Andrzej Hajda <a.hajda@samsung.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v8 2/5] driver core: add deferring probe reason to
 devices_deferred property
Date: Thu,  2 Jul 2020 15:44:21 +0200
Message-Id: <20200702134421.6412-1-a.hajda@samsung.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <CAHp75VegHLG5tgVFjwmpmDfSqELqNXcb9dFSM4jLRx+anW7Lsw@mail.gmail.com>
X-Brightmail-Tracker: H4sIAAAAAAAAA0WSbUhTYRTHeXbv7r2OFtcZ+KCRtNKySCsDHyrMIuRSBPUhisLVahe13KZb
 mvpFw/Kl1GYh1lZmZSqmzpeypq1kmktkmi+TaS4xjdJcEmqaNW3z9vLt9/zP/5z/4fBQmKiL
 70PFKC6wKoU0VkwI8Ia2H51bWsackq2D91egwepOPhrXtABUe0vPRwUjYwRaasjHUN/sFIHS
 H+oJZJ0bx1D7pBVH2fklJKob7eej3sY7BDIVGAGqarWTyJR3Et2dKcDCaaa3vxtjpmxXSMb4
 vRhnDFo7yeiybvOZuopsgnmj6eExr+5WkszwNTOPqS9JZfKeVACmOfcmzkzXrTksPCHYLWNj
 YxJZVXDYaUF01UImFte6PslosYI00LbmKvCgIL0DlnbN864CASWiywEsLW4huccMgFNN9Ty3
 S0RPA5hz89zfjsXPOpwzlQH4JX+J96+j0vyJdLsIOhA66wcIN6+iQ+B1i3Z5LEYv4NCamcF3
 F7xoCay1DWBuxml/eHnOCtwspEPhe20WwcX5wcc1zcseD/oINOpLlqMhPU7C3rIPfM60H76e
 t+Mce8EJ8xOS49VwyXCPx3EqHC6/jHHNWQA+rTFgXGEXHOpccKVRrvUCob4xmJP3wvqefuCW
 Ib0S2hyebhlz4Y2GQoyThTArQ8S518Jhy9M/A73ho7ezf9ZnYPqHeYI7UAmAn+wfgQb4af+H
 FQNQAbzZBLU8ilVvV7AXg9RSuTpBERV0VimvA65v1rFonnkOGn+dMQGaAuIVQo3ZKRHxpYnq
 ZLkJQAoTrxLus3RIREKZNDmFVSlPqRJiWbUJ+FK42FsY8mA8UkRHSS+w51k2jlX9rfIoD580
 gHd/fZaY0e5/dE+zb2RFn+fEYuD3dYORP/2KqDPHj5myz94PDy0P6ylrCvCZCwLKwnidjd5s
 SBMLlIcc12wHhswB8Q++rXck1eSllvV4R6CNBZdephdGMEXGiykHlbJjylz7u/wcz5AXI+0E
 vqFaEf8MrZtw+O8UOI+P6mSTHmJcHS3dtglTqaW/Ad2DKRRiAwAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrPIsWRmVeSWpSXmKPExsVy+t/xe7qHnvyNM7h5WN/i1rpzrBYvJxxm
 tNg4Yz2rxdSHT9gs/m+byGxx5et7NovmxevZLK5+f8lscfLNVRaLzolL2C02Pb7GanF51xw2
 i0NT9zJarD1yl93iUF+0xdwvU5kdBDwuX7vI7PH+Riu7x95vC1g8ds66y+4xu2Mmq8emVZ1s
 HicmXGLy2D93DbvH/e7jTB6bl9R79G1ZxehxoHcyi8fnTXIBvFF6NkX5pSWpChn5xSW2StGG
 FkZ6hpYWekYmlnqGxuaxVkamSvp2NimpOZllqUX6dgl6GWt/tTMXHFGp2Hv2KmMD4zG5LkZO
 DgkBE4l/L2azgNhCAksZJZ7sNoGIi0vsnv+WGcIWlvhzrYsNouYTo8TEpWBxNgFNib+bb4LF
 RQSMJfrPzmLvYuTiYBZoY5WYe/4JO0hCWCBG4u+Nd4wgNouAqkTL96tgNq+AucS9WR1sEAvk
 JVZvOAA2lFMgUGLv+iVQBwVInLjZxzaBkW8BI8MqRpHU0uLc9NxiI73ixNzi0rx0veT83E2M
 wMjaduznlh2MXe+CDzEKcDAq8fBOOP43Tog1say4MvcQowQHs5IIr9PZ03FCvCmJlVWpRfnx
 RaU5qcWHGE2BjprILCWanA+M+rySeENTQ3MLS0NzY3NjMwslcd4OgYMxQgLpiSWp2ampBalF
 MH1MHJxSDYyTjA/6fM878yhdRnDj1unBz/knyIXxLsoMf9wm+alsW2Hbv+hL56JtncV9A5MN
 Jzfqdi9zXNyj+aqoZdd2N67giQGu2Svfp/7KYNl7amWmbbFd8qedM5QzVVRsVG3VQp+t5nTa
 ftDZrfvXvugrYhb8H07nT7krcb17r8v6gvWhKrtsrKp/r1FiKc5INNRiLipOBABK6oWQwgIA
 AA==
X-CMS-MailID: 20200702134434eucas1p233a3f66f5bdb4b97f4f49d2d43d45297
X-Msg-Generator: CA
X-RootMTR: 20200702134434eucas1p233a3f66f5bdb4b97f4f49d2d43d45297
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20200702134434eucas1p233a3f66f5bdb4b97f4f49d2d43d45297
References: <CAHp75VegHLG5tgVFjwmpmDfSqELqNXcb9dFSM4jLRx+anW7Lsw@mail.gmail.com>
 <CGME20200702134434eucas1p233a3f66f5bdb4b97f4f49d2d43d45297@eucas1p2.samsung.com>
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
Cc: Jernej Skrabec <jernej.skrabec@siol.net>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 linux-kernel@vger.kernel.org,
 "open list:DRM DRIVERS" <dri-devel@lists.freedesktop.org>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Neil Armstrong <narmstrong@baylibre.com>, Andrzej Hajda <a.hajda@samsung.com>,
 andy.shevchenko@gmail.com, Mark Brown <broonie@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 linux-arm-kernel@lists.infradead.org,
 Marek Szyprowski <m.szyprowski@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

/sys/kernel/debug/devices_deferred property contains list of deferred devices.
This list does not contain reason why the driver deferred probe, the patch
improves it.
The natural place to set the reason is dev_err_probe function introduced
recently, ie. if dev_err_probe will be called with -EPROBE_DEFER instead of
printk the message will be attached to a deferred device and printed when user
reads devices_deferred property.

Signed-off-by: Andrzej Hajda <a.hajda@samsung.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Reviewed-by: Rafael J. Wysocki <rafael@kernel.org>
---
v8:
- improved commit message
---
 drivers/base/base.h |  3 +++
 drivers/base/core.c |  8 ++++++--
 drivers/base/dd.c   | 23 ++++++++++++++++++++++-
 3 files changed, 31 insertions(+), 3 deletions(-)

diff --git a/drivers/base/base.h b/drivers/base/base.h
index 95c22c0f9036..6954fccab3d7 100644
--- a/drivers/base/base.h
+++ b/drivers/base/base.h
@@ -93,6 +93,7 @@ struct device_private {
 	struct klist_node knode_class;
 	struct list_head deferred_probe;
 	struct device_driver *async_driver;
+	char *deferred_probe_reason;
 	struct device *device;
 	u8 dead:1;
 };
@@ -134,6 +135,8 @@ extern void device_release_driver_internal(struct device *dev,
 extern void driver_detach(struct device_driver *drv);
 extern int driver_probe_device(struct device_driver *drv, struct device *dev);
 extern void driver_deferred_probe_del(struct device *dev);
+extern void device_set_deferred_probe_reson(const struct device *dev,
+					    struct va_format *vaf);
 static inline int driver_match_device(struct device_driver *drv,
 				      struct device *dev)
 {
diff --git a/drivers/base/core.c b/drivers/base/core.c
index 3a827c82933f..fee047f03681 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -3963,6 +3963,8 @@ define_dev_printk_level(_dev_info, KERN_INFO);
  * This helper implements common pattern present in probe functions for error
  * checking: print debug or error message depending if the error value is
  * -EPROBE_DEFER and propagate error upwards.
+ * In case of -EPROBE_DEFER it sets also defer probe reason, which can be
+ * checked later by reading devices_deferred debugfs attribute.
  * It replaces code sequence:
  * 	if (err != -EPROBE_DEFER)
  * 		dev_err(dev, ...);
@@ -3984,10 +3986,12 @@ int dev_err_probe(const struct device *dev, int err, const char *fmt, ...)
 	vaf.fmt = fmt;
 	vaf.va = &args;
 
-	if (err != -EPROBE_DEFER)
+	if (err != -EPROBE_DEFER) {
 		dev_err(dev, "error %d: %pV", err, &vaf);
-	else
+	} else {
+		device_set_deferred_probe_reson(dev, &vaf);
 		dev_dbg(dev, "error %d: %pV", err, &vaf);
+	}
 
 	va_end(args);
 
diff --git a/drivers/base/dd.c b/drivers/base/dd.c
index 9a1d940342ac..dd5683b61f74 100644
--- a/drivers/base/dd.c
+++ b/drivers/base/dd.c
@@ -27,6 +27,7 @@
 #include <linux/async.h>
 #include <linux/pm_runtime.h>
 #include <linux/pinctrl/devinfo.h>
+#include <linux/slab.h>
 
 #include "base.h"
 #include "power/power.h"
@@ -136,6 +137,8 @@ void driver_deferred_probe_del(struct device *dev)
 	if (!list_empty(&dev->p->deferred_probe)) {
 		dev_dbg(dev, "Removed from deferred list\n");
 		list_del_init(&dev->p->deferred_probe);
+		kfree(dev->p->deferred_probe_reason);
+		dev->p->deferred_probe_reason = NULL;
 	}
 	mutex_unlock(&deferred_probe_mutex);
 }
@@ -211,6 +214,23 @@ void device_unblock_probing(void)
 	driver_deferred_probe_trigger();
 }
 
+/**
+ * device_set_deferred_probe_reson() - Set defer probe reason message for device
+ * @dev: the pointer to the struct device
+ * @vaf: the pointer to va_format structure with message
+ */
+void device_set_deferred_probe_reson(const struct device *dev, struct va_format *vaf)
+{
+	const char *drv = dev_driver_string(dev);
+
+	mutex_lock(&deferred_probe_mutex);
+
+	kfree(dev->p->deferred_probe_reason);
+	dev->p->deferred_probe_reason = kasprintf(GFP_KERNEL, "%s: %pV", drv, vaf);
+
+	mutex_unlock(&deferred_probe_mutex);
+}
+
 /*
  * deferred_devs_show() - Show the devices in the deferred probe pending list.
  */
@@ -221,7 +241,8 @@ static int deferred_devs_show(struct seq_file *s, void *data)
 	mutex_lock(&deferred_probe_mutex);
 
 	list_for_each_entry(curr, &deferred_probe_pending_list, deferred_probe)
-		seq_printf(s, "%s\n", dev_name(curr->device));
+		seq_printf(s, "%s\t%s", dev_name(curr->device),
+			   curr->device->p->deferred_probe_reason ?: "\n");
 
 	mutex_unlock(&deferred_probe_mutex);
 
-- 
2.17.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
