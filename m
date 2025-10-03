Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E076BB75F4
	for <lists+dri-devel@lfdr.de>; Fri, 03 Oct 2025 17:48:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C0C310E943;
	Fri,  3 Oct 2025 15:48:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dVwjQyLk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011025.outbound.protection.outlook.com [52.101.52.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CCB5910E941;
 Fri,  3 Oct 2025 15:48:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ROjrY+EwwIVQncMrNEiznxkAm9GR/VYz7uRkX24ET0MF74b6EGSw9XtaD9wQVwJ4gRV3ApmTf53jsvC3lRC4UZBmtLJrz1dkiUybyW7fIkwamLjfRS5AF56zHiahjpFnJoY9mYFa/bDjKmFe72eqB4PThWl9HYBV69cRDVVfvr4i7zd8u0XLWPeD5YLmPc2zB99Iqz4O/RttZLQxUQku3WH2Aqk61K2yVoITgq5nnk0ViyYAVX97u8UehytmANk2z91avI0bjSWbE6FW+IXExa8+HvdiZUImxuOZ8iqS1S0vQiFPbek1PnTE0nNGhmC/ujwVZeSaTzk81XC1W2nG9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=irXmGebk8jrwl3Ma14svHRfkrqEosrVsZTlmxLLa1/M=;
 b=vu76BHqJwHD9VdgnsuLDtOZjomTkvoeVfCn/KCLPFhq8vPeb5ZlJUyKVMSQae1RrCGWbtbqkdFK30yxg533BykiLoNZbm9StTj2EQ0pvJ8LG8CfQYQ1cFMKwkARs7JDeUmRCnPTyEU4L1x3T4tZYY+j2ZGzcE3oFsRcnBS6tZ8U4VqQlIPgtZ2f9RypuKKtEEAHcyn0WrRlS+UchWdUbi4afC49GSwg7zs0AsOqxOYR5FGI2GLUlPGcEcPnpCScVKAYpNydqwU0XKMP44yuMJHsC0n6IUHD11N1uG8+XVKASdzHkLfLicTIibduWgeLt0kU3T2WD8xsA/kpIPhJs7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=irXmGebk8jrwl3Ma14svHRfkrqEosrVsZTlmxLLa1/M=;
 b=dVwjQyLk3+OcXH4dLpf5s+xwEz0zoFW7EV8etetutw4SCwBPukhA/cp76TXN0rbWLIXMPb3jzFvfV2vxvobv54lI1myVauUVgHkmIqqBil4/oSzsXGCrZ9YCReD8IU4D6NrYjp7/ClNhB7pHUXuPf9kz5CPASNaTtXF3qab4hDoD3lVq2wHHxKIyVLtpNAe+qMQ0t4CMZnUEcROuZ8+mgJRj0wTU21jb7V8a2kJt4SsONsilgHXF4rNOnpvQUCFopuAbAI9VPIZ5LxNo6bS0mF/ETRF1fa7vMzcWhAdkL3yQFm6MyYHMmnkGKE0LKAEnogCznO7X5RdjqCwL93q58Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH0PR12MB8152.namprd12.prod.outlook.com (2603:10b6:510:292::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Fri, 3 Oct
 2025 15:48:03 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9160.017; Fri, 3 Oct 2025
 15:48:03 +0000
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
Subject: [PATCH v6 5/5] rust: bitfield: Add KUNIT tests for bitfield
Date: Fri,  3 Oct 2025 11:47:48 -0400
Message-Id: <20251003154748.1687160-6-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251003154748.1687160-1-joelagnelf@nvidia.com>
References: <20251003154748.1687160-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0184.namprd13.prod.outlook.com
 (2603:10b6:208:2be::9) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|PH0PR12MB8152:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b2b54b2-c44d-4b95-540e-08de02943cd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MMIH3PiYeidaBSVs9EvupD9icVX+LOT6TETWYce1stjNwuwFA/axL2tGuMKn?=
 =?us-ascii?Q?1uTUfw0Rj1zPCar6llcNY56hq/jNFq3AAurF3M0TRvhp/cKqeUxa9qcpRKi6?=
 =?us-ascii?Q?qmTIHy/hbKJ2/OW6/+9uyVLZnVuBZrj96tkAo+0idZFlO1ac2AofS23GmqJo?=
 =?us-ascii?Q?bTjUxuX9iOjO7cz5vQOH3XwFoCTK9XKUFilwoHbkYiNRju9GXtMnKUTpJISG?=
 =?us-ascii?Q?+F1d0zT5swiq04kjCUKus8BxPQhUcLcxrzMBziTFCNKQE4UhNc71fls/ukDZ?=
 =?us-ascii?Q?R9Dk7mtbGNgxSDgHuklF9qCMgYaX3heVxH9tQ6t434Gpybjykw7+EkVv+H5k?=
 =?us-ascii?Q?QxHUIkPg0rDd9YPieZYCgILHdM5/7Q1Te/CL27s5wzocqG2I6UQGT1loy/qn?=
 =?us-ascii?Q?RdMgFXJQKBiz/4An3AlR5lYOFFSfqnyxibfbABi+5wS2CnM/hgGyxb4v5rNu?=
 =?us-ascii?Q?8GW2cfTEu7Gtb9UHRt/9+T7heYK48oibFWQ/NVUm7/S4ZYwQHh9frmrw1p7+?=
 =?us-ascii?Q?tUfbB+fK0BnvTpuDeS+xOh8q5A9LoW9OsVZMiKpvMm4VHNsqXwc6WyO0DmSH?=
 =?us-ascii?Q?Edz2tPgnniF+KvWg0qDEaCpw6Tjr9jtLkvxiUfdQFT1Fv+p9LS+MGTVqLpXH?=
 =?us-ascii?Q?su9ot1Ku0wVJnQwAb4dFpyFzcuOrBnEC7E0tLxNZXVpCEIlXiZqhsWnpsZoZ?=
 =?us-ascii?Q?b4G0u8ZJoyc/o9WBV787yx7U/rlp0cIHq/kI+rOl1y31SkXJWcEtsh973HMF?=
 =?us-ascii?Q?HI+bsWd8c0kqeSPOrXakuvYwJ2nzvoEJCO+yVEHMzgWUhOY7Vz09Sj4DUG+c?=
 =?us-ascii?Q?W+ca2HNW4VPe8dddNCHPBURvvT7vlQFvNzG6BkLyMDov2g238dAuVU0Ml7SX?=
 =?us-ascii?Q?i25sfuWvTyQxkQdFQn5Mq/V/fUHJEHw8TvpXLyGuFpI91+o3PlGap3WU5/fJ?=
 =?us-ascii?Q?/LDYf3V58maHXQ3LwYUGdbLfIEODHLFzyt4jmOtDnqBenTWG+sxpfduq2W5s?=
 =?us-ascii?Q?a/m6VZXfZQ8vjUADO7NxOgFCDf3t6s+2ZTVjI+hbJcGHD3FGXGcAL2ojlns6?=
 =?us-ascii?Q?YE9+ntQmB7LwPH/HEhmq2yhmMa2qKNJdEUFr+dmloGbs14ggFtDLbd18c873?=
 =?us-ascii?Q?3L7HspAkpdxcpeA3Lu2UpXM6wncwz05Eu/m5GIDrUCMPMUTxebwtFV3k9LEU?=
 =?us-ascii?Q?6TJjQsfrfWycuLNBxEgR9Q0PQdVeBFkWf/Be6jBcNzBd0AKYlHfjhMpoRsDg?=
 =?us-ascii?Q?ND2J31+43R0ovSUHcTXlZVjy5nvzn8jiK+pZ1pu/GArWW9/yfmEENk1nu3R9?=
 =?us-ascii?Q?QmkCSJ3X6XQAIrcTFQ1aB7LwLd9lZNArf9Q0jqZUEe3jfOCEyYBZKO/KxX8G?=
 =?us-ascii?Q?H+RqKlVHJ3Nmqy8JlgHSYsO2WanJkVlKyd9YtmlrrYSn7qRgOg8yC2P2Vs3h?=
 =?us-ascii?Q?T6chkkkO5Txq7JF0No8NHjn3tyM4GGSE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nqhoUpzVbWQ9X/ZNVlmzMznkuJU2DtwoJv44ZzHbgvR5JyxZQHgTRd5IWxUn?=
 =?us-ascii?Q?8D1SWVnH2e6hp4sc8uIit1dmx6Dz7kwDJnvHuTJg/GSL+uqC6ogQx9dHC5F6?=
 =?us-ascii?Q?+JzZilKKGCgbJ6SA51GVtNtLiV0HeX6ZYTHuVWPtVbqHG6O2WxLSC+DH+hOm?=
 =?us-ascii?Q?OcKaHwXLm7YGB96Ph9No41ecbviQYvMgdVt4EWvbs7NBLm5xhEl6P3irUich?=
 =?us-ascii?Q?ZfWhQ7gum4jR8VJCne1z3TgR7MhuQGM2jr31yPbSJtju0ITqyj9I1tg37JqG?=
 =?us-ascii?Q?h1Xrj43bRwb+g0JHF6MUwtIQuxp6rE7WU2fnJIWDeWZVgEsl5DIZh6MMWZ4C?=
 =?us-ascii?Q?J4aRYvjdBluKwfpLyQYbHm45+8LCoJv+2DwjSvG81KpbkpG5HFO/zGR7oB5y?=
 =?us-ascii?Q?WVCnaOJVKC6e2QwFXeu5picgBdYS/vJsmFH5i73JztvPf3Fi1KmNV8Ep+asH?=
 =?us-ascii?Q?XTBoolgd18SBK+LSJ+Y0sLyh0Npw4bHrlDkz5EDnDcI5co0srSulZe76Hk5M?=
 =?us-ascii?Q?UbGiqefZA5w/WmvGWVhHK3buyiwHXwOVYMJJ+0vGDR+Jxt06qEx0lptP2h+o?=
 =?us-ascii?Q?GT/Gq0nUq2EWvdi/Dnr3CktsHjzuM1N4F/eOIyYnkBjuxHnDS2+/UY/8n0cS?=
 =?us-ascii?Q?jmx4AHWC4gysrmxUoFgdB6AY0HvDa7LhI6Koqt5XbWZGZ3qpV8FKi1CpEnKx?=
 =?us-ascii?Q?1cs0u+1LI1sqIvy5zoS6ORa4wIaxsKGfrVsQFnxGpUgnEw7ymDyCGen0Y78M?=
 =?us-ascii?Q?xhGbEZeg+aB0dAo83dtkj/n84uDMlQzAVYoHz+l93BAyrxFiRaPfHrX4CuH9?=
 =?us-ascii?Q?OcX3502yE/soGR5f2TjnojsEOd1aOcYCXm/rlV7+0aiHrvAjNLmJyX2I+JgP?=
 =?us-ascii?Q?7YMARqr/q6zQkepIFD+uAj+EU2Bpo426IQg+3R0k91xbCUxLP0dIWFLeILBE?=
 =?us-ascii?Q?3yep8fE0+S9nkiWCzfx63vqMFO8E7GmMwbGOH2DfUFBMGllP0TsNSpUounOn?=
 =?us-ascii?Q?vFM0wCrvIQRKtL2+gSvPj42tP5hbylXxaaLCbO0ETLiXqxI/tdlCq6vnfA7V?=
 =?us-ascii?Q?xR29ykXwLnFqnhIMFVBrDJfyCsZ1+59RostrLU/7lfn1v00kgpW9Ot8wp6wb?=
 =?us-ascii?Q?bzG6qfjKhxpCiEWjtIpgbO5dBosz5gZPiayHeQq7U0GEuYaakmDqWnyTQq3n?=
 =?us-ascii?Q?cb0KZ0v6M591VA0sbOTWuHA4KTf33oFY6I6VGq+1J5HBhaOQIBA+QVXCd0wY?=
 =?us-ascii?Q?tscJvJHtGicGziepYaRtJ0dGs3h0MwiHDkeXntncb5bOEd3G1k8DkdktqijF?=
 =?us-ascii?Q?YjYW/Os5mDiax9e0YktwmuwfLrBTQYajcHBPkvamNR6N3Ld2C76u7xG5RjLt?=
 =?us-ascii?Q?zBQ3FV/rhYGQLYBPNdOJyP6K2J3i4e3goHj4lsgoTawgQ72JI6FscwtiR6Nw?=
 =?us-ascii?Q?Kiu87XrHlZHKOIBN90Lb960rCyoCQzNes8I6xj9Yei6La1Hfn/pMDT8sMox6?=
 =?us-ascii?Q?IoNmFcgyKHWV3LZ8VdV0ubEOcVsRTdU0y+mQWVPzV37OCvMtcoZ8H+f+9o4v?=
 =?us-ascii?Q?UqZlKyUM2+QIVvALcc7qOqajtvGvKzNXUFlWQGex?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b2b54b2-c44d-4b95-540e-08de02943cd8
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Oct 2025 15:48:03.4504 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ITk4Bd6otR/hKDJixZawEq19LFei639EhU8CXtdSku2Bg2p5kxsVWiwMMdH8xKqBAWRIlW2M0Kkvr1Gp0LYVsg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8152
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
 rust/kernel/bitfield.rs | 323 ++++++++++++++++++++++++++++++++++++++++
 1 file changed, 323 insertions(+)

diff --git a/rust/kernel/bitfield.rs b/rust/kernel/bitfield.rs
index 09cd5741598c..f0e341a1a979 100644
--- a/rust/kernel/bitfield.rs
+++ b/rust/kernel/bitfield.rs
@@ -329,3 +329,326 @@ fn default() -> Self {
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
+        // Test overlapping field reads same value
+        assert_eq!(pte.pfn_overlap(), 0x123456);
+        assert_eq!(u64::from(pte), 0x123456000);
+
+        pte = pte.set_available(0x7);
+        assert_eq!(pte.available(), 0x7);
+        assert_eq!(u64::from(pte), 0x123456E00);
+
+        pte = pte.set_available2(0x3FF);
+        assert_eq!(pte.available2(), 0x3FF);
+        assert_eq!(u64::from(pte), 0x3FF0000123456E00);
+
+        // Test TryFrom with ?=> for MemoryType
+        pte = pte.set_mem_type(MemoryType::Device);
+        assert_eq!(pte.mem_type(), Ok(MemoryType::Device));
+        assert_eq!(u64::from(pte), 0x3FF0000123456E00);
+
+        pte = pte.set_mem_type(MemoryType::Normal);
+        assert_eq!(pte.mem_type(), Ok(MemoryType::Normal));
+        assert_eq!(u64::from(pte), 0x3FF0000123455E00);
+
+        // Test all valid values for mem_type
+        pte = pte.set_mem_type(MemoryType::Reserved);
+        assert_eq!(pte.mem_type(), Ok(MemoryType::Reserved));
+        assert_eq!(u64::from(pte), 0x3FF0000123457E00);
+
+        // Test failure case using extended_type field which has 4 bits (0-15)
+        // MemoryType only handles 0-3, so values 4-15 should return Err
+        let mut raw = pte.into();
+        // Set bits 17:14 to 7 (invalid for MemoryType)
+        raw = (raw & !::kernel::bits::genmask_u64(14..=17)) | (0x7 << 14);
+        let invalid_pte = TestPageTableEntry(raw);
+        // Should return Err with the invalid value
+        assert_eq!(invalid_pte.extended_type(), Err(0x7));
+
+        // Test a valid value after testing invalid to ensure both cases work
+        // Set bits 17:14 to 2 (valid: Device)
+        raw = (raw & !::kernel::bits::genmask_u64(14..=17)) | (0x2 << 14);
+        let valid_pte = TestPageTableEntry(raw);
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
+        let pte = TestPageTableEntry(raw_value);
+        assert_eq!(u64::from(pte), raw_value);
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

