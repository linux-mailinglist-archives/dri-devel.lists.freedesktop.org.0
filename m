Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4BE3D0098
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jul 2021 19:43:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD3B86E51C;
	Tue, 20 Jul 2021 17:43:09 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2074.outbound.protection.outlook.com [40.107.92.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9349A6E4C1;
 Tue, 20 Jul 2021 17:43:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZRlqS7delZLp/5ho9PJ/fjI8nfyxM3PYDuBXpUGxm/UcTZwOClzlXzX/uVmpeR641lfmmR6sy06eIKgrHh4gsvykWVRDvjOq7Yg8NVHypk3aE99no/KcadrhzyXyxzAeYlpV7CFT+sJS9fFGkDlqrQ+gyVX5JiFVsCXJG4LzSHCcIwa63B87845WBAa5xrowLTNI5DxMWNwdn5oGjORWi+0W6jneiF/BxrKPIlhvqhzxE6wvEfnOwZUz9Ndc4AZ78Dw8fERfB0T2x4xDwnimVKBR6yy2exZW07jXRmN8XU6x02RC4aXeQiRcR3HQSIO75Qvm5K3Yq2Hv9eBxgIZSsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GdkZ1Zuo6OfcoIKWlhzDVlDTYDIS9NoyIAqzf/hhMuI=;
 b=nGR3UEtLk5bIMyF/JFT2t9bXSRHu2JlpP/lIWiLVTeIX53QYLPpCEaHicLDyTStcbBIdEh8096NXzoUzZEepouD3wdfXp6YMBJO9fB7vwsAFx81Mr5y7nYf9RQI8MijBdldFXmTGAHvWCqBf/W64vmAjVQsH3JyhIlo/w/UKLLSSHdLfIWKF0E1pTr4ErG9IvG8S6RM/0auXpq0vdkfRh0Aw2Fkcti3BIMypht0b3YIPHShxvMlaRtSMqzTXiSTmaBjJ5HThCFSfeLk2Nunbfm7TrfC55EGKQZ4S8iR8h5cUMKvqMsAoT4/HBW2cjiw0zYI0PaWj/t0+XJEeMZO7fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GdkZ1Zuo6OfcoIKWlhzDVlDTYDIS9NoyIAqzf/hhMuI=;
 b=j8zgHNrFWl+p9kfyBdEl2n+cmQGdARUJIPC1nELg4R2SQWOa/JkG6wTdtgixwOgugTwyHsf3yAzXy8BeGyKuCMBfTIjLCSyNzfvv+9dKxiAF9SfiXhnC4LbmBZfR4h2ZZ5h0mjiubwTaqvbR/UnfAKxSZ7ff/V5ol+pUNKQmMkXySkmqoE7AlJuxp1OId0W8lkph8diWoIOLVoxbh03Aou0lAexLnjz/oGDgF2m6qtkca566KIWkhFnahd8NA/YUOSfpxeAHjSI9elb6+Xp+dXltc8qHwWaYjggJo4Tv5jlQly+wLNbDKzJZiLXB7NO3uFpMCbrQo2w3Fm+t63DaZw==
Authentication-Results: linux.ie; dkim=none (message not signed)
 header.d=none;linux.ie; dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB5506.namprd12.prod.outlook.com (2603:10b6:208:1cb::22)
 by BL1PR12MB5288.namprd12.prod.outlook.com (2603:10b6:208:314::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.21; Tue, 20 Jul
 2021 17:43:05 +0000
Received: from BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482]) by BL0PR12MB5506.namprd12.prod.outlook.com
 ([fe80::d017:af2f:7049:5482%5]) with mapi id 15.20.4331.034; Tue, 20 Jul 2021
 17:43:04 +0000
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
Subject: [PATCH v2 00/14] Provide core infrastructure for managing open/release
Date: Tue, 20 Jul 2021 14:42:46 -0300
Message-Id: <0-v2-b6a5582525c9+ff96-vfio_reflck_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL0PR01CA0027.prod.exchangelabs.com (2603:10b6:208:71::40)
 To BL0PR12MB5506.namprd12.prod.outlook.com
 (2603:10b6:208:1cb::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from mlx.ziepe.ca (142.162.113.129) by
 BL0PR01CA0027.prod.exchangelabs.com (2603:10b6:208:71::40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4331.22 via Frontend Transport; Tue, 20 Jul 2021 17:43:03 +0000
Received: from jgg by mlx with local (Exim 4.94)	(envelope-from
 <jgg@nvidia.com>)	id 1m5tll-0051EV-03; Tue, 20 Jul 2021 14:43:01 -0300
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 47000517-775d-49dc-c480-08d94ba5d2ec
X-MS-TrafficTypeDiagnostic: BL1PR12MB5288:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <BL1PR12MB5288335204726F82194B98ADC2E29@BL1PR12MB5288.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:9508;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rhTlK+jY2xM4vs4LkiDGJOIj6gTxLa4YHFiSgnAJ0ycHZmkHO0LBQqf+q1N8gh/z3cNrdDwUv9hCfXS539sYFJgpxiloDOLSHaCGMuwZTwQ9t04XEWnw7AQA/xN8iejx3c6UUTjYj+WbcIjhWZ+jkWD8qC5+MA7WA6uMnUh9zJiQ9/6wTPtt85u9mKYsSqBFSXiB4cN4fhRL+JU+OEvP7gV7fQWwLf38g9woU9VqXp3O5zj2tZQca1r/zHENthd+FFlet7FCCBlbs6lcxAhtfgyIcwufQSKmBkzTbXPPEoglmzrLpc6zJaUMnJSju0ojJhCsnw/fjLt2QZx3+ihRFaxC4Ms5uVUj6xPSmEuetFCSt169/5fF3bgmv2xK4Y/GktRFUCjF3KQcHo7wBdjZaWh9dRpAN29vbdljX9n65d/oryulOGDa5lj8LqZSyaZTqdcOp0MpbxhMQoe/7MB82hIMrNXf44yLBFQJIJdG8ybNfpAEw9CCLoYYllrgLSeH+e9BayPqpHRee+ZlGge+iTrDfTO1WmF2dvqTPoiTgof/I6F+hUMxpe9R2iPWv83QnhNB73yRZOFAD9a6E5TtMpfVWcGmql/yZTpblpIBUiD+YJh16btXcJc+oqV/dFhGdpnnmF6RES41D4eqzr1GFI0s2zGkoHLc26o3v9diYt86PWMe+HGpIk+3g+zbYD2jNyXoImLywmJTdYFNpVQQKI9EFSKuRZ4Gkv14NJe0P9UZNIfCWFdyMTg+t/TaIxz4TionIzx1P52Hl8vhPWI5QSB8lCQHtqrOlGyX3Hk1L5A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB5506.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(136003)(376002)(366004)(39860400002)(346002)(6666004)(66946007)(7416002)(7406005)(86362001)(2906002)(66476007)(54906003)(38100700002)(83380400001)(8936002)(316002)(110136005)(478600001)(36756003)(66556008)(186003)(26005)(5660300002)(8676002)(921005)(9786002)(9746002)(4326008)(426003)(966005)(2616005)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eO1ASEzcowRTS5CkcLnmAWZWCSucdmZN2mGuVKQySTlvZdyWmHWUMGkkDtFV?=
 =?us-ascii?Q?2XWrukQlOnkm/gamDc0IzFobZDCT79BJ5uAbiT0T30IY27J2rp880moNCXga?=
 =?us-ascii?Q?jqEcY39N4+1U4GTBJ+SPQfZwEYSttEqhB7HHhc9LbMpHPWKDExC3MiIP7Q2d?=
 =?us-ascii?Q?S+IS8lFUJ5WV6vvd5xiyQJnYfRxP0h53ZcozLqLYFVinWlXfE/KYzmgWUB87?=
 =?us-ascii?Q?Uwc4gstD7OIAYxtKkCwXBs1IYAdk1tOJzHcd73QJ+E6tTcQZyXgB2PlsBPy4?=
 =?us-ascii?Q?WFyXLFl/EV9o2x9sxDgjYXcA91XCcN5AQvCYNZxugEXETHamQLk/uI5dzQro?=
 =?us-ascii?Q?t5iRpH+kxJPu4VY1ulmbKnh4hw7FkHMrlNptTVlwTIRD6ebRPMHS6pex6mc+?=
 =?us-ascii?Q?TYEQRX7bMKPtVXSRvenD6oTD6fUiR2//Hvlq4m8ooF2wnbnZmLz9Wd4VyR37?=
 =?us-ascii?Q?uaFlh5LTCoeN8OJ7c9PrjrtseiZoe5ZDefCZ3xHYhFJ76MLZvPNb+WAReqVX?=
 =?us-ascii?Q?q9gvqAubYQRMJ1GAkxRwXRY0/SeWBwmwxubwUR+DqfxAyB9jFSgdQvTpg5kl?=
 =?us-ascii?Q?Q2c07iFSJMrYHpTpJ4TBIBU9GlLia8lKlXOwkg2+BK12CigvjDqHfIWV2ayl?=
 =?us-ascii?Q?hMa2iEb30oEX6wwTAkKQDR2A3XcKBMBYAR1W9U8ShIhcuoL8ag34EfcZBHNO?=
 =?us-ascii?Q?sUDYQaRkkXWFQ+9t0yImsGdCIB+tt/6a3kxZuZSURGyt6HAin/WMLwy6ZYfr?=
 =?us-ascii?Q?XyVKe1shxwVH/blMKHso4zZjqn+0ynNdA+npadBrAui3NYVAETydNO3YHATC?=
 =?us-ascii?Q?V7tiq4KEPffEsgSaRWafazrxfTKd0jQAp44Avs/wW+w2NiQsxnMflRzOUe5d?=
 =?us-ascii?Q?kvDRN+LfmmCF5KAQdDg+pIcz5podPaXXm9wC2ZqTivZWmdEVJkBR5g8E0567?=
 =?us-ascii?Q?rroECafu/NC8mw6XZWo90f3TIgMYehczpL5IEaobFLbTuFjrXaidygb6CHD2?=
 =?us-ascii?Q?lOKIarWRvHQIfaeW1kAAh9FSMsi/6NFVYzFi8ezssr8h/ezYV8/G780tzNHW?=
 =?us-ascii?Q?8cwVybJArPtFxMsK/W3kj1LUZWW8qPDxTxao2jIkWNOZt/A7o/+EM/7jvlgM?=
 =?us-ascii?Q?ec15xW5PAD6KYdklvpuThs3iI4udvotW7kbBdbFaQ9c2BfP5b1QVoLOtw75i?=
 =?us-ascii?Q?mX8mZJkYJnHDq5xsnjq99nmqQmAgytR5662SpPvehR7OVkPZZgg16LwaS0b1?=
 =?us-ascii?Q?YZeSiaGqyL5ZuM8GmH6gAx0A7tx1+9zFxROjgWCVRiGU9bcCq9BKEMIOssJZ?=
 =?us-ascii?Q?XFmQbgiFJQV2r9tUJdmWumxN?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47000517-775d-49dc-c480-08d94ba5d2ec
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB5506.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2021 17:43:03.2703 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +A0tzSb05+dTthzDUpiEVyUBh91Qb2ZIinW/FWW4Nlqu5FrI6RpQA9QO5WWEymQk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5288
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

This is in support of Max's series to split vfio-pci. For that to work the
reflck concept embedded in vfio-pci needs to be sharable across all of the
new VFIO PCI drivers which motivated re-examining how this is
implemented.

Another significant issue is how the VFIO PCI core includes code like:

   if (pci_dev_driver(pdev) != &vfio_pci_driver)

Which is not scalable if there are going to be multiple different driver
types.

This series takes the approach of moving the "reflck" mechanism into the
core code as a "device set". Each vfio_device driver can specify how
vfio_devices are grouped into the set using a key and the set comes along
with a set-global mutex. The core code manages creating per-device set
memory and associating it with each vfio_device.

In turn this allows the core code to provide an open/close_device()
operation that is called only for the first/last FD, and is called under
the global device set lock.

Review of all the drivers show that they are either already open coding
the first/last semantic or are buggy and missing it. All drivers are
migrated/fixed to the new open/close_device ops and the unused per-FD
open()/release() ops are deleted.

The special behavior of PCI around the bus/slot "reset group" is recast in
terms of the device set which conslidates the reflck, eliminates two
touches of pci_dev_driver(), and allows the reset mechanism to share
across all VFIO PCI drivers. PCI is changed to acquire devices directly
from the device set instead of trying to work backwards from the struct
pci_device.

Overall a few minor bugs are squashed and quite a bit of code is removed
through consolidation.

v2:
 - Reorder fsl and mbochs vfio_uninit_group_dev
 - Fix missing error unwind in mbochs
 - Return 0 from mdev open_device if there is no op
 - Fix style for else {}
 - Spelling fix for singleton
 - Acquire cur_mem under lock
 - Always use error unwind flow for vfio_pci_check_all_devices_bound()
v1: https://lore.kernel.org/r/0-v1-eaf3ccbba33c+1add0-vfio_reflck_jgg@nvidia.com

Jason Gunthorpe (12):
  vfio/samples: Remove module get/put
  vfio/mbochs: Fix missing error unwind in mbochs_probe()
  vfio: Provide better generic support for open/release vfio_device_ops
  vfio/samples: Delete useless open/close
  vfio/fsl: Move to the device set infrastructure
  vfio/platform: Use open_device() instead of open coding a refcnt
    scheme
  vfio/pci: Change vfio_pci_try_bus_reset() to use the dev_set
  vfio/pci: Reorganize VFIO_DEVICE_PCI_HOT_RESET to use the device set
  vfio/mbochs: Fix close when multiple device FDs are open
  vfio/ap,ccw: Fix open/close when multiple device FDs are open
  vfio/gvt: Fix open/close when multiple device FDs are open
  vfio: Remove struct vfio_device_ops open/release

Max Gurtovoy (1):
  vfio: Introduce a vfio_uninit_group_dev() API call

Yishai Hadas (1):
  vfio/pci: Move to the device set infrastructure

 Documentation/driver-api/vfio.rst             |   4 +-
 drivers/gpu/drm/i915/gvt/kvmgt.c              |   8 +-
 drivers/s390/cio/vfio_ccw_ops.c               |   8 +-
 drivers/s390/crypto/vfio_ap_ops.c             |   8 +-
 drivers/vfio/fsl-mc/vfio_fsl_mc.c             | 158 ++----
 drivers/vfio/fsl-mc/vfio_fsl_mc_intr.c        |   6 +-
 drivers/vfio/fsl-mc/vfio_fsl_mc_private.h     |   7 -
 drivers/vfio/mdev/vfio_mdev.c                 |  31 +-
 drivers/vfio/pci/vfio_pci.c                   | 457 ++++++------------
 drivers/vfio/pci/vfio_pci_private.h           |   7 -
 drivers/vfio/platform/vfio_platform_common.c  |  86 ++--
 drivers/vfio/platform/vfio_platform_private.h |   1 -
 drivers/vfio/vfio.c                           | 151 +++++-
 include/linux/mdev.h                          |   9 +-
 include/linux/vfio.h                          |  26 +-
 samples/vfio-mdev/mbochs.c                    |  23 +-
 samples/vfio-mdev/mdpy.c                      |  40 +-
 samples/vfio-mdev/mtty.c                      |  40 +-
 18 files changed, 444 insertions(+), 626 deletions(-)

-- 
2.32.0

