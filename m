Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B62743C9ACB
	for <lists+dri-devel@lfdr.de>; Thu, 15 Jul 2021 10:45:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 782B489D44;
	Thu, 15 Jul 2021 08:44:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam08on2047.outbound.protection.outlook.com [40.107.100.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5ECD06E4C4;
 Thu, 15 Jul 2021 03:49:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n0gfSoP/4C249BMFC0ON1VABdhydQCfZQ5OQLqwSrd2kMuFr5pv3Jf1ZAUjDrEOYdHeRd8cW5DYt26DLnzerUv8eyXUmMWAIrwyk3B9Io7c9LIpzzCW+/Uh+ha66XS+V5zDvY8pUjTwV34fmd8aDNovXroqUHgxm5gWoSrSSssdbZoQAF+F97l7YrIck5YH0H0VkALkk2HOeBW0df7cFTF27Pkg3wkXJ+Nixyqw6MbIgoMXzii9lycqzbhQ0uGCYVqDo+0alUeiiNBrwnUj74DwQMDuT1CEkSn5sHYYmLeAsSmFpEF79MtWrTXnYA8/u2PoLTFnwigxKJTAWlEekfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0sWWtisFvIMjOSkzRFvjoJlbQkVUZQ+K2FpZnFmQS2I=;
 b=j3hDapAiiAvf8/OC0DfEKJjjLpNMiOVMHuTzIuFcRgMhX0QTlqnT7pA2HgSsAdWmdK9LvBZWexQa+D2cv7LZ5wyDewufvv0FU5ibTXMw6fIlGOZniJoc3s+BAMILJrzuGYStWCU9LTHTdrpdbACZkttLWgT7LpMKJGuXwNCWXIJE/gHVDHVk9qxRZYADPdDhFhgAZfmbpKevTJPJXRJj/zpKZV6mTJxEvU4lpF52nVqN1GJoE8+H3QwsWtfH55TlNgDuMJKDmGted2cd1BrD6Us4NyJg0VVe2g8MfQf/86qZyp1Lw6wRGfhP2hBV1Chh/ahpYIqy1YLLmGJ+V4Szgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.112.34) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=nvidia.com; 
 dkim=none (message not signed); arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0sWWtisFvIMjOSkzRFvjoJlbQkVUZQ+K2FpZnFmQS2I=;
 b=F+PhbOpV7EVJfPf3ylo2P5m3CUxMrPnZfJL65VSoiVx/TF8SUvPZ5whgk5tR8AGDGzDouqRToG4KwfkEcJKgh4d9iZCc/2/CBEFbmCBLfza7GBe4ig/7XBB6AHYt8JG5nCL0Rh6+6SrK9nQJ5GW0mcTIy6RHn4DmskBJfWk5edDRizbxxRDkHEEd+um6Dz3T1Iq58jiBn5Mlq5jrds3FJCqtKYBwseKeCIfi+caIpDC4TX9fJkFgNueNRRH7ZXpQ0WbnWMcqtYRdYqyKzYJt95Bt7/AOCLMd9tvjzBLKxdIvmN/TN9UzsB5zOtAP3NDdfTvm8xmVz7Pj4QvaB1MzGA==
Received: from DM6PR13CA0068.namprd13.prod.outlook.com (2603:10b6:5:134::45)
 by DM5PR12MB1147.namprd12.prod.outlook.com (2603:10b6:3:79::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4308.23; Thu, 15 Jul
 2021 03:49:10 +0000
Received: from DM6NAM11FT058.eop-nam11.prod.protection.outlook.com
 (2603:10b6:5:134:cafe::59) by DM6PR13CA0068.outlook.office365.com
 (2603:10b6:5:134::45) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4352.9 via Frontend
 Transport; Thu, 15 Jul 2021 03:49:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.112.34)
 smtp.mailfrom=nvidia.com; vger.kernel.org; dkim=none (message not signed)
 header.d=none; vger.kernel.org; dmarc=pass action=none header.from=nvidia.com; 
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.112.34 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.112.34; helo=mail.nvidia.com;
Received: from mail.nvidia.com (216.228.112.34) by
 DM6NAM11FT058.mail.protection.outlook.com (10.13.172.216) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.4331.21 via Frontend Transport; Thu, 15 Jul 2021 03:49:10 +0000
Received: from localhost (172.20.187.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 15 Jul
 2021 03:49:08 +0000
Date: Thu, 15 Jul 2021 06:49:05 +0300
From: Leon Romanovsky <leonro@nvidia.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Subject: Re: [PATCH 02/13] vfio: Introduce a vfio_uninit_group_dev() API call
Message-ID: <YO+wMbZ2TWscTynr@unreal>
References: <0-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
 <2-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <2-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com>
X-Originating-IP: [172.20.187.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: b3f9b869-c0d2-4b03-1e91-08d94743811f
X-MS-TrafficTypeDiagnostic: DM5PR12MB1147:
X-Microsoft-Antispam-PRVS: <DM5PR12MB114707BABD943402020C3F34BD129@DM5PR12MB1147.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NIZzDydBOWn4etqen3ycusuy+uDalEMlB8z1DfgNbMvQkY0g71bCZ//UoNFJrOlCD2FzkZpdIRKGxBOPh6xYe9aYTZpx7dpDJzOXinH0yMOsIIdyIqTAeERenipstPKtyEwmoM3KG/Awxgmvlde0VaTga+dkV36oItw312/jkHLLWFiQy5iDmA72kG1gtb2pIqY5vtdYf/CbIyeesfagFQv7kZzkE8BFeeG8t9rVsv8VFZ4MchP2B6gxGypvzRo3wTlN6G2uUOw4Y6h7cALBkE8ZT4eQ5PLxYICbOB9wW3eaiaEWiTXjG4bGIFDWXt4F8n56+WVXxwcQ7yVbg6rOqutBOE9//QALO+/q6+WGWIYPnm1yC+gyx6ND/FiWXK08rjXsq3XnjwmT74iLX4oTV7IVrmud/FA4i6veRr/gkPZsjg2tHfnWv9KwjFCTF3X3U7R5PKpCF6KekhFxUowOaefy5EhyIZgVHU7+HzWPmHU2B6nu9P81nfNxvTyXeDdkQmap9VoUWCQ9wzloyRXm5805zgdGljc2+LiajiNxFQQDP1ukbo2dxPCFnBTLRK+mkx/0KIY9rEVi1ruw+clkDmB8A5R2+cOtPHz3TfVAUHR05sX6Wzc4ArA4vruLIm/Beufk7ND/Aa/QxEm9mHn9KXwT3XcNYPsYp1p3UzG/11mrGDQQcQNY9+Ftma1cuBOPuZOWWy6x4xq+xLgQVt0Lk/s7aLSco5mCWXat9eeB4fkH/h3uXN+6kXvQ0VjhTLLv
X-Forefront-Antispam-Report: CIP:216.228.112.34; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:schybrid03.nvidia.com; CAT:NONE;
 SFS:(4636009)(7916004)(396003)(136003)(376002)(39860400002)(346002)(36840700001)(46966006)(6862004)(107886003)(34020700004)(33716001)(5660300002)(82310400003)(82740400003)(426003)(70206006)(9686003)(7406005)(26005)(16526019)(7416002)(4326008)(83380400001)(356005)(6636002)(70586007)(336012)(316002)(6666004)(47076005)(7636003)(2906002)(8676002)(86362001)(186003)(36860700001)(36906005)(478600001)(54906003)(8936002)(67856001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2021 03:49:10.3257 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b3f9b869-c0d2-4b03-1e91-08d94743811f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.112.34];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DM6NAM11FT058.eop-nam11.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1147
X-Mailman-Approved-At: Thu, 15 Jul 2021 08:44:52 +0000
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
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org,
 David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, Kirti
 Wankhede <kwankhede@nvidia.com>, Max Gurtovoy <mgurtovoy@nvidia.com>,
 Vineeth Vijayan <vneethv@linux.ibm.com>,
 Diana Craciun <diana.craciun@oss.nxp.com>, Christoph Hellwig <hch@lst.de>,
 linux-s390@vger.kernel.org, Matthew Rosato <mjrosato@linux.ibm.com>,
 Jonathan Corbet <corbet@lwn.net>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>,
 intel-gfx@lists.freedesktop.org, Zhi Wang <zhi.a.wang@intel.com>,
 Jason Herne <jjherne@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Heiko Carstens <hca@linux.ibm.com>,
 Eric Auger <eric.auger@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>, Harald
 Freudenberger <freude@linux.ibm.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 intel-gvt-dev@lists.freedesktop.org, "Raj, Ashok" <ashok.raj@intel.com>,
 Tony Krowiak <akrowiak@linux.ibm.com>, Yishai Hadas <yishaih@nvidia.com>,
 Cornelia Huck <cohuck@redhat.com>, Peter
 Oberparleiter <oberpar@linux.ibm.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, Jul 14, 2021 at 09:20:31PM -0300, Jason Gunthorpe wrote:
> From: Max Gurtovoy <mgurtovoy@nvidia.com>
> 
> This pairs with vfio_init_group_dev() and allows undoing any state that is
> stored in the vfio_device unrelated to registration. Add appropriately
> placed calls to all the drivers.
> 
> The following patch will use this to add pre-registration state for the
> device set.
> 
> Signed-off-by: Max Gurtovoy <mgurtovoy@nvidia.com>
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  Documentation/driver-api/vfio.rst            |  4 ++-
>  drivers/vfio/fsl-mc/vfio_fsl_mc.c            |  6 +++--
>  drivers/vfio/mdev/vfio_mdev.c                | 13 +++++++---
>  drivers/vfio/pci/vfio_pci.c                  |  6 +++--
>  drivers/vfio/platform/vfio_platform_common.c |  7 +++--
>  drivers/vfio/vfio.c                          |  5 ++++
>  include/linux/vfio.h                         |  1 +
>  samples/vfio-mdev/mbochs.c                   |  2 ++
>  samples/vfio-mdev/mdpy.c                     | 25 ++++++++++--------
>  samples/vfio-mdev/mtty.c                     | 27 ++++++++++++--------
>  10 files changed, 64 insertions(+), 32 deletions(-)

<...>

> @@ -674,6 +675,7 @@ static int vfio_fsl_mc_remove(struct fsl_mc_device *mc_dev)
>  
>  	dprc_remove_devices(mc_dev, NULL, 0);
>  	vfio_fsl_uninit_device(vdev);
> +	vfio_uninit_group_dev(&vdev->vdev);

This is wrong place, the _uninit_ should be after vfio_fsl_mc_reflck_put().

>  	vfio_fsl_mc_reflck_put(vdev->reflck);
>  
>  	kfree(vdev);
