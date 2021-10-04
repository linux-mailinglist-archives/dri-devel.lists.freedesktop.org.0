Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 52BA94210A7
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 15:47:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB0B56E9C3;
	Mon,  4 Oct 2021 13:47:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6488D6E9B6;
 Mon,  4 Oct 2021 13:47:52 +0000 (UTC)
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 194DZ3AV017893; 
 Mon, 4 Oct 2021 13:45:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=JFNgeXGFTQK+LhV8oYwmj3Shc1PylF6JbU4Gt7ddCP8=;
 b=TTRKbvSfCEiCya+X1gLdHC32TudFTSFWDXw+8heyQGyfE5pvRtMoLYRWrMrLCvjcNpnk
 pcbb0DvD0+R/RYGI6ysPuExZZx1o3x6lTmQaTvvwJoYXyYKE7d85P+COgySeXaYh+OvL
 apeylmIqnfYmVmsbw/RnzypcLUeaceUHyUT7S8qLKsophgXKzmCGN+8ijiWe5HJ1LPmP
 pjfed1pzrc+I0oesrQUME22MMki0+6+4JLRXJQMK1ewIjQHowfkRvBDuZb4marfNLJxG
 2m5+p0OEfKR+YyIgHBarxc35b958aLnOYj+bc5iFpvg8Nh/VGUYnWYp2aP57Ll1QJ+1R zw== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bfaj24aun-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 04 Oct 2021 13:45:47 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 194DeIvX113276;
 Mon, 4 Oct 2021 13:45:46 GMT
Received: from nam04-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam08lp2043.outbound.protection.outlook.com [104.47.74.43])
 by aserp3020.oracle.com with ESMTP id 3bev8v5r15-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 04 Oct 2021 13:45:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mLwEpQF3qtaaEc0YnLG6hxyUKR2wc2inUAC0GQf1ZcoEsY/YEHR210ZrPnXkIHXIXgCavacrqcUsyiuh+1Q+B/0Pov+9GOMmYQxK1L9+FYX1Zp7BNyeqqfHHDjX2ZAL7kdqVu29lnZgE4D6xo61Dhx2O9Mq+NkRingFJZQLCvSpdiMy8fO/Y6MmDQEFylmQEFiy2OFaYEflBmjhwELBsJ6qOWMptn5TKE7/im+ye0xRZwRbrLYreq7fxQQLzHrAf2eGTsCJOcxCxFdNtiikjYpWNfyeoAtUmQQw5xONyV25xe4D42/avpQVt7FLaT5yiUg8T4ruE2CrHg237e/9mPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JFNgeXGFTQK+LhV8oYwmj3Shc1PylF6JbU4Gt7ddCP8=;
 b=bkscms5doT4guAXapzxUIpXO91MWIGGdS2iVjAPNLRfVQjfv4iHcAU/EONSUE0rvoT4MxD7RGfR68W3W5DbeOGyHfirhTr05bYIQDv8VVBC0DD/s+zsdLv3igmB6K4Yo0Hc256s9jgmQ4xPkANXFmDS4WCq2EOjSWF+5ZMDj9C9jDizZtak5s1K5Mr2HUOeUt1c/a5WI8MZSXEKWNPOziVi2DB9TBD0dG5wxOWtjr4fTQXV6dT9S80y4UzRBQzinhJfT17uECsj2Y6yekGk4WAw4quCqQSzDhPx8KXe/UKQW0sdW7aAO71NqgcWSqCjF50ShDGl0ZaQWUnybpfvIBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JFNgeXGFTQK+LhV8oYwmj3Shc1PylF6JbU4Gt7ddCP8=;
 b=cwcNGBfdu+R+N/BuKMKDezcq3jzSFL+Z9Z36Y6IX4BS1CAcgHBurLSOM+S4X5CUr6afH21jtQC+6DDWIvJXpjRt9v7YcRbK+ib9niPJP21/CbgzxXh61HvoliPHHRgfXiWnCapq934doEaPMzsr2fTFKU2RDvZd3noHOa2x1J1w=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1949.namprd10.prod.outlook.com
 (2603:10b6:300:10c::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.17; Mon, 4 Oct
 2021 13:45:44 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4566.022; Mon, 4 Oct 2021
 13:45:44 +0000
Date: Mon, 4 Oct 2021 16:45:30 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Rob Clark <robdclark@gmail.com>, Jordan Crouse <jordan@cosmicpenguin.net>, 
 Jonathan Marek <jonathan@marek.ca>
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Eric Anholt <eric@anholt.net>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/msm: Fix potential Oops in a6xx_gmu_rpmh_init()
Message-ID: <20211004134530.GB11689@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0160.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::18) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (62.8.83.99) by ZR0P278CA0160.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.21 via Frontend
 Transport; Mon, 4 Oct 2021 13:45:38 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 87f81770-6c9d-478f-c8f6-08d9873d42f5
X-MS-TrafficTypeDiagnostic: MWHPR10MB1949:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB1949963BC3EB13129880D0E48EAE9@MWHPR10MB1949.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:3826;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AN0HHg9NSYBDb0XshhYpE8l0yaKk6QJ7/Fc5mmfVPQMetDsPH8xSmL2coNBwt2HSdOtifzkEZi8aKSY3kPU8zqVZNGDwMbDXfGiJ8mTjKnWj8ALTT7nTZBfZ6xlyx+i7D196QVUz05y05wSkBQFpTFCZT1mdLGPIyxWnRJs11AQA5tOGwiQQ0G5Kt+WC1vV4kZyOnCopy3AAark1wvNB9oJgr7Z/gFwqMrJtvhCbJq6qD/CdQmxdkFE/qdB0aFALAJ0geJOwK+3J9UWenX6GoUADiCf7PK1DA9hEvfHfkvs+GlIdoHpkC3AKapcumHs2MhA5zNePiylviMxLCMmq8gL9mc4hOoOjs+CQvnQGeUlDMemI0DKh6fkAQXkq4sxCj5p9SkNKR3prO2mewZM1cZ+YKuPfuy3FrhzAfJAWqK3ov/FsDIajz5uxBdX8f/NEF+ZDVPl/RzCrx99YpZfsPK8s/bJQGDYtB5efIyn3uKHEMPjucRKByNvr9ItsasT+ES4SxsNjESXyVMw1KdjfaqMz2HQE0Zkz1G4QgaFWaQA9pPoBcsKv3BDYzPztn1+ZKic4Ye1Cz+3Ntxxu2RnKFSrilHdKokuFowOHctJIZ3NBKQz9vi158a6VqJ9tlPS1GgC2ARnw8LCfzCe+m3upej05HXLOs++vXk3MX/wqbeWBXzujczsM3asLTpjAHHlnYqTkuGeQvSm4nUmqlgF9wg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66556008)(33716001)(26005)(66476007)(66946007)(6666004)(8936002)(4326008)(54906003)(2906002)(44832011)(1076003)(316002)(9576002)(8676002)(110136005)(956004)(55016002)(186003)(38350700002)(83380400001)(6496006)(9686003)(33656002)(86362001)(52116002)(508600001)(38100700002)(7416002)(5660300002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W3HSME7s+XkVpw6odDbxUGP6QTqEOHd9wMSMtx4ojmSL9xkHTEeL1APFTBym?=
 =?us-ascii?Q?PUeZvSNbuCIJDbIF8w3v9J3P/wk1ScGIfPim5M5YAXcvo9blPdnd2t417lVZ?=
 =?us-ascii?Q?2BV+sUX6LASBIVrlv2IkqW+0Yo+UdHss0VNxmWDVmnfTjseiUVGUS0AHcJVG?=
 =?us-ascii?Q?Xe35MvXtRbKyzgPQ3NOcrWoa/w/AajDq8TM/pWhaAp2/aY5gA3A98JWbi5+A?=
 =?us-ascii?Q?izzviqWbfAIwNkgf0DnjXWkWAQG3nMQUJctfxeFn3oyUobiyl6jrzzN1FiDB?=
 =?us-ascii?Q?wcYmWpwgzSrJ055nRyH7PTD2gN0WpCP02J7kPh3v875IWX8CLXAat2MInq69?=
 =?us-ascii?Q?wS1nQmPTj2M7jhS8qvDKAhyG4Siim/jlRTYiUCzhAkfdKqcfaN1v/TBG7gnh?=
 =?us-ascii?Q?VmVNqPl3cEMqHQkRHyT7KPbeU+np8M5xRurduSa1DdPfM5L5L8I9eNVhx0CJ?=
 =?us-ascii?Q?Eh0hVXj2q1RbhaSK5biJaUD98ZxdLZzriH09NBn973F1bXmkt19NMDD+4Rv7?=
 =?us-ascii?Q?XHzep+SJghRlMWdd5HG7zxJZVyytxFt41dvZuxI9jPSIwoIFgX4fqZybHVQn?=
 =?us-ascii?Q?0aX5Ge0cYkC4B6QY6g0xg5VUHoqxaCb3q9fkY97atisTTBE7hmWqSgfV4RIG?=
 =?us-ascii?Q?zXflX9CNg9AAsZEPBF0b4XTood8MsssaqCHGViKvrszW5+SvGZlexjujl/hS?=
 =?us-ascii?Q?4mUeDUgUDv/IBgtvzutw8kJQpp1lj2WGbMIbyoZXheaWBlj/jlwuDqag6NKR?=
 =?us-ascii?Q?19MSH0sgIjAsiJ0MW8xs0HdwRUoGXbSafLGz6+3y4Xuxz0mL+zLgJ3ymkwQ+?=
 =?us-ascii?Q?C7PUjUmQmNI/fYurzk06osiRkPw3pZL+aL/9f5tkuREIpO1VYj7bffGbEwAV?=
 =?us-ascii?Q?cApnm44TRRoJByBosRjTwMHh1yB7T6f+V7MkIP6vEpkOkY0Y34nBfqP32Pt9?=
 =?us-ascii?Q?Zr8QdSIIIUAiiP06pLFET+akJUu3qagp7rOJNrQ4OYxz32yeQ4E4Oja47WSA?=
 =?us-ascii?Q?UALqgHJO2hv2MT0+OCQ+GyKROxpzX78EPEaEOHClqISnB7+WxvlX3S2omRSh?=
 =?us-ascii?Q?7pyD/OPtBel3ng0xLARX1Cm+oh6IRI5Egx8DPXj2Hz6IDN++x6H+QkDEUk0m?=
 =?us-ascii?Q?hl4tvQ5kG58jC3WsdB1pKi0nL0OpSVNbfwtPd686xlWVHUX/C22/VUwVZi3G?=
 =?us-ascii?Q?3TXFNxCtpQHZZXUA2WvjAPAk2i1nhveQOwTvGNKlYyZv9aZTSxcmtivWTWaq?=
 =?us-ascii?Q?Na6qVRY92YEcNjoxAo9pM2uFnUQAotXusjDc1K5rKq22DxR2IOnGGwL/I0AM?=
 =?us-ascii?Q?H8hun5cAhlwcs7XlC0oDtyKY?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87f81770-6c9d-478f-c8f6-08d9873d42f5
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2021 13:45:43.8782 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cP/TX1QJQFpSeQpZGZNLyOzi5J79csDJ9jsmiJlg7rpgVjEOgak18fDK1/6I/wkOKR4JJzfNIuIIDDP4d3FS3v5PMtpg9MZuBI3D+UrAWhE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1949
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10126
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 phishscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110040094
X-Proofpoint-GUID: mmPTEMYtdaFk2-k2v7-RnZ20jUAU9BXM
X-Proofpoint-ORIG-GUID: mmPTEMYtdaFk2-k2v7-RnZ20jUAU9BXM
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

There are two problems here:
1) The "seqptr" is used uninitalized when we free it at the end.
2) The a6xx_gmu_get_mmio() function returns error pointers.  It never
   returns true.

Fixes: 64245fc55172 ("drm/msm/a6xx: use AOP-initialized PDC for a650")
Fixes: f8fc924e088e ("drm/msm/a6xx: Fix PDC register overlap")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index a7c58018959f..3bd6e579ea89 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -512,11 +512,11 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	struct platform_device *pdev = to_platform_device(gmu->dev);
 	void __iomem *pdcptr = a6xx_gmu_get_mmio(pdev, "gmu_pdc");
-	void __iomem *seqptr;
+	void __iomem *seqptr = NULL;
 	uint32_t pdc_address_offset;
 	bool pdc_in_aop = false;
 
-	if (!pdcptr)
+	if (IS_ERR(pdcptr))
 		goto err;
 
 	if (adreno_is_a650(adreno_gpu) || adreno_is_a660_family(adreno_gpu))
@@ -528,7 +528,7 @@ static void a6xx_gmu_rpmh_init(struct a6xx_gmu *gmu)
 
 	if (!pdc_in_aop) {
 		seqptr = a6xx_gmu_get_mmio(pdev, "gmu_pdc_seq");
-		if (!seqptr)
+		if (IS_ERR(seqptr))
 			goto err;
 	}
 
-- 
2.20.1

