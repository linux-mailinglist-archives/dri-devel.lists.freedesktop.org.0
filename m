Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51D7EC4131D
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 19:03:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B25310EB48;
	Fri,  7 Nov 2025 18:03:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="V1utr6/B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010050.outbound.protection.outlook.com [52.101.46.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20FA110EB48;
 Fri,  7 Nov 2025 18:03:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jbAXA4ma/07PiR/SUFl3D10O9XYOYTxltE1aWBcN/L1LvbLjBJZgoeBinObfeCK+FDW7t3fYzNuXlFlPK5wImYxzcNM4W+8F4eOnG0i5hIbPjyqQuYskFrJ8pJuqlLOc+gP8yWwsZuBcLbFyNrQGKz5Ni/QbQ8iynepQZZOQsd806GLWEYfYWPJ4d+6VVvcyvdPlWZ5RTyC9F4HA1A0xoTxsRf2f8EPGfhSdxqAASmeIsnZ9cuCu2whTcSXfkysk9mTGZ1mDgJWiBf2Wdm3iJlaSUIiTiEAGbUMPKtR4hh1qOdlfExfWgvb1VQFb8P5mPr/5zl3ORhf8fIfrjBu/yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tjnzM29waKkt1L4edyFOBbpyCCKH3rOh5USrHGSfzdk=;
 b=e6wHYEDqQpmmy5EE3qlP2HcN6R0rvimENsUz10kRBQFo1VYnMnHO1nEYdhEx3Zh5L9UXma0zCJmqIno1H3rt/yFyGxn27zBaPoYFDrfhP4axIB8FOFXUc2ZKh0tZeo+DtUvDqCaKZ18i2iKp7rZobOwvskhH0zKrBJSOprQSY8ssxF78jF77YY46+GjwFHp+3j9uebv+rGiBYaofxt2EDWmntYm7L1W0puXIrFxBnKey1yhWJHN69Jw9iYw2+KyTDqwTdfsG99rRj7PetB2vILONkqR8RXQtahVaJFdDjFFlnvMRCP1I5hJZgTIAICkGptmtG3cvLqmDpnD5qWCs2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tjnzM29waKkt1L4edyFOBbpyCCKH3rOh5USrHGSfzdk=;
 b=V1utr6/BMEky4t/9/PEgxJro4WbYjPsDdouwp2O/LZD84LU7lolKXK2R6PubADjKb90X+evmrB5KYVjiueGSuFerbCJy2ULrsGAxB9auEJ0h6j6r+wKBUocFRUBaSVzgegj8Lju77xtfXkSeq2hap7bgt7/d6c6/KEUQjMcgwDnjIN2P3gqBSwcFio1LZTbjXExaBB/rnYI0qLMxb4Y8bJ2XEAIMg1fehqWPml/HI4WnaC7ckf8+JX/uN7l189B+W88Cx9j+BEoOjWgBuwBFGD7TZ+vhrhqA4oh94v1Otg50UnP2QUt4v21u93fxNq/LOBilk0IF1beYtbkhZfn1mg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by SJ0PR12MB8091.namprd12.prod.outlook.com (2603:10b6:a03:4d5::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 18:03:31 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9298.006; Fri, 7 Nov 2025
 18:03:31 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>,
 David Airlie <airlied@gmail.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Ankit Agrawal <ankita@nvidia.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Brett Creeley <brett.creeley@amd.com>, dri-devel@lists.freedesktop.org,
 Eric Auger <eric.auger@redhat.com>, Eric Farman <farman@linux.ibm.com>,
 Giovanni Cabiddu <giovanni.cabiddu@intel.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-s390@vger.kernel.org,
 Longfang Liu <liulongfang@huawei.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Nikhil Agarwal <nikhil.agarwal@amd.com>, Nipun Gupta <nipun.gupta@amd.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, qat-linux@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Sven Schnelle <svens@linux.ibm.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 virtualization@lists.linux.dev, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Yishai Hadas <yishaih@nvidia.com>, Zhenyu Wang <zhenyuw.linux@gmail.com>,
 Zhi Wang <zhi.wang.linux@gmail.com>
Cc: Kevin Tian <kevin.tian@intel.com>, patches@lists.linux.dev,
 Pranjal Shrivastava <praan@google.com>, Mostafa Saleh <smostafa@google.com>
Subject: [PATCH v2 18/22] vfio/ccw: Convert to get_region_info_caps
Date: Fri,  7 Nov 2025 13:41:34 -0400
Message-ID: <18-v2-2a9e24d62f1b+e10a-vfio_get_region_info_op_jgg@nvidia.com>
In-Reply-To: <0-v2-2a9e24d62f1b+e10a-vfio_get_region_info_op_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0040.namprd05.prod.outlook.com
 (2603:10b6:208:335::21) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|SJ0PR12MB8091:EE_
X-MS-Office365-Filtering-Correlation-Id: 468697c2-43e2-4286-0361-08de1e27f593
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FhnJ8gX4jp0CVRAeAK7mJgHsrokwDj8RCfYkWY+5MG2xu9djdbIRveUKC/KU?=
 =?us-ascii?Q?XMiGgvIolDpOR/gmrNEe9GkLaIm5DnB3R8pujnJE/VSGlrdpLp6vojRDyuew?=
 =?us-ascii?Q?tHwPFA4W/AYvg5Ydzskw/PC/RCd2pkOIlnxRZeO5le5LmMyW00MMTDPnwzMY?=
 =?us-ascii?Q?b3tL9ycY8qmADBFi1d9pa/5LRSB/oACtUCxVN2LW7dZnCjae5o8Cg5jPb73E?=
 =?us-ascii?Q?PajxXbZdL8Ok0XeOO1BLXM0wDnyQ00mjeOrIGpuJi4DbNyjFNjjSNgy+k8ME?=
 =?us-ascii?Q?CsjMwa3b9Iwr+sUjAyzDOHeHOmaQ0hLY7ozMplXUfYTv0YBkUMlYIyNx/5FC?=
 =?us-ascii?Q?aj9OJkNaDgbQLS54YEh8aNySg//RwVIoNiVchsEN/6hUIB9FYickothPXQ1B?=
 =?us-ascii?Q?pUn+fkDiilfoaOltpqTqfeHcNwZiFIQRvsX320iFJaaFF4EY5HS3MyBUwTmX?=
 =?us-ascii?Q?VH9V97Bzo/xvhBURBZsArLZlCcZ/6dB8YXRTo3fkTNIIaD94RwW5lMW9Kbcj?=
 =?us-ascii?Q?BovXdR6wfB6RmXFY79VoRFLKaHvp45aA5oJc1hA0UuqewcvFhbMJTeN4tnr7?=
 =?us-ascii?Q?eTcsPl/KG5/F60TcgTuiVmp4tqoTomMC8Yiswcti8aDAzkmA8dAFskbZUTG2?=
 =?us-ascii?Q?tTwvLkyALNyqRebAryDgVR1+w1IlXoEFqNOyJ3S7Nd2GZd6i1ODpr4DEOSsQ?=
 =?us-ascii?Q?DLDAP0mgi1qmdiHCUVcV2WVBrYJKnWoP2vyLy8RqTtECfk0SymMHMN87w2FK?=
 =?us-ascii?Q?EQ7STqIn1NKQJhG0reM4nF+TgK5jGRwQUbBesl9RLx8S12skGGfzdNuRnDBY?=
 =?us-ascii?Q?lr5tSihEXQ8T2ynTDTHwFemJZLM6xe7Tcgcc7nZwoc2GX2BRZ+zAo/E+xLp/?=
 =?us-ascii?Q?ksq3O4qWAb89dWpsCIxTIHKykdmwhQ36sFIlMLxpOM7oU+lkvyDjfSBT5DbF?=
 =?us-ascii?Q?cvpPdanF4QzaS0xvvaPV7nA3m0/efZBggbhJGp/vYS4pi1ogtHsoSDV7rUEN?=
 =?us-ascii?Q?mGXS0GqH4QATEi4DOKwONsaL4pXKghqAdCMlbuefts+CcNcb3ZuZhfKEJv1n?=
 =?us-ascii?Q?It/a0ZscwAKLvTMfUqjriDW3f6FR0xV+fJQLREhWfEFZ68yXWGzviDSDLDKl?=
 =?us-ascii?Q?ZMUtmRvY/dINjfhoRIbw1SzMG+Ioii3F8KkGTL1JgKs/E2407oxn807waTgz?=
 =?us-ascii?Q?6ZtU9l9PSi+wn+FH4JRlMIekizwOBhOiZiTR8iPNWSY14T3uKrf7gDHZoaBV?=
 =?us-ascii?Q?cSU4PkWiXuCpOVvxPY0gYfF3ODOleLyLPxQRVoGNLkFjy5UoPbe5rqoL7jpH?=
 =?us-ascii?Q?ihC8xGvh09dCMCa0qhoBx8PYVwQ6RXAJz6WFWI4eQbVx1+tbmttYrfjUTWIw?=
 =?us-ascii?Q?bM+yfRWj0X+LtJWc5ZZSlesXIW5+16kB3f/v51dvi0yshhjgrngN19fjEBJg?=
 =?us-ascii?Q?1dP6P8hHsA4G7uV9J+h2Ybf/GwU7sQnwnfX+69fljUZ6olD7IjJdpLhvK67O?=
 =?us-ascii?Q?FtAvUch3RjwTErE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3FjZGn6eix/TxGfI866ObX441our/frDtwKyW13oFqC8hmQzx9IElHJavvwl?=
 =?us-ascii?Q?ElFmJABYzVJ84x8W7UZkdNZDTOs1XPw2l23WLaI9In8DU4hA0qLD0BZbHsmw?=
 =?us-ascii?Q?YW7z2qqAQPYmME1sfbIAWJ1KZHEO1kw16lvB4f2euZBWUU1dD9uZh0Sch9Pq?=
 =?us-ascii?Q?WL4Ztt/NTaFToHZvoTo6wIe0rM04ZWL9FThJn76MZCFfBH3LDEvbtCjjOtZj?=
 =?us-ascii?Q?ladCfcnetqrFNEcXP7IRzZ5KUgku3K2IEnSgDJtQM2jgB6ufi0Z1OGPgYYPm?=
 =?us-ascii?Q?jJpQqJVF12xmS4Mivbpw6J1i187RozRJMqvpJaeYMg3WWgSMCwNdGME6vbw1?=
 =?us-ascii?Q?OuDUcuTQ/aPVk+A0D+tpB0tHBgVYCldI/HyP6u82A4ugQKqtTnAq+apsagQP?=
 =?us-ascii?Q?vSgoRbyim1hioC9vxFeNNVJO7tEblfB3W9v2MIDS5K8HLfF/Sor4tWZtvbWe?=
 =?us-ascii?Q?ye4gY5R0nreUJ/CRDUsoTJHstm7jFT9/UCJf1f7ornowgddVF+DPbhsj7At/?=
 =?us-ascii?Q?IQXhyIZn2rv19wZrC+VLjKFhdChkZNud8PXQKnjiQCJsiTM28FA467NGvbv7?=
 =?us-ascii?Q?/zXPSX00ab6xZePxnnkaMp47ccOggHoCI2X7/1U1x7VmW9J/pf2+29hA+akg?=
 =?us-ascii?Q?dDf0oMI4s+ArCkcyVjOHBKSXFJ3E/5AaVfWwah+EVqKAzM4zfCm6RehYSxrF?=
 =?us-ascii?Q?YLt4kQDBZQ0ApRxuTn0nezPrNo6sKkj8IcLEkZksBJQOQc83B9aqf1DDezx2?=
 =?us-ascii?Q?jJj+fwjrxoNjwvONoPMGhlag6FOgO+ZkAxJdS+d5Pspwnb7uLMwQHDKxyNdx?=
 =?us-ascii?Q?yd4KRti73oV9gE967hR4EOLDNyME6BDuudNn6Rn69SM94GfFd6HkfuOyg0hP?=
 =?us-ascii?Q?sOBQAqV6b+lcGfkPCt3hetyxZcCpQ4JWcnad1Qr7VW/nAgIzhm/V9QmDDDk5?=
 =?us-ascii?Q?NGkU/rK1HwanVzUOGLHhlUewaukrnrGvbK3K5GhwtgbyXT7k4hZJFIQcE7Jb?=
 =?us-ascii?Q?IFmBdK0s76DiJpZxmgZ9wMZgwioadKrwdAv58yfWKHCTPkBQ1O830tAvrt0+?=
 =?us-ascii?Q?qCpqB4+UwHo+jLJkE/g8P/Jqpbs2s/JblaxMgIgxs2AWmAy5RnhfteXZZd/j?=
 =?us-ascii?Q?hB85iMjqv1UugUsblDZWdAg9UABxa0fwivtCGxkqeu8nS79qau0eva27PKta?=
 =?us-ascii?Q?vvVDZ2AxRIkCEf2YVi4uhK2G2Pzk2qzdvtcqkG+HwGanTta5JbLuIDm3nlBW?=
 =?us-ascii?Q?W9dXkryitSUL4Wa+0oE1A4eNFXjlADlkqkh8UEJ8TX+kqS26EEnUbjXIR8zY?=
 =?us-ascii?Q?6S88t/0lnun1DiF9W0XmoHA1r9MRrSYa5m8Itxgb6LfZuuLkcIPmqVuiHccQ?=
 =?us-ascii?Q?sXYrT1a2c0Bj4eLesPJSAlLjBv6XGNKU+g+bVZxlh5QVuHHuQa2iWyUzkkrL?=
 =?us-ascii?Q?xM/vedfRA51Ix2WlUwAfJuemCKIvRQnv4rHBiERIeaX3jY/sp2yhHQxIBnEm?=
 =?us-ascii?Q?KN1u/Slz87mUXJipykfaRoy18UkuUuvcx1/oO4suoxmkhE5De64xBHAFAV82?=
 =?us-ascii?Q?JNZnh+HP0k5dxSlbkpo=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 468697c2-43e2-4286-0361-08de1e27f593
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 18:03:30.7917 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aSZ1HH3UneYXfNlj6tcvOGiXfH6VKOcdB0r9p//jF2P2ClGSwSBhxkNb9LwMy1tW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB8091
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

Remove the duplicate code and flatten the call chain.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/s390/cio/vfio_ccw_ops.c | 55 +++++----------------------------
 1 file changed, 7 insertions(+), 48 deletions(-)

diff --git a/drivers/s390/cio/vfio_ccw_ops.c b/drivers/s390/cio/vfio_ccw_ops.c
index 6d46e0bc76df15..a596f6013019cb 100644
--- a/drivers/s390/cio/vfio_ccw_ops.c
+++ b/drivers/s390/cio/vfio_ccw_ops.c
@@ -313,10 +313,12 @@ static int vfio_ccw_mdev_get_device_info(struct vfio_ccw_private *private,
 	return 0;
 }
 
-static int vfio_ccw_mdev_get_region_info(struct vfio_ccw_private *private,
-					 struct vfio_region_info *info,
-					 unsigned long arg)
+static int vfio_ccw_mdev_ioctl_get_region_info(struct vfio_device *vdev,
+					       struct vfio_region_info *info,
+					       struct vfio_info_cap *caps)
 {
+	struct vfio_ccw_private *private =
+		container_of(vdev, struct vfio_ccw_private, vdev);
 	int i;
 
 	switch (info->index) {
@@ -328,7 +330,6 @@ static int vfio_ccw_mdev_get_region_info(struct vfio_ccw_private *private,
 		return 0;
 	default: /* all other regions are handled via capability chain */
 	{
-		struct vfio_info_cap caps = { .buf = NULL, .size = 0 };
 		struct vfio_region_info_cap_type cap_type = {
 			.header.id = VFIO_REGION_INFO_CAP_TYPE,
 			.header.version = 1 };
@@ -351,27 +352,10 @@ static int vfio_ccw_mdev_get_region_info(struct vfio_ccw_private *private,
 		cap_type.type = private->region[i].type;
 		cap_type.subtype = private->region[i].subtype;
 
-		ret = vfio_info_add_capability(&caps, &cap_type.header,
+		ret = vfio_info_add_capability(caps, &cap_type.header,
 					       sizeof(cap_type));
 		if (ret)
 			return ret;
-
-		info->flags |= VFIO_REGION_INFO_FLAG_CAPS;
-		if (info->argsz < sizeof(*info) + caps.size) {
-			info->argsz = sizeof(*info) + caps.size;
-			info->cap_offset = 0;
-		} else {
-			vfio_info_cap_shift(&caps, sizeof(*info));
-			if (copy_to_user((void __user *)arg + sizeof(*info),
-					 caps.buf, caps.size)) {
-				kfree(caps.buf);
-				return -EFAULT;
-			}
-			info->cap_offset = sizeof(*info);
-		}
-
-		kfree(caps.buf);
-
 	}
 	}
 	return 0;
@@ -504,31 +488,6 @@ void vfio_ccw_unregister_dev_regions(struct vfio_ccw_private *private)
 	private->region = NULL;
 }
 
-static int
-vfio_ccw_mdev_ioctl_get_region_info(struct vfio_device *vdev,
-				    struct vfio_region_info __user *arg)
-{
-	struct vfio_ccw_private *private =
-		container_of(vdev, struct vfio_ccw_private, vdev);
-	struct vfio_region_info info;
-	unsigned long minsz;
-	int ret;
-
-	minsz = offsetofend(struct vfio_region_info, offset);
-
-	if (copy_from_user(&info, arg, minsz))
-		return -EFAULT;
-
-	if (info.argsz < minsz)
-		return -EINVAL;
-
-	ret = vfio_ccw_mdev_get_region_info(private, &info, arg);
-	if (ret)
-		return ret;
-
-	return copy_to_user(arg, &info, minsz) ? -EFAULT : 0;
-}
-
 static ssize_t vfio_ccw_mdev_ioctl(struct vfio_device *vdev,
 				   unsigned int cmd,
 				   unsigned long arg)
@@ -634,7 +593,7 @@ static const struct vfio_device_ops vfio_ccw_dev_ops = {
 	.read = vfio_ccw_mdev_read,
 	.write = vfio_ccw_mdev_write,
 	.ioctl = vfio_ccw_mdev_ioctl,
-	.get_region_info = vfio_ccw_mdev_ioctl_get_region_info,
+	.get_region_info_caps = vfio_ccw_mdev_ioctl_get_region_info,
 	.request = vfio_ccw_mdev_request,
 	.dma_unmap = vfio_ccw_dma_unmap,
 	.bind_iommufd = vfio_iommufd_emulated_bind,
-- 
2.43.0

