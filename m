Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D49BB37D97
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 10:21:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA04E10E786;
	Wed, 27 Aug 2025 08:21:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hP+iwu3M";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2088.outbound.protection.outlook.com [40.107.220.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68CCB10E778;
 Wed, 27 Aug 2025 08:21:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kRlRhtaa3VU51tKwjBSLOFDdWNxdriGt7oLUkBeP54GXWTY0uQFUXf18mNE5jx/Rhb8R78D63uxVjeRU08u1cgXh5trr3QhbxohsWYemfelrm9Uon8ZBbhnO3PdANJyAU/e4c+zIg2MTI6ltjsOhy5SGlCebSBiq8sxUGbl493k0kx2Z1u9EkXGsg+rOvQy0KHEdM8vjArFdZq1r0nj7WCqCnKgqVOnJG8y1w5cOYWi8n3NyEWLK87RnC+ghaGM9x6RsSXkDfkL8M6TkpsxjUniLISc8fYaJba+46ZGp+O0RMiFXkDUc/7qijuKSNa6YIeg0GYVmWN14Q2nYEU4aUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UZ7vWfQMPS/63EsBMh/sgyl1R0tsK22QZSZ7/2sotoE=;
 b=gZLMuK+MlnFdFstlLi/XLNjphyMmC5TAm3HxMlJ4oOU8clasEicj+WqfiwXNrx9pd1bYhtvsXjtPWxbWFiSGU0ngAh7CrMWiD2cQa3yNrlD9E9/TYnVGDcZJ97S08XVKSZJ8mFihMUOfmLPc9r1BaOEeQncoFX7bHmkVtUKZNnrHWSA1pZkrqp2FxAlqjaRqhEn+oHkT7gBYM+VLSS/9Z1ZSq5yu0JXvb0ENrON0HeMYl34Vgm9mQmNSwa7+H4D6mes4JOwwFX7HS32oCpeXheoLXC8zlWYcAIqSpFGA3uAdiU/MVesxJ8HBGVP3assHd1JNHMbG2SqBg+cWv8qlQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UZ7vWfQMPS/63EsBMh/sgyl1R0tsK22QZSZ7/2sotoE=;
 b=hP+iwu3MhJJnyXwNUX+Qfxzny5rK8n34nvIPncrz4d9xBS296p98/1Ab6SUkjBfP8qsGvGnISdn1sR9P4kZ41YL7UfjU1UcnszX4LDJ5yUwy8NBB9es3JSrdI6MBdDdWfK7MKgIw2N+wKGsOjpB+oELiD7hJY3p1pSZUgbVxrBwn3hCVL6b8CLYpeeYqFdt9jjA6jZM2r3+UYec0oFfl5wX95jX3FJfLaG8aqjRr48Mbk5BS/42trPyc/zjeyH8EcgaOsyB+OJoYscsTIFrkESJ9U56JBaTTkUikH81uCVG6IKlg1I3zkZ2kyF01cXe6LJgxZ8B7eCJY4VD+ofG2tg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA1PR12MB7709.namprd12.prod.outlook.com (2603:10b6:208:423::15)
 by DS2PR12MB9592.namprd12.prod.outlook.com (2603:10b6:8:27c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 08:21:08 +0000
Received: from IA1PR12MB7709.namprd12.prod.outlook.com
 ([fe80::5312:ce8b:bdf5:aa31]) by IA1PR12MB7709.namprd12.prod.outlook.com
 ([fe80::5312:ce8b:bdf5:aa31%5]) with mapi id 15.20.8989.018; Wed, 27 Aug 2025
 08:21:08 +0000
From: Alistair Popple <apopple@nvidia.com>
To: dri-devel@lists.freedesktop.org,
	dakr@kernel.org,
	acourbot@nvidia.com
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
Subject: [PATCH 08/10] gpu: nova-core: falcon: Add support to check if RISC-V
 is active
Date: Wed, 27 Aug 2025 18:20:05 +1000
Message-ID: <20250827082015.959430-9-apopple@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250827082015.959430-1-apopple@nvidia.com>
References: <20250827082015.959430-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY5P300CA0053.AUSP300.PROD.OUTLOOK.COM
 (2603:10c6:10:1fe::18) To IA1PR12MB7709.namprd12.prod.outlook.com
 (2603:10b6:208:423::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB7709:EE_|DS2PR12MB9592:EE_
X-MS-Office365-Filtering-Correlation-Id: 21314ff0-0764-426e-e7d7-08dde542acb8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+U4TXjdWV++MW1EeHTnpwvz4wQPTgbHa7HrAhbuHeaOx1G4b4sd2YeiIIZcu?=
 =?us-ascii?Q?e9c/3iezzg0B/gboIgyge9koChZPdE3HIZT1I6rvuz2eze9d4XMXvNT0ffI0?=
 =?us-ascii?Q?4sygwvX3Qg9s61FhO0BU2+q5nf8o3YtEzzFMN5FtRvqRHhD3+H+IEf7JntEa?=
 =?us-ascii?Q?JKI+sLuxpeKowPhWn536V2ZTLqzS7DthjBpegBN2766s0Y69cWerO+3zeJCV?=
 =?us-ascii?Q?M9Br006/qQ+6yLj32ymNCTX7U4/8J7tkblHm+pnKJcA00d8KisD66njM3Jk+?=
 =?us-ascii?Q?joYCH45PrBdR/QdLWtZiWaSJTKrm8UNoLnzNdaWPSWMrblZWqlODVlK5hxBC?=
 =?us-ascii?Q?KxNFSn+nj1ipKFqvU2DkvP6IBXCJN9K1ySMvfLujFTt4z+YJx9rCw4sNS+Gz?=
 =?us-ascii?Q?z0eGxRz94YyWIZrS3sDBFGmoC15cB49OxRYuVhUGKXcMRLpuvCgP83CWQRUk?=
 =?us-ascii?Q?EPqyJejGh5+oX4P3S8mVTKimjzpTOTYVUubUModJmi4vDTnlr2rIHPxmG0/4?=
 =?us-ascii?Q?k1ubWXOZR5e9sTVdI+a0VVY8coNKu3I24LBNJ2SO/4MIsl8Hb6PlEGNDEO9c?=
 =?us-ascii?Q?xq51DyWsekeWltDrWSQxTKGfxrWOp62Sl0YwgK/jnPZvhaJLkBs7yF3r0Tng?=
 =?us-ascii?Q?4meCcsbsF+/hLib3hxOWY2xOdyMZmNqzCyzcXFnflUtTson4xCQjFgyS03Mu?=
 =?us-ascii?Q?8JoTYdC2eUY9m2rpIvSaHf8Bn2uPc+PpCfGzX6Q+NRWTZORpDwgmGn0xx37H?=
 =?us-ascii?Q?TKHb1fEIoJBQHX4Rs7D5CykIQbV9jJxwmuD08qydTdCDjYrD/UXEtSD+NwBH?=
 =?us-ascii?Q?O7AqPC2Gm1leDZ7whXz7Y9nyg7EtRxkvRVY0VSPbsC4QhzJ2otfg8FMfdaNT?=
 =?us-ascii?Q?2vFby7TepGb7ZmYuqag8osKiuDImpzqCrNyQoylU4Guq5UaHhp7GIYVoGt/I?=
 =?us-ascii?Q?eUbbxpRurNGoC+t481Ohi9aBeXNNkpinDnh5OJgowtbXeUugPMxMEF0ELGc8?=
 =?us-ascii?Q?C9PAZur843uNQnG7yDc5lXIrCN9KJV8qs7emdRcsncou/Y4yMgKBuHGYYWfW?=
 =?us-ascii?Q?p6YlgOXl47k1RALZA4pyv9iF+o1jEws6wfyv686II9uGSEIYcyXgIlsf5KzH?=
 =?us-ascii?Q?W30YCJsr8k6VN5M14SEx5MsU5Cvbn7KXaVeZvVv0Qt3xp00XqEsfIuYTC0nq?=
 =?us-ascii?Q?kQlwAIdE+FdTqVqN81xng6V8ezXZDKECa3NWAA/KrbGbzRtEplykwZOYu94N?=
 =?us-ascii?Q?za7+MNzVFz7Say5uMUdTF7mJKrTfqJV8OCeODJ2ZxMg63714GEctkvnKBDws?=
 =?us-ascii?Q?vDJJGTrlOx/Q4hFjxYT+d+nXIi6kKFANcyFbUiwirg5XuV9h4FdG2Ut7tApx?=
 =?us-ascii?Q?oeG+wG8QJY8tK/wFbutjXKGmbULyCjoCVLXR/MqXz6jra3kSnA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB7709.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9KlbHsWc9lt3nAwhwUoomB12ebOqQkV5aqVakAY2INXsvOaAJJIuiST0ZDHH?=
 =?us-ascii?Q?cX5HikXEeB7g6SgH7xHfxrBRMybjCuX0zqbgY3X96NPtNDJzS7jswxsQTcr4?=
 =?us-ascii?Q?TLc5hEFQGY1oGDVgNpN5UbpLuZg1MeraibcXLqQbuBWMlalumG9bco0KIjLk?=
 =?us-ascii?Q?gMshecutCVn+A+NDJzkqyr86XuzFNY3CDfVwqqbmGPAK5rzsSE89DJ7AvjlC?=
 =?us-ascii?Q?UM34mZ3PvnaSjtLrpXLOcpPsk4+/cclrEpG/JXibc3TTrXHNI/cTmx1N9wjQ?=
 =?us-ascii?Q?on6VkRIcz5Gobp9vaXsMOgdPvwCyBo9EFhSqGc2YVkFLAogo9gJOa3udGVQk?=
 =?us-ascii?Q?1x5wL4LhLQaRzNE/kSlaAIwroIQ/5UDb4zz5XatcX6vHFzajtT5+q90+dekk?=
 =?us-ascii?Q?bqkniXb7Hwh22ZGlqil3dWSrbCTEpBqcgmfKcgY2qv71eD6aygPhrwSNrqaw?=
 =?us-ascii?Q?z+DfELMvUk7LWYyufE79JSSCy4kPosos3amppt3ZAxp3+hR7AR8et5VaBHeT?=
 =?us-ascii?Q?UpyL49lqICqw+h4kKSNyNBz/MqloBt/7W4p1C2fz1BTnjzY6+tPKsC/UQpdR?=
 =?us-ascii?Q?2b8+W2GYvcBkd8Tc/Lhm0/71x2Y8Rs9qLQ1IekjWBBw2wXVpvC4T25ALp8BM?=
 =?us-ascii?Q?LKU7A1cKuhU8BkB8PyJawGJXOqjU1al5AsaL1dteV4nIwIOAm19OP7L7MW99?=
 =?us-ascii?Q?PB2fnX5Ibr2+cmr+G9QRl+Fw43USoqiKFGQqI7mWqOrHWXdeXpLCfCz/sfyv?=
 =?us-ascii?Q?fVfcPRjb4F94/w+cD7PAJRhdphDaxPT2nyOvmLkKjIBjsxkcgjvRRE6v/PHw?=
 =?us-ascii?Q?Mv/FXpBccpZ9wH5G0w4ZVtyjiHvRxYpzknWrRmrnb6D2iQmQrXvtWXOrTs2j?=
 =?us-ascii?Q?HiwiDUnpP+CRyLDF1+uSRZqHI7x0o+rrfcxKaM6BUZj/d2WFoKYA25cpO8Fe?=
 =?us-ascii?Q?1sJFzLJHp3ScKtZtGCqNrDkX0BnYQOl8NYizjJiOnIKpBfVR8Yap/5NdToYH?=
 =?us-ascii?Q?ojIIt6EhVBQ0EjXmaqjn6eVewiVmsr0Iu9V9871uvTpBLaIneHLyiysSeqsJ?=
 =?us-ascii?Q?hIVqNjawiNhmMalAeyGty17l1ct+nzJFSuqOMm4fBvIWcc8Xp8yiYbiVLPu5?=
 =?us-ascii?Q?7Fk/2M+e5n5FZGK9he3Tc/wNpvQr5gs0yqWqWVYQzxaj1dGlwlyWF1YyAKWm?=
 =?us-ascii?Q?Sa/sVx0jjfAbevvIv4xNE+/7di7JFCXU4SplDc0pREanbuvgO77w+yFc5udm?=
 =?us-ascii?Q?9TGIAFrqWI2O13CFvQouD7+V+kbwkfw8uon+QC8WZh1Eh5uVAessr/oNpyMj?=
 =?us-ascii?Q?DKyqqe7vfamuMRmTXYCYrJ32n8Ln3sQufksrIebTr0kbXqQp2XHv63WaM0j0?=
 =?us-ascii?Q?jIb1X4r+EiRLH3mW1Ki1cBl3k8/ysytUOMt7AmivFk9mG89Su/Ht4T4HX3ss?=
 =?us-ascii?Q?TYvMRsf8GSMZLTqGJa9A5kABKFD48ssqTIgqWiawt4j3CZ6zaZw2naaGS0+o?=
 =?us-ascii?Q?r1EB9oqXgijnC61JP+KYKG0jiByRuA8nDWrE2xClFhEwGCjoJPk1tOx9SEzi?=
 =?us-ascii?Q?yhFmTzVR5Gr7+Apeic7osxJt5T5KB3LBHtwJ/73s?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 21314ff0-0764-426e-e7d7-08dde542acb8
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB7709.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 08:21:08.5975 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ByBltU4zPm7US/K1Arrbz4CjlFk5OLcZdOunxEFSrBHt5f57/eq9C7gR2P6FllovlF9Jsdgn6yzkSo2g65eVgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9592
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

From: Joel Fernandes <joelagnelf@nvidia.com>

Add definition for RISCV_CPUCTL register and use it in a new falcon API
to check if the RISC-V core of a Falcon is active. It is required by
the sequencer to know if the GSP's RISCV processor is active.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 8 ++++++++
 drivers/gpu/nova-core/regs.rs   | 5 +++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 7bd13481a6a37..8c4faff043455 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -610,4 +610,12 @@ pub(crate) fn signature_reg_fuse_version(
         self.hal
             .signature_reg_fuse_version(self, bar, engine_id_mask, ucode_id)
     }
+
+    /// Check if the RISC-V core is active.
+    ///
+    /// Returns `true` if the RISC-V core is active, `false` otherwise.
+    pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> Result<bool> {
+        let cpuctl = regs::NV_PRISCV_RISCV_CPUCTL::read(bar, &E::ID);
+        Ok(cpuctl.active_stat())
+    }
 }
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 0585699ae9511..5df6a2bf42ad9 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -324,6 +324,11 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
 
 // PRISCV
 
+register!(NV_PRISCV_RISCV_CPUCTL @ PFalconBase[0x00001388] {
+    7:7     active_stat as bool;
+    0:0     halted as bool;
+});
+
 register!(NV_PRISCV_RISCV_BCR_CTRL @ PFalconBase[0x00001668] {
     0:0     valid as bool;
     4:4     core_select as bool => PeregrineCoreSelect;
-- 
2.47.2

