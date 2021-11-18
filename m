Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 530EC4559CB
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 12:12:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86BAC6EB7A;
	Thu, 18 Nov 2021 11:12:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5BE66EB7A
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 11:12:50 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AIAfUV9020985; 
 Thu, 18 Nov 2021 11:12:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=+Quo5GPsReZyPfYZf5cp0aHq4acoHysb69PVQ5efw50=;
 b=1Mj81hxmdCIkX8gllPtH8eN0P5p0NPeSqcj89ZDe1lsz7WToSi9ZoVbp0KUhpUZ8q7aG
 swK1P/8BYcVmeAzNVglzdpuIahw1uYniglpsKwoWZ2V5ZWUT/UrVEbrDbH4cZENkY71g
 O3MYSVvNIOIPnJ5sJMWdvTd1QIiFBbN4oviWbrg4vHcwyeMK35GdtKChzsI1V5w4zHLb
 3Ud/xDrkbpEnuJFit0v8cV1j1AcJxBd6uGkpgq85kLav0H7xPmC3T7Z7xpQe7rfwOo0Y
 lD9hoHA56X0iPCmRXnBDoWtaFQwgAJbF0B6KXwG1iqQT1Q9hFz5M8oLgy4Leha937gLl Yw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cd4qynhe7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Nov 2021 11:12:48 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AIBAJOS053809;
 Thu, 18 Nov 2021 11:12:47 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11lp2176.outbound.protection.outlook.com [104.47.58.176])
 by userp3030.oracle.com with ESMTP id 3ca2g0b24r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Nov 2021 11:12:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JJT5iGcKf5AR6mnCINJsxxx+lhjB4cEYmuWiw2b/ErvfzxPW87Tu1A4pvnpGbUsgnHYxPQrOIEF4DjU4UVa++KRj7u3ma3YmmcEk/DQ6SOc7i28Rp7dObeUUCirVYNUwCtNvWz8aaK9mDdGZsuT1l3tmrlgvdnTns+rr6oo1FC7TsH/yt4b+F03xQ0nxUKX7ZFX3cy+jUuUtUVmWJFl9RCTJm287VBvQV3HRfvtgSW0mMyCHTGgPGKBxvMSFKsGk6ay0+RYdaYFV5afDpWDvcx0UIcWbXdWuwwiIFTOWT/LuN9qZ0PnpPSHPRPQ90dAITxm+V5m0bZ4gw0lAupNzRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+Quo5GPsReZyPfYZf5cp0aHq4acoHysb69PVQ5efw50=;
 b=cjuWTLqYh3Yq4EC92HgPnGVTYB8Ju4WADaI7IfWYgo7uh0GEYjX07SXVa0aMASwv3V0joN1rdpjGvp9+K1FUpjXJxfAz4eu/1LImYAOPvnTrzLMaU+SUnB4DB/l4hYPMCKxgKe82UYo4+gvxUad95YabbK6yKyQjbhDZBzShX/B/TCeoKE1v5orA1SafQ6PJzybm/YC9gwwYN64EKDeL7XN+GLGQJmlnVY31jutWrNi2z7IBZpkfMxOjIkOgTLN5CyGjXn9M3D/8IaxC+Oa5NnpEgH59XQCa+nKRrZ8P/9ke8IPrMhrqtKS4ggywvXXHeZpj7FndN5nW9Izqjwxz2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+Quo5GPsReZyPfYZf5cp0aHq4acoHysb69PVQ5efw50=;
 b=qCSZK+vmjDF3dtQuLQLVidXzs9TRhQT+2m5nqaE4pEycS1YFs7JcCCpYFOoRZicPGk3F0hXcboCt54SmTslZjlh40firBSIv2FYMNCp5nlPNCzRr2Tj+zDRzFIHsHGnqIXKvBs7gGxO9rhkxKyrbIJn83yLIQmyV8CDpuev9mN0=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1247.namprd10.prod.outlook.com
 (2603:10b6:301:7::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Thu, 18 Nov
 2021 11:12:44 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4690.016; Thu, 18 Nov 2021
 11:12:44 +0000
Date: Thu, 18 Nov 2021 14:12:33 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Hans de Goede <hdegoede@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] drm/vboxvideo: fix a NULL vs IS_ERR() check
Message-ID: <20211118111233.GA1147@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: AM6P193CA0102.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::43) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (102.222.70.114) by AM6P193CA0102.EURP193.PROD.OUTLOOK.COM
 (2603:10a6:209:88::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.19 via Frontend
 Transport; Thu, 18 Nov 2021 11:12:40 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 867e5978-6828-471f-2a10-08d9aa845828
X-MS-TrafficTypeDiagnostic: MWHPR10MB1247:
X-Microsoft-Antispam-PRVS: <MWHPR10MB12475BB490B7330417DEB2B98E9B9@MWHPR10MB1247.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:208;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3BB53l+HGX26xaUpPqhxvfbQDbb5sYDfZ7gjl9vKw+SzJwjumTud/PT4KEoL6m6WEeVsxz9gvMQce2wuFCKQ8fte8lyMozFn6F/FDHseUJZNbcF2jnNgHuKEwaELraa9aI8aYjO/EEMZZZjmE0GP8G0Bt8Rd3BTzBkL2vtRhLEZNwwN3qdsuPk+zHSeZqdxgYcXboDeZw0wulcbSY8DIYNboyu4dg78vPdL9dxABjn9rNIvJDxXpF1hh1dowsgMSFXr++hLSsYQxsxALhhdaf5jFwUvJpQtAX0+YxSBqwMNSP4Nm5J3UNEfC4l38molwVYUqDmMGdTp4txfuMSy/7RnavXFeUZIhw8sxEUf7ZDqzpS9bqWenKEmaKGcB8yi5GpJdFpIguVHII9zbsyyzKcFELOjbsGxn9ZmbEZy8C63UK3BGVzdMGiuQ/WtBNTlM2h3LnRwD/5b/afqHSTSb7tToepZarEMhrFFXifTH0EhvqRe2oS/ej4NAMMQ9qF+J0ouPk5IK9lvUpvtwGMPYp+7Agr1Zp8fOYP3D7q8TnK+QrP9m6PNVNIWi4hmbwsTcla+aCTmotX26IMjeWzgbAe0XMvCOCaKhYzUiYSdJ7CJ9xYS/+703pnfff9QeHduSUHFIpvNcLf3H9s04hfN0tyz3uoG/1KnTZdJAx5+ZyuUH014aVIBO91p1ouq/sE+eLygTO66LbPXrNuyz8jrp3Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38350700002)(186003)(956004)(38100700002)(33716001)(8936002)(508600001)(9576002)(110136005)(52116002)(55016002)(54906003)(4326008)(8676002)(2906002)(66946007)(66476007)(6496006)(33656002)(6666004)(316002)(44832011)(4744005)(9686003)(5660300002)(26005)(66556008)(86362001)(83380400001)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nLMcNwgJtdRSvXcxoJ9Yk72ghBmTxvhr/IppMQISV+YXR+hxcFMSpvA5iZUU?=
 =?us-ascii?Q?HXMV18gFiSZ8noUjUT9WCsTYaqaILbh/QoFzZu8vYNYunN33L/JfZB+/9EG/?=
 =?us-ascii?Q?a/wW8VtmD9Yqd4HHEAV6PIHJIqptzlbU8YHja87FoCFsgUFVsUo/uWLbZQMd?=
 =?us-ascii?Q?PwmqC7sl63ZqRtrw8RnPmrf0di/T59qsybH6Xwx5FPX2S6s8dxQAJZ5pStls?=
 =?us-ascii?Q?rELqHn7iIEWFdWEMr8kJpr5RJv0QsDcuClX8PcEFaX92Ib7axUQOchoPcFJ8?=
 =?us-ascii?Q?Ucz3SFjY8efhsY0x4ZIMvZgBv9NCY07L47BXfCJARI4q2E4LCpBV8jZnXJgQ?=
 =?us-ascii?Q?8ghvBEx5Hk5281NoHwvQVz85fNHajRtBKqvu1HTugh0e+pTBn8BHngSvi1EQ?=
 =?us-ascii?Q?iaOLNzjZ5nieSvnecTB82I7lDde1ZWcnzhE5L9c+bV8tnhi4zQH0dGAglczT?=
 =?us-ascii?Q?pWuDFZfRTKkCK12/KcE2cmeDnxTqkeMElL5vuDo5aG3zOwHP3pJZ2SECtw4H?=
 =?us-ascii?Q?yjjHzazX1kKAq6IrrtYjz7CkUsIQkSKOSoSt2g1iD7ogIeVxzIoPuIjdO8Nq?=
 =?us-ascii?Q?yZlDySx7Fc+Z+zKWx1Chpmi7ST1/TJ6MMvfqmuc1JxJAX5U2khU5yFdBNsqr?=
 =?us-ascii?Q?pgktSU+th5CEJkGQ7cz1CGvd6ilTWvBP+QvkN8PYbN7b1bpRVSYpyMxf3OPt?=
 =?us-ascii?Q?t0W84bpohN2WdJjpWKw/c/USAlPnCfBk5wJoO+g8g5XfvX6saLpK6CRS/fe9?=
 =?us-ascii?Q?bRSFWanfxRx1XOiJDlGdU+ehcq0bQjIRaj27k/Jh0L7qjCDQLJnBA45eUz0J?=
 =?us-ascii?Q?QTdcjf1a0NiN8g/iQBZvSZF8xjVM22+JaXrZClMXmjOtEcsRUmU8Gm5+BO00?=
 =?us-ascii?Q?K8Cd/29fQzbLyYlAbP+tYpIe1cKcJSsPfv3hFmNB/KtUqiWx3w93ofSJ9AcO?=
 =?us-ascii?Q?JzDzL4mt9N+y2kDb6gnsVB5/BJL/md34j9KpDtsPbBdMHyA3vuyI9bOSsc6h?=
 =?us-ascii?Q?eTwoEmVmh3Upy/uSyE5hs5wADSUdqZQz5nA7JSD+qWEJPmuA1P1X/0a3M1bF?=
 =?us-ascii?Q?iR/vPgbR8L3PXBosVfAWj7bFhDaTwIi6Z9+rfHkLSEly4kJHynb3nAGfb0ae?=
 =?us-ascii?Q?05qAbQ7pzOTfxi1RFn4xK+QmsYc3yrEc0zMRVMfPsTXYsjsy9fPRDEKkijvL?=
 =?us-ascii?Q?lri+U14KwfyUI3s2ndXzp464GZ+fiTqwYc02eSIEs700mVi7Li2yVdmATZYr?=
 =?us-ascii?Q?oRMskL8DhrVQr4zw/M74gbgclUD8sEovl+P80Ioo/WaemVXKQeiMbpCnrHYn?=
 =?us-ascii?Q?vx6FhXB/LiXJvRMwijokoDg5OGDULsOL5/LlemhxVQWGg9bcD3d4lF8ywYYi?=
 =?us-ascii?Q?NYu/ApQFd/XZd/n4G3Jg85kaoI1NFdfmateI2dRbE+bsj4/BAPAkF6aShYMp?=
 =?us-ascii?Q?wZjbHzoB3GzWWoI3VuSU8FRl+CFOBy2sXKSVjh6B9PNmZ7gHkFoAHJlXMURE?=
 =?us-ascii?Q?h5Ld2qSJjJvqfsD5N9qb/hftPIxAGP+QJXcAjmj1rRvh8Ik7ae/3awkIPNp6?=
 =?us-ascii?Q?tsVozu/BkpbGGSKKamHzJA/Tui0+UEURdnD5VyIN+VudlhUDKjd8s9Ubnbzl?=
 =?us-ascii?Q?eSXPAwJ7RqmwJeTQl0bRXyknm1a9ReMC3xTvMWtoGoGcFPJq5CoGbqX+Fd30?=
 =?us-ascii?Q?fcvAI/RuT0+WZGnrwKZL+iAh6dY=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 867e5978-6828-471f-2a10-08d9aa845828
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 11:12:44.3886 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QRrB064P+mh5ySJ9WaejO5LPD5PpJcWd63OgvL4Q740WhbEVcxADGBf3LleUhN5uBiFByQEHPm7LCg3voAyQJixqwsiq6Hh8B4eeIiaxbwU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1247
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10171
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 bulkscore=0
 adultscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111180066
X-Proofpoint-ORIG-GUID: FzIz5OLZIzK6Y0bjmJzXv5oyZCXLiaax
X-Proofpoint-GUID: FzIz5OLZIzK6Y0bjmJzXv5oyZCXLiaax
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
Cc: David Airlie <airlied@linux.ie>, kernel-janitors@vger.kernel.org,
 Sam Ravnborg <sam@ravnborg.org>, dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The devm_gen_pool_create() function never returns NULL, it returns
error pointers.

Fixes: 4cc9b565454b ("drm/vboxvideo: Use devm_gen_pool_create")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/vboxvideo/vbox_main.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vboxvideo/vbox_main.c b/drivers/gpu/drm/vboxvideo/vbox_main.c
index f28779715ccd..c9e8b3a63c62 100644
--- a/drivers/gpu/drm/vboxvideo/vbox_main.c
+++ b/drivers/gpu/drm/vboxvideo/vbox_main.c
@@ -127,8 +127,8 @@ int vbox_hw_init(struct vbox_private *vbox)
 	/* Create guest-heap mem-pool use 2^4 = 16 byte chunks */
 	vbox->guest_pool = devm_gen_pool_create(vbox->ddev.dev, 4, -1,
 						"vboxvideo-accel");
-	if (!vbox->guest_pool)
-		return -ENOMEM;
+	if (IS_ERR(vbox->guest_pool))
+		return PTR_ERR(vbox->guest_pool);
 
 	ret = gen_pool_add_virt(vbox->guest_pool,
 				(unsigned long)vbox->guest_heap,
-- 
2.20.1

