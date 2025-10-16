Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7662BE416D
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 17:02:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE6AB10EA0E;
	Thu, 16 Oct 2025 15:02:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="I7kmw/Lc";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012027.outbound.protection.outlook.com [52.101.53.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 422B710EA0D;
 Thu, 16 Oct 2025 15:02:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RQ58bAp4JHK1U4hHTVhPcsgLkeflAnRURbZ4VOf+YujUs2mes8wWfKSmTH6jzJMqNb5RyEanWsTfO2Td+/cVREUu+lPK6Pj1+4rE3DJLWt+hJdJBtOGy9hjYY7oXZCDH5rvpt0svkRptoflLhhCB/Laoo9E0R33NnXjryjRsHwgNmK96XNQRX3/P4F2jvqlTWLXsShTHDHal+APCoVA3/ni5Z7AypYZVdPoi/v3iRtCgmU/L4rOcNAlcYZvAkMGfnCmyo9ORKoydEXaDWJINMWuYOuwBsD+BZRpDJuSfKCF6N7dPsVYcY5VvWV6U8eB2dmoI4ApmzYHJUCjaGofdyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=veMMrum7Qc1DzPDXABeXBoo2pjJsL7P3kIjT4rK5xis=;
 b=LkzKYl6P4gxzXc+ccucFHEJvi+2s1YJKJox+iRlWdzxhT13TwptDrOaDz+AKUOFobjb0Gta8n1c07FXtlRtS+lS/AQTE1NuNAFwxOel7wKs40r2Zw4rYFlls6eQ8XRppjHIA9RmuazAHKCzl6ptl2EWvsOO75mhc1ESvK422zu/67O58H2G5tJKiI5LGruXHSX3YJmgGcwOgEP+4zM2YHS55lbqb64k4kmMjUWMc8iWgS4oCj6ddWfathsXms/5J8VyyGDO61gMHIGrXgfF0VGoQr2gH1vH1aKQ2jwuPTanf4wUWxmTkGESZLrd3rjbSDnzo5X90SLrFAeV3s8Rd4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=veMMrum7Qc1DzPDXABeXBoo2pjJsL7P3kIjT4rK5xis=;
 b=I7kmw/LcXqJGz6q8zRvSz9nT4Rd2BEI6PkPfCkcMP/BkUCcm+i3Bdh8liP1cpxcpKBDMh+dT1hRfrm8SchGxSStzVOTjpFjtEBn4zcc6D1yFdLS7UR1HHFh26wEGIPFtNt9m6QIOpAjAaMaNtfchWcrnbEAOHoXAepuzHUS1vtXI73HJuxm7bM6Kga+Xsi48ps3KqM/XIPFPfvwcH6Bn2GQctPG3VXAZVBbj5xXCJf359eMkbvj0EstUme4fpgyAhNFV1K4TxOi7kARzney/uJrK8V0YH285tkfzbEO4qrH7ONImZG32voW9J+NKCfgG4eXGEvoS9BV6h2UUdt/u9w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by BL3PR12MB6380.namprd12.prod.outlook.com (2603:10b6:208:38d::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.12; Thu, 16 Oct
 2025 15:02:32 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 15:02:32 +0000
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
 nouveau@lists.freedesktop.org, Edwin Peer <epeer@nvidia.com>
Subject: [PATCH v7 4/4] gpu: nova-core: bitfield: Add support for custom
 visiblity
Date: Thu, 16 Oct 2025 11:02:04 -0400
Message-Id: <20251016150204.1189641-5-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251016150204.1189641-1-joelagnelf@nvidia.com>
References: <20251016150204.1189641-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0810.namprd03.prod.outlook.com
 (2603:10b6:408:13f::35) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|BL3PR12MB6380:EE_
X-MS-Office365-Filtering-Correlation-Id: 4ce2a731-002c-4e97-656a-08de0cc50889
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fqfBEcEUlNAXGW6UwgA3Q6DoCHHVAc8NkblTe/wVPeyg4C0mc1XozkrnRCfj?=
 =?us-ascii?Q?RdBaiqnL/2GN311RIWuhZnLS7+VGPnF/uyQkDnigzCI6xDENcMW5iik1khmG?=
 =?us-ascii?Q?nML820rXUksV1MNFInTRw8/ooEwj9hvi60Le0ldPzn/TXQDEP0tRxJpTTDCi?=
 =?us-ascii?Q?s69zMC8n7OZJgsMh7wgnyD1ckox1U33M0I+4wEq3eEc+pxZGnowWUT1YtBrj?=
 =?us-ascii?Q?DSMjUieF7Fxd1ZWE+SQMBc/rz+ZP3FHvUjA8iYbWOc7doyGmmmmlfxraL9JZ?=
 =?us-ascii?Q?xZ6bIbNkuvygq0HNGYal2zgg1VsyX9SHgD/ramkXcIWWLewkvqW5vGN9rv78?=
 =?us-ascii?Q?98kxXfbezoMKn8Ja2HHXZHNoGynMhMg/kERsz5DvrvvdAiW2rpOB/kZfYZkZ?=
 =?us-ascii?Q?23uYxPHXHT/3AZehOL0kV/TpTKmR7rzg7BpahfTqwHb/LpNDt9I8gggAbSGH?=
 =?us-ascii?Q?JOZYovj2vFGBXq+eZIOSGDPQKfve334Lp2baLg6B003vM8i7U0GUPlJvza2U?=
 =?us-ascii?Q?R0MrC2QwnY1I8vaQ0a9cr0cZXFbcLYoTAvN/BrrGshGZtdKczkktjLHJoaNk?=
 =?us-ascii?Q?wkOMpvi8/Q1CbfzWRhmA0eDrFvYAW9mEzp6kkSVlwe6+EqLo8+tTiIt0vTA4?=
 =?us-ascii?Q?Wkf8u3cWPWh+OWVk35/ybbBZu5iJhDE/rnsL5Obd1DwaCeMRSfnx+AwVtsxe?=
 =?us-ascii?Q?vqN10yBqNYXTqKI8Sp4/y2Eh8F/PxCVSgOAsA31himaTpGMmoQXJ2cIywm35?=
 =?us-ascii?Q?DKsLo6lZMvNeTQAHbq+r+chYBC60NyXkL3BinLvXKBpyu1msmud6R55VtcFt?=
 =?us-ascii?Q?y/TE+t36gzGbWQva9B272aVc1qRiQ2cUy7+SdEWBXoINemUXEfTk2d9gC+8B?=
 =?us-ascii?Q?hMZmR0Gh6l2+WMATI7iKkr5YOz9N+cWojK8oRpJ1SnTdEH1w2dZtXNcTlQxf?=
 =?us-ascii?Q?QQa5u32MTvB2aSe4/QOxBcAMoHJotCBivjWPW+zuk8hVEm8nO7Act7Ub3EsX?=
 =?us-ascii?Q?KqL4negks8ebUltm7zjpqGGoaD40xUDfuY+c72cj0VZ58+6DsyBn8dqK47ws?=
 =?us-ascii?Q?U2ARANcQx7wIy9fK8gwtngy8qeOy1WR/DaW6dMT9rNceKXKsVPgT0UN0y2ro?=
 =?us-ascii?Q?zOL8VOUiVHRY8e5Y3PhGfXnbzYb1t7m3mODHggSTRgdGD9O44bi97oYr7BrV?=
 =?us-ascii?Q?1IlRyCNYgklRfzxfnQfE1yyA8OuSbeUCYcAyAj1ZzHnTXi+qxsapTCr45vhI?=
 =?us-ascii?Q?YEECyoZLHtL64xssMFHsommrEk981+6ALeomaP1yoM9tDz4NGlUffAPfZ35Y?=
 =?us-ascii?Q?3wu+9JtJHu96bq9D+rSwCSgKyLmpYNHu7G3jfu48rHmdd9TNTp4n/RBDyW8B?=
 =?us-ascii?Q?q32iLAqQ18mNgEFls7ehJ/IX9tm/2Z6+/ACJJ6V2ChlCOLSDYcRvFZq47miS?=
 =?us-ascii?Q?1vQW8aAQdl24uShOMbcW9Cv+zi/nY/8i?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JMw4xmQQ3nSePuqmdB/OoShFb104XH1k+cnygyMtnDwxiwkgyNRjcSOuvczn?=
 =?us-ascii?Q?lSu2c9iuzGoXgYrAkgZKEG20G0VJwl78jVYK2oeRn9WMmA2D1j9V7gAGdw1i?=
 =?us-ascii?Q?yugJSvivau+31RbVDJmMrhp8owKx8r4c9thMQcSV6KpADIfyVe42zlYNEvEv?=
 =?us-ascii?Q?rUCUCCNjdzquTh0cFDP2MwGyH0sfL+w7KQbxAk0G+TDkegv8X8bkgvjwxaP1?=
 =?us-ascii?Q?gFrptbNKI6OfOZ49WGVrNXIkx+bBs4qDKKhYbbWcvfhc0CSU5zEOUUpbe5dp?=
 =?us-ascii?Q?wpmSRAwpovxBfXPwHOr93anEn8SDMdE+sP4JAYWXov6iaohQ3EoBeiA90ywu?=
 =?us-ascii?Q?kmFx2dFIi/+FVvCisMbITKZkJTjcFF/zqrD+zmWw9mAPw5CIeD++B1Lj3saG?=
 =?us-ascii?Q?k3Dz2fZNAtmvHnA6oyrTV5QSGejD9103nfIpeVGnPEx77NAJqrqQPUg1Q7kV?=
 =?us-ascii?Q?fvApc6Jyi7HQ/FVDr9W039T3PzDM5ENZ4AfPmDyF+0buwg6IETYRHqLbCfvB?=
 =?us-ascii?Q?ujjkE+69FrXZSNXALC1rYZfN++rUPn7f0bXgj/h6rGeoyZyKBcHHMfr6uuID?=
 =?us-ascii?Q?hgwy6iOhQ8mSusXAUa0TgAkcDYs1PboQHCooEmP4re+LWFfQtuAdXce+USp8?=
 =?us-ascii?Q?r+kpwwnrxjGZu9QKVV7LpALBWEyxh9lGxe1ckiYy6Hcr1xBcC1RiQgL90LoF?=
 =?us-ascii?Q?IsI9KzHlKs5W8PI24DwY5nKLfCfniFOHVfCzJdZlHIMgsbFsiXFv6+kgPKR5?=
 =?us-ascii?Q?j8r7Jbg4q4WljJ9BKQcTrToQq6BRrwF/C8xc681SLftnEwUbJ3Xpyy+lVmT7?=
 =?us-ascii?Q?FNA+HFv7fgqk3w42bigTa0k4SJZx3bpgyIH2lg3LznRII9/ds+wUWhSydx4f?=
 =?us-ascii?Q?zTFy9eELbQRp0woKwelgm4stv26QKhshmL2nvK6rYhKQLTtDzSmv4wQT6LiE?=
 =?us-ascii?Q?rWT4EtnlBiTagvGALW9Er3ZgHKP7N4swC/VRlc+u7KO2Nan2uL/0vtbBbpS1?=
 =?us-ascii?Q?cZYMCS2hlWvku+yRPTu73xbAkx87DnrzhvTPuZ8qSmM+6a/e40BoUSc7A+ka?=
 =?us-ascii?Q?eCAvzT9JI3L4D8HGcx1F3fgP3saUBk1GHicxfogVqfxRcwcptY2GPaGWqCqO?=
 =?us-ascii?Q?3aDls7TGSQbT5k4idlNFFY8Ulr5Md6KuDJG2ZPI8mP3puJCmgyktECT+eypm?=
 =?us-ascii?Q?EA37rlWGdTTiwSrHxlERBww3ayY+eQgEbrUCNZHuOOen9aa8/Svdcv7m/Yj6?=
 =?us-ascii?Q?LUYx2bvv9JAWvADAIGK6mKFQOs0M3nyIv6bSmVRl2V0G46X0GmyLhTe3v+7K?=
 =?us-ascii?Q?2V+I3Nu4cTyGMOxy9Tck6PeogI6BcUk1jKdiTKlqZ8wsImQ1aNy1C9ykEqNk?=
 =?us-ascii?Q?O7Km2bkJIJzix17mcMi2+lId3ldT7IHJ3bvMjobaG7DZN32nRkkvW/yOEl8m?=
 =?us-ascii?Q?ZljOW71vEbg+vaGnRJk3noep0eFkz0dLl68nb8G54wrKJZtuUbTSITwj7CJe?=
 =?us-ascii?Q?fT2J2vh7wo6WRy0iwcmEbf4Ud6O8kz96u6RZSfRx+shbWfvJ/p2deepxPove?=
 =?us-ascii?Q?sT1/50cQi5YZGAAApoKxSfPUjpUL4dRGFrmTQzkGXsS3oYuj4q17bljdhXGW?=
 =?us-ascii?Q?Lg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4ce2a731-002c-4e97-656a-08de0cc50889
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 15:02:32.6675 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Pe1VSrsPKzWheS5tPKU3gHKplm1kMW6EErt3VYp6ZyOLIn66tNxJu0Cv41GeKeIuuIsK3Kn7zZHLSRAEXYjkBw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB6380
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

Add support for custom visiblity to allow for users to control
visibility
of the structure and helpers.

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
Reviewed-by: Elle Rhumsaa <elle@weathered-steel.dev>
Reviewed-by: Edwin Peer <epeer@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/bitfield.rs    | 49 +++++++++++++++-------------
 drivers/gpu/nova-core/regs/macros.rs | 16 ++++-----
 2 files changed, 34 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/nova-core/bitfield.rs b/drivers/gpu/nova-core/bitfield.rs
index 998970ff0bbc..0994505393dd 100644
--- a/drivers/gpu/nova-core/bitfield.rs
+++ b/drivers/gpu/nova-core/bitfield.rs
@@ -60,7 +60,7 @@
 /// }
 ///
 /// bitfield! {
-///     struct ControlReg(u32) {
+///     pub struct ControlReg(u32) {
 ///         3:0 mode as u8 ?=> Mode;
 ///         7:7 state as bool => State;
 ///     }
@@ -74,6 +74,9 @@
 ///   struct's storage size.
 /// - Debug and Default implementations.
 ///
+/// Note: Field accessors and setters inherit the same visibility as the struct itself.
+/// In the example above, both `mode()` and `set_mode()` methods will be `pub`.
+///
 /// Fields are defined as follows:
 ///
 /// - `as <type>` simply returns the field value casted to <type>, typically `u32`, `u16`, `u8` or
@@ -84,21 +87,21 @@
 ///   and returns the result. This is useful with fields for which not all values are valid.
 macro_rules! bitfield {
     // Main entry point - defines the bitfield struct with fields
-    (struct $name:ident($storage:ty) $(, $comment:literal)? { $($fields:tt)* }) => {
-        bitfield!(@core $name $storage $(, $comment)? { $($fields)* });
+    ($vis:vis struct $name:ident($storage:ty) $(, $comment:literal)? { $($fields:tt)* }) => {
+        bitfield!(@core $vis $name $storage $(, $comment)? { $($fields)* });
     };
 
     // All rules below are helpers.
 
     // Defines the wrapper `$name` type, as well as its relevant implementations (`Debug`,
     // `Default`, `BitOr`, and conversion to the value type) and field accessor methods.
-    (@core $name:ident $storage:ty $(, $comment:literal)? { $($fields:tt)* }) => {
+    (@core $vis:vis $name:ident $storage:ty $(, $comment:literal)? { $($fields:tt)* }) => {
         $(
         #[doc=$comment]
         )?
         #[repr(transparent)]
         #[derive(Clone, Copy)]
-        pub(crate) struct $name($storage);
+        $vis struct $name($storage);
 
         impl ::core::ops::BitOr for $name {
             type Output = Self;
@@ -114,14 +117,14 @@ fn from(val: $name) -> $storage {
             }
         }
 
-        bitfield!(@fields_dispatcher $name $storage { $($fields)* });
+        bitfield!(@fields_dispatcher $vis $name $storage { $($fields)* });
     };
 
     // Captures the fields and passes them to all the implementers that require field information.
     //
     // Used to simplify the matching rules for implementers, so they don't need to match the entire
     // complex fields rule even though they only make use of part of it.
-    (@fields_dispatcher $name:ident $storage:ty {
+    (@fields_dispatcher $vis:vis $name:ident $storage:ty {
         $($hi:tt:$lo:tt $field:ident as $type:tt
             $(?=> $try_into_type:ty)?
             $(=> $into_type:ty)?
@@ -130,7 +133,7 @@ fn from(val: $name) -> $storage {
         )*
     }
     ) => {
-        bitfield!(@field_accessors $name $storage {
+        bitfield!(@field_accessors $vis $name $storage {
             $(
                 $hi:$lo $field as $type
                 $(?=> $try_into_type)?
@@ -145,7 +148,7 @@ fn from(val: $name) -> $storage {
 
     // Defines all the field getter/setter methods for `$name`.
     (
-        @field_accessors $name:ident $storage:ty {
+        @field_accessors $vis:vis $name:ident $storage:ty {
         $($hi:tt:$lo:tt $field:ident as $type:tt
             $(?=> $try_into_type:ty)?
             $(=> $into_type:ty)?
@@ -161,7 +164,7 @@ fn from(val: $name) -> $storage {
         #[allow(dead_code)]
         impl $name {
             $(
-            bitfield!(@field_accessor $name $storage, $hi:$lo $field as $type
+            bitfield!(@field_accessor $vis $name $storage, $hi:$lo $field as $type
                 $(?=> $try_into_type)?
                 $(=> $into_type)?
                 $(, $comment)?
@@ -195,11 +198,11 @@ impl $name {
 
     // Catches fields defined as `bool` and convert them into a boolean value.
     (
-        @field_accessor $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as bool => $into_type:ty
+        @field_accessor $vis:vis $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as bool => $into_type:ty
             $(, $comment:literal)?;
     ) => {
         bitfield!(
-            @leaf_accessor $name $storage, $hi:$lo $field
+            @leaf_accessor $vis $name $storage, $hi:$lo $field
             { |f| <$into_type>::from(if f != 0 { true } else { false }) }
             bool $into_type => $into_type $(, $comment)?;
         );
@@ -207,17 +210,17 @@ impl $name {
 
     // Shortcut for fields defined as `bool` without the `=>` syntax.
     (
-        @field_accessor $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as bool $(, $comment:literal)?;
+        @field_accessor $vis:vis $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as bool $(, $comment:literal)?;
     ) => {
-        bitfield!(@field_accessor $name $storage, $hi:$lo $field as bool => bool $(, $comment)?;);
+        bitfield!(@field_accessor $vis $name $storage, $hi:$lo $field as bool => bool $(, $comment)?;);
     };
 
     // Catches the `?=>` syntax for non-boolean fields.
     (
-        @field_accessor $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as $type:tt ?=> $try_into_type:ty
+        @field_accessor $vis:vis $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as $type:tt ?=> $try_into_type:ty
             $(, $comment:literal)?;
     ) => {
-        bitfield!(@leaf_accessor $name $storage, $hi:$lo $field
+        bitfield!(@leaf_accessor $vis $name $storage, $hi:$lo $field
             { |f| <$try_into_type>::try_from(f as $type) } $type $try_into_type =>
             ::core::result::Result<
                 $try_into_type,
@@ -228,24 +231,24 @@ impl $name {
 
     // Catches the `=>` syntax for non-boolean fields.
     (
-        @field_accessor $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as $type:tt => $into_type:ty
+        @field_accessor $vis:vis $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as $type:tt => $into_type:ty
             $(, $comment:literal)?;
     ) => {
-        bitfield!(@leaf_accessor $name $storage, $hi:$lo $field
+        bitfield!(@leaf_accessor $vis $name $storage, $hi:$lo $field
             { |f| <$into_type>::from(f as $type) } $type $into_type => $into_type $(, $comment)?;);
     };
 
     // Shortcut for non-boolean fields defined without the `=>` or `?=>` syntax.
     (
-        @field_accessor $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as $type:tt
+        @field_accessor $vis:vis $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as $type:tt
             $(, $comment:literal)?;
     ) => {
-        bitfield!(@field_accessor $name $storage, $hi:$lo $field as $type => $type $(, $comment)?;);
+        bitfield!(@field_accessor $vis $name $storage, $hi:$lo $field as $type => $type $(, $comment)?;);
     };
 
     // Generates the accessor methods for a single field.
     (
-        @leaf_accessor $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident
+        @leaf_accessor $vis:vis $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident
             { $process:expr } $prim_type:tt $to_type:ty => $res_type:ty $(, $comment:literal)?;
     ) => {
         ::kernel::macros::paste!(
@@ -268,7 +271,7 @@ impl $name {
         #[doc=$comment]
         )?
         #[inline(always)]
-        pub(crate) fn $field(self) -> $res_type {
+        $vis fn $field(self) -> $res_type {
             ::kernel::macros::paste!(
             const MASK: $storage = $name::[<$field:upper _MASK>];
             const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
@@ -284,7 +287,7 @@ pub(crate) fn $field(self) -> $res_type {
         #[doc=$comment]
         )?
         #[inline(always)]
-        pub(crate) fn [<set_ $field>](mut self, value: $to_type) -> Self {
+        $vis fn [<set_ $field>](mut self, value: $to_type) -> Self {
             const MASK: $storage = $name::[<$field:upper _MASK>];
             const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
             let value = ($storage::from($prim_type::from(value)) << SHIFT) & MASK;
diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index ffd7d5cb73bb..c0a5194e8d97 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -276,25 +276,25 @@ pub(crate) trait RegisterBase<T> {
 macro_rules! register {
     // Creates a register at a fixed offset of the MMIO space.
     ($name:ident @ $offset:literal $(, $comment:literal)? { $($fields:tt)* } ) => {
-        bitfield!(struct $name(u32) $(, $comment)? { $($fields)* } );
+        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
         register!(@io_fixed $name @ $offset);
     };
 
     // Creates an alias register of fixed offset register `alias` with its own fields.
     ($name:ident => $alias:ident $(, $comment:literal)? { $($fields:tt)* } ) => {
-        bitfield!(struct $name(u32) $(, $comment)? { $($fields)* } );
+        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
         register!(@io_fixed $name @ $alias::OFFSET);
     };
 
     // Creates a register at a relative offset from a base address provider.
     ($name:ident @ $base:ty [ $offset:literal ] $(, $comment:literal)? { $($fields:tt)* } ) => {
-        bitfield!(struct $name(u32) $(, $comment)? { $($fields)* } );
+        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
         register!(@io_relative $name @ $base [ $offset ]);
     };
 
     // Creates an alias register of relative offset register `alias` with its own fields.
     ($name:ident => $base:ty [ $alias:ident ] $(, $comment:literal)? { $($fields:tt)* }) => {
-        bitfield!(struct $name(u32) $(, $comment)? { $($fields)* } );
+        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
         register!(@io_relative $name @ $base [ $alias::OFFSET ]);
     };
 
@@ -305,7 +305,7 @@ macro_rules! register {
         }
     ) => {
         static_assert!(::core::mem::size_of::<u32>() <= $stride);
-        bitfield!(struct $name(u32) $(, $comment)? { $($fields)* } );
+        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
         register!(@io_array $name @ $offset [ $size ; $stride ]);
     };
 
@@ -326,7 +326,7 @@ macro_rules! register {
             $(, $comment:literal)? { $($fields:tt)* }
     ) => {
         static_assert!(::core::mem::size_of::<u32>() <= $stride);
-        bitfield!(struct $name(u32) $(, $comment)? { $($fields)* } );
+        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
         register!(@io_relative_array $name @ $base [ $offset [ $size ; $stride ] ]);
     };
 
@@ -348,7 +348,7 @@ macro_rules! register {
         }
     ) => {
         static_assert!($idx < $alias::SIZE);
-        bitfield!(struct $name(u32) $(, $comment)? { $($fields)* } );
+        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
         register!(@io_relative $name @ $base [ $alias::OFFSET + $idx * $alias::STRIDE ] );
     };
 
@@ -357,7 +357,7 @@ macro_rules! register {
     // to avoid it being interpreted in place of the relative register array alias rule.
     ($name:ident => $alias:ident [ $idx:expr ] $(, $comment:literal)? { $($fields:tt)* }) => {
         static_assert!($idx < $alias::SIZE);
-        bitfield!(struct $name(u32) $(, $comment)? { $($fields)* } );
+        bitfield!(pub(crate) struct $name(u32) $(, $comment)? { $($fields)* } );
         register!(@io_fixed $name @ $alias::OFFSET + $idx * $alias::STRIDE );
     };
 
-- 
2.34.1

