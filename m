Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A457BF46A
	for <lists+dri-devel@lfdr.de>; Tue, 10 Oct 2023 09:36:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C61210E319;
	Tue, 10 Oct 2023 07:36:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABEFE10E082
 for <dri-devel@lists.freedesktop.org>; Mon,  9 Oct 2023 22:16:34 +0000 (UTC)
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 399KvgKm027830; Mon, 9 Oct 2023 21:14:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : content-transfer-encoding : mime-version; s=pp1;
 bh=5+pEpy1esTDnBoJJaotd858xWP0rcc3/1x8ExWl1X/w=;
 b=aAkjifx18vMBFOfqGka7ZkkT/38XyxJambLZsm+jb8GFCKRNUmImRcv9175E3O4Y+BkW
 R4B1W1CvX2isPslj7R5TQCPA0cEcnr4TFj+TgEaVVvtawF2oPbXV5Vt3nouu4Wg7v3SG
 Vp2GN1CR2gvH5nbNJwxja3tSH7UlEebGFb65UJqiL0FkhIzsTQzst9KzK1XrQD4mZ9oh
 HE7vYXsDcC5XNI5SZ+d5Qtkh0mPt3pMTE1KTssHyIYYnTJdXCKpbYFHLNGkooKD2MyT5
 +oyzCDAOcU5LsJAoNSoVPjLWiBCK4xlKzW18p4488ft6DB30hBC7T8QEkQNrCzBkqnJE +w== 
Received: from ppma11.dal12v.mail.ibm.com
 (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3tms0srum4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Oct 2023 21:14:52 +0000
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
 by ppma11.dal12v.mail.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id
 399IrmXU023094; Mon, 9 Oct 2023 21:14:51 GMT
Received: from smtprelay01.wdc07v.mail.ibm.com ([172.16.1.68])
 by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 3tkmc1b963-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Mon, 09 Oct 2023 21:14:51 +0000
Received: from smtpav01.dal12v.mail.ibm.com (smtpav01.dal12v.mail.ibm.com
 [10.241.53.100])
 by smtprelay01.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 399LEndU17564408
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 9 Oct 2023 21:14:50 GMT
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D1B0458058;
 Mon,  9 Oct 2023 21:14:49 +0000 (GMT)
Received: from smtpav01.dal12v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id BF5C958057;
 Mon,  9 Oct 2023 21:14:49 +0000 (GMT)
Received: from gfwa600.aus.stglabs.ibm.com (unknown [9.3.84.101])
 by smtpav01.dal12v.mail.ibm.com (Postfix) with ESMTPS;
 Mon,  9 Oct 2023 21:14:49 +0000 (GMT)
Received: by gfwa600.aus.stglabs.ibm.com (Postfix, from userid 181152)
 id 6707B740051; Mon,  9 Oct 2023 16:14:49 -0500 (CDT)
From: Lakshmi Yadlapati <lakshmiy@us.ibm.com>
To: linux@roeck-us.net, wsa@kernel.org, sumit.semwal@linaro.org,
 christian.koenig@amd.com, jdelvare@suse.com, joel@jms.id.au,
 andrew@aj.id.au, eajames@linux.ibm.com, ninad@linux.ibm.com
Subject: [PATCH v1 0/2] [PATCH] hwmon: (pmbus/max31785) Add minimum delay
 between bus accesses
Date: Mon,  9 Oct 2023 16:14:18 -0500
Message-Id: <20231009211420.3454026-1-lakshmiy@us.ibm.com>
X-Mailer: git-send-email 2.39.2
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: Y8ap5htUORrYlfEhm753yyHqf-pZGJfr
X-Proofpoint-GUID: Y8ap5htUORrYlfEhm753yyHqf-pZGJfr
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-09_19,2023-10-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011
 priorityscore=1501 lowpriorityscore=0 adultscore=0 malwarescore=0
 mlxlogscore=709 mlxscore=0 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2309180000 definitions=main-2310090169
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

Reintroduce per-client throttling of transfers for improved compatibility.

Some devices have experienced issues with small command turn-around times when using in-kernel device drivers. While a previous proposal was rejected due to concerns about error-prone open-coding of delays, recent upstream changes for similar problems in I2C devices (e.g., max15301 and ucd90320) and now max31785 make it sensible to reintroduce Andrew's generic solution. This change aims to improve compatibility for affected devices and may help avoid duplicating implementations of handlers for I2C and PMBus calls in driver code.

Reference to Andrew's previous proposal:
https://lore.kernel.org/all/20200914122811.3295678-1-andrew@aj.id.au/

Lakshmi Yadlapati (2):
  i2c: smbus: Allow throttling of transfers to client devices
  hwmon: (pmbus/max31785) Add minimum delay between bus accesses

 drivers/hwmon/pmbus/max31785.c |   8 ++
 drivers/i2c/i2c-core-base.c    |   8 +-
 drivers/i2c/i2c-core-smbus.c   | 143 ++++++++++++++++++++++++++-------
 drivers/i2c/i2c-core.h         |  23 ++++++
 include/linux/i2c.h            |   2 +
 5 files changed, 153 insertions(+), 31 deletions(-)

-- 
2.39.2

