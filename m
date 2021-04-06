Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 47A98355C5D
	for <lists+dri-devel@lfdr.de>; Tue,  6 Apr 2021 21:40:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97B586E8A2;
	Tue,  6 Apr 2021 19:40:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2075.outbound.protection.outlook.com [40.107.92.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8308A6E8A4;
 Tue,  6 Apr 2021 19:40:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iqDsaY0vBKudrCQc08+bzrZWjBMke6NRg3P7xzAVqMRblb1Yl8TG8OVIZruGqXkrkGXSI1elzeJy8R3Dd0QlSpmPHxZHcDzOH9xFHIYsDBYHNHmLkav8ZKvSGFRmf4ERVpUpg7bbpyAJHv8Y44fltEevAtKzhi8YteYvyZVF45euDQId+Sub7a4bJfbmrCXdS/f0DqFaxsQFQ+wozRTOohA+oUXuvigf2/j9QT4ZQgKetuiMe0ys5UXXPqTa0DGSgysmkKZB43oylPMi5cCHcKKN0paXSaaMTD6l885noeIYO7wsUQSjB1eqkfIrx9lTPoe0MIftChih5t1nJlKEQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qEJ2XEneEfvcX3+MPP5Hc/BeZz23h3q1AYfQ0BQVTkg=;
 b=bk/E6SI25OG06Ucdua/ZJQXQHg7smnCjCR1lnYtpSZoM/LYiZSDh6S6IjoGAczSJsXWldYtEry++2G7XD9P3FgB1Eo/x1WfHl71WXZYYfhKhogM8DVR7B/n72TKhKp3bt0OdIHqjvfDVmLy2YvoxpaLwFjWod0rxYrcbJV2iYnhbkY6v08t6qZN0E/W6btpT2q7LNwJxKEgIsHeUOdvHlS+rWRDse8zj/OK4NZVG5UhwdFHZ5VfD/xuAntMSPB/XPv3SswBaSLBrtHvEn5YL1i/2asBJTQI5u2dkFgVynKz4VDslZPCWlUh6QVH2xewFGSDHrXxZaor27jSegPuCug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qEJ2XEneEfvcX3+MPP5Hc/BeZz23h3q1AYfQ0BQVTkg=;
 b=FdTYNnS3yXanQCYQeHQx1lWuXFhzzJp71zKy0UR2HOZG4qPzqSPA2Y0fHyjAFgc55ERzvMuKt1KUr9WDogpY+KmOn6Yk/zzcstdWZ2PEyP2EXF6SXornhRarTH4Tp5j9Y9eNvbeoKdPDarPwORafLtesp7fvXT8GL9KOyDCeDWLoKTixD22SiOKLcSXkYKfZApHcz7Yl3fSEfWyasCYj1a40oQDZ49SHBK/ORVfY5nG+OVnXvSolsWhJt1tjCduJ0nD7DYlkBOVAsLQiKMT2GT3A3QZTF7N3gO0GU88bVGnrMGvMF9VBzThS08KMiHqYp/nyu7jSua9TLvhKm1cdcg==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from DM6PR12MB3834.namprd12.prod.outlook.com (2603:10b6:5:14a::12)
 by DM6PR12MB2859.namprd12.prod.outlook.com (2603:10b6:5:15d::29) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3999.27; Tue, 6 Apr
 2021 19:40:45 +0000
Received: from DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87]) by DM6PR12MB3834.namprd12.prod.outlook.com
 ([fe80::1c62:7fa3:617b:ab87%6]) with mapi id 15.20.3999.032; Tue, 6 Apr 2021
 19:40:45 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: [PATCH v2 15/18] vfio/gvt: Make DRM_I915_GVT depend on VFIO_MDEV
Date: Tue,  6 Apr 2021 16:40:38 -0300
Message-Id: <15-v2-d36939638fc6+d54-vfio2_jgg@nvidia.com>
In-Reply-To: <0-v2-d36939638fc6+d54-vfio2_jgg@nvidia.com>
References: 
X-Originating-IP: [142.162.115.133]
X-ClientProxiedBy: BLAP220CA0005.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:32c::10) To DM6PR12MB3834.namprd12.prod.outlook.com
 (2603:10b6:5:14a::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.115.133) by
 BLAP220CA0005.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:32c::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4020.16 via Frontend Transport; Tue, 6 Apr 2021 19:40:43 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1lTrZ4-001mXm-DA; Tue, 06 Apr 2021 16:40:42 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 155698ca-fb66-4d42-344b-08d8f933de0d
X-MS-TrafficTypeDiagnostic: DM6PR12MB2859:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DM6PR12MB28592C2B4B47561C7D35521AC2769@DM6PR12MB2859.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:10000;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: GtAuAjW7NOecAOytIYv6ONaotyJ8FuRtfLohiQrFV7wQ4l7WLTEXWzWd7kAZ90jytPdUtV8//FFSsvkFfEHwGUKZmsaVfikraxzTiJ7Si0tYcxNy99t03wJkwQ/vM4kQ7TK+O/XuOo4iC/SIrVyuTzMdczkYptXnr/mCqmXup2Xusgts6AUVIfym0sfA5PYVJqM8D3AnvIL4YJmIOYbaulnNwjEd787oyaCIybo2D1UQupbRWuaJpKRjUxO0Lns0S9392bS69HvIAPkTbUuOY+8PijB5ivedrSOqVWpDhTBcQ6dUPIzQ+BA/UC34FwW6gxB2YKnpGgw00ff1mBrDCWDEZ88auWovI7G5gK7B/epEbG9vrvtaGbkXG1bVlaAa2ht7G8BpDlMJ3ssfu7d0gtVwEjmaxvAM9y/3aOYwsHhSEeY2LvJMlYAnZWXkwtziRR+fhKDtZJH9jFE73jqLV5K0Nj2iaoINtHpwAbqkRCaeh6SlQ0eBswluY7hy93ET31dXXyisGBnG1oPEVgEtpxf2J3VGVUUTZHXBE+sc3oEMhaMGdht4djwwLyuyO7LShuaDDXGpgb56/PRhA/hAR3ENV5NJsh93/SpqugEqMi2zKHg5+NoApeMXeFDCZ0zOsdcxsxNKikt4AkkLx+ts579oGtKwpjVpk9ogMTQKK6o=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3834.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(376002)(346002)(366004)(136003)(396003)(54906003)(86362001)(2616005)(26005)(8936002)(38100700001)(66476007)(426003)(7416002)(66946007)(5660300002)(316002)(36756003)(66556008)(2906002)(6666004)(107886003)(83380400001)(186003)(478600001)(110136005)(4326008)(8676002)(9746002)(9786002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?zuGF5mpZLnbQR8TdOl8FvYu9sXjecrpFXUwENKJeTDiRPEr40ra8s97FQkUn?=
 =?us-ascii?Q?bWXK/pN22nUT1+FT97QPp9Xo+6U7t3ZUCeweHqk5qXGQsk+9fElWBQ6Z8wcr?=
 =?us-ascii?Q?yBdGpH+YO80vkRfkXeUE0GY8EerZYIzvTmoPtoZJopy9IQ/YkUpSF34Kl+Iq?=
 =?us-ascii?Q?DbkHRQRKgcniVmbYHiL8DcJ6/UrLXkiQhagHSneth/3gM+twysQHs2fv43GX?=
 =?us-ascii?Q?G5f12aRjsZedQm/1Tp7DL4r0DDnSbtLSECug+wtqegacWbCgnsB1hPE5KxNL?=
 =?us-ascii?Q?OmZnY8Be2FnUDW3LXn1go4BWoMvEGp9RZ/kyBd4QnTFY0eE+JE99opqOZT0/?=
 =?us-ascii?Q?fefYExp+NW5NMsNZjSYpo5nQr6DWEb5HCuxwE7YIgn4Cze8pHLKE7BaUAs23?=
 =?us-ascii?Q?fB0OmDQCOt9aimRdPUPsbF0a9nsjaqEhQ+XxFWRmSbg4IquqJyiZArhH68TP?=
 =?us-ascii?Q?LEwl4rZGU7omxbrXr1wVCOJRYUumMRx+3TLytJYmMZI/H6wMVHEHdTMeu+Nl?=
 =?us-ascii?Q?PUMjn4AwSYvdj2RFutLhEJwiyKc26wJ8OpXkvdsqDEqzmjwBS/OM0JeG8dTa?=
 =?us-ascii?Q?GjTavf9LH8tJel27VD1l/LRyAcT+0fbZanJKvsirDNxqBETcdJsHNSmfOQmP?=
 =?us-ascii?Q?7a8WlppcROx+sYaWHpOV5Bde5qLJTDYzU/mAgfUPEyPXBEQbEs8JcYw+SCqg?=
 =?us-ascii?Q?xXf0NliuFFNwzMOGui51JgP6XfGnQSB9l0A+c6wNL+3bTbPlZI+MJtgVgRSY?=
 =?us-ascii?Q?ZsEpTmfG/0+UnDD524IgTWcjC/9xjQ47sqmXnE567thDf1NI88tX1uDfqrQO?=
 =?us-ascii?Q?S/alfMNLYoDMO9ZvlCpgGxgtOeY2gTcoQRZX+kqM6AJZ74MLf170zqgI38V6?=
 =?us-ascii?Q?ZPYVNMMGXsdqypLqHe7HRPsB+VADy1chxwaLewO6t5lHjPVZQf9IvO2rh5BN?=
 =?us-ascii?Q?dD6ahd63sv+vylCEw1JE7pSVGzylsZUJyezJhiL0saJSy7b3/t2AcKJlZWjm?=
 =?us-ascii?Q?A0IsKu/d4MTqHt0YXxM73iXACJ2N+piLULz5Uu7+P7yPS/m+2bhVh1p1wyot?=
 =?us-ascii?Q?+8x6HuSDKFp1NQsWZG/rtQPcW46j1LjO+DxPt27H4wyH8h2+R+rqKRf7eUCe?=
 =?us-ascii?Q?UTxKbPce4x7LBHjRPbVGh9vjPHsWFeh+QDQ4BvirULpRow3HXM5uQ+nVN2CU?=
 =?us-ascii?Q?Zo/XemvifTwD6NYqOqlhFdG+OFd7e0OFjahGEA2+VYxHv7KCdkqDG6f4fA01?=
 =?us-ascii?Q?YcLzkFVWb0H49d4RLLtMDYLenV8ZKIFeojsGTmnO8Mr9JaDf5sHzTXNiDcsY?=
 =?us-ascii?Q?+BcUlaSboevAT5QHjJgwRmn8bcQcFX6AJ6x1PjRGvbAaig=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 155698ca-fb66-4d42-344b-08d8f933de0d
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3834.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Apr 2021 19:40:43.9419 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0sE0pHd9nZHTKZ27fDeL8gjRPj1Lguzedet/icAKUsLVEvBoCl9N6sRltRmU1Bp4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB2859
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
Cc: Max Gurtovoy <mgurtovoy@nvidia.com>, Kevin Tian <kevin.tian@intel.com>,
 "Raj, Ashok" <ashok.raj@intel.com>, Tarun Gupta <targupta@nvidia.com>,
 Dan Williams <dan.j.williams@intel.com>, Leon Romanovsky <leonro@nvidia.com>,
 Christoph Hellwig <hch@lst.de>
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

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
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
2.31.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
