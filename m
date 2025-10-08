Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E158BC30EB
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 02:14:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD14D10E724;
	Wed,  8 Oct 2025 00:14:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="tbqYaejy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010045.outbound.protection.outlook.com [52.101.201.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A695110E724;
 Wed,  8 Oct 2025 00:14:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nvLNr2MM0hByFiw4vl4JbfQC6n7N/VbmyG/Y6xAXuDHd8vQdiu7WsL/s/DXH1zQk6MsgBett4w/0CKogmjFfHvuH4H5dOo8WWI6MD3hdqDnsw1WIVTf6HZMsUl9lw8NTAVanyK2LTyuN31W8xht9W+1xdwybFWoaDeAwqSXYvneYxBfKoNEPcuDL5Uk/Fef/8BJJ+w2BQ1VZsgVbbGsRDXo6FVW/C+gVKfncuFEc0Io5Kh5bGEw5rfTgQoBxCom6NPmBDIjKMXCJpf4+k/gqclK31pB7eB6aQaIUcjPxO3Zg5lIFEdqkhiScOBLRVEqKnAOPNF+v+DVMks3aV9eqgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=t2Yo8gtp0PUBYwRnmyV467u44C/wH9Ye2NzQEtfjuWw=;
 b=IQt/4pv8eN1WbVsD0zYqvXXiWxTTB8fsFdZ/ahAsEyupRqFFo8C6Zgk+EnAPPRyEiBP0TSDRiyoILOT5uHDrhG07j0DncKJU/0iNn2tI/fQgWoJnjM1NTK7kKbjBBqTbXQlkRVGRo0d4Nzjr9r8jV8LLwhAV8PafyyZfHiJyneAYS6bopM+BcbiaoiQtw2yakcMvdMZSz1BcHWk14yYhB7aPPyKW5YpgUAqfOj1uk64z81szUaHwsqiuss3WOgBLXjtHQE33c3TrObFg1C3x9qPrU90s6UuT/u/MUZdtbaS450hMJhYiGGEocrgFEGacIeDWB+wHBpc7iX0TW0WNtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=t2Yo8gtp0PUBYwRnmyV467u44C/wH9Ye2NzQEtfjuWw=;
 b=tbqYaejyxv8E8pjt/auBm7VjdHB4vswXSvuq17bfNApykN04CbeqnMeTEQhlqpL4IwsetkoUcKpJgCHAHqPmcoA4PAkgJBX2uho7ylF46XAv2Z0yckHzsJm9/tIakDpOrZW+ZJqN9C/6tvetiBbOtb5zP9DF7JwKc39EUdT9DI4RtaR/4mdBIukHv8VCVZFzPjOnMoV5/eKAxtFym8aYxVN1xmvpL8wL01OuJg5Kjt3NKwbka+IuAamlrJuCQYsvzikDwZPL9AptzD7JiSpjjnmQ6rszW+7Y5aKjW65GlX663p4WXXQBRz5aB9Vv1QZhECX2a5KYMkLULdbjEKqRNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CH2PR12MB4071.namprd12.prod.outlook.com (2603:10b6:610:7b::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9; Wed, 8 Oct 2025 00:13:54 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 00:13:54 +0000
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
Subject: [PATCH v4 10/13] gpu: nova-core: gsp: Create RM registry and sysinfo
 commands
Date: Wed,  8 Oct 2025 11:12:49 +1100
Message-ID: <20251008001253.437911-11-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251008001253.437911-1-apopple@nvidia.com>
References: <20251008001253.437911-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY8PR01CA0011.ausprd01.prod.outlook.com
 (2603:10c6:10:29c::14) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CH2PR12MB4071:EE_
X-MS-Office365-Filtering-Correlation-Id: 8b65dbaf-c517-47b4-2f0a-08de05ff90f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MdLonnnIiTOk0wtCtsPDi9ST4YnJHuzsbKBG8uQJOyU6BbjTQI2dUqTWMquf?=
 =?us-ascii?Q?UtB8pwzDM7hGWamBqsyMHWpUzHJnUQ5SD+4th6CUbJXBIkxumukbm+0A3rsR?=
 =?us-ascii?Q?HEsZx0b69qVnYditrABltX3GrF7/lqXvz/960iDyGvv0QBIKjZiZVOJGWGEf?=
 =?us-ascii?Q?gu6L2bqdeOw+a8RkGEkZZSqv6Jt47sQkIeNZk2mUUnNmMaH3F9Rd6WXRjVp3?=
 =?us-ascii?Q?NSHzSBNvrXiD+oot6nyd9b8p4eN5aFrtpFBkP2pWQ7sCkBkFftMoBxx5hL2r?=
 =?us-ascii?Q?q519TtDBwGp+v8l2rS6ph8awyZuBLFt+EJzZhkFnPoQfmm6y21tEqmj94EDY?=
 =?us-ascii?Q?AcevSDil7GEAFEtDJZmRjrrqiui1a83XlfHyuIYchY+SQEELgE253w6RJ/fw?=
 =?us-ascii?Q?VUCeMFl5/tnFaTV4W9VVbvUGy8E3QXBM/a60tI23e8QSz6OLbldcfwK+9j4B?=
 =?us-ascii?Q?lg1s7fl5YhhNP//9dhJqdlRNLNCrmLVxCso3BP4attWy3HCKOAe5xzPXbiH8?=
 =?us-ascii?Q?zjxOWquSd0M7xeI9zrb169xCsA5742JLVkOH6RW7I3+ev9nXKGt9AfFTTekK?=
 =?us-ascii?Q?1LtZcHdnMcmUhwSBXFk+TofadaSkoobPajzE9w5yRxx5Us5REo0mE/Ddav+S?=
 =?us-ascii?Q?5OXl6G4+g2rQLX+zKwg1t7aCahVJhgm4lUe0lJ0xHzS5cHQ2EAERaDBD52c9?=
 =?us-ascii?Q?OCHzqXoNiptNrzJIHSrTXTm7oVzKsoXIuPgYggZqgXayG8oLkqDmPgaWwSsx?=
 =?us-ascii?Q?gV9B7vMSOZ4HucCN9RenEc1ed35JLv8j8k1Ek9yRfNKUj3LOfzO+bLJgBTCE?=
 =?us-ascii?Q?QtwPyXQpaE4z5EBv4pKQJNbiG0aprLlUm986hIydxmtxaCBOsnFNdcA7PGNp?=
 =?us-ascii?Q?g61dvHHEG1H7YdZdrYrtxT18Ph0hLGA7aKmEM1UlBwneAjAvoHhDseMt7h+h?=
 =?us-ascii?Q?viofJkWYxxCbPY8p/EQWeS5dgQhiuCHWBKjI0Ev97RAv4fizYyvTM1qdqIEI?=
 =?us-ascii?Q?Pgocj1BG/odD3bh+2gdx8jx2qH8HtgDRhzm4zXOqTRcrhIVwiSfGcjFzpOrn?=
 =?us-ascii?Q?uTXaqOdHdp1VjHh0tb414GWjcCQWYQ1gZiju5yJlUlYdgI5vU6gXsxO5x92G?=
 =?us-ascii?Q?7r8zIUmEVDomb8e9ZMoJQZ+T88X1rmNEvzJ2VSZlVe9SqJJ3bYxlsXudjNtf?=
 =?us-ascii?Q?0GJq0LYQvnBcgVJnGekqkEHr5nEsS457Roqvnsp8MxYKrAa+NzaQyWZJfVAA?=
 =?us-ascii?Q?u075TFiy/GPaJ2dhuglda+CG1tNqKAobidOBrACNLDc2dMc+LIPoQeapSCNN?=
 =?us-ascii?Q?NUwGblMtGmDl8uLXsrHDCU+2YN2Eg29aX4Tc9ANFYgjBzFHXWSb7dfYodyBi?=
 =?us-ascii?Q?23hcBTEAoMyV1JS9J7SPyRi+V/pTF6GlR6kLBko1YAFQmXI6tY4pKfgI99af?=
 =?us-ascii?Q?VBzIaXBMBYsoyg7/EeClD6vUDti+XpeJ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EqQAc3oiFFZ90y8e4Lv8BCARN9t9EpQHVUuAkeVngEZoJPnTlX9dNj4ZeI6G?=
 =?us-ascii?Q?8uuyiRAcd6MtRt/bXRFgL+G3zv5q/OL2Fo8qQGZZigC3LshZv1EDosgLaj9T?=
 =?us-ascii?Q?3D2jZ9d29TGpzjFOBD2zNWqiSO9lWcYH5thSiPrsBJwSrgmAqImakSnd27cR?=
 =?us-ascii?Q?qRlOntkmRKTrl4e9N+CZSMSivZMZgs9sUvk8oDrhm2ge3iOwHdEs9ZDtMIM4?=
 =?us-ascii?Q?0hLRjg7+IP+FIjvybHfvlUVuPHQa/COk0Fd6d0wXHMZrCq+4To2aRqA2So0/?=
 =?us-ascii?Q?unjdIIt7NGojIzJyHc2Bqj7+HunjCJAX7nOawH/cGKfwLeoWhcf5yKRpCgb8?=
 =?us-ascii?Q?LVCUQ8IScfB2PolBEmjv0qloqdm8mBSLqtYe2aMp3IAxhCKJw050njet6IMW?=
 =?us-ascii?Q?Elyo2r2fAa6HOFYP0w1GtNWGiA81ojj0pw6OB0GpjXtU8DMQpezqoQ1Fc6LC?=
 =?us-ascii?Q?TyMKw87cktAAa2PpyIuH9pKtA3jg4T6aojkVAgm6rR2lyBzZPtlc2zvDj0iX?=
 =?us-ascii?Q?zVmyjRQ4hPm/wnJaSjzV/j0wlBzZDDlaifDxaw2HUaEuovVHwqKjvKcTdSXE?=
 =?us-ascii?Q?HmLjKA0EOoCdHup8llIM64+E7qYBrAx+2e6pGjSHXXZ0ulccRlMpw28ABR5r?=
 =?us-ascii?Q?lwG2qD41BBKIKwobKpkIDZfD6uBJpw4Kqdtx37Wpwp7FiOS1HrEzEH9nLTlj?=
 =?us-ascii?Q?F2sPhor8vdmnYcHQImyy3U0f8QKPsXGPVv37zjweWTefyNYZM5pJtZlsRbYS?=
 =?us-ascii?Q?V7S1fyxkmNvAu89b2WxCCer6mtjKTeBzaVbhndhhb1GgF+uA85DPz0eVXx8u?=
 =?us-ascii?Q?9R7nFmV17wXPrzJ6Ub7xsHYnX8Tulsjy6d4GpbHl4lIdNnzUFEyGS157xe7P?=
 =?us-ascii?Q?jzbRkNCutAZ4A42OyR+92kM/Yx6yeUhjtjHnz9vX6lIwt+d3PInPzr/BE4Zo?=
 =?us-ascii?Q?PTNSrVL2dPlxEAV35/jTP+1uqzBvqg3xRa7pfq7DVFy2qO87n1Ffiz91Y61i?=
 =?us-ascii?Q?RjBAJgjhr2/I4zAkkM7DIns2GtWDTVO/KKyWuYIoWedU9G9RD7bkh4dRpMug?=
 =?us-ascii?Q?RBKxRfe5j/eCkj08Zlv+2u9AKPjDosDtUFN4GImGcG0eEWeJpSXqN2XpyPn0?=
 =?us-ascii?Q?JN0CNlrLqglDqVn3BjnBl/Y3a2VxGXYgTwRbQY7ux6hsoBtnZ1TYypIntSuh?=
 =?us-ascii?Q?nlQs/PTT3KID/86dF9H0ykT5uEvaX351gsty4cX/cpiwau9rIwXQYsZflvUV?=
 =?us-ascii?Q?/SvbNcFsNdBUxTsKXKPv/FGepkRK0N0SY7EOsKJ2QAnaIJHpwSkYdS2R98fZ?=
 =?us-ascii?Q?khy4KApRs/bD9ewPIgzH3O3FgAr8SMEvtxBQzP6J0oMJGsqGxnvkEwI9YhAa?=
 =?us-ascii?Q?WzKEcVlLyM1g4QxqPdj6u4kFkGxPGshK17l4VcUAxdOz3wpr7HWFn3TsLuX3?=
 =?us-ascii?Q?vkvP0KlZdbgdgUDOkzX1RnuHFsfnsZd2nA6dMoGP8eWklM8bJ4WxXGmL3HU3?=
 =?us-ascii?Q?niF4tSOkZj6zfaNhuHtm3sdcXUgIS81/dyNJ9TqxJS5Z1zeuOgchhX8jy4AI?=
 =?us-ascii?Q?a1lP1WZXn75OyTaF5kZ8IaRx0ctkW+ek4r46Kciu?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8b65dbaf-c517-47b4-2f0a-08de05ff90f0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 00:13:54.1990 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8mGueQSDIpeaXf+CzQHyfBZOWjEuhXxIiBeA4tZU3e6QJRyALVWL/B8u/0csTsgUtnAf5MxLaqeu22RqwZfmyQ==
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
index ef48da6afacd..9b6abb9755ba 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -23,6 +23,7 @@
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
index 317767d8f521..389f78c7e6e1 100644
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
index 000000000000..92fbafeaf69c
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
+use crate::sbuffer::SBuffer;
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
+        mut sbuffer: SBuffer<I>,
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
index bde80cc3fa63..5acfd005a86b 100644
--- a/drivers/gpu/nova-core/sbuffer.rs
+++ b/drivers/gpu/nova-core/sbuffer.rs
@@ -159,7 +159,6 @@ fn get_slice_mut(&mut self, len: usize) -> Option<&'a mut [u8]> {
 
     /// Ideally we would implement `Write`, but it is not available in `core`.
     /// So mimic `std::io::Write::write_all`.
-    #[expect(unused)]
     pub(crate) fn write_all(&mut self, mut src: &[u8]) -> Result {
         while !src.is_empty() {
             match self.get_slice_mut(src.len()) {
-- 
2.50.1

