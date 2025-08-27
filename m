Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CA42B37D8C
	for <lists+dri-devel@lfdr.de>; Wed, 27 Aug 2025 10:20:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBA6110E770;
	Wed, 27 Aug 2025 08:20:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="csN+HGPQ";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2040.outbound.protection.outlook.com [40.107.223.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F6AF10E770;
 Wed, 27 Aug 2025 08:20:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r6DqEy08o9nf9UwvpYd8X1ISJ2CY+apfMkhjUO8KO7riHM/6KSzddwbbV+w4dzQB/srklY+3rFRWmX79C23dw5OFbvDwVd2luNWGk/pSBwMtjlvW2Xrjz2rgNc30D4EdE0GoZU1RqKMIsvZYP9W2O3/FLz407CCR6eVkj62wPLKXAVSpOLm01hkBR7PQoxh7IvLDT4t2hXYTQWYu159X0dc44JEL2E7nIWug5kjNgO0538WRyZ2/aPXR11Z06z5Ev3QoZTZgnq0cSh6MNehgedJ+uqC02SbUJ3tVxoRI97jHpE2oxl5+a9Qm7TNFjIg0NzCpEFRU1Xt4Ps3uTOImYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HZIgqrOCoEfBkByv3xrPWjUwyYZ8RiXZbUoFjRSAYR0=;
 b=TjYbvl2bK4VNuOSxmIYMBfhYt+m3L9+Uhou4fYPmMMjVNMo6/Z/PaRH4Dq1bI+eSraHKTJ3EbCV/TqlQ9ifWakWrqWrPBZaQWta9HkMozShdpGLAqeuu9nkd+hDrcOpdrCAJYWjgojHeIUAU3uFB46ImLe1+6OKp6adlE3gXhKj7RGQfU5rtt2eZAqTgsQzqZWs/7aE68Hcg7i2M9nwXKPQyptpc75I9EtbgD6YfRlp0ia2JhZ84DZnRQrR3wEbwtwQ+6zewkiG1FE3cBaVtJNR1lTpqQsFSCFwi0WrT/LEl403Ny7seKPggzLELPpRQubLULx/tt8J40RDlGxTWLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HZIgqrOCoEfBkByv3xrPWjUwyYZ8RiXZbUoFjRSAYR0=;
 b=csN+HGPQQm3KRV0IUkDwdhtF27+2k37ND66ns5cu2KHr3gcvJjd39/oOzhZFE5kQ0GjBIwWf+FfIIplhvJ3aUb9GMSf+JpfYF+/KcFTFlJF3Driwa7U9Tkqzs0cONIzILj6eKa+XLn/LzgVSaHItV9ZXceL2MGeZr7m0SteDTP/gOW8cqwjfIIIhBwVCZJHKntEAdbHKFjchRRctZeaznnP4+TIWplfbU5vXN65PjqaOvbV/0CK1H1IhYF+SYk7PhRDsU3zeaNt/jmOj7ubtT3qAdPsakQgHBVyEuZffSYobmd54LrngYNjZCIdAQPSfTRsVVPA7yDpUAm50EoqDIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from IA1PR12MB7709.namprd12.prod.outlook.com (2603:10b6:208:423::15)
 by DS2PR12MB9592.namprd12.prod.outlook.com (2603:10b6:8:27c::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.21; Wed, 27 Aug
 2025 08:20:45 +0000
Received: from IA1PR12MB7709.namprd12.prod.outlook.com
 ([fe80::5312:ce8b:bdf5:aa31]) by IA1PR12MB7709.namprd12.prod.outlook.com
 ([fe80::5312:ce8b:bdf5:aa31%5]) with mapi id 15.20.8989.018; Wed, 27 Aug 2025
 08:20:45 +0000
From: Alistair Popple <apopple@nvidia.com>
To: dri-devel@lists.freedesktop.org,
	dakr@kernel.org,
	acourbot@nvidia.com
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org,
 nouveau@lists.freedesktop.org
Subject: [PATCH 04/10] gpu: nova-core: Add a slice-buffer (sbuffer)
 datastructure
Date: Wed, 27 Aug 2025 18:20:01 +1000
Message-ID: <20250827082015.959430-5-apopple@nvidia.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250827082015.959430-1-apopple@nvidia.com>
References: <20250827082015.959430-1-apopple@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SY8P282CA0022.AUSP282.PROD.OUTLOOK.COM
 (2603:10c6:10:29b::21) To IA1PR12MB7709.namprd12.prod.outlook.com
 (2603:10b6:208:423::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB7709:EE_|DS2PR12MB9592:EE_
X-MS-Office365-Filtering-Correlation-Id: e656caf6-e88e-495c-b84c-08dde5429f02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OmnikL0C4wmf3XhII+HU/QiBKOkgBaFt3+6p5MlvnQpbArO3S22h1R97XmGU?=
 =?us-ascii?Q?GLxW7VM3Rwc6F6P5dvuqTiyYV4eVkMnIUC7GMWgWrKKzhvTg7KSm9nODQI5k?=
 =?us-ascii?Q?BVxCXGmn6oXggK2KyzV9uBYxAEa6BkU9moNEcM9aqV+/fhEtG/EyDq4Jci5i?=
 =?us-ascii?Q?qa7+AGKYe8Xq18/buEyiw+v27URDJzySQty09uGIK85OgN6eftLfZ5WWSAXF?=
 =?us-ascii?Q?uoYUDrZb2VYaZYZTp7TbLym0gkyZMWubke5EIdaTJs3E/yr0CVllGahDWklH?=
 =?us-ascii?Q?rOgsJ582dGPNjN6ByD0LlA2HbjrJkjmZtQ+BV9dTazHq8z/K1Q0QYLBaxXHy?=
 =?us-ascii?Q?/20M8RNWcUJqxCpCMnr/J/8sVwdzdVIv8QTMsyo4nvx0xDMoio7EQ1eCphAr?=
 =?us-ascii?Q?4AUmBchTHYGuje10D6cqIIp3Hga9TJnYrmP4j+ZQtDqIbNFpwkMBsguvv3hE?=
 =?us-ascii?Q?5j39YEchZw8/TpMVaISP9lKu8q+EMjjEzWLUZ8qd3IOaiPkdkj5K/uu5mnW2?=
 =?us-ascii?Q?UU3OKsZyvU2aBlCW5NiPER2ADcKo9e3vlFexJXq2SXRZpb6ugJ+96agB03DN?=
 =?us-ascii?Q?ljS10u4T5no8VT9DBuwyDgkICXo5ZVWvcUw6HWbRHJZtT+A5jaqOB/HSsU6U?=
 =?us-ascii?Q?j3DkXT4b9XuL/E1toEmqEt5tE6guT2ay2LuxktRA/kq0DtJEoNSjglU/J30g?=
 =?us-ascii?Q?9LjqBAMRuEpPPwe2WUW9q4BTC8XpTXOqlQz5RMR2prZfZZxTl1KE1/HeHo8c?=
 =?us-ascii?Q?BKn++hAZUKgy/Ph5CR/mm3KrYy4LnTyXHNBBTaCaJqAIf+TjoZoPN5S3WWti?=
 =?us-ascii?Q?HDh57nOX0Nd1wMEu5YQIYNXVvZZFN3Hoe6SzbVs0432AT5G9Mk2K1zRsmz32?=
 =?us-ascii?Q?C7qQJs265r0JIHevWRA+p0F0nSxgBiLhgLuwvFavmc4+rNY5rJzQjatei3wh?=
 =?us-ascii?Q?USgzIWSdMuzVVBDZLQLGhZ1cjIp3MNR6wZpekN8h+/kmh0l8CxMBj/3lkefV?=
 =?us-ascii?Q?ZwIFEQymfWhSBe233lEp6oTioF/oYtcuLRp39YdLJH2duhhtwE+r5aP6m0MY?=
 =?us-ascii?Q?rtpvFH3x0Kn0dW7C4+cVLEFGepszp3h3B+1cCVRTq2E14TdcaFXzY/4FdAzh?=
 =?us-ascii?Q?I+b9ZbFJqF8Fh7PqgIvbMjlfHfff3r8/YUJlc0XJhdK+zKs994nhhQgoMIuU?=
 =?us-ascii?Q?WJJPdL4Rc/FImKFbHCQ6C0YoRZth1RzCdYZNyemJFJV2Up/tL1QAn4GF+FVZ?=
 =?us-ascii?Q?BklRadKvJ1ldkiRGFOCTSZp7WknK2R6tCO2QnprofF6zKB5RkoOvGBjeG1tj?=
 =?us-ascii?Q?mqrv8CSsDXnBFao19PZZp/ch8igS4IlMxzjSxAmENKqwKZaIopvSlySbeYAx?=
 =?us-ascii?Q?UhIW0pfNQdGIBt0DT1p3+SeWvYu2v6iQJXDq3/eRiR8DAev1f/FwA9NEOwou?=
 =?us-ascii?Q?M/T7uyoDsbM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB7709.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cqRDQbkJh9q8xVgWstIaV0br0eZxTZ1YSoqRwWve+Yl0kMT0Pua5NECyDJKA?=
 =?us-ascii?Q?5Ebc3YZC0YvfP1gf1hqtnrDNUgY2AlRDYoVLEpxu/CDLidCZ4EdObqo/8hJp?=
 =?us-ascii?Q?LJquNvae85clqMlZ0cVj5C4UcsnPbgbx4AbWepss4wgfmd8nUHiIpUmsA1tL?=
 =?us-ascii?Q?znaFt3hCi5Drluy8WXJeGCTBoazsQXnEhIlX8VaNmA4QZnkJ8gTcMW1klkRz?=
 =?us-ascii?Q?GsmDHkTSpcbg5IdAPsXNkJpzKbv2PHtc2f3b2qJOxbiZ/HzHeYCcTDLFmpGn?=
 =?us-ascii?Q?u+qqiKW759vJd5CWS+rCqfNnEU/kE5vGs2NgABzWiuA84J1aSyzagdCninnK?=
 =?us-ascii?Q?6fqPWnbOcnBq4jCWM2hZse8C0LB2s8DzFdRD1dX1kzdN2Et+083rF3hgCdrX?=
 =?us-ascii?Q?3U6bCVNj9NHpzSo9u/oTUHKlzDgaTYwp09MJivg42eZHn7mbrW4SqPv4hxOw?=
 =?us-ascii?Q?F6I9YT07kn0pnZeI8BiFD+cgvuDV66kwU0/BYSAIYZJ0SPe8ujquHjSULAdb?=
 =?us-ascii?Q?ZEqB2Ec8MoDQ91lX4y9oMHdKkcSaWaiOJJzi+iyheOOB2ofLmVR271IcPIF1?=
 =?us-ascii?Q?igeLTFvPS1u4rJW4bv05CXK5i+U1BkiwOKJzeVr8dmzWPtxgCQQ6/v9vzRRO?=
 =?us-ascii?Q?B20fSHgJnQSFMb8SbVtaXE520cteUsVKImX5xWiQhgFB4MnJNVabyrTFk5gH?=
 =?us-ascii?Q?8mTVwwD/XIR/QOM3M2GC56VJ/TuXm+DJQUSx5eSbexhmq2Mj1pEIcnvbkN7C?=
 =?us-ascii?Q?pz4Al1kRMEJ/CT/yFN+QO9kpjYL/perW4yyEfmLEjwWHO+Ac0W72qJnrTHwB?=
 =?us-ascii?Q?9l86AlE+ZZgxzfNrHqGo3MPhNOks6htCwVQAmgE8arfm4kzrrhJ6mDJjoNYv?=
 =?us-ascii?Q?Xew8Ek+6kqU3z2VRKLyINpiFn+mm4XZbuscCGpgEntehiI4K+/QEWyWmY5go?=
 =?us-ascii?Q?vWHQk6FlPhxHmiTOSPxThI9bdAXzGGgfuIMjq1Pa7PZ9/ho7NVwB3DBlwnsN?=
 =?us-ascii?Q?XJ5D0vgTZ7b5NtOIz5kZQc5JkUkQK/MZwC06/NayHLqI+qPzYjqgWiF0cLnU?=
 =?us-ascii?Q?oEdBDeNIAlubiYJ8peHy70I9YBTwRyZFP1/p1Vpk9penZu8Q9NtJt5tN1Du+?=
 =?us-ascii?Q?Sh0MiejUDdebFkVMSHOFlEq4Gl1Z5gjYQAOIY1xqifYGQ7HHXxrT6vAnyrWv?=
 =?us-ascii?Q?ovkqlWrCrHMxIrevVBIRXVV+TjSa4PTVdrrOMDLpw7eyt0SOQtiXeWBE2z28?=
 =?us-ascii?Q?h1pxMAPw67yddcdpljamnoFG2ThTFNre259XyURPD9tiBcbLjDB8GhPMO3ir?=
 =?us-ascii?Q?WjcLeKewmMA/UtK6fhT3re244s2OMGr2GgFs9CJqwMdGErzdRYqyMJRoHg91?=
 =?us-ascii?Q?Pc5A/D4y6kmabJj1DN+xF5rCIR5mumLRTw2xeyvaCqXed7da/ZKezmyyWf/n?=
 =?us-ascii?Q?LotbxtcuI3Qxf0lHtNWIzJFbsyDKh5Toznw+Vn0oMT9VQ57odG0chFnQ1IPj?=
 =?us-ascii?Q?1EuM67fvC8UEDE4rUFr7HbBtO+MQg0nMfbSCwe4j4Z3b94cxrCCBeNV8w1Qq?=
 =?us-ascii?Q?rBguWgsq3LTBR1NLxAN9Iv/wHOClaysNUXMYsQNs?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e656caf6-e88e-495c-b84c-08dde5429f02
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB7709.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Aug 2025 08:20:45.7870 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: C+bu8cPpvLXw6hbqDG3C8XdZhnC/+Wdp+/mssyDqPpLC5KY3xCxoFTpWyfCGe3jyW411ThNRFTJhdAkS0So4FQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9592
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

From: Joel Fernandes <joelagnelf@nvidia.com>

A data structure that can be used to write across multiple slices which
may be out of order in memory. This lets SBuffer user correctly and
safely write out of memory order, without error-prone tracking of
pointers/offsets.

 let mut buf1 = [0u8; 3];
 let mut buf2 = [0u8; 5];
 let mut sbuffer = SBuffer::new([&mut buf1[..], &mut buf2[..]]);

 let data = b"hellowo";
 let result = sbuffer.write(data);

An internal conversion of gsp.rs to use this resulted in a nice -ve delta:
gsp.rs: 37 insertions(+), 99 deletions(-)

Co-developed-by: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/nova_core.rs |   1 +
 drivers/gpu/nova-core/sbuffer.rs   | 188 +++++++++++++++++++++++++++++
 2 files changed, 189 insertions(+)
 create mode 100644 drivers/gpu/nova-core/sbuffer.rs

diff --git a/drivers/gpu/nova-core/nova_core.rs b/drivers/gpu/nova-core/nova_core.rs
index db197498b0b7b..4dbc7e5daae33 100644
--- a/drivers/gpu/nova-core/nova_core.rs
+++ b/drivers/gpu/nova-core/nova_core.rs
@@ -12,6 +12,7 @@
 mod gsp;
 mod nvfw;
 mod regs;
+mod sbuffer;
 mod util;
 mod vbios;
 
diff --git a/drivers/gpu/nova-core/sbuffer.rs b/drivers/gpu/nova-core/sbuffer.rs
new file mode 100644
index 0000000000000..b1b8c4536d2f6
--- /dev/null
+++ b/drivers/gpu/nova-core/sbuffer.rs
@@ -0,0 +1,188 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use core::ops::Deref;
+
+use kernel::alloc::KVec;
+use kernel::error::code::*;
+use kernel::prelude::*;
+
+/// A buffer abstraction for discontiguous byte slices.
+///
+/// This allows you to treat multiple non-contiguous `&mut [u8]` slices
+/// as a single stream-like read/write buffer.
+///
+/// Example:
+///
+/// let mut buf1 = [0u8; 3];
+/// let mut buf2 = [0u8; 5];
+/// let mut sbuffer = SWriteBuffer::new([&buf1, &buf2]);
+///
+/// let data = b"hellowo";
+/// let result = sbuffer.write_all(0, data);
+///
+/// A sliding window of slices to proceed.
+///
+/// Both read and write buffers are implemented in terms of operating on slices of a requested
+/// size. This base class implements logic that can be shared between the two to support that.
+///
+/// `S` is a slice type, `I` is an iterator yielding `S`.
+pub(crate) struct SBuffer<I: Iterator> {
+    /// `Some` if we are not at the end of the data yet.
+    cur_slice: Option<I::Item>,
+    /// All the slices remaining after `cur_slice`.
+    slices: I,
+}
+
+impl<'a, I> SBuffer<I>
+where
+    I: Iterator,
+{
+    pub(crate) fn new_reader(slices: impl IntoIterator<IntoIter = I>) -> Self
+    where
+        I: Iterator<Item = &'a [u8]>,
+    {
+        Self::new(slices)
+    }
+
+    pub(crate) fn new_writer(slices: impl IntoIterator<IntoIter = I>) -> Self
+    where
+        I: Iterator<Item = &'a mut [u8]>,
+    {
+        Self::new(slices)
+    }
+
+    fn new(slices: impl IntoIterator<IntoIter = I>) -> Self
+    where
+        I::Item: Deref<Target = [u8]>,
+    {
+        let mut slices = slices.into_iter();
+
+        Self {
+            // Skip empty slices to avoid trouble down the road.
+            cur_slice: slices.find(|s| !s.deref().is_empty()),
+            slices,
+        }
+    }
+
+    fn get_slice_internal(
+        &mut self,
+        len: usize,
+        mut f: impl FnMut(I::Item, usize) -> (I::Item, I::Item),
+    ) -> Option<I::Item>
+    where
+        I::Item: Deref<Target = [u8]>,
+    {
+        match self.cur_slice.take() {
+            None => None,
+            Some(cur_slice) => {
+                if len >= cur_slice.len() {
+                    // Caller requested more data than is in the current slice, return it entirely
+                    // and prepare the following slice for being used. Skip empty slices to avoid
+                    // trouble.
+                    self.cur_slice = self.slices.find(|s| !s.deref().is_empty());
+
+                    Some(cur_slice)
+                } else {
+                    // The current slice can satisfy the request, split it and return a slice of
+                    // the requested size.
+                    let (ret, next) = f(cur_slice, len);
+                    self.cur_slice = Some(next);
+
+                    Some(ret)
+                }
+            }
+        }
+    }
+}
+
+/// Provides a way to get non-mutable slices of data to read from.
+impl<'a, I> SBuffer<I>
+where
+    I: Iterator<Item = &'a [u8]>,
+{
+    /// Returns a slice of at most `len` bytes, or `None` if we are at the end of the data.
+    ///
+    /// If a slice shorter than `len` bytes has been returned, the caller can call this method
+    /// again until it returns `None` to try and obtain the remainder of the data.
+    fn get_slice(&mut self, len: usize) -> Option<&'a [u8]> {
+        self.get_slice_internal(len, |s, pos| s.split_at(pos))
+    }
+
+    /// Ideally we would implement `Read`, but it is not available in `core`.
+    /// So mimic `std::io::Read::read_exact`.
+    #[expect(unused)]
+    pub(crate) fn read_exact(&mut self, mut dst: &mut [u8]) -> Result {
+        while !dst.is_empty() {
+            match self.get_slice(dst.len()) {
+                None => return Err(ETOOSMALL),
+                Some(src) => {
+                    let dst_slice;
+                    (dst_slice, dst) = dst.split_at_mut(src.len());
+                    dst_slice.copy_from_slice(src);
+                }
+            }
+        }
+
+        Ok(())
+    }
+
+    /// Read all the remaining data into a `KVec`.
+    ///
+    /// `self` will be empty after this operation.
+    #[expect(unused)]
+    pub(crate) fn read_into_kvec(&mut self, flags: kernel::alloc::Flags) -> Result<KVec<u8>> {
+        let mut buf = KVec::<u8>::new();
+
+        if let Some(slice) = core::mem::take(&mut self.cur_slice) {
+            buf.extend_from_slice(slice, flags)?;
+        }
+        for slice in &mut self.slices {
+            buf.extend_from_slice(slice, flags)?;
+        }
+
+        Ok(buf)
+    }
+}
+
+/// Provides a way to get mutable slices of data to write into.
+impl<'a, I> SBuffer<I>
+where
+    I: Iterator<Item = &'a mut [u8]>,
+{
+    /// Returns a mutable slice of at most `len` bytes, or `None` if we are at the end of the data.
+    ///
+    /// If a slice shorter than `len` bytes has been returned, the caller can call this method
+    /// again until it returns `None` to try and obtain the remainder of the data.
+    fn get_slice_mut(&mut self, len: usize) -> Option<&'a mut [u8]> {
+        self.get_slice_internal(len, |s, pos| s.split_at_mut(pos))
+    }
+
+    /// Ideally we would implement `Write`, but it is not available in `core`.
+    /// So mimic `std::io::Write::write_all`.
+    pub(crate) fn write_all(&mut self, mut src: &[u8]) -> Result {
+        while !src.is_empty() {
+            match self.get_slice_mut(src.len()) {
+                None => return Err(ETOOSMALL),
+                Some(dst) => {
+                    let src_slice;
+                    (src_slice, src) = src.split_at(dst.len());
+                    dst.copy_from_slice(src_slice);
+                }
+            }
+        }
+
+        Ok(())
+    }
+}
+
+impl<'a, I> Iterator for SBuffer<I>
+where
+    I: Iterator<Item = &'a [u8]>,
+{
+    type Item = u8;
+
+    fn next(&mut self) -> Option<Self::Item> {
+        // Returned slices are guaranteed to not be empty so we can safely index the first entry.
+        self.get_slice(1).map(|s| s[0])
+    }
+}
-- 
2.47.2

