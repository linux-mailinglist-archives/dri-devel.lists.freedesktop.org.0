Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4E9D43D2D9
	for <lists+dri-devel@lfdr.de>; Wed, 27 Oct 2021 22:32:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C767F89F6E;
	Wed, 27 Oct 2021 20:32:39 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E079D89F6E
 for <dri-devel@lists.freedesktop.org>; Wed, 27 Oct 2021 20:32:38 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19RJKGTE016751; 
 Wed, 27 Oct 2021 20:32:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2021-07-09; bh=Z+O5+osc2zyTb/8YNEqRCGL20FqbcQFJ7zPbsTeYRdQ=;
 b=pUuhJXtWpdt0s9mxNgK2yJWmSkf2WvuObrWUUsrhFC1BcUb3sjdH6YQ6wbDnlh6WzD0G
 45XOogQ2WCnN7+xe6U8+74LmVYNAlBWtqGJLgWxmeBVKiACdcYv2ead+VJuGGxDeS/Dy
 jbT1xwiPoBP6VmphwtxeAP/o8VIv4Zl3dZnj8HF1T7wUTiL7ix+haOSWQGf4DjapS+7c
 CFT8XibRRgGEIhcjFA1jY0d5ifDZ5/yaCSvACoLUuBIDh95ogkzj+V0V+N0dSXTkUrJr
 EG8bJJlb1sRallmXCZqOdoH0le7C5ie2DsFPt+v6Pc7h26qufZN+UddE3+eGwdc9gvpc tw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bx4fyn3n9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Oct 2021 20:32:34 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19RKVZB3048772;
 Wed, 27 Oct 2021 20:32:33 GMT
Received: from nam04-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam08lp2168.outbound.protection.outlook.com [104.47.73.168])
 by aserp3020.oracle.com with ESMTP id 3bx4gda0ac-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 27 Oct 2021 20:32:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Se92mNxsyn5ae7LfU1/UW+9Sa8F0bJuKK63YfF1N8cUNNucujjlFE9pwvH2MwW9p5Xj5IUEzpOTc3PeEZE+J37DLYq/m/vmqHiZEU7X+VHYI3ddJ+9ODidQ7Ch3YJChrgB+OkXipcTgGpxqVHLUt/b417Z9R+TgbpowIw0ItlMcScMkBlcLNUlSU+OZWe33eHjZ9SBUYRwTSxM7Ml0gPwo5D6DDyIDreD2oJMPSjXdl5km0t8uZ54EBY6AWyhweFgLHBj87R/jsH2Bfd8TK2R6AcI7fV9ZJkJk78SxWhEP9kxdZQM+VixkyfE3eiszch6j3urc1M9ec56rGF6vCIWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z+O5+osc2zyTb/8YNEqRCGL20FqbcQFJ7zPbsTeYRdQ=;
 b=XLb9X0y47mZhoai0XHDIKWdJYo8bFZqVChVZm7bhN53NaXqyhPy23xdxgQiBhgejhq9JZ1cu+V6huroQuUCaINEXyDsBIjjLZAQjIP3YTruDIo+QWZ/Q0Oq+KvocukqHEOLTZb26daHwDJaC9vx4U+1cdaRv/oZOF7JEFP0cY9vL5NnV+DeKTK4mtDS8yipbxVyuvk2nnKDE1QqI8nWJIoEl9lAgIgGoSpglJ7R2bYsQWc9gTG94NStp6o4Nd6i6i0xgTYzH80BeJOdsXtfCngqnr10w94nrBbdTsDhfGrSqIJ9MVPIVXspzCLsyklbn578TPwoviUEdRO7bX434Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z+O5+osc2zyTb/8YNEqRCGL20FqbcQFJ7zPbsTeYRdQ=;
 b=d/bo27d1PRwsKu062cI53whqUPQNg8j+n0c9IQblEZALOAUD+s/uX+nGzkEZcuFhRIZOy8ki1W3BvSzwzpUPmEvB/uk0GToxy12MQ7XiyeGb0k4cPqdbDyNIPGSsMpLBznc4CHQ89EBHBczTMpWXMMOgGizbp1EANFwm9Zz1wLM=
Authentication-Results: linuxfoundation.org; dkim=none (message not signed)
 header.d=none;linuxfoundation.org; dmarc=none action=none
 header.from=oracle.com;
Received: from BN0PR10MB5192.namprd10.prod.outlook.com (2603:10b6:408:115::8)
 by BN0PR10MB5224.namprd10.prod.outlook.com (2603:10b6:408:117::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4649.13; Wed, 27 Oct
 2021 20:32:30 +0000
Received: from BN0PR10MB5192.namprd10.prod.outlook.com
 ([fe80::8823:3dbf:b88f:2c0e]) by BN0PR10MB5192.namprd10.prod.outlook.com
 ([fe80::8823:3dbf:b88f:2c0e%5]) with mapi id 15.20.4649.014; Wed, 27 Oct 2021
 20:32:30 +0000
From: George Kennedy <george.kennedy@oracle.com>
To: gregkh@linuxfoundation.org, geert@linux-m68k.org, tzimmermann@suse.de,
 sam@ravnborg.org
Cc: george.kennedy@oracle.com, dri-devel@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2] video: fbdev: cirrusfb: check pixclock to avoid divide by
 zero
Date: Wed, 27 Oct 2021 15:30:13 -0500
Message-Id: <1635366613-22507-1-git-send-email-george.kennedy@oracle.com>
X-Mailer: git-send-email 1.8.3.1
Content-Type: text/plain
X-ClientProxiedBy: BL0PR1501CA0036.namprd15.prod.outlook.com
 (2603:10b6:207:17::49) To BN0PR10MB5192.namprd10.prod.outlook.com
 (2603:10b6:408:115::8)
MIME-Version: 1.0
Received: from dhcp-10-152-13-169.usdhcp.oraclecorp.com.com (209.17.40.36) by
 BL0PR1501CA0036.namprd15.prod.outlook.com (2603:10b6:207:17::49) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4628.18 via Frontend
 Transport; Wed, 27 Oct 2021 20:32:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da15e9f1-70f7-49e8-2833-08d99988e5c8
X-MS-TrafficTypeDiagnostic: BN0PR10MB5224:
X-Microsoft-Antispam-PRVS: <BN0PR10MB5224C40DC31DC0EFF6CED6D6E6859@BN0PR10MB5224.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 4aJDjvzT1XEgzEz5x98yL58jq0WvMHx+t4VrYfQ1UQT92MnAxjc3Co8bQXY3F7EdKaYgETLmOTaiQ9XTQ4GrmDNyBv3XHkX63VkaCYRhmJnvXGiUY5mFUmr9cGfQgXn/iELsFICOkiMntqfNW5LWslR0ps2eSME7dLm9S6ZQ/BIOPKD7lO/lx96aSBKEJwWOmcyXSzP161dVv8ujFt8mU7wJddYy1jwXlJRdBbkOfDdnf4yjN75YNCTYA3BnKYnzQ8smVTrZGat5lYSkBIDpj5+LAcqlH5Kii+HFeuNY58ZYNtasAlDWypcTj2FVOQZ5KGNyc9d1XqG6iANSH9/3YWm+E8cOn+Dp9g8bQ+P6ERvg5/3htqQRkaVJwle7zS14m/wRHJWP+m9jHTLVYm2LM7DmnTXl6UBZwHCGF447iLB1EHay9JahQarGITU5gqjPuMfJFVV9od3KypenozK6virfPrW+iEseogNN+dnNIyDHaIxaN/esjdpaslh4oYpOUbj4iSOvo4xQ31MnHRpbZouxfTpHtlP0Tn+TbtcuwkbRh4GKINIueOdrL0OiRllSldr/mo+HL2nTf25LLgYUFAO6GhaEhLlxyRfcqxITwS/GiiFFAjTV6/naGlQT5G+IfVWlBnX6Z9DWqPnJl5jNXEQe/FKdT1Gje6PT74sLYvq2Y1eaxQWXdmbWBlw1hjU42yIAWZrOOJS8FviKgdh4qw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR10MB5192.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(83380400001)(8676002)(66946007)(66556008)(2616005)(66476007)(6506007)(52116002)(86362001)(6486002)(956004)(44832011)(26005)(8936002)(4326008)(6512007)(38100700002)(5660300002)(508600001)(36756003)(38350700002)(186003)(6666004)(316002)(2906002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3J5q7KUZxdBQ59AZ9mXs0TXIpjIJlszH/zl6Y2c/KFY8d+/e3Xh1Axuq3hh0?=
 =?us-ascii?Q?UcDOes7uHYUv8b3C903BI7kRpdsG12xYIFhunv1wDi3J1vpMFHJWp1AC43U5?=
 =?us-ascii?Q?w2+JKIAJ+DRyMpFESsEnlvXjdqZStXmsfhclzGxOvuB4tdnOpzviamqOPPDt?=
 =?us-ascii?Q?pV0T0zo/9V6R75FU9Bk7naAsMYRqw9Bm7EhjwHS2bIm/BskwtD4nzBTqTBCt?=
 =?us-ascii?Q?xM6CJ6bMi+RUasPY2tyHrYeMg528tZs9DpdExoqodnmxy6EPZz2aQ3z0S8YH?=
 =?us-ascii?Q?mXKs31iGdC+m06OjYpAHtdhvoUTKy9/pHf7DqieYwfxWI0+qApEz+W3vkeMZ?=
 =?us-ascii?Q?WVlMgKDj6u5w7FOHsSNUdAjCmxR46JJdL3IZtnUG4JaW/5WTcUXtJ3wBBysA?=
 =?us-ascii?Q?yiN06nbFtsRftkJrCUuSAzu1xS63v9zC3zElNFZ7aifUbg1NwfTXHLInalef?=
 =?us-ascii?Q?JTMmDy5EkXN5joOyYmffbQvHtruQioc8ve01wVsd/bgClmnpd6i+gJcTvOKC?=
 =?us-ascii?Q?eQ1a/W+/h3ic1gbqCslk8fARo0NIWLWeXb6tSP3sERqy493r+3B/qHtpfZG6?=
 =?us-ascii?Q?iFLiUGrtl+5b49IFM4yZpU0UrIu8LtBm3xtNnvPnD2pFEKZO+8y8E6zIF/qQ?=
 =?us-ascii?Q?xBTGOc69jYhDHDmFxVABjs/Cl7IYAGMaS0nVETJ8zQsXVnuVvs4WTxVDJOVD?=
 =?us-ascii?Q?vDTMkyM9pN/rN/uEdGLsrOy1q5IPow7mSFKvrc+K1ax0Ir7cKbsO69zu6WTc?=
 =?us-ascii?Q?vNFdEBWwQLisbtKoTDIYy3so6RiclAx5laPPi0WyPecny1BtCUlMH5/6ThqN?=
 =?us-ascii?Q?qWtkVcAjTVCJ1fpTx60DvuxbXIS9LQawMvo80JfC+rTz239FRB90sZW5yZ3g?=
 =?us-ascii?Q?uQxRV6nCubQ+c8dQBnpDPJ3pVPHjFJM4j97evw0Y8IRgyr8/2L78HZXdYOlX?=
 =?us-ascii?Q?LR8UL5ChldMKvKZrplIlvOTOuV2bArURq/UB62U1uBYw4q9Tmq8PApnMfcP7?=
 =?us-ascii?Q?VRTtQ0sEiUIAR+R7lfMLBxFtMUcf6ZwGVN3Qo14PEC2nVbU4mJqxA1m4XPDF?=
 =?us-ascii?Q?nMmFITmfodTFLzUMMcRKkEMgfXVQPtfUdnD99WwmENpfbHrErAdwONkKEZPX?=
 =?us-ascii?Q?zYxA2+3LW3rvdse29l5WyGvbWdzcC6ZUArtnXC6u5P+oOd/glaZv08242VWI?=
 =?us-ascii?Q?6G4ZOx2ERtG/ObFDmeapLP3hJmLza3BcldDHG0Yf47tZ3Wtv6+soFCy/l5BA?=
 =?us-ascii?Q?SwoEZShx2s1bBzWax2aGMvfGrZ16xbOXz+AuMRBW7Z2YFBku6XcGJLogk1e7?=
 =?us-ascii?Q?aHirNkEKaQZlOLArnFlymBk7+cQvLPqiJUH3JMaL0Noag/7UGW5ktIAP+d8I?=
 =?us-ascii?Q?AIcvPlC03ea4f6KdQHKFIQLZeNHLsCy0x89EQLcJAFGlKlviUsA9Qtqm5q6E?=
 =?us-ascii?Q?bZHqEvIDppF9dnidNDT7L0orCw8GFp4d4ENWi4X+Dz22K1Mhovc3CHtHRLfj?=
 =?us-ascii?Q?TeNDiiRTAF3+tAdZQ9l/UIDwsQHudsizSc93E3mRZp7kBlQjLNMWHXvhlGeS?=
 =?us-ascii?Q?BKcb35J7/kkK0h6DN+2x3yeiFMwVhs1cIpyCpVtLYT+dkI2RjBBYi9TnWXt9?=
 =?us-ascii?Q?/3eyTlnO1J0jqXovvbghH7MKKicXAdeQ4H+MRlwyenGYKAhkRzzBBV+2Tcc5?=
 =?us-ascii?Q?DkE2YQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da15e9f1-70f7-49e8-2833-08d99988e5c8
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5192.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2021 20:32:30.1129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EfL9sQ8A9ZfxW3K82/dp02UF52xGGDsYHhnkNX1Ta95qOZHdFZpuGzOpOzMx5jCKzXJq6pafQAa9xcJVyw/LHJy5i6Qa97XAX8fy33Mn+rE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5224
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10150
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxlogscore=999
 bulkscore=0 phishscore=0 mlxscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2110270116
X-Proofpoint-GUID: W7a4J5TdW8sQ27y07GdrOnKrJYG2LEmf
X-Proofpoint-ORIG-GUID: W7a4J5TdW8sQ27y07GdrOnKrJYG2LEmf
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

Do a sanity check on pixclock value to avoid divide by zero.

If the pixclock value is zero, the cirrusfb driver will round up
pixclock to get the derived frequency as close to maxclock as
possible.

Syzkaller reported a divide error in cirrusfb_check_pixclock.

divide error: 0000 [#1] SMP KASAN PTI
CPU: 0 PID: 14938 Comm: cirrusfb_test Not tainted 5.15.0-rc6 #1
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.11.0-2
RIP: 0010:cirrusfb_check_var+0x6f1/0x1260

Call Trace:
 fb_set_var+0x398/0xf90
 do_fb_ioctl+0x4b8/0x6f0
 fb_ioctl+0xeb/0x130
 __x64_sys_ioctl+0x19d/0x220
 do_syscall_64+0x3a/0x80
 entry_SYSCALL_64_after_hwframe+0x44/0xae

Signed-off-by: George Kennedy <george.kennedy@oracle.com>
---
 drivers/video/fbdev/cirrusfb.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/video/fbdev/cirrusfb.c b/drivers/video/fbdev/cirrusfb.c
index 93802ab..3d47c34 100644
--- a/drivers/video/fbdev/cirrusfb.c
+++ b/drivers/video/fbdev/cirrusfb.c
@@ -469,7 +469,7 @@ static int cirrusfb_check_mclk(struct fb_info *info, long freq)
 	return 0;
 }
 
-static int cirrusfb_check_pixclock(const struct fb_var_screeninfo *var,
+static int cirrusfb_check_pixclock(struct fb_var_screeninfo *var,
 				   struct fb_info *info)
 {
 	long freq;
@@ -478,9 +478,7 @@ static int cirrusfb_check_pixclock(const struct fb_var_screeninfo *var,
 	unsigned maxclockidx = var->bits_per_pixel >> 3;
 
 	/* convert from ps to kHz */
-	freq = PICOS2KHZ(var->pixclock);
-
-	dev_dbg(info->device, "desired pixclock: %ld kHz\n", freq);
+	freq = PICOS2KHZ(var->pixclock ? : 1);
 
 	maxclock = cirrusfb_board_info[cinfo->btype].maxclock[maxclockidx];
 	cinfo->multiplexing = 0;
@@ -488,11 +486,13 @@ static int cirrusfb_check_pixclock(const struct fb_var_screeninfo *var,
 	/* If the frequency is greater than we can support, we might be able
 	 * to use multiplexing for the video mode */
 	if (freq > maxclock) {
-		dev_err(info->device,
-			"Frequency greater than maxclock (%ld kHz)\n",
-			maxclock);
-		return -EINVAL;
+		var->pixclock = KHZ2PICOS(maxclock);
+
+		while ((freq = PICOS2KHZ(var->pixclock)) > maxclock)
+			var->pixclock++;
 	}
+	dev_dbg(info->device, "desired pixclock: %ld kHz\n", freq);
+
 	/*
 	 * Additional constraint: 8bpp uses DAC clock doubling to allow maximum
 	 * pixel clock
-- 
1.8.3.1

