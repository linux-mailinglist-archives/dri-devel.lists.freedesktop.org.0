Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AC204BC30E2
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 02:13:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04CAB10E1D5;
	Wed,  8 Oct 2025 00:13:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Dzvhe/eS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010023.outbound.protection.outlook.com [52.101.61.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDE3710E1D5;
 Wed,  8 Oct 2025 00:13:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ypDeN+kwb5mjVGUvR1kU44GVho8nF3SXjXL51hDQ3ajUTGHRunIitmNbm8BItzobkUsPt8D4p8cRXzVjfxYbPZLJk1dW8OURAYeiFHCfaBhUqkNwR47xFmo2lCsZ8VSCGwvm7XhqiX7yZhUWrb+Uzb5qDn/WxCRvdf5fVDHhz6fs0VMtpTdE3zbnV/jCY/6EnajesVxNjtFxwaSnw3qLHVcpRYJ0WtVk4g+m9mu6xJZ4IXViaKYnXaB2cbjeaLcX/FZWSf0MXvVfFHRSV0Vo34RyJrj42izUX0WjBwsVuf69oJfbCs9VMCnU1lUpT99iVOICLUYZR6QuGTwNouCPqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bgRWDmImk2Mjy2tpRlMNRlidNYvB5jZPO90zOI7kO7Y=;
 b=zRZ5Mh2GMkkmpjvYxRDFhtZNBk2ZEge9nzsQGKdDke3ovN1V2j29s7LpUbp8u+AzKlzzh8F82ngbXH5kt3zRww9Q5nDXryWEgLIGMbalt4+K4aey7RapvezF24n6gakmzTWZC1m1IdUV3nNdlu7lxDUy/HBNsGNSx6r+/jfkoRIgfPS9BKuzW3++2zBJuKkHw+Sjj+jqxLxYOEEN9eDMw2G2XqY1R8mH0MXODsM/OrEBCXeOwt987vZ5XQ48dPIORNO6K4F/I+JUHalUfDoPbXquO27rkJ03PiunZ4xuR58AgYuyFSC4A3VETIKYwq9+7PQ9K9tW+sQtYRm6DCStNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bgRWDmImk2Mjy2tpRlMNRlidNYvB5jZPO90zOI7kO7Y=;
 b=Dzvhe/eShCHfDWkTscRmMK2Louj4y2Hxz7OvITEsIyh3iwsnFxm0c4Ejvo4LX6bUHwRp9BtJsYiz0hHqrSV9ooQIFDc59HH9vMcPkrPEQzCFNdJQWhvgz7hBflLD8bec1GYpG9Xpwu2giX59eVNHLIgzandzOYHtKnqFO/ku732PiCyZPydJt8w5lmiwj8UWA/ti+sFwuNfoLUYKIxS/2Ai7YzBzmbnV0p1/urGVxvFlxjoXM5kVJi+5up5aCti0uX9iSJyi899YhPI6K/1LEFEjCazTjjdQWE2mPFqmUsjJJ3/tSZ8KtCUNrpQFE5U+0/l2wyO/rGWNhMhnGgw9IA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CH2PR12MB4071.namprd12.prod.outlook.com (2603:10b6:610:7b::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9; Wed, 8 Oct 2025 00:13:44 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 00:13:43 +0000
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
Subject: [PATCH v4 08/13] gpu: nova-core: Add bindings and accessors for
 GspSystemInfo
Date: Wed,  8 Oct 2025 11:12:47 +1100
Message-ID: <20251008001253.437911-9-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251008001253.437911-1-apopple@nvidia.com>
References: <20251008001253.437911-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SYCPR01CA0025.ausprd01.prod.outlook.com
 (2603:10c6:10:e::13) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CH2PR12MB4071:EE_
X-MS-Office365-Filtering-Correlation-Id: be5fe2e3-9bbc-4670-d18e-08de05ff8ab6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PHTZ8oXpawI6i92gUAjC1/ta6g+r3Hqa53VSWO1gAA74oXxbIigSK+TeaPj1?=
 =?us-ascii?Q?wN0gw4MXzIX7X9OtP0Tp6aYnwe1b1MHhX0LCCnxAtKNlc5x3d9iIA9UxyNTy?=
 =?us-ascii?Q?acBZzI8D+jfG7SxGcGlmeIBTIc4KQqu985tXA+bIVSrzgu9jU93VnElNmkFH?=
 =?us-ascii?Q?5TFR8jShZjTaLv25JuYuyBHG2DUE8snBg1a1vO6DsEwBw7MJ7FUm+AuHW3Ig?=
 =?us-ascii?Q?mARx1JqkAzYuWPrqEroTlX3D8Z4G2kuX0Dk6Wh6C+c/x6MD3yEZM3SOMHWJn?=
 =?us-ascii?Q?71Isi9sSTDFHdP4IYwOf2prcbBHSGbJUQZP7aoB41jUhxvHOaAbKCMXlVtI8?=
 =?us-ascii?Q?y8oELVlVK0vdaY+kr44alPYcHh/trj3Hv/694qTos5oHNtWztYNBXkTXFpp6?=
 =?us-ascii?Q?0BuLTef+Tcnl6XFIoss6h9Sx+N/aRttXgHMuU0n9BgpK+t005b6SwqTbs3IG?=
 =?us-ascii?Q?4RcHL3ZivYpg3YqIRrcCDjlgA7ZvRI4tCRTiUAkeWnxtcvCMdKGppprMAID8?=
 =?us-ascii?Q?ovWOV34cT2Mv58MXQ2VtQiA8Yx0qeeOMQEuTxzetMMYegbNMV2delZHS0RF/?=
 =?us-ascii?Q?rKwu1mFWLa1hoOJUci4P1+4lhMpElL24dwDsHdqe4oZ18EDgdJu/T3qzfze0?=
 =?us-ascii?Q?ZWxHQdphtedecezqdrLtlI8aw1Fa1KlOed9/PB0HJZLUguMnhqNdl5RpKme9?=
 =?us-ascii?Q?VGfqJd/UjVlwkI/Va/Qxrvt0mVkl+dYpRB5Nrsq0vXvoDZ/Hoc7/LHwsKgMS?=
 =?us-ascii?Q?3/kaGw+OuyV0oKVdSS0QZWWAlXSzcMIdpUYMDHswNo6DK3R305RIjjyE8qUm?=
 =?us-ascii?Q?rdwA5tlJndFyHQwDxy4a89Pmtwd5axaZ+DsJPP6smtwkWZwrzI5yXY9rT0z7?=
 =?us-ascii?Q?gKH4utmiL/e0KyfcIwbmPypWuPQ04Tva4rUBI7mwEux1EqEGEz+CLG8t+DqS?=
 =?us-ascii?Q?Q/1heHtIUve0zv7d/+MoArGWTYrlwM8X1vzM9IlShZZvX41cmggchY9Mj7V7?=
 =?us-ascii?Q?7QtEWJLQAWQ0mXVjeS0xr6NIjmGpIgmwQGtBjGB874z3tMwU8i4AFKZP9sq2?=
 =?us-ascii?Q?rtDk50WKd4+hPgF0lry03XAcr8F/BGunJl5uemc4QNSI8CiSOt4qeE4FUJ5U?=
 =?us-ascii?Q?ZcawwxMS+5dNEDq2xOrdGqZ1HR2bQEztW2bixJcSaGrNSqKi9JhZGgJkrXBG?=
 =?us-ascii?Q?CIA60U0XiJhv3Mu2RbLEuYVt0E31B7HLpafIDOH4zFKzM03r1DOFILDlBUVW?=
 =?us-ascii?Q?y6OTkeQoMzvEqGOA4kESE0rMNSrIqFKTv4XxCQjWwrZWS9ulKFgGT5kaANQL?=
 =?us-ascii?Q?F3M9q3Bdsn8Rqrm3SbojWJV5Lvewcp8gwzNMtxv2jNLSGb8L1x+6laynz6sR?=
 =?us-ascii?Q?D+6FD9j16y96Wydm4myE3amBdddpBSaHNHypiDxo0NIeF1+dKHIzZVFXU531?=
 =?us-ascii?Q?Dpr9eOPjcqtQWpxHlsJzU8i2+Y1iyEvk?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JC+tNZjlMqSf8lKB7IknQuT7u3QKEtvpF4+arJBMcXWSjI5Re7AqBTkEhbcU?=
 =?us-ascii?Q?Fjt9K5zRDtYB+N9MgD7vn7CuSbT2Hy/V84WDXEt9paWaZ7/kD+Y4KxwRins5?=
 =?us-ascii?Q?jniad3ZDmoMwaBtCCzUxhh05PdL/wgxmg/lw3btKU7TJ4w2JGSvaflV+lIpN?=
 =?us-ascii?Q?YMoXwoiNXjyvZOcwhbDxfIgA3dUCIOgX09XAcP+7NOrXeqy9NW/FdIlgU95b?=
 =?us-ascii?Q?lHqMTdJd7GBj5J5FMmEKA1MZ2qkT/JR0TQxXI2txSzrmF8FH+NqYneOljBjm?=
 =?us-ascii?Q?r/YtDspk1NzPosCm1IM6TBSqGv+tvdf9fOFrvIBOA8x8ExzMhPIxQyf2My5I?=
 =?us-ascii?Q?Ya4ALQ8de7GxpxU4eoYUGyyg4uxVke/ETrJRuq0LB69VS6i2uc8ad5qR0Fio?=
 =?us-ascii?Q?KaVtjBvPl7f3AoxKVpnz4DR/lFT0qkvlnrNblho72rz85sjO/hHYaOytxH0N?=
 =?us-ascii?Q?uX4o115ottDSWOyZLsOU3hWJnZO2Wy1D0jP4i5Rw49nnIHJrRsJh87wz7cNY?=
 =?us-ascii?Q?DQ42N6W2OeV4xIBXSWMtaQRdXfliAeqtUwUyBZyzHKrXadQ4f9cBKf21pV/z?=
 =?us-ascii?Q?2Bqt/dWS2dF3Qm7SNNvwq8KOl8X3sB0zLH96WnyiJRWdc51frAQoMcBupnP2?=
 =?us-ascii?Q?Oy+ZlvTYkwsmYj/xcX+rawaUjtTFbmEYlZg7+G9dF6Mw0sjaXNHOGIlLh6pX?=
 =?us-ascii?Q?DCEIMFrquIxEKqNmb6WCOk1/e/Yct/7mYdB9oZ1DEXmaLIqoL4FfXkw+PsK0?=
 =?us-ascii?Q?eUbbkGonwWp9rYOoBQJ7YW5SeCSInwqlFf1lZm2O5Gm9NxmaGq6dVz3hCx4c?=
 =?us-ascii?Q?WHG8DPb5VgTWPDS1QCZY0yg9hjIoNSiPk7I6hthWAkbCIKtkF1BICBi8G7Ql?=
 =?us-ascii?Q?+Y75I0M7XMeEfhjH8Okh1SA4SoExG4KlQFNpZgIJf4eBBm4ZCHXtQNVqPH3w?=
 =?us-ascii?Q?hrwoix6KGGs0dk0caIJr3VQph8eYC+aprgTQVG0NVkxltRmwZjMJfZoFUuep?=
 =?us-ascii?Q?w5ba9BN//NyeksR6G+2v4uSuGvNAnRx0ZpJr/ZHTYFG7+msn6ruwJdQuV8oy?=
 =?us-ascii?Q?hWdR3E8ivZpUGBcqG/bGv/qQ3jmxjWtHq9FQwERmY5/O0XY+6M3ajopief3t?=
 =?us-ascii?Q?iUp+JL8ul+QpNhgKynyKHGC4DxWbsl7PQBHknSKGKBSnZSZvmjzgU3KDASVc?=
 =?us-ascii?Q?IKV8PduT0+ZTgWA7KGCxTZl4jhvqdLbjHPv48QmWlL1nj+wi+GOKIJazaUai?=
 =?us-ascii?Q?wbz06zSaC8KA95vLDh6d2JykhZnbWe6Vz3z5jWstm0eTeHzB3s6O9FDIAlDv?=
 =?us-ascii?Q?2uCgeA8Vt9OarWWw8tIG9VwFxSoz864UmpS5MesDvnb4wxd3jZPgZMzNU+Qk?=
 =?us-ascii?Q?XJZSdqR2TaQeCaUetltPA3seEqkzk07Zszda+8vyI9X5nlfXDTNhBzHByiwP?=
 =?us-ascii?Q?fUD/RsZd+vWJDMIQpqXE2NBYk5agycZN3R9ZPxNAlSwi+g0CF2Dmn+/qpNNf?=
 =?us-ascii?Q?7TX97KDQhllh33WpqvUdYZer7N4LNGlsQyjViCtuOg7GluHD/LnhL7EqxBJM?=
 =?us-ascii?Q?WwL+zshvLLMNnBfSqEPIcL63hPB+yE/tQd6/IijR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: be5fe2e3-9bbc-4670-d18e-08de05ff8ab6
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 00:13:43.8777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F+WfkU+/tT9m39XYmGYduC2dG7UFZtm+5vou7OPbDxHOTa0vNSx2kYPlDTjvNKW0ycYN1b5ekYdjb+NAa25HoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4071
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

Changes for v4:
 - Use `init!` macros

Changes for v3:
 - New for v3
---
 drivers/gpu/nova-core/gsp/fw.rs               |   1 +
 drivers/gpu/nova-core/gsp/fw/commands.rs      |  55 ++++++++
 .../gpu/nova-core/gsp/fw/r570_144/bindings.rs | 132 ++++++++++++++++++
 3 files changed, 188 insertions(+)
 create mode 100644 drivers/gpu/nova-core/gsp/fw/commands.rs

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index d2ba6f98d05d..fb309288ac40 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
+pub(crate) mod commands;
 mod r570_144;
 
 // Alias to avoid repeating the version number with every use.
diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
new file mode 100644
index 000000000000..53e2c9098c48
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -0,0 +1,55 @@
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
+// TODO: Ideally we would derive this for all our bindings, using the same technique as
+// https://lore.kernel.org/rust-for-linux/20250814093046.2071971-3-lossin@kernel.org/
+unsafe impl Zeroable for bindings::GspSystemInfo {}
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

