Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22DEB42B9F7
	for <lists+dri-devel@lfdr.de>; Wed, 13 Oct 2021 10:12:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF1D36E2A3;
	Wed, 13 Oct 2021 08:11:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38F116E2A3;
 Wed, 13 Oct 2021 08:11:55 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19D70UsM013092; 
 Wed, 13 Oct 2021 08:11:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=S/DvPk8vP6Tg+9NoZgj6aiISxq7OBYerCNB0LC1UrkM=;
 b=eDwZTAVbymnwpspfc9z1deumRqnJ2aCziefmGT7lmxEsTHpbVYrjpVAVrTCrXEXXBy+e
 3LZu7pzb7wUjj2twrsUqOOj/TiqbAzksjI+i+bjVUk3GxqAV2iSFA7FJJTCff15VcvpY
 vbQiJK1+1L48DFzSJkNEFMgjfYUcTqo/D7+/KYT4sAdh5tYAIIZwPPlcRkc/emcyCgDY
 qNtOq4rTcy6Eblu6uhu5Pw5fLyyY0DuOSOZnKvtKH6rHIeiqDfibBNB2Ac5EFPBzLEHJ
 sFCnCn0tUMf3TS8hKrkbywgOD6ocecRs2IBvkvpnav57HWc0N5z9z/Iw7cbcPmaW6q91 /w== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bnkbmt7um-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Oct 2021 08:11:49 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 19D86RcZ024130;
 Wed, 13 Oct 2021 08:11:48 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2108.outbound.protection.outlook.com [104.47.70.108])
 by aserp3030.oracle.com with ESMTP id 3bkyxt2jaf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 13 Oct 2021 08:11:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KLLzBz7idS9avs5W1cUdUI0gHyibAPmp0aTs+TF7Iuax42+OxK4IQ6DQFhfQpQAaJcbZfbdC6DmsKxL+/KslEbbybSwIFsudrUyE6bwgQU+4WhDVo7z2z74HNQf73bUcd5KjxUs6ZccuXyqnYBOqQS+c3OPhLtnosooZxPQptvHRQymhT0jiYxIgCIkBW5Lnv9jyHiZa8SQ9M33ZTf34R/ymXtMi+PqSj0RvMabVl23LpGMiIiGzJOoS9bdRyTM7iCf85JAYsEIsBoAVB4Ln2MZWtYqXFV/MM7yoqmuBoz4o0u1jzQlR9TLdFfMYgSXJIQ7yL6iazl5ZkDhoMms6BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S/DvPk8vP6Tg+9NoZgj6aiISxq7OBYerCNB0LC1UrkM=;
 b=gTWSHr2tFH9LQVgCEj5/1JB6x85VgXV6ud0fFcunfowLo2EYTju37S8r5U78UpcRXkyz8vEfoP1goKJuUCWk2X8kkJ4Y3Yas926IoGdZ1NYsivmxKm4tQATSd5WWMeAoMERYLXu6fXtFPVWf+bO4M8JCyPATi27XStTKlz94HYjneBxmCANLzzlefCFFZOb1JsPoZAPE1eI34JUjbtkavdAnuJgcXRFM/KGWl3maseILt5UpoSxrUYfu17vgDhWUplbmPXro83JxDIcaZiTbr3AArTuujk9OkDsKrzbzx/C4svKCUfl95GuXBxUOh/gIzR+9HMSW3Eu/73fzZz1KZA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/DvPk8vP6Tg+9NoZgj6aiISxq7OBYerCNB0LC1UrkM=;
 b=V86pTx9k41ZyhimG2kEitn0bKIi7inJIZVlPRLVL0Vp2dvP37g6ed+Aj2sRKlGKLjiAjYLf5Rw6/Qeoxae3ZXGYpSGwGFu8qORvrgi9qeiDDtwmruNL2cFz9JKnLOuZ3Qe8jjNqRHGVyLoId9Asg7/V3ptiRzEJB5Eo3dA5DbMY=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4643.namprd10.prod.outlook.com
 (2603:10b6:303:9c::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.24; Wed, 13 Oct
 2021 08:11:46 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4587.027; Wed, 13 Oct 2021
 08:11:46 +0000
Date: Wed, 13 Oct 2021 11:11:33 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH 1/2] drm/msm: fix potential NULL dereference in cleanup
Message-ID: <20211013081133.GF6010@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0145.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::15) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (62.8.83.99) by ZR0P278CA0145.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4587.25 via Frontend
 Transport; Wed, 13 Oct 2021 08:11:43 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 62714bdb-a9b2-4e71-8929-08d98e2119b4
X-MS-TrafficTypeDiagnostic: CO1PR10MB4643:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB46432583F148E5A3C4FF8A0E8EB79@CO1PR10MB4643.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: HJg0sl5VkLfrS+8BIPexreDHhNjYDw5P7nwCX76YIoGOsSAowkSD/I+SufZwTrIPaEfZdak5WQTMjIMYqr4jeXk7qOsoL+OWpQGaRDsulR4lAyNmMj/PslUjZPtBSQAVnTqIXUZ7gyueVhz7bGUPhRSDKQyNRZ5qNP7kkS9Plmp/hKS+Qo1OO4KZZdNLq23n7QTQiOCotBc/DtB3JA2wbSPBGdvtf2iqCeowkgflqKzI7G+ACmcuScynlxaAxU+vbihw/GAkDeukuDnYEVPP4EN8Zo9T/jxcjLkKk69HGN4m/esQGs58JROQiMhB14Ut2eVZnhOesaxWRSbp08m5Y9Ma31MARd+1jANs+uhkgT/3juvSDZFy6UeT5BWKz8zoWxcYYXNNCgrShlI1g17RjjkjCmkYciE3krcwBccViXOBseHomL4u1mN5ML9uO805zMXUqM5ELDu/ChV63OWt6/xFdW3IaEArJYJdrh3mqqvJ5qIXhLwB9z/6Ppcjo8Lqew/s3G+IIv2rUjN5VbsZuXlJhbvMsUpUuuPdf0xBLQuZpbfsPHt4yFhGGo/rFbNKASypbY8MLnS2v9RV6Uv5fjnpN5VefSesr69CTlPWY3CpO91V8MXQLcB1xdeMpKXbwEi4Jjb40JKORlTA6x2cAmxO4Vr5l6Y11fUtpkZ8/H3oy0kgYqTMGQAqzTWDIJo788W+pkcHWuSOyfn4vWtqaQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(86362001)(66946007)(4326008)(66556008)(6666004)(54906003)(2906002)(6916009)(956004)(38350700002)(33716001)(6496006)(38100700002)(66476007)(83380400001)(186003)(508600001)(33656002)(1076003)(44832011)(4744005)(8676002)(26005)(5660300002)(316002)(9686003)(8936002)(55016002)(9576002)(52116002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0NoBQZmBnC1BiE7jFwnZeALkx/c4ZmRXfEh5gp8+ORYpfTsjs0SbDcDdwSlh?=
 =?us-ascii?Q?Wo4JknSl7MqDbHxcITCLRt6WdHAj/t3lScIEYt/kllUcqAzPoVjSRbe5jcYn?=
 =?us-ascii?Q?M90FEvFVfH62QjIC5FzzbPYDT7HjSDxW/TOqcc0APzj/p4cKM3g6fF7jxK38?=
 =?us-ascii?Q?TZo6WLwajDFzkAPzFW0CoaVrQLh5yoCfaDcBe0v/UwtS0Y0rnCqLiBWtaIva?=
 =?us-ascii?Q?FuYg2+ZBQIV1mDNK29bS59lAG67xz6asacMf9u+04QGroC9R7o3r5m63pdbV?=
 =?us-ascii?Q?SJXYZuE9VH/yOENLov70xrOgyedbNVzN6CZJ20QMX3ACiNcmE9cbLVcCBG64?=
 =?us-ascii?Q?aQ51oBC8QzkvDj6CWaJDnbklJRs8sopsdadophAK+nvB9jC5qe9Y3UpjLWfp?=
 =?us-ascii?Q?M73BVgXlAOikx6GCSIpRTCozH1VH7Y9kw4bmhM4ituz/oGhAuzHm2mpIQS0/?=
 =?us-ascii?Q?ifWEDMzCmv8K61v0FeAKefp/FcockPPdeltcsSH/cwWIaX36SGLWT1SRA8Nd?=
 =?us-ascii?Q?gbIxXL5qcMIS+UDtMKXy12EIUXbtTvH1CHVdqvAu2c6zLh+2eQBul44N1nAg?=
 =?us-ascii?Q?dxXzZTv2eEojhqM/eBoetYzkQAQv38Vm4q3lrDSWnrhiQicq5L0M+c5CyYx1?=
 =?us-ascii?Q?wE9nfLDfZ/sqZ6tTZj2xNEkRWuOIfSAQAfBQ1JaCnjzphL2AobrLjAyMRSfg?=
 =?us-ascii?Q?8UVwacL9k08/Ja07enJQjYZBk4gZP8IxHYbervoFtlL8ytwwnqoFYJal1rv1?=
 =?us-ascii?Q?WR9g0/nwsjJIV09x+s/+QwcHyVi/CoaNfqFZUhDdJaBVbrAXbPSRqFWEtb8z?=
 =?us-ascii?Q?J6y3+zAkUoPdsPP0c+cfLDh3AsFB20OwwpafHTHVRam3TE2NGarX6PCs+xRe?=
 =?us-ascii?Q?xzfJ5+KEVpx11gymkGS+gFjBXaK5xLk29nT8kr0wLjn0nyfm27MsWpe3zgCA?=
 =?us-ascii?Q?/K/ztf7VqXE7zHtzU1ym7+OEaurKkOYIuGYC+BswI8brsf+wWGkN0+fcV3Bg?=
 =?us-ascii?Q?a0Q1go+J7kBGxhstiGTAX0YI2iKCuD4cWz0yARlSN/SyTobseSZ0LsCzx/YY?=
 =?us-ascii?Q?nBMNdlH6ki+JReni8tuu1sWszKsOK3TU/pVA8ldgVfrfvfGWoqnzqOsmurAr?=
 =?us-ascii?Q?wwvPorT/A3P5LppslvRitvnqryN6ri5fJhJKSZLrV/WK6GjTQnDUCv6YUm19?=
 =?us-ascii?Q?cItHToLgN8GnCvstZurSmJVa4CDdqsF/pVBt+9vWwu8b9x7nKpXIRKjM6J/H?=
 =?us-ascii?Q?72CXe2P8eH33JOuQdtwu1qhVE8RtCWkAcP/gfIF2b4TTZ1/VHEYaqoxxd/PT?=
 =?us-ascii?Q?6IGvZjpAtH7JrwXiDz2vRPpX?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62714bdb-a9b2-4e71-8929-08d98e2119b4
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2021 08:11:46.7222 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0H9kuJKc2+6lvsHqaJfrlPkXigJEY2CkkemeEbs+WKLw4g05+6wnqCsqcYWITxSQiA3V1bHAOy24Ex2m2Orb4LD16eCj4sDIYg0YOXSb5yE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4643
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10135
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110130054
X-Proofpoint-ORIG-GUID: qD8g9jWGBcyMTjtkFeEdsH_XNd0GaHHn
X-Proofpoint-GUID: qD8g9jWGBcyMTjtkFeEdsH_XNd0GaHHn
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

The "msm_obj->node" list needs to be initialized earlier so that the
list_del() in msm_gem_free_object() doesn't experience a NULL pointer
dereference.

Fixes: 6ed0897cd800 ("drm/msm: Fix debugfs deadlock")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/msm/msm_gem.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_gem.c b/drivers/gpu/drm/msm/msm_gem.c
index 40a9863f5951..49185d524be3 100644
--- a/drivers/gpu/drm/msm/msm_gem.c
+++ b/drivers/gpu/drm/msm/msm_gem.c
@@ -1132,6 +1132,7 @@ static int msm_gem_new_impl(struct drm_device *dev,
 	msm_obj->flags = flags;
 	msm_obj->madv = MSM_MADV_WILLNEED;
 
+	INIT_LIST_HEAD(&msm_obj->node);
 	INIT_LIST_HEAD(&msm_obj->vmas);
 
 	*obj = &msm_obj->base;
-- 
2.20.1

