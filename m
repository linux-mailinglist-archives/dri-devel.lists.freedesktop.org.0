Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 898EAC29AC3
	for <lists+dri-devel@lfdr.de>; Mon, 03 Nov 2025 00:59:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D11110E1E1;
	Sun,  2 Nov 2025 23:59:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uUY5HDZQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010061.outbound.protection.outlook.com [52.101.85.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F33410E1E2;
 Sun,  2 Nov 2025 23:59:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uYoWg1z7iyW2sac4tHuXVBTxN9uC2pDUj4xHZVlsM9UcPfYehhw1tMXdDI/LMyDkQ6rc6UqazNhdKep/jD2vG5TC+R9C9WBY4Rf0n7e0IvBIsJBx5KTI/TBwPqdEInGLszheKKYf3ubGWyAqK8pmQXCUX+FkT9M/Qg1/oij4auZ9ACDDTELRuEzrQe7XkYQNQAwxEN/vZ6U5Hb+ieZ6jnCS0LaGInzNL8JKsfViJiKA/TWF5WsZa9mhKuwdaoow/1PJgtAyIPWK71sxRTsczwNotYyDzsTBhEzV5JyVR04/+jOH+FGkibmH8VtzfVV3Ez4Hh6lxlPNVErySe8voPLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uPw58MswYXLQreGLhEvI8pnUQYEICSdhsJkvHPsho5s=;
 b=UO504oicOhSZaQ/RBrLO+FstOJD1VhmWJxF4EDnhfPdWseoylHjWXuhpUYoTC0Pr60wVagehRMtvkdwbK3qHiVsoH2qE5AA62zuOkl4GCrKsEg8oIxr3+h6OZJKIj8H8o3ZG517U2WB1DgsRvDnC0YvY1PVIhEPHS2iWXJIFG1zZZ2HG+CpznRuA5M18SEeY/3IHuB16MhonIRO1RUmNoXGie4RtdSgrQiSc1PJB8KtCd4MEvu2TugJ+tv6Tpp7uW35Yfae/ma9ZOSK6eBHvDv7dWTZBmnM0U55LURiUjvfHn/TWwNk9AmjGoTMyJetzqRjc/DBNxSS5Jfc6HCixAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uPw58MswYXLQreGLhEvI8pnUQYEICSdhsJkvHPsho5s=;
 b=uUY5HDZQlZXr75KQD2wLkMLEEjeKSNkMCcCHiKW+8iUiHiETPgUidRFtlK+T7fXesB+02yB4LC+OucJdqTDztBzwBi8jGU9UulKWQryoUFO7Wa5M0WCbgoRFvibOWCWc0QpJ1UJI8j70gcktj3oZN/KPaCDWuFNzD7l4aMoyed/xpQo2Qy5RGRGIbdri31n127xUlLhVgJVZ/l1CXKD4tjGNMRPuNXQal5/eeNA8q1i3Q1iT/1oPo4fyjqv+wDrHxiSX7vlcwPdVOP4mC/oaimWdw3xzygzEI5GLRPXhKPRgwggCIn9CQqoNuGhbZAVj6WEKky/hmbq2qYfxcLeSqQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SJ2PR12MB9163.namprd12.prod.outlook.com (2603:10b6:a03:559::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Sun, 2 Nov
 2025 23:59:37 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9275.013; Sun, 2 Nov 2025
 23:59:37 +0000
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
 nouveau@lists.freedesktop.org
Subject: [PATCH v2 06/12] nova-core: Add bindings required by GSP sequencer
Date: Sun,  2 Nov 2025 18:59:14 -0500
Message-Id: <20251102235920.3784592-7-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251102235920.3784592-1-joelagnelf@nvidia.com>
References: <20251102235920.3784592-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0138.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::23) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SJ2PR12MB9163:EE_
X-MS-Office365-Filtering-Correlation-Id: ba0ea701-e38b-4743-4927-08de1a6be14a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?duxp8Qa1MOIBZJ9EfJ502dZlhkXOzuJdNAIluHbcS6aqA5wVZAWc3wYVR1zS?=
 =?us-ascii?Q?OpZ44UhEYNh+yO9j1LpDIZ0REv2KC+42nXahYbUEVSfE0kT6NQsFHob6LDNh?=
 =?us-ascii?Q?2muR0Ddt6dnmwBNv6yQmghLsqOWlTN9vyTrqHXcWmQ8105m45qX29srFXREK?=
 =?us-ascii?Q?lsEQZBNWe7vtfhWoSOiTrycxX2huELDrtj/VJeOCzVphs0VX8KG5h2zioBFO?=
 =?us-ascii?Q?oT/FA0QBR8WeHgrXgx5qpfPaQiLah+PnPrHgZySes64I51fu0ALkzQGFf2Bl?=
 =?us-ascii?Q?ABgPVrbSrX3/wXHoNhvlT9Wsto+16OTMaaPVP6ZLfaC9Jj+ZhvLMcWH8PN7S?=
 =?us-ascii?Q?oa+vjQhkoS0NzcATALkJA7/Rr7H23f93U1DCmarD2CSkhKZnrUntT1N211Ky?=
 =?us-ascii?Q?04r74TMI9glEDat8+w9Mxqkq7PAjP7nckR2xDaG35IEbO90OuVaKObGhGyju?=
 =?us-ascii?Q?Bhgnf8lCoWYxDNgfcZDt2U5L04pd5X2fWJAoLgWW0SzjRFCVb9nQloEtQaGq?=
 =?us-ascii?Q?Z7cIJ5Q08yFhYs7mwPnTcp0gyaePirxbmjSdd7mh1XUWYitkWgy8eaXV5Okk?=
 =?us-ascii?Q?eu722c1FqaARcnBMLz+ZiZjpqSul3EJpN6SkqNxwtPMvRWBLUhn9C3sptyp3?=
 =?us-ascii?Q?Q1jbhgrMCqQ/vxugckZIbqXATZcJq2AMZ3NBEwXbkrJomLfLiAmsbRgP8ZjY?=
 =?us-ascii?Q?hFN76jkSq8z3KPXNZWmgFxzqqZDaXXhJXVQkTp3VDAjR7ngi8Ht7m5ZG5x+I?=
 =?us-ascii?Q?SH0TNjXhTzuNBqTjfGadP9ll6RluuDxr+KCGJ4nEUe+juZFAKa5TFcow5cO7?=
 =?us-ascii?Q?ptpINCgymziECR6yE56px2bcPHyj/UCY6JzJXPzyeqe3LpXJWhDZ270iwGp1?=
 =?us-ascii?Q?EqDbl0Zg8mkcRVqhRPeryIWn6lKH5T79Q5Td4JN+EDVAWtugHCHNs1Z78lt/?=
 =?us-ascii?Q?AbbZRFylwNT+1pi+jZNQ3dS9xEBCxq3X+hso+6I2oG1rpDfFQzpUvRg5bPw2?=
 =?us-ascii?Q?VqwbeAMPNgJRphl8DQSUr0+/pm9wnhFe3YkdydlZR2Pjb0NYxuQFvDYuS5mm?=
 =?us-ascii?Q?ZlyAYII5EEQGV2vy+E7U9yOM2Ugvh4/Dsk4EKj4TgaJqi12uDBjU+lE4m5OI?=
 =?us-ascii?Q?zPuHGolPnEphx/70hXMtl9ZkedsBhAPW+zgK65PpkYDOeyX1YZV4y99KiMBB?=
 =?us-ascii?Q?OunsonfbtQMue8ktf9Tz41S3jPXwpPXy1rEVh2ziJstH9tCdvqnCiWhS4LWd?=
 =?us-ascii?Q?R7xFRKX+koVfxq3ncaHXo0dMeI0B6bMqPYjprSJFQ6U6G9/HN9zms96dLbV6?=
 =?us-ascii?Q?+kwqi1nA09SpAXr/mTVhhxEx/vi9Jcy2YHddC9mF8ZSuYHKEyhRGrkLa7x/h?=
 =?us-ascii?Q?mwqjQUAYrYB5g/yJvzCQY4qStkOpvPGRsucI84/D9Ka1JD+tvllQRGE4B39o?=
 =?us-ascii?Q?N42b3hXKt/bIuoFFCL+VYahWymqsDF7D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bWgg9X5DKilKzNblnlGDWHx9j5q/+gTbvUKtQvWGUxpJ1p6aL5itVcZqYIjd?=
 =?us-ascii?Q?ozCKmC6DPT5ba48nxF+oQV1Lwn+b8yOjom2NwsovfqS6XskGWQRCiyQHcAeg?=
 =?us-ascii?Q?2r+X/E+I5DkgodjYUcYmdAXhQVYhLdeT7lPaiQV9/oG/n4LjhELj3vtQQV07?=
 =?us-ascii?Q?9MUk5mJpl/Ye9B8NvTzhpD1LKJ0z2VBgn1TjLfHnuX4tSgkXOfukAuLUDrw/?=
 =?us-ascii?Q?rRH0JposLTc3dqy19MguFhORM1iwl3NYWRac/ruaFQvKE8SuZvKgdsKfVyHX?=
 =?us-ascii?Q?fLxRZygrqXxtbXIr7sURmhYvJdh/mHzKkJ4xXWxCBD/0Z5Hiaj9MuqpSnUWw?=
 =?us-ascii?Q?aukb3HAyBiCsQqDOJooHMWw0uNOfd5mA2KZZNyMs6rwc47BGCxjR3D/EdaKZ?=
 =?us-ascii?Q?rfkLk6IMrjvmwmkzO9TxIEVjbhxm7mLKt7Vprhjo1vA6UJfLtSLc2xox5x6q?=
 =?us-ascii?Q?3Am04Y0hL/SMDvPrECRdFIAnKVhLI9rYmIuAcguSS8fzMv6lQPKxfCdXcFS+?=
 =?us-ascii?Q?Q0lAtjeonmJYkKEacgY20nM0cU3ySHzaL6oB+lhN+uqtSGobbBTD4QCPMzFa?=
 =?us-ascii?Q?PbEbH42W0UmS6jBWkwKe0+K2q38BO4j1smRWVbkyAIFC8isxQ7rrT5cKwTSA?=
 =?us-ascii?Q?nQ5VBkzZphFOGXOtZ4WvfMGSs89bOcxTesnG6q0Oe2sd2VwpKwK1sGRvaesQ?=
 =?us-ascii?Q?YBSM5BCvy5k5Wmw8DhXCLkkCksuXvU8aSzWr8nxFwsFFo35OHow6PpEmz6Rv?=
 =?us-ascii?Q?PQk0OgZoQSxtB3jgy4lmnEMbzbsj3x46TQp2iWeomW8SNdAR00P3pNoqA4N4?=
 =?us-ascii?Q?gfGGul1WNSKS37v/Pa4kPI0a1ujkIvfnekaD1sSGxm5fFnabArWbixC5v3MC?=
 =?us-ascii?Q?kX0Rd/cELZbVwqS0tj9oYLcLEHRdi7YmZkzkZrNFl2CU9O7ffijAp8zoEw0S?=
 =?us-ascii?Q?6bR6OMKc9eMPQPa2acDD6/0nZoKymGw//Smuz7mTC9bnq8+y/lDP3fw0mWcM?=
 =?us-ascii?Q?O59uzA37t+GbJ6NIhocqPhGhRSxNnFXx3oPkN4SVHPwyXhUSUueAeL9+mYJO?=
 =?us-ascii?Q?wLJ+9TpMbDAsNo6n8pI3Z6iphczCOukUOb4EG8fTBfAvHWl4Nt2b9lG9++1G?=
 =?us-ascii?Q?m5KvTT7GC5BJTF8THgc5ertYElHdaq3FBsdTa69W43/61EhKkRaJwrXRIUe5?=
 =?us-ascii?Q?Jz+0O4BFknLLvO/Ka6hnCHYFLvncsHC7N6Gu1w1srEqmiFdi8bx9UMq1behn?=
 =?us-ascii?Q?cSFOCFkgsgZAIsOCv7H6AgUOmuJAnpU5P8H+vLfgDLLBsPCkDHim7dSGuisu?=
 =?us-ascii?Q?XfjwdExNaH5ikheftx9+tZn0cJZjzJMEISGNmMs6jc4Hotxy9ve+l5VPhyVp?=
 =?us-ascii?Q?oeSbbxop8L/6WQmZh6156IzVybleDphZXg/BfJaIhPZ+t9d3wkbZMoZH8usX?=
 =?us-ascii?Q?be4vyupCLDL+FqNXx5/I3Xw0kYTAlqmTUnHoDsZPLx+51VWPWhJ3re+aEpuq?=
 =?us-ascii?Q?lJ3N5WTZgyF7ap6tJ0iqqoU4YPRU+djel56oiumew+K1CJYwujKaq2FioM8m?=
 =?us-ascii?Q?hsuMU4Ls84MTFBKTEVAwhqMmuCuVph37GfQREgZd?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba0ea701-e38b-4743-4927-08de1a6be14a
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2025 23:59:37.7848 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PfoLuepILvhxvyJpFLrRL//RY4zk37T+uMWam67uOWwR/iwpngxlBpTHkTX44EKhixyovhLQ5GPFl3XQ/r42wQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB9163
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
 drivers/gpu/nova-core/gsp/fw.rs               | 45 ++++++++++
 .../gpu/nova-core/gsp/fw/r570_144/bindings.rs | 85 +++++++++++++++++++
 2 files changed, 130 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 687749bdbb45..53e28458cd7d 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -543,6 +543,51 @@ pub(crate) fn element_count(&self) -> u32 {
     }
 }
 
+#[expect(unused)]
+pub(crate) use r570_144::{
+    // GSP sequencer run structure with information on how to run the sequencer.
+    rpc_run_cpu_sequencer_v17_00,
+
+    // GSP sequencer structures.
+    GSP_SEQUENCER_BUFFER_CMD,
+    GSP_SEQ_BUF_OPCODE,
+
+    // GSP sequencer core operation opcodes.
+    GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_RESET,
+    GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_RESUME,
+    GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_START,
+    GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_WAIT_FOR_HALT,
+
+    // GSP sequencer delay opcode and payload.
+    GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_DELAY_US,
+
+    // GSP sequencer register opcodes.
+    GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_MODIFY,
+    GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_POLL,
+    GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_STORE,
+    GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_WRITE,
+
+    // GSP sequencer delay payload structure.
+    GSP_SEQ_BUF_PAYLOAD_DELAY_US,
+
+    // GSP sequencer register payload structures.
+    GSP_SEQ_BUF_PAYLOAD_REG_MODIFY,
+    GSP_SEQ_BUF_PAYLOAD_REG_POLL,
+    GSP_SEQ_BUF_PAYLOAD_REG_STORE,
+    GSP_SEQ_BUF_PAYLOAD_REG_WRITE, //
+};
+
+// SAFETY: This struct only contains integer types for which all bit patterns
+// are valid.
+unsafe impl FromBytes for GSP_SEQUENCER_BUFFER_CMD {}
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for rpc_run_cpu_sequencer_v17_00 {}
+
+// SAFETY: This struct only contains integer types for which all bit patterns
+// are valid.
+unsafe impl FromBytes for rpc_run_cpu_sequencer_v17_00 {}
+
 // SAFETY: Padding is explicit and will not contain uninitialized data.
 unsafe impl AsBytes for GspMsgElement {}
 
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index 32933874ff97..c5c589c1e2ac 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -664,6 +664,7 @@ pub struct PACKED_REGISTRY_TABLE {
     pub numEntries: u32_,
     pub entries: __IncompleteArrayField<PACKED_REGISTRY_ENTRY>,
 }
+
 #[repr(C)]
 #[derive(Debug, Default, Copy, Clone, Zeroable)]
 pub struct msgqTxHeader {
@@ -702,3 +703,87 @@ fn default() -> Self {
         }
     }
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

