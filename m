Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B886C03C50
	for <lists+dri-devel@lfdr.de>; Fri, 24 Oct 2025 01:10:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE8B910E9A4;
	Thu, 23 Oct 2025 23:09:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="GOAr9oJ9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012069.outbound.protection.outlook.com [52.101.48.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F185810E986;
 Thu, 23 Oct 2025 23:09:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lc8R30c5r3FnZvxc88cRBdszXyN1VpTUKyQ3FK7imap5uTT/XAvKVCuA94SYHiqmj/+lTloOAAbQkFKNkn/DUi9T0jeuz17o7lOVV7iLUahFbI/utG/rC1tc6MUUrgiolBvImdSZ0Xv+//8en2Qor7IxB/vJ0zV6YosYiVeYA0jzUDEDneOBeLu5GXEoZDYnf0kuVpeYRBUmAiQ+8ql5pSotfUo+Mm1Ka8bb0tdVscfzHl8MPuQuxsUYCZTBZQWyAiuT5o+vPsYmqtEU4aCTH0grG07tlrFiNBhaV/3u6k0llC4L3wuyLFhnB5eF2lh+n55cP8pZzRNJqOfBJUgg5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ear7i+XsXwo7L0PT5joVKtctuvJknPshYF6WXWJsQWQ=;
 b=i1ZRw9+/We3l5EjrtWo/TD2ZCz2LDlWglE6NUpNuRUTbBhacRbiyL4RH/taLuAD0i8z7gbsLiqQ5rVDFmTYMTHfSLX+tpWCJMXCNmG/x9YaIxEF0VPhO1bYih7ARJxgOVnI7UGSnYUHqYSDNGfkCm5pnaAQCHsnIdt2vwzvvTFCAZQWv0wXexYYxgOWfVAYw4NUXLcM4PHUWb2mwOaExmU30LSdcv3WJIhsBmy3MAThsiJ4wS9ovriI+yyebnfXcGKIvotdgqJfy7ZBZHwYZHbD6xaIyupU8EtV+u6VSvHwRLiNIcdRdclqAjBmGCx0036l0eGQhnBvRZRU8TAkQGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ear7i+XsXwo7L0PT5joVKtctuvJknPshYF6WXWJsQWQ=;
 b=GOAr9oJ9qXOnZDSN11dokIZn7IYy/oQyVK1VMWsSWMHPTl3aAzmXjk4oVacgtw30tnCY+XUh0lIzxhE+wEBuW2PDIAgVJGrFPfoi4MZkehtBDR7kXHZgwU3Xabxjd+Q6pVDr8Sp/FMi79isYbAxHvd+O4tqriqgdRCylzJR1tURevXFFZcKtnl+f2XHO7gvczJY6FzoOjL0SmySWwbR86gHpzfe02WMpHmjv5Ly79yfvvimyANWekj7nRfJKq3eFDp23qFS09vz3EI9Ogl4BitlIbQ2p9Ri2TKTfUbxs/ZNKHTgBYKz0Q5yFbiGqmRnbwO62vZuTFxQlWBCUpc/r6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by SJ2PR12MB9138.namprd12.prod.outlook.com (2603:10b6:a03:565::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Thu, 23 Oct
 2025 23:09:50 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9253.011; Thu, 23 Oct 2025
 23:09:50 +0000
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
Subject: [PATCH 05/22] vfio/pci: Fill in the missing get_region_info ops
Date: Thu, 23 Oct 2025 20:09:19 -0300
Message-ID: <5-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
In-Reply-To: <0-v1-679a6fa27d31+209-vfio_get_region_info_op_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0107.namprd03.prod.outlook.com
 (2603:10b6:a03:333::22) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|SJ2PR12MB9138:EE_
X-MS-Office365-Filtering-Correlation-Id: 33520a40-c2b8-4b73-bd46-08de128942a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QYkK2ahXrCyjaQLM/E7oQPsLjeUR4DuSCEtIwf8TzgorHl3mxMpNg4INIDiy?=
 =?us-ascii?Q?sZO2u8nwikxK+oDIx2p4lNas9Xrs9UFnWHbGyx6SHLgCilQR29JsanRjsDQB?=
 =?us-ascii?Q?pyuWm7IEtRYu0UGzJAHU2dZXE6VbgIwVNwuEZgs500GlMlnxpeCgV6yzRdRK?=
 =?us-ascii?Q?3x10KPeW6Pm68B3wfGmSjC/i8zgP75B9bFnagGCOfwCi5aeUpPgckqyr/XJe?=
 =?us-ascii?Q?Wcvebyf9yiZggxIpHAFjLk0GvZ/41j9w3b1T8Yt+R6pYvDwaXP3Fneszc8Er?=
 =?us-ascii?Q?mvnmBiuiAtSZs8N/LFSFUpte4Mgt6qX41/8A4ie1eyb40ofC9E8IG4DFBOOq?=
 =?us-ascii?Q?wcA/iu7iKLM20merkQ+nwrCkCxY9zpEb1EUXj9yl2bcAOgdXuIHZ2D/4/mcF?=
 =?us-ascii?Q?RiF+jV6wGsW0JeFqlJIyZgmugbNbKjxBCZPNpF4euNhWpDacx2P/Ns79deko?=
 =?us-ascii?Q?dc+hyNW0ByFYP+J1rVkS8GShNkEmJIzzTxSLcuOnnY4DEGP7FcI9rZfRi2cK?=
 =?us-ascii?Q?cnoX8gIzHayp57A46LiRskslAg2IRwoI1zVlPEmOvSGMCkJbLFr7XnMlPHpz?=
 =?us-ascii?Q?suiauKWvTl7m3BkxMS+lE9HqYyJKkGU0ok7aKTfRzJWWoHy5N3kDSNFZor5E?=
 =?us-ascii?Q?R4FpaLIv+frd0M8uSr8vblPKnhmVf6RAr4cjxsrMu+eU5dB86bbKqS7DZqoM?=
 =?us-ascii?Q?xUq28EBks/CB6KUTV7m+OJZ1zXoit+Uf4wLZIzth05z/Q/q/Yvr1NMUu/+DP?=
 =?us-ascii?Q?r3ZqfevXDpZuDnWFWaVaFDscic4jW9OTfStT0J2OQp20n/urn+p5m+BEY9y3?=
 =?us-ascii?Q?1HrLOW5sJJnvd0NHEcAkZMdJlUueVMqV9ukVZRYfk4JCMBC9hqAOI9l8vxwv?=
 =?us-ascii?Q?DYdq0qwF1KsuCjDmAc473HO6pN/Ywww46K4iPebq8rVfn5Mnh+wmfcLyBPNP?=
 =?us-ascii?Q?ICoIPWFtcjKP6yEwHbw+mrwSsWoSC8mdnFvi7aFgqDXOX+djneXGbIVqYZF2?=
 =?us-ascii?Q?LhXMZUCmmx//9agw67OIkPkThaNyU1eM42juVLKSYKAFAKINhCiBaXS9GSBP?=
 =?us-ascii?Q?6dswVvAwjNnNhv5F8WnHG86TFKl8Y4BP9Kd74040h2tdCfKPlYSIWDUiRiD5?=
 =?us-ascii?Q?twzk4J/N78oE/8mLi2jsEREEiXDpNR0ONfW3Q1Vzvb/QFYXjW9PGQAC4MdU6?=
 =?us-ascii?Q?Ww8sQFnP/3YsNucO8+wcJdH7xueHAx36wK2paR3lgHssdaYkhanpl48NSrCZ?=
 =?us-ascii?Q?3jULsRq2pA7dC3Y+NdJ8/7iq8cID8kmwJ2JlJGDtMJTFJqoFiwSsZSZomvU4?=
 =?us-ascii?Q?+CIDozz+ikQhkIvPCg4Km3pE0bGATDmfLF2MaKbTgtZw4HpedcIjw4+4w4aF?=
 =?us-ascii?Q?g7XN+NMWYujttb3NnzdR/wLZAE2PLhb9fXoVeWEAZqkS+AwThRH1mj7uLQsn?=
 =?us-ascii?Q?lGGSTWdkelqZCrxsrT4QxbZXYE5QS+uSkFCQwyjMDkKn9QsE3uUIzsPXOIfk?=
 =?us-ascii?Q?Bi9ApeQsjJeNfJs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/NqhriQ/i3j/RJeti6X1wAz6UNYWVGMhXxow/ps5NrwqRb8YYwwNKTyjEk9+?=
 =?us-ascii?Q?yDBCsg/G6oXYjINUeTTOPLD1w0MmuNh5E8mp0qEaRXLUVye08HGGgejUO7ia?=
 =?us-ascii?Q?8aIvOeeKPCW54dpPBXoitP5g1yp3ZsRcjn/yVVu0EddyNM3SY4ulDPrI09ZK?=
 =?us-ascii?Q?5p4ca3Pz1xbWh7bo5ew+Lm8LP5M25mXaYs4OBWoXXSpelsoAHdB1S3rX5JZZ?=
 =?us-ascii?Q?eKNkXzHv4gRBZHNoGXTTh+2+lEsxCqG+usWx6bLGAI9PoF8AIkYDogBMDdRZ?=
 =?us-ascii?Q?am/pycccGFt9zKK0HlZ4vCfiYZhBkiQOLobiSrXZhgtM5BdKQm/WDhcE/TFt?=
 =?us-ascii?Q?mby/lOkIVm19TrvR9iEsar+CST8fs0JTRarSExbHi7FKyqGhmmDVzrWTux/f?=
 =?us-ascii?Q?kGVgFfwMzjoxQ8Hd+4ceqg8VcM1gdf/8EOkHZL0Hihe9J5Bz+0JO4qqvv62/?=
 =?us-ascii?Q?dg7ILsvZETWyDPaxKluOb3QGlJ/uEjzX9LWe0EboEupVcJPxj0LROz2NyqWz?=
 =?us-ascii?Q?kiTJ+WIpArJ1xK6TODXFIJjT0Jrk2BgTX9uImce7ObjCl9tW/1JtelxoQdku?=
 =?us-ascii?Q?m/snYQga9isLxx/v2fi00lRuiHi2kphx+2W9NNSkXBN2c5rU/Ykk0tNaCNmw?=
 =?us-ascii?Q?MFovd/vDyYt91meCzXXlzYWdCPopzss1H+YIr0BY6V8Cl2gc6VH+8Q6BlLnu?=
 =?us-ascii?Q?Hkar2uwgFkPUJTZez0VP9UJQdYy7BQEEvnYsJ5yPgHaHudteG1Q0j+5dVwNv?=
 =?us-ascii?Q?R+cjSTI5eSEutsylEo5b2smRdg3g4T3WdNBTEkE5J0QTLBFgc7auirdkNUuU?=
 =?us-ascii?Q?xXtVajPTuluGF1gWs/dGKzld5piB3kBjuz7LlwlBmxnjdgae1PxnNMf6UApy?=
 =?us-ascii?Q?3Fp11c37yAO0DlNISTAWyEJmLpur8oD9GLUuw1FVVX0Bewy7vNSpgcEw6qAk?=
 =?us-ascii?Q?wsX6g/GBFFAOij2UpImQxu+ySVs7JhPpmDqdKaHZszFXxg7wGP7ZxnwFkPuu?=
 =?us-ascii?Q?KGHGuZo9M7AlU1RelaTaKxgyGMHF0Hrqgl3K+FvFjlLj1UF1mMekSCRKcu/1?=
 =?us-ascii?Q?VM8+8Ed9GQg6J2IE9JhJzRegpJ82nYfYXfZ7TRhvM58uMsQZRdfkCviMdLov?=
 =?us-ascii?Q?u9NXf7B6GSxXn0knY75eQCzySZS/OSYNPFNoQgFABpC173uBd2PBytGvA4Vo?=
 =?us-ascii?Q?ijEANgsrGtLPKYP40vD2/vr04zAmrjMU8sRxV2a0ok9jBECiwcjt+nWgdmf0?=
 =?us-ascii?Q?ydQBPuf4m8V9S3gkQdLrSoW6y6LSb9KG/oXNkiorPPPZW+AjdbArhmF701tr?=
 =?us-ascii?Q?wKATN7kQ+vLT6INjS+ptNkVKfLv+EUMKNDQXuQD4YyLZK6OCKCklnhnFduLb?=
 =?us-ascii?Q?QZ0054NHNsWXHXUIVjwXZ3KdfEXRG+xseGUbnS2D5N/FqyOb52wpDdLCI+5m?=
 =?us-ascii?Q?tzldt48OKFougDo47Ds0zjYKTh5tXcRO7L24LIdE/vjOKqjNJCtrA9NMkszK?=
 =?us-ascii?Q?nb+12twLB92iNUaQplz1YYEVy1yjagOaT9gvsBJKcNl0abed8oPEUX/HbSBi?=
 =?us-ascii?Q?Iqsk2s2emHljJnfnIorsSg+PmCoxJs1HAN8/CJwa?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33520a40-c2b8-4b73-bd46-08de128942a8
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2025 23:09:47.3738 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tzeyChngq1wtHVVNgbq5pS187edoRs0JadfQBNWw2Qpju4yMM8O6VHvLLSTRZ02b
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

Now that every variant driver provides a get_region_info op remove the
ioctl based dispatch from vfio_pci_core_ioctl().

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c | 1 +
 drivers/vfio/pci/mlx5/main.c                   | 1 +
 drivers/vfio/pci/nvgrace-gpu/main.c            | 1 +
 drivers/vfio/pci/pds/vfio_dev.c                | 1 +
 drivers/vfio/pci/qat/main.c                    | 1 +
 drivers/vfio/pci/vfio_pci.c                    | 1 +
 drivers/vfio/pci/vfio_pci_core.c               | 2 --
 drivers/vfio/pci/virtio/main.c                 | 2 ++
 8 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c b/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c
index f06dcfcf09599f..99e67e3dda3498 100644
--- a/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c
+++ b/drivers/vfio/pci/hisilicon/hisi_acc_vfio_pci.c
@@ -1574,6 +1574,7 @@ static const struct vfio_device_ops hisi_acc_vfio_pci_ops = {
 	.open_device = hisi_acc_vfio_pci_open_device,
 	.close_device = vfio_pci_core_close_device,
 	.ioctl = vfio_pci_core_ioctl,
+	.get_region_info = vfio_pci_ioctl_get_region_info,
 	.device_feature = vfio_pci_core_ioctl_feature,
 	.read = vfio_pci_core_read,
 	.write = vfio_pci_core_write,
diff --git a/drivers/vfio/pci/mlx5/main.c b/drivers/vfio/pci/mlx5/main.c
index 7ec47e736a8e5a..b7f941f8047ea4 100644
--- a/drivers/vfio/pci/mlx5/main.c
+++ b/drivers/vfio/pci/mlx5/main.c
@@ -1366,6 +1366,7 @@ static const struct vfio_device_ops mlx5vf_pci_ops = {
 	.open_device = mlx5vf_pci_open_device,
 	.close_device = mlx5vf_pci_close_device,
 	.ioctl = vfio_pci_core_ioctl,
+	.get_region_info = vfio_pci_ioctl_get_region_info,
 	.device_feature = vfio_pci_core_ioctl_feature,
 	.read = vfio_pci_core_read,
 	.write = vfio_pci_core_write,
diff --git a/drivers/vfio/pci/nvgrace-gpu/main.c b/drivers/vfio/pci/nvgrace-gpu/main.c
index d3a5253473e002..cab743a30dc35d 100644
--- a/drivers/vfio/pci/nvgrace-gpu/main.c
+++ b/drivers/vfio/pci/nvgrace-gpu/main.c
@@ -707,6 +707,7 @@ static const struct vfio_device_ops nvgrace_gpu_pci_core_ops = {
 	.open_device	= nvgrace_gpu_open_device,
 	.close_device	= vfio_pci_core_close_device,
 	.ioctl		= vfio_pci_core_ioctl,
+	.get_region_info = vfio_pci_ioctl_get_region_info,
 	.device_feature	= vfio_pci_core_ioctl_feature,
 	.read		= vfio_pci_core_read,
 	.write		= vfio_pci_core_write,
diff --git a/drivers/vfio/pci/pds/vfio_dev.c b/drivers/vfio/pci/pds/vfio_dev.c
index f3ccb0008f6752..1946bc75d99b49 100644
--- a/drivers/vfio/pci/pds/vfio_dev.c
+++ b/drivers/vfio/pci/pds/vfio_dev.c
@@ -195,6 +195,7 @@ static const struct vfio_device_ops pds_vfio_ops = {
 	.open_device = pds_vfio_open_device,
 	.close_device = pds_vfio_close_device,
 	.ioctl = vfio_pci_core_ioctl,
+	.get_region_info = vfio_pci_ioctl_get_region_info,
 	.device_feature = vfio_pci_core_ioctl_feature,
 	.read = vfio_pci_core_read,
 	.write = vfio_pci_core_write,
diff --git a/drivers/vfio/pci/qat/main.c b/drivers/vfio/pci/qat/main.c
index a19b68043eb2e7..8452d9c1d11d3a 100644
--- a/drivers/vfio/pci/qat/main.c
+++ b/drivers/vfio/pci/qat/main.c
@@ -609,6 +609,7 @@ static const struct vfio_device_ops qat_vf_pci_ops = {
 	.open_device = qat_vf_pci_open_device,
 	.close_device = qat_vf_pci_close_device,
 	.ioctl = vfio_pci_core_ioctl,
+	.get_region_info = vfio_pci_ioctl_get_region_info,
 	.read = vfio_pci_core_read,
 	.write = vfio_pci_core_write,
 	.mmap = vfio_pci_core_mmap,
diff --git a/drivers/vfio/pci/vfio_pci.c b/drivers/vfio/pci/vfio_pci.c
index ac10f14417f2f3..2d9122efc10baa 100644
--- a/drivers/vfio/pci/vfio_pci.c
+++ b/drivers/vfio/pci/vfio_pci.c
@@ -132,6 +132,7 @@ static const struct vfio_device_ops vfio_pci_ops = {
 	.open_device	= vfio_pci_open_device,
 	.close_device	= vfio_pci_core_close_device,
 	.ioctl		= vfio_pci_core_ioctl,
+	.get_region_info = vfio_pci_ioctl_get_region_info,
 	.device_feature = vfio_pci_core_ioctl_feature,
 	.read		= vfio_pci_core_read,
 	.write		= vfio_pci_core_write,
diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index 1dc350003f075c..f21d9026068c37 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -1460,8 +1460,6 @@ long vfio_pci_core_ioctl(struct vfio_device *core_vdev, unsigned int cmd,
 		return vfio_pci_ioctl_get_irq_info(vdev, uarg);
 	case VFIO_DEVICE_GET_PCI_HOT_RESET_INFO:
 		return vfio_pci_ioctl_get_pci_hot_reset_info(vdev, uarg);
-	case VFIO_DEVICE_GET_REGION_INFO:
-		return vfio_pci_ioctl_get_region_info(core_vdev, uarg);
 	case VFIO_DEVICE_IOEVENTFD:
 		return vfio_pci_ioctl_ioeventfd(vdev, uarg);
 	case VFIO_DEVICE_PCI_HOT_RESET:
diff --git a/drivers/vfio/pci/virtio/main.c b/drivers/vfio/pci/virtio/main.c
index 92b525e52abe4d..d68096bc525215 100644
--- a/drivers/vfio/pci/virtio/main.c
+++ b/drivers/vfio/pci/virtio/main.c
@@ -88,6 +88,7 @@ static const struct vfio_device_ops virtiovf_vfio_pci_lm_ops = {
 	.open_device = virtiovf_pci_open_device,
 	.close_device = virtiovf_pci_close_device,
 	.ioctl = vfio_pci_core_ioctl,
+	.get_region_info = vfio_pci_ioctl_get_region_info,
 	.device_feature = vfio_pci_core_ioctl_feature,
 	.read = vfio_pci_core_read,
 	.write = vfio_pci_core_write,
@@ -131,6 +132,7 @@ static const struct vfio_device_ops virtiovf_vfio_pci_ops = {
 	.open_device = virtiovf_pci_open_device,
 	.close_device = vfio_pci_core_close_device,
 	.ioctl = vfio_pci_core_ioctl,
+	.get_region_info = vfio_pci_ioctl_get_region_info,
 	.device_feature = vfio_pci_core_ioctl_feature,
 	.read = vfio_pci_core_read,
 	.write = vfio_pci_core_write,
-- 
2.43.0

