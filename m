Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C47DAC4115F
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 18:42:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A722F10EB39;
	Fri,  7 Nov 2025 17:41:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fYSPs4/b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010022.outbound.protection.outlook.com
 [52.101.193.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFF3E10EB2F;
 Fri,  7 Nov 2025 17:41:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G98J97Vk5naKYeymL9BRCuzpJ0XQQFKi1z/fgOjreS9rwFdHx5ijgZWTB9L/5dR4CExK3teoAyH3y99KNgfmbK8mwTmIFRMFQqxcU3pkM4bFR69gb6vnWpgvP84hBXPKwKKDBS6hFTczeyZUD3BrPZ5gpRw4Eou03MNkCB6uiM4qBp8e5QI2yAmOf/T+6argk+T7KMoHgJk8GFngciy20hFK8Es3pRMJmZ4LYvEmxYILTDu9CwizwzHUS5/+jyg14dowDPLXjWt4eHlt57MpC4ZFx731lepYlYZ9VXQK5hrsbsCevCER2LTimJeFow1hMDZoPRNVj232wzYzFYJNXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mo7dHxrmPyrp21qAyzTn2nrXqCpPYm7kizaAcVFD40I=;
 b=YnaLAgqETPBBZ04b57JtrXvjo/JGxxaMhtYoNhEVmV/U86TDnReiYN5kaMlz21b+i7+EFR+YiEC/N3xuyDDkMSPGFRRv4V55kdjHL3LS3kQ7+7FDA9q2evCzHoD3yeeoh2ZJO2s3lhKLsgDM+t7gylMzTvBAlvNndj6oyElrhrmSSNcuh/CgMCYcoBF9a2+J1EF4u3GnHdFFvOkqnEdKsy1Q1tbOvgWYgfaQIDbpuNQ08l4nYxxpphG3ZesCU3sb6+2H5pGjB4m6I7eZxXJwJQ7N0VmtVZ+sAVNHO4yTdaIFssgXcHeTLgaPY/Cp8hh+9ZS+UCLNCRht0RmP/Xm1bw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mo7dHxrmPyrp21qAyzTn2nrXqCpPYm7kizaAcVFD40I=;
 b=fYSPs4/b6qhpo+8uKJxDDz88SE9FowvW510P+llKJxwHGYyDXMpnf+gcGfg/RS6edVhqvI3lQN30SwBnmvC+qNK4nv/wgeD2aWI/5SdC7IT6NAbAM3gKkyMjA7XeiENIGm7OWu+HEL3T2iNn4+w2SIUbLdcv8u+27pvD3ztxrNzEM6N0gPQhBsnx1QGranqxbfOiQymzlnIVb2HoXRrnDHfq72ik41/jDQEPUU7VnXFQl8x6RK7bFqrAU5gJ5+HFGAXFcBvD6PocezjrpjkWzOaalyDXKK1xDJ2szXgaf8kZSB3kAyZlrzYlegxw49EY2/45iUTpEKWOKRnPwExcBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by PH7PR12MB8826.namprd12.prod.outlook.com (2603:10b6:510:26a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 17:41:46 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9298.006; Fri, 7 Nov 2025
 17:41:46 +0000
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
Subject: [PATCH v2 10/22] vfio/fsl: Provide a get_region_info op
Date: Fri,  7 Nov 2025 13:41:26 -0400
Message-ID: <10-v2-2a9e24d62f1b+e10a-vfio_get_region_info_op_jgg@nvidia.com>
In-Reply-To: <0-v2-2a9e24d62f1b+e10a-vfio_get_region_info_op_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P223CA0035.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:5b6::19) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|PH7PR12MB8826:EE_
X-MS-Office365-Filtering-Correlation-Id: 18978b29-524b-4124-bd86-08de1e24e9ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?a28QMmM4IymagcRY0KU/hn0Npaf3R+XhftWpTm5XV+7Jeb77KqZveItq39ey?=
 =?us-ascii?Q?f6lkPnAq38Wu8kA7qyQqAl0NUR0IMEMyeMNXURTxMlBY3v8zra0CxSnhmRmy?=
 =?us-ascii?Q?SXBvcPMxLhkGxVVetlNIHbsFDkjr2avEDWe83ppixxxETAhp8y9xrUqmBESR?=
 =?us-ascii?Q?VP1guU7nwwHREhWOtojIcOYnfDObFLBx5bK8Rd+I6WApaIaIU4BE2SGtZJbA?=
 =?us-ascii?Q?RJHgVV+oW8FvQHHgjH6IsN0PIHRcbX7tQeJVj46q2gsK7qwAwcQI4bVCvucM?=
 =?us-ascii?Q?DhcV9f9+PEuC8FmOyYmHjTd7ckDTuZE/2JqGosFYl94xBNt90q54lhCiqy/X?=
 =?us-ascii?Q?NX7bLsdlY4fklGTyH/R4u2Dp1acEgva0fwL2G8nkJjEFKkwbvzkvcjmgQk39?=
 =?us-ascii?Q?4eDmht00Du/GdV/QB3FgKZjWZD7NS/y2nhgnwl4iGnzUpJCcDYPg8RACrSq7?=
 =?us-ascii?Q?W9A+zu2KqzqY7E5vgfddkQIZdXNbnquSKA4nH39S7HQ86+qJjh+c4Ar34/X4?=
 =?us-ascii?Q?pCZDtNkzEEXuVuoB7uVN4Qrb1ET9ZQkhBp2VnpwVNlQ3m5B83dGQNfboxUXQ?=
 =?us-ascii?Q?aihVDFN/OWAyAV6G0jYWPHOXNQD54SmwMOS+5QfsvVTUY1B5l3K6KxY7KXma?=
 =?us-ascii?Q?UNW6kaLyn4bFATCqikDzDQBuUuY0XsIkwFwMmq7B0KGR+9PK73l+CtSJ9wU0?=
 =?us-ascii?Q?gF5aOgE++Wl9PVVuXBTXZ25a8ItHfinpDFZ0zUEiBuXyILCIoXrM7rB0nYrp?=
 =?us-ascii?Q?OPXvbBblvzUWMqB82LqvKdM5hFIkt8ck8I4Q0EGu4ed2VKWBtrLMegokO15q?=
 =?us-ascii?Q?kk5hTIyQE7o54CRdLS0zm+C2dyFRvFReY3QXXl/IyAmoZbAXUMlcnZpcbk5Q?=
 =?us-ascii?Q?HqmXhNvfLUW+4wR9I5oQY87tFT3FLX+0oZk2oGG4jFmQ+OleRVLTp06fxyR8?=
 =?us-ascii?Q?OHxf0v5DidC/OvCS2dpkPeXBR15TvCdBSZGeWb6/OmVJvSJvUoQRyfYCaqYI?=
 =?us-ascii?Q?PXAqlEwe0p+NDq/1FL0Pr/evarelvw3XtZZbS+k2AtSu0baRI84CyA7RCZiA?=
 =?us-ascii?Q?PlZ5kXuI+X88In4lDMSx5s4dM44Su2XZcdL8pKq6hA0xXKQaJSuVudfrkuHo?=
 =?us-ascii?Q?tqeRGruqzkjIa3c4WTqR2e4O8farIQbdhkAeJ2o+O4OrPb1Naa7y2rMtwA5r?=
 =?us-ascii?Q?yunN1KZ5ycMsOE9HqJgYvEH5I8xZ1wIrIWBXdWMsnK0bxCzIotSnNelzNE1P?=
 =?us-ascii?Q?8XUd98sGHIZe5qeAiguCmI/8eDCxgz/7DX0tVMGdHbzI1C3SBHqkU101UYs8?=
 =?us-ascii?Q?fg4T1+VUPYbS+lmH3pE/ALRpSPityhNPV6jYxjOYJHBE4tx75Fb2yS3W/dPX?=
 =?us-ascii?Q?6dTeHYx1wFOF4+0+r/i9xBfUBZxhYnESAtdIopewWO1/f5P76jNSyKIfzSED?=
 =?us-ascii?Q?5jgzZ1KhhqiRGQm4+YJ8jNWA88PVN0p16MvwT1m+uNr8/ANWYj3Ez5kXRLRn?=
 =?us-ascii?Q?rEf0VYi70B53BKM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ytliwRlPz5nJDvMTobUPXREYLQIJL98WxEj5ryE+fa27TaH4z+26IXJ7v42D?=
 =?us-ascii?Q?PIQf262KwfnuTf9Q5m57tZcby0zDM4h+NGvgPcKI7duKzvsV4gi3ZAK3GKrO?=
 =?us-ascii?Q?Q49fvOryioG7gRBGiH2FtE2RrDGda/ANKFHBu2EY21d0wmzeE1NmMn3VPS2s?=
 =?us-ascii?Q?nYhYDPhlvuOCesfNQOB8iTooUNqTgOuvRZitZCom47wA2Ca+hyEY5g3aoV1T?=
 =?us-ascii?Q?cNel4xtBK6PyUYLAzSDA38DmBNjDYcIKsckHNtL06lc9s5Ed9uhop7qgUi65?=
 =?us-ascii?Q?5buNYZHZ87ilSM51IS3wQgKEkWLBxaY0U5ypIo+v7jXqquPLd7dkUUf88BLJ?=
 =?us-ascii?Q?KBlkI/FGuSTXz4udAddBin7XBYClDdRpcgtPq59sKhdhbViY2YX6Bp7vGHv1?=
 =?us-ascii?Q?p57Z8uPGxka5f7qJl2RSKzBxCmfvO7mEZEsOQjydTVK3RumQ/g2kU6CgtqYy?=
 =?us-ascii?Q?QlRZst1D4+hCEFpJX6SMnQNhLuwSwWp+CneCDXAKPrvwoNQ3ZJW9r/k66Vp2?=
 =?us-ascii?Q?LtleVmrmWYHXZ7hr4j2JheMgXg9Z0daiUJMrl+j4onk8bqoWDQ//aHEnayPb?=
 =?us-ascii?Q?uqHEV6d7AibZp7QP3KETPIpOg3JWjD955KHCR8aP7ddQSfgAQivzuL2sKrBT?=
 =?us-ascii?Q?zd3wpoWPhR/Xu8ihgp6dM0rgCeWyf/hvlX4MckueKD5kt52gi5fCRquIl8Xq?=
 =?us-ascii?Q?iPOC743XO+Z0z5cJulpcSEgPbRRZ117vrleTXTzsGio1ljN/F77EobfM/v10?=
 =?us-ascii?Q?HEL4y5LJYOpgSOVAp6jmKndDWpOAIKk6u8jzR7gZXKvzi7YkKm4vULrUvNSZ?=
 =?us-ascii?Q?usjYtYY0z5lscjsmxY874kt5xsFtyXyNTg46avnZGNgJyxGdWUhmA80ASi/y?=
 =?us-ascii?Q?ilW+SRzNpn49I9EJfREaulZ2XIx0TSDnbi2lmT6LJz2qYX8W5/pHNCv+eysR?=
 =?us-ascii?Q?OkGruDc5dzfxdI/it2tjomRFi/k8UNPcLK5hfV1ZWyXDAY/CCXRdjAOQSgNz?=
 =?us-ascii?Q?33xISf0XyMTeUZWbOdLTkqrRvR0AeBULO/u7WVYEL4/m1r8ZkQcUMhFMlGKN?=
 =?us-ascii?Q?+onD8EvN/LfQ3VKzUzR5LhxY46JY+xnpuhzrRlXNkAszUoIH97+NFAKhKxiI?=
 =?us-ascii?Q?/H8okCuy3QxBZkXsB1qwN6+5RneGAR2KR8/LHvG3oDzijX/Wqfuz03ssCono?=
 =?us-ascii?Q?BfDsBExTmMZthFy/X4Toz2ofJurXBtoydW07FLOPLNou71AC1f0wY1YErikT?=
 =?us-ascii?Q?40mKdsPmiqx14ec/uXiasB5dL//vz1t466+DOg2kuoC1cuOd7bg3cgWy4XeB?=
 =?us-ascii?Q?UU9NQxzzbgbBrwBJC0iLa/xj8phePsFxO/tpbOANOF929VDBi2o4BQ3ATzHr?=
 =?us-ascii?Q?YcfK3Lpy81ywEAtf2Fx9/pf+TDkoX56mYB2Kgbb+oogJGPs+J0mfjTacO2YW?=
 =?us-ascii?Q?CzAxy5hW/CiHli+fTe56stkG67TsTKrGmUuADM6lVtDnij07T7t+BdVuVXTV?=
 =?us-ascii?Q?1cXQfSdw2h/Ksjudh+K9s9GIEtBJ//DCuxKnf3AGmQR78rCXovtUsxZbcw+K?=
 =?us-ascii?Q?HaBvhsG01UsLYW2M4Gs=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 18978b29-524b-4124-bd86-08de1e24e9ca
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 17:41:42.5756 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aAO/UcNn3ZAR29/EJ1fOYnSMlRrazbHk0HabdTe5Rd8wyAnAxmASAD1jEZlQq5Gp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8826
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

Move it out of vfio_fsl_mc_ioctl() and re-indent it.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Acked-by: Pranjal Shrivastava <praan@google.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/fsl-mc/vfio_fsl_mc.c | 56 ++++++++++++++++++-------------
 1 file changed, 32 insertions(+), 24 deletions(-)

diff --git a/drivers/vfio/fsl-mc/vfio_fsl_mc.c b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
index 76ccbab0e3d642..d38e51a57f0775 100644
--- a/drivers/vfio/fsl-mc/vfio_fsl_mc.c
+++ b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
@@ -117,6 +117,37 @@ static void vfio_fsl_mc_close_device(struct vfio_device *core_vdev)
 	fsl_mc_cleanup_irq_pool(mc_cont);
 }
 
+static int
+vfio_fsl_mc_ioctl_get_region_info(struct vfio_device *core_vdev,
+				  struct vfio_region_info __user *arg)
+{
+	struct vfio_fsl_mc_device *vdev =
+		container_of(core_vdev, struct vfio_fsl_mc_device, vdev);
+	struct fsl_mc_device *mc_dev = vdev->mc_dev;
+	struct vfio_region_info info;
+	unsigned long minsz;
+
+	minsz = offsetofend(struct vfio_region_info, offset);
+
+	if (copy_from_user(&info, arg, minsz))
+		return -EFAULT;
+
+	if (info.argsz < minsz)
+		return -EINVAL;
+
+	if (info.index >= mc_dev->obj_desc.region_count)
+		return -EINVAL;
+
+	/* map offset to the physical address  */
+	info.offset = VFIO_FSL_MC_INDEX_TO_OFFSET(info.index);
+	info.size = vdev->regions[info.index].size;
+	info.flags = vdev->regions[info.index].flags;
+
+	if (copy_to_user(arg, &info, minsz))
+		return -EFAULT;
+	return 0;
+}
+
 static long vfio_fsl_mc_ioctl(struct vfio_device *core_vdev,
 			      unsigned int cmd, unsigned long arg)
 {
@@ -149,30 +180,6 @@ static long vfio_fsl_mc_ioctl(struct vfio_device *core_vdev,
 		return copy_to_user((void __user *)arg, &info, minsz) ?
 			-EFAULT : 0;
 	}
-	case VFIO_DEVICE_GET_REGION_INFO:
-	{
-		struct vfio_region_info info;
-
-		minsz = offsetofend(struct vfio_region_info, offset);
-
-		if (copy_from_user(&info, (void __user *)arg, minsz))
-			return -EFAULT;
-
-		if (info.argsz < minsz)
-			return -EINVAL;
-
-		if (info.index >= mc_dev->obj_desc.region_count)
-			return -EINVAL;
-
-		/* map offset to the physical address  */
-		info.offset = VFIO_FSL_MC_INDEX_TO_OFFSET(info.index);
-		info.size = vdev->regions[info.index].size;
-		info.flags = vdev->regions[info.index].flags;
-
-		if (copy_to_user((void __user *)arg, &info, minsz))
-			return -EFAULT;
-		return 0;
-	}
 	case VFIO_DEVICE_GET_IRQ_INFO:
 	{
 		struct vfio_irq_info info;
@@ -589,6 +596,7 @@ static const struct vfio_device_ops vfio_fsl_mc_ops = {
 	.open_device	= vfio_fsl_mc_open_device,
 	.close_device	= vfio_fsl_mc_close_device,
 	.ioctl		= vfio_fsl_mc_ioctl,
+	.get_region_info = vfio_fsl_mc_ioctl_get_region_info,
 	.read		= vfio_fsl_mc_read,
 	.write		= vfio_fsl_mc_write,
 	.mmap		= vfio_fsl_mc_mmap,
-- 
2.43.0

