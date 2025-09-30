Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CC97BAD034
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 15:17:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4A1510E5BF;
	Tue, 30 Sep 2025 13:17:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="OvjJg0wh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012069.outbound.protection.outlook.com [52.101.53.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00A9210E5C0;
 Tue, 30 Sep 2025 13:17:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OSmUvU9+MfXDAqV+4iMIjMm9uM4e9GTUpw8SOHgXvv73zdwyRAaho3XAY70juH58qjU08R3FWKMbNyCEc1zMnw4SHGxPzTN3CFDOJUtG58k4tTwWppgW8i3V8zlRUcljifuVPigAICeyZqdgqdeBHeLvEOq5b6LYtJo8S8oTxcM5dEmZZzk0LHuMSuYqFii3QGdzN46DeMI6QCYyoojh7NWmukyqMZdklFoOylkedQDFB9v3ilGSq3vLSxsvEWsixC6PsWfLDLyraOhCwLKiPRg4BrFN/2cWv0Mor7b31dUceDU22AbokZmw9Px+Jcd+PA8FGYzmiSv0HpcllxzsXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ANQuNz1A39gRerrI5pwDhOu1TDfmmuGtQNu9n3qjoa4=;
 b=VKH6ks+qAdYcFI0VMIhdBHqVS9Kxb8puE+nn6kMbEG4BR4N0aLeZSudaxfadYVB4vOla0Nj4RWQbbXOHpFOzolljQXXtdRotDW5BPK5ujtrYm59L86qRCpX59wiDDAXLZpezqvPS+chW0bA+5CUrPDQdBGBT/X6xjEtAOseZE0K0iwhP8R7t+XZcU5jPdgMY6V25hz61hLVlByLXmSCH2/fnLSLUumRjOB1DSIXx4I0WpMrdpD5pP9roQdQ2Gu2IFdgtW2iS+fkxJgCyGpc9svxVXP+L2kTn06A1zHE5GVijKxRLghwOq5vUWfUD9rx8wFqzfVS4UP3KG5SCVhxAkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ANQuNz1A39gRerrI5pwDhOu1TDfmmuGtQNu9n3qjoa4=;
 b=OvjJg0whD4MGGq80REiwbqlXRW2oJK+7NmYLFcXpKDLdHcgi++/PwJeuMMbgdeecACO4lypVfDHT7N5bLOda0wRJihUzJxBV7ajL0nNG8SW9LlAXtwlTj+Lzl6MEh/4QuF4ZgbxkoFqBnuC4x09MubG2jREUVVSbiIhLd28wkAVgJ0GAl0nZowBygBg8DXtwvi/L9BXuE9+sgrsiqWEFt4g83jpa9x1aDx3pmGyWElxrNl73rcFkLmTT/0BCdQhCLVwX4LbHRhboPWOjbuKFZbw6g2opwtoT8+0kagNI43YjVuMPnbtT7a+7cvs819QdOzC6vzPju6Y27zdoLMWikg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 LV9PR12MB9758.namprd12.prod.outlook.com (2603:10b6:408:2bd::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9160.17; Tue, 30 Sep 2025 13:17:38 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 13:17:38 +0000
From: Alistair Popple <apopple@nvidia.com>
To: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org
Subject: [PATCH v3 08/13] gpu: nova-core: Add bindings and accessors for
 GspSystemInfo
Date: Tue, 30 Sep 2025 23:16:41 +1000
Message-ID: <20250930131648.411720-9-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250930131648.411720-1-apopple@nvidia.com>
References: <20250930131648.411720-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5P300CA0047.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:1fe::14) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|LV9PR12MB9758:EE_
X-MS-Office365-Filtering-Correlation-Id: d9e53bdd-0494-40e6-1ccd-08de0023b9e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aCRALSkKHjCbxAf3BYcUZ5b1Aec/wimW1n3T8h4CbWBtmxlB3tqi8bKBwUBm?=
 =?us-ascii?Q?6/6ZSKdInFlWkhowIWv3yRrxl7hPIYB7rwX2YBMf93ggrTMnvbREA/Aku2dc?=
 =?us-ascii?Q?lMlN7EP36SnglWYbrD6/vO2/MksTktKZbp6JqXQgcGFYxtaOCtIIwN++pgr6?=
 =?us-ascii?Q?OAFSArGAyevYmYaUhlTspFvtVDHCP5u2n1ECZVYyMk4BG3fPA1ykmxDgotrK?=
 =?us-ascii?Q?zMJTjCp2bOdHrQ1DdfFYTwzxMFl7szf5XWbqHHGiA6JAvSaIuX/Q0fKoQenZ?=
 =?us-ascii?Q?iinMz2jDSw6fn/MYFNcou9pf2v8aH4MjmSITwK9EifiVer0Y98YwGC7npPJ6?=
 =?us-ascii?Q?TO3aRbb40+ef2zsqnuqFGYUPNWesNz6ilnDcJP591nXgj+qOJPI5pfuNFbHP?=
 =?us-ascii?Q?WhUDWoV0SMAqlmBKmrcj0AxTztioyxqOhtCPZAr8v5J/iOYKNBK1OiFo4hLg?=
 =?us-ascii?Q?+Ywf06+4g2rMZCxOw68Yz7AycNVMnjwIYdXgiSWESkMRh/M3PamB7BKMgjSC?=
 =?us-ascii?Q?398pw/E73qT/HM332v/GmdTdQ2F0speZoRiXj3DdUaEvlkFrhGpJVkO0ZdEv?=
 =?us-ascii?Q?4XqKunC4EIdf+4l+UWZ8/mt1YiwjAVjokQxSioO/fH9ZbGFakBnFWZpHUHsU?=
 =?us-ascii?Q?LZPi7vdF+r5U2jFv8dmLeaV0/zqwABMIBNWA4vQEW/YwDfA8XFcJLlKfnTTd?=
 =?us-ascii?Q?up6ERNqu3Iro0RKzjr+4bDSK2dAxI4vihSJ5M5KKFsVyhVk8y2xawmb1OZo5?=
 =?us-ascii?Q?xPJzIGj5qslxphgjD9AVmDBkO3LhnfBMpTV/HABiLxcLL06sRjlPPXCk4woY?=
 =?us-ascii?Q?I5iL8hfUAg+b00CWsDnuRLoyTdAs4cD6XiqrSZyQemdQj8YyMsfrFd8Dp2Z0?=
 =?us-ascii?Q?TQ5TiBtqOBBapaZS6FKN6G3+WkZKwuZfo3Oy/HPTMfvpKf1yvdwxuETq+cxp?=
 =?us-ascii?Q?GAJDOzcMQ51bfSgjfEmXFFToYcopsq98LbGgqTb/10oqHW00wFIB2zeykOZD?=
 =?us-ascii?Q?6UyWqY/YnGI7ddfCWLPHiTL6+iWzRYN+bJybfhiBHdx1M0ahDCHfAo2C2Qfl?=
 =?us-ascii?Q?Hp2xRy2zxQcVJPc33VUFEEAPGYeGu1Ne1o/tda7a252blTihWGx2Los5DYeL?=
 =?us-ascii?Q?yyj1a0T2Mf665JVoY6EB1lOCR+u/G1F07EqGAnEoamML6pBShQVyT/d3C8fk?=
 =?us-ascii?Q?j4hhIYX1qnRw6qAcj8wzOQgdE6CS6NuBMZHCXWmIiAV5/HXBhAoHaAE5yoCX?=
 =?us-ascii?Q?yU2pZOA5akW4R1ZoyEt47YYqXVDgcjU0MyU9Xbsr+YARYIIwc+UI26uLclv1?=
 =?us-ascii?Q?b85duQ1/tf1JiTnMMJ+fEGXLc6GHKq2pRSS6ulSRYD4eNcv6PUdaNGXq/PQA?=
 =?us-ascii?Q?GfnrGoZPtZp9xDQTqGs9fuaSK3Wi0yvYa6PHr1fYmMo+s2aUM3obagIJWc6r?=
 =?us-ascii?Q?t5REmGSqMm6gjZ/wlomb73NEwvVZvbiX?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WAm6+8upZA/gmGBYb+IF4V27l9wkGX8f+Leqnx6DG8xAFggBfW3dLhFmVarY?=
 =?us-ascii?Q?cS4mJ3DPrFAhLu6yyGmXimzQwP1s6BgIGsZ2vqOVgx9dqS9xqo5vsFuasO+L?=
 =?us-ascii?Q?5duZReevubGeLjCQ3YCMgzT7PUvUszGe+XNQpL6mVk1jpMH/eRQ0R40XQS9T?=
 =?us-ascii?Q?xdw139iHA0XAe+6kOXXDNM9mDfjaNzj0gcZx4beSbpFuaWUn1S3oDc1w/5hr?=
 =?us-ascii?Q?Sdv8LukOeNmBXsvfnL5xp/WQAdO82ScHG3Ihrll9ffYesLnVe18FZEjS8JEi?=
 =?us-ascii?Q?c1bS9T0Hg+ghIlNU+25kspEOWxjziXMf+h5veVJoT4CqSvEL9QuxCH6jOlgZ?=
 =?us-ascii?Q?RIDrmpVPUKSEnhEN2vAmoiEQXBzQMAKGnedVeUOJs/d7oND+B8o7GuCTrSgO?=
 =?us-ascii?Q?a1+A7ekQE1CntIe5mnO8XWiNlWQPfXpG1fQsvrRF6sAwhCfYCvyGxXBVpvEW?=
 =?us-ascii?Q?r0pHmJ47YTFUrV649KfcgG9aln+0MhDy8GavgcO7DJC4A8YFazg14B/8294q?=
 =?us-ascii?Q?Eta+JuRFq4ak+SRtjgHsVAVmVxy26sqoHa5eofwMT9ayxKdFAf7H5tLiPLCc?=
 =?us-ascii?Q?z+ojG78NBjHi3s0kiiIDvyZrEwXOtQIPBnw0fNx6pAqZpTcoDAHbSihEQzwa?=
 =?us-ascii?Q?z+rSnmJ26RoF434vJ1eTCbXUCoeBTiyVfXnJ//DLLYnMJaZmJFlq31Cfks1v?=
 =?us-ascii?Q?TmnyUEmhUGG5j7/0Umrh3iyG9KrEyW70vC7ihgS96BP+oIVaUj2AKj2bN8ng?=
 =?us-ascii?Q?IzeaMnymRxBZh+HfIMid5/l2jDg+wCr39WxqgIRzKxMmNXpzFhmjvAjN2OQQ?=
 =?us-ascii?Q?VnX2XjDWlPQVW/N2UNgmPn3LoTUWLwo7JmDiEaot056IcPFt39ckwUCrTLxQ?=
 =?us-ascii?Q?L5NIKB3Z/cqDrVKFLK2kdZ3PqsfeYODRsubgWF6K8NVd1kcFASHu3rHsZ7Bf?=
 =?us-ascii?Q?SXB9yDlr6Tb3kUO1xs8Ev08C7OWAs9o+An4621yHd+jINb8kXuikNZOCE5TM?=
 =?us-ascii?Q?I9STLJwGjHt9PwmPaC8dYsGVmxP4dEP3lwQRFyBchxEJEn1b9s++Z2hQ6op+?=
 =?us-ascii?Q?BVWq6TcocubPVOY/dFmOUBXI9xpVIn+xVANYlkOmZTooH1I+mDJKQ+jYTC1A?=
 =?us-ascii?Q?v+Kgdpskg45UaPXNhQdl/sksC0zEs3LK7zyUAhl+v4EzdRg1tva+NeRGpAcX?=
 =?us-ascii?Q?4TjH9QjI3UCiR+JPiPGWyewMLeMq7+ZPR+XNwvS8texHZ6EdyM12jOlXk7ZU?=
 =?us-ascii?Q?MsA3asB/uUFOIoEdm2fTnSs/r41vq6M2fAQZL+OOkuGmJ1FPkWI1JEvlMnFY?=
 =?us-ascii?Q?wQmUsUf6lKhF401/1QQPNQZ/S1zJQ0xK9Jqou9jfXMaj7561x7CCZs6jtVha?=
 =?us-ascii?Q?jbU+N0rQ8NhDJIbvNreaqHiMKpd8SbTYGUr8ztRJk34T+31k2GCvOHfEmpyI?=
 =?us-ascii?Q?6Z6wHzLGxhc0bkxVH2cmOk6X03Y94H2b223qKqV4h50E75iL+yi9TxNvEY/M?=
 =?us-ascii?Q?DSYnSQuTcSNCS4HNQKxBQkIk63qmqvuRyXV/k8/kEa6AiDBvIg1GNNgqUpGu?=
 =?us-ascii?Q?XXs79c41HPtsxeonSXtKEEdlJ4zN9e0VCXLoq31z?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d9e53bdd-0494-40e6-1ccd-08de0023b9e1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 13:17:38.0288 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SlXi6zk5xxp7RBiR7te/dTDrftuo6klPVMuj/APUdMeh2JMKds1PHP0KQJkJHkeN5XBS0uYFBRnjFgQtMo5avQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV9PR12MB9758
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

Adds bindings and an in-place initialiser for the GspSystemInfo struct.

Signed-off-by: Alistair Popple <apopple@nvidia.com>

---

It would be good to move to using the `init!` macros at some point, but
I couldn't figure out how to make that work to initialise an enum rather
than a struct as is required for the transparent representation.

Changes for v3:
 - New for v3
---
 drivers/gpu/nova-core/gsp/fw.rs               |   1 +
 drivers/gpu/nova-core/gsp/fw/commands.rs      |  40 ++++++
 .../gpu/nova-core/gsp/fw/r570_144/bindings.rs | 132 ++++++++++++++++++
 3 files changed, 173 insertions(+)
 create mode 100644 drivers/gpu/nova-core/gsp/fw/commands.rs

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index aec0db50adea..2ef9d4acd6f9 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
+pub(crate) mod commands;
 mod r570_144;
 
 // Alias to avoid repeating the version number with every use.
diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
new file mode 100644
index 000000000000..f28779af2620
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -0,0 +1,40 @@
+use super::bindings;
+
+use kernel::prelude::*;
+use kernel::transmute::{AsBytes, FromBytes};
+use kernel::{device, pci};
+
+#[repr(transparent)]
+pub(crate) struct GspSystemInfo(bindings::GspSystemInfo);
+
+impl GspSystemInfo {
+    pub(crate) fn init(&mut self, dev: &pci::Device<device::Bound>) -> Result {
+        self.0.gpuPhysAddr = dev.resource_start(0)?;
+        self.0.gpuPhysFbAddr = dev.resource_start(1)?;
+        self.0.gpuPhysInstAddr = dev.resource_start(3)?;
+        self.0.nvDomainBusDeviceFunc = u64::from(dev.dev_id());
+
+        // Using TASK_SIZE in r535_gsp_rpc_set_system_info() seems wrong because
+        // TASK_SIZE is per-task. That's probably a design issue in GSP-RM though.
+        self.0.maxUserVa = (1 << 47) - 4096;
+        self.0.pciConfigMirrorBase = 0x088000;
+        self.0.pciConfigMirrorSize = 0x001000;
+
+        self.0.PCIDeviceID = (u32::from(dev.device_id()) << 16) | u32::from(dev.vendor_id());
+        self.0.PCISubDeviceID =
+            (u32::from(dev.subsystem_device_id()) << 16) | u32::from(dev.subsystem_vendor_id());
+        self.0.PCIRevisionID = u32::from(dev.revision_id());
+        self.0.bIsPrimary = 0;
+        self.0.bPreserveVideoMemoryAllocations = 0;
+
+        Ok(())
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
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index b87c4e6cb857..427fff82f7c1 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -320,6 +320,138 @@ fn fmt(&self, fmt: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
 pub type _bindgen_ty_3 = ffi::c_uint;
 #[repr(C)]
 #[derive(Debug, Default, Copy, Clone)]
+pub struct DOD_METHOD_DATA {
+    pub status: u32_,
+    pub acpiIdListLen: u32_,
+    pub acpiIdList: [u32_; 16usize],
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct JT_METHOD_DATA {
+    pub status: u32_,
+    pub jtCaps: u32_,
+    pub jtRevId: u16_,
+    pub bSBIOSCaps: u8_,
+    pub __bindgen_padding_0: u8,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct MUX_METHOD_DATA_ELEMENT {
+    pub acpiId: u32_,
+    pub mode: u32_,
+    pub status: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct MUX_METHOD_DATA {
+    pub tableLen: u32_,
+    pub acpiIdMuxModeTable: [MUX_METHOD_DATA_ELEMENT; 16usize],
+    pub acpiIdMuxPartTable: [MUX_METHOD_DATA_ELEMENT; 16usize],
+    pub acpiIdMuxStateTable: [MUX_METHOD_DATA_ELEMENT; 16usize],
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct CAPS_METHOD_DATA {
+    pub status: u32_,
+    pub optimusCaps: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct ACPI_METHOD_DATA {
+    pub bValid: u8_,
+    pub __bindgen_padding_0: [u8; 3usize],
+    pub dodMethodData: DOD_METHOD_DATA,
+    pub jtMethodData: JT_METHOD_DATA,
+    pub muxMethodData: MUX_METHOD_DATA,
+    pub capsMethodData: CAPS_METHOD_DATA,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct BUSINFO {
+    pub deviceID: u16_,
+    pub vendorID: u16_,
+    pub subdeviceID: u16_,
+    pub subvendorID: u16_,
+    pub revisionID: u8_,
+    pub __bindgen_padding_0: u8,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
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
+#[derive(Debug, Default, Copy, Clone)]
+pub struct GSP_PCIE_CONFIG_REG {
+    pub linkCap: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
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
+#[derive(Debug, Default, Copy, Clone)]
 pub struct MESSAGE_QUEUE_INIT_ARGUMENTS {
     pub sharedMemPhysAddr: u64_,
     pub pageTableEntryCount: u32_,
-- 
2.50.1

