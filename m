Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1C24420966
	for <lists+dri-devel@lfdr.de>; Mon,  4 Oct 2021 12:38:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36EC06E9C6;
	Mon,  4 Oct 2021 10:38:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A50BB6E9BA;
 Mon,  4 Oct 2021 10:38:52 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1949HZQb025135; 
 Mon, 4 Oct 2021 10:38:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=M+jTYvrCL8EL4OLRhgkFGqZ3lDUevV4aww77yriJb8Y=;
 b=ZpcRLWJ15wFAoau+MgyWl/8pc3eOWfy4JT+QHLfbok93EEnZ/4wcGEQotJ6LIEx8mCBl
 c8n86sqtYWORYId6tQqbch3rNJNGL9AyuwXBAkOAV/9wVIMX272Bhf+dnKY8mmsj7kn1
 OYk88N/ZgkvHAQiYQBshCgpOjkjnvshxZ1H9X/zA7fJQ9lhmlR7LR+c8litdFjeJNXH9
 z+wrl9fc3VDHKmKsJO6nqxrsj9pEBGz/GrWmMQaExINd3ZHeaJU6+ej3gYud6z0oqz7m
 bdzWuJRx0d9UwYXGaxyTLGFMtRDSDbYttynXDt8Pf1aMRGa8etW2AN6BDUYrJAR47O+v EQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bfabhu904-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 04 Oct 2021 10:38:24 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 194AUGJf130270;
 Mon, 4 Oct 2021 10:38:24 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam10lp2107.outbound.protection.outlook.com [104.47.55.107])
 by aserp3020.oracle.com with ESMTP id 3bev8uy8se-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 04 Oct 2021 10:38:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LoHQNfgghHBnaie4H3FIhpOd3xf7rRbwvPheatA2zU65bl2VDao0TXaVOO2t/mHrZV3ljQurehgC5bEZH78HwNBUYA1DRuqZ8xLTN+mRusdZ0j+Ol4yf6A6lSJW/zmQqhV5g7KwPIcHW1ISRhUVOeyM7XJ0AZ5T04yon8WluNCU3TipwJaaSPNjeRcuwfQe48Tm6S9O5ipltcmS9P5U/odEu2tD/jK12UyG5S/Iw4DxddVJV44dy7SuHyynU3Ve1Bsko8PE5M0gCJffofyMJTeFk1BgS4/DuhsDIEsT+twg/QyJXrvdz/HxMTNk6rtlCpM17Uy7yB05CD7mN74O2Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M+jTYvrCL8EL4OLRhgkFGqZ3lDUevV4aww77yriJb8Y=;
 b=AyfedEiFtDMZMOE1rv75ZOLUN+KqsOAhZh/Fz0i7nAfmXApyeGFSK6nscue2UcPMVrIRV8Q1eTsNs4RK/wvyJ2MVJjfz1YsCjF69n2w+fh7tWKmrDx/HxupwWh5Meq9rqJB4IOKv4fuH5oajkkT66l+APGb1bGtodBzM5OTgCba4dmUERB3Joqzy6PiTX2Jg9a+NK0QWbiN1ZjIOMzFj9B+QWPvvviFJguLPUskKD9gHchP7VH1zFeC2JFAr7q8Tc7t5PnrU9UEtF0a4Gir8ckFZZ8wPBVuFd6ViTgalVUXyveaSnVGHORbed5iGZLgzjeWmakbJwpBjfHOrbPNZ2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M+jTYvrCL8EL4OLRhgkFGqZ3lDUevV4aww77yriJb8Y=;
 b=qb9OjGKpfyeG9wOfje9ZlVugFI/ET2xaSQwJPC5pga4E4SjHjHDewFdnSznhR2sDp8TN4/jkY96BWWnz0J5GwJYuHBC+EdoeIVCIhpVS+WdST6dcKIRdemkZ3AT+A6uMPFqlR3xS6HlMk/PoGKa+l6x2YFxVrS9VTf5tW8gJQao=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4466.namprd10.prod.outlook.com
 (2603:10b6:303:9b::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.15; Mon, 4 Oct
 2021 10:38:22 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4566.022; Mon, 4 Oct 2021
 10:38:22 +0000
Date: Mon, 4 Oct 2021 13:38:06 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Rob Clark <robdclark@gmail.com>, Jordan Crouse <jordan@cosmicpenguin.net>
Cc: Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>, Xu Wang <vulab@iscas.ac.cn>,
 Jonathan Marek <jonathan@marek.ca>, Yangtao Li <tiny.windzz@gmail.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/msm: potential error pointer dereference in init()
Message-ID: <20211004103806.GD25015@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0098.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::13) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (62.8.83.99) by ZR0P278CA0098.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.22 via Frontend
 Transport; Mon, 4 Oct 2021 10:38:15 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2d191d3f-778a-4ade-4547-08d987231655
X-MS-TrafficTypeDiagnostic: CO1PR10MB4466:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB4466FDE2AED92BD214E5050E8EAE9@CO1PR10MB4466.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:1247;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mtibn9p+KShc7UuqjOHn1xcJjCwjiaiRO/actM/Jo7PnS6Y6DArnhu/e4JmZRkvOXqAC+3C8/ujMqnY0ijTowXpNRk4Md1Zdg1FS9JORtsMqCDStC+6nf807N+3PeKDT262YJC9E7bDB6MWhpSSe2xmqPZu3yPbhMu90yJC7I/25APzaB8cNIY9Gd72TeHuZPOvJt7TL6JUn2gXErY5YhggrKgcX3BrcXAa0fMa2alKzQqXQfOoJZvT8YDnm60n60Tuc5iebODIKNp/okAK6CErn13Ezawlkw9NrSBKkmIjueQidoqtV6zgwhbDUzbtsxgs+TA1r2ICWTC6P9Q+26GnLq4sYAytxXXcpp4tSS6qf9TBU9HQgb2qt5MWLLr/MvCFCZ6rDq0pisVEQIIuUpaqA5Iz/nCXjs0Bd738HL9bq2ApT6KItfnf8TTwoQlM5U2EQi9d+dULRBzbZn0vteEY8qnmecDRKYDkTk5rEIvW3d6rDGO98jIleu19DF9evw5lgITBw4MP1BaCpXmDMRGG2MgvJkfLKG7gVh0mly53H/gYh2TMBG7/Wy0xGctJ5+t9WA9O4Bfx9mqrKBE48eVohRIH7n5vkXX5zoKig9TSlqjXgBYy0FcEwCd5+wCJZI0Q4hjQ50SDnUzRDdYUQTDmh2L2gLco9EJ3Sk0FoUcnqnY3Z5EWRDH9XMyCh1inTsGGhsbGiXE7WcCjQWVmsdg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66476007)(52116002)(55016002)(316002)(9576002)(110136005)(54906003)(6496006)(9686003)(66946007)(66556008)(33656002)(33716001)(4326008)(186003)(6666004)(26005)(4744005)(2906002)(86362001)(956004)(8936002)(44832011)(7416002)(8676002)(5660300002)(508600001)(38350700002)(1076003)(83380400001)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iF+f7ifjMoLy1Za/SvVuS95+6buh8Oswa4gBzFVbXOPDJ9vy1AnTh84wfeSW?=
 =?us-ascii?Q?m7Qr+NZUWFHzzAm5nOUj/n5wfhjdkz6ODKw7cB5X8bclVsJ8BHaGPiJrWMp6?=
 =?us-ascii?Q?UQpdi3kz3t/SFlLcMBgAmBqDC2+59IoSqzCdJrvwFqwup1jUldgQytcVc1Dp?=
 =?us-ascii?Q?GQGJCdKf5ChVCimV15SyL6jpbe26FgpoZgts7SQnDfSHSVJwNtNNBxRIgUrZ?=
 =?us-ascii?Q?ZyfNrDnjoadzoxAzNoBh+h1/lp0+JnAp0NwJTnhH+SE0s2JsV32Zpyt9Iocs?=
 =?us-ascii?Q?Nl4MjIDGE1eKVI7PPdAuj1yt6XztTBOCQWMvvJBkM7QzHhJq29+iMV/Oj5HV?=
 =?us-ascii?Q?hiMhI73BJoibjtzxayW90yle6rT0yzI92G3I23pAkJfHCx4+g/KTyjptlY7U?=
 =?us-ascii?Q?OGEmEdyBzshruhaMOLiyMFJvlJ4Hc+v6TpIJurQ2geRQUYCnPf/KlNgKA9BH?=
 =?us-ascii?Q?vIbBLQqBCLBdZIx4wu5PZL6luTVOtALBUFAIKD1j0dvVt8F3PuNVwuCcAw4e?=
 =?us-ascii?Q?xenM2447psTQuUdiMVB5cEH0OUUDjnywHew7J8fEljrNDxQjO5QzuT6LdGsy?=
 =?us-ascii?Q?TIp424qp8UeS7VP5uplBxLvABMookjB++ZUF4hJBmEIKDJUtl9lxsPcgyiSu?=
 =?us-ascii?Q?y2ZLe0PAy6kGbPBi95qQzad/nyNDX5kkxDy53hHzKWdnRDuV3dRieMcV2AQP?=
 =?us-ascii?Q?yG78Z/7+Hn/2ap0i2gt0T7T1+cYAV0C098b098iTZ4dwYFJlEj5Rb9pZBRDJ?=
 =?us-ascii?Q?SE1noV10tc6V6XVlupicDeMIoT6nMPxeGMUMllbZ9cBBK13DAF6qdhNQ/afe?=
 =?us-ascii?Q?xwDc6jgzKKBQ3czGsIuWvvwiG76o9OAF4rGcdy3zU4EZZ9XTbse/2jgQWvy/?=
 =?us-ascii?Q?nD/5otSkqSb20om4mYTVLUdh8AgOABR/f35It5G33CPTohxCNghJ0UtZi92u?=
 =?us-ascii?Q?Gmhl4PL3yomYQhlsTlPb6CR/Wz2I81GAZQzWiMFGYo3814hUWMv9ier2Fm/s?=
 =?us-ascii?Q?PfUmBC7Ko2yt7NiMNAAGreBHWWjic7YWSTp/4/2a/4pFQ9+aESqiMOegvHtB?=
 =?us-ascii?Q?j5ZzQE3eDNdIAEofMFH28vyORSBb6gX505zZsNZ3Tf+6SzKlxIOHcE5Iq+Vj?=
 =?us-ascii?Q?I5P2DLdFzUcfnfY7DHTpDED0diaf6hjocvZIbE4vWyFvV+6BGeBEpTxqoC59?=
 =?us-ascii?Q?jY+OgdM799kSQt1pk441ZsG3muS3zK58V7FgQD0dawIvStTSb6Zavbx+G/Ku?=
 =?us-ascii?Q?Myusl1uIrlsJ/5ypceUK8ZPCV1dXn2xyxavvVzZxv/GNkHUY+kQGN7iL8Z/n?=
 =?us-ascii?Q?7ZqnMI5TlVc2ZTUYM+X2j1c6?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d191d3f-778a-4ade-4547-08d987231655
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2021 10:38:22.0896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: shMs9r3zrThGUXTHF0V3G8VDcXBS4Ih4151goDaG95k09Rs6sbTTeb1RVpdyWXzJ9OmFk5j5xGlrKPTWoWo0VNs1wOelsDUGOIplq5Wdhwc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4466
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10126
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 adultscore=0 phishscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110040072
X-Proofpoint-GUID: yRBwKB5RTpTNjkvGvaL54Nrl0_x9n4X7
X-Proofpoint-ORIG-GUID: yRBwKB5RTpTNjkvGvaL54Nrl0_x9n4X7
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

The msm_iommu_new() returns error pointers on failure so check for that
to avoid an Oops.

Fixes: ccac7ce373c1 ("drm/msm: Refactor address space initialization")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index ae48f41821cf..ad247c06e198 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -908,6 +908,10 @@ static int _dpu_kms_mmu_init(struct dpu_kms *dpu_kms)
 		return 0;
 
 	mmu = msm_iommu_new(dpu_kms->dev->dev, domain);
+	if (IS_ERR(mmu)) {
+		iommu_domain_free(domain);
+		return PTR_ERR(mmu);
+	}
 	aspace = msm_gem_address_space_create(mmu, "dpu1",
 		0x1000, 0x100000000 - 0x1000);
 
-- 
2.20.1

