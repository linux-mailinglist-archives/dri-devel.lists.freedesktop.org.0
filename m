Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82A079E15BC
	for <lists+dri-devel@lfdr.de>; Tue,  3 Dec 2024 09:28:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAD4810E967;
	Tue,  3 Dec 2024 08:28:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icloud.com header.i=@icloud.com header.b="Bxsl87hi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pv50p00im-zteg10011501.me.com (pv50p00im-zteg10011501.me.com
 [17.58.6.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C1A210E5A1
 for <dri-devel@lists.freedesktop.org>; Tue,  3 Dec 2024 00:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
 s=1a1hai; t=1733186141;
 bh=bThfuEKMJ2yeRLOzuAumE4TWLmAXtORS0zcclnOkkGY=;
 h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:
 x-icloud-hme;
 b=Bxsl87hi/LMEx00JAt6MMJwYAvD9zQ0gEwUh88CRSz4N+CJRfhsZ6M6hw8j3eOYv1
 yB/3tWXl9nKUPKrH+hWEEm26xHg+WCX1QJqaZOBqbQnM865oP9mUNYhBhqQ+t7VujY
 Kl8LRziRl19cjY4bIA6Du2Cmnb+AwXfNT0KrTB+XnH+mjzdD5wo9+y1c/fThhcwTh+
 bhlUqF91E//f/6YGWlo8sbqhQ2YwXZ2d4n5Iw7g7iIiL9tfOxDIJ8rUsgslRTRh6eW
 UsnsgOYOGa1sBFz2S+FclxWkFJHvt7fJO02kBYXH4tDTvOKZRchgUcZW43NELUlj+F
 iP+CRYHo88cFQ==
Received: from [192.168.1.26] (pv50p00im-dlb-asmtp-mailmevip.me.com
 [17.56.9.10])
 by pv50p00im-zteg10011501.me.com (Postfix) with ESMTPSA id 376F24A0394;
 Tue,  3 Dec 2024 00:35:20 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Tue, 03 Dec 2024 08:33:24 +0800
Subject: [PATCH v2 02/32] driver core: Introduce device_match_type() to
 match device with a device type
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241203-const_dfc_done-v2-2-7436a98c497f@quicinc.com>
References: <20241203-const_dfc_done-v2-0-7436a98c497f@quicinc.com>
In-Reply-To: <20241203-const_dfc_done-v2-0-7436a98c497f@quicinc.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Martin Tuma <martin.tuma@digiteqautomotive.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Andreas Noever <andreas.noever@gmail.com>, 
 Michael Jamet <michael.jamet@intel.com>, 
 Mika Westerberg <mika.westerberg@linux.intel.com>, 
 Yehezkel Bernat <YehezkelShB@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andrew Lunn <andrew@lunn.ch>, 
 Vladimir Oltean <olteanv@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Dan Williams <dan.j.williams@intel.com>, 
 Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
 Ira Weiny <ira.weiny@intel.com>, Takashi Sakamoto <o-takashi@sakamocchi.jp>, 
 Jiri Slaby <jirislaby@kernel.org>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Srinivas Kandagatla <srinivas.kandagatla@linaro.org>, 
 Lee Duncan <lduncan@suse.com>, Chris Leech <cleech@redhat.com>, 
 Mike Christie <michael.christie@oracle.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 "Martin K. Petersen" <martin.petersen@oracle.com>, 
 Nilesh Javali <njavali@marvell.com>, 
 Manish Rangankar <mrangankar@marvell.com>, 
 GR-QLogic-Storage-Upstream@marvell.com, Davidlohr Bueso <dave@stgolabs.net>, 
 Jonathan Cameron <jonathan.cameron@huawei.com>, 
 Alison Schofield <alison.schofield@intel.com>, 
 Andreas Larsson <andreas@gaisler.com>, Stuart Yoder <stuyoder@gmail.com>, 
 Laurentiu Tudor <laurentiu.tudor@nxp.com>, Jens Axboe <axboe@kernel.dk>, 
 Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Ard Biesheuvel <ardb@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: Zijun Hu <zijun_hu@icloud.com>, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-mediatek@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-usb@vger.kernel.org, 
 linux-gpio@vger.kernel.org, netdev@vger.kernel.org, 
 linux-pwm@vger.kernel.org, nvdimm@lists.linux.dev, 
 linux1394-devel@lists.sourceforge.net, linux-serial@vger.kernel.org, 
 linux-sound@vger.kernel.org, open-iscsi@googlegroups.com, 
 linux-scsi@vger.kernel.org, linux-cxl@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-block@vger.kernel.org, 
 arm-scmi@vger.kernel.org, linux-efi@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, Zijun Hu <quic_zijuhu@quicinc.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: pAk2LuCHu3_SWQxz-lZD6BvWYoJ4DRQY
X-Proofpoint-ORIG-GUID: pAk2LuCHu3_SWQxz-lZD6BvWYoJ4DRQY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-02_14,2024-12-02_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 bulkscore=0
 mlxlogscore=999 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 clxscore=1015 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2412030002
X-Apple-Remote-Links: v=1;h=KCk=;charset=UTF-8
X-Mailman-Approved-At: Tue, 03 Dec 2024 08:28:29 +0000
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

From: Zijun Hu <quic_zijuhu@quicinc.com>

Introduce device_match_type() to simplify operations below:

- Test if a device matches with specified device type.
- Find a device with specified device type via various device finding APIs.

device_find_child() will use it as argument to simplify operations later.

Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
---
 drivers/base/core.c        | 6 ++++++
 include/linux/device/bus.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index a122ea1d84a3b08fce16dd1abdfa7746d31dc430..5bda2edcd83149decd50bb5e9a0ed4267b1f8f6c 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -5239,6 +5239,12 @@ int device_match_name(struct device *dev, const void *name)
 }
 EXPORT_SYMBOL_GPL(device_match_name);
 
+int device_match_type(struct device *dev, const void *type)
+{
+	return dev->type == type;
+}
+EXPORT_SYMBOL_GPL(device_match_type);
+
 int device_match_of_node(struct device *dev, const void *np)
 {
 	return dev->of_node == np;
diff --git a/include/linux/device/bus.h b/include/linux/device/bus.h
index cdc4757217f9bb4b36b5c3b8a48bab45737e44c5..bc3fd74bb763e6d2d862859bd2ec3f0d443f2d7a 100644
--- a/include/linux/device/bus.h
+++ b/include/linux/device/bus.h
@@ -131,6 +131,7 @@ typedef int (*device_match_t)(struct device *dev, const void *data);
 
 /* Generic device matching functions that all busses can use to match with */
 int device_match_name(struct device *dev, const void *name);
+int device_match_type(struct device *dev, const void *type);
 int device_match_of_node(struct device *dev, const void *np);
 int device_match_fwnode(struct device *dev, const void *fwnode);
 int device_match_devt(struct device *dev, const void *pdevt);

-- 
2.34.1

