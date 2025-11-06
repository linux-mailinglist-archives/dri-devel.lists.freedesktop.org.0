Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22E39C3DC29
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 00:12:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64ED910E9F4;
	Thu,  6 Nov 2025 23:12:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gguoQZ9Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010026.outbound.protection.outlook.com [52.101.85.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2836510E9F6;
 Thu,  6 Nov 2025 23:12:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U3gDWgYwqhvwVWyUIVXvExL9860mBozWN2kBdPwKl/HMAerlHiogHK+18Dz14yVJKgPllk3cVq3YOGU+Zhp3pwgog7+8Dont4x04fIgP1PGBmml2K6V5+hnci4pAiTUeTjNkWV0VxOTZvau+eZ20GXxtLFyIOi1dpAYW1oxPqzdKu1W6IE4tbjUp5DIcVmsE9spkI899y6m1D5HkGvi6LnYTFOY642dU9UQ5G7DWCfEcLdUt7YieZWC9hjH1zbvH7QJXCflmZeZvv5H2z6fd872BEBAzC2B7CZtohZ8OVA8cQHDco6jeaDWFfbY27Sw9y24LI1125YdzOYr2ha9lEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EMhFXvQbaLXL30z0/SDk4Wa0rKIKhrkE/fW07/cVMio=;
 b=tnLFoca3ePxV1Wo/QCJQrJDlTCrTNrIt2RvBlotgtsyAMbba3mB9YZgtEeE0DJg2cIjc9Hsz+Z/CvK6Du/ojqLfTSeSnfnD7pVUZM3v72iGwZiOoM3Z4yYTBv6SlNVc8rOCPmvnjGIWG8oFiOCfNAEnVOaaZjUfG2BmKS59IqebbKNowacZ1wzfM3XFISlolrPJed0fkiAzQUV5Xu8UB6SoLr7KGoySDjCxs/chTWUOn/M10w7sQXQly43G8y6KjDEoL+/UeHAUjwe4M+P9ywWDVcHvCSlVr/DW7EGPMV3C6BIXbMI4nwa6v3kcMkAESWU5mkywCvGK6OHXj6t8SJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EMhFXvQbaLXL30z0/SDk4Wa0rKIKhrkE/fW07/cVMio=;
 b=gguoQZ9YcMgNg/KVQ28WdFiRdBqrTKk4jLu+NQtXJoSUZ4nKzeHZKSXfm6bF1fLummD8GiHPdDhPWEhaovIo4THAwz7AcD7ZcjgB2aT3sWVOZyqal63jnr9tQ6AmnBS7LYDNp0qXtdi6OgiL/pgrRDdW9OsXbUOWvnSr5JKm5XxQ7hBKyW/SgDpPJkS+R1ihXa86iGunEwwv77FMUGs26ZnhM7L7J39ekQ0HUKA8gjDjnICuQ8CMwCEEeVvrO6nCcANVYfZJohUQ27cmzoS6VfhtPgm7hyfnkeY8Fwgc+F5wmhkvi79WqarDnXe9o7eyYup6HhWvrKcQXzwd92NS0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by BN7PPF62A0C9A68.namprd12.prod.outlook.com
 (2603:10b6:40f:fc02::6d2) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Thu, 6 Nov
 2025 23:12:13 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 23:12:13 +0000
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
Subject: [PATCH v3 10/14] gpu: nova-core: sequencer: Implement basic core
 operations
Date: Thu,  6 Nov 2025 18:11:49 -0500
Message-Id: <20251106231153.2925637-11-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251106231153.2925637-1-joelagnelf@nvidia.com>
References: <3b0d776e50fc81797dec2e5d81c86390af78f848.camel@nvidia.com>
 <20251106231153.2925637-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN0P223CA0025.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:52b::20) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|BN7PPF62A0C9A68:EE_
X-MS-Office365-Filtering-Correlation-Id: e305b70c-a19d-4e60-198d-08de1d89ea98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Q4sxyr6a36cQCfTbhyschTbo3jFXvtnGTr+TYQDXYNjhqFJ94udU1HslpeNe?=
 =?us-ascii?Q?ynySAOz7q3b6Nk4GhkBqSUmOX4MY2Hb0fW7lxBcWzNvgumIeDZFxRozHRRGT?=
 =?us-ascii?Q?7d+fObBcttx/EsoNfevTPvSyOzT/pG3Ka0vkbTS3SrUoX4ZU2pRMypiEE7La?=
 =?us-ascii?Q?lb0qqua1/ufGIEhHZAfWinTVjWfJiywHftMAJUX5b8gFSmW28eGhcdVA+Zen?=
 =?us-ascii?Q?BrIy4yF9nIfJXUxP402GhGnrdvAhCBvqf0rXaT3P8SV/H/fLLgfDax9uwLYA?=
 =?us-ascii?Q?hoUE3EPtzDgakJsOKkK3q3p4DXInUqZNv4lC5U/WqFE+4KFjvrOHHwI+LjpO?=
 =?us-ascii?Q?yANeoeTdyeBpqdgVuvyRL1wgICy1E5rtDnxFjiew1ShX+/S05VVE7RR2chkG?=
 =?us-ascii?Q?P9SEFAwH5QYcw3htShwf2XPga8HynkqDiXvOHBfpGTm1y2/XswtfzwPPRFAp?=
 =?us-ascii?Q?cOWbmMPuijj/0FtWtxAPd8NklZf/52QfcKHBHEHn09dCJ0aDXjFekgBwjo7a?=
 =?us-ascii?Q?kc4/0dwgEtv2mZNe0xNv+IhSHpanaKmtuoLYwxtClDGlvUQZbdhPEn3tkRgB?=
 =?us-ascii?Q?9Nam7ne8Mu2vgyxJQxaAIct36mfyb2FQtcihFzAcyPqZcjbTvC9N9FSoYQUx?=
 =?us-ascii?Q?pSoAdHEZRzKyBT2ZYa60ixBcDUNZx5pqg7f9PpFiwH6+jWr81UXBhOlMWDjC?=
 =?us-ascii?Q?o8eR4bpStMlBWasU3MDeE/KbmQ+fA7wC9Q9COCj/OgsXCNq0GoP7WCtN+V/U?=
 =?us-ascii?Q?wfiksuN+zwNZRk7Sx144KvQhovpbUHJya/cFfICKe9Z3/zTc/DCRWlIOatqB?=
 =?us-ascii?Q?zJ3zVYAKNPS+P1/QzepNfOuugg7Un6HiAq4ixVKS8GbbD2/hsY5YUhsyORRg?=
 =?us-ascii?Q?pD3KEiI6g+la87xCqVGCTN8v4l/UdcZvPDwdm5si6WTVeq21SZlXag8WqTkj?=
 =?us-ascii?Q?J12wPv6UyBx82hKiQ3x8nhmVTe1A0oAEtKDimuVv8Tb5SnFbGVDt4fkkrSgT?=
 =?us-ascii?Q?qHU5N97xMMijiPJZLlNuEST9kBwmVKOOSIWF0rHerEpjfxfidVz7Jm7YQXIw?=
 =?us-ascii?Q?TOWIW6VWv6QPZ2b2s7Pczl4wWwKx9WsW4hADum99ay4BKWw7AluoUOKG8BHB?=
 =?us-ascii?Q?Owl4Pt5AIGVZgASacLzp5w+K6ckkSxDLJqRpxeNIAEykC1Ks5hJhAbGOb9TE?=
 =?us-ascii?Q?HwG9p3yyoO1Jjb0q+IrEaRmn19Z3qmZ9e5DVqBYq+QM4I5Bgad+RuMeLbCSp?=
 =?us-ascii?Q?O+hgyQj2WIKIOJ28iIxFDrkz1dH/5qHLo+KCzlfLex4QV5Y/glCbjJ0B4RgE?=
 =?us-ascii?Q?JNtc/rPryksx5Y+EgdulckjNNuzfGT5/EV6tRZsyD/O7w+IIv+2Q+Yy/1Bmh?=
 =?us-ascii?Q?5tDjgOoUJweSnukMiKwJ+81C4sMYTw9vhGO+qNI121sRC046ma9Iv8TahvB8?=
 =?us-ascii?Q?TnPQi6/iQ5S9wy+pq8fYVHtQIxDfTABi?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Dx266i8BPHYzT+yc+axSwoEPytm+QgBeC/T68SIiFY4i9nejUT+m5A9Pa4Hm?=
 =?us-ascii?Q?QJ4RwZfloyvLxcuZDqeLrRFy/cZJLl7VPiJoYSRwxzskUZdsUwWie4O3R+Wh?=
 =?us-ascii?Q?73WLS8WdtqGlA7OubyynJLv3pkTN7ub+4ZD4qIi90c8UrcigVImVK6taPFW9?=
 =?us-ascii?Q?T+I6quNWWgDofZksmeCtAaIyP4xpx/zI6JLwpuGRcQw24aiFj5hdaZHDY0PN?=
 =?us-ascii?Q?s0sur2QC5JLzMWKlyXhvoQQ77RcdPZVEv347yCaTUHNgxAk2E892XWSm2OvD?=
 =?us-ascii?Q?p1PCPZY0ovj3rixcyv1jjVdRVWevnRbNILa0JBR2uwyHDY0PocGQso6SOrAI?=
 =?us-ascii?Q?fJvvTNqeSGdFN9vH6qjRp0uO+YPwbDGU8FGdcCfPu/TDwxoKmMAHy/vlOK64?=
 =?us-ascii?Q?GjW1M2ynI1gH4steQGJ3P61EUq4vosUkzn9mb4FhZ8Uncj9Gx59yWyTgQ+eQ?=
 =?us-ascii?Q?37idWkZPrzqZdCBCAj6aVleuQsPRj3LLFshD0lf0WrgV8zgrxn2TWpBeH3NP?=
 =?us-ascii?Q?wzj3m+5Y9CNEg6UwsfnjgOY2G/d12/XrN4hNLN1wQY5Mxbpf5GWmDA+cP01Q?=
 =?us-ascii?Q?nq/HuIifcIxEJkwdm9UleO/hjw69IrwjtfbVxuMNHy4J30N/BuQN8HoYg8mj?=
 =?us-ascii?Q?sNOOVgNRo8sb8GoJY3pgecE7lT69NeePLtk66vrnao9WDM5ZZJkLIDqu+2iJ?=
 =?us-ascii?Q?V8TqyPGIMy8cZPVTG40U8wp9vT8pX7QHssOvWnU+C+zFLtsxBZFHqGF8kQw0?=
 =?us-ascii?Q?1fcD/kpojWNXwvUxKpebGizGh4LZx8spU3p1tEq/H7dXjUnOe9EutFLAGdRS?=
 =?us-ascii?Q?wEJUnlueKSiDukEzYHOQo9/T6RLXm2FuefOrYR7vSCHElBZbeiT62yvTj2wP?=
 =?us-ascii?Q?auZVPw40M4JhnvhxhzNjFz2+4PnHygX664Y442vj94zGhA48bhI/EMVZGqi8?=
 =?us-ascii?Q?Lp6QwtOERWB8TnzRXPM/tca9j+B4pN24kqPu7EUKqBlW7585puRuvXISXc1R?=
 =?us-ascii?Q?2OeBPo7hc7S35e993cnhnDwdthyChIj7oj8Cx/FZV/pWNz6OWJaKtTYvqh6c?=
 =?us-ascii?Q?gc2x6DlDyVpxc3MQJTOgO2XRysmtsmzDXzO2qguHw9utjvBGYA5RSlUDHVca?=
 =?us-ascii?Q?mLRHapGH0QBe9oriyV/fj5MEuC467AoRFADVVuxNUEfsFsARSDvAfs7vtc6y?=
 =?us-ascii?Q?mZEWy8kKNhpBKgGLgXAiQ4OdCQDw7d0fxWS6JyVAIWp1Z1cx5ivetfNROzBM?=
 =?us-ascii?Q?JIGkNynRCqc6l6dlUv87kIZcPBYoDMtatcoqXKrrUMByRwHtB40VIXWJe0o5?=
 =?us-ascii?Q?xJgc4s/MyPH282VByKpzQNfZloNSTTp1YRcVpz9gAXERAqLivSVTZCR2+t9q?=
 =?us-ascii?Q?vuTEUHu8Q+dCi93EBiP8gwOU5wWIompAjhW1RmXGWn+47QvczQ/85jFeXYDv?=
 =?us-ascii?Q?3N52K1U06+/FyZ7o4GxuPMQQCrgmHMJKKCRGwDQ17AkK3Fm/rEJu3VxRq2FB?=
 =?us-ascii?Q?owlHgfNHlarfADwhufsfh4w22StYwBQn7UBIxHnRZegjCNmEvt97J/lozCnR?=
 =?us-ascii?Q?UmAf2TewGA8ZxeRl1NTfWWwPkHNiG8Ci4AiRhv1x?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e305b70c-a19d-4e60-198d-08de1d89ea98
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 23:12:11.7984 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xtpPoymIBi95SRdmu8T0iDeC1La+IXQYC8+6JPtm1aWbODzPRlX2Wm5tniOkWaiO/zg8EbCxiCu6FS2XeV78qQ==
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

These opcodes implement various falcon-related boot operations: reset,
start, wait-for-halt.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/gsp/sequencer.rs | 27 ++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
index 17118967a8d4..0192ac61df4c 100644
--- a/drivers/gpu/nova-core/gsp/sequencer.rs
+++ b/drivers/gpu/nova-core/gsp/sequencer.rs
@@ -49,6 +49,9 @@ pub(crate) enum GspSeqCmd {
     RegPoll(fw::GSP_SEQ_BUF_PAYLOAD_REG_POLL),
     DelayUs(fw::GSP_SEQ_BUF_PAYLOAD_DELAY_US),
     RegStore(fw::GSP_SEQ_BUF_PAYLOAD_REG_STORE),
+    CoreReset,
+    CoreStart,
+    CoreWaitForHalt,
 }
 
 impl GspSeqCmd {
@@ -75,6 +78,11 @@ pub(crate) fn from_fw_cmd(cmd: &fw::GSP_SEQUENCER_BUFFER_CMD) -> Result<Self> {
                 // SAFETY: We're using the union field that corresponds to the opCode.
                 Ok(GspSeqCmd::RegStore(unsafe { cmd.payload.regStore }))
             }
+            fw::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_RESET => Ok(GspSeqCmd::CoreReset),
+            fw::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_START => Ok(GspSeqCmd::CoreStart),
+            fw::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_WAIT_FOR_HALT => {
+                Ok(GspSeqCmd::CoreWaitForHalt)
+            }
             _ => Err(EINVAL),
         }
     }
@@ -96,6 +104,9 @@ pub(crate) fn new(data: &[u8], dev: &device::Device<device::Bound>) -> Result<Se
     pub(crate) fn size_bytes(&self) -> usize {
         let opcode_size = size_of::<fw::GSP_SEQ_BUF_OPCODE>();
         match self {
+            // Each simple command type just adds 4 bytes (opcode_size) for the header.
+            GspSeqCmd::CoreReset | GspSeqCmd::CoreStart | GspSeqCmd::CoreWaitForHalt => opcode_size,
+
             // For commands with payloads, add the payload size in bytes.
             GspSeqCmd::RegWrite(_) => opcode_size + size_of::<fw::GSP_SEQ_BUF_PAYLOAD_REG_WRITE>(),
             GspSeqCmd::RegModify(_) => {
@@ -200,6 +211,22 @@ fn run(&self, seq: &GspSequencer<'_>) -> Result {
             GspSeqCmd::RegPoll(cmd) => cmd.run(seq),
             GspSeqCmd::DelayUs(cmd) => cmd.run(seq),
             GspSeqCmd::RegStore(cmd) => cmd.run(seq),
+            GspSeqCmd::CoreReset => {
+                dev_dbg!(seq.dev, "CoreReset\n");
+                seq.gsp_falcon.reset(seq.bar)?;
+                seq.gsp_falcon.dma_reset(seq.bar);
+                Ok(())
+            }
+            GspSeqCmd::CoreStart => {
+                dev_dbg!(seq.dev, "CoreStart\n");
+                seq.gsp_falcon.start(seq.bar)?;
+                Ok(())
+            }
+            GspSeqCmd::CoreWaitForHalt => {
+                dev_dbg!(seq.dev, "CoreWaitForHalt\n");
+                seq.gsp_falcon.wait_till_halted(seq.bar)?;
+                Ok(())
+            }
         }
     }
 }
-- 
2.34.1

