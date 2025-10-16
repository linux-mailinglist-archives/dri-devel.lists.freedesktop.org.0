Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99526BE425A
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 17:13:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB14510EA11;
	Thu, 16 Oct 2025 15:13:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uOmvWllb";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011007.outbound.protection.outlook.com
 [40.93.194.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6066610EA09;
 Thu, 16 Oct 2025 15:13:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SwT/9esEm9WWXC+JluvpbR3o/FUtRYnM6doj4sltA8vZG03lFdUrAkKdYyzNP39mQy+xFAT7oKe+T18djRk4Xj9yXnHZgHDz7Fbu9yZHmk29C6Bi2aWnwAufVOSS88YPm7NUu5Qmh0jkVh5u9yC8gfTvrn+QyPHMPnt/4SOYe0Rhp8YjmpJGbcG8nZm3bV24vNtltIZ2iaWrU03l/F6ERy8egVxxDZNsPvsgPbbt+Kj7hihPHhbAak/aEtA+qN3gCWcSnxb1KI9BdY3SdnIQrADr8yOHEsMl89945nK2nSRvBk4/xImu1AeR5Pc4DdAcOcqIdGzjgOQ8umK0KIIB5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KAmpI8MkYGJzNWMUEeQJbkXicdfagVrV2YnN6fyAVUo=;
 b=fIgh7QDjRCCdacYBEop0ToUEDm3LuhgRlq1UUdNgxxZz6F9KCdiTjDljJoSjPkpZTvESA8DDFwI0kYIeuqx+1RtowD4Rl+D9jYBxGGhr1pUjY6y+g4TvVaYmAwNy/m7t/dXAlrWIm64EufpNq6sa4VytxpPlx3r8Rgaj1gsj9wpJ1sJ5DyILNeTO/BkP27K9BlkabU3SlgaZDWDTIJxlQ8Os+K4Y71WDUrcF2AyY8VHseKPOfjiefRogUzYEP2dkVa5zL7kyPWyH6b9WUahtiynXJah8k3DCVA1hWI+znobEX0pABEiaBS5csqorISVqOMK3veVNX1s9LN73DlXkBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KAmpI8MkYGJzNWMUEeQJbkXicdfagVrV2YnN6fyAVUo=;
 b=uOmvWllbK1OHMLPKv43HQXpLUC3wTv3mYkcEq4ziBQdHOuIKGuj26w3/qPAz0Ib8bQFn1vid+v6p2OqL8SARmyFcvU71TTLBvDOZcivNMoKGiXb+1zlYYLyjc0l0U8CIyHx4ER7Dtg08WbUouNKoG/i2isaTe28aWf+YR6ALBtElyGquGueFzLaH62houA85kdM1d6xWozAib8qsHRN9TeDY27EtZK2AjBv09COD71sG0tAOy31bd/4Cx8uwNXAFXHxi7tRna8L+mY3whOPkV0c2QCDzRbftMjVPNOZwE20J5dg04KzeCodgIpQBgVoaUiHS/OOoZmE4b5uB0aMQTg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS0PR12MB8574.namprd12.prod.outlook.com (2603:10b6:8:166::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.10; Thu, 16 Oct
 2025 15:13:29 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 15:13:29 +0000
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
 nouveau@lists.freedesktop.org
Subject: [PATCH v7.1 1/4] gpu: nova-core: register: use field type for Into
 implementation
Date: Thu, 16 Oct 2025 11:13:20 -0400
Message-Id: <20251016151323.1201196-2-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251016151323.1201196-1-joelagnelf@nvidia.com>
References: <20251016151323.1201196-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0929.namprd03.prod.outlook.com
 (2603:10b6:408:107::34) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS0PR12MB8574:EE_
X-MS-Office365-Filtering-Correlation-Id: e332dd23-d744-429e-7dc6-08de0cc6901f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ak6gl9GZy002JCsOLhDXUPrgkCKrDg47qYLyN+c6WLjC/9JvImIsN/o8eFiU?=
 =?us-ascii?Q?aEDY4uSs9Y+OtRcvPKq9V98Iqoc37dHpZmiTzerJH3ES/4mKjtZhK3Y8rXC4?=
 =?us-ascii?Q?SZqUb1FgAwHjms6XjbhmH71M0I3Fy28RW2XbmXQ1iGQ5wjm4RfPV1EEIEzZa?=
 =?us-ascii?Q?l7geAOJcw8bTAbu3X7qyEdy+vVJVH/FAwLyHk9MDa75rT9UEz8YIfFwJbc8H?=
 =?us-ascii?Q?1Iky+nK0hLNAV3TbS80EHv5ij0yc5BzUgNUO5tV1kDGrG7+yzfsNIr/TT1Sr?=
 =?us-ascii?Q?YTUmEMPV7YwKvdk2Eo4JbrBBMzmEU+u1+VZTkYJOximqJIiFq+tGUihXd0aS?=
 =?us-ascii?Q?uW7CmmOddlZMYI6EgCRkG6MwPR84APW6dXq15OeJ4GufB4Zv9OJGr5RnoLcG?=
 =?us-ascii?Q?eE3D6I92YCGsq6NC+1RP4OSjArpu31FUkJwVc7ZzRHGRnYPCHkhxY7nqPnws?=
 =?us-ascii?Q?0d65Xe3vhxuSkeV8Fp8I/BsjNomliZX+7jpOa7U0wHg2qCwDSe3JPik1r8ex?=
 =?us-ascii?Q?/wc1Z/1PEaBa4lkTU/du/HjxGU5YS7Q5M+dmQRDjHBY+T1xtu2BxXAOPzwkt?=
 =?us-ascii?Q?/660DjCHQa1y/RQOd7d9qaaiDv3fMQt00JCzZzWVQCwkEhvs+ulzNmqlhLI8?=
 =?us-ascii?Q?Pv/P8km0zcp/mHyIB7r4cAlrYg84wxKWgT7frBg/Sfpv5ocIcDQGCJNjZ4fh?=
 =?us-ascii?Q?vUNjA1kkb+VE9yO9/SjeYtL5/2GFAxjb03Z4byH8PPyrNCY2GTALxhymIvyO?=
 =?us-ascii?Q?MOzlOiS/wZAWQnY2IsjdWhc6HECf443FVW/wCe+MntQfmjksLlvMFelhWcBv?=
 =?us-ascii?Q?oIglBXlzF5u39DReLe3An/wxfgXrVxI0HD+x8x61a9W98mNxe+fzEinYeN5q?=
 =?us-ascii?Q?/yQj1b8LaKiX6YNfzxHgR6qdOabHd7oQZY5NK07NhgD2N8TSDPVcs/E+U4hJ?=
 =?us-ascii?Q?r+bN35IDkvuJ9FTEhbircht6bNOr7RY0dkbt3T/YYbOLCnVXIRXgNWzrNU4/?=
 =?us-ascii?Q?9UhveBav1eDoPA9TECQozEDbjveapGfycVZVsbF+UEWu8nvCw0hWKlAYbhx5?=
 =?us-ascii?Q?K/X930TE927bYe7fCrrKo0FsdyEic53mjz4yZECV72lrJ/WYbirOdyKrGkvV?=
 =?us-ascii?Q?PydfuTMDdt4O5Q19X+hLNfH+dJSt6pnuEZpoQ/xVqzNXOP38Fk2akbHTI5fP?=
 =?us-ascii?Q?6d2dwS+yf4A9029oBMm5OT5OXVZhFDslqCQK8oeN5+08002S/Epxjfc3/CYF?=
 =?us-ascii?Q?aDwuqj+HrRYkrFBODKoD4LaBfKlGyd/javHG5jMlEkClqkEkbWd35OpvDl1d?=
 =?us-ascii?Q?7cgTXuawzifTZJ4Sv+BONmxfdUS5JFfoty323W6T7Vx+aSLsuwYPEuhcOXN1?=
 =?us-ascii?Q?GC4VBQQ+5DEBX6KZErDIO8lz46TESEpSJS0bIZLfKpFVOFGFsBJBmN+j5PKW?=
 =?us-ascii?Q?B4UXogj31tcfSVScl6VolpTSo+Tm/mWF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?h89UA7zo9oJqs9JXZhn/dVQ+Zge6Y+meJRL6oaEHDqQtOyenjMU6cQZ6jMCq?=
 =?us-ascii?Q?s/TyPQKgeevV5IamdClvE8AoV0VxYUHdN5iBuIkMMYH0+905kKPHd1BaPq8g?=
 =?us-ascii?Q?gPQE3xZ58167mBGtiObeq/G3kVkMsBVVqtkpvRbCx22iYEGTSHqjK43Jbk8o?=
 =?us-ascii?Q?Blwx6/ZX+D+v2V3SvHwp9/e/GKriBfPPtMm6v9PrsrwxPMMzqGxhfwMe6XAo?=
 =?us-ascii?Q?WIP6EaMX1FwgMdiLAB9zD0iB5amfIYtz3P6onumLzcBH1AwsS31yoODqN5jL?=
 =?us-ascii?Q?jQNGxWFROAYROqCVNkkSkdnLJhsgMnxTHBja3zOVnFPlQ/JN06lJReaeroos?=
 =?us-ascii?Q?+LgKzvb0fbtwjmEW8UYG402MT5eMr+I5PBaMgQX/s3uPXNjlTdftTHGYmKoY?=
 =?us-ascii?Q?8dHdi7ZhboLw9kzTOj5X+e2XsYzLFHPI3F+PHaTBJY2Z+v71M1MYz70EY1YS?=
 =?us-ascii?Q?BcGB7CTvsa5F+Mo0i3zaGQoKirN60Th+76B9w+07zfiWy2wCKWc1PfIzNHxj?=
 =?us-ascii?Q?NU1zoRLfZCid1Hb5jQb2hye6x+wpj0y3Anu3MiaxKwTulLjBoWmDaHyAdyEf?=
 =?us-ascii?Q?GM0zLdipxey57v0b+KB7UT59/dSx+lyTs8lI4r3Lb/VwBnvemfo7zsOSCsO3?=
 =?us-ascii?Q?f60QnqU/zPzfInVkptpwVwi+JkRkRiOQFHpsxQo/Enew8VsvI+NJeS/13iNr?=
 =?us-ascii?Q?JW7UsCKXw59MpgU51FaZoXlsJQhNR5rJusZT1K3G/3RxUH8b/RA+PvSkeNhG?=
 =?us-ascii?Q?dXZ2IiJhXLU7dA1uK+/+uN9T4+0Y6ypzhEz4vUT50Y+p7jgzWHWoHkpv88lr?=
 =?us-ascii?Q?ruvb0P0m6NTbdc595s2SnWEBiiJCqh9Y+yrdGETefuAnOnTH9CJUpJnUH7Yh?=
 =?us-ascii?Q?HXYCsvSwPffbFCKCugDSK+jc24LqHdj+w9gk3XHepV6nnc4Om44DuHajBghy?=
 =?us-ascii?Q?USDlyRH7wV2LKFa/DMpT7MFsm082BjLEwTL9eEMzO9DtsKdTE6LYWA6MPNcS?=
 =?us-ascii?Q?UhOkgTEv9eMpksnqpqZQjwom9/ahRLjP2PuQ+KhmVW9L8DvJhf3r3RQgK/yj?=
 =?us-ascii?Q?u05kFhMR4QN6ooHlPMx/UMRhCF+VIvLZuj6iwE7vyc4KAXJE9qDheO/rkLTR?=
 =?us-ascii?Q?LOEQT4NTjpVetbptvWF2YtG3jtxTNi6KQ/FMq0066Wk1KsgbYPDn4UfNrd/v?=
 =?us-ascii?Q?OrDZ1dhOgLkfOp+qgvENA8CbWX4DHAGAFMfltyPzKGLHXbWCZhXwZAOxE7K/?=
 =?us-ascii?Q?bFQXqw+dbqst6E0wgRWZ2cj5ladxpv55zLpxEJqx3QCkGXkS6R58mdpw3os5?=
 =?us-ascii?Q?G+DYJnLlsd9g1XH8nzZT+Mji7J3QlhvxkoiJ6PAM4s6oyRtxASPV2jjWWdZ2?=
 =?us-ascii?Q?HP0So5etST7qnmC0UHRFI+fVyrR8BspjOAe3Ebprj2+AnhV557FFdjZDVRZx?=
 =?us-ascii?Q?+n3btwT62ScKJzOogMvQx9tUPxY+8sRiUcDbA8cLR6643g+RNVzzVTHJ0E3f?=
 =?us-ascii?Q?E5VY35mr8T4eK4h9Nyd0yKQ8oHLgVwBKhreXnfzQ4znIwFU35c8gOHWeOnr0?=
 =?us-ascii?Q?DQQpXgguxm+H8U6ljIaunUc2SP/z2CUeNre/TYmx?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e332dd23-d744-429e-7dc6-08de0cc6901f
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 15:13:29.5487 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: z0CVWeF3nJca65dDQxSg7WLlVcSV/oSTtFtNkUtzE02J5a4Z6Wt9rWMesFWuVUtabQIFyObZ11+QfzD0WmmrEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8574
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

From: Alexandre Courbot <acourbot@nvidia.com>

The getter method of a field works with the field type, but its setter
expects the type of the register. This leads to an asymmetry in the
From/Into implementations required for a field with a dedicated type.
For instance, a field declared as

    pub struct ControlReg(u32) {
        3:0 mode as u8 ?=> Mode;
        ...
    }

currently requires the following implementations:

    impl TryFrom<u8> for Mode {
      ...
    }

    impl From<Mode> for u32 {
      ...
    }

Change this so the `From<Mode>` now needs to be implemented for `u8`,
i.e. the primitive type of the field. This is more consistent, and will
become a requirement once we start using the TryFrom/Into derive macros
to implement these automatically.

Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs      | 38 ++++++++++++++++++++--------
 drivers/gpu/nova-core/regs/macros.rs | 10 ++++----
 2 files changed, 32 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 37e6298195e4..3f505b870601 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -22,11 +22,11 @@
 pub(crate) mod sec2;
 
 // TODO[FPRI]: Replace with `ToPrimitive`.
-macro_rules! impl_from_enum_to_u32 {
+macro_rules! impl_from_enum_to_u8 {
     ($enum_type:ty) => {
-        impl From<$enum_type> for u32 {
+        impl From<$enum_type> for u8 {
             fn from(value: $enum_type) -> Self {
-                value as u32
+                value as u8
             }
         }
     };
@@ -46,7 +46,7 @@ pub(crate) enum FalconCoreRev {
     Rev6 = 6,
     Rev7 = 7,
 }
-impl_from_enum_to_u32!(FalconCoreRev);
+impl_from_enum_to_u8!(FalconCoreRev);
 
 // TODO[FPRI]: replace with `FromPrimitive`.
 impl TryFrom<u8> for FalconCoreRev {
@@ -81,7 +81,7 @@ pub(crate) enum FalconCoreRevSubversion {
     Subversion2 = 2,
     Subversion3 = 3,
 }
-impl_from_enum_to_u32!(FalconCoreRevSubversion);
+impl_from_enum_to_u8!(FalconCoreRevSubversion);
 
 // TODO[FPRI]: replace with `FromPrimitive`.
 impl TryFrom<u8> for FalconCoreRevSubversion {
@@ -125,7 +125,7 @@ pub(crate) enum FalconSecurityModel {
     /// Also known as High-Secure, Privilege Level 3 or PL3.
     Heavy = 3,
 }
-impl_from_enum_to_u32!(FalconSecurityModel);
+impl_from_enum_to_u8!(FalconSecurityModel);
 
 // TODO[FPRI]: replace with `FromPrimitive`.
 impl TryFrom<u8> for FalconSecurityModel {
@@ -157,7 +157,7 @@ pub(crate) enum FalconModSelAlgo {
     #[default]
     Rsa3k = 1,
 }
-impl_from_enum_to_u32!(FalconModSelAlgo);
+impl_from_enum_to_u8!(FalconModSelAlgo);
 
 // TODO[FPRI]: replace with `FromPrimitive`.
 impl TryFrom<u8> for FalconModSelAlgo {
@@ -179,7 +179,7 @@ pub(crate) enum DmaTrfCmdSize {
     #[default]
     Size256B = 0x6,
 }
-impl_from_enum_to_u32!(DmaTrfCmdSize);
+impl_from_enum_to_u8!(DmaTrfCmdSize);
 
 // TODO[FPRI]: replace with `FromPrimitive`.
 impl TryFrom<u8> for DmaTrfCmdSize {
@@ -202,7 +202,6 @@ pub(crate) enum PeregrineCoreSelect {
     /// RISC-V core is active.
     Riscv = 1,
 }
-impl_from_enum_to_u32!(PeregrineCoreSelect);
 
 impl From<bool> for PeregrineCoreSelect {
     fn from(value: bool) -> Self {
@@ -213,6 +212,15 @@ fn from(value: bool) -> Self {
     }
 }
 
+impl From<PeregrineCoreSelect> for bool {
+    fn from(value: PeregrineCoreSelect) -> Self {
+        match value {
+            PeregrineCoreSelect::Falcon => false,
+            PeregrineCoreSelect::Riscv => true,
+        }
+    }
+}
+
 /// Different types of memory present in a falcon core.
 #[derive(Debug, Clone, Copy, PartialEq, Eq)]
 pub(crate) enum FalconMem {
@@ -236,7 +244,7 @@ pub(crate) enum FalconFbifTarget {
     /// Non-coherent system memory (System DRAM).
     NoncoherentSysmem = 2,
 }
-impl_from_enum_to_u32!(FalconFbifTarget);
+impl_from_enum_to_u8!(FalconFbifTarget);
 
 // TODO[FPRI]: replace with `FromPrimitive`.
 impl TryFrom<u8> for FalconFbifTarget {
@@ -263,7 +271,6 @@ pub(crate) enum FalconFbifMemType {
     /// Physical memory addresses.
     Physical = 1,
 }
-impl_from_enum_to_u32!(FalconFbifMemType);
 
 /// Conversion from a single-bit register field.
 impl From<bool> for FalconFbifMemType {
@@ -275,6 +282,15 @@ fn from(value: bool) -> Self {
     }
 }
 
+impl From<FalconFbifMemType> for bool {
+    fn from(value: FalconFbifMemType) -> Self {
+        match value {
+            FalconFbifMemType::Virtual => false,
+            FalconFbifMemType::Physical => true,
+        }
+    }
+}
+
 /// Type used to represent the `PFALCON` registers address base for a given falcon engine.
 pub(crate) struct PFalconBase(());
 
diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index 8058e1696df9..1c54a4533822 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -482,7 +482,7 @@ impl $name {
         register!(
             @leaf_accessor $name $hi:$lo $field
             { |f| <$into_type>::from(if f != 0 { true } else { false }) }
-            $into_type => $into_type $(, $comment)?;
+            bool $into_type => $into_type $(, $comment)?;
         );
     };
 
@@ -499,7 +499,7 @@ impl $name {
             $(, $comment:literal)?;
     ) => {
         register!(@leaf_accessor $name $hi:$lo $field
-            { |f| <$try_into_type>::try_from(f as $type) } $try_into_type =>
+            { |f| <$try_into_type>::try_from(f as $type) } $type $try_into_type =>
             ::core::result::Result<
                 $try_into_type,
                 <$try_into_type as ::core::convert::TryFrom<$type>>::Error
@@ -513,7 +513,7 @@ impl $name {
             $(, $comment:literal)?;
     ) => {
         register!(@leaf_accessor $name $hi:$lo $field
-            { |f| <$into_type>::from(f as $type) } $into_type => $into_type $(, $comment)?;);
+            { |f| <$into_type>::from(f as $type) } $type $into_type => $into_type $(, $comment)?;);
     };
 
     // Shortcut for non-boolean fields defined without the `=>` or `?=>` syntax.
@@ -527,7 +527,7 @@ impl $name {
     // Generates the accessor methods for a single field.
     (
         @leaf_accessor $name:ident $hi:tt:$lo:tt $field:ident
-            { $process:expr } $to_type:ty => $res_type:ty $(, $comment:literal)?;
+            { $process:expr } $prim_type:tt $to_type:ty => $res_type:ty $(, $comment:literal)?;
     ) => {
         ::kernel::macros::paste!(
         const [<$field:upper _RANGE>]: ::core::ops::RangeInclusive<u8> = $lo..=$hi;
@@ -559,7 +559,7 @@ pub(crate) fn $field(self) -> $res_type {
         pub(crate) fn [<set_ $field>](mut self, value: $to_type) -> Self {
             const MASK: u32 = $name::[<$field:upper _MASK>];
             const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
-            let value = (u32::from(value) << SHIFT) & MASK;
+            let value = (u32::from($prim_type::from(value)) << SHIFT) & MASK;
             self.0 = (self.0 & !MASK) | value;
 
             self
-- 
2.34.1

