Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 941447BF469
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 09:36:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D1A010E1BC;
	Tue, 10 Oct 2023 07:36:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 2347 seconds by postgrey-1.36 at gabe;
 Mon, 09 Oct 2023 21:54:11 UTC
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 283AB10E082
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 21:54:11 +0000 (UTC)
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 399L5tKb016139; Mon, 9 Oct 2023 21:14:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pp1;
 bh=EYKuGGems9T+6zGXgi2t9NNdEBVNAcjgmaOdTsCRw4Q=;
 b=QknR9rGKY0F+WzEDax92xSB5iS9q90JKwkLYtTxJPihstKdK0hbTRyYzpx7l6KqsFNnj
 ulzH/J0+GKpUfWN60v5Fwjp9Yaqfcxwry2NnMe0DgHkt4p5wODROKXw/tQKqsKFOcP1h
 2R41U9N7rSixjw/44jjw7yXG8ryw/LpycvVDF+liJCZ2usicDkr4+5qCcGxodG+vqc4q
 G7Vm7VNMbFkCXk+z/L+UCSXrq8y2zNh9Fef+WUR0aHxY1Jf6DohwFrNLmP85XHUci9II
 qWWMvRBfF03hcg0w8+27H7c/VNfs1tw6YscgNfIzqhSrSKh56cUjENm/ZxzVvJOLq1kR TA== 
Received: from ppma21.wdc07v.mail.ibm.com
 (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tms4kr82s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Oct 2023 21:14:55 +0000
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
 by ppma21.wdc07v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 399JtgoH025863; Mon, 9 Oct 2023 21:14:54 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
 by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 3tkjnn3su5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Oct 2023 21:14:54 +0000
Received: from smtpav03.wdc07v.mail.ibm.com (smtpav03.wdc07v.mail.ibm.com
 [10.39.53.230])
 by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 399LErGI28967334
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Oct 2023 21:14:53 GMT
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 7DC775805A;
 Mon,  9 Oct 2023 21:14:53 +0000 (GMT)
Received: from smtpav03.wdc07v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 63F0C58054;
 Mon,  9 Oct 2023 21:14:53 +0000 (GMT)
Received: from gfwa600.aus.stglabs.ibm.com (unknown [9.3.84.101])
 by smtpav03.wdc07v.mail.ibm.com (Postfix) with ESMTPS;
 Mon,  9 Oct 2023 21:14:53 +0000 (GMT)
Received: by gfwa600.aus.stglabs.ibm.com (Postfix, from userid 181152)
 id D377B740052; Mon,  9 Oct 2023 16:14:52 -0500 (CDT)
From: Lakshmi Yadlapati <lakshmiy@us.ibm.com>
To: linux@roeck-us.net, wsa@kernel.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, jdelvare@suse.com, joel@jms.id.au,
 andrew@aj.id.au, eajames@linux.ibm.com, ninad@linux.ibm.com
Subject: [PATCH v1 2/2] hwmon: (pmbus/max31785) Add minimum delay between bus
 accesses
Date: Mon,  9 Oct 2023 16:14:20 -0500
Message-Id: <20231009211420.3454026-3-lakshmiy@us.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009211420.3454026-1-lakshmiy@us.ibm.com>
References: <20231009211420.3454026-1-lakshmiy@us.ibm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: cSuJDHQgLZ_TeooGShUucacu0_peuDDX
X-Proofpoint-ORIG-GUID: cSuJDHQgLZ_TeooGShUucacu0_peuDDX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-09_19,2023-10-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015
 spamscore=0 impostorscore=0 mlxscore=0 bulkscore=0 phishscore=0
 malwarescore=0 mlxlogscore=999 adultscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310090169
X-Mailman-Approved-At: Tue, 10 Oct 2023 07:36:30 +0000
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
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-i2c@vger.kernel.org,
 Lakshmi Yadlapati <lakshmiy@us.ibm.com>, linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The MAX31785 has shown erratic behaviour across multiple system
designs, unexpectedly clock stretching and NAKing transactions.
Inserting a small delay (250us) after register writes makes the
issue go away.

Signed-off-by: Lakshmi Yadlapati <lakshmiy@us.ibm.com>
---
 drivers/hwmon/pmbus/max31785.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
index f9aa576495a5..532e1c8f632c 100644
--- a/drivers/hwmon/pmbus/max31785.c
+++ b/drivers/hwmon/pmbus/max31785.c
@@ -5,6 +5,7 @@
 
 #include <linux/kernel.h>
 #include <linux/module.h>
+#include <linux/moduleparam.h>
 #include <linux/init.h>
 #include <linux/err.h>
 #include <linux/i2c.h>
@@ -24,6 +25,9 @@ enum max31785_regs {
 #define MAX31785_NR_PAGES		23
 #define MAX31785_NR_FAN_PAGES		6
 
+static unsigned long throttle_delay_us = 250;
+module_param(throttle_delay_us, ulong, 0664);
+
 static int max31785_read_byte_data(struct i2c_client *client, int page,
 				   int reg)
 {
@@ -337,6 +341,10 @@ static int max31785_probe(struct i2c_client *client)
 				     I2C_FUNC_SMBUS_WORD_DATA))
 		return -ENODEV;
 
+	ret = i2c_smbus_throttle_client(client, throttle_delay_us);
+	if (ret)
+		return ret;
+
 	info = devm_kzalloc(dev, sizeof(struct pmbus_driver_info), GFP_KERNEL);
 	if (!info)
 		return -ENOMEM;
-- 
2.39.2

