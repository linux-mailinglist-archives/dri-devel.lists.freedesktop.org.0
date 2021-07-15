Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D83D3C951D
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 02:21:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91C566E54C;
	Thu, 15 Jul 2021 00:20:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2056.outbound.protection.outlook.com [40.107.236.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A660D6E513;
 Thu, 15 Jul 2021 00:20:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=g2Z/t/07UclULvm6Zytb0LMXAAHHKxsbPZqgKXf+xKSY8mhRQOnBwRP5DzljDthMfX8PdTJVsoiBdRLZtVpQg+l0Q6mfxdZfdZMMW2sGemI/jI28BdZdwYFZajPb7Wi9+fU5HJjH846j0L9lFGKgV/RhLiWuvmQnSNWvYB9eZTygmDXgrZbczMpQ1eK6SC5c8lATe2G1HLGJeTPgG5BRBt726M7ELVGycS2XHOcGPsLFTacfVwjQClKSUCspDirBC7b0jEOLrW5yglZkY4cQhJ5DipoAY+uWYK+mAz3E71066qk1hsGrlLgfaS0uQzKMGFlsTlwsQfQDx6uNl6ud6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8TI2Ea3BCnpMJtPQTi7ZpZoDXqgi9wwRJ0CJqM3YOZE=;
 b=QrfHbt6vvY3sRGZ2SdIXKS4tfhC2kDWYo5dJWoUmrd6gaLglafISQmN7/FARi32QlQC5MVSn3Vy3KgMq6Uo46bVIuhgokk4XhycT9vliGiYqaQWwyN23DywzFBexVIbzzlmlgWQ8QUskVl6mqCNzK8kJbuwTBAJ//eEvDNKQr39gVbcTX/3lbt9VN97kCzPiaVkKsIqUnOnR5MQlo4uaMenM/E091qwUR9TC7qPrbL6GsLOWf4T2yxV9r3AcRWRW7ZNNxWVf/BZhLB1MPmobSkZ9O+0rSwULprFBt3qgYgtVlBZx6GadzmaIg3E+mm9h1n5SLC1yDXnQPBhJm+9oYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8TI2Ea3BCnpMJtPQTi7ZpZoDXqgi9wwRJ0CJqM3YOZE=;
 b=ifIyfs03qlbfZ1FQBeQyIwt1/NHj30trE303NDNFCX8ZUzhrOgk8XERXg4qywCh98+I/lMxkGP6nd7Xe4sPiaP1TBVCS6cq2VodQRYfILXm7oZKRYOA5qSFBsD1+MO2PJSBUcCdeh9y+mukRf7LpgW3w4JLyrDIsbeY+XokXQEEL4PHVEccOE0c/cRlHplVKzqZwbaE+ZvGpnJdVJ/RuASmW0MKby/WAtcvv+pK0raKwhmrr9Pp2t/Gkku72lcrQgDA6FL0wwdaS4ZcKk0sj7000edGJnuTrqgFWdCTLA91Rq2Y0Zi2jEONcEB2BjRczVUEoZsmFHOtELr77D0MJsA==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL0PR12MB5555.namprd12.prod.outlook.com (2603:10b6:208:1c2::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.26; Thu, 15 Jul
 2021 00:20:47 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%5]) with mapi id 15.20.4331.021; Thu, 15 Jul 2021
 00:20:47 +0000
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
Subject: [PATCH 10/13] vfio/mbochs: Fix close when multiple device FDs are open
Date: Wed, 14 Jul 2021 21:20:39 -0300
Message-Id: <10-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
In-Reply-To: <0-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0PR04CA0118.namprd04.prod.outlook.com
 (2603:10b6:610:75::33) To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (206.223.160.26) by
 CH0PR04CA0118.namprd04.prod.outlook.com (2603:10b6:610:75::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 00:20:44 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m3p7K-002Uxi-SQ; Wed, 14 Jul 2021 21:20:42 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f9e3d6f8-eec1-4a4b-c607-08d9472662c6
X-MS-TrafficTypeDiagnostic: BL0PR12MB5555:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL0PR12MB55559AE370D2BFDA38980AD1C2129@BL0PR12MB5555.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:2582;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uuZ3WE1GS8Qf9leKhYqh2ACY9H2dWiG9291zHTadGdj78FDFrwCCcPZyV1D3kZ9Xsr3TaOQW7WL0RLebEEpJFFlz82BjAvOOKL7yR4W1WkVC/gRsHGGfmER84+YD8xUxu8elrBDyjz14rRcjVm6/XF9qF+G1rGGhFKQ0HyK47zM8095iGRk1+KFM9wJUEFzhGFcEw+tikL6NZ3KbdAF4ESE2KIBj7j82TAwrq+ZVWTOE88q/xfs7e6OLYMY6in/xZl0Wa/hcbEz3dwCCmFz/elZHIwkumSV1wi4YrjhBaOsse+iaHIlyLpvnOojuAI3UGH0C02DH2LhotELI5q2QSMRWVHS46jrjEKl3qX4kjzAvo7iGGZLtTL0G4jojPLxnfCB3s9oIrZR/xOWA61e+EdPl2C6b4181y11k+2kEpqptz387ZP1QzzpDZv+Ji/ApZagmvVkcGOC2BPi0pbPMrnY5rwcGFC8hF8ieaggFz0GDDQGC6RS59Kcdku1UWHQpEQmbOMexrBb7Ho5w+MLmWECEfokMnuhG43v1ga6Zsw5mAVMTjby7X2pnZix2pMZKkQAKd8T2RI8ryolwn9lxlI03O69Nqab89M2od7pYtjJlQGAkbn3VBfg4+UJtdno4dZVS8aD8CZZIkYKoGLR+gb+yCwZOL41A3xVwJFZhd1pDBXqiC0OMGTc3N8H3LMd6
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(346002)(376002)(396003)(366004)(83380400001)(2616005)(426003)(316002)(107886003)(2906002)(478600001)(4326008)(7416002)(7406005)(38100700002)(36756003)(5660300002)(66556008)(66476007)(66946007)(921005)(9746002)(26005)(8936002)(110136005)(54906003)(8676002)(9786002)(86362001)(6666004)(186003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a7UCNAQBOdzXVo/gdEQiiptGZ0kfwpD9YuJz6vhr2yxu1i0L1kKGwoLGLe9O?=
 =?us-ascii?Q?R0PuVukpk9GbdXt65Va9PscM146HzT82n7o/n24cYlIuXMEFCqn0kGmGDLRY?=
 =?us-ascii?Q?nzSO4/knLMBNB+h9vUIWGY4eQRUj0C9RWRavupXHmVIRYfegdIz2DVdjts5w?=
 =?us-ascii?Q?e3d9rbZXZMo6CfuAVQ1tLUxi8p4NaPMGc+W5mMJqmTN6zUPib4s2LYk8jKMt?=
 =?us-ascii?Q?KsBi3SwSjMQzwu3gYjE4ywlDmBLAgIPp5uTYoeXquGJGI5l2pkviw95xxt2I?=
 =?us-ascii?Q?cFCnYgifYWnZEJbAEpC9B7Vg/B3SV61VsuoOGFHjjcLKYyOmRbFhG7MjSz8v?=
 =?us-ascii?Q?LWEdgN/BfJH9QVxxKROBIeJs5XDXMZVpZ17by4UWnuc1l/VvC9U8SJ62dOO+?=
 =?us-ascii?Q?2/FPJUKuhXSbikcg99cIfa1nH5nVKV9PO3TZQj0PI3ZPfBLlHRjE0A274HEl?=
 =?us-ascii?Q?y2b9Hmj23AnBcQPiNkZzAdDvRU3aZVMAeU3o2gBC1+3DXLsVt5K8rW5G/ypJ?=
 =?us-ascii?Q?PRSn4E6mUftpMCW0mkwqrvQcsBv94ij9LkmM7cuLH2+CWsAZ5pj9ll62VEpX?=
 =?us-ascii?Q?FrRoWoIE4bz13MhhNnFFRTaWG/Ow7EDAdfRgfncGP6nvj/shfpnloQBLC5Th?=
 =?us-ascii?Q?usKciK+O1iIo+h1rPtS4vxY7kX7hJn9L1LTL06eCLaY/B5kyX3E6crkw5BVV?=
 =?us-ascii?Q?xbRPt/5PLym8iVDTEu9EMoO5OtZ/HJBWmcK8afQ2/tS/Q/yOWjXYCV8lyq9G?=
 =?us-ascii?Q?lZuLOBiSTtinN6OffJUYgwFLZSPAaSblu+MSGc8BfJOe2hR7+G9X3qoLhVLr?=
 =?us-ascii?Q?c9+lWdQraPbQl2wWuiUPv9RP27uvi01zXQ6A3sLpoCFX7oMl0IjzqwF6vM58?=
 =?us-ascii?Q?9Xjmlz2nmw/hmgBhbDrX8BgdpGTs04fsl1b5hKAJYw20S5wvKtfFS4uxmmnS?=
 =?us-ascii?Q?XZNDLxTAcbRIzcsqbaz5m5hgdc748aNO3SDh70BAWZls6rcaiiDGvgS0raSQ?=
 =?us-ascii?Q?efnR0a0fEdX1LM6zlFXo9VH3bmtCYfkRaljSGBJUsj/XWhqVKAcNGCnGnDPD?=
 =?us-ascii?Q?af1uIamuJajDNBCBVQxHdPNkuwfsclpZQN2pwkafZsYeNSwPDJ7koxHog/Wr?=
 =?us-ascii?Q?m1BFFQH3UevjIIeOtFtWLiyHfITyr3L0HYmr5z5o1gmGNL78IdJ5bPu9JBaE?=
 =?us-ascii?Q?WIlAQvxt+7egS4xAn1K4koFJooGFRjOKctMjqEPKU1LPKIuPEvOfElgNb7Fy?=
 =?us-ascii?Q?NnR/GH5V3U0j9/J94AmNcHkmd8DG18zakG96+V19qqPcvM8Op6mIH8fJsNzQ?=
 =?us-ascii?Q?azdvb47oW+qaFBL1VJzgThDD?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f9e3d6f8-eec1-4a4b-c607-08d9472662c6
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 00:20:44.3359 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ki3GThN1F1zFf+p+MLpbwMRfPHP75T0Oq7KuM9Q5yboKmP+EU/Rpi3EOsBLDN1NF
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

mbochs_close() iterates over global device state and frees it. Currently
this is done every time a device FD is closed, but if multiple device FDs
are open this could corrupt other still active FDs.

Change this to use close_device() so it only runs on the last close.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 samples/vfio-mdev/mbochs.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/samples/vfio-mdev/mbochs.c b/samples/vfio-mdev/mbochs.c
index 199273bebcc0e2..0137494c203aa2 100644
--- a/samples/vfio-mdev/mbochs.c
+++ b/samples/vfio-mdev/mbochs.c
@@ -1274,7 +1274,7 @@ static long mbochs_ioctl(struct vfio_device *vdev, unsigned int cmd,
 	return -ENOTTY;
 }
 
-static void mbochs_close(struct vfio_device *vdev)
+static void mbochs_close_device(struct vfio_device *vdev)
 {
 	struct mdev_state *mdev_state =
 		container_of(vdev, struct mdev_state, vdev);
@@ -1392,7 +1392,7 @@ static struct attribute_group *mdev_type_groups[] = {
 };
 
 static const struct vfio_device_ops mbochs_dev_ops = {
-	.release = mbochs_close,
+	.close_device = mbochs_close_device,
 	.read = mbochs_read,
 	.write = mbochs_write,
 	.ioctl = mbochs_ioctl,
-- 
2.32.0

