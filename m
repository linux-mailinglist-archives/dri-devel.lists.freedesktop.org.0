Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F39D33D9A7B
	for <lists+dri-devel@lfdr.de>; Thu, 29 Jul 2021 02:50:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6AB96EBB5;
	Thu, 29 Jul 2021 00:49:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2088.outbound.protection.outlook.com [40.107.237.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD0036E05A;
 Thu, 29 Jul 2021 00:49:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZLZSPOfXy3e9euEYni264fo2gw4nKSAA1Btl+37nSWnab/R7JyCP2e+zkYaPK2ZwpQAo29u1YKA2uWM1agYD0OkyK6LyykTVQYw1CY4J3qf+LpP9X19GDkZGXAHu5egBLJTrhGiSYC9y0QCrLboEWsc/DoPw8DtWWeKyR4UrRukIPm/beswg/lQ3HwXPLAyZhPu5MczrQU3Kbha/0K6SST6nieEpYTgTaykAumReqaMQ++Gl+5mGmy3vQyouPn9pgnTgT75mfp9OdBk/vBd2nwieBZ96M441FGznqaKj8xYTSY6y84D3svOLcsx0IaXf+eUIuSNY0xVXXvKtgZ+XdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AI0XRF8Cv8avivL91HbbxQabsbkHnmTi2xgNxzpks+I=;
 b=K7QEHogZv6RxrLL2A2rp01F3VcvRzLE1CFoFxLRJwhR8OBA+KRx9SJvPTz0ISfGDKziVEa4Vxa/Ms4XxpZReh5NOghuRVJDw+7ucdE417onHOhVgLyF6rTzz8wYcnWpQbHXepADUTdRXHlbZqTE2JyaROR5EsQiuoIikK6blDyxxNGUEIqWCpRIlJ8/cwxCkWeCkQzgL4er8LVxF+fjN/RQRa8N1xnB6TaDL7tqNMD22C3phRSpCJjbLhN9rBPD/6yk3kIlnIo6gqqd6VgHeDsz8/cq0OQhYatb6SyKog/e3M3AIfuK1XcVnADvsnl6M7zuvp/+yOwhwKAsT+TqNGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AI0XRF8Cv8avivL91HbbxQabsbkHnmTi2xgNxzpks+I=;
 b=Ph/r5Ok20CfveIwBZn/KAVqO1y03ULTySTJObgbLwIVzz/6YZMiG7nYctbtnfvATIOU+LDNKbomeoNae+G7Xz8M3wZs3WTlA1YYKBblP9p5HBgCP+nxdx8vxWNLIeXwdZ8wJONlDH3hUi2I8Yc7XBjRLylJdKn74Sl8XWtT982ogyUgdFWBCxmunA3oFhUURXkSq8+aZpx2EfIy/mf/A4ijyi+99ov8UMWxj50P7npeHoEqi/Ee6T7EgzJx9YFklytzHajSpgOA9Fur6m0YIqAzmmuVJkatZyBXppHB1LQDLP8ivqtzz5caLPMN/zbrwjFJy/l+B0SiYSROIihHbBw==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5160.namprd12.prod.outlook.com (2603:10b6:208:311::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4373.20; Thu, 29 Jul
 2021 00:49:30 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%5]) with mapi id 15.20.4373.019; Thu, 29 Jul 2021
 00:49:30 +0000
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
Subject: [PATCH v3 13/14] vfio/gvt: Fix open/close when multiple device FDs
 are open
Date: Wed, 28 Jul 2021 21:49:22 -0300
Message-Id: <13-v3-6c9e19cc7d44+15613-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v3-6c9e19cc7d44+15613-vfio_reflck_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: YTBPR01CA0009.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:14::22) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 YTBPR01CA0009.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:14::22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4373.17 via Frontend Transport; Thu, 29 Jul 2021 00:49:27 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m8uEm-009pnS-9n; Wed, 28 Jul 2021 21:49:24 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 04aa47a6-e6ea-4ac5-bcf1-08d9522ab813
X-MS-TrafficTypeDiagnostic: BL1PR12MB5160:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5160D58EE85A2CF06636E30BC2EB9@BL1PR12MB5160.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:608;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ummYtC6ipRe8JlezFNAweQDU/xHhg48fjZpv3CBrSDHvrlgEx7VIw6cMfQD0XdvnUaNq0iL4PNfTC9L5wyu8Gl7HwcdhmJzkNcyBsI9kIHfEzN+EI5kL2Nqfr27GwWUZENinemwgrwqiwfxo379AE+u03AbCA/Bn4YlFqmxt23Gw7uSzMUr4WsEfTVvaJh3X9maMJzmE2ra3b1XQO2x5EFhgatbSS7WUH4eA2i5Zc/sIPbFBpAGGVRfeOOcwbXYoftc9PdMg2QaFGMZ31qQhNQ7F2l3pr5TwKeYKrlpe4miLz2rrYE6REkFEuwCz4K7z7Jmd7p4EznF7m674hb2ipH6/qVZSj6HzSquQV3K82H4Ner86wpiCJ8WFaJXDhg4Q53YOvJ841F0+nLRp6ILeaszGzdj35BwfAYJCjLn9pHf6JZYVKOVIl7+qEeSLc1fMwLaBcr0Nxp+8EjM73J3OTxzTw/3GeNUiQ5Dcvla4PlK8pWvUazKLDTKWByMlVT6uHRVADwUb4jyEL/Z2VcKPdyT5aQ0l0pjIofwt7sCzPRUg2W44T+bnLu3ue7rr+F5pKxoQYijIxlH35ysNeGMMHcKuLxukaZuQhpwPnvHtRg0q5lmAkbMbY8VkHCzvxXoR7n/oFcgJamAZagywN8NVg7jkA16arJl7PrLiV5giNL81aUxEOYO7ITzEUbHkOMC9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(396003)(376002)(366004)(39860400002)(346002)(8936002)(86362001)(2906002)(426003)(921005)(8676002)(2616005)(5660300002)(316002)(186003)(7406005)(7416002)(54906003)(110136005)(26005)(66946007)(66556008)(66476007)(36756003)(9786002)(9746002)(4326008)(83380400001)(478600001)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bNRYMqCQUqnaccg9y7B4gWKGPCCfnF3mIhkCqtlZDFnfxtOJr7PTrXX0i/76?=
 =?us-ascii?Q?UJUjDXnO7WtXnJI0nIzQcYu/cggdiV5IklLfQYJqJUMYdfarmnYt+Vrudy2A?=
 =?us-ascii?Q?s/pUyzCSrPAQgZGT2Bx3OyjzNLXtd1i9DLND6l48iSSddZM5EwCY6jPHPj/R?=
 =?us-ascii?Q?OfSWrlT0eanLpBscV4YrFFlsVfFug5fB0xgLyWouzFzIAWMXFq+/oNh/Qm62?=
 =?us-ascii?Q?VXsgmNwwk+JCL18pqlURi2kMToIoqEWWfjvmQVZf70m1OqLezM2WszquUabC?=
 =?us-ascii?Q?hY+N7rVwPPa2F4FrgRBdS3oRqnOJfeLM71g88uYe4oWlFLv7XAzRX445JCu0?=
 =?us-ascii?Q?EJBSBACEuK66savKNZ6EEIyTd20UBC7L0gElHqhJauMnTUokxdhZ8CGgGQMu?=
 =?us-ascii?Q?GLVJHHpe3/JJgP6TWJjRh/P/QIalIGKMj9zp4TwfaiZppzWf/m3rYqo8SDvS?=
 =?us-ascii?Q?Rj9mjSONTlnQ+Gw08KO6lEgKiLyQNF6gsYgpESg4XKE2596hS4cSUJbUAqSv?=
 =?us-ascii?Q?D5+qd+OWq3+WhCOCjg/2cksxlBWwX0Q/hagkNeTME1qdUFp1r7GULzjpwel0?=
 =?us-ascii?Q?jSZZV7JvyAyYH0+8bJvlmbDbw025eJGh+Gfj00i5TFO+G76gcH21wwuqjzzg?=
 =?us-ascii?Q?805HgyWjBzDsuT7asU+LwamX7JBP//4CbodTyBDxXjA+CN14uSVi1v1j2+fg?=
 =?us-ascii?Q?1CDMdDPxegaEuPoDUPvjFz/5H81Mfn+ChcIodC82sa5B4fWb765pdTlxR8VX?=
 =?us-ascii?Q?jy6qlr78z2905PX3s1kdm8rfi+VO2W26CAKkagzU2Y9iu0Pgq3Mc+RnLcugx?=
 =?us-ascii?Q?tFQ6X/+Q/Wi7OyJJZAeZW2pD57G4FFu0ZnsnAa8lt4NAakacrx+Olq1NoBlh?=
 =?us-ascii?Q?1UgkZPkPcaocECxUjsja8ew30Le88Vbp8kzaHAJtDP0FDYs7mWw3qhD29jli?=
 =?us-ascii?Q?f9K8cTGwp/Gn18HThiHLHi39mq4j1TmzLNkLAj0L1NrpGLoYVVg3beLz3iW9?=
 =?us-ascii?Q?YAhqQmnXJpyjJSzfdGRQnM1YtVmGtF3yxCeXm1vkogwk29BPGT0xFF6/EUAo?=
 =?us-ascii?Q?D+NYiVR1EEIBVXRxbIvgVZ6oj5n0mAkEe55tpXRmmZ3x63GbW0PAPsk6WhBu?=
 =?us-ascii?Q?TiA5g3JpgdvZvKy0Zig0DQ+3p2Lj/goSHAQrhDEP0dBQNmm5peZuYKTLgKP7?=
 =?us-ascii?Q?uZrHKVExKb11k0/yrtmIX/AH4hgWhjbmMNm8nzRIGkvb0AO/KHFePQS9uSaR?=
 =?us-ascii?Q?+0eW42VAV3sLJIh12E16qc/ZmQE7YkoEHEr93WWarI5MEjDoJiKRvwSaW6Lx?=
 =?us-ascii?Q?MquElVYKFscCM8Rl+m8k7KtW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 04aa47a6-e6ea-4ac5-bcf1-08d9522ab813
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2021 00:49:28.1295 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yfCGSnsT2LXIcHbDkn6tQQXZp7w6vDa5U3tj3gHCzz49JFRh2DBsMa8f6spfIvio
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5160
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
 "Raj, Ashok" <ashok.raj@intel.com>, Leon Romanovsky <leonro@nvidia.com>,
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

