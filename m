Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 466F3C3DBFF
	for <lists+dri-devel@lfdr.de>; Fri, 07 Nov 2025 00:12:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9872910E9F8;
	Thu,  6 Nov 2025 23:12:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="GGYTK+dU";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010069.outbound.protection.outlook.com [52.101.85.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 152A110E9F5;
 Thu,  6 Nov 2025 23:12:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qq8OJPHB/TY7LGFKxn9rb1QFgQwipqOOpRu0wqI3iYOMv24RUnBvf9uz95JXJoYAFdzjPayhX9J7PdIdztNtrvtHw75U2IxsoMc3xF1ZE0FKjE8jDK70YhHytlL5DqkugEZZfsoB0RJb4LNX3pfAYLWrCvHLsQYQIqR+AThMYuEwNy1gd4wZoHmgM8TE344K+g9TjU8mJpVbXOyL/2ek3mhbalbfpD48liP/qUHwOX08PrijToFzMj5HQv6UioTod8WMT/FqBlVXWmwjL6yyJ4cLgcDZWhqOIjDtOX8kXKcQqkKmw/pnsYPA/woW2ejf2ykM86BjjsSvP30pL9wNhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VgdSgtMW/YTnN3nMZ8exvGPkGhtvwAdRuy1NO1NvmDY=;
 b=FGt/U6R1gVNicz9hXQ73iy4scMKPfijqAA8/m36smim9wYnRVY09kDiuGrfynwKFgf4zE0dUFs6PciHO/dyx/DObrwZDQvk+JCdzqxOliN/1GILUxJdZl0PahY4He2PEBZtVoJIgAKz4+AObDLtyanAXFD08MT9Zv5Ze4DaKOQIkKJZCBsAADrg3G0umM3i4V3Zu1afzeAzWcmAhB448khVUlgwZzJv/1OHRDVgXC0atFYH3qCI1QO33BjKQrRxK9QTxH4NEVj8Vkz2WTvNDpuuW/5/xpTxY3rKQ46Dyp8ORdk7kvp6exwKRCISyugvnyCf0sI99wUeX9fkBijTcqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VgdSgtMW/YTnN3nMZ8exvGPkGhtvwAdRuy1NO1NvmDY=;
 b=GGYTK+dUBSItP8GkcAvJZCSU3tT61r09OSdspE4ZhoUY828IbwPDwRCHEzzyWox8usL1sfXW0WlMBojoKmJnyjfS2WM2k72l6ZHBYmYxEZTxwrwm8wnk+qlVDd6HTNs6txS0Q9OYKGHT4cETOvrtA9qNWDTDklvvs1rSxZzhAnoVOe2QsDguKMcPjtMhHLMkU3pO8GwcMDL62iTozSXEQ3HbQKLpbL3bc5TR/Tudr9eQIJvS3tE6T7zHdCMdNRon6mTVMjMBmrvW1pcR2pdl6gdz5Fcu9FGxBikEQhTX3oFnsmrPWYDQIM0nIkAedHwPc1p3Aaz6TgLMkULtfdcrMg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by PH7PR12MB8014.namprd12.prod.outlook.com (2603:10b6:510:27c::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Thu, 6 Nov
 2025 23:12:05 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9298.007; Thu, 6 Nov 2025
 23:12:04 +0000
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
 nouveau@lists.freedesktop.org, Lyude Paul <lyude@redhat.com>
Subject: [PATCH v3 05/14] gpu: nova-core: gsp: Add support for checking if GSP
 reloaded
Date: Thu,  6 Nov 2025 18:11:44 -0500
Message-Id: <20251106231153.2925637-6-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251106231153.2925637-1-joelagnelf@nvidia.com>
References: <3b0d776e50fc81797dec2e5d81c86390af78f848.camel@nvidia.com>
 <20251106231153.2925637-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0179.namprd03.prod.outlook.com
 (2603:10b6:208:32f::33) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|PH7PR12MB8014:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f734213-e0b3-44e9-86f3-08de1d89e664
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?yPgf5OfV+pg8VjAvrax/mf/M8A3RmzoyYVDOpQ3HbGESli8O1kUuaPEnpBl9?=
 =?us-ascii?Q?rvQmQETU1rdpD6yXVdaB1PeRNMCIR50+Rqcw8q2ndx+1gzVIHMH3UJgYOacr?=
 =?us-ascii?Q?TG6zY1Vgx0bA+kUedzKxZaoaEdTvLo7fZ4j1w9v6xwZtw4NF/8f9W4kq7w1F?=
 =?us-ascii?Q?VSMupummryFFI9Ztalt5Kt7LOUNPBVuPQvyy5sRMdf9rc8n8vwkZ6NQcBh6O?=
 =?us-ascii?Q?XrrtwArS+WGezUed9L4bIzcRBW90izsBykhIqYQi+iPsxyG6p47GoKT6FOSA?=
 =?us-ascii?Q?+inKBYYX0v/58i7040QQs+ER9ZNsR5swGzeL5Lh7a/i8ALrFLKA6XYCZIyP3?=
 =?us-ascii?Q?s9EJBTa6fyTc0q7C1lw952oSKxwRXekQLbO6f7PAtDexL9veksFhOBZy0aHS?=
 =?us-ascii?Q?FUQfC4kgHN6YgB8Me9cqP3DCqJy+FiB/xryE7nYca+mskXTc8feOwhnFmYiv?=
 =?us-ascii?Q?dziZmdVQb1aRHl/Tc0FUdR3TcR2fjr6nDFrMI/lbF3fU8sBZVoGIeHMAd++t?=
 =?us-ascii?Q?5JMLKUdNCw9E/1StEHsLwSkE68184x3ImPUc7uohQ5eB71GHY4MmeZU0ZOGH?=
 =?us-ascii?Q?asbcxkoliUVT6VqiPjiy2npV/5NTtsNmmN2DpicB1XVYqMmo73qDSMkd6Vq7?=
 =?us-ascii?Q?Gw2kqaM9VdnjSKHtAQ4Eg74UcJl2y6ze/+Y/bR/6ulmqBzFjaRJm5DeIXCyC?=
 =?us-ascii?Q?mTZyUhozT4Dd47vah5QU5UrlRDH6vhrCwtAwM0wPJYfV/Tk/zHVzqhkB360t?=
 =?us-ascii?Q?ZVYJEf/6X/7es0oCzsbxPCVdvlvBtwNBDRy1aWc36tlNP0ohuh0Qy26EcTSj?=
 =?us-ascii?Q?0KY3qNV56VFZkzYxQRVFr4hU+Komn/VdO0gqmihpZalRX0XcLpcfR7bNvLmO?=
 =?us-ascii?Q?CXfSYrU/m9Ff8zV8kJ45vhp4OxeIqL0hStcGhTPSWSQ6uTSc1WrJCuRgLBZQ?=
 =?us-ascii?Q?QUeitj71qTJb/pvhs1NylpPuwFJbA9+4wjpVRKVXcZ6n35mja+p3TYzenkwh?=
 =?us-ascii?Q?h6ScYrfGp+rkFE+TiztUA1JgVn8gaOUlHjS7SXvI7LVLJelPW6mKhLNAhFGv?=
 =?us-ascii?Q?msVRkzbrQVF9xoJ3rBsshEjvpvVN5T+D9RpZalCXaVzjZxEuVrtid78FdYgb?=
 =?us-ascii?Q?jLjCT2HueO5F6ZVzmkVak6PmtMwC9Jl15+qX0a422aD0NhxB9522i7aXu7Zs?=
 =?us-ascii?Q?9jiT4tJemzMCV/zsdfrnUkjcx950Xdt/HgjNoDLbsqf9V4hWFp4vjsb7DqUl?=
 =?us-ascii?Q?XlDk7XI759jygycG/co2H8HTvuisjAedrL/9gStLNME8DvL3GVrt7R4sBGwX?=
 =?us-ascii?Q?f7XJ/WCzuP2VBC4/hCdxmoPDrsxG+DbCpYa+yhfwBkiq04Tt3Wj4asH/u1kY?=
 =?us-ascii?Q?nUL/2HAiutTr5+Ek7xbGvR0nbiMNO3Orp+wZ7WcdP+NURVXpor/CDT244Ahh?=
 =?us-ascii?Q?MyrjgI1uBMhmv6oBqKUjNaAikqwNsnVf?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?G0yF2TqMcW2lHL+Ggl0ZdqyueusvEDPfC9Si1DdLyycEJ/y9ov66q9MQ7LdA?=
 =?us-ascii?Q?oL7ZNwn1azdyIQoaapJAMyM9xhz8P63oqUI+LYerQW6KFHukKu5+IlTAi8B0?=
 =?us-ascii?Q?3zBsrMaRYzkJEd8iqMlTP7SDHt4xxYARLWu0inzrDeITGrBUKnD6qZiaU7sP?=
 =?us-ascii?Q?VFCyfOex5plNnhMYVwDks8o7zTW4B5fiP4TwNSwKb5idBRcjTYfzQcGSqKD/?=
 =?us-ascii?Q?pSGKVxUg1Jy7zqRXshB5BbmZeRpsvRHBkl8wM3qap2/h+fsVNF3H6s1L1SYo?=
 =?us-ascii?Q?6UKZ+QcI/mfxHgcbq+6scR0YM5QBezjikJAis2cWTp3YKD4m7/Ycjnx2C5Zp?=
 =?us-ascii?Q?4ZgwU/WNPEjHW7tYhZjvckgLByThhPWan373N5QwKqehtbzdnOWoZhOGl5fp?=
 =?us-ascii?Q?LF+gQ4v9FBe27pLzPXK28GVNG668hR6v97Tcos6YKsqqpPe34RLnB0egYk5M?=
 =?us-ascii?Q?LlxN3e7zXvcpR7ML3A4QhTogCZeUObUZ+J+MNQk1VJBDLb2sz80BbCTtg1kj?=
 =?us-ascii?Q?6e7trpdITQSUpoLMWiX3qmPSVwKpeAWCVkEWVgucCXD9v9i8lJUFyROvgbKa?=
 =?us-ascii?Q?txjE8a0VgK8SPo4sYirJtcWYRxRV1t1UPwPLuYuQRWJmBMJu3u+NBfbqn1df?=
 =?us-ascii?Q?AbdKZ7W8y0nD0As/lNaVJYCvdPnx1rQS/zRTQR0si91hW4LgTT0di4+vx2uj?=
 =?us-ascii?Q?lKTpDlQCACRBhp1tDPeDBRDAmbAvUXh0k5Kxk6iG86hP+dmYJyZ6zgvU3XDk?=
 =?us-ascii?Q?ywpNLpP3eLS6W7BPnNxHUjnSJqdkEHS+mRE6zrYWw99YqbmTX4kg0b3ft9Z6?=
 =?us-ascii?Q?1MYQk9f+u74asr03CSiUxc/dbLXWchVbRYQT1I42A8CAPDFm92Tg3q7a+8W2?=
 =?us-ascii?Q?tmi3QZElAFQqrFcRniQMbuGmgnoBIGJC/Skdtcomr9DWC+CobvWa3awUPFDI?=
 =?us-ascii?Q?bn8h4RRs9pZ4bhqRfYgs8QHohWGEDtSddPUXSjfqKhY6n5NM999+8CvDUoP2?=
 =?us-ascii?Q?xcBMdVu6axy0/M2C9azfN08lOcqgyHY5GF6x+yv9MO2heUiI/HEbWRL8OKp+?=
 =?us-ascii?Q?PhZlhXIIYcaZiX7hJI+lEVq3+Y4s8l3aiY23g1uAKZeOGLh/Y+4rVaCPQ1hP?=
 =?us-ascii?Q?JswwZfwYfufo39mZqGNgbHhCkVNWVwMQNdwSILG1e1523ym0w56SRZeiEUAK?=
 =?us-ascii?Q?pJn7mLO0AZIr8NEDpcbmUIjydSJ2fBvoOeZYHK4A6gkzDP0PevZV04/GcGk+?=
 =?us-ascii?Q?7/h6ZOvlWWR4cFB/Ny6jivIC3HPw5jrZQkrINSe9cFYr3q3EjWaopTiZM9T2?=
 =?us-ascii?Q?wxgBtYDtKBc8RLJt2wSCFvD6rNwjEQPsA6lw892bQ8fK6tqbFkKhsUQmo7g5?=
 =?us-ascii?Q?fAEitZhPmHItVKNr9P1rYXKd4ESGZ6eMYgMP6O+CzrMoTy59kpSuZNlQoex8?=
 =?us-ascii?Q?wNnpRa55TppszYEBIWDi7rUJ47QBId3+sa2bKSyG3RgstF2EzARBjeSDA77I?=
 =?us-ascii?Q?QQfAppmLJsX9cJrpCkJF2Wsqpf8h8d6WmaRQmrx2kxAXLv7/WKg+e8J65p1+?=
 =?us-ascii?Q?eqr92WI5v0NFo47XIZZ2nYxLdPET3rCJ8ZGiqTGx?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f734213-e0b3-44e9-86f3-08de1d89e664
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 23:12:04.7687 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OUeF5dL4VqQH6igclskkrNRZZh9ee7g6JvllE3r43XopMHcKVlJY1sJvXOEdfJDaGqhwa5B1BKQWgNT2HzS4kQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8014
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

During the sequencer process, we need to check if GSP was successfully
reloaded. Add functionality to check for the same.

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/falcon/gsp.rs | 18 ++++++++++++++++++
 drivers/gpu/nova-core/regs.rs       |  6 ++++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/gpu/nova-core/falcon/gsp.rs b/drivers/gpu/nova-core/falcon/gsp.rs
index f17599cb49fa..e0c0b18ec5bf 100644
--- a/drivers/gpu/nova-core/falcon/gsp.rs
+++ b/drivers/gpu/nova-core/falcon/gsp.rs
@@ -1,5 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0
 
+use kernel::{
+    io::poll::read_poll_timeout,
+    prelude::*,
+    time::Delta, //
+};
+
 use crate::{
     driver::Bar0,
     falcon::{Falcon, FalconEngine, PFalcon2Base, PFalconBase},
@@ -29,4 +35,16 @@ pub(crate) fn clear_swgen0_intr(&self, bar: &Bar0) {
             .set_swgen0(true)
             .write(bar, &Gsp::ID);
     }
+
+    /// Checks if GSP reload/resume has completed during the boot process.
+    #[expect(dead_code)]
+    pub(crate) fn check_reload_completed(&self, bar: &Bar0, timeout: Delta) -> Result<bool> {
+        read_poll_timeout(
+            || Ok(regs::NV_PGC6_BSI_SECURE_SCRATCH_14::read(bar)),
+            |val| val.boot_stage_3_handoff(),
+            Delta::ZERO,
+            timeout,
+        )
+        .map(|_| true)
+    }
 }
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index c945adf63b9e..cb7f60a6b911 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -124,6 +124,12 @@ pub(crate) fn higher_bound(self) -> u64 {
 // These scratch registers remain powered on even in a low-power state and have a designated group
 // number.
 
+// Boot Sequence Interface (BSI) register used to determine
+// if GSP reload/resume has completed during the boot process.
+register!(NV_PGC6_BSI_SECURE_SCRATCH_14 @ 0x001180f8 {
+    26:26   boot_stage_3_handoff as bool;
+});
+
 // Privilege level mask register. It dictates whether the host CPU has privilege to access the
 // `PGC6_AON_SECURE_SCRATCH_GROUP_05` register (which it needs to read GFW_BOOT).
 register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK @ 0x00118128,
-- 
2.34.1

