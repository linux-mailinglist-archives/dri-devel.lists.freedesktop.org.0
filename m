Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBA7BC707F
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 02:48:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F8B210E8F5;
	Thu,  9 Oct 2025 00:48:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="iVfgvoE3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013030.outbound.protection.outlook.com
 [40.107.201.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E55B10E8F1;
 Thu,  9 Oct 2025 00:48:26 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wvaG4GLVDYLByh7hf4U1rp+5CULr3rLhnTC1wztUPVfzgCv6G7GnzlQZOaduZN7NkQZjQErO3lP4cbmndlhzxsJPD/zb73scuF/FT0p6DWgSyWG3qwlQUH51O89b2NE1TbvHPOfk9KttXNdNYcSmB8E5/EwmKK1XlYbfN8eIUZkawqBt84x5jbyeDPE/uvyLmCZPU/S0MTMqhsivcC14Pffzh6zX8QbBR494+wN7XuG2MWEDQArd8hycRHQK9keEifXcgytaP2vc0PluJYxYKYQxrj3ZVILKeowu+UouMOV+WaflvYi1tUpw+4e9pFBFbbEvP3j3dDqJ3ReeF8PQGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p2mjb430zEWyXJsjvEJdWGXtuEBZy+QH3btfLKjdbcg=;
 b=m9GwWeIvjpwYcfM6qQVjWITcmiAeLvTcB+E3tivFlRVeBUFROBiSsABdWYholXLpSBPGyydGAv6U4OqByvHGJhVUDNuPVap1BZqEemtEI5HoYPUxHo8MlgBoKyDAlCnpplO0pc97FIYaMF628aRdTi/kp2xRetbJZV15EV47d747Icdbw9ERNUmXWM3IOu687gWT3CRnRCNzG0eQNdo9Cj42JJ5x9eRIzwQOQyh4gX1JLcg3svhhaxwHWhGTJsmv6/MuHiCfs1QjIFawIqw8ZuC0fGSF70ZyHuzceuKGla0E2bND3UXepMN/QN58Bsy8vqTBXphp3NmWjdnNWta2aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p2mjb430zEWyXJsjvEJdWGXtuEBZy+QH3btfLKjdbcg=;
 b=iVfgvoE3a+fvGZSh24mbpqH00bappQEojQtpfL9VnebLbRUvm97sgZ3w3jhoDcKP4rKfNYO3WXNyj9qjKJzYkKo8p8xT4w9KTSbHfIvv832O/RfYT6onCK3Wxk9PYF5+LfAn2TOkOqRcZJqteNUTmUa0IuQU+5c3UCyKrpPlxuq4aXqXD+6UEoqNzVZnfE48/zGso3KtS0G95+AdpMXop5ZcxQUlxRe4hh11G+7DJU8E18JQOHslEPsRJ9oVpwCvG8G0qfxx378eKEObKhW1J6u9ZgWaIopE1KVk0HmS0+uBf0JEuno+YIeVyDHsnRzok04dW9eUH9iqQGgmwljPEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH7PR12MB5927.namprd12.prod.outlook.com (2603:10b6:510:1da::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 00:48:21 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9182.017; Thu, 9 Oct 2025
 00:48:20 +0000
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
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org
Subject: [PATCH v2] nova-core: vbios: Rework BiosImage to be simpler
Date: Wed,  8 Oct 2025 20:47:32 -0400
Message-Id: <20251009004732.2287050-1-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN8PR04CA0049.namprd04.prod.outlook.com
 (2603:10b6:408:d4::23) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|PH7PR12MB5927:EE_
X-MS-Office365-Filtering-Correlation-Id: 16853e06-e7b6-4bd2-597e-08de06cd86bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nZLWcpN0SZD/WO/orOSja+hNXShZspocwvJoR1UAC1mXHL2KW6pQteFuorh8?=
 =?us-ascii?Q?lyf1X8de6Pa/JiaFyvVT+ubqa9/mAqm9STKS+qUU3sewjE/KtE6shT/3PKWw?=
 =?us-ascii?Q?fjD33qPGabxL5CidFs2mu1BUxBUD17CLQTBWev849Zsg2amJ80ta8spRyVyM?=
 =?us-ascii?Q?pz0UKp9lRckfaYBeQHeyHyhY+wJpnG5y0nk2QW2hpBbw/AGGY8lUdd7Li3fF?=
 =?us-ascii?Q?GugQ0fdkYrStPs7sYdUzuzxX8ivkw0zykMMx7BWMrOrKSh4kyxN9fWgR6hz6?=
 =?us-ascii?Q?UG4mRMjyO9unyaWzinAyJ6OoNbMW7XGAyR9wYSUPYB/1OkhoY7Y7wC+0Klb2?=
 =?us-ascii?Q?7/XsmbXKe3W38W9JURrbEJuUvCntFvI6+bOmx/HUBxdnHkqnvcUMce3ZzQhc?=
 =?us-ascii?Q?a8OxtGP81PP9XT9U510TKmhWBpAv1bGK3UX9RiBmRQB8euemSACJ8nmLgBmb?=
 =?us-ascii?Q?J2YePIIO13BBDtIg5cDm4L3tMzh5C7xOpuwYEKjwSS86VcJmRWWFc5IQuOhK?=
 =?us-ascii?Q?3MtfV8xg/j3tM6H+7kKNpSXrR9GMZejBrpo9UAFRXweZIdFEs09FKjBQ2TR/?=
 =?us-ascii?Q?1Za24SlVXdkPSKtFB31mHTFi1Xej1LXLJMtBpM0PSHG1CCw9YwO8tfAYzmS7?=
 =?us-ascii?Q?NVYEm5OpNkuCoQrQo2YZ24J9bgS56twZDKJ9CCz2l83iamVGDNF1yyVyrHE0?=
 =?us-ascii?Q?IhJNvTiMLbtforNhsPY3KP1Jy8O7sWCgB19i49EPe9ajn7eu3iqmICUj7BgV?=
 =?us-ascii?Q?24+KEhF3OylkqHjOmg6gHk4t8HN6t7yFNXJ7bPISiKbFc/htznAO+01Lqf6r?=
 =?us-ascii?Q?Fz7u6+GNdu6xXCv28RRtYYQrD1Hp6UB6KGIuc7nK9jxqMZodQWjhv1uL8+af?=
 =?us-ascii?Q?eh07JyzEJca5T5fgR+r4z5iBStAAoMjAYIcv0zY622qrjR6m4g3TUUX3dw81?=
 =?us-ascii?Q?kiDr+nkhCTWZCDXFMJiZSuPw7pkfgBshQ1Y+aWe/tBqV8Qxah6//Fj560ldO?=
 =?us-ascii?Q?qcBUG1RcEsGos9rBjqcoeDEcjibYFMsR+mlkV43sdNdyeeVURoxVFdE3GecJ?=
 =?us-ascii?Q?5XGdN8Ggv6MfqeVBcqYi6kWymT3L1zx1BPl6kT8BD7jv7CR+WzrcVTUrDJ86?=
 =?us-ascii?Q?5mlvupTywDR+DMMEfjAWspSfYFz4+xUXN+TqP9ww+en920hTf0zFzcd/Rc57?=
 =?us-ascii?Q?/3IadfDSB5nH1Hplm97khbRXpzDA5XZaW5bIFfEOZsHNiaKt2mMz0xDQhQhE?=
 =?us-ascii?Q?k/NtWRMBOw6D1FzWldPm13vPwZir8PXbWYK5EMGLf+DhEML9KWHptW0H9Qzf?=
 =?us-ascii?Q?yTCnyNdbGg1LMwkUdGP/IrkM6KStQPDif3Zjj5FtNopTDtaAFCinfRAXUUhG?=
 =?us-ascii?Q?CZeDXrdZZskUAY0YgDseq5SuT/iyOE+EAFV7MsNLtA9wSZeqOWpNEz/7Gimu?=
 =?us-ascii?Q?ynLwQZQeMi2NAAr+6QRaBWTmJuwJl5dG?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?YjIC7tzm9LJ4OC/reJePNP5hV++kUaO3yWLTtoTgt042Ykdo08Tx5fbdoRSz?=
 =?us-ascii?Q?eAJg1hy9W7mocLCjyKY6h9Ktj/9lL2N3o51ahSiguV23mI5oWCvShjJTFnem?=
 =?us-ascii?Q?yhMm9VLRYHxlqa6EQfHRZamnD2czXZ3SD+xr5LHx6joGkgrkeavNUnS9LG44?=
 =?us-ascii?Q?f+HeFqDgxsCO4nJ4NVSw7nVeuR0kf83wSEdG7kmorM0I997IQTXZrE+EV4Rw?=
 =?us-ascii?Q?VdEeYclHyR6wo6HMN+FIoBlPFAUum0jF7rPB4+t2HbQdkoQLWjkQ4/NdGeL8?=
 =?us-ascii?Q?b3SpA8bnbJC+RHO8ijnNJdG6+Sq/r4SDc/8n3l0+l9koABK9r2pBDLwQ08Qq?=
 =?us-ascii?Q?qWe2Eb8siir+AI2FDLE7A+KUsFw11I33UcAepMnOsIGeOW4bA18FhtlUAehU?=
 =?us-ascii?Q?14LX+uxEpfxs4NTQwfbsRSs/UUzUFuli6MbpQQE8DOV1Dz3XIDZKeZRkHnVD?=
 =?us-ascii?Q?npCmGBubi69Dbi3jvtkaLTiq1Y2NOaWFHE9MnYiMDZAGeytYNvvx9z5pO0+g?=
 =?us-ascii?Q?7qZs3g5spHxOGEtaQLTSR/wjVoYg0rfZ7NntwBevPpKyQB77K0eSR4pEonXM?=
 =?us-ascii?Q?gJtHenM5Xz0OIpdLBphy89+qLJyMonh9d54fgtuVn1RUqCxH0vaofRRbtcdQ?=
 =?us-ascii?Q?Vvfke98B92PZpobRSp+GZAJ9UrFpGJM6Dj1ABwy8szlW9BiSKbUGtLPYG4XM?=
 =?us-ascii?Q?3oPeML4pq9yAwPOsHe1DwEWkluZJuiK+Fi3E2jakY2nmKHlvWXRW2+v+y81L?=
 =?us-ascii?Q?OkwSAR2yDWtMznu7MYylJt5DUMxjyrj64xlHhB+nhAWSIfPCN9NkEqw2PCm+?=
 =?us-ascii?Q?UxVtHv/a3TP+AUFQKJsyXADASK+cO0+CmKtNEy/YoYUZ7vnFmlePta8Oea2o?=
 =?us-ascii?Q?ynVmRKJs7opL81XsrTm7Ee7BG2GDtUWlM7tb3ovd/67GWDzxmB2QFFnbWNyV?=
 =?us-ascii?Q?qG8g9bbX94xceHKOoMWBWhlGY2qEK4CiI0W++ZFHQVtyUWl7PDiO/8XcDanS?=
 =?us-ascii?Q?FuQJIavJ0dNAPog9LtJHG84YZ2KTDzYvVmoA1qO22U0cw05U43A15ZKFzeZQ?=
 =?us-ascii?Q?AhrpHl6mjZ8TxVmP9lJgmyI5wPINH5BCN8BMgTRpbnNxM9TipP1o/kmj80gq?=
 =?us-ascii?Q?URK1eXTDD/H/TuDyjKTlas1S3egsR8ayWIoMcpnHFfRHzKjEbTqZS0dHlAss?=
 =?us-ascii?Q?zNfI6VyFtPeiwJhH1gIzmU1VDF0eFza8zpSsdxDXjjbr2CsZV1beSHPYCocm?=
 =?us-ascii?Q?PX7iWhkVIxC/gZ3Q+ktxU3HGSZ1lDPza8qT1fUVZ0Mk1cB6bZO6twK/Alh0i?=
 =?us-ascii?Q?n58jjEBJSqTZISkulcsg+FYskjWj5D1neWVP+6tQB9wrTJBEsSOBrJgS2m5n?=
 =?us-ascii?Q?tPjYgnuIoCJeJR9CoR7r7oML3WlBws4rgtHQTQL4ww3+V+9S72mqG0Ehawfr?=
 =?us-ascii?Q?FWtNy0NlpCat+3Rvgbuv6Ixa4v4itEHW9DJPgS27dGONWFXP/fpXa0OSy2KE?=
 =?us-ascii?Q?4YBSu12L9OxXSOxPscqAViCJCfI/BIlI2Ai3MR6HgjJk/3KpjgG9uqrV4miQ?=
 =?us-ascii?Q?YEXOrZ39+kaNL+sjap5frlUv7ONT6TQ23NQwXvsk7b9ERx0JlTHEvyge8mIO?=
 =?us-ascii?Q?kA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16853e06-e7b6-4bd2-597e-08de06cd86bb
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 00:48:20.8964 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mXQr+zwgGsGqNUcNXgNQGAxcAttlyEF1BI8MVU+W799eaolKAW/S7mqN3MnD6b8UjrRUuPm2EKLdLWzpRCzdiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5927
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

Currently, the BiosImage type in vbios code is implemented as a
type-wrapping enum with the sole purpose of implementing a type that is
common to all specific image types. To make this work, macros were used
to overcome limitations of using enums. Ugly match statements were also
required to route methods from the enum type to the specific image type.

Simplify the code by just creating the common BiosImage type in the
iterator, and then converting it to specific image type after. This
works well since all the methods common to different BiosImage are
called only during the iteration and not later. Should we need to call
these common methods later, we can use AsRef and traits, but for now not
doing so gives us a nice ~50 negative line delta versus the existing code
and is a lot simpler.

Also remove the now obsolete BiosImage enum type.

Cc: Benno Lossin <lossin@kernel.org>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
v1->v2: Removed deadcode (Alex).

 drivers/gpu/nova-core/vbios.rs | 226 ++++++++++++++-------------------
 1 file changed, 94 insertions(+), 132 deletions(-)

diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index e6a060714205..696eedaab0c4 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -21,6 +21,34 @@
 /// indicates the last image. Bit 0-6 are reserved, bit 7 is last image bit.
 const LAST_IMAGE_BIT_MASK: u8 = 0x80;
 
+/// BIOS Image Type from PCI Data Structure code_type field.
+#[derive(Debug, Clone, Copy, PartialEq, Eq)]
+#[repr(u8)]
+enum BiosImageType {
+    /// PC-AT compatible BIOS image (x86 legacy)
+    PciAt = 0x00,
+    /// EFI (Extensible Firmware Interface) BIOS image
+    Efi = 0x03,
+    /// NBSI (Notebook System Information) BIOS image
+    Nbsi = 0x70,
+    /// FwSec (Firmware Security) BIOS image
+    FwSec = 0xE0,
+}
+
+impl TryFrom<u8> for BiosImageType {
+    type Error = Error;
+
+    fn try_from(code: u8) -> Result<Self> {
+        match code {
+            0x00 => Ok(Self::PciAt),
+            0x03 => Ok(Self::Efi),
+            0x70 => Ok(Self::Nbsi),
+            0xE0 => Ok(Self::FwSec),
+            _ => Err(EINVAL),
+        }
+    }
+}
+
 // PMU lookup table entry types. Used to locate PMU table entries
 // in the Fwsec image, corresponding to falcon ucodes.
 #[expect(dead_code)]
@@ -197,32 +225,37 @@ pub(crate) fn new(dev: &device::Device, bar0: &Bar0) -> Result<Vbios> {
 
         // Parse all VBIOS images in the ROM
         for image_result in VbiosIterator::new(dev, bar0)? {
-            let full_image = image_result?;
+            let image = image_result?;
 
             dev_dbg!(
                 dev,
-                "Found BIOS image: size: {:#x}, type: {}, last: {}\n",
-                full_image.image_size_bytes(),
-                full_image.image_type_str(),
-                full_image.is_last()
+                "Found BIOS image: size: {:#x}, type: {:?}, last: {}\n",
+                image.image_size_bytes(),
+                image.image_type(),
+                image.is_last()
             );
 
-            // Get references to images we will need after the loop, in order to
-            // setup the falcon data offset.
-            match full_image {
-                BiosImage::PciAt(image) => {
-                    pci_at_image = Some(image);
+            // Convert to a specific image type
+            match BiosImageType::try_from(image.pcir.code_type) {
+                Ok(BiosImageType::PciAt) => {
+                    pci_at_image = Some(PciAtBiosImage::try_from(image)?);
                 }
-                BiosImage::FwSec(image) => {
+                Ok(BiosImageType::FwSec) => {
+                    let fwsec = FwSecBiosBuilder {
+                        base: image,
+                        falcon_data_offset: None,
+                        pmu_lookup_table: None,
+                        falcon_ucode_offset: None,
+                    };
                     if first_fwsec_image.is_none() {
-                        first_fwsec_image = Some(image);
+                        first_fwsec_image = Some(fwsec);
                     } else {
-                        second_fwsec_image = Some(image);
+                        second_fwsec_image = Some(fwsec);
                     }
                 }
-                // For now we don't need to handle these
-                BiosImage::Efi(_image) => {}
-                BiosImage::Nbsi(_image) => {}
+                _ => {
+                    // Ignore other image types or unknown types
+                }
             }
         }
 
@@ -594,108 +627,29 @@ fn find_in_data(
     }
 }
 
-// Use a macro to implement BiosImage enum and methods. This avoids having to
-// repeat each enum type when implementing functions like base() in BiosImage.
-macro_rules! bios_image {
-    (
-        $($variant:ident: $class:ident),* $(,)?
-    ) => {
-        // BiosImage enum with variants for each image type
-        enum BiosImage {
-            $($variant($class)),*
-        }
-
-        impl BiosImage {
-            /// Get a reference to the common BIOS image data regardless of type
-            fn base(&self) -> &BiosImageBase {
-                match self {
-                    $(Self::$variant(img) => &img.base),*
-                }
-            }
-
-            /// Returns a string representing the type of BIOS image
-            fn image_type_str(&self) -> &'static str {
-                match self {
-                    $(Self::$variant(_) => stringify!($variant)),*
-                }
-            }
-        }
-    }
-}
-
-impl BiosImage {
-    /// Check if this is the last image.
-    fn is_last(&self) -> bool {
-        let base = self.base();
-
-        // For NBSI images (type == 0x70), return true as they're
-        // considered the last image
-        if matches!(self, Self::Nbsi(_)) {
-            return true;
-        }
-
-        // For other image types, check the NPDE first if available
-        if let Some(ref npde) = base.npde {
-            return npde.is_last();
-        }
-
-        // Otherwise, fall back to checking the PCIR last_image flag
-        base.pcir.is_last()
-    }
-
-    /// Get the image size in bytes.
-    fn image_size_bytes(&self) -> usize {
-        let base = self.base();
-
-        // Prefer NPDE image size if available
-        if let Some(ref npde) = base.npde {
-            return npde.image_size_bytes();
-        }
-
-        // Otherwise, fall back to the PCIR image size
-        base.pcir.image_size_bytes()
-    }
-
-    /// Create a [`BiosImageBase`] from a byte slice and convert it to a [`BiosImage`] which
-    /// triggers the constructor of the specific BiosImage enum variant.
-    fn new(dev: &device::Device, data: &[u8]) -> Result<Self> {
-        let base = BiosImageBase::new(dev, data)?;
-        let image = base.into_image().inspect_err(|e| {
-            dev_err!(dev, "Failed to create BiosImage: {:?}\n", e);
-        })?;
-
-        Ok(image)
-    }
-}
-
-bios_image! {
-    PciAt: PciAtBiosImage,   // PCI-AT compatible BIOS image
-    Efi: EfiBiosImage,       // EFI (Extensible Firmware Interface)
-    Nbsi: NbsiBiosImage,     // NBSI (Nvidia Bios System Interface)
-    FwSec: FwSecBiosBuilder, // FWSEC (Firmware Security)
-}
-
 /// The PciAt BIOS image is typically the first BIOS image type found in the BIOS image chain.
 ///
 /// It contains the BIT header and the BIT tokens.
 struct PciAtBiosImage {
-    base: BiosImageBase,
+    base: BiosImage,
     bit_header: BitHeader,
     bit_offset: usize,
 }
 
+#[expect(dead_code)]
 struct EfiBiosImage {
-    base: BiosImageBase,
+    base: BiosImage,
     // EFI-specific fields can be added here in the future.
 }
 
+#[expect(dead_code)]
 struct NbsiBiosImage {
-    base: BiosImageBase,
+    base: BiosImage,
     // NBSI-specific fields can be added here in the future.
 }
 
 struct FwSecBiosBuilder {
-    base: BiosImageBase,
+    base: BiosImage,
     /// These are temporary fields that are used during the construction of the
     /// [`FwSecBiosBuilder`].
     ///
@@ -714,37 +668,16 @@ struct FwSecBiosBuilder {
 ///
 /// The PMU table contains voltage/frequency tables as well as a pointer to the Falcon Ucode.
 pub(crate) struct FwSecBiosImage {
-    base: BiosImageBase,
+    base: BiosImage,
     /// The offset of the Falcon ucode.
     falcon_ucode_offset: usize,
 }
 
-// Convert from BiosImageBase to BiosImage
-impl TryFrom<BiosImageBase> for BiosImage {
-    type Error = Error;
-
-    fn try_from(base: BiosImageBase) -> Result<Self> {
-        match base.pcir.code_type {
-            0x00 => Ok(BiosImage::PciAt(base.try_into()?)),
-            0x03 => Ok(BiosImage::Efi(EfiBiosImage { base })),
-            0x70 => Ok(BiosImage::Nbsi(NbsiBiosImage { base })),
-            0xE0 => Ok(BiosImage::FwSec(FwSecBiosBuilder {
-                base,
-                falcon_data_offset: None,
-                pmu_lookup_table: None,
-                falcon_ucode_offset: None,
-            })),
-            _ => Err(EINVAL),
-        }
-    }
-}
-
 /// BIOS Image structure containing various headers and reference fields to all BIOS images.
 ///
-/// Each BiosImage type has a BiosImageBase type along with other image-specific fields. Note that
-/// Rust favors composition of types over inheritance.
+/// A BiosImage struct is embedded into all image types and implements common operations.
 #[expect(dead_code)]
-struct BiosImageBase {
+struct BiosImage {
     /// Used for logging.
     dev: ARef<device::Device>,
     /// PCI ROM Expansion Header
@@ -757,12 +690,41 @@ struct BiosImageBase {
     data: KVec<u8>,
 }
 
-impl BiosImageBase {
-    fn into_image(self) -> Result<BiosImage> {
-        BiosImage::try_from(self)
+impl BiosImage {
+    /// Get the image size in bytes.
+    fn image_size_bytes(&self) -> usize {
+        // Prefer NPDE image size if available
+        if let Some(ref npde) = self.npde {
+            npde.image_size_bytes()
+        } else {
+            // Otherwise, fall back to the PCIR image size
+            self.pcir.image_size_bytes()
+        }
+    }
+
+    /// Get the BIOS image type.
+    fn image_type(&self) -> Result<BiosImageType> {
+        BiosImageType::try_from(self.pcir.code_type)
+    }
+
+    /// Check if this is the last image.
+    fn is_last(&self) -> bool {
+        // For NBSI images (type == 0x70), return true as they're
+        // considered the last image
+        if self.pcir.code_type == BiosImageType::Nbsi as u8 {
+            return true;
+        }
+
+        // For other image types, check the NPDE first if available
+        if let Some(ref npde) = self.npde {
+            return npde.is_last();
+        }
+
+        // Otherwise, fall back to checking the PCIR last_image flag
+        self.pcir.is_last()
     }
 
-    /// Creates a new BiosImageBase from raw byte data.
+    /// Creates a new BiosImage from raw byte data.
     fn new(dev: &device::Device, data: &[u8]) -> Result<Self> {
         // Ensure we have enough data for the ROM header.
         if data.len() < 26 {
@@ -802,7 +764,7 @@ fn new(dev: &device::Device, data: &[u8]) -> Result<Self> {
         let mut data_copy = KVec::new();
         data_copy.extend_from_slice(data, GFP_KERNEL)?;
 
-        Ok(BiosImageBase {
+        Ok(BiosImage {
             dev: dev.into(),
             rom_header,
             pcir,
@@ -865,10 +827,10 @@ fn falcon_data_ptr(&self) -> Result<u32> {
     }
 }
 
-impl TryFrom<BiosImageBase> for PciAtBiosImage {
+impl TryFrom<BiosImage> for PciAtBiosImage {
     type Error = Error;
 
-    fn try_from(base: BiosImageBase) -> Result<Self> {
+    fn try_from(base: BiosImage) -> Result<Self> {
         let data_slice = &base.data;
         let (bit_header, bit_offset) = PciAtBiosImage::find_bit_header(data_slice)?;
 
-- 
2.34.1

