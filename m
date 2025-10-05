Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A437BBCCF9
	for <lists+dri-devel@lfdr.de>; Mon, 06 Oct 2025 00:09:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 156A110E108;
	Sun,  5 Oct 2025 22:09:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PCyjolMU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010008.outbound.protection.outlook.com [52.101.201.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C844E10E108;
 Sun,  5 Oct 2025 22:09:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dI8rBC7jLa0V6CqaDuTmnzoi0mu54K18FPS1izmyQPL9aqUnj1QlYRG2dMdCVj0h3tMdhzQq/MF8C4qgm2yTodr6r1N7mhvRyQob6Ayq9nmmeUnNZqdvOJFOyTFl+CdMWx1SipwrY6JgzBMMD/Y/7rDLgoJ08CYch5GRUleraMQA9MTzJrNXqqBEkVfW91OhbZwfQorXLWB4MKzmOfdGnbnQI/psdYxiyI2wmp/YSuJLKpxzkrF2x8yxOpD37micsvzhRLx0w8s/msTvhAE5bE9iCHvgGSCllzBUe1Ym+SQ+O8K9cfOIDjIavPDoqLNW7g/Wus//5Qso+zyZmib91A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yo0Pzt3l3xA39txDDQVS+XL8jXUT5XK+8tRRDm9VqNI=;
 b=veNKfCqG/Qp0gGTJwHv5WBkhcwSOqB6Wh25/rfC5Ndyu1Kx+2B2BU0BmGle/SAVZVhtPTEJjkudiyZrFPORd5wn+nMGhN77/ug3uglwmvqOA1KOPzx2G+/YhdFeCOWltFYHa/1EisA4DnmM7KOtCgphpK5LhL54OsdCvWFMfS/Fgbx96XDqwR5lwTGcvSEMd2ThNrBOwYVHkeA0QjdT5Vu3NwC+t8jKm5RsvCPAOGXyR3eUT520aVHsn2/tR3aWU0WfoRcxQ/7hNqgeJB99qvWAc/N8KvsB3PrFoumGXsSFH0fY2IjgFQ9lq7ebCMF2ckBUiMjRAsWe+lgg7Hg2vcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yo0Pzt3l3xA39txDDQVS+XL8jXUT5XK+8tRRDm9VqNI=;
 b=PCyjolMUoheR5/K+BVYNHIygSCXnLH+3PV2yNHsXIwM1mmky+6SBQoe/wAVPRmkr2o1FVv1BGZBVcynK6vc1Ix7pRoV9LdDTcMs/0oKd+O+HWz2FZD0x02avK0jNPjrUaur4jDUuvw03bdrpOgZUopWJpN1W8f/5fww9IvGLxwyhuqkAm7X1ycP21AgPiAjRKbE1MDYSQnUscu8Lt1APnmPuaqjEL960VRc8CYUok3Hvohum8YU7XVPlxdm2EwbK8vPrPMtTm4bp4bD1fQwpMUVp/oFWtO42qYUOC33DV3Dfn/g0Vbe8ivqkF+YMpG4ZCdBBNitWYMocvxFlrZmO0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DM4PR12MB7717.namprd12.prod.outlook.com (2603:10b6:8:103::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.20; Sun, 5 Oct
 2025 22:09:00 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9182.017; Sun, 5 Oct 2025
 22:09:00 +0000
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
Subject: [PATCH] nova-core: vbios: Rework BiosImage composition to use AsRef
 and traits
Date: Sun,  5 Oct 2025 18:08:47 -0400
Message-Id: <20251005220847.805405-1-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN8PR16CA0002.namprd16.prod.outlook.com
 (2603:10b6:408:4c::15) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DM4PR12MB7717:EE_
X-MS-Office365-Filtering-Correlation-Id: 71b4207b-26cd-48b4-4cbc-08de045bc9c1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Ie0gU81Ia8nW4Ceyb4haoBK+FMPrqi8yq0Dj9ujaWzh5C1q41zGHg/4ci5r3?=
 =?us-ascii?Q?9mFMsMej5kioi4vssxpyt7cMXrbd6buJQ+LsyaYoWk3KmpRjjffR4Eb+yGtO?=
 =?us-ascii?Q?osJmUOV3KS++Xg7SHR3+tO1XdO28GRCe/GQJ7RRrih3WTArsujppIysyWgeE?=
 =?us-ascii?Q?5NkOb343Yb3KwKOirxCW4zVvr/+c+tnMnAd7pHEmLkI/4kKjK0lal8uCN4w0?=
 =?us-ascii?Q?n0nzJZoCnN0LilQLFr3tF+kYT2jPrF5xFm5T3DD3kb5RgfJ7U7WJDVwq1Ah+?=
 =?us-ascii?Q?ESCVHxfWy7zZhC5VpdntLJ/lZvSb9PLkQYo2aVsKyaOdaHnGoTs3gLIIll6g?=
 =?us-ascii?Q?jxuPxk+RMg/ETLm9W33BUG/Gz80FiCM0D5IasclZ12h1eOENZyGkAhbGWD9/?=
 =?us-ascii?Q?u0SFxjSV/NmgUApmPfDSbWgL1Cgu5uueZRoFf0aYyRAn5JEeL8vuSv7ZaAva?=
 =?us-ascii?Q?ExwJy3Lm5h2aBjLdhYXXxrAIyuDUj8wyLYe2g7/RXJ8esA2W8p7nTQGb7gqZ?=
 =?us-ascii?Q?auxFiM3pa9xlxJURQdiAX2yQPdkeN+rDFoK4uCeH+vm8Oai8sHN5HEYrPS4o?=
 =?us-ascii?Q?KEK5ViTFHIjEIcc5GoHW5bjAKIMB4kqblXSW59liA8DCwTPQhVniwefR4iUz?=
 =?us-ascii?Q?2a/lrUBRayfbjcJp5KUjjPmTDeipOhdEdAhsrnDXOfCtWhmNDBSUqSuYDlBM?=
 =?us-ascii?Q?zVzBCYdjMejf5EMnPPGtx1bfphqSoLXyLx2eaT/FkM6CQKzBhI9K2UAUd6qU?=
 =?us-ascii?Q?7e86b8c6xFm4HoscdaKjiqKHBCmhrmaVrrQsq8JBwGM+tc+ywH1Hprxs1UOl?=
 =?us-ascii?Q?Qt+7GOyXvNYY57TUBx8O0n6+HK6jbDqBzPzc+uV+mt/TPBdEy1GVu1lzH4DU?=
 =?us-ascii?Q?/0rmZELPzSo06M3rvGys+gwj5FD6kF/RjCuMJaePTC8omCiKnpLRp5jfb8mR?=
 =?us-ascii?Q?s+pZB42TNkVTR4cdrI9DWL3q/x/fepQNx05WBvnDuox7ZTMsh+yFtloPshH3?=
 =?us-ascii?Q?jGoHLHngOQBAEPC00Rpo6pqmg+GBMhuB0WzdH4MYPVIkF1C7p44KJvyBm/ao?=
 =?us-ascii?Q?2EY7OvGVT8xkniMCBWaPGGFBLGDGENLv5zym5CrCGkuqifbU+3qLC/mZH/Vk?=
 =?us-ascii?Q?pNA9T8w8cHqDvKeIjCmddWN/TGhWpZ6sEVRNqUT12lOaicFTselQuC54uRRC?=
 =?us-ascii?Q?Q2LmeFK57VgvGr0Ve8YFGEXY6O6rX7+VJBaCJLQPNmjixHK1gdCtk/AJerwM?=
 =?us-ascii?Q?ZciteDYDkGf5B30KSw79GVQi9kb14LbV+N5u4IGX31MB2dT69bW67aDLa/sy?=
 =?us-ascii?Q?vVS1wQjjIctzbbuvt3/ko4XbVyY/ZmCx9eO3t9/2tKzEV9J7/YoPjDYZlyF4?=
 =?us-ascii?Q?QnGJsrcDxBA8BkoqfsSb1RU0gokwIvCBa24KJnQmtQDR7unpUcXS+KIcFpdj?=
 =?us-ascii?Q?L+W7kCTlikMg9WJk3KQrDg0O1xMcLL33?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sC/0PKrMx2mr8JChiasq1pO+4YEMNgKiPeAYe/vZl0S9eoiRZyFTsHz9bDET?=
 =?us-ascii?Q?q2w4PffJBR4Dcog2VCZsVKDdke3bYVk9l22il7yhEPnW0xc4/nSmyAre3bTR?=
 =?us-ascii?Q?Sat37hk3ox2Zag6Cgj0mbC1mrqcTFWTOjn1WIMa69n0ltTJz04xZdVGWxsRN?=
 =?us-ascii?Q?0SyYqcvJdQUMAat0r/MEnVhsyYybVvYl8sQ5rCQP+sOAVbT5pDZn8T5haOH7?=
 =?us-ascii?Q?W0GPy1QdbQU1irdVEKfPTcb6YR3PzSGhAR6tzRWF70T+jbDLwSNf8i5YQ+JM?=
 =?us-ascii?Q?7hnVxt1tczpTkAN60VByGJKAq8ADyJGlFgQjsqMcMyV8m45Z3i6Pwpa2tiHh?=
 =?us-ascii?Q?RlqZDj4DEkluAdV10/i24kwjf0YdKsvwrRWPp89R3DR68QnW+DbT507fPovQ?=
 =?us-ascii?Q?JKQ2XkEXqcSDEX6BC23M7Lc+mA+M9cJ3gtLoT+MAW2lRrIhVWuU3bwnC4Yyh?=
 =?us-ascii?Q?Kj6vFalCgJ6l71Uuz9OEaqdbhKJghUpTIrTLAv7EtWW7vupxeuS/NSQ71r+S?=
 =?us-ascii?Q?jtsFi6ASo+6aHH5DvRxorH4EA1D7a50/LsDUMahqCe/MXPwNOFHxPrgZEplC?=
 =?us-ascii?Q?C7vaio6jFLOmlOZqmySR7gITcDaZ1mk7jP4dWiB5T0nweZ0b5sQfSKtcO9Ho?=
 =?us-ascii?Q?B640tAy0LSATSyFYn7QOsEYCWyMFZYufBa4vJOwJe5KeXD4O7cZuT3rsNS2k?=
 =?us-ascii?Q?CpTNPI4zkiISTnyqWxbuu1eSFRu5O3moBBEAPYKWDN4Hq3XlfwtQzD013k1K?=
 =?us-ascii?Q?4nIA9xjtVnyE1tAg/8C8WDeF5oAd7evjudyN2SJpAgREPMkn840tYtgC5j5R?=
 =?us-ascii?Q?IauS7pSso07PrLPzD6d20HykItEH7OFMq8SDSO1OjllLXvja8dq1iHcGQ1Tm?=
 =?us-ascii?Q?+mc75GbaFH4FCbi1G/mLqvLThLNN3XKWcNcEkQs2WWbvTtz3yXaNUXSKdPU4?=
 =?us-ascii?Q?4sC1j8MTWC6RGVxGuDnl7f/CZfB0x2g4EnN5bWkiogdCgf05UhT/K2Dl95/7?=
 =?us-ascii?Q?BOPtsCgdPqyct7AP8Jq5JgCZ74fMbqehpU+ikGza27+6o04Gj10Yoy0CICCd?=
 =?us-ascii?Q?WInpDjh4eXUbQHnPK/wpOYrj3835d5W6+H79pn+r2JTe8FQsE9Nere+rAqrN?=
 =?us-ascii?Q?j0eadw5ofIRbWYHWjULlNWRS1PTNHj8HOaRLbCYP+YKmYt7OdEDeEaf0kwJM?=
 =?us-ascii?Q?SbAIZylrCvuvsQ3FDeWP32ioTwM38QgKbrcBl+p3iL6e8t0edFybFbj0xGW4?=
 =?us-ascii?Q?j+EwT+k7KPlPE9ITPKcXPJ90bKHFAySns5R3AqcqZfqb3D6KWHLaiRKPuiuX?=
 =?us-ascii?Q?GZojImmVDKfK0WpU4VCAbsysilLFo8Pug87t0y53e69tzRk1itjPYfJwM9O3?=
 =?us-ascii?Q?2SZVFlOs/l0G+UYkqNzThcwYCPUgNJ1nkJ04kCTlsajxPCiZdDh21DAhXre1?=
 =?us-ascii?Q?o2ywlO8vxUsc8Kfu85WYJ0FtTnTW8IUReYPSi4WhcV6XoyJ7C5Igl6DiMVSR?=
 =?us-ascii?Q?d10ykrJYSywbRycHIyzYARG/aIlFRePL1UjQlH9p/4i8RhjUK3p+r31Wwzud?=
 =?us-ascii?Q?MagaKYx4jIjCPy3vuYvLr8MBXfr7fogzFIF73CW1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 71b4207b-26cd-48b4-4cbc-08de045bc9c1
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Oct 2025 22:09:00.8063 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: m7VAdRp84n+evRkz8zA/2kelYi0e0hdAylhADW0AN5AR9WCmtFeeVRzXJx2kFe491PcSDjeFKIIKrYEiLSldlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7717
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

Simplify the code by using AsRef to convert references from specific
image types to the common BiosImage type to specific image types.
Introduce a new BiosImageTrait trait to implement common methods and
route the methods using AsRef. This allows usage of common code that
applies to all image types.  This is a lot cleaner and does not require
macros or type-wrapping enums. The code is much more readable now.

Add the following new types:
BiosImageType: A regular non-type-wrapping enum for the image type.
BiosImage: A common struct embedded into specific bios image types (used
to be BiosImageBase).
BiosImageTrait: A trait that helps to route methods from a specific
image type to common BiosImage typ.

Remove the now obsolete BiosImage enum.

Cc: Benno Lossin <lossin@kernel.org>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
Rebased on drm-rust-next branch.

 drivers/gpu/nova-core/vbios.rs | 255 +++++++++++++++++----------------
 1 file changed, 134 insertions(+), 121 deletions(-)

diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index e6a060714205..548c24d9f70b 100644
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
 
@@ -594,108 +627,72 @@ fn find_in_data(
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
+/// Trait for all BIOS image types
+#[expect(dead_code)]
+trait BiosImageTrait: AsRef<BiosImage> {
     /// Check if this is the last image.
     fn is_last(&self) -> bool {
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
+        self.as_ref().is_last()
     }
 
     /// Get the image size in bytes.
     fn image_size_bytes(&self) -> usize {
-        let base = self.base();
-
-        // Prefer NPDE image size if available
-        if let Some(ref npde) = base.npde {
-            return npde.image_size_bytes();
-        }
-
-        // Otherwise, fall back to the PCIR image size
-        base.pcir.image_size_bytes()
+        self.as_ref().image_size_bytes()
     }
 
-    /// Create a [`BiosImageBase`] from a byte slice and convert it to a [`BiosImage`] which
-    /// triggers the constructor of the specific BiosImage enum variant.
-    fn new(dev: &device::Device, data: &[u8]) -> Result<Self> {
-        let base = BiosImageBase::new(dev, data)?;
-        let image = base.into_image().inspect_err(|e| {
-            dev_err!(dev, "Failed to create BiosImage: {:?}\n", e);
-        })?;
-
-        Ok(image)
+    /// Get the BIOS image type.
+    fn image_type(&self) -> Result<BiosImageType> {
+        self.as_ref().image_type()
     }
 }
 
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
 
+impl AsRef<BiosImage> for PciAtBiosImage {
+    fn as_ref(&self) -> &BiosImage {
+        &self.base
+    }
+}
+
+impl BiosImageTrait for PciAtBiosImage {}
+
+#[expect(dead_code)]
 struct EfiBiosImage {
-    base: BiosImageBase,
+    base: BiosImage,
     // EFI-specific fields can be added here in the future.
 }
 
+impl AsRef<BiosImage> for EfiBiosImage {
+    fn as_ref(&self) -> &BiosImage {
+        &self.base
+    }
+}
+
+impl BiosImageTrait for EfiBiosImage {}
+
+#[expect(dead_code)]
 struct NbsiBiosImage {
-    base: BiosImageBase,
+    base: BiosImage,
     // NBSI-specific fields can be added here in the future.
 }
 
+impl AsRef<BiosImage> for NbsiBiosImage {
+    fn as_ref(&self) -> &BiosImage {
+        &self.base
+    }
+}
+
+impl BiosImageTrait for NbsiBiosImage {}
+
 struct FwSecBiosBuilder {
-    base: BiosImageBase,
+    base: BiosImage,
     /// These are temporary fields that are used during the construction of the
     /// [`FwSecBiosBuilder`].
     ///
@@ -710,41 +707,28 @@ struct FwSecBiosBuilder {
     falcon_ucode_offset: Option<usize>,
 }
 
+impl AsRef<BiosImage> for FwSecBiosBuilder {
+    fn as_ref(&self) -> &BiosImage {
+        &self.base
+    }
+}
+
+impl BiosImageTrait for FwSecBiosBuilder {}
+
 /// The [`FwSecBiosImage`] structure contains the PMU table and the Falcon Ucode.
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
@@ -757,12 +741,41 @@ struct BiosImageBase {
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
@@ -802,7 +815,7 @@ fn new(dev: &device::Device, data: &[u8]) -> Result<Self> {
         let mut data_copy = KVec::new();
         data_copy.extend_from_slice(data, GFP_KERNEL)?;
 
-        Ok(BiosImageBase {
+        Ok(BiosImage {
             dev: dev.into(),
             rom_header,
             pcir,
@@ -865,10 +878,10 @@ fn falcon_data_ptr(&self) -> Result<u32> {
     }
 }
 
-impl TryFrom<BiosImageBase> for PciAtBiosImage {
+impl TryFrom<BiosImage> for PciAtBiosImage {
     type Error = Error;
 
-    fn try_from(base: BiosImageBase) -> Result<Self> {
+    fn try_from(base: BiosImage) -> Result<Self> {
         let data_slice = &base.data;
         let (bit_header, bit_offset) = PciAtBiosImage::find_bit_header(data_slice)?;
 

base-commit: 299eb32863e584cfff7c6b667c3e92ae7d4d2bf9
-- 
2.34.1

