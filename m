Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5966D4559EE
	for <lists+dri-devel@lfdr.de>; Thu, 18 Nov 2021 12:15:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 333116EB69;
	Thu, 18 Nov 2021 11:15:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 331176EB69
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Nov 2021 11:15:48 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1AIAJ14b009988; 
 Thu, 18 Nov 2021 11:15:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=ktbghgGfWJpyizuLQzt3C9YPHLvSEiPjAt6t18PfYL0=;
 b=vdi7z2Ebq67hjb+gtC5r6OiNqo5hx74QMbLEp0Jv8G2Ft3UhvenyIMs/+VX9qQ1py+S2
 3HWxeEFsVsIDl0etI+tO+evt9GI0RxQe5BwMkzBDXyEKvXBoNtKfd/1d0u/wtqRb6Bos
 fs4DosbPhYIU5K+axmgVehmT1fisRsXv1g+SAz30ckf0UHIQv7Dfc6KpYaBmNrSvlbji
 EfluYc0pfwM0wCzHOEnwB5NtqXnoPP4diGenPTelMSbiWkoQCqJY6vEqCXsm9M5JYYEU
 bAH8Hf1g5f4gBJ2DcP3JjV18DRMSYoXspqb66I/VWFfCBiVlTyRpL7m3scImlzR8YAGR 2A== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cd382eutv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Nov 2021 11:15:42 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1AIBAUrU122498;
 Thu, 18 Nov 2021 11:15:41 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam12lp2177.outbound.protection.outlook.com [104.47.55.177])
 by aserp3030.oracle.com with ESMTP id 3ccccrk1gq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 18 Nov 2021 11:15:41 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZMkQYuuCMJR1Q9AA3f0ZFKX/R+zNcZA1l4gLZWbzF32+aBge7P+fkrcSYFN48erE+XmkiAus2iMc6PqSQ1HNWMMV2oKuA9XjnS4LB/mox0Wf5YJjafm5T9YC6iH3gSDO3kzjEC2XdAGC71RUe+0IUEorTQ5/DtjcH0n614GqFdKYfnHsV4pAU4u1xL4wCQ7KvCYzblOCGFg6zdRj/fPT3Bzvq9iVnAqPZeM/i2xOPImYAHMWFdzm34abZpM2B57KANVyPE3xHi6eau1dQ6ul+M/O8KboEP4CMl1R1Cqw4DkwfcR6Aa99IBE83TFNV/M+sSom8sDX+I9gPtXsNlKwZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ktbghgGfWJpyizuLQzt3C9YPHLvSEiPjAt6t18PfYL0=;
 b=CNZDJmR/TqhA08hS58goe71sQ6fDYle5yHiBaSLZ1UUQBkWOY4BXf82KT7Y8XO793r82kNc8wjHaWWDgqIR33lEw2ljlQ2R9dC73rdgCEnk4VZpf3YPTW6J8uh8LqalQTujPOVZQJsLDtqdPAYInj3c9A7UXMoPIQI5GR/KJyktQddmSeHvAU4+AvXi4bAdmJutDm39LZLy5SU+ShQv121rgQD/FqpbBuMBLJRpezEogODmI4Ca5m7Ul2yMC19850jKsHQhRTIT8wcMw5YBHalycW6FofLn0qyv3KnzlLqQIxb+ykDuPdrH2QkieV2WPCHz3cvnDfO5QfvW+V910vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ktbghgGfWJpyizuLQzt3C9YPHLvSEiPjAt6t18PfYL0=;
 b=OmQOMrHmf4+NFnfmsHirAIoaYOM9XRkVnxUtYiilthMjbvfgbKcix+imPrktVmelkpkMpbyffxdgYLXpyqnJDt9cJujPvPF277QD2rnq9s3w/jt7JW5sAICrIgjv2CJGx/qU+uGbnMqmNoppvtINp+7imMOiAo+4HuoM4Kquy9g=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1247.namprd10.prod.outlook.com
 (2603:10b6:301:7::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4690.27; Thu, 18 Nov
 2021 11:15:39 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4690.016; Thu, 18 Nov 2021
 11:15:39 +0000
Date: Thu, 18 Nov 2021 14:15:22 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH] drm/ingenic: fix error code in ingenic_drm_gem_create_object()
Message-ID: <20211118111522.GD1147@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0002.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::12) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (102.222.70.114) by ZR0P278CA0002.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4713.22 via Frontend
 Transport; Thu, 18 Nov 2021 11:15:35 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32d81367-f9e3-4a7d-8c04-08d9aa84c061
X-MS-TrafficTypeDiagnostic: MWHPR10MB1247:
X-Microsoft-Antispam-PRVS: <MWHPR10MB12479945023C94ED3643E7148E9B9@MWHPR10MB1247.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gWTLMhQ34mamrL3vCTRT++QHnTwCunrT2+2EoCSWVFlymgBtuatnaTdq4jwuVZVM3x/Hh2e8MqVpp1SXVgjDV82c2pDl7UIidYIeS2hd6/MLa6eu1lmsN1k1wfde7ROVNQgUyfAPceeBc9gT+iYc4bDfPg0QXfLTlscV2ct1OrGD4mah785qXAJfU6HvhnxRGGEKtSY7jDAve6PkROazvM4nqD2JWV12fMuAKc/EBwLPQjX1d2NEfnqwrVPYnbKiyTSbW03V7dZsHSizjUo2XAg8pqhSqT4+hd7hm5dGwceEZhB52Epk74ddcAj6PaPgsEXxgTXWXyuZVH1sJ3lgBqgRkY5UUe2seJvisIqvXhwSQ69NNgRJ8C6NwzqRDIYVNVBLLQCDSGEu41XYkSL4isjHabnfrFSSvNsE4l6P2iAVh29WFOp6w1ZrYURBk51YBR8hH94kxEjzZsAV+IZ3Leslu2oJgorr2Gqn0WeFSi4i3O+KQW/uc+eFUa5L1nfJ71qOADRqXiy+MGqNbDmQXdXgV5eLq5C9vNKwCvKBsO4uN9bIC9Hf5j62ywemifh9XlkadvqQaYuztbMUND5ibH0DfqmkLsjqL4viqexpTQ1DaifhhgWhoJM1wk/WNvqAi0QWPYXnHyThjE55Ixmgo/ZbZrSOWu1bnUnQ3nMbH5316vEKAcZzwc+6L7O3C3qWovobmILShj42nyIMhD4I3g==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(38350700002)(186003)(956004)(38100700002)(33716001)(6916009)(8936002)(508600001)(9576002)(52116002)(55016002)(54906003)(4326008)(8676002)(2906002)(66946007)(66476007)(6496006)(33656002)(6666004)(316002)(44832011)(4744005)(9686003)(5660300002)(26005)(66556008)(86362001)(83380400001)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iciuZjsbYUn53Wa4Q+Ls0IWlxaunLlQR5+a3tzgHmv7C/0wImOrhrFBJmsK9?=
 =?us-ascii?Q?E3/O1jSOfQphfkoJVYgZcGKct16Ny+OvWGhzWkyU7O3oqQvn2wu8WVm0xysX?=
 =?us-ascii?Q?FovFdM8onl/S8tQ8dvx1neyYrogVNuQTzHrsmZxXeHqwESnSmqLMuNxZevW0?=
 =?us-ascii?Q?IFB2m2H9rvCry+rBQCYKRhpyn0ainfZKyO0t5aG/DwW5FQYc5cV1TPEduts9?=
 =?us-ascii?Q?Kd2x2wjcwiFtWgvKAM8Y5Ul89pqhHtYvDKUeanQpfpXqvYvFTvHZ8sNm42FH?=
 =?us-ascii?Q?4jAogo5jZmQ8CHJkITCd18CStBfTB8NgKEFepqwMC1yBEzaCO6jVPkBo8xf8?=
 =?us-ascii?Q?8BIJ4KFKMin3dLqNcEh5uEHSr/0zwznAYVzel0qxnHW2sadRsTgVH8qx01t9?=
 =?us-ascii?Q?RtVeT0GfYAKfiN9vJpqPDLXjEqkHW8wc9S97x29SXJ7NiRw5l6GNffBe5ZPU?=
 =?us-ascii?Q?v23R708DAft4+Metz+xmJ+tEKN5Aotdufmf5GlRRts9O3pGrRq0JDKAO1qW+?=
 =?us-ascii?Q?vhe41Z/1O8d05EzcqH2d3kKZ7pGQPSyftgXLv7hBrRRrQYlZLKyubolrrbsO?=
 =?us-ascii?Q?6GSje4iq00NtXZjy0iar57PAqlJ0dmY0fjGwewtO4rlrMmf2WZcx5gwuFLVP?=
 =?us-ascii?Q?YKhGYntcISjUBSWt92SZ0XjC0L9EQRHJuBUbFplooPyEw/coWxGIibc8T1xk?=
 =?us-ascii?Q?sksSObcZ4c1l8jRSIlqpe7bN1wjOskxpiBoBowwZQHSEnHVmkUZCRWxKy3B9?=
 =?us-ascii?Q?MuaEqSQ4UtfAkUve3I5E9xhaPf1tvpkuCWq3tnF6hsIlkv/VDpGRTQeowVXw?=
 =?us-ascii?Q?spk5jZ0jbHdrJYS/YIK7I/5UjR+hz3eHfdYwxT+mQ2umaidzQmGbfgeCODWg?=
 =?us-ascii?Q?b51pIG6UkGIgAievdRkTM9AahlgRGnGyCzp4ROfJx95FTfFG2o2spn6nmZDs?=
 =?us-ascii?Q?MvzUIhAvMA5qJ8TJ327oWL2hI65gOWMdUWKZrKXpFP3N4Mf9SuafG5kceDP9?=
 =?us-ascii?Q?g4tkB9zfzmYTiFPAl5hQu2lxF7KkR+wgh383Nvu97BR7NBci1qj2mnPHnMXL?=
 =?us-ascii?Q?lYnqzocIzMXIh4KEYxTeAlnp5asZNAw4MIx354bosaBBbBsOGJ2h4x5TUrU5?=
 =?us-ascii?Q?7lFmVy1mP+9wqU7fmUySPtTGOuB6DfGcwXDcjhJICNfi9ix5RkPcJwM/SNUU?=
 =?us-ascii?Q?VMst6a1hbIamH5wbO7b95O/odMmfjKL6y/i0JA9cqxV7fDfgS6YqEW4GNwBR?=
 =?us-ascii?Q?HY+ycGyACYUYuY5sADBSIvZMQTuANB0QXtge0YqcRNLDXM6peYzf0UUL9Nr6?=
 =?us-ascii?Q?+RiWzQwKNDY0hnSXyBYfQLrdiz3IZLXEEQx8v0UiaSEPCdrvLV++ND8SibhI?=
 =?us-ascii?Q?jAxzlv2drhhJ1lZZCqOqzJj6NwKxL2knZeAKjkQ3w30JhDeWR92tF6DwXYh1?=
 =?us-ascii?Q?Mai5a3B+IIXsvdu5IjYPjB06ad1UmCKBA/Zm5RTqHtxkh7I9o4Ob+JHXZh7L?=
 =?us-ascii?Q?b6CuCztqysxIhLtGa9LIkxOb0NEg0zorkvt9E6/CQ101IUqh4QiN3zcw1mli?=
 =?us-ascii?Q?1lHedkaZXp4WGi67XxEupU9c3GGwANBOYIugUfqSrvFprnDgGBpo7PGLCUUm?=
 =?us-ascii?Q?WpbirgsM/iMcKPCokpT4+BaisCU+PBh3vQFsG6N4o0pJ0vUlMecaZeMOBg8a?=
 =?us-ascii?Q?jock0L3qiW5QjrV7b3nna7Fo5sU=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32d81367-f9e3-4a7d-8c04-08d9aa84c061
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2021 11:15:39.0558 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9ORALuYHFNYpU0IaiPfreJlTSGtJQu02dblQah0F+I5EiTeDGJhAInXny/GSWEmAFlYTZZfFBylhTmOlsZPh5vrRa2vJmo+fYGk+/BmxbtM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1247
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10171
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 phishscore=0 bulkscore=0
 adultscore=0 mlxscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2111180066
X-Proofpoint-ORIG-GUID: _V-bMZjui_K_E6QOeKtvd0EUYWuhrgZX
X-Proofpoint-GUID: _V-bMZjui_K_E6QOeKtvd0EUYWuhrgZX
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
 linux-mips@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The ->gem_create_object() function pointers are supposed to return NULL
on error.  This function returns an error pointer but none of the
callers expect that so it will lead to an Oops.  See drm_gem_vram_create()
for example of it checks for NULL but an error pointer would lead to a
crash.

Fixes: 4a791cb6d34f ("drm/ingenic: Add option to alloc cached GEM buffers")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/ingenic/ingenic-drm-drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
index a5df1c8d34cd..eb7266a0b037 100644
--- a/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
+++ b/drivers/gpu/drm/ingenic/ingenic-drm-drv.c
@@ -757,7 +757,7 @@ ingenic_drm_gem_create_object(struct drm_device *drm, size_t size)
 
 	obj = kzalloc(sizeof(*obj), GFP_KERNEL);
 	if (!obj)
-		return ERR_PTR(-ENOMEM);
+		return NULL;
 
 	obj->map_noncoherent = priv->soc_info->map_noncoherent;
 
-- 
2.20.1

