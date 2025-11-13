Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C141EC554A9
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 02:41:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D72D10E7D1;
	Thu, 13 Nov 2025 01:41:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LuvWaz8j";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010021.outbound.protection.outlook.com
 [52.101.193.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF29810E7D6;
 Thu, 13 Nov 2025 01:41:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lpfTF3VjH03P5W72+nHC27Z4CKBUqKcRsGFPbzIzs10QVSzkwbGV5CDn2cVK+dqQY/B3Zlj8AVgkQtj7SlpdkYLLMu/lfOKxcx19bx7xqDK+53YY1nrUkCse/IyQEMxv0nkOL/9NQC4irjrX7EwSXU1i3xfTBwUtUuRVrOHz/HiXq7UH/pjkHG8OFilwR5unokzhcmLt2x8WSTLNljBVUZnygCDupvNdxldl5ZiWGe3c+2asJ5E8mJeuIwPRm0h9xOfgNTIPqGrmEMJi8gk6vJSc5T/0cxXUA+CwBI+6E4BnE4Qk8tONYv3jGdchtlxCNUfgAkYduM+cSOHGmKhvyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KaB4Gd1jAXk6KaIymHnqEdxbV0T/ZAIQg+39dJpH/gc=;
 b=whe+KX49D7Gk9ui2YFOwH76kPX7Ek3aT55IVmAqdfQEyXz1H0d+Z+wfv6RPDfbNtNP7eNcciDruNGYZ3Bfe7CyeZ/+06KTcVfXaomOdf3MFO/NR+2/+bUwWAR9xcQCjz8gH+tDM1HZ2hbtc9WKJgWXrUNzQZt1GLqScEF679AgLGizuAZFu2MsqHFbRRSehZZhV+9YZFiwHs5CQOV5bEXUv9XtwIvcyaLmEj3fUNQ1uiNlYGbaermwwxfCsCQjh3Zz6CflZen+Ew6uOkoEj6xBPArlnUNlZarkofu/+IlrIDotaF6kFT35AtXhHITBpB7luFYyLyZcdy0qkJQfH7Tw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KaB4Gd1jAXk6KaIymHnqEdxbV0T/ZAIQg+39dJpH/gc=;
 b=LuvWaz8j4BmihTAgI6JMjegQ8WS4oK44lUoKSbY6ihn539pLxJQTOXBNbtbBHmsSavgQsMz0M8GfzTlnROxtSv3gOaBsuhC61+4L7GxrItq6E/+wIL4zysGWG8yTh9kgeRYj8s1ii/0aTJX5yxt69sOaQc+GRBCm7cTcNzQizdiZfw9T4jXbnrVDm/+VrHrr7LICEL0UJZZfoQ99XehFhj5KO+jRgF5PqASOZ2OoHhGBqvJlDhoSZcUIeiar36mG4uXceY3KCd8c7oQ3fd12Pj2aowUuESrxfHYzt+fTfknpIrjjPOaW4b7NQj2uvIjeKMpj5AyiytrcDvO2lbaoQQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB8056.namprd12.prod.outlook.com (2603:10b6:510:269::21)
 by SA5PPFD8C5D7E64.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8e3) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Thu, 13 Nov
 2025 01:41:36 +0000
Received: from PH7PR12MB8056.namprd12.prod.outlook.com
 ([fe80::5682:7bec:7be0:cbd6]) by PH7PR12MB8056.namprd12.prod.outlook.com
 ([fe80::5682:7bec:7be0:cbd6%4]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 01:41:35 +0000
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
Subject: [PATCH v4 08/13] gpu: nova-core: sequencer: Add register opcodes
Date: Wed, 12 Nov 2025 20:41:14 -0500
Message-Id: <20251113014119.1286886-9-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251113014119.1286886-1-joelagnelf@nvidia.com>
References: <20251113014119.1286886-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR11CA0015.namprd11.prod.outlook.com
 (2603:10b6:208:23b::20) To PH7PR12MB8056.namprd12.prod.outlook.com
 (2603:10b6:510:269::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB8056:EE_|SA5PPFD8C5D7E64:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cc43ef7-df9a-4316-a04c-08de2255c806
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EsoAI4b48UhIq3JQlE/hchv3BcEszt5VBrllcwwaN9Asre/TK+Z9raj598Aa?=
 =?us-ascii?Q?Vibn+pzoU4Eq5SjrVOGTlUBzk3A2FdE9b2/QtSVAhC5owQ5p7rH59MGsiV4i?=
 =?us-ascii?Q?NzFO3t/sj35/KCi8CGiz8fuCZBv+LnQM/IK0YGGjZqUMEE7a9C4Ddj7c+N75?=
 =?us-ascii?Q?aQ8rD3wanSzjKoUUye5hA8am3Q4fIlDVJOM5qiZA9fkCFvQhbZAgfp+UU4+b?=
 =?us-ascii?Q?oQHuEgkBZrTVRot4qmqvnePObutzFXlFZJhS8gg+/knCbcNf+8xni6LOb2io?=
 =?us-ascii?Q?LFTYkp6G2J40/FhTPMrOlRmqxU4ea6+kRC8OOLsVe8qMVZ0NZa9rr7ZDAwYb?=
 =?us-ascii?Q?PEwGn18RUpSAv6sCePke5lnPOsudp5VtXDtta9A/px4Ispf7Q2znANZFU5kE?=
 =?us-ascii?Q?ACI9J1/VoyH5BIWCF9ckfmM1IFXluqKR8xVL1VxS2wwrloFLUBdj2F6mm5Gp?=
 =?us-ascii?Q?rN32StH7VWI4AqXLmopcU9jSb7jGwnMtVXib6okEdKUgxC9xGKxcEfcu8KLw?=
 =?us-ascii?Q?hHrdIKyOFFezPRmGnI77jyz8jDR1yBQqR3cYuGu0VhncbjzblvehKSudoOHd?=
 =?us-ascii?Q?LEy3QlmxHiGWYK3oXDFCI2vdd9vS9uaTBBOFg78T/+XMxctce0SfPbbxcVoC?=
 =?us-ascii?Q?t9K5mJ5R6wk7oJH3VedrRXlXC0jByoLq4KVcdP8bffPy0WvR0FBKSk3nAa2E?=
 =?us-ascii?Q?8PuSL5pAx5h/t3cp96rMAcCDo8d0y6Hk1JcuZlOGIQPPwlf4IO5G4p/Bdgic?=
 =?us-ascii?Q?AB/TMijziv5oxTPUmKFGsl8pogmTLFmHc4d0mMmE8/O6TmEszq4XWOo+bzik?=
 =?us-ascii?Q?Ywh5t3lQuq++pPefJs6akHkIz/Siacx+VyNXYT9d12ToDz2K+Q0NvKDXqCa8?=
 =?us-ascii?Q?8gnSa2R5z6UmwvDql56iIY0pgOoFnhBJyu5Si1Qk5ZX94wdHLFCZoFmhOg6a?=
 =?us-ascii?Q?zEPshPFBSRPJxYsU2rL0AXvS+bxMsqqvSq3kpLsEz2S91A+e4iHDBbu0AgnK?=
 =?us-ascii?Q?QBQ0ERzWc38NwjV8t0Kl44L9VF51anAEggNOZqXNYhH0xP/m+XdMIQP3UaLE?=
 =?us-ascii?Q?2Mpbs/jXabTFP/kbFghZAviPj88BVQLRZELc8ZbBnH2sQfZFYX6tGxfpKR3v?=
 =?us-ascii?Q?Ing6Hpf+BjOGgA16FxEaBf+KIqqjRSq22McGosWMwOoTT0ohfYLxpUftjz4f?=
 =?us-ascii?Q?51CNmK4KWG1akJ9b6YdGQct55pbIagiN8vI6GPvo1DVZxvjTRTgEQi5Uq9dV?=
 =?us-ascii?Q?eOq/WYYUB4pS8GfDunIDoaRv4wAnI6b3R8nnTqu/YVhIAq6nlXhqM80a3KoG?=
 =?us-ascii?Q?ri3Tx5CLMrGuNPJyXSLcQWFWLE/ZA0xjb1GpNqjfMSg6BBUUYtt5qHhYHMG+?=
 =?us-ascii?Q?TcKRrzXJQTwFMGurjzvhBaxUtrB4WbxjOdTe6LqowOrU0pRWmTiVk+UUAlZS?=
 =?us-ascii?Q?C2aJc8fLut5N/4oYvYMPcVRcDn+zaI0O?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB8056.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2OwPGf2qlrK8qlJy+Jcstt8Z3mO8cRnTaKCVPVOrrKuo8CaE+FNlIHLrwRxA?=
 =?us-ascii?Q?+w9DsrH5mxTjFlQAUz2pm9jBmbs+J6XXIELVlAWd+JZ16E2q5AWj+ZYmxJoO?=
 =?us-ascii?Q?vTaNPi1OKsiBJWgGNgx1QgT9jUvW9Xl4PCZ+yrTQa238Ib7rNBrVQpiSAFej?=
 =?us-ascii?Q?AR2g7nwd7WAztQ6BSC/0ktVsUy9Q0sBNmXQjKFwpyPKBuhrUMGIEfZJJ6tjf?=
 =?us-ascii?Q?9bNk8W6VAskmvTlrbKI7FisGBd3QoCp2j3pjg8ILSuUT6ik4fuwCJQ2uSFwE?=
 =?us-ascii?Q?gmCBITXN8245wNCsggSu/UUXfy/rKLn3r4GlNA82b8bwRG94JYoo2Q7TyQJV?=
 =?us-ascii?Q?ZgqlIwr1BXbUxGne3UUfoVvR7LUXK8gvca3npWDTqHIzTbDB7w7X6U4qynqG?=
 =?us-ascii?Q?yfZghOkd+DbbgOqpfjxYlVM2Zhx4UTD7QvAhdmn0BZVaJtYcpxNv1VafmAqU?=
 =?us-ascii?Q?XyRwhuk1YobGTvVMDN9xDYmYNx1UBDMIwNnP4I+z9xCD2XrSIYVN7jqOEuKI?=
 =?us-ascii?Q?5M9+ESN76U1IbUl2XyDhVeI/1ooVzwTz8NExw+xAXnrXfGfhrKfCnA/fKptX?=
 =?us-ascii?Q?up9QcqgMeL+vE/tAatuXu6/I6+LDIZ8trtp9QL/Kbv4zQacTz37UpYViV7qA?=
 =?us-ascii?Q?Iw9D6St18sDs3RVb+wnxNA5Qs7W/L8fIxR+Q5owwfuHYuLzZumdb+AhkgrDj?=
 =?us-ascii?Q?inH0qHss/0QZCJqXKi/6amHsyR1k2TSqaRXmDh1hHC23wEAKYEHjarF4kIEa?=
 =?us-ascii?Q?sMcug6QvMD2giWq2MEDB5Xa4UbUthgRdkqsYZksn7Sn/gat3rCj1EkHsLxrq?=
 =?us-ascii?Q?HjJWd5pL78AnSHSZWsLvpT2KadSAbp8leGFdtLLRYs9JGZc1CWQiTzfkDdhp?=
 =?us-ascii?Q?mfKRT19Kh+60ZnrblaXVbo8In2rqcn8fh2S/eSYCLya4txjI09lqTCZThixc?=
 =?us-ascii?Q?UyYGyASpvJdoRIxXB+ccph4mKXP9M3d5m+p/Wy3f05mokyaU2xMdZ7htEr9m?=
 =?us-ascii?Q?z/rACbjqjIdtFb+nyjeOwj8z9F/JxY1CFJIpVuCSEk0hQzgd8ezWRZWJyOEJ?=
 =?us-ascii?Q?s6nPxJgf+BBygf3x6FHtTstU0/un8iNmQVNQ2zK3qQqICBe8TErrywbUngYf?=
 =?us-ascii?Q?3AqHBs3MNzsRJ3CnhDc0dlsCskR1MZVNJPmIMy/vuTOUGUAeQB2LAiQImSu2?=
 =?us-ascii?Q?1IYrRLLv5xT4n4cZOk6j5pGcCNArakHEIqGvRV24OvlhjBKadDrvrd4M31mo?=
 =?us-ascii?Q?/OHn66mHIlzV3W3kBbyRVvbr5/96Owhatkkr+SLDXw7zCjqrPym4WSyzFfey?=
 =?us-ascii?Q?ECXXwbsvPxY6JYBXrvaskWIzp8ujZVwGaMNwVEoqUiZ+uR6NJF9VujV4tQ18?=
 =?us-ascii?Q?Hm2hLudxRMlCI8/CMiwtOSjmH1skk44vGGbPeC1+l918Etyl8Jb0z2hio3Iw?=
 =?us-ascii?Q?nVcBFonKA7qYKuOxKimPuqIHzlNO6J6Np7JtF61VAjwjjA5s08lUfLFBhlHW?=
 =?us-ascii?Q?9XtpM1oIM7qIpC7RtMUsUllTM0SC2Rqd/b/wIiWoyKjV9aeYTkCRv9ObXPpC?=
 =?us-ascii?Q?7B5aTqq8IyTvvA+8kgyYXhvC3waezw76NiA1KesM?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cc43ef7-df9a-4316-a04c-08de2255c806
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8056.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 01:41:35.7566 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DuNs6sqgRigapj2CIYXg7FFMD1AvC1jB8PsVHj5ZZwVjr1L+uoTIPms541FZkXhGFG+JcmDPhg4Srm72Mpzx5g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFD8C5D7E64
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

These opcodes are used for register write, modify, poll and store (save)
sequencer operations.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw.rs        |   4 -
 drivers/gpu/nova-core/gsp/sequencer.rs | 120 ++++++++++++++++++++++---
 2 files changed, 109 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index bca89f3969d4..4717c12a8666 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -389,7 +389,6 @@ fn from(value: SeqBufOpcode) -> Self {
 #[derive(Copy, Clone)]
 pub(crate) struct RegWritePayload(r570_144::GSP_SEQ_BUF_PAYLOAD_REG_WRITE);
 
-#[expect(unused)]
 impl RegWritePayload {
     /// Returns the register address.
     pub(crate) fn addr(&self) -> u32 {
@@ -413,7 +412,6 @@ unsafe impl AsBytes for RegWritePayload {}
 #[derive(Copy, Clone)]
 pub(crate) struct RegModifyPayload(r570_144::GSP_SEQ_BUF_PAYLOAD_REG_MODIFY);
 
-#[expect(unused)]
 impl RegModifyPayload {
     /// Returns the register address.
     pub(crate) fn addr(&self) -> u32 {
@@ -442,7 +440,6 @@ unsafe impl AsBytes for RegModifyPayload {}
 #[derive(Copy, Clone)]
 pub(crate) struct RegPollPayload(r570_144::GSP_SEQ_BUF_PAYLOAD_REG_POLL);
 
-#[expect(unused)]
 impl RegPollPayload {
     /// Returns the register address.
     pub(crate) fn addr(&self) -> u32 {
@@ -495,7 +492,6 @@ unsafe impl AsBytes for DelayUsPayload {}
 #[derive(Copy, Clone)]
 pub(crate) struct RegStorePayload(r570_144::GSP_SEQ_BUF_PAYLOAD_REG_STORE);
 
-#[expect(unused)]
 impl RegStorePayload {
     /// Returns the register address.
     pub(crate) fn addr(&self) -> u32 {
diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
index de0a7137dcdc..b011609c6804 100644
--- a/drivers/gpu/nova-core/gsp/sequencer.rs
+++ b/drivers/gpu/nova-core/gsp/sequencer.rs
@@ -19,11 +19,15 @@
 
 use core::{
     array,
-    mem::size_of, //
+    mem::{
+        size_of,
+        size_of_val, //
+    },
 };
 
 use kernel::{
     device,
+    io::poll::read_poll_timeout,
     prelude::*,
     time::Delta,
     transmute::FromBytes,
@@ -76,18 +80,50 @@ struct GspSequencerInfo {
 
 /// GSP Sequencer Command types with payload data.
 /// Commands have an opcode and an opcode-dependent struct.
-#[allow(dead_code)]
-pub(crate) enum GspSeqCmd {}
+#[allow(clippy::enum_variant_names)]
+pub(crate) enum GspSeqCmd {
+    RegWrite(fw::RegWritePayload),
+    RegModify(fw::RegModifyPayload),
+    RegPoll(fw::RegPollPayload),
+    RegStore(fw::RegStorePayload),
+}
 
 impl GspSeqCmd {
     /// Creates a new `GspSeqCmd` from raw data returning the command and its size in bytes.
-    pub(crate) fn new(data: &[u8], _dev: &device::Device) -> Result<(Self, usize)> {
-        let _fw_cmd = fw::SequencerBufferCmd::from_bytes(data).ok_or(EINVAL)?;
-        let _opcode_size = core::mem::size_of::<u32>();
+    pub(crate) fn new(data: &[u8], dev: &device::Device) -> Result<(Self, usize)> {
+        let fw_cmd = fw::SequencerBufferCmd::from_bytes(data).ok_or(EINVAL)?;
+        let opcode_size = size_of::<u32>();
+
+        let (cmd, size) = match fw_cmd.opcode()? {
+            fw::SeqBufOpcode::RegWrite => {
+                let payload = fw_cmd.reg_write_payload()?;
+                let size = opcode_size + size_of_val(&payload);
+                (GspSeqCmd::RegWrite(payload), size)
+            }
+            fw::SeqBufOpcode::RegModify => {
+                let payload = fw_cmd.reg_modify_payload()?;
+                let size = opcode_size + size_of_val(&payload);
+                (GspSeqCmd::RegModify(payload), size)
+            }
+            fw::SeqBufOpcode::RegPoll => {
+                let payload = fw_cmd.reg_poll_payload()?;
+                let size = opcode_size + size_of_val(&payload);
+                (GspSeqCmd::RegPoll(payload), size)
+            }
+            fw::SeqBufOpcode::RegStore => {
+                let payload = fw_cmd.reg_store_payload()?;
+                let size = opcode_size + size_of_val(&payload);
+                (GspSeqCmd::RegStore(payload), size)
+            }
+            _ => return Err(EINVAL),
+        };
+
+        if data.len() < size {
+            dev_err!(dev, "Data is not enough for command");
+            return Err(EINVAL);
+        }
 
-        // NOTE: At this commit, NO opcodes exist yet, so just return error.
-        // Later commits will add match arms here.
-        Err(EINVAL)
+        Ok((cmd, size))
     }
 }
 
@@ -115,12 +151,74 @@ pub(crate) trait GspSeqCmdRunner {
     fn run(&self, sequencer: &GspSequencer<'_>) -> Result;
 }
 
-impl GspSeqCmdRunner for GspSeqCmd {
-    fn run(&self, _seq: &GspSequencer<'_>) -> Result {
+impl GspSeqCmdRunner for fw::RegWritePayload {
+    fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
+        let addr = self.addr() as usize;
+        let val = self.val();
+        let _ = sequencer.bar.try_write32(val, addr);
+        Ok(())
+    }
+}
+
+impl GspSeqCmdRunner for fw::RegModifyPayload {
+    fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
+        let addr = self.addr() as usize;
+        if let Ok(temp) = sequencer.bar.try_read32(addr) {
+            let _ = sequencer
+                .bar
+                .try_write32((temp & !self.mask()) | self.val(), addr);
+        }
+        Ok(())
+    }
+}
+
+impl GspSeqCmdRunner for fw::RegPollPayload {
+    fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
+        let addr = self.addr() as usize;
+
+        // Default timeout to 4 seconds.
+        let timeout_us = if self.timeout() == 0 {
+            4_000_000
+        } else {
+            i64::from(self.timeout())
+        };
+
+        // First read.
+        sequencer.bar.try_read32(addr)?;
+
+        // Poll the requested register with requested timeout.
+        read_poll_timeout(
+            || sequencer.bar.try_read32(addr),
+            |current| (current & self.mask()) == self.val(),
+            Delta::ZERO,
+            Delta::from_micros(timeout_us),
+        )
+        .map(|_| ())
+    }
+}
+
+impl GspSeqCmdRunner for fw::RegStorePayload {
+    fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
+        let addr = self.addr() as usize;
+        let _index = self.index();
+
+        let _val = sequencer.bar.try_read32(addr)?;
+
         Ok(())
     }
 }
 
+impl GspSeqCmdRunner for GspSeqCmd {
+    fn run(&self, seq: &GspSequencer<'_>) -> Result {
+        match self {
+            GspSeqCmd::RegWrite(cmd) => cmd.run(seq),
+            GspSeqCmd::RegModify(cmd) => cmd.run(seq),
+            GspSeqCmd::RegPoll(cmd) => cmd.run(seq),
+            GspSeqCmd::RegStore(cmd) => cmd.run(seq),
+        }
+    }
+}
+
 /// Iterator over GSP sequencer commands.
 pub(crate) struct GspSeqIter<'a> {
     /// Command data buffer.
-- 
2.34.1

