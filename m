Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 819B4467461
	for <lists+dri-devel@lfdr.de>; Fri,  3 Dec 2021 10:58:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1783B730ED;
	Fri,  3 Dec 2021 09:58:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E89466FD6E
 for <dri-devel@lists.freedesktop.org>; Fri,  3 Dec 2021 09:58:38 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B38iSeg025642; 
 Fri, 3 Dec 2021 09:58:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=sprLv9hIbFf5htchuuVxf9z3jst0vUQ+6pQjfdZu+Fs=;
 b=qMs4vvhGv+h/GhfdVygCnKzAo6V40tpdoixzijkMs5QzsKRWsCTBZehOs4cxQW1DhUKh
 vzsmQ9DQ1F5cBTQWo/363PTlS2YKCoJHbMa+HBix+GrVYjI02T12cg79P07+Z0gmYP4A
 4a7BqblGA76+e72zdVtWoRbgvQ4Sn70e7aLFNx2Vpq0PGz1Vs2QBfIiZ4jzeAPWG89SS
 wyWIW/gIm+21q63PXzFCHMJYWMGeuAkJea3ypZ2XcXMgG1tFRInMxPDpRRf/UJcToNsv
 dkRyPxfrwnynnFZpFtsczCa+Rx5pR+2DZWUQbqQX4fg32+ZvRumFs+f7rx17R/5gf62x eg== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cpasyw6mx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 03 Dec 2021 09:58:28 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B39uup6101342;
 Fri, 3 Dec 2021 09:58:26 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2104.outbound.protection.outlook.com [104.47.55.104])
 by userp3030.oracle.com with ESMTP id 3ck9t5we2c-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 03 Dec 2021 09:58:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=YuDFniv0q3B9zRnHAgt99p+68OKQMDwwiGy1ic3ko7bVEBs9eo6A7+RTgfMUEHE6wHVR9iO9c+bD7dT9C/FGYcF7CQH9rnRloVb4Q8sO3JqD8gKhhHv1WbNiC5HUWwJgVQ7SHfEbK56EtIPgt7pJj1s08O+Y/6FD/OcAfun8WYUEJzHLqzaGFisER12fDcMyEY/6OYIXXD9mAIMquj3MdZgO1mCWan17O0Upu9zV2cIoot+a2YFrIOp+vaqKBo9MNi4QDO7f1bsDBdk6q9MMk7SMli4WJvuZ3Qq4XnepjCq0UHqr9l7WWv23OfpMZg1DNHI+Og5q5HVt8CFWPCgjqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sprLv9hIbFf5htchuuVxf9z3jst0vUQ+6pQjfdZu+Fs=;
 b=KdnA7f8r8RmnDtV0+XABwgavAtWqhh2TG2zVwr7vt6GDLamhu3B52ZLWMb57NlMSXfu5KZManpLqXsOmCG3lsRoMigR82bpge0WoSikJ7AF+seMHD+neggtoAcslXOHAV2OU1NuFwxNpTh4v7DRffTG45HXkDf1XGNEsbVjgWJAYG28rX4CG5azXom+ksP/HTUcfQzNCy75Kka0wAnPWpQQdVLRxmkzkWT/xhT8xR2GD7SqKwLecrRjkUVYF2z76+Qx/vKeTEbcF4DtPbKeb2bfVPh+kmXhQMVTWoI/Jrnmmw3jWuy8tWlgIYqD1CqIOThO9eguIvmNOVhhs4odO2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sprLv9hIbFf5htchuuVxf9z3jst0vUQ+6pQjfdZu+Fs=;
 b=lbiqw0qmR0qgjyvUx1dQr0p33ZvrFbmfPLo4bHKkOCqw8NSM2RuRDUoRT20lOyyszWg+CSIzvfoRc1qD4Q6LSm6MtGrMPE2xc0fRa67vrCeTgqrx9f8OOvYNoaZp7T4PktDhMLzxtSHEn5BY/5ctGudZmSPKgLCn4qCRC7f/JYE=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MW4PR10MB5677.namprd10.prod.outlook.com
 (2603:10b6:303:18b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11; Fri, 3 Dec
 2021 09:58:24 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0%6]) with mapi id 15.20.4734.027; Fri, 3 Dec 2021
 09:58:24 +0000
Date: Fri, 3 Dec 2021 12:58:08 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Nicolas Ferre <nicolas.ferre@microchip.com>
Subject: [PATCH] video: fbdev: atmel_lcdfb: fix an error code in
 atmel_lcdfb_probe()
Message-ID: <20211203095808.GE2480@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0196.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::22) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (102.222.70.114) by ZR0P278CA0196.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:44::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.11 via Frontend
 Transport; Fri, 3 Dec 2021 09:58:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: abb55656-da1b-4896-86b9-08d9b6437234
X-MS-TrafficTypeDiagnostic: MW4PR10MB5677:
X-Microsoft-Antispam-PRVS: <MW4PR10MB5677CACEA7730EDCE45640DC8E6A9@MW4PR10MB5677.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:449;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JcUxAAAJgwAwI7psejJ/RZz6fK7Iq1v5ujXHq6FZlDick1/Fpx+PpF/B+VmR8Eb1SlvNHRqqu69D618sYUNQIRON8djUX4kjcrHt/GV5XjvmobER6eyuK2JQVmkESXpD5zbc4C9bKmFJCtIlkGJncjT1OxskrVqxn+rayW3PqthTRRtjgckiPtlOflBhKCBxj9dgfbxC5KvNulAVfvAar9iv3MNpDQzOvkkAMxwTAhXDEFC5uJFqhEOePLdCBM9C/uLTggLflQxdnHzr7XeUgwhOmdgc+4jQD4Rc22ww264Rp2VNw3wJEknrvepLzBCyR9uStLTr22GGbLA0KDsJNti6lnCDXKCVYyJU7KkxOtzzd7MwfoO1VL7FfjsGyo1dPIrE3N4AZ40NYWBg8tZPp2clT6Oh5heBXTetP71BAoHYw0IkieczjaHFG/lN5kxbBiql9LQb4dQ8UzTQQyYdKEgIJxnc0Ba26K2ngciu3aXUnwaYd6xwTPQCaRRfys9yTyBshiqUYLprnVAZOvb9Rde3qWVH0NrI92TDLUfILztOS7Cfp5dgOhaC16hbC4DTcAkjYAIc49ayhneXgZSGWzDW7Rnnt6dlabvJPNcLcZG+OBnfLYnzUoSBEuw3mDKrZmFtCR8rRTxatbzNx/NdubPkjHHAjMlTnDmIDz71Gx4rClaX5Ej1McdlCQJDTeaA99Ye2Q3WjYe24o/yHr5HDg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(44832011)(33716001)(33656002)(38100700002)(186003)(38350700002)(2906002)(5660300002)(66476007)(83380400001)(1076003)(316002)(54906003)(6496006)(956004)(6916009)(8676002)(26005)(86362001)(9686003)(4744005)(508600001)(6666004)(52116002)(9576002)(66946007)(8936002)(4326008)(66556008)(55016003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FfKH4EbxAyZECv3iytKSkD4yaHNgNg1Lv1SSTtOfm1eUmleEtc0UWEOvSv9g?=
 =?us-ascii?Q?yMV98rV94G89cKSEcRYPM3Pkv8P1jQwC0r4fYvhLyluPu/XmZA1Zmjty+G1i?=
 =?us-ascii?Q?L95ItNSY2yNEjZtn2bFM+yIUPdOhSIxymZ6QGbEC43GlmrlHnpgxnSpC6l45?=
 =?us-ascii?Q?CNj/iyXm7QwoOI1/+ll5O8SP26y7tsohYCwo4diFSQgTYq80vZNS0Wiz4f1z?=
 =?us-ascii?Q?6AYIQXjoQAUwoSdYnKMyB9gVooxLXISKUuwk82Ss5JFnNdcHNUY9Lvhvjdhx?=
 =?us-ascii?Q?XX9iz354+LvCUZdyxXD4ZViVCqHTQqekVM6vTrmECMXaKII3F4J33Pg/xcQt?=
 =?us-ascii?Q?N9Oa5OMs9/+SXlZKP3WqVkTwLu/nN5AAnmg9T1A1qHhCB7P9Ym2gG2vwrLEk?=
 =?us-ascii?Q?L6ei+dlgRhNUNMDbN5Nmm/4YVEkHTbDAg41fzbm77poHIgxDRNfbHOK6IQkx?=
 =?us-ascii?Q?LaJP4V0+ZxhAkpk4k5H4eQiSSYNUGjzstN7OJ4rsECNBhGcxuQ1R50mtPiOG?=
 =?us-ascii?Q?7T3WZM4D/jJwRNJAY1ihlUCw7fb42ohtaVvkJSYq0Xf6s9vaXckz0UemWdxa?=
 =?us-ascii?Q?OOdkXuPVGxb5wjz2ssdotRNz81KxLR667GhXFZU2ny2ilDiBvcn4+slOs+BH?=
 =?us-ascii?Q?LywSozetgHeQ6na09NZl3eJHEZeAsmozF+RyGrIYmyjT5kuE98znMAm+vygY?=
 =?us-ascii?Q?CluPT3uNst/wwYVGBYkHjtzqC3Lc7lF0NqYvHaZoggYNkOU5yuac/BhDiHcQ?=
 =?us-ascii?Q?MudTZtSONoOhLtHa9kpMN07dQNsuATqvr3mnYvWJllQKVM/wFtzLwHy9u/LN?=
 =?us-ascii?Q?NjjuaHXkr882UUUo5BeZ+v28wcB0Xek7A6KhGsMaXMi554acRHZMJTQa66nx?=
 =?us-ascii?Q?qE2O1L7sPgJ2Aa3u1nnmM1SS/mevAXqS5stNLSWkyJCChBg3ec7r428MfPMj?=
 =?us-ascii?Q?6h3pQIveXlg/qroQSvLGE6JWDwBOHxRDSELMysMB2eBezeXLpAmyF0WKtXXM?=
 =?us-ascii?Q?zlfrjobfFpqlCtNdDZa2Mq00Ek7tBw8r5ftwIhYp0o518sN+nG15slZLzmK7?=
 =?us-ascii?Q?UkHhDI+OP5ctIF/ZYr5YOJ494ChLc/KVLMGupURC3ezzJXIYCZYDmiQnt/YB?=
 =?us-ascii?Q?t1Gv15EEi0m1y0ikoYNZ16x46dg6FMAQnnwuGcM3IUsnu5CgppHGnyp8OlaT?=
 =?us-ascii?Q?2MchRzdVX0gF+muvhU+IKfftcqUtLgC4y+2FP293a/iz3gq8VSSdalnxpK26?=
 =?us-ascii?Q?LpNapNQPEcRTmFzJbHKy//DEX3QPA9B9C2tCTESxUHK0UwnIfrgOR3Rvexcw?=
 =?us-ascii?Q?S5q9JeYDFxT5yCLaoXosfZHIZsFlDEqC+n3gSKwh15x4rDAPFGhuj9TtXeND?=
 =?us-ascii?Q?PrPoBUJmMpKXXy/HuuuVugxoMlNZvUSotg0dqrrMyzqlqUHFJFjBD7ydwhQ6?=
 =?us-ascii?Q?xvqDi4jQvDKFo0A+vyFzgvqMYhq3TA5AoDzqi8YSA9sTU2uZce0K+hw0s3rw?=
 =?us-ascii?Q?zQ3e2DFZ7gaXYiFWAFPhmCTQ0JaB6hrf3wKVKoatVgrgEGHr2Kk/DxH3rE7V?=
 =?us-ascii?Q?tljW+KBForL3fP25/aPbF4UgvphmyKrZzGlvEef8pOvKmYR7gTG33URRoJiI?=
 =?us-ascii?Q?Pz81SLIt2OiHVMdPZzFIeJ7K6OhFOdOXWPDdHeqswdc57GnnzJCO1iaUQyAo?=
 =?us-ascii?Q?B63nYidkrvqc1WHAB2VzqZ2W2Nw=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abb55656-da1b-4896-86b9-08d9b6437234
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2021 09:58:24.6094 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UB2f7qp7paVLq5Sq0hwd6G74in0wWB/XG13ke+8hTWLyq8QXyzhsqxq6FAXlk5GxQzLg573lFnXIJip1K+TplL6X+4XDFpf0tn5UrxS5Nyw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5677
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10186
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxscore=0 malwarescore=0
 spamscore=0 bulkscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112030062
X-Proofpoint-GUID: RIQjrVjRJRv5S2Wbx9VVw44a9tHJKfCl
X-Proofpoint-ORIG-GUID: RIQjrVjRJRv5S2Wbx9VVw44a9tHJKfCl
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
 kernel-janitors@vger.kernel.org, linux-fbdev@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Tomi Valkeinen <tomi.valkeinen@ti.com>,
 Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

If "sinfo->config" is not found, then return -ENODEV.  Don't
return success.

Fixes: b985172b328a ("video: atmel_lcdfb: add device tree suport")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/video/fbdev/atmel_lcdfb.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/video/fbdev/atmel_lcdfb.c b/drivers/video/fbdev/atmel_lcdfb.c
index 355b6120dc4f..1fc8de4ecbeb 100644
--- a/drivers/video/fbdev/atmel_lcdfb.c
+++ b/drivers/video/fbdev/atmel_lcdfb.c
@@ -1062,15 +1062,16 @@ static int __init atmel_lcdfb_probe(struct platform_device *pdev)
 
 	INIT_LIST_HEAD(&info->modelist);
 
-	if (pdev->dev.of_node) {
-		ret = atmel_lcdfb_of_init(sinfo);
-		if (ret)
-			goto free_info;
-	} else {
+	if (!pdev->dev.of_node) {
 		dev_err(dev, "cannot get default configuration\n");
 		goto free_info;
 	}
 
+	ret = atmel_lcdfb_of_init(sinfo);
+	if (ret)
+		goto free_info;
+
+	ret = -ENODEV;
 	if (!sinfo->config)
 		goto free_info;
 
-- 
2.20.1

