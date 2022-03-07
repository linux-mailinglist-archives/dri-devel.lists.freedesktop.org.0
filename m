Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 314CC4D001D
	for <lists+dri-devel@lfdr.de>; Mon,  7 Mar 2022 14:31:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B888310E46B;
	Mon,  7 Mar 2022 13:31:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B97F10E46B;
 Mon,  7 Mar 2022 13:31:31 +0000 (UTC)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 227C3JC9010119; 
 Mon, 7 Mar 2022 13:31:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=qLYAa4ym4yI3LlKasuEAMh6FX+ZA4cy1MIbjCQqlugk=;
 b=WCdNI0Ihdoalhx0+oajihNbZV32rtJItTwY2jeSPA+bIcwUGcogNnbuw/COSS0BIv+dJ
 USG5jHgwM327z4Ut+fu+RnINkar6pTTMuuGoEhUmWJ+CXYOIMESKWWA+FY85ReV/wDuM
 r/m7ffVl3PQ+2nZpaxT0Ko+jziNYSggc+QxF5hGe67qB0ASlIZBSzY/nvJNvuCyKnsfc
 LTrkViTGKS9RE2YGhEkO3EEnjO/rOED6KEp5e5ky2QcHWv/pJ+qD1DxIN3YDLOpnMvtu
 aQ6ICyL+zqEs9xYhJn1Lgxjsak45kJjkZ4GNM+o2Bseg6zgqkk16s9X2LzxcIYtp9zwv 5A== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by mx0b-00069f02.pphosted.com with ESMTP id 3ekx9cbrsp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Mar 2022 13:31:26 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 227DV2DR115174;
 Mon, 7 Mar 2022 13:31:25 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
 by userp3020.oracle.com with ESMTP id 3em1aj0915-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 07 Mar 2022 13:31:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EIF57zOkyFy+th2K/kHP7MaQfJYSLHfijsZmyw25UpcylegT33b9hkx/NvfU6vVpuY+Jf2MP5nlp3tyHtkhdmt9J+Z+oEYuFjzrAfxbaSmfpVfGfImMdnTbvbQoEg274u3F3KRq5Pym3Zu5hEACZALPCBCY/GzvyAhNIfNMnz/YPvg4jcCsSGdECd7giow3+Apj7uOKnaNgAZw0Ya4SbBQJgCpjRQJlYQDFB+jvshk2vtouErY10xgnOovfXFyyC4vvZppmpxKQoyzyi04UFGUqvSeGYOGdiftTncDtt9XS3H5iUJ7khFLGVrQiXF1ZrclZYwaNl+OwWsIg357aP/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qLYAa4ym4yI3LlKasuEAMh6FX+ZA4cy1MIbjCQqlugk=;
 b=abWSV8JMflJ0q5VkEGOyc+iQ2FO/eu0x2YnT8LXZzYY75CZiB4HfIpdoHA4ByUTkxIx/bybqavoybZwDgm+gC+ucwqB5fnh+6vjQK/8SpBbQog1+DC02V/n0QkEaG/7rvJqKldNcrZdPauTeG4K0vNKPKavVCn1+6T0f6LwDyGFaEd2YEpiEE2nNCMfehIjuo8pa8iVz5S7YdoPbeqVEACNX2oTRbxh5WlR/f1DYQJSCcHVPX1NyrOEzomBwhw5IfayvajKEq0MeekMfR+46KIE1egw4zYZ6datoLPqr092g4M22oMNWJi01yiIon6tKWU97bdWIpHYbTz+ZPqTe5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qLYAa4ym4yI3LlKasuEAMh6FX+ZA4cy1MIbjCQqlugk=;
 b=qAmYFL7EBBJX9Y9Tt2FRLKYRA+Pytn/2pUX455Tlyy++rIiUBDCjCwm2wXMJRgYqJclyMGoytFB2Ew3WxbdZjioFkNzDBwGWJ58QTMWjbO/ehe05gT4oc66yjX9wdstryRqIjD9LX0p45kOaBSu71tg+KsOAxLBge1ZrUzj278U=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by BYAPR10MB2582.namprd10.prod.outlook.com
 (2603:10b6:a02:ae::17) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.13; Mon, 7 Mar
 2022 13:31:22 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::2c3d:92b5:42b3:c1c5%4]) with mapi id 15.20.5038.026; Mon, 7 Mar 2022
 13:31:22 +0000
Date: Mon, 7 Mar 2022 16:31:05 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Rob Clark <robdclark@gmail.com>, Akhil P Oommen <quic_akhilpo@quicinc.com>
Subject: [PATCH] drm/msm/adreno: fix cast in adreno_get_param()
Message-ID: <20220307133105.GA17534@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0069.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:21::20) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: da279fd9-f792-4960-e207-08da003ec51d
X-MS-TrafficTypeDiagnostic: BYAPR10MB2582:EE_
X-Microsoft-Antispam-PRVS: <BYAPR10MB25828925421CD9E664C62B9F8E089@BYAPR10MB2582.namprd10.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Qo+B8ouB5lHm6up92qX+MCnwhl5rlDpvLNlXqesSBEM3JEJUBiD3c+Q7lUMngT8eQEyH6QdX704arYHYiHY5ZzoC17/mzCiUIXuYLa3oqKNiK9ALJKVx0vOldLnYGgIueFKPlRrst8V2PAZP573y3vQ8H40HobMliKjbG0FamEpgJa7edFit04MTIgL2WEJbfXIIItqnXwI26B2Zq+a5bUlZ8MKVb8o8rIF9o38VdHGFbMDemFXDc9CM7d0XZ8SCi/SJUFa0a5ZXwnscNbJY14fHdjJk5vejqRtSBDvmun24Jbk57gvu2vLhc+SPolOFx2WQjSI2mjl2PIfSTAXzVMrBR9H2LlslgN1G0DMTSSI2itJrFn97C+aar5dIHRXJf+D2mQ3xxg623VkacL7vjG9UH7x21tIWgH/OJXw2jwFo4ypvb6CgjLSdYwuALBUr0ZkPh3K11+zb8B3H5eSchiGi0skCZNOW1LzqJTxjm4gUaqVNQzidh4ArbB5z7fxgXdIVB0sdiFnfl+1M2zk0b/8LohSP8p8O5IzjaM3MDAdpPnLMEmVGHpLQx2HVQpi2yDbafOrzboiYAlLK3XTAlg+gUlflF7JxIR/9CDwM7qEFH/CfE3y8gT8Ctsa3+X1zqEfybeG4CkD6INMteGnLMDKcrNgpcbxNGpQRtNSZ95iq0cLxOrS45VOts0XeCZ4t3OoFUS74R5CiWjYAKrufoA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(7916004)(366004)(2906002)(33716001)(38350700002)(38100700002)(8936002)(7416002)(86362001)(508600001)(44832011)(8676002)(6506007)(316002)(66946007)(6512007)(6486002)(66476007)(66556008)(110136005)(6666004)(54906003)(186003)(33656002)(1076003)(26005)(83380400001)(5660300002)(9686003)(52116002)(4326008);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R0uV01gXVN3GW77RkCWQjq6oLZHl7W7AjA1M9PDLCPtKAdX0dtYXMUKiu1Od?=
 =?us-ascii?Q?UJYsicsb2VJqHNPWgx/6N0mcCN7zZd166RKIJgsRG/0jRdpLNHxINjFlogAt?=
 =?us-ascii?Q?FLk8QqYR7VpZmW4n3RDUHfMmMlCD66yfIf1rDeGkzPBezc54Th10tlWTZTiG?=
 =?us-ascii?Q?YTkjJPYOJy9Y2drVVg9ZhuME54wKMHNe9YGeEPYtCH02QuyXTmpTG/3UiiWC?=
 =?us-ascii?Q?Yt1+zZ8mf7n8Kh502mWW1jEswIe0e7ejpRex6eBVNnTaU9gnQAbGseoIcmMC?=
 =?us-ascii?Q?sNoWQfhF9/5pJHcvFRA/yRywfi04TX1kFr3jCrzkpNBX51nIG8pSdiVtacG1?=
 =?us-ascii?Q?alfeqJJ9kLdlCVDUCBdKpWpWKuwMt8X2h7mu9+cjxrFS9JDW4v56paKwos2k?=
 =?us-ascii?Q?imrV5AmDujrI82KysnaK5tt/TlqbPrPD2sB6s0sTE/jLXrmuZNV/fYLh4i9T?=
 =?us-ascii?Q?22NiEIk0if4gF7mf6DsXwUyakVBejWdGKA0lmMQCk/EejdRT2Tc3Wvp7rZr3?=
 =?us-ascii?Q?wL8AMbrKDqaYpgDJLR/l5f2NBgnM+t97TOynU91UoLR6ioxNpxhwiP389wKJ?=
 =?us-ascii?Q?/994ne9WpevoI+0qqrR4K2KAxspjdaDHtQpIyNo7pCflqjZB24knmz2bLA9L?=
 =?us-ascii?Q?9YqXXDANl5kocTZ3AodCHhWqJZjpHFFfE1JgaLzATWcuUJBw4mHkEWSw5qpp?=
 =?us-ascii?Q?/1HFHC8nE1SsbBKM1LAWoyeSr06AlnQlQJxSOs0BTR8fmzJc8C/48twtsdHy?=
 =?us-ascii?Q?XgSjoJSJJXjMA+V1RCMX2alF+FN7T3Db2UgZ8uZL56OajwkyMGXK4NEuHdL/?=
 =?us-ascii?Q?2Z9iubC3U6JSYcAOTGBHm5rs4uzIXmRwj0KFhWGFJOdOrbym37/9dTg4DBeC?=
 =?us-ascii?Q?kXW+4LxXA2DzTLp9JxJfaMb0RH2lc016hp7v2588cA4/jmp4deme7Kd9I/hs?=
 =?us-ascii?Q?xTbafZ8ECdXNhxzW6Fi53azyjN2tcVyX8prdR7I3wBw+AUAEdwFJJnI+K+DJ?=
 =?us-ascii?Q?g1TluXl2gt7LcJ2fQFUMKWwdRswfb/KSY5Byu6o9ZbK9jIdt43j5MBijHFO7?=
 =?us-ascii?Q?2llUE+I95KPVIzU+TKwsOm/BgQKDkJ9emN//OH5Y46uFvEsug9dMaRp84vqm?=
 =?us-ascii?Q?jINhH6TgsWvIpLRVThGE0CirSLNU6j7CgUqQNYmIk3NzcKBCPQ7urJYUSmBL?=
 =?us-ascii?Q?8SCDs6a3AbhRxoZR93DcGcrJ+vzKLuqTok2Uhv2KhgR9CpqeZIB4B0KDqP6w?=
 =?us-ascii?Q?SBtfTgeW2Ffj2GfFm6CGPWPLRbWApe3egUNhiBEJT100xIZnYwZH/3lIY5WA?=
 =?us-ascii?Q?ZYlDGc42PDlaTbaQbzb1V46PRu7z9QaM95rduJZqIjv0a4mpstIdL7pXfFvl?=
 =?us-ascii?Q?41OdrIDGVRscIN8ED+c0wHAj7Q7ARNGh810lqv0NyrFosgo55Ti2nBFDmCOl?=
 =?us-ascii?Q?eqpFx0e91f+oq3oc1k6asGVJLVe+SeSPhSwjOoOLZC/2h+5uAr+Wv5fxWNGm?=
 =?us-ascii?Q?amFk4ILu//MPpm2ayMzXWSoQtA9dNYcQQzKcrkPIHHghsML+XdnK0h1a0K2+?=
 =?us-ascii?Q?GVoHVikFwS+ddtAcq3RMTMAOarFAhglNR9AKGK9iH2w5oAfyCyqSgfRsyxpf?=
 =?us-ascii?Q?AKmqHKmBJf1Db3GB0k6Ogc8XZWW05dSwdOJmeYQGhFOxGpES0UMLK9CWjc22?=
 =?us-ascii?Q?n9zTqQ=3D=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: da279fd9-f792-4960-e207-08da003ec51d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Mar 2022 13:31:22.5451 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nRyaFpB8qYn6tqLbs6VzdkdSkXAfQEQtw1f7Q5oJIMtpR+T9lpKKEbybKdTCQQP8gSPxNjuZ+YR+4iuoKzHl4M4xikfFn3gECkGzBxx7duY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR10MB2582
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10278
 signatures=690470
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 bulkscore=0
 malwarescore=0 spamscore=0 adultscore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2202240000
 definitions=main-2203070078
X-Proofpoint-ORIG-GUID: QdOnqXm1bYvHtSkfTA709vWQYQkUM24F
X-Proofpoint-GUID: QdOnqXm1bYvHtSkfTA709vWQYQkUM24F
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Jordan Crouse <jordan@cosmicpenguin.net>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

These casts need to happen before the shift.  The only time it would
matter would be if "rev.core" is >= 128.  In that case the sign bit
would be extended and we do not want that.

Fixes: afab9d91d872 ("drm/msm/adreno: Expose speedbin to userspace")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.c b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
index 15c8997b7251..f7b3f6d266a9 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.c
@@ -244,10 +244,10 @@ int adreno_get_param(struct msm_gpu *gpu, struct msm_file_private *ctx,
 		*value = !adreno_is_a650_family(adreno_gpu) ? 0x100000 : 0;
 		return 0;
 	case MSM_PARAM_CHIP_ID:
-		*value = (uint64_t) adreno_gpu->rev.patchid |
-				(uint64_t) (adreno_gpu->rev.minor << 8) |
-				(uint64_t) (adreno_gpu->rev.major << 16) |
-				(uint64_t) (adreno_gpu->rev.core << 24);
+		*value =  (uint64_t)adreno_gpu->rev.patchid |
+			 ((uint64_t)adreno_gpu->rev.minor << 8) |
+			 ((uint64_t)adreno_gpu->rev.major << 16) |
+			 ((uint64_t)adreno_gpu->rev.core  << 24);
 		if (!adreno_gpu->info->revn)
 			*value |= ((uint64_t) adreno_gpu->speedbin) << 32;
 		return 0;
-- 
2.20.1

