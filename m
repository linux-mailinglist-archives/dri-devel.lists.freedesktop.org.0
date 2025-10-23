Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E615C03D80
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 01:33:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C21010E9B1;
	Thu, 23 Oct 2025 23:33:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qcW/cEdE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010054.outbound.protection.outlook.com [52.101.56.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A659D10E9AF;
 Thu, 23 Oct 2025 23:33:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mD1wa1lVBax+mBezsyGqWrYfwBeibPnm0q0JFWCDtLe5OY/evHZUf4C7/T5aTcglriESipX+1oBYlq6nhtL3spMFxqo29oBqMvIaPqYzhBMybfpKiB00OBEg6YrVn+MdknbKdgAZ11ffsxQLu2PmzxQfcW7sBmCLmSxtimflSO/XekyDWpQrY5efO8H5yRWQTQe5Gb/xVmKjwlc3g8ch6xUlGzGYMw5Dsln9ogC//1QLbeiaDLVo+H3EsMnOlge1OvcNAN9JmlBvN72Oo/GYmpfR9v5kBb5GbHzM15jYJl7O+Xv6embvZPoo/jxy/0MlMCJPoFhU0qqxge3vcPxNuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PY+2GD9rB9WXzjJHwyxd7VMKEbrLgcrBnswiZE+3RdU=;
 b=SgjrCi/bqKqd2o26106EtdWkIPe4sJxASF7D/s0WGinz6S4kKhAdjNeObCmkYwoFuJU6Jhf83vb+hZ1lXrhriK3h683KxmVznT5PmqTPU8IFXUSlOATWu70RqFQv6P1o6dOsCpwEzJ48J1Emst88wXtTGPGSL6Ov3rsqFrlM/ktdlyORSCiI0/1ehUTIOoiLi7XeRKTHYTlqMFqO7J2Pjr8QkBFyGVnKa8q2ABnYTFsIJNXNCUK900mgVomubbO1tSlsOfes6niHcs6fsg4al1jtS2AsR4u6R7EKki4dGm27CM6V3l9eGjEo8qZxkAOB5W6FvrtRY4MDc9WuN5ZLrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PY+2GD9rB9WXzjJHwyxd7VMKEbrLgcrBnswiZE+3RdU=;
 b=qcW/cEdEk77UDa08M0ZR8m1ca2Qzudzeh+iqZWcMw7a4GK0ywFeffkrqd9eCNa2eIWSCqQpA8wOCsRGVo33apLoqxhaoADriR8A6/LyfUw4xJhnR2uOzFugHf/NmedFjjrAOArCkuiisGlLf8ROXJ8NboyxCQzdDeEtiTtavLLAbxdXHfxbOwt+Hzh3n40XBN2fw4FS/mcM9C7TSRDvcQSVrfGvMWeSZjYomFKurxSEUicYa09RmiPzerrPkTMzL98AcpqRLHyG2kmk7hf/gLCuuMnCxjMSF7KZJQnehvn7dGtFn65u4Zb4zjVDc2yPSErRkE2ckK+qNtncbUb7urA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by LV2PR12MB5943.namprd12.prod.outlook.com (2603:10b6:408:170::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 23:33:38 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 23:33:38 +0000
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
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Kevin Tian <kevin.tian@intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-s390@vger.kernel.org,
 Longfang Liu <liulongfang@huawei.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Nikhil Agarwal <nikhil.agarwal@amd.com>, Nipun Gupta <nipun.gupta@amd.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Pranjal Shrivastava <praan@google.com>,
 qat-linux@intel.com, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Simona Vetter <simona@ffwll.ch>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Mostafa Saleh <smostafa@google.com>, Sven Schnelle <svens@linux.ibm.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, virtualization@lists.linux.dev,
 Vineeth Vijayan <vneethv@linux.ibm.com>, Yishai Hadas <yishaih@nvidia.com>,
 Zhenyu Wang <zhenyuw.linux@gmail.com>, Zhi Wang <zhi.wang.linux@gmail.com>
Cc: patches@lists.linux.dev
Subject: [PATCH 21/22] vfio: Move the remaining drivers to get_region_info_caps
Date: Thu, 23 Oct 2025 20:09:35 -0300
Message-ID: <21-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
In-Reply-To: <0-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR16CA0024.namprd16.prod.outlook.com
 (2603:10b6:a03:1a0::37) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|LV2PR12MB5943:EE_
X-MS-Office365-Filtering-Correlation-Id: 24cfcf6d-2b49-40b0-9b43-08de128c9783
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tDpglwryWCaiqwt6AS6FWrDQJ3H7byOCe5/rTk2t7l1LreRsJaOD1kFL812p?=
 =?us-ascii?Q?KL+pf0zC+mIgBE63iwszOe1dbaVjod7aZhIb5t6FFrHSEH4r7a3/AJ6qfg7F?=
 =?us-ascii?Q?ykhzogJG6JDK0rBYExTa/UarQr3UGzzG9IrGxAj5cwOvtFlY+Dw7iUfmmKE9?=
 =?us-ascii?Q?TULdRZHpQ2H6htWHWCPvGFzWsZUpXxxtGBihhiU9325PAGy+b90RF9gObmB5?=
 =?us-ascii?Q?VFzNGTLLooB09xK/32WrUY2SECJy0gOC0zb+oIIXdj97VUFPp6+uFd/ngNx3?=
 =?us-ascii?Q?N7RcrstXjKKmANdd2YG2VXTpZbw37MH75BIKJ93qREBsiVrrAUD2APGdkDMg?=
 =?us-ascii?Q?iYxY6X0at8XliWo+NEzp8aXkpxgFLAj/tUIbZdccdcsDTZ5f+42t5kVcHFQG?=
 =?us-ascii?Q?uGnY/yyT5YeisJHFjan4TVcm6WY9VL885L6QH3uTMYPEs8Vst1yBgeQ2t+9L?=
 =?us-ascii?Q?2aM4Mwg4eN3cMngkgys7RYK7BXgqFrNKi3H8rK3kse9RsnjVmQGjqx+ERUN+?=
 =?us-ascii?Q?+FunFRWT1ySCcNeolRv3ZmKR4s9cZuKgQxDX/AtV1PmV9MtiEj1WJZg/G6Wm?=
 =?us-ascii?Q?3R1WE9ptfMYI9c5sjDfrVtiH4QMNt3K2Q+stYvorLIZNNv8YR4ifF3+lpqHo?=
 =?us-ascii?Q?Q5Lt0lyVANtUm6QmJfCmSLTPFD39On1Jvx3nkRwQKaNoEsXfSD1eNTknosGY?=
 =?us-ascii?Q?NaUhQ95sQQNWr2dsk2tMfih4GOK+Dip3IiyZt0alhyeKbG4hyi7H1YvA9y+K?=
 =?us-ascii?Q?gtw+c6/eMwPZKCXs/Ffx4woMXFunT33QUWAEQLVDgyeSzUQjJpOMecE16Bgb?=
 =?us-ascii?Q?g5yGH+rQB62xReWHkt7tpTyuwRfkek3Xj8XeMzzgwzTd9tJ6iWEU4OLPx8Fs?=
 =?us-ascii?Q?HOB1ACo/gKwqgyfVbsEPTj2rkrho9V6H6vqbyMWv7MNXQUVveuRtSOdEmBGB?=
 =?us-ascii?Q?uF26e3gwWmbh+fdGGTm6cGD0Y3F1+cKWvCOYPp7wFmPHUFpsYSxhT7TZOadR?=
 =?us-ascii?Q?PyPhOBaSUhTrKFauABXiQIEl6ulD7qZOeB08C24IEuEufPgiAafhqwuYePAt?=
 =?us-ascii?Q?CpiWFIo0X1zfGufP1/OKRPiZcZSFfxrRAsIIc5x4VeZRMymTN1Y8Qu31JZo0?=
 =?us-ascii?Q?rZPj763+FUk9gfmUsew1z5EyEwN9JCu6beVU684eq720eyLLqFPMu65IZ85s?=
 =?us-ascii?Q?SNH2cbande6qEMYVlVNT0f9d0rvuYmoiEY7+kBoh8gkLOkiXU9hoZ0Ke2m2j?=
 =?us-ascii?Q?XVUIqXeAoWDYJAVzx/gfS+QidcxNUpr7+K3ZGmpm1ZcxlELLkkag3wgWywJX?=
 =?us-ascii?Q?B5JJnyhuEOtEyHG1V0ia7WCbGbYfKHrejwM6oDHkZy/HRblseXHA6EmVHed1?=
 =?us-ascii?Q?T9iSMcTaAYrVpXQ4N7RW0ZuagUh42PKruQB7hoLwPZQwcvWL1lYLJ572hNkw?=
 =?us-ascii?Q?KILeUxogxgdBAzjcXq+4yEV5Ww89+9/jKGcX/uGh2DwaLYe7QsWPB5wajK2t?=
 =?us-ascii?Q?LuZs/Q8GLDfu4iQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AFfNXnEqTco/wJgme92uNG7WsJob6gtY9ySpDgUsTJRHaDz6XEfgrOX2auBJ?=
 =?us-ascii?Q?0cgA2/ZJGv99wO0W642ThO81ToEywsnw2uisk3F5mQ2HALf44LrvLwvGZap4?=
 =?us-ascii?Q?K2qwpuybmIxJGl6LzwSK2Q1fGt9jG1OKTCXAaJfXB1G9OmPCfORDsneiou0R?=
 =?us-ascii?Q?dJlWOC5402zFv5SnLxGedDvmGyD3t31ROtMuqgh4XClekK9KUGjaga3X8cgB?=
 =?us-ascii?Q?1XyoT/Sib9LPT+DStDffmPWY1osV4QUrpn93Ft3mju2GARiK13z5qa7zc1jF?=
 =?us-ascii?Q?FcysWbp8vB2k+gFsHR4Bez55jWj7ZKz2FlPgFOoZZNDqh9x0PkcpAJcgl82c?=
 =?us-ascii?Q?cfoalOb1j2q+DL+TxJnrrF8yPxOLVdXG0SDQFesmC5/QWioGFCmyDDdsKZ33?=
 =?us-ascii?Q?U1H4DGsaeMshQ2Byepw1PH0KosunME3oE7Yiw6d6KDDk4CTH1V8dZoCrDGJl?=
 =?us-ascii?Q?4DKKFxeWor1ECik6Pjg85md+LCefL834uXxan3EwnIp/mdJYtNPrBqWY1DOK?=
 =?us-ascii?Q?WgVoEDWR4vowsStLbDE3DpA2lB6gWA7ZYbrR1QiIsgVDNcC8hKYpKnASzuZf?=
 =?us-ascii?Q?A5KMDIX6pFOJI1+++sIRfT4eiCNIGcRc8puy+oEMF/ugG0+a4iWiz+SmNVCF?=
 =?us-ascii?Q?Yb5GzPXkSf8y36k0PDFAfmWanEyE3KSmsdbg8wBSeJtHkHvSUgIOYqOJZ8mE?=
 =?us-ascii?Q?Vb3bkWFLznQGjnpYJUk4aIx4bGgSTeZMSZeDaKtXp6RvhRHFIQjZ4N/9tv+T?=
 =?us-ascii?Q?a/s/CmRYtsFv0gBp1S+X1DV5Rcz4B3KH2/xWUsCLe0cfuwHDJi72ImqWsWeP?=
 =?us-ascii?Q?dRWNnwjagzkUGLSW7EN3vSYInXeplrG6HFDnP/qinDdtqH6grmY4yvSuSF+9?=
 =?us-ascii?Q?3zg6yIeG9GyD2BWD1xOMjLkAPhR14S7LgaeUd+mFTtONYHzM+Vq49ec7Nbvb?=
 =?us-ascii?Q?heXheqntl94KEUKnHCRspuvg4HGfTKhOh5mjTKACD3UBdeLbwXhTE08gmFV6?=
 =?us-ascii?Q?tfla0PiYw0L9AY5wO6S6PSTbASEsHIi8Se6H9094McS+ZhX9Zsf5iZI7p7mI?=
 =?us-ascii?Q?h4ogjnGzlrB9xU9smsc4aCBIFIEcfBpN+JXN3AWtM34nE1O7U+cT0Krp6MhS?=
 =?us-ascii?Q?iZdS2Eo4Yt/nqq1bi2y5Tp4hGis7BlN7sNHagx3tVqb5DvQAoKbWShvHSv69?=
 =?us-ascii?Q?/TvcTIj/ks5dZS8dYPelx7OHKHJIKBjZfeEP8OSDevQKvGgzht54H++fLS8z?=
 =?us-ascii?Q?0uKPeno8prEEOXNvVlNEDphaAji5deSesfNuI3B2TACuuHXGJkgK5XGUBTVe?=
 =?us-ascii?Q?0C5BMM3ZXoUdiGL+oUmNmv43l0GaFUXGqfOcOcwBrPEbIem6ocurG4MbKUWd?=
 =?us-ascii?Q?Gkz2x1kIWVilDAc/atedp1y9xzp2VXH6dOOLC30b1Ang9vT5WeP06XdYyGZ4?=
 =?us-ascii?Q?2HHyjckJOfAvv1HljBzSyyaDUqF7GtX8YBtoKncIVKO4J7rxVXn1WIpUkQ8E?=
 =?us-ascii?Q?NEMIMYDRntC2GkM/OWfchZiJcR7VGAMShXUXWe/XrFlCfDFq3iiLZFOX/Kxk?=
 =?us-ascii?Q?F2kQ98vH1CWQmorRYpKprL9RJapBXUtmkjdF/jih?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24cfcf6d-2b49-40b0-9b43-08de128c9783
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 23:33:38.3935 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Qs/T1M+Y0t7eSrZAcsd60aS7cn8sy1llcFJ9+9k8BtHGXMe3m5I8mlWtlWNslNzJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5943
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

Remove the duplicate code and change info to a pointer. caps are not used.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/cdx/main.c           | 24 +++++++------------
 drivers/vfio/fsl-mc/vfio_fsl_mc.c | 26 ++++++---------------
 samples/vfio-mdev/mdpy.c          | 39 ++++++-------------------------
 samples/vfio-mdev/mtty.c          | 38 +++++-------------------------
 4 files changed, 28 insertions(+), 99 deletions(-)

diff --git a/drivers/vfio/cdx/main.c b/drivers/vfio/cdx/main.c
index 506d849139d35a..253031b86b60a7 100644
--- a/drivers/vfio/cdx/main.c
+++ b/drivers/vfio/cdx/main.c
@@ -130,29 +130,21 @@ static int vfio_cdx_ioctl_get_info(struct vfio_cdx_device *vdev,
 }
 
 static int vfio_cdx_ioctl_get_region_info(struct vfio_device *core_vdev,
-					  struct vfio_region_info __user *arg)
+					  struct vfio_region_info *info,
+					  struct vfio_info_cap *caps)
 {
 	struct vfio_cdx_device *vdev =
 		container_of(core_vdev, struct vfio_cdx_device, vdev);
-	unsigned long minsz = offsetofend(struct vfio_region_info, offset);
 	struct cdx_device *cdx_dev = to_cdx_device(vdev->vdev.dev);
-	struct vfio_region_info info;
 
-	if (copy_from_user(&info, arg, minsz))
-		return -EFAULT;
-
-	if (info.argsz < minsz)
-		return -EINVAL;
-
-	if (info.index >= cdx_dev->res_count)
+	if (info->index >= cdx_dev->res_count)
 		return -EINVAL;
 
 	/* map offset to the physical address */
-	info.offset = vfio_cdx_index_to_offset(info.index);
-	info.size = vdev->regions[info.index].size;
-	info.flags = vdev->regions[info.index].flags;
-
-	return copy_to_user(arg, &info, minsz) ? -EFAULT : 0;
+	info->offset = vfio_cdx_index_to_offset(info->index);
+	info->size = vdev->regions[info->index].size;
+	info->flags = vdev->regions[info->index].flags;
+	return 0;
 }
 
 static int vfio_cdx_ioctl_get_irq_info(struct vfio_cdx_device *vdev,
@@ -284,7 +276,7 @@ static const struct vfio_device_ops vfio_cdx_ops = {
 	.open_device	= vfio_cdx_open_device,
 	.close_device	= vfio_cdx_close_device,
 	.ioctl		= vfio_cdx_ioctl,
-	.get_region_info = vfio_cdx_ioctl_get_region_info,
+	.get_region_info_caps = vfio_cdx_ioctl_get_region_info,
 	.device_feature = vfio_cdx_ioctl_feature,
 	.mmap		= vfio_cdx_mmap,
 	.bind_iommufd	= vfio_iommufd_physical_bind,
diff --git a/drivers/vfio/fsl-mc/vfio_fsl_mc.c b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
index 438ea4da120e63..61f3f4f407adce 100644
--- a/drivers/vfio/fsl-mc/vfio_fsl_mc.c
+++ b/drivers/vfio/fsl-mc/vfio_fsl_mc.c
@@ -118,32 +118,20 @@ static void vfio_fsl_mc_close_device(struct vfio_device *core_vdev)
 }
 
 static int vfio_fsl_mc_get_region_info(struct vfio_device *core_vdev,
-				       struct vfio_region_info __user *arg)
+				       struct vfio_region_info *info,
+				       struct vfio_info_cap *caps)
 {
 	struct vfio_fsl_mc_device *vdev =
 		container_of(core_vdev, struct vfio_fsl_mc_device, vdev);
 	struct fsl_mc_device *mc_dev = vdev->mc_dev;
-	struct vfio_region_info info;
-	unsigned long minsz;
 
-	minsz = offsetofend(struct vfio_region_info, offset);
-
-	if (copy_from_user(&info, arg, minsz))
-		return -EFAULT;
-
-	if (info.argsz < minsz)
-		return -EINVAL;
-
-	if (info.index >= mc_dev->obj_desc.region_count)
+	if (info->index >= mc_dev->obj_desc.region_count)
 		return -EINVAL;
 
 	/* map offset to the physical address  */
-	info.offset = VFIO_FSL_MC_INDEX_TO_OFFSET(info.index);
-	info.size = vdev->regions[info.index].size;
-	info.flags = vdev->regions[info.index].flags;
-
-	if (copy_to_user(arg, &info, minsz))
-		return -EFAULT;
+	info->offset = VFIO_FSL_MC_INDEX_TO_OFFSET(info->index);
+	info->size = vdev->regions[info->index].size;
+	info->flags = vdev->regions[info->index].flags;
 	return 0;
 }
 
@@ -595,7 +583,7 @@ static const struct vfio_device_ops vfio_fsl_mc_ops = {
 	.open_device	= vfio_fsl_mc_open_device,
 	.close_device	= vfio_fsl_mc_close_device,
 	.ioctl		= vfio_fsl_mc_ioctl,
-	.get_region_info = vfio_fsl_mc_get_region_info,
+	.get_region_info_caps = vfio_fsl_mc_get_region_info,
 	.read		= vfio_fsl_mc_read,
 	.write		= vfio_fsl_mc_write,
 	.mmap		= vfio_fsl_mc_mmap,
diff --git a/samples/vfio-mdev/mdpy.c b/samples/vfio-mdev/mdpy.c
index 0c65ed22173862..0759bd68edca0d 100644
--- a/samples/vfio-mdev/mdpy.c
+++ b/samples/vfio-mdev/mdpy.c
@@ -435,10 +435,13 @@ static int mdpy_mmap(struct vfio_device *vdev, struct vm_area_struct *vma)
 	return remap_vmalloc_range(vma, mdev_state->memblk, 0);
 }
 
-static int mdpy_get_region_info(struct mdev_state *mdev_state,
-				struct vfio_region_info *region_info,
-				u16 *cap_type_id, void **cap_type)
+static int mdpy_ioctl_get_region_info(struct vfio_device *vdev,
+				      struct vfio_region_info *region_info,
+				      struct vfio_info_cap *caps)
 {
+	struct mdev_state *mdev_state =
+		container_of(vdev, struct mdev_state, vdev);
+
 	if (region_info->index >= VFIO_PCI_NUM_REGIONS &&
 	    region_info->index != MDPY_DISPLAY_REGION)
 		return -EINVAL;
@@ -512,34 +515,6 @@ static int mdpy_query_gfx_plane(struct mdev_state *mdev_state,
 	return 0;
 }
 
-static int mdpy_ioctl_get_region_info(struct vfio_device *vdev,
-				      struct vfio_region_info __user *arg)
-{
-	struct mdev_state *mdev_state =
-		container_of(vdev, struct mdev_state, vdev);
-	struct vfio_region_info info;
-	void *cap_type = NULL;
-	u16 cap_type_id = 0;
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
-	ret = mdpy_get_region_info(mdev_state, &info, &cap_type_id, &cap_type);
-	if (ret)
-		return ret;
-
-	if (copy_to_user(arg, &info, minsz))
-		return -EFAULT;
-	return 0;
-}
-
 static long mdpy_ioctl(struct vfio_device *vdev, unsigned int cmd,
 		       unsigned long arg)
 {
@@ -669,7 +644,7 @@ static const struct vfio_device_ops mdpy_dev_ops = {
 	.read = mdpy_read,
 	.write = mdpy_write,
 	.ioctl = mdpy_ioctl,
-	.get_region_info = mdpy_ioctl_get_region_info,
+	.get_region_info_caps = mdpy_ioctl_get_region_info,
 	.mmap = mdpy_mmap,
 	.bind_iommufd	= vfio_iommufd_emulated_bind,
 	.unbind_iommufd	= vfio_iommufd_emulated_unbind,
diff --git a/samples/vfio-mdev/mtty.c b/samples/vfio-mdev/mtty.c
index b27f9b93471bc5..3e029d0cba1ea8 100644
--- a/samples/vfio-mdev/mtty.c
+++ b/samples/vfio-mdev/mtty.c
@@ -1717,10 +1717,12 @@ static int mtty_set_irqs(struct mdev_state *mdev_state, uint32_t flags,
 	return ret;
 }
 
-static int mtty_get_region_info(struct mdev_state *mdev_state,
-			 struct vfio_region_info *region_info,
-			 u16 *cap_type_id, void **cap_type)
+static int mtty_ioctl_get_region_info(struct vfio_device *vdev,
+				      struct vfio_region_info *region_info,
+				      struct vfio_info_cap *caps)
 {
+	struct mdev_state *mdev_state =
+		container_of(vdev, struct mdev_state, vdev);
 	unsigned int size = 0;
 	u32 bar_index;
 
@@ -1785,34 +1787,6 @@ static int mtty_get_device_info(struct vfio_device_info *dev_info)
 	return 0;
 }
 
-static int mtty_ioctl_get_region_info(struct vfio_device *vdev,
-				      struct vfio_region_info __user *arg)
-{
-	struct mdev_state *mdev_state =
-		container_of(vdev, struct mdev_state, vdev);
-	struct vfio_region_info info;
-	void *cap_type = NULL;
-	u16 cap_type_id = 0;
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
-	ret = mtty_get_region_info(mdev_state, &info, &cap_type_id, &cap_type);
-	if (ret)
-		return ret;
-
-	if (copy_to_user(arg, &info, minsz))
-		return -EFAULT;
-	return 0;
-}
-
 static long mtty_ioctl(struct vfio_device *vdev, unsigned int cmd,
 			unsigned long arg)
 {
@@ -1953,7 +1927,7 @@ static const struct vfio_device_ops mtty_dev_ops = {
 	.read = mtty_read,
 	.write = mtty_write,
 	.ioctl = mtty_ioctl,
-	.get_region_info = mtty_ioctl_get_region_info,
+	.get_region_info_caps = mtty_ioctl_get_region_info,
 	.bind_iommufd	= vfio_iommufd_emulated_bind,
 	.unbind_iommufd	= vfio_iommufd_emulated_unbind,
 	.attach_ioas	= vfio_iommufd_emulated_attach_ioas,
-- 
2.43.0

