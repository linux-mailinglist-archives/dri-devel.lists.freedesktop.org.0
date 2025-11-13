Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 15C42C554BA
	for <lists+dri-devel@lfdr.de>; Thu, 13 Nov 2025 02:41:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 541C510E7DD;
	Thu, 13 Nov 2025 01:41:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ecg3ZB69";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012014.outbound.protection.outlook.com [52.101.43.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13DF510E7D5;
 Thu, 13 Nov 2025 01:41:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pXcEHXpoQFO4BIpi+CZvoKWGmqjglh/VP8Zi45RaasrHebX7MyhngGvrpfc22Ic6B1SLa1yuLQnHlZ6OU+edbcIevX4mFBMUze9HfOFd3jQ1X6ye8vtTxau0NhenGouo1YREn6tCRua30wCidskTeJZ4Tlg1FY83WLnIKyi4p+ShXIS1s07V6dsicsXOibfKgiNbxANDD1awKRL0XgVHjyiWXe/+XnDITrmmNR+exLUM35mSb3PuEJSVSxXC/hYzzn/NVlQqVnYztgrhSPbwztfvoj4HmRqP10/OPqKy6IbIoGL9HUeS238LkfkcfRmjkBovlXh7OWqhoDsOkruVfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Zoq9NYeoydj42DOr1wPB1vI7nscLUwSltYIUe63b5gE=;
 b=DKdncyDcdFlqkCPPfnlil+WSvvkBAZgFYCtTysOqObh+WzNi+jEyvDa2Y73AULvHdGMUCu/cBxKGf5lY4oW13/rDIbNL7hl8yCnabAPfLL/H6iS/ra6lpbSBXwwwcA8korcR1FFkKtQz2P1IopdqBCtH+LMZamxtMQ4KJ3hg79znQlrOLtfljmSbfhaQi2ucPmLnCmVq+x9kWYGIzYyuVYrXYBv8QG1H19xrbSOIQNzkwWpOb5es1i1pdxHpiyGlC8Fxf0wc3jln5ffc38nC2Q/7hPshZOMROI+2wybmjeeuwSwrXPHUQnOScN8B0ISx5XKDSaZeJ5Iy230qJwcG1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Zoq9NYeoydj42DOr1wPB1vI7nscLUwSltYIUe63b5gE=;
 b=ecg3ZB69zB634I/Irx320AlpnG0a7KlBm0nUZPs0pHw6QxZenY1+1wQiMciHHJm7wsunvoqcccq7GTbpMgsflHz92x7P+jCRnudWyV42AwxdT18Nwnj/i0CbZdovUMMzHEPSVnENXX0rHhqKeNNwMn4++bJYronpizTBazEh1AN1W872VXiJVp+CoUbzqtsOqx0Eyl/SXaVmqHp+BZRTzt8r/JWnH2XwPc5by4tirj9WPyznkIZVbrbDKiQiBndzA4KKrTzw8GgCbuUnp2Z+K+GZBiDBJwZFBqRLVn4c3oXHs1KbFdwp/T4EGoizqu3cEfRZUMdfSxnVTIIlaCAzgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB8056.namprd12.prod.outlook.com (2603:10b6:510:269::21)
 by SA5PPFD8C5D7E64.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8e3) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Thu, 13 Nov
 2025 01:41:39 +0000
Received: from PH7PR12MB8056.namprd12.prod.outlook.com
 ([fe80::5682:7bec:7be0:cbd6]) by PH7PR12MB8056.namprd12.prod.outlook.com
 ([fe80::5682:7bec:7be0:cbd6%4]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 01:41:39 +0000
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
Subject: [PATCH v4 10/13] gpu: nova-core: sequencer: Implement basic core
 operations
Date: Wed, 12 Nov 2025 20:41:16 -0500
Message-Id: <20251113014119.1286886-11-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251113014119.1286886-1-joelagnelf@nvidia.com>
References: <20251113014119.1286886-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0007.namprd13.prod.outlook.com
 (2603:10b6:208:256::12) To PH7PR12MB8056.namprd12.prod.outlook.com
 (2603:10b6:510:269::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB8056:EE_|SA5PPFD8C5D7E64:EE_
X-MS-Office365-Filtering-Correlation-Id: 3509d55d-9cb8-4b12-0235-08de2255c9fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ltXIrCSkVKwEjYOIUBOSNvGPBFP87gGFE+wiIXYOUWA74ItJNUPPwkxQ139N?=
 =?us-ascii?Q?ZA1HZcXXbww7bRHLQaIDhHTnzUOQ/zcixsh27MKX0AEg9hDlI55DdcnsGeh3?=
 =?us-ascii?Q?nP0exTphB/HF9wdiPDS/Xj2wh1dvKIubTaG7bmrDwYbJydg/UIksZNmkerie?=
 =?us-ascii?Q?JJPsbXvJJbo0uUjULqz1vv++2V2s172Pver0frxujRdQ6YAm/u7c9Mgw/i0G?=
 =?us-ascii?Q?LY7XC7/e5Ysxsct9vGPJekkemHos9sD6HjHiNtevIvHvTRdJiCFXiiZostF4?=
 =?us-ascii?Q?ViF+BY4XSy1njeIVbzyEadvG7SMVaNLBm6TnHKojs1EVRyrxmvs084kCCOnA?=
 =?us-ascii?Q?1d4r01d5saSlKCfppiP+e4rdTsfAAIHoAOImnWJ0efRMNbdV1wj/sjSD5qji?=
 =?us-ascii?Q?8bTrFCASLtLswmVEd57efHzQYohdSNrA9bk3C20Q2gWmF0g2TmdDIcMRz9QJ?=
 =?us-ascii?Q?b4O0x4uSbniG3Ye6ToDXL9GjC6wCgPkbjLbWln5c41QgM0gn0E4mu3ayQSEn?=
 =?us-ascii?Q?PS9x3o6uPGrmaBUNRAs9SQJ1NaY+9fq8Hxf3JsDEh/JQmA6Nz2cl+1ryCXj9?=
 =?us-ascii?Q?hO5Ye9SBUMPxU/PD7/tmzThOkkSNxT1o8o8S0ptbJ8we0ULe0oCpaYTC0it8?=
 =?us-ascii?Q?2yUy0cbGBZ7wQS3ao3BrGuj1/idVMHwlbQOCOz1wLiVe4sS9B0NIFyxu+QKH?=
 =?us-ascii?Q?9ZqcIeCN1Pgdcu8UdlwuagscMQWK6ZY5oNGQXIfXQ/4I035EgvF+zcJLaLAt?=
 =?us-ascii?Q?BjXtPmUUoNgOoKyaqtjwjPDI/pPjWUM0lfU9pn210xTLtPhPzKzegHn3qu1d?=
 =?us-ascii?Q?JVdndmJgCUE96GfYF7btDvJULn5n4HkEk0ULR20kaCsmIm4qJwoTVxF1x6r1?=
 =?us-ascii?Q?ij3Rj8NV0yTdYclpKKRpeLXqg9MGofL/fu8l8oIAF/4uQTEF5CunRDXeu+q/?=
 =?us-ascii?Q?q7+l4FK+5XOCwQZSYXboVKwhF7Di6HY0vMbnFo95D4dPgZ+nbyBZRkKw1R43?=
 =?us-ascii?Q?PE+Yk+NkLeql6rO7QVKjOQR5UXT77REeAJNUPs7VUpY9tZyb5due/AYHsMQu?=
 =?us-ascii?Q?c6E0LPw/CxwRx/RNwVojpOVj+0mdQ9LR0+qThp4MYbnr8YEouVfe6L+XExwG?=
 =?us-ascii?Q?eYka6pojCF/4g3f4Cxev49NRvbpVhulXwB+WX81DYIgWC8pm+nC/gZIW3DVk?=
 =?us-ascii?Q?nYNylFajp7LjM/X2z7icKbl5pxA34vo9fyoA8/VIucFAE68kIZsoiugf0Y9f?=
 =?us-ascii?Q?WuPv2yZEGQAhlre095HrMW8Ao6VUNiSm0DuTvM/0c3QcA5IPcXZd7MF2o7JF?=
 =?us-ascii?Q?ptk5teR8qEqrXwx/hAX8A0adClnhk4zLYvf8R31oT5XyBWwAjuE3sX9Y+w9i?=
 =?us-ascii?Q?8ppqahOSnODHO80df+g80wU5PaJ66iQMxsitawvJqRjrXu72nqII3Pm2/7Hf?=
 =?us-ascii?Q?Q1BLZHfzeoSBMjJiIVZrbzU+B+qNrO57?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB8056.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?f/xax4hVb7TlIHre4TS2UlMPlrpNa7KAxyHHeql6UBjs9K404Rrq+zmSaLQp?=
 =?us-ascii?Q?cKd7Oqx1dMibkQcnDZXFSLVbKkt58phneuy5j+9IVFlRO4X+jbXSeAoOOaTG?=
 =?us-ascii?Q?FIkCIGClmym7WuT0vsdUZuVB/+v/Btej7tKuzxWu69oB0AJvYYOFgv0TbZvF?=
 =?us-ascii?Q?Qr/GPTzfHV1o/+ZEqiIxdT87Ma80vK3wMjPXoD7qz7ZKgqdnxDEH6rpYiqNn?=
 =?us-ascii?Q?vkN2PNLjuBiFCreM0I6hf32n1rkvh1ctHks7t3p//QiyS6gGlRbR2CK8hYWd?=
 =?us-ascii?Q?jg6E+6s3QxvjvU2A6lQOHcDo6VNSRpWfZCDNmq5K/fi2UBXk7vR3xl7oV9MX?=
 =?us-ascii?Q?I49HuJ4yasuWimFCQ8yNidEF//u4JRAX49WwypOzLcFi87cBb3ND0LqIwv7Q?=
 =?us-ascii?Q?bpADGA2iw9gCy0qdwgCmuQsFu60Chb+ADvFv3jq2VtkHfHrQXjMiU2psuQMR?=
 =?us-ascii?Q?HGuQ5eEnFTtnv7ElJhDTNSDDCz+nNxNGJ41yf/v3t/Z6JdhyBVXgsVGJiEJK?=
 =?us-ascii?Q?uzXfbeHUVPs3gMiJuuvbiwNTBlLor99Vaf7VrLPPf9dDQqewBgrwsZ1q9a/6?=
 =?us-ascii?Q?QFdrtMvd1hy4dmPtVrgW0yoBWDaGXcXYFL/TG7eAbr7+e9G7JUipDM0fJshd?=
 =?us-ascii?Q?ze9wojNheusZfezdpzYL5aCrpXLFHO5iV59Ivkr827sMJLOgvvey8IUlhvxW?=
 =?us-ascii?Q?JwMzJCwDIWMm3R8svbeyFIZZ1pMgam/rXn1HJS9oVXaJ+nV5OjerCtcKyZty?=
 =?us-ascii?Q?640lUNMev8iyol9pBmC/7xqnSWYw6OWZBFgLh1VNYoBT4T3HPP/hSgTEqUC/?=
 =?us-ascii?Q?mFEruppzv2eI6rjDAXeYeJIpEaFERbd2Hr7xCNjFUO2jdLEw8EPuGsq/9RaR?=
 =?us-ascii?Q?hqQ/Gy9BtwIO8kcGL0qQWknHJpRRq18ctyy/Jnyi6qyQM3sGKPpeKUGyCYYJ?=
 =?us-ascii?Q?PQqDydDfK/aLqLiwmBkhguz5TOQK3/Vua0iMLAsTwRo9i/S0BlFEfsU+yNx8?=
 =?us-ascii?Q?lULah6LNtnqB3d80RCGz9NNKXxp5JdZgyW+TSkjj4sGoJ5gu8bL6nUhWYJ84?=
 =?us-ascii?Q?FvvPuY+BO0EIu4+u7KZ3HRccgLqpRRSTEiGYcAUrYW8M7+U8jDbp/uRYBu/l?=
 =?us-ascii?Q?bZNp5ZSKp+awFNuEpU8hWxKlW49jKHnhEft1DAVJ8IA3jdrRy7mRcDUDk4Vh?=
 =?us-ascii?Q?vS6BnNzOUJgbcNz14P+Utjrghk0CLDpJSqAc5yyR7jxtO7c8dWlEy9EiM5CA?=
 =?us-ascii?Q?LJo8yMv6Dprs2xFiobSW2Q/rN1uov3/WxjpOSSKbCTrCe3bRGu+a/y11MKWd?=
 =?us-ascii?Q?fE9wWM3S/ttTi79AKzds9Uq9xxEqUx1aBLxMqulfeeemVlmmxPMKXjDJUba8?=
 =?us-ascii?Q?8CJZ0Kkyd5xoL6A2OGvWzZODL02lpsYsOvYvVRXQSupntB7zCaqdVO/8JiCO?=
 =?us-ascii?Q?y5C+LaMWUmV5E6En2+ueutiaavjDZ2O5nLzgAv7BsObmu9avxP6sEJZYvbu1?=
 =?us-ascii?Q?LFNAySGdI2oazoAkk5S1ezKhzIUEPFOTwmtvzbwxEzLHePvTOeP1/vB0zQin?=
 =?us-ascii?Q?jlbqMZnefg5VeOG9w5C/jDo5yfrMIT+esMX3fd57?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3509d55d-9cb8-4b12-0235-08de2255c9fb
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8056.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 01:41:39.0186 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EcTm7V/Vu0P49cWsevo0nIpYchzGNEunIfLpKVC6TQoFY4ZW7PhQ/EyQFZoDk2gacD+0rHFgv2wNZOx0khQl4A==
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

These opcodes implement various falcon-related boot operations: reset,
start, wait-for-halt.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/gsp/sequencer.rs | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
index 787db395dd2f..93c8f84e032b 100644
--- a/drivers/gpu/nova-core/gsp/sequencer.rs
+++ b/drivers/gpu/nova-core/gsp/sequencer.rs
@@ -90,6 +90,9 @@ pub(crate) enum GspSeqCmd {
     RegPoll(fw::RegPollPayload),
     DelayUs(fw::DelayUsPayload),
     RegStore(fw::RegStorePayload),
+    CoreReset,
+    CoreStart,
+    CoreWaitForHalt,
 }
 
 impl GspSeqCmd {
@@ -124,6 +127,9 @@ pub(crate) fn new(data: &[u8], dev: &device::Device) -> Result<(Self, usize)> {
                 let size = opcode_size + size_of_val(&payload);
                 (GspSeqCmd::RegStore(payload), size)
             }
+            fw::SeqBufOpcode::CoreReset => (GspSeqCmd::CoreReset, opcode_size),
+            fw::SeqBufOpcode::CoreStart => (GspSeqCmd::CoreStart, opcode_size),
+            fw::SeqBufOpcode::CoreWaitForHalt => (GspSeqCmd::CoreWaitForHalt, opcode_size),
             _ => return Err(EINVAL),
         };
 
@@ -232,6 +238,19 @@ fn run(&self, seq: &GspSequencer<'_>) -> Result {
             GspSeqCmd::RegPoll(cmd) => cmd.run(seq),
             GspSeqCmd::DelayUs(cmd) => cmd.run(seq),
             GspSeqCmd::RegStore(cmd) => cmd.run(seq),
+            GspSeqCmd::CoreReset => {
+                seq.gsp_falcon.reset(seq.bar)?;
+                seq.gsp_falcon.dma_reset(seq.bar);
+                Ok(())
+            }
+            GspSeqCmd::CoreStart => {
+                seq.gsp_falcon.start(seq.bar)?;
+                Ok(())
+            }
+            GspSeqCmd::CoreWaitForHalt => {
+                seq.gsp_falcon.wait_till_halted(seq.bar)?;
+                Ok(())
+            }
         }
     }
 }
-- 
2.34.1

