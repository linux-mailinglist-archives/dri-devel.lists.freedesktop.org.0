Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1726F3466D9
	for <lists+dri-devel@lfdr.de>; Tue, 23 Mar 2021 18:55:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 037836E156;
	Tue, 23 Mar 2021 17:55:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-CO1-obe.outbound.protection.outlook.com
 (mail-eopbgr690086.outbound.protection.outlook.com [40.107.69.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9EE9F6E156;
 Tue, 23 Mar 2021 17:55:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EYQ1mPqLFlrTkVj8ZRY9XQSaTy9N7e7JxCgD2MPoPCf0Tsz2B/s3OdtSq/AxNInyBSIpG8aml8v07phN/QZR6Q1NHvV2bXJcNf7ugL/6vCh5VZBqLFum5G5XqW70bREFVzdiP/WNVvfdjB+E6Uc7FqxJDLufiJQuOlDBsqaXWd5vgT1b2az06WqX6S0qdcSncZ/R8ac7am9piuXBav23mHZ7occqFm49XgKjnu/on9s3gMD+dkPxMNxZcXJm1Qf1gU9pRq7FAbC6uv5yt6FbWdxkXsIzDbs9IqhbLSgV9R0mh+Os7bdbal96futNck88v4bXZ1UJtul3BQonF/qhXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+klokg7Imk3XVXvuh32b4sPj9twC4TOfOsVtA4fhaso=;
 b=AUofxYDWO4KRtepAy1NWAPLdYlWg5StCrGYose5Q/3ccWijtPv2hClSNBPD3GKpTuFsazCEp10pBEVP79Vq0LTArkW7HI2Gcuhp6oUP/xERMcpmDK5RJSpStmcG8DUMhDlswlNKN4h4bWiKJmod/zh+gLt5FCaSMLBuEqArBk5deThN1Z9vMne2qxmdB9Mu1oNJ9arFvylf8fRI9AxK1DeESWn+DippQIvGgA/wkufB2uV21GfGkM9uVZF+NHmAf3Pd8+MXKS1zPVV+BMYLOoexU4L/OrEKg7nEzGVJDxbd87b2NuzliLhJfAU3GAP6M3RWOPh1UTVe+GCIqbBHYOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+klokg7Imk3XVXvuh32b4sPj9twC4TOfOsVtA4fhaso=;
 b=lV8W9sBmwFMKFd9C8km/tf+dd3dkkfmSK/8luNuuR0/qKTjRW/Euzo5yb2rohy3T0TPE8dwdy9/i+eKyo8JL2qEl1M2rmZ1Ej0LYcBt0R1z9Xmpr2vG+uFMVZ9K8puxt5eMHDwxHocGHA+4JcTepnZbiOkfWESXL7WO2op0t790kBv28o9wp4qDJlasmv5r31fx4WQL6CwbD5IIPqjzFVFnnFE7rqL1qtl8+H3o+LPxsYsgLKzwZagb4gs7anJ5Q72EbWfsIrd3tjL14qLP/l9WWlOgqHxxywtq4X+8xME82vx/2HiA8SmiLubk5mqFbCdWfDZq3J6p2Mht7GSdlHw==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB3932.namprd12.prod.outlook.com (2603:10b6:5:1c1::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.23; Tue, 23 Mar
 2021 17:55:38 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.3955.027; Tue, 23 Mar 2021
 17:55:38 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH 15/18] vfio/gvt: Make DRM_I915_GVT depend on VFIO_MDEV
Date: Tue, 23 Mar 2021 14:55:32 -0300
Message-Id: <15-v1-7dedf20b2b75+4f785-vfio2_jgg@nvidia.com>
In-Reply-To: <0-v1-7dedf20b2b75+4f785-vfio2_jgg@nvidia.com>
References: 
X-Originating-IP: [206.223.160.26]
X-ClientProxiedBy: BL0PR0102CA0020.prod.exchangelabs.com
 (2603:10b6:207:18::33) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 BL0PR0102CA0020.prod.exchangelabs.com (2603:10b6:207:18::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3955.18 via Frontend Transport; Tue, 23 Mar 2021 17:55:37 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lOlFf-001chL-PQ; Tue, 23 Mar 2021 14:55:35 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: d10d278a-c7b3-4d5d-234c-08d8ee24dd6b
X-MS-TrafficTypeDiagnostic: DM6PR12MB3932:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB39321E7648C67A5A3C98B49CC2649@DM6PR12MB3932.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2rKx5FVN+RTeEQe4nzIMw8PXPBgw+AN3QGcuhVIfKNmlVNI4aQ7YFY0rWIWGrf/+RgYF4zfPcEoQCCG0kFviOQ5yp5xX/aiyj4SOuvfrSAIJwe1ikSke1/7R/ms5y6vYMTEeyxkS+pDTFJMofsuYc6fJziKrgYnU5Bt9elsGXD/pVoa+ct9Lai6O6JdyeB3m+xzPdlZ8lB/s6YYrxAjyDByXetoXFX7TsXugdr2Q92Cbi/Vn6VR8ie4rX+q0wVd4m4b0Vo8j2vhi72QjXmTQIH0WGSdBahR5+BaVtSCGpajzeF0jjVS70kxAg1SettsyqU+miqeEMPIcEtoCCmzSevl+CrUYOqc/mRdhYy62Tb6NMasdzYDtU1HTP+oqQCmvDO4coYxWSwsB+8e7emK4w/iI7EeYzwrYgD+t/DQAEh+5jNrT9sySW64YMaQCNMj2NZ1moW2A4u2clhwHVWV6sYuqRWZrqZ1fW5qZh0WPoXgAjEQwTwlLzA1O/vfDz8sORMIwH1M6w2kiy/8JoNbUWmDx3mEVLcNXKE61QOue+40vbAPwiAAQvV5a6RlEDYDEU4swWXM1szQQjhr5QRpIwa0JkanICOSGEEKiJtSULCJI5YIzlAfMkwy3due9PRW4LjkC00hl5IIvuTYocS+beUkpObp2a8i7/XNL6xr//xg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(136003)(366004)(39840400004)(396003)(346002)(2616005)(6666004)(9786002)(478600001)(66556008)(86362001)(8936002)(107886003)(66946007)(83380400001)(9746002)(66476007)(26005)(5660300002)(54906003)(8676002)(316002)(2906002)(4326008)(186003)(38100700001)(426003)(7416002)(36756003)(110136005);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?eZuh0pQbnzBiSLyr+WeZBrMTGS2/4W7M2XHFlF/mjxVj3R7FONI+wAwcvlrv?=
 =?us-ascii?Q?WU7lsXTX40w3Hitn0EY1ikvNv7AjciLNwuzJfR1caZxYEWxh8aJRY4jCJzcG?=
 =?us-ascii?Q?KgSXwGpAkGggF1eHKIrnbc6r0wMmkhJWPh1iU2IGMb2YeobVr0m8r+qEekPS?=
 =?us-ascii?Q?NwidbSVlFGFNiLV1xgIOk6k647lyBkT+DqVs6jW78oclS3g0IsPgrSRz7pQE?=
 =?us-ascii?Q?Uh4LrVP3QfDNPW2pfqZrkYpQOaZgiopcilSX9hVUkDjey660DOiJm8U2js0e?=
 =?us-ascii?Q?3mDEDzXgEtrmQ2N74VT03zwF6Gfwp1u/pwLuBCol8x9Ht/UelGN/CwHd+9EI?=
 =?us-ascii?Q?Rq3xIYCl6Yqyf+Nr4kdxBsfYfZvHC1VC7+HwAwVxrQG9gxMIyzAr2vIJaiSx?=
 =?us-ascii?Q?4+dEpXqvjTe2gMhGhtY3SxuOnM9C5bUJv2axCGfAGg5+vK/bXdiwv8TS4ROA?=
 =?us-ascii?Q?ZvKHWp3ZP5XtOl0npy0yoqQKZUux86BcKuQhodNo9+RSFY9BC34upEm/WU67?=
 =?us-ascii?Q?KXPTOXWN9TfdEKktt7UVH0NYgfaQJ/SY7k329gEaaMT99RpncWIbSH3w++LH?=
 =?us-ascii?Q?gAW/vDRivNIvYFj8dC6sj7bGWTIC6aKDD6VqPRMPrHml0+eZzZ/7K7o67f24?=
 =?us-ascii?Q?OjD1Lk58QSYiguzA73ddzpzLNkEUQvqWguEEomNllUUVQgvpTz6XUA/FRhJZ?=
 =?us-ascii?Q?fxTPfuWkAJpSzywSNLYwWDARA+w5QOAoKM2sLseCInjs6mJw3IyctIKP6rTC?=
 =?us-ascii?Q?3WPA2Le5Jt9KhW/s3QHKXuAM7hlbeDVCAEMALwblJ6vEiaknj5PDQpKZsfpQ?=
 =?us-ascii?Q?KXktBORpNctvm8RvSeMygMcdSp2XjKAunQQ3Tm0spbIDHe87Jiw+bQ1XeEKG?=
 =?us-ascii?Q?+qeyWBeYZ8yesOax7a8sLp2g8wZB7kx9NyIZPL+4oQdo4awQKYDDLWe6E4oB?=
 =?us-ascii?Q?gJjGzxiOHwvLxtAxLwygZ6ofr+fHFYTwn9PnZeLoMcOdJFrW7YN0Sudm25FN?=
 =?us-ascii?Q?b0rC32Zzd7y5hGUgvIZhsfe9EK/3Yq092nPUnJCET3q3IlrkWNsVG6HeXZuZ?=
 =?us-ascii?Q?ZjKyd84CbVP6IeEV6jhuM9sfcajwmFjnt4vDYPin4OhHAhapPeQFlBgRqxci?=
 =?us-ascii?Q?wzy68G5aYlD6BFX2V2uXH39HAUUPLYJBRMHTBJ3p32GI4Rp/TBEc1i08TVmF?=
 =?us-ascii?Q?mUhf/TrshWbw+8g9ywwiGZPTSV6J/HqhRHIaGKF8bXWqa88oTAGMb1ZFQrD+?=
 =?us-ascii?Q?6Y0U/GAZAk28a6bdDmifkirDBgZtpPRTAhhAYuhfn6AG0iDfluJiaesNAIW+?=
 =?us-ascii?Q?4zJY400+IitO3DwA8DNyqjXQ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d10d278a-c7b3-4d5d-234c-08d8ee24dd6b
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Mar 2021 17:55:37.5823 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xyMuXhwaeclOHzJqbIyRnyP1r4k5w1NH2+cvIrmxIicXSp7s8Nrux0sX+npp/F1X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3932
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
Cc: Max Gurtovoy <mgurtovoy@nvidia.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 Tarun Gupta <targupta@nvidia.com>, Dan Williams <dan.j.williams@intel.com>,
 Leon Romanovsky <leonro@nvidia.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

At some point there may have been some reason for this weird split in this
driver, but today only the VFIO side is actually implemented.

However, it got messed up at some point and mdev code was put in gvt.c and
is pretending to be "generic" by masquerading as some generic attribute list:

   static MDEV_TYPE_ATTR_RO(description);

But MDEV_TYPE attributes are only usable with mdev_device, nothing else.

Ideally all of this would be moved to kvmgt.c, but it is entangled with
the rest of the "generic" code in an odd way. Thus put in a kconfig
dependency so we don't get randconfig failures when the next patch creates
a link time dependency related to the use of MDEV_TYPE.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/gpu/drm/i915/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/i915/Kconfig b/drivers/gpu/drm/i915/Kconfig
index 1e1cb245fca778..483e9ff8ca1d23 100644
--- a/drivers/gpu/drm/i915/Kconfig
+++ b/drivers/gpu/drm/i915/Kconfig
@@ -101,6 +101,7 @@ config DRM_I915_GVT
 	bool "Enable Intel GVT-g graphics virtualization host support"
 	depends on DRM_I915
 	depends on 64BIT
+	depends on VFIO_MDEV
 	default n
 	help
 	  Choose this option if you want to enable Intel GVT-g graphics
-- 
2.31.0

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
