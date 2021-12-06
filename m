Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2FB86469937
	for <lists+dri-devel@lfdr.de>; Mon,  6 Dec 2021 15:41:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C754C72EBB;
	Mon,  6 Dec 2021 14:41:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C45837365B;
 Mon,  6 Dec 2021 14:41:34 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1B6ETnCo030788; 
 Mon, 6 Dec 2021 14:41:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : references : content-type : in-reply-to :
 mime-version; s=corp-2021-07-09;
 bh=UtTzc1/Yiev7pNfBuGXvuVCQVf0m18Yrx7oJYZiWsKk=;
 b=BqAumrXLKXVxxg2jCJEWuREVbM02gRoK/JbFwpjPrh3DseTnBVu61mGC+d/VS0Xssuji
 NTDMQaN1qj4q9in6tMIHUF1NM0KopzxM+WRD4oy4oYjwD/e26gBcKcPeLv3CeACrkxZR
 9F0MLFT5JGSbWiKMAPz9v4yVIg2GfGDqeZtcFhFYfzib0H9TZURN5F3cITZBxVOf6Kok
 7IdJb5o+tjjhRq3sX7Xyr/FGuR6jvgB/G+61Qcig5Vim4r7X7777AAxdBwJRbfvNMJYI
 tE4mLwqz34HQ6tzaYsEtK4BMxf16EM2UT4iemLyD6oWB8HIUifaN7M1Mt0ZldrAvxBCp QQ== 
Received: from aserp3020.oracle.com (aserp3020.oracle.com [141.146.126.70])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cscwcad22-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Dec 2021 14:41:18 +0000
Received: from pps.filterd (aserp3020.oracle.com [127.0.0.1])
 by aserp3020.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1B6Ea2kJ136130;
 Mon, 6 Dec 2021 14:40:34 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com
 (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
 by aserp3020.oracle.com with ESMTP id 3cr053gjeq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 06 Dec 2021 14:40:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RlCkd0nNbCbfJWBH2ZL2cFwsQZSEHtnjfeWEI6KPceZo/SujfKGVcpsg/u2/UplYX/PNOTit+a8Ca5BgECfceZ4njoSV7m1LWRVu02TM3RavfojQbbb8HnAvlSRsMyqbngPElr07XUD9aXu2EQQuuF34Y7sCz8UfXcjhneF7JMFfL/uvsJL9a959uOOWpkoZ+3OFapXqF6cwjAxBskzKJwQKtVC828FpC7SBRK8Ld6/MXclNLTWVl0SLLs+SADQFr4okGEE5ytAc10LasiO+XbpNj0FavxQHaarwGPsm2X4kdJzNT+qkh9ZiIOPHbDmCd+wd+kSo+KBhNfQNmo8Cig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UtTzc1/Yiev7pNfBuGXvuVCQVf0m18Yrx7oJYZiWsKk=;
 b=FvwPIOsJLTrPKGqApH7uIDS1ZdL87AzR29tsWYuwKXFvNORoIq0Arc4SVkmTa9c4sMXugmg9LlU06SovqnVtFW8ABb2iT+gw/eia7YEN529RiTs/i8/mCoSPCSbli6XAZ6tBSoTmG9C+AV4rJT7wo+l6h1FXDdd4GG6TIG2dLQKux82KatmwcXBDFvesuBb4VcihKT8GG1s7hf5wEjneFEKoOJhrGnHJRmbzP4vuBsYpB0w7e3fxJWJ9jq0OwoSQ6TjCGdpizEm0HjPDAjXCtgbmJ1th5tKesD/neQz9AKBo87OKgoSgMfUKLJfLpi9dJWRUUAcmsXQICShIf/xYug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UtTzc1/Yiev7pNfBuGXvuVCQVf0m18Yrx7oJYZiWsKk=;
 b=W1h3G4Uq35jJ0gPmO+9GspkahhEK9le/OHllRvIz6KwPEb56Kxo8ImJz+T0y98HXlPVSYNWlBf5ppiFsnYVdfaoJjVHsoX0Uqbwpro/1t+I5e6XjqUI8roQybNr2NR79nquw5kAkn0EL/8cdPFjEYA5gZFv9SHQUmZqcb6rOoyU=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR10MB1552.namprd10.prod.outlook.com
 (2603:10b6:300:24::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4755.20; Mon, 6 Dec
 2021 14:40:32 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0%6]) with mapi id 15.20.4755.022; Mon, 6 Dec 2021
 14:40:32 +0000
Date: Mon, 6 Dec 2021 17:40:07 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: Thomas Zimmermann <tzimmermann@suse.de>
Subject: Re: [PATCH] drm: Return error codes from struct
 drm_driver.gem_create_object
Message-ID: <20211206144007.GE1978@kadam>
References: <20211130095255.26710-1-tzimmermann@suse.de>
 <20211206104233.GD1978@kadam>
 <4fa29fcb-f936-b590-7691-90f0579a54ae@suse.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4fa29fcb-f936-b590-7691-90f0579a54ae@suse.de>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-ClientProxiedBy: JNAP275CA0025.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4d::18)
 To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
Received: from kadam (102.222.70.114) by
 JNAP275CA0025.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:4d::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4755.11 via Frontend Transport; Mon, 6 Dec 2021 14:40:21 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 48ff53c9-6ca9-4b34-e14b-08d9b8c65af7
X-MS-TrafficTypeDiagnostic: MWHPR10MB1552:EE_
X-Microsoft-Antispam-PRVS: <MWHPR10MB1552BE2F4E27EB2A6F4851168E6D9@MWHPR10MB1552.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: b1oNL8bi/zZmFSyG+HdS19cjzipsfgEJ/+JYb9qfmGxkz7XBVP6WC+7dvEDTWNwxui85xVyT3mZTjVzPPyiceUhkHM2o3D4H/J2phWL5C70f1mPP/4zkMuvd7mY/Uy/DbCLetvYoMTYARl/1bHtqF7yitw28KqZKs0xN2PkeWsG910iGu0Ur3dgYOUbWRJPgSH/QmtHSCFY7CN+w53oNWS3hV/KyIqUF4cQWzW75SlkWNNwdAuKiDlhOb1qXHAeeiYouzBP85OrRNWVaiCZ/JQW8Gg91/w3YzNmeSSn1fCFoFpKAOBH9bFDxYDGxeX664c3KAPEhoBOztg49UzVho2XR3Szdn2z9PBGBx0wPMr1Pi+kbJjMKUNodQl9WQsSoZMP2+TQ4fMa5LVYwJHCdMwoBCNsGw0V462c14td+JS2K0qVQVkbNJjyG2MC+X15TFbXYDFD3caSIOTY79fG6wGwKXE+5CRWRkbOWD8yYFmAaRCsCoR+OHlmFVTrOuA+f87kOCJH5GeZ5HULk73Wy1VJTixl0+22JQDQOrvn32VQuHEWzAuCzLlE4IJGWqVZvaKbj8lp3g1L4gzbAnmfbmMw3EDTWBl+lz6lMfjuZATiWlzPNRMO1bHiGX/3REVi2JZaTcqqDRIqHbS9phvQ/qw+nhw6yMtYAp3W8cJYmRNjJ219/TzS/7Jk6jKebotZ3j9c9OUTHkTyE6uaCcj3SdQCrZnN0Act5HwyjOvMdU71kOsdBkyBnTR3ZaX1MV4utoxWAIwyWPxaOvxZCYlBnBgqY77+B80kFC1jYC7AKHFVJZTv/aNNhJcrXdDmz2i3Z9+UUo5jWaMJKrgpUL7Br0w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(366004)(5660300002)(2906002)(86362001)(55016003)(9686003)(186003)(4326008)(316002)(83380400001)(7416002)(1076003)(52116002)(66946007)(6496006)(66556008)(966005)(66476007)(38100700002)(8676002)(38350700002)(33716001)(508600001)(8936002)(6916009)(26005)(33656002)(9576002)(956004)(6666004)(44832011);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?D8ocNDDXNzox1ipWRwrHGWOXn3YQ6Arwe6z3xVAVM/u4hfdQ82qsjz6/AXtG?=
 =?us-ascii?Q?/Y/JaJM1hL7ZlIC3tfbreW4xDqT7aZmoBlESiiSxu9Zq9zNOQ6qpTAHNY+M4?=
 =?us-ascii?Q?Xu9SYfL5DSwBu2DFtimAiC9aJngB39DVJUvLTrkNlpgiW7Gn/9gUdanQ/JLL?=
 =?us-ascii?Q?1B067MuUBnm1r71dvjI1bao6AIp0Wv58lFRVyaJko5NWlLO8Fzik8rXmgJCU?=
 =?us-ascii?Q?J+2uE9+AUk4TZKB+q0rtgYNm2p6sd9l1jg1lotU798eQnHrdpTre32+2yib4?=
 =?us-ascii?Q?E1kmso8dhNceGY9hWJpqz89klPQ/BVPOA3YjXbsMPRRcQRC+SCSWtQw/4bgk?=
 =?us-ascii?Q?W5q0PUMbHJsLfhg/nyhO/Qqy3pNrNt3c4o1l/pTK1mFz5TJBKHo+AlidU+i4?=
 =?us-ascii?Q?dXSeaCtPrl7ciUydD503z+gu4WP/9yQK6YI64K2UVRaah7D1eXlq39EmyIcR?=
 =?us-ascii?Q?uwC2UPJFw6JLmp+j5YDC583iw7MqYolx9lbNuUdw/cSNWwX63VmwuC8m6ZdO?=
 =?us-ascii?Q?68Qho2pUaBq4gUxXo0nJ0Toj7YkgdReQ/nqsqjvfMXSZPUqMV5bjphAw7C+/?=
 =?us-ascii?Q?IFDB1WgBU6kUs+YD+E/2/Y7hdbXfxLNs2eUpYnEbgJWQ6x6bqIbCFI3Sv52h?=
 =?us-ascii?Q?oX5BvERF0+u229E5YxwZ7FtY7NinbISZVJKBQpo0iuIn3uWQGgzoUBEqMf57?=
 =?us-ascii?Q?NtMtn6pNceci6Vj849GFCHvlzVwBAgpSJBC+2m0HaT7evOf9DTbpKY07+aae?=
 =?us-ascii?Q?DagB++EsWT+Dg2Z5TaWqOr4EF8W+Ug9itpPtaqPSc3pzYIr2Qz+tH3YNeEsb?=
 =?us-ascii?Q?n77Ysj2Q0b1D9SyPWCUvT6SmwyPP0hsLNhSPYQa/FGRx89xYztcE9VZJWyFa?=
 =?us-ascii?Q?3uh9c4DuNi1HWobubw3ugyKQO92xtkABK2CHGWc0sUCYWQj7mNmZMGVj/+wX?=
 =?us-ascii?Q?mC9rGlZa5JNjCGeb4AO2uHSkekZwcHFObgUBhSzksjfoVqzZlApbj+UyyGIq?=
 =?us-ascii?Q?bZQRfEFf6/xyXGw4FJUillGtj2PhtE6Ae/h5omVp7SZAJyBq7vtHUSBoFtTn?=
 =?us-ascii?Q?xyPBiD/3swihyM4bL+oWlndWaA7fFfF+yafT/hw7C2/gDmzYQorGAJksPh2O?=
 =?us-ascii?Q?oBLfsZAGFh8FIyYEh+rl0sT0zCffjx49B0IRztbDiQNroEEffTdXL4nWdiJE?=
 =?us-ascii?Q?rAeS27Im1kKnwkpOjfG/C+UcNAQKtLDDZtKkjITXilwG4dnwTsLi1UzdKwNJ?=
 =?us-ascii?Q?E0z2UhHCwMZdiuOYUWtxPMBGpFi0kl6Mgfl5PNcT8H7EKW2gEFgKeKw68UaH?=
 =?us-ascii?Q?ZSiDdcrik595B5veRAb5wWgWGoWZ58pb93dxB53GLnjRvc9LvvLmeWvzqsVs?=
 =?us-ascii?Q?I2+HNPPTElaw0ZgCIiDa4All1mLWemkLwOsLV6ZGZEDgd2fEnKiVTYJLi95n?=
 =?us-ascii?Q?CEmX1A47xqI0fd0XHscGrC6KjJ5Jse4eggMUQl+7YeJtvjHXi0Jagoeze4kE?=
 =?us-ascii?Q?hA362SAAaWhrhvUAMl8nCwT6aFsD9ZiLck7TcRA80Rt6/K/gCv0lLhDgpZl2?=
 =?us-ascii?Q?b0nREqTaPhICgwEF4Qy31LvxBvjSFzXCrCPIUROnIQjsgVuYCFgTsrAjI1nA?=
 =?us-ascii?Q?JY+ylpYMIxna5o7zzN2yMBk9sxLwOnoarFkTm6PUAJjVJaDkWphcLOM6sRJK?=
 =?us-ascii?Q?XoagRTuc8Xc6HZ3m1bgNW6pEGkA=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 48ff53c9-6ca9-4b34-e14b-08d9b8c65af7
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2021 14:40:32.3602 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Tx4YM/RcjwK2e15NE6Lhm8tZyrgxxCE/X1uLV+wIGYGgOwTN+gaFioexU0p9RrNF4jv9nS/6yG10TxN4h+0CmfJo4nc5+4SiRpAjPUKwI0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1552
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10189
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0
 mlxscore=0 phishscore=0
 malwarescore=0 spamscore=0 mlxlogscore=999 adultscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112060092
X-Proofpoint-ORIG-GUID: yWHrv4WsRw0caV8WInXoiGmuZmmrbzec
X-Proofpoint-GUID: yWHrv4WsRw0caV8WInXoiGmuZmmrbzec
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
Cc: kraxel@redhat.com, emma@anholt.net, tomeu.vizoso@collabora.com,
 airlied@linux.ie, dri-devel@lists.freedesktop.org, steven.price@arm.com,
 lima@lists.freedesktop.org, yuq825@gmail.com, gurchetansingh@chromium.org,
 virtualization@lists.linux-foundation.org, alyssa.rosenzweig@collabora.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Dec 06, 2021 at 12:16:24PM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 06.12.21 um 11:42 schrieb Dan Carpenter:
> > On Tue, Nov 30, 2021 at 10:52:55AM +0100, Thomas Zimmermann wrote:
> > > GEM helper libraries use struct drm_driver.gem_create_object to let
> > > drivers override GEM object allocation. On failure, the call returns
> > > NULL.
> > > 
> > > Change the semantics to make the calls return a pointer-encoded error.
> > > This aligns the callback with its callers. Fixes the ingenic driver,
> > > which already returns an error pointer.
> > > 
> > > Also update the callers to handle the involved types more strictly.
> > > 
> > > Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> > > ---
> > > There is an alternative patch at [1] that updates the value returned
> > > by ingenics' gem_create_object to NULL. Fixing the interface to return
> > > an errno code is more consistent with the rest of the GEM functions.
> > > 
> > > [1] https://lore.kernel.org/dri-devel/20211118111522.GD1147@kili/
> > 
> > My fix was already applied and backported to -stable etc...  Your
> > patch is not developed against a current tree so you broke it.
> 
> Do you have a specific link? I just checked the stable tree at [1] and there
> no trace of your patch.

It's in 5.15.6 and probably all the other supported -stable trees.

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/tree/drivers/gpu/drm/vc4/vc4_bo.c?h=v5.15.6#n387

> 
> Patches for DRM should go through through DRM trees; drm-misc-fixes in this
> case. Exceptions should at least be announce on dri-devel. Neither is the
> case here.

Yeah.  That's a good question.  I don't know, because I just work
against linux-next...

regards,
dan carpenter


