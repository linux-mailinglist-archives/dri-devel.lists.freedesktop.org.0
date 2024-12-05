Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A4089E4F21
	for <lists+dri-devel@lfdr.de>; Thu,  5 Dec 2024 09:02:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E91E10EDE4;
	Thu,  5 Dec 2024 08:02:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icloud.com header.i=@icloud.com header.b="t2KTkk30";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pv50p00im-tydg10011801.me.com (pv50p00im-tydg10011801.me.com
 [17.58.6.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E635410E35C
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Dec 2024 00:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
 s=1a1hai; t=1733357589;
 bh=t5prCo8UotA+1FRQmsP8HYiQwFRGgFHZ6D5HPcEJxkY=;
 h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:
 x-icloud-hme;
 b=t2KTkk30j/x8cwgwejUYwek4VjEcxvplqznK79L1VULbmbGc8ou6ycm+rwwfEhTTT
 JOueTBNF2mp/zwSxcMu/VtvGuDduuIvrRyjs918+nC81xYIbUQrEH3l7zNMQn45jq5
 ZS2Wf15OXou1M+D9min87hMiwC20ZSLHH9UfQwFBhvNC2aqm1DVRhAVZZaydyaXO7b
 e93Q4ScxXqL4B+jcufIMkxNyvs8Say+zLJymJXLzwZYkfoKDBRtH/MZJasFyv+4W9Q
 7VDFlrk5wo4wXg/geYB1LEf/oH1wpsLc1V2iSnMt4bHHCqtnPt4jOY1A4QtPl58UXK
 VhcOwTTLVWhPQ==
Received: from [192.168.1.26] (pv50p00im-dlb-asmtp-mailmevip.me.com
 [17.56.9.10])
 by pv50p00im-tydg10011801.me.com (Postfix) with ESMTPSA id 0A474800382;
 Thu,  5 Dec 2024 00:12:58 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Thu, 05 Dec 2024 08:10:20 +0800
Subject: [PATCH v3 11/11] usb: typec: class: Remove both cable_match() and
 partner_match()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241205-const_dfc_done-v3-11-1611f1486b5a@quicinc.com>
References: <20241205-const_dfc_done-v3-0-1611f1486b5a@quicinc.com>
In-Reply-To: <20241205-const_dfc_done-v3-0-1611f1486b5a@quicinc.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
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
 open-iscsi@googlegroups.com, linux-usb@vger.kernel.org, 
 linux-serial@vger.kernel.org, netdev@vger.kernel.org, 
 Zijun Hu <quic_zijuhu@quicinc.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: VdKDrx-KLtW7yCbNEje76WJIjR4qS0Q9
X-Proofpoint-GUID: VdKDrx-KLtW7yCbNEje76WJIjR4qS0Q9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-04_19,2024-12-04_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0
 clxscore=1015 phishscore=0 suspectscore=0 bulkscore=0 mlxscore=0
 spamscore=0 mlxlogscore=901 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2308100000 definitions=main-2412040186
X-Apple-Remote-Links: v=1;h=KCk=;charset=UTF-8
X-Mailman-Approved-At: Thu, 05 Dec 2024 08:01:58 +0000
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

cable_match(), as matching function of device_find_child(), is to match
a device with device type @typec_cable_dev_type, and is unnecessary.

partner_match() is similar with cable_match() but with different device
type @typec_partner_dev_type.

Remove both functions and directly use API device_match_type() plus
respective device type instead.

Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
---
 drivers/usb/typec/class.c | 27 ++++++++++++---------------
 1 file changed, 12 insertions(+), 15 deletions(-)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 601a81aa1e1024265f2359393dee531a7779c6ea..3a4e0bd0131774afd0d746d2f0a306190219feec 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -1282,11 +1282,6 @@ const struct device_type typec_cable_dev_type = {
 	.release = typec_cable_release,
 };
 
-static int cable_match(struct device *dev, const void *data)
-{
-	return is_typec_cable(dev);
-}
-
 /**
  * typec_cable_get - Get a reference to the USB Type-C cable
  * @port: The USB Type-C Port the cable is connected to
@@ -1298,7 +1293,8 @@ struct typec_cable *typec_cable_get(struct typec_port *port)
 {
 	struct device *dev;
 
-	dev = device_find_child(&port->dev, NULL, cable_match);
+	dev = device_find_child(&port->dev, &typec_cable_dev_type,
+				device_match_type);
 	if (!dev)
 		return NULL;
 
@@ -2028,16 +2024,12 @@ const struct device_type typec_port_dev_type = {
 /* --------------------------------------- */
 /* Driver callbacks to report role updates */
 
-static int partner_match(struct device *dev, const void *data)
-{
-	return is_typec_partner(dev);
-}
-
 static struct typec_partner *typec_get_partner(struct typec_port *port)
 {
 	struct device *dev;
 
-	dev = device_find_child(&port->dev, NULL, partner_match);
+	dev = device_find_child(&port->dev, &typec_partner_dev_type,
+				device_match_type);
 	if (!dev)
 		return NULL;
 
@@ -2170,7 +2162,9 @@ void typec_set_pwr_opmode(struct typec_port *port,
 	sysfs_notify(&port->dev.kobj, NULL, "power_operation_mode");
 	kobject_uevent(&port->dev.kobj, KOBJ_CHANGE);
 
-	partner_dev = device_find_child(&port->dev, NULL, partner_match);
+	partner_dev = device_find_child(&port->dev,
+					&typec_partner_dev_type,
+					device_match_type);
 	if (partner_dev) {
 		struct typec_partner *partner = to_typec_partner(partner_dev);
 
@@ -2334,7 +2328,9 @@ int typec_get_negotiated_svdm_version(struct typec_port *port)
 	enum usb_pd_svdm_ver svdm_version;
 	struct device *partner_dev;
 
-	partner_dev = device_find_child(&port->dev, NULL, partner_match);
+	partner_dev = device_find_child(&port->dev,
+					&typec_partner_dev_type,
+					device_match_type);
 	if (!partner_dev)
 		return -ENODEV;
 
@@ -2361,7 +2357,8 @@ int typec_get_cable_svdm_version(struct typec_port *port)
 	enum usb_pd_svdm_ver svdm_version;
 	struct device *cable_dev;
 
-	cable_dev = device_find_child(&port->dev, NULL, cable_match);
+	cable_dev = device_find_child(&port->dev, &typec_cable_dev_type,
+				      device_match_type);
 	if (!cable_dev)
 		return -ENODEV;
 

-- 
2.34.1

