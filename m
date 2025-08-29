Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B4A6B3C1CA
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 19:33:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 280D210E29B;
	Fri, 29 Aug 2025 17:33:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="aetsdzm8";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2072.outbound.protection.outlook.com [40.107.223.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BEDE10E1B2;
 Fri, 29 Aug 2025 17:33:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LOye8F8DVptJiAqyD8/mPOgNgeVtne9CXLRrsHJ0y+1BeuIa3Plg81W9LcRYlQ6YfvEVxSIwj3ZbP+w4GqQcPoogIgbXQG/tUngdDI1qe5B502FfVtksplgcNGEwgqEDpoae/nwoo/FEtrXCXsR8E4s7LzzOZdEJaBYmqntkrynMFrQDBAMsIxa8Jt2dchgrxL4FHeLLHel0406KQMbXdUtGepQgG9HM0fTxjmTiMAhTW3DReFOHUPjwfLcMc94YCUjeu+erGvizhBVdUJFbERq/88m21ybjZP1ImCVlJVzQiDHPVrvg1G2O+ccIbf9ENsmRJV6t68r1v3XTAszkbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EDgMvAlNOcGuIe6AbIkPIQ96yqPmwFXO3Ge+RN3awy8=;
 b=TN2iQc8eAGLQZGzCbAulEpSEQZYyxbWYuHpHwf3naziXqD0UIhUs0tBHhd3BL52NYRf+pjkuywsBUm7EvMjdec/cbBEP8hkFAbqgZgG2E5ORURnVb61hm/gwU2Fw+6zUZ6Q2h8Pxfy2LIuym0LOMq/2HoljUBPrqORfVwrCsjJAtEgbBxYelr7eH0BhTV8g2K8PM2RTWdFttAaxk//HAQNzopYMYT+RfpXqKV8fzPgoImYYFIzPxiFUee25EhGiEAR5Rya7clgLz2P+nrjieXN9Uq+toy6UVgPjRc/UDUqCyM2SyX25Q8oMkU2onAmIblD0flNpRErU1LTo5aLUlyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EDgMvAlNOcGuIe6AbIkPIQ96yqPmwFXO3Ge+RN3awy8=;
 b=aetsdzm8ip89L5Y27B7CmqeIKZk22QTAhMkKO4hvzINTG3b1DeMoI5vmpxfJiirYTIglQaWiJ3vjI3BquRlxszv6fbMlgqMqBv4OZ0cTdnn8IZM4YR+xv5MiEzHFvQloYanidQy/MrMe2pDWtAgiOA3iKNUoz/1c3lZ2Jj+8wre7+O+A+UV0tjRA/Hsbz3Fc/wIazC08pncu/sqNegD3JZ+8ZLsCMz1Vu0LtpEvo/ruc3Zb01cZV9n+HWPeYTh4LPF3TSJJ7bK3E8yPzDrPJIB4SG60tk+DXB9u3CE75mmz4H/hcXPkGCwyJ9zo2PT/h6d3vD9fnWey4wXIRkHjCwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by IA1PR12MB6017.namprd12.prod.outlook.com (2603:10b6:208:3d7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.22; Fri, 29 Aug
 2025 17:33:19 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9052.017; Fri, 29 Aug 2025
 17:33:19 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
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
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: [PATCH 06/17] nova-core: Add bindings required by GSP sequencer
Date: Fri, 29 Aug 2025 13:32:43 -0400
Message-Id: <20250829173254.2068763-7-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250829173254.2068763-1-joelagnelf@nvidia.com>
References: <20250829173254.2068763-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0214.namprd13.prod.outlook.com
 (2603:10b6:208:2bf::9) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|IA1PR12MB6017:EE_
X-MS-Office365-Filtering-Correlation-Id: 4faa23bd-6a3e-4677-2761-08dde722252a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uMLWs6ZIohAmeyITg6fq5t7KCiLiwYlIEM80cZgAy5F64iUr0nb0yltxXnL4?=
 =?us-ascii?Q?DfI7z8ayXTweOXtWMXJAjoSev5ONC/tYTcUZ4+gSPNS+9+GBzRFGWlUYUcZz?=
 =?us-ascii?Q?GV4/yC8AhP2YRAKkxyI60To3+3ZB17tr7uVaojYW/2oibfV3aV98G9GMQv7K?=
 =?us-ascii?Q?LUYkfZZxbYHgZ7d/sgtAJ1HUhGNa+EtY/g61yvQpC+7HOl60CcGYHn7fbcqg?=
 =?us-ascii?Q?003US+jIBwwosfz4WbLAXdgEnmLLt2rvlm8bQnkx0xSqGbi1sFYwRAH8XoOp?=
 =?us-ascii?Q?aHo7I2Z0DU/lDGRN6UbLEmLonXr9+fTflOf6+4G4hMrl7QmweDPg5xDeq7sk?=
 =?us-ascii?Q?N054LCaeGyyF454y3xx4W81AUqjQ1dlsj7JXj1bs16C6Hk4vqr7L8nO9EXoU?=
 =?us-ascii?Q?nh0DtVFX9mBnvpdxZT5bdDEP8zXSHStNry6k5lJxUSpJ7PxlpfWMiVuStFSo?=
 =?us-ascii?Q?HT3japGgJPal7JduV03CWDkF0bDBhhXN9Un5roxREtWmg26LNHfwvmvcSrAb?=
 =?us-ascii?Q?1qhJcFCzU191fxVov2TSKUYPVQfxOEfRQtZyK0Y9Z0ipX31qDQ1avU5l6crm?=
 =?us-ascii?Q?+STL3ju+zFPfaOwgkBfxvvATL833rXy6WGrAqCR5dXbPth5Qscr+DiQiDeaF?=
 =?us-ascii?Q?MNGkThnnSGJSh8NAWjIP1Wx1Sb7amn/GVs/d/qSBhLcL4k9quekXgD9Nr9ez?=
 =?us-ascii?Q?ix5FUKdf1fjQoL2SbxNHgOFXqUkGBlKB8CBoApsRbO1OcVaZPi8/5VRAa8Gv?=
 =?us-ascii?Q?FuTMzdawAuymmdmT8HcwphxUoZhBl3rJpRCx3aN8AHaTNla54JCkmqvu/fuW?=
 =?us-ascii?Q?tPruImdXqZfGgc8jDc9aRUi/mycZOGkkELa95OAKM/IO2YDcGS2cHIr74uAt?=
 =?us-ascii?Q?AjJhnhOB1cmlNUlG7aplysctjhE548EJFdMlFWgaJjQbvk/0z1hAQY0jg1o4?=
 =?us-ascii?Q?bDSbcL7QAeKX1SC7SM6dANhutQ3E4BKWZh/0ZijFA3BLD03pZv4hoytrzU9g?=
 =?us-ascii?Q?0fzeLEcnuoldLhoYvPyfy1siJB0RGyVl2skR8QMp+a3oIaYq7HUeLM+KuLag?=
 =?us-ascii?Q?/aDSOmKFOViLwuDktGWDjJOsTFXZvudEEewZF1vIFb7T9nv7JP4btv1kzsno?=
 =?us-ascii?Q?At+x0qctVqvr/pCqqrfUEbOnmNyOj8cbLWK0GxVbWIPkX6WcKRKqnWm+m5G4?=
 =?us-ascii?Q?KEggvApf62MXNMLQmINc4ezvr46jG185CInlvS6Hnl/um5XPLs3HdJe5EV/K?=
 =?us-ascii?Q?e4TMTUESQj5g80w8uQQb+l2I2orIHZb4hKbp874muvGO0t2W3Niw3JQ+KHV8?=
 =?us-ascii?Q?k4SGvoXeIY/u+yvwpw2nt8SFHe2OypBkFhFhQfGcBozGEHagE/hSLjgZRQBi?=
 =?us-ascii?Q?tic3CDKhMlnHb+l256VsqVKe0gLLCwmCIa68aXnDFa/LswCUjT7CPPaxhRr8?=
 =?us-ascii?Q?yDfi8/IbuMU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uzq+Ap5Sq7GSIbi6601u8HoYLMW1QMgOq4dhkCj9s8mmdJMvRPU2iKNccwHZ?=
 =?us-ascii?Q?Rf6SoCyYNHM3CMGNua1IOek1DYXdwiFntppt8FyexQNgBuoPUbrNM1lKsLnl?=
 =?us-ascii?Q?xLa5YA+4/J5sLyLV6flsRK1iC6/4fa426ezobgJ6NCdizCLo4EWJgFNQpe5V?=
 =?us-ascii?Q?SnVSTuTCzqV1WgzMsrY1OMouuMHcHop/gysxJ8emnNwKF58ZF4/12O/BrBPo?=
 =?us-ascii?Q?hvyeWDYEARLZtjDn/MgoZxyqznW3UnA90dxJuBBEI/VQW22Ap00XyWnDgg9o?=
 =?us-ascii?Q?YcLIRJRgImdF941BnIIA6ON8Bw2eolKxPWim/x10bd7Z++Nci1gOqt8TY3HT?=
 =?us-ascii?Q?a48qLqme79L7Wdrb/HKnaSdrUvk8spqrX1mi7fUNKndeqwe0ZedCKaOKMm/s?=
 =?us-ascii?Q?lJutyNov48dlYzcT+NwewXMDH1KsaxFm9XJFcQ7WKw9yYdYZ85CdRUcJlcBW?=
 =?us-ascii?Q?s9xxrXSJ8WA2BL3t8mmquI0n3rVMTHc8w4xA+7q64I3/QQTqoQAarV4eBWLl?=
 =?us-ascii?Q?200ARdTkDRg11/60cu/vwuCpIIfoJ3IryIjiSbwX7kqC5xmxBdMt84gk9Pm8?=
 =?us-ascii?Q?OA3NYHVdmNUPUT/6kWhFQRF6zs3xK2uPdXS9aBwKqXD9V0PA5u5+lPic9AOf?=
 =?us-ascii?Q?cEpUmvhOTW7Z7QJwvyWeBOffskcwb5mDq42TIz/i3sfKCd9bWEU9fI996Ygt?=
 =?us-ascii?Q?YLA/A285TswL910A4jlbroGHb+IN0RUnv3uWkWLltJZtSpAVdixwrG+rb0CN?=
 =?us-ascii?Q?UA51QMwvQcL3gMb+m6+5xCLUEzZY6Qcq9hkKFJuAh0y0Tm+VbUwg1aHLxyZO?=
 =?us-ascii?Q?5cHDVfMpEJ7ZE4ZgrFtXCwHe9inOKFjmEYy/hr0lgRSTHIrBy6DVadkEkC/w?=
 =?us-ascii?Q?W08O6Gmyy6EW5OrX1cbSUaQCHw8QQFXLB47OUnY+nX+LiVuUrarvs5/gALyk?=
 =?us-ascii?Q?Ac7PzAMLFKfrSDjN4vrJeUUEvPepjmVyD+dOitUC2Aivkol8qVHPupQfSjb2?=
 =?us-ascii?Q?l1tXpdBdv751RnB/g5kdqwy8VpYAMxhv9ZUrWFAgrpNbinUMoSbt/zBwwE1U?=
 =?us-ascii?Q?AcG5p64O7Gpgp8qWmMDdxhGhcSxJNt+FPFmZiGZZk1UUJ7h4ADBLMHLObwWs?=
 =?us-ascii?Q?dszUl8mH+nklY7SoVP6hfGHHGLOFJf3a8RPE4fKOjGhPUhNZqe/l4V076DYY?=
 =?us-ascii?Q?/lb3Wbc9Sm/fWBY3BvWrIgmTgB/3/4+3fGqBWjSAgvMy6tJfBmLyYHPhLssB?=
 =?us-ascii?Q?Fr0wJdsMn2nfTGLsKfi5GvuPm4AIeOKZ3UoXo1DzDGwD2kr/yhQu5M7WS0y8?=
 =?us-ascii?Q?ZvY1gbD4wlVNFNLBD1t9N/A/W6hChqjfmN005GgyzvZ2N3VPHK9tLUU+qHOX?=
 =?us-ascii?Q?XBSdPg5s8xurFWgD/myQrXJAy/XCi0MJWcjGl122qEuriBuMGMfsYXStFjv+?=
 =?us-ascii?Q?vckFFtuKGJ/aEc3jUE4SHWFXQlpFWTK7hxiKXTHgiUw1fb0Lu0UuYO0NRpCU?=
 =?us-ascii?Q?1dH4dJTNe1rcoWtwudBrQVtPvVwAQ+2qQlGa61X8YT9vG//6cuYy3CMGzYRy?=
 =?us-ascii?Q?CkSUU1Qw1mI3KthMJzc7vSwFiTEPk50JUGRCreyv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4faa23bd-6a3e-4677-2761-08dde722252a
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 17:33:19.6533 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iSBTAeznHzZS4rkr1NheMlyVXYGYh7jteJSJtTo8U8FdkwCFoMfpSZzHX4Pt4+9uaDSFDFgpxk98dydR38xf7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6017
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

Add several firmware bindings required by GSP sequencer code.

Co-developed-by: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/nvfw.rs                 | 25 ++++++
 .../gpu/nova-core/nvfw/r570_144_bindings.rs   | 84 +++++++++++++++++++
 2 files changed, 109 insertions(+)

diff --git a/drivers/gpu/nova-core/nvfw.rs b/drivers/gpu/nova-core/nvfw.rs
index aa883d458838..0b44a922fe5d 100644
--- a/drivers/gpu/nova-core/nvfw.rs
+++ b/drivers/gpu/nova-core/nvfw.rs
@@ -41,7 +41,9 @@ pub(crate) struct LibosParams {
 /// addresses of the GSP bootloader and firmware.
 pub(crate) use r570_144::GspFwWprMeta;
 
+#[expect(unused_imports)]
 pub(crate) use r570_144::{
+    rpc_run_cpu_sequencer_v17_00,
     // Core GSP structures
     GspSystemInfo,
 
@@ -55,6 +57,29 @@ pub(crate) struct LibosParams {
     // GSP firmware constants
     GSP_FW_WPR_META_MAGIC,
     GSP_FW_WPR_META_REVISION,
+
+    // GSP sequencer structures
+    GSP_SEQUENCER_BUFFER_CMD,
+    GSP_SEQ_BUF_OPCODE,
+
+    GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_RESET,
+    GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_RESUME,
+
+    GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_START,
+    GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_WAIT_FOR_HALT,
+    // GSP sequencer opcode constants
+    GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_DELAY_US,
+    GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_MODIFY,
+    GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_POLL,
+    GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_STORE,
+    GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_WRITE,
+    // GSP sequencer payload structures
+    GSP_SEQ_BUF_PAYLOAD_DELAY_US,
+    GSP_SEQ_BUF_PAYLOAD_REG_MODIFY,
+    GSP_SEQ_BUF_PAYLOAD_REG_POLL,
+    GSP_SEQ_BUF_PAYLOAD_REG_STORE,
+    GSP_SEQ_BUF_PAYLOAD_REG_WRITE,
+
     GSP_SR_INIT_ARGUMENTS,
 
     // RM message queue parameters
diff --git a/drivers/gpu/nova-core/nvfw/r570_144_bindings.rs b/drivers/gpu/nova-core/nvfw/r570_144_bindings.rs
index 3832d0b7a0b9..607d99ac2221 100644
--- a/drivers/gpu/nova-core/nvfw/r570_144_bindings.rs
+++ b/drivers/gpu/nova-core/nvfw/r570_144_bindings.rs
@@ -625,3 +625,87 @@ pub struct PACKED_REGISTRY_TABLE {
     pub numEntries: u32_,
     pub entries: __IncompleteArrayField<PACKED_REGISTRY_ENTRY>,
 }
+#[repr(C)]
+#[derive(Debug, Default)]
+pub struct rpc_run_cpu_sequencer_v17_00 {
+    pub bufferSizeDWord: u32_,
+    pub cmdIndex: u32_,
+    pub regSaveArea: [u32_; 8usize],
+    pub commandBuffer: __IncompleteArrayField<u32_>,
+}
+pub const GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_WRITE: GSP_SEQ_BUF_OPCODE = 0;
+pub const GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_MODIFY: GSP_SEQ_BUF_OPCODE = 1;
+pub const GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_POLL: GSP_SEQ_BUF_OPCODE = 2;
+pub const GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_DELAY_US: GSP_SEQ_BUF_OPCODE = 3;
+pub const GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_STORE: GSP_SEQ_BUF_OPCODE = 4;
+pub const GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_RESET: GSP_SEQ_BUF_OPCODE = 5;
+pub const GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_START: GSP_SEQ_BUF_OPCODE = 6;
+pub const GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_WAIT_FOR_HALT: GSP_SEQ_BUF_OPCODE = 7;
+pub const GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_RESUME: GSP_SEQ_BUF_OPCODE = 8;
+pub type GSP_SEQ_BUF_OPCODE = ffi::c_uint;
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct GSP_SEQ_BUF_PAYLOAD_REG_WRITE {
+    pub addr: u32_,
+    pub val: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct GSP_SEQ_BUF_PAYLOAD_REG_MODIFY {
+    pub addr: u32_,
+    pub mask: u32_,
+    pub val: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct GSP_SEQ_BUF_PAYLOAD_REG_POLL {
+    pub addr: u32_,
+    pub mask: u32_,
+    pub val: u32_,
+    pub timeout: u32_,
+    pub error: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct GSP_SEQ_BUF_PAYLOAD_DELAY_US {
+    pub val: u32_,
+}
+#[repr(C)]
+#[derive(Debug, Default, Copy, Clone)]
+pub struct GSP_SEQ_BUF_PAYLOAD_REG_STORE {
+    pub addr: u32_,
+    pub index: u32_,
+}
+#[repr(C)]
+#[derive(Copy, Clone)]
+pub struct GSP_SEQUENCER_BUFFER_CMD {
+    pub opCode: GSP_SEQ_BUF_OPCODE,
+    pub payload: GSP_SEQUENCER_BUFFER_CMD__bindgen_ty_1,
+}
+#[repr(C)]
+#[derive(Copy, Clone)]
+pub union GSP_SEQUENCER_BUFFER_CMD__bindgen_ty_1 {
+    pub regWrite: GSP_SEQ_BUF_PAYLOAD_REG_WRITE,
+    pub regModify: GSP_SEQ_BUF_PAYLOAD_REG_MODIFY,
+    pub regPoll: GSP_SEQ_BUF_PAYLOAD_REG_POLL,
+    pub delayUs: GSP_SEQ_BUF_PAYLOAD_DELAY_US,
+    pub regStore: GSP_SEQ_BUF_PAYLOAD_REG_STORE,
+}
+impl Default for GSP_SEQUENCER_BUFFER_CMD__bindgen_ty_1 {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
+impl Default for GSP_SEQUENCER_BUFFER_CMD {
+    fn default() -> Self {
+        let mut s = ::core::mem::MaybeUninit::<Self>::uninit();
+        unsafe {
+            ::core::ptr::write_bytes(s.as_mut_ptr(), 0, 1);
+            s.assume_init()
+        }
+    }
+}
-- 
2.34.1

