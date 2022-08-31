Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD465A8966
	for <lists+dri-devel@lfdr.de>; Thu,  1 Sep 2022 01:13:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C56C10E530;
	Wed, 31 Aug 2022 23:12:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2040.outbound.protection.outlook.com [40.107.237.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC77210E532
 for <dri-devel@lists.freedesktop.org>; Wed, 31 Aug 2022 23:12:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TeqOLUCESowoVd/if+CxC3rlSKbfWx+dAp/ltGaRjLZ0h4wZdpq1grVleGUe4dHA014Jk2BSrbVX+TG1Ickb0XnshpGoYPp6sXURfyPwC2rpodsFTr1OuuXJXezsI0sH4EQhpYWIVJCt/Szk1I9SpxVI9Iiasp9yIf6manqh3uFnAZdVpPHKFylNOzrNHO/1w/uDxqlvIljaRKYSLYQB6avER/MIyhhjuuv4KWeVqR0Ihons/7aNsrTetF+gQmMFj4uUMXWnPL7BnzIorL0cFpySbhdcx1IN5Y2APha54qBwIfA7dVaUEL+Xnezl4D3sO2RbTy05VamJwoeghY2oGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=z/6rbubLVDxVZJcotZ/eUCpfQERM89cbqN7lY3YK9CU=;
 b=fsWn9tapkbfT3rc54VqwXgqKNd7G1C9uQux/N+39CkNfqmdKxCmggKK9aN9TFsqEC6pwK3rrnY0oWLtJUwbKD6eff6HQVnDNn5fS8oTwSL1SNPNzDx1zSaIKkKgrgoO6FkPT0Kh1N0ROFD9SLCuOLWlmEgz0v1p+IE0ILeI2yuw+HPe8gjnfLzwZYVuXYwCVtHJjNcKvxdSmHwT7SKtmhLIT/+bTo++xJ1KPxLKc2urKjwbP5NHtbcdpGc7NGqdKbaRsIPo4aKVFWOj9ZcBSz4AJ3dfycUidKmlXvU7HgxZRv2wjWmERqDzBbdQOJKOv8PSXUWBjuikOLKoFDxhVpA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=z/6rbubLVDxVZJcotZ/eUCpfQERM89cbqN7lY3YK9CU=;
 b=erNTCBZSPiJYdSThDQgZ8MeO9SYGuWXKu1Su6CXJUIkzgsdCRvhLvT6/SIP3y8n5BbawAEZa2aU8Tb8RGfOfLFf/ZjHm8dJOVBUm2aQkIL7N33OS7kJxNsBikjkefrH7vcd6hiXDzxjW0me/B6Zsm2rT3WikErIikbHgrcdgKjpLzACgooPorrHIbirUU+B6r1ZiUWoltx2zlL9D+4G555yhJ/AdKRKk0vAuIY65hRqKEKxpuRBdhyIpdAeFDRz1JvwWOcZ+a3Ja0GDnNJB1EwZk7b1F6dED/nPz3G5svIZkvkWE9YrOfU5z/IVcIWeiVAViUWtKih19nD99hQipaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MN2PR12MB4192.namprd12.prod.outlook.com (2603:10b6:208:1d5::15)
 by DS0PR12MB6535.namprd12.prod.outlook.com (2603:10b6:8:c0::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Wed, 31 Aug
 2022 23:12:46 +0000
Received: from MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::462:7fe:f04f:d0d5]) by MN2PR12MB4192.namprd12.prod.outlook.com
 ([fe80::462:7fe:f04f:d0d5%7]) with mapi id 15.20.5588.010; Wed, 31 Aug 2022
 23:12:46 +0000
From: Jason Gunthorpe <jgg@nvidia.com>
To: Alex Williamson <alex.williamson@redhat.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Cornelia Huck <cohuck@redhat.com>, dri-devel@lists.freedesktop.org,
 kvm@vger.kernel.org, linaro-mm-sig@lists.linaro.org,
 linux-media@vger.kernel.org, Sumit Semwal <sumit.semwal@linaro.org>
Subject: [PATCH v2 3/4] vfio_pci: Do not open code pci_try_reset_function()
Date: Wed, 31 Aug 2022 20:12:43 -0300
Message-Id: <3-v2-472615b3877e+28f7-vfio_dma_buf_jgg@nvidia.com>
In-Reply-To: <0-v2-472615b3877e+28f7-vfio_dma_buf_jgg@nvidia.com>
References: 
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR10CA0035.namprd10.prod.outlook.com
 (2603:10b6:208:120::48) To MN2PR12MB4192.namprd12.prod.outlook.com
 (2603:10b6:208:1d5::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4817c742-1f29-4ed9-576c-08da8ba65026
X-MS-TrafficTypeDiagnostic: DS0PR12MB6535:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rf2f2pLLdflDTOtQBuKO3sznnIIYeMovzmTT40qmxvDyx8hPGPu7yBuPTWtmueUOnrtzvMR56FhAcE4wt3cF266/JnvugVYqd9RaqZ5wC+O07MMx4BMwgvqqkYDZNiuju0ENH0xGAUFu0n+3iK+KB0JLY8JdMVZ9Pb02MQD2CQe3NxKBSe0uKlhgQqNFqpJjRYfzdTFT/c2alki6i2JyWXqoQW5OeSAfoMeaWNDY9kXftahgbIK0+25WnF3805cVNDZh3bPeQ/Au3/DB8qqKd7f5QU3h++DbVvspCP/cIyTGjIhQCM/gPxdubzxZjvLKtetuTczVApPLueRxw8r7/9ZILvp2iT3VO6SDfJ9WQuR4EJWZTBXUk7lGKhk3p0qYPSj/QcyS0jagHwoEhxHa3INa379pgY7iXsZrohBuboHlI9mz0YgjFZ/przPQ/ByLfPCu0lp6kekpa6fNsK+iyCG7qAKqhnbH1dyYQg36UL7I0RNzXTZumoRJLb8GEjXZViuFg3IXTAZ1igPteBPsQodtSCCwYRWKQpokjOBbNimu+Dh3xIPrtLp3+ZNX/dA4tI9FzBbH6uBsviiT1jWWQM+/2Hx1lA9BJKi7g+vHLzRN9Qv+kfNfLM1EKp8GzOAO+zyOtqAZsF0Fcftzk+B/oFNGaxgSjlqMdMLe0fceagd3obQ4zz0ExCy0kAtVtqZdt/Hx+PghxlJOmrwUA25adMIZzd5Ff/LsqF7ALj+SK2rlHBngNS3pkM/IlhjySFqp
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4192.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(136003)(396003)(39860400002)(376002)(366004)(346002)(186003)(2906002)(5660300002)(8936002)(7416002)(6506007)(2616005)(6666004)(6512007)(36756003)(6486002)(86362001)(41300700001)(26005)(478600001)(38100700002)(83380400001)(110136005)(4326008)(316002)(54906003)(66476007)(8676002)(66556008)(66946007)(4216001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uWPQE/eFrIq+T0Q6c7G9hUyTE+WgExvQy09M40l7gF3MaSXRpPdgsvlfzyqr?=
 =?us-ascii?Q?x+VKdSZwXpLJKAOo8Za7q1CLDpeNaC/ugfT7gz1iAvJBRkkW23r4LgRNgVbq?=
 =?us-ascii?Q?nPmAaALvd0GU3Ma0hFBTgpWX4ipMFSEaeQlCN1E1x5Nvq7jD9mQPKS6yLb8d?=
 =?us-ascii?Q?ye+6VTHtkdz4OFb1+O/Nspp+13LV84Pn8OFd82S6kf36JRJzEEcwYgwlyCiR?=
 =?us-ascii?Q?HZoX5Qbw1S6L+cCYacXwbADaIGRtY4JjobSulszd8bL+3eRkoszAZ4RqVAvR?=
 =?us-ascii?Q?vuSvfCyfu7/N7GXBnaNDkFP+YPZMJwm+Mt2G7PIdmAQ8m2qN2PZWe6F46xkM?=
 =?us-ascii?Q?bywGmiLUILpiz6fh5HDVFamRAJJChLoAXYK9lvO0mHi4HfCZWQUH2VQZmeUS?=
 =?us-ascii?Q?18mONfSCq26RugYwzB58wzKRP2qXTpQFSZbYN3QFKY931tYV/EIcWDW7VAWy?=
 =?us-ascii?Q?e0kMtrG27+5iZtXdqxgWGfvjuqdB/QA8YcjrzpLJmrkr4cSEoa+M9kga1m1z?=
 =?us-ascii?Q?geDc7o/os7ZF/fdX/h9OLoGRnYslrKK59nHCGD9Z+DMKCYteGh4jSKM5fDnh?=
 =?us-ascii?Q?ly+mocctfptSW4MQgzWo6Fkaup871S0cfFri9UevU9MTNXeui8fdNOJGrbUW?=
 =?us-ascii?Q?Bpy8XY/UTlwGofAvvD6tCAv2emX7gCyfwX+hBvmpytXG3skaJXiatAF/tL6u?=
 =?us-ascii?Q?zywnIg96AZX9yINK60t39I+1Fv8E94T5HXNCyi6tErW6ZlZDshRwBULTGsrB?=
 =?us-ascii?Q?Z+2vBM3WVv3gCVFUrA3lEFlOmwH+tNV+twdpNynbmy+iTnUyx85GsYtrNmQt?=
 =?us-ascii?Q?Wu5gNfSB3WBRZ+b0vBnUBVj2+vZxoT/7hV4yOKOfZ1bB41asXHHMOH0Mmit8?=
 =?us-ascii?Q?FULYkb2o2XDHAG0se8lY8perYgdovBfYa1bOnHo10J+j6/breaVEakCE9RYA?=
 =?us-ascii?Q?aui7Mnzj+5GD76DjjhKvZlO5Lz6DBm7n3ljH6/6B1SDbld9BHjtmou877ef0?=
 =?us-ascii?Q?BDKEiGsQCZPh0v5kGKl4vkD43U20K0U3fquT1lpqmHy2Qm3IDVnV3shVmJfk?=
 =?us-ascii?Q?xqzCeR83c0RHx1iSVbM2WyKGpt4kOdpRK4fc775tIPpYm9UhngXZeWhvgL++?=
 =?us-ascii?Q?N0yAhr+gD2ZHxdLe15ymradE65+aVyQgLIXD6IbDTJBbWAbbbIcm+v6ZDnwF?=
 =?us-ascii?Q?44EWmDXgFMwY+87QHT2ZM8nQ0lFrC0I9fL7J1up0BOTbx98PrIXzgOGyiF8L?=
 =?us-ascii?Q?u/ZqWqJEe2AE4tTAUB9NQnengYnBqkPgQQLueF7uE+8Log/+VSng8TZzq/o1?=
 =?us-ascii?Q?AGXMLQI4o/cXdfXFILfkY7LFbKv4mZXY8AuzLsxeLEKtjijQAUbgGL0ouN4u?=
 =?us-ascii?Q?+LtII6cmrmoE6XZ4YjSF8AzlbyZOVH7Z8Kj4R9BmFe5XkgZZ4aNPIsEjrmfU?=
 =?us-ascii?Q?mX2wsG//ql8yu9dGXrBLfuIZkNyKL4nT4Nje2B8KNejv7lmbFCGjOsT+gC5Q?=
 =?us-ascii?Q?0HwIyNRgd/o1wpBnp8GJjh3RzGvTCXGLgn5KZvy2l/2uC5/98P16Q9mpeR0X?=
 =?us-ascii?Q?L8GsvUsybQNUAl/nG1IwpdoeC4T53lZCk7aurFDy?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4817c742-1f29-4ed9-576c-08da8ba65026
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4192.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2022 23:12:45.3586 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fDooWtpdc70DHJ4gM/0i2RBZFVblqtc1Plh2CLj4szJOHZ/FVhuBfWmpOLNMXtgt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6535
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

FLR triggered by an emulated config space write should not behave
differently from a FLR triggered by VFIO_DEVICE_RESET, currently the
config space path misses the power management.

Consolidate all the call sites to invoke a single function.

Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
---
 drivers/vfio/pci/vfio_pci_config.c | 14 ++++----------
 drivers/vfio/pci/vfio_pci_core.c   |  5 ++---
 drivers/vfio/pci/vfio_pci_priv.h   |  1 +
 3 files changed, 7 insertions(+), 13 deletions(-)

diff --git a/drivers/vfio/pci/vfio_pci_config.c b/drivers/vfio/pci/vfio_pci_config.c
index 4a350421c5f62a..d22921efa25987 100644
--- a/drivers/vfio/pci/vfio_pci_config.c
+++ b/drivers/vfio/pci/vfio_pci_config.c
@@ -893,11 +893,8 @@ static int vfio_exp_config_write(struct vfio_pci_core_device *vdev, int pos,
 						 pos - offset + PCI_EXP_DEVCAP,
 						 &cap);
 
-		if (!ret && (cap & PCI_EXP_DEVCAP_FLR)) {
-			vfio_pci_zap_and_down_write_memory_lock(vdev);
-			pci_try_reset_function(vdev->pdev);
-			up_write(&vdev->memory_lock);
-		}
+		if (!ret && (cap & PCI_EXP_DEVCAP_FLR))
+			vfio_pci_try_reset_function(vdev);
 	}
 
 	/*
@@ -975,11 +972,8 @@ static int vfio_af_config_write(struct vfio_pci_core_device *vdev, int pos,
 						pos - offset + PCI_AF_CAP,
 						&cap);
 
-		if (!ret && (cap & PCI_AF_CAP_FLR) && (cap & PCI_AF_CAP_TP)) {
-			vfio_pci_zap_and_down_write_memory_lock(vdev);
-			pci_try_reset_function(vdev->pdev);
-			up_write(&vdev->memory_lock);
-		}
+		if (!ret && (cap & PCI_AF_CAP_FLR) && (cap & PCI_AF_CAP_TP))
+			vfio_pci_try_reset_function(vdev);
 	}
 
 	return count;
diff --git a/drivers/vfio/pci/vfio_pci_core.c b/drivers/vfio/pci/vfio_pci_core.c
index 9273f1ffd0ddd0..885706944e4d96 100644
--- a/drivers/vfio/pci/vfio_pci_core.c
+++ b/drivers/vfio/pci/vfio_pci_core.c
@@ -960,8 +960,7 @@ static int vfio_pci_ioctl_set_irqs(struct vfio_pci_core_device *vdev,
 	return ret;
 }
 
-static int vfio_pci_ioctl_reset(struct vfio_pci_core_device *vdev,
-				void __user *arg)
+int vfio_pci_try_reset_function(struct vfio_pci_core_device *vdev)
 {
 	int ret;
 
@@ -1202,7 +1201,7 @@ long vfio_pci_core_ioctl(struct vfio_device *core_vdev, unsigned int cmd,
 	case VFIO_DEVICE_PCI_HOT_RESET:
 		return vfio_pci_ioctl_pci_hot_reset(vdev, uarg);
 	case VFIO_DEVICE_RESET:
-		return vfio_pci_ioctl_reset(vdev, uarg);
+		return vfio_pci_try_reset_function(vdev);
 	case VFIO_DEVICE_SET_IRQS:
 		return vfio_pci_ioctl_set_irqs(vdev, uarg);
 	default:
diff --git a/drivers/vfio/pci/vfio_pci_priv.h b/drivers/vfio/pci/vfio_pci_priv.h
index 58b8d34c162cd6..5b1cb9a9838442 100644
--- a/drivers/vfio/pci/vfio_pci_priv.h
+++ b/drivers/vfio/pci/vfio_pci_priv.h
@@ -60,6 +60,7 @@ void vfio_config_free(struct vfio_pci_core_device *vdev);
 int vfio_pci_set_power_state(struct vfio_pci_core_device *vdev,
 			     pci_power_t state);
 
+int vfio_pci_try_reset_function(struct vfio_pci_core_device *vdev);
 bool __vfio_pci_memory_enabled(struct vfio_pci_core_device *vdev);
 void vfio_pci_zap_and_down_write_memory_lock(struct vfio_pci_core_device *vdev);
 u16 vfio_pci_memory_lock_and_enable(struct vfio_pci_core_device *vdev);
-- 
2.37.2

