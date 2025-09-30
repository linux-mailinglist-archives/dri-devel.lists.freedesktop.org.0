Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4050BAD3DD
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 16:46:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97CCF10E5F0;
	Tue, 30 Sep 2025 14:46:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ti6Fl5bw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010008.outbound.protection.outlook.com [52.101.56.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1845310E5F0;
 Tue, 30 Sep 2025 14:46:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UI1jmLD5ayFI0GJvMeuNf+JvRPDAo4cFdgu9fgreHEqCFsccojU0dreSnHddG7C1Joo4kPTbpt/YFTLJdjt+Tzg8YECtllZWl0Hmcs5eOyLDC822Ob/UacYa2xtg8ggRUEaNYoZaR5cCQtSnpB2v3iOrTt7MRiWVoUrkw+jiICZwngSXAbVn3Y2LSURMs+RZMiEkD6tgukRVZ7fhQYeEllgvLwOEZ3uvUgrsHkJlPo1iNzdZFvwMousTwClsW+yjSLsJ6+Att1Lj+xtGmQkyRL/RJYb86ENiTPlkZLu6VKBfjavPo3wBd/ffjszGSgw46vVkyszaJ6UIZnfwfiFtew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8vKBziK4if3SD7aI5boBApPldSrAxEwqRs+2ud+8YaI=;
 b=IBfKmBPrSmfkHFhtBpRmMiCMbhFx41F0li1Q9l1/oaJIoe2DqrEu3kNzRyWFkb3JO9kpkWfEr+Yn0lepEG5ZHrkED15MJNcVdF/k6NpWXZnw08TpXerzhOYEFqyr4SCqHrc1jR5rtGdpB5Wadpx3B7jt6QOQ0srQpg3CrIbD4MyaS4bmSGcQOTMnS9yuHqLNZEH3qqOQs6wYt5X5YfXjJNlm87juWB3ckPnO7paDd7dUTV3UC35Rvq9hFr4Ft0pbKD7sx2vs0jX6HFwsbpziDc7kMrAv+Ee9tIi33VaMhUfLNS3ooEi8n1WCwVCDpUPkulmimk3ct8gkgszZmW9KWA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8vKBziK4if3SD7aI5boBApPldSrAxEwqRs+2ud+8YaI=;
 b=ti6Fl5bwhqKvu+yc6Hn7svrLvpugOGRVgL134UB6SQ0NLnzeALOwNxt6W/u8ETizFqA6FvsZNBsY92p6mVovMcJpkfDdLnzw2V3Y3tWZ3tajo8vi3n85Fcc7dHTb3ZXItROhB68wlqVmGERnIdN6nZvM8qQbb1T0B01ZX0q7gbbfJyicudSV7EiHQcT6AVHSNE4IIAVdGONvWPrN6TFtqkFkClvaR+29afimscx9k13Um2isdvZ06DSbUGCDCSd1AumKYQ3pFsTsr/OTSMymUB1XCm6dbQPVNJVOI+j2YS9Qy21Jy+z0L/ZhUf9DNqE70gxJByPzWI8pWXxmTjwAJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DM4PR12MB8475.namprd12.prod.outlook.com (2603:10b6:8:190::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 14:46:02 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 14:46:02 +0000
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
Subject: [PATCH v5 9/9] rust: bitfield: Add hardening for undefined bits
Date: Tue, 30 Sep 2025 10:45:37 -0400
Message-Id: <20250930144537.3559207-10-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930144537.3559207-1-joelagnelf@nvidia.com>
References: <20250930144537.3559207-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1P221CA0022.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:2c5::16) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DM4PR12MB8475:EE_
X-MS-Office365-Filtering-Correlation-Id: 90827608-9706-4dcb-54e4-08de003013de
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0MWV1nD4etnuplflirj13De8WloMcyUB4C6jDYbrhIWm4qY97wfm0jdmuRdT?=
 =?us-ascii?Q?W7oi7NWs6Xg/1DZIIagEeBF5jxJOWBjOuJ0rh61vIn1kMXY5pAH3AoweWbQA?=
 =?us-ascii?Q?sfsfPYFk85Sh7lkqPW/509HDMW44/Yqm925FLqE5ugaHn6+0mfvKAbhm/OLK?=
 =?us-ascii?Q?nc8GxkMTpXZtK2XgAzwwkNwrn4eYHXimimGVyLR/fKvl/mVSKYm1S2ym978c?=
 =?us-ascii?Q?A4PMO2nOfUkz659dSwl00WbZ3VhXy5SkFXJ/8qysrXYvyVepoNnQzW7qJCTA?=
 =?us-ascii?Q?Zv4lPydLJ4qW5wPVOFpQblJmco5rvG0I/Ol7v6K/uLJpHHVisW+wXnP5CRZB?=
 =?us-ascii?Q?ks/uNysNF/TttN6LSIeriphXy7wHyjzxnwZjghoFlphY+o3WAURREJtEFEvq?=
 =?us-ascii?Q?bgUuJyrCqQKYk8bRjuR3BOy299taUgoqqXFRxfaNwg6z5uN7jUXTKhcVfkz8?=
 =?us-ascii?Q?u906ul2Jz0K0giWwCgUs0Y7iNm9/sh+GAds2kTGcRnp69UAan3p+tTlzYSfv?=
 =?us-ascii?Q?976bStIFP/Oa8zDG456PANUfK0VDPnNcYUXCkLCfvPjj765d67iSqn9TAQ9F?=
 =?us-ascii?Q?SCSM7IW0egJGMPZCx8Bh5/Ki8NFE2KjiixPO6c+2T9h+osJpIvZ+d6aXzySu?=
 =?us-ascii?Q?Hx9IsT4ywSx7bfir9etotvU5/YAUlpEZZeim1MidRHpHc0+Xe5MwgiyK9m/4?=
 =?us-ascii?Q?dHqDGuXMT+s/J+wrzve6zHJK3Ov76HC9/p37aXDLXRUWvloHGojXUd+74xVL?=
 =?us-ascii?Q?bJdtEYxMztczFYF+4zKA3ORzbJN9ey+WYY2X4WYj5uhPtmb3PMHMfOqtK//Q?=
 =?us-ascii?Q?2s6PnX5N1ALIydZLAdaabfJ3VqcjBXeCz5/sEu3cowKzCmxqY3U/7B8l2hT+?=
 =?us-ascii?Q?cNd5vR9W3i+dHU+GYN0DluUcLVYPKI5o1U/DwZC+/KhgSHD/gOqyZBOZrIF2?=
 =?us-ascii?Q?3MUiNxDszr54U0G5poU4Wm49NRLplFz1BCaFEkPHpxy+OXEII5XCM0eJWXTM?=
 =?us-ascii?Q?kCES4ZZqR/tUc128i5may9cG+J8iMK38LQLaKbpk9IDIQjFUKGXllinS39CN?=
 =?us-ascii?Q?RzId8G9xoYk7BkXTOoMUU2Xr+lmTYBEIy0e+WR0Owb0m/ZGCWzCQZFYIl9Pk?=
 =?us-ascii?Q?EXaz+nNwREGYZ5zegx9iSEPn0AuDNvCyfeqINqBlgcmbPuEo90WqaZgLwPVX?=
 =?us-ascii?Q?cAzvNSjmGa2qGrBBaatyvBW9BeM/x93rqrQjHEoNkF9njLfpxDLi+izpWYAZ?=
 =?us-ascii?Q?d3OeM1niQ7bN+5voyhGbuuNT4uL8ag5tlC+qlHxld6EurTzc6HKEw3P0bhuP?=
 =?us-ascii?Q?NOVsi2SS7qmzOcymOb3v1Q1yTlTim+D0wsaqvy4A/VidjxFu0qjE56v2BuJN?=
 =?us-ascii?Q?Mg16JMmwQHzp97qCqUwqAfmQBtu84kRtVKqNmPM5HA1tsqKZ6+r53LqI0hOW?=
 =?us-ascii?Q?w0NoPRR2X1OJ0EYqKK6Ct6nHUW4v/gAy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EJ6gy0e0okXXI7QBVv+BcwI8HwleRJZ8nB06NpiQx+TRSgW6y7AGvHy/1SgO?=
 =?us-ascii?Q?4D2qOKXsHC8naZuPD/fZSoitpXQ6GA1JmMluNw45DaCt4BoigOLOTeWgsKZn?=
 =?us-ascii?Q?yNRnKMR49xzXHK5YyGCRxRLXx1lmfGJDYGqsfAw5Lsnq2BoKwjzEESHT8uiw?=
 =?us-ascii?Q?9t7yuBlbloQdZabRVBZ4n8NB7PymaqrlzKBsqQ8lPfUxP/1//Nj7TvqZo/lE?=
 =?us-ascii?Q?bAjb3LuDdCOEIEGDGBiDK/4+b4hZWAAlqpTC+/eYV06YxE54asW3wXV6xnsC?=
 =?us-ascii?Q?8aIkmSfzalZYL7KZ8sEVBlIDzG7M4zTdLWdVEmLG9rG+sW9WIZyBWDgt5eV9?=
 =?us-ascii?Q?RxccwEAp41IMWU/MdtcepXsTPthD847WJg4MgCxrxDZqChYnQrRHjVQ2N0F7?=
 =?us-ascii?Q?Et5l0k+MuiG5unOvOFCJTXArGZRREwOhsbFzjJRTzjaGws8LyDNvuWz0z/Rk?=
 =?us-ascii?Q?gbMqWWPdRDOmm6nUrJfUGINJlzARKYTthppz0Uz0iALRd/LHVnLxbPmgDCtA?=
 =?us-ascii?Q?kNpWCKIsdFUpYbz2u950viWaaKMxLTn6xa5JEEY3YL+dz5hs3Rh9/91rBi0O?=
 =?us-ascii?Q?TQ8cJqPlJC48SRuVJKbZxvingUJEYOYZsu0ShBpDOsSlptzJmP7jxhJAfSHb?=
 =?us-ascii?Q?D6Cor4W7kncNpHQx0eROKtZsMc0s3aftT/pJX7DRmOh/LjuTW0mDg6juHG9q?=
 =?us-ascii?Q?Vh8tr6tNOM0+CNefbGOqzyIaGSVuxdi/dGEu0WtvKw4dHZCWNOlEM6ojFn29?=
 =?us-ascii?Q?aVVfvKlZAyn3BoBqPOIhd1pz4wSmQg6DFPDcZI2RGmFEOwvgRLu8kfqDtu+n?=
 =?us-ascii?Q?ODJqCW3iKONqpKQX6WZoiXxZdN9f3UTOR5qBc0u/g/bjO3SFaio7vGIpUOtd?=
 =?us-ascii?Q?4tR4L4B/BBlMfVtNL7RKudqpzLn1oEFXrlVoVv5Y9GjT5HttI4h5PRGNpNwT?=
 =?us-ascii?Q?aWptpnVL5Q8zoT8SkRY/Pk8Wk4ncaLCG7xaFJaX/E7cOS5iL3veu1sZYn048?=
 =?us-ascii?Q?1WZpCBXL4hrwqxG695zfnRzORuKW+d3ToAWa0GDWCLVhW5Sm/Tm6EYRsRr3D?=
 =?us-ascii?Q?AJrUUWKNoXbah3s7Qy+09Vtcb8ygqOZg7eJkRsiI7eASpX+yZoFU4rfSO1bQ?=
 =?us-ascii?Q?qw8FG8eS8o1CLpWVvxMTiE8FaOHAKGWaD5XJnGw/ssLV1JbdWSGjIfpBRmp2?=
 =?us-ascii?Q?8Whrt1DN21lQAKADB+7wLz3OIcl8byV5HtabJ0Ha7QCyA90Yk/99ClkiYCdx?=
 =?us-ascii?Q?7XK22UxRqbVTR9GxToMHLs2c9tH5dKf+29WGsYpFuvVisAqDl9af3ArBmnKk?=
 =?us-ascii?Q?5JLZWNVrw2j2zIsd+TVLut0FPg9vrPe8ISBGjsOK4P4Oris/OjuFqepDsAvP?=
 =?us-ascii?Q?Dkhku5pVJme3Zw4iWC76V9+poQ3dO1c/3f0IC8/VZPmWvTw+KaNtuj4rFzmy?=
 =?us-ascii?Q?uVhUOm1Avk78TOSPXEVZOcZRvZG0XUgqWtmBieZCFkoT2I+aTJJyHZNVN/NY?=
 =?us-ascii?Q?+SwUqrbue75/U1DH5kS/jv6tNw3geswT/FMkf7a1h+ONAoVbpD2niKkphYMo?=
 =?us-ascii?Q?6dSdtvokTL2w7eHIct+l5g1gMd4wQdF414rwV8pa?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 90827608-9706-4dcb-54e4-08de003013de
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 14:46:02.6852 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TZEDnPDicfAQ3SwEPejUEigTXXXvq+WMcrHAHm1UXgyVXoDJm12avj8778JMJyECs6kypCyWZKl8lC4y0+4mYw==
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

When creating a new bitfield, it is possible that the value contains
bits set. Such usage can be the result of an error in the usage of the
bitfield. Print an error in regular configs, and assert in a hardened config
(CONFIG_RUST_BITFIELD_HARDENED). If the design is deliberate, the user may
silence these errors or assertions by defining the bitfield as reserved.

Suggested-by: Yury Norov <yury.norov@gmail.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 rust/kernel/bitfield.rs | 20 +++++++++++++++++++-
 1 file changed, 19 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/bitfield.rs b/rust/kernel/bitfield.rs
index 655f940479f1..606494bf4245 100644
--- a/rust/kernel/bitfield.rs
+++ b/rust/kernel/bitfield.rs
@@ -117,7 +117,9 @@ macro_rules! bitfield_assert {
 /// ```
 ///
 /// This generates a struct with:
-/// - Constructor: `new(value)` - creates a bitfield from a raw value, zeroing undefined bits
+/// - Constructor: `new(value)` - creates a bitfield from a raw value, zeroing undefined bits.
+///   If any of the bits passed are set, but not defined as a bitfield, an error is printed.
+///   To silence these errors, either define all fields or initialize the bit positions to 0.
 /// - Raw accessor: `raw()` - returns the underlying raw value
 /// - Field accessors: `mode()`, `state()`, etc.
 /// - Field setters: `set_mode()`, `set_state()`, etc. (supports chaining with builder pattern).
@@ -236,6 +238,10 @@ impl $name {
             /// This constructor zeros out all bits that are not defined by any field,
             /// ensuring only valid field bits are preserved. This is to prevent UB
             /// when raw() is used to retrieve undefined bits.
+            ///
+            /// If any of the bits passed are set, but not defined as a bitfield,
+            /// an error is printed. To silence these errors, either define all fields
+            /// or initialize the respective bit positions to 0.
             #[inline(always)]
             $vis fn new(value: $storage) -> Self {
                 // Calculate mask for all defined fields
@@ -245,6 +251,18 @@ impl $name {
                         mask |= Self::[<$field:upper _MASK>];
                     );
                 )*
+
+                // Check if any undefined bits are set
+                $crate::bitfield_assert!(
+                    (value & !mask) == 0,
+                    concat!(
+                        "Value 0x{:x} has bits set outside of defined field ranges ",
+                        "(mask: 0x{:x}). To avoid this assertion, either define all ",
+                        "fields or initialize unused bits to 0."
+                    ),
+                    value, mask
+                );
+
                 // Zero out undefined bits and wrap in BitfieldInternalStorage
                 Self(::kernel::bitfield::BitfieldInternalStorage::from_raw(value & mask))
             }
-- 
2.34.1

