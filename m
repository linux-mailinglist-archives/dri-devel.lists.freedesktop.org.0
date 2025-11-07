Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A76C4113B
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 18:42:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F320A10EB31;
	Fri,  7 Nov 2025 17:41:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="iPEV844i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010022.outbound.protection.outlook.com [52.101.61.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E83810E1C8;
 Fri,  7 Nov 2025 17:41:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N9btCFsgOBpVDH624lRTYDr47dQXgIs4WY3SSTWaCKHu1AAsfVocsGskoutzq0SEoaWeqdlZGFo5/aEGXlR5YvcTSLkXcOYGzckChGx2/NVPRx81NrfFBLL7SUAYlvF4t2hJdJTS8RuvNJT3ksQGIw7t7yrBwdqLHpzrP024+//7XMTWqt3/ESelumsoRMUljwA+Ccwi+fxxd8YnwZRlfqxta4Oeuz9a2FS+HWkZxQ57ob08xG4B7zgLakiWJ1xxhtxfwUozf8o3AEOVsKxVxoJC8oJel3UYIFHkZ/0LZuyNsBEueN5mSEDIgFLd6A/AZne7qfcRg3gYRMvQ7Famdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LKxu1dmCIR9uCGFiHiDMF+jTPgfllz1v10IlrXv2W2I=;
 b=gCoCV1w8Dcj53V585RZmozongKVTwTS5QjDjL631jlRX7H8PJ3wyW5cqayTWmP2yDKoRECSwpA2FQP78TR4Z0PoXq2rtdMYzYUITYtrbS8jTKjgk0ccPV/yO6Msl2GcyPNZORgCVRhRhBzbwzXUiBVFZ8Jg16NTFWBkyHNnAwmSlqx3yPVdU3Ww1alDWgZYAKMpSdYIpuDti0qrYGsDm6+1SilNjYP+6m2IzN9rbWXZSgnMBmzX3yHBxf+4MwvGImbDOQ+r7oGWd3GtHwG1vnLgbQj+DgGrDzmY8wHYH3DlOOy15jo+QT3uvALPo4KwjbHcLqcalqu5qPqea8nxyfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LKxu1dmCIR9uCGFiHiDMF+jTPgfllz1v10IlrXv2W2I=;
 b=iPEV844iuuhmcyaWtPi2oByW6dZBlUEcNMDAjvMU00smSslGffGdYN3zbdZd65UNDp5FoIY3V20UVJYWDDPrLf2Hf6ydNU0ES8RByOYChDDwI25qWwQABdyjJ/qQsot0jw239uTHIQlTG9pDEFVwO9lk/ZyGZDOGhZdguohgRhaYpbxwxPv4216n9a8JLyoZfJU6fc8enqwM1MGYtFaFcrZC/LyRvvVPR4mQg0qYzl1L3mvhbHOjrKhGlPw2bzq4auVo+5y5dDKbtEJaCqtAh3/ZomrYZnJ19x1bL1NGGj8GGiIk4wNDPH6Mm85R39ajjxfE4HMj+qg+WhPhbDTwIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by PH7PR12MB8826.namprd12.prod.outlook.com (2603:10b6:510:26a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 17:41:41 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9298.006; Fri, 7 Nov 2025
 17:41:41 +0000
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
Subject: [PATCH v2 00/22] vfio: Give VFIO_DEVICE_GET_REGION_INFO its own op
Date: Fri,  7 Nov 2025 13:41:16 -0400
Message-ID: <0-v2-2a9e24d62f1b+e10a-vfio_get_region_info_op_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P223CA0043.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:5b6::9) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|PH7PR12MB8826:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cc1988f-1e41-4127-5aca-08de1e24e8a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kzxtF7qmNu8EkRhzpfRySg2DKTOM5VdZ+s2N59ToOxUN709IxoCAtPhPm3K3?=
 =?us-ascii?Q?2rFGBb/8WDUdhcAoXgMa2QPvcE616GCkunSpnfi36A/Baq3VnIF+DgYnncbW?=
 =?us-ascii?Q?UqtQPjWvgMq9ob0iiv6rDKUvRnQ+8uT0OuoW/sC4fn9gKylnAO/OJ+gif/we?=
 =?us-ascii?Q?TpD9TLXEJD4f8h2o/5F8l1kN/QUa6fybOyJKFqAPwj2wVlo5IuU5+svU1132?=
 =?us-ascii?Q?ooGI2Dhq0ROIriVam+Zadk41rovctLHJTg7qFj7V9K6z/BdGCeW5zNXeEnfH?=
 =?us-ascii?Q?czp80GQvhcDOnTklcHdUgLoReCOiUbEITKLWESZhmH7Dx8ZXKlLdfSyWTVx1?=
 =?us-ascii?Q?996Khfg2DWQ6sIGR9Era4e2qiKfn6GHnpdv/fjnGPQsQj52uxjzQuc/3lwfV?=
 =?us-ascii?Q?ULL0zXSRFFE9c+rUbjw+rTfUhI0vxJLDLE9TcYVFdkMWoCLbpSaXcgWyOucs?=
 =?us-ascii?Q?RhuP48VBGUGqtV6L34+YWXYX+xddbppdpHX14EdjjHICFXIInb/rK5dSw6Ky?=
 =?us-ascii?Q?oyKKCeSppwFlvKBCXWDocy9qTwSpyP2SP0AVA5B9vgizs36Z4F+c8cX+KnrY?=
 =?us-ascii?Q?drEJAwonM61a64UOKSrqZULvjWl3sdEey4Ntvy6Whz7mIYJQQEefNLpyOqGM?=
 =?us-ascii?Q?5y2CDvvX2e2r2pdpgVdQS0DobI7oyc8A4oWVau61Wyj+NzjoHHc1EeA8O8wu?=
 =?us-ascii?Q?KdxuNy+hiaUzjtY+TjSNDrVB605OfqXkCXFuGh6O3/W8+7sRv9nygL0hh3hs?=
 =?us-ascii?Q?QaOyx/7I8cF7bkzk+i+yv4Oo8tT9M7iqBwOk6FbV0uDhsJz0IBj+ry7HEUzT?=
 =?us-ascii?Q?PIz84EJj7bzTczwzZxAIukBtDntAq6MHkes3BALhy5MJTRjC5+e/C66xX9kq?=
 =?us-ascii?Q?J3GDz0lOgUwI9D/Of84RxNSoZf4VH8bN3jI6X/aMJ+WDko/huXCJbfrBfxZR?=
 =?us-ascii?Q?VkoSEoled5B3+zdSmd82Q7DoKpruMUu1wUzkVC+/qHhSqbHXLDJNSXRRHuHs?=
 =?us-ascii?Q?LQZflKiZTel4VKzSPHJ+Gq/x0STJTbBOlPmckg6P3ThSGIrXoqJHIwYXuB/H?=
 =?us-ascii?Q?wzTaKNmbp5+QxkczxNtoGsdxLXKcdLl8m/K/BDfmiIHMcgZzB8LdkNuYxoJG?=
 =?us-ascii?Q?wLWNWakJL+Ke0EwshgyCfq+3BNVPjj2hoDNZ32I7FldbgXauhu28l40/SXaW?=
 =?us-ascii?Q?AU2pyOjprGMnBc6wUGz7qxwzNj+yLWn29OC1pcRYq8p637ulN3JKrL2iQ3yb?=
 =?us-ascii?Q?OfJywBs04DcKFgR6F36Lwh/xaY/Hb/lWmMyxLLKldA0pcFYSy3H5ojgLj6VR?=
 =?us-ascii?Q?FOuO37beBCv9VJVZqOFE2ZUGWghxBXKWB06ThLzy0qW/JfjiO4SZHlHxC9lG?=
 =?us-ascii?Q?o/gLHeL642hfmQcLp7sV4uGDKVvU1tS/UCF2KNO0nWvbyOu5aLDTqfL9VMkE?=
 =?us-ascii?Q?QBEdBBTscI/InoBLxDBRN054eG5sATJLvC/iQYxRpQkpmRZbZ9MM51mDj+jg?=
 =?us-ascii?Q?YNsN3BdBg4wSuqQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?40/A6ryMer1vU/zQSSfTBIdTrDnHO6l5Cl/fkWcpkCg51hRtDL3CwsTSF7Bq?=
 =?us-ascii?Q?kITN7udenC4ht7iWoSSUIjjh0+T+4kFmSB/r0x5v5tsyn65HAw6EqOBTssrX?=
 =?us-ascii?Q?I7JotfLgXVtXuFke39Piw7iloeL+W7N4LygbRXovYOaTQfQEYttLiiF28IPM?=
 =?us-ascii?Q?3YA30SijJ3R5WlFDwGAndhCJnG5IUmDY8xZy+2mBM00Tj4eOilVl0VkrA1AV?=
 =?us-ascii?Q?48cwwiRFxd3ymrmfDrx6CeAByTsFAp6rBgjehaA4WxX+R+NbW+s0CiUR9RMH?=
 =?us-ascii?Q?W56fdz8l7O/1G5kp8K6HLWWD2rT5V9TnBeasQ1z+yb6izz/lIfV+7u7OqlGQ?=
 =?us-ascii?Q?5TyVQHthxR3Tij89GM5k4HdayO5E2ucZkbYMNfMr7+VRWvX5q2B/7lbIsAsn?=
 =?us-ascii?Q?tYLNN+Xx8Jc8vePgyPco3hc5ybdEep1NkH5UKFoZbcgYhERk9l/7F/e8dnUU?=
 =?us-ascii?Q?nEEwkQ2GblOU0qY5RriJWJC5b8X9JXulh/qQanwKuJPRZksxTehH0pPPOhtD?=
 =?us-ascii?Q?oczBEd5O1nO0Za95GDsYRg8SFyoYVOQA/IN9DEA5828lBzbFD6MtoeEekiiN?=
 =?us-ascii?Q?yr9MMCsEe86jtnpGTwy4VaLw/9RS5cMtKfwmaVkt50daC4Jq+MSmUnOCUfAG?=
 =?us-ascii?Q?bU7Lq6xTH1ISDg/8V5ZXt5YbsawNhFBeLq4AoIUMYi6gney0nh0l/Mclsq8V?=
 =?us-ascii?Q?ZHLc1itgCXd39yqMY9p2OpuCx1Qt80/DczsYHdTxkkzESTuUSiOn5v3hYP4w?=
 =?us-ascii?Q?li+clPHRknIFbowHG1RFi8sUaVa9VxdDoYgPLgagcRC0Jqf1VV/37ArUiRlD?=
 =?us-ascii?Q?avglNC8U5Oid4i2QIa1ySmOGd8QExJLDzWiwrUfsWXyWexoUlHZFmUHLF4A6?=
 =?us-ascii?Q?dsjzL2a11d4JomntfWcciYpC/JyoNnNuwIlbzmlYCieDLfX2QGiBvwrecsX8?=
 =?us-ascii?Q?TLqCk2PXP/u5SaP2XTVJgNRbZmQgozcAJ0Z2XKTK+WNR5uuBAZlDGUHxX6b/?=
 =?us-ascii?Q?J0KsH1dGAhq7E5okwGOcmEqa3C6FnY+OIo1YURmwRbkP7t2qfPviCaww158H?=
 =?us-ascii?Q?pKDvc68OdZvBRagR5vAShWeKDVRUTk/CEvfHkDJUHQLnP7E8Kd6r4i9S4bXX?=
 =?us-ascii?Q?B9a8Ne0IZPR036pizbR/RAXoF+OytdS1ROwkoORtDmpth4zUWKbsw+PzH9bE?=
 =?us-ascii?Q?+80PnO5zvc6JuRkqZW1yZIkwvKkftHDsP1CdGOuosdP/pta1x6Ewupxw1gV0?=
 =?us-ascii?Q?ehbC/K2kp9JypBKohc6RaMixE1qRIv/1hgaycQejv6jc6cYIpLLkC+CKLEHg?=
 =?us-ascii?Q?dHZPTDWSicX7kEYIH8CpwqjEJaWv8YR/wlPiwjA/fmqp27wj3UZzSOvKVlKR?=
 =?us-ascii?Q?aWMK+/aY9xRqGrAuH9k3kHGHwheb1e06QwluXHXLv1fV/AWIl3XoCueTot5B?=
 =?us-ascii?Q?qgJywGIC4uErhdGv6DRPXUT7oL33BD2dkNyPoDZS1EhaKYW3xYRJa2hN+k2H?=
 =?us-ascii?Q?R5zr+NKN09ol+RZFP5YaGpQxzWRTSjCfLANg0c5m/zZ9NFk7UDVSig1P4o6g?=
 =?us-ascii?Q?yNlff+P4DIav7+vgJYY=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cc1988f-1e41-4127-5aca-08de1e24e8a1
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 17:41:40.5214 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: K0hvWrsmeUUGc8CzuRj3ej6tEbJI0+kAlL4i+/SwnN5DohRmjX1Q35RGq7rK3Z/9
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

There is alot of duplicated code in the drivers for processing
VFIO_DEVICE_GET_REGION_INFO. Introduce a new op get_region_info_caps()
which provides a struct vfio_info_cap and handles the cap chain logic
to write the caps back to userspace and remove all of this duplication
from drivers.

This is done in two steps, the first is a largely mechanical introduction
of the get_region_info(). These patches are best viewed with the diff
option to ignore whitespace (-b) as most of the lines are re-indending
things.

Then drivers are updated to remove the duplicate cap related code. Some
drivers are converted to use vfio_info_add_capability() instead of open
coding a version of it.

This is on github: https://github.com/jgunthorpe/linux/commits/vfio_get_region_info_op

v2:
 - Rename
    hisi_acc_vfio_get_region -> hisi_acc_vfio_ioctl_get_region
    vfio_fsl_mc_get_region_info -> vfio_fsl_mc_ioctl_get_region_info
    intel_vgpu_get_region_info -> intel_vgpu_ioctl_get_region_info
    mbochs_get_region_info -> mbochs_ioctl_get_region_info
    intel_vgpu_get_region_info -> intel_vgpu_ioctl_get_region_info
    vfio_ccw_mdev_get_region_info -> vfio_ccw_mdev_ioctl_get_region_info
    hisi_acc_vfio_get_region -> hisi_acc_vfio_ioctl_get_region
    vfio_fsl_mc_get_region_info -> vfio_fsl_mc_ioctl_get_region_info
 - Consistently free caps.buf in vfio_get_region_info()
v1: https://patch.msgid.link/r/0-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Jason Gunthorpe (22):
  vfio: Provide a get_region_info op
  vfio/hisi: Convert to the get_region_info op
  vfio/virtio: Convert to the get_region_info op
  vfio/nvgrace: Convert to the get_region_info op
  vfio/pci: Fill in the missing get_region_info ops
  vfio/mtty: Provide a get_region_info op
  vfio/mdpy: Provide a get_region_info op
  vfio/mbochs: Provide a get_region_info op
  vfio/platform: Provide a get_region_info op
  vfio/fsl: Provide a get_region_info op
  vfio/cdx: Provide a get_region_info op
  vfio/ccw: Provide a get_region_info op
  vfio/gvt: Provide a get_region_info op
  vfio: Require drivers to implement get_region_info
  vfio: Add get_region_info_caps op
  vfio/mbochs: Convert mbochs to use vfio_info_add_capability()
  vfio/gvt: Convert to get_region_info_caps
  vfio/ccw: Convert to get_region_info_caps
  vfio/pci: Convert all PCI drivers to get_region_info_caps
  vfio/platform: Convert to get_region_info_caps
  vfio: Move the remaining drivers to get_region_info_caps
  vfio: Remove the get_region_info op

 drivers/gpu/drm/i915/gvt/kvmgt.c              | 272 ++++++++----------
 drivers/s390/cio/vfio_ccw_ops.c               |  47 +--
 drivers/vfio/cdx/main.c                       |  29 +-
 drivers/vfio/fsl-mc/vfio_fsl_mc.c             |  43 ++-
 .../vfio/pci/hisilicon/hisi_acc_vfio_pci.c    |  54 ++--
 drivers/vfio/pci/mlx5/main.c                  |   1 +
 drivers/vfio/pci/nvgrace-gpu/main.c           |  53 +---
 drivers/vfio/pci/pds/vfio_dev.c               |   1 +
 drivers/vfio/pci/qat/main.c                   |   1 +
 drivers/vfio/pci/vfio_pci.c                   |   1 +
 drivers/vfio/pci/vfio_pci_core.c              | 110 +++----
 drivers/vfio/pci/virtio/common.h              |   5 +-
 drivers/vfio/pci/virtio/legacy_io.c           |  38 +--
 drivers/vfio/pci/virtio/main.c                |   5 +-
 drivers/vfio/platform/vfio_amba.c             |   1 +
 drivers/vfio/platform/vfio_platform.c         |   1 +
 drivers/vfio/platform/vfio_platform_common.c  |  40 ++-
 drivers/vfio/platform/vfio_platform_private.h |   3 +
 drivers/vfio/vfio_main.c                      |  49 ++++
 include/linux/vfio.h                          |   4 +
 include/linux/vfio_pci_core.h                 |   3 +
 samples/vfio-mdev/mbochs.c                    |  71 ++---
 samples/vfio-mdev/mdpy.c                      |  34 +--
 samples/vfio-mdev/mtty.c                      |  33 +--
 24 files changed, 368 insertions(+), 531 deletions(-)


base-commit: 211ddde0823f1442e4ad052a2f30f050145ccada
-- 
2.43.0

