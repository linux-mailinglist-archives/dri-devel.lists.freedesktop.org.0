Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6482BBBF384
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 22:36:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CFEA10E148;
	Mon,  6 Oct 2025 20:36:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NfzgiSzT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010039.outbound.protection.outlook.com [52.101.46.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C842710E148;
 Mon,  6 Oct 2025 20:36:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QWDo1dThulJjeNrhwUHWAYCMraydgyd/hXY2od+Cpk00r4VyvoNUWCtf8aB/YnXqWY72pvAZRIT+fpZyExH14mG5nCyGXBhFInZiaqXOoOszlkendwcLKlgF5CbqsD+a9u4Mhl4616BU1DCR4ZBHv0bjDyON9AIAo3VyLIqZR2aVBTeQw0I1rLBmMVcDgfd0Pt+4fardVcItWrZJiIPGIlLQaaefHsTEyZ2DbAnXDbaVEP/TO/VdiEPmUP1YAOZPPBvAaAaMdGUwoCcHCF3JqvboxWsFLqMNcLxD+wdyuux/7k//XcVmKxTnaebdIIeS+qYZxMiPHFS2t1cGwUmzbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Lei9K5TjL8vflzTkncRiJ/0qxJkj3TnbjW8uU+zYj6M=;
 b=NdJogqDXM47uv638oet9AX36mOqly8FRUh6lDTTCBEiM+b+yb5mIuD6sBA7JqN76wf6X6NBt4ciq5GAi5BoyovBN09kpL9B4SrxqNC9nolKCxyVoJLRtMW4QaDIK0L02Xn8G8mTWyJ3MvfJoZGmP3SpbDJSOacIfNp0Ebnb6icH8gjVE6MdWKyJSlFOlQHaz1h5juAKlydtB7fFo9/GuW++1sCWfF8kPLpZMz2DxBKZURjVtW30VCpD7FpR3P3E+jFKWxtszV+JoCmgi7lr1/Op/U/lnhVEdhx9E4cMCcEkzu94PksZ1kX9tyEH7zlWRr9X3v6hMbYnlwaJ+Gx+qXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Lei9K5TjL8vflzTkncRiJ/0qxJkj3TnbjW8uU+zYj6M=;
 b=NfzgiSzTnAjEa1abcoaWaTcycMWAYc2rUlqAglc4lPJ2Di0QS48D4Ve+0NF4oJ0h0Zw//ugUcNQIlAnP0U5XzT/CrnNaioXBSXJ2o12SM925KNQouXrDYwS0QvOX+gCJhvMAUhwcP+QtJRIaiFHt4A1AxCph8hAMaDN/8w/UtaLH6H4cKaV+pTDc8MY1X73ATI6qzrv1hqKDzfwKVi6Xgm8wGGnKm12BpMwE/f0MPnh5urCna0lKfpoZn1/UXdp8peOKenEsSfaz3m+543W7NE2oagxsSQm6j0Xn7Zep53P9R+Tq8EElrVUpo1zsCuUb1QPDOse3ABXJixE5NIr9nw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by MW4PR12MB6875.namprd12.prod.outlook.com (2603:10b6:303:209::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Mon, 6 Oct
 2025 20:36:46 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9182.017; Mon, 6 Oct 2025
 20:36:46 +0000
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
Subject: [PATCH v7] rust: bitfield: Add KUNIT tests for bitfield
Date: Mon,  6 Oct 2025 16:36:31 -0400
Message-Id: <20251006203631.3150221-1-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251003154748.1687160-6-joelagnelf@nvidia.com>
References: <20251003154748.1687160-6-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9P221CA0016.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:408:10a::18) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|MW4PR12MB6875:EE_
X-MS-Office365-Filtering-Correlation-Id: b6de3412-2f9a-489b-6f8e-08de0518112d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OMihJif5WeaCp9/siHpKSqKGCuyDL+7xZFtm1YNToHTjdYB67DqbAsW86GC7?=
 =?us-ascii?Q?NQ5GGgHT6oGoT3U4Qs9XHcf6fYmMWF4nvjomI65vA6G/DIN2CRO5XqdI4HmH?=
 =?us-ascii?Q?4eLWU74unTsomh5w2hGg2ysny2h5qDZYWMBjSnOHZ7sax86yRvLGk2WD5JDq?=
 =?us-ascii?Q?aTPK3xgjVsYyfRkWA+MJEVQeFHKXWD6emdxvRTgut8GZY+7F2ZS6v0zwgtAB?=
 =?us-ascii?Q?r/1wvCy7bZPbIFmWPYXvTPlhkXAbXTh8I7X2Y+jb84cYoxX7SQimR22mgGI8?=
 =?us-ascii?Q?nnDyik0xwvKn+zdQtpgRTES8MAq/aj1BKzVom6xDrN1BWuA2BGX2ZXm4CdEV?=
 =?us-ascii?Q?Joxa6QiCoxbxQeeHC1lVNwLw10xaYuZ0f3wxLCVy+6LECi1DuJDgawHMbLrs?=
 =?us-ascii?Q?OezL+HPY8xy2trBok3SZf/AwK46Z6plv7oIlmWN+4HjPICO1GWue9j0FxrKb?=
 =?us-ascii?Q?5PkohJXQRw6JpVAH/g+o5ggbQeH9wC3TXwlaNWO2w9e2MOkkOM6RD4LczRiI?=
 =?us-ascii?Q?EpnkzBWO6GRlGDKQGD1wKcVRZ6QKblIYw6IC+tibdtWxI1Rob+xq0abP+ccS?=
 =?us-ascii?Q?q9MDMMAUwoHBgz1dZGTlEfxNi7LuAeOc0bxPncT8Ktbs/Rh2P4sqhoEWprTC?=
 =?us-ascii?Q?HbCCs7HWp+uyEKOjlVUHm0u3Qyfr8obTU4d+TfZxr2KVWVoeqWJLX9a4jrlp?=
 =?us-ascii?Q?WS8WfuWT30YjwyDRfOdrEUbycUaIu++D1mOw8uU3Dlv2Pzsqh3ICWnG7Bf2y?=
 =?us-ascii?Q?0Lp2iI836gyHBaB1z/fkSPZyfnRDnBZs7H9WfHDgy/Cs1Ye72cE0Dam9eAi0?=
 =?us-ascii?Q?b3N4ybTkL09X5cP5oNYa1J6pkvxM0HPPaUDoyR+ShYqZ26EZUIgOp7ScKsVb?=
 =?us-ascii?Q?h9rbLpelTZRb65Wic/h92oSg5HLw4eFjcj4SLgIZX5SPfXYGQ35APvYnYYhc?=
 =?us-ascii?Q?rLKRyHoNFq1j+9srXYkDlO0e8z0zSdWlBAuXBYiN5RFoUwEK4lKN3PAAXxJA?=
 =?us-ascii?Q?t6DLZX7Ty3OJmqF88hT8DWsl2xBfRm784d+oAYSFwNafyWqr+qGYeBPIK9/j?=
 =?us-ascii?Q?6AKV1GkYJrNkUTjHz9jiLLyPBn8xih/Bt390l171viwhrQlieCJor/6bTy+C?=
 =?us-ascii?Q?+z7HDfHgY2q3W8VKXNff84urVTVZrgEZIYYzR9/zLbBtQQSLloosuP5eKUnI?=
 =?us-ascii?Q?5l445nABkrydURAxfsheScvm58QhWBJUsRnUW3L1DdfHk2it4X/NcI4lLYlh?=
 =?us-ascii?Q?QXp49MYpgFh5f2dy3eQROACV3tjP4imWEPLntsCt+cX7myFbamndHrlPeXnZ?=
 =?us-ascii?Q?APgqz7/hBSH42WRpMmtHLj2VYTkF7CE73eiUFXqDsuB+09ml0gmPlef6i6Xc?=
 =?us-ascii?Q?ZsbHk9WR8MNEBQZxQxSKOmCewlgw+EDvwWyyqX/xjEwcAgcjXRKY5n5LuKTO?=
 =?us-ascii?Q?TH6ldJInCdMJrOXwef5HvZEpRX4GAEUT?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jv0XatIyPbeWEt6rhWhfy/bQCrXtWuMHLvpXPHrLFwT1kQGRgvLW3jEadODu?=
 =?us-ascii?Q?xAObbxQFo2Uuj6Jq6I4liV9U0aAF7Z/M1ZZ1r1NnLoj61x8g1brVtNA7x6xJ?=
 =?us-ascii?Q?Xw7EplBn0Algoee+pU/rq3eihcUuQeHyo6TsOI1Yppb67c27PcHqXmXh8lat?=
 =?us-ascii?Q?1wGMSrupoYoIhYESS5fJulkcSgCv4WhfIEUrgV6YLF2+uTzKgvOxZZxfc5i6?=
 =?us-ascii?Q?4tsytLgtfwAK3BOJh9TOl8we28s+5wDldZD+kscfsT1eQkUkC4gDnK+JMSX0?=
 =?us-ascii?Q?RXUbiOOduAro0lkMG4Vnamlmx3TnFRBwGh8hOdhjo4aZG27MhjF61uKjeoIe?=
 =?us-ascii?Q?cwcB9xZmxIB0OS5JD1LLdZA+yETCLCmHsr4Ty0jhKaY1Mv9x5Le5b8cwTUyq?=
 =?us-ascii?Q?Mx8mhJnkDIkcaydltlnMdD2rzQD4HlVcRrWyZc9aDS6OX2F9lB8P30fUWiCb?=
 =?us-ascii?Q?5J7ED0DKxnQ7jsiW3XF+N525edtcIy+cNnkQMCvlhAnLUEdCWAvrzrO52I0z?=
 =?us-ascii?Q?Z3d4apXgWtRAlUCdO0MZMvma+T5U7NB9lBnTREXLMjc5jeQ2ADg9pgKj+VUz?=
 =?us-ascii?Q?gtC8fc+Va3uBmjo0EGXViaGdA8BYEjpn9DKzTl6nPc9YoVaODAw5CA/5Aqz5?=
 =?us-ascii?Q?wXx1X+YQC2KcqE6nsifQtsXpPg9SWqzICoWp4ZwoEbSWuKfOyEhlLy61ddtO?=
 =?us-ascii?Q?QQtdqYY3SnL1SRlFf1XkyjKZU0X5kPUN8G1kIz2e0jbhGMlhQrzj+9CB0WDF?=
 =?us-ascii?Q?msz35j2VP/Pc2rGD2qYmQRYdAYAYQ8rBP0vdu3ClHokUMUyls2ov4X6JIQMF?=
 =?us-ascii?Q?Tvn4Va1Zh+W1tbU9kQNhnV+NyccSTYg30/kkUgwkq2fdMCJonBRJ2ashYUZN?=
 =?us-ascii?Q?4SdnofuDMH3A9PZO9SD4qRv/4jvS0Bgd5BWT+/oBoDfuhgCE9KfLpfvDCw92?=
 =?us-ascii?Q?cahC4FnirwePU4+36mU8HL+K4MuzdiCtXh5p9aMbGI6t6JmJ/dt3jxWfGCM+?=
 =?us-ascii?Q?ILek5HWdpbdMN769d/iwsfRzw7XbcYbwRO09XD2MTqJGZZ3ZiIKIBrf/CCKG?=
 =?us-ascii?Q?BHIIdT/xAMI9nfn2NrCVpMDXZebuChttY6kWWcdQx3wZ1NvphUUPRSNNh9/C?=
 =?us-ascii?Q?K6StOTiEHKm5ausbIu+dvwthyBm3/r8LfQg7X66hwH9HrCUauPeTS/oqYxvJ?=
 =?us-ascii?Q?ruYcik/SmefBQNfVtUPvqDszdtEmy30N3UOE7oR40ooZJP0UVkcg110h93KK?=
 =?us-ascii?Q?3WqVpWa/1fEAQT5lJ7fp5DeYp60NuU9yQYIvyOodjpy1FkY08IHvu8wlY2c3?=
 =?us-ascii?Q?uQlaKCEaG/MRx2j2D9CSJ4/yCB4yATmZRFPeN4N9oKTj91PwpJ/F5yhLvVyt?=
 =?us-ascii?Q?uc1Z5PoDkq7wpYHW104dQ++W07/A5wFQCyV7auXP9Bq45bfWAAzigLYJr8Km?=
 =?us-ascii?Q?3SLJTdPcEYec8ZDmKUXwamKxhGEU+k/dgxzRTf7zCBHQnv1V+3MaRAwfaOs8?=
 =?us-ascii?Q?DIgbbKoIHilgADcTB1dBBvsom/SVRVE9fbXwwS6nd1i+Sn4Neznd/9V1SvI0?=
 =?us-ascii?Q?p97G+wnT0ouQt2O9v7fY5s1eyifVLNqYKVpk56yn?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b6de3412-2f9a-489b-6f8e-08de0518112d
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Oct 2025 20:36:46.1035 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s5ZM08pdArFHrSdZM/gQpussROhcPpOEmiOYg4DOHfAaUmpmge8T6hpw+W4MIPQ9HEGgW5k0NE6+6/J/G2rrKg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6875
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

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 rust/kernel/bitfield.rs | 316 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 316 insertions(+)

diff --git a/rust/kernel/bitfield.rs b/rust/kernel/bitfield.rs
index 09cd5741598c..c3e0ef531256 100644
--- a/rust/kernel/bitfield.rs
+++ b/rust/kernel/bitfield.rs
@@ -329,3 +329,319 @@ fn default() -> Self {
         }
     };
 }
+
+#[::kernel::macros::kunit_tests(kernel_bitfield)]
+mod tests {
+    use core::convert::TryFrom;
+
+    // Enum types for testing => and ?=> conversions
+    #[derive(Debug, Default, Clone, Copy, PartialEq)]
+    enum MemoryType {
+        #[default]
+        Unmapped = 0,
+        Normal = 1,
+        Device = 2,
+        Reserved = 3,
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
+    #[derive(Debug, Default, Clone, Copy, PartialEq)]
+    enum Priority {
+        #[default]
+        Low = 0,
+        Medium = 1,
+        High = 2,
+        Critical = 3,
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
+            15:12     mem_type    as u8 ?=> MemoryType;
+            51:16     pfn         as u64;
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
+        assert_eq!(u64::from(pte), 0x0);
+
+        pte = pte.set_present(true);
+        assert!(pte.present());
+        assert_eq!(u64::from(pte), 0x1);
+
+        pte = pte.set_writable(true);
+        assert!(pte.writable());
+        assert_eq!(u64::from(pte), 0x3);
+
+        pte = pte.set_writable(false);
+        assert!(!pte.writable());
+        assert_eq!(u64::from(pte), 0x1);
+
+        assert_eq!(pte.available(), 0);
+        pte = pte.set_available(0x5);
+        assert_eq!(pte.available(), 0x5);
+        assert_eq!(u64::from(pte), 0xA01);
+    }
+
+    #[test]
+    fn test_range_fields() {
+        let mut pte = TestPageTableEntry::default();
+        assert_eq!(u64::from(pte), 0x0);
+
+        pte = pte.set_pfn(0x123456);
+        assert_eq!(pte.pfn(), 0x123456);
+        assert_eq!(u64::from(pte), 0x1234560000);
+
+        pte = pte.set_available(0x7);
+        assert_eq!(pte.available(), 0x7);
+        assert_eq!(u64::from(pte), 0x1234560E00);
+
+        pte = pte.set_available2(0x3FF);
+        assert_eq!(pte.available2(), 0x3FF);
+        assert_eq!(u64::from(pte), 0x3FF0_0012_3456_0E00u64);
+
+        // Test TryFrom with ?=> for MemoryType
+        pte = pte.set_mem_type(MemoryType::Device);
+        assert_eq!(pte.mem_type(), Ok(MemoryType::Device));
+        assert_eq!(u64::from(pte), 0x3FF0_0012_3456_2E00u64);
+
+        pte = pte.set_mem_type(MemoryType::Normal);
+        assert_eq!(pte.mem_type(), Ok(MemoryType::Normal));
+        assert_eq!(u64::from(pte), 0x3FF0_0012_3456_1E00u64);
+
+        // Test all valid values for mem_type
+        pte = pte.set_mem_type(MemoryType::Reserved);
+        assert_eq!(pte.mem_type(), Ok(MemoryType::Reserved));
+        assert_eq!(u64::from(pte), 0x3FF0_0012_3456_3E00u64);
+
+        // Test failure case using mem_type field which has 4 bits (0-15)
+        // MemoryType only handles 0-3, so values 4-15 should return Err
+        let mut raw = pte.into();
+        // Set bits 15:12 to 7 (invalid for MemoryType)
+        raw = (raw & !::kernel::bits::genmask_u64(12..=15)) | (0x7 << 12);
+        let invalid_pte = TestPageTableEntry(raw);
+        // Should return Err with the invalid value
+        assert_eq!(invalid_pte.mem_type(), Err(0x7));
+
+        // Test a valid value after testing invalid to ensure both cases work
+        // Set bits 15:12 to 2 (valid: Device)
+        raw = (raw & !::kernel::bits::genmask_u64(12..=15)) | (0x2 << 12);
+        let valid_pte = TestPageTableEntry(raw);
+        assert_eq!(valid_pte.mem_type(), Ok(MemoryType::Device));
+
+        let max_pfn = ::kernel::bits::genmask_u64(0..=35);
+        pte = pte.set_pfn(max_pfn);
+        assert_eq!(pte.pfn(), max_pfn);
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
+        assert_eq!(pte.mem_type(), Ok(MemoryType::Reserved));
+        assert_eq!(pte.available2(), 0x3FF);
+    }
+
+    #[test]
+    fn test_raw_operations() {
+        let raw_value = 0x3FF0000031233E03u64;
+
+        let pte = TestPageTableEntry(raw_value);
+        assert_eq!(u64::from(pte), raw_value);
+
+        assert!(pte.present());
+        assert!(pte.writable());
+        assert_eq!(pte.available(), 0x7);
+        assert_eq!(pte.pfn(), 0x3123);
+        assert_eq!(pte.mem_type(), Ok(MemoryType::Reserved));
+        assert_eq!(pte.available2(), 0x3FF);
+
+        // Test using direct constructor syntax TestStruct(value)
+        let pte2 = TestPageTableEntry(raw_value);
+        assert_eq!(u64::from(pte2), raw_value);
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
+        let ctrl3 = TestControlRegister(raw_value);
+        assert_eq!(u16::from(ctrl3), raw_value);
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
+        let status3 = TestStatusRegister(raw_value);
+        assert_eq!(u8::from(status3), raw_value);
+        assert!(status3.ready());
+        assert!(!status3.error());
+        assert_eq!(status3.state(), 0x2);
+        assert_eq!(status3.reserved(), 0x5);
+        assert_eq!(status3.full_byte(), 0x59);
+
+        let status4 = TestStatusRegister(0xFF);
+        assert!(status4.ready());
+        assert!(status4.error());
+        assert_eq!(status4.state(), 0x3);
+        assert_eq!(status4.reserved(), 0xF);
+        assert_eq!(status4.full_byte(), 0xFF);
+    }
+}
-- 
2.34.1

