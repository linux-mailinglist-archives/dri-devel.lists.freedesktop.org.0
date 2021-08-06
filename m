Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E2B83E20EC
	for <lists+dri-devel@lfdr.de>; Fri,  6 Aug 2021 03:21:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF1CC6EB6C;
	Fri,  6 Aug 2021 01:21:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2053.outbound.protection.outlook.com [40.107.92.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 712E36E90A;
 Fri,  6 Aug 2021 01:19:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=D9MeXltwfJWC9kMDrKPRh1/R6AD0dyAr+aA5X4cuVKKRpcB2ez3rfCf7yDesmzRwiClH8j33j1o4bosLK7hwJEyXMbgl60gBM+LHLn3oxUJHrZKxESZscq1rXR7tfCv++wpvFIECH0XXStgCmTyIHLJB0QB8PwrELCAS5B5g7AmK2FAr29qm/SzmKm8SLOm8RZ358h7A9VvsQ8dFTTOV6dhy2YjMm9A0kF3ZFvLr1j5EB1bwZOYKrxeS/sZmejJEq/gLwWS2IDIxxDsEaff5zcr8FTsg8CiZyFe/nNuVnJubHNAgn4V9fempZTvT9UjmKWzxi/1l9KOgCnH7Zd7ntg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AI0XRF8Cv8avivL91HbbxQabsbkHnmTi2xgNxzpks+I=;
 b=Ym+dpnn+FGtnvahpuxnBFJcGKRtfKeFFG/2K2HnbbpUIDS7sRuUWtNkIDvOaXj77+p0KLbnrrA6Cqi4I7H0OqKiVo7Uw6BNSmlkG9zCo8nXyfQUMv1AG8HRqhLFgzJI0v8b9jNZhxf2Md0h2XzUW4qt6Z5MJMHhg/W16tn0VH5vzhQBwwcOAqBGg/GvTp6TMNHZq4qQUlWC2xIBnbSSoQLLzZtD4GiXye9k+GsOeFsOPaxJNyTbFPtJzII395g/AbFJvekZpNie6Iv6O0d0H5hjtDqiicm4r3/ktU7KSIAm1S3wjgM3lXSEIwMvDpHLBhlc7FSlv2Hhtk65W37ipUQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AI0XRF8Cv8avivL91HbbxQabsbkHnmTi2xgNxzpks+I=;
 b=Vse00GsLMwhYmLZXX2ZaSaNRlSm7G6a3gswI8Y77MvaOSwPMoj/tiwunp3oAI4EUHTrZes+osp2xYjN3zMCPvrPzHODJM0JF9qrXWkOlG5jY5C/1HpKF8bCGqcZBlx/7/Tr1Vp8f+gj634K4nmLrZ+ZMP/6SZ0y9hByn9v6EHVzh0cUFWi5b1X+t9pFDjhKbUvBaFSX+od3pnfIMadbAHCrvphoJLmVBrOel451/F2suKsxa/MqtrcU4x2d1CwZZUGSHFypALWNVp7Lw8RNmgkhiJg7sPL+V3Gpf95m7B9Xi7SzEx+BcE2SsO0be1i3NLV3gzmLjrEhyMUCLibWxZg==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5206.namprd12.prod.outlook.com (2603:10b6:208:31c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.21; Fri, 6 Aug
 2021 01:19:15 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::1de1:52a9:cf66:f336%7]) with mapi id 15.20.4394.018; Fri, 6 Aug 2021
 01:19:15 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: David Airlie <airlied@linux.ie>, Tony Krowiak <akrowiak@linux.ibm.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 Cornelia Huck <cohuck@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
 Daniel Vetter <daniel@ffwll.ch>, Diana Craciun <diana.craciun@oss.nxp.com>,
 dri-devel@lists.freedesktop.org, Eric Auger <eric.auger@redhat.com>,
 Eric Farman <farman@linux.ibm.com>,
 Harald Freudenberger <freude@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 intel-gfx@lists.freedesktop.org, intel-gvt-dev@lists.freedesktop.org,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Jason Herne <jjherne@linux.ibm.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-doc@vger.kernel.org,
 linux-s390@vger.kernel.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>, Zhi Wang <zhi.a.wang@intel.com>
Cc: "Raj, Ashok" <ashok.raj@intel.com>, Christoph Hellwig <hch@lst.de>,
 Leon Romanovsky <leonro@nvidia.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 Yishai Hadas <yishaih@nvidia.com>, Zhenyu Wang <zhenyuw@linux.intel.com>
Subject: [PATCH v4 13/14] vfio/gvt: Fix open/close when multiple device FDs
 are open
Date: Thu,  5 Aug 2021 22:19:09 -0300
Message-Id: <13-v4-9ea22c5e6afb+1adf-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v4-9ea22c5e6afb+1adf-vfio_reflck_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR02CA0043.namprd02.prod.outlook.com
 (2603:10b6:207:3d::20) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL0PR02CA0043.namprd02.prod.outlook.com (2603:10b6:207:3d::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.20 via Frontend Transport; Fri, 6 Aug 2021 01:19:13 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1mBoVz-00Dt7f-Fa; Thu, 05 Aug 2021 22:19:11 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 32e8c96e-e4fe-418b-2195-08d958783387
X-MS-TrafficTypeDiagnostic: BL1PR12MB5206:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5206888B0364F6066D58FB85C2F39@BL1PR12MB5206.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:608;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: iDMH1lJXje1Mu/8llBC3BQQLoEE3IoNcbsI8w1wnKuOUps040IOj6ctNSBzfYvDaCUhcuPR4+arFKVshUGI/417o5ZeYdYV0sPGAQQ0CsjBZq5ajd9NCx4iE4JIEfWsarU6s1hokjP9QrTE9/cv1PFPsLc1pMpH+W5mftPBVGPEzWVN3yhpUnNTjGLnI43NFhmuQNvDwpEh1QENaU72oupEmxLrENXlsIH0V0l5LNKrjBX2sd4ZBMIwLzf9s0JbX58DxAqdN2YdEz5H8iN9kgN6sLpcpuVHPazYBNWMML9xRcK3VpgLvSHSdQBsoVWSMFgF7gmbEtSSL5uYXVEIA19zz6jX2AuTAq5sFsq0w6ATmERpdy9LQYoUbmAN7AV0QpDZCp9QgHRDVdd+b3ONOYH+gltdm16ZAn1XPTHrMxgYJY7qrzclWWEm1puHpV/ebyGBm0nAI3IjmaXrHTUSZlUPl/uoy7nPTFcwtYKCXCIISRjZOWFrrNATNP0u0wQB7eO0WKDPl0uAYTBd0QwOW7S9e22jIOggZM1HtcBnMFYHARf3J6KBKXdgae6xhxRgu50zi1gV9pUc4NJbqwNC65Y+ckVmV6wFKFCrajS1v5zznvihXa/OsYd702Kr3AXemI7bTYWkFfXrcPG+HyhpNo38muXZYg06zGygXKBwp6/QZ09tvCiZRC3hxTRDoEK6j
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(9746002)(83380400001)(86362001)(9786002)(8936002)(426003)(2906002)(7416002)(38100700002)(7406005)(66946007)(921005)(8676002)(5660300002)(186003)(2616005)(26005)(36756003)(508600001)(66476007)(316002)(4326008)(66556008)(110136005)(54906003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U2ALbLd8m3nZcbm22xWSmUaO9p8VF6tKLpoILT2jN/Dwbt5sHPMDVtHvV4GQ?=
 =?us-ascii?Q?rJdNTCAAKC8NmbjrH6nYTVze/F8G28g/DkbdRsBlj5TNtnecRv4V6+Qc3nDw?=
 =?us-ascii?Q?MiBmse8vv+y+GXHdIlBoR1Us5XmczcPG8lDbxpwBbCDw30FjM0Lz8kOJx9S4?=
 =?us-ascii?Q?ApYF0iO35xfdT/zvlyDcKCVn+OxnO17qUgajdsiwNV5B1eCWw7HiaUaZpnrR?=
 =?us-ascii?Q?RnI59PhD+MvjuvA5DIAaeA5OtyQNEtRtqcO5a3eGb2waWaoecXc01njesxOB?=
 =?us-ascii?Q?HKFGLswwLHC0n1pFJA4DsQxKquLlLiUfhrnb2OOWdXC9TjnoIajbEV8gb502?=
 =?us-ascii?Q?SEkdKCqtALC94j9q7CuBDQd+8GV6QAvijg8PRfJHWgrLBHpissXQ6vJXCN+0?=
 =?us-ascii?Q?6pf0jSs+emC7622dhV2An/XHBxqY1yBBeVsNRuNNQtC3GeXEbdV9IS8bXcNc?=
 =?us-ascii?Q?g6RZrxPNUxsQxVasJ7kAsdH0p6MH15x3+2Dbel89/53KY7PVJWXKFyrPDH70?=
 =?us-ascii?Q?UMSzNw/a1w6Y/61JdVcsoPwCYiEKA4Csx2/lymm0Dp98EiZ5EUWMfTkLgZC5?=
 =?us-ascii?Q?chHKsmMGatqhTBoJ5Qt0MdlWG9ndc4WAL1uslxSBxv6kYGtAXldoR0BdvXJS?=
 =?us-ascii?Q?pImTAxSYBasqvf6k57LBuZzshb26ctDjsQDGcpY4u4Cguyh15HTvpaMYmkVS?=
 =?us-ascii?Q?vqEwY99tdTb8wqTBN4yb9VteDuk8mLBOJGaToUp1b9jvyyWXEMMzzqCA+eH1?=
 =?us-ascii?Q?i+BG/rv5JnNL+3kCLFsSynHrMiXFg77IBSRmhv28W8CLwwEHBQg6o8XawjyS?=
 =?us-ascii?Q?F2MzpMvP9/uwGWnB8h5lp2fejRnitIIhzE9oeJjEcHGHgZ6ly277IptldS8x?=
 =?us-ascii?Q?ii1iFFqAPl1niiQLWUZdUbD+1L28c2pQxH+y2Z9zpWNPK5zzxAMpEVdzDgnk?=
 =?us-ascii?Q?g3wR2vKIMMWfhetrMLzNIUvs8BjDlokCGHvOjF6SDVrDf1lHEOQdRKX+evoo?=
 =?us-ascii?Q?AM1UuCXA7x17z2lQMJ6XgZn3CpLMCIgZgfOiLl/1w2AGcPJWVnHen6ecz4Hw?=
 =?us-ascii?Q?VPUK6tjTEQvZoD0qgEMSgY3ZZUDUvk4BJVgFbBfFKJTyqGwaTSePp7oDubQ/?=
 =?us-ascii?Q?zLTd2cT6cF5Eu0LaxnIeDfFhCVFeVYT17YcMG/DahLM+FOrS3iDAZXsCj9T8?=
 =?us-ascii?Q?umLmNzxzA6FoJd/fCfprbwOTfz28SGG+n+zDJlfw9SIezrWDinRdUCiKEHsO?=
 =?us-ascii?Q?S5e42ndhtmuf92Tu1bVk8PbWpluPWvzKTX4VxlrrxlnktXhTFkcBbOy5p492?=
 =?us-ascii?Q?YGbznV/8w2vEvmcic9stFwvC?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32e8c96e-e4fe-418b-2195-08d958783387
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2021 01:19:13.5201 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kjY8wmCfsQ22OSHVsEI4jRS0vVXbMMIIdh7ULTFZXwy7Uwhzq+eC4eGItQJEVFIT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5206
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

The user can open multiple device FDs if it likes, however the open
function calls vfio_register_notifier() on device global state. Calling
vfio_register_notifier() twice will trigger a WARN_ON from
notifier_chain_register() and the first close will wrongly delete the
notifier and more.

Since these really want the new open/close_device() semantics just change
the function over.

Reviewed-by: Zhenyu Wang <zhenyuw@linux.intel.com>
Reviewed-by: Cornelia Huck <cohuck@redhat.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/gpu/drm/i915/gvt/kvmgt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/kvmgt.c b/drivers/gpu/drm/i915/gvt/kvmgt.c
index 1ac98f8aba31e6..7efa386449d104 100644
--- a/drivers/gpu/drm/i915/gvt/kvmgt.c
+++ b/drivers/gpu/drm/i915/gvt/kvmgt.c
@@ -885,7 +885,7 @@ static int intel_vgpu_group_notifier(struct notifier_block *nb,
 	return NOTIFY_OK;
 }
 
-static int intel_vgpu_open(struct mdev_device *mdev)
+static int intel_vgpu_open_device(struct mdev_device *mdev)
 {
 	struct intel_vgpu *vgpu = mdev_get_drvdata(mdev);
 	struct kvmgt_vdev *vdev = kvmgt_vdev(vgpu);
@@ -1004,7 +1004,7 @@ static void __intel_vgpu_release(struct intel_vgpu *vgpu)
 	vgpu->handle = 0;
 }
 
-static void intel_vgpu_release(struct mdev_device *mdev)
+static void intel_vgpu_close_device(struct mdev_device *mdev)
 {
 	struct intel_vgpu *vgpu = mdev_get_drvdata(mdev);
 
@@ -1753,8 +1753,8 @@ static struct mdev_parent_ops intel_vgpu_ops = {
 	.create			= intel_vgpu_create,
 	.remove			= intel_vgpu_remove,
 
-	.open			= intel_vgpu_open,
-	.release		= intel_vgpu_release,
+	.open_device		= intel_vgpu_open_device,
+	.close_device		= intel_vgpu_close_device,
 
 	.read			= intel_vgpu_read,
 	.write			= intel_vgpu_write,
-- 
2.32.0

