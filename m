Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 577F7C5F1FC
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 20:56:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32B7C10EAFB;
	Fri, 14 Nov 2025 19:56:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="E/XUSAmv";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012071.outbound.protection.outlook.com [52.101.53.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C331410EAF7;
 Fri, 14 Nov 2025 19:56:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ub3M2ZmL95WPxsy0NZ4lBnczFGE2Oa6jBA0JzlgCIMxVZhhypIcRfqamx9+Foj/SKr89AXFXWH52BuMqo+muACU7jq0sjgeRYpQj0OmmIoWES0cUxxBi+3NFq65zFK0m9mLXykS2MTwCJN56E2dgBSI20wtveTkanrAu122CPGZ+z/dXG8jIFxE/EUYianNxfYAygupjvfJhWpaR5PRVtManGu26JIuyTLgMbrJOfJG0ql3v45Al98XDnG0rhDOUhFvUtNegmQRGd1eMmTd3WSV69tyFHp6cmtts+i5h3xrnHKSDF25rjn26VnYbpEP2QmydhK0deMlOjhJUzBRDvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TguzUso4/U46nef4p/COrF1bhFUDyd+2t6kEYKT5xBU=;
 b=njBADCtXkZLgLOdMPzsHo7Gbd0LjvxA1TU7VYOcvigAAz0QYH+TyA3igAHxAeu9xarsc2BxYkpBrhzexP+IWh/4ZRCg5q2IEeuJrcjMlAY28tFw7I8XkKJC34KZUGQnMvL0HUZJ8okGzRn6u6/RwZm51ppFNwoqta6qplOrE3889aMc9fxYl8VWitwPEMWXnO1rOg1eZmxopAJzV8hM7DH6v2bN1LcNU/p7yP7UQKz3rAEF4yCbW7cfjQqKI2FrHkHnzzcyZPRvW9WL3iSaJW57rO1QewMOXqK78Hhoukdb7N3jr8uJqD6ymbbhu4GwmPByAcVuV8u8NOCBrM3XXAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TguzUso4/U46nef4p/COrF1bhFUDyd+2t6kEYKT5xBU=;
 b=E/XUSAmvr+Cwl8hYfXDwwp6lfy2tQs/OynUIc0dgiL/wrzkNYvgoyWPUbw2psQNTpfjO5PLghcFPgrDNPPd1BEeOn061mtZe9k9RYfHS8+MOafTw19QkWtyT8pwLFElsS1RzxN6F5fD+HksoPHbtAMIHb8GUsZmqPxHpewYwCV1ol7GcDHPTwyvPsHdJR5r+53iRR+e4hLKfH5nRgS9rR224dAPTc5Qb4Ju/E25tLlj1wuBoQBaiVlz4/NufbWesWuzq8tEKJwtD56DauAEVqp5xsIaShTWLc8Y/WxIT2/3wFBHZoN8hV6QqlrkKkMCVkdLFjquoh7aLBCGaissd4A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS7PR12MB5765.namprd12.prod.outlook.com (2603:10b6:8:74::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.12; Fri, 14 Nov
 2025 19:56:06 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 19:56:05 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Danilo Krummrich <dakr@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org, Joel Fernandes <joelagnelf@nvidia.com>,
 Lyude Paul <lyude@redhat.com>
Subject: [PATCH v5 05/13] gpu: nova-core: gsp: Add support for checking if GSP
 reloaded
Date: Fri, 14 Nov 2025 14:55:44 -0500
Message-Id: <20251114195552.739371-6-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251114195552.739371-1-joelagnelf@nvidia.com>
References: <20251114195552.739371-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR04CA0017.namprd04.prod.outlook.com
 (2603:10b6:208:d4::30) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS7PR12MB5765:EE_
X-MS-Office365-Filtering-Correlation-Id: 5aa385c2-6dc1-4b91-7c12-08de23b7d88c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?a3NraSD4g3RKnxtq3Gf57Kap0m/v8GeIG3qvDiyDqODeHR5SEdrCr5EBqnzt?=
 =?us-ascii?Q?lMN1Ijv3iBx9CMIwBmu4iGyXAXelWccdAySKbzFXkIKwwJa/BE8FThCBTszE?=
 =?us-ascii?Q?u2lKmOrUfqNVpQIijcnerSCQdNdHOahflPKWTJ+wtFPGMslVR4mWlwO2ddeM?=
 =?us-ascii?Q?xK6xlvPGx5xYYGCAGC4FuZ9GMF6T78b9XDFXGyvZ6n9uLifbP+etNpsRMcPQ?=
 =?us-ascii?Q?z/3+51DQyakkXXr9wcaTAGxS3H/y619VzJ4V72KAsbVSpHVtk/Y8bDgNB/bf?=
 =?us-ascii?Q?plmIkoFvsCFDnifx9169ffX4OlfDuLRUZV/3OlylYSDyozCgQQf+qFYpuw1A?=
 =?us-ascii?Q?EA9I93lRj9kAf4rl+OAJCu1ejW4o6GJADjkn3Nx5nbwA0PtqGkdwGdJFV18H?=
 =?us-ascii?Q?CznII3MUIDbDj+Jyp9fWtlFSV60ab59xKn8Z1AWQGA9JZ3f8ys6Udgx75gNQ?=
 =?us-ascii?Q?cS0RJP+WJsodE3/6jXH/E1hIWAj2aJBcaHoTKh0felIynts125i8PZl4uwO4?=
 =?us-ascii?Q?uS0nd9CuiVG8drSPpnkRcJ1rJkRuXrX+0xfwVsf+KNO4ozaJWS7FsTiJtm+l?=
 =?us-ascii?Q?Hbp67OLdZdCuOshLRuqIaII7eGLJ2fKv61QMAasAIUj4ka+7vp0rdVrh3ii2?=
 =?us-ascii?Q?Tn47Bi5xMELhqwrFOSs7QsW2Rn2+TxblOlr7CiskYua1G0RufeGM0vAWO8cC?=
 =?us-ascii?Q?hQUkRDf57Vww3vC5QTtAJSDaA50A6iYT+bIA4iFcZt3m4aXEAYf3rorl275f?=
 =?us-ascii?Q?M17HatogfTzqGK+q7ZPqBU2C1jmFFbSbQTfojsQsrMoWD4/t2J38LberDCm4?=
 =?us-ascii?Q?U+cT9yFqKll3ctsgrwHccWaMPB1RNsCVnmH6Nrn0Hb/nIsAqSoAVqZfUngB3?=
 =?us-ascii?Q?2ySWXdEuJUq5iOaHZu6NLwTpn6cWw8eILZsOhCMOKxHF1j6FCIy33xu7K4xD?=
 =?us-ascii?Q?zQdPxlWngRB7//23S6rcJCQuJtV/mhAIV4XWRE3SAkoVgOOvzOqlDSy7wtZk?=
 =?us-ascii?Q?UQRNvzd1UjbzJhy+qtzVcmeG6y6q2l7RBw4R1+swOSy4PtMP+nKlLDErLwgR?=
 =?us-ascii?Q?SPLoiXLn0F23qXru/FjVgZyr7YCFRlW6NuIfOmn/JLlOZWBSrr32pIQsYZn5?=
 =?us-ascii?Q?/74KaTmt7dKPzVfIlEJqwRJIgqOzFSaROpxyLYyHcm4dH9ptPVO0f6ctpkKJ?=
 =?us-ascii?Q?ruJ3nMtvEl0qN6wWlS9kt8dkuz/HdRu0nZ7jhZxeYv4cVD8dQHdZXH5YczFE?=
 =?us-ascii?Q?1waQu+zr9sNhOP2rdyLCZok5ZcWS5e6N0bhj+O4Zq87UyEDSTqr351GAggPf?=
 =?us-ascii?Q?Y0BFju8bz2XyYcvM+Bgj/jn6bCFbF3hPmBJ0tTo/c1Ha1kLnwWDJPczYhpSw?=
 =?us-ascii?Q?Ur/3yeq77+JqtFQwqNNfBK9J8j1gSb2YP0VHUVIEIMNB25RKaJCJUwD946iS?=
 =?us-ascii?Q?JfAgwcTe0sIyceu6koJ85PcalC1FJI8q?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rxAOQDFsSho1gig+IG7cgzbgVCib2Ktd11z6VS3qGLZUeDVB0W1fflo4Nh8d?=
 =?us-ascii?Q?amBClQi9khJDbK0ZsI06u8kHts5suAPLmr/imIq0Ac6netRHKIYEMBAThrN8?=
 =?us-ascii?Q?jmlATEUXEvbZAG1SbC9Ji3szcDW3MOwaJwreLBwybGvZ+yCTFp2PVRE80482?=
 =?us-ascii?Q?UJKwsXe4UsdmwqGzm94RxyrjhBsA71e4Uvr+lW2neqCFu10CqPKa7cqewIRl?=
 =?us-ascii?Q?NH6F4n8sPtqwIILDL0yCRB7ikixpPI0tGUscTcnJrv8dCr4qdLv4TMvF5CWT?=
 =?us-ascii?Q?3cY3Iv+jAH6BwKih/a8g98sqNfvkj0Bh+gAaRo9DZs3dsLbSRDedUVqxo96m?=
 =?us-ascii?Q?3sFK2KYS3FO8Ll5xv3vBl2b9OViosKX4Itl92lDkBNkrHZynPxdnmdW1b/LY?=
 =?us-ascii?Q?ebF/DefngkWgxsOEh5en1t9ZVJFvensFHxE+KRok5xURmI+w+EtBbUZREnI/?=
 =?us-ascii?Q?ck9VA2/5O8Vh3+bZ+NkX6cFFLbr/evHBVZmRwg6dcqvEfVK9/nL9xKu+9jUw?=
 =?us-ascii?Q?L7pPEFkH4IlTilL0QJM0hZ/mffDFdIM6T/if0Ai0IaVRrZYCbMJQh1LyFKSr?=
 =?us-ascii?Q?QQNeRh1YjWP6vLl9r2Iti+RP6gAiYhyrqVtHjF5QVkYYVQDHL0u9HfjD9BQ+?=
 =?us-ascii?Q?4uSzmYq2NYJqk7g/JOhHDPhhcT6UyEGz3yXxNt7I46KVXYPbHFQYHUfaIWTf?=
 =?us-ascii?Q?YzwNg55Xpe2X4iI0tmCPNwIpMeOCwR7WHX+mWAPinB3yT7GDTfUYJQTeQbQs?=
 =?us-ascii?Q?UflV/Gc0RcVLyzNItBkSlHzS8Fr4AGxlzLk/WHO2UQnryVcL6nNoL3WZz9DB?=
 =?us-ascii?Q?zCbUDdvRxYumePH2VwzAt6Chm76fKHgebwOUF+1JgMHsewTwcFseket8b3ES?=
 =?us-ascii?Q?sLbMMomd4pVEhAu1hQfR/UEON0bgChhg9YbFASzlQC4UKYl2KF78jZliB2UH?=
 =?us-ascii?Q?gjPMqjPm9F+5Xqggm2/EiMvuQYPvpEApYml69biMBqPSF36/HSHD44U9ggwK?=
 =?us-ascii?Q?F/oW4spInwx7CgGWGeYcCAcOAfbko/frxG6zlGJJxHsFP7X5emOZPOdrX1ju?=
 =?us-ascii?Q?mvVi8zNd1Xestr7YC7WJ9jNJ5tkhkJjfPt+Ot0Ei2JjIZfQkf4PKP88fNG1d?=
 =?us-ascii?Q?iX51BYFOj7FR8HnVPjRA/hwOckkthxw+4PJizQRvKb8yPAuUOSmNuRy3jpyg?=
 =?us-ascii?Q?6gnHIKNWFoBxhjU455oE4NXWct+N0mlw2xUB/thZhC4DfHQek32Ent+2jRq9?=
 =?us-ascii?Q?JlztjG/PXkOkvxbckRdb/n7+jrBM6Isjaho8jox94PhWGEDk34PX1LjFUKyg?=
 =?us-ascii?Q?RWaZu5oHrOGvpekNnunQejMcCBErogVvws5hsOwx5BqB+yR14DEDuJGrKV7X?=
 =?us-ascii?Q?abN3JzDTrgnUVfvx/cCdIgRucVg860MzpjXfJ2O+Sg0MYD/ulGaAmK9oC8p/?=
 =?us-ascii?Q?aMwUZnDnhMi6o39mMQbnoEo/WyisQ3KaNgo50k4bYm0mPZREx9YIjvlmGga7?=
 =?us-ascii?Q?hjj805U/FlvA1rf4TubJtVpV2rBzoe1EIKyc2zNQEqQcMg1uB/YSrUv+FWGA?=
 =?us-ascii?Q?uvh0jqb/PuybMDbl1bcH0qdGD/i2LnKC/prh6ukL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5aa385c2-6dc1-4b91-7c12-08de23b7d88c
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 19:56:05.3247 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TMzgXfMphgRQCYR3Qcm0z8GiT838MAJGh4emJ3Ex5wyRcCcYs/ul5AcEQG1q1lFY7h3is4W11zBsmiPK23vTsw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5765
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

During the sequencer process, we need to check if GSP was successfully
reloaded. Add functionality to check for the same.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/falcon/gsp.rs | 18 ++++++++++++++++++
 drivers/gpu/nova-core/regs.rs       |  6 ++++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/gpu/nova-core/falcon/gsp.rs b/drivers/gpu/nova-core/falcon/gsp.rs
index 93d4eca65631..9ef1fbae141f 100644
--- a/drivers/gpu/nova-core/falcon/gsp.rs
+++ b/drivers/gpu/nova-core/falcon/gsp.rs
@@ -1,5 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0
 
+use kernel::{
+    io::poll::read_poll_timeout,
+    prelude::*,
+    time::Delta, //
+};
+
 use crate::{
     driver::Bar0,
     falcon::{
@@ -37,4 +43,16 @@ pub(crate) fn clear_swgen0_intr(&self, bar: &Bar0) {
             .set_swgen0(true)
             .write(bar, &Gsp::ID);
     }
+
+    /// Checks if GSP reload/resume has completed during the boot process.
+    #[expect(dead_code)]
+    pub(crate) fn check_reload_completed(&self, bar: &Bar0, timeout: Delta) -> Result<bool> {
+        read_poll_timeout(
+            || Ok(regs::NV_PGC6_BSI_SECURE_SCRATCH_14::read(bar)),
+            |val| val.boot_stage_3_handoff(),
+            Delta::ZERO,
+            timeout,
+        )
+        .map(|_| true)
+    }
 }
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 274e53a1a44d..b32c07092f93 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -138,6 +138,12 @@ pub(crate) fn higher_bound(self) -> u64 {
 // These scratch registers remain powered on even in a low-power state and have a designated group
 // number.
 
+// Boot Sequence Interface (BSI) register used to determine
+// if GSP reload/resume has completed during the boot process.
+register!(NV_PGC6_BSI_SECURE_SCRATCH_14 @ 0x001180f8 {
+    26:26   boot_stage_3_handoff as bool;
+});
+
 // Privilege level mask register. It dictates whether the host CPU has privilege to access the
 // `PGC6_AON_SECURE_SCRATCH_GROUP_05` register (which it needs to read GFW_BOOT).
 register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK @ 0x00118128,
-- 
2.34.1

