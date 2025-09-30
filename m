Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A887BAD3D4
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 16:46:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 842D210E5EB;
	Tue, 30 Sep 2025 14:46:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Zx4xVQst";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010028.outbound.protection.outlook.com [52.101.56.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5B0710E5EA;
 Tue, 30 Sep 2025 14:46:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aQ2fYQyLCVCiobOnPVfDhZNx0rh3frdBEW+ut3pW6d5KWmltBLPUsPVM9Z6MmNt3vbEC7efzf02JVZllMz0eDHE+gJ4VW8/W7vW1xCo5Asp64XFYyF37H4deXXpgyvy0wenq5W2kE3c/aQ3KR517idaefPFiNDlf9RPSCN+cgOFje8fk8h/Hz9zKewCI9pp2tV4ThuzgUdfBmfqrsKd/3j4PYftU7z3FFm4SYF172OqxURpxbJM61AdrwPk/SFKTyYCfj/NAQ/w5IzJsm+IGewEDPMDCN7u5E1mmygPVsg7oDQ3XsHKXAUs5H0odPaC5REkJ2wVl2Kj7wviQ/48UVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dRnfEF0Y1E5DmLHmOyl2YB4+Y9e+RU7O4WX35Zj7DKw=;
 b=tNYxb9PBY3Gd1U4K00mogen/fxN0CcXE4wohfic/K6FpIbos87oETFhYRDL7apGWQjmhr2Tg0IzOZErZFnN850ZnMG+ZglL08X3YjYsgoQpq6oGSKyYhSyi7YGLlW83Y6bcqh2ya08XOZTIbhnaev3bJtcMLAbaEb1RZX9IOoVuEeGQLY/b2qlUJuJkuR+UlCIcOnt1TUFw2CtjcKtGNOEKQQGdIiMPG1UgqokPzINJXJoBAcvYU35PqFWZf74oK6E8UVaM6F91DMx/F4UBlIF/BmjaXgTBs844ro76pgIcgcoj+/sxY5oQa2eAK4BL7HzDlwrb1mIx790GKAimdRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dRnfEF0Y1E5DmLHmOyl2YB4+Y9e+RU7O4WX35Zj7DKw=;
 b=Zx4xVQstQg/KnRnVIb87BqofdfmtUOmM7m/q//inZCYvXhuBIJwFqpWgndonXkXBQgHIWWopoVo/zUDw8148wjBrY5I6UA7fcErLSOMJt5HQdI3Eo0kHtVNqvLqjOZfah7QkyOu4OAahJ2rEGnGUJvBiGWiQIx+0NaXIWfs8JDiyPIspARMwTgs3W0YZAdUNcb4QZOxyTMS2pnhEg2BFhkkEdtlzvx6HXCHHalw+/Lmy4h7Gm9Au8bFBYFbrmPEEav7yCwOAnoHkCobupJpcPTg/R79x6w3mIXUZzq5wrqJxeQMiQ32UnxVZtDFb28CWUMvQ0TGMX1YgVqnpPORlqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DM4PR12MB8475.namprd12.prod.outlook.com (2603:10b6:8:190::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 14:45:57 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 14:45:57 +0000
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
 Elle Rhumsaa <elle@weathered-steel.dev>, Yury Norov <yury.norov@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, nouveau@lists.freedesktop.org
Subject: [PATCH v5 6/9] rust: bitfield: Add KUNIT tests for bitfield
Date: Tue, 30 Sep 2025 10:45:34 -0400
Message-Id: <20250930144537.3559207-7-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930144537.3559207-1-joelagnelf@nvidia.com>
References: <20250930144537.3559207-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0238.namprd03.prod.outlook.com
 (2603:10b6:408:f8::33) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DM4PR12MB8475:EE_
X-MS-Office365-Filtering-Correlation-Id: 3e0e96b5-eee1-4bc5-2d2d-08de003010a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6czfpQiaWfG+cVdrSOEKuKueXDVScD9haYyEOz2Xf+YKfXqzImmfrlXRaMu2?=
 =?us-ascii?Q?b+S/Dt7RPllbD/TK1/dwNgnHJZZCSxMXbuIFT2xiZ4JeSjfNAfBKvAgERdGs?=
 =?us-ascii?Q?/xfT62TlMREtNzZ/UpmL7f4Pvwj10NhoVrBjGZa4cR/L13yVFRVE7Ta0C05Y?=
 =?us-ascii?Q?q2HmneGBjW5hhvxMH0fkuZC85Bfp2QbgqMt2Hesl2YAnWyHzVLBTiLyX4+qF?=
 =?us-ascii?Q?dYOioU6r/BKYPBOs41byE3HCmDCtTfGCkAvSa+2iuEN/M9VyfsZDW6GsDgqD?=
 =?us-ascii?Q?9rsx726h8i2VznutzMxVRM2nWsn1sDk9TkAPhlm68TDW8CeE9f0WCoQq19Ku?=
 =?us-ascii?Q?4F1qQUZNmw10jq9ckaP1JWBSMQpLvOIqIk3lVqV0H1e96qAtV0Hv067GeR+Z?=
 =?us-ascii?Q?jZWAt6t97QFCGtNesJtNY5LC1/a+ma7u78tdB4K3zoIFKrSfR5aiH6TxSHAj?=
 =?us-ascii?Q?teZKUt/F5k5bd+UbgoxoTEwjGfdNCPCRirnjgiQHeXIy0eEUIThSsT3fjEsL?=
 =?us-ascii?Q?VH2YVThsgQ4/nDX4828xENBu4hnqn3znFvobZqfdmYmTt02V7beT05H3V8oz?=
 =?us-ascii?Q?uW1BacYvR9wtucfoAg6+pEHd1CLW1pxXD/7ThA/NYedqgv2AsD4zTP0rlPXF?=
 =?us-ascii?Q?hg69HHJS6bD1VSZjaqZYTG2tBKHCFkVfRNGdzrc/WYuhKiIslMw7ARCh5uwD?=
 =?us-ascii?Q?WiUYwqVIPVSnv/jOeVMkzgpAkGXdPn4gIklVpIVJRVY0ksUN+8culrl4PvCF?=
 =?us-ascii?Q?HIL/XJgpAwwp0gShlZy5EtWPbfhcv5GyPAsurQTxDwJgPCRPRm5E8q6bZJ1v?=
 =?us-ascii?Q?hPZeexhZPTpNynO4066uVRS46B6ezasBrq5bUM/gX6xIVDPZg4aqKEUQfESh?=
 =?us-ascii?Q?CZRILJTrp/U6vuSCZcnhNUCYeGiyZpOAJGtMmjh+S0Y+YdIBtSiEpsS0OPgh?=
 =?us-ascii?Q?0SJYQhcqk6InqoxDxewkE0bMCfs3TwUjAtQK33HAHj7VoVFreq0A3POC5dWC?=
 =?us-ascii?Q?l+3ohcg7Srwb88owVQdk7dUB75/HpcH1bhxt+ZJMq5FjwfaEeXucfNOXMqV1?=
 =?us-ascii?Q?M2IFYugvaEDFcBQY4XLnhRK0rxMI13whNFOIjpGTdFOhvqW2p9+65vpgZaxC?=
 =?us-ascii?Q?GClEzI0Fk3dD+A7IU/i/lVLNb25InjZf9r+qc+ah+W8nHM2NqTjZGzSVdt6p?=
 =?us-ascii?Q?+vGfKOwFScFcUMHPsMtlyJFzssJ26WkJ5jiq4HcHX5LWDdRdzR3qZgT2sR9E?=
 =?us-ascii?Q?ZneEtX6/IE/5CkU+kvEXTA8RScWvxMYuBHtaxNQYuMTRiOkjzywX6w5NcV4x?=
 =?us-ascii?Q?Vsnb0+A837E0uc6HaAl2gWzEnaCKiOZ2yJr6Px0bRW84IgD5ccwx7T7lWbhA?=
 =?us-ascii?Q?k3Yenz9oeoMZ9XjGMzdRzJc77W7gBqhG9hTuDAj+utPo4XTGDKWjdTLOs0h3?=
 =?us-ascii?Q?2bH/C6CmvzVMR1gh15ttUa8ydDq2AgHe?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?L8dfjLVxfcotjj//AVGyDe0N1GvpKOqstq6CWk1ATafEhNqPWdQkpHZh6mJQ?=
 =?us-ascii?Q?fyFibAJTdWZzN0m9Vo20YyXz6kKciaBQiEvUMCH4KoDqHiHC8EieA1ybDcjs?=
 =?us-ascii?Q?lxFos5y7gQNOjVnFEKU1r/7Y+GbG6nIGJbnwYwUHo2ufikkE+gvfsvyO5Hq0?=
 =?us-ascii?Q?WAE0IX+ZZE6VmmDjaDqLKrnPnm386NaMZVrKqfMBBw39xjznHWbQClrhfh4p?=
 =?us-ascii?Q?YLD4G4bX9jcQQTLHzSHw9QI765HSwJY8XRwrAaxrRyi6j25ZEam2JCDQdOno?=
 =?us-ascii?Q?FTyWnSslAnFFMGzNJOHVtPvTLLlA4Y6JebRIPatDpmp8vS6EUTPaKZ/kh+RS?=
 =?us-ascii?Q?GTIpAIATMauy4mliNrNSxCkh40n6aZ8rfZngKas6VXEqz9JWUrZiA+N19To3?=
 =?us-ascii?Q?TBfI1goq5yBUNVUvdXC2spYhBkA66yMBcZELZ7h9Mn7q9blb2Hy8iCFdfR9t?=
 =?us-ascii?Q?BkrWb+c9UNxC+4ZfcnjXAXk5U3Sv6lEJgsM7KAOfHtpiT5OGNOVPc33Dq0AG?=
 =?us-ascii?Q?Ecq8laRV3MtMGNgykR/F2anqcFE4YN59zJ302qh+E+hly8b7Ra/lTBHYwFDB?=
 =?us-ascii?Q?GMMpoSUUYNuJ1wAMpmajZf+LATe7CSx1nVye6p2ahlA0rDrowSvHW5U4jOzy?=
 =?us-ascii?Q?kSJwu2yerrBD0Xebn+e3+p2fea09lMzhY2Zouw/3vgjs5nC0dXWreXxIaVVm?=
 =?us-ascii?Q?ulU8/eDmjh7/AKfs63JmuaRPCNiMTj6RxmWIxq1CApXOEv5nME8Q/+n6sNq/?=
 =?us-ascii?Q?2hr01gOlS7FyRmT234ZpFKoLHLMP9LIcpmTUss1Jdl5ZrW+mcN2V6rRz5CHj?=
 =?us-ascii?Q?Kvk1aLKqIz2f95HZeXZPIFotGI8QfWf6zW2hB3jrnMgj3vC9SvzDNd9DuCYG?=
 =?us-ascii?Q?zo7FeRAsuUztrcuvqYMY0T3EQB8HyHEhODfuR+qiUEcfOxpFs1uTDbTK/Ald?=
 =?us-ascii?Q?21/c02DKdqC0/XoFWP9p286fq+CxeUy0xSKQQFAAgk8rtOhFI0KDFMZ7YH0z?=
 =?us-ascii?Q?kMuVaTFPIljIvqXRatHOpXD3lceR/ezlKoSGoYSd90Qqz1mP8Q+R1uVW9mKg?=
 =?us-ascii?Q?Ioa309xkYLBCH0MF7HTCWHY9hOZ+d89ViepHbytPAMgBHnnc3gWEeGlnU2A1?=
 =?us-ascii?Q?nDlrCjQJbYeiU20SZPJKg5XPZIvrJcpCarTdiZ0UNIIA0xmx9FW+ac8xniu5?=
 =?us-ascii?Q?DrUwwi1es3kmbtj3oORQiY3IYDeR3CQjL4yOu8OFweKiYdHAhvkXFCSQvgKU?=
 =?us-ascii?Q?7QmL2RaByHKlzazs9uKR2S5eE0Rr5NOuYxaPW2aQ6KxH+y4P/WfyLlipHD4L?=
 =?us-ascii?Q?iyCg638HSdCUaUtjrOQ+opVro6J1kqVHHpavzGIhAsVTrkR9DPV+uP8j7Gzm?=
 =?us-ascii?Q?a5TLImmjNZabpKo4GtBuH824qLNnrmTdSe02pVMBoAnaREHJsY9VxpQ8XBHj?=
 =?us-ascii?Q?830izFTf8McG0NDfED2NJveDeBx9NYk+suff0Z+9LnD3PCyXgDQGVCM+Irku?=
 =?us-ascii?Q?phK60HYwqQ1P0s/7h1lj8qye2INFY3oHnZuRVedWGxa0g5dIIXi9BcvCTxC1?=
 =?us-ascii?Q?uczDAp+zdwThQgKfHsGU75z98p8dE9DNAWod86ui?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3e0e96b5-eee1-4bc5-2d2d-08de003010a4
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 14:45:57.2416 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CTAovTPLpE8dLu2UB/IP4nEG3Czj6W1MAHfH+97klRqBSI1/waE9/EHDU4EFcoSSE+V99PbbSscGPRkV5m8ugA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8475
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

Add KUNIT tests to make sure the macro is working correctly.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 rust/kernel/bitfield.rs | 321 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 321 insertions(+)

diff --git a/rust/kernel/bitfield.rs b/rust/kernel/bitfield.rs
index fed19918c3b9..9a20bcd2eb60 100644
--- a/rust/kernel/bitfield.rs
+++ b/rust/kernel/bitfield.rs
@@ -402,3 +402,324 @@ fn default() -> Self {
         }
     };
 }
+
+#[::kernel::macros::kunit_tests(kernel_bitfield)]
+mod tests {
+    use core::convert::TryFrom;
+
+    // Enum types for testing => and ?=> conversions
+    #[derive(Debug, Clone, Copy, PartialEq)]
+    enum MemoryType {
+        Unmapped = 0,
+        Normal = 1,
+        Device = 2,
+        Reserved = 3,
+    }
+
+    impl Default for MemoryType {
+        fn default() -> Self {
+            MemoryType::Unmapped
+        }
+    }
+
+    impl TryFrom<u8> for MemoryType {
+        type Error = u8;
+        fn try_from(value: u8) -> Result<Self, Self::Error> {
+            match value {
+                0 => Ok(MemoryType::Unmapped),
+                1 => Ok(MemoryType::Normal),
+                2 => Ok(MemoryType::Device),
+                3 => Ok(MemoryType::Reserved),
+                _ => Err(value),
+            }
+        }
+    }
+
+    impl From<MemoryType> for u64 {
+        fn from(mt: MemoryType) -> u64 {
+            mt as u64
+        }
+    }
+
+    #[derive(Debug, Clone, Copy, PartialEq)]
+    enum Priority {
+        Low = 0,
+        Medium = 1,
+        High = 2,
+        Critical = 3,
+    }
+
+    impl Default for Priority {
+        fn default() -> Self {
+            Priority::Low
+        }
+    }
+
+    impl From<u8> for Priority {
+        fn from(value: u8) -> Self {
+            match value & 0x3 {
+                0 => Priority::Low,
+                1 => Priority::Medium,
+                2 => Priority::High,
+                _ => Priority::Critical,
+            }
+        }
+    }
+
+    impl From<Priority> for u16 {
+        fn from(p: Priority) -> u16 {
+            p as u16
+        }
+    }
+
+    bitfield! {
+        struct TestPageTableEntry(u64) {
+            0:0       present     as bool;
+            1:1       writable    as bool;
+            11:9      available   as u8;
+            13:12     mem_type    as u8 ?=> MemoryType;
+            17:14     extended_type as u8 ?=> MemoryType;  // For testing failures
+            51:12     pfn         as u64;
+            51:12     pfn_overlap as u64;
+            61:52     available2  as u16;
+        }
+    }
+
+    bitfield! {
+        struct TestControlRegister(u16) {
+            0:0       enable      as bool;
+            3:1       mode        as u8;
+            5:4       priority    as u8 => Priority;
+            7:4       priority_nibble as u8;
+            15:8      channel     as u8;
+        }
+    }
+
+    bitfield! {
+        struct TestStatusRegister(u8) {
+            0:0       ready       as bool;
+            1:1       error       as bool;
+            3:2       state       as u8;
+            7:4       reserved    as u8;
+            7:0       full_byte   as u8;  // For entire register
+        }
+    }
+
+    #[test]
+    fn test_single_bits() {
+        let mut pte = TestPageTableEntry::default();
+
+        assert!(!pte.present());
+        assert!(!pte.writable());
+
+        pte = pte.set_present(true);
+        assert!(pte.present());
+
+        pte = pte.set_writable(true);
+        assert!(pte.writable());
+
+        pte = pte.set_writable(false);
+        assert!(!pte.writable());
+
+        assert_eq!(pte.available(), 0);
+        pte = pte.set_available(0x5);
+        assert_eq!(pte.available(), 0x5);
+    }
+
+    #[test]
+    fn test_range_fields() {
+        let mut pte = TestPageTableEntry::default();
+
+        pte = pte.set_pfn(0x123456);
+        assert_eq!(pte.pfn(), 0x123456);
+        // Test overlapping field reads same value
+        assert_eq!(pte.pfn_overlap(), 0x123456);
+
+        pte = pte.set_available(0x7);
+        assert_eq!(pte.available(), 0x7);
+
+        pte = pte.set_available2(0x3FF);
+        assert_eq!(pte.available2(), 0x3FF);
+
+        // Test TryFrom with ?=> for MemoryType
+        pte = pte.set_mem_type(MemoryType::Device);
+        assert_eq!(pte.mem_type(), Ok(MemoryType::Device));
+
+        pte = pte.set_mem_type(MemoryType::Normal);
+        assert_eq!(pte.mem_type(), Ok(MemoryType::Normal));
+
+        // Test all valid values for mem_type
+        pte = pte.set_mem_type(MemoryType::Reserved); // Valid value: 3
+        assert_eq!(pte.mem_type(), Ok(MemoryType::Reserved));
+
+        // Test failure case using extended_type field which has 4 bits (0-15)
+        // MemoryType only handles 0-3, so values 4-15 should return Err
+        let mut raw = pte.raw();
+        // Set bits 17:14 to 7 (invalid for MemoryType)
+        raw = (raw & !::kernel::bits::genmask_u64(14..=17)) | (0x7 << 14);
+        let invalid_pte = TestPageTableEntry::new(raw);
+        // Should return Err with the invalid value
+        assert_eq!(invalid_pte.extended_type(), Err(0x7));
+
+        // Test a valid value after testing invalid to ensure both cases work
+        // Set bits 17:14 to 2 (valid: Device)
+        raw = (raw & !::kernel::bits::genmask_u64(14..=17)) | (0x2 << 14);
+        let valid_pte = TestPageTableEntry::new(raw);
+        assert_eq!(valid_pte.extended_type(), Ok(MemoryType::Device));
+
+        let max_pfn = ::kernel::bits::genmask_u64(0..=39);
+        pte = pte.set_pfn(max_pfn);
+        assert_eq!(pte.pfn(), max_pfn);
+        assert_eq!(pte.pfn_overlap(), max_pfn);
+    }
+
+    #[test]
+    fn test_builder_pattern() {
+        let pte = TestPageTableEntry::default()
+            .set_present(true)
+            .set_writable(true)
+            .set_available(0x7)
+            .set_pfn(0xABCDEF)
+            .set_mem_type(MemoryType::Reserved)
+            .set_available2(0x3FF);
+
+        assert!(pte.present());
+        assert!(pte.writable());
+        assert_eq!(pte.available(), 0x7);
+        assert_eq!(pte.pfn(), 0xABCDEF);
+        assert_eq!(pte.pfn_overlap(), 0xABCDEF);
+        assert_eq!(pte.mem_type(), Ok(MemoryType::Reserved));
+        assert_eq!(pte.available2(), 0x3FF);
+    }
+
+    #[test]
+    fn test_raw_operations() {
+        let raw_value = 0x3FF0000003123E03u64;
+
+        let pte = TestPageTableEntry::new(raw_value);
+        assert_eq!(pte.raw(), raw_value);
+
+        assert!(pte.present());
+        assert!(pte.writable());
+        assert_eq!(pte.available(), 0x7);
+        assert_eq!(pte.pfn(), 0x3123);
+        assert_eq!(pte.pfn_overlap(), 0x3123);
+        assert_eq!(pte.mem_type(), Ok(MemoryType::Reserved));
+        assert_eq!(pte.available2(), 0x3FF);
+
+        // Test using direct constructor syntax TestStruct(value)
+        let pte2 = TestPageTableEntry::new(raw_value);
+        assert_eq!(pte2.raw(), raw_value);
+    }
+
+    #[test]
+    fn test_u16_bitfield() {
+        let mut ctrl = TestControlRegister::default();
+
+        assert!(!ctrl.enable());
+        assert_eq!(ctrl.mode(), 0);
+        assert_eq!(ctrl.priority(), Priority::Low);
+        assert_eq!(ctrl.priority_nibble(), 0);
+        assert_eq!(ctrl.channel(), 0);
+
+        ctrl = ctrl.set_enable(true);
+        assert!(ctrl.enable());
+
+        ctrl = ctrl.set_mode(0x5);
+        assert_eq!(ctrl.mode(), 0x5);
+
+        // Test From conversion with =>
+        ctrl = ctrl.set_priority(Priority::High);
+        assert_eq!(ctrl.priority(), Priority::High);
+        assert_eq!(ctrl.priority_nibble(), 0x2); // High = 2 in bits 5:4
+
+        ctrl = ctrl.set_channel(0xAB);
+        assert_eq!(ctrl.channel(), 0xAB);
+
+        // Test overlapping fields
+        ctrl = ctrl.set_priority_nibble(0xF);
+        assert_eq!(ctrl.priority_nibble(), 0xF);
+        assert_eq!(ctrl.priority(), Priority::Critical); // bits 5:4 = 0x3
+
+        let ctrl2 = TestControlRegister::default()
+            .set_enable(true)
+            .set_mode(0x3)
+            .set_priority(Priority::Medium)
+            .set_channel(0x42);
+
+        assert!(ctrl2.enable());
+        assert_eq!(ctrl2.mode(), 0x3);
+        assert_eq!(ctrl2.priority(), Priority::Medium);
+        assert_eq!(ctrl2.channel(), 0x42);
+
+        let raw_value: u16 = 0x4217;
+        let ctrl3 = TestControlRegister::new(raw_value);
+        assert_eq!(ctrl3.raw(), raw_value);
+        assert!(ctrl3.enable());
+        assert_eq!(ctrl3.priority(), Priority::Medium);
+        assert_eq!(ctrl3.priority_nibble(), 0x1);
+        assert_eq!(ctrl3.channel(), 0x42);
+    }
+
+    #[test]
+    fn test_u8_bitfield() {
+        let mut status = TestStatusRegister::default();
+
+        assert!(!status.ready());
+        assert!(!status.error());
+        assert_eq!(status.state(), 0);
+        assert_eq!(status.reserved(), 0);
+        assert_eq!(status.full_byte(), 0);
+
+        status = status.set_ready(true);
+        assert!(status.ready());
+        assert_eq!(status.full_byte(), 0x01);
+
+        status = status.set_error(true);
+        assert!(status.error());
+        assert_eq!(status.full_byte(), 0x03);
+
+        status = status.set_state(0x3);
+        assert_eq!(status.state(), 0x3);
+        assert_eq!(status.full_byte(), 0x0F);
+
+        status = status.set_reserved(0xA);
+        assert_eq!(status.reserved(), 0xA);
+        assert_eq!(status.full_byte(), 0xAF);
+
+        // Test overlapping field
+        status = status.set_full_byte(0x55);
+        assert_eq!(status.full_byte(), 0x55);
+        assert!(status.ready());
+        assert!(!status.error());
+        assert_eq!(status.state(), 0x1);
+        assert_eq!(status.reserved(), 0x5);
+
+        let status2 = TestStatusRegister::default()
+            .set_ready(true)
+            .set_state(0x2)
+            .set_reserved(0x5);
+
+        assert!(status2.ready());
+        assert!(!status2.error());
+        assert_eq!(status2.state(), 0x2);
+        assert_eq!(status2.reserved(), 0x5);
+        assert_eq!(status2.full_byte(), 0x59);
+
+        let raw_value: u8 = 0x59;
+        let status3 = TestStatusRegister::new(raw_value);
+        assert_eq!(status3.raw(), raw_value);
+        assert!(status3.ready());
+        assert!(!status3.error());
+        assert_eq!(status3.state(), 0x2);
+        assert_eq!(status3.reserved(), 0x5);
+        assert_eq!(status3.full_byte(), 0x59);
+
+        let status4 = TestStatusRegister::new(0xFF);
+        assert!(status4.ready());
+        assert!(status4.error());
+        assert_eq!(status4.state(), 0x3);
+        assert_eq!(status4.reserved(), 0xF);
+        assert_eq!(status4.full_byte(), 0xFF);
+    }
+}
-- 
2.34.1

