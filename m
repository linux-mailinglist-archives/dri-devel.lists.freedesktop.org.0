Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B944BD1A19
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 08:21:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 992E310E3C2;
	Mon, 13 Oct 2025 06:21:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="K+jRSL8x";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012053.outbound.protection.outlook.com [52.101.48.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 237C310E3B4;
 Mon, 13 Oct 2025 06:21:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dq/zEjR8oQN1a5pMKe/q0Cjrdn25ybyaEDcAz2LRNWFKQEtHHmgSHJI2xpTo446ASbYADty2HeEa7uO0xrzmZWH2n+Y/XrLYQP2jsnLwwnRpioHr7Eal7s9MeNUwlHlOQbCFaj6rEMsYuLBdIt4ZK5CHMUUyvtWUYwS6MYstN8DwauBNFD+g9ZG7HiEsO3CpRO+feDlb1tRP65366/CsADt5q1rJwmpNAgWxCwnw9x+OL0A+2bGxAiwRbILv29TzfAZzr01ROLcWwPtvyq65ij+h/p+YzSEmaJKvTh2TWXv9N7rAm08cbkeQIV1V97o2EV49DifdIA2zKjcPbGZr7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OrDTTcCdYfmW6Grig268DM8+3+aZB42iH2+8UOaZtW0=;
 b=oPjd9gkt4HmtJN0YCmPYvw3ZhvYfn8IwcIxQfEef1SAzv5lk2zj1uFvKTj2cSm+vysFZIj4sKtVEjS1HObKxeQtWEBIczf+Ty8ppYXnnXXMNsmrkI8NqUNczp9elL2n+HhlD0pWXBXli2xwJyv7IHmYtEST3KI+0V8N4IeSZvUFpCTd6ZM9OSzBeJxu3BIvVtaLpJ7qz8b7qqvtMmk8E9Jwac/ORtnt0yu3zyotHukEpnpLrlbutI9ymM3yzf2FfwWTMiwjgVepQptLFPYj1lWTUx57OtbiwKi8wXGyO7CixKI9ln4Lu/2/jKlfFQrWmMABQ1FOmzu7/CpKixgEeOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OrDTTcCdYfmW6Grig268DM8+3+aZB42iH2+8UOaZtW0=;
 b=K+jRSL8xYceZJ+juF+9TfG0Bjtp+gWON8lFpLuuOBUlWk8UaluahUYxQF+w8Kem8bMri/se6RQAizltAJoiQO607euQwwLZLK3KulRE8zqmVWMsQBQ458GLKZLm4eb2nzva+arIlmmByh9mjPNzNXSTrnOqK7IOVSnT1dlqAKkqh42q4alVNeoJdfrPg+3rmqH2NMitJMiGQ2UrTV9RLnJexHd4rCBNCCvnGyXuE/PImaMqSpccvOmijPm2/SQvE2s8+OqwZdWuxNwKVVhq9CB1+BBAZ3q+x81Z9QUEHREIdxAR1ny3ZjjiqwUdNvJv78n0V9es9cW7B4mTa9WAFLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 DS0PR12MB8218.namprd12.prod.outlook.com (2603:10b6:8:f2::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.13; Mon, 13 Oct 2025 06:21:31 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 06:21:31 +0000
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
Subject: [PATCH v5 09/14] gpu: nova-core: Add bindings and accessors for
 GspSystemInfo
Date: Mon, 13 Oct 2025 17:20:35 +1100
Message-ID: <20251013062041.1639529-10-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251013062041.1639529-1-apopple@nvidia.com>
References: <20251013062041.1639529-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5P300CA0019.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:1ff::11) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|DS0PR12MB8218:EE_
X-MS-Office365-Filtering-Correlation-Id: 62225b06-2816-496a-c7dc-08de0a20bfcb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sQMmekzS2B4dERsxgM7nyM9oEaMJH0jsXuMoL1Od6XzcmVJ56cDGidUvgOHb?=
 =?us-ascii?Q?d8iXexhJNRCCjl5uYnQb7kc3x0MvR8ei3+jp/w2XEK7Vo1iW7tRQMnTbmsf0?=
 =?us-ascii?Q?1I6BPLP6kfU+DnMC7bqwqzUwcjphnoA/pRhTBX+eNvuB8mNiQzoLfTLPUl4E?=
 =?us-ascii?Q?hhhC1H8EWWnx2Eqqyhw3086OsYCPYZGFOa6RYfrkltFoWLKHotnxBxM8k0O1?=
 =?us-ascii?Q?nNR7+JnfZFkr6/Vn19yqYdVdONQSmUeksLUO+w0xYZhapsErshR59HFVNDtH?=
 =?us-ascii?Q?NhxLdnKjJsI4XN14t4duIh2U0un+8YR18XYMibLzgEcf5Rijr1kl9C+aS2Rh?=
 =?us-ascii?Q?uuJPXfIfWUtSfcABOU8MUn1WKSwmtLx731g7FJYrJ3bJtnyWEdnW2dQ01pD3?=
 =?us-ascii?Q?3x7Tubrz+RQc4/eyJ+CITspT5Xu3xD2ISYVdFqyWzii+PpJ65oODvMSKYQ6+?=
 =?us-ascii?Q?S1WtHGd574wxsnF5wP+JOae60YQ1DI/+UUlfp4IFjStbADrVvHZF1FUgtO/I?=
 =?us-ascii?Q?oMZ+zDb2TTuBmKrQr5la+O2tCPcRWZOBBlTvoFC/6rEHrHcVTZHCpXsRzsAk?=
 =?us-ascii?Q?jN/CMUgkBJSUl1X2f46DniOR1XFtX7kbDKeSeMp1OVJJPwDFoKwPDIwwc03w?=
 =?us-ascii?Q?9kV+RCqVrDlUaW3sl4vLat131gT6yTDpOmv8Jg9HsVWSogJsoNRfEJy1PSP2?=
 =?us-ascii?Q?eTrIUy7Z6nRRiBK/h8WLRUMj7X9KwAYfxynvDDHB1pPskxGK8jjWaIesVwl/?=
 =?us-ascii?Q?msynnBtQZg2muTIW864X5Gv4RyNkYju4vL9Bl6bp7FvB2xSJiaHf7LOXv01i?=
 =?us-ascii?Q?iRD5p10Ubv2c1ZSdXl7kUHDIQqJWIxj1zS8IGbKJHXTqkKK95ivPSVZGdHAW?=
 =?us-ascii?Q?eUoW1QnJ2Rh8YeyvknlkcZbf+ZhaEHp0ho5D7K1Z4w+4r89YFm8ufwuovDcE?=
 =?us-ascii?Q?9Vkh8r2P4uEQnyydzfiDN9bmLPQNh32J913NcfdhmKxLmPbHvABdSeWMUb+g?=
 =?us-ascii?Q?sbcamnB8R40lp1QovJVFNDLImr9GMqBcAwSmLqs0OiLkD5jTQ7Lwr9MpK6i1?=
 =?us-ascii?Q?TIRHMAmRw4jyF8awkWzUBdCpCQAZKqKzYdh51WVF+9nVC+1hglNkmFLcnAmg?=
 =?us-ascii?Q?cmpCf7TXy6NQy2YkF2tEVvrjycAoKExSBSqWvBZnuGVkVa71cIMDKMTX2dIp?=
 =?us-ascii?Q?5tZmln3e1ZZlrO53s8wvKT7zzW7zVanA8ZtNk0MqVVNvyfH/rnCl+ouh7MSO?=
 =?us-ascii?Q?9dGME6swRlHB2uJpEI+wugUwh/bt4pbrV8lHHTf8Yfoyz0zsmBi/kdGtBugU?=
 =?us-ascii?Q?uRZK632QjcHw7zqPPZ7qf0Vgr0JKjmA3slTvX9YwjTUJoW3Rhg51xwxokVbQ?=
 =?us-ascii?Q?bJlPJvMtteI1HSJqKIxa3mqTQKrIJ66xMTZRBcLCZMSqug3Ko/Rn1MMunUWP?=
 =?us-ascii?Q?bvKZCTbyNegef5rqycjNvoiwmKLGKU2r?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?7s40fNOm0aUQWtwWMycHL+i+mfVf9I9zeWqnGCzkx8m6Sex7Plt2yK/Mdp0F?=
 =?us-ascii?Q?2WA/AUvMFnd/Gsy0bDtFMSRY1YzPkniU7wnSW/W/eki9MB8OPdwDk/+LJzFS?=
 =?us-ascii?Q?bSjNH0fHLqnMmStZ0cDWpINhdA79wOB9IPluVDXIENVpvxla/kE7Rp7jRvtZ?=
 =?us-ascii?Q?2YZPpD6GmG3mdk1K6RYR4PDSeyzZfdrBfu+zIxnKNnPG8ytV/KJZmPLGp+9v?=
 =?us-ascii?Q?eEP3qG72SUfK8lvJ9LScUNG8qOwuNzSzu2FXI63B/QchpSqHy/9EX/UvqIZp?=
 =?us-ascii?Q?4ig6C+ShSm50fC0SDt3M79kBHuLOZ3EbyZC5gAvasVEd4ISWk0RRAaND0aCe?=
 =?us-ascii?Q?kyLV38TzS0Y0o+lxDF/zkY4es65rmDtbptgurL+mRWDThxRaO5BdN6UgSBDC?=
 =?us-ascii?Q?kfJQLbzSOpQyKn8DXNAnqGd75LwekBkN1XgVfPCXH1I8FgNF7sKUOHZNa53A?=
 =?us-ascii?Q?wbJTF0xpbEbxJklQkAoEK/gL0ETsO/MYHScjoWdGulBDPCBhoS197Ny4D9V/?=
 =?us-ascii?Q?yImkbEOkq8s9QOoDZA+MFqeE7hqu7/CndJ3MVNaRa08IozG9AwjgpzYjFGjf?=
 =?us-ascii?Q?t+bLh4+Kt6yEa/6lUgA+P80J57/RX+Fd8ytss4rSmraRqY8EBxeCZkpJVbuj?=
 =?us-ascii?Q?fACQ6yeiLa+DKDDlqIrkhD2izCpRYE7jy6T3YnrlTIyG1XR8QY0XpcFqZnIC?=
 =?us-ascii?Q?MPTjAu1RIFCoLXXRydN0s23mgpSb74PH0bIiw0oSNojnSXpIVWvPH3ifqzlH?=
 =?us-ascii?Q?QG2BvCt04a5lP92sSQ8ryWlzPHHpQ1eRZIg8wpzsySsSqHlfRlpjVT2UDIb+?=
 =?us-ascii?Q?X6WMQQLefJllzz6oPPau7Rn1n46egrq6M8MNxVag3fel1fp9Rxia6/KCyBLL?=
 =?us-ascii?Q?4ANel62iU2T2jLsL5fx/1XmIe8YbNfFxfWl2EQljsilakthklabFInfBB6vR?=
 =?us-ascii?Q?0HK7RqsB74J6GDlPXMFefENppvBKLVb3HtvqBBS8jFMOYrRpuh6TVVYoavp8?=
 =?us-ascii?Q?dryLqwv/+vAdo8cTI+Ue6glLgWfCAVJAlJysoyVSVToJDYyd3eiT5KTeoexS?=
 =?us-ascii?Q?0YmJd/MmGEMhm3RF4MKaw6jJ9sHDQS1svK5Ur/3XtEEaX1j3DaSOhZSuTnrB?=
 =?us-ascii?Q?wOjbApYQiJh01dAQ/Un1/GnSWjk6WlcmYi4BwpoJl0R8NjwmW3SmAhj5Ycrn?=
 =?us-ascii?Q?aueK2Wt5tzFe7YPypdDd/LTlZcPYWzQ/qSlnP+Xm6bBBgU6akiFNn5YOvZaw?=
 =?us-ascii?Q?G2Ydj5jtK0xll846W5c/vkXdWbBpNkQcDGyQpK0zB4VpAukVjF86Ub3m5DQ6?=
 =?us-ascii?Q?7+uX7BsNKAiwVyykZagMSk7bJiEgOhaHXazODZ21ln//FtFHa/7LezjG5Bh7?=
 =?us-ascii?Q?9HAsDJpkseNfB1oFcXntX2a6Ys1HOjwYvHUbg1rUlnrPKKH4mOqHOMNfh57H?=
 =?us-ascii?Q?4Cfyu/R8ohaex8h2IVvLNC0WvU0uEpCLh0DEoo+qRbwV6eaEj/T3HI5qhXex?=
 =?us-ascii?Q?46IujlaeV41hNZPCrL+ZS8LcucCoZEIa9ElckjYEE3SIEeQo4v/4p15QWTMQ?=
 =?us-ascii?Q?iMs7BRVDskz84YDTz+Sj8EPh0ufzs0imPayB+BQ0?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62225b06-2816-496a-c7dc-08de0a20bfcb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 06:21:31.0126 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J8XTT4JmxP4vr05GadqY5pgQAAYp6/3YH6myiJnLgOIioo6qlC4Ry6tfcRtjsKQrgm3Slk+IasWn4MPfJNMuaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8218
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

Changes for v5:
 - Derive Zeroable trait

Changes for v4:
 - Use `init!` macros

Changes for v3:
 - New for v3
---
 drivers/gpu/nova-core/gsp/fw.rs               |   1 +
 drivers/gpu/nova-core/gsp/fw/commands.rs      |  51 +++++++
 .../gpu/nova-core/gsp/fw/r570_144/bindings.rs | 132 ++++++++++++++++++
 3 files changed, 184 insertions(+)
 create mode 100644 drivers/gpu/nova-core/gsp/fw/commands.rs

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 70abda1c2af8..4563e33e0859 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
+pub(crate) mod commands;
 mod r570_144;
 
 // Alias to avoid repeating the version number with every use.
diff --git a/drivers/gpu/nova-core/gsp/fw/commands.rs b/drivers/gpu/nova-core/gsp/fw/commands.rs
new file mode 100644
index 000000000000..9a524bba1ac4
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/fw/commands.rs
@@ -0,0 +1,51 @@
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
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index 17fb2392ec3c..1251b0c313ce 100644
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
-- 
2.50.1

