Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC199994705
	for <lists+dri-devel@lfdr.de>; Tue,  8 Oct 2024 13:33:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 249F910E4C3;
	Tue,  8 Oct 2024 11:33:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=ibm.com header.i=@ibm.com header.b="SU6KJ5U6";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D08FF10E4C5;
 Tue,  8 Oct 2024 11:33:07 +0000 (UTC)
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4989Jcpo019499;
 Tue, 8 Oct 2024 11:32:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from
 :date:subject:mime-version:content-type
 :content-transfer-encoding:message-id:references:in-reply-to:to
 :cc; s=pp1; bh=j9fG3aOC1t6/PBAkxf8zdYRFvf/4TjZl1WCaqe8Exhc=; b=S
 U6KJ5U6NZslx0GL8npZcjHlyGTynwr2/gGmnaj/WvcqR0seqhoEsZffl+DshE6AG
 S3tFf9d5yTztCK70yaXuLjlIoP0Jz3OpMJNcFesbviu2H5Zy5JkfImhmowx6y3Kp
 2ob1dN7RPpfYtUnnp5BbaXBXAk9QP5AYA46rpnPvfsYxKHhoen+PB8qDq3vCc66g
 Nb0i0P1c7MrJJ6Ys+a9tEAyyi01NJeCK6qOziCqulo1mxdYvNhGqM6NEh5ShTAn+
 vy5H+aUX5cwLtTBB1MU5gLL20pzoSWT4/VMGkyBBT20a4EBfCSV0P4/StIxUefaE
 duneg3cm/yEPBlNxwM/Hg==
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42520hgnqs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Oct 2024 11:32:57 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
 by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 498BS4bk006211;
 Tue, 8 Oct 2024 11:32:56 GMT
Received: from ppma11.dal12v.mail.ibm.com
 (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 42520hgnqn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Oct 2024 11:32:56 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
 by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 498AbF0h022830;
 Tue, 8 Oct 2024 11:32:55 GMT
Received: from smtprelay02.wdc07v.mail.ibm.com ([172.16.1.69])
 by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 423jg0ukug-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 08 Oct 2024 11:32:55 +0000
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com
 [10.39.53.232])
 by smtprelay02.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 498BWsI023069392
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 8 Oct 2024 11:32:54 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 0D3D358043;
 Tue,  8 Oct 2024 11:32:54 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id CA1525805D;
 Tue,  8 Oct 2024 11:32:48 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
 Tue,  8 Oct 2024 11:32:48 +0000 (GMT)
From: Niklas Schnelle <schnelle@linux.ibm.com>
Date: Tue, 08 Oct 2024 13:32:02 +0200
Subject: [PATCH v7 2/5] Bluetooth: add HAS_IOPORT dependencies
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241008-b4-has_ioport-v7-2-8624c09a4d77@linux.ibm.com>
References: <20241008-b4-has_ioport-v7-0-8624c09a4d77@linux.ibm.com>
In-Reply-To: <20241008-b4-has_ioport-v7-0-8624c09a4d77@linux.ibm.com>
To: Brian Cain <bcain@quicinc.com>, Marcel Holtmann <marcel@holtmann.org>,
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>,
 Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 "Maciej W. Rozycki" <macro@orcam.me.uk>, Heiko Carstens <hca@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, linux-hexagon@vger.kernel.org,
 linux-bluetooth@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev, spice-devel@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-serial@vger.kernel.org,
 linux-arch@vger.kernel.org, Niklas Schnelle <schnelle@linux.ibm.com>,
 Arnd Bergmann <arnd@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1456;
 i=schnelle@linux.ibm.com; h=from:subject:message-id;
 bh=wqO06g/GtvVUtLH7zraEwzq/4iiAtR8pVWTuUB3m7/k=;
 b=owGbwMvMwCX2Wz534YHOJ2GMp9WSGNJZJRxmK71Qz/x4Y/eBfc/XNh2TdxdJ4N419TzL/7kZX
 oFMP7qFOkpZGMS4GGTFFFkWdTn7rSuYYronqL8DZg4rE8gQBi5OAZhIdw4jw0Lm6scnNf4sSBW7
 9X6/06e732bKb3qqeuf1h/87PBQXzYhkZNjBmbXk1nSW/obaf/Ha8xkCM/cxz7q18EKv6bKpTbN
 /TmMBAA==
X-Developer-Key: i=schnelle@linux.ibm.com; a=openpgp;
 fpr=9DB000B2D2752030A5F72DDCAFE43F15E8C26090
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: M8SiSgyPlmdANjSWAtzFJKLuN8mFC7Mp
X-Proofpoint-ORIG-GUID: Rait3Qzc_-u2Dxs3jDtLyiY_okjdN7Pk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.62.30
 definitions=2024-10-08_10,2024-10-08_01,2024-09-30_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501
 impostorscore=0 adultscore=0 mlxscore=0 lowpriorityscore=0 bulkscore=0
 mlxlogscore=909 malwarescore=0 clxscore=1015 spamscore=0 suspectscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410080072
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

In a future patch HAS_IOPORT=n will disable inb()/outb() and friends at
compile time. We thus need to add HAS_IOPORT as dependency for those
drivers using them.

Co-developed-by: Arnd Bergmann <arnd@kernel.org>
Signed-off-by: Arnd Bergmann <arnd@kernel.org>
Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
---
 drivers/bluetooth/Kconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/bluetooth/Kconfig b/drivers/bluetooth/Kconfig
index 18767b54df352e929692850dc789d9377839e094..4ab32abf0f48644715d4c27ec0d2fdaccef62b76 100644
--- a/drivers/bluetooth/Kconfig
+++ b/drivers/bluetooth/Kconfig
@@ -336,7 +336,7 @@ config BT_HCIBFUSB
 
 config BT_HCIDTL1
 	tristate "HCI DTL1 (PC Card) driver"
-	depends on PCMCIA
+	depends on PCMCIA && HAS_IOPORT
 	help
 	  Bluetooth HCI DTL1 (PC Card) driver.
 	  This driver provides support for Bluetooth PCMCIA devices with
@@ -349,7 +349,7 @@ config BT_HCIDTL1
 
 config BT_HCIBT3C
 	tristate "HCI BT3C (PC Card) driver"
-	depends on PCMCIA
+	depends on PCMCIA && HAS_IOPORT
 	select FW_LOADER
 	help
 	  Bluetooth HCI BT3C (PC Card) driver.
@@ -363,7 +363,7 @@ config BT_HCIBT3C
 
 config BT_HCIBLUECARD
 	tristate "HCI BlueCard (PC Card) driver"
-	depends on PCMCIA
+	depends on PCMCIA && HAS_IOPORT
 	help
 	  Bluetooth HCI BlueCard (PC Card) driver.
 	  This driver provides support for Bluetooth PCMCIA devices with

-- 
2.43.0

