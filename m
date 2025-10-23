Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7901DC03C54
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 01:10:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9E5310E99C;
	Thu, 23 Oct 2025 23:09:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LMc1qbh9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012007.outbound.protection.outlook.com
 [40.93.195.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2231810E988;
 Thu, 23 Oct 2025 23:09:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sGEnkULzLdjVjpUwF/2Qkwi1UAe88RX0s9lkjl5Xf6GSERFIxJDkzM4TxqhUBMU3LADqhz/drwskUdgtuy3Izk4Z7n+kBsHch1FL/lo19ym9H309+NsjI1DZBpQOmZMlVf7zCKnSaIbpQKbHw7DWAX3a6kXAFwd+QyawK5tsnedJETeQ1LKay8xgoDzhwZ/adAX9/cVDBlpB2Gtg5MA3F0DzxG7NAi7ZKnATZqir7qbyozq/zbGQRhcJzhz6ovQS2sFXCA0oJb0lS/6XQTG31EzViXVrV/oKfGWZsI510OwZ5g7h1rU3/5c4NptYuMG0lgJMfOPJx8YFv9JNo8tlSw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UXsrjPLvZWHxtOZq/LSmrbxapzUipJGoJCMMC0J+61Q=;
 b=IHoPLhmrVJkt5FrhRHet5i/cawqF9ooDnkNTSU23Isqrom1a3hGoEyozZoWiswItOF/CAamdXKvE+gHn/fhreT0Di7bZtabhIAddbfgJdqZG99PQ4F+7uvZG6RRX4w/cCh+9ArXl3nvplt/NoZo1rqWw1hVa2L5etPwHBMlJfcR21n6W6bo1PjjrvmWYp+5/Zh6msEoCvKJ5kMGnCKaMt6GHrsgkBeZr1Y7aBrTRWLt2MGenv4pYz9ty9jvg48NoibhJSVAx8ezhUvWntWhDiIfoi/GfMtDDEv7tKkeqkW5C7oJ88dIPE689DCSmBdlhzKqI/gP4EYFVF2UfhEHvgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UXsrjPLvZWHxtOZq/LSmrbxapzUipJGoJCMMC0J+61Q=;
 b=LMc1qbh9tuALSgaGPr7oAtKbEardZ4iRJA64M2Wfwxc+jVoVbLPPh+uQMe3sg0jgozROKWTHMm6rj454CsS+NN0b+Mn/+qS/DymWHLJRLI+28qiqSCV8F6NB1lyBB7DsdcdGpxl56E03RbnhTAuQARarhaHPlpBcvvLEm+0faktkSPNQpYYWKFs6whm1j1wuI7vuljCfBsEnVwSDJfFsAmvTjWUQiwM6BoTU2XvFdimBwIzXTs3BhjiNztHKqswiC1ZxP36CNRWFigTZvzRxmjp5jBPPATsB52Mo4i700JwFotBvtCiIpT+G/129tiaFBsupHfh68Zdk3yj29KTcZQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by SJ2PR12MB9138.namprd12.prod.outlook.com (2603:10b6:a03:565::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 23:09:45 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 23:09:45 +0000
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
Subject: [PATCH 00/22] vfio: Give VFIO_DEVICE_GET_REGION_INFO its own op
Date: Thu, 23 Oct 2025 20:09:14 -0300
Message-ID: <0-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0036.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::49) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|SJ2PR12MB9138:EE_
X-MS-Office365-Filtering-Correlation-Id: 6fcb4de7-7969-4140-2fb1-08de12893fe8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+ZgqWJBF28ap01s/uhon6y7ya5nkraO4UXn1dUtmG0WXxGUWr7XWhyHbpGfM?=
 =?us-ascii?Q?0/56SMSeu3roOt5slsIV2qbl/bC8nGzhu2I5eYHPmwZk3TEL6OU47B4qSw7V?=
 =?us-ascii?Q?KLJv3Z6qBNRzQzjYuI5mtiaPW+HNTArI16GsPT8dT3InyM0u+rSn4vq4q8AY?=
 =?us-ascii?Q?ti4/9t+fWBlVz9MAFpQ38k8sDlrr1Gm35BkcEwNc73r+M8d96OQNzV728PBA?=
 =?us-ascii?Q?paQIZoxq4YQ7wgBBGlnNjQc73UO18m42BxxWrENlG/LmGhJgetiNgfkl5xx5?=
 =?us-ascii?Q?GqjmxVGqB1Mv8gA2EQNg6a94uNDHfpJfR2vKprKlV3Sd5KyevJXrploWyErp?=
 =?us-ascii?Q?Ej5QH0ueTwMGiMbXUSJKrsHmnqvYgIu+3I8IDRjIhvBF7yn4aOZS+XhrVqeK?=
 =?us-ascii?Q?JRcJ54NxHJSqKuopZyaAo5TzNMfOTQ41hYPv0PD2MYnAeRYwy/IyxsIO8pm4?=
 =?us-ascii?Q?5B953la4K2guMLV+ao1/3sKdR46b9D5NuQRgTtLRpmxdWvkWdHh7cqfzkPfW?=
 =?us-ascii?Q?DPh1T8+gjKK85HB+M0ltlUyUM2MzHziNca78gIs3yw2PELlb/MTvgqIqAqN3?=
 =?us-ascii?Q?gU/UREVoO5gn2Nc2oiXG0fCm9I/5ztEqRUigJePDoFFn8uC9G51GErh0KpsQ?=
 =?us-ascii?Q?qJabUSp+eAJO0rBkPtff9djPtWSaDiBB8gcipEEP0xm6CuqTpE/fjtxQw6bo?=
 =?us-ascii?Q?K7guF8Ijccj5cTwijSVvoS9C638SX7j7jcJy9q32WpVP2Ffbfu3sADf5bVMs?=
 =?us-ascii?Q?WDxb5UQ4TUyQyaEZmwGqSmnDJdVpzq2kdFQ4wdd0TOO6vkFFNyq5FCudrLX1?=
 =?us-ascii?Q?fZ8VInLyxDEAyPcdLtiREByA1m8VmEzJuRvaJjY8ACHqZXVxD6Ye6Llghkm4?=
 =?us-ascii?Q?75ZpG8fXmmJ0XVrMJe/UKK46iDN6QlENhdBUnRBTi4GgbU2tlxvc9JKEWVuY?=
 =?us-ascii?Q?bpXrX0fxcRRrG0UQUHExRr8V/b31XOgz8y+WKuhqwPpE6sr4kHeiEFyRUXsM?=
 =?us-ascii?Q?Ues3E2K+UlZAwRnZ/ekcWRvbg3sw64quEbg01rFSRn3DKk1WQaJmcRrFJ01J?=
 =?us-ascii?Q?ATG5eDuZVTexEGp/xrYO4ztA9vDdIdr2sMGqCua8AOH8A9JXXwQ9T9q3Ll3A?=
 =?us-ascii?Q?StuKi/hwNecE5BppHNxlrKcoHkWhUERD5rbq7aKIuJAMQZUFyNHqMhFtVpa5?=
 =?us-ascii?Q?nM9eUOsyPyXvlpAAkvcifa4k7cDDB8YVNRyO9GCejtdY2fFUAJUveP0UtWVx?=
 =?us-ascii?Q?8NIrr2eHZngyCSLt8LHxGxa1C7I12/PIyDgdGDSKHKHZY0qUeD++5cUuYQND?=
 =?us-ascii?Q?fWBl7to0gmbz0uxE+RuCxecduSgP3ajJmggTOLsWVxdVYgb99J1W7IrMfa61?=
 =?us-ascii?Q?33FeOue4GExsZFevi6bjYS14Rf0aga8cIOX/yCeVIUg596b09Yw7wRRuir42?=
 =?us-ascii?Q?LVa4c9xQgnVdHe7a7XPAEqGDQHpX9gvDM82QuSt8GuS7m0HqE4pKfiRVHjZ0?=
 =?us-ascii?Q?+AKN04K/QA7/CUg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TjwtkCNm91ZjJQ4Brrx4FF+6Vc4ZYa6doJZlQkh/L2XyOfQSmL0i67jg/c/N?=
 =?us-ascii?Q?/l5aHsugyuhJ7oQ0nntLL+GdWUZfLuJaG9aOqFJ46tSESAaDtljPbno1KhqB?=
 =?us-ascii?Q?ukmq52krRf6lEyZNe/DxH4WB7q+5Nj47ccQmL+QPLid2+GdT33EqKI4OsqHK?=
 =?us-ascii?Q?w6JM7LUy1MQ5GYDrWSL5U9vQiO8bPZVPuBcYBnAzLmzxxHgrvMj9+Dnueifi?=
 =?us-ascii?Q?FZbG79mbeVjyrTMrfeOuQ+2atkIzxtdkbamEVVGrePpzVfdxtd8q+Tr4ZQR0?=
 =?us-ascii?Q?+fhDc/YxjT1iMX1EdWdtBALCJl2HobD5nLy4qN02mrUE1R3jgjJQMA7V3uDr?=
 =?us-ascii?Q?sv+JPcGLU1awfU6Bf+/YJnWBnMCVA68UD0+aESseTeGuQ11DxProion6Fl21?=
 =?us-ascii?Q?VxTUVEeQ1J1vFSzvLqau79QUzmRMOcyMyKgvVn5YXxNiTXHP9rCQjLNRP8Eo?=
 =?us-ascii?Q?/EUrYRPQD5mr4xabSp0QbAG5/RtbYlwFTHTVhovnfWAkIcqH83DypgTiwOgN?=
 =?us-ascii?Q?u2Y4Veyc1NoF5ZHe85qeNB0Tu/wbVNIrvQM7YVKi16ESdaH9Wq63o4RdSFtg?=
 =?us-ascii?Q?DoJZBnzJWpAXBVbXFvqCcHjsbzuXaUrxgGXku9Boik6GllaglSLXe/lJWvHe?=
 =?us-ascii?Q?PXnQI6J96c8Iu+HWGFDanESKovfwzt2W5GTEB5TH6C0LJjcLeG5kwMVpxFge?=
 =?us-ascii?Q?r/6/KdPsDYwUjSPa2IbO89uJC0SN7JcqZCegToZh+ZHgxtWHfy2Uf/qdPVLh?=
 =?us-ascii?Q?2yp5qEqL95Q74s4ClDZUGc0sjPJsmmrr9fCSU0r1ki40S1BOiJPYxJv8G/EV?=
 =?us-ascii?Q?vuCt8x2IFDs1hIq+heHRZwElogBj0aSPSFAoUreCwpc9nVrq/KUElQFnBUTm?=
 =?us-ascii?Q?Q8/1E47uwq4p+eo0RokFVyMLkRnFbGGed3YPRTrzvBeaX7AfPeA8yMxFc7nW?=
 =?us-ascii?Q?tdjHMCxeFTRnXjOqLMTQ7XNUlKvyD4fMIgobX7Cl3o+vLNBGis2o6rRS2QnB?=
 =?us-ascii?Q?oWLsr6DDnDAE5IrGX3U2oQTBkpgtTpNcJ/h8I30oX1PqioL5ASk7iwFNILIU?=
 =?us-ascii?Q?L41zuGPbB2Ut5Um46brxQuU/kMXS2OcMw73wA/TlPrB11kTJnLq/x73iyfAT?=
 =?us-ascii?Q?m+AGJey+53BBMtx1+ZUm/iernAUpQ9I6jlT6Fz3tBElUhKyLUp0yeVPgUcgX?=
 =?us-ascii?Q?NU0pJbRPLX+2UZeKKQIOgBbD1SVSLrzFknwnJdGyCvWPGhyP7bbivC4bq8Cb?=
 =?us-ascii?Q?n/4Sn4RyB1Z5RXQyczSeCvklgxnwhUvYfHzr6eJ1kquzOEdQpokoKJNpcIGu?=
 =?us-ascii?Q?Ajlv3CuunthuRjkLgj940G7y/eNDLvyTukKK69HahKOPsIIKMBmuMJRALE3s?=
 =?us-ascii?Q?VFR9MGAEDX+JgO5b4sVEUK3dSro65HxWIEfeUM3r5NVIJdg5suR+G6IbyEs+?=
 =?us-ascii?Q?DreeedJJg0t8LJo3YziNA8QDUB79Z2kjX5kYEbhupvlijEcopJLmAHCXV1BX?=
 =?us-ascii?Q?jJBBhLf85FuiBINJGMAKcIhAb5iby5qgcfnZUBseZHEN/cx92kIed/jBoxgE?=
 =?us-ascii?Q?PJPPXAL3L/6b8hLe0CQxSHClReI2K7wemWwQjosC?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6fcb4de7-7969-4140-2fb1-08de12893fe8
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 23:09:42.7333 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /OsV3UXLWE/xVfC7yfPB15bzGg2lqhjSMgEX/BDnLFCU38RDyU82Q1+gpj9UejXp
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9138
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
 drivers/s390/cio/vfio_ccw_ops.c               |  45 +--
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
 drivers/vfio/vfio_main.c                      |  45 +++
 include/linux/vfio.h                          |   4 +
 include/linux/vfio_pci_core.h                 |   3 +
 samples/vfio-mdev/mbochs.c                    |  71 ++---
 samples/vfio-mdev/mdpy.c                      |  34 +--
 samples/vfio-mdev/mtty.c                      |  33 +--
 24 files changed, 363 insertions(+), 530 deletions(-)


base-commit: 211ddde0823f1442e4ad052a2f30f050145ccada
-- 
2.43.0

