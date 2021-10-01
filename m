Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE68441EE06
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 14:59:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08C2E6ECD8;
	Fri,  1 Oct 2021 12:59:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 913316ECB5;
 Fri,  1 Oct 2021 12:59:24 +0000 (UTC)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 191BTgmX010057; 
 Fri, 1 Oct 2021 12:59:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=eJ4uqxBMBdiBM7NHOPmQCPjuFh6QxPe/DKone6NlgQg=;
 b=wTQB4sNZaWrs/7OYNBDWS8cGjrum/ipR9hIrhC0dia245qLsD9HEAgL1Mi7nmQv7/Rdx
 +bJVS5UxHFlVdIHAW38UTW8dJ/heSL7K7Xic0//zeTL5mNuB3a17zX0JGMqDJQgAeklm
 JjNgvHZBQPJhjHfvfnExf492LqFs0hUfKweY3xsCQ0/V/tDkgQ1WZnwRGSN0aKoO9lKh
 KT36JoNtkStyV6b+4ETA/vQ7dKdEeChrYJspV9FV/tdaBcWz1qMXtmXm8HAsMRnQJEQU
 Yq3BZE1PHK5mcndsJ8h6ub4qgrbgWtv9TOOdXw4UT/3Ix0sqwm3CVSqWsfFd2Sr3hJdM ag== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bdb2drk3s-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Oct 2021 12:59:20 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 191CuYK9072299;
 Fri, 1 Oct 2021 12:59:18 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com
 (mail-co1nam11lp2171.outbound.protection.outlook.com [104.47.56.171])
 by userp3030.oracle.com with ESMTP id 3bc3bp5aq7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Oct 2021 12:59:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i1j0YXI7SoYpfFOPuP2LkJTxVSVkASSHW2NS7YndzvGHpi0tZc18IHFVMSDW8WajkiFik7aFs8fEJ40qm0IxvprS0giq2Hiv2v1/FrVQotmawKrQrllzYa5X6ET1Xy4b3VWDmSNR8sf+hmfJYP7268U5WlVKFA/RTHs98f2C82EQ5aTkcA8m+twbyVQFpI+SS7vmz89aKlU/9lhEmPY9sGY0tRceassKf0R4vrkq9cdyLNx3HJ0n4hVtMfRlwd1tQjeDiwvhHwC9DkhR+r4vB+2uklXQON+zFonpJEIDTTe4RNw6gm4yqp89eTVobPZnaYqwNX4TOdw3HaTE7Dcg2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eJ4uqxBMBdiBM7NHOPmQCPjuFh6QxPe/DKone6NlgQg=;
 b=ZLw3wESD9KCqq/6iUfrB/ZjmTWyE686hXKNUO7gDOQMa8W3nGlmmLDvQV+WDs7gQgEkmTZ7BsK0hBiG86sVEfWXaLO+33Rak2RF2cc1YdW3cJXv1MNlVCtuJkW0AQMLtqhuVYu+K+omDaJtET/Zmobm4+RCdZPrcAWFnvDldD2JcIqqKm9mALLoamdFOebfevghL6iyAVtpJv/pYI7nREmYaq90h9TJoE0z+zYseDONni9IRAWXNO4HC8GFowIBYETLuEQ7XFkfOamAKQ1zH6SwMrS8Zeo3V86QvH6YvkWqjick/xSpc68qLW1qvlmOWFXyunvFB0+FDuoyS2FzMUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eJ4uqxBMBdiBM7NHOPmQCPjuFh6QxPe/DKone6NlgQg=;
 b=lhOwJBlXkt6TryE45xi5e0ByfuC5tedAohbU/r98V1vT3S4LgVU5BUCHdnXqhausZpYLM3WmeIBmbdTBymZdpCc0BFUDIKLn6sBxAwQmkQUVKudOOXFrEtCGjKhJD93hjKUGd4NEniCjv8Sv95Vf4Znnb5hC+dnfpgmVQHLMEm0=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO6PR10MB5476.namprd10.prod.outlook.com
 (2603:10b6:5:35b::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14; Fri, 1 Oct
 2021 12:59:16 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4544.025; Fri, 1 Oct 2021
 12:59:16 +0000
Date: Fri, 1 Oct 2021 15:59:04 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Rob Clark <robdclark@gmail.com>, Akhil P Oommen <akhilpo@codeaurora.org>
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Iskren Chernev <iskren.chernev@gmail.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/msm/a3xx: fix error handling in a3xx_gpu_init()
Message-ID: <20211001125904.GK2283@kili>
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
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.19 via Frontend
 Transport; Fri, 1 Oct 2021 12:59:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 716ad3d3-f6b3-4f4f-123c-08d984db4661
X-MS-TrafficTypeDiagnostic: CO6PR10MB5476:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO6PR10MB5476E2E43FD57E736676F9378EAB9@CO6PR10MB5476.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0vv6GwVBqxsB/j2Kyfkldb6C8IqBwu2/fYTvZ6Ys+49j5ogWgd16XwAXGOEJTLqQbKJeR7IVaeRMlZMnXP7hIqXEU6INWgFT+cV4XbgS8eK2SKMZf/Ibc/DNfQLFPZiqyovu7vTsGOuOSBNtQgGOApkkDlM+LFOZDihUbIaFtetZQyEvC67dFDMnxOCAz/jHbw3p+6N1jNBAMo/NWEoqGoT8bLwG3acQLg4JThWqwvOcHdp5dZ4JE2dslSwNVsc+3KOwIXrpK6wIMfZYWWGuwWDus1RKWLsGePeKw5YjoyLF2u7/zDXZzZrv7av9c8WqjooCj/yFKm5Am3h1gZAz+MQudJupcyC+h9zV9IkH+WdeGOfT3C7jAMg7FJRVHPNk+UlolEVxtSHBK9i3J13Xw3taVxWBdPYu4APTt8ejkknXKnbUwTKWeWhF42C3zEPkWEUGqHRdi0sMR8fXhjDruOkZIC3AOLyvIDhq7FgoieG8aQVXBgjhOBWoH4XV0pwCduyiV255svJEvy7HhGO9ZKH1BqFccO//Fo0sqo1IqWcecgjQcr8sb1YjPotKyUxiKSGsDa20b3me9RHwdbXBcUe5wrVDAcElyFsPP5o3JJ5uirG1Q/xXbyLPZ6dEiLtY/18wAFdDyHn5A/XYm9ByoiyytCi8FTdC394BwwWtV+dqjZmaN1pF3dhhlSYJGJWuyEg112RzJZh9lgBOekjtIA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(8676002)(186003)(33656002)(38100700002)(38350700002)(83380400001)(33716001)(55016002)(4326008)(956004)(7416002)(5660300002)(86362001)(9686003)(2906002)(316002)(110136005)(52116002)(9576002)(6666004)(8936002)(66556008)(66476007)(54906003)(508600001)(66946007)(26005)(6496006)(1076003)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yMky2T7nAjH93wgI15j/3/XjPvp7KeQ8I2dWAM8Woy7+CtFkUNTKqlkDCXqw?=
 =?us-ascii?Q?H59RkOejValIiliUavpo/wShAw9nXHC9VFUdmvFLn06GSz/FF8qq3HZHXZwR?=
 =?us-ascii?Q?imxP2t149LvZK1lfUNxCLQ4UMGAnSgmG6rnYRjM1RsjIfCSa1b3u9WQCcPDL?=
 =?us-ascii?Q?ulvfr5w5pfvFP2uaJ0TujehxBnn3zrhRdmXvH5AnYQo5DUH8iLktzH+JhzMp?=
 =?us-ascii?Q?z4uQL8IhilaECnX1iF3VHCiV6K983jn78z2rzjH7dPGQZr5ztNDQO6SMcka6?=
 =?us-ascii?Q?uooV+bTjqt0c9r/k1oNsETHItKmUdTJ2EzDSEss5K395rIltsEbC420K1p43?=
 =?us-ascii?Q?coyvNGcYLjQqEfiTix1cgcWMR7PTZdGuVhOICY6m6+39qFvR6bOmQ93QU72k?=
 =?us-ascii?Q?SjicaMhMb5AEvTPdCuPCnw0H8jen2y5/LLDVyOaIs1Bss4XWsVW42CcokQ7B?=
 =?us-ascii?Q?K0S9q1eVOTouox2Dkw0iFwqD9ZZz01MVtcZaBbl1ZW3fZuirPFYwQAMhU04u?=
 =?us-ascii?Q?5WuuHDR75u4O/9g4zNSikmbW81+SPNuedYUr4VLYKLQsib7al1t74X/Y15KE?=
 =?us-ascii?Q?1sg0az8Kan0t0LHvPlMjhwkQH21ztMnFlgZxFTtbC1Vsv4qF83Vas2slk2tK?=
 =?us-ascii?Q?7h/ggsObrXxQ9lqFg9G7nwudx/ekG7KWeMz7aKNjcOlChn2LOT/fUapDntzQ?=
 =?us-ascii?Q?hf8Om1dKH/H3roPlF7OYQ7Deq+0QYBjUdGL3vsJadSJFkYImOWOdr3Hxz4S2?=
 =?us-ascii?Q?ZhDrCyTuF+NnuDD+MyY21sG7t8KKrG71aMjIbaCqY8UgwuQyAXOfurIaz0Uu?=
 =?us-ascii?Q?uY20hS+1FCua9kLdQLnEA8HUG6mMv4p8gciFfUCKkd2+tWQjskSBsoCTvwn3?=
 =?us-ascii?Q?GT5wg5rWZSLZH/hVbm5NfGfXr/kQB+eNIawCqJsTdL2BDXYUzot5xYO5nom1?=
 =?us-ascii?Q?qtIW/IubEEOeF61ciNxB3FmIs2VFK1W/vrxDf2gCr9/M4GxisPqF0F/WvnmU?=
 =?us-ascii?Q?I9poXvfunvzBy6516pSX0tU4aEqU83g4jCSM2mHfqi56AE8xPAVtE0PnJn21?=
 =?us-ascii?Q?qfhqdVQgIFQs0ycCXtq+OS8RFXK5cBOnb929UeL0P1o+1DEBsTVxvgC4k869?=
 =?us-ascii?Q?nxRqXp7FHe9tC71aGMuBnV82A/h05Pe6ZHdkEb1wnKBFLNasN1EJUw4Lr80w?=
 =?us-ascii?Q?fABt4LOMeRLexssFYp0eDo3I9SGBj9jn6wCaq6MeiAjioGmqHLgjdoOdTElR?=
 =?us-ascii?Q?2fGt4nAa0DjQU04dqn0PpZ5xLDp5Fr0ujnRvksyit13U7p/nExGhVXCq9r83?=
 =?us-ascii?Q?OD+i0GYupaxGO7estLFE6s9P?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 716ad3d3-f6b3-4f4f-123c-08d984db4661
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 12:59:16.4176 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HyEQ0LxLOWUU34OltCNQMhNPXu1uaL0lp0ry5GrChTAZvIpK/DV2/bbtCJUy3iKOaAvjtEf3Jr09Vapq2vjN5pNl3f5y9/orMffnReA+ih4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5476
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10123
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 mlxscore=0 spamscore=0 adultscore=0 bulkscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2109230001 definitions=main-2110010086
X-Proofpoint-GUID: _o0qKOQ6xyktDZeHVqawYKqtG9qEKFTC
X-Proofpoint-ORIG-GUID: _o0qKOQ6xyktDZeHVqawYKqtG9qEKFTC
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

These error paths returned 1 on failure, instead of a negative error
code.  This would lead to an Oops in the caller.  A second problem is
that the check for "if (ret != -ENODATA)" did not work because "ret" was
set to 1.

Fixes: 5785dd7a8ef0 ("drm/msm: Fix duplicate gpu node in icc summary")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/msm/adreno/a3xx_gpu.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
index 4534633fe7cd..8fb847c174ff 100644
--- a/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a3xx_gpu.c
@@ -571,13 +571,14 @@ struct msm_gpu *a3xx_gpu_init(struct drm_device *dev)
 	}
 
 	icc_path = devm_of_icc_get(&pdev->dev, "gfx-mem");
-	ret = IS_ERR(icc_path);
-	if (ret)
+	if (IS_ERR(icc_path)) {
+		ret = PTR_ERR(icc_path);
 		goto fail;
+	}
 
 	ocmem_icc_path = devm_of_icc_get(&pdev->dev, "ocmem");
-	ret = IS_ERR(ocmem_icc_path);
-	if (ret) {
+	if (IS_ERR(ocmem_icc_path)) {
+		ret = PTR_ERR(ocmem_icc_path);
 		/* allow -ENODATA, ocmem icc is optional */
 		if (ret != -ENODATA)
 			goto fail;
-- 
2.20.1

