Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E804641909C
	for <lists+dri-devel@lfdr.de>; Mon, 27 Sep 2021 10:16:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1C32896E5;
	Mon, 27 Sep 2021 08:16:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5BBD896E5
 for <dri-devel@lists.freedesktop.org>; Mon, 27 Sep 2021 08:16:48 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 18R85GSH030426; 
 Mon, 27 Sep 2021 08:16:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=9/QCf8HSeELtt5fDGHi57DGcXSbcu0V4BAQwD8XZiEI=;
 b=CNlU88+I7FqtINnV4zPCThBWdpSHiUd24Glb0NtHEJXA/AGDZKKiGSkRhCHHx6lgmcgA
 MAH4PkdeHBHQel3iYNsF6YAwc+2eeDKN7zRH5d4uij/1Db9F6R+8V2pWAMVnXkxayGFQ
 veI5CXUzNXNBQDTIeIBdf1JmCcSNdL1nOa/ixvJ5i+bjrP+RjTXgGMdMURI+hKCrl3x1
 qhdDeLkj4R+sgymwVDBgzS1hK+0xa3nNZP6odhwDH0gBoX2kEXqDtY2Y+fCURhUZNgxB
 Vf68o8DnL1AVJ2x8KW2k9DFRz3WL1UgaUGDiPJw/NlGRBrOZ/eV0phnqQX2afOTKyuh/ mw== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3baqvrafgh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Sep 2021 08:16:45 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 18R89rQv159101;
 Mon, 27 Sep 2021 08:16:43 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
 by userp3030.oracle.com with ESMTP id 3b9rvtb59s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 27 Sep 2021 08:16:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k3J0IZPdMm2jHO+G+LbNT3aTvHOLw4IgvM2ZfPSmC4wjCpPXKY3XAvi7WKTmn2rJW/pd3jmJLT39UPb8QqqZYv0VhToyFAarOOLZauAaHwy38Uy9yRlfnFwx0hkMou1LwCd/amS7W5bv5/JCNTGbW524iYPn556JG5+QCavW9WTQVUjj7IAo67P4GnNOfE17nH4GzoTHGRvmAAtpplsWOIhtT9Ezt/aNxiISfZBtGhZFVvPLISGCHqem9+h/kBGJSqy1QtbmeviTqasZYByOYnmuS7DFmN/PtDBtgeBHtubl2O/2OGL77O+vNVU9VsjpxeLOJQmjUb4hd6cIHJS+gQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=9/QCf8HSeELtt5fDGHi57DGcXSbcu0V4BAQwD8XZiEI=;
 b=jDLqyPlXYP2Fvb7gRFvYweaHmk11O8PqNAV+BTZDGwTmcx1PyaxI36VzXxBHkh6UH56JWvKeXNnU6laH0f/JaTJGUTyodI4TBEE8i0NaXPQO3xRWsf2ZoPVwXsaDs7XbhoKhB1mfMluyiPt4T9YReZ+8KMMsOquVaKwwGijBSiGDwFNfRT3Yzggq0J3mim57sfNbVrePNBeCvkKlO5JtDdLufSjGpMeUzr7RMwPW4B/vWeM3n+dozutaoWYI25R0+zDfhoVx8wCUaOVyol9DKfbuvfqV3hlUFGOKsgvWRnEPq5n2mB5mY9DEWcLNqQIzkA70gN7Yqw+rHdpU8u0ucg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9/QCf8HSeELtt5fDGHi57DGcXSbcu0V4BAQwD8XZiEI=;
 b=dII8Ql9F5+aVuZRLZpLrEfWx+gWuzhAngfvhRB26STOv/L1Htv0H7RQ3opdBnRx64Yxb166qDwmqAbHcGih37HcbjjY7C8CK9kwghZIb90YOqtH4XgExdwHLlm6TIY3ttOUqry3lgAZDFEm7L5jbfHOShPkp8YtcjzE4ov4zsBk=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com (10.174.166.156) by
 MWHPR1001MB2320.namprd10.prod.outlook.com (10.174.167.36) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4544.15; Mon, 27 Sep 2021 08:16:40 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4544.021; Mon, 27 Sep 2021
 08:16:40 +0000
Date: Mon, 27 Sep 2021 11:16:28 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Patrik Jakobsson <patrik.r.jakobsson@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/gma500: Fix error code in probe()
Message-ID: <20210927081628.GA10186@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: PR3P195CA0022.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:b6::27) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (62.8.83.99) by PR3P195CA0022.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:102:b6::27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4544.13 via Frontend
 Transport; Mon, 27 Sep 2021 08:16:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 17edfef4-d635-4f09-4ceb-08d9818f2259
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2320:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR1001MB2320DCA5B9B765D4D7F8A7118EA79@MWHPR1001MB2320.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:792;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nR2X/lOL0ybMIJ9I80SegwaXZ0uj71GcAWQl4EF4mjF4SqpccHJqwGpE2kKxRMGhvsae04hFf/9c+gg7jmY9gS7MX+rD+NFFe/avGqmFexfGgwXZ7lGbPSAOKsLtVmyZCxwqisIRy3qajku0sTNHSavOykHkH1xB/VzjR8OgFdxhDpUpvB9KIIGnApZzWPjtAaBgwwP5Iu3SJr2VTRpBfynGwjIGeavXObiXMHnCPPPmoFihaeIGHcTYv8CUoQJ2WauTCTTdaShuag8IzzrXAI1/7rOljjpxhHbPab/KhCv4FBwVGhz9CHDs7TtGROYOIqLXiYnrwkBV5ybpzvrOL9SSlNLr26cjztKlP0x1JOLOWF+RWeDp5dk6ngmcDvoYhWVH/MJV0RPRkQ9bIPh7yLprnRwpLUq9BCExnXkYbQIoim5F8Iq8/vL44qV+P4YzCOMrIy9HFwvzkZ4+F1QeoglYmIBt807CWrDhMYnD1vgCryjByyxD1ELyaUTqOPWN0x2R/NuowAE+6OZt/GseVGUk5JE2D/iDwkm2njHpqmc2jTSnIHmYRwCJ+d5+t2cUMRRsFfwzLgmxiPef9bQfOhGXjqU9MoDka0c0E+0AFgHDFCg1svJGdX70wnfnEio0YzVPAh1rl9v06WgcCuTkdzL5RAqPFZMEub+x5O4XhU6KnyOgbyOvcOFrc/4UNBACPBahwVrRoSotaojqjyviHw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38350700002)(38100700002)(55016002)(9686003)(316002)(44832011)(4326008)(2906002)(86362001)(33716001)(956004)(54906003)(110136005)(5660300002)(6666004)(1076003)(4744005)(508600001)(83380400001)(9576002)(6496006)(186003)(33656002)(26005)(8936002)(66476007)(66556008)(66946007)(52116002)(8676002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Onv9WxT/Nmg+4QD0PWvT5+Mn300utAXvAVL+w4CxQmkDgARaacTHtMVQkZ8J?=
 =?us-ascii?Q?JZZKsTJC08U/b+QnI1iWxXRhxqfhF4H/ugc0zfTOeVIr3ZA76DPW/Xwvnu6j?=
 =?us-ascii?Q?Sxha1iceWq9NOcqGNtlPiWJoW4TP+eAc1Tmp9Sy5xxuLitr+SR70lT1OiAxy?=
 =?us-ascii?Q?dqax2w1VtfUGMEFI7yD+JXd0+/epM2OQXd71aWEqan7O0P76am1gOsMGHPdY?=
 =?us-ascii?Q?JUPlJ+WQMFZQsI3ZQ7YZyRQL9NOptn9UoOPlIeBa2oID7wmJPFYf9DqLgop8?=
 =?us-ascii?Q?moJayxFWRujbaxM8fjV8tSbQZq4prSv1DZ3KG9NWvtqdGhd84OZrW8sXsMF6?=
 =?us-ascii?Q?hLqtng0KAs3eBkGebSWXKDY35Vra65mSiX+ZfRsBeXMNf4Zm/aEPAePHq4it?=
 =?us-ascii?Q?FrYdFfpkm75brdMUNKibHdC+QwMXhT7IpCQGAg4zWkIsZIyE6se7PpM+D0Xp?=
 =?us-ascii?Q?3i5C8TECgpREFf01WN0lhW+TgAugmyrTdEPIqjYLNlUU8P5/QFF+lso260g0?=
 =?us-ascii?Q?3WLF6OxJcHyTPTV5wQ4iWKkW8YmQLxRmjU3IQHyWlKPmyciBYK89xALONQYt?=
 =?us-ascii?Q?vWu2jM7Qw0Sy6cwSZkADT2aNIAhFGykogyEos07tApaRTwMBjj2buVMr9Byt?=
 =?us-ascii?Q?Zz9s2oDM1ufxnnvXDb5fHcporumtVuzywb2KL5zmoW8YDgbBufwtTAN0ZQyP?=
 =?us-ascii?Q?DJZbSrvxj6GX/aBvw7eWOycwdLfkkPyKXXg4xdfwZBJ9i+vbLUVdvmh2orzb?=
 =?us-ascii?Q?E4qou5e4kn+GLCrMTESpX9iRYtqN9yX7XhQLER4oUHYH3fRH21JW6rq59aKs?=
 =?us-ascii?Q?kA9qQbbHiAnHjLUrJfSFI2nmd5y7nQnJtL/zIVifD+wyT7ghCXAKpWlMVS/P?=
 =?us-ascii?Q?Nf0gWshkbo1qpNEgbk+JdK2ttSwbdigSJkawyH6TLwVP6lF0AMg3gj0a/97v?=
 =?us-ascii?Q?r0J859E3U9Pcp/BFUbL/zYwKMQsj7TzhdRxi9LzFvqyuWcW+M7NMfAAJvkIu?=
 =?us-ascii?Q?w0pPdHL6vnYAIAyTTqvekB5aOsviHC4xOt7LLlOVERB3Usc+sy/cpu3QFu1y?=
 =?us-ascii?Q?oJZLTo2fVHg8A+epXVQ45sKO8XrEZDTGDvsjkys1w8BG70XdKeU78ystjlDf?=
 =?us-ascii?Q?RXwLJ1uGRZ4T13Rr3++3dfOUAceQlx2ZdjQS7VAXxSwmQB1G1ZD4V6u4Dh9z?=
 =?us-ascii?Q?JTerqdqzzElcgKzFTy92ydvHksrWQ02A54x9PDuZHY3PE4esQ99xItyUELuS?=
 =?us-ascii?Q?woKAn3Zn8wSY0xqM7xcse2um40LNvbqIPy/ewSlwxT+ZGY2BDq/ttGXAKCy+?=
 =?us-ascii?Q?aKnWC/xXVLrAH+WLWLI3GDRH?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17edfef4-d635-4f09-4ceb-08d9818f2259
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2021 08:16:40.7809 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J4jr+1jRT2uBXHvgLm2ofarkJx1XxeQVRbzhvj8gmH0lNgxtPbjqbQu4nBNnJObwqM19FtY2aAqU6tQvexjlxuAd392d+9AjyWhh9rAOpdU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2320
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10119
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0 mlxscore=0
 spamscore=0 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2109270056
X-Proofpoint-GUID: TpDw7l04Dxm7QzHQDUlFX4BhsSybAjtx
X-Proofpoint-ORIG-GUID: TpDw7l04Dxm7QzHQDUlFX4BhsSybAjtx
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

The error code is stored in "dev_priv", not "dev".  The "dev" pointer
isn't initialized yet.

Fixes: c2f17e60cbe1 ("drm/gma500: Embed struct drm_device in struct drm_psb_private")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/gma500/psb_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/gma500/psb_drv.c b/drivers/gpu/drm/gma500/psb_drv.c
index 3d036d2a3b29..7a10bb39ef0b 100644
--- a/drivers/gpu/drm/gma500/psb_drv.c
+++ b/drivers/gpu/drm/gma500/psb_drv.c
@@ -454,7 +454,7 @@ static int psb_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 
 	dev_priv = devm_drm_dev_alloc(&pdev->dev, &driver, struct drm_psb_private, dev);
 	if (IS_ERR(dev_priv))
-		return PTR_ERR(dev);
+		return PTR_ERR(dev_priv);
 	dev = &dev_priv->dev;
 
 	pci_set_drvdata(pdev, dev);
-- 
2.20.1

