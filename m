Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7B5C41148
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 18:42:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1771110EB3A;
	Fri,  7 Nov 2025 17:41:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="JCg+2pwc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010022.outbound.protection.outlook.com
 [52.101.193.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A0AF10EB2F;
 Fri,  7 Nov 2025 17:41:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vPMfO401a/f3tpMCRZHUpz2th/vWMpvCpwYJ++O51YsrOp3A0RylQ7KWYH/l5t8Fj/Z2tlgyJ/p5pRbU144N8bevZCE5z7eM9e9yXLm+dQXB9/oe8lx/nftJg7ajEn+824lwCHGsA5NkDgSTFlsZ21EISxSbSBpdP+ubUxdmZKdmfv4KehOQq14DSluMAm82Ob7rrI4VdS1DVN7imH6H1dzMPg31adPh+hqvmObPwbNG+Zgeg04482dQYMfQY68Tb6IljmJ6VFxE76jSxX3wzfBl5j+9qS7ugrtO6nKAAZbRlJmZ0O3Lsm49RAm3siocQ758GtWObv0ZG4VatLZ89Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dIR5LhfS7UgVjvGC4jYDei+O9u11Tpzn85AQor4hKDc=;
 b=g7wz2QSSdAdAs+uBHwCCi8OyDHB5y4d8610uMm5QNnIZD/t4aUCumZChzuZazWjb1NAFZff/WeW/N2en+HC+2llTsv6dychA+Wyw3AubV5zw/vulwFtw8fJgv3jGyJUNqFqsUTYy0msdYs3eLG6LOr1L2CVBIDmDcqsnvzYiDWB4PPWOc9fkQ63jDfBgVxKCzfeNDyaAqu699nMCQlbzcK3VZRq0a9bHACs2BoUJmb5rbBZqvXXYITLNHfA1Djeh7L5lUthz6kK9jUlFwISVhY21ZtagJQ/4yAQJdqj+dven0IK3wKXKXJ4KtzWp4KKKMuvC9YIJcnqIBWlIaAUZTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dIR5LhfS7UgVjvGC4jYDei+O9u11Tpzn85AQor4hKDc=;
 b=JCg+2pwcLJu5JrV0xHWUVDgNrVR1jkt6EgboHKCt1AXZINSuheZjw+kYXGu1E8pW6MMJQTX5XMKdZab24Q4wmmCAxWG9ADDWvxqBzoE7VVtM9a05VnbAbVmkYZrAlo3HEH1KZ1RPnRrWoGat76zb/3U4xQHu2Vh/8q69EXSCfUujO25Duw7Cm0hdggVzu9gYJWD7Z3LvJe6wELVpAa7a++nzFV/z921q1N6jex80o8pU8sis6L6GombHrKQTgkZEdxDlNOKwTRZit2DGlzojYKZFFz1I7wA7aJ/B79ksL36QquFiE4eIANbESbQLUtf5le1xfxSONcMkX5AztAYtCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB3613.namprd12.prod.outlook.com (2603:10b6:208:c1::17)
 by PH7PR12MB8826.namprd12.prod.outlook.com (2603:10b6:510:26a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 7 Nov
 2025 17:41:46 +0000
Received: from MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b]) by MN2PR12MB3613.namprd12.prod.outlook.com
 ([fe80::1b3b:64f5:9211:608b%4]) with mapi id 15.20.9298.006; Fri, 7 Nov 2025
 17:41:45 +0000
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
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, kvm@vger.kernel.org,
 Kirti Wankhede <kwankhede@nvidia.com>, linux-s390@vger.kernel.org,
 Longfang Liu <liulongfang@huawei.com>,
 Matthew Rosato <mjrosato@linux.ibm.com>,
 Nikhil Agarwal <nikhil.agarwal@amd.com>, Nipun Gupta <nipun.gupta@amd.com>,
 Peter Oberparleiter <oberpar@linux.ibm.com>,
 Halil Pasic <pasic@linux.ibm.com>, qat-linux@intel.com,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 Shameer Kolothum <skolothumtho@nvidia.com>,
 Sven Schnelle <svens@linux.ibm.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 virtualization@lists.linux.dev, Vineeth Vijayan <vneethv@linux.ibm.com>,
 Yishai Hadas <yishaih@nvidia.com>, Zhenyu Wang <zhenyuw.linux@gmail.com>,
 Zhi Wang <zhi.wang.linux@gmail.com>
Cc: Kevin Tian <kevin.tian@intel.com>, patches@lists.linux.dev,
 Pranjal Shrivastava <praan@google.com>, Mostafa Saleh <smostafa@google.com>
Subject: [PATCH v2 05/22] vfio/pci: Fill in the missing get_region_info ops
Date: Fri,  7 Nov 2025 13:41:21 -0400
Message-ID: <5-v2-2a9e24d62f1b+e10a-vfio_get_region_info_op_jgg@nvidia.com>
In-Reply-To: <0-v2-2a9e24d62f1b+e10a-vfio_get_region_info_op_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0278.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::13) To MN2PR12MB3613.namprd12.prod.outlook.com
 (2603:10b6:208:c1::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN2PR12MB3613:EE_|PH7PR12MB8826:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f27989b-7af9-4504-6205-08de1e24e9b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Qiupf1tMI+0Pq2dT87dX93TNPS5jDIgQYTkkgRotASPmfb3frH/L4hGw507F?=
 =?us-ascii?Q?44z7Sj8hj67IKGA/rZbcE1KaWkrhzUe8eidD0CmXvAYgcjrafTkdJvkU1ezT?=
 =?us-ascii?Q?3rsQruUrUZv/4vWbWk8EffiV63Aw8k2fWJljXHRHSpofC08/dp6CY1gEbi39?=
 =?us-ascii?Q?f2GOSAtJqt3lc5Qo44chJOOTzVgnPcAH014RI/DKg4XsQVhTqwqcLgR9Ep4X?=
 =?us-ascii?Q?HMIUv6tZT+2mDtj2HDYOI6zgLRCNGKgo9WFNhEPMgC+Jc+AUCkqibgYQO41D?=
 =?us-ascii?Q?edGmXMWYo4ADLl140A9NL7/CgsjMSKw2tWlJiPD2Y2NYG0DAFkiTkVsPMDN1?=
 =?us-ascii?Q?+joV5CoC1X+kIKBpJWNS5HsMDHvn4DhEvaMxxZy2Yw1A64d9lYPSsZ3WxB+d?=
 =?us-ascii?Q?GM8z2xEu0AS8mPxgbcCPgKtN4Gh1ydeABfsW/TqTxgHni/myi7MmqNxj25aE?=
 =?us-ascii?Q?0+zMwqPrgsPdij5dB7geo4rt5tBVimIaLQlj2J9UuhnrsPTXUWg1e5q0063V?=
 =?us-ascii?Q?3Pae3AEeN2EpG/a+/IgqBpCzDdl0TeJgUa7TyuLbsJvok7pef0kUr4SL8N2H?=
 =?us-ascii?Q?gr4sf5HNECESQIKDGue6HWOlnCC8jvW0QjIL/5mtCzZ9DKO5WXXMZfWWoreu?=
 =?us-ascii?Q?FJSj72YQFwCc81c3Oemusshurs0r7Fp0eXMpKk8SC6YHNDfBhUt/Z//T0pB+?=
 =?us-ascii?Q?abPjUz/j18ikDYAU5n7XuNws6sbzAHlGkYav3TsIXa448gI4fDa4pBN4/PiU?=
 =?us-ascii?Q?MZQ516999sxEgErbqlj/Cds+YrdsA2bZviaIdPkizYX0/Jm4dBDOdjGb/8oU?=
 =?us-ascii?Q?jqZ8pb1p7Krl3rDuWYnJ8o5XexNjNTCuBoXfXn9/Bxc1uGGo7dFtlRViuFra?=
 =?us-ascii?Q?38FhjWm2BMrxJa9+5jAMGqM5NBiP3VhaGKnmrhB4sDBeI3JeHuWBkTrhQfDE?=
 =?us-ascii?Q?JDsCQNWKcqq+0r5Vtp8FLtf+L7S5dQr5ft0d9a925dy1rrsTYixQ0QF03cnP?=
 =?us-ascii?Q?1OWl6eQ4QQn+qkLXMGBBuIAhyYp0XEv5UhndjAn6La2nYVCG5Kqqbc4VPDtF?=
 =?us-ascii?Q?ozxIIaxrIpz1o06OnacekIdu4UyP5Kx/L1dXZydF+AfMeIl0Q+5DlexhcMyC?=
 =?us-ascii?Q?aIhV+1FkVQj4viDs8APaMljbmVJOsSBxoApPnvyMr7+4rHuUhka5wPXDGwrh?=
 =?us-ascii?Q?Hp9qGoBYj+fgctUTgRTJogiN7NoeTY/6E5ExyV7+GuQpMY0RBK5Ej7Al0M9h?=
 =?us-ascii?Q?9e0yvOuzyFvBOJ2F8TWsxODm+H2bwuaYf12PuuTvUKU2xGS1WmGFyH6Bnjn3?=
 =?us-ascii?Q?srCumAIokWPSghns4BCxmpnbFZDY+r7MtqH4iJqn0JXyASrHUwOTE3Mbfw/F?=
 =?us-ascii?Q?rx3lABE2fnhmfKsRhA20KeubfVN3oVXkcOS/uNn9HelT3ExJJktCLftF6U5T?=
 =?us-ascii?Q?+6RPnpieDIhzeKLPk2tNhbVmLH+n8OhB0Me4GXvunAkQrLxP1q6e14pQCo1N?=
 =?us-ascii?Q?2lGEsr5t+rhjBjI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3613.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f96EkppYoR7A0GNrcDbClxeecgA/aEGCTPej3YQsHGVgjPnpspKkkLvubtQw?=
 =?us-ascii?Q?IymYzOYJhhHcpsZG0GXj/b5JyNgSByceTFYZXPLJHPAsxYj4ITfQOGsReMB/?=
 =?us-ascii?Q?gc/6blO8AaiRr/lp2dOtR53WTtuPffBZJQQi9YaBW26E7eyafmnHlEyfUTMg?=
 =?us-ascii?Q?lfA5HGYECmh1wLJo1oYLgyfeGAs+aokYurO7ckEiujNk3+Oj1nOlIrWNaY9G?=
 =?us-ascii?Q?ZgQXINjfs/3EHVee015HyrVaLqmb4xwtB3r6bdsAWFa9h/dv8DfgWaoZoxjp?=
 =?us-ascii?Q?BIIwlqdFq02zD0A3UIcfOi23MLhPl332V2fHP06q4BOft4HwhI9VQDdRkUqg?=
 =?us-ascii?Q?3ED/zY/STGp250LaRi1ouQFCc7BXXqoKR+zGbaBFPPFVYATyvKVdJ9yhRLUe?=
 =?us-ascii?Q?K//CvCsuCMsSbJNS419dzYcvZWp51qzvvQbaEv6ZSTB/ZIgILcWtyq5ALe81?=
 =?us-ascii?Q?E91sfhkuC4yZBn/168QWM1CXtHIRmrZ50bx2ofwQ4h6rjYpWfFNR4g6qV7+l?=
 =?us-ascii?Q?p3+6TAy5digseI5HOcTrYuHs0IztNGpVaFAxXLS1R1kX0yksMSSbxB/1czTz?=
 =?us-ascii?Q?xn0+BSLajbc0ELkwnW04dDPZtq1ShA900i8EofCjEFpSZH8Z64zwJk0UixyT?=
 =?us-ascii?Q?NqUEwRZlcm9gtOmwK6RC0JMqZ8A50pcuhju7AT/O5vp/YPf0tnoKu9uqj5Rj?=
 =?us-ascii?Q?I9jJXBuk/vB2LRQEcYff58hhUtiFgJ4L2c4hhsO3kXXgb48raOmR1VhccP4c?=
 =?us-ascii?Q?D5MPdwfAjukmz9AxzcZih8AlMl132nE68zEEd98hCDXTNbZwvxi+iXUffr0k?=
 =?us-ascii?Q?LBfz3D2NJjuxNlFtRW4J5cXxdYdhAM6OUfg8X2briinE8Ho2wSDNcGHWPB1l?=
 =?us-ascii?Q?mJ4DEIIIYbhS8eQmLb0qg4N64b35J4Y7sutT3cbz9a4JFVdSrq101ldXHph1?=
 =?us-ascii?Q?KL24iJLo6hb52GWTKoO3683Gu7fubQ/621BKhiweC4lOe8gDRFYZOHI6k0e4?=
 =?us-ascii?Q?Xd+JIhRL6YTRejWpaP9HcVMYC+Yc5ttqtbZ1PUxUeHLa1AIk5Yk8fOBOAPhS?=
 =?us-ascii?Q?gpexPQwdN+kXc+whMG7j/I66FGR6LQe9gCuMAe0uz2HxAtIHS1tgMdGw9L3s?=
 =?us-ascii?Q?CbqtWsccgjcy08pd4hRQhaMDcGcdpdV81zoYgOqq4koK3vIXwGy6NEwW1100?=
 =?us-ascii?Q?buzg6nzDiQ0EPnxqZA3YEQ7sh8IuxUlrfsPnufbO6du6VmhgBy2vQLlqVP1Y?=
 =?us-ascii?Q?hvZ9WQSca2nS0DcNdCttPoU46POHSX8etSpfRV0/Bz/IsJrQu5St5HW9jcdW?=
 =?us-ascii?Q?uoGyPNPOOfQtOJXNOj//8+/dQl6IN6kF6Lw6dBxIKSbTju8xfsz36+KDREUN?=
 =?us-ascii?Q?OyImhiuVfStcXjzJKwM+jBzYPp4FnDhw/tsyjMXdga3P1vfti3SBgQTu+lrO?=
 =?us-ascii?Q?1jiwsrYvh2ae7Z9kgcX3yHDF0DpBjNnoqydYl1RjKdcJ1mSXBLvEYybWtJdP?=
 =?us-ascii?Q?t4NUbztgdYxltX1SW+H3UB5ddkXDQIGWRpy7DUf6Ess6ipz0iBDgMY9pRcut?=
 =?us-ascii?Q?LtPINhzTMFiZxZEozGA=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f27989b-7af9-4504-6205-08de1e24e9b6
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3613.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Nov 2025 17:41:42.4276 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xHC0Xj4NzkgSfdRGYKkQN2jyWzq/nvM3y+hI4aN6ieb6qvXEZrC3GdcBnWhN5NbT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8826
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

Reviewed-by: Kevin Tian <kevin.tian@intel.com>
Reviewed-by: Pranjal Shrivastava <praan@google.com>
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
index 899db4d742a010..559b12c3d67493 100644
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

