Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C40C47715B
	for <lists+dri-devel@lfdr.de>; Thu, 16 Dec 2021 13:08:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC4210F816;
	Thu, 16 Dec 2021 12:08:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com
 [205.220.165.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FC4210F813;
 Thu, 16 Dec 2021 12:08:23 +0000 (UTC)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 1BG8naij004235; 
 Thu, 16 Dec 2021 12:08:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=date : from : to : cc
 : subject : message-id : content-type : mime-version; s=corp-2021-07-09;
 bh=s5OXnTOuwXSI8G3Qel/m6UhMnrsffjooJtDdVGfRa8k=;
 b=f1mwXaMpDLDj5RaT1+oj3IWu8KkG8shValenbxHSiGkT26lJIZ83iqH90tom1jfKJSP+
 2vGmr+TRcOBZCK4hVPvoVGY2SMuMj15RD/Cnq//4gYYGSB00mCLYju9yjWIJVPJQ2Xzd
 HsCkDLQBdaT/QAj8dCkRjYZWJwEdg5S9XUfgz4PX2F3MYVrkv2SBkLkv/w5/82ykuKe8
 N3pun7xMk3JLBcLh7lre8HZ7GnEKMLu4lW1+Mq3wyAdXc5pyLvUu6QnuXt6ERYB3f/b2
 Pro1u1Sv9ByR7jiqJgpM6RBuoOKKT7Tanvb6sCEjoPw9faNILbkHv5uIQTbx01RoHieU 4Q== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
 by mx0b-00069f02.pphosted.com with ESMTP id 3cykm5amb1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Dec 2021 12:08:22 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
 by userp3030.oracle.com (8.16.1.2/8.16.1.2) with SMTP id 1BGC6wuE051634;
 Thu, 16 Dec 2021 12:08:21 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com
 (mail-dm6nam10lp2100.outbound.protection.outlook.com [104.47.58.100])
 by userp3030.oracle.com with ESMTP id 3cvh41vgbg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 16 Dec 2021 12:08:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dN+ambiPLzbsm3V6Nt3T6nxxAiIx1x6wItiPT32cu3qdEmps1QIN1DzicS7ZPAeweCkOvIHzFPsBo7L7exJIH+KEyZMdD8LcjabY++WDWIyaR73hGugImhbg88skdvdMgW/AgNpYpp5iAV/QyGPlvBmN5A84cpiHJ8SDKTZU8JYR0EdU8sUxR9arX3oPID7MF2uyrEnzdy3VizQRGuiaO812ZYuRfz0WRbTkcM1HPjspuNben5iVZKJMW4rz+rVMVxsPAlJkjfNNmjLydWXYFoC5asuh5oIbJMF0XR5ptQ9bJgehdYtv3MLfHlnJV64g/S6l8OHikwXrBhvEIvpLMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s5OXnTOuwXSI8G3Qel/m6UhMnrsffjooJtDdVGfRa8k=;
 b=U0CvnaC65tlINyfpMoOlny8a5ZaUPsC1jABHoZ6ZedklEVS5rt+d8s3EQfENe2zUZ78gBNCiCaxvuPHd6NBLGFxCN10bvnJJZ+OofNCAgnmrrWHmRkxViAJ3Avz130rSPX5fvMmkEmySzAVXwIxsCcfivHj/Gg8JJb3+TVJl9PfmXx1E2v/WiyqtSB1pWcxx1PXQxtCEzWM6NOnO6Xe9h2zJLQd0djH7MbZDPjJf5qBJ1zITZWrP+Da7CX7OdbGBpNo2qxkciYMXdTp8GUpwP/ZxMoiEZyOi586JNz7h+WK6ZIin6cXBDUGSROq3qZEBLn25rwE09xQ9zTYwaSqqzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=s5OXnTOuwXSI8G3Qel/m6UhMnrsffjooJtDdVGfRa8k=;
 b=UIwyNABQB84WW4nu0Ob48yjA5ULneLYU6n9sSg49E/TtkvtZCMDHHBGNCleGsiCy7P2cf2eVxRnztd7CxxnV7ViOnoYs41d0EpwvVoY3ZcV4O6fI8C9Ypw8OAZgMbDbIO6b2IFOI2acH2esex2dNtvebPmSeDJ/xUMHQRYPLi98=
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28) by MWHPR1001MB2095.namprd10.prod.outlook.com
 (2603:10b6:301:32::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4778.17; Thu, 16 Dec
 2021 12:08:18 +0000
Received: from MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0]) by MWHPR1001MB2365.namprd10.prod.outlook.com
 ([fe80::7194:c377:36cc:d9f0%6]) with mapi id 15.20.4801.014; Thu, 16 Dec 2021
 12:08:18 +0000
Date: Thu, 16 Dec 2021 15:08:06 +0300
From: Dan Carpenter <dan.carpenter@oracle.com>
To: dri-devel@lists.freedesktop.org
Subject: [bug report] new kvmalloc() WARN() triggered by DRM ioctls tracking
Message-ID: <20211216120806.GA3691@kili>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: FR3P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:1f::21) To MWHPR1001MB2365.namprd10.prod.outlook.com
 (2603:10b6:301:2d::28)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 55c42b19-b2ad-433e-ffe2-08d9c08cbf07
X-MS-TrafficTypeDiagnostic: MWHPR1001MB2095:EE_
X-Microsoft-Antispam-PRVS: <MWHPR1001MB209513F08D3D4C44EFC9D9CB8E779@MWHPR1001MB2095.namprd10.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:486;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6TBapzWwybYZdvk+ZuyYNL0qX9b5YgMayNbVfMmAtS+40M2Uwft2K6g1uOU55nZ30UUkKCN+DrkRsXdUFMFq6h1zP8yZ4D3cHHeKxSqqXfw9wwo9A7+0f+sF1p7effHHvcRXjbC2ZCy8maeskF5Ybe1EWvzjOk/GnxYamk8ckknPkD3OII/eSvq+IZlbGV7jqk2X0VuXHNrVWOiVu6+H8hpsXn93zHRbSMq8XRFdcMwRnO0g6xOoE51bLVU8e9qtVuCaNBrFGTMj+YRogW272fjYsasuM0Y9PMeZTuwRiNO/lQaNew40PVdqX48B/069z96AynT9QKr2PcNvaO1/A/4RX0dup7nXD381OGTnhFM4qmvKxwlv9SQz6C4FOuz2Aoy9TaPt025VgJlNdp10EMf8AHuudHQZL1GtLjmnCVyLYCwDa5WShWWv8JXz1930dJrU7NgmtXOvcCkABbOMogwZ+1OCDKNONMQZFzfSPhlSzMeSlVGltZ6k98ATCAc+Bk5hOjQWptBuxvZ4C3sDcrnnh5nb9T/qPnOvIB/+VhgR+e4ZN1c4ajxvpjQCZIUsckArhwKg5hTlMVzTa4z53bcWFJ+OaIXYGQufwgD0TPduUedF+RCxqmEsOFwvuJIq9gCVael1YgAYRaFzaXCOhwLuhTwab4JfU/qpm+hBkjuIHuKOTUgc+D/9Hgrtnmspp22J1Zpkts+kkuWLOJGjBQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR1001MB2365.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(366004)(4326008)(1076003)(33656002)(6666004)(52116002)(508600001)(6916009)(86362001)(316002)(8676002)(66556008)(66946007)(2906002)(9686003)(6512007)(6486002)(38100700002)(5660300002)(66476007)(6506007)(38350700002)(186003)(26005)(44832011)(33716001)(8936002)(83380400001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2TT5IOjHW50h35eqQMvFXaQXYwomt1CSj0P9ptfPRyH9sgHbxr+w8PaR2H+3?=
 =?us-ascii?Q?cNfeXZ77o8SeKRN6d2ZVAflnCjv55OeWcOhGX0Cfbj9VwiiL5jAod/cvW6a9?=
 =?us-ascii?Q?J9p2O5tIDINSrH00IAJEIRWruvTbJy+GD0k1ttUImMpx1EwlE+P7POEAniwb?=
 =?us-ascii?Q?3RHHfzgVgGyA7oln9Z6CABM+0iTX+9kI6r+07VywEIV9+KFaLsDXvCtB1ih2?=
 =?us-ascii?Q?t+qDwwohMR4ociGw+DJ4QQOkpHX6F6VB1CqMmyEjo/dFj9kcQR3oZbh900zF?=
 =?us-ascii?Q?zckx8DzCe/X3Ol7vaoyRutR6Q8qwGVMAksY5y5Xc05gaiOqc5bBQFud0M13z?=
 =?us-ascii?Q?Yr5TOHj8C77gePw51TemjzCSxIobBAdtYzdOWOrnIcKfZQInYCem5jozeXnA?=
 =?us-ascii?Q?UxdGn76QI2N7YHwyPEq7e5+hbXsXrYqIuoavKLEiT4FCWKQBTU8oo2tUkr2z?=
 =?us-ascii?Q?IDQCrcsfBokQujktecH2Vx5p2Td9q40lwzMWedZJ48VCEEeJ0SM95xFIyz2I?=
 =?us-ascii?Q?R3h8X8Nn8EZG14LE1VFU6Dp1a2wYIoK1tpmQrqRojjyiCE212WoZR27oOwXq?=
 =?us-ascii?Q?7AW2xNl3iFOQ63RYh2gk5W1GNP5tyf4Pd2+jmBu9OLJS2hE9QmHXHOgA3p86?=
 =?us-ascii?Q?0dgIiBJzXp5NuFtYiixwj5esXD1HhUIRrc9tI3q7QEWTneAWCmJJZj1Mr7Hj?=
 =?us-ascii?Q?JvZFhVWK9psDiK2J660AFZujBlkVwqYLMBQVdbqakg8Ikmjwi7jxlud/aFJv?=
 =?us-ascii?Q?081re9NsDSRR8SKmNvjPRawAMe/cQz6ebULzDjQmzVKjWv+sQjl898d/yW0N?=
 =?us-ascii?Q?HCdpkIdmi8UomeSDBbgKEcrD8OGGITVtbSyQoJ/RcGAcLj3Bj5BUvg3T9g/Y?=
 =?us-ascii?Q?QM92OcfK7V55k8IDI6CvRRHXivH9Vp7eKio4WCZ9ctngaoB9EoUEnULeTp7o?=
 =?us-ascii?Q?qTypZWl8+OoheS8UnySFpRHilg0yVOWEy7vz3PvufVext1Dz5olt4O1ypJ3V?=
 =?us-ascii?Q?P6hmJm7vyGcDtessRV5RN02nhyDw6So12BKTgf5a1OmBwtoWELZkf/m7+Xcy?=
 =?us-ascii?Q?/4RXx+KHw85p3Z3YQSrb+DbPKscvGEHM6or80QVJOZrHwW+myfAVJgG+cRke?=
 =?us-ascii?Q?tM+zpJKiF8cE+DHiWUgnNKL+qXn5EgCdr8zkX9/SiUohrc9jj+VlzOLcUzvP?=
 =?us-ascii?Q?LrAS1FF65kNtPVTMOXxOycDP28clWBfy8BSxgI8IbwtLnzNfbrDbd8EDmXKv?=
 =?us-ascii?Q?1n6iZftO1HnXcXi0qB1WCy5mi5mtmo1gCC7/OMx+/I+pX0GOVsZc0PK3N14H?=
 =?us-ascii?Q?4gBnqfPra7QPpO4Lei3Yp9mlQDWk91T3Mur0kOCPvUHLBhRCnig+WynNZKFp?=
 =?us-ascii?Q?4tjUqdz4V57GBsGvDLVxkXbiz7RUYHS+BaLRqQAmEPTt3P6DOM4qb09k2YjC?=
 =?us-ascii?Q?9mbQJ6skbJG+USaodNv4RLFUpCbBpIUBUSAxP7Jfv1hhdkVygXYubqQPuv5D?=
 =?us-ascii?Q?OLfXTkkFkXGm/440u6Ak7ZomKyhAjm6rfm5o1IsMQeHHx1XiEJHfHq6NnJ4S?=
 =?us-ascii?Q?b7yrsqg4Y/Qcl3Z83q6J8J4LjjpkgUwghy0yCBlIY4y6JzUOnWKJRNOC8bLi?=
 =?us-ascii?Q?CeclldOHyQDSCVs3WLft+79UbvpPsMVFofrWxuqsrDkgNsXpTtTNBnBm8ltW?=
 =?us-ascii?Q?giodncusH7//m2p+/Avkb6AQcks=3D?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 55c42b19-b2ad-433e-ffe2-08d9c08cbf07
X-MS-Exchange-CrossTenant-AuthSource: MWHPR1001MB2365.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2021 12:08:18.4731 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kYZZIQwoRvg1YMuDCQ9UhTpWsS+06YQHp13AZ87qc4xJf2hanLhGoAi3hWb+kPtWFpISdD/b3Sc49E64EV4TKm/jhc6wlQWqHh4A2V4uF9U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR1001MB2095
X-Proofpoint-Virus-Version: vendor=nai engine=6300 definitions=10199
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0
 spamscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 bulkscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2110150000
 definitions=main-2112160068
X-Proofpoint-GUID: 9nVEvHTk4R6CmkePYhhVtjdiJGxlsekn
X-Proofpoint-ORIG-GUID: 9nVEvHTk4R6CmkePYhhVtjdiJGxlsekn
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
Cc: virtualization@lists.linux-foundation.org, amd-gfx@lists.freedesktop.org,
 lima@lists.freedesktop.org, etnaviv@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi DRM Devs,

In commit 7661809d493b ("mm: don't allow oversized kvmalloc() calls")
from July, Linus added a WARN_ONCE() for "crazy" allocations over 2GB.
I have a static checker warning for this and most of the warnings are
from DRM ioctls.

drivers/gpu/drm/lima/lima_drv.c:124 lima_ioctl_gem_submit() warn: uncapped user size for kvmalloc() will WARN
drivers/gpu/drm/radeon/radeon_cs.c:291 radeon_cs_parser_init() warn: uncapped user size for kvmalloc() will WARN
drivers/gpu/drm/v3d/v3d_gem.c:311 v3d_lookup_bos() warn: uncapped user size for kvmalloc() will WARN
drivers/gpu/drm/v3d/v3d_gem.c:319 v3d_lookup_bos() warn: uncapped user size for kvmalloc() will WARN
drivers/gpu/drm/v3d/v3d_gem.c:601 v3d_get_multisync_post_deps() warn: uncapped user size for kvmalloc() will WARN
drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:476 etnaviv_ioctl_gem_submit() warn: uncapped user size for kvmalloc() will WARN
drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:477 etnaviv_ioctl_gem_submit() warn: uncapped user size for kvmalloc() will WARN
drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:478 etnaviv_ioctl_gem_submit() warn: uncapped user size for kvmalloc() will WARN
drivers/gpu/drm/etnaviv/etnaviv_gem_submit.c:479 etnaviv_ioctl_gem_submit() warn: uncapped user size for kvmalloc() will WARN
drivers/gpu/drm/virtio/virtgpu_ioctl.c:186 virtio_gpu_execbuffer_ioctl() warn: uncapped user size for kvmalloc() will WARN
drivers/gpu/drm/panfrost/panfrost_drv.c:198 panfrost_copy_in_sync() warn: uncapped user size for kvmalloc() will WARN
drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c:120 amdgpu_cs_parser_init() warn: uncapped user size for kvmalloc() will WARN

These ioctls can all trigger the stack dump.  The line numbers are from
linux next (next-20211214).

I feel like ideally if this could be fixed in a central way, but if not
then hopefully I've added the relevant lists to the CC.

regards,
dan carpenter
