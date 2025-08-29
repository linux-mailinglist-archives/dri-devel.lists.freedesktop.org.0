Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1030B3C1C8
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 19:33:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3DE710E24E;
	Fri, 29 Aug 2025 17:33:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jwVdOHqG";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2070.outbound.protection.outlook.com [40.107.236.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C8CBC10E1DF;
 Fri, 29 Aug 2025 17:33:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=anAKsx9pJkrnrnD9EqGZA8g5tiDMqO2wIkWb61ReoPFf1Pipx6kLoCbGn0FHXIZcyX5BbIkL0ssLqgIhqUOwiVX874XJ/o2KSZeEJLA1UFMP1XPwJN7j38AVO42b8PHkFIDQ0KvX4mD3v5vRcs2OwdvtZnb2gOCk3CFzl1CBwHHGctOEmjdmZDOVep0yQc0YDRGAoC1eRTxmliiKWoyrcavEGA0AMbSXC8i1FpuaVLSXLx/u4+ojfBERN3i4lcrQ7onMpOwlstC/f2e6IfBrkZXo94LOx7IYiJbKViotFVNeDogT61QfhJGdZIVYv9Jto8OGGtyHGLe5AxiVcKW+cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AEgqIZnQwfBzZrni26xmeTFJqpUFr6TTm4EFhguYAkw=;
 b=KLRu8/8k7uY0e25gCKpDtR3sW6ujHbhi5hp/o+TjTa+pHkdZA8+Hgs6WKLZSQ55y1Kc7/jmr6KeYBOdmckMhBJSJoSq7Ua74Evlmck8lLaVrMV4PvwGeH/Y4Eu3+Fs5nTzbqdQwyAW8jqGFC5vOysHENjASro/akfIzALMqZRuZx1dS5gaTwbLa7okdVWxy0RKA47aa/DsQ+Efmp72kjJHNKPF47uL5OAMK8pJGhV4u5wc1tqWB89239EHG/OQB33pL2Bo0jM5XQJTmY8tMMxnJ7RsQ99btjGVGv8aqJAGco1006tsGcWnKj8OTL96GcknCONqVEOoO7xfeoW39J8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AEgqIZnQwfBzZrni26xmeTFJqpUFr6TTm4EFhguYAkw=;
 b=jwVdOHqG3BI52TRTGty2Q3akVCCQAtOoAPG2JCYb74oDZqmzElbIuj/CvXtgXzORMOppUqqWV6Jqg1Fy4aBCN3V98p6doTqYFWMgT6ftS7JFoVBIwAP88tpIaz0BAt+rVj1TyVvMfRYY1ZsDblfRMbSq7vHP0nT2SMXdUjzHAmYUATjYIhS+KCVc3QGmtHhrdn/4r0eD8dwDkJBiVvk+xASHbsXOElT/4nhUeuyYUhWYjnO1n/KUqco3Gc3EwH6I7xj0pko79L3XydgZrNgMZGb0PO4N/9UsAZfdTL6z9f44gQdOA487NQ5EucN3LKqZU1WUNSztw6G95+97mbQMUA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by IA1PR12MB6017.namprd12.prod.outlook.com (2603:10b6:208:3d7::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.22; Fri, 29 Aug
 2025 17:33:23 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9052.017; Fri, 29 Aug 2025
 17:33:23 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com
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
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: [PATCH 08/17] nova-core: sequencer: Add register opcodes
Date: Fri, 29 Aug 2025 13:32:45 -0400
Message-Id: <20250829173254.2068763-9-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250829173254.2068763-1-joelagnelf@nvidia.com>
References: <20250829173254.2068763-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR05CA0025.namprd05.prod.outlook.com
 (2603:10b6:208:335::6) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|IA1PR12MB6017:EE_
X-MS-Office365-Filtering-Correlation-Id: 946a29f5-76f1-48a3-14ff-08dde722273f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YE9/mOmxI2Gdd1xtbQopdHl4fP7OLnQZlAbg5n5CzrCmTeRXt0gFeW3VxC07?=
 =?us-ascii?Q?dDe5WiOVL0bjuN5Qr4U8o7494b4g6FCK+ZD8xeIVfLygIMC73tO7uLz0AzvE?=
 =?us-ascii?Q?blWS2Lp0MxQgNbTjYqaZNrnDPJnOt5uUK2HXvoVgQBcYwuEALs7tqUchKVwg?=
 =?us-ascii?Q?zuG9y7HuzALkYr9Smh8hX23fou53BuFvd/qrng7bDX5OQdZPg7HX03PaHW4P?=
 =?us-ascii?Q?b/QO4IKiw5LKJq/V5MC/0c568/3opKUBWaIQ/YHyP5z2CX3Lok/yo3RVptxE?=
 =?us-ascii?Q?BV5Gugl8Vjr22OvkGNYSvYipprQApzFP+7/JMiXuN0ieqllua7FOZHSX04RN?=
 =?us-ascii?Q?rdhou5rdpUmuZVGPfotECUtZImTaHJp3nS1G7ntizoGDmataqFMJL39bIWLH?=
 =?us-ascii?Q?jH8ucqig79PGGtfdEaqucx24U2SUFV0uAvV7hP7kou8zBrbci2zqh+/Ia+1s?=
 =?us-ascii?Q?b7w0Y8Sj+XhIZZL7Tb71WUNCSYmX1KeBGfpRg/YuAPHk3+t+R+gqVtM7ff4b?=
 =?us-ascii?Q?bAxyNaCBDZnKhfpG29baY/czL7quSL3cqED2Fwg4whbDyIE7BLZGEL5NxJRZ?=
 =?us-ascii?Q?gXZFYeTn2+ynEoRc6N7UyV3NUEkRwuDgJiwfJQzGhsV9y49F9Wol5glV6NDW?=
 =?us-ascii?Q?2D+n1lK50vghNSjZkbLQPt2UrJOIJLRDVJ6Kizl68iU2FLQkDDYHrH+A/iM6?=
 =?us-ascii?Q?4qkUMH2U169EgW3PJ11DbVh5Os86r7wL7MViEAjWnZ3clpcocM3NCBaE5CuT?=
 =?us-ascii?Q?Zzs7d1FnpzMdMG+kNog7TDnQ7gDdX2UEu9K1SlstmBQNLbQFKmOso91qM7eH?=
 =?us-ascii?Q?Rrb2mfyfqcLvF+nKrJ5VxKsO+LlNP9/1dgBcS+6Deye+/u20vgAMd1ZKkzVm?=
 =?us-ascii?Q?YfneJXK/pJHd5R10Z+BzbyuEO20SPbNX+hEUEG4MLoaYli8LI1a+0EK1lnXY?=
 =?us-ascii?Q?UHw9hlWdUScSU6l4OecO2aAEGQOEnlwNPQKeH1Lkk2IR5oPXVT2RoUIpHOaf?=
 =?us-ascii?Q?yc1KKo7bnCOLvvn5P/moZWmDaFrtOq+8NPEHm47cB/pbttpdhWymt1/T8pCM?=
 =?us-ascii?Q?0MoaRaY6zUaYL0N7SyxLzoY2IxPwyIAxy03RMWbCfW1lABTDF9l+lo9fX0JG?=
 =?us-ascii?Q?/FO7cZvvJ6rTVkHJbzU6dw8nKf7DzLY9n7X+u0xert4CxDF2uWu+uochuC2C?=
 =?us-ascii?Q?1T64+fRZZq1/U4yKwicVP57MYGLAtJee0QjjM5pfSMNY/66Jh/Bg54ELFV0y?=
 =?us-ascii?Q?GIi0ttLZeQi3qD5Pi6n92eoqL/r1mlvjl2qnxq3K/sYX1koNVT5TXkdMLeI4?=
 =?us-ascii?Q?ywhF8ZpkIqaumPjZYuoOkMw7lug6bU1dtpTpKJWxfEPPaGNnNbYAKpaXm/+H?=
 =?us-ascii?Q?nOtbeEqtXUzinkP/R9nTHSLcVeEaiHrhKnnSXxGqmQg/Lrnu5w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zMqXx1aPdVUgMirmdD5LW/9umncMl0KAAqJl2ZVrwMDeBmSeyBlwy/ChKrzM?=
 =?us-ascii?Q?AtcnSKY7G0lxw4iKNCpNaki2UVIkMSa081EhmwhgnZeBSL8gGaILwG0/4oQ7?=
 =?us-ascii?Q?nwnCbtgKnKgD1gF0PIbuI5lgn+SM5CyV0ZZgTxxbYU+wmLGHR8KqcoHCn5Bo?=
 =?us-ascii?Q?N1ftPqvVQI2s8fN1jlYnVPty/rbg8N1GDRnN5nKUBcVfDvmKpCs4bcr3l6k0?=
 =?us-ascii?Q?N9klewgizjSlFtNT9c/1YBpi6VX+x5kD/YOMQJJOrsH3RIXCDkG4hQxBpiSQ?=
 =?us-ascii?Q?r+mGE5zktf3Qka49bv+u6JDbCfS+UQ9f/Yzgp69iGF4IeCXqKQFwxSLXIOxs?=
 =?us-ascii?Q?AQQ0rBdKwZT1RW6rBfnsIAXlO+XkfTv8gmhM/FYQxndYQf7hd53OwGFSrEbs?=
 =?us-ascii?Q?c/hBtFSKGJDkSpPDf15pRMMHTvXvAGw9PvEerTSxZtmuqR0JCV7SM+Zw9phj?=
 =?us-ascii?Q?zG7A1gc1oJhvI5HbBtfCz7un91WXuVr+C6wYEiiKSRFq+gyM6C49h+vm7diz?=
 =?us-ascii?Q?iQ2RwkBwxfVxey2xdBX9q+7ab4p3KQ5feNStB5tjYz3fr3OqhthYBdb2cqbl?=
 =?us-ascii?Q?fwQu9es/4J9d1wNVAwbW0krraXQe+VppV0UeOgvhA+V19z8FXuAGpOtlPAQl?=
 =?us-ascii?Q?DRtwh9YmZgRem7ElrQqp8dUKQmtA6lAW6t0cuL5dLPNgurvO8U8bwUTfNYTt?=
 =?us-ascii?Q?Vk7bde9reGBaOH7VwQueQ1OgSJYvsKs2DAMV0mY/9MSLaQdZCaW76gCSNcD9?=
 =?us-ascii?Q?Ph3U3psoAoJ4UqwdPSc0aOmTCzTmnJllQskyNbhcYVeagMoTwBP/JIdr9dfN?=
 =?us-ascii?Q?4vW2p7+2jydbN/nUbjA1gfex3ErrU+tHM9B9PmaMHFN1VHqDPAEoXEmYeHZ2?=
 =?us-ascii?Q?bjtmCRNl9k5dgGbXHm2NsKyudIctmibbJHWFzgIdFAcAYenAys3oP1wDjozJ?=
 =?us-ascii?Q?K8y9wiFAbWX3AWVBxHJp3SEFK30lDDBezoTPdz0wAYnEdzbf7O8WgTLfnbmQ?=
 =?us-ascii?Q?AJuWRKazw6vKgosjEl/GUVJjfWOPo27j5BxRnqzduz+IRWVGnF+Yn0Ru/EdK?=
 =?us-ascii?Q?tnwNksLKrPODUTWJUPj8A6CAHb2s79m1mQP4U52qZ/IFS2GRI3h3W95Aszg4?=
 =?us-ascii?Q?yD1NARtDOZQqAMWsF/BkReqGMzmJronlREzVyg2xXY/lNzTs9urd70G2j4G+?=
 =?us-ascii?Q?6dB6BFiz76ljd8MIAWBmoIk5l4RAxVUD3+fYOQF+y9KIf4JQA7vLdPjPlt+i?=
 =?us-ascii?Q?4wzzPXUV5U3dz1pxI8somqtum5ZWvdTuWzEu4FCird4jQkI9AjC2dH4n1S3S?=
 =?us-ascii?Q?KFqJhyXQD8I7TdRJOB7BJkTp46ODU33Kabz87nhK5x2iKS53sh32L8rgvZBi?=
 =?us-ascii?Q?QuYL9S3EbJHbmCdYe+HN/d3xBxhUoaICvsfh5omZmvEJNzNkOlexxwsharsY?=
 =?us-ascii?Q?lmUA2Ome9SFlq1YwdHcURYfJB8rDOk+i1JCPucgvSVqQah+iRzrxPESbdi44?=
 =?us-ascii?Q?0xK1bio/P7ki6wR3+DjNc+td/Q/YYcEh7zUoeO2hmaAdUciTYIsmEaRepWoa?=
 =?us-ascii?Q?u95XUWOI2S/OoF3vYrgLfQm2ASoJA+9Tl6OWNwxx?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 946a29f5-76f1-48a3-14ff-08dde722273f
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 17:33:23.1308 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qzS6osLhpDZyphvUFzK8jiFwpgpTuXPJChgB2BLZ6aLOavbgWpyfbo8UuZ4QNUuHVmW1eCaa5LxzZ68ikbOfBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6017
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

These opcodes are used for regiter write, modify, poll and store (save).

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/gsp/sequencer.rs | 127 ++++++++++++++++++++++++-
 1 file changed, 123 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/sequencer.rs b/drivers/gpu/nova-core/gsp/sequencer.rs
index 918c3405b33c..75672ae0a687 100644
--- a/drivers/gpu/nova-core/gsp/sequencer.rs
+++ b/drivers/gpu/nova-core/gsp/sequencer.rs
@@ -13,6 +13,7 @@
 use crate::firmware::Firmware;
 use crate::gsp::cmdq::{GspCmdq, GspMessageFromGsp};
 use crate::nvfw as fw;
+use crate::util::wait_on;
 
 use kernel::transmute::FromBytes;
 use kernel::{dev_dbg, dev_err};
@@ -32,7 +33,6 @@ pub(crate) struct GspSequencerInfo<'a> {
 
 /// GSP Sequencer Command types with payload data
 /// Commands have an opcode and a opcode-dependent struct.
-#[expect(dead_code)]
 pub(crate) enum GspSeqCmd {
     RegWrite(fw::GSP_SEQ_BUF_PAYLOAD_REG_WRITE),
     RegModify(fw::GSP_SEQ_BUF_PAYLOAD_REG_MODIFY),
@@ -44,6 +44,20 @@ impl GspSeqCmd {
     /// Creates a new GspSeqCmd from a firmware GSP_SEQUENCER_BUFFER_CMD
     pub(crate) fn from_fw_cmd(cmd: &fw::GSP_SEQUENCER_BUFFER_CMD) -> Result<Self> {
         match cmd.opCode {
+            // SAFETY: In the below unsafe accesses, we're using the union field
+            //         that corresponds to the opCode
+            fw::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_WRITE => {
+                Ok(GspSeqCmd::RegWrite(unsafe { cmd.payload.regWrite }))
+            }
+            fw::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_MODIFY => {
+                Ok(GspSeqCmd::RegModify(unsafe { cmd.payload.regModify }))
+            }
+            fw::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_POLL => {
+                Ok(GspSeqCmd::RegPoll(unsafe { cmd.payload.regPoll }))
+            }
+            fw::GSP_SEQ_BUF_OPCODE_GSP_SEQ_BUF_OPCODE_REG_STORE => {
+                Ok(GspSeqCmd::RegStore(unsafe { cmd.payload.regStore }))
+            }
             _ => Err(EINVAL),
         }
     }
@@ -63,7 +77,16 @@ pub(crate) fn new(data: &[u8], dev: &device::Device<device::Bound>) -> Result<Se
     /// Get the size of this command in bytes, the command consists of
     /// a 4-byte opcode, and a variable-sized payload.
     pub(crate) fn size_bytes(&self) -> usize {
-        0
+        let opcode_size = size_of::<fw::GSP_SEQ_BUF_OPCODE>();
+        match self {
+            // For commands with payloads, add the payload size in bytes
+            GspSeqCmd::RegWrite(_) => opcode_size + size_of::<fw::GSP_SEQ_BUF_PAYLOAD_REG_WRITE>(),
+            GspSeqCmd::RegModify(_) => {
+                opcode_size + size_of::<fw::GSP_SEQ_BUF_PAYLOAD_REG_MODIFY>()
+            }
+            GspSeqCmd::RegPoll(_) => opcode_size + size_of::<fw::GSP_SEQ_BUF_PAYLOAD_REG_POLL>(),
+            GspSeqCmd::RegStore(_) => opcode_size + size_of::<fw::GSP_SEQ_BUF_PAYLOAD_REG_STORE>(),
+        }
     }
 }
 
@@ -82,12 +105,108 @@ pub(crate) trait GspSeqCmdRunner {
     fn run(&self, sequencer: &GspSequencer<'_>) -> Result;
 }
 
-impl GspSeqCmdRunner for GspSeqCmd {
-    fn run(&self, _seq: &GspSequencer<'_>) -> Result {
+impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_REG_WRITE {
+    fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
+        dev_dbg!(
+            sequencer.dev,
+            "RegWrite: addr=0x{:x}, val=0x{:x}\n",
+            self.addr,
+            self.val
+        );
+        let addr = self.addr as usize;
+        let val = self.val;
+        let _ = sequencer.bar.try_write32(val, addr);
+        Ok(())
+    }
+}
+
+impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_REG_MODIFY {
+    fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
+        dev_dbg!(
+            sequencer.dev,
+            "RegModify: addr=0x{:x}, mask=0x{:x}, val=0x{:x}\n",
+            self.addr,
+            self.mask,
+            self.val
+        );
+
+        let addr = self.addr as usize;
+        if let Ok(temp) = sequencer.bar.try_read32(addr) {
+            let _ = sequencer
+                .bar
+                .try_write32((temp & !self.mask) | self.val, addr);
+        }
         Ok(())
     }
 }
 
+impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_REG_POLL {
+    fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
+        dev_dbg!(
+            sequencer.dev,
+            "RegPoll: addr=0x{:x}, mask=0x{:x}, val=0x{:x}, timeout=0x{:x}, error=0x{:x}\n",
+            self.addr,
+            self.mask,
+            self.val,
+            self.timeout,
+            self.error
+        );
+
+        let addr = self.addr as usize;
+        let mut timeout_us = self.timeout as i64;
+
+        // Default timeout to 4 seconds
+        timeout_us = if timeout_us == 0 { 4000000 } else { timeout_us };
+
+        // First read
+        sequencer.bar.try_read32(addr)?;
+
+        // Poll the requested register with requested timeout.
+        // wait_on() unwraps the closure's Option<R> return value
+        // and returns a Result<R>.
+        wait_on(Delta::from_micros(timeout_us), || {
+            sequencer.bar.try_read32(addr).ok().and_then(|current| {
+                if (current & self.mask) == self.val {
+                    Some(())
+                } else {
+                    None
+                }
+            })
+        })?;
+        Ok(())
+    }
+}
+
+impl GspSeqCmdRunner for fw::GSP_SEQ_BUF_PAYLOAD_REG_STORE {
+    fn run(&self, sequencer: &GspSequencer<'_>) -> Result {
+        let addr = self.addr as usize;
+        let _index = self.index;
+
+        let val = sequencer.bar.try_read32(addr)?;
+
+        dev_dbg!(
+            sequencer.dev,
+            "RegStore: addr=0x{:x}, index=0x{:x}, value={:?}\n",
+            self.addr,
+            self.index,
+            val
+        );
+
+        Ok(())
+    }
+}
+
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
 pub(crate) struct GspSeqIter<'a> {
     cmd_data: &'a [u8],
     current_offset: usize, // Tracking the current position
-- 
2.34.1

