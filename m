Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4463C9518
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 02:21:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AB156E528;
	Thu, 15 Jul 2021 00:20:54 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2041.outbound.protection.outlook.com [40.107.236.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E92616E509;
 Thu, 15 Jul 2021 00:20:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fVxKnbPS7xp82y+m3M0uOQLyfXFAzjsfvhLTQoqyGnnOTycQIat6YM/ORbRSjYWCXgqFxaOFRQmdz6QQrRNz3xtcBhqE/0MKzp4XxQ/rqnaPBlsVfUWB49jXCysUAj6lWlUIKExQACIFFnO/dG08BzUPzY8L1cddi4sEqlQFFtelUZyn9y2EV0xdSwdSiIFb9usNd+7WG3n8qmGwgqUCiT6KphE/Z8Gb5Ue2WRPpkusKhisG5sIC+liHrpRh6PneslMPpIqITj2Qe2BHvDXQ4dpGiuMiE3H1ctNyMqlIq39dtMvXvR5Otn2v2gnqFg/zhhz3bVNUB/N7RsdmugBgag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pj5tHqtZZfmXNCPWoIxbB0j4cm9g6t/Q3wEIFPP1DuU=;
 b=ndO1C5ESw9nnK3HuKXHXlr7fh4ccK5LFUaP88w7rp2oHjDDOIwmdTaCCLi0iDjl3o+zOs4qLuFA0nifOSoWku78G8N+RUPc0TrbTPK+J50IVQGjeOPGlbiib5+kZUWAmZVNGEqrJmdKey8tLl9jpfMJ4QisLAv3WirTfaWxRBIx4cQYWO6aOwEc+dYV7/DjCKDUdd6cp3Da4V7F82ZLzqoSlfngKd+YHUVwDe9IrfRFGD0QMGV4PsQsmfGmDReBpk1Ju1iLTvFZPR/0LVoYtAPC4zcUmpoZuVtdnj6gQeqaOv+i6fI5578TdFsqfBN3qYrg6Qifi4e+My6NQfTVoMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pj5tHqtZZfmXNCPWoIxbB0j4cm9g6t/Q3wEIFPP1DuU=;
 b=mIvT5HNo3yPKHuiwycjoVCmTOMLPf/3U6r/6lgXd4ySnYRQfnbNEHjU+h3uHL4yGZztVF6LXoIlvmb5jYpnrUMnSmNTRc1z3X73V7xnpIWLoQ51rOBArKXo5z3ruMEsJAtqS/mNa6qSxpDqa/lSqpO432KOGKgli3oPHs2x9X1xpMBLzQlC74Ag02OjkYQ06hRd5jygItzplxkycUFCNeIVRSQ1ahW+bhqz+TatF6y70eLfeQpn8vXKdmyNMJHA4OSNYT/qQXIqnQUz2j9S6LePAB6EE4yUDa+nDdPkC+B+PFI0mfnudTC40f1t/6dL9QrN+UNhdNydQ73qaoBD9Uw==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL0PR12MB5555.namprd12.prod.outlook.com (2603:10b6:208:1c2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.26; Thu, 15 Jul
 2021 00:20:50 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%5]) with mapi id 15.20.4331.021; Thu, 15 Jul 2021
 00:20:50 +0000
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
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Zhenyu Wang <zhenyuw@linux.intel.com>, Zhi Wang <zhi.a.wang@intel.com>
Subject: [PATCH 12/13] vfio/gvt: Fix open/close when multiple device FDs are
 open
Date: Wed, 14 Jul 2021 21:20:41 -0300
Message-Id: <12-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR04CA0090.namprd04.prod.outlook.com
 (2603:10b6:610:74::35) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 CH0PR04CA0090.namprd04.prod.outlook.com (2603:10b6:610:74::35) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 00:20:45 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m3p7L-002Uxq-2X; Wed, 14 Jul 2021 21:20:43 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8bfd7d8-83d0-44ae-f9fe-08d9472663bb
X-MS-TrafficTypeDiagnostic: BL0PR12MB5555:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB55552D6F947DC7281CFE4656C2129@BL0PR12MB5555.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:608;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mq6qyZ86c8jKMfF0rx5PJoMEqF7xQFR5WpHWuiguLrCspPB72MYS15io8lumYMaAPh4L4V2bxQflzPKVaiEyqyrSUNyUnWbYwdih0St04F5SALCyssYFsbsYBBGCtrWTeSGwvv6s6zUiNRZVHDzijh7Y6ak5bq3zrS6eUIAxMMWKSM3VOVm43KSASFvMjAhNYUdprVRppK9Kb8Y3ILWmrDZ28nw2JWZAToyh9OQzlZIEAfKjgw4OISGn4GXjfYBxc+dD1LLIIoH0T3Svo7ccvRZyRxei/7nIdOU4OYv/AE0dOsp0kzd2RzukHQ3j4XKrzedZOuwIXlcZwbCySmWOQn20AMV4tHHuoPQkvTPuYM4iZXg6BVWoTwTaeKVVD2+EhoyeFIj4TVuFBQHNfMMjaoX/iiFAHBb7XZS+IWns226+x0+TKxssNrK6kOk3gDCjIG0mJe9EbZiJ6OG6uq0o9R4Xs9iWa/1WnJvUAMc+AiNp7BOITHRsUrsJtlbF2vE/AfRZ1m54AUk8DBWuddvlqb9LLFhllh8ywDjLKw4tGFfwAqBGxSszbN697vy/uZ0FG1W1kqruZK2n2CuT4sS/tjV4ZJYHMg1wwuJIohVpK+6/u1ewNTyycxMwmYT9rAzonV5HK0DL2x77m/TfQhM8QTGsNSo5tXJniSlDWnpSmM34QkNyq5mVtpgA6fubhBvL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(346002)(376002)(396003)(366004)(83380400001)(2616005)(426003)(316002)(107886003)(2906002)(478600001)(4326008)(7416002)(7406005)(38100700002)(36756003)(5660300002)(66556008)(66476007)(66946007)(921005)(9746002)(26005)(8936002)(110136005)(54906003)(8676002)(9786002)(86362001)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mzXUpv6JrI+Z0zYw4lRZYv5so0SZcdPnHDXDK1B0aAFDoTKtyxd4U0kUuqL/?=
 =?us-ascii?Q?E195nRx+Kw6yPww8GwCYUHESZrKBPy21XE8RVkO/aciMm7/OnihORPzhxB2B?=
 =?us-ascii?Q?/zlmdrCihy+Ainabj8D8/p9KT9wsfsqXFYkF+if9OLxgr84okSri2VRdnqYs?=
 =?us-ascii?Q?NSAhdXDM5sWRYF2FUwGo3gNRHDBZsSrGu6cP7C0i6p89du3V4bY61IP8pR4t?=
 =?us-ascii?Q?he3U1YJGlmppbFfzCNUf10iiT5c6bCohmz0UM4Jlxwcr5/WVfEKqMcmHdbEB?=
 =?us-ascii?Q?UaLJE0xM2eVjfnrZG4I+/0IcqM5X43SyzPrxldiQt7DiCydA7RXaB5A/AtEd?=
 =?us-ascii?Q?qvFu+X47/PtfHjvlGNy3BzCBobJevYiU7t5s1Qeeav3sF3SEekPFqFX+l3Mx?=
 =?us-ascii?Q?qXY9EsxeEtWjm+h8JBgfV+XZ6kUbSrmb/sxGjVxwaNWod3QEJhbi9x82DxjA?=
 =?us-ascii?Q?8ZePNxcJE8u8EVEyHsLQ3xndt/EgvZFgm5akF2Tm4ekc7PD49ZVVqaPJn2xf?=
 =?us-ascii?Q?H47D5j1r2YRyPS2U87HVf1m4MG9hBsA00YEhcyFSC0fXJqABdO+2WOBWpn52?=
 =?us-ascii?Q?+Qqop4kDpezA/+dMkL7Bgyvh+FoEi4wa1Ew69QAgZcZq+GoFTZgHSeESyqkU?=
 =?us-ascii?Q?kRZe/qK6SEWGIzPD3KlYeXUHLgOxG2JiCB+os0uA3F3el/QgDQBBB57vZpvS?=
 =?us-ascii?Q?kemLorCLMPxsZIZvILqkRFGRAarDq+sHU6qoogDlaStTTcTLeXgqeb7Wq8NG?=
 =?us-ascii?Q?mF6n3TI3dVLz/eFhmica6T58LT4ynr698X7OCWNlXcuF8iCgBrZzidnu20t/?=
 =?us-ascii?Q?5zRu7CQJue9ep5FAvRey/HJHzinmlsDE+fgzmu6ap6xn/OebOpvM8mPRk/5x?=
 =?us-ascii?Q?pkfr2hMLKcAa5LtSadWgM9KueKsDN8/ewTPBNC7sBPqKwEfgqKGB0/jGHsJI?=
 =?us-ascii?Q?f8uhCYZl7lceECHh2RkaR6FR5WucGewW1tLZ37ybcUzvVXrthVdwzvHdg7AI?=
 =?us-ascii?Q?2JrwRpeO3i0YKD7NLERyB+NpKOBScmGWUjUYR6/PaiYAS3giYxsMDDN8VDXw?=
 =?us-ascii?Q?fzpiF4lCrkFej/25rBtbcr+C+r73b5/Kt3yn4lr7IG1JJcD8HfcdMk+QY4f/?=
 =?us-ascii?Q?0BgBB14SzUtCjoWc2vonPnk+m9vPZ/YiqlgNLCcipn2DKq7tFLfMYGnwDHI3?=
 =?us-ascii?Q?68732Y25cPJB3Z4WehIw0hzIaKDqbvhQyyxE64YaDv244dMU5YFs6srj753k?=
 =?us-ascii?Q?j4UeAcs1DPzwyqrjXdLmvyhpgtzAWlJJ3Ylx06aAOKIIi6Qp2zLEFPEeoCvM?=
 =?us-ascii?Q?JZ3lLUQd/EhjW4F5Onw9hWoa?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8bfd7d8-83d0-44ae-f9fe-08d9472663bb
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 00:20:45.8543 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CZRAfDgxwaXinE0ioUuNzWuTFmTaXmf5uXXwv31rtBSDuEN/jvU5gdqcK1HyPNxM
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB5555
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
Cc: Max Gurtovoy <mgurtovoy@nvidia.com>, Yishai Hadas <yishaih@nvidia.com>,
 Leon Romanovsky <leonro@nvidia.com>, "Raj, Ashok" <ashok.raj@intel.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The user can open multiple device FDs if it likes, however the open
function calls vfio_register_notifier() on device global state. Calling
vfio_register_notifier() twice will trigger a WARN_ON from
notifier_chain_register() and the first close will wrongly delete the
notifier and more.

Since these really want the new open/close_device() semantics just change
the function over.

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

