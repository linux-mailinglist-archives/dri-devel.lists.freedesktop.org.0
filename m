Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62749704C50
	for <lists+dri-devel@lfdr.de>; Tue, 16 May 2023 13:26:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 355D210E33B;
	Tue, 16 May 2023 11:26:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1535 seconds by postgrey-1.36 at gabe;
 Tue, 16 May 2023 11:26:39 UTC
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 653A210E33B
 for <dri-devel@lists.freedesktop.org>; Tue, 16 May 2023 11:26:39 +0000 (UTC)
Received: from pps.filterd (m0353723.ppops.net [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 34GAqubG008652; Tue, 16 May 2023 11:01:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=from : to : cc : subject
 : date : message-id : in-reply-to : references : content-type :
 content-transfer-encoding : mime-version; s=pp1;
 bh=OHDQiiEJroO0i+y82hrgSvcy7FLDy/xxm28oD5scI9A=;
 b=d4oOyb+urNbv4NnIHFxSpFXGPAWlQUKoJZ5q6AUueUY22R8dAnOQs4o6cd+Eq1QqXrHN
 zVoEgukcuadeRETmubrUq7tkV5Ib8x+dpiPLNEO4xMChtmc8Mxco4KmQm3WcY8KEyJs0
 r1bJcBOTyTjs/Bj1/pcjKYjotm/irIcNMWxuGrEF4Er6cMLpj+fAfgCZhgH4PJdL8vHz
 qgSwJya1XgYkGIbIf0agj2pjsqvTrz6tKmVj4GJ1Jd4gO1LaAUnYZhnLQAv8TH8tAfWd
 MaUbVI2PgfcSv0/NaEGkDhvudZloE0KQCmM3q2fx1OGtiJkVautgtjaP0j8onMskBanJ EQ== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qm8fbg73w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 May 2023 11:01:20 +0000
Received: from m0353723.ppops.net (m0353723.ppops.net [127.0.0.1])
 by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 34GAwNMt029904;
 Tue, 16 May 2023 11:01:19 GMT
Received: from ppma03ams.nl.ibm.com (62.31.33a9.ip4.static.sl-reverse.com
 [169.51.49.98])
 by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 3qm8fbg72a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 May 2023 11:01:19 +0000
Received: from pps.filterd (ppma03ams.nl.ibm.com [127.0.0.1])
 by ppma03ams.nl.ibm.com (8.17.1.19/8.17.1.19) with ESMTP id 34G4ZOP8014025;
 Tue, 16 May 2023 11:01:16 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
 by ppma03ams.nl.ibm.com (PPS) with ESMTPS id 3qj264sjvp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Tue, 16 May 2023 11:01:16 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com
 [10.20.54.103])
 by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 34GB1D2l22413898
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 16 May 2023 11:01:13 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 1EF1A20063;
 Tue, 16 May 2023 11:01:13 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id B8BF72004B;
 Tue, 16 May 2023 11:01:12 +0000 (GMT)
Received: from tuxmaker.boeblingen.de.ibm.com (unknown [9.152.85.9])
 by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
 Tue, 16 May 2023 11:01:12 +0000 (GMT)
From: Niklas Schnelle <schnelle@linux.ibm.com>
To: Arnd Bergmann <arnd@arndb.de>, Helge Deller <deller@gmx.de>
Subject: [PATCH v4 37/41] fbdev: atyfb: Remove unused clock determination
Date: Tue, 16 May 2023 13:00:33 +0200
Message-Id: <20230516110038.2413224-38-schnelle@linux.ibm.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230516110038.2413224-1-schnelle@linux.ibm.com>
References: <20230516110038.2413224-1-schnelle@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: 1yaS_CGaroKGuNMhMhwrIJKLlrHZkWea
X-Proofpoint-GUID: 3Sv0jLznQWCfM5wFfxteAoWtQqAbwtHk
Content-Transfer-Encoding: 8bit
X-Proofpoint-UnRewURL: 0 URL was un-rewritten
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-05-16_04,2023-05-16_01,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0
 mlxscore=0 clxscore=1015 adultscore=0 malwarescore=0 lowpriorityscore=0
 mlxlogscore=999 impostorscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305160089
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org,
 Albert Ou <aou@eecs.berkeley.edu>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Alan Stern <stern@rowland.harvard.edu>,
 =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
 Bjorn Helgaas <bhelgaas@google.com>, Geert Uytterhoeven <geert@linux-m68k.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Just below the removed lines par->clk_wr_offset is hard coded to 3 so
there is no use in determining a different clock just to then ignore it
anyway. This also removes the only I/O port use remaining in the driver
allowing it to be built without CONFIG_HAS_IOPORT.

Link: https://lore.kernel.org/all/ZBx5aLo5h546BzBt@intel.com/
Suggested-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
Signed-off-by: Niklas Schnelle <schnelle@linux.ibm.com>
---
Note: The HAS_IOPORT Kconfig option was added in v6.4-rc1 so
      per-subsystem patches may be applied independently

 drivers/video/fbdev/aty/atyfb_base.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/video/fbdev/aty/atyfb_base.c b/drivers/video/fbdev/aty/atyfb_base.c
index b02e4e645035..cba2b113b28b 100644
--- a/drivers/video/fbdev/aty/atyfb_base.c
+++ b/drivers/video/fbdev/aty/atyfb_base.c
@@ -3498,11 +3498,6 @@ static int atyfb_setup_generic(struct pci_dev *pdev, struct fb_info *info,
 	if (ret)
 		goto atyfb_setup_generic_fail;
 #endif
-	if (!(aty_ld_le32(CRTC_GEN_CNTL, par) & CRTC_EXT_DISP_EN))
-		par->clk_wr_offset = (inb(R_GENMO) & 0x0CU) >> 2;
-	else
-		par->clk_wr_offset = aty_ld_8(CLOCK_CNTL, par) & 0x03U;
-
 	/* according to ATI, we should use clock 3 for acelerated mode */
 	par->clk_wr_offset = 3;
 
-- 
2.39.2

