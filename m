Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5387146745F
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 10:57:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18AC2737EB;
	Fri,  3 Dec 2021 09:57:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F7AA737EB
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 09:57:32 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B39kZHV004617; 
 Fri, 3 Dec 2021 09:57:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=1PFTT2mtsLp+sUOoSziTV+ai2g2d90rgwwxuKnqVink=;
 b=Yh9/x0zoXN02DPExdocTl6Kmc1yBscbfmXzYUYuOaP8MT13/uvHl2NBJUhMrH4OrLrY1
 VMmCYUcnVbMeqmrNIPTDfg7942D6iIyGN2tSS+brHzeXKoy8wYbbwUXC5WOK+w1BS0m0
 rmufkCDpoTbDXy/ro1E9Hj6NUPgVCfaqivbxdi8vaXl1PLVBKfev4Gvq+pn78er9IGit
 jHSpB4SyY3im3UBRXjUAaVZ58ejWken+anEiJNEqXzBsTMzW8ov5/EgZ8Fi0NzMwRIeo
 e4jLBp82IeSQcrPMnJSnrYL+VFIRAGR6R0OMQvB6nFgb8Q8ARkpyKDlFAhxVB06kW7I9 4w== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cqgwdr1w4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 03 Dec 2021 09:57:30 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B39tm3V182203;
 Fri, 3 Dec 2021 09:57:29 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2173.outbound.protection.outlook.com [104.47.55.173])
 by aserp3030.oracle.com with ESMTP id 3ckaqm1vyu-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 03 Dec 2021 09:57:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=GLDlZT5CCXQ+kf4183fleZkYrMiCq6plw4DH1XBIzE1o1397+6XQubHfQBQBOipFKKlnPrR9ZvWJp+mx1h+95SEPUEWshiwiqkTa3pHZVr2BEKPjv/AlUPu4aXfd6+xpWROtLfJTbY1q5KnWtq1CPi4JfB+QaQSp7GgmJjirln3X0+adXif0dhfuVmqLzdFjpWW74CGKq6EYwDLQXXVInA6zW9K9wN9flNTSi7mjncrElmkJb3sE9+e5t1RKfL6TpxqeQj1bW8IvIaNeo4r+4fyFawVF6mdTAfPh7Qt/TIIjcl1DDpL7WtuZYH5VRN63qcCCRBDpwPnjKKPmmjAItw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1PFTT2mtsLp+sUOoSziTV+ai2g2d90rgwwxuKnqVink=;
 b=QTR2gOD0HtMqxNsXzre6cKih6D2iAHxYIXn6rZ4yagVCG1uGDZHoCRLP7eDC6LfayWUyjRffo1mHHZBu63h8QGnqVQ0TXhwenJ2lyOGgTkfyPp1sxmDEh94kZdeEwFhKO5nNG0+IX6gdGmKEO0Oht9FU0PtjRz8FxBmWDbTuuqQKfZM1b64B9F/oCc+nq3nbIb5t1soR/Q+qh9WMHXGY7wBrjCoo/2psQveZea2bexTwXmp4n8LD51fOcF4dUp4k3wPZhkQnipxoTITduP+lokXh2YlAS5SW9Txt+ZUHqESzdWV/Ess8BmxkEzTMCxBM7tkJ2RF5Wjvg9ZvqoqnhTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1PFTT2mtsLp+sUOoSziTV+ai2g2d90rgwwxuKnqVink=;
 b=MvpZ3Zav0E131U/sUXWSSRuVPLRDlxbJ2CZXXwaqOPX/UeXxAU2hXEsBpke/pODZOZ9faTY+7uqOXUFjF4xPxsdmIIEoUlkvqz3IcrM9fX2a+ss+2Ph4bKFAmrAYI0YE3nHcKFRbf3g7PyjeHRmIPyGN4o1f7LPECcS3XdDDafA=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MW4PR10MB5677.namprd10.prod.outlook.com
 (2603:10b6:303:18b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Fri, 3 Dec
 2021 09:57:27 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0%6]) with mapi id 15.20.4734.027; Fri, 3 Dec 2021
 09:57:27 +0000
Date: Fri, 3 Dec 2021 12:57:15 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Antonino Daplas <adaplas@gmail.com>
Subject: [PATCH] fbdev: savagefb: make a variable local
Message-ID: <20211203095715.GD2480@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: AS8P250CA0024.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::29) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (102.222.70.114) by AS8P250CA0024.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:20b:330::29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.16 via Frontend
 Transport; Fri, 3 Dec 2021 09:57:24 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: cec8807a-9ec8-49ef-67c6-08d9b643503e
X-MS-TrafficTypeDiagnostic: MW4PR10MB5677:
X-Microsoft-Antispam-PRVS: <MW4PR10MB567709A2DDDE45E249BB61268E6A9@MW4PR10MB5677.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EE4uEBXVgRLojy/hS4S8eVtbT8J0bqTf1WSQS+EM8WLSTCy7nQj15pkb/ACB2PSnEZtq611+8S47aZUbFmTYW6GQdmvYVA4oPojd3SVW9mGiWBTCtBBolK4jZ6m/D/f03LVjlHVHU5x5dob+3N94Tpny5ssURpl0Fl9vI+84wH3IudDjt69oT06LTBXwQv2ZYLtuNlbeBHITDNPgbcJK9ePYa3iU+Vt4bAjSqZnsZxt9UDkpm5PwZZziLTKiZAOmdNUcCHVESto6nbrAHOlrr0jPK6ajubKBCVDJrpoRDEkkfhU1LsYj5AmzH6vACABHns/hz1rw5fyPAtcAPvJhwg6Eo2gW2vfQaEaPs37JRVjxEDmSi6psUm7A5jceTgUGRVvsnoA6lFePMdyqYlfEsag8gAv/M8nZPDETCSDHlNfyUMHnHs/kdL0Y+vgXKY+uhtkju9ZpCee99ijwkjG1tr77wpntIA26UhJiTUPwZ3GJtNGNir50YnMv12w7/+jm6Quk/DBBaO4Q6rk8uD78sl51i5gnppB41bbjuTu0Sci5r21orbNG0Fm34Uoyfqrh7zKAiC771zimbHMCg+nNAw/Yo8TGwXHoy+FNO4ANKUp5C5LWzSl96memse3K4U95grDD6uhWGeQEm4ZumxuscvPTF0RWvw8TUJHQn3j/OfOPDZSWx/gdYKbAkiwv1WJs9MMFs5j3A2YXh3tgrcpX/w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(44832011)(33716001)(33656002)(38100700002)(186003)(38350700002)(2906002)(5660300002)(66476007)(83380400001)(1076003)(316002)(6496006)(956004)(6916009)(8676002)(26005)(86362001)(9686003)(508600001)(6666004)(52116002)(9576002)(66946007)(8936002)(4326008)(66556008)(55016003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RZefTYRRycmKZmm/qVihEnDPEEFedn+0Rp+JwPzgWkF8s3Z1c54X4AUeKTNg?=
 =?us-ascii?Q?IBu6qAz+ouMBJqrEIXJGvMeLeP6rs5PtkWjdlseHzQpE52J2zmk7oOpE1Zo+?=
 =?us-ascii?Q?gNvxRZo1Ai0t1BgcStTy5twS8+Xdj3UX9QM+JXZkpL+oed8f13nn0Q9mFHN9?=
 =?us-ascii?Q?pi9gVZ/AQJb1Wh+Dy7F5BJQmMQKkwmttzIIpMbR1s7qeLOy2K+V3/oBFfuw+?=
 =?us-ascii?Q?Vh4GwikPc0GtHwfwZ9IxR4yzjWf5qnyvtf/QScactK0k5Ip8JRklz/qBK2PI?=
 =?us-ascii?Q?WKFMfiZpsN+tY/UPHlDJX2YD0EFL3h9m4x/cDx53ur+duxqFJN9qW5NVm3as?=
 =?us-ascii?Q?YXQYmPiU8Qeb3M1gM8v/l2fKyI2aU84CvgGh1XP8gXXyyI/8joNwDp8XZCBQ?=
 =?us-ascii?Q?J/M6Eh9Tmf1QLCE61rEPirDRbm661TnWOyt/H3k2BcghfzLHp8wtXz+Sxweo?=
 =?us-ascii?Q?j/mH5MdARcS5/PgijzVkGnBO6cE3w3zAJxUDIO6APejOcuTFINSd+5S8e+jO?=
 =?us-ascii?Q?G9xrVt2kDaDWiN/o53mddq8locbX7oeNAl8nNZIDmFPwwtxMmxCNXOA3BhZx?=
 =?us-ascii?Q?wfeFDnUHk6YXxTUZKNrMRqs39W02QBoSOafk8fivBJjuu9iMGaLsuWyM1WaK?=
 =?us-ascii?Q?M2racGnpEQrja3eXCASZmyhGBwhyVuv3Ndv5AoiqSU6O2nhTm3Ra/PfxV0zY?=
 =?us-ascii?Q?BDnSZBw+iVPHz5j1LbNFaZaQ2iMbeEsy58es/rYLUSviwCnMOeWH/B18r/n2?=
 =?us-ascii?Q?ChlIyOhOl8L53bAE0hwj3uwlTWZmJlAtgzkANB3PNdKHa+4og/ipwRerXaFV?=
 =?us-ascii?Q?fUNeVRpWPLk1dFxUZKWKdaNKQGi3LzEsdSLWKJu4Bbw6zDTwG7wV4jZfc5Ce?=
 =?us-ascii?Q?ixxGyX045Gnj3U1qNDk70r02XCK23kBFyOXmGWk6++JZY7DrWPSqDKmi63UA?=
 =?us-ascii?Q?j43lsGLOgvVaBuVC2edAtHRkUUnEviDMdQFKc1GlMhUw/PE7a/jGMo2/tEVI?=
 =?us-ascii?Q?JShDTe/yQWUjbsAngbA5JZKmEIV5GAFbhlsTxIcE+Qk4fCW+i7psrk5fRp0e?=
 =?us-ascii?Q?dxZt9J6fPHtYigWAhyw0qu+ybKSwxdrG29O4mwEarp+KHxj7wr1pfBfpsdGP?=
 =?us-ascii?Q?ZvmK6IMav2rzn5bdIH/UgJWHMRru57sB1NQzGoFMCPjB+h5HDNkVi4V1qrPM?=
 =?us-ascii?Q?nY9+I8OvuplPyF5EtRcjLeH+Nuewvagv0GFnedLQ21dpnS7N97dXOdp74IyD?=
 =?us-ascii?Q?TKRKh+PgRmiaiJqBFeHk70RQ+SExjiPExZ7aP87ujlouiFh4bcy7VbqTF1TO?=
 =?us-ascii?Q?cAuFF83YDd5HmBfx0otd3FJfKMe5RIE5h5wQTmrn0RO1DoLt7eQUPpleT94x?=
 =?us-ascii?Q?85JW/RcF4pFakTatWEHKoHo9gIYsZ6oqbcO2Rkhv/iS62TUaIlR6hi4E6QhE?=
 =?us-ascii?Q?J3ejbtza/pIwXmHJ5pNPUDD57JDvW/x2AwnWGIS6Qb2Fd9vNPkxI0VtKs0Xi?=
 =?us-ascii?Q?wzq1fA54cEd/p71h4mdYX1Y3Jvs7LZzacBZvluyw9DhdELFanwbxjdW45bd6?=
 =?us-ascii?Q?yJppd3obuGfBQrgb2LOQPmqNNkID1ADzvN9VCrFlVnec9VAIVxD7zwH+Kyfv?=
 =?us-ascii?Q?Bo2QeOr0OvZw9lq1LwI2Dw327URAjhZAgt2XZUxOTH4Stkp7AsV7l+LXANqz?=
 =?us-ascii?Q?K7hDK9IjjL260Pje25gwvsx7trs=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cec8807a-9ec8-49ef-67c6-08d9b643503e
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 09:57:27.6186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fgDWFTVhq5hC/2l8Q4pIB/fA+8Y+LXlJSLljn5x+ywl04EdqS/gZEDjFa9pTxc66sL5x+VBZVzWBE6pCiTBODPWiW9/HqGDg66p0gPDKMnY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5677
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10186
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 spamscore=0 phishscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112030062
X-Proofpoint-GUID: bSPLy530RgCCTvW9BG_PzJlfVgXslmn6
X-Proofpoint-ORIG-GUID: bSPLy530RgCCTvW9BG_PzJlfVgXslmn6
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
Cc: linux-fbdev@vger.kernel.org, kernel-janitors@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The "edid" struct member is only used during probe() and it's freed
right away.  There is no point in storing a freed pointer for the
whole life of the driver.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/video/fbdev/savage/savagefb.h | 1 -
 drivers/video/fbdev/savage/savagefb_driver.c | 7 ++++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/video/fbdev/savage/savagefb.h b/drivers/video/fbdev/savage/savagefb.h
index 3314d5b6b43b..b6b8cc208293 100644
--- a/drivers/video/fbdev/savage/savagefb.h
+++ b/drivers/video/fbdev/savage/savagefb.h
@@ -195,7 +195,6 @@ struct savagefb_par {
 	struct savage_reg initial;
 	struct vgastate vgastate;
 	struct mutex open_lock;
-	unsigned char   *edid;
 	u32 pseudo_palette[16];
 	u32 open_count;
 	int paletteEnabled;
diff --git a/drivers/video/fbdev/savage/savagefb_driver.c b/drivers/video/fbdev/savage/savagefb_driver.c
index 0ac750cc5ea1..b9110220c0e0 100644
--- a/drivers/video/fbdev/savage/savagefb_driver.c
+++ b/drivers/video/fbdev/savage/savagefb_driver.c
@@ -2170,6 +2170,7 @@ static int savagefb_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	struct fb_info *info;
 	struct savagefb_par *par;
 	u_int h_sync, v_sync;
+	unsigned char *edid;
 	int err, lpitch;
 	int video_len;
 
@@ -2212,9 +2213,9 @@ static int savagefb_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	INIT_LIST_HEAD(&info->modelist);
 #if defined(CONFIG_FB_SAVAGE_I2C)
 	savagefb_create_i2c_busses(info);
-	savagefb_probe_i2c_connector(info, &par->edid);
-	fb_edid_to_monspecs(par->edid, &info->monspecs);
-	kfree(par->edid);
+	savagefb_probe_i2c_connector(info, &edid);
+	fb_edid_to_monspecs(edid, &info->monspecs);
+	kfree(edid);
 	fb_videomode_to_modelist(info->monspecs.modedb,
 				 info->monspecs.modedb_len,
 				 &info->modelist);
