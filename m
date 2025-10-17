Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20C2BBE6784
	for <lists+dri-devel@lfdr.de>; Fri, 17 Oct 2025 07:48:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57DBA10EB0E;
	Fri, 17 Oct 2025 05:48:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="GwbUIRYb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010070.outbound.protection.outlook.com [52.101.56.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A149E10EB08
 for <dri-devel@lists.freedesktop.org>; Fri, 17 Oct 2025 05:48:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EOy8qUB8YSDaSx0Nk7SlaYIiDMM7t2axZi0J+hR1H0oH5mQUnTkwgRZF/1WGkcKXWQ2rtXUsx3PErg4YHVwUGJP19zKMvfpt/YNR/NRhEhgmyjI9UeJCMFEWMSk1kMaE48Gwk6x9Ot10CQ1Td65N2JrWk0ysV3RCWqxFN3hA6rHcc+/5v6mpfS7kDABJaD6b24uR191W7KjAUkdVi0aGOIaydJ636BTLVypjrqMe3NHew0CqrZ3OL334ZSAII6IjjjIOoR6TVFRrQLNMmsFj9rQAl2IYMFmfhl5kx+NHCVd9G0a+D6YkiL71lsbypmWAwt6S6jn4vuP1q/XAoOCr2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3U6CEQOMwbEjx/83Zb1aeRULO4BlDlu85im07zmMw6s=;
 b=k55bn6QSN+xC9umCnwNA4GbvkwoPhijsL8vDnQmEQoRHqlsuA6DEcKTEgg3qaECds54xU/HlV3gJYx5NIzAH6Qs2kEAFYCp0Gy+Ou+dvYYYq4bZeI+VeCjxVNEBt/0L6NHXkvcPDnTuKw8Yxb7MbeYLVvzOStJCVZwr8o1Me6Oe3mZngdklc8/3hfXnXyD49yysrsi7YuMwKuvKX3NSDk8pmYJ/YZeYarbk5Q871Q+MmzLNAuaGxn4EAH7KqCB17S//FGvk6L0FFy4aDHgWlLvGMLxSAYK7tsJf7eDvV1vPOeix9ui5HkXOh0hI53rw4mZOyU2SdKrWqy9AZwvteTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3U6CEQOMwbEjx/83Zb1aeRULO4BlDlu85im07zmMw6s=;
 b=GwbUIRYbRQAlmcM6LcohWc4t1/Iu/l5dv2Oe2AVkCe1XruxAZHk79/AtUoP+eI5vO2399ecTwUV0j5v9MaU40NwewMU/Q6s9z4vRn0bpa+qrdOr0WD0Tue+RNQe8ao/14ZWM7Fp9zk3i6yoNJ7+rc6UnkLdghjojVh8I472WD/RoTyJHt1fRFtQ3XNSTKeoHHgvKc946b3I6ITTSG+mCNW7HMyTUEfAJOkiwyiKHp1RzQk+u1qs9lyixh+wYlLnoLeZV0DywUnbE72ZUsKsseT55Lwx1WdOBVvKax+wZ41Gjf4kP7Tchq3ca7G0vy4tFSHCTm0neNQAGlL210livBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 PH7PR12MB7819.namprd12.prod.outlook.com (2603:10b6:510:27f::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9228.12; Fri, 17 Oct 2025 05:48:26 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9228.012; Fri, 17 Oct 2025
 05:48:26 +0000
From: Alistair Popple <apopple@nvidia.com>
To: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>,
	Lyude Paul <lyude@redhat.com>
Subject: [PATCH v6 08/11] gpu: nova-core: gsp: Add RM registry and sysinfo
 bindings and commands
Date: Fri, 17 Oct 2025 16:47:33 +1100
Message-ID: <20251017054736.2984332-9-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251017054736.2984332-1-apopple@nvidia.com>
References: <20251017054736.2984332-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY6PR01CA0096.ausprd01.prod.outlook.com
 (2603:10c6:10:111::11) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|PH7PR12MB7819:EE_
X-MS-Office365-Filtering-Correlation-Id: fa6df8be-7ccf-40d3-cf1d-08de0d40ca88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8SQ26eOqikmrOidvEwmF+8fgjUE3+Yskes31plgi85Ie/Cl7pveaeuiH+M6I?=
 =?us-ascii?Q?KSZvw3Ag+YtffKyhLRAPuOj5CS8MnLEcuuLiX+GvfgI+aYalttdTMqUo4luv?=
 =?us-ascii?Q?k1NQmG3dJ+c/uJSL67WphyYyyaPJAG/F03N1NFCnfA2ITUvR7SPN4AO4CV+N?=
 =?us-ascii?Q?4T0qmelFjzrSWB32r62+qL2YtuSPVyAZ1QR7YOzerEC93jW0lnqbyvi+uQhR?=
 =?us-ascii?Q?li38lpmpxKq6x3OM2RnAhmYNZH8my72r+Boxnyc9D6e0KDgKpLcE5BXYTkPZ?=
 =?us-ascii?Q?8STi1+fTZ2/2QT5AkSpcztUKyYCZNMKx1opvG7L70CaoxTDe1yfxWxsHiYJH?=
 =?us-ascii?Q?9vBSRYrlmKd+C5mLQw3+VlJM/vlGklFUiw7Cma2Km+0rC/5gZdpBJj9dZLlG?=
 =?us-ascii?Q?k+LthcK5EJUKkq1f662svlnQZWvGLqwvDUDXsGsGCGlckwDihi1aWKY6wpZU?=
 =?us-ascii?Q?dVulrvK3BkA+/s6U05V1izgBPzg5wyDqcRUoKUodR95kKKIXjYB2ZCyF/FRz?=
 =?us-ascii?Q?aV/pCe68bk2qQPWTVD3L/MKZtQBZuG5d4r2gweilveJNtrLIdL7ae6+O7ELd?=
 =?us-ascii?Q?26YVSQ9xC/1kuch/OuK0avlgPv4mLuhCrIDa/m9NVjnfhjqm+qEjNAE1JVD8?=
 =?us-ascii?Q?KFt0wgwfBoaev9tSIX2ooyk745OzquW3/QuUGA71dhEqRd26Lk1LBgFzdDvS?=
 =?us-ascii?Q?8DgXYk4eSk3lfZi1QMVzPStHOh6SGoD/fxnvUDUKjMGfXXp0F/bq6UVOYQ6l?=
 =?us-ascii?Q?WCyOtqw3pdBlh83UkjiVjyZmMLpHUvOTEuLjY+NysNX5YmvjAnIxGbkwBrcb?=
 =?us-ascii?Q?jL1B9Ks+pzsiyqC8XBb1K0Qd1Ev5Y/W/AT3gNt+Ol69s/PoLRVLQ2ZkrATjZ?=
 =?us-ascii?Q?kiAoDS7SRl+d8NafmNF4eDimjEmoa267b6oCOQvuWSqb2bJ9QVsqX51mQetN?=
 =?us-ascii?Q?OlWq2ohUKj2KFM3Q7wWSAk4aDQ/46UaJl+3AyHavKZL8Kg8aQbO+zPH1DmHZ?=
 =?us-ascii?Q?angfXbdlIwcgyCdTB6h4IYEcvsHj1WthnxdAL76xaV+QpddM7HHzg0o5+3VB?=
 =?us-ascii?Q?y+uwhHVKQwip7gzkN4GZ+PwhcrZ3ADvCvl/rCYVoAmvFrA9G+wYbFmGpnizj?=
 =?us-ascii?Q?IBbEYd9XKZCI58xxDPc1VuoIwdDiy5LGD/Ma1Hgmddt9oedhl+Iw4n9kcrya?=
 =?us-ascii?Q?y2B/wFoKz477hnz+ODjOgppkJBzLeMm3rh/V5v0X1+hh17a0v93y4/HeDbUN?=
 =?us-ascii?Q?hEhPiZ/ZCILEyxG6nf2QgMzRylw6Hq7SRcTjLPdQfx+0d4WR+gw14mgD8vK4?=
 =?us-ascii?Q?1LBrbG399TY8rtsMoTRgt9MVogMrpC3+JpENj+eCR23xvKiQNHVGd3rwSrdq?=
 =?us-ascii?Q?x+FxFdZNMHLqL7UpbAdRKFi74kUYbkcpWnIIzzttfRVif4PTKUfWS6vyjaKG?=
 =?us-ascii?Q?l2bBwg53r2071PJlwVCLTvPPARSVJQp6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?N0QH9gOcskZlU3BhiaOxMbzfRNE6zQa88G3Aqs4BQ2t7LTViwzMxVAehHjgG?=
 =?us-ascii?Q?jFR94n1os4SQc8ZNyuVNMblHQN+Wo6MW06k07FIpponirGC7DarusrBOJoib?=
 =?us-ascii?Q?F+rbpKILZgpUZpIq/aygMPsiUTQHwEMUB5UDMsGbqqMercDXZ2ai/Q3+7NOw?=
 =?us-ascii?Q?Qjq5/Bl3uZwuAm9pmDUnFlKwTtX4quUHFQrOm+3xuGH7tk9CSJKpgpNxqFbb?=
 =?us-ascii?Q?AzgQ6U/13pMxBVFQ4A41HxWaCBNefcc4TNcedUGcDh3tYDqFquxwF7QDfE5y?=
 =?us-ascii?Q?OquMqaMLc855EhFPglZS3dfDFJORxv1TcBREE8n5GLEWcCTOQzyr+5GJMJCB?=
 =?us-ascii?Q?xouzsOxdbS3sxFvQsTq4ipOU1y9GjWV5aZHlgFdieAjUwn/nz68wKjssb6gc?=
 =?us-ascii?Q?AZj685j17uiLUxPvA9731mISd2PtX1vv6wBTM39bJKxUzDqz/P902jCFMDgV?=
 =?us-ascii?Q?ODuftLEHEZJnFuwMNnxbD5E/XuZkEn6j/o2+1gOi49vrC379owztjhfBWk+I?=
 =?us-ascii?Q?1diuRFgyUc29AhP/Q+LT+ACZqto3xTRtWrPGMIjnRIfhoc4ngiF8LMTdIeqC?=
 =?us-ascii?Q?ZRqtHl5bCwhsDuwgBf9uD9gvFKq8BIQi4jl1KBa2yV6qyIbMUtHo/2N54IEi?=
 =?us-ascii?Q?vZPBZEf2A5+rdd/1VhQOhr67o18r1iUhj22rXaK8JjVNjBL8Zom/6StHL5ZT?=
 =?us-ascii?Q?VMCna1PLqKBnNK8PgysYLguZaTmWoXeb/qADHdTyu7JWuGF3lV6y4a1VZMZG?=
 =?us-ascii?Q?l7nBdHYFxJvZMUWsS1l9126QKu+iYL/U640t4aKgVLqSgA6eERol96aDpr1O?=
 =?us-ascii?Q?rRO8IdOhEMapHUnjMoQJ2uozmaw9DK6Co6rONB0g5+P7gB85Tqa+7ExzTafI?=
 =?us-ascii?Q?4ATh1NSRYkctCxEn0+ghsB4qWYrvqFNbk4NvVev7mEPKk/C6zoiDAtMrKLHR?=
 =?us-ascii?Q?H8pj5vbVYBYYyhksv4aAhIl3ulKBWAOqkRJPJ+QAbfh4TbpO8xSli0fVT6Sx?=
 =?us-ascii?Q?jP5DJB2Y5+Md+jTnVRyM8TWjRSfN5ypvZwkD2tClztJ1xerysYgty8wbPKlH?=
 =?us-ascii?Q?qF3exsBww37z947LVupH7Pm1sHTJPr4xPqtpWQN+4nw//sxT2K2ByucLyBTL?=
 =?us-ascii?Q?UmgkBvr5aNJzOxN3p3Ct57ZpvD+jlNE4Tha6kObDWMcekB4tWPTbCfMeHTmI?=
 =?us-ascii?Q?kpISvQl1NP/mN2AlRa2TPRvaraYUO6kPjHRkQ3RetW3VN5SWKE39IXWkfkII?=
 =?us-ascii?Q?CSa895gRRKR+oWcroRL3qe/OgT7vkj4eq9D5nGq82O4JU5vgUnd6kzxugLsT?=
 =?us-ascii?Q?GUJyot6cdi5yc8fBIK9H9iCYJN2BeZK+/ZHNPwjR1DH9D7+eTRo9m2oNp+ML?=
 =?us-ascii?Q?d+899Ug1gcpGc3+I9WdEhuZ74HvhU/cY+GALWgg01G02tJHhaoTJXSlpmNlu?=
 =?us-ascii?Q?yknF/LiMJFZMCOL9zAHfPze7QXNwdwpaJMoMYoZbKl9i8z6RwOb8+S8DTBHi?=
 =?us-ascii?Q?xiNrdQskw9KYvvxecmcXsihG4sm1lXeGnlFrQGLpo/7l/4f/jhV+k9UsH3cC?=
 =?us-ascii?Q?bF0zHw3tNv2InkD76zdXK0Tby18CLGv6P9MBXnL6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa6df8be-7ccf-40d3-cf1d-08de0d40ca88
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 05:48:26.3795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: En7ftwtIU5jcQ39cc6g2yd5HH1AVVL9TcDOrbC5UPdJLE/Pmmyiq/u9RW8RcCWvWu9uxcCJOrnhSGgcFlVv7Fg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7819
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

Add the RM registry and system information commands that enable the host
driver to configure GSP firmware parameters during initialization.

The RM registry is serialized into a packed format and sent via the
command queue. For now only two parameters which are required to boot
GSP are hardcoded. In future a kernel module parameter will be added to
enable other parameters to be added.

Also add the system info command, which provides required hardware
information to the GSP. These commands use the GSP command queue
infrastructure to issue commands to the GSP which is read during GSP
boot.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>

---

Changes for v6:
 - Merge the bindings in to address some unused linter errors.

Changes for v4:
 - Use `init!` macros
 - Update to use send_gsp_command_with_payload() for the registry
 - Add RMDevidCheckIgnore registry setting (thanks Timur)

Changes for v3:
 - Use MsgFunction enum
 - Rename GspCmdq to Cmdq
 - Rename GspCommandToGsp to CommandToGsp
 - Rename GspMessageFromGsp to MessageFromGsp
 - Split bindings into separate patch

Changes for v2:
 - Rebased on Alex's latest tree
---
 drivers/gpu/nova-core/gsp.rs                  |   1 +
 drivers/gpu/nova-core/gsp/boot.rs             |   6 +-
 drivers/gpu/nova-core/gsp/cmdq.rs             |   2 -
 drivers/gpu/nova-core/gsp/commands.rs         | 117 ++++++++++++++
 drivers/gpu/nova-core/gsp/fw.rs               |   1 +
 drivers/gpu/nova-core/gsp/fw/commands.rs      | 100 ++++++++++++
 .../gpu/nova-core/gsp/fw/r570_144/bindings.rs | 148 ++++++++++++++++++
 drivers/gpu/nova-core/sbuffer.rs              |   1 -
 8 files changed, 372 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/nova-core/gsp/commands.rs
 create mode 100644 drivers/gpu/nova-core/gsp/fw/commands.rs

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index f08bb0924edb..73576558815a 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -21,6 +21,7 @@
 use fw::LibosMemoryRegionInitArgument;
 
 pub(crate) mod cmdq;
+pub(crate) mod commands;
 
 pub(crate) const GSP_PAGE_SHIFT: usize = 12;
 pub(crate) const GSP_PAGE_SIZE: usize = 1 << GSP_PAGE_SHIFT;
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 6959581c538b..592c9b37e852 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -16,6 +16,7 @@
     FIRMWARE_VERSION,
 };
 use crate::gpu::Chipset;
+use crate::gsp::commands::{build_registry, set_system_info};
 use crate::gsp::GspFwWprMeta;
 use crate::regs;
 use crate::vbios::Vbios;
@@ -105,7 +106,7 @@ fn run_fwsec_frts(
     ///
     /// Upon return, the GSP is up and running, and its runtime object given as return value.
     pub(crate) fn boot(
-        self: Pin<&mut Self>,
+        mut self: Pin<&mut Self>,
         pdev: &pci::Device<device::Bound>,
         bar: &Bar0,
         chipset: Chipset,
@@ -139,6 +140,9 @@ pub(crate) fn boot(
             CoherentAllocation::<GspFwWprMeta>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
         dma_write!(wpr_meta[0] = GspFwWprMeta::new(&gsp_fw, &fb_layout)?)?;
 
+        set_system_info(&mut self.cmdq, pdev, bar)?;
+        build_registry(&mut self.cmdq, bar)?;
+
         Ok(())
     }
 }
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 5589bb333c16..2938706d7e38 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -330,7 +330,6 @@ fn notify_gsp(bar: &Bar0) {
             .write(bar);
     }
 
-    #[expect(unused)]
     pub(crate) fn send_gsp_command<M, E>(&mut self, bar: &Bar0, init: impl Init<M, E>) -> Result
     where
         M: CommandToGsp,
@@ -342,7 +341,6 @@ pub(crate) fn send_gsp_command<M, E>(&mut self, bar: &Bar0, init: impl Init<M, E
         self.send_gsp_command_base_with_payload(bar, 0, init, |_| Ok(()))
     }
 
-    #[expect(unused)]
     pub(crate) fn send_gsp_command_with_payload<M, E>(
         &mut self,
         bar: &Bar0,
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
new file mode 100644
index 000000000000..338d1695027f
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -0,0 +1,117 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use kernel::build_assert;
+use kernel::device;
+use kernel::pci;
+use kernel::prelude::*;
+use kernel::transmute::AsBytes;
+
+use super::fw::commands::*;
+use super::fw::MsgFunction;
+use crate::driver::Bar0;
+use crate::gsp::cmdq::Cmdq;
+use crate::gsp::cmdq::{CommandToGsp, CommandToGspBase, CommandToGspWithPayload};
+use crate::gsp::GSP_PAGE_SIZE;
+use crate::sbuffer::SBufferIter;
+
+// For now we hard-code the registry entries. Future work will allow others to
+// be added as module parameters.
+const GSP_REGISTRY_NUM_ENTRIES: usize = 3;
+pub(crate) struct RegistryEntry {
+    key: &'static str,
+    value: u32,
+}
+
+pub(crate) struct RegistryTable {
+    entries: [RegistryEntry; GSP_REGISTRY_NUM_ENTRIES],
+}
+
+impl CommandToGspBase for PackedRegistryTable {
+    const FUNCTION: MsgFunction = MsgFunction::SetRegistry;
+}
+impl CommandToGspWithPayload for PackedRegistryTable {}
+
+impl RegistryTable {
+    fn write_payload<'a, I: Iterator<Item = &'a mut [u8]>>(
+        &self,
+        mut sbuffer: SBufferIter<I>,
+    ) -> Result {
+        let string_data_start_offset = size_of::<PackedRegistryTable>()
+            + GSP_REGISTRY_NUM_ENTRIES * size_of::<PackedRegistryEntry>();
+
+        // Array for string data.
+        let mut string_data = KVec::new();
+
+        for entry in self.entries.iter().take(GSP_REGISTRY_NUM_ENTRIES) {
+            sbuffer.write_all(
+                PackedRegistryEntry::new(
+                    (string_data_start_offset + string_data.len()) as u32,
+                    entry.value,
+                )
+                .as_bytes(),
+            )?;
+
+            let key_bytes = entry.key.as_bytes();
+            string_data.extend_from_slice(key_bytes, GFP_KERNEL)?;
+            string_data.push(0, GFP_KERNEL)?;
+        }
+
+        sbuffer.write_all(string_data.as_slice())
+    }
+
+    fn size(&self) -> usize {
+        let mut key_size = 0;
+        for i in 0..GSP_REGISTRY_NUM_ENTRIES {
+            key_size += self.entries[i].key.len() + 1; // +1 for NULL terminator
+        }
+        GSP_REGISTRY_NUM_ENTRIES * size_of::<PackedRegistryEntry>() + key_size
+    }
+}
+
+pub(crate) fn build_registry(cmdq: &mut Cmdq, bar: &Bar0) -> Result {
+    let registry = RegistryTable {
+        entries: [
+            // RMSecBusResetEnable - enables PCI secondary bus reset
+            RegistryEntry {
+                key: "RMSecBusResetEnable",
+                value: 1,
+            },
+            // RMForcePcieConfigSave - forces GSP-RM to preserve PCI
+            //   configuration registers on any PCI reset.
+            RegistryEntry {
+                key: "RMForcePcieConfigSave",
+                value: 1,
+            },
+            // RMDevidCheckIgnore - allows GSP-RM to boot even if the PCI dev ID
+            //   is not found in the internal product name database.
+            RegistryEntry {
+                key: "RMDevidCheckIgnore",
+                value: 1,
+            },
+        ],
+    };
+
+    cmdq.send_gsp_command_with_payload(
+        bar,
+        registry.size(),
+        PackedRegistryTable::init(GSP_REGISTRY_NUM_ENTRIES as u32, registry.size() as u32),
+        |sbuffer| registry.write_payload(sbuffer),
+    )
+}
+
+impl CommandToGspBase for GspSystemInfo {
+    const FUNCTION: MsgFunction = MsgFunction::GspSetSystemInfo;
+}
+
+impl CommandToGsp for GspSystemInfo {}
+
+pub(crate) fn set_system_info(
+    cmdq: &mut Cmdq,
+    dev: &pci::Device<device::Bound>,
+    bar: &Bar0,
+) -> Result {
+    build_assert!(size_of::<GspSystemInfo>() < GSP_PAGE_SIZE);
+    cmdq.send_gsp_command(bar, GspSystemInfo::init(dev))?;
+
+    Ok(())
+}
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index f862422714db..d7e0c2229e62 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
+pub(crate) mod commands;
 mod r570_144;
 
 // Alias to avoid repeating the version number with every use.
diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
new file mode 100644
index 000000000000..79a69c6279e8
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -0,0 +1,100 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use super::bindings;
+
+use kernel::prelude::*;
+use kernel::transmute::{AsBytes, FromBytes};
+use kernel::{device, pci};
+
+#[repr(transparent)]
+pub(crate) struct GspSystemInfo {
+    inner: bindings::GspSystemInfo,
+}
+
+impl GspSystemInfo {
+    #[allow(non_snake_case)]
+    pub(crate) fn init<'a>(dev: &'a pci::Device<device::Bound>) -> impl Init<Self, Error> + 'a {
+        type InnerGspSystemInfo = bindings::GspSystemInfo;
+        let init_inner = try_init!(InnerGspSystemInfo {
+            gpuPhysAddr: dev.resource_start(0)?,
+            gpuPhysFbAddr: dev.resource_start(1)?,
+            gpuPhysInstAddr: dev.resource_start(3)?,
+            nvDomainBusDeviceFunc: u64::from(dev.dev_id()),
+
+            // Using TASK_SIZE in r535_gsp_rpc_set_system_info() seems wrong because
+            // TASK_SIZE is per-task. That's probably a design issue in GSP-RM though.
+            maxUserVa: (1 << 47) - 4096,
+            pciConfigMirrorBase: 0x088000,
+            pciConfigMirrorSize: 0x001000,
+
+            PCIDeviceID: (u32::from(dev.device_id()) << 16) | u32::from(dev.vendor_id().as_raw()),
+            PCISubDeviceID: (u32::from(dev.subsystem_device_id()) << 16)
+                | u32::from(dev.subsystem_vendor_id()),
+            PCIRevisionID: u32::from(dev.revision_id()),
+            bIsPrimary: 0,
+            bPreserveVideoMemoryAllocations: 0,
+            ..Zeroable::init_zeroed()
+        });
+
+        try_init!(GspSystemInfo {
+            inner <- init_inner,
+        })
+    }
+}
+
+// SAFETY: These structs don't meet the no-padding requirements of AsBytes but
+//         that is not a problem because they are not used outside the kernel.
+unsafe impl AsBytes for GspSystemInfo {}
+
+// SAFETY: These structs don't meet the no-padding requirements of FromBytes but
+//         that is not a problem because they are not used outside the kernel.
+unsafe impl FromBytes for GspSystemInfo {}
+
+#[repr(transparent)]
+pub(crate) struct PackedRegistryEntry(bindings::PACKED_REGISTRY_ENTRY);
+
+impl PackedRegistryEntry {
+    pub(crate) fn new(offset: u32, value: u32) -> Self {
+        Self({
+            bindings::PACKED_REGISTRY_ENTRY {
+                nameOffset: offset,
+
+                // We only support DWORD types for now. Support for other types
+                // will come later if required.
+                type_: bindings::REGISTRY_TABLE_ENTRY_TYPE_DWORD as u8,
+                __bindgen_padding_0: Default::default(),
+                data: value,
+                length: 0,
+            }
+        })
+    }
+}
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for PackedRegistryEntry {}
+
+#[repr(transparent)]
+pub(crate) struct PackedRegistryTable {
+    inner: bindings::PACKED_REGISTRY_TABLE,
+}
+
+impl PackedRegistryTable {
+    #[allow(non_snake_case)]
+    pub(crate) fn init(num_entries: u32, size: u32) -> impl Init<Self> {
+        type InnerPackedRegistryTable = bindings::PACKED_REGISTRY_TABLE;
+        let init_inner = init!(InnerPackedRegistryTable {
+            numEntries: num_entries,
+            size,
+            entries: Default::default()
+        });
+
+        init!(PackedRegistryTable { inner <- init_inner })
+    }
+}
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for PackedRegistryTable {}
+
+// SAFETY: This struct only contains integer types for which all bit patterns
+// are valid.
+unsafe impl FromBytes for PackedRegistryTable {}
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index 17fb2392ec3c..32933874ff97 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -321,6 +321,138 @@ fn fmt(&self, fmt: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
 pub type _bindgen_ty_3 = ffi::c_uint;
 #[repr(C)]
 #[derive(Debug, Default, Copy, Clone, Zeroable)]
+pub struct DOD_METHOD_DATA {
+    pub status: u32_,
+    pub acpiIdListLen: u32_,
+    pub acpiIdList: [u32_; 16usize],
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
+pub struct JT_METHOD_DATA {
+    pub status: u32_,
+    pub jtCaps: u32_,
+    pub jtRevId: u16_,
+    pub bSBIOSCaps: u8_,
+    pub __bindgen_padding_0: u8,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
+pub struct MUX_METHOD_DATA_ELEMENT {
+    pub acpiId: u32_,
+    pub mode: u32_,
+    pub status: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
+pub struct MUX_METHOD_DATA {
+    pub tableLen: u32_,
+    pub acpiIdMuxModeTable: [MUX_METHOD_DATA_ELEMENT; 16usize],
+    pub acpiIdMuxPartTable: [MUX_METHOD_DATA_ELEMENT; 16usize],
+    pub acpiIdMuxStateTable: [MUX_METHOD_DATA_ELEMENT; 16usize],
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
+pub struct CAPS_METHOD_DATA {
+    pub status: u32_,
+    pub optimusCaps: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
+pub struct ACPI_METHOD_DATA {
+    pub bValid: u8_,
+    pub __bindgen_padding_0: [u8; 3usize],
+    pub dodMethodData: DOD_METHOD_DATA,
+    pub jtMethodData: JT_METHOD_DATA,
+    pub muxMethodData: MUX_METHOD_DATA,
+    pub capsMethodData: CAPS_METHOD_DATA,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
+pub struct BUSINFO {
+    pub deviceID: u16_,
+    pub vendorID: u16_,
+    pub subdeviceID: u16_,
+    pub subvendorID: u16_,
+    pub revisionID: u8_,
+    pub __bindgen_padding_0: u8,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
+pub struct GSP_VF_INFO {
+    pub totalVFs: u32_,
+    pub firstVFOffset: u32_,
+    pub FirstVFBar0Address: u64_,
+    pub FirstVFBar1Address: u64_,
+    pub FirstVFBar2Address: u64_,
+    pub b64bitBar0: u8_,
+    pub b64bitBar1: u8_,
+    pub b64bitBar2: u8_,
+    pub __bindgen_padding_0: [u8; 5usize],
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
+pub struct GSP_PCIE_CONFIG_REG {
+    pub linkCap: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
+pub struct GspSystemInfo {
+    pub gpuPhysAddr: u64_,
+    pub gpuPhysFbAddr: u64_,
+    pub gpuPhysInstAddr: u64_,
+    pub gpuPhysIoAddr: u64_,
+    pub nvDomainBusDeviceFunc: u64_,
+    pub simAccessBufPhysAddr: u64_,
+    pub notifyOpSharedSurfacePhysAddr: u64_,
+    pub pcieAtomicsOpMask: u64_,
+    pub consoleMemSize: u64_,
+    pub maxUserVa: u64_,
+    pub pciConfigMirrorBase: u32_,
+    pub pciConfigMirrorSize: u32_,
+    pub PCIDeviceID: u32_,
+    pub PCISubDeviceID: u32_,
+    pub PCIRevisionID: u32_,
+    pub pcieAtomicsCplDeviceCapMask: u32_,
+    pub oorArch: u8_,
+    pub __bindgen_padding_0: [u8; 7usize],
+    pub clPdbProperties: u64_,
+    pub Chipset: u32_,
+    pub bGpuBehindBridge: u8_,
+    pub bFlrSupported: u8_,
+    pub b64bBar0Supported: u8_,
+    pub bMnocAvailable: u8_,
+    pub chipsetL1ssEnable: u32_,
+    pub bUpstreamL0sUnsupported: u8_,
+    pub bUpstreamL1Unsupported: u8_,
+    pub bUpstreamL1PorSupported: u8_,
+    pub bUpstreamL1PorMobileOnly: u8_,
+    pub bSystemHasMux: u8_,
+    pub upstreamAddressValid: u8_,
+    pub FHBBusInfo: BUSINFO,
+    pub chipsetIDInfo: BUSINFO,
+    pub __bindgen_padding_1: [u8; 2usize],
+    pub acpiMethodData: ACPI_METHOD_DATA,
+    pub hypervisorType: u32_,
+    pub bIsPassthru: u8_,
+    pub __bindgen_padding_2: [u8; 7usize],
+    pub sysTimerOffsetNs: u64_,
+    pub gspVFInfo: GSP_VF_INFO,
+    pub bIsPrimary: u8_,
+    pub isGridBuild: u8_,
+    pub __bindgen_padding_3: [u8; 2usize],
+    pub pcieConfigReg: GSP_PCIE_CONFIG_REG,
+    pub gridBuildCsp: u32_,
+    pub bPreserveVideoMemoryAllocations: u8_,
+    pub bTdrEventSupported: u8_,
+    pub bFeatureStretchVblankCapable: u8_,
+    pub bEnableDynamicGranularityPageArrays: u8_,
+    pub bClockBoostSupported: u8_,
+    pub bRouteDispIntrsToCPU: u8_,
+    pub __bindgen_padding_4: [u8; 6usize],
+    pub hostPageSize: u64_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone, Zeroable)]
 pub struct MESSAGE_QUEUE_INIT_ARGUMENTS {
     pub sharedMemPhysAddr: u64_,
     pub pageTableEntryCount: u32_,
@@ -517,6 +649,22 @@ pub struct LibosMemoryRegionInitArgument {
     pub __bindgen_padding_0: [u8; 6usize],
 }
 #[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct PACKED_REGISTRY_ENTRY {
+    pub nameOffset: u32_,
+    pub type_: u8_,
+    pub __bindgen_padding_0: [u8; 3usize],
+    pub data: u32_,
+    pub length: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default)]
+pub struct PACKED_REGISTRY_TABLE {
+    pub size: u32_,
+    pub numEntries: u32_,
+    pub entries: __IncompleteArrayField<PACKED_REGISTRY_ENTRY>,
+}
+#[repr(C)]
 #[derive(Debug, Default, Copy, Clone, Zeroable)]
 pub struct msgqTxHeader {
     pub version: u32_,
diff --git a/drivers/gpu/nova-core/sbuffer.rs b/drivers/gpu/nova-core/sbuffer.rs
index acde73132ba0..4d7cbc4bd060 100644
--- a/drivers/gpu/nova-core/sbuffer.rs
+++ b/drivers/gpu/nova-core/sbuffer.rs
@@ -193,7 +193,6 @@ fn get_slice_mut(&mut self, len: usize) -> Option<&'a mut [u8]> {
 
     /// Ideally we would implement [`Write`], but it is not available in `core`.
     /// So mimic `std::io::Write::write_all`.
-    #[expect(unused)]
     pub(crate) fn write_all(&mut self, mut src: &[u8]) -> Result {
         while !src.is_empty() {
             match self.get_slice_mut(src.len()) {
-- 
2.50.1

