Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EA184210A1
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 15:47:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6D6D6E1D6;
	Mon,  4 Oct 2021 13:47:45 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B9EE6E12D;
 Mon,  4 Oct 2021 13:47:44 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 194DTTns025135; 
 Mon, 4 Oct 2021 13:47:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=8eGp4+4ijrNms4OBa1jGIA6SuuU8EOoiGV13OIKqzWw=;
 b=FP4Stqt2f8YB2N7Ag+6YxaUiGebLAyL8NwEU2H/wf8hd12HtSNFsTG67IMuSalE/Wz40
 P74Npon4rxuwecg8TWBYUHb+6a3qkgBx+JI9dLT9BtnH3y5GsvrBydzQSXcQldRR/MVO
 8kXA6+3CTRO9lhCYbkju0ZXHcFCVkErDvku0sQOBo5xL5bz0OvfCeMMwxKaaWOAvXa+Q
 v+v8zTrOVv1OtpjNb5LyYT88IJ/aDfee1ZznKJzNc9LRWjE5QdtYLYE9KZc7bzvPQwXl
 EMTIJ3J2WPJHFqSJBWC6QROuPR3A+MCE/FwdqwpQ/ctVEDZmJ+vRMJ3Rpj75ukYhAFMS fg== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bfabhvbvj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 04 Oct 2021 13:47:37 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 194DeF7U112886;
 Mon, 4 Oct 2021 13:47:37 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2047.outbound.protection.outlook.com [104.47.74.47])
 by aserp3020.oracle.com with ESMTP id 3bev8v5syx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 04 Oct 2021 13:47:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XZV1QoAyf2f60CRD/bvLagTkT0IBQa9bkaaMmKJ+j5jnhbb7YQZUMXlU3BSmaA5B4JMKDJ2iC0nTW4myNghFS8nVlA4hz0loT0vZJJ5U0ARm8h+vzb8UR5zzMPXqUQPYkhmabpdmP09vAUoHhRmbLBGHEiD5QVQL/l/sYCwvOdIKK0r668yboymrvtCo7XppfgKEP61jaO3yW6tuaCy/f31eA+JD5M/i9/KFOzTpEoBTPaexjA4CyszmEWlWtWGMXuOJ9qT05145Qv5FW+NSKJkegrWI5DzAR5frYxYFLu7AMu0/PcpbyslEbB0v3fEvAA/qN52YftCAb87VHg5T5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8eGp4+4ijrNms4OBa1jGIA6SuuU8EOoiGV13OIKqzWw=;
 b=e9XbuSVJbuYplCNu7Diah3hPSlWOTYhjIHkreFMKC9OSsIOqqqonkgWa9GDIT3HVfpmgQMCTH8DpqAIEQXy8r8q2aM7A/0xBHgC8uvQXdEMBJRDkwx4l+ZTGEp/PwLmNeLoSPIWPHt7lLulWTuHuAovF6y+Br2+eSHZQatMj8d6+ry/E5txHuVtV4p7u4t7QLivORQEkfZDsYkOSFbGCcZZG7jagJdLpIn6ohn6ImNdCmjZFxMF3kQY5zH10vOltwaWbbytqq28QzknFGsgGSBZQAQ7WzFrEJojEDuH6HiDsa+/U9tsqWyiSBiLAfU199G9LGb+XogyMGwNSnETt3Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8eGp4+4ijrNms4OBa1jGIA6SuuU8EOoiGV13OIKqzWw=;
 b=VOxCzfC5okN23jq1S6fGwWLu98Akn6Hc9iKUtLbVxnQLaik3/D/uH1YrIjfkPG21HEBjM9DNBZeAYk1tNG4dmiZTRsJ7yRxmo34aK/UYpdKd7Ly2i12zCebX129YgISQrCVhwxlVo16tFkGsp2YBz3EfRyqrnDgnzoSLUcT6JXQ=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1949.namprd10.prod.outlook.com
 (2603:10b6:300:10c::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.17; Mon, 4 Oct
 2021 13:47:34 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4566.022; Mon, 4 Oct 2021
 13:47:34 +0000
Date: Mon, 4 Oct 2021 16:47:21 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>, Lee Jones <lee.jones@linaro.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Archit Taneja <architt@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/msm/disp: fix endian bug in debugfs code
Message-ID: <20211004134721.GD11689@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0027.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::14) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (62.8.83.99) by ZR0P278CA0027.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1c::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15 via Frontend
 Transport; Mon, 4 Oct 2021 13:47:29 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 56106269-ec10-40cb-0a0b-08d9873d850c
X-MS-TrafficTypeDiagnostic: MWHPR10MB1949:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB1949027CA1F8B815E899D4768EAE9@MWHPR10MB1949.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5516;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AwrnCzowou00ntkKFWIYycLc9OOyw7zFC2jSsKHqXa3Xm8tGp2F+2WG6AyKQt/GDyRqN9NlLa9aSGses/YwHf+YHpra7jZcEytU/2e/hHFdFnROuHITB+6YFm7i82o05Y1All9z12JzII8lm75WFV81CKPEheIWDgqriPk4f/NpU4o8ZzLCmf7QtwJ+Z0zhZyQNVahrgWRKPXm4zGNXT6I0hoUjkSnmT08FrFiGCwJnW3BjifNUh9M7IjR88YGSSRVfxEYEmuDUCbWDtyKwJborqEmvWSmAKMVNZn2dvHEsf8ajorXtoNxf//7w1xhF6T6IU2zWtMHztQgv+G6iKTnhFQOOfEj5LsSnABy5P5WvUIJOAWspMvNcnO3QFwsI48ZHzKp5yR8GjLlm5ki8qXrZUaDHjuX3L8tfu1MM433zArHBmGcm7JlumszP5J+zlNlok0uzRtAtyNMUsPk9a4PnUBaWre0/gidWuYVjleQUfOxIn/cYOmLzqHCDDKXgM/b8aHTejDph3N99rnxb9O6i7FgtPoAlKud+C9PJFg/R4UWjbfR7zDoHeYnBqTUPk/m7CxHBXNRVMFUaFISHHZXM6jCoKTaLFGqgM7HplBoQnyT8EAabU2JHDiL3hc9mY5onDAtja15PJRomFrEeY+JkfgjZB5Jqb1vFNbiXCLASWBnmiVQD357lIb+mbqSis3wsZMiK1ht787C0HWlwrQg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(33716001)(26005)(66476007)(66946007)(6666004)(8936002)(4326008)(54906003)(2906002)(44832011)(1076003)(316002)(9576002)(8676002)(6916009)(956004)(55016002)(186003)(38350700002)(83380400001)(6496006)(9686003)(33656002)(86362001)(52116002)(508600001)(38100700002)(7416002)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?hyC+jsEmniLRdvK3BYJ6dRtovjwRjKsiU2s9LggRYVZvePUEOPQUY3ry6Y1i?=
 =?us-ascii?Q?vcmSVqHARMXWe5V1or53j1X7y6Mbmj+CdyylRFBljoZyghmf7Z9Qz+1caqCs?=
 =?us-ascii?Q?2LY8jW2iDMdwRaMrVwhrkv+m0RugV8ixn1pB835JUxQqfnILD5c52kIvOYpB?=
 =?us-ascii?Q?T+DxGF5UFgJFWTILBpUUF0VWAc/072EvNqalSlhb7VOvq5H5WugdvgtM+8mU?=
 =?us-ascii?Q?zr1PtLEjiQuRLmU4VnH2zxzz+zMnlisCPzWAsyACedMLPGYM126eNyB6VouN?=
 =?us-ascii?Q?GD+/vuh+vAp1UJmuAFZvwnOEcc8O41/Hq1B8roxUYjUFOsWeOmFvBM8j21P8?=
 =?us-ascii?Q?VJnnJpe9b3RFRjTTkM5rC9VnIPeyYmomYqlkKTPglJpsY0hCIeOlHbdCTtQ/?=
 =?us-ascii?Q?XGuyI/WRaVcSwH4KemwwgxoAITDk7Z24PGB2El+uttOYL9tnl58iOaivUj5F?=
 =?us-ascii?Q?h/WMaKnUaSYdsO/ocGOiw5iVhBat/BKcPkN1FFYKvJKaEvV2vxWPy1wVd+Gf?=
 =?us-ascii?Q?zfKRp0NMHzfWzql8+GVVGsffuENEbsjAspYyDJqLaxU9e6FgxjW+DT1KAWuT?=
 =?us-ascii?Q?Hy/D+AZzUZSkmmVqF9EzakTboI70rqivcDW8meSqHGaUQUnbiIqjOnDtkVaJ?=
 =?us-ascii?Q?j612N5upBBkgW75ksIf2/UcjugxZqwvS1W40AMfwts2YEGMN9F16BUbQ0imG?=
 =?us-ascii?Q?XgSAwYUVqkrH2Cxc6B2dyqCs097abMJbMS9Zm6PlFtG/NKQCxHiBmYAdeHbI?=
 =?us-ascii?Q?i//bPN8arHHgIGJ18xb2o2sMqiIc7bq+VSfWvZc/wsdp5YEDhgwt/zKsz/Bv?=
 =?us-ascii?Q?v4pNFVnZYzVHMq6llJG5XKtEFP435K4/reqal+2fIfoV8wl9l4u8j7J0huLw?=
 =?us-ascii?Q?6vNHKKwLQwp2+ZZL757cIwWDC72eDtcxOYTvr4fqtnHAaze3wPv0nggyRGqW?=
 =?us-ascii?Q?xQ9npxWvLFZ+V8U1yY1YN5KkrxzEJGg3N7wSBlrWc4kE8EutyNvxditv5Zbo?=
 =?us-ascii?Q?zBcFPfzlgI5odDZDtzLf/NEV7WOyVKwvbCzQg7eFKJzkWYXJxdSnPkkQUzZI?=
 =?us-ascii?Q?oaaj0PZwijU/CmUmaCMCHQY81QPTsG59OS9aToeDLp4sV//tI+V+F3RVEBpO?=
 =?us-ascii?Q?CkhvExuyrASkQRLNYNs5VSUzJUAGMdLe8mozy5r21wRYZLHaYPZkvvVXghDz?=
 =?us-ascii?Q?WT/Ykmec0XxZ5Py8ui+A3hx11l/30qsq8RzXN4p5YEmmlFftfOOjFIkKs6Qp?=
 =?us-ascii?Q?8VzgO237St/YDHsV7yeMiGTbEZpy+W38ASNQn5ABBV/c32MqIVCJwLXuTLJC?=
 =?us-ascii?Q?mx6+Ji0oPgCVH7uZkWrLPoI/?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 56106269-ec10-40cb-0a0b-08d9873d850c
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2021 13:47:34.5908 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5hfqrg8LBhrPsl8mnL6Ym/8+q02lCLKZsPkG3PgiQf+bnbl6OuuLV5czrrENKHqFcSVn8Y7MSoKWzd4K4zR8mXyQNTyf4N7hLsIsJ8vmDio=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1949
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10126
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 phishscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110040094
X-Proofpoint-GUID: pbHrvArVYyyb1X1KItFE5RCosben3IA0
X-Proofpoint-ORIG-GUID: pbHrvArVYyyb1X1KItFE5RCosben3IA0
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

The "vbif->features" is type unsigned long but the debugfs file
is treating it as a u32 type.  This will work in little endian
systems, but the correct thing is to change the debugfs to use
an unsigned long.

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
You might wonder why this code has so many casts.  It's required because
this data is const.  Which is fine because the file is read only.

 drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
index 21d20373eb8b..e645a886e3c6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_vbif.c
@@ -305,8 +305,8 @@ void dpu_debugfs_vbif_init(struct dpu_kms *dpu_kms, struct dentry *debugfs_root)
 
 		debugfs_vbif = debugfs_create_dir(vbif_name, entry);
 
-		debugfs_create_u32("features", 0600, debugfs_vbif,
-			(u32 *)&vbif->features);
+		debugfs_create_ulong("features", 0600, debugfs_vbif,
+				     (unsigned long *)&vbif->features);
 
 		debugfs_create_u32("xin_halt_timeout", 0400, debugfs_vbif,
 			(u32 *)&vbif->xin_halt_timeout);
-- 
2.20.1

