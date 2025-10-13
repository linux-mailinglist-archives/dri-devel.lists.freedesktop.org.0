Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 590A5BD1A0A
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 08:21:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 703B110E3C0;
	Mon, 13 Oct 2025 06:21:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="InjOwj5S";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012054.outbound.protection.outlook.com [40.107.209.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4BA710E3B4;
 Mon, 13 Oct 2025 06:21:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bu3et8LI4u8P7RjgPQYIM+3MPFt+3QZx+mBbDk6mBV1yqA0/Ggh/EAKzKvBW94gPppTHVMCgg3dzQIqwmlwVclQto4jDLdUekY4+TGuRaj90dEr1KLCmlvgtkTVpo7PYIsZpa4qkiJsNtY2TAxHs9m3Yd5CGJ+j6KqTjCLboFxJCrRnmgRLMkbq71by6wbLzvGYYCaLd6Nn4Ou8LZoTziXlgb6xy5XKIZlX6YwssdFlyeCt45vwVBxiXbVEcF0sNwRbGP091HIr17t00wqiZSu9G0kGK0iU5zdRs+OmvdZITudR7p5WE7Wao3dfN7UenpzGCN/qruBLi91cFUxXi3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SghSK2iCrzTqDuh9ZzNoCmnp9gDo4MvmJPvqXh6qjM8=;
 b=eypDaPdFM2DIHohErLGRmHlCRcfnMLOO9ycdkTPxtv9NcAAOiAbDrkjcyO/LGj8WiGkag/Rle4CfGJpVly4hKTW1ajaBMNG9GN57bu1LEIWSpKrdRFe1WG6TcZDKvIKTW8bBAvPSs5iMcAbV8KDV0pXCmeP9EaC/HbcDnL37oA/cB2PrjFFkdCEi4izISEXJZxkWV5OblWi3X6R+lBQ2Q68KPHkcfmWLNWMLET2AZqOs5vITSi7AcYp/uFbL/gmyLgHYduW7dXlyrPaSSVRSciu2z0QN5aLktTNwsKTF66kWBL7XnA/Y0kx6lGnLF3KieEG7iw/bxJKbSPOehURfpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SghSK2iCrzTqDuh9ZzNoCmnp9gDo4MvmJPvqXh6qjM8=;
 b=InjOwj5SE7fHo8ICZZKDIYBZS+0ARlb+gWSFE/xd5qOWRtOvbWzbPAb0zbbnz9k8RTIFsyu+7ScV+qMUbzVWPxvKoCywRdMhGToiPI4nvu0JxrW4yrbHHpkJjgb8NjirCxuqKed30BUMqzi0ZWmIHLzerj7k3SJj9bV3kdiV1VHOY/06NoTaO/WXtYEbT7ughje1b+3adxl5Dkw0IZwNcVIZ/YBSfaccSrpCnWejIvtQfxReBkrDDEtLJx/ugSDmzJGQvIlNNtDr3LvjIfpWgBGhfdxp2rIwtI0L8qDOuneeYbRMgu4SpMSS+l8F3kZ3zwGtTZ4pGw4UOSfXPh4vwg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 DS0PR12MB8218.namprd12.prod.outlook.com (2603:10b6:8:f2::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.13; Mon, 13 Oct 2025 06:21:21 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 06:21:21 +0000
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
Subject: [PATCH v5 07/14] gpu: nova-core: gsp: Add GSP command queue handling
Date: Mon, 13 Oct 2025 17:20:33 +1100
Message-ID: <20251013062041.1639529-8-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251013062041.1639529-1-apopple@nvidia.com>
References: <20251013062041.1639529-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5P282CA0071.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:203::7) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|DS0PR12MB8218:EE_
X-MS-Office365-Filtering-Correlation-Id: 41a20a7f-ddbe-419e-744c-08de0a20b9e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pitriksf7o2PkIWOhMUCltjuKZRcV9fGtnd4+vsxoPpr7anD3J/2yH9jv7mC?=
 =?us-ascii?Q?rkI+cX5zks+sY1rVE24pxFfoL/QJS+yyQ3K4De67gi7tLp0VZQTXIvhEgo3f?=
 =?us-ascii?Q?xN66RN5XHDNElPACJAqcjgEf0bUWxGOxQ0Z+vAAhC/e0BJ/sa6tM0Fjwqg7U?=
 =?us-ascii?Q?OwYvXVzqKoKiQJcZQrxetJQ75cDjIcLR4U97t8ExDZOvJGa713wE9mquqfAn?=
 =?us-ascii?Q?cVj1w7ywkY5sHOdTdwFEdhrM1UIbcTVD0DY13kHdko4JS7fCTViM/P/OwADx?=
 =?us-ascii?Q?ssDyEf51X4pnCT/jnFASiZP3UbTjJrL1cP/9/7qtRh8KZElOD0rMJa7knQrO?=
 =?us-ascii?Q?gU/witWptnMcAH+bO2kMU87gK4/kbNnG8kJ+rwWjyiOeohGv0KJtliLVS/th?=
 =?us-ascii?Q?ugTih4HjZbr/8SD4fyEdzvnbyTuWchvhSQ+bCNiaUnlQS7/m2AcAAzkahiMF?=
 =?us-ascii?Q?lPrPwWsQhPO7wY2Uus3wsHHn+LbeVObFM4F6LV7VK92rmDODQ3exe0NpoB7e?=
 =?us-ascii?Q?Vhva158QlWI9M4/fjt1zmAklQ6jzRMsjhotuLErWJtUuXnRS5OuHZ1dHa88t?=
 =?us-ascii?Q?7CbUJAQuUhc/QzmnKEnTAahqYIAT8gSrqSVpKh2bGF6kfIBS485kWmihu94W?=
 =?us-ascii?Q?9Euu4iXq9Vg07h7JbssTuUaGs56jCWpvfeG8yaMFilz4mA508vCG6ax5ADcI?=
 =?us-ascii?Q?Ma96oiUUsOqoBq1ODTG9aBLfbKx03BEKSEKxrgiy9HPQmH7u/lQVjWoL1NMO?=
 =?us-ascii?Q?EoVpd0kmWNU77y94m9vmXMCitg1rJpmmqec4pWT5qB8IXl/+Mkf1GCHUQGfH?=
 =?us-ascii?Q?IxiYZB9eA4RGZSVaRw/rMaG9j6gdelwUAGFbMjh6PDpZn3H7u5B8+H7i/pbE?=
 =?us-ascii?Q?1u6vGKtyyulzgNoZZu8w8PU9ftE9zoOmWb9l8rSAq43vv/EMNV9h42xsHmos?=
 =?us-ascii?Q?VrTGb394UL3k53ZZ2LzQh2upEkhu9ud44o9LK33XGH1opPQdcZe4B6EQUBQN?=
 =?us-ascii?Q?KY77oEeSBrdqDQ+xb7zCYQ7INlYhdTSXjfBL8uXBTw/GSbLOjse4X4yWn94m?=
 =?us-ascii?Q?qpMDv/WwT6jVCcmsJCYaZX8MQcuzvEVwk103Jp0cacQOF1c+2H/n1Zmoyo9/?=
 =?us-ascii?Q?GBx01C0UYhlycA0XvWh5iP/IQeoU27omDnDPZgtEiSEQJTMux3LzQKzBKgQ+?=
 =?us-ascii?Q?Ek9BX3FBUWau9FZDbcBPxtlYJFpZFY/VXqnwEbR08FoEs5aXQ/2Ev898LxpK?=
 =?us-ascii?Q?ffOc7FicLX2tDznw2cYzJuKRQpCvlbUbqZOmWLOY1D6hJubdFwvMVs7gsc2D?=
 =?us-ascii?Q?f7FRU9kkdlGwjogdERP169d85irMwkz2fz+66jo2LWMrZM0j5FeWc251q5OF?=
 =?us-ascii?Q?Rgojw6KilkNeW9ascuES9yWh6D5fG+o1XgkBiwP6wa6LiNHFc4nu6nUTLQs9?=
 =?us-ascii?Q?1TOjGAryFrBDkciaQhd4F58ypZSRfU7kaphHbPfXl84FYo9kDs+aKg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0FnfE26CSS4Zsy8S5+5FKoq981xuLWE4XD0riIrS+0mSNyw4YYOAsfOtc3C9?=
 =?us-ascii?Q?HC6s4XjClo43hQefR8pn/yxY6ORkNihipMozoXf373ykDUQ0kmVpvjoFvzM5?=
 =?us-ascii?Q?yR4OfrbiTk+SOhcJLuFnoQ3/ijUm62ilZtH0Hw1u7WEemcvbVRSzxAzsRnDh?=
 =?us-ascii?Q?yhw9M0rFj/TTI7roa5fnrDwAfaJ1zTixBU+GKHRGdsspsT3NI/yMi9E7mbX/?=
 =?us-ascii?Q?Q12DBJUOkOgndqM9QZaiVrG6SUfnSZjXkYrrqWrchDHbApOab+CcxKpHfz4P?=
 =?us-ascii?Q?4PQ1/qu14OncutCukWd8wSHym+3zSUiav13d7zagOsFGq7kd6phOKYiU8NOV?=
 =?us-ascii?Q?LPMsNhDvcgu1Jx62UdIN8i1rveI6h6p0YHf9/q5p3h/UrYj5hdXPe92Bee7E?=
 =?us-ascii?Q?FwKj5wiGJzMwJXgHYxIkMAeig0CuAnH/mCfRf3FVwOBvo50JUU8txpegvkgQ?=
 =?us-ascii?Q?ZTZZWVSiqoQwSbSbtZwiZTmRuh2BhK6Kpegc10oTLijBdgp06JqniaLa6elx?=
 =?us-ascii?Q?UamHYuTA374uO0+lPnFo4+aHj4Fp7cGFlOwXr3vBNdDSEfjmsddM+ufgD2S2?=
 =?us-ascii?Q?2uqufMDQto/SHP3CzXDugk5/Obr1XTLeIvWeIfb9fqZoeSD8+UrFbEsbUhd9?=
 =?us-ascii?Q?T4R49ChfgWCAEpasYRrR0IoVjx602742Vv2XbBW6DTR3WRR5SuuAVRhdDdWI?=
 =?us-ascii?Q?lNwruxrqoVKnfynTodqOIpXThHdIoo8rjgbXr5jpkU6YMTwy6EboLMjrJ2Fg?=
 =?us-ascii?Q?mKx48LcekCSWPo7VDGO1OiZAF7lcYnk5u1A5lontx3xL7LE3DKL9qMslnrKo?=
 =?us-ascii?Q?0js3TpONY/Gq6O4V0LZWeFwIe5a0CF0tJyvqJBcV3HS2TTzmlThHT2pUh/lK?=
 =?us-ascii?Q?qazayP6MD+k9yxNDAFgoaaap04Vm7OVdPqtNuvUb7R2fv8MamHi2TKYn8cRZ?=
 =?us-ascii?Q?L0b7d16F7ohu8IbAgZyP7nYCRKB+qGX80JwguRnNCsr2X1aiIGc/AwSnZoiN?=
 =?us-ascii?Q?qIVu+jOfZ7wicvoHXD2aiDL1zKCwuGvzIUYX9L1tIrFr/t1ul9mk56XP5ZUb?=
 =?us-ascii?Q?cNCEK+BB3NalQZb/t75ZE8TWPmC8MWYSiEoL101670ZkDbVIqjWAvw1LMcEA?=
 =?us-ascii?Q?gHRwE+Hx8KAKErqZkSM4vTECmPcbZFRwFS1EQvaIi375eIorEBcJOlIMDozg?=
 =?us-ascii?Q?LWG2xvfbzRehrGn7a034ENdiARVnbP34od9OCJxhTuxJ2rQosn8AgdgJNKaG?=
 =?us-ascii?Q?xg5s5wEGZ7CmAYXwLWa5MAhWyhXE3Wq3AjUOEEQKKpa04rEoDsNcATRJ/ypC?=
 =?us-ascii?Q?oCP6AAM1cBt/W7gF4l4p2Ec/Vq8c5VWU3Rck7A574LCjvN5ltxEnlWuQ9qxj?=
 =?us-ascii?Q?M4Sq6iuB+YHFEclb6K3W5O+4+vKJAdSWjeyB0d4niTo+simaDjDNawPmbP6q?=
 =?us-ascii?Q?U+XOrNr+LOOVuHguymfBAyEd5Y8ak6r1U8Nd7Je1X+EIdd/zZZ+R0ZeRfx0m?=
 =?us-ascii?Q?rLnQANDJsCHbp1ktva5QHcmEmV1UefJmc4a/CNmODOVpCh6hrKaNwlH+M6DT?=
 =?us-ascii?Q?EjSi/a1PlM5y8uJb07ZpjC4Zgfczk0IWKLRDykg9?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41a20a7f-ddbe-419e-744c-08de0a20b9e0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 06:21:21.0825 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HPhBjK5IPurCUt7iajIa7qCC7K8n5K8pc/o6/NcniQ+OiJgVi2N3/PaRoKbqoWKQJsFGz519pYpM1lbBSvvTJA==
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

This commit introduces core infrastructure for handling GSP command and
message queues in the nova-core driver. The command queue system enables
bidirectional communication between the host driver and GSP firmware
through a remote message passing interface.

The interface is based on passing serialised data structures over a ring
buffer with separate transmit and receive queues. Commands are sent by
writing to the CPU transmit queue and waiting for completion via the
receive queue.

To ensure safety mutable or immutable (depending on whether it is a send
or receive operation) references are taken on the command queue when
allocating the message to write/read to. This ensures message memory
remains valid and the command queue can't be mutated whilst an operation
is in progress.

Currently this is only used by the probe() routine and therefore can
only used by a single thread of execution. Locking to enable safe access
from multiple threads will be introduced in a future series when that
becomes necessary.

Signed-off-by: Alistair Popple <apopple@nvidia.com>

---

Changes for v4:
 - Use read_poll_timeout() instead of wait_on()
 - Switch to using `init!` (Thanks Alex for figuring out the
   required workarounds)
 - Pass the enum type into the RPC bindings instead of a raw u32
 - Fixup the TODOs for extracting/allocating the send command regions
 - Split the sending functions into one taking just a command struct and
   another taking a command struct with extra payload

Changes for v3:
 - Reduce the receive payloads to the correct size
 - Use opaque bindings
 - Clean up of the command queue PTE creation
 - Add an enum for the GSP functions
 - Rename GspCommandToGsp and GspMessageFromGsp
 - Rename GspCmdq
 - Add function to notify GSP of updated queue pointers
 - Inline driver area access functions
 - Fixup receive area calculations

Changes for v2:
 - Rebased on Alex's latest series
---
 drivers/gpu/nova-core/gsp.rs      |   9 +
 drivers/gpu/nova-core/gsp/cmdq.rs | 493 ++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/regs.rs     |   4 +
 drivers/gpu/nova-core/sbuffer.rs  |   2 -
 scripts/Makefile.build            |   2 +-
 5 files changed, 507 insertions(+), 3 deletions(-)
 create mode 100644 drivers/gpu/nova-core/gsp/cmdq.rs

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 554eb1a34ee7..1d472c5fad7a 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -2,6 +2,7 @@
 
 mod boot;
 
+use kernel::alloc::flags::GFP_KERNEL;
 use kernel::device;
 use kernel::dma::CoherentAllocation;
 use kernel::dma::DmaAddress;
@@ -11,6 +12,7 @@
 use kernel::transmute::AsBytes;
 
 use crate::fb::FbLayout;
+use crate::gsp::cmdq::Cmdq;
 
 pub(crate) use fw::{GspFwWprMeta, LibosParams};
 
@@ -18,6 +20,8 @@
 
 use fw::LibosMemoryRegionInitArgument;
 
+pub(crate) mod cmdq;
+
 pub(crate) const GSP_PAGE_SHIFT: usize = 12;
 pub(crate) const GSP_PAGE_SIZE: usize = 1 << GSP_PAGE_SHIFT;
 
@@ -31,6 +35,7 @@ pub(crate) struct Gsp {
     loginit: LogBuffer,
     logintr: LogBuffer,
     logrm: LogBuffer,
+    pub(crate) cmdq: Cmdq,
 }
 
 #[repr(C)]
@@ -110,11 +115,15 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> Result<impl PinInit<Self
         let logrm = LogBuffer::new(dev)?;
         dma_write!(libos[2] = LibosMemoryRegionInitArgument::new("LOGRM", &logrm.0)?)?;
 
+        // Creates its own PTE array.
+        let cmdq = Cmdq::new(dev)?;
+
         Ok(try_pin_init!(Self {
             libos,
             loginit,
             logintr,
             logrm,
+            cmdq,
         }))
     }
 }
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
new file mode 100644
index 000000000000..3f8cb7a35922
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -0,0 +1,493 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use core::mem::offset_of;
+use core::sync::atomic::fence;
+use core::sync::atomic::Ordering;
+
+use kernel::alloc::flags::GFP_KERNEL;
+use kernel::device;
+use kernel::dma::CoherentAllocation;
+use kernel::dma_write;
+use kernel::io::poll::read_poll_timeout;
+use kernel::prelude::*;
+use kernel::sync::aref::ARef;
+use kernel::time::Delta;
+use kernel::transmute::{AsBytes, FromBytes};
+
+use crate::driver::Bar0;
+use crate::gsp::fw::{GspMsgElement, MsgFunction, MsgqRxHeader, MsgqTxHeader};
+use crate::gsp::PteArray;
+use crate::gsp::{GSP_PAGE_SHIFT, GSP_PAGE_SIZE};
+use crate::regs::NV_PGSP_QUEUE_HEAD;
+use crate::sbuffer::SBufferIter;
+
+pub(crate) trait CommandToGsp: Sized + FromBytes + AsBytes {
+    const FUNCTION: MsgFunction;
+}
+
+pub(crate) trait CommandToGspWithPayload: CommandToGsp {}
+
+pub(crate) trait MessageFromGsp: Sized + FromBytes + AsBytes {
+    const FUNCTION: MsgFunction;
+}
+
+/// Number of GSP pages making the Msgq.
+pub(crate) const MSGQ_NUM_PAGES: u32 = 0x3f;
+
+#[repr(C, align(0x1000))]
+#[derive(Debug)]
+struct MsgqData {
+    data: [[u8; GSP_PAGE_SIZE]; MSGQ_NUM_PAGES as usize],
+}
+
+// Annoyingly there is no real equivalent of #define so we're forced to use a
+// literal to specify the alignment above. So check that against the actual GSP
+// page size here.
+static_assert!(align_of::<MsgqData>() == GSP_PAGE_SIZE);
+
+// There is no struct defined for this in the open-gpu-kernel-source headers.
+// Instead it is defined by code in GspMsgQueuesInit().
+#[repr(C)]
+struct Msgq {
+    tx: MsgqTxHeader,
+    rx: MsgqRxHeader,
+    msgq: MsgqData,
+}
+
+#[repr(C)]
+struct GspMem {
+    ptes: PteArray<{ GSP_PAGE_SIZE / size_of::<u64>() }>,
+    cpuq: Msgq,
+    gspq: Msgq,
+}
+
+// SAFETY: These structs don't meet the no-padding requirements of AsBytes but
+// that is not a problem because they are not used outside the kernel.
+unsafe impl AsBytes for GspMem {}
+
+// SAFETY: These structs don't meet the no-padding requirements of FromBytes but
+// that is not a problem because they are not used outside the kernel.
+unsafe impl FromBytes for GspMem {}
+
+/// `GspMem` struct that is shared with the GSP.
+struct DmaGspMem(CoherentAllocation<GspMem>);
+
+impl DmaGspMem {
+    fn new(dev: &device::Device<device::Bound>) -> Result<Self> {
+        const MSGQ_SIZE: u32 = size_of::<Msgq>() as u32;
+        const RX_HDR_OFF: u32 = offset_of!(Msgq, rx) as u32;
+
+        let gsp_mem =
+            CoherentAllocation::<GspMem>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
+        dma_write!(gsp_mem[0].ptes = PteArray::new(gsp_mem.dma_handle())?)?;
+        dma_write!(gsp_mem[0].cpuq.tx = MsgqTxHeader::new(MSGQ_SIZE, RX_HDR_OFF, MSGQ_NUM_PAGES))?;
+        dma_write!(gsp_mem[0].cpuq.rx = MsgqRxHeader::new())?;
+
+        Ok(Self(gsp_mem))
+    }
+
+    // Allocates the various regions for the command and reduces the payload size
+    // to match what is needed for the command.
+    //
+    // # Errors
+    //
+    // Returns `Err(EAGAIN)` if the driver area is too small to hold the
+    // requested command.
+    fn allocate_command_regions<'a, M: CommandToGsp>(
+        &'a mut self,
+        payload_size: usize,
+    ) -> Result<(&'a mut GspMsgElement, &'a mut M, &'a mut [u8], &'a mut [u8])> {
+        let driver_area = self.driver_write_area();
+        let msg_size = size_of::<GspMsgElement>() + size_of::<M>() + payload_size;
+        let driver_area_size = (driver_area.0.len() + driver_area.1.len()) << GSP_PAGE_SHIFT;
+
+        if msg_size > driver_area_size {
+            return Err(EAGAIN);
+        }
+
+        #[allow(clippy::incompatible_msrv)]
+        let (msg_header_slice, slice_1) = driver_area
+            .0
+            .as_flattened_mut()
+            .split_at_mut(size_of::<GspMsgElement>());
+        let msg_header = GspMsgElement::from_bytes_mut(msg_header_slice).ok_or(EINVAL)?;
+        let (cmd_slice, payload_1) = slice_1.split_at_mut(size_of::<M>());
+        let cmd = M::from_bytes_mut(cmd_slice).ok_or(EINVAL)?;
+
+        #[allow(clippy::incompatible_msrv)]
+        let payload_2 = driver_area.1.as_flattened_mut();
+
+        let (payload_1, payload_2) = if payload_1.len() > payload_size {
+            // Payload fits entirely in payload_1
+            (&mut payload_1[..payload_size], &mut payload_2[0..0])
+        } else {
+            // Need all of payload_1 and some of payload_2
+            let payload_2_len = payload_size - payload_1.len();
+            (payload_1, &mut payload_2[..payload_2_len])
+        };
+
+        Ok((msg_header, cmd, payload_1, payload_2))
+    }
+
+    fn driver_write_area(&mut self) -> (&mut [[u8; GSP_PAGE_SIZE]], &mut [[u8; GSP_PAGE_SIZE]]) {
+        let tx = self.cpu_write_ptr() as usize;
+        let rx = self.gsp_read_ptr() as usize;
+
+        // SAFETY:
+        // - The [`CoherentAllocation`] contains exactly one object.
+        // - We will only access the driver-owned part of the shared memory.
+        // - Per the safety statement of the function, no concurrent access will be performed.
+        let gsp_mem = &mut unsafe { self.0.as_slice_mut(0, 1) }.unwrap()[0];
+        let (before_tx, after_tx) = gsp_mem.cpuq.msgq.data.split_at_mut(tx);
+
+        if rx <= tx {
+            // The area from `tx` up to the end of the ring, and from the beginning of the ring up
+            // to `rx`, minus one unit, belongs to the driver.
+            if rx == 0 {
+                let last = after_tx.len() - 1;
+                (&mut after_tx[..last], &mut before_tx[0..0])
+            } else {
+                (after_tx, &mut before_tx[..rx])
+            }
+        } else {
+            // The area from `tx` to `rx`, minus one unit, belongs to the driver.
+            (after_tx.split_at_mut(rx - tx).0, &mut before_tx[0..0])
+        }
+    }
+
+    fn driver_read_area(&self) -> (&[[u8; GSP_PAGE_SIZE]], &[[u8; GSP_PAGE_SIZE]]) {
+        let tx = self.gsp_write_ptr() as usize;
+        let rx = self.cpu_read_ptr() as usize;
+
+        // SAFETY:
+        // - The [`CoherentAllocation`] contains exactly one object.
+        // - We will only access the driver-owned part of the shared memory.
+        // - Per the safety statement of the function, no concurrent access will be performed.
+        let gsp_mem = &unsafe { self.0.as_slice(0, 1) }.unwrap()[0];
+        let (before_rx, after_rx) = gsp_mem.gspq.msgq.data.split_at(rx);
+
+        if tx == rx {
+            (&after_rx[0..0], &after_rx[0..0])
+        } else if tx > rx {
+            (&after_rx[..tx], &before_rx[0..0])
+        } else {
+            (after_rx, &before_rx[..tx])
+        }
+    }
+
+    fn gsp_write_ptr(&self) -> u32 {
+        let gsp_mem = self.0.start_ptr();
+
+        // SAFETY:
+        //  - The ['CoherentAllocation'] contains at least one object.
+        //  - By the invariants of CoherentAllocation the pointer is valid.
+        (unsafe { (*gsp_mem).gspq.tx.write_ptr() } % MSGQ_NUM_PAGES)
+        // dma_read!(gsp_mem[0].gspq.tx.writePtr).unwrap() % MSGQ_NUM_PAGES
+    }
+
+    fn gsp_read_ptr(&self) -> u32 {
+        let gsp_mem = self.0.start_ptr();
+
+        // SAFETY:
+        //  - The ['CoherentAllocation'] contains at least one object.
+        //  - By the invariants of CoherentAllocation the pointer is valid.
+        (unsafe { (*gsp_mem).gspq.rx.read_ptr() } % MSGQ_NUM_PAGES)
+    }
+
+    fn cpu_read_ptr(&self) -> u32 {
+        let gsp_mem = self.0.start_ptr();
+
+        // SAFETY:
+        //  - The ['CoherentAllocation'] contains at least one object.
+        //  - By the invariants of CoherentAllocation the pointer is valid.
+        (unsafe { (*gsp_mem).cpuq.rx.read_ptr() } % MSGQ_NUM_PAGES)
+    }
+
+    /// Inform the GSP that it can send `elem_count` new pages into the message queue.
+    fn advance_cpu_read_ptr(&mut self, elem_count: u32) {
+        // let gsp_mem = &self.0;
+        let rptr = self.cpu_read_ptr().wrapping_add(elem_count) % MSGQ_NUM_PAGES;
+
+        // Ensure read pointer is properly ordered
+        fence(Ordering::SeqCst);
+
+        let gsp_mem = self.0.start_ptr_mut();
+
+        // SAFETY:
+        //  - The ['CoherentAllocation'] contains at least one object.
+        //  - By the invariants of CoherentAllocation the pointer is valid.
+        unsafe { (*gsp_mem).cpuq.rx.set_read_ptr(rptr) };
+    }
+
+    fn cpu_write_ptr(&self) -> u32 {
+        let gsp_mem = self.0.start_ptr();
+
+        // SAFETY:
+        //  - The ['CoherentAllocation'] contains at least one object.
+        //  - By the invariants of CoherentAllocation the pointer is valid.
+        (unsafe { (*gsp_mem).cpuq.tx.write_ptr() } % MSGQ_NUM_PAGES)
+    }
+
+    /// Inform the GSP that it can process `elem_count` new pages from the command queue.
+    fn advance_cpu_write_ptr(&mut self, elem_count: u32) {
+        let wptr = self.cpu_write_ptr().wrapping_add(elem_count) & MSGQ_NUM_PAGES;
+        let gsp_mem = self.0.start_ptr_mut();
+
+        // SAFETY:
+        //  - The ['CoherentAllocation'] contains at least one object.
+        //  - By the invariants of CoherentAllocation the pointer is valid.
+        unsafe { (*gsp_mem).cpuq.tx.set_write_ptr(wptr) };
+
+        // Ensure all command data is visible before triggering the GSP read
+        fence(Ordering::SeqCst);
+    }
+}
+
+pub(crate) struct Cmdq {
+    dev: ARef<device::Device>,
+    seq: u32,
+    gsp_mem: DmaGspMem,
+    pub _nr_ptes: u32,
+}
+
+impl Cmdq {
+    pub(crate) fn new(dev: &device::Device<device::Bound>) -> Result<Cmdq> {
+        let gsp_mem = DmaGspMem::new(dev)?;
+        let nr_ptes = size_of::<GspMem>() >> GSP_PAGE_SHIFT;
+        build_assert!(nr_ptes * size_of::<u64>() <= GSP_PAGE_SIZE);
+
+        Ok(Cmdq {
+            dev: dev.into(),
+            seq: 0,
+            gsp_mem,
+            _nr_ptes: nr_ptes as u32,
+        })
+    }
+
+    fn calculate_checksum<T: Iterator<Item = u8>>(it: T) -> u32 {
+        let sum64 = it
+            .enumerate()
+            .map(|(idx, byte)| (((idx % 8) * 8) as u32, byte))
+            .fold(0, |acc, (rol, byte)| acc ^ u64::from(byte).rotate_left(rol));
+
+        ((sum64 >> 32) as u32) ^ (sum64 as u32)
+    }
+
+    // Notify GSP that we have updated the command queue pointers.
+    fn notify_gsp(bar: &Bar0) {
+        NV_PGSP_QUEUE_HEAD::default().set_address(0).write(bar);
+    }
+
+    #[expect(unused)]
+    pub(crate) fn send_gsp_command<M, E>(&mut self, bar: &Bar0, init: impl Init<M, E>) -> Result
+    where
+        M: CommandToGsp,
+        // This allows all error types, including `Infallible`, to be used with `init`. Without
+        // this we cannot use regular stack objects as `init` since their `Init` implementation
+        // does not return any error.
+        Error: From<E>,
+    {
+        #[repr(C)]
+        struct FullCommand<M> {
+            hdr: GspMsgElement,
+            cmd: M,
+        }
+        let (msg_header, cmd, _, _) = self.gsp_mem.allocate_command_regions::<M>(0)?;
+
+        let seq = self.seq;
+        let initializer = try_init!(FullCommand {
+            hdr <- GspMsgElement::init(seq, size_of::<M>(), M::FUNCTION),
+            cmd <- init,
+        });
+
+        // Fill the header and command in-place.
+        // SAFETY:
+        //  - allocate_command_regions guarantees msg_header points to enough
+        //    space in the command queue to contain FullCommand
+        //  - __init ensures the command header and struct a fully initialized
+        unsafe {
+            initializer.__init(msg_header.as_bytes_mut().as_mut_ptr().cast())?;
+        }
+
+        msg_header.set_checksum(Cmdq::calculate_checksum(SBufferIter::new_reader([
+            msg_header.as_bytes(),
+            cmd.as_bytes(),
+        ])));
+
+        dev_info!(
+            &self.dev,
+            "GSP RPC: send: seq# {}, function=0x{:x} ({}), length=0x{:x}\n",
+            self.seq,
+            msg_header.function_number(),
+            msg_header.function()?,
+            msg_header.length(),
+        );
+
+        let elem_count = msg_header.element_count();
+        self.seq += 1;
+        self.gsp_mem.advance_cpu_write_ptr(elem_count);
+        Cmdq::notify_gsp(bar);
+
+        Ok(())
+    }
+
+    #[expect(unused)]
+    pub(crate) fn send_gsp_command_with_payload<M, E>(
+        &mut self,
+        bar: &Bar0,
+        payload_size: usize,
+        init: impl Init<M, E>,
+        init_payload: impl FnOnce(SBufferIter<core::array::IntoIter<&mut [u8], 2>>) -> Result,
+    ) -> Result
+    where
+        M: CommandToGspWithPayload,
+        // This allows all error types, including `Infallible`, to be used with `init`. Without
+        // this we cannot use regular stack objects as `init` since their `Init` implementation
+        // does not return any error.
+        Error: From<E>,
+    {
+        #[repr(C)]
+        struct FullCommand<M> {
+            hdr: GspMsgElement,
+            cmd: M,
+        }
+        let (msg_header, cmd, payload_1, payload_2) =
+            self.gsp_mem.allocate_command_regions::<M>(payload_size)?;
+
+        let seq = self.seq;
+        let initializer = try_init!(FullCommand {
+            hdr <- GspMsgElement::init(seq, size_of::<M>() + payload_size, M::FUNCTION),
+            cmd <- init,
+        });
+
+        // Fill the header and command in-place.
+        // SAFETY:
+        //  - allocate_command_regions guarantees msg_header points to enough
+        //    space in the command queue to contain FullCommand
+        //  - __init ensures the command header and struct a fully initialized
+        unsafe {
+            initializer.__init(msg_header.as_bytes_mut().as_mut_ptr().cast())?;
+        }
+
+        // Fill the payload
+        let sbuffer = SBufferIter::new_writer([&mut payload_1[..], &mut payload_2[..]]);
+        init_payload(sbuffer)?;
+
+        msg_header.set_checksum(Cmdq::calculate_checksum(SBufferIter::new_reader([
+            msg_header.as_bytes(),
+            cmd.as_bytes(),
+            payload_1,
+            payload_2,
+        ])));
+
+        dev_info!(
+            &self.dev,
+            "GSP RPC: send: seq# {}, function=0x{:x} ({}), length=0x{:x}\n",
+            self.seq,
+            msg_header.function_number(),
+            msg_header.function()?,
+            msg_header.length(),
+        );
+
+        let elem_count = msg_header.element_count();
+        self.seq += 1;
+        self.gsp_mem.advance_cpu_write_ptr(elem_count);
+        Cmdq::notify_gsp(bar);
+
+        Ok(())
+    }
+
+    #[expect(unused)]
+    pub(crate) fn receive_msg_from_gsp<M: MessageFromGsp, R>(
+        &mut self,
+        timeout: Delta,
+        init: impl FnOnce(&M, SBufferIter<core::array::IntoIter<&[u8], 2>>) -> Result<R>,
+    ) -> Result<R> {
+        let driver_area = read_poll_timeout(
+            || Ok(self.gsp_mem.driver_read_area()),
+            |driver_area: &(&[[u8; 4096]], &[[u8; 4096]])| !driver_area.0.is_empty(),
+            Delta::from_millis(10),
+            timeout,
+        )?;
+
+        #[allow(clippy::incompatible_msrv)]
+        let (msg_header_slice, slice_1) = driver_area
+            .0
+            .as_flattened()
+            .split_at(size_of::<GspMsgElement>());
+        let msg_header = GspMsgElement::from_bytes(msg_header_slice).ok_or(EIO)?;
+        if msg_header.length() < size_of::<M>() as u32 {
+            return Err(EIO);
+        }
+
+        let function: MsgFunction = msg_header.function().map_err(|_| {
+            dev_info!(
+                self.dev,
+                "GSP RPC: receive: seq# {}, bad function=0x{:x}, length=0x{:x}\n",
+                msg_header.sequence(),
+                msg_header.function_number(),
+                msg_header.length(),
+            );
+            EIO
+        })?;
+
+        // Log RPC receive with message type decoding
+        dev_info!(
+            self.dev,
+            "GSP RPC: receive: seq# {}, function=0x{:x} ({}), length=0x{:x}\n",
+            msg_header.sequence(),
+            msg_header.function_number(),
+            function,
+            msg_header.length(),
+        );
+
+        let (cmd_slice, payload_1) = slice_1.split_at(size_of::<M>());
+        #[allow(clippy::incompatible_msrv)]
+        let payload_2 = driver_area.1.as_flattened();
+
+        // Cut the payload slice(s) down to the actual length of the payload.
+        let (cmd_payload_1, cmd_payload_2) =
+            if payload_1.len() > msg_header.length() as usize - size_of::<M>() {
+                (
+                    payload_1
+                        .split_at(msg_header.length() as usize - size_of::<M>())
+                        .0,
+                    &payload_2[0..0],
+                )
+            } else {
+                (
+                    payload_1,
+                    payload_2
+                        .split_at(msg_header.length() as usize - size_of::<M>() - payload_1.len())
+                        .0,
+                )
+            };
+
+        if Cmdq::calculate_checksum(SBufferIter::new_reader([
+            msg_header.as_bytes(),
+            cmd_slice,
+            cmd_payload_1,
+            cmd_payload_2,
+        ])) != 0
+        {
+            dev_err!(
+                self.dev,
+                "GSP RPC: receive: Call {} - bad checksum",
+                msg_header.sequence()
+            );
+            return Err(EIO);
+        }
+
+        let result = if function == M::FUNCTION {
+            let cmd = M::from_bytes(cmd_slice).ok_or(EINVAL)?;
+            let sbuffer = SBufferIter::new_reader([cmd_payload_1, cmd_payload_2]);
+            init(cmd, sbuffer)
+        } else {
+            Err(ERANGE)
+        };
+
+        self.gsp_mem
+            .advance_cpu_read_ptr(msg_header.length().div_ceil(GSP_PAGE_SIZE as u32));
+        result
+    }
+}
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 206dab2e1335..0585699ae951 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -71,6 +71,10 @@ pub(crate) fn chipset(self) -> Result<Chipset> {
     30:30   ecc_mode_enabled as bool;
 });
 
+register!(NV_PGSP_QUEUE_HEAD @ 0x00110c00 {
+    31:0    address as u32;
+});
+
 impl NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE {
     /// Returns the usable framebuffer size, in bytes.
     pub(crate) fn usable_fb_size(self) -> u64 {
diff --git a/drivers/gpu/nova-core/sbuffer.rs b/drivers/gpu/nova-core/sbuffer.rs
index d9c412a68bd8..1a27226b65d8 100644
--- a/drivers/gpu/nova-core/sbuffer.rs
+++ b/drivers/gpu/nova-core/sbuffer.rs
@@ -50,7 +50,6 @@ impl<'a, I> SBufferIter<I>
     /// let sum: u8 = sbuffer.sum();
     /// assert_eq!(sum, 45);
     /// ```
-    #[expect(unused)]
     pub(crate) fn new_reader(slices: impl IntoIterator<IntoIter = I>) -> Self
     where
         I: Iterator<Item = &'a [u8]>,
@@ -72,7 +71,6 @@ pub(crate) fn new_reader(slices: impl IntoIterator<IntoIter = I>) -> Self
     /// assert_eq!(buf2, [5, 6, 7, 8, 9]);
     ///
     /// ```
-    #[expect(unused)]
     pub(crate) fn new_writer(slices: impl IntoIterator<IntoIter = I>) -> Self
     where
         I: Iterator<Item = &'a mut [u8]>,
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index d0ee33a487be..4ac6304332b6 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -317,7 +317,7 @@ $(obj)/%.lst: $(obj)/%.c FORCE
 #
 # Please see https://github.com/Rust-for-Linux/linux/issues/2 for details on
 # the unstable features in use.
-rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons,offset_of_nested,raw_ref_op,used_with_arg
+rust_allowed_features := asm_const,asm_goto,arbitrary_self_types,lint_reasons,offset_of_nested,raw_ref_op,used_with_arg,slice_flatten
 
 # `--out-dir` is required to avoid temporaries being created by `rustc` in the
 # current working directory, which may be not accessible in the out-of-tree
-- 
2.50.1

