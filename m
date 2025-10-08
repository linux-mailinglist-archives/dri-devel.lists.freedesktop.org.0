Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE679BC30F4
	for <lists+dri-devel@lfdr.de>; Wed, 08 Oct 2025 02:14:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B2C010E732;
	Wed,  8 Oct 2025 00:14:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NSLI6kZY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011060.outbound.protection.outlook.com
 [40.93.194.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A93E10E731;
 Wed,  8 Oct 2025 00:14:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mF3ZzYdJvblabtNscYVZI7biXPZKC+91AFN70bDy27kq1XUjNCsLLCg5jIkz9iNncQFgROLyn1jof4YQCJlfkv5VBB2CTkzbsAlBaj5/BEp5zLA1LaOdQXx9X6tp+OUv7BRQbgJgv1N+pN15dd/vZ9UQmW7MNHlBiUZT9OmU82i684rO1k9vAODQOYLwwz2iRKcGeOnw4Ht7feiZnY2gBzQ0DLOgjOGNyqigpKGpxVEvdlwIv0fYdvDSL6wVcvNiSF2hJTmIwgxKZdDDeq74TFB4d9DsHsq2cWLJODg51lT6oV7FEgPOPvBw6wI54rJ/NGj3OxxZFNUekj939rmq7A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YH//zDOnPNDWjR55GYjV0YCDDW6AXQn837vFF70r+2k=;
 b=L4xUe2whXS/FwA6UfCwJzcrUsEZdFzKGvshjQuswBdtxOb6/FUQp81XQuTt29b2tFv75jwqzZ88isGjp6GHLsyAke3/6egJguxua5/QfrhYUvygVw9ed8WHE+UvNcCn3BdHw2cqQPYOwZSHHE8WpFdYJ/YGx8l47pr9zHbmKNauxpP79bsMCkYoQIY6LN+/IUc5s572npJ7/5v+6rVvmXzgh0DLuzPGHiKwVWuC0Sh2bEfHc2gRnn2oW7lon6J+LHoUf/Z2S7xIS6ajqOUpigk5F0yuA0LkWe0KoSeZ8rl+t2mk8rq1qkZKu+pydG7p2n0C99ssNcm14XIuXMpKLBg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YH//zDOnPNDWjR55GYjV0YCDDW6AXQn837vFF70r+2k=;
 b=NSLI6kZYwbucWTCTJFdAAKmkI6i9OKw5Yb4odcBb25kCM3Rq7FJGlUePOiUpWJOl5ylH5US3+nHBp8TUTFFjxzdbQlIvB91WJhoMNn9nRwBoWSvbJHBm+cGjbPNUXxwT/kPOC9ocnPTs5M8Ia1uEhbZWZ2hNN30eq+8sQ41C97n9dfNLvtZd+nT76vr8wihZXDAFX/6roKluqflnxw4Z2zVXHafMy8aJgvkk4+rwSe/CT/hmVoBMoYzx4bpnoWsiS5C9MDYGhQxIfmI/niS4HdNxC+PjuC8XACoYn28L2HF5ovH/1DJ0ugJ7rHTpr3sUHCbwxIb7yLia1hmf7V4O0g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB7726.namprd12.prod.outlook.com (2603:10b6:8:130::6) by
 CH2PR12MB4071.namprd12.prod.outlook.com (2603:10b6:610:7b::16) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9203.9; Wed, 8 Oct 2025 00:13:59 +0000
Received: from DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe]) by DS0PR12MB7726.namprd12.prod.outlook.com
 ([fe80::953f:2f80:90c5:67fe%4]) with mapi id 15.20.9182.017; Wed, 8 Oct 2025
 00:13:59 +0000
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
Subject: [PATCH v4 11/13] nova-core: falcon: Add support to check if RISC-V is
 active
Date: Wed,  8 Oct 2025 11:12:50 +1100
Message-ID: <20251008001253.437911-12-apopple@nvidia.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251008001253.437911-1-apopple@nvidia.com>
References: <20251008001253.437911-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY8PR01CA0006.ausprd01.prod.outlook.com
 (2603:10c6:10:29c::31) To DS0PR12MB7726.namprd12.prod.outlook.com
 (2603:10b6:8:130::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB7726:EE_|CH2PR12MB4071:EE_
X-MS-Office365-Filtering-Correlation-Id: 6801b0a1-d79c-4dfd-bc76-08de05ff9411
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uSV5eJa8WEVFzjJn0pEKyEJgXVCUoznCVuJWNhCUnCrNwACSJVmJp9l9Hvjk?=
 =?us-ascii?Q?bphUYGbYLQdbp3jT3GTnNtAjqnXSqAlHUgtl2BRE/CmrnwgVUD54xuiA+uK/?=
 =?us-ascii?Q?niJxXm25ji3QpC8W5DlV4MCscy6ZadwFyKB1noETdw4OlCtKHa4tb+iHGFnm?=
 =?us-ascii?Q?nzp1ExqNengql7OL5Vag5bsNhs1xCJJ5xC9YCZG4K0ZQ+MqSEU7Y4fRR4/ID?=
 =?us-ascii?Q?KGIyparI0yW6KS7c/2c0/DqaJUazvzWhhDY2paft3tEloB7LJyGgGiC03x7d?=
 =?us-ascii?Q?PwbGXTRi2PfiWo1Dve31I5s4Pw5o3pebxJtLcRO2A47GxYUEmBQJZE51eSNK?=
 =?us-ascii?Q?wQpj5TaCjc286lah1LW9XNEQ012uy+/KPmXGOVYUL13VT+ItwejNGt9YPZoe?=
 =?us-ascii?Q?bURI6V+zkwn1taeicC1t+g4GaPeM2gBN4rw57rxPZBTLW849nlmNN5dKbxKc?=
 =?us-ascii?Q?LxbtGxxSWVUHwYWgNTY8VUVqRzD/PQSMW6qzUNLPeEbkn+Fl5V4AhjLHDYKc?=
 =?us-ascii?Q?8fLnxfZDIt1BccGsPzXR0ldGYLLmwT/OKA9A0aZnHzkS42dzO+F9LjpkF09R?=
 =?us-ascii?Q?W/VFUd09yPlGsn6KarywGjzavmDvQRBJ2wQDnvw6Kxh+fgqnacsbuFAPc/kt?=
 =?us-ascii?Q?y3Y+0x9IuHQfRP8LTGnAVAVp+UlRBhDMEatobcOhpfb4A1B4hIs2LnIo3TCz?=
 =?us-ascii?Q?POyV2tYF8jmSLmH3q2ZLySiwIR1+oBO+pVRO7HepOWuykFo5n9ABvArZtZgy?=
 =?us-ascii?Q?6JNmzouHeTVcEM0HjiokrbZBlusrvsk/oCZDHpl6rREz2JtmFOTEEOpiuLAQ?=
 =?us-ascii?Q?fiKe33DxNwRwEXxUcdu7oBzK1CljyXIJPdIUbGQUJzQaH7ZE4+pQ7dc6yw6A?=
 =?us-ascii?Q?im03kan58nrgKT3VZpXp4yRTnf1uk8Itz5e5D82IgwIToqVlQG/AJAuznzam?=
 =?us-ascii?Q?8Fcjc3FpldIcMPDsS0BhkSdb7SuV0Ki0XaGwWT01jhXtRJUGAUx2OZXUZkBH?=
 =?us-ascii?Q?4Q+sqyB497OnDwECXr/oFkzE6aSIXM0bWGSQmNVt88tVPlUtM4rbmIKs9ARM?=
 =?us-ascii?Q?eMYwt78w2rAO0/qcidkefiz4FTbeOiGYqtwkDpibGXKINrZNtS6Au6wiB+Sa?=
 =?us-ascii?Q?724jrap5BFAzfovDrUTC8kO/gfCD9ROH8JnICz0/YFM01Wwm3l6h6up4sWf+?=
 =?us-ascii?Q?F98qW/H1Fy1Tti3oxSqOLhWDK3B+wMuTNinb2urApTTZk9YGve99jeMhsgmE?=
 =?us-ascii?Q?BCZIu75J0jn01XwjhhwOrVo61oHoWUV56wRG3KRWk8b+aBSVdKu93bbRIUgm?=
 =?us-ascii?Q?iLPDnZywoAIi/4FXPwjlNCMSKCdiT8Ms1afSFHATNjhOqXCzHXBVUSsknT0C?=
 =?us-ascii?Q?+8zxXyfuOpEojVKCrwd+Cyjj9yAH925/nRnVax/88UMIk5cDT3scuRqXXbgY?=
 =?us-ascii?Q?+Js88yU9sTpMAXrX/rmsbhNrjikLATP2?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB7726.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2aMYUqNnYsb0P5AIQUzua584h3TSr1yQRxz3SVDPkLkRQxWHNey7NAWtnNuZ?=
 =?us-ascii?Q?clWyXCFcvIlrVVsLYfIK9OxDmKz4N/6zrwXuHv76K5Pcz9bfodPnatEJ+3mp?=
 =?us-ascii?Q?302r+kPcevC4vFTOcdPuSkOy7XCxCEYSI8yZOmtJZywqsDGowfj48kdGYyMh?=
 =?us-ascii?Q?Iz3C84QcJyZNbOVL0WDiPCIg20gknmQrjnFx2Iuc0KrtgQREbdGH2eM3nNtF?=
 =?us-ascii?Q?0DokhcnLmOpO5okbBZa7vL758ELNMJmtNKnFcZm/IB1ZpiPemkoxeyLd5aeP?=
 =?us-ascii?Q?AdAhzkIXkRhk+0sq8xm9DTQ/tsAdm8n8FAwhkC2QSTJL/KfGJkc1LjGpUyzj?=
 =?us-ascii?Q?cJ8Wy7e4Qyd0gSk578Pod5czWp/FG8v9Umh9rwSoK5kkyNF50JCliMKrk6xw?=
 =?us-ascii?Q?38ilB3GqUketyFvKvaKO7XrjgWcpfR69eBKpc9KXaSNBaILHKjaiS21dpADU?=
 =?us-ascii?Q?JSocufbvTw8px+sGtYWyPy8mCekoIza/XWsmt54BjuLs5VNlfIw/JqI3JHtM?=
 =?us-ascii?Q?ceIZCIAseZGBRqEQ6mEtZbA2tSL+7hiwGyrxv3gJJXwtJa59ukbsTocyEuwT?=
 =?us-ascii?Q?3MK4CMiu0kFUbgU4ACZtIJo1BQ4U0kL0krxwi4qBV7Y7yIlZPGx6qRlUu8PE?=
 =?us-ascii?Q?mLV7dvTUETz3VCePrTsXvmFvDcnHm2ET98jp6Nk8AkYPaXN9pnjZG2xijL0X?=
 =?us-ascii?Q?BssGeNhBsJEl0qju48HNS7P+LM0omQKdOH9JYDu6qPcOfhdM6VTSpsoJFgyN?=
 =?us-ascii?Q?7ZftBkP8WLQw2vEFxUzD3cjAtn2+g7Ca5T3FpIFswBysQKO5eT5PqdR88rmX?=
 =?us-ascii?Q?kVLirkunQdd4JSKK46tna4Rsz4de6Ofq70TA+0iq6WkQuLd2siWWR5LLWhUc?=
 =?us-ascii?Q?Um2GfSb6ALKD/mIyq9A8ncTP+cKUqHD6jAha2GN6QAhEZQKyTYccvozhWS8h?=
 =?us-ascii?Q?0WQbrqMOnAdg3SIj3oPdHuQJiAPL6YJ+U4bdK1oahO1ySn6mC1lZpBqMTI90?=
 =?us-ascii?Q?p2tNaUHtVWis4OdEDnKtp9VA4UYkh2jUUaC92wnpXjfCw1hQQY/Is3EQ7GZz?=
 =?us-ascii?Q?NGl0PzOtFWcOuJOEz+smOuXQhGn+TMfbXxuC4NLwd26QBVZnWoq9WvOR4+5j?=
 =?us-ascii?Q?+1fBve1cMT5mUl53rSHvocN46uUyLt6EAyKnd530SN3ia6qUTwW+DZI+w1m7?=
 =?us-ascii?Q?C3sI8oDc9efJ+JrXgHkSoy/1Y/OT94m4b74B9X8q+3mLKBAeXe/ze+QJIFv0?=
 =?us-ascii?Q?z6kOSPDCeJZE36Ohp+trtv/lgRnbBhgs+xU36T0CaHNEwFcg52eLZRyGnvL4?=
 =?us-ascii?Q?C3Y+2NgNjubLszqMArFV7NVb7TU27e9GHZHJ8MRk9R97Oa2Fj0gNbqihgX2Q?=
 =?us-ascii?Q?7marcfVwI8T7gxdd6QHsWvwE5k85nV8tL0HCNxLHbTw9F2NvINWs1+M38nN1?=
 =?us-ascii?Q?aMJFy/clOwcAkzsI9T4lx0GHx5/6XLoAd1vCNbumOyTAPV6C3nvXn5fiAdG8?=
 =?us-ascii?Q?Qi8k4T2VHoZSQrGjZSeTv/zaW2TRk7CeXqODyUbKboy45Dsh9dQLYqEu3aOM?=
 =?us-ascii?Q?JyYaTcwI9Pfi5DOuMEVXSfugqNNipobMZMVvFnTp?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6801b0a1-d79c-4dfd-bc76-08de05ff9411
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB7726.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Oct 2025 00:13:59.4213 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gArOTNPZAxF+5pvfMiGxaY11mUNy9IY5tK6WU7OZJzucUhQ1jgnQBGZxZnuELRKdTlvqFECCi7nU8siWlELZrg==
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

From: Joel Fernandes <joelagnelf@nvidia.com>

Add definition for RISCV_CPUCTL register and use it in a new falcon API
to check if the RISC-V core of a Falcon is active. It is required by
the sequencer to know if the GSP's RISCV processor is active.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>

---

Changes for v4:
 - Return bool instead of Result<bool> from is_riscv_active() as it
   can't fail (thanks Timur).
 - Update register definitions to correct Falcon
 - Switch register definition order
---
 drivers/gpu/nova-core/falcon.rs | 9 +++++++++
 drivers/gpu/nova-core/regs.rs   | 7 ++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 734ac0fbfb49..185ed6d1cfb8 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -506,4 +506,13 @@ pub(crate) fn signature_reg_fuse_version(
         self.hal
             .signature_reg_fuse_version(self, bar, engine_id_mask, ucode_id)
     }
+
+    /// Check if the RISC-V core is active.
+    ///
+    /// Returns `true` if the RISC-V core is active, `false` otherwise.
+    #[expect(unused)]
+    pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> bool {
+        let cpuctl = regs::NV_PRISCV_RISCV_CPUCTL::read(bar, &E::ID);
+        cpuctl.active_stat()
+    }
 }
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 0585699ae951..3bd1bddb16bb 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -324,7 +324,12 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
 
 // PRISCV
 
-register!(NV_PRISCV_RISCV_BCR_CTRL @ PFalconBase[0x00001668] {
+register!(NV_PRISCV_RISCV_CPUCTL @ PFalcon2Base[0x00000388] {
+    0:0     halted as bool;
+    7:7     active_stat as bool;
+});
+
+register!(NV_PRISCV_RISCV_BCR_CTRL @ PFalcon2Base[0x00000668] {
     0:0     valid as bool;
     4:4     core_select as bool => PeregrineCoreSelect;
     8:8     br_fetch as bool;
-- 
2.50.1

