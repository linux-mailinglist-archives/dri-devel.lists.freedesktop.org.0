Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D56A53E2D30
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 17:06:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 702226E1F3;
	Fri,  6 Aug 2021 15:05:59 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E79CA6E1BE;
 Fri,  6 Aug 2021 15:05:56 +0000 (UTC)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id
 176F1stg017381; Fri, 6 Aug 2021 15:05:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=jPZEU7d1VT8FhJPLqgf1mVA/61UaW+V1rmEc7yeeRys=;
 b=f+E3Hrc5E9VnB/j4OOdxuJDFGkO8s9uEDbcRDwiCRfBrn46xzWgCuwnWjr0yXG5cw0Pc
 j2wxECQ5F4qPCIaAc7cu2HypeXtcqCa/1da7xR3nZ4s9eATgghOVErjm6BRfMRhV7s1J
 OGynjwd4s+O7FHcdAmvGQ/+Zow5Ig8EO6+F3cil3zBJZk7wRWqMg6RMv141nzQ2Gnb7k
 HxH2vp5FVnfgkH6xXgzIUIb15qgxRi0kpEAHICGWLdBGVdM/ArdO35XKE9WujDwvxv0J
 G07bTSLNw6UklDRr8HFl2ZAOKqljTolkKvZWuGaGD5XJ3hJh29iezWQ1Qufng2Z3sGYe Dg== 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2020-01-29;
 bh=jPZEU7d1VT8FhJPLqgf1mVA/61UaW+V1rmEc7yeeRys=;
 b=LQZSKm/QPB6sYFjjidbD9JLhYCfBg+5tn4v0S9DZszEcEq0edWZ5IC0j4Iu2u2oijxsl
 8vbQdVgNYb4jeMqpO7evYJOws8JISoo1PjXAxFfGgNI2LpeFF26uZKQtxibLgC1Fs6Ef
 o/KWs1CpU0St5q6JCk/tZSa+Hl+8cu8oB+I7opzjofryKxVnXIJ7t6AqqIkTMeyQsCiS
 L1YxaNGuwYwRDgmzp7fQehB3VHZ+5nheT5YDJhq+TUS+yYL7THzGEvvsZaIcYq3ZsPKF
 6y34SmbRAmmsw5Oat5VSwwpw9l2w54p+fvH8C+zJYMD5/aug4o78WJHW1nxkHpIFBvRT ww== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3a8p6rhwy2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 15:05:53 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 176ExhI3115057;
 Fri, 6 Aug 2021 15:05:51 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam11lp2175.outbound.protection.outlook.com [104.47.57.175])
 by userp3030.oracle.com with ESMTP id 3a962nvm4w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Aug 2021 15:05:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WqdG7Q3GRr5WHCL6HaBw+r99ewrPKvtXaVVNaXHA+lWrDgc1YqHN1kdD6ybgxuMbYyJL9Ex0kVCK3WBaeMyImWW9FovQcIc1BOm+hvp2yZm2bE/OLfPFpIzijEw6NJtHLX1ITzAZfBbp+Xz4R6S65GQiKtAtfXReXXvC1DeOK/UxcsIgdRST4+ftM5s1xnyqDH4OobZ6Bwud3mO7+BDIZFYD+tTQsmvnlhwsttE4eTu5uFHXdA9qtqWVi0QGt9p/oG+rmiVoLl46AgHiGc+NYkzr/31cNb6lao36QremLqbC8O6W1XBnD+6S0kQNBkgHeU/i/9ku1kuL4GcLu4nGTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jPZEU7d1VT8FhJPLqgf1mVA/61UaW+V1rmEc7yeeRys=;
 b=Gv7xkQGsZy6rUDO7LPZLfKmJX1CaWUEH/IhLaaKesqui8ofuzKSqwf1Zn7r7LRpCvLR3VPl/PQlKk2YOibOuAU1mc9IFx9G9eKusA+DSXwZ0IH5TCT910FphUUysQW3NCPl+Rd72zgOPYVtOSvt9qWXBCZLMDP6c9/isSSSYTzC02yuHOrOEygIizzdK7RPKdHG356ekzUVhuGO7ut8km7xLifWcsjpWitl138LKqj1/5ojARVZfBvleCyOHAc57UbvKE+BHBjQP9EHhGKRMEu/gLR3TIq02aEd3l2Ks7gL+ZSGYTryozd7VtDpXzlfZeKhu1O8P/Am3Z6cgC7KOkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jPZEU7d1VT8FhJPLqgf1mVA/61UaW+V1rmEc7yeeRys=;
 b=oifHnn8irzBRgfT6PvZRGnTm4EROB4ylJ8IpBr9S+GdTdGnKNkV8+NMTqQ1HhXNSgC9GnpJyrJuGX527SAHiJqXHAq2NJUyKkPXVUIcAP0jsMZwRwkOcGK3t5lplVzjQz/l01Kko+2XZNbgirdnTn3kLUsa/ce2RBe7JAt2cZFM=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=oracle.com;
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by CO1PR10MB4417.namprd10.prod.outlook.com
 (2603:10b6:303:93::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Fri, 6 Aug
 2021 15:05:49 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::5820:e42b:73d7:4268%7]) with mapi id 15.20.4394.020; Fri, 6 Aug 2021
 15:05:49 +0000
Date: Fri, 6 Aug 2021 18:05:18 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Alex Deucher <alexander.deucher@amd.com>, Ryan Taylor <Ryan.Taylor@amd.com>
Cc: Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/amdgpu: check for allocation failure in
 amdgpu_vkms_sw_init()
Message-ID: <20210806150518.GC15586@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: ZR0P278CA0162.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::13) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from kili (102.222.70.252) by ZR0P278CA0162.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:41::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4394.15 via Frontend
 Transport; Fri, 6 Aug 2021 15:05:36 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 6e88e1c4-8749-4657-e965-08d958ebad0d
X-MS-TrafficTypeDiagnostic: CO1PR10MB4417:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <CO1PR10MB4417EA1910FDE95859947B828EF39@CO1PR10MB4417.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2399;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x3TQIwB94MCqksp5UC/UqdeEcBc3wBKXAoO6YzJm4v0vmgXyFRqjmzLeRiNBVIYBFhu0VMkDq2M0u4aIdRbjWgM7zRVapLUyJVgB39kyn3JUv8Nk91S0h/H3qBhivJBlXBuP02XhY3kjmqUmVoR5KpChFPWPLPP6DDBVlYNlnEK2Km1OPTAlFtDJH/N1wcwoCzvgit+XkvaW8ycRU0ZlNOFgoCPSxZeX+TfYl94rEf42KRBb5ku1IUDpH0nqoHYj3d+XCtEbMinBKvLb0E7cGIZFf6Sd8869QcOXEdD6Cf+0JCSopjhddrEBsGnKv5pyfDjvlwU8xayZWug4GAZaPSJscKW7v80+cNajkSPNHqfDr4T11dOeUAaV2OHlbU/XDKclym281ItImcieAyqkwHNsCLo8yUsrvc8o4NjhpkJxPWqUGbg7dhRCQmHOnQxQY/MYhr9Mu/TE9ZHtPNH//4smlSIJef3vAtEuvX97EmKjossE4GbZ7x1+3eYaLr0q4a0Cw++OPasPUUcS9ftFH4pcnyzB8l0P8AfBlaNm56lDmBJmVZFtDIyckfhJs++AOr7SOI6oAV8hxpIWCi/9ldxgeCPwu03HPJvasRb1VSe+ZhgpicdAZDdLgnmqropGRAdkUhCge2EWf0qODNwmIQIlFxC+rp/RCITXmx+jL9E3vPl7wDba5vao9DPX2ubGnYxDGQo0udxoq+x+JDh/aA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(316002)(52116002)(508600001)(44832011)(54906003)(2906002)(186003)(26005)(9686003)(956004)(38100700002)(86362001)(38350700002)(110136005)(66476007)(33716001)(66556008)(66946007)(6496006)(8936002)(55016002)(5660300002)(4744005)(1076003)(4326008)(33656002)(6666004)(8676002)(9576002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?poRHUOUURB2lF2IIlVY7cdBVBNoAfY98eio91bxsYRUvhdBj96r5ULbCx2f+?=
 =?us-ascii?Q?wP4qQeEKfGth8rdq2+ue+fgX08VVTZhUGH9eIIBrEZBn6ujS5BVsQJOVTRNV?=
 =?us-ascii?Q?DxY0l9WWxwkReRXfMB+34tElaAv944iSGy6JITt5tpzf5U6iyLS8TUSAQQPo?=
 =?us-ascii?Q?Kn8uHNrhKPhOuls6QuA5zY2GmHRHG64W/m1rP/MhJoAR0l10R1wJfaaIU3/I?=
 =?us-ascii?Q?BM4fRJ9mfr433HdZUOUhwbZ+r2Mykic2KNF2ATgWFZWqCka6vxetvbMlMOyX?=
 =?us-ascii?Q?/SL2TC2BiuFm1NaJkrEF/niA+CsahDOuyuZ4V8adOycFfVA69Pdj7qwUX68E?=
 =?us-ascii?Q?YtMyyaTQr88boWs1Fd31lp4F03qOsyAL1a7XMQd8jPX+us4NbxXRdoGW+PJg?=
 =?us-ascii?Q?mrqxwocwkvuVHSAoY7ZnfRC+2KSh04fUvQ9dy9I4HtJwN6XgRqNuyRfbTwPB?=
 =?us-ascii?Q?RAQoGV6qiVqTMfvFzbiZqfqJIEPAtdi8mxnJbIH7Xa4etPHakexqnMrsppHO?=
 =?us-ascii?Q?v3y/pfol4bRnXsJ+F5H6kDsjy8zmzfjr1yhxR6HNiQHjEK+ViL5qqWhOtO0k?=
 =?us-ascii?Q?LnOmx+hlwXR54B6NwNdbWnR8hXIk2j7/dRytW/rCyXjXVsd/sVQrcCREzWD/?=
 =?us-ascii?Q?ubiSa5DVtG6TgOEiMOYVj/CpVMA0nDU1siqvb4bEhy4vAJ/pEUS6GXLFBJhE?=
 =?us-ascii?Q?D2PcHl+fa43idMY5Rfs1Nzb8GCNuz5Tb/KnSWoKZWdEuGed02zpunYPCpNCp?=
 =?us-ascii?Q?ptgzqE3Twtk+FdrLC18pRRTVG0abpqVL7PK4KJvtec2xDPy+rorVHhCAT0i+?=
 =?us-ascii?Q?ibJhFjdo+JELgTl5BWJIwlwxU6BhuSiD75M1shWtUACJLsPehiYlgU+ZJyK9?=
 =?us-ascii?Q?jcN0fCopOfPtEF+Zx8QtARzD3znK9JaRQxXirBcVwrDhOJcHyBYY+iGbvsMH?=
 =?us-ascii?Q?GEmvXFYM7IHsEcJf0YdKrxLqQHnlGxtV3dPQz5xcUQ8+ToVtD2qGyNcD100x?=
 =?us-ascii?Q?IbhAhXAThYrDo1JrSXsGIG87N0WWoEBL9P90Ir9Ma9qmj1F9wxa3k1Tf+cnc?=
 =?us-ascii?Q?YQEnM1BW9mmm5HLEp7PRDyNwRufCAA7C8lDa1d3MqitJIYTf2mUShRPsaOwJ?=
 =?us-ascii?Q?UhEptKXjGN6SSWnhl71xaCPgKj4sT7kj5cA/fzo1cyCczpLFhhprzPWv5rEY?=
 =?us-ascii?Q?HSNxjrcgby9j+YQThgS7ZKcd9/GVAMMrWJ9so+Ofa/ze2uiBfU+gPvjN5WBn?=
 =?us-ascii?Q?m/F3Brms6Og8HdS/oMamDFFBpOyAk1mEGcMRg3sMrfV3juXS05l7EDvUxLkt?=
 =?us-ascii?Q?aRv1Pu59Tj7qGpOQRUkASegV?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6e88e1c4-8749-4657-e965-08d958ebad0d
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 15:05:49.5723 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SenkDzTaDI4iLcbNv6SMzfzNkOKA/AyDUyQI0DEaxVfGugubQHx4qw34NhZL8xxlzCexrtQVCneNYD1gW2dVr3COd7mGGwe636Lzy0KF6MQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4417
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=10068
 signatures=668682
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 mlxscore=0 phishscore=0
 bulkscore=0 adultscore=2 suspectscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2107140000
 definitions=main-2108060104
X-Proofpoint-ORIG-GUID: COKQteU4o5R6f77qgeo2DB7mBHY8tQ0A
X-Proofpoint-GUID: COKQteU4o5R6f77qgeo2DB7mBHY8tQ0A
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

Check whether the kcalloc() fails and return -ENOMEM if it does.

Fixes: eeba0b9046fc ("drm/amdgpu: create amdgpu_vkms (v4)")
Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
index 50bdc39733aa..ce982afeff91 100644
--- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
+++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
@@ -482,6 +482,8 @@ static int amdgpu_vkms_sw_init(void *handle)
 		return r;
 
 	adev->amdgpu_vkms_output = kcalloc(adev->mode_info.num_crtc, sizeof(struct amdgpu_vkms_output), GFP_KERNEL);
+	if (!adev->amdgpu_vkms_output)
+		return -ENOMEM;
 
 	/* allocate crtcs, encoders, connectors */
 	for (i = 0; i < adev->mode_info.num_crtc; i++) {
-- 
2.20.1

