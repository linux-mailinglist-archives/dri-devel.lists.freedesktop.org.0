Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BCB15A8971
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 01:13:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3277510E536;
	Wed, 31 Aug 2022 23:13:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2040.outbound.protection.outlook.com [40.107.93.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC10E10E530
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Aug 2022 23:12:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lMuCRCMuT6p/FKulXWO8gbB38MYXhfsuOmjGiuepKm6nUWGqmRpuoN5NVk0W3vcR93JHIDuikx8N1GLflkKz29Wg5nMq8tV19/im69xfxrbRHaS955fiVL/V5hcGRuvLzIydc6Umi9aobBPHSAPxehysrg1lchsskSsvYHflEMzy4CmySgn3XLdnomMKT3jz/GBmovD7drzvBiUD7hr9ZDO0y5KaLa2WicA6J31BuCsXm8LwV1KWn6jyl98Q+dX+enxJsk6dHe3aZ3w9nbWPK3wcwS8KOJkfyb1Phi5VSjHxzuM3gnlRtfWudHrOR1vpM9DupNRc/s6IYWew0CHbpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XZhg0vFUSkiUQYS7H1fY0vREXOHo5YKAPQOLbz46IC8=;
 b=dO/sQJCsWuf/vCofk9HB9IU2sdDJ1GfJrErXOvDN76YlIL27TOXVAzRYGdBvT5bmJFsBzrJp810Bx5X84xlyKTJVVOuhRLzIycgf2d3Is0qeaiIXaINrKBdPAIg9HPP1nZsCiiK0+h45sOv4Lhm6fkQDgO2+oyEbmZNYqYv92aJn97SBiVgO06HBjYHTErY/zpMSqyLDxVzmr70xJ7K2VE7pHRvwMBEYzQFkWw4h1/6uGICboJAHgm3X52ftLEtibWD8h4F9qzCgPWNDglwnRZu6VHNmyz5YtXMGMuk/9Y+vGMvD+U2Ojkh/YmYUtfVSXsnjO73ADMue3STtatYgXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XZhg0vFUSkiUQYS7H1fY0vREXOHo5YKAPQOLbz46IC8=;
 b=jvch4Shf9Gg2FulnRc0PvVqeJ6rQxRvYfKRazQhYlyU7jLH31Hkg2yCkqkkJRzJi8F641RY20BVQt3tQBEVTZI8wgMsS7+M1bGmb9qHxlHcYi3bTDqTHGDG7rGg14N1Idr6At2uaQQ13XritM6u4iMBQ/gVUdcAG8qJgcCKuWnU6kZtnVDL2uhyTVzvSzPvUX6mmA/FZLPxAz3Moc/3ct1S6URBQLsdZTcphT+tANjl3/hyeTpbqkuO/0CE60nPFTwihGRnepMzmPP6ezFU37zWeriT6yeEq0MICfSURlNKQlAAB70U/Lkw+N35Z3KzgIumj4aupOgmkz3+5srguCg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by MW5PR12MB5650.namprd12.prod.outlook.com (2603:10b6:303:19e::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5588.10; Wed, 31 Aug
 2022 23:12:47 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::462:7fe:f04f:d0d5]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::462:7fe:f04f:d0d5%7]) with mapi id 15.20.5588.010; Wed, 31 Aug 2022
 23:12:47 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Cornelia Huck <cohuck@redhat.com>, dri-devel@lists.freedesktop.org,
 kvm@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH v2 0/4] Allow MMIO regions to be exported through dma-buf
Date: Wed, 31 Aug 2022 20:12:40 -0300
Message-Id: <0-v2-472615b3877e+28f7-vfio_dma_buf_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR05CA0004.namprd05.prod.outlook.com
 (2603:10b6:208:36e::8) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 3c41f172-9517-4621-990b-08da8ba650b0
X-MS-TrafficTypeDiagnostic: MW5PR12MB5650:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: EdA9knTyDyxcoVGacDHJ6fj74BWMGqUm5GCli3jb5dsHvnABIlMhNhVXwoBI1NQTHy5RpgF8G+dMdtmlR8LfK2P/A9nAkc+rQM3dTLRwQAKJzvo67oWqeh3AcfeIXFk+rY4+LKDg7Y3diIFv9hcuDIUU+DsqMyobk7r3TQZ3V4JWgM6eakeH/+izVenkmgGfn75fGlHx4ibSUy4h31kE8SXU8caiWQQdsQ0mBK2eq5sl6LXAAZXwjIsvVuRlhdB/ukcT2/XIA9E23bYKbJvtVHQTfFfKVgzdGLv8lJ2JF0beLNmzsgTLweiQaf3DlAudNr6FWAnsTXqRpG5ngSzQg3IdXp8pYLyX8xhKR6CCTb64PYzlSG1zA2q2GCI5kM30wLiDEsnb0Feh2EY/q1m8ONykSTh0RyD6b2Qj2gBbytHqca58DrCem2hj2IfZm0pHeI+vnXsbcnWrx2V9U+9JOOp9w9otm+HWb1R/ht8fR7wotYvnEccRlGGgffohR8c4W7T/T0M0IfNDb92KeIYJcHOGtE/TaXfy3Irc5j60qAf9b80grdOKegsa8ep22ZAoBZex0N0grS4X44UYbzOMoODwR8hN+31w7ZwUMVnJR+M107Ke5EJRyFzUdCClEeaquIpJRh3p0NCM5FYosxNtsvCrOWfj2C7CojQ6iB5fKL2GKXxswqSKEZ7zZn0fjPO9BvjAD6fNi34ZqkTJFAuOF+iO3ctyfhPli/F/rx5/TiA15U4SMnM33ITt4Z0svZHCLjXUSybRcQaqXNEOuUlswBw4TvC0kfIAuqh6fvjBejLaJcUXWJK0KQWvkwb43TrwAmVAhA6XIc7gUW+S+bMrU6pw8jakOFrNDWlwE1jhLOQPJmiepkHSaZbDsJDmzgBV
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(376002)(346002)(136003)(396003)(39860400002)(6506007)(66476007)(66556008)(8676002)(4326008)(316002)(8936002)(6512007)(26005)(6666004)(86362001)(110136005)(478600001)(6486002)(966005)(38100700002)(54906003)(41300700001)(186003)(2906002)(66946007)(7416002)(2616005)(36756003)(83380400001)(66574015)(5660300002)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzcyM2hORWIrMWxsdmxrQ2RjRzMvYzhmWEttdmk3eEo2NkpFUXhwSWNRRTJj?=
 =?utf-8?B?YVFUVHBQdWU1NHdwNmVaTnBjWHlTa2J0bkpSQjNEOHV6YitMN1lTbkVmTkIy?=
 =?utf-8?B?OEFHeDVaNmx4UHFwMml6NTY0OGF4Z2tncVM1SUgwTndnTEJtYWM4V2NxZTBt?=
 =?utf-8?B?MTgxZnluSmU4MlZ3VFk3TmtyNHpuVDZaUkRkSUp6aEpKRC9ZMnFPT0NVUDFx?=
 =?utf-8?B?VzlHYWVGZzNpaS83OUYzaWRjM1VJVzdONkQ1WmRBenlYY254Qys2cXl6N0dH?=
 =?utf-8?B?V2hqayttZytlckhiUnltTnNKWXNpYVBzYjdONy9IVGxFZVdrcGpESEw3TkE2?=
 =?utf-8?B?TERWeVF6T2g2UDdGL3FlTDFJd3ltZmtsckpMWlRjUkFtOGU4czRZd041OHQv?=
 =?utf-8?B?MmJwWjRvVmFEVFBXajlrNUxGN2FLaFo0L2d5YlFsaE44ZnlERmdxMS9mSGpy?=
 =?utf-8?B?SWpRRFdzS1FJM1JFUjdPYnVZMHByNUUrdmViZHV1V0xwbnQvL1UyQUk2RUxB?=
 =?utf-8?B?TUV4ZFBtMC9xYk9FeEhha0dvUjlNNFJVc0ZzcTNFYk5udWUwdXRGazZCOUZr?=
 =?utf-8?B?N21sdVNzVWR1RnhxelZ6TzlrT3UxZ3ltSzVxc1h2WnJROTF1NTNIRDA3SDFJ?=
 =?utf-8?B?L2tvd2ZFalZmSXlXcENlMG5YQSt5UVlwT3JNOXF0QUQyY2U4SWZoR1gxVGFz?=
 =?utf-8?B?UktHZzNDc1luMzFKejVYSmFwTFlwTDBCaEx4MVEwRTM1NG1oT0QxMXdjL3R6?=
 =?utf-8?B?RlA5Qk5seXI0RXVNeHJMdjZKS1hzQkhYQ05WbjQ4cFcvZUlRc2wzdW5hNEpo?=
 =?utf-8?B?TUZDOVZZQW9EeDJaeFdONXI2OEpYblRZbnJObExnRlVPcjFLOXBLM0xZMVl3?=
 =?utf-8?B?dDlaa0xKdEtWZmVEN0tsSFVTVk4vS2E0dDAyUHhrelRDd28vM0tycWt2ajVz?=
 =?utf-8?B?SlpHQVFmbUxNeEdZVmwvdEp1eXdlSWlDaHNGN2E5M1VQQ2I1MkZocW9RZ1lp?=
 =?utf-8?B?TjFBRUpiUjl4NEpXdC9XcEFMQUtFTmpQTWVMdXNFNXFxd3NMcm9LRjgxQUZM?=
 =?utf-8?B?RlJ5aTcwOUFGTk5MMTFuQUU0Wkx4SzFoUjJqelo4SzRsYzJmV0Z0bXZyN2RY?=
 =?utf-8?B?UDJ6aWsyWkJPN2l5Z0Z1L1RuVzdLZWZHWFVPeVJ4RlgwTEVSOWdXczRQNWpT?=
 =?utf-8?B?bDI0L3JKbis5emJqL2ZoUlI5N3FEVW4zL2NudVgyTTg1dTNKVGp5S0JUMWtz?=
 =?utf-8?B?S1Q5dVYzYlFPMnNEYUVUNDM4aVJBWklGTUo2OFZDMlNxcFowY1NQcXNvRjhH?=
 =?utf-8?B?VTVOZWxOcWxOMy9icFZkSExlaXBzaEdjSUZCL3UwMXE2M0cvQTFIQllQbWdi?=
 =?utf-8?B?NzhGa1RGTklYQ3RoUXU2RjltOHJHMDk4UFV1UVZhalBwbnlNMlRSUlJrKzZ6?=
 =?utf-8?B?U0d4VjhVQmZLME5PKzNjT25idlNFS21xVnoyNGFsSTJhV0RnZ0kzWSsxb1ll?=
 =?utf-8?B?eUg0b2xXYUwxU3JBOW5iR0s2NlowN09LaDF3enkzbzBKaVpVUGI3OUdoSU94?=
 =?utf-8?B?Y3hLbTI1clplT2F2T2VhY0N4TXBUc2x0YjRVSHZ2WWR2TnBkUWg4RnIyZkpP?=
 =?utf-8?B?Y0hTLzJRYytyT0VuRUtLdzhkMjdSemVabmVpWm4valk3ODJmTWNHc01Zakgx?=
 =?utf-8?B?dGVJVm4yOTVvNlFQcWRSUGREdlN0MXZ3ZE1MaWh6eGo2QXNKeXJBWmJlTU9D?=
 =?utf-8?B?RGdjaXlrSHV4RTZtSStQOURiV3FkRHpGWUcySzJLbndjUmVHZDRJMlM5UGRD?=
 =?utf-8?B?aHlLUUxRUkJMM3R0cW5ZbkVnYjlJZEhsc3JKSjRIQThwMldtbUhBa2d2WFpz?=
 =?utf-8?B?U1AxaTNpMFJuZ1NFWVk5QkR6Rk9acm1hMyswUlVZUjNoeTJETzREOU14N2dK?=
 =?utf-8?B?VG5XcnU3Qm53d21Pb1I2V3F6QWUvanJ1QnFRNEY2NG12S1IxQzIvemZHaGpp?=
 =?utf-8?B?Q2JEL0RIaUFDcHFNemRaZXhIWWxCS0lIZzJtMmUrZkFibUJxejVzK0RqYUZD?=
 =?utf-8?B?WXo4WG9hcVk0elI0TVZ5NjliTGpzSnBIS25JMGt1U3RySzh2Mlg2cDBXTVFj?=
 =?utf-8?Q?orkgMcw55w/u6iY077VuJ1Xdy?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c41f172-9517-4621-990b-08da8ba650b0
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2022 23:12:46.1879 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Mab9YO5WahAspTBsnF1oePGcZCJIffhNF6kcJjnNb0GjJl9OHMaHV1lI7B9Rmtlh
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5650
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
Cc: linux-rdma@vger.kernel.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Oded Gabbay <ogabbay@kernel.org>, Maor Gottlieb <maorg@nvidia.com>,
 Leon Romanovsky <leon@kernel.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

dma-buf has become a way to safely acquire a handle to non-struct page
memory that can still have lifetime controlled by the exporter. Notably
RDMA can now import dma-buf FDs and build them into MRs which allows for
PCI P2P operations. Extend this to allow vfio-pci to export MMIO memory
from PCI device BARs.

This series supports a use case for SPDK where a NVMe device will be owned
by SPDK through VFIO but interacting with a RDMA device. The RDMA device
may directly access the NVMe CMB or directly manipulate the NVMe device's
doorbell using PCI P2P.

However, as a general mechanism, it can support many other scenarios with
VFIO. I imagine this dmabuf approach to be usable by iommufd as well for
generic and safe P2P mappings.

This series goes after the "Break up ioctl dispatch functions to one
function per ioctl" series.

This is on github: https://github.com/jgunthorpe/linux/commits/vfio_dma_buf

v2:
 - Name the new file dma_buf.c
 - Restore orig_nents before freeing
 - Fix reversed logic around priv->revoked
 - Set priv->index
 - Rebased on v2 "Break up ioctl dispatch functions"
v1: https://lore.kernel.org/r/0-v1-9e6e1739ed95+5fa-vfio_dma_buf_jgg@nvidia.com

Cc: linux-rdma@vger.kernel.org
Cc: Oded Gabbay <ogabbay@kernel.org>
Cc: Christian König <christian.koenig@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>
Cc: Leon Romanovsky <leon@kernel.org>
Cc: Maor Gottlieb <maorg@nvidia.com>
Cc: dri-devel@lists.freedesktop.org
Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>

Jason Gunthorpe (4):
  dma-buf: Add dma_buf_try_get()
  vfio: Add vfio_device_get()
  vfio_pci: Do not open code pci_try_reset_function()
  vfio/pci: Allow MMIO regions to be exported through dma-buf

 drivers/vfio/pci/Makefile          |   1 +
 drivers/vfio/pci/dma_buf.c         | 269 +++++++++++++++++++++++++++++
 drivers/vfio/pci/vfio_pci_config.c |  22 ++-
 drivers/vfio/pci/vfio_pci_core.c   |  33 +++-
 drivers/vfio/pci/vfio_pci_priv.h   |  24 +++
 drivers/vfio/vfio_main.c           |   3 +-
 include/linux/dma-buf.h            |  13 ++
 include/linux/vfio.h               |   6 +
 include/linux/vfio_pci_core.h      |   1 +
 include/uapi/linux/vfio.h          |  18 ++
 10 files changed, 368 insertions(+), 22 deletions(-)
 create mode 100644 drivers/vfio/pci/dma_buf.c


base-commit: 285fef0ff7f1a97d8acd380971c061985d8dafb5
-- 
2.37.2

