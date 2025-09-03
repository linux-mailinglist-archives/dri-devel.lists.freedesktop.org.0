Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DC869B42C3B
	for <lists+dri-devel@lfdr.de>; Wed,  3 Sep 2025 23:54:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4663610E94E;
	Wed,  3 Sep 2025 21:54:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="h8pcFQF/";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2054.outbound.protection.outlook.com [40.107.94.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6133910E946;
 Wed,  3 Sep 2025 21:54:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YfXTSp2Kv8WkkPCJhhx0CEEilgXWx8iVZ1/NEt+lYn1IIqJsrP1s1KrUkaxOBoLk4NQeDNVcz3G9X9UHSgzpqt4fJ/KOO5LZxrDfda/wqew7SOihA8tqzmdVxFNWebch+Fu5cdj9dJtbCw2G6KOqm0ZXURjTecELCbxUmsMxfyT2hkn8SBjTsBkzc6zemFhYKeUjqWQen00VcfJmQd+KWRblya3clAeJOuardzareJfyHef6ZGaHRciW93Au24zJLT5Lrt/Gb72KtlCTX660HOC0W1OudZMO/Dg6YoANs6xwqGa1frt/8Dl7KYZKAymfNYWwdULvhCwVT/MWfg9IJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mNqVMI3dCkNEhp/x5pJyhEVtxtutIwF7FKIT5r03P8s=;
 b=ZkzF87qc9VmOC3KuGks84zp+g7dhdEwtXhMpZQZVfCz2M7R4iDR0ApPXpXlm4tAS5BS0K2J2uH+2ezZ6rl2+hemmBiugVl3n0nY91g2hTMgoxFZzLVW/0R53fNVHLKG78IKAArSHpW11CQx4tIKiKvYeWtYprnIYTywBoti/RJyozTlEjJ6uimxHsgbtolbpPcsNl5Arq9JBaQiryFB+C5/MR1QaWvMkF4YNTTSj9gH1ehE/5fNGwnrvL9xEJ2YvrFC+ruoMpODNUpAZRT4OphR8ePqvKZ5YA/QJvlShMe8O+192a3NZ6qm4cSxHXRVBqWR8Spb1FaPa9uLqksULAQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mNqVMI3dCkNEhp/x5pJyhEVtxtutIwF7FKIT5r03P8s=;
 b=h8pcFQF/wthbxyYnP70qR8jS0QQaSDlq7DuL+9rGGXQSCaaAFjy2F7djW6Gfhq5Hbg0WM+7n/QHkKDzVB6cnHNrZK8MUpbfv7oLsrUSlgGIL2zvNxjzodybSuz//1zrgt+7DPlzQ+JL1OVkSam9k/AW84KyeTj3HI91pyYjUOj1tEpCF3lx+fVH+qQoL4og8OUtMLv0C83EzeRUAp/1asstis40VHbMZUwZ3OIoIqx+YwvTmlIlWkIgzIE+YHO2GCCPxgo8Uk7+5O2GK8K2AbuuoeZHN/gJaFnzUruihGHZlPUVcD09v09IxsFwMksydPeKp+k8pph1TQFMJNfgXeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS2PR12MB9589.namprd12.prod.outlook.com (2603:10b6:8:279::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.27; Wed, 3 Sep
 2025 21:54:38 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9073.021; Wed, 3 Sep 2025
 21:54:38 +0000
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
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: [PATCH v2 3/4] nova-core: bitstruct: Add support for custom visiblity
Date: Wed,  3 Sep 2025 17:54:27 -0400
Message-Id: <20250903215428.1296517-4-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250903215428.1296517-1-joelagnelf@nvidia.com>
References: <20250903215428.1296517-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR01CA0038.prod.exchangelabs.com (2603:10b6:208:23f::7)
 To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS2PR12MB9589:EE_
X-MS-Office365-Filtering-Correlation-Id: d8c5a2b7-74d8-4169-22e7-08ddeb347a57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HbzXuo+//DJQcp7rasYksci1Pht/oqrCh0YHs4tgo0/1D8q8NNHyEYj4hG2v?=
 =?us-ascii?Q?uXFS3x9gnJdO1hDv3KnLK150NXYNRRCElEU5wBoBPb+eyRGkS9JJ7pLDJeXv?=
 =?us-ascii?Q?JDcLKPzxA/sDLloPmc7pCAdot9ELbg19ELkszl87AODMWoKpdMBksCz1xQRL?=
 =?us-ascii?Q?0Xrhpw4u2o+vh93HzlRSo8hxzeFO9/GxkbBvxAmUiKbmBu6W+D0Oh5Mn/v2I?=
 =?us-ascii?Q?PJgayyB4Iltpt3vPCODH/VOzaRqFM3jY4vqnEIdOKaeSerPdF/o0kFhxdD3o?=
 =?us-ascii?Q?3Br21YWAoXOhkHrzLr10YIa4I5o4PEhtRr+m94uvfyY9bAMJJ2JHuLxeSO7T?=
 =?us-ascii?Q?QPVBf/Wje6criR1YCYTXnQPJWLeZKj5AtO8uejWmHMAxZbKghLIdnZgTKcnj?=
 =?us-ascii?Q?Dd0+wFxsHS/P23aauzwia5cEAUA1dPtEmRot4hBmZWnfDL4rbE48+6YVOaWt?=
 =?us-ascii?Q?4ZQSueFCavc3HBVdqZiQTS2K/Olzg9FZCAMmXpfJey2PMo6SAAzBmrzx2qsr?=
 =?us-ascii?Q?HOodJjUoICmDeAZqdRBiQfeY1u67mqzZta/+ZldSKpQgjVXAZslUbD2hlGuL?=
 =?us-ascii?Q?SgIjBi/bUXnCsRgOqla6rBDRBHUuojqUG17Zh6R6k/o1hFZRLHH3DMLa7Y/w?=
 =?us-ascii?Q?IBrY/FPZ4VLBUg6jeD+o+HYLeU0ctuRxkcwuGJiLEVQPAAg+LquNcMUKwhO4?=
 =?us-ascii?Q?MfUZMUJIWG9YyOTef7ntgL30F4UiB5ajZWZQrj8nMSQpbSzm91TOWfUNrcSX?=
 =?us-ascii?Q?IfEsf/6Pk1gujcZ0b/qtJG4yAmM3yl07iMy6jCj1HKKoZ99xzC8QfbXWdNA/?=
 =?us-ascii?Q?mKvDHLgS2vzQMYvoAJN56HYeW16ogQnSIfyGNYCD68B/aQ36nhiC7ZXPu8Cd?=
 =?us-ascii?Q?fGS5+idRb+O5GOQiG0/jImIit0cp8crxowoLiOZrpoJ04IQHJsy1SJSv+PZ9?=
 =?us-ascii?Q?V4e5VroOTNOx93yDPCKG0/00FENKaiGH6mR9Q73KXXqLWKopYq/dDHmN/VxT?=
 =?us-ascii?Q?i9RV8RRxkOYuiM8yZZEFu9o8yO9UR8/8HjIDQweLKWBkAf2tcaY0jtu792UU?=
 =?us-ascii?Q?NphVGc7bVOhJHh5RT8uIQz7tDmyu2+/Bnt9Em0EgUS70SsHByJGvIEAv41VP?=
 =?us-ascii?Q?Kspjshsx7yeYyUfCsFEpL3W623oXLzlx/yYhVVP0ugL2lxyad7BnYM/FuJP2?=
 =?us-ascii?Q?4LRDPRRH4xn6oXmR+JYeKHLVadrABeJ5i9MGGtol0NUUqDmHUSSmI/JqMD5u?=
 =?us-ascii?Q?kRusEjOh2i2xmiQoyKWYsWiFqrSbvx8QRzjbPWgwyd/89wffCR8h1JJwhAZS?=
 =?us-ascii?Q?XROkH5vK1qZA4xWJsmH8HSTaOfpE/NsJV1E8cID2XOzs1xERdg604NBB+ZRy?=
 =?us-ascii?Q?p+rRguKzh7/45ZiL59arkVxBSjmfPADhDro4dOzbzymjbTXqgQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tC0LLSTREHTKM5HArnWVG2AbN9jWmrjEv+pYlACcfSlFcm6icdhS65tdREo+?=
 =?us-ascii?Q?Kmv52hFYsGAfzwjDe7p1hFdIOL2Z6HWTQyaOveH8gqaf1eYb4eR74X3KLE/z?=
 =?us-ascii?Q?vsR0vV54I38Fe120bldEqravOQ/7hv78FRYgqtlaBN2/KRzgHoNFQy1w3CVw?=
 =?us-ascii?Q?06SE77ac8yZoapNWavNQ9ARgdCxtHvMFJzCjgSDeL/H98R0nC0O9xEUyeX75?=
 =?us-ascii?Q?zYc+/al5Ho9eN3YmyKBRb7imeWgm5kMb1SO8USUPx+dNyexhYxF4wcuOODCW?=
 =?us-ascii?Q?HFDtDwcR4R5Xt0Fg+JhO40ftG3dGF6WAdGZhHZurustVwFOk+7J9ZX1r8u9V?=
 =?us-ascii?Q?MX2/rW7wDwL3aEmtbmpNb18/l/IZjxNC4gtSoFRkBcxb0ZrHwAaZj0/zvpHG?=
 =?us-ascii?Q?hRfJhSK8fbYuEoVMy3Ng+h1+HSWt092x24CnmY8GSmoUooSO2IhIiSwGBVY7?=
 =?us-ascii?Q?JQiJrAhHojrjEzk5renurrUZwDcJGA4mGel6gAwicqjobJPM3iHCICf4yeV+?=
 =?us-ascii?Q?1jN0Hxwo8qoDe4o9fDJ7ttRgOsD4QTxYpWUj/idQbRWrB8/Wwqsp7OsftHv+?=
 =?us-ascii?Q?OETJQiCr+IMTFl8VMOwgmlYrVB2Tmmlm1dpIDqBb/gUgExL/acPrOMg6ZnQ6?=
 =?us-ascii?Q?HMRuFscZuH96QGLBAK1gac13/RjOH3talOEbzG90xX5fRWGqgxCw2MAxJ9pu?=
 =?us-ascii?Q?jqsN576AEOeDeF1W4SyBpXCenlkywxPSagKdjA1D3Mg6kHJI/CnG/dNZhreT?=
 =?us-ascii?Q?h3PuLnq/hgoym4wlzI3sPDDxo8mFeDY8Cr9wA7nY5HCeZxBvTSpBRJ5UGTjP?=
 =?us-ascii?Q?z967NPtoQy4e/XDzUSrgsmSKxeTTgCLT1rlQFAv8zP8VpvUdcubOJXQ4W+vw?=
 =?us-ascii?Q?Rdv7j1cXgMSsgGrWup3Sf8BEbZNuaYR2yD/msj+A583bS4TKdBB3fkJl+2lj?=
 =?us-ascii?Q?rJB2MAdhdVJ82mB52AFAUyxc5CcfqOyYhA3+v1+vnI3DAQMtw4Bu4T7XsvZY?=
 =?us-ascii?Q?x3lSZ02KplH1qg6GGv7bdstn6E6OqBHX2z49EE9SOFWPU8XqJBwlJM95MFeX?=
 =?us-ascii?Q?eSsGAPIZ8breRBlcFtigMYDikOEvFuE83tvSgEboSEFLtCpseh2BGw9nFyCo?=
 =?us-ascii?Q?74KDskdNdj/am8XZQE7sSiEwYm7k8YZhuuUPJrfKfB7zoUNsRbybGmCOwuSD?=
 =?us-ascii?Q?7cgCVHIQeJJPAEDavL9jG7m6pmg0i82RPoZxGCCICoLb2VcDXJmz/ZweGVqT?=
 =?us-ascii?Q?vaY9N1WMuRUWpOTQhv3Qy7a6E7u5EtLd2BDoka3zoMGxwRfEYUErueeW3hMQ?=
 =?us-ascii?Q?lRvFjYdJSi8SaicUsO+4WjDlBTiySvz6N452gp2k+2CF14Vw+SmCjtlXcBCx?=
 =?us-ascii?Q?WiB+meNsQVHjJ46UFbqjjSdZStdGVl5TfTDFbHKRDM9Y8n18v30XUVNATjy0?=
 =?us-ascii?Q?zkDsbDEWDQAMaoAQCgoEIZl14g/aw7a6xpC6AZJZzfl7NRbnPBU2OgdqVdY3?=
 =?us-ascii?Q?13D4U5OXUZ9/WEbTGyhURx5gbb5tcPwxtzkpkn/82ph4yQa13N5SonIK8GmV?=
 =?us-ascii?Q?RGzrv8Zv0rf1GKj8QAl/+SVFGHovY+4pF0Wvz3Qw?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d8c5a2b7-74d8-4169-22e7-08ddeb347a57
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2025 21:54:38.1510 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GrwMvbMfBKV6l5VLiZa+FLj80Y7tUa/3pG/MAYVVS0xmTBV4svFSMd5qy8XjUqVHZcUOAFtVNZN5q3ALy9Wzbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9589
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

Add support for custom visiblity to allow for users to control visibility
of the structure and helpers.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/bitstruct.rs   | 46 ++++++++++++++--------------
 drivers/gpu/nova-core/regs/macros.rs | 16 +++++-----
 2 files changed, 31 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/nova-core/bitstruct.rs b/drivers/gpu/nova-core/bitstruct.rs
index 068334c86981..1047c5c17e2d 100644
--- a/drivers/gpu/nova-core/bitstruct.rs
+++ b/drivers/gpu/nova-core/bitstruct.rs
@@ -9,7 +9,7 @@
 ///
 /// ```rust
 /// bitstruct! {
-///     struct ControlReg: u32 {
+///     pub struct ControlReg: u32 {
 ///         3:0       mode        as u8 ?=> Mode;
 ///         7:4       state       as u8 => State;
 ///     }
@@ -34,21 +34,21 @@
 ///   and returns the result. This is useful with fields for which not all values are valid.
 macro_rules! bitstruct {
     // Main entry point - defines the bitfield struct with fields
-    (struct $name:ident : $storage:ty $(, $comment:literal)? { $($fields:tt)* }) => {
-        bitstruct!(@core $name $storage $(, $comment)? { $($fields)* });
+    ($vis:vis struct $name:ident : $storage:ty $(, $comment:literal)? { $($fields:tt)* }) => {
+        bitstruct!(@core $name $vis $storage $(, $comment)? { $($fields)* });
     };
 
     // All rules below are helpers.
 
     // Defines the wrapper `$name` type, as well as its relevant implementations (`Debug`,
     // `Default`, `BitOr`, and conversion to the value type) and field accessor methods.
-    (@core $name:ident $storage:ty $(, $comment:literal)? { $($fields:tt)* }) => {
+    (@core $name:ident $vis:vis $storage:ty $(, $comment:literal)? { $($fields:tt)* }) => {
         $(
         #[doc=$comment]
         )?
         #[repr(transparent)]
         #[derive(Clone, Copy)]
-        pub(crate) struct $name($storage);
+        $vis struct $name($vis $storage);
 
         impl ::core::ops::BitOr for $name {
             type Output = Self;
@@ -64,14 +64,14 @@ fn from(val: $name) -> $storage {
             }
         }
 
-        bitstruct!(@fields_dispatcher $name $storage { $($fields)* });
+        bitstruct!(@fields_dispatcher $name $vis $storage { $($fields)* });
     };
 
     // Captures the fields and passes them to all the implementers that require field information.
     //
     // Used to simplify the matching rules for implementers, so they don't need to match the entire
     // complex fields rule even though they only make use of part of it.
-    (@fields_dispatcher $name:ident $storage:ty {
+    (@fields_dispatcher $name:ident $vis:vis $storage:ty {
         $($hi:tt:$lo:tt $field:ident as $type:tt
             $(?=> $try_into_type:ty)?
             $(=> $into_type:ty)?
@@ -80,7 +80,7 @@ fn from(val: $name) -> $storage {
         )*
     }
     ) => {
-        bitstruct!(@field_accessors $name $storage {
+        bitstruct!(@field_accessors $name $vis $storage {
             $(
                 $hi:$lo $field as $type
                 $(?=> $try_into_type)?
@@ -95,7 +95,7 @@ fn from(val: $name) -> $storage {
 
     // Defines all the field getter/setter methods for `$name`.
     (
-        @field_accessors $name:ident $storage:ty {
+        @field_accessors $name:ident $vis:vis $storage:ty {
         $($hi:tt:$lo:tt $field:ident as $type:tt
             $(?=> $try_into_type:ty)?
             $(=> $into_type:ty)?
@@ -111,7 +111,7 @@ fn from(val: $name) -> $storage {
         #[allow(dead_code)]
         impl $name {
             $(
-            bitstruct!(@field_accessor $name $storage, $hi:$lo $field as $type
+            bitstruct!(@field_accessor $name $vis $storage, $hi:$lo $field as $type
                 $(?=> $try_into_type)?
                 $(=> $into_type)?
                 $(, $comment)?
@@ -145,11 +145,11 @@ impl $name {
 
     // Catches fields defined as `bool` and convert them into a boolean value.
     (
-        @field_accessor $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as bool => $into_type:ty
+        @field_accessor $name:ident $vis:vis $storage:ty, $hi:tt:$lo:tt $field:ident as bool => $into_type:ty
             $(, $comment:literal)?;
     ) => {
         bitstruct!(
-            @leaf_accessor $name $storage, $hi:$lo $field
+            @leaf_accessor $name $vis $storage, $hi:$lo $field
             { |f| <$into_type>::from(if f != 0 { true } else { false }) }
             $into_type => $into_type $(, $comment)?;
         );
@@ -157,17 +157,17 @@ impl $name {
 
     // Shortcut for fields defined as `bool` without the `=>` syntax.
     (
-        @field_accessor $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as bool $(, $comment:literal)?;
+        @field_accessor $name:ident $vis:vis $storage:ty, $hi:tt:$lo:tt $field:ident as bool $(, $comment:literal)?;
     ) => {
-        bitstruct!(@field_accessor $name $storage, $hi:$lo $field as bool => bool $(, $comment)?;);
+        bitstruct!(@field_accessor $name $vis $storage, $hi:$lo $field as bool => bool $(, $comment)?;);
     };
 
     // Catches the `?=>` syntax for non-boolean fields.
     (
-        @field_accessor $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as $type:tt ?=> $try_into_type:ty
+        @field_accessor $name:ident $vis:vis $storage:ty, $hi:tt:$lo:tt $field:ident as $type:tt ?=> $try_into_type:ty
             $(, $comment:literal)?;
     ) => {
-        bitstruct!(@leaf_accessor $name $storage, $hi:$lo $field
+        bitstruct!(@leaf_accessor $name $vis $storage, $hi:$lo $field
             { |f| <$try_into_type>::try_from(f as $type) } $try_into_type =>
             ::core::result::Result<
                 $try_into_type,
@@ -178,24 +178,24 @@ impl $name {
 
     // Catches the `=>` syntax for non-boolean fields.
     (
-        @field_accessor $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as $type:tt => $into_type:ty
+        @field_accessor $name:ident $vis:vis $storage:ty, $hi:tt:$lo:tt $field:ident as $type:tt => $into_type:ty
             $(, $comment:literal)?;
     ) => {
-        bitstruct!(@leaf_accessor $name $storage, $hi:$lo $field
+        bitstruct!(@leaf_accessor $name $vis $storage, $hi:$lo $field
             { |f| <$into_type>::from(f as $type) } $into_type => $into_type $(, $comment)?;);
     };
 
     // Shortcut for non-boolean fields defined without the `=>` or `?=>` syntax.
     (
-        @field_accessor $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident as $type:tt
+        @field_accessor $name:ident $vis:vis $storage:ty, $hi:tt:$lo:tt $field:ident as $type:tt
             $(, $comment:literal)?;
     ) => {
-        bitstruct!(@field_accessor $name $storage, $hi:$lo $field as $type => $type $(, $comment)?;);
+        bitstruct!(@field_accessor $name $vis $storage, $hi:$lo $field as $type => $type $(, $comment)?;);
     };
 
     // Generates the accessor methods for a single field.
     (
-        @leaf_accessor $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident
+        @leaf_accessor $name:ident $vis:vis $storage:ty, $hi:tt:$lo:tt $field:ident
             { $process:expr } $to_type:ty => $res_type:ty $(, $comment:literal)?;
     ) => {
         ::kernel::macros::paste!(
@@ -218,7 +218,7 @@ impl $name {
         #[doc=$comment]
         )?
         #[inline(always)]
-        pub(crate) fn $field(self) -> $res_type {
+        $vis fn $field(self) -> $res_type {
             ::kernel::macros::paste!(
             const MASK: $storage = $name::[<$field:upper _MASK>];
             const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
@@ -234,7 +234,7 @@ pub(crate) fn $field(self) -> $res_type {
         #[doc=$comment]
         )?
         #[inline(always)]
-        pub(crate) fn [<set_ $field>](mut self, value: $to_type) -> Self {
+        $vis fn [<set_ $field>](mut self, value: $to_type) -> Self {
             const MASK: $storage = $name::[<$field:upper _MASK>];
             const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
             let value = (<$storage>::from(value) << SHIFT) & MASK;
diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index bbfeab147c9f..22a53a73b765 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -284,25 +284,25 @@ pub(crate) trait RegisterBase<T> {
 macro_rules! register {
     // Creates a register at a fixed offset of the MMIO space.
     ($name:ident @ $offset:literal $(, $comment:literal)? { $($fields:tt)* } ) => {
-        bitstruct!(struct $name: u32 $(, $comment)? { $($fields)* } );
+        bitstruct!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
         register!(@io_fixed $name @ $offset);
     };
 
     // Creates an alias register of fixed offset register `alias` with its own fields.
     ($name:ident => $alias:ident $(, $comment:literal)? { $($fields:tt)* } ) => {
-        bitstruct!(struct $name: u32 $(, $comment)? { $($fields)* } );
+        bitstruct!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
         register!(@io_fixed $name @ $alias::OFFSET);
     };
 
     // Creates a register at a relative offset from a base address provider.
     ($name:ident @ $base:ty [ $offset:literal ] $(, $comment:literal)? { $($fields:tt)* } ) => {
-        bitstruct!(struct $name: u32 $(, $comment)? { $($fields)* } );
+        bitstruct!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
         register!(@io_relative $name @ $base [ $offset ]);
     };
 
     // Creates an alias register of relative offset register `alias` with its own fields.
     ($name:ident => $base:ty [ $alias:ident ] $(, $comment:literal)? { $($fields:tt)* }) => {
-        bitstruct!(struct $name: u32 $(, $comment)? { $($fields)* } );
+        bitstruct!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
         register!(@io_relative $name @ $base [ $alias::OFFSET ]);
     };
 
@@ -313,7 +313,7 @@ macro_rules! register {
         }
     ) => {
         static_assert!(::core::mem::size_of::<u32>() <= $stride);
-        bitstruct!(struct $name: u32 $(, $comment)? { $($fields)* } );
+        bitstruct!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
         register!(@io_array $name @ $offset [ $size ; $stride ]);
     };
 
@@ -334,7 +334,7 @@ macro_rules! register {
             $(, $comment:literal)? { $($fields:tt)* }
     ) => {
         static_assert!(::core::mem::size_of::<u32>() <= $stride);
-        bitstruct!(struct $name: u32 $(, $comment)? { $($fields)* } );
+        bitstruct!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
         register!(@io_relative_array $name @ $base [ $offset [ $size ; $stride ] ]);
     };
 
@@ -356,7 +356,7 @@ macro_rules! register {
         }
     ) => {
         static_assert!($idx < $alias::SIZE);
-        bitstruct!(struct $name: u32 $(, $comment)? { $($fields)* } );
+        bitstruct!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
         register!(@io_relative $name @ $base [ $alias::OFFSET + $idx * $alias::STRIDE ] );
     };
 
@@ -365,7 +365,7 @@ macro_rules! register {
     // to avoid it being interpreted in place of the relative register array alias rule.
     ($name:ident => $alias:ident [ $idx:expr ] $(, $comment:literal)? { $($fields:tt)* }) => {
         static_assert!($idx < $alias::SIZE);
-        bitstruct!(struct $name: u32 $(, $comment)? { $($fields)* } );
+        bitstruct!(pub(crate) struct $name: u32 $(, $comment)? { $($fields)* } );
         register!(@io_fixed $name @ $alias::OFFSET + $idx * $alias::STRIDE );
     };
 
-- 
2.34.1

