Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EAFD9FBDFF
	for <lists+dri-devel@lfdr.de>; Tue, 24 Dec 2024 14:09:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C806410E486;
	Tue, 24 Dec 2024 13:09:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=icloud.com header.i=@icloud.com header.b="AQQ1El94";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from pv50p00im-tydg10011801.me.com (pv50p00im-tydg10011801.me.com
 [17.58.6.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AF3010E486
 for <dri-devel@lists.freedesktop.org>; Tue, 24 Dec 2024 13:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
 s=1a1hai; t=1735045757;
 bh=9MSW9rqSXzJ69ClHo2IWjPKz+ccuE6aWbD2rifbGZik=;
 h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:
 x-icloud-hme;
 b=AQQ1El94wxk8X1sHIsWU12DqAkCYlH6+ybS2D7Gwfu8FDOuSPOP2RZ13Pu+oimEIP
 I+r6mL+Y7Xl8ap8vExSj/Mh8yUHFon5ilSleyaktED+7n8oedNeS8HcjKoJAktdSMP
 v/Jgr4JTfPExZ+56g+05TRECcHt1Hy2MzLxJB38V10WZqKdyj0nyEUCPGR7Zid218Z
 DF5jZVP5ga1amuMQg++Bb1EF8YBHKge3V7lwlU1R1whG624TyJoqIx8h4Vcsckuc6Q
 BC6F/kqaBndfQZm6EKBvb31OpUuc/XI2dxVQSZddHuf46lounHa2Od3NIfMum9Z0T5
 wzcCRN48g19yg==
Received: from [192.168.1.25] (pv50p00im-dlb-asmtp-mailmevip.me.com
 [17.56.9.10])
 by pv50p00im-tydg10011801.me.com (Postfix) with ESMTPSA id AC6ED8000B5;
 Tue, 24 Dec 2024 13:09:01 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Tue, 24 Dec 2024 21:05:09 +0800
Subject: [PATCH v5 10/12] cxl/pmem: Replace match_nvdimm_bridge() with API
 device_match_type()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241224-const_dfc_done-v5-10-6623037414d4@quicinc.com>
References: <20241224-const_dfc_done-v5-0-6623037414d4@quicinc.com>
In-Reply-To: <20241224-const_dfc_done-v5-0-6623037414d4@quicinc.com>
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
 netdev@vger.kernel.org, Zijun Hu <quic_zijuhu@quicinc.com>, 
 Alison Schofield <alison.schofield@intel.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: g84oVEIFZX0BLRR1gCC9sfjxWF3RJcrC
X-Proofpoint-ORIG-GUID: g84oVEIFZX0BLRR1gCC9sfjxWF3RJcrC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-24_05,2024-12-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 clxscore=1015 mlxscore=0
 spamscore=0 mlxlogscore=999 malwarescore=0 suspectscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2412240113
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

Static match_nvdimm_bridge(), as matching function of device_find_child()
matches a device with device type @cxl_nvdimm_bridge_type, and its task
can be simplified by the recently introduced API device_match_type().

Replace match_nvdimm_bridge() usage with device_match_type().

Reviewed-by: Alison Schofield <alison.schofield@intel.com>
Signed-off-by: Zijun Hu <quic_zijuhu@quicinc.com>
---
 drivers/cxl/core/pmem.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/cxl/core/pmem.c b/drivers/cxl/core/pmem.c
index a8473de24ebfd92f12f47e0556e28b81a29cff7c..0f8166e793e14fc0b1c04ffda79e756a743d9e6b 100644
--- a/drivers/cxl/core/pmem.c
+++ b/drivers/cxl/core/pmem.c
@@ -57,11 +57,6 @@ bool is_cxl_nvdimm_bridge(struct device *dev)
 }
 EXPORT_SYMBOL_NS_GPL(is_cxl_nvdimm_bridge, "CXL");
 
-static int match_nvdimm_bridge(struct device *dev, const void *data)
-{
-	return is_cxl_nvdimm_bridge(dev);
-}
-
 /**
  * cxl_find_nvdimm_bridge() - find a bridge device relative to a port
  * @port: any descendant port of an nvdimm-bridge associated
@@ -75,7 +70,9 @@ struct cxl_nvdimm_bridge *cxl_find_nvdimm_bridge(struct cxl_port *port)
 	if (!cxl_root)
 		return NULL;
 
-	dev = device_find_child(&cxl_root->port.dev, NULL, match_nvdimm_bridge);
+	dev = device_find_child(&cxl_root->port.dev,
+				&cxl_nvdimm_bridge_type,
+				device_match_type);
 
 	if (!dev)
 		return NULL;

-- 
2.34.1

