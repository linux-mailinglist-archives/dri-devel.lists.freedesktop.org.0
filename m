Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EBF0C41159
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 18:42:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE92D10EB3F;
	Fri,  7 Nov 2025 17:41:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="b9UJm8nl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010022.outbound.protection.outlook.com
 [52.101.193.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B624610EB2F;
 Fri,  7 Nov 2025 17:41:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qC/c1hd0OkjO8VCq7QdgpCDZFM+qZ+5+Jy4pJWJmpwDLwsgC4uGjDOqRqOb9Qiv3v/Aa7tP+oiYxAndIyl8RajId4Tg5oLW47hwHNoe66u4EVhnmd97iz7Ft/6p7KeXssJASg4Z3DuoLmivAzLhWwDi+wTTMWY5X5/893O5d6Z+zZ27n3aQUtyWF5YIuPk926I1LStNXNkzGBw7S7HbYLhq84yWmQkqKevW4kjzmowIT6AieoWGr97lQQQ6mIW/KYm1plthBnLxOPQUZZIBqU1IThw0HgthOqE+S1AM67LmK5ETYLwEeZv3d3PDtKSc0cETCqqitGMEwdtjr1A15QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fA1miwdBiKvo5vrT0YWQwHSRlgumDW9fcdimOrJfayQ=;
 b=e2Dymu5ytvIKjOKIr/TJy5A5i6Lvpvxf7m2/jRQR2HEbLIJ0JBDMEk7L/ChRP4NR3QgaOG1gIhpwL6+rJ8ZuOptoM8YdHWod0/xVgn1f8jfH4vXSLQ2k4BY3B6B7Uu02Vh+NL0MjGFv3hPxdxLTwEqiFUhq15ncojruvx9t3C56qDc6LguXKOpeuNq4CbwMvhCvOxBw2WUpeHnbYxG1N/a1Qr7JP3HMZ1hmVAlJjJdjS+0SY8TlKB3qNVx7sft20bqL3Wnj/KQzi+WIGKD3K0A7TIxwndB7Sahf7WZ5no5cC88BQb43uciJxAuAVAJBmR4O1vS5Y0GuX799/MwdXlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fA1miwdBiKvo5vrT0YWQwHSRlgumDW9fcdimOrJfayQ=;
 b=b9UJm8nl1bHPvW/HzMrCXS4iMzDQDmeBsXrjhKZGYCQiNf7XTMLGZr8JRMPc6fvw1WRf8Vg1YSf5zVHr5rPwdvJn1a5/gzsBIx4fQzCy5brQtJzNsCPkRjPHRY92/IFsz2qGjGTgOZYM8GBRAJqUvj8sf2D1Rkj08DRRaNJt0daXe/Q3i2JTaOywZfIaUGGxCi0CjbmtdK9uO0hMV0iLdxEI/oegUMjnR9C+Cvudkl0vN/I3BxGhD0vR65uIp/7aUHwBHW8IEdMNVFsrsDNw9qLb6SxoaRmRMMltH64rRvCiC5on6cUxResMbUWoBUHgcdplpRZ7W5vfYKAxIDWYwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by PH7PR12MB8826.namprd12.prod.outlook.com (2603:10b6:510:26a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 17:41:44 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9298.006; Fri, 7 Nov 2025
 17:41:44 +0000
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
Subject: [PATCH v2 14/22] vfio: Require drivers to implement get_region_info
Date: Fri,  7 Nov 2025 13:41:30 -0400
Message-ID: <14-v2-2a9e24d62f1b+e10a-vfio_get_region_info_op_jgg@nvidia.com>
In-Reply-To: <0-v2-2a9e24d62f1b+e10a-vfio_get_region_info_op_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0338.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::13) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|PH7PR12MB8826:EE_
X-MS-Office365-Filtering-Correlation-Id: d50718ee-606a-4549-679e-08de1e24e94a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?taI1qV6d+doZGaem0x4c7UBE7fWwLArsEWx7zgVjOkw7ziLPqvUAWYMHopFo?=
 =?us-ascii?Q?D+nKKo2lhnA99lRGJn0qHGRN7s+y5QZOND8yCVt+lweCiqdRoiTJuq2iiL90?=
 =?us-ascii?Q?t0AD3kViP/Q/gtIozfUPhU2KFNB7TdovxK0IPIGcYUzi60tOZJ9IdsY+z60f?=
 =?us-ascii?Q?+eQ32LRFLPDea9qmDvMiOGsp88LoGrnqDyBCJboggJJFCa4gio8qu02UOP95?=
 =?us-ascii?Q?Yz9zxbpCtzoziD3m5Mva+CRJsESH3XhAQGYI5XMaerfPMhsMzYyGoiZTOoj3?=
 =?us-ascii?Q?xDqQQceGKeY8bmD4YNGw8jr/di6m801d8dyocOm2XjS4Pp2+Pcbvi8a443du?=
 =?us-ascii?Q?TI8ojzNlBvretnv2pKcos8PtsidVvIwwAYCHAhuEu1vwqAAgvypaCDwY/vDn?=
 =?us-ascii?Q?a5dYhRTd5dY1ubtE5VWmBS+qjYVXew3Jiv8eGQ6IAl41jFSqnbTqCe6uOAdd?=
 =?us-ascii?Q?Dbc0xq9flQaPmUo/a93aYSjLWt8ZHAxv3WilU8ZDUoWmslyn/0vPYUWeqizU?=
 =?us-ascii?Q?FemskMtBFF6LAz4KUYxMPGWhmlYE0PIw4iAPpyMpOXfdXc3/3JX/y6wqmB40?=
 =?us-ascii?Q?Dt2buj8T9GrrsFhnRMd4BRk7ATn+PH9DqcxvWSccJivcjc8oVNmxjojJ6aOI?=
 =?us-ascii?Q?BU+Ti9JyfoO65O9LkzZVj42hMS6XJZ3BHAB/6kO9a3b4SlqVI2GORs7zFJYo?=
 =?us-ascii?Q?AsCuSh4EL+Wl10TPuAI1+KM5VlLPZI2zwqkB8GYclFCd51YKoZCJOQvpPWWX?=
 =?us-ascii?Q?z3d9BjaILoRUpQEOmqnzODUeC/JfMiA1Wx6Bfoc+vOXEsBA7FVTrnOzVySdM?=
 =?us-ascii?Q?rBsrJ8sYLt4472Sc2zggdN87SYKvaLwThVn8iT4I+zwbZFSgFdmJugXp1LN9?=
 =?us-ascii?Q?ihmqEhKY40bLoySZ4fwfGCqJ8lHzZ309JSTpKckMlZNjarfw0zgfdGvTb6pu?=
 =?us-ascii?Q?9IJHqBbJ3dAD1qhwRFgLhCePiJ64ShbuaM1eKW2BE7lM21HeVcLJqwOUAy2D?=
 =?us-ascii?Q?bqccj7bBMSYOzCknVjvzJl2ceE9o5EhCigrFUYBiebBhvp56Jn81+ta1z1dS?=
 =?us-ascii?Q?MTXbTX1FE9OWIKKD7VB1NF9vW+iW7IG5tFtuWI0Pm5F8A9jiZl1z0eqQWV2g?=
 =?us-ascii?Q?k0QlvPM5Iao6CH6fk5eiocIBpnDTUivUBJ72A20DWd6PPHTyDwsAulvxEV/2?=
 =?us-ascii?Q?XwR+k+PUGm1lHAMYPDSq4dOaNtY5slUJ3aeWlQGHLyxrc2R4U2mS+ntCfI4o?=
 =?us-ascii?Q?7dCRbA2X0/Vo5yCjkJ56LFCWMICIesvhOZy9+/rMyVRGBaSndaLn5c40s9Qx?=
 =?us-ascii?Q?JNLbIbulT1g8M/0f39lIS0qq6OuUmmBpJPWWFNRvEo1QV0AKu1tvGQXggLwi?=
 =?us-ascii?Q?L3EudCtx8U9plMPSB8fVAbyBUD/KbiBocR7sbVB+Nkw4WQVUxHEphwfMpjeR?=
 =?us-ascii?Q?ae3AiAziznSHEm6qHH+hsVdI1GXpHxBN+4rAOdWZWq2CRvimxRjURnk2m9m1?=
 =?us-ascii?Q?UdNDGuPgYTZEkZM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zXjYy7lWgSUSNp8ztqXW3Tkh5ajA7G1eRDa/bmOVlYMF+xUTnB53MIMUrr6a?=
 =?us-ascii?Q?LDEFyThGybORQdvgvE8aa44yXYxTmbqYtnVatsdWHpzccxFZQ4AQsPxPFcKP?=
 =?us-ascii?Q?gegvwQUkkuZBF+6PiIl2FSWl5OCE07uwo8Glvak//klGmVUg35akx9jPKvhS?=
 =?us-ascii?Q?1aALqxm6uobs/z6Ee2B6C/GEefUGwdUz5Tpy82XVbyU4wxh1r9FWlSZkgjKW?=
 =?us-ascii?Q?/hzl/YZQF9SCBP2ySFWfl0zTrU43PnFdywqtIv329G6Y9HuvF4V/FG/aUgQ6?=
 =?us-ascii?Q?M2o20GEarVMPotmbFV8T4LogGsci2+dyANVDrwpTdiEkk48vpSgUoJvqQNFh?=
 =?us-ascii?Q?aLa9MrkZ7TgcDcMY4y+aKMeSFuEnvbbYM49HB4ZslypB6j6H09F0vIjs9/KT?=
 =?us-ascii?Q?lOXBTnvz6yeawOys32U1dSWwxHt+Uw36yU5GzGDYYwyxpZ7Vb3EmdnPYTnfc?=
 =?us-ascii?Q?3dkPVYXau91uTDBHmNgEJzoM7bWaI7BUctdI4o+rikOsgxuu2Kuhr8UNmHwB?=
 =?us-ascii?Q?sK4iYb9rqI0vTFgLcED+I1S8bda/bQZkp4kb6a8g8zuHeZg4rMj8QWUbCOTh?=
 =?us-ascii?Q?FzNCrD8+z9s9hy+Aup77tDk012cQ9BNyM2I5mYe0cCr2CIMDA5grdSaoDgZx?=
 =?us-ascii?Q?1SH4Axq/C+yIyPh1cQvtCuquaVQubuuo45qz21Rk4QGclKwfGOvS5uKUfGE8?=
 =?us-ascii?Q?gaorvxLHCnpEhMCQVePtiz/8DjkIZK+n2HShTOMgDOFgNyszOTJg86v5r5kV?=
 =?us-ascii?Q?8a25mTbxaeo5O+wh1tQR47UTo3fgtnwJpQiFnVr1xZuRF9WrcRUyYg76AspJ?=
 =?us-ascii?Q?qUIb5sr/DMnPqxLWjtTkQzEFY4qJzxIApmmml9B6xkU8wUYf+H1xK67DCRHE?=
 =?us-ascii?Q?Q9W0fZHHFS6o9FtMIk3HjTK1D9MfXvWeMfdMgiJXhVVmK9eWknKnReM8obts?=
 =?us-ascii?Q?o1krwEsWKQ2TFMbNkuCCWZTuc80kHLDjb8bbC4oxlBemTwX39K7m/1Yz9iNn?=
 =?us-ascii?Q?E46yE3b63xE/v+iBp3NJDiT5HuUJQys3uVNCwwvtCGLnaDBUY9fuvhkBVZOo?=
 =?us-ascii?Q?jSXKCxqDIR9lMksyXNKoiPmn0liFLGIqnW1sifXK+/njlNODrNOfqTxmQJn+?=
 =?us-ascii?Q?ma+k8vMbpuXMuQ/lj6dadzdU62J5oB8L9qfIYxOHRgRuAxzH/S4D7H91J4qo?=
 =?us-ascii?Q?vSm71eyKEzuMcgbY4raC/6GBUbMjmBL0PPgxaPqeVHvfyfJSBUnfseSVCgJi?=
 =?us-ascii?Q?SZ/62wIGNRR9pcjbjPQoHm0cy8S0V1yBGDAKSS46Ie8wbKV94OtDUssHbH4T?=
 =?us-ascii?Q?lXeda98ZbO4XEXKyKmtc2KLYFW8ViE7nZ/pxlMAScjOUKUPna2mrNngfNr6d?=
 =?us-ascii?Q?ku4yPNOGKSkz99Qz3g0GZ99qlMzqj2ytwhsBde59leDHORovP5ae+GMQ287M?=
 =?us-ascii?Q?hpz6VWoDGppiW5buUbr2eQDcp2W5hRMJoG/LRctif7SK/iPfXM5fl6Isn0QY?=
 =?us-ascii?Q?C8rtDcNvP/VjzBGcnsIzqHWHVwCMa/JDzjgrBDI+1J80s04rpJmJS5sGnNE9?=
 =?us-ascii?Q?YtLJ8Czs1IvmluVmjiE=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d50718ee-606a-4549-679e-08de1e24e94a
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 17:41:41.7740 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BeDn20pJY45jUbPwIbKvZRMJKLkG4F8blnVI/mRBANvH22Bnang8/zA785Ujnptj
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

Remove the fallback through the ioctl callback, no drivers use this now.

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
Reviewed-by: Mostafa Saleh <smostafa@google.com>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/vfio_main.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/vfio/vfio_main.c b/drivers/vfio/vfio_main.c
index a390163ce706c4..f056e82ba35075 100644
--- a/drivers/vfio/vfio_main.c
+++ b/drivers/vfio/vfio_main.c
@@ -1297,13 +1297,13 @@ static long vfio_device_fops_unl_ioctl(struct file *filep,
 		break;
 
 	case VFIO_DEVICE_GET_REGION_INFO:
-		if (!device->ops->get_region_info)
-			goto ioctl_fallback;
-		ret = device->ops->get_region_info(device, uptr);
+		if (unlikely(!device->ops->get_region_info))
+			ret = -EINVAL;
+		else
+			ret = device->ops->get_region_info(device, uptr);
 		break;
 
 	default:
-ioctl_fallback:
 		if (unlikely(!device->ops->ioctl))
 			ret = -EINVAL;
 		else
-- 
2.43.0

