Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 916F3C5F214
	for <lists+dri-devel@lfdr.de>; Fri, 14 Nov 2025 20:56:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6536510EB03;
	Fri, 14 Nov 2025 19:56:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fwCTjisX";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010002.outbound.protection.outlook.com
 [40.93.198.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A2AB10EAF6;
 Fri, 14 Nov 2025 19:56:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jsSx2IMXLrTcy1asGb83BwS3KS4KwsbTCqq3rObGoLZr03qigvxmPOsc0rP2YnDGhlr+6eI7lImUEH2iofO22SakSeNZLagUr6vbyN6CobLLE37zlo64c6OF7czFQ2sdiuSxn/hMgitsbqWSdaV/GJH0GUiOqqoh7M+nuFrE/6XWv/AIeGec3jTxhGejgnAkS6tRqwv2Ld6FJdGfJZKTTvoCNWS5LDPKX/0e3D56BSzQoW1+faiNX9YIANcj6J8RDwI4wtlXxnv/RU1Kmr35DSVqeiXi6eNiVHQ2ly07QVJZKx6U4pXpwyrYKnhf4d6MmPQWjkgb+aDo/o8PegCFFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4QSUWf+e7ZU/3CBSA2q+oaMG0kpwZERQ1aTx5RfD/uA=;
 b=mnzhALApyyBbD+tFvNZiRtgt5OxbmpMuEAhbTIM35BJzfTobiGTnrHi/wEVn0D19X49RzWpIMelez6TO3D5/1B7aWhMrwgsCXI33/xsQUGk84EeC4aU27hwL7eXfxdiRpt06CKMrh9rXgbGQl6z4Sauhik4pUsx4zkI7Yp2IwDAGAsTR0y+UV/g//SG7w2+iFZixEWYpNGaMEA+CHV2EhdTdqBeKphH71MyNEBaD9nrieS/b3M2mELbHgxZUSSl3eUWAabUy1rJHi8pfcdVAVYj2gPwOqE2yvQXqtG9/Edgm+vPAt1nElWNfnJHgTmnnZb8HdHeZ8xtrtuytID/eQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4QSUWf+e7ZU/3CBSA2q+oaMG0kpwZERQ1aTx5RfD/uA=;
 b=fwCTjisXknZ5u4ornc108pn0hjhkCrbV/4fGZgSbTmDKDE4ac9DW5yX+X21bZ9ba+3SexVFH6dKA542pRotumSn4xhB3FiYVTIxmohsUZ9MJb6mf2nBud6bXNbJ+N/BTZYhdVyHuRtijyC8AI2HKw7M3jw3WUfAiKbYz7CXYq3xhFr40WKtySXihEslbwKBChGfyCIjaNd2jNKi3RUjtUf/3m/61kigVUyMELkPHo5cFddxf6twNyztkXzLZE7FJsLULhNYIQeJvzz7RqBQJ3d3bcgHWaynZ0Z5G/bDgwFSqHpFeT0regfQ6wF1RwXURVRjZn8pWjaC8OUQBK19L1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by CY8PR12MB8340.namprd12.prod.outlook.com (2603:10b6:930:7a::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Fri, 14 Nov
 2025 19:56:07 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 19:56:07 +0000
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
Subject: [PATCH v5 06/13] gpu: nova-core: Add bindings required by GSP
 sequencer
Date: Fri, 14 Nov 2025 14:55:45 -0500
Message-Id: <20251114195552.739371-7-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251114195552.739371-1-joelagnelf@nvidia.com>
References: <20251114195552.739371-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0175.namprd13.prod.outlook.com
 (2603:10b6:208:2bd::30) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|CY8PR12MB8340:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b85e929-fca7-4d37-4b38-08de23b7d98b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?w5jF0ug2hZZIb8bXQ4nntx6xC24MIsmWpHLJ7tU4Zkkyn1uB/UMeF9M2W5pH?=
 =?us-ascii?Q?sR/olNiRDF74hQQ/6oUUFrPFyc4sB0UoGKpnCB+Sy0NqID/pF5dUavnNzHVc?=
 =?us-ascii?Q?mXNWaSDp8jmqRfqAvhcH8eH6EaBWtob3kqpm+sKS6PCzjcWcq6sddb7lLHiH?=
 =?us-ascii?Q?Hk+eYYiXUFcBnwVLgcMOtWVWdDmi9vQM8nqWnfFwis3sEipFgfD6NNyd9/2d?=
 =?us-ascii?Q?t+Xcd5wf4ICUkL+dcLvRJz8lTVYRd1AkwZj83FLcdZ61Q20q30l+dDBbP79a?=
 =?us-ascii?Q?CuqJ6KSv66viQ4sliI6dSzpFJP6ohJBWtuG8m3U9BecdmCqsH3k7QLgFtIy6?=
 =?us-ascii?Q?o37EvB2exiOmbYuh1EHG1lUzTwTaZiWSd7M3ufNQwWucVgQgvOr0T8fa/GOF?=
 =?us-ascii?Q?nVRmn0Y4QEo3XDD5G93rkeNFBQdztF6Ifp38RZvwlXOCOIBe7LEgAl43WRmQ?=
 =?us-ascii?Q?W7bw34ORX0lXumKxiGiowZTRXTtEPTqbn9r9SthPAiSkZqsyuCw3xFeDCG2k?=
 =?us-ascii?Q?5K+0JRWVh+jUVluttxpmawUP+aD2P1002sQfqf1IjSHoJ1C09IRo/FleBqDD?=
 =?us-ascii?Q?zmDHzzV2ro+8EoBMuiibUrcEo1M4FEE2n4ZItQQwj69BFq10qt/BR2OvgDGZ?=
 =?us-ascii?Q?iddfttyDcdlq2MCkTyRubMkr2UCKfncU9FO7R2W2a4KtB2ShdhdyeLlVJ2cX?=
 =?us-ascii?Q?2pX81YFLrAItWMt0B4CCGkp/kwV5XGF5Z03/kz0yUvtD9AMai0c74uN7vwQS?=
 =?us-ascii?Q?Krb2X7W4ySF83i1YLFcjFeGTYYyOvmhycDT8QWAPAkDNm+CVd5quAwcERXaP?=
 =?us-ascii?Q?9RPv1eohzc+43mtb51ZdIhb3sHUYaL0dHE8tvNm4rCWiRbo78GccVN/1IEuv?=
 =?us-ascii?Q?8d49d9RXtSsfVuuHayaFmdUqEs/epkYPgJFFWsZwnOsqHNP3lSjrbBVntqOY?=
 =?us-ascii?Q?fnQOU73NaEkddq1vpgy71GWntT1nzs0eXMWk/0twMmfyZpusv0d508E7KlTQ?=
 =?us-ascii?Q?JPppsBGd2kuPaC/X26VSjHNuXgEYACNKE/VNtuxfrxLlKroThO3x/IC6dXJf?=
 =?us-ascii?Q?Xflm7wOopCCK0UTLXJ9bo62JSyDU9Lp6QJGER0aQcnsAF6OoBc28zhMByYeB?=
 =?us-ascii?Q?uggU7bPzvCqe55CwqvAiQ0Uyx+3hHBvo3TRQchuFXlA1iOc12Rkou2AMmNJM?=
 =?us-ascii?Q?lj5hD79qGRM24ungjPaQo/xiqDQYiaT8OAIUzxaMcAKir2819qgY2QRcaFHv?=
 =?us-ascii?Q?hMRr99J0uJz7eX6Mz20kGMlr07vUCuv6awi4pCRXKzv8axGHwfjtpeqQWTv3?=
 =?us-ascii?Q?X8yDPMCbYJB9u8yoFkcXM+FzamlIggbm0287cN5BSr7nSoAm4uqCU7FwrSRs?=
 =?us-ascii?Q?W88nhBr0rWGEJIJqsDMBqdF+LNPXK9rtB/YWlGg0tmgQIPk5XW1LD4FXSo+M?=
 =?us-ascii?Q?ZhaGyayxpfDnnqLgjry01ZHUyb8GbNMM?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9KqHqPKzWDqrcksiyFN58Hjhp3A/6LxMnXMA41TXygIHRtIZDNdLVbWO+pbl?=
 =?us-ascii?Q?aLnLdGmOawwaNU7QX0MDaG9B7pVumFnqLpB3giXqhGdqty50MDIIgREWDftb?=
 =?us-ascii?Q?ZB7RGuWpc1K/56vgADdLXTg5BpvR+1Yf1oZ6a0ea8kEIuPjtTBB3Wrv24/Fc?=
 =?us-ascii?Q?yaTNCRW8wet64FZpXul79qX5w19kgJzvebhd9kw9Zw4uLUJn4mpFj+ubTk+i?=
 =?us-ascii?Q?pkJ8hluOvyvg18WJiPBXgT+zjUWv9dCHaNLvSVR0iLz4zpJEOy5VYcnbGv74?=
 =?us-ascii?Q?kHcTED6Timl3p1cEx9GSaIbSjXbR2kr80m4E3MhWspqVi2f1Sf0WptaQ2j4l?=
 =?us-ascii?Q?SLsWh6NEO7OrZbTQfTGQfMTlIIm8t8WrXkslcmc9R1ZBfjwSzNZ13TSbvEeJ?=
 =?us-ascii?Q?5CIFKFYJfHdN95r4tNU6Z3M4zZApggop91DuaaBgYpLr37robpD7WpxrbIqZ?=
 =?us-ascii?Q?a+57VeRzfyWWD+EyciTsFOdJWpQqSbiTNShpPY5W7bdGb0svsczTo8bZmcfA?=
 =?us-ascii?Q?Q2uKw4ELUUZl+TeB9g4XBwBW9JHuZCy5bBHZ/57c0G/0gD5mvMSyC5A8BN6H?=
 =?us-ascii?Q?nJf45Ut6Hsu4+g/tkCy1qa7pXxyARvj6K9sDlQ1DQqrIMOd7fw6HYFYuVglO?=
 =?us-ascii?Q?phF993VtJMKOtbiCOExPwLJGzjSkPfEEMeruCvd7JhBLzyuSoKxwFzfftonB?=
 =?us-ascii?Q?h0XukTXCtTKrmxy6vaVSmPFNiSrdUkzMZM+fyN4c2r1lW78j+6lXMyC9Krhx?=
 =?us-ascii?Q?DL3qkaJ+JRsbCOYKcvds08z9XWnlprD5nRaRThuiiKJv9oSSsZ6TN23pCWsK?=
 =?us-ascii?Q?1s+PqBRV+7B4lcHHBrHMfloozvOLXnmvsW0iD67lJrS7CfKogV3ANC4QUkg6?=
 =?us-ascii?Q?c3VOPUZwv8A5w5b8Y/7UQnRxs2YjXmcdQEnYmvwdKvFO5fCezmXkC5TogEsR?=
 =?us-ascii?Q?zlFuuI5iD5wWNBFnihLui3MpahhXRAI6n17NXqOArw3QdrbxJ2F27cv6JMpn?=
 =?us-ascii?Q?2ccGvD4BX64WcZb/b2kc4Rn5dTYs5Zc5U6nf64lq8e25IEkieERpCItoKbK6?=
 =?us-ascii?Q?GtFE3349OG5QA6cPvidgk2gxKEXp8LXyinfYif4kU9pSvqrvtfgDKZCEzw5G?=
 =?us-ascii?Q?/+Gt3KkBTBm8De9AosX7Jxn7MmsWUzm81U3k96ox0H9gOtOzf/NExqpdeprG?=
 =?us-ascii?Q?ITeL0nvcWTjAdGDV/xEJd84SFGKcZq3kl7x0Ubc2Zap1nn9gHru5CB4YR8Xp?=
 =?us-ascii?Q?4Lyu9H6w+I1IOPO+oKK1U0QB0OP2lgiyOpifM7ixt6mGhpFYmQe9ygSoXPjP?=
 =?us-ascii?Q?hemXYwpOupUecvVr0JmwFV0JDPc24HMD4ozidvUY7mMoxNbLmqRjDLj/+WLn?=
 =?us-ascii?Q?YJQvmUGMCH9ElkyJXWX9G4fybjmAt6bVoYYEeYu1anZWoyl1DwT0C3pPiRrz?=
 =?us-ascii?Q?ZKa8eKNPELH6iRQMrloMLJVw2t0T1OB5ANQft5kWlHJWPl5cM2DmZLkM0a0c?=
 =?us-ascii?Q?/Wo4YuE5iyT8FV0f112AJiMOhdnpBLWCOOg5+gcUvtCgR0dYgIxQbsFcTIhY?=
 =?us-ascii?Q?GF2coa7fkGtL8uHWOP3dHjwW5YyrEgh22pMJDR8K?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b85e929-fca7-4d37-4b38-08de23b7d98b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 19:56:07.0706 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kU+ObvQ6fkSqaZvYGnpkjBdqcQgb3jDfQPniSNnCajlVfLnRX/VMfVYA8jA2JXorLUH5h+FRpbktigGs/9t2BQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8340
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
Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw.rs               | 325 +++++++++++++++++-
 .../gpu/nova-core/gsp/fw/r570_144/bindings.rs |  85 +++++
 2 files changed, 409 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index cacdfb2d4810..69c5996742f3 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -312,6 +312,329 @@ fn from(value: MsgFunction) -> Self {
     }
 }
 
+/// Sequencer buffer opcode for GSP sequencer commands.
+#[derive(Copy, Clone, Debug, PartialEq)]
+#[repr(u32)]
+pub(crate) enum SeqBufOpcode {
+    // Core operation opcodes
+    CoreReset = r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_RESET,
+    CoreResume = r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_RESUME,
+    CoreStart = r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_START,
+    CoreWaitForHalt = r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_WAIT_FOR_HALT,
+
+    // Delay opcode
+    DelayUs = r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_DELAY_US,
+
+    // Register operation opcodes
+    RegModify = r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_MODIFY,
+    RegPoll = r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_POLL,
+    RegStore = r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_STORE,
+    RegWrite = r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_WRITE,
+}
+
+impl fmt::Display for SeqBufOpcode {
+    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
+        match self {
+            SeqBufOpcode::CoreReset => write!(f, "CORE_RESET"),
+            SeqBufOpcode::CoreResume => write!(f, "CORE_RESUME"),
+            SeqBufOpcode::CoreStart => write!(f, "CORE_START"),
+            SeqBufOpcode::CoreWaitForHalt => write!(f, "CORE_WAIT_FOR_HALT"),
+            SeqBufOpcode::DelayUs => write!(f, "DELAY_US"),
+            SeqBufOpcode::RegModify => write!(f, "REG_MODIFY"),
+            SeqBufOpcode::RegPoll => write!(f, "REG_POLL"),
+            SeqBufOpcode::RegStore => write!(f, "REG_STORE"),
+            SeqBufOpcode::RegWrite => write!(f, "REG_WRITE"),
+        }
+    }
+}
+
+impl TryFrom<u32> for SeqBufOpcode {
+    type Error = kernel::error::Error;
+
+    fn try_from(value: u32) -> Result<SeqBufOpcode> {
+        match value {
+            r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_RESET => {
+                Ok(SeqBufOpcode::CoreReset)
+            }
+            r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_RESUME => {
+                Ok(SeqBufOpcode::CoreResume)
+            }
+            r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_START => {
+                Ok(SeqBufOpcode::CoreStart)
+            }
+            r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_CORE_WAIT_FOR_HALT => {
+                Ok(SeqBufOpcode::CoreWaitForHalt)
+            }
+            r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_DELAY_US => Ok(SeqBufOpcode::DelayUs),
+            r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_MODIFY => {
+                Ok(SeqBufOpcode::RegModify)
+            }
+            r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_POLL => Ok(SeqBufOpcode::RegPoll),
+            r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_STORE => Ok(SeqBufOpcode::RegStore),
+            r570_144::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_WRITE => Ok(SeqBufOpcode::RegWrite),
+            _ => Err(EINVAL),
+        }
+    }
+}
+
+impl From<SeqBufOpcode> for u32 {
+    fn from(value: SeqBufOpcode) -> Self {
+        // CAST: `SeqBufOpcode` is `repr(u32)` and can thus be cast losslessly.
+        value as u32
+    }
+}
+
+/// Wrapper for GSP sequencer register write payload.
+#[repr(transparent)]
+#[derive(Copy, Clone)]
+pub(crate) struct RegWritePayload(r570_144::GSP_SEQ_BUF_PAYLOAD_REG_WRITE);
+
+#[expect(unused)]
+impl RegWritePayload {
+    /// Returns the register address.
+    pub(crate) fn addr(&self) -> u32 {
+        self.0.addr
+    }
+
+    /// Returns the value to write.
+    pub(crate) fn val(&self) -> u32 {
+        self.0.val
+    }
+}
+
+// SAFETY: This struct only contains integer types for which all bit patterns are valid.
+unsafe impl FromBytes for RegWritePayload {}
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for RegWritePayload {}
+
+/// Wrapper for GSP sequencer register modify payload.
+#[repr(transparent)]
+#[derive(Copy, Clone)]
+pub(crate) struct RegModifyPayload(r570_144::GSP_SEQ_BUF_PAYLOAD_REG_MODIFY);
+
+#[expect(unused)]
+impl RegModifyPayload {
+    /// Returns the register address.
+    pub(crate) fn addr(&self) -> u32 {
+        self.0.addr
+    }
+
+    /// Returns the mask to apply.
+    pub(crate) fn mask(&self) -> u32 {
+        self.0.mask
+    }
+
+    /// Returns the value to write.
+    pub(crate) fn val(&self) -> u32 {
+        self.0.val
+    }
+}
+
+// SAFETY: This struct only contains integer types for which all bit patterns are valid.
+unsafe impl FromBytes for RegModifyPayload {}
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for RegModifyPayload {}
+
+/// Wrapper for GSP sequencer register poll payload.
+#[repr(transparent)]
+#[derive(Copy, Clone)]
+pub(crate) struct RegPollPayload(r570_144::GSP_SEQ_BUF_PAYLOAD_REG_POLL);
+
+#[expect(unused)]
+impl RegPollPayload {
+    /// Returns the register address.
+    pub(crate) fn addr(&self) -> u32 {
+        self.0.addr
+    }
+
+    /// Returns the mask to apply.
+    pub(crate) fn mask(&self) -> u32 {
+        self.0.mask
+    }
+
+    /// Returns the expected value.
+    pub(crate) fn val(&self) -> u32 {
+        self.0.val
+    }
+
+    /// Returns the timeout in microseconds.
+    pub(crate) fn timeout(&self) -> u32 {
+        self.0.timeout
+    }
+}
+
+// SAFETY: This struct only contains integer types for which all bit patterns are valid.
+unsafe impl FromBytes for RegPollPayload {}
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for RegPollPayload {}
+
+/// Wrapper for GSP sequencer delay payload.
+#[repr(transparent)]
+#[derive(Copy, Clone)]
+pub(crate) struct DelayUsPayload(r570_144::GSP_SEQ_BUF_PAYLOAD_DELAY_US);
+
+#[expect(unused)]
+impl DelayUsPayload {
+    /// Returns the delay value in microseconds.
+    pub(crate) fn val(&self) -> u32 {
+        self.0.val
+    }
+}
+
+// SAFETY: This struct only contains integer types for which all bit patterns are valid.
+unsafe impl FromBytes for DelayUsPayload {}
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for DelayUsPayload {}
+
+/// Wrapper for GSP sequencer register store payload.
+#[repr(transparent)]
+#[derive(Copy, Clone)]
+pub(crate) struct RegStorePayload(r570_144::GSP_SEQ_BUF_PAYLOAD_REG_STORE);
+
+#[expect(unused)]
+impl RegStorePayload {
+    /// Returns the register address.
+    pub(crate) fn addr(&self) -> u32 {
+        self.0.addr
+    }
+
+    /// Returns the storage index.
+    pub(crate) fn index(&self) -> u32 {
+        self.0.index
+    }
+}
+
+// SAFETY: This struct only contains integer types for which all bit patterns are valid.
+unsafe impl FromBytes for RegStorePayload {}
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for RegStorePayload {}
+
+/// Wrapper for GSP sequencer buffer command.
+#[repr(transparent)]
+pub(crate) struct SequencerBufferCmd(r570_144::GSP_SEQUENCER_BUFFER_CMD);
+
+#[expect(unused)]
+impl SequencerBufferCmd {
+    /// Returns the opcode as a `SeqBufOpcode` enum, or error if invalid.
+    pub(crate) fn opcode(&self) -> Result<SeqBufOpcode> {
+        self.0.opCode.try_into()
+    }
+
+    /// Returns the register write payload by value.
+    ///
+    /// Returns an error if the opcode is not `SeqBufOpcode::RegWrite`.
+    pub(crate) fn reg_write_payload(&self) -> Result<RegWritePayload> {
+        if self.opcode()? != SeqBufOpcode::RegWrite {
+            return Err(EINVAL);
+        }
+        // SAFETY: Opcode is verified to be `RegWrite`, so union contains valid `RegWritePayload`.
+        let payload_bytes = unsafe {
+            core::slice::from_raw_parts(
+                core::ptr::addr_of!(self.0.payload.regWrite).cast::<u8>(),
+                core::mem::size_of::<RegWritePayload>(),
+            )
+        };
+        Ok(*RegWritePayload::from_bytes(payload_bytes).ok_or(EINVAL)?)
+    }
+
+    /// Returns the register modify payload by value.
+    ///
+    /// Returns an error if the opcode is not `SeqBufOpcode::RegModify`.
+    pub(crate) fn reg_modify_payload(&self) -> Result<RegModifyPayload> {
+        if self.opcode()? != SeqBufOpcode::RegModify {
+            return Err(EINVAL);
+        }
+        // SAFETY: Opcode is verified to be `RegModify`, so union contains valid `RegModifyPayload`.
+        let payload_bytes = unsafe {
+            core::slice::from_raw_parts(
+                core::ptr::addr_of!(self.0.payload.regModify).cast::<u8>(),
+                core::mem::size_of::<RegModifyPayload>(),
+            )
+        };
+        Ok(*RegModifyPayload::from_bytes(payload_bytes).ok_or(EINVAL)?)
+    }
+
+    /// Returns the register poll payload by value.
+    ///
+    /// Returns an error if the opcode is not `SeqBufOpcode::RegPoll`.
+    pub(crate) fn reg_poll_payload(&self) -> Result<RegPollPayload> {
+        if self.opcode()? != SeqBufOpcode::RegPoll {
+            return Err(EINVAL);
+        }
+        // SAFETY: Opcode is verified to be `RegPoll`, so union contains valid `RegPollPayload`.
+        let payload_bytes = unsafe {
+            core::slice::from_raw_parts(
+                core::ptr::addr_of!(self.0.payload.regPoll).cast::<u8>(),
+                core::mem::size_of::<RegPollPayload>(),
+            )
+        };
+        Ok(*RegPollPayload::from_bytes(payload_bytes).ok_or(EINVAL)?)
+    }
+
+    /// Returns the delay payload by value.
+    ///
+    /// Returns an error if the opcode is not `SeqBufOpcode::DelayUs`.
+    pub(crate) fn delay_us_payload(&self) -> Result<DelayUsPayload> {
+        if self.opcode()? != SeqBufOpcode::DelayUs {
+            return Err(EINVAL);
+        }
+        // SAFETY: Opcode is verified to be `DelayUs`, so union contains valid `DelayUsPayload`.
+        let payload_bytes = unsafe {
+            core::slice::from_raw_parts(
+                core::ptr::addr_of!(self.0.payload.delayUs).cast::<u8>(),
+                core::mem::size_of::<DelayUsPayload>(),
+            )
+        };
+        Ok(*DelayUsPayload::from_bytes(payload_bytes).ok_or(EINVAL)?)
+    }
+
+    /// Returns the register store payload by value.
+    ///
+    /// Returns an error if the opcode is not `SeqBufOpcode::RegStore`.
+    pub(crate) fn reg_store_payload(&self) -> Result<RegStorePayload> {
+        if self.opcode()? != SeqBufOpcode::RegStore {
+            return Err(EINVAL);
+        }
+        // SAFETY: Opcode is verified to be `RegStore`, so union contains valid `RegStorePayload`.
+        let payload_bytes = unsafe {
+            core::slice::from_raw_parts(
+                core::ptr::addr_of!(self.0.payload.regStore).cast::<u8>(),
+                core::mem::size_of::<RegStorePayload>(),
+            )
+        };
+        Ok(*RegStorePayload::from_bytes(payload_bytes).ok_or(EINVAL)?)
+    }
+}
+
+// SAFETY: This struct only contains integer types for which all bit patterns are valid.
+unsafe impl FromBytes for SequencerBufferCmd {}
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for SequencerBufferCmd {}
+
+/// Wrapper for GSP run CPU sequencer RPC.
+#[repr(transparent)]
+pub(crate) struct RunCpuSequencer(r570_144::rpc_run_cpu_sequencer_v17_00);
+
+#[expect(unused)]
+impl RunCpuSequencer {
+    /// Returns the command index.
+    pub(crate) fn cmd_index(&self) -> u32 {
+        self.0.cmdIndex
+    }
+}
+
+// SAFETY: This struct only contains integer types for which all bit patterns are valid.
+unsafe impl FromBytes for RunCpuSequencer {}
+
+// SAFETY: Padding is explicit and will not contain uninitialized data.
+unsafe impl AsBytes for RunCpuSequencer {}
+
 /// Struct containing the arguments required to pass a memory buffer to the GSP
 /// for use during initialisation.
 ///
@@ -566,7 +889,7 @@ pub(crate) fn element_count(&self) -> u32 {
     }
 }
 
-// SAFETY: Padding is explicit and does not contain uninitialized data.
+// SAFETY: Padding is explicit and will not contain uninitialized data.
 unsafe impl AsBytes for GspMsgElement {}
 
 // SAFETY: This struct only contains integer types for which all bit patterns
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

