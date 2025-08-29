Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 901C9B3C1D5
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 19:34:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61ECE10EC16;
	Fri, 29 Aug 2025 17:34:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="iI13Q4oS";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2082.outbound.protection.outlook.com [40.107.93.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D19510EC13;
 Fri, 29 Aug 2025 17:33:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yfupw2Jlcm5DpJqaq6C2qr+BbGt45QzdbheJQdFec4JtXvIOr19iRl06Hod72pjNsVeWNTcZ6EN8sHps12WBKFhT2EeWNBVLAYA7ekxMsAcU/JRTAf/DWtUVuVB3snwUWLiVJtacgndqC7KoTf5k94IF21+Evpyvfx8T68+SqdI8+cHNjN7MKX9NJ72NuFOWcuzvd8dmnT3nBg3h56XECC7qNSHtJhHuKUp65E+2b+0Zmk40/J6vOQ5L9y/eQLIq4yzHhzR2Rc3aZLDXvCVv/uFCQsz5XSrhnpcK91P4cfd23JMW5W140vp9mDWhd+8zhV6nBRB9fJuIDV+HXPAwPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HEFFhT6Hxx7Cc5LJLMQchHtszeKz53e2TSuaTIh/VNg=;
 b=K5BT8Mn8sTNeQz5mqEkTyYPRiusBxS6I4hxK4Ixiu8Mu1Wj3koScPvToFcVHej3Sem0en2PnXPj5/48rqS1zW7bLCOJ6g0ExYN2itDGnmbAwmgb/FLOC7Id4jN6/LCGiYKPBf9zt8cG3uF1LsaD5v/u/l3F7EQNuS9Jhy6C5mkHBzBnjKRon7cCC91dbuEyDZ0s7/v9JFLT+pCLzdDepYRj3kBwIWo0zJpkGjmjteb5a8qHK3poZbezCwMoeLUSPKFV/Zw9Jm8P35Pan0JhT8d01vEn2DP8LPP6UzmGyUbOz71WkP896NCiWYxbWHG/cYxIL1yRW5XLk7o7F4Y/GIQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HEFFhT6Hxx7Cc5LJLMQchHtszeKz53e2TSuaTIh/VNg=;
 b=iI13Q4oSjSM+0RuEc7s8ONnjXApOItVBTKKz6fmnNspcIlgbn/xzXSSQbRYbfYiZ6CkgA+NFzW8I6QUAhrT0bvTNAN9NmRml+Aj9oLXbn6IYlc0XsV7TAr1z6QKigVkgHDnfG+pSjV42dqQ7XGKCRCBm/N+nHJy55DJKFAyHjI4O82DxtYE832+wnNG0brGgoQHaioJ8I046OmNldF8/qbHzJ8UYy0VGcDQOIjIWCephTlUCd4UP9V7fHAM3mbcDLNWkmFJMWsWn4b0edmBD3l3tQMGzl3i1aNGN3tLNHoy08lSLLoxKzDl6WsrIgxvZBEsPumniTAhzxpJKl0lTFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CH2PR12MB4069.namprd12.prod.outlook.com (2603:10b6:610:ac::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.16; Fri, 29 Aug
 2025 17:33:40 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9052.017; Fri, 29 Aug 2025
 17:33:40 +0000
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
Subject: [PATCH 17/17] gpu: nova-core: Add get_gsp_info() command
Date: Fri, 29 Aug 2025 13:32:54 -0400
Message-Id: <20250829173254.2068763-18-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250829173254.2068763-1-joelagnelf@nvidia.com>
References: <20250829173254.2068763-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR22CA0018.namprd22.prod.outlook.com
 (2603:10b6:208:238::23) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CH2PR12MB4069:EE_
X-MS-Office365-Filtering-Correlation-Id: 670ef624-515f-4dc5-c1de-08dde722316b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2Q8MmWGaTHwDmLspjDy5dPH5ZL9eycCWj31yi6pDdPK+JDSKcYuThv5NlS1g?=
 =?us-ascii?Q?4rJ5Xthu9fxu2NyNhVoCCVE0rkdwKLBBLAo1EWiGwiBkcJRH+VilGBYrW1/k?=
 =?us-ascii?Q?iGi48EGT+YjF5kCh+xstyaX2gXXBsQr7FmChoYoXd7oymyVvWBYXuMX7a+5U?=
 =?us-ascii?Q?tqWupmZ85sy6z3RRl9fqc51PZD6q7sz0VKHcV58Ypw1E8rzv4wY29xC3vofs?=
 =?us-ascii?Q?YlyrcNJLfAJ4Lgc500y416kP0Ap8yS7/ZY17uLUxLwsz5S7juZLFrphqobkX?=
 =?us-ascii?Q?ggoabWoOM9mi2AbIRvioCtTFyH3pgtIlF3n7f93o/+s9mtoDS3LhirbdjvQc?=
 =?us-ascii?Q?EtjGEpdX/bsgJvXB73SOdpRkLX0fAqUXyZBl45vivqcxBxhlHFItOUmIkROA?=
 =?us-ascii?Q?5uR+E2SvM74DDXRHNhSjZvTNzi1KzPqdNZC4gRyKbF6LeukkeN+Owst8MK/h?=
 =?us-ascii?Q?PShmMVc62bjNwMdrqisAOIIQyneye2NQTV8eC7frCdYiohySRMJhnEbsmu0R?=
 =?us-ascii?Q?BiAjjc0F2+qjDE/FONmx0e2wj+9jWZVO6VpAvZdHjKQgBEczDUpRBGRHpajW?=
 =?us-ascii?Q?NXmWCiaEQyOuL+xvf0AumPkBr+vTNjv0ANujBgIJnWSsfs1XIrl/U2ur0Ewp?=
 =?us-ascii?Q?NzDPTrJoceAPqb/L1zYdrxOFiZr5B0XD0ISBk70C7p3GkCcvHG47qGFRGjuk?=
 =?us-ascii?Q?joNPLy6Xn03EWiQF8zP/U4sRbpEGXOH8BnayDIXNdWMhkvhXq6pQ+vUSI1Y4?=
 =?us-ascii?Q?nW9EbYb5Np0SWxYXVC8g9e7tlyt+2UFd1jh/f456/CsbcDMxvLyUVBx/6adb?=
 =?us-ascii?Q?yhQVaxr7B/6SgZcE46rMq3iBswtIn5/jFu6UzlbsgI3HCMfNKDWHv8+r6zao?=
 =?us-ascii?Q?3P1KEr+/8WZORW6w+qBR5j4ft6NnHKKZ0lUy0vmRmh+PdgTwmJnb+nuhp+EY?=
 =?us-ascii?Q?Uy1ZmBwhT+NDOateIFBihiEUD/Av1d+Fjf3IuOOE3LQFHltA3xypEg5GnKn1?=
 =?us-ascii?Q?Y0lZHeAcNGYi73/rrPA/YfNrxL/MQ3L6CgNRjFD4cqyoLe/ZQLFKsAie5QJY?=
 =?us-ascii?Q?XDLXwdMEw01mrMjFgn8oxuBibvFx/g4ZtBUD7Ki3qlaffSE6v9857WpWGCvp?=
 =?us-ascii?Q?G+w03iplCCsbtttpDir7uMt2zaxhfBTUp0HYX2F/rx3PabZhvFeKD8WomN9U?=
 =?us-ascii?Q?b4ST32rpkPoL40mFvIV7Thu4F5Vh5Ri8x6puKbtP9jvbTDnJZFi/LIpFZQnY?=
 =?us-ascii?Q?f14+/lkVjhXBr1Iyf1+Nv1x5VOtnaiUy1A/qc8piy07fAEJfNVY18IW9Akjk?=
 =?us-ascii?Q?7l3SHUEd169ZOAkRFR/BEXTlr+ETVJ3pvuneP8VcX7YH+1Kcs8E/LE9SamNj?=
 =?us-ascii?Q?ktZDIDYuo70UEDTDWFz91kaeBFMugaZbgtEg2rwr95CuaKtM4b+AH532o0gE?=
 =?us-ascii?Q?mm/tnYeIzyk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xvhUaJYRHWpBYFVgncVZF2qZ7LwPwsovxDgQOzJg84rSxAHdqcArmCCN/k22?=
 =?us-ascii?Q?eswE+eeJejN0c24Gt+eaGVuLrgxTih3lqM4gYNyOeTR0iA2cNJ8MWdOmIB5Y?=
 =?us-ascii?Q?fadTzgZVW7O+P8By95u4/JRmphc7uL7TWxXg+0dx12V317rrFYA0qf4pQY70?=
 =?us-ascii?Q?a/C39KxXiQ1BlqDTuWv2NJbM/hUdjW2yS+3dH44fRocMQqs0/E9uDAjxRUvB?=
 =?us-ascii?Q?0kk2BS20Uz1qMfqNQkRp5WBpd25xqJfjr8W69oBp54dGqpHvhFa4GjDgsnOl?=
 =?us-ascii?Q?7ODqjqjRJSsaBCt70vOqcHscsv8iCZwTMqU3MqivOt0zzRVwDNvdlX83q2vf?=
 =?us-ascii?Q?siH/TGeX58KB/XnRJMUWhQvdo4Xm+XhcbiGBg+lwoOd88pT39wjkrX4jHZd9?=
 =?us-ascii?Q?0zYmCrdlBtnQssxwGHqsqwD6wAwXNPGR2KKzN3Roiv+KERx5MMtUWV3FFCpV?=
 =?us-ascii?Q?xhH77y3sJbysl8e+2f4A3pRsOUn6TiAFkE90+W6jjyUqs9vke26ifaer7Bc/?=
 =?us-ascii?Q?mkdz4PJIMy5PrkKvaEKzVtu2MhCLBf8J+2czwbtqqGrMiHZLVJR5Wm2sPsuK?=
 =?us-ascii?Q?qe0DkdwYVuNznsx3FWrZR5vJlhngUtluvCkMlMjq859dIcizpJ5azyh7zQd2?=
 =?us-ascii?Q?DvMCk4uzxlMtQ1toIts71E8fESvc43ZEfpPoP8bvv36miGclImpfdhheHCzy?=
 =?us-ascii?Q?FW+T1TqrUyUk787DJi68OhiN066KuWI1UYvSXe0U/mY6CPC9yz5Ao5/q44aG?=
 =?us-ascii?Q?oFLFxuuM4/WNhuuacjKHTPhVFGIMEzDddtWdOxrPG5+IiVZHsNyg3r4921E0?=
 =?us-ascii?Q?IluXWLeI/uDVt229M0cjdIQypehSlSs2mcgwgkgRcHFnLMORf6VM2B8seqFa?=
 =?us-ascii?Q?uZLNl747uoWNYI3tdP3F9YLDyQujo3kTWa4TF9qiWlNEGkZSG9tLbWeVypuA?=
 =?us-ascii?Q?1gTsv0QnLxSamRExoYaexCSBiS9bfPtoKZ6OzD9qoDYwf0/L7L+wbarob+jj?=
 =?us-ascii?Q?jbSaXy9rbA2dejwL+ipP96wy/lR0Jfe9YwTUVMOAoTJcuLgX40m3OWTyblGI?=
 =?us-ascii?Q?53sc4RL+b4Uvg9wIGGINeMzOVigwTMLJh+z1aXkw5v856TaIjdJ54LCxdmhU?=
 =?us-ascii?Q?7ONREyJzQ6wMM9yqS2/Y5x+KKr6pcBW+bIhLRmy60n4wge+hP8yXO9bFV8FZ?=
 =?us-ascii?Q?olaxRYuVOFhoSO/0GMpbeG38K8tkRwB9HeLO1ZcRjKFlaxfkqmN34CLlBOWX?=
 =?us-ascii?Q?ndAJLN43n/5iZZJ+J8joXFDrcLpMMAKUZsjrpEz9klK8ef+FtZZoQtKjAp8h?=
 =?us-ascii?Q?D2ogMdkvY+/KKppKkDilKe7q3j8QmIV4w6eRdM8ZcJzgq+gfgVyqgmADpKtE?=
 =?us-ascii?Q?o6Dy7W0ilB2ye7kPeplZEEPfthiFN/0/zixij2EfvM7L/ZGTpuSNNXods+Eq?=
 =?us-ascii?Q?7UGGuEGUqH+EpCRbGDvWtFv38rmaNkcP4RBpUbJARtocU/wvKdPIW4wOufGX?=
 =?us-ascii?Q?0g2PPKbLRElaPedmexxJIbWFKuMouQPcGAJmmjTcRv38++/HSjnsf5g11VQG?=
 =?us-ascii?Q?N7e7AHR+/FqjbfhzaCLiO+OHGe+7sN50Cjt/6zVc?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 670ef624-515f-4dc5-c1de-08dde722316b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 17:33:40.2423 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Lg8hd6mALXzVLRkNw3puiYjNfJxcxT+TsExflRKb3X9OusL895D0tvaRaEcLulIHKq2IzLHxyDezHuomnikRqw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4069
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

Introduce the get_gsp_info() command. This is a basic command which is
sent to the GSP to get some information about the GPU. In particular
it gets the model number of the GPU which is printed to the kernel log.
This proves that the GSP is fully initialised and that the command queue
is functional.

It also serves to demonstrate how interactions and data from the GSP
will be handled. GSP specific data structures will not be used outside
of the GSP command parsing layer. Instead data will be converted to
Nova specific structures (in this case the GspStaticConfigInfo struct)
for consumption by the rest of the driver. This ensures the rest of the
driver is isolated from any changes that may occur to GSP interaction.

Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs                  |   8 +-
 drivers/gpu/nova-core/gsp/commands.rs         |  49 ++++++
 drivers/gpu/nova-core/nvfw.rs                 |   2 +
 .../gpu/nova-core/nvfw/r570_144_bindings.rs   | 163 ++++++++++++++++++
 drivers/gpu/nova-core/util.rs                 |  15 ++
 5 files changed, 236 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 023bafc85f58..7aeecdb0dd28 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -10,7 +10,7 @@
 use crate::firmware::{Firmware, FIRMWARE_VERSION};
 use crate::gfw;
 use crate::gsp;
-use crate::gsp::commands::gsp_init_done;
+use crate::gsp::commands::{get_gsp_info, gsp_init_done};
 use crate::regs;
 use crate::util;
 use crate::vbios::Vbios;
@@ -377,6 +377,12 @@ pub(crate) fn new(
         )?;
 
         gsp_init_done(&mut libos.cmdq, Delta::from_secs(10))?;
+        let info = get_gsp_info(&mut libos.cmdq, bar)?;
+        dev_info!(
+            pdev.as_ref(),
+            "GPU name: {}\n",
+            util::str_from_null_terminated(&info.gpu_name)
+        );
 
         Ok(pin_init!(Self {
             spec,
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
index 9f858aedf853..3491f8edef0a 100644
--- a/drivers/gpu/nova-core/gsp/commands.rs
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -19,6 +19,8 @@
     NV_VGPU_MSG_EVENT_GSP_INIT_DONE,
     NV_VGPU_MSG_FUNCTION_SET_REGISTRY,
     NV_VGPU_MSG_FUNCTION_GSP_SET_SYSTEM_INFO,
+    NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO,
+    GspStaticConfigInfo_t,
     GspSystemInfo,
     PACKED_REGISTRY_TABLE,
     PACKED_REGISTRY_ENTRY,
@@ -34,6 +36,12 @@ unsafe impl AsBytes for GspSystemInfo {}
 //         that is not a problem because they are not used outside the kernel.
 unsafe impl FromBytes for GspSystemInfo {}
 
+unsafe impl FromBytes for GspStaticConfigInfo_t {}
+
+pub(crate) struct GspStaticConfigInfo {
+    pub gpu_name: [u8; 40],
+}
+
 struct GspInitDone {}
 impl GspMessageFromGsp for GspInitDone {
     const FUNCTION: u32 = NV_VGPU_MSG_EVENT_GSP_INIT_DONE;
@@ -62,6 +70,47 @@ pub(crate) fn gsp_init_done(cmdq: &mut GspCmdq, timeout: Delta) -> Result {
     }
 }
 
+impl GspMessageFromGsp for GspStaticConfigInfo_t {
+    const FUNCTION: u32 = NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO;
+}
+
+impl GspCommandToGsp for GspStaticConfigInfo_t {
+    const FUNCTION: u32 = NV_VGPU_MSG_FUNCTION_GET_GSP_STATIC_INFO;
+}
+
+pub(crate) fn get_gsp_info(cmdq: &mut GspCmdq, bar: &Bar0) -> Result<GspStaticConfigInfo> {
+    let mut msg = cmdq.alloc_gsp_queue_command(size_of::<GspStaticConfigInfo_t>())?;
+    msg.try_as::<GspStaticConfigInfo_t>();
+    msg.send_to_gsp(bar)?;
+    cmdq.wait_for_msg_from_gsp(Delta::from_secs(5))?;
+    let msg = cmdq.receive_msg_from_gsp()?;
+    let info = msg.try_as::<GspStaticConfigInfo_t>().map(|(x, _)| x)?;
+
+    let gpu_name_str = info
+        .gpuNameString
+        .get(
+            0..=info
+                .gpuNameString
+                .iter()
+                .position(|&b| b == 0)
+                .unwrap_or(info.gpuNameString.len() - 1),
+        )
+        .and_then(|bytes| CStr::from_bytes_with_nul(bytes).ok())
+        .and_then(|cstr| cstr.to_str().ok())
+        .unwrap_or("invalid utf8");
+
+    let mut gpu_name = [0u8; 40];
+    let bytes = gpu_name_str.as_bytes();
+    let copy_len = core::cmp::min(bytes.len(), gpu_name.len());
+    gpu_name[..copy_len].copy_from_slice(&bytes[..copy_len]);
+    gpu_name[copy_len] = b'\0';
+
+    let config_info = GspStaticConfigInfo { gpu_name };
+
+    msg.ack()?;
+    Ok(config_info)
+}
+
 const GSP_REGISTRY_NUM_ENTRIES: usize = 2;
 struct RegistryEntry {
     key: &'static str,
diff --git a/drivers/gpu/nova-core/nvfw.rs b/drivers/gpu/nova-core/nvfw.rs
index 39e5f3d5b432..d51a697e6c27 100644
--- a/drivers/gpu/nova-core/nvfw.rs
+++ b/drivers/gpu/nova-core/nvfw.rs
@@ -43,6 +43,8 @@ pub(crate) struct LibosParams {
 
 pub(crate) use r570_144::{
     rpc_run_cpu_sequencer_v17_00,
+    GspStaticConfigInfo_t,
+
     // Core GSP structures
     GspSystemInfo,
 
diff --git a/drivers/gpu/nova-core/nvfw/r570_144_bindings.rs b/drivers/gpu/nova-core/nvfw/r570_144_bindings.rs
index 607d99ac2221..4aaa381749ae 100644
--- a/drivers/gpu/nova-core/nvfw/r570_144_bindings.rs
+++ b/drivers/gpu/nova-core/nvfw/r570_144_bindings.rs
@@ -320,6 +320,77 @@ fn fmt(&self, fmt: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
 pub type _bindgen_ty_3 = ffi::c_uint;
 #[repr(C)]
 #[derive(Debug, Default, Copy, Clone)]
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
+#[derive(Debug, Default, Copy, Clone)]
 pub struct DOD_METHOD_DATA {
     pub status: u32_,
     pub acpiIdListLen: u32_,
@@ -367,6 +438,19 @@ pub struct ACPI_METHOD_DATA {
 }
 #[repr(C)]
 #[derive(Debug, Default, Copy, Clone)]
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
+#[derive(Debug, Default, Copy, Clone)]
 pub struct BUSINFO {
     pub deviceID: u16_,
     pub vendorID: u16_,
@@ -395,6 +479,85 @@ pub struct GSP_PCIE_CONFIG_REG {
 }
 #[repr(C)]
 #[derive(Debug, Default, Copy, Clone)]
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
+#[derive(Debug, Default, Copy, Clone)]
 pub struct GspSystemInfo {
     pub gpuPhysAddr: u64_,
     pub gpuPhysFbAddr: u64_,
diff --git a/drivers/gpu/nova-core/util.rs b/drivers/gpu/nova-core/util.rs
index 76cedf3710d7..1709a5d50e54 100644
--- a/drivers/gpu/nova-core/util.rs
+++ b/drivers/gpu/nova-core/util.rs
@@ -45,3 +45,18 @@ pub(crate) fn wait_on<R, F: Fn() -> Option<R>>(timeout: Delta, cond: F) -> Resul
         }
     }
 }
+
+/// Converts a null-terminated byte array to a string slice.
+///
+/// Returns "invalid" if the bytes are not valid UTF-8 or not null-terminated.
+pub(crate) fn str_from_null_terminated(bytes: &[u8]) -> &str {
+    use kernel::str::CStr;
+
+    // Find the first null byte, then create a slice that includes it
+    bytes
+        .iter()
+        .position(|&b| b == 0)
+        .and_then(|null_pos| CStr::from_bytes_with_nul(&bytes[..=null_pos]).ok())
+        .and_then(|cstr| cstr.to_str().ok())
+        .unwrap_or("invalid")
+}
-- 
2.34.1

