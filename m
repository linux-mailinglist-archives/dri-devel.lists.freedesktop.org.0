Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 178A841EEE3
	for <lists+dri-devel@lfdr.de>; Fri,  1 Oct 2021 15:49:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 302E56ECE0;
	Fri,  1 Oct 2021 13:49:33 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0375A6ECE0
 for <dri-devel@lists.freedesktop.org>; Fri,  1 Oct 2021 13:49:31 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 191DkBYc012500; 
 Fri, 1 Oct 2021 13:49:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=fGucJ0e0Xrqg4Yfsj8REz7c3dJVTWl12ehFkHxBokTo=;
 b=X2cNkFBpa8KtMyNQLu41OfJuIuHdX7C6Pph7KaeoMrqzNxDRGvGPes7Y+05+0F5jR7ZX
 3kPCJAsmoEsxWD+QXhWEb94F5qjlXcFwFpnHgB3qx2GPH/Lb++92kC6jAmfMgqTVHS8A
 FRcITwd9zJLF9kJp+XJ/JzO7E6tkED67jdobkwwmFr8cJ9JFWRlf/MKkyh0VMFMq6tsY
 JNaqVKtBkBnVKeabwvt67FaZO9L3pODTUAASIODBRKjH0dCfL0oKsk7XtZmkRy+myqic
 V1I3B047xVcmkiUP0VZsEZhv7H7XVD9t4kZ2XH4uaZU7BHrSNw0LGrgvulFoH9kszt8P QQ== 
Received: from aserp3030.oracle.com (aserp3030.oracle.com [141.146.126.71])
 by mx0b-00069f02.pphosted.com with ESMTP id 3bdevven9q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Oct 2021 13:49:25 +0000
Received: from pps.filterd (aserp3030.oracle.com [127.0.0.1])
 by aserp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 191DjKdp007083;
 Fri, 1 Oct 2021 13:49:24 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2169.outbound.protection.outlook.com [104.47.57.169])
 by aserp3030.oracle.com with ESMTP id 3bd5wcpp09-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 01 Oct 2021 13:49:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dgUfdLdpv6RL7KppNF6UNpJ5ITesnqPFuegHmGKVG71Su6TepR1Jyqi6ypegipClU90KSR3NQtROZnZ+W3uGxHgEbkJHkzzWmWVjw5g+VykMLJr5fS+b6MARgIifCRm4VLK79FyGoc4vLCn8prirLQWOmE9bp0SCn2O4Dw852zcS7hSzcMumOgzvP7jgRuzBRbKAwQJ0ebdfyFLYUod1zSJmLqlqJk8U0eCCPPYCextIz/uhaXzM0jHG0IrJPtTPAxjJYmsIvgjUED26BsqKkUCeVc89b3kB0aIYuKuyLy9Vrd+HaAZY6PQc56r1lhn8V3rs+tv+p+JhTAU4VrDO1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fGucJ0e0Xrqg4Yfsj8REz7c3dJVTWl12ehFkHxBokTo=;
 b=N4gxnB5jANHb3OFHi9LGC5+PvFkBhaPZOYIN9L3B/QtygSPDuqWxcmZ626QvXnNf6C9xbdCNdi0MJNoFn/hNYkZZj0HuvW7c1x3knp8svYHgrJZpd27c5Na3qh5H5GNbx9/3J8D+g+dIVWjQE/gNT7pXbFePu+zHPrYXnAC9a9Xsv7kzYUQkfrO5cak5dN4d589034I+/RO5B4guoJdOZmZmSduIWwzrIo3BD6KJRj3XaF3HIVFEmxasDLG51mBHWq5yTMIBxjk6YIIxoPD/pFFuwobwXV8Xpk4tOzOZKyScTlhPFt4/FghG22LX04a31Jptc8SgbdRlvSv2YnEzgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fGucJ0e0Xrqg4Yfsj8REz7c3dJVTWl12ehFkHxBokTo=;
 b=OK0aaLuVZZpg4d+GCdvWPwzwXQSg4ki0ckk03cZIE/COJdAoEdmqRzwYgPCh46a/sqKXiVXaS+ociLSWpowtoVJdTxdDpPEHQXu0207SOWlwjqdp5hJAzQLns1MyBV6Ck03B6F6xxr7TBDp185DXiQ6cJyTK8Bptzeq8BazLTUk=
Authentication-Results: codeaurora.org; dkim=none (message not signed)
 header.d=none;codeaurora.org; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1357.namprd10.prod.outlook.com
 (2603:10b6:300:21::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.19; Fri, 1 Oct
 2021 13:49:22 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::d409:11b5:5eb2:6be9%5]) with mapi id 15.20.4544.025; Fri, 1 Oct 2021
 13:49:22 +0000
Date: Fri, 1 Oct 2021 16:49:12 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: jsanka@codeaurora.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: [bug report] drm/msm: Add SDM845 DPU support
Message-ID: <20211001134912.GA9248@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0010.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::20) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kili (62.8.83.99) by ZR0P278CA0010.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:16::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4566.14 via Frontend
 Transport; Fri, 1 Oct 2021 13:49:20 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bf3d0995-5cc3-420a-948c-08d984e245fe
X-MS-TrafficTypeDiagnostic: MWHPR10MB1357:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MWHPR10MB1357A94CEC7017F33947BA528EAB9@MWHPR10MB1357.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2887;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ee/28PykiPf+0AMvr2H+ho9f3uljPQZzrmtgQr81uWMeL+irFaGjSfZe3mgVhsCFOk601r0qwkiDvHiKqKhaCctS38MVJpkk6tR4rH6tutsHGS09cM6D9McSK9f/Mk2xZM8XnalbT/48/qRyMZ3bk2wUwvu9gywyqxGdEkRQVUdk4+TK2HDKfu8nXqJCS4Fnepi2iHV+ZNonXy4GXzaWu1kph8zEp1PJmV3s5K+s4QLyFy9wzkaSBJI9fjsD6ytemfc6GMp7uOd+6Ir8kQriPTGI5odo+uvLYBiigkY9uSMy7+psEQKCkSoOqiZNTiTGI3e2e8flkRFlYyv6iJesW1l8gsuLojOZtZGBMdgHO9AMbQiJ8QGHjeJDXEXEo2f14CHNBJR7UVcI7b9Yc3dBDBIKsxC38kKy3PVLH6psD3J0mW8ajuORR0E2BxdRJNrXiSPP6D0RH3Z2nI9pAzPPqAdXMUSUUA5AXcXLfDaHAgRpRGA5Ok6O3NW2kAnLHTkwaAz5Hx+g8vTtuv9cJR4kQcmQ7TgxrocrmRt4CkaLHePNFmNO78EjGHSr57f0hvvipyqX+vuP8CMHd6Gm67PdhAzzVh7+ZJ+Xke/NtVYQzK4WXLTg/y3tLzLnBZ3fWXExcKQBXJeIq9CSXCz08S6D9RB6ZwxmiD++pPcd6+VRkaQ4WpnId4W/0uQAscDo/e+sU30hhXZqe1TeuTYtK7cFqQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(66946007)(66476007)(66556008)(33716001)(5660300002)(4326008)(9576002)(8936002)(8676002)(6666004)(316002)(44832011)(38100700002)(38350700002)(83380400001)(52116002)(956004)(6916009)(9686003)(6496006)(55016002)(186003)(86362001)(26005)(2906002)(508600001)(33656002)(1076003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rDJucrBc6t6ElJzhnvQfmFGlUNdEF/yA+zMIacmQud1ED8GA+mQNzlOD/eLk?=
 =?us-ascii?Q?OPGgIU1xLXbIUaDHFDhGPQsiGGDCAX5xVftGhF8YXJbhOTvN1H1ma0dzkEcy?=
 =?us-ascii?Q?QTn+/w75Oh+x0wyG1I2nndraQ+QJZ+xAk4vzys7atKb7xWSVIzuc4IwFaglk?=
 =?us-ascii?Q?9GmlsNQ7+CKT6qk70yNcGtTperlBd88a1IPk8leIZJNCdL8/xAORuD9QY8rY?=
 =?us-ascii?Q?gSto5975EcRPdcqit6mSilmtrr7PSNdAdUmV4ln3/9FcHptScjyazm8JrL7c?=
 =?us-ascii?Q?jSHZMlwR8daErDcECQRr1vvZ94RNWKxuxEHHRF3f+zOLVpqEYhCINI40fc+o?=
 =?us-ascii?Q?mzphzKY/RhcGQO6qq3eEBlOzLbN3Q9fbk6oLA2qOaYifIZhUWwglusVYXwIe?=
 =?us-ascii?Q?4K82f59y/kLAquwuDNglCQzqJSZ9Vgv6KSCZDAprMdMPYHeU+hhDWdHpwe6K?=
 =?us-ascii?Q?+/u+j9nVCLVBcljQgFPYu2v7nJapipyqc2g7xhSrWNTMRtEvWV1Kzffz/Cy2?=
 =?us-ascii?Q?ut6DCefiCER7Qd1Hcy8abqTgQWNpxxzDgd/oXM5cBPm2OaAKFlAMGgezE3vn?=
 =?us-ascii?Q?wjhRCEy62ELDCFcLp9Wir2KThvrhWkIKxjHOmfMWfEOfpazra2yKVRqYHLEN?=
 =?us-ascii?Q?MKS0c1wfG8q/slKphxiA2d48OnmSTN4aXQeP0bNKyHr8QXeJeerY+qZ3AUp1?=
 =?us-ascii?Q?lcQ9RutiiP6P37QC1uYjjbfkFoezxXR8rghQwjAStn8GA+tJ4w1ipwTL3snk?=
 =?us-ascii?Q?BLZypmT5JdZslDJ8CGM9njnJHYijUvpO8h5KShFf8O1W34w4aGIdKInm0TdF?=
 =?us-ascii?Q?kzTu7tygAWxHPg41KQNDR0fXomrqjm6oi90jNPQmzex2/ZO3dW15k/zpjGPz?=
 =?us-ascii?Q?XRahT+MwoT36umwUwQRXCb1IZJ/aF9p0U0Fg788W8u+ZrM+0oRVkklV+2iJB?=
 =?us-ascii?Q?ETKJk5ilBfQ6ybuSezyfBD/m1NuBnJz5NEUkKr6SAFJYT02Ar0tpkFLXg/9I?=
 =?us-ascii?Q?4pDZ5m86Qw0QxRWYobyXDkDgHvCKJUmy6GUfFnZS4Qv+Utpx+Mb3+vRFb/SG?=
 =?us-ascii?Q?jnZWxibaUO9akz+rAnwYlWSj665o7ogUnKEGC+2M5VpZy1GtX3dWbUkBhbyB?=
 =?us-ascii?Q?TkHASSq3YYTzvJ9hs54f5tnhdZZCPTLQJ1hDoFol1RazlT3qXXDRwqTBBmwZ?=
 =?us-ascii?Q?ChmfX2RDYfBahSOTFCPmXS7sAQcwIxBxJN0aFkKUMcHUv60OE41xzDaUKZIq?=
 =?us-ascii?Q?+TpZPOXy7tAM0bmbz2EdyFXOSx3ZUJoZUx/2DoJLYxTOcBAHEVz1bG8WSrlQ?=
 =?us-ascii?Q?d9LRjWbBobMMQWwCV4PQgVoV?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bf3d0995-5cc3-420a-948c-08d984e245fe
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2021 13:49:22.4981 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6keFWOyjAcAPz0kTc8RF60pwGy9cDGPtG6bkM7AMvvP5+xrx+zKsUBAD8pw5EqlwwygBvvvwbAGJzQfta77642Ewfqgc6bGhzE0FIwIwptU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1357
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10123
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 phishscore=0 malwarescore=0
 suspectscore=0 spamscore=0 mlxlogscore=917 bulkscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2109230001
 definitions=main-2110010093
X-Proofpoint-ORIG-GUID: V6JrQ8zM-3lVVEpYImlRzxoOUWRcYDBt
X-Proofpoint-GUID: V6JrQ8zM-3lVVEpYImlRzxoOUWRcYDBt
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

Hello Jeykumar Sankaran,

This is a semi-automatic email about new static checker warnings.

The patch 25fdd5933e4c: "drm/msm: Add SDM845 DPU support" from Jun
27, 2018, leads to the following Smatch complaint:

    drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c:422 _dpu_hw_sspp_setup_scaler3()
    warn: variable dereferenced before check 'ctx->cap->sblk' (see line 421)

drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
   420		(void)pe;
                ^^^^^^^^^
You should file a bug report with your compiler devs instead of adding
these sorts of statements to your code.  This function is used as a
function pointer so unused parameters are normal.

   421		if (_sspp_subblk_offset(ctx, DPU_SSPP_SCALER_QSEED3, &idx) || !sspp
                    ^^^^^^^^^^^^^^^^^^^^
The _sspp_subblk_offset() dereferenced "ctx" before it is checked and
then it also derefereces "ctx->cap->sblk" without checking.

   422			|| !scaler3_cfg || !ctx || !ctx->cap || !ctx->cap->sblk)
                                           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
So these will have already crashed before we reach this point.

   423			return;
   424	

regards,
dan carpenter
