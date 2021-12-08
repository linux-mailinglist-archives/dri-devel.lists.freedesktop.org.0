Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FB9946CE60
	for <lists+dri-devel@lfdr.de>; Wed,  8 Dec 2021 08:27:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE03E6E99E;
	Wed,  8 Dec 2021 07:27:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 63C126E99E
 for <dri-devel@lists.freedesktop.org>; Wed,  8 Dec 2021 07:27:53 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B81Uh4u002860; 
 Wed, 8 Dec 2021 07:27:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=tP6uhSvHySINEU3Z6hlCf/8EFWFwlWEnJuniTfnKdcA=;
 b=vHNPCUumh9FciYl48Cdb6iyN9shdVq9O5QSP0BcKodgryEtRggmHl2FO3gXtIYsraO0E
 iAN88ntMEmxEAFFcpitvdq0gMl6rRTVJYjvnajKJxGzIxNAj5rocXDjk5zB2hJLEnwSn
 z5I/BbjZIuD+dgnHrdAqaihrX84N6sX49tzYYRyId65It2E3NBK+UL95KICGaYS12ywc
 nzyh/kMMrE3Ud+/wG7muJ541FSJrg830o7T6td7xvEZzBAb21eBwkjKHmAIsDdXCU2FW
 n7xiThzTsS6Y5gnxefwX5gY0OQZo6mD7ZMl0GiOBOElPSn1ip9RugU9w4n9zi2Gh++x7 tA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3csbbqqw42-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Dec 2021 07:27:51 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B87GhDO121173;
 Wed, 8 Dec 2021 07:27:50 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam12lp2173.outbound.protection.outlook.com [104.47.59.173])
 by userp3020.oracle.com with ESMTP id 3cr1sq8vv1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 08 Dec 2021 07:27:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TSVDkRf/Knx55aKdxyMpFXU3xFyVt8KT4f6jmdXbMFN6k+9W5vqH7I5Ci37CWAqfe52m48l3rQU0R1PdpQG2FHtvxyEcgVqD7AwFzhXTJFqRpA6Si6USAtFjSMm8gOcQBYeisWJQXTawmRJXGywohFxP7rtjfUxQISZlwlznG5jc4hmiuqYkLRWlBnJEdm5Bpvmc4YO+rzH26fMOAT0ogDQItsbKehorK44YrDu4z0BjbnI9wBiU1XaaG9TMl2ijTeAF40twgKQqXes8TbdwDZ9DFgrh55o3kFiPmLg6r+5j5qMhg2iNfN65HjO7jIuSufu0sSiFSrtGDdX/kZ3MlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tP6uhSvHySINEU3Z6hlCf/8EFWFwlWEnJuniTfnKdcA=;
 b=PsWxuGeb4pB7bdBeopZgMwSmJnjB3LZzjajFzAYqeCYrD3NfiovUEIyP3ZpS1APwHf5yFzaOWzak8upuQ4H/nmZHcyNmKfFbCeqRsh99arrhm4DbJQRRIQOyVX4pWOJRHw9uiOnExFi/KugwwXRk3CUe7ymG9YG+giA/z/4ASwSt6wu5Kd+6EgeVuhzsNP6VQa0XMtkqZ3a8WfeleDcA98L2Jn6q3DDcahLZjZm0Rx4Gf4tquWWZbkC1mJITgHAigo3xwkx5tpiXaSKg8TtBjDC0rauY8VtpjSN0M6d4v58yPmgL8/WxJURKM1E0jKc3+R36ln9tgqV7YTmkWg/gIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tP6uhSvHySINEU3Z6hlCf/8EFWFwlWEnJuniTfnKdcA=;
 b=IX9texMwEWesJJTRAj1stnFxgZadvr7eVfq8NyTs+3wYRUU+RI3WO2NdM5UTmMBYyVvGWDFVut8Ax+94HqNtDg8hjprwRirtMD4mySLJzgDLrMvhVt9kVCgVQQNNpc3R95XD+zWumEaEJM3ynIJfn9BofEc/umfKF/jHNBrm9Yo=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR1001MB2159.namprd10.prod.outlook.com
 (2603:10b6:301:2c::24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.21; Wed, 8 Dec
 2021 07:27:48 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0%6]) with mapi id 15.20.4755.023; Wed, 8 Dec 2021
 07:27:48 +0000
Date: Wed, 8 Dec 2021 10:27:36 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Antonino Daplas <adaplas@gmail.com>
Subject: [PATCH v2] fbdev: savagefb: make a variable local
Message-ID: <20211208072736.GA17615@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0127.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::6) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (102.222.70.114) by ZR0P278CA0127.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:40::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.17 via Frontend
 Transport; Wed, 8 Dec 2021 07:27:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f03754d0-22e9-448f-0ac1-08d9ba1c3bfa
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2159:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1001MB21595C10D0AAAE23C0A85B4F8E6F9@MWHPR1001MB2159.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: og1mJFLTLkfLM7epNOSEAtyLWdvBfpLCBIYxC9mMVv/a7OsvIAGSAxjIcWMQom0rlku6913iJSBkzKEwUB0fCDdpwIL/YokubnVVOKLkcVl5mQoW6sYwts7PAnzfGwdGERdJs2dcOi3f3NmczAJ6rZjcykk+KiFbua+zR19FZDAkZ3cjG1L34gNvaBUfs88tPXkkCSOufKKG3JDFsUV2pf8+VmUA9188iQLsR4+B5C1cCdukCFO8k2KEiZa9VP4PKgoqh8m0AunK2Hzt6RS6kRzrEPIUdaZy0JUX1wXb3/Zh+SDwAaaLpdd1EVJ5N2HIYAy+JhIqb5Bnp77+f0i7XeoDIte2nI6zTKkVlDk/btC89hYTMlwdLuU89bQFuG5UrJvwA1PorvYGWfCdqJxWUiYMcm7mSmNljZRUZOYWvSGIeAzFiHJrS6mZjQ2pJCMdsUiveaYMXFMX+zfTTtWn8MwVjOuYo4z7gFB+oiTh9i7H70IVvmbaMTTHR5BQ72VD/ocrZkrQ9wDJgJkTkC1IkohQ5wVP8AbPDOklXEKCEzo0fqM+XhZ99a3l8zbXgwO4T7gbnvU9OSiF4G3xNHhOVqqZYO+imF3qK2ihXVxpe8fzDSOXf0pFkDkoKDet34VCsf82BI3CxXUqLQpSJJTBmejkOvArufWnOeuev7q8ooThXM86hTsxNd0WTHc2wRAGzs///RsLgG0OlQBHNiSfHg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(33716001)(316002)(5660300002)(6916009)(83380400001)(508600001)(55016003)(4326008)(9686003)(9576002)(6496006)(33656002)(66556008)(2906002)(186003)(66946007)(26005)(8676002)(8936002)(86362001)(956004)(52116002)(44832011)(38350700002)(6666004)(1076003)(66476007)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WmzRyf8uURYunkgiKvVKehXAyVvEfE2w37p6fYrwMXQBqQ8cpH5lCks6QtMY?=
 =?us-ascii?Q?LC8cxRWWqwdNF4/04OKpSWSdxw9+dgkwd0SPihKt7nWvcdzNOcbb8s9vm7gs?=
 =?us-ascii?Q?POzf+RmbaCL1RaAd7zHB3b9Xw3tlkjvVUR/t+sYZYxHSC4ynM8yeZVH9Du5j?=
 =?us-ascii?Q?YP1Cz2iw6ZzYTYE4aHToRogpfII/9Ih1NAgXyPeQAqMHaVZOTmNWZPvYEL9O?=
 =?us-ascii?Q?DKg6Fx7OShMigtTg0McM5jovrrZQrbCKsFAjc74RWhAK4ilE7q6VIve2iM0e?=
 =?us-ascii?Q?/I8ORXkd26619H1xbvgUI5ldEyYl59FYeocJGDvV1tqsbfCWJ0NXXEeFrLX4?=
 =?us-ascii?Q?HgqTxbD7b+tKKJkt4PEGFYYO0cZXp3v2bu1b0yBS2d6JeD4SUZUti/sCN4yR?=
 =?us-ascii?Q?grIs9IQQzucWTXzWM4UFEdg3A72TC5tZjTCAMbecQQCh4P4Xu+a0E+Hu9nSX?=
 =?us-ascii?Q?oGbB3x/aFVqFGLr1/ZLbg7AxGBypR5kebOYYFEellphDP5d2M/AAwyqzlW0T?=
 =?us-ascii?Q?2GdFYBInbgr6cIl27tshbw+bxQvxKP+mZOR3+T8jP3BTcmL1zdMDmhbay8cz?=
 =?us-ascii?Q?KvbW0+JwM6fOMCRfYWzTPD8xNdO2wCjlbXaApg4G3P5wvvuMeVNr6PwtmTtP?=
 =?us-ascii?Q?O1CCXNqkFFljEEzAKFjwvTQpp1EKLPgivFn97F6THgnhRFMggfGz8LYKZfvo?=
 =?us-ascii?Q?XkCDQB0z22WlK2zHFBdIJVwWjmWI0o9FtY7+J3nqpuSdYOBLrf5wwiyFQPTl?=
 =?us-ascii?Q?94SuVjY+lHFCTKcsPMlzEldhv0c2UCGZP0Jdzw9+0X5dXTNsvcu8pgPPlQLE?=
 =?us-ascii?Q?/ZMmsrUUrNdJsuzLNB5ajvqsjQzxm5J5SK9Rm9qF+0os5ULf2jdubVCWnf1R?=
 =?us-ascii?Q?WRmL9y5SlksjBpVPmSWv22Fkx6WF5hWiU3+Ejg5KowV7UG2C9F5zJ93P7w25?=
 =?us-ascii?Q?LWYmwGCLi6ftfJDPsD1zf1ZsNo5GQN7ZvhO8PY7iJYdPmyY/4qbWZa8YlNo9?=
 =?us-ascii?Q?xHO84+NXWPzpMMgjPsQEcN7KSjVL1XnEeIrDeLe4gvzi09PTNAIp7VrDfoo8?=
 =?us-ascii?Q?fFifg1dBFzmsR/SZu3rHPmsR2bCr0j/PBqKWpWIVDHvESzor6gfkKpk9cRrd?=
 =?us-ascii?Q?Yx51aO8Pj9vQlh/b5TN36UmemrYwf5+sqeaP/VVgqAgzWBlhoASdNQ51HpLA?=
 =?us-ascii?Q?mIXchTIf6bqH75jr1knZSrpB8OgDYgFZVD1LSFTyfjwMextWLBA+j27jm27D?=
 =?us-ascii?Q?RtMt8HVKShuhL5B9KfIzW0j+9PX6sWAEaqAowK2RZUedPHlFxK+Q7pp2ToS6?=
 =?us-ascii?Q?XbIIDnsHHjf2RONxKV3Khii8mmYPuUdGxGx+w2JLqSeDdvI5gPwpOWfMvFvs?=
 =?us-ascii?Q?2Mr1a7pRE6UzqNQ9+QTYXZBd6ir9foZH3AHLw2LQ+MAqAvRaWOyV+GzCPm3e?=
 =?us-ascii?Q?g4BRd5xF5e24Gg2gAOW3gB7IaNvXiU72rozzPm6B+REAmxaDym1gE9RXpAOC?=
 =?us-ascii?Q?uP/WUVqabZHWGJ7lv+MAcQQsjtFpcNqY4aL4hcvFBC6lfDfp5C803YhzhC1S?=
 =?us-ascii?Q?R7dyKJxrnYR0R3KayX4ZYfNXGxIVDmzYAklm0Ln5O12MaHkoTbXkp3BTzZYr?=
 =?us-ascii?Q?nTZYF2hgBc/xkOUN5JhTwZeJuVzyBuAaLQpdkG1q95EP2JSX5pGZ0expP166?=
 =?us-ascii?Q?/8fV8qgc67lgZW1AMokKXFYQJ28=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f03754d0-22e9-448f-0ac1-08d9ba1c3bfa
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2021 07:27:48.1516 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9D4Agin/dvbgQf6B2FgKq/7h/QDl74BOx520GrzOKoAeHSYHz1i1VD1vf2G/MZ/JQkdVeqjJBOaQrQ/yMHrePFG0Nk55Mtcew7j2MjuZGlg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2159
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10191
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 spamscore=0
 phishscore=0 bulkscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112080049
X-Proofpoint-GUID: 6eKZ2HCoa-eOA5Aw84dx-CL4S2d5qlgQ
X-Proofpoint-ORIG-GUID: 6eKZ2HCoa-eOA5Aw84dx-CL4S2d5qlgQ
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
v2: use __maybe_unused annotation to silence an unused variable warning
    depending on the .config

 drivers/video/fbdev/savage/savagefb.h        | 1 -
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
index 0ac750cc5ea1..8114c921ceb8 100644
--- a/drivers/video/fbdev/savage/savagefb_driver.c
+++ b/drivers/video/fbdev/savage/savagefb_driver.c
@@ -2170,6 +2170,7 @@ static int savagefb_probe(struct pci_dev *dev, const struct pci_device_id *id)
 	struct fb_info *info;
 	struct savagefb_par *par;
 	u_int h_sync, v_sync;
+	unsigned char __maybe_unused *edid;
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
-- 
2.20.1

