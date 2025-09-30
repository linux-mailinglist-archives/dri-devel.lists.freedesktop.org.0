Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F352BAD3CE
	for <lists+dri-devel@lfdr.de>; Tue, 30 Sep 2025 16:46:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CE0210E5EC;
	Tue, 30 Sep 2025 14:46:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bvZYFsBf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011024.outbound.protection.outlook.com [52.101.62.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEDD210E5EC;
 Tue, 30 Sep 2025 14:45:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mktX2cITssjNorxgOYF/qCXn+XGUVtAf4+ddxD/klkFBnRXG0oE8bwV67yMfASn5h7j4LmfFJKvHAYm/13deVCv1t29NKmZGQwLzN4jREtKUtEk7Yl0dZegXhr48+7vEQ2eSUtyB2cbPHORNeZBrx66o0qOWHuhfNU5l7SF95GA4+9yWmfbP9i8qJD4oq3BUcznPaBd9gYNCB3p9cwnvJgPWcFzDJe8i18oE7UpKmFzyaPl1f1G2pch+OvujiMy8K4qz9cmJcOdxe/qt3Gl8K7hrKXl7ztoUbyhmCaw1I3Cx5WcxtwVsvAcfhCgxjWhzY71uV1PpxcpHzJxid5fXCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=31r62iqpLR0Cv4Hzgj3Yz1tiqWkIM3Q+q4LFRO7vrOs=;
 b=NJFqM2l9vhxbYu820LcT/6yxdnnxIicNz/Axrt0wcV4/ORnwUOHsFQ07cbx0uR51Ab/L3eSNETYYd4Nd+Mf3uqp+Gk2zkTMRrYiuLSRoFAnBigGoZnfluSgz+bMaC0HCKKo4KmRhWOQTnVAJyRuBWKeyrAjASiFNicchPLxtdsXZsBl42ift4MwN5qvu4lCY5YVMdmDi5kIADoSXX5jLfYV7hocEOsFkqMInHpGdlFLyRXTzTnHsyzkQi+OCH648jpEtpBoqJp0c3D3WIjaErgKBMkQoHeSBVqz6ro79wEhlkdBTapmT7KO0ElQpv5yVThzsCWbsRwuEyifuDdhWaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=31r62iqpLR0Cv4Hzgj3Yz1tiqWkIM3Q+q4LFRO7vrOs=;
 b=bvZYFsBfTKSOpcjacAbNCCzEx1tTCvDFR1/pbwLTUch2P075mArSL06BulGvdZJRX1UhiLyW2geJf0ea9CU734l5Sk0/oc3BW34Z7EuDSajmrEcYEcTqirvyDK83GjTmnliYqTQzrStLliTAnUyEqugX/ABzpReHsEcqIhIcvry5LefColUXIsnRA1RAzDC/zdm4Al3fiuMhzIkekQxd+wpPxCuTqcp6bisIKY4Z+GlFWRWHIQI/IYvQrK54gNsvL4N0JzTxVbSgXKmHpTT8vOFv1rHHRt3NbPPPUg0Tjzt8oYHC6LwaXBs29pHNNUajlrlwZBY5JKzPia1BuAageQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DM4PR12MB8475.namprd12.prod.outlook.com (2603:10b6:8:190::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 14:45:55 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 14:45:55 +0000
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
Subject: [PATCH v5 5/9] rust: bitfield: Add a new() constructor and raw()
 accessor
Date: Tue, 30 Sep 2025 10:45:33 -0400
Message-Id: <20250930144537.3559207-6-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250930144537.3559207-1-joelagnelf@nvidia.com>
References: <20250930144537.3559207-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0621.namprd03.prod.outlook.com
 (2603:10b6:408:106::26) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DM4PR12MB8475:EE_
X-MS-Office365-Filtering-Correlation-Id: 07280a48-c690-46e2-c44a-08de00300f4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nuPEhRiuoEeB7tB6PATIxJqZGNxV/9AV5BhGo9pVnM5oJBpbJLor84ZZTM/n?=
 =?us-ascii?Q?SRo+DG6380oEk0yL9lit48eWjO389BpRV4Km/SajwPqUD0cboDhdevIVruqF?=
 =?us-ascii?Q?KmZG+xh6I2AWm+WCMWY28WvbGG4pEdcVi6SUCCGeVWk59AfecAPXD8F9TR1V?=
 =?us-ascii?Q?Kor6CFUnpf4Ww/R60ELXv38/MgPJAVtRFadIOLX+FMTm3/dkMS7Gzv6Hm05X?=
 =?us-ascii?Q?n1K3f0ItwbGnka42jdnyGjKmM8Vnlpq/6Gpmbx8RBEbiuR7Rr3sKyNDSMpu3?=
 =?us-ascii?Q?0/V6eBEzYXjvvdzhb0QYow1N3Z+AqvD2lSEExQ0MzT1hBqyQv6E8Sw+F4kst?=
 =?us-ascii?Q?WOUl/xmwN1h58RvOX0HBa5LBO51k408V0R2pjBpjoSpGpbfgw8SNxRiRIrZU?=
 =?us-ascii?Q?BY7CwQw6qJKAU+yH8GYgk+LR2qw69OiMQysRNPYkKFTta/CbAwsELxbGeJLw?=
 =?us-ascii?Q?OH9lnew4CI/mYzyjMlToM1xQ0J4640I2Y9Kdd3cTo1T+EGVNYkCAe0vZvkCb?=
 =?us-ascii?Q?M2X/selMpvul9vcsZ+o4ixr4oxYUHp8HUS8Z8GYxUsralLzmWAvQWJHYSOmC?=
 =?us-ascii?Q?91sIkIKuWFVKSpFAjC8PGX1jl+Rad+h4aGrqeJQqk+20MfWFspXmkkede7TI?=
 =?us-ascii?Q?TDj62mbzCjx04PU+oujPB/HyTYuWRtoccdpE0e9IFmd5Shd1riOTgz4NU2Xy?=
 =?us-ascii?Q?dUlCNW66jUBI8nSfC4uLz/R3yzv6KydTp2MP8FdNU3I/U3fvk/6PptFDk983?=
 =?us-ascii?Q?Oho7zcBaqKaMzdTAkLds/A2geFw8zvJeR9kXJiDn8cLHYTOXu5JLhGUEzKDk?=
 =?us-ascii?Q?FCeL/qwiCa6rSI9DXe3bD70oXlAWtGMYrmPj5ZN27whDxeaAfzeAVjoB2eai?=
 =?us-ascii?Q?tUQIRRB7Co9wTP2UUHecPIc66E0Hv0+khIPwiX/D4J/4jk83uMFSfXr6o4v1?=
 =?us-ascii?Q?eAX0gp+RjYDEdq6m1DUy9Lbd42L033dizhtbQdjZtx1Ww3RFEqrFryc/HuUB?=
 =?us-ascii?Q?BZXVrEpCGQ6gMurcwc5E8vNhNW9gN7FRbtm+84bMOWVJCzdz2zx8bNR/DUwB?=
 =?us-ascii?Q?ifWNa22A60b5IRXDVP1PUXPSIHoFtm+bz1hLBzIIVGrxl6xkfezsL/+ebSXC?=
 =?us-ascii?Q?cD3xkoMPbh7u8hJ7JAqhkxj2Mn1e+suNSp+V3g2BJI0zhZiBwSc0HwiiK9i9?=
 =?us-ascii?Q?YlzGpRTXIp/kd5H2Z/DoOqo73G20KT9uaXjuzjGJ10iXQ0KtTjCHh4XcS11A?=
 =?us-ascii?Q?gGdcUw40YdoJ4XDnz/alYPwAxuWrTWVzEEYeSyXVn6UPbavlQ3Sm6UB9m7LX?=
 =?us-ascii?Q?bmOnOdPv/mvNUpNU12vatlDVbiASZ1mCQucL7nkpbwk8ohebCJRwy0fYMlV6?=
 =?us-ascii?Q?63iNtl24iZWS75WJx9C2vEG+xNe7dJIiAIln+XdkwZtyCjNC3rEMVSGPNh7e?=
 =?us-ascii?Q?Zlte3zh4vJQkUO5K5ykpqQJIBJRb7XMd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zxMECOhBK/65Fw81OG1zc6o37s7RiAgcqp08XN9VKa1aCJjjn8lV/al5sztv?=
 =?us-ascii?Q?ohbCEWTR/naSQjWVftiECi0iMshmqhlpmEdwa9HyV/XgEom1ynLhfmQOeY52?=
 =?us-ascii?Q?+Fij5aNqFrya6IT8EfGp3vD0dVjvqNFqeOesxY+irG5XQslny67jgeMgl6lw?=
 =?us-ascii?Q?JRycJNCdt8IlQ7cm8AmQq5EUUWD2MpyTT3shnVmUTYHWMQrqJfD1hzucZAPK?=
 =?us-ascii?Q?6eTB8K3uXdLg+beel+ROTRiPx3kDOWDpDy8ahSEyFhl15BJQQGieGEeCYjgT?=
 =?us-ascii?Q?+assDojNhnMChDevNC1oWf6wmoAWdXICwkVKKl5X4qqv1ZFPwq2TSfdTYHBL?=
 =?us-ascii?Q?iow4wk8y9AGsZRbpz2B3jjb8nXpu+DjArusF4MoLsa1PivbRaYH+nbsI9euz?=
 =?us-ascii?Q?eYY/CTKLMz2l8Dg0fMMK67qeEfqpnFR0ai+G1OVeFIhsEVQLmN0wS7O0aHtL?=
 =?us-ascii?Q?UREdjHtCylZ5VmTbQctZiNHGW4dChQ8KAJW6JUflekcuYjDUeTETTWIGiFvH?=
 =?us-ascii?Q?61h/Swzt/5XfvqfoARRaXef5xR33jR8fIoMt+FaYDiPJVfExKbNI7U+3JFxS?=
 =?us-ascii?Q?w1XmUQN7T7I4Mh+a81iG09gCz2tlljlyzZXJEWKh9KnL+GfYLcfKfpllif4K?=
 =?us-ascii?Q?1NTRIkUgs1G+hrC8mFWM/VXLpWz+7VU1w38DA4wbrWii+3BPKPF7kslS7JpE?=
 =?us-ascii?Q?DAVpx8G15gly3xHyS/Ad0Guzeg5ZLHzTPTEGU+gvRlB2z/FDnXYKOrw9B/xJ?=
 =?us-ascii?Q?+CGyoDzoz9j4hWsEnFfRroOgI/ncc5BEJHur6q+XZSPI9RuevjtanOxw+Zu8?=
 =?us-ascii?Q?2w7bfHpRjfDoGaGUi1FonVRRFEc3255KnADCOPl5OEH7x2fhgVdkAxL8Uxyr?=
 =?us-ascii?Q?XQ19NzKWlIfEAfB8O/KrN4hnZe3+8UIf6mH/1dEONHlSnOO2eINDSCjKmufN?=
 =?us-ascii?Q?lTEuTd1zwyWH25DHMifaokKGZHvw5yTbB7mrewM/zWhlj0dlbC9sAS0cuwxH?=
 =?us-ascii?Q?bvGVA+jGMOASZUYSzRyN8gY6xNjtAi2ZwEFDO3KRk8qIBnk7v/xSr2ca9w8Y?=
 =?us-ascii?Q?ECKdjRmEA5SM+JZaUQsogt8wY+VG9yu3AIXdum6LIYhoxn8IxP52ZWGtwq9M?=
 =?us-ascii?Q?IFSf0iHBQjEkm7f2E8qAsn0+PxxVzB5+nNIg8sh4YKyE5jbSiWgwZKc/lk76?=
 =?us-ascii?Q?GmDOGDg9ox6saAx4jup9T6lUx2k7wQ3kCcdEzCaSNLUfThIj0Y0nKEdohkrr?=
 =?us-ascii?Q?31BeJuIHVpIr0yTqeHYzJZSRtjGZploTuKnZpkMi/0C9HwUfQABrpGSpCL3M?=
 =?us-ascii?Q?+eBAb8rTcGmngbZ4wR3xd0g4jyNNYHPM+TsXFhIx4GczP4NaEMjeE2tK+Oc0?=
 =?us-ascii?Q?ApTXZjTUH2X7oSkXBdCzgAbj2gI9AnyWHflhuNeEW306M6qx5eI0i8CWI6lH?=
 =?us-ascii?Q?+olCoUeUVmDAQI/i0M2GVZIqWcxS2mu3N08infiKP7PkzicfdvHotz/gp2Zq?=
 =?us-ascii?Q?/xuYSKQB3p4vIPyuFgH3G9Kb5XfrSLXeUKrhkPLoOuMKLLZ8MqHu6b8+lEAx?=
 =?us-ascii?Q?oVyIiH9xeTEho81B86Zg85ssIOge9SKFuojzRDpF?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 07280a48-c690-46e2-c44a-08de00300f4e
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 14:45:55.0931 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jaEiSdp64JUQl6nl6AxiGtDferlJiagkiI1W88fjL3WTCf/ii4a0WZZ8/R8H50EEkZNovZGJk57qnTcrdowslQ==
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

In order to prevent the user from directly accessing/wrapping the inner
value of the struct, provide a new storage type to wrap the inner value.
The bitfield framework can then control access better. For instance, we
can zero out undefined bits to prevent undefined behavior of bits that
are not defined.

Further, we can somewhat prevent the user manipulating the bitfield's
inner storage directly using .0. They can still do so by using the new
bitfield storage type this patch defines, however it would not be by
accident and would have to be deliberate.

Suggested-by: Yury Norov <yury.norov@gmail.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 rust/kernel/bitfield.rs    | 123 +++++++++++++++++++++++++++++--------
 rust/kernel/io/register.rs |  16 ++---
 2 files changed, 106 insertions(+), 33 deletions(-)

diff --git a/rust/kernel/bitfield.rs b/rust/kernel/bitfield.rs
index 09cd5741598c..fed19918c3b9 100644
--- a/rust/kernel/bitfield.rs
+++ b/rust/kernel/bitfield.rs
@@ -4,7 +4,33 @@
 //!
 //! Support for defining bitfields in Rust structures. Also used by the [`register!`] macro.
 
-/// Defines a struct with accessors to access bits within an inner unsigned integer.
+/// Storage wrapper for bitfield values that prevents direct construction.
+///
+/// This type wraps the underlying storage value and ensures that bitfield
+/// structs can only be constructed through their `new()` method, which
+/// properly masks undefined bits.
+#[repr(transparent)]
+#[derive(Clone, Copy)]
+pub struct BitfieldInternalStorage<T: Copy> {
+    value: T,
+}
+
+impl<T: Copy> BitfieldInternalStorage<T> {
+    /// Creates a new storage wrapper with the given value.
+    #[inline(always)]
+    pub const fn from_raw(value: T) -> Self {
+        Self { value }
+    }
+
+    /// Returns the underlying raw value.
+    #[inline(always)]
+    pub const fn into_raw(self) -> T {
+        self.value
+    }
+}
+
+/// Bitfield macro definition.
+/// Define a struct with accessors to access bits within an inner unsigned integer.
 ///
 /// # Syntax
 ///
@@ -62,9 +88,23 @@
 ///         7:7 state as bool => State;
 ///     }
 /// }
+///
+/// // Create a bitfield from a raw value - undefined bits are zeroed
+/// let reg = ControlReg::new(0xDEADBEEF);
+/// // Only bits 0-3 and 7 are preserved (as defined by the fields)
+///
+/// // Get the raw underlying value
+/// let raw_value = reg.raw();
+///
+/// // Use the builder pattern with field setters
+/// let reg2 = ControlReg::default()
+///     .set_mode(Mode::Auto)
+///     .set_state(State::Active);
 /// ```
 ///
 /// This generates a struct with:
+/// - Constructor: `new(value)` - creates a bitfield from a raw value, zeroing undefined bits
+/// - Raw accessor: `raw()` - returns the underlying raw value
 /// - Field accessors: `mode()`, `state()`, etc.
 /// - Field setters: `set_mode()`, `set_state()`, etc. (supports chaining with builder pattern).
 ///   Note that the compiler will error out if the size of the setter's arg exceeds the
@@ -72,7 +112,7 @@
 /// - Debug and Default implementations.
 ///
 /// Note: Field accessors and setters inherit the same visibility as the struct itself.
-/// In the example above, both `mode()` and `set_mode()` methods will be `pub`.
+/// In the example above, `new()`, `raw()`, `mode()` and `set_mode()` methods will be `pub`.
 ///
 /// Fields are defined as follows:
 ///
@@ -99,19 +139,19 @@ macro_rules! bitfield {
         )?
         #[repr(transparent)]
         #[derive(Clone, Copy)]
-        $vis struct $name($storage);
+        $vis struct $name(::kernel::bitfield::BitfieldInternalStorage<$storage>);
 
         impl ::core::ops::BitOr for $name {
             type Output = Self;
 
             fn bitor(self, rhs: Self) -> Self::Output {
-                Self(self.0 | rhs.0)
+                Self::new(self.raw() | rhs.raw())
             }
         }
 
         impl ::core::convert::From<$name> for $storage {
             fn from(val: $name) -> $storage {
-                val.0
+                val.raw()
             }
         }
 
@@ -161,6 +201,53 @@ fn from(val: $name) -> $storage {
 
         #[allow(dead_code)]
         impl $name {
+            // Generate field constants to be used later
+            $(
+            ::kernel::macros::paste!(
+                const [<$field:upper _RANGE>]: ::core::ops::RangeInclusive<u8> = $lo..=$hi;
+                const [<$field:upper _MASK>]: $storage = {
+                    // Generate mask for shifting
+                    match ::core::mem::size_of::<$storage>() {
+                        1 => ::kernel::bits::genmask_u8($lo..=$hi) as $storage,
+                        2 => ::kernel::bits::genmask_u16($lo..=$hi) as $storage,
+                        4 => ::kernel::bits::genmask_u32($lo..=$hi) as $storage,
+                        8 => ::kernel::bits::genmask_u64($lo..=$hi) as $storage,
+                        _ => ::kernel::build_error!("Unsupported storage type size")
+                    }
+                };
+                const [<$field:upper _SHIFT>]: u32 = Self::[<$field:upper _MASK>].trailing_zeros();
+            );
+            )*
+
+            /// Creates a new bitfield instance from a raw value.
+            ///
+            /// This constructor zeros out all bits that are not defined by any field,
+            /// ensuring only valid field bits are preserved. This is to prevent UB
+            /// when raw() is used to retrieve undefined bits.
+            #[inline(always)]
+            $vis fn new(value: $storage) -> Self {
+                // Calculate mask for all defined fields
+                let mut mask: $storage = 0;
+                $(
+                    ::kernel::macros::paste!(
+                        mask |= Self::[<$field:upper _MASK>];
+                    );
+                )*
+                // Zero out undefined bits and wrap in BitfieldInternalStorage
+                Self(::kernel::bitfield::BitfieldInternalStorage::from_raw(value & mask))
+            }
+
+            /// Returns the raw underlying value of the bitfield.
+            ///
+            /// This provides direct access to the storage value, useful for
+            /// debugging or when you need to work with the raw value.
+            /// Bits not defined are masked at construction time.
+            #[inline(always)]
+            $vis fn raw(&self) -> $storage {
+                self.0.into_raw()
+            }
+
+            // Generate field accessors
             $(
             ::kernel::bitfield!(@field_accessor $vis $name $storage, $hi:$lo $field as $type
                 $(?=> $try_into_type)?
@@ -249,21 +336,6 @@ impl $name {
         @leaf_accessor $vis:vis $name:ident $storage:ty, $hi:tt:$lo:tt $field:ident
             { $process:expr } $to_type:ty => $res_type:ty $(, $comment:literal)?;
     ) => {
-        ::kernel::macros::paste!(
-        const [<$field:upper _RANGE>]: ::core::ops::RangeInclusive<u8> = $lo..=$hi;
-        const [<$field:upper _MASK>]: $storage = {
-            // Generate mask for shifting
-            match ::core::mem::size_of::<$storage>() {
-                1 => ::kernel::bits::genmask_u8($lo..=$hi) as $storage,
-                2 => ::kernel::bits::genmask_u16($lo..=$hi) as $storage,
-                4 => ::kernel::bits::genmask_u32($lo..=$hi) as $storage,
-                8 => ::kernel::bits::genmask_u64($lo..=$hi) as $storage,
-                _ => ::kernel::build_error!("Unsupported storage type size")
-            }
-        };
-        const [<$field:upper _SHIFT>]: u32 = Self::[<$field:upper _MASK>].trailing_zeros();
-        );
-
         $(
         #[doc="Returns the value of this field:"]
         #[doc=$comment]
@@ -274,7 +346,7 @@ impl $name {
             const MASK: $storage = $name::[<$field:upper _MASK>];
             const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
             );
-            let field = ((self.0 & MASK) >> SHIFT);
+            let field = ((self.raw() & MASK) >> SHIFT);
 
             $process(field)
         }
@@ -288,8 +360,9 @@ impl $name {
         $vis fn [<set_ $field>](mut self, value: $to_type) -> Self {
             const MASK: $storage = $name::[<$field:upper _MASK>];
             const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
-            let value = (<$storage>::from(value) << SHIFT) & MASK;
-            self.0 = (self.0 & !MASK) | value;
+            let val = (<$storage>::from(value) << SHIFT) & MASK;
+            let new_val = (self.raw() & !MASK) | val;
+            self.0 = ::kernel::bitfield::BitfieldInternalStorage::from_raw(new_val);
 
             self
         }
@@ -301,7 +374,7 @@ impl $name {
         impl ::core::fmt::Debug for $name {
             fn fmt(&self, f: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
                 f.debug_struct(stringify!($name))
-                    .field("<raw>", &format_args!("{:#x}", &self.0))
+                    .field("<raw>", &format_args!("{:#x}", &self.raw()))
                 $(
                     .field(stringify!($field), &self.$field())
                 )*
@@ -316,7 +389,7 @@ fn fmt(&self, f: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
         impl ::core::default::Default for $name {
             fn default() -> Self {
                 #[allow(unused_mut)]
-                let mut value = Self(Default::default());
+                let mut value = Self::new(Default::default());
 
                 ::kernel::macros::paste!(
                 $(
diff --git a/rust/kernel/io/register.rs b/rust/kernel/io/register.rs
index c24d956f122f..45c6ad1bfb9e 100644
--- a/rust/kernel/io/register.rs
+++ b/rust/kernel/io/register.rs
@@ -374,7 +374,7 @@ impl $name {
             pub(crate) fn read<const SIZE: usize, T>(io: &T) -> Self where
                 T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
             {
-                Self(io.read32($offset))
+                Self::new(io.read32($offset))
             }
 
             /// Write the value contained in `self` to the register address in `io`.
@@ -382,7 +382,7 @@ pub(crate) fn read<const SIZE: usize, T>(io: &T) -> Self where
             pub(crate) fn write<const SIZE: usize, T>(self, io: &T) where
                 T: ::core::ops::Deref<Target = ::kernel::io::Io<SIZE>>,
             {
-                io.write32(self.0, $offset)
+                io.write32(self.raw(), $offset)
             }
 
             /// Read the register from its address in `io` and run `f` on its value to obtain a new
@@ -424,7 +424,7 @@ pub(crate) fn read<const SIZE: usize, T, B>(
                     <B as ::kernel::io::register::RegisterBase<$base>>::BASE + OFFSET
                 );
 
-                Self(value)
+                Self::new(value)
             }
 
             /// Write the value contained in `self` to `io`, using the base address provided by
@@ -442,7 +442,7 @@ pub(crate) fn write<const SIZE: usize, T, B>(
                 const OFFSET: usize = $name::OFFSET;
 
                 io.write32(
-                    self.0,
+                    self.raw(),
                     <B as ::kernel::io::register::RegisterBase<$base>>::BASE + OFFSET
                 );
             }
@@ -487,7 +487,7 @@ pub(crate) fn read<const SIZE: usize, T>(
                 let offset = Self::OFFSET + (idx * Self::STRIDE);
                 let value = io.read32(offset);
 
-                Self(value)
+                Self::new(value)
             }
 
             /// Write the value contained in `self` to the array register with index `idx` in `io`.
@@ -503,7 +503,7 @@ pub(crate) fn write<const SIZE: usize, T>(
 
                 let offset = Self::OFFSET + (idx * Self::STRIDE);
 
-                io.write32(self.0, offset);
+                io.write32(self.raw(), offset);
             }
 
             /// Read the array register at index `idx` in `io` and run `f` on its value to obtain a
@@ -610,7 +610,7 @@ pub(crate) fn read<const SIZE: usize, T, B>(
                     Self::OFFSET + (idx * Self::STRIDE);
                 let value = io.read32(offset);
 
-                Self(value)
+                Self::new(value)
             }
 
             /// Write the value contained in `self` to `io`, using the base address provided by
@@ -631,7 +631,7 @@ pub(crate) fn write<const SIZE: usize, T, B>(
                 let offset = <B as ::kernel::io::register::RegisterBase<$base>>::BASE +
                     Self::OFFSET + (idx * Self::STRIDE);
 
-                io.write32(self.0, offset);
+                io.write32(self.raw(), offset);
             }
 
             /// Read the array register at index `idx` from `io`, using the base address provided
-- 
2.34.1

