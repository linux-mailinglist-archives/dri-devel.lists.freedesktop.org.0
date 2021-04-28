Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70A9236DAEB
	for <lists+dri-devel@lfdr.de>; Wed, 28 Apr 2021 17:13:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1232E6EB66;
	Wed, 28 Apr 2021 15:13:01 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2054.outbound.protection.outlook.com [40.107.243.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15CFB6EB5E;
 Wed, 28 Apr 2021 15:12:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gnZd8NvAeHjqfxQi1jLz/XIZ9vqe4ApXTFKrPY4w8yKqICCzgEcI6iNGFoJmYBq+63aXqdZaA5tVdHeeMEEYxubRb+7xmpqWM13Wm0m9VuSvQbrh7xWjIq3aQxouaAxSXji/dgvfY3GL+uRH5bRi9CmHaocaX5fNs0vuq5kPLs3t2BW9wGPkdVx3+i68/9GonbGLLcgKuaZ79wh/7SlcO/NgNyHjg8JRcWTiaDmntMTusNE+S8uz1KeZlUPGcRD0J7+YqgSf6hFY7Q8wPago5OQGwKef1V7Eir91WjHA+pq0qj3qsShApWZu6Ym9RvtFS59ASpCKi+gOGj06V98rqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fwNW114xwpfVAQ+qP+cK3mFSQ+F24mN+PEGPdbDclLA=;
 b=H12fKSQJpjgeY00Yc53NQe4TRgGi96PFPSZwmDTmDNVpt97pPUW7EgvfJzpCXS/8AJ642NsAWlh+IURd5KHrMLSvm/Nye5c9PeKN1R4u5bGFy71IgZH2IbMiCoZNIFQ28TKkJgc7yxcnNPYwa1wNwY6kBiGVrJlPdmlf+SWdtfBlTncwwAgDHs4MhLN8smuZPEt49dIEdTqbIakgFIyx28pQZfmnHSkfSZmIXNC37sHrywnQhd908/c4m+a1ByQYIs9bfx9vmO/L8YzW3wkP3BFx4ZYbdkWEc5UVqzEFySSqgrelYOSmP/wKuuPZ3lL6v7YjICAgUrufX+upoZ/urg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fwNW114xwpfVAQ+qP+cK3mFSQ+F24mN+PEGPdbDclLA=;
 b=DKrQJTro5QSx+gR/LpNV3O4gZwkAdoCiUXOu0U5b/D17OI9uD26H+iBQJrj4+p8q/n7cZqKa9Omz5KealWP/BtwFJbJFishlz4fAWQI3eIgvMLMG7gNSb1yYnS3NtEw4ywA7wPL9Z1C2QVyW0p3Nhx3xBEQ5YaIOECTq/WF9izk=
Authentication-Results: lists.freedesktop.org; dkim=none (message not signed)
 header.d=none; lists.freedesktop.org;
 dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4623.namprd12.prod.outlook.com (2603:10b6:805:e9::17)
 by SA0PR12MB4462.namprd12.prod.outlook.com (2603:10b6:806:95::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.23; Wed, 28 Apr
 2021 15:12:46 +0000
Received: from SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c]) by SN6PR12MB4623.namprd12.prod.outlook.com
 ([fe80::ad51:8c49:b171:856c%7]) with mapi id 15.20.4065.026; Wed, 28 Apr 2021
 15:12:46 +0000
From: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
To: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 linux-pci@vger.kernel.org, ckoenig.leichtzumerken@gmail.com,
 daniel.vetter@ffwll.ch, Harry.Wentland@amd.com
Subject: [PATCH v5 08/27] PCI: add support for dev_groups to struct
 pci_device_driver
Date: Wed, 28 Apr 2021 11:11:48 -0400
Message-Id: <20210428151207.1212258-9-andrey.grodzovsky@amd.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
References: <20210428151207.1212258-1-andrey.grodzovsky@amd.com>
X-Originating-IP: [2607:fea8:3edf:49b0:7212:f93a:73b0:8f23]
X-ClientProxiedBy: YT1PR01CA0142.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:2f::21) To SN6PR12MB4623.namprd12.prod.outlook.com
 (2603:10b6:805:e9::17)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from agrodzovsky-All-Series.hitronhub.home
 (2607:fea8:3edf:49b0:7212:f93a:73b0:8f23) by
 YT1PR01CA0142.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:b01:2f::21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4065.25 via Frontend Transport; Wed, 28 Apr 2021 15:12:45 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 0e28a1e5-26c4-47b0-8035-08d90a581414
X-MS-TrafficTypeDiagnostic: SA0PR12MB4462:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SA0PR12MB44625DDDB9EC5590D63DF853EA409@SA0PR12MB4462.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7219;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lIZzwCh5j77X9qkgYGQRJpQddfnoVgJCBvAVE90nlwUnTE7rxXO8UIGiORCnO/qUEbxq6KvRthAuObeO+P3X+V8kxS9lP5/c0mXxDXMvXdaaMudAtBywnUGTUQbMMIi+UDZrVjQR3Y2lu+M1mc/xPl+nNXZ7jOMFbA2s26ZYrKvUSS89xiaDXoMFCx9s17teuE99yvYyfZbuaAmdBKsIc0bFOTsV9HF9fcQjUaQiyzlZtdZzHaXrreUh2jPjYmbEK2oGM7Le15HZWhgHayvfjJYe/svNADhulINWKaBH2P3HoQAOaUXmMxvQPBNScHyk+mf/u+ku2GiBQb2he7nZ+ILXx8JNKpJK/8cv4ZqUjCtH2Nab2qnn28nO/4C30Ozb2zu9RU03g+BD7g6dd47qrsr5GX0+MU/ICASZj7NJ361MeudN2MNvypLS1B8LiBX1TzXREqnwxqZzYg7EkKn4KC/Fd+K3z+lY3Ax6GRqVEqjLzaLoi1E461bn7sXcmQzQ5f5RVBvoRS6FPvPID2TY8TpgfQGBiJeuxxi1lCakwg7zDNdx5qS0LE4x1Spa3TDXuix3olbrxZe8/DXAW/0cxMPHCxucnNv2uTlRMVKMU+8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR12MB4623.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(346002)(396003)(136003)(39860400002)(376002)(366004)(6512007)(6636002)(66946007)(316002)(186003)(44832011)(2906002)(16526019)(36756003)(83380400001)(6506007)(4326008)(52116002)(8676002)(66476007)(5660300002)(66556008)(1076003)(2616005)(478600001)(86362001)(38100700002)(8936002)(6486002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?6+Qr+CoIlY80f2/WgIGSg4TbHBKBOX8GhU5zzcuXCcsiiUm8k6EAqXSDo49i?=
 =?us-ascii?Q?ClD1A605du4JNk6F0H8BcNj5qPk+VVhyuuDY66wF0iGzKBGkdYE/V4Znt0q3?=
 =?us-ascii?Q?0sSu2lw8H6lHSh6yVGfhZmgzg6BVDTZK2q7UTx75prMf1il2y6xBUGFeOp7h?=
 =?us-ascii?Q?F1glf1uGEtMzdHYtz0hg1iHQJ+UszLPtP+9ZZP8D5jYeTEpaXOC/UIfJ5GNP?=
 =?us-ascii?Q?nDuKbuAi3r2ykcAVBsOP2RAkLCCKE3HJ6Mz3nCNqQIOcnRxhAo6/xLi3czP1?=
 =?us-ascii?Q?oy769pm95hNHtqFlkjEQu9NkhYm5QwIvXWRpuB49sQgI49mftb8ST7YvEOrX?=
 =?us-ascii?Q?88RQOSn5Yf3AjCSapsCfZOwWD7H6g7l9ZjR/z7086Zi/2StqQW3Q20aSY+0y?=
 =?us-ascii?Q?oFT8P15uprSyMPVjlaD80CWZ1uhaFlv6zMySA4KsjHw7e8NX8srYMgAhfNSO?=
 =?us-ascii?Q?5SKO+ZM1HPaK/dImO0Me2ceyEFAZKRxmZRE30nUBx3paSv4FytGgDQ4SKFnG?=
 =?us-ascii?Q?UEuNyQfHl3Nhpx2+78YCGyPQRBw4oAZUMj6pLwry3Lq/dF431uqp4kLqfBKE?=
 =?us-ascii?Q?w+U54V/1UcaaRM8x0ago9Rb/+fbtlbpHzhurIl7MD4ahXiEoZUvEJfA5IpGj?=
 =?us-ascii?Q?0ouhfJfmtRAnW9gsZe2obDryDD0lEmTfuI5ha+NDLxdpygzHqd8k+/U8nJDq?=
 =?us-ascii?Q?e/LQTAElKyRrGc//wHAQY3U3k82iq9zOp+OTXeC61raotjFjzZPv6czYc1xc?=
 =?us-ascii?Q?mYA2NCswy/iAN2/OwrS/QO5sqjJvJWOmWYq8xrGG2a392tSj26i7Tqt7Knei?=
 =?us-ascii?Q?t2fYU5INxWe8Lle72Fj48SYocRv+KKrqtb+v/MFM2aJ1J7kGxEHxkjTogAMV?=
 =?us-ascii?Q?ID1fRz88nUDiTPr916/hHVeqn003YffgG+ahb3EOYl+tUiuCQ1Dwv/mcZRLU?=
 =?us-ascii?Q?Bm0jmr8rASWjxVeVwt8Ktp/ozLe4M9/uifFzPAwho3T1DH/IlkvJrVtkMKgJ?=
 =?us-ascii?Q?pxysD89M7ugIPmspipU71OxxePkCsUcg11kiKTlGSTYV9NWMu5qXsnEX+LlA?=
 =?us-ascii?Q?Zhs1yjxfCQc51H+X9HCeoqAHr27khIxHo3sSy6RUU05cn0Baptuz2OcBu+2G?=
 =?us-ascii?Q?/Q+MpKZwTaAo4Du8P6rPwJgpNMeqnB1WQahdPC+bXDyw1QhSlL7xFQHcpksm?=
 =?us-ascii?Q?Vy778Z8BkBtkyia1mHfyhmZ6ZIfurTQ7fU7mqRJSJuSQByo5t7qAT2kDBWm7?=
 =?us-ascii?Q?/gRitPTkV56NNRxtd2iFS673mxYV9hGNNu9QvRWpcKGCdlYleJXXFL+V5u3A?=
 =?us-ascii?Q?DHokU1HmU4DYaTqN2oFdoQKS2YoCo28YEuPF2W/xe1rC5tojK0xHEVeOsnkC?=
 =?us-ascii?Q?bJgpbXXwwuUHUMU7fUYBA0f7XPc0?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e28a1e5-26c4-47b0-8035-08d90a581414
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4623.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2021 15:12:46.1022 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m2RC56DNr3YZ57u7DGYhK8I4jkbDMhpLwf0UCZPvrnFnbRlp8TZsi5wdUPmTle1sVngD4lejRGEVWMgkCfUmwQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4462
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
Cc: gregkh@linuxfoundation.org, Felix.Kuehling@amd.com, helgaas@kernel.org,
 Alexander.Deucher@amd.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

This is exact copy of 'USB: add support for dev_groups to
struct usb_device_driver' patch by Greg but just for
the PCI case.

Signed-off-by: Andrey Grodzovsky <andrey.grodzovsky@amd.com>
Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/pci/pci-driver.c | 1 +
 include/linux/pci.h      | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/drivers/pci/pci-driver.c b/drivers/pci/pci-driver.c
index ec44a79e951a..3a72352aa5cf 100644
--- a/drivers/pci/pci-driver.c
+++ b/drivers/pci/pci-driver.c
@@ -1385,6 +1385,7 @@ int __pci_register_driver(struct pci_driver *drv, struct module *owner,
 	drv->driver.owner = owner;
 	drv->driver.mod_name = mod_name;
 	drv->driver.groups = drv->groups;
+	drv->driver.dev_groups = drv->dev_groups;
 
 	spin_lock_init(&drv->dynids.lock);
 	INIT_LIST_HEAD(&drv->dynids.list);
diff --git a/include/linux/pci.h b/include/linux/pci.h
index 86c799c97b77..b57755b03009 100644
--- a/include/linux/pci.h
+++ b/include/linux/pci.h
@@ -858,6 +858,8 @@ struct module;
  *		number of VFs to enable via sysfs "sriov_numvfs" file.
  * @err_handler: See Documentation/PCI/pci-error-recovery.rst
  * @groups:	Sysfs attribute groups.
+ * @dev_groups: Attributes attached to the device that will be
+ *              created once it is bound to the driver.
  * @driver:	Driver model structure.
  * @dynids:	List of dynamically added device IDs.
  */
@@ -873,6 +875,7 @@ struct pci_driver {
 	int  (*sriov_configure)(struct pci_dev *dev, int num_vfs); /* On PF */
 	const struct pci_error_handlers *err_handler;
 	const struct attribute_group **groups;
+	const struct attribute_group **dev_groups;
 	struct device_driver	driver;
 	struct pci_dynids	dynids;
 };
-- 
2.25.1

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
