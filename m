Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8519C3DC38
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 00:12:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A51410EA07;
	Thu,  6 Nov 2025 23:12:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WEnxAM9i";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010042.outbound.protection.outlook.com
 [52.101.193.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D12810E9FE;
 Thu,  6 Nov 2025 23:12:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KDwrqdvS+1fGkqNnwuratg60T9jPt8d1KEsVMBywUTS4WoyI9uFfH3hUEe0FgTL0vXG20dYGt8YyzFGqsLMNg6uJZ0NLJ4Oh679qIPAwHQJwKXW61cXeNIWp3RcBZVwICLQT79Kxg7T9SVaGuM7E1pwor5xXDzfMQM5Q1IXUmzIst6U5vYQ8GYHqkGz9yC/YD9oRsgq6l3O2UsfBof6+vXj2VME208T2kfsnGgfiArj3VOcMGcQujcdiYdl4T90L+OR2g6z0lCMfCVtYDGwkn6pZfxk8Gd0+DNoqHBIVKT2+bNmVg9AUQ3kVLpyx411XEPMOhg7cO7pdcIf7EYqx1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iWh7+tfyLwRl1V3uybEHdZJ6cHsCHGtA3huvF4FE4v4=;
 b=MxizEfDpfRY8Hr78zztMOnLP7RJpm9R6a8sQNOBh0ArLIIsrpMY5rRd8YuBDXUAaCJnBY4DOBYltO1KTSER7Cr3Ow8tfGx0gGVT3ztGdN0QTo52fVblrwctsabsNp+Ek+2NrwxoR+tJXUJkYTNXzXdqUP4p20CrrhtRUZ5XeAlmGkRnNLhRxp8ADa6eFaKdCLsIi+P7Ypsgx2Jic+qFIMYs+skKePo4GwXiMElWew8eRs3Oq0EvVoljCaKbd/c3Vug/NPkEc4KrD1AuPvhe7lKciB0Y8BXHjLHlJdwvALwLBsMFI63YlQq49mwGwS6116yXhVBZKmxmqnL1+n9Sr6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iWh7+tfyLwRl1V3uybEHdZJ6cHsCHGtA3huvF4FE4v4=;
 b=WEnxAM9iNya7+D+GcqpExxmtLoR3s20T5WATnGMs4I+9KV1uYnhufvDnWA8mBnS5Af1ZTD7CBS4BrZug9tpPJX2diEPIQI/+IelAlNlzotK/Xw55zWN6bLpoqMJGjGiik0vE4yH5rjmcXn5/2GFQ+38YhvWZjAyD9MnIwl+Rgjh6k71ECp+bxw9G0PPbS0P7DSi+tG/lOE9lpiF7h+pEZbEEM0RP9W/7Y38atzReaQb7JZ/KvF23Zv1y16L8oG79CaGG7CbWcBpchw+ylQDMDxxRGyaLkltTcOV4CNFdhQx8dHQLbEUA4ocQF/92vNDTrsjkT1JS7pdgfO+WBkF5pw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by BN7PPF62A0C9A68.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6d2) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 23:12:17 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 23:12:17 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dakr@kernel.org, acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, joel@joelfernandes.org,
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org
Subject: [PATCH v3 14/14] gpu: nova-core: gsp: Retrieve GSP static info to
 gather GPU information
Date: Thu,  6 Nov 2025 18:11:53 -0500
Message-Id: <20251106231153.2925637-15-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251106231153.2925637-1-joelagnelf@nvidia.com>
References: <3b0d776e50fc81797dec2e5d81c86390af78f848.camel@nvidia.com>
 <20251106231153.2925637-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:208:c0::38) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|BN7PPF62A0C9A68:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ab1bf85-8ba2-4863-78ee-08de1d89eddf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ib5OlzVVFXYKZ4dZvbnBJZhhx7XijDdH3vIHpRwitt03oFhO53nsi1cgxfKF?=
 =?us-ascii?Q?gMSWU/sKPuCLDDD5qzpkGXgB/AbQwg+5Rfy0TmAiRunwrH1sZLbLAQqsiZPO?=
 =?us-ascii?Q?ePsjtHKqUDp/4aiuVQltU1qJOEpgPeCxuKM9+3SiNBkE4vrnD8s8CjC8c6+i?=
 =?us-ascii?Q?d27WFQHSvp4ZlSVeJw+bMLsmezsTTXCKX94WvE3VwRuyY1GyPwcfhY479hry?=
 =?us-ascii?Q?IEwWPYaA3gqWztZT+7f19pjQ6v1Rk46C/uy0HiCmpNlrn/vtkHcKc41Dhn4C?=
 =?us-ascii?Q?jIDpJJDV0h0cgHKjdOTL0SFsv1zyUv5ZE4uurfGAV/KEATzWjMHr823a/pR5?=
 =?us-ascii?Q?XEclDigx+1HxLg+Ek8zvq8es/FSANlkmi5rlNE6ep9ZbcFC8I+Rd4B4vE0IM?=
 =?us-ascii?Q?FKdk1sKxpWS1EgkUhTvuTOE//n7gSNZkgzjt/SJgele80M4s/s8NoEc8bIxd?=
 =?us-ascii?Q?BcZivUIHunjLRYZU2meRrD1irE5BXonAJN+sOAgmphoTmgyJfLbA1BJnEjvc?=
 =?us-ascii?Q?AapWqvoT/Hc7ejau3FTY+BPe59J4rXYYqIBMgujRd5dTTWaDHmLl7XlQ1Jz5?=
 =?us-ascii?Q?g4ENfANLpVWKrs9MACcnRyZK8IM+6Twvt/twYaTwU0SSXC9KXfcPvNmExx6P?=
 =?us-ascii?Q?hXgUcU2MDR5cEuCJiNvUVW3xmHy/A/lAsXas9g5p05uWgT6SgGP/Xz1zWEph?=
 =?us-ascii?Q?3GKvHAnvP4Hl4CzZ3W5Xl3+vm3lvOkxDCvYa4XUPtI45H9RNpgzUKEP+L2/r?=
 =?us-ascii?Q?7vwKanp1NylJIp59VQRiXwrMVbO4dsvvjVCNXL5mbapw2bKLqhcCBcNCWMWw?=
 =?us-ascii?Q?9o+XRdC5TyyHznITCigug4peLHDyy5MZvffKtgnVoq1qNxKwyzqdJUa5DLej?=
 =?us-ascii?Q?aU0+9nDSvlUkqQHDt1LAu9CkEmqnN+TGiwrvDFH9o6n+bVo2ZDAcQT4+n/2W?=
 =?us-ascii?Q?CkyIHNxSqVdkQzudQfGWIzqdrzV93wDYJ22HSDdV2q43XTbM460JlzLlxqXU?=
 =?us-ascii?Q?PBb+XbKV+WnNyhhCAPsky14DztGf/JMnHrufMutfYTy44KFuXqbIE82QlNmw?=
 =?us-ascii?Q?ENpmjgmg9l4kCoyymQm8XKaABCuwz3J52oU8X+t/X/lQDaYjM4g8hnCvJOzS?=
 =?us-ascii?Q?Unz5zZy4eZFv3sJ4Mf92vpMQBUFQD4IjSBNucJJQIM7KHyJ3asvRMN2w1Rn2?=
 =?us-ascii?Q?E4zca/lSPzeN1mksuRVgGhWW/iHMXZ2F+QTvNyKJ1+Uzt42Ml4csodRL5PCp?=
 =?us-ascii?Q?pVRP/Bkzm+oADKOVhHYaZmGD0WEzpREnF9Vlc08MrapJGbPWG0653040eQxJ?=
 =?us-ascii?Q?9sCokJ+I8sGBG+L5dShogiBAGwc/OB0w+HdsHWKXDoHX2ciP5UOcap14/IgX?=
 =?us-ascii?Q?7zlzrEH0eKDKy9G1ELXIp8u6jKTbSqYNuYzqfkYD9RTbkGPmrVi6isP5/Xqo?=
 =?us-ascii?Q?4Ry1gcJRfneyqxY4w8W8XtKI3TX9dim6?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I9W0Vg4k2MahnnvCjcQ79x8T5koQEpMlNT/W1EsIWCkBB+liRVP04lqnJqxj?=
 =?us-ascii?Q?5TkqJDqEopiP/Jf3f/ygk8GrYQlEDMAhRPN7DxcsQR2hzlqYBLddpuZHNZbT?=
 =?us-ascii?Q?+iFwtyhYsqB+rjhrHNRZnMs1cJcF4XLczZ9jUL5F8HRaNRxd3VcH/QiSbHrz?=
 =?us-ascii?Q?PJhj/hcTwzAGh8UCq/z+5AmTvxe9rXA5GQA+08j98102mW1cSnYlvE4xw3h/?=
 =?us-ascii?Q?wxYCduPdOZVg1VNwAPX1EO8Zfqly634uj19//HlDuRnmseRsuLydtH/vAJpP?=
 =?us-ascii?Q?99Yam6qOfP52ixH4/ExPJdaDt2Z7HtUaQwbBDHasyo39bgvlGyc5Qt8iV8pS?=
 =?us-ascii?Q?YkgCXC+U7rM5Nb3eQyzgZ7YzKsrx+SUeX8L1K9t011TC9UztgfKBOIAPqvGp?=
 =?us-ascii?Q?HTMa9TimNvTtqonwLTKVLu7VJu+bd5HNZZQmxByCzxmxlijRMvKYrDi18sLy?=
 =?us-ascii?Q?AD39EU1QVjM7S0U7fty1fPVaCsPlCRMf9/O0cnI63T67tdOcyiop2X9GTbmc?=
 =?us-ascii?Q?3CMkdYhMV+GYxRev+LWduCxtCYXXl7ag1pyYPlKllwsEEPTbFWgbODL1Hfe4?=
 =?us-ascii?Q?uummxq60/yOwk5piIjilOjyDHQcvyV/DKB/t+k6VEDoqBvXSbCKbojB5swHU?=
 =?us-ascii?Q?6sYdf69bYmXtnyu1f0xJDEef7S+urDc5dYH2jZJEKTDlXekhKEhqCkJ5lEKu?=
 =?us-ascii?Q?isIgrZKGcrti+M4BWxQznnJUtVFJ0px1eSvz9HuFj/Snz8j32/GgqHhHzEkC?=
 =?us-ascii?Q?o1gTorfsul8hABvUAB52Glc5/p7c3cOc8RcJd8zIJf+/QusCX4I4mHWzKZx3?=
 =?us-ascii?Q?2bSgmnfNV5n6UONA+v0QxMSAopN0oyexEU1kXrlvKmp0QMUk6+9c2g6AfWBB?=
 =?us-ascii?Q?Xt4GL0jX96gYWV+OKhPkddO6eIOTu3eBuS8Y3iis32oz46G3aqTxP7vkxonR?=
 =?us-ascii?Q?Yn6K7mTJF5qQwSMHVv4ANxyBhd7XaRHsdWccEy1dF9fIlCPGTLuC1ijLhLLj?=
 =?us-ascii?Q?vnr5YUNEwlQ71yDC4/84UC9zZxDJY1cMUQFyQGBSTSSW44Rzj7qs7emCRzvC?=
 =?us-ascii?Q?1DxeR7Vz/tVAz8N4qnAM26qGef8IhFT7W9rAIy+K7eRbJ+HbOPpKm/nyaryT?=
 =?us-ascii?Q?4gk5gMEUlG2fkMQCdsIbG0faui4/HGJWZ7wi4i6whadqFpvvuJDEPbloiz7u?=
 =?us-ascii?Q?biAY/50GYPi+HAxTcGBpNMgMzxj/gBcEseswRigP/p/2DZVkybfP8iJdwpRL?=
 =?us-ascii?Q?2AIehhUsMI0j5hiUVwBril4V8F/pPwH+Mdbfy5l9TzLNdtx2+zL07zpwhAwx?=
 =?us-ascii?Q?KS7qG+GBAJkyle1lMzXvyGuzNnDpT1DIuPsaflND6gm3y8ehCL/jicJ/NHOZ?=
 =?us-ascii?Q?5M/OAvyaJJiHxnWNCbyNL/o9YP4+mTinyxcOp50HiHZcIKvucZydbn7xuaWU?=
 =?us-ascii?Q?uvDd+pxeiqGEa1XBTiKsRT974/5D0F74v3ymdrPAsv3nj2MvVnYYK0YZULeg?=
 =?us-ascii?Q?PsxGmZYaCXHqPQxpyneXY/L2UoiDbqs5THsLDxLLcDQav7xrRn16Xmrb1Ua6?=
 =?us-ascii?Q?0vOiXCau+66R/uF2EyWrExmZ5u7h+RPUDFryK1eZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ab1bf85-8ba2-4863-78ee-08de1d89eddf
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 23:12:17.3134 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OUWbCAQows+WHtc3SbGTS6C6sAZiCzs3EFIR3a4WrgVpS8GsGnLoqyQc284TPNnh9tZ/l2e1E6HCTF5bC8ZuWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPF62A0C9A68
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

From: Alistair Popple <apopple@nvidia.com>

After GSP initialization is complete, retrieve the static configuration
information from GSP-RM. This information includes GPU name, capabilities,
memory configuration, and other properties. On some GPU variants, it is
also required to do this for initialization to complete.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
Co-developed-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs             |   8 +
 drivers/gpu/nova-core/gsp/commands.rs         |  63 +++++++
 drivers/gpu/nova-core/gsp/fw.rs               |   3 +
 .../gpu/nova-core/gsp/fw/r570_144/bindings.rs | 163 ++++++++++++++++++
 drivers/gpu/nova-core/nova_core.rs            |   1 +
 drivers/gpu/nova-core/util.rs                 |  16 ++
 6 files changed, 254 insertions(+)
 create mode 100644 drivers/gpu/nova-core/util.rs

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 0dd8099f5f8c..b8588ff8d21e 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -20,6 +20,7 @@
 use crate::gpu::Chipset;
 use crate::gsp::commands::{
     build_registry,
+    get_gsp_info,
     gsp_init_done,
     set_system_info, //
 };
@@ -31,6 +32,7 @@
     GspFwWprMeta, //
 };
 use crate::regs;
+use crate::util;
 use crate::vbios::Vbios;
 
 impl super::Gsp {
@@ -226,6 +228,12 @@ pub(crate) fn boot(
         GspSequencer::run(&mut self.cmdq, seq_params, Delta::from_secs(10))?;
 
         gsp_init_done(&mut self.cmdq, Delta::from_secs(10))?;
+        let info = get_gsp_info(&mut self.cmdq, bar)?;
+        dev_info!(
+            pdev.as_ref(),
+            "GPU name: {}\n",
+            util::str_from_null_terminated(&info.gpu_name)
+        );
 
         Ok(())
     }
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 521e252c2805..e70067a49d85 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -11,6 +11,7 @@
 };
 
 use super::fw::commands::*;
+use super::fw::GspStaticConfigInfo_t;
 use super::fw::MsgFunction;
 use crate::driver::Bar0;
 use crate::gsp::cmdq::Cmdq;
@@ -23,6 +24,17 @@
 use crate::gsp::GSP_PAGE_SIZE;
 use crate::sbuffer::SBufferIter;
 
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for GspStaticConfigInfo_t {}
+
+// SAFETY: This struct only contains integer types for which all bit patterns
+// are valid.
+unsafe impl FromBytes for GspStaticConfigInfo_t {}
+
+pub(crate) struct GspStaticConfigInfo {
+    pub gpu_name: [u8; 40],
+}
+
 /// Message type for GSP initialization done notification.
 struct GspInitDone {}
 
@@ -49,6 +61,57 @@ pub(crate) fn gsp_init_done(cmdq: &mut Cmdq, timeout: Delta) -> Result {
     }
 }
 
+impl MessageFromGsp for GspStaticConfigInfo_t {
+    const FUNCTION: MsgFunction = MsgFunction::GetGspStaticInfo;
+}
+
+impl CommandToGspBase for GspStaticConfigInfo_t {
+    const FUNCTION: MsgFunction = MsgFunction::GetGspStaticInfo;
+}
+
+impl CommandToGsp for GspStaticConfigInfo_t {}
+
+// SAFETY: This struct only contains integer types and fixed-size arrays for which
+// all bit patterns are valid.
+unsafe impl Zeroable for GspStaticConfigInfo_t {}
+
+impl GspStaticConfigInfo_t {
+    fn init() -> impl Init<Self> {
+        init!(GspStaticConfigInfo_t {
+            ..Zeroable::init_zeroed()
+        })
+    }
+}
+
+pub(crate) fn get_gsp_info(cmdq: &mut Cmdq, bar: &Bar0) -> Result<GspStaticConfigInfo> {
+    cmdq.send_gsp_command(bar, GspStaticConfigInfo_t::init())?;
+    cmdq.receive_msg_from_gsp::<GspStaticConfigInfo_t, GspStaticConfigInfo>(
+        Delta::from_secs(5),
+        |info, _| {
+            let gpu_name_str = info
+                .gpuNameString
+                .get(
+                    0..=info
+                        .gpuNameString
+                        .iter()
+                        .position(|&b| b == 0)
+                        .unwrap_or(info.gpuNameString.len() - 1),
+                )
+                .and_then(|bytes| CStr::from_bytes_with_nul(bytes).ok())
+                .and_then(|cstr| cstr.to_str().ok())
+                .unwrap_or("invalid utf8");
+
+            let mut gpu_name = [0u8; 40];
+            let bytes = gpu_name_str.as_bytes();
+            let copy_len = core::cmp::min(bytes.len(), gpu_name.len());
+            gpu_name[..copy_len].copy_from_slice(&bytes[..copy_len]);
+            gpu_name[copy_len] = b'\0';
+
+            Ok(GspStaticConfigInfo { gpu_name })
+        },
+    )
+}
+
 // For now we hard-code the registry entries. Future work will allow others to
 // be added as module parameters.
 const GSP_REGISTRY_NUM_ENTRIES: usize = 3;
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index bb79f92432aa..62bac19fcdee 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -547,6 +547,9 @@ pub(crate) fn element_count(&self) -> u32 {
     // GSP sequencer run structure with information on how to run the sequencer.
     rpc_run_cpu_sequencer_v17_00,
 
+    // GSP static configuration information.
+    GspStaticConfigInfo_t,
+
     // GSP sequencer structures.
     GSP_SEQUENCER_BUFFER_CMD,
     GSP_SEQ_BUF_OPCODE,
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index c5c589c1e2ac..f081ac1708e6 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -320,6 +320,77 @@ fn fmt(&self, fmt: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
 pub const NV_VGPU_MSG_EVENT_NUM_EVENTS: _bindgen_ty_3 = 4131;
 pub type _bindgen_ty_3 = ffi::c_uint;
 #[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct NV0080_CTRL_GPU_GET_SRIOV_CAPS_PARAMS {
+    pub totalVFs: u32_,
+    pub firstVfOffset: u32_,
+    pub vfFeatureMask: u32_,
+    pub FirstVFBar0Address: u64_,
+    pub FirstVFBar1Address: u64_,
+    pub FirstVFBar2Address: u64_,
+    pub bar0Size: u64_,
+    pub bar1Size: u64_,
+    pub bar2Size: u64_,
+    pub b64bitBar0: u8_,
+    pub b64bitBar1: u8_,
+    pub b64bitBar2: u8_,
+    pub bSriovEnabled: u8_,
+    pub bSriovHeavyEnabled: u8_,
+    pub bEmulateVFBar0TlbInvalidationRegister: u8_,
+    pub bClientRmAllocatedCtxBuffer: u8_,
+    pub bNonPowerOf2ChannelCountSupported: u8_,
+    pub bVfResizableBAR1Supported: u8_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct NV2080_CTRL_BIOS_GET_SKU_INFO_PARAMS {
+    pub BoardID: u32_,
+    pub chipSKU: [ffi::c_char; 9usize],
+    pub chipSKUMod: [ffi::c_char; 5usize],
+    pub skuConfigVersion: u32_,
+    pub project: [ffi::c_char; 5usize],
+    pub projectSKU: [ffi::c_char; 5usize],
+    pub CDP: [ffi::c_char; 6usize],
+    pub projectSKUMod: [ffi::c_char; 2usize],
+    pub businessCycle: u32_,
+}
+pub type NV2080_CTRL_CMD_FB_GET_FB_REGION_SURFACE_MEM_TYPE_FLAG = [u8_; 17usize];
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct NV2080_CTRL_CMD_FB_GET_FB_REGION_FB_REGION_INFO {
+    pub base: u64_,
+    pub limit: u64_,
+    pub reserved: u64_,
+    pub performance: u32_,
+    pub supportCompressed: u8_,
+    pub supportISO: u8_,
+    pub bProtected: u8_,
+    pub blackList: NV2080_CTRL_CMD_FB_GET_FB_REGION_SURFACE_MEM_TYPE_FLAG,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_PARAMS {
+    pub numFBRegions: u32_,
+    pub fbRegion: [NV2080_CTRL_CMD_FB_GET_FB_REGION_FB_REGION_INFO; 16usize],
+}
+#[repr(C)]
+#[derive(Debug, Copy, Clone)]
+pub struct NV2080_CTRL_GPU_GET_GID_INFO_PARAMS {
+    pub index: u32_,
+    pub flags: u32_,
+    pub length: u32_,
+    pub data: [u8_; 256usize],
+}
+impl Default for NV2080_CTRL_GPU_GET_GID_INFO_PARAMS {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+#[repr(C)]
 #[derive(Debug, Default, Copy, Clone, Zeroable)]
 pub struct DOD_METHOD_DATA {
     pub status: u32_,
@@ -367,6 +438,19 @@ pub struct ACPI_METHOD_DATA {
     pub capsMethodData: CAPS_METHOD_DATA,
 }
 #[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct VIRTUAL_DISPLAY_GET_MAX_RESOLUTION_PARAMS {
+    pub headIndex: u32_,
+    pub maxHResolution: u32_,
+    pub maxVResolution: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct VIRTUAL_DISPLAY_GET_NUM_HEADS_PARAMS {
+    pub numHeads: u32_,
+    pub maxNumHeads: u32_,
+}
+#[repr(C)]
 #[derive(Debug, Default, Copy, Clone, Zeroable)]
 pub struct BUSINFO {
     pub deviceID: u16_,
@@ -395,6 +479,85 @@ pub struct GSP_PCIE_CONFIG_REG {
     pub linkCap: u32_,
 }
 #[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct EcidManufacturingInfo {
+    pub ecidLow: u32_,
+    pub ecidHigh: u32_,
+    pub ecidExtended: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct FW_WPR_LAYOUT_OFFSET {
+    pub nonWprHeapOffset: u64_,
+    pub frtsOffset: u64_,
+}
+#[repr(C)]
+#[derive(Debug, Copy, Clone)]
+pub struct GspStaticConfigInfo_t {
+    pub grCapsBits: [u8_; 23usize],
+    pub gidInfo: NV2080_CTRL_GPU_GET_GID_INFO_PARAMS,
+    pub SKUInfo: NV2080_CTRL_BIOS_GET_SKU_INFO_PARAMS,
+    pub fbRegionInfoParams: NV2080_CTRL_CMD_FB_GET_FB_REGION_INFO_PARAMS,
+    pub sriovCaps: NV0080_CTRL_GPU_GET_SRIOV_CAPS_PARAMS,
+    pub sriovMaxGfid: u32_,
+    pub engineCaps: [u32_; 3usize],
+    pub poisonFuseEnabled: u8_,
+    pub fb_length: u64_,
+    pub fbio_mask: u64_,
+    pub fb_bus_width: u32_,
+    pub fb_ram_type: u32_,
+    pub fbp_mask: u64_,
+    pub l2_cache_size: u32_,
+    pub gpuNameString: [u8_; 64usize],
+    pub gpuShortNameString: [u8_; 64usize],
+    pub gpuNameString_Unicode: [u16_; 64usize],
+    pub bGpuInternalSku: u8_,
+    pub bIsQuadroGeneric: u8_,
+    pub bIsQuadroAd: u8_,
+    pub bIsNvidiaNvs: u8_,
+    pub bIsVgx: u8_,
+    pub bGeforceSmb: u8_,
+    pub bIsTitan: u8_,
+    pub bIsTesla: u8_,
+    pub bIsMobile: u8_,
+    pub bIsGc6Rtd3Allowed: u8_,
+    pub bIsGc8Rtd3Allowed: u8_,
+    pub bIsGcOffRtd3Allowed: u8_,
+    pub bIsGcoffLegacyAllowed: u8_,
+    pub bIsMigSupported: u8_,
+    pub RTD3GC6TotalBoardPower: u16_,
+    pub RTD3GC6PerstDelay: u16_,
+    pub bar1PdeBase: u64_,
+    pub bar2PdeBase: u64_,
+    pub bVbiosValid: u8_,
+    pub vbiosSubVendor: u32_,
+    pub vbiosSubDevice: u32_,
+    pub bPageRetirementSupported: u8_,
+    pub bSplitVasBetweenServerClientRm: u8_,
+    pub bClRootportNeedsNosnoopWAR: u8_,
+    pub displaylessMaxHeads: VIRTUAL_DISPLAY_GET_NUM_HEADS_PARAMS,
+    pub displaylessMaxResolution: VIRTUAL_DISPLAY_GET_MAX_RESOLUTION_PARAMS,
+    pub displaylessMaxPixels: u64_,
+    pub hInternalClient: u32_,
+    pub hInternalDevice: u32_,
+    pub hInternalSubdevice: u32_,
+    pub bSelfHostedMode: u8_,
+    pub bAtsSupported: u8_,
+    pub bIsGpuUefi: u8_,
+    pub bIsEfiInit: u8_,
+    pub ecidInfo: [EcidManufacturingInfo; 2usize],
+    pub fwWprLayoutOffset: FW_WPR_LAYOUT_OFFSET,
+}
+impl Default for GspStaticConfigInfo_t {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+#[repr(C)]
 #[derive(Debug, Default, Copy, Clone, Zeroable)]
 pub struct GspSystemInfo {
     pub gpuPhysAddr: u64_,
diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index c1121e7c64c5..b98a1c03f13d 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -16,6 +16,7 @@
 mod num;
 mod regs;
 mod sbuffer;
+mod util;
 mod vbios;
 
 pub(crate) const MODULE_NAME: &kernel::str::CStr = <LocalModule as kernel::ModuleMetadata>::NAME;
diff --git a/drivers/gpu/nova-core/util.rs b/drivers/gpu/nova-core/util.rs
new file mode 100644
index 000000000000..f1a4dea44c10
--- /dev/null
+++ b/drivers/gpu/nova-core/util.rs
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/// Converts a null-terminated byte array to a string slice.
+///
+/// Returns "invalid" if the bytes are not valid UTF-8 or not null-terminated.
+pub(crate) fn str_from_null_terminated(bytes: &[u8]) -> &str {
+    use kernel::str::CStr;
+
+    // Find the first null byte, then create a slice that includes it.
+    bytes
+        .iter()
+        .position(|&b| b == 0)
+        .and_then(|null_pos| CStr::from_bytes_with_nul(&bytes[..=null_pos]).ok())
+        .and_then(|cstr| cstr.to_str().ok())
+        .unwrap_or("invalid")
+}
-- 
2.34.1

