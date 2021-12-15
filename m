Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C2E4757AC
	for <lists+dri-devel@lfdr.de>; Wed, 15 Dec 2021 12:21:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15D7810E525;
	Wed, 15 Dec 2021 11:21:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com
 [205.220.177.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4218A10E525
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Dec 2021 11:21:16 +0000 (UTC)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BF97wFr017629; 
 Wed, 15 Dec 2021 11:21:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=XxSmjfymeMH9CGdWYTSU0UyvsD6qiS4Js8/J7JwrqhI=;
 b=xgsD6bnxG9RJApDbr9JlPE5JUDHDRoAoPEyFW3f2knvW6zDVK9H97YlIOhWk6vZn3gqO
 UeEqWmM6RfEauBe0OydIE4z1n2fBWahZbsI92K2qV8eSYzfSfa0wpSQ+bvPv4ZcwSX7m
 7dMR6FS2UzfcIyfnJ2mE7ErHdg6Wa5T2ja5LKAchHRz7EPqmhG2rVvKz3AOnGrJToEtR
 JHa4yINHJJmpxIk5AgX8mwBvgCBHDvd15KXjRQ0R8Ufgc6Y6+H/nwodYy3TsJ64SWRuO
 rfIM6NCmhLwdDVC69E/paKg4v2gxpQOkLmdR1VtYAM0U9qgX4b167dQV36TpkshvA9uk Lg== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cx5ake9dn-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 11:21:14 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BFBG5bP003401;
 Wed, 15 Dec 2021 11:21:14 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
 by aserp3030.oracle.com with ESMTP id 3cvj1f9drh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 15 Dec 2021 11:21:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RoT5YYhXq40OtVYeYEu505Pdprby78V7idvkGALqEuP1vIAdnY6ZxbW3tb8LMNsHcgSiY7wAg2NMdMlPHAGJoGbD3CKT1OOQxUuFEUoBOECyyexzss3HYZA/J8ogk6UC4alzDGrikTcgpeV/WNV6duXjdQxwbWzhvanSTq3BTP22jIv5wv3bwml2IjCVR+G1sORFJKSl/LuC9TOhmoLEON8z8OynKYhHwczTCLRY1HmDbLzODCwf5NhfvSBk2e5CPA5L0n/43UOwa+96fbvd3rIDP0yTjHNwalNTTETeksjtU3sdL75EV/kEAXwEG1ZRIdF3rOct76w+aoIt9WAENw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XxSmjfymeMH9CGdWYTSU0UyvsD6qiS4Js8/J7JwrqhI=;
 b=TRaHa1yRK2OS/+KyTQfb1PJSBC1V65+GgLgAhhc9njABVOxoMUuuc10Lq1n1j9ns2Jl2TraL3BeRxZZne253UU0Yk6kCBUccOfHBotd7dgZtBbxST81e68wSxk64IC3LzxIufuwwLg5NHdzP4YVioF8bvhsKRPg6Nq+7E03mE1kXHDUxT2jYqks3FqO1FFumYbNqSLjF76de7ZMIeoXfct9AAx0Ope/Kp/qAm0FY7oFei7cPea3HtGtKKxefYQDgHqZ54VI49hbeQYTKuP8h4V7o9ink2uHBdZiXi55wzKraO1VcYPl7FapeKq6y8aSqjvx8l69+kGhFuN82kznCOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XxSmjfymeMH9CGdWYTSU0UyvsD6qiS4Js8/J7JwrqhI=;
 b=ZP/wIHeesb3gKJq3+3EErIhubUmmbKYKDy7/pIPAQW0NuMkF73Y19wcHtlwWYcAyM7PifOFqSjFS1ZV9wQ9r0IpIE4Ht4a5pNQ6ICpOJ1n7S4dmUG2xlZL2i4rMWgDjZizUJ/RjBci3WSVCYihw3koX9Jx0YjExBWcXnfhvxON0=
Authentication-Results: vmware.com; dkim=none (message not signed)
 header.d=none;vmware.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MW5PR10MB5716.namprd10.prod.outlook.com
 (2603:10b6:303:1a3::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4523.15; Wed, 15 Dec
 2021 11:21:07 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0%6]) with mapi id 15.20.4801.014; Wed, 15 Dec 2021
 11:21:07 +0000
Date: Wed, 15 Dec 2021 14:20:57 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: zackr@vmware.com
Subject: [bug report] drm/vmwgfx: Implement DRIVER_GEM
Message-ID: <20211215112057.GA13287@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0051.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:1d::20) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 116e1a31-09fc-4a2b-1fc0-08d9bfbcfd3f
X-MS-TrafficTypeDiagnostic: MW5PR10MB5716:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MW5PR10MB57169EA55BB3B6D31AA151F08E769@MW5PR10MB5716.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: y1ZLtlfV/Qm/i4GPXt5tkmDHzBdRITblBxRpG17k9/tp9jnF6AYKL2c5tUe5inJpq9KYRkSY359nIbpsW0I6Iru5j2sVj9nPdSqwCebua2bkB2yi/OMwOAlMx1VmJR/kpIX3uTF7oA8DJ7eLI85blzEzA5eMvjrnpLTXQOykLIx/GYNrHQ3g0rKgWx1gAyjSPPtKvVmC3ZJRZJFJ/aTTzSH15CUphsX77HmlQIZ/trlAsyJTs9MMxElu0c27CxeAmeGfcqbQfKMZQWTv8jEZtbYJ2NsEb3GuBN5jk5fnEaHaCpPm7hDSJRGtxSkANezN9krDEMWjD3wgyM5kyvpE66vigTqQiq8lJ8xjsUbhP9odaTL5z+G2+7gbK3pW2TbMDdmYzYm+8n1SYP0THOV3dVm42nQzSRRdIJL7rzOjrueANfBSfeHhMgkBw49+6ZEczgMiTPTTHWW1wgud4G9AQ8ELc00UPGVWdmaiIZLaVRetXRkD9pJlg9/ozedeIQxd5OZpKgxgfYTNqQOv+CcM5v8jdunZVsVGX0OBGq4BE9zSnEJbnB8FPkRiQ+Ictc86VHRcPTVuDQ3oEz663MoM5oiCnkdl30cg59bMJwppJju9vCldI57KSBvWJVBYAramyxjBEicrNgpyjvXk5FdHi2i8ow727ArXaw87H+oL3hyZDnT4SkOgDbVyqzRq0lRVbYZnqjrZpJmDRYHiMInRtQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(366004)(4326008)(6512007)(33656002)(52116002)(86362001)(186003)(6486002)(44832011)(4744005)(33716001)(26005)(38350700002)(9686003)(316002)(6916009)(8936002)(8676002)(1076003)(66476007)(83380400001)(6506007)(6666004)(66556008)(2906002)(66946007)(5660300002)(38100700002)(508600001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rc4c0JuKwAoVoYpbm8TnaTp/NPIhRKzDwzvz/yJhJRWQW7VJrwfkeQFb7UgY?=
 =?us-ascii?Q?3kIkvUZaJOJiG3WPZoT3GvPSYSibJlm1Jz/lRYZmh9KYXi0kTQQu09G4yilX?=
 =?us-ascii?Q?FfaTD8AgKt/a1ROPDTJET1CDnmhpZ2FAkuyXhWFEVGe3VCON0ekPLRKXjYiM?=
 =?us-ascii?Q?mN/tFQR37TEBijUcUoUIi9PGT826/A+x2HEtOU3AhodgHKrx8GdD1SnhK9/W?=
 =?us-ascii?Q?7nbZ4cTrCDls78LSm20BZExasyc10ctflCK0meE2Q1t2eOK39ITN7YDQ4PuO?=
 =?us-ascii?Q?/gybkZCG8K4q9BZG7Uk4/Nu20mXPWnLjDBgsVsT+klTVtPw597XQRdHSt0L0?=
 =?us-ascii?Q?qyxsho4sFDpwwv3rSYhy/1l5SxFu6RAf8BZAxcT9A/7+gaa5w0I7UjFWznmo?=
 =?us-ascii?Q?c9DUsd3MH+A53+iMTwdxdAxr/aG23Vuh//m1Aocs+gKWHczEhsbMBv5KHkA0?=
 =?us-ascii?Q?elxOaLre+BUEwXSftOJXLKaNip29aRAcsFbBXM4mtFbqbw+pkmUMCr/+94aW?=
 =?us-ascii?Q?AS6nE5+FF7dRgylrGdWoK/8uSh6NLVC0YnTRX4BAaImPbOSbWfNK/mXt4vwJ?=
 =?us-ascii?Q?9BLgvdwmL9/awXWMS4s0BmjqJd5prUXHEt3LJooPzEfWtRVLy19VdOpnThdQ?=
 =?us-ascii?Q?w44ULcdPrixh0Szf5T2LhNea38cIWRxEWrRNXiEUeJo38prWwV9nXdHM9DFD?=
 =?us-ascii?Q?HT+lSyQSPsT4wla5Da16Nwfc2UC4F39Z0HdwkOWumQVtl0lPqLeSreHzu1U9?=
 =?us-ascii?Q?LoxckjB0+Kow3PTnLv2Z6y3Xp/KFN/AgQaog3GiA0PIjrekz6WgrmHxCJZkG?=
 =?us-ascii?Q?JynYdjSTkfgABOZmJRk5nYffIdfjDokvmlFH5UKhusp+ZX9Kf4jmhs+xeEhY?=
 =?us-ascii?Q?YoGsQ3RHPXosyUkYDBnPspF6EIiwhnFRKTa3xg/FTU4/aG+ERjc15I4wULrb?=
 =?us-ascii?Q?hGj/coK+P+vVe1eehdVGPYAqo1K3/FgSpJCd+1IZA3DEIc+jTturSqJXZKly?=
 =?us-ascii?Q?nj0q6MtsuIPZ5hn+RrtI5XrpZ5DGkwKJLzT1Loj/hgLZCDrzY8rExof0LpnP?=
 =?us-ascii?Q?jMK/gE4JUMvGhI+jy6/8e2DulxlJfwdhRvztyD1B3Re0Eyf3kuP/uLEW5LhT?=
 =?us-ascii?Q?YznSq2q8M40DMrXq1u2rHR1xbhai/AWFd5DsdWSs2dc52k+wEC0w2gzRKbx3?=
 =?us-ascii?Q?nUxK04dc3od5HsgT8tubogMLCzG29sQwBd69PUE+BVneLwhklbRxpsXOeEAp?=
 =?us-ascii?Q?DlOJhHQOklENkHTjewdEgScaY1VqToSqVLO/lQ02dpW32vhpkv1KKhMfwPKl?=
 =?us-ascii?Q?60hBA99u+ya/h0e6expBMoJN?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 116e1a31-09fc-4a2b-1fc0-08d9bfbcfd3f
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2021 11:21:07.4214 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NLS8ExeEkpJwheLUnSONTfidoV+7Woquewe2WP4vL7SMrdSLDJUUW5InhQE8+gsje4/yU2ruuBfbMtTNTvA9mATR3fb9vQUXevCwZO5Gw8A=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR10MB5716
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10198
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 mlxlogscore=694
 suspectscore=0 bulkscore=0 mlxscore=0 spamscore=0 adultscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2110150000 definitions=main-2112150063
X-Proofpoint-GUID: urqhS5tRbXoTX6YET_xkAXpcOeKtX0YP
X-Proofpoint-ORIG-GUID: urqhS5tRbXoTX6YET_xkAXpcOeKtX0YP
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hello Zack Rusin,

The patch 8afa13a0583f: "drm/vmwgfx: Implement DRIVER_GEM" from Dec
6, 2021, leads to the following Smatch static checker warning:

	drivers/gpu/drm/vmwgfx/vmwgfx_bo.c:574 vmw_user_bo_synccpu_release()
	error: uninitialized symbol 'vmw_bo'.

drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
    564 static int vmw_user_bo_synccpu_release(struct drm_file *filp,
    565                                        uint32_t handle,
    566                                        uint32_t flags)
    567 {
    568         struct vmw_buffer_object *vmw_bo;
    569         int ret = vmw_user_bo_lookup(filp, handle, &vmw_bo);
                    ^^^^^
Can this fail?

    570 
    571         if (!(flags & drm_vmw_synccpu_allow_cs)) {
    572                 atomic_dec(&vmw_bo->cpu_writers);
    573         }
--> 574         ttm_bo_put(&vmw_bo->base);
                           ^^^^^^^^^^^^^
Smatch thinks it can fail.

    575 
    576         return ret;
    577 }

regards,
dan carpenter
