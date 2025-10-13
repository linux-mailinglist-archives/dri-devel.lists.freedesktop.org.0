Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F44BD1A23
	for <lists+dri-devel@lfdr.de>; Mon, 13 Oct 2025 08:21:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE65C10E3BE;
	Mon, 13 Oct 2025 06:21:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="f9Gu9H9d";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013052.outbound.protection.outlook.com
 [40.107.201.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A3D710E3BA;
 Mon, 13 Oct 2025 06:21:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B4b7gOdhYH4zZhBSsPgDTihDMuHjYEq4WhW6mA9q5xshRlQePD9JgpoqsYgJMotik7+/RF3kfjgf0c7oIAzgTd8jE1QE/5TjzKkGrR3huIzTEQ3JdwBis2nL27xTB32Jr2g7NMP3vg4NSuSSOSqp8OpWyeFRqdKbUY2rgqofQ/k/IzDvFbBKOCM7oQ5mjDWVKWIxd17vFAthoizVXTqSUM7oSP1bq/Wmq9RN/UxY5mRrZFTEBb2m8ju1F4XTuo8fYVGSi2fbVhOirz/doLhf2HiqV0kvADn/VYgajG3ULPhpkook8Psi9tPVGzTVG4YjQeR6vr1RfGttD1nh+BPd/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kLV/oNY/zs3hKguc56qWuTnkaFnbB7NsO4RGso4BiZE=;
 b=h+FHSF5YTB7ZmMnz9Wzd6wvw9rROQSy8b7KiusHtABkO2Auxbk+2S8FLxtExsivYGNbfr/lgSYIkxj9H34gWRCe9vikxW62EGaqUH50vGlTRpZE+dL91xV5zZLU8GYqMKRsGmiz4lOw9e+RiD1I5fgNGny2az+EW7bF0ZyaZUk85HND8FE6ygqr/GYJHNckDRvl5rQigOSZnyXNsSa32i3UvMfKNO24UQsqGm7wM14ddv6qdQYuMThDKecdmmo8vBPAvvjfWA/6N1qOO/jOOtXxgcFFQsUuBoHrRbzzB+V4iQFqpR0/3xJ8lB5h+tdazQwb12BUpLvRP0Vvz7GLuzg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kLV/oNY/zs3hKguc56qWuTnkaFnbB7NsO4RGso4BiZE=;
 b=f9Gu9H9dL1vBGnBron4meE2Vk/HORYBl7rggaQqXK3qtu0gL4Poy5m9Bq5n9LHgS77+DPc4rCTQJnn+gXDKIpbgb1Hb7fJc04oAJgkK/7CTzsJUnB6wAH/ASvGHlzMmqNKViaxOQg7ZZRmSt2JrdsLavoM3VNPzXFDqvQNtpl9uwR7l9Z5rL49qkx4kvAsD2xLVZdefIHK9wHmBX6/sWLBh+vbusGFcJlA3gvexxzXqEjLrhYQzYIicdDXwMJ/JfV9xhvJm+RtICj79lSGEEoOMPN2NXTjf1V8NF2o3NbXeCfRIi3h6ZOldHSVO0gN5xsK7o2oOQYl11mQBq/Q7rBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 DS0PR12MB8218.namprd12.prod.outlook.com (2603:10b6:8:f2::15) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.13; Mon, 13 Oct 2025 06:21:41 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 06:21:41 +0000
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
 nouveau@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>
Subject: [PATCH v5 11/14] gpu: nova-core: gsp: Create RM registry and sysinfo
 commands
Date: Mon, 13 Oct 2025 17:20:37 +1100
Message-ID: <20251013062041.1639529-12-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251013062041.1639529-1-apopple@nvidia.com>
References: <20251013062041.1639529-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5P300CA0050.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:1fe::9) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|DS0PR12MB8218:EE_
X-MS-Office365-Filtering-Correlation-Id: f64a3692-d5b0-4644-f43b-08de0a20c624
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ry+EwK3Mf8DShCYpjjlOfcLCEsGei+S5YzLI2E9EmcwFN5ZJ/U0hslJ6cSil?=
 =?us-ascii?Q?wc4YAFE9230/tnkpwFhevJBScgyQqO6unu7tL+XmcDgNOAn0srJGMTQ3R/v6?=
 =?us-ascii?Q?DxdbgG/ZjsD1vLWmMVeql+9M7cEEktvjGeL6TfYE4lGLgqxJEceLvak/BAur?=
 =?us-ascii?Q?kFxbIyQSc/rbJe4KG6CzrSg+3Ifx0bzLErggkh0CZG8iEZ3BXUuERlsQedtZ?=
 =?us-ascii?Q?heL7mHlAETi20Vnr2gVDIJ52VtP3+FgvL/VJZiLw3KlMyOdP+wdPXWWCBRPP?=
 =?us-ascii?Q?pLPA0pATsBn+jGkVQyUm3IkCeY5iiJNPU+KK6ZR4rBw/bouGVN7ofHhcHP7F?=
 =?us-ascii?Q?sjJSuzwEXQ6W+HAhxIXOH5S/Hqu6GPDv5PaO0FGyvz8KgKTgowwQY/VjToY3?=
 =?us-ascii?Q?sGuYfCc+xD0uovzEE4Xzx70hWxPdqGm123ct8aGE3jJLoNZDlVoYskdW5qbC?=
 =?us-ascii?Q?sa+uN6H85ZmAJKOlouIjZDUJA0TUmDaDtwBC+SlmCbF3xBrz/9k/Mcqko3vv?=
 =?us-ascii?Q?b29etXMheRExzL4cUggRXOtYMZAdrLx4f4ES9NoGiRlXhd/tOodX3ySw0X20?=
 =?us-ascii?Q?WTHTJj7VEJzwF7ZPvWDzKNrBGvWgCXe7UHeWwoYQv3ux0dCuFWJ0LdC9qUlE?=
 =?us-ascii?Q?4X8fdV3A27Ts3jZxoWQTY9qw4otvFznaG+b43hXPOhfPamiGfcjxkwwlHAl2?=
 =?us-ascii?Q?xdLhWObf+/jkhukhkilIRx2DuF16xRVQAL7L37Slzm0sTzc6KG951IGGI8RC?=
 =?us-ascii?Q?7/c3wFmp2Ooi6qDNSivlreRMWvhW8CpbmcxhC64fVAAzevhngkkpPGbrYhtr?=
 =?us-ascii?Q?1xq0vlzF06WwlZ0Mt0OH78kEuqC8JcJcguzvE7kd1vwqx6BcIaZdhrcgAZcY?=
 =?us-ascii?Q?Awn5uZuDXzKKsywAEN7qoJz3ySDOAMgVY0biqywZjZKi2hxryE+daNjQFYlc?=
 =?us-ascii?Q?ToL+d2JfD6UsUZnrfQf1Pxi36WnxyP5AVeYTqkq8bi64bVF8WNmk2JJSW+ub?=
 =?us-ascii?Q?zh106VkGZPanE3dUujGeJywFiWFaKzrX1dEmFW3KiAhfL6eMeLsWFi7KVBzp?=
 =?us-ascii?Q?HQnlLaMAnnnZjlok8okOX6WfXAVqjf4cEM2Z0J5RKbn+LxHNnHVCBc947nlM?=
 =?us-ascii?Q?4OrsMpe1Eq1svC7pSkWSuUEw5j/kwXviVadp0faB1EIqJ+SVydH8rgYxpvAV?=
 =?us-ascii?Q?P9hfKTsd8qGbJjj99sj+o3l6LO6S/NhzxTJeF8/W5NeNFz8aQ+F1T4mmTRs7?=
 =?us-ascii?Q?a/MkIHu7Pacfp1PzL9WAuBEtA+0amukDEd8F2v1C8dakktGBWBLlXj3lSCa7?=
 =?us-ascii?Q?nNnMkmT8PMOD24nikRBTBJr+6qWyo1yfUiGCJtrkxIZ4831YNrn3iDFMcDFc?=
 =?us-ascii?Q?vAASXvskGaycsUf+ShhpKbL2eLx+czC2oFrlOVunBYA5+LAKRC4Yu8vEfBwB?=
 =?us-ascii?Q?9oIwfiF081YNz4lpawQqKVNU5HtKXud4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gmm1DhuQOqJjW+c1gERMnUNP+bRkkMXwZBSfmiMc8zoyXS3eSHSEQzEHDkEp?=
 =?us-ascii?Q?w574Uqzb1aHpffZW2NPn5ua8fsT6kYpMdsn4JqIpHTqm9Snzj3fotzdHiIXN?=
 =?us-ascii?Q?VFLtSY2sjw96LtgEqZi0bUaRJlXvKKmfY/LXF8PfZ7cbKXfjp3Oi2oDNqocO?=
 =?us-ascii?Q?GZ0HH2DPIIa2EfVArxQDC7xL6ibut7Ya0Ul7zVw0uGc6WB3b3DpCcgXMHmYN?=
 =?us-ascii?Q?Zz2VtcCvofLK9kO7GetUDSJLyNfXxrYAupw+zHLDM1axP9dBjXcGsTphDlOO?=
 =?us-ascii?Q?dO4NFTdAJsHU3TzClY1Mm6Dx4mbxu5jh0ON7xuicAhyQpaAlkV9zTAfgOkJx?=
 =?us-ascii?Q?cMzr8Pj93D7Vs9Q1V44LGJYl/OnmZkwFIIcQX3bPW9B+4CaQYGpbxg9se/Wc?=
 =?us-ascii?Q?F+tNFV8Zj6P+RHI+oga5Psqsb/vX0KKSLeKJRvt3I9Of1wAn7yjhiCb1rNUo?=
 =?us-ascii?Q?Iq5rdpAzyi4JjdUNScwXUmkA+O8XG7Rm8sd+AcHQN183L0asy8umXzpyR4f6?=
 =?us-ascii?Q?b+vsHSmbwD17EViufYgLyfCW5K6kgMQfBGT8AMrBcdmKqyDQ3qOHhZEt0mTH?=
 =?us-ascii?Q?u+sQ3Q7Rs974/IJbKeQ+SWUglZbLUh+SA73FSsrqtwPTmcGZDd2zpKTvLpJZ?=
 =?us-ascii?Q?sC5jVNyz40ZDaeAnj7H4znIa/qjI7fjvc2cvkv0RqxdFzaou6lfA+mzpCFYp?=
 =?us-ascii?Q?S3TdoflL0kjqeyuFIgIRSqDoalCfI7D7SMQHg9AYsfF8pA6NIVaqp8Xj3DgE?=
 =?us-ascii?Q?bz5ACdg+uVf99B1pa+Ittx7sfxCLvNOsn2I1LuBnYSmYrIDX1mJrEByVQH+Y?=
 =?us-ascii?Q?pxxzlAc34FH92gjDVc50tk9M+TrhIXObuXEBxQ4z3HUCcFywS2FWek2srpq0?=
 =?us-ascii?Q?cJ2Qxiq4Uxlzcabt4KIDmI4N5HrqLngMTs0lBKky3GKpaLE5KU/2p5bOsGtL?=
 =?us-ascii?Q?7g9x1n81ChztZ4t7ngwXjyZ/lAoXNw/HZN57Srn+4+b5V7MyjgDEcYGPbOEV?=
 =?us-ascii?Q?xJshpyZz6K8wqcf5ZB4lglSkTVRS7rwjFQLgFF3yXREerLc/3YDJVFt4Ao1o?=
 =?us-ascii?Q?wOgLhg7c+b7laK3hCDceZ9LP65TMiFZrGzYuqHHWj9wnVjJsvTLpuflZBanr?=
 =?us-ascii?Q?g99QE9wawjY6POrVuYyPVM8MH6Cfqwe2vw6trMbXsf4TKPwgmctPm7hMK/ms?=
 =?us-ascii?Q?gtXq4UnZMuH45KVgYu/gJxFaa/OZY/6xfJ5WHvD6fGUMGnWdjb/WIDtpqiri?=
 =?us-ascii?Q?DwVptarV3LrogFTxBbrpDEcrnhR7hEq5amCOS7jTgQlt+rQZDVveobJ5y2y0?=
 =?us-ascii?Q?sK1z4THO2TKs+yLbwhc43+X8zAXzrCU0ZqjAMP1Af/iFFwWyK7ebohKF8S4s?=
 =?us-ascii?Q?oewVBqmVLiq0Dp9cEl0fVKNhoG90VWX5T5BG1H+77vWZgA9nl8GUuh/nFgoJ?=
 =?us-ascii?Q?HRXWnoUV7xJmGs3zzOlwrwYCzrrELnr/e/4dQNeDa6mtilKym+FtqoqeYWCC?=
 =?us-ascii?Q?X4Xa3uxhm6qSgngRbU24FYzcrY39IKJDOmnUlPVpJ22iqX9xBrx8R8PARK7G?=
 =?us-ascii?Q?kRaBSQSmEngbNiGTlOIOjN8ukx96rA/Fe+7kNwr+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f64a3692-d5b0-4644-f43b-08de0a20c624
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 06:21:41.4747 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fY7+kEhJUUf7TZKPO6IdmD2Kq6Z0O/SOKg4SwQRB++6SlwbFGBThK0qX3egTtnq6mof9CrUjMtC3M9a1cGSfmA==
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
 drivers/gpu/nova-core/gsp.rs          |   1 +
 drivers/gpu/nova-core/gsp/boot.rs     |   6 +-
 drivers/gpu/nova-core/gsp/cmdq.rs     |   2 -
 drivers/gpu/nova-core/gsp/commands.rs | 115 ++++++++++++++++++++++++++
 drivers/gpu/nova-core/sbuffer.rs      |   1 -
 5 files changed, 121 insertions(+), 4 deletions(-)
 create mode 100644 drivers/gpu/nova-core/gsp/commands.rs

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 58b595b8badd..0f88725266bb 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -22,6 +22,7 @@
 use fw::GspArgumentsCached;
 
 pub(crate) mod cmdq;
+pub(crate) mod commands;
 
 pub(crate) const GSP_PAGE_SHIFT: usize = 12;
 pub(crate) const GSP_PAGE_SIZE: usize = 1 << GSP_PAGE_SHIFT;
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 1d2448331d7a..0b306313ec53 100644
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
         dma_write!(wpr_meta[0] = GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
 
+        set_system_info(&mut self.cmdq, pdev, bar)?;
+        build_registry(&mut self.cmdq, bar)?;
+
         Ok(())
     }
 }
diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index da074a2ed0d9..0cace0dacf13 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -292,7 +292,6 @@ fn notify_gsp(bar: &Bar0) {
         NV_PGSP_QUEUE_HEAD::default().set_address(0).write(bar);
     }
 
-    #[expect(unused)]
     pub(crate) fn send_gsp_command<M, E>(&mut self, bar: &Bar0, init: impl Init<M, E>) -> Result
     where
         M: CommandToGsp,
@@ -345,7 +344,6 @@ struct FullCommand<M> {
         Ok(())
     }
 
-    #[expect(unused)]
     pub(crate) fn send_gsp_command_with_payload<M, E>(
         &mut self,
         bar: &Bar0,
diff --git a/drivers/gpu/nova-core/gsp/commands.rs b/drivers/gpu/nova-core/gsp/commands.rs
new file mode 100644
index 000000000000..9fcf37984314
--- /dev/null
+++ b/drivers/gpu/nova-core/gsp/commands.rs
@@ -0,0 +1,115 @@
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
+use crate::gsp::cmdq::{CommandToGsp, CommandToGspWithPayload};
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
+impl CommandToGsp for PackedRegistryTable {
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
+impl CommandToGsp for GspSystemInfo {
+    const FUNCTION: MsgFunction = MsgFunction::GspSetSystemInfo;
+}
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
diff --git a/drivers/gpu/nova-core/sbuffer.rs b/drivers/gpu/nova-core/sbuffer.rs
index 1a27226b65d8..e88fdab990b1 100644
--- a/drivers/gpu/nova-core/sbuffer.rs
+++ b/drivers/gpu/nova-core/sbuffer.rs
@@ -186,7 +186,6 @@ fn get_slice_mut(&mut self, len: usize) -> Option<&'a mut [u8]> {
 
     /// Ideally we would implement `Write`, but it is not available in `core`.
     /// So mimic `std::io::Write::write_all`.
-    #[expect(unused)]
     pub(crate) fn write_all(&mut self, mut src: &[u8]) -> Result {
         while !src.is_empty() {
             match self.get_slice_mut(src.len()) {
-- 
2.50.1

