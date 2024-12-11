Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 250299EC005
	for <lists+dri-devel@lfdr.de>; Wed, 11 Dec 2024 01:10:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DEE010E077;
	Wed, 11 Dec 2024 00:10:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icloud.com header.i=@icloud.com header.b="wFZXjx1B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pv50p00im-ztdg10011901.me.com (pv50p00im-ztdg10011901.me.com
 [17.58.6.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 371BA10E077
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Dec 2024 00:10:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
 s=1a1hai; t=1733875851;
 bh=jqsRJBKfSOaGGEJF6cLVoAsozLNhyHwMCTK1LKcdRqg=;
 h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:
 x-icloud-hme;
 b=wFZXjx1BDoAbhQx5mjkjCMbrHtOjWkPPm05EUPSiPcRgc4lVCYI5vz454d4bBnUMw
 BpfpyzVrtm3XG7t9+IqNWi6F6neqHszvmJiJh3hsazFofExG6MC/mJYU/4MfjTuOlq
 RXVbs7Rnf03Vyxd7P0TPACijIIai/F63a7GCWGrJdVBUeEEN3mMfi7CbgaE8jrIHYu
 1wVu4NmvILqmxzXYcwpCVHGO4znPtMYs9mOnYGFkNe3klPgU2SymBFBbZXD1xRnwKN
 eCZtoDLcZJZ+Zw4Sv0+fToKi8JeKDCLL3bEAHML3rvNwwJGNQW/RrbSc9/AqRGfsty
 ZC3ns2F7g3tVg==
Received: from [192.168.1.26] (pv50p00im-dlb-asmtp-mailmevip.me.com
 [17.56.9.10])
 by pv50p00im-ztdg10011901.me.com (Postfix) with ESMTPSA id 5432B3A0124;
 Wed, 11 Dec 2024 00:10:40 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Wed, 11 Dec 2024 08:08:11 +0800
Subject: [PATCH v4 09/11] driver core: Introduce an device matching API
 device_match_type()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241211-const_dfc_done-v4-9-583cc60329df@quicinc.com>
References: <20241211-const_dfc_done-v4-0-583cc60329df@quicinc.com>
In-Reply-To: <20241211-const_dfc_done-v4-0-583cc60329df@quicinc.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 James Bottomley <James.Bottomley@HansenPartnership.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas@t-8ch.de>, 
 Zijun Hu <zijun_hu@icloud.com>, linux-kernel@vger.kernel.org, 
 nvdimm@lists.linux.dev, linux-sound@vger.kernel.org, 
 sparclinux@vger.kernel.org, linux-block@vger.kernel.org, 
 linux-cxl@vger.kernel.org, linux1394-devel@lists.sourceforge.net, 
 arm-scmi@vger.kernel.org, linux-efi@vger.kernel.org, 
 linux-gpio@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-mediatek@lists.infradead.org, linux-hwmon@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-pwm@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, linux-scsi@vger.kernel.org, 
 linux-usb@vger.kernel.org, linux-serial@vger.kernel.org, 
 netdev@vger.kernel.org, Zijun Hu <quic_zijuhu@quicinc.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: 4N8rKl70cjGlT8X3ewp5uU3D_HULHiYB
X-Proofpoint-GUID: 4N8rKl70cjGlT8X3ewp5uU3D_HULHiYB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-10_13,2024-12-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 bulkscore=0 phishscore=0
 suspectscore=0 mlxscore=0 spamscore=0 mlxlogscore=999 clxscore=1015
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2412100174
X-Apple-Remote-Links: v=1;h=KCk=;charset=UTF-8
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

Introduce device_match_type() for purposes below:

- Test if a device matches with a specified device type.
- As argument of various device finding APIs to find a device with
  specified type.

device_find_child() will use it to simplify operations later.

Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
---
 drivers/base/core.c        | 6 ++++++
 include/linux/device/bus.h | 1 +
 2 files changed, 7 insertions(+)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index 289f2dafa8f3831931d0f316d66ee12c2cb8a2e1..8bdbc9e657e832a063542391426f570ccb5c18b9 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -5228,6 +5228,12 @@ int device_match_name(struct device *dev, const void *name)
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

