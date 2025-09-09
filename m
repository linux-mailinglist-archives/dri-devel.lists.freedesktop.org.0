Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD156B507FF
	for <lists+dri-devel@lfdr.de>; Tue,  9 Sep 2025 23:21:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BCC510E801;
	Tue,  9 Sep 2025 21:21:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="CWL+mVCL";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2084.outbound.protection.outlook.com [40.107.94.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF3F210E7FF;
 Tue,  9 Sep 2025 21:21:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y2UmbHt6SOE9UlRWdrcg/PYDMHPtWPSIITEEqdPTkGwfY8RHJUCfYUMO9I29o+oOxScxeccEnLAFKdAn/6g4w4fBIiCDjxj/x3YKevwVo6frBJJjwO0jLw3LivUcd+PJYNZ0KhfYphuYmiaZ3RI/8t873v7ZtXsxWULnTk40GHFFgSvGXB0tMVSIuHfIjpCrUGb560C2NudvvFI53Ogo0KuAzKIwWRkJ9mbxwLpdLs1Vwry+LPoBcHVpI+vbRkaj7oNP+hL0+rYcxt1pO94fnYjJ8XLMzkJi84plZ1qqtm0HlPn73tEpKSjb55UyiZfIG7XvgWUdOkxgHNPCOnM28w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dygLGICj0TKOZ542+yk7yMFeePqPVbCHPBwzVmwQXWk=;
 b=G5gPT63DLf6amzW54DzwDRXj7Gri5N6ttD6k0BRCZ6jwDR6sA/BY7X9ivQkjfQNA1TwokM2UDd8J9BlpH3/zIG5xq1XgQzG6vJqIRHmQMuzkG4ECfPexQIqM+N3p/FsHTw19hE+JHWCgeCuNZSdCjrAVqgiS46YTXixIGBAftPeDQ61h1D766sfyHlat95HVUe1ww0jNL6aGFNIHIbukIRMsqHNIY6Rm0mWAhwESwmU9GLH6WMkX7b0aGXNyj4G14P5PK6Yc+Iz7mEUAT2dD7rUDAEl/v7saqGqPqpnlUvkfqrq9vhQ6z39mFdgVYuFZNoZ7kUtk/LUCf1Z3EiFqnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dygLGICj0TKOZ542+yk7yMFeePqPVbCHPBwzVmwQXWk=;
 b=CWL+mVCL5pqFdHycdiNNdCrPk9rYUIv38KrXJ0/HRYT4eRhuc53TVUA3H5TQj9IML7o9vMiHXMh2BM6gF+LRwoggtwQcK4XpPYAluyuHlV44a6251l95VmhXhEWMk3Kg8S/+gDNXsMjFKN6DR77CLVJBpm8Nis10CBZEiMYsSgUfy3YIe8RRN0zcbuUVl/dRzzyqgrGb9pJE+zRULQsAIwDrtbTGyVDqhskuzsWqfpK28AhOc5hB+5M3FkDjC0mesHNm58ZNTqBz8jKJGlqAass08eJYZwSUzCo+HBi17RKPtRznpmSz4QgnfD0TG+qh4T1TZ6ia1jT/52RyjAUL3Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB8044.namprd12.prod.outlook.com (2603:10b6:8:148::14)
 by MN0PR12MB6031.namprd12.prod.outlook.com (2603:10b6:208:3cd::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 21:20:58 +0000
Received: from DS0PR12MB8044.namprd12.prod.outlook.com
 ([fe80::49af:9ef0:2373:1515]) by DS0PR12MB8044.namprd12.prod.outlook.com
 ([fe80::49af:9ef0:2373:1515%6]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 21:20:58 +0000
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
 Elle Rhumsaa <elle@weathered-steel.dev>, Yury Norov <yury.norov@gmail.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org
Subject: [PATCH v3 5/5] rust: Add KUNIT tests for bitfield
Date: Tue,  9 Sep 2025 17:20:39 -0400
Message-Id: <20250909212039.227221-6-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250909212039.227221-1-joelagnelf@nvidia.com>
References: <20250909212039.227221-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P223CA0033.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:208:5b6::8) To DS0PR12MB8044.namprd12.prod.outlook.com
 (2603:10b6:8:148::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB8044:EE_|MN0PR12MB6031:EE_
X-MS-Office365-Filtering-Correlation-Id: 176406d9-7dc7-4ddd-d668-08ddefe6c4f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?QX7E39w62smhWHMkrEBfrl26fIcpxTJMeulQ2+NsjjWFjwNmgmk4n/j99qqs?=
 =?us-ascii?Q?p/iAuu8TVZN4RoHPrus1IAkrIxYTe2rTwZJfkUSqVqp0eKtfRulaCoryeZnC?=
 =?us-ascii?Q?MLyo8L9A6JDpfI4NidmFdUDga0cWg5bwTBNYFU8Dwq7KmULkNYBuSfV3UZ11?=
 =?us-ascii?Q?tCUsoWF4qOpqPSX0oShxhaqvAgmMqq98PSNAFL2eUK+JQP4dWiwBeHGIREp0?=
 =?us-ascii?Q?r6G/EfsjCrhSznwY1vMoEa8JckzfAyLZrRpsChL4NazgCAxXvGKbBHKEw6gq?=
 =?us-ascii?Q?feyZXEJOtX3nTKZdgQ8dCQt4F3TcrIsJo8uvjWa7nmSocoig7lnhnVZu2sNI?=
 =?us-ascii?Q?QPoZWRF8/q1KRrbI+AlkA5Xlnb4LiwYKyh617ohoxbgPCHElLU3EFJJ54PCa?=
 =?us-ascii?Q?1sO38YDfZJ/Hqrqfd6IQOb7AiX5mqiIIlMY6QDpOxRLlmckMKcDCm8sTEK6b?=
 =?us-ascii?Q?DnSKSZb2AEaLYk6mOYfnr8snT4f4oq+lJF/CbXlki+LJavGZbGDevpnhH6J6?=
 =?us-ascii?Q?tDmIIctbLIPetC5aHU9iEOcDfoJIPxKA01JD+7zJWEOea9IvamwsgN1ZyzBl?=
 =?us-ascii?Q?Nex0xmi+uFsJ3KOuciKnGyB9U05qJAs1HMaRZHItWcfhAqZJ2k1B1tBN4yF8?=
 =?us-ascii?Q?iAxov0RWuqqQoIhdtlyZ+ZtB7tCOcIw6FKR6s1OMLbSNcTjMrO/ugCq37p+y?=
 =?us-ascii?Q?umZj06iD5ZEZ05bUHh+Aci9otjNhZUR4HmhNIs3zegahB2wTMFiW4+1027Yu?=
 =?us-ascii?Q?6JZhgDo+T4kWErnyZJxZMqqhFeePIeBONVr69PtvA3BrlBU0s20AC4EHywB5?=
 =?us-ascii?Q?PggdCoztDFQGRoYg4isyU3D4VkOouxfhvkdnqAOZUNfzHkgIz8O2mTvLp1sK?=
 =?us-ascii?Q?XUdAirKn6tm4ITaZ/8ErC4HG1Cqnq6ex2eWPdj716DJ2V3I2EJzU6uhMVa7I?=
 =?us-ascii?Q?L1kg/gR+dmSHuF/2L0SFRoXO3M3rEolqBaKa+lzCiWmHQ+35cfhvJdq5riWy?=
 =?us-ascii?Q?Rn43zBribkEM5YZXBWvspG8VnJff5FB/fKHRJL7Qpu7psTr+DKpJmTrQSuvR?=
 =?us-ascii?Q?P2qWJMNbFkcu3SxcAFHRXeIMCcGH8W3pWNCEXrsa1ViFkOtFO6wM9w21T0fJ?=
 =?us-ascii?Q?3hbmGW8aO4fsiELUiOHVxwc8v1x1fFoZNGly7S6n3wJnAOTZTvZa2dQ/g24n?=
 =?us-ascii?Q?VOrBpCjgIXnxxyVUPCgQ5/1H57H2q3BI3V5SS9hbbWYwnb2CTfV69+cqpgCe?=
 =?us-ascii?Q?7QmwUAmntUSyM0Qn9auonzSPJ6C26asvRzJuw7xvz3tjmigmYSTAyjc+uWQN?=
 =?us-ascii?Q?RhOobbSXCtg3q99H27zU7bn1pVdABBHITR7IS66+ax9wifFwZpF/yWW6u1W0?=
 =?us-ascii?Q?qy5x2UTPPZSyhGzLl2Hq93C/08vFIXVEo/lh5mVvNk/w6UlVWMMIomnfx4rg?=
 =?us-ascii?Q?VSLArCiHhuw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB8044.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F2ZxOL9V5hOFbWFXTDvITpGcA1yF6sFFh/VikK9MkB3MmEPWzR+e7ld8qWFH?=
 =?us-ascii?Q?+QvzNEoOkOOHQaFbNB+BiAGEIl3OEVcSvfXSApZ3mWBpbWupiDbJubFcID33?=
 =?us-ascii?Q?vnDwGpAXtq1VBQVYqLC4aluHyYwDu8nchwsQ0AIL9OI6GwHgbfKX7Ab+0LET?=
 =?us-ascii?Q?POJ0+o9E6t/qVDsF6fhNpRxKDhIeJsrLmd6UOZoCReGluzq7EJ5XHfGuUmi6?=
 =?us-ascii?Q?cBSHwveuH6M9G84w51DzYTfFoW3ctISTen3PvhqR1vRjfM/6SwH2oXaO1bLE?=
 =?us-ascii?Q?WjY0qRF90pHkYTsuzs546hDQ1QbPuEPiwOR/8+6W1QnzmUbZJAPeA2oU7FLM?=
 =?us-ascii?Q?16m7hUHIdbRNSbx6ex3c4UwKJHiU1StJ3A0JXSW4U0inQ0HQqs55Ar7Qw/LA?=
 =?us-ascii?Q?15pXiBejmEZfQrc3cIgdfWhz9l8bULD7y8mONUpxJwJsBUD/GzHZZEy4Ho2e?=
 =?us-ascii?Q?P0rs4IEBxCJpdWJVB5+bgr3JQ6DZ2EZhiPVGDrZBNs9ydKKWzWtRQRL3Shhl?=
 =?us-ascii?Q?BmHkI6V3aNKkEV4SyRrtQ1WegU4mLN1kpDnyAt9iUXWnKoGmd1UX4gjkzhkm?=
 =?us-ascii?Q?SFie5nP9q+vGdjAQuihCr75qGcan+LLcpRRhWzf6d485FmXdE+te1xtQc0bF?=
 =?us-ascii?Q?a9iDQS+BhgzedEfvg2eIn5qHWMP2IRFiy6A6MegH8UU0ANuYgdyF6+a8Bv3G?=
 =?us-ascii?Q?Co/Qum6Vklmv6PRRZaBMDVTlHg7J9J5sc8e5UwBIAa3A0y0t6+1iGrYynOZB?=
 =?us-ascii?Q?GX8BNmmAjYtKCmRESwbK5xUOZc9f7Zy2KMGsInca84NYhdUILmUaeRNZ4FJP?=
 =?us-ascii?Q?7pcGKDXQU315jt3E/quOX42gZPqxiJNlpuuqUZRxVEsmZhPkJzHI8cB39XPk?=
 =?us-ascii?Q?ggMxCooSmPHmDlB3l6/ZXKeFS6bHHrASP8w/YUjHh739Jn574BgJ1fjBn4kY?=
 =?us-ascii?Q?9pWJA/LMQabGNW5nIbRvG0cN4bCQ14RpZRJ5IEmKaSvlrNRE8ke1A6wog4Xp?=
 =?us-ascii?Q?HpCz8R8JTQZ17vuRwrIHkhBuYMuWrB9/bzBIDDtfTtLF393Wwp0iFBEzm7iA?=
 =?us-ascii?Q?XvCuJPY0NwIqWwBPhArId5DLk0zF2FNpoZ9+QJvzfIq46pEC1QmFa50i5B4E?=
 =?us-ascii?Q?XNTsk2VW6+yIYSY2fZPv0hHpJ5ejwfce2mvq1/odOSaczaZdPjyDERwCEZ6F?=
 =?us-ascii?Q?U0LRbbax/Vhmgrv38BNJTg6d3wc07aNXbj2uFZHj5rUYM+skONskjUiX8CSs?=
 =?us-ascii?Q?yg2dwSBwIWjRmi3ZTW7fo+AsVndA3A2eDO1GOpo3YxliElbLHblshtLnOpje?=
 =?us-ascii?Q?KfyZlzcFwZrT7QYA3dbZ3HGESPbcwO0K5UkDN1bYMUKcMgfKt4Tsm7N5RxVs?=
 =?us-ascii?Q?NgA/3hQESyTnRUFTPBNhSdnCZq03jtMEYO8FkgsCIEIyhV19/9WaHYC/CT9L?=
 =?us-ascii?Q?4YUW+jlEIg2aoFOspBOJ/E2xcJwU2PzjQOnmHYz7nEHj7r1+rytdHKwo1ZQc?=
 =?us-ascii?Q?W9SGistzuSUBQSCgXTHfod77zPuY/irw7FW/s6O672eJThY3l9oZT/FWLjbr?=
 =?us-ascii?Q?CcLuSyafKKlAAU/iWdz/966JAWqFStbP8KucQy2j?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 176406d9-7dc7-4ddd-d668-08ddefe6c4f9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB8044.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 21:20:58.5896 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rAcXF2lErk39CVtN39WQjIWF/Zo/pLo+L8RYyxnNuH+bhXMcfap2SqsBok8UeJ7jrNMzujyLg7uy+5cPNjswwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6031
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

[Added range overlap tests suggested by Yury].

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 rust/kernel/bits/bitfield.rs | 320 +++++++++++++++++++++++++++++++++++
 1 file changed, 320 insertions(+)

diff --git a/rust/kernel/bits/bitfield.rs b/rust/kernel/bits/bitfield.rs
index 0837fefc270f..f3134f2ffd08 100644
--- a/rust/kernel/bits/bitfield.rs
+++ b/rust/kernel/bits/bitfield.rs
@@ -339,3 +339,323 @@ fn default() -> Self {
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
+        struct TestPageTableEntry: u64 {
+            0:0       present     as bool;
+            1:1       writable    as bool;
+            11:9      available   as u8;
+            13:12     mem_type    as u8 ?=> MemoryType;
+            17:14     extended_type as u8 ?=> MemoryType;  // 4-bit field for testing failures
+            51:12     pfn         as u64;
+            51:12     pfn_overlap as u64;  // Overlapping field
+            61:52     available2  as u16;
+        }
+    }
+
+    bitfield! {
+        struct TestControlRegister: u16 {
+            0:0       enable      as bool;
+            3:1       mode        as u8;
+            5:4       priority    as u8 => Priority;
+            7:4       priority_nibble as u8;  // Overlapping field
+            15:8      channel     as u8;
+        }
+    }
+
+    bitfield! {
+        struct TestStatusRegister: u8 {
+            0:0       ready       as bool;
+            1:1       error       as bool;
+            3:2       state       as u8;
+            7:4       reserved    as u8;
+            7:0       full_byte   as u8;  // Overlapping field for entire register
+        }
+    }
+
+    #[test]
+    fn test_single_bits() {
+        let mut pte = TestPageTableEntry::default();
+
+        // Test bool field
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
+        raw = (raw & !(0xF << 14)) | (0x7 << 14); // Set bits 17:14 to 7 (invalid for MemoryType)
+        let invalid_pte = TestPageTableEntry::from(raw);
+        assert_eq!(invalid_pte.extended_type(), Err(0x7)); // Should return Err with the invalid value
+
+        // Test a valid value after testing invalid to ensure both cases work
+        raw = (raw & !(0xF << 14)) | (0x2 << 14); // Set bits 17:14 to 2 (valid: Device)
+        let valid_pte = TestPageTableEntry::from(raw);
+        assert_eq!(valid_pte.extended_type(), Ok(MemoryType::Device)); // Should return Ok with Device
+
+        let max_pfn = (1u64 << 40) - 1;
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
+        // Test using ::from() syntax
+        let pte = TestPageTableEntry::from(raw_value);
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
+        let pte2 = TestPageTableEntry(raw_value);
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
+        let ctrl3 = TestControlRegister::from(raw_value);
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
+        let status3 = TestStatusRegister::from(raw_value);
+        assert_eq!(status3.raw(), raw_value);
+        assert!(status3.ready());
+        assert!(!status3.error());
+        assert_eq!(status3.state(), 0x2);
+        assert_eq!(status3.reserved(), 0x5);
+        assert_eq!(status3.full_byte(), 0x59);
+
+        let status4 = TestStatusRegister::from(0xFF);
+        assert!(status4.ready());
+        assert!(status4.error());
+        assert_eq!(status4.state(), 0x3);
+        assert_eq!(status4.reserved(), 0xF);
+        assert_eq!(status4.full_byte(), 0xFF);
+    }
+}
-- 
2.34.1

