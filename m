Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A271FBAD3D5
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 16:46:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FE9610E5EA;
	Tue, 30 Sep 2025 14:46:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="eL8HY5Rl";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010031.outbound.protection.outlook.com [52.101.56.31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6AC1010E5EA;
 Tue, 30 Sep 2025 14:46:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VU96ZZsTF388ZU3+VDfOXvBa22ngiu5TeDHfq8ny0FOn+N0TKDZoDiAVnYuQSQifHFeOHMWUa33e52fufwxyZ2VMTVYyFSkqQ0vo9jg2gQB9wsHEAjcbESP4sdMypApVGckF2LN4/750w7QaP/mp0bKFZVOf+sXzzfQB1DbmOXCEZcM4m2Yq7+MNfTtQCkhxlhvr48dYJY3RRcBwN2AizH64Z0hl4hifeziw1Im1sVpcbn8IrJh6b1b6w6/CcXGRgglE8hhigfMG+VAsRQhlvvKlTZ7pNIUS57VjCTbzbKmgE7EBr4HoPsBix9ntJg3H0yWuetpc+cGOgYcpI3SmrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=82eEbFLeAJwiAVUpsUWaBqtDv0q+s8GO2xYBDp7JVcw=;
 b=QCs6RvsYimfK4B0YFGlUosseWbfYYoWe5ouqhGoffgROMJhrZ05o0/0vsefyQmPzX8WgRG1UVENOE+wxjLrHJog6y9VD/oM7ZrXpw2kHblsA3Ep1i2kxXDILuPy3IzYQFqTEHgKwBH/jBMqvPZN4SJBK4xyF5AitTeo1m8guBcim6sjRiqY7I454k+JLBzDmief4GKFECXMOqse8lWRhOMulWdlFeby9Mf7ggvg/ge1I0VWFh60MkqoMOkYz5MChbLep+A5xC+v3WQtA2qJoDUg4xA0pt8NSxlH5jJIHddm041BBRUrRbluL1UjiN8H1z+6yhPlzpN/tcuR8F/SSJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=82eEbFLeAJwiAVUpsUWaBqtDv0q+s8GO2xYBDp7JVcw=;
 b=eL8HY5Rl/LIAWECR9PIVtTE+i2Q1lktthoYUlrpSzGvzY47nvImt3jdZnwDs3fmEmqa8xP6wRHR+uKZSXszyUlJ0CniocpSqZK44S4jHxqeXzVXnWVr+H+56RpOIQlKHtjriH8iz8lyDUSNS7fNjsJvYZJljZEtOO1RZ1XDuQnhTb4V6L6amfyKFnU+NAM7XOTAqyebtq2SLUB2AyIXiuNpayznSWheWql3ACPd+vTIXowgvXN8mH6SWtXclbN2KauAfhPhImHWyCaFfvz0y1OnJr3T6nrXV8hB4wWVBC3SEe0goIkOwsZbx9AZMPynII78h5UR39f3LtiPMLyJYng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DM4PR12MB8475.namprd12.prod.outlook.com (2603:10b6:8:190::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 14:46:01 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 14:46:01 +0000
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
Subject: [PATCH v5 8/9] rust: bitfield: Add hardening for out of bounds access
Date: Tue, 30 Sep 2025 10:45:36 -0400
Message-Id: <20250930144537.3559207-9-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930144537.3559207-1-joelagnelf@nvidia.com>
References: <20250930144537.3559207-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P221CA0017.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::35) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DM4PR12MB8475:EE_
X-MS-Office365-Filtering-Correlation-Id: 553a780a-8490-462c-764b-08de003012d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?hiTDoRzqgyEzS+UpD+lISe5YSeSOqJ7OeRfLj92+D/a8kuP0NHZpmeR3M8KW?=
 =?us-ascii?Q?bama0fHnjkPEbiY/3WQktpuAPLTe0UAo7tG7fF99DB3WGSn1gPZYPQoCkg0P?=
 =?us-ascii?Q?s7CHREOUm6l7E7krdUBEorz0bVQpnOi0Q4nds3xXXTsZ7iv3ud0MjF8dICZK?=
 =?us-ascii?Q?eDJhGoehz6Z9FzPPjHQjBDX43QXQjdxRvEmlgbOCeCRTABGEtkY6HRMGsTrf?=
 =?us-ascii?Q?3OUP26LSLgxmMJIo9FeXdJetbpksjNzPP368VjpfWbmaNIV472QEk8CBPBpR?=
 =?us-ascii?Q?vMxDBoMjFHl0JHDesiMi3StSMpAWjQrfjGz9HcMzoCH6ob97MeKXNFYUIfdm?=
 =?us-ascii?Q?tbYVMmJ7+8BrmDrDXtlyCKj/CWP4HOUCsVhRuNeGvubaQjeBybC86LHlSJgG?=
 =?us-ascii?Q?C4HTQ1wP+Tio2BaDSMxVvl7BYtk9hCOEeIRV5BfKqAe4tHfZLy4/RS5CspWg?=
 =?us-ascii?Q?svUCW0hiL+4R3p18X9rseweVaPmhsTyOdy0up9oJ4MSWkRaAjAJu16ejZSo1?=
 =?us-ascii?Q?ctk95tU/vO03ivulEhJQFhuVD92tyyfCnqgVqnsEfOmdr2TuCv15C9Oiu7YE?=
 =?us-ascii?Q?j+Hv5ggAwfVGkMcds6zIwsqFD26yFRO2wtiHYShNy98pZRzMV5W2lXg8vpnX?=
 =?us-ascii?Q?USjWQs+LjXmL91dawRU+v+j8YyBH0uHhsiibmQcA+UQzlVpr8MZAaKdscatN?=
 =?us-ascii?Q?hT1/dxJqeBM8R2bDNJTe6e63Jnbq6V+NloGt11sSjROAZ2cAlxx+/IxRJeKq?=
 =?us-ascii?Q?CZvhauzAc+E9xdGNfXOIrhDGYrSwSTgyN33d3vzDhhWrVuHqu1C6jSj8kpH3?=
 =?us-ascii?Q?70VURlUTY0GBH5urHU30M2mS0HC9nNn65/qM0bbas8loSBvEAhRNn4/Zrt2m?=
 =?us-ascii?Q?ZXWmTKctjhdD9jf1TevYEk2RQbUnNOK23oVCchp2yzxTlhtfxQjAuE6dTzcK?=
 =?us-ascii?Q?e+bpFV8UF2bE3tl5eDNp0peyVvaW8FNw4o82X0It/uiGGvynDoiUji03fDIj?=
 =?us-ascii?Q?oGOVXqzGfkgZBgU7m0b3twfGj88UOBmo15nn01fCK0E0Fkaw+wHrI65aLJCU?=
 =?us-ascii?Q?i/nyBnqRLAKUL49is7OzQfHTikoLE5VcsNMO6L9CWMJeLQRu03nRuYn57inC?=
 =?us-ascii?Q?RBO0WEuV4FZ54OoVPc7dJaMkj0XK2mS1OA2gZ8xHVm5vUp1hcvSW3Oc849wD?=
 =?us-ascii?Q?3xOgGFiP5ncMGJcOmTC6bOE0XAxWNgQx6+0fQCuFYDJiToJiHRaHjobRbdF1?=
 =?us-ascii?Q?C+YZftBc7n6+qe39gKPbj4qgPLl1jWN90GDDXVliHqWF7HjWUgllIxy1Q4Ks?=
 =?us-ascii?Q?ZBIJnhBPx/cH5Tp2hgQ5CypqCy9I8Dh6O/qULfuTijgNmG7SqgeXWIB9aAbG?=
 =?us-ascii?Q?eMGGadWQAsh8n82Eq2YYU+0JP5BWb8i39mKgFRkDHoHjAjsuuhWandFdOmcO?=
 =?us-ascii?Q?0jM6Q6y6uPLxxsqIb/zc8HrdWkQRnpNx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Jz4nd7iCoq1t+49HvHhEl4Ay32gDlzsw3YsoPEU5XrVVuKODiHlbR+Fx+3rJ?=
 =?us-ascii?Q?V3WM6hFsunKxOlequZb7gTViJaYofKkjOwE7B1zEk1Uv0ic7u4dfynXh/Ljc?=
 =?us-ascii?Q?foDMpZ24yqYJqa6pXkF3LWz491xBrGOaAm9zntLjLb0acKMEOKnaV+1jOD1f?=
 =?us-ascii?Q?hr7d4yCyWzbHxKimzn8qgVP6Ko05uASSdrpgTNp3wTU1A176dcUHvL5J+jpg?=
 =?us-ascii?Q?2cgcarBsgCPI+SGQXIUxAg0I9JZv3PsCxXfx6qhaPda0EvL+O9mUrP/J4NAj?=
 =?us-ascii?Q?4USlnWIeLMQ0C7hbnZ5NLwrLvvnvmwyj5valwcWgzs1grqoYkzti1FJRkI5d?=
 =?us-ascii?Q?UhEfXSYNFEV3Wpg0rLgMNjznjVGF8l3XflrCHS7EB83k1fYt0wgVgSO6l3hH?=
 =?us-ascii?Q?O23pSOAa5OLO/2SPq9taS9cmSKHRsHcFwg2cuqdfUb1s6CB3X9B3ow+10du/?=
 =?us-ascii?Q?tce+hDi0gctkNjUwSpXGwMLSmXg8hFMBl5pzLJ0JIAPUt1B5ncBE0WyMmPuX?=
 =?us-ascii?Q?WddtO0aMjR6aJp4AxgXZKprgHbc5jrxPRF87EqpxJcAYsdojn//Uj9pBphob?=
 =?us-ascii?Q?2e9a1n0OIAYaLFP2vUvXyPa7BzW1mT7A/zcijN2UJBqi3Jm6U0JNdX5ISs1o?=
 =?us-ascii?Q?hHv+j9Kgdf7krMqVtmX9uX7jWEmec/OOmC5H9wNivUXCzo+57ZFpAkzxGNB7?=
 =?us-ascii?Q?bwyMmAgZxFe2u2iCJc69Y6Fuge2v4H9cfqW4EMN5GsLKxPdJ1ohrNYhLqpj7?=
 =?us-ascii?Q?5xmPJONm8+26TLn9zBrHBw8kmiQDXfkyjz0ypeLlhr7sJ9+Fcv7vMqx5kEDX?=
 =?us-ascii?Q?OS3zKtiQ/hsW3dLFgKd6yU3NXhs3QOd/aVf456mVWhNWlr6bijZRYLKPQ6Ki?=
 =?us-ascii?Q?BoVSKqLYNT8iiz56pqQPZERTKcGTi/id8qvqwORjlAXs28kyu6zIALid6jfU?=
 =?us-ascii?Q?jItsEIM5d4jyVsIugNNAKhhNTy/BrCyzsTdfGHRGDTcrK+Q8oVAviV47zXod?=
 =?us-ascii?Q?lQps0cFNJ+FqJ5Dkheur3xl9ZDKaF4/iSdF4399tid6jICCGlbFqs+9Q6km/?=
 =?us-ascii?Q?lsmSq4N25KAxsJ9Nmwb9QUguPWd6R3cajGM6IUaMW1PVxVabRe4rHibNwFpa?=
 =?us-ascii?Q?LOJ4iZv8QNZy0r4u9JSk7AYOPzSHWHEGuWfpTyYPcE5uHLBPiVbJ+Ob6M49k?=
 =?us-ascii?Q?iwzj6JWmAlC0ZbnMM/ant5q5TWpD18fv1jVCpijkIOc9YparUOoWP96Rm7bZ?=
 =?us-ascii?Q?d1Lhja3hYO7Eag0hMNLcE7QTyamuGx5w+ofD2ni2/C2rCAohy/NNwVtRWFOS?=
 =?us-ascii?Q?nvZWnPW3PyQSoxR+0Nha1Smqw6hNbAQQWTZ6dN6V5YiqW9YWW8vsG7Us1a3u?=
 =?us-ascii?Q?JQTBlVofz7OO4aeQkZv0VVa9gQU0As2eDk2Rg+OiWncxsKfnf+OsPx/QztEP?=
 =?us-ascii?Q?Q+LaoDvUgWoAesaIdjwJfwLFrkZU2rLHKvmMGBIqdyTlG23ZvHThVSA3d4WE?=
 =?us-ascii?Q?XxDr7Kyc37NlZYDCOZkovl2/bowoazAiSP+arH2mfPF+Iq/4jBGJ8Nn9DEPe?=
 =?us-ascii?Q?yApg3u9zKwv42FBXBs474c6snguJ3bYc1KmrsrHL?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 553a780a-8490-462c-764b-08de003012d5
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 14:46:00.9021 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CPNwlf7PuRzp2WCNhOPO1fTlOU/mUNnkCWR9S3nUEpCGcdMNybkH/YzCRRUb1Sc5or7/OXujWloHQPYnkG57wA==
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

Similar to bitmap.rs, add hardening to print errors or assert if the
setter API is used to write out-of-bound values.

Suggested-by: Yury Norov <yury.norov@gmail.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 rust/kernel/bitfield.rs    | 32 +++++++++++++++++++++++++++++++-
 security/Kconfig.hardening |  9 +++++++++
 2 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/bitfield.rs b/rust/kernel/bitfield.rs
index a74e6d45ecd3..655f940479f1 100644
--- a/rust/kernel/bitfield.rs
+++ b/rust/kernel/bitfield.rs
@@ -29,6 +29,20 @@ pub const fn into_raw(self) -> T {
     }
 }
 
+/// Assertion macro for bitfield
+#[macro_export]
+macro_rules! bitfield_assert {
+    ($cond:expr, $($arg:tt)+) => {
+        #[cfg(CONFIG_RUST_BITFIELD_HARDENED)]
+        ::core::assert!($cond, $($arg)*);
+
+        #[cfg(not(CONFIG_RUST_BITFIELD_HARDENED))]
+        if !($cond) {
+            $crate::pr_err!($($arg)+);
+        }
+    }
+}
+
 /// Bitfield macro definition.
 /// Define a struct with accessors to access bits within an inner unsigned integer.
 ///
@@ -358,9 +372,25 @@ impl $name {
         $vis fn [<set_ $field>](mut self, value: $to_type) -> Self {
             const MASK: $storage = $name::[<$field:upper _MASK>];
             const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
+            const BITS: u32 = ($hi - $lo + 1) as u32;
+            const MAX_VALUE: $storage =
+                if BITS >= (::core::mem::size_of::<$storage>() * 8) as u32 {
+                    !0
+                } else {
+                    (1 << BITS) - 1
+                };
+
+            // Check for overflow - value should fit within the field's bits.
             // Here we are potentially narrowing value from a wider bit value
             // to a narrower bit value. So we have to use `as` instead of `::from()`.
-            let val = ((value as $storage) << SHIFT) & MASK;
+            let raw_field_value = value as $storage;
+
+            $crate::bitfield_assert!(
+                raw_field_value <= MAX_VALUE,
+                "value {} exceeds {} for a {} bit field", raw_field_value, MAX_VALUE, BITS
+            );
+
+            let val = (raw_field_value << SHIFT) & MASK;
             let new_val = (self.raw() & !MASK) | val;
             self.0 = ::kernel::bitfield::BitfieldInternalStorage::from_raw(new_val);
 
diff --git a/security/Kconfig.hardening b/security/Kconfig.hardening
index 86f8768c63d4..e9fc6dcbd6c3 100644
--- a/security/Kconfig.hardening
+++ b/security/Kconfig.hardening
@@ -265,6 +265,15 @@ config RUST_BITMAP_HARDENED
 
 	  If unsure, say N.
 
+config RUST_BITFIELD_HARDENED
+	bool "Check integrity of bitfield Rust API"
+	depends on RUST
+	help
+	  Enables additional assertions in the Rust Bitfield API to catch
+	  values that exceed the bitfield bounds.
+
+	  If unsure, say N.
+
 config BUG_ON_DATA_CORRUPTION
 	bool "Trigger a BUG when data corruption is detected"
 	select LIST_HARDENED
-- 
2.34.1

