Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 090E9BAD3C8
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 16:46:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33E2A10E5E9;
	Tue, 30 Sep 2025 14:46:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rFEJ0eQj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010028.outbound.protection.outlook.com [52.101.56.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E3E610E5E9;
 Tue, 30 Sep 2025 14:46:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kf+h0dsnd2HHW0ZeHn3oEVNKhmQWH9ALh8GfljrxboXNkH8uzdxIZGT6c/8BhD1Jfva1A8coPkalH/WBAdzcn+Sk4ruXqDt9gAMu/3fudREiMBC4JW+q5LwvNnYuNQl74gxSWW69mbURLwiUgoZBSq+ogSBBvZQrbgAFIRm6ysUF3ggGTa78dotlavnc8IclL11YmK08dA1dXotpSvfKbatFG7XxcoaN94fG3C4OLjuoFcXOVreTsYUAwJ8Q3vZa+bN8b90g4JqFB9jXeskjm63r7OckFvfYPuAVm0CvLwD2k4IKkH8ioZlE1AKqmEO0LGTJ62bzpMJ2Z/6P2fUe8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ERmKqtLjZ53vhXWrolZ2wVbOLe6ygLTfNzIFuc49vG4=;
 b=idmpGAR8L47JmnKnAEoy2jqDqTyYBwMFwX0a5Ka2a4++sbiefM3GgYUe1fKiuaxNWM2lKVVUXWDMGmjiKoJfGHMyHgVSGWUJDZodX27AlM4Wx6nXZ2gN8SjNxGB1QbacojBtgHhmkJWsZjpPnygg9WntM2IWGYGgBCfzKiK6oWTd77N/1OHCPIMP/CROnDdzDt5gP7vHqE9/E4mOQeL5zlOfeDaVhAi2+tV0G3m/hl/pys+hAt6hYgQ4I+3Bv7cBfDAXfS7kwWZe8CUEexTIPRuQb1fbVj+vvqB/YhsGMq05wJbSooLYUyF8dteCvuZWD+VTB75t6wg1Rwo2lwpSmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ERmKqtLjZ53vhXWrolZ2wVbOLe6ygLTfNzIFuc49vG4=;
 b=rFEJ0eQjXX2PZv8wlQUV+Pd/mmd8ZunnGTetNR/YpbYdr/w6m8vCQbXKirsZXSSg8jatzObaXTUgMt5gI8x3FXEQbHYxfrAOoPtvyIp5++0VT7kcdmdY9Ilqy/ABJdzfShmlyq4SDWMGnC/IVdcRFjUqXLLikzqU9IqIr/3V35zl+xdAhMAjKcL4smF7IG5Jpd6yVD364IDlWqe8/hUjcKUcXEmgYrjPF3x4CSyVQeW/wkJrArZ0gWOv7RwXR71s4NBFwZFM0lBaNE7a65g6rwClzPOP9V7hj8bTlX1xfy6VnEyyPIhUinkzuH5QFT3IPS3xdtJESWmOdV31AA6TQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DM4PR12MB8475.namprd12.prod.outlook.com (2603:10b6:8:190::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 14:45:59 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 14:45:59 +0000
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
Subject: [PATCH v5 7/9] rust: bitfield: Use 'as' operator for setter type
 conversion
Date: Tue, 30 Sep 2025 10:45:35 -0400
Message-Id: <20250930144537.3559207-8-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930144537.3559207-1-joelagnelf@nvidia.com>
References: <20250930144537.3559207-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P221CA0018.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::30) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DM4PR12MB8475:EE_
X-MS-Office365-Filtering-Correlation-Id: f539c6d3-2d39-411a-42e3-08de003011c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Pqdy81nZBF5v25HdVb5shFBfTeHHOHqHIM5wk5VRUpf+6zinWeBV0NqZqGzP?=
 =?us-ascii?Q?Ujr6yjYVZFeFkT1+2QvqulHwBS/3K+j7jGmx7lLdORGM0bDtdIcL7WdU9SL/?=
 =?us-ascii?Q?PURePVPzKzw9RwnRA0FW/EhvsDrMIZYe0/7pPMfChvcNGTyhfez25myBKIGm?=
 =?us-ascii?Q?iD3nGrQv3NBH5hPfuhfucsrNUlUeEJASaKgaypzuGNNECwH58FoYz55Z3l8/?=
 =?us-ascii?Q?xYCiLOwlGS4qmtvxE4SngLwSLqrCSboXpCx3f1YuLqjRKZz17Xwq5jLvSzqu?=
 =?us-ascii?Q?UWPhSQw+MJUR/ZGPUBBP/qUAgwFVC3LYS5rQHl00VtokrVHOndrAz5C90UiI?=
 =?us-ascii?Q?xoZ7TdPAAZ1kU/6IE46vXjWtPy0hVD2QcCB6gdQ4KrsZfAoeuwxKfO+RwSpi?=
 =?us-ascii?Q?tuXAfV0kljfrj2yyEAg/6A8cmAogK2Isviujj/dQiY2w9QCMKoVTLzAMacJZ?=
 =?us-ascii?Q?Dixt7rsC48TcHQcl5WEU/qPO86O/hhaKvhcR+T+fdi2UpIa0Dr9bxE+/Z41W?=
 =?us-ascii?Q?bBLMORnZimGMlWK2cpiy7MTYabHc7lBDlNPQcO4jrFlAeYOhA+wo4P1nKxaa?=
 =?us-ascii?Q?NuDva5X0oehxV8/HuufsmSRKZmubU+hAISf7U+qCRTakk2YHtEVbgCDAaFym?=
 =?us-ascii?Q?DwfFEbDmZ1SmvzT8UJZhMAqc9j0tWFoFRJibJGFKXJ22WAxNxmJeWAXJlzF7?=
 =?us-ascii?Q?Y/lJEoN1zYVcOza1pLzCtI2eoq12A81V5w3d+FxlpVa/mq9c70pTg/gGUefU?=
 =?us-ascii?Q?3AewXAD1uM1CHFDAPECMfwJ8ovX3z1a8nRSveBoMJ0gAQTM9XusjXckXbEXB?=
 =?us-ascii?Q?1JMJYFZKV8+Nmje07nRcFoi432MSZJSr6PAjYXQkg11l2QTNOJLiRRHFwa0q?=
 =?us-ascii?Q?77rl0vnkydYyTBWeMCOic+5jCys+nsp+Fvo7Ru5OrjoirKyZpsOALLVZrJN2?=
 =?us-ascii?Q?zfotk3YPo+MhjbzioqJZ+10vKoyLx72+PTAz+HjJDqBs5Fv6UVvPSWpSjT5M?=
 =?us-ascii?Q?o5ymIsNqsuaw0mFIFjCq1GWOlziqVYlCDOdADIOEUkhCkZedSmCRhAdsoP4D?=
 =?us-ascii?Q?sDifExdzctujZjz7wi+DNSw4RHQsc10VH3UPRsOIFgRN1pOppIAfd//+oz8m?=
 =?us-ascii?Q?I2ypJ3W7TMLFEwN0a4XFx1GQf9WvX+9bMEWZU7PNPyNOFsFaiqZ3YaYFY6qi?=
 =?us-ascii?Q?wtXHowTRz3Fd1hTUpJ0CWBClTBl863W5H84aGPn1QrCg7tEEJLv/CyBHFRvF?=
 =?us-ascii?Q?dI4/kr5OH5W8ANdxNqqg/zdsbzirVpIFl0+fofysah/LciJigYyufhDt/IPT?=
 =?us-ascii?Q?X1840wVuPMrUy2wei2Ta4BDKjqYFvawMPrZSxXOeyLDX9hXk2P33Tk44uhS6?=
 =?us-ascii?Q?wXGPum8HGHVEZNrTAGcDnFPRs430fiB4BWF9Trgr4fT6b8Yb49fv991hKyf6?=
 =?us-ascii?Q?Sp/7mAeGKhd3PRTCY7Sw4S4lt/gSs4w7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kz04wttz8pbz00AB34QazgxLwrDtr/3kQMyJ0CEuJQm9Jn16kyqXu6wtBrG4?=
 =?us-ascii?Q?3H6ctddG/gXP1Hrd2rcXQNCnKKKU6lJR7Xs/nWVreyNQm425BpXrBB9XY6O7?=
 =?us-ascii?Q?92p2e1aPrhwjfdp7hmntwKCcTG7PA7p8PfCW0Trm9MMQz9qQCtiso3NR4FK0?=
 =?us-ascii?Q?/U99akyvp82LlQBS3anIeI5XqIf0YsMe5GCNiJIeXLEp0guHEwMcB8vyfdj9?=
 =?us-ascii?Q?oqjgdPkPdd29fTZe8kTTrqBf8B0/Qx0lzNH0pHcRVtZP3br6gPcAqq1kZJXS?=
 =?us-ascii?Q?AmjMIrKjDm7XfuuQko0DyEPDSAkD/iFcFs4cL/6SWWeyW1+OMaVKmQv5T/+j?=
 =?us-ascii?Q?s2weMGwCluP8HDreWH9nzQDb9vDx2uoSOchVgIsq4wn/LAetWds8/gvGJBcT?=
 =?us-ascii?Q?7Ht3eYfSQ4/J6Uf5Hy3dfi6+kGfqF1SKt1XvdRlj2oE1XNZHkiwSk7+eZjKI?=
 =?us-ascii?Q?vNr0nwfmhPP3rFNtjNxEbod1uTRxPwaEzVm34ZYzmsuXiq0emQLW4RpIhAhD?=
 =?us-ascii?Q?Pdy7l5YuRvH9OEvTTQvzXQ5qmPlkc/Got5yp5Zn8Vk1nhHRth9geOyBLdt+i?=
 =?us-ascii?Q?WfFZoH6VvUYBkA7iU5wZdrvZXbXZqDQVmlAIzc2nXmhApZewHC+75+M7aoih?=
 =?us-ascii?Q?39+uDDTP44oGyWuhfq9dHU0+yfSNoq60uIIjE2hkK6NGoEmDJkhKD1AuCDuB?=
 =?us-ascii?Q?xt0dwwgte0PWGELLg1msSjN/LJZCpT/NrtpsbDfC4vxiRcCeBYZcCFFvjzjm?=
 =?us-ascii?Q?S+LklNHSjqDxUsiXzvIZM1pQMz9zWl7nr2eA2rDV2UqJjzrQGpG8Iu75mae0?=
 =?us-ascii?Q?hxxu6JOiw5nWufP7NiBHjuGTCP7jVfo/5pV9vf8jdVSd1i2EuVrb6/rrZXob?=
 =?us-ascii?Q?1LJ44857aM3liSaF7FTmk4MTQyHY78VtPCHJmb6YwPQCMUZpUAq5MGtr7vf+?=
 =?us-ascii?Q?l4j77mKIq94TkxzQFJv99/+DtPFck4tIsopL7Ov+4U9ayT3yWiAwb5b4fupX?=
 =?us-ascii?Q?0DTr/iSfrfkpshVT+ljyHPNki/b4PUCzEFWUD4F2DvRLekJwV/KydeK+lyG6?=
 =?us-ascii?Q?fl+1kr6bpbtqfScPEEacnfbSAnQODKjA2riL7+RuvtLI5Hb67ypEXFAJgEud?=
 =?us-ascii?Q?HU9VzsuFaMMzry65FxpwiHX03vul/DFL5ngt59QSldsHY5Xe/ot5qdrrjbvW?=
 =?us-ascii?Q?xBDjBq0QgzJ/Rw4DEcf6aQwVdr44905425WWf99YMf8NM9vXwZM//MXarzln?=
 =?us-ascii?Q?PtIOGNDOmB8xE/slNyM2hxvXti4Qg+rOwXu0NCzBrOulKwoQel3mpSg5c+UI?=
 =?us-ascii?Q?UwxyO8xsbQ5f6CjRfoQBN0S3UTOjcP3NA7v0EEA0YY3GwPQ9+Qn21iEKYoQU?=
 =?us-ascii?Q?0WZMbFGLj/4XPp+tYmMFoX8TQblTrgVC1GWeflPytMm89zC4U5oJudhhe0RV?=
 =?us-ascii?Q?sXzO6HWAirpTyTOXiyt8aBWAvUgC6LZ8rUoEHBcaIwZPNLeHTLYFpRnu/x2x?=
 =?us-ascii?Q?5Czx8FMwC98hAtjRC2n29orAsTMRMhfR7sE8MgFNauuf02P2u8uyPfYakQ0L?=
 =?us-ascii?Q?PWqmpKnq/NFwujTtVQdS0m+a7Q/n8NEqsKufTZxz?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f539c6d3-2d39-411a-42e3-08de003011c8
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 14:45:59.1414 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vGHQQ/e9lozkyFu8b8Pe/m6CMpiFi+dGcDPxIelQL2cnP7L5TlEYUp6uaGRfFrY/Oiu2eQCNztCLpukREHxqgA==
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

The bitfield macro's setter accesors currently uses the From trait for
type conversion, which is overly restrictive and prevents use cases such
as narrowing conversions (e.g., u8 struct storage size does not work
with 'as u32' for the field size).

Replace 'from' with 'as' in the setter implementation to support this.

An example of such a bitfield struct is:

    bitfield! {
        struct TestWideFields: u8 {
            3:0       nibble      as u32;
            7:4       high_nibble as u32;
            7:0       full        as u64;
        }
    }

Note that there is already no requirement to have the total size of all
the 'as <type>' fields to be <= the struct's storage width. For example,
it is already possible to have a u8 sized struct, with two 'as u8'
fields.  So the struct's width is already independent of the total width
of the 'as uXX' instances.

Link: https://lore.kernel.org/all/aMIqGBoNaJ7rUrYQ@yury/
Suggested-by: Yury Norov <yury.norov@gmail.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 rust/kernel/bitfield.rs | 37 ++++++++++++++++++++++++++++++++++---
 1 file changed, 34 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/bitfield.rs b/rust/kernel/bitfield.rs
index 9a20bcd2eb60..a74e6d45ecd3 100644
--- a/rust/kernel/bitfield.rs
+++ b/rust/kernel/bitfield.rs
@@ -107,8 +107,6 @@ pub const fn into_raw(self) -> T {
 /// - Raw accessor: `raw()` - returns the underlying raw value
 /// - Field accessors: `mode()`, `state()`, etc.
 /// - Field setters: `set_mode()`, `set_state()`, etc. (supports chaining with builder pattern).
-///   Note that the compiler will error out if the size of the setter's arg exceeds the
-///   struct's storage size.
 /// - Debug and Default implementations.
 ///
 /// Note: Field accessors and setters inherit the same visibility as the struct itself.
@@ -360,7 +358,9 @@ impl $name {
         $vis fn [<set_ $field>](mut self, value: $to_type) -> Self {
             const MASK: $storage = $name::[<$field:upper _MASK>];
             const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
-            let val = (<$storage>::from(value) << SHIFT) & MASK;
+            // Here we are potentially narrowing value from a wider bit value
+            // to a narrower bit value. So we have to use `as` instead of `::from()`.
+            let val = ((value as $storage) << SHIFT) & MASK;
             let new_val = (self.raw() & !MASK) | val;
             self.0 = ::kernel::bitfield::BitfieldInternalStorage::from_raw(new_val);
 
@@ -505,6 +505,15 @@ struct TestStatusRegister(u8) {
         }
     }
 
+    // For testing wide field types on narrow storage
+    bitfield! {
+        struct TestWideFields(u8) {
+            3:0       nibble      as u32;
+            7:4       high_nibble as u32;
+            7:0       full        as u64;
+        }
+    }
+
     #[test]
     fn test_single_bits() {
         let mut pte = TestPageTableEntry::default();
@@ -722,4 +731,26 @@ fn test_u8_bitfield() {
         assert_eq!(status4.reserved(), 0xF);
         assert_eq!(status4.full_byte(), 0xFF);
     }
+
+    #[test]
+    fn test_wide_field_types() {
+        let mut wf = TestWideFields::default();
+
+        wf = wf.set_nibble(0x0000000F_u32);
+        assert_eq!(wf.nibble(), 0x0000000F_u32);
+
+        wf = wf.set_high_nibble(0x00000007_u32);
+        assert_eq!(wf.high_nibble(), 0x00000007_u32);
+
+        wf = wf.set_full(0xBE_u64);
+        assert_eq!(wf.full(), 0xBE_u64);
+        assert_eq!(wf.raw(), 0xBE_u8);
+
+        wf = TestWideFields::default()
+            .set_nibble(0x5_u32)
+            .set_high_nibble(0xA_u32);
+        assert_eq!(wf.raw(), 0xA5_u8);
+        assert_eq!(wf.nibble(), 0x5_u32);
+        assert_eq!(wf.high_nibble(), 0xA_u32);
+    }
 }
-- 
2.34.1

