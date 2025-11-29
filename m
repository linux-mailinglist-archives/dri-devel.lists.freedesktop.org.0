Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C857C94868
	for <lists+dri-devel@lfdr.de>; Sat, 29 Nov 2025 22:31:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADD4310E042;
	Sat, 29 Nov 2025 21:31:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fi2EuWo5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010024.outbound.protection.outlook.com [52.101.46.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0337110E042;
 Sat, 29 Nov 2025 21:31:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hhzaZe/6iiBbLUEclWBgeDzllge2HNeJAP9PYR35rnVi1lwZgF/lL4liUzTwpd7AcIOPDRiNW3la++A1w80SlAc95Uvacp5O9boF0P5ib69HXwp5TgVleXdg8TiagIo8X7jamvn2wT9RsAT+6lF0EeJvKE26jEZaU40C4aL92iYo73t2rsz3+YV4+bPFvNHHDaDo+QuC46OWbL/OtE4ckBQY+9SPhkFybHeqNbw6ZgRmcnVnMfbsb7Q/4KaQgv024EEhAJ4dgsH4B3YNwGYIvjHf0QPxRUSt9TMTl1bEi7B6FB4QjFRPpEF2YpZe55DTmspl1uQpAdNlGnC3Iv9jOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AKaD9EIdQc+DjLqUgDdFB+P2zH2oyp5JULWVaeyQyzk=;
 b=wICfbc4jiLxHSM+6LpTbfTJWD0ifL3alDla04Icgl4P5oKLTxfyk1VeqCg52MdqlxIXcGdiCOF8UlLuHqZaHDm45WPYW10CT1JUot+d8aHFhUnF4L7lGyhKr+bpM5uOgkFuxMu/PvbOKJJk14X+pR/5x4hErOKJ9QiGPS/gG8Hnfp4yDZDg/1qZnjk5fRWa2qUroFAKdOW0OJt35EvAumyS7JTqPu+aIoqcUXGBjGJhFxAiHbkW0RB6g1fo3/DgFbRYYE6yv8vwL/ooppO7gk0p0JgoKuu2jH2Tdvv2HG662J0HSZviE9XKYxQgcVMGB8/AzMcL7tWVFO9ws3D592A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AKaD9EIdQc+DjLqUgDdFB+P2zH2oyp5JULWVaeyQyzk=;
 b=fi2EuWo5IdsM2DPt0CTlNYuNCWbYGw2IWpIpbcJXHtsj/NhGcbptzv2v1JtV8UjwJF8JdnIh1eLQMd8xmi8v+rT4YbVVisAVsKQKVYfLUj4MVrXz5p49piMDIWSoAKl3maImPGSHBv/9qvKExyRBQ4OCZemIxf0e4qNQuyS4ai9Z4cqt6xtyngKK3XuRuTPVf3urbZglhBFOV+/Eu+lTtoyUIP3vewlxn17Mb0s4VAcpHsKkZgrl9/6cHngacBwg8l5lYBJvYAlnlsZ43lUwtpWjpkHfCOwM9HJOtL+bf9DLdUtWOtd2lXVGp0sdYY0qaJBM7OscriHbu3/3NDcTaA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH7PR12MB8056.namprd12.prod.outlook.com (2603:10b6:510:269::21)
 by PH7PR12MB9068.namprd12.prod.outlook.com (2603:10b6:510:1f4::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Sat, 29 Nov
 2025 21:31:13 +0000
Received: from PH7PR12MB8056.namprd12.prod.outlook.com
 ([fe80::5682:7bec:7be0:cbd6]) by PH7PR12MB8056.namprd12.prod.outlook.com
 ([fe80::5682:7bec:7be0:cbd6%4]) with mapi id 15.20.9366.012; Sat, 29 Nov 2025
 21:31:13 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, Joel Fernandes <joel@joelfernandes.org>,
 Lyude Paul <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, Philipp Stanner <phasta@kernel.org>
Subject: [PATCH v3] rust: clist: Add support to interface with C linked lists
Date: Sat, 29 Nov 2025 16:30:56 -0500
Message-Id: <20251129213056.4021375-1-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0278.namprd13.prod.outlook.com
 (2603:10b6:208:2bc::13) To PH7PR12MB8056.namprd12.prod.outlook.com
 (2603:10b6:510:269::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB8056:EE_|PH7PR12MB9068:EE_
X-MS-Office365-Filtering-Correlation-Id: 23cb7c05-89da-483f-e6d5-08de2f8e9eff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cRz8pAkvIDX+tFKCgDxale83GqHw9AUSYyDLBdcWmeLKc4JMFgEtm0CSYVxB?=
 =?us-ascii?Q?INo7pW37sIPHtXPDYijOuXoiCFWfnPI5eyUQkHXJEO8YotldgALNrhjsW9az?=
 =?us-ascii?Q?DmebqF44CKourmziSFdpcbWSfAIv8PvpqK0A0YROiCJyCrcAu5onqYfW/6an?=
 =?us-ascii?Q?YX9RusY2Wrh6uyutF/5SHNLUWHJF4bYq5dXcs3grDRX+V6kLAXS5kM691g1j?=
 =?us-ascii?Q?52Jwf4p+bMLzCjj1omn81tVrkMK/uJ8jmY5vtqu4EFSgSc0RzjkAOsWuqOhz?=
 =?us-ascii?Q?IUOAz3b7UUlqz8nPkoXdbdgC9qFrn0dmpuYQUvjgILOCB0WDKsMWB+9iv0N0?=
 =?us-ascii?Q?ECBSODk4mrUvjtiQIWOMqG+vz1uxbp8+Axx7+/zwzbnCWxpfCJBqNw5wuY5u?=
 =?us-ascii?Q?DTlafGibfNSy1dVZSjNtE47e2WK7oSivkSXInBiLSiGGQuQ39hyuFX5TvTo0?=
 =?us-ascii?Q?MSVN220uaAwyWc1+Cf9VLe9UDna5GCO5Cbf0S/0NYy/FJJxTSB2ux66n2Hik?=
 =?us-ascii?Q?FNGBBdhsusUAQbLas15Wp9wr3G3+bYnoLHNtKgZKAN9Y/V/kId77c9w/MzyS?=
 =?us-ascii?Q?ikBqlcfiqz4WnCKYjnM68nVIwIrWC9Vh9aGijAdqNS5p6TEbGzZFoFoEA79g?=
 =?us-ascii?Q?8UnypC/Uwx5/2L01/cC44UwOzNZ+cpLbBJ0p400Vu/HFI76XPlurheR+l2rM?=
 =?us-ascii?Q?byZGpnllQo22IpSDHinzVW5SOGDrlT9p7fUtfGBu6xFlwIX4noDmnlWtrgMD?=
 =?us-ascii?Q?tbCU/mKqNSSlq4IUMtZ4kw3d8Mtz9trkeW1Qj8k7UXYRDsEs940L+F7woKjy?=
 =?us-ascii?Q?8dWoJRnPOXL5x/goT4bhvlpaIU48Ly7+NpgSScifAaASAZDr3vRhP46eMdoh?=
 =?us-ascii?Q?eCeQGJD8c62l1S44F4KE1eML2IJLtMQ7IRw7spQrFS3h/+IVzz8VA2KCFYj0?=
 =?us-ascii?Q?nhujrE4qhBQpx1pzahfKabgVabjWKMk716u6c5hEiFqpaE9MKUnp/MZRvhJD?=
 =?us-ascii?Q?jHvCvtiO7XqhnZIfI2vEUDPhS9mv9rPrK8qKBNuIIZWC/CSvDs108sVt7svT?=
 =?us-ascii?Q?xExYFsqiYVO+PL0YLx/ISda22bUYj+cxHvhy+5JkKXV/zN2lwMUFqnzuTRs6?=
 =?us-ascii?Q?tZ0ZeqeX0veEKHh1NAEweej9l9I44VOoycop3MKVHmrkOpWmj28BBr0CjJtg?=
 =?us-ascii?Q?Kbo4GqbZAfZqIpFsvJewYNUdYQf1n0M/fblqSl26tKiPOTZmvd68Nu/uStiS?=
 =?us-ascii?Q?l9Hzm28BkPYX4+SzuqrJG+/8soB8jL/K+LKAVgDGLjTcddyhcchFkO0PfcNp?=
 =?us-ascii?Q?XoUmx4yfHkLWp4V/sUnEMruTHWFFkbNLRqw9A2PYcgFfmTEwEfOuAmL/9Nhn?=
 =?us-ascii?Q?WmTbE3Q41o8X8eSP6zGpGyN52/FNoxbu350Wr+EEQyXnTJPdvFuDkRBdWJ0Z?=
 =?us-ascii?Q?81n/gDiV4OeCoAJtNJsyq2WcYpPXrm02OhdH/7mpj8Fqx1wwlGKGGA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB8056.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I/W/kyZ9Izebq9y49mTVeMaAsyOGNpv2msdZl0Xfg5vTe0M2vL1ESZLzoHzl?=
 =?us-ascii?Q?ODj+ubMo5wBpJ0BWQGvKUYl0wrBdZ4rOdiTU+sbn/EysnuAitnn/2YTocFY1?=
 =?us-ascii?Q?Ysn26g1Ce6Lsv7xC6ZvJTyvQwUPKPf4W6Ybd/VtMu28MJzkmMd+2zqwXCoVG?=
 =?us-ascii?Q?DVAHkQ92+VNLrr8gP4Lw5zHZpWyugL8EcsKrD34edX+z1UcLuSs/4cNX/d3z?=
 =?us-ascii?Q?Jx/mjZXEsvp7uYGgjziNy125PuTdwF+9ClK6gFlu8r5yhso692+ozOE7EOjC?=
 =?us-ascii?Q?yyIybaGl9LbqFGWOKfG2cvHAKGEcUEaVbFFElBdhJ/rtjKpy7q0YJ7ijatm1?=
 =?us-ascii?Q?NnGo5yghIB8E68c2VQEkx7mzK96TxVaHRMZFLGUb2zcxgynJ7Jt0Ea4yws9x?=
 =?us-ascii?Q?yRUuY6ql05y/AUmqM344F526YvQJXmKhHD0IuzKyNf28ketj+kj7PZm7BREh?=
 =?us-ascii?Q?NKhvXeHhkG59rc7RgLcVZpLAXvxBXxeQkU2hZsaDifa/0ZNFQ6SL3s1or300?=
 =?us-ascii?Q?SWWvnEqTucvwAaiWcn23qdXmVkQyfm1dG2Vq6P6SKd8q8gln9YnHY1VOJow5?=
 =?us-ascii?Q?l99760IehufXCHqrEUji6rLcowtO5tTTSv559vHWizldyvR7AaGSgLMlo/Iz?=
 =?us-ascii?Q?xssb8V9YG3oMnC7+UFkd8ANzS9QIxMyaSznD5gbKUCDUc9Bek9AB9aLn5e1K?=
 =?us-ascii?Q?G861z9j1+i8yRayiGPUsJqzCNBKBj9aX/p6kbyFPPjiWZxwD8rkh6/U8JNgN?=
 =?us-ascii?Q?7lOoupaFp51Q/U01QmJmHwM9J4grqsRTQ0yOVbntXOh5YeMMe9STsOUCftQX?=
 =?us-ascii?Q?C/wp4HwuSyKErxjhmTpfc9eb5HlCvVP72d+33nWJcA2TBT6/8jSbGkvUbokW?=
 =?us-ascii?Q?G4IY761memfx/guGlHUXUXu6sA7Jrwrnq9VTElvmR5COYCG3LsaxNSooCU5U?=
 =?us-ascii?Q?S7ALdpOuMNAV9cEsJoly35RRHLWr49SH1v0YXCGPVFzGiAz5MN4eTZKpMqcq?=
 =?us-ascii?Q?cO0eYtXQmeuW2CbFOgCvOjIwYMoflV0Tf+r7dV+M/vZwbCHBrHwfdEeCERfO?=
 =?us-ascii?Q?rAeTjZkkqf0HpLqOGIdYMuDG0hKLK3N3GblyXwkidE5t9P9vVRA5x5d/ONgt?=
 =?us-ascii?Q?RmtrHptbGPNL6C8ghR7seTcwEleA/obdeCD1EsH7Y3hmIaW4y7mSI/TSdoju?=
 =?us-ascii?Q?KV2YfP4o9Lscor8dDGbhFBXxVgZXCeOY5W1je5zR50asnUoXiD4UOya7d8+B?=
 =?us-ascii?Q?NpWWTan7f404fp7TWMOTWIzJ6YiQEZ8azEKGDK6b4UJ5M6e0zgGG58kWBCTk?=
 =?us-ascii?Q?p5breqBDP7oMi+McnmjgbqIjgrVsrpf4vnbfOKO1F/wZJyzKHUqLcKrlep+a?=
 =?us-ascii?Q?aYba9T5qzCm89+KiKVDCAaKRxNjhCwqI3CqZKvnfG6vMwl/zQP6rWVaVjXz1?=
 =?us-ascii?Q?/pi2NiZeWeFh2gnFcK13SFhmxi/nfkAEgWELVHTszT6CEJlZuQ0SMd6udT7o?=
 =?us-ascii?Q?8P+EL+G8S6sskRtnZMzR23jR0MIZTxzartAg8iakx/6xT0bIKKQloYBRfRxG?=
 =?us-ascii?Q?31hYEho0ajmLxN+EsFR28ZfQT0tn8twbMcrByTq+?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23cb7c05-89da-483f-e6d5-08de2f8e9eff
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB8056.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2025 21:31:13.4513 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mI3tVt4bIw/BviKEkXwbt5VvA542isCZoCfZlJl/UYBKNJoPLNkO6CBX1G2lgI6JV0Xlo5qMh1XcRXAxMV+Stw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9068
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

Add a new module `clist` for working with C's doubly circular linked
lists. Provide low-level iteration over list_head nodes and high-level
iteration over typed list items.

Provide a `clist_create` macro to assist in creation of the `Clist` type.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
Thanks to Alex, Daniel, Danilo, John, and Miguel for reviewing v1/v2!

Changes since v2:
  - Squashed the 3 patches into a single patch due to dependencies and reducing helpers.
  - Changed Clist to Clist<'a, T> using const generic offset (Alex).
  - Simplified C helpers to only list_add_tail (Alex, John).
  - Added init_list_head() for INIT_LIST_HEAD functionality and dropped it from C helpers (Alex).
  - Added FusedIterator impl for both ClistHeadIter and ClistIter.
  - Added PartialEq/Eq for ClistHead (Alex)
  - Rust style improvements, comment improvements (Daniel).
  - Added MAINTAINERS entry (Miguel).

Link to v2: https://lore.kernel.org/all/20251111171315.2196103-2-joelagnelf@nvidia.com/
Link to v1 (RFC): https://lore.kernel.org/all/20251030190613.1224287-2-joelagnelf@nvidia.com/

 MAINTAINERS            |   7 +
 rust/helpers/helpers.c |   1 +
 rust/helpers/list.c    |  12 ++
 rust/kernel/clist.rs   | 349 +++++++++++++++++++++++++++++++++++++++++
 rust/kernel/lib.rs     |   1 +
 5 files changed, 370 insertions(+)
 create mode 100644 rust/helpers/list.c
 create mode 100644 rust/kernel/clist.rs

diff --git a/MAINTAINERS b/MAINTAINERS
index 5f7aa6a8a9a1..fb2ff877b6d1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22666,6 +22666,13 @@ F:	rust/kernel/init.rs
 F:	rust/pin-init/
 K:	\bpin-init\b|pin_init\b|PinInit
 
+RUST TO C LIST INTERFACES
+M:	Joel Fernandes <joelagnelf@nvidia.com>
+M:	Alexandre Courbot <acourbot@nvidia.com>
+L:	rust-for-linux@vger.kernel.org
+S:	Maintained
+F:	rust/kernel/clist.rs
+
 RXRPC SOCKETS (AF_RXRPC)
 M:	David Howells <dhowells@redhat.com>
 M:	Marc Dionne <marc.dionne@auristor.com>
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 79c72762ad9c..634fa2386bbb 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -32,6 +32,7 @@
 #include "io.c"
 #include "jump_label.c"
 #include "kunit.c"
+#include "list.c"
 #include "maple_tree.c"
 #include "mm.c"
 #include "mutex.c"
diff --git a/rust/helpers/list.c b/rust/helpers/list.c
new file mode 100644
index 000000000000..6044979c7a2e
--- /dev/null
+++ b/rust/helpers/list.c
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Helpers for C Circular doubly linked list implementation.
+ */
+
+#include <linux/list.h>
+
+void rust_helper_list_add_tail(struct list_head *new, struct list_head *head)
+{
+	list_add_tail(new, head);
+}
diff --git a/rust/kernel/clist.rs b/rust/kernel/clist.rs
new file mode 100644
index 000000000000..361a6132299b
--- /dev/null
+++ b/rust/kernel/clist.rs
@@ -0,0 +1,349 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! A C doubly circular intrusive linked list interface for rust code.
+//!
+//! # Examples
+//!
+//! ```
+//! use kernel::{
+//!     bindings,
+//!     clist::init_list_head,
+//!     clist_create,
+//!     types::Opaque, //
+//! };
+//! # // Create test list with values (0, 10, 20) - normally done by C code but it is
+//! # // emulated here for doctests using the C bindings.
+//! # use core::mem::MaybeUninit;
+//! #
+//! # /// C struct with embedded `list_head` (typically will be allocated by C code).
+//! # #[repr(C)]
+//! # pub(crate) struct SampleItemC {
+//! #     pub value: i32,
+//! #     pub link: bindings::list_head,
+//! # }
+//! #
+//! # let mut head = MaybeUninit::<bindings::list_head>::uninit();
+//! #
+//! # // SAFETY: head and all the items are test objects allocated in this scope.
+//! # unsafe { init_list_head(head.as_mut_ptr()) };
+//! # // SAFETY: head is a test object allocated in this scope.
+//! # let mut head = unsafe { head.assume_init() };
+//! # let mut items = [
+//! #     MaybeUninit::<SampleItemC>::uninit(),
+//! #     MaybeUninit::<SampleItemC>::uninit(),
+//! #     MaybeUninit::<SampleItemC>::uninit(),
+//! # ];
+//! #
+//! # for (i, item) in items.iter_mut().enumerate() {
+//! #     let ptr = item.as_mut_ptr();
+//! #     // SAFETY: pointers are to allocated test objects with a list_head field.
+//! #     unsafe {
+//! #         (*ptr).value = i as i32 * 10;
+//! #         // addr_of_mut!() computes address of link directly as link is uninitialized.
+//! #         init_list_head(core::ptr::addr_of_mut!((*ptr).link));
+//! #         bindings::list_add_tail(&mut (*ptr).link, &mut head);
+//! #     }
+//! # }
+//!
+//! // Rust wrapper for the C struct.
+//! // The list item struct in this example is defined in C code as:
+//! //   struct SampleItemC {
+//! //       int value;
+//! //       struct list_head link;
+//! //   };
+//! //
+//! #[repr(transparent)]
+//! pub(crate) struct Item(Opaque<SampleItemC>);
+//!
+//! impl Item {
+//!     pub(crate) fn value(&self) -> i32 {
+//!         // SAFETY: `Item` has same layout as `SampleItemC`.
+//!         unsafe { (*self.0.get()).value }
+//!     }
+//! }
+//!
+//! // Create typed Clist from sentinel head.
+//! // SAFETY: head is valid, items are `SampleItemC` with embedded `link` field.
+//! let list = unsafe { clist_create!(&mut head, Item, SampleItemC, link) };
+//!
+//! // Iterate directly over typed items.
+//! let mut found_0 = false;
+//! let mut found_10 = false;
+//! let mut found_20 = false;
+//!
+//! for item in list.iter() {
+//!     let val = item.value();
+//!     if val == 0 { found_0 = true; }
+//!     if val == 10 { found_10 = true; }
+//!     if val == 20 { found_20 = true; }
+//! }
+//!
+//! assert!(found_0 && found_10 && found_20);
+//! ```
+
+use core::{
+    iter::FusedIterator,
+    marker::PhantomData, //
+};
+
+use crate::{
+    bindings,
+    types::Opaque, //
+};
+
+/// Initialize a `list_head` object to point to itself.
+///
+/// # Safety
+///
+/// `list` must be a valid pointer to a `list_head` object.
+#[inline]
+pub unsafe fn init_list_head(list: *mut bindings::list_head) {
+    // SAFETY: Caller guarantees `list` is a valid pointer to a `list_head`.
+    unsafe {
+        (*list).next = list;
+        (*list).prev = list;
+    }
+}
+
+/// Wraps a `list_head` object for use in intrusive linked lists.
+///
+/// # Invariants
+///
+/// - `ClistHead` represents an allocated and valid `list_head` structure.
+///
+/// # Safety
+///
+/// - All `list_head` nodes must not be modified by C code for the lifetime of `ClistHead`.
+#[repr(transparent)]
+pub struct ClistHead(Opaque<bindings::list_head>);
+
+impl ClistHead {
+    /// Create a `&ClistHead` reference from a raw `list_head` pointer.
+    ///
+    /// # Safety
+    ///
+    /// - `ptr` must be a valid pointer to an allocated and initialized `list_head` structure.
+    /// - `ptr` must remain valid and unmodified for the lifetime `'a`.
+    #[inline]
+    pub unsafe fn from_raw<'a>(ptr: *mut bindings::list_head) -> &'a Self {
+        // SAFETY:
+        // - `ClistHead` has same layout as `list_head`.
+        // - `ptr` is valid and unmodified for 'a.
+        unsafe { &*ptr.cast() }
+    }
+
+    /// Get the raw `list_head` pointer.
+    #[inline]
+    pub fn as_raw(&self) -> *mut bindings::list_head {
+        self.0.get()
+    }
+
+    /// Get the next `ClistHead` in the list.
+    #[inline]
+    pub fn next(&self) -> &Self {
+        let raw = self.as_raw();
+        // SAFETY:
+        // - `self.as_raw()` is valid per type invariants.
+        // - The `next` pointer is guaranteed to be non-NULL.
+        unsafe { Self::from_raw((*raw).next) }
+    }
+
+    /// Get the previous `ClistHead` in the list.
+    #[inline]
+    pub fn prev(&self) -> &Self {
+        let raw = self.as_raw();
+        // SAFETY:
+        // - self.as_raw() is valid per type invariants.
+        // - The `prev` pointer is guaranteed to be non-NULL.
+        unsafe { Self::from_raw((*raw).prev) }
+    }
+
+    /// Check if this node is linked in a list (not isolated).
+    #[inline]
+    pub fn is_linked(&self) -> bool {
+        let raw = self.as_raw();
+        // SAFETY: self.as_raw() is valid per type invariants.
+        unsafe { (*raw).next != raw && (*raw).prev != raw }
+    }
+}
+
+// SAFETY: `ClistHead` can be sent to any thread.
+unsafe impl Send for ClistHead {}
+
+// SAFETY: `ClistHead` can be shared among threads as it is not modified by C per type invariants.
+unsafe impl Sync for ClistHead {}
+
+impl PartialEq for ClistHead {
+    fn eq(&self, other: &Self) -> bool {
+        self.as_raw() == other.as_raw()
+    }
+}
+
+impl Eq for ClistHead {}
+
+/// Low-level iterator over `list_head` nodes.
+///
+/// An iterator used to iterate over a C intrusive linked list (`list_head`). Caller has to
+/// perform conversion of returned `ClistHead` to an item (using `container_of` macro or similar).
+///
+/// # Invariants
+///
+/// `ClistHeadIter` is iterating over an allocated, initialized and valid list.
+struct ClistHeadIter<'a> {
+    current_head: &'a ClistHead,
+    list_head: &'a ClistHead,
+    exhausted: bool,
+}
+
+impl<'a> Iterator for ClistHeadIter<'a> {
+    type Item = &'a ClistHead;
+
+    #[inline]
+    fn next(&mut self) -> Option<Self::Item> {
+        if self.exhausted {
+            return None;
+        }
+
+        // Advance to next node.
+        self.current_head = self.current_head.next();
+
+        // Check if we've circled back to the sentinel head.
+        if self.current_head == self.list_head {
+            self.exhausted = true;
+            return None;
+        }
+
+        Some(self.current_head)
+    }
+}
+
+impl<'a> FusedIterator for ClistHeadIter<'a> {}
+
+/// A typed C linked list with a sentinel head.
+///
+/// A sentinel head represents the entire linked list and can be used for
+/// iteration over items of type `T`, it is not associated with a specific item.
+///
+/// # Invariants
+///
+/// - `head` is an allocated and valid C `list_head` structure that is the list's sentinel.
+/// - `offset` is the byte offset of the `list_head` field within the C struct that `T` wraps.
+///
+/// # Safety
+///
+/// - All the list's `list_head` nodes must be allocated and have valid next/prev pointers.
+/// - The underlying `list_head` (and entire list) must not be modified by C for the
+///   lifetime 'a of `Clist`.
+pub struct Clist<'a, T> {
+    head: &'a ClistHead,
+    offset: usize,
+    _phantom: PhantomData<&'a T>,
+}
+
+impl<'a, T> Clist<'a, T> {
+    /// Create a typed `Clist` from a raw sentinel `list_head` pointer.
+    ///
+    /// The const generic `OFFSET` specifies the byte offset of the `list_head` field within
+    /// the C struct that `T` wraps.
+    ///
+    /// # Safety
+    ///
+    /// - `ptr` must be a valid pointer to an allocated and initialized `list_head` structure
+    ///   representing a list sentinel.
+    /// - `ptr` must remain valid and unmodified for the lifetime `'a`.
+    /// - The list must contain items where the `list_head` field is at byte offset `OFFSET`.
+    /// - `T` must be `#[repr(transparent)]` over the C struct.
+    #[inline]
+    pub unsafe fn from_raw_and_offset<const OFFSET: usize>(ptr: *mut bindings::list_head) -> Self {
+        Self {
+            // SAFETY: Caller guarantees `ptr` is a valid, sentinel `list_head` object.
+            head: unsafe { ClistHead::from_raw(ptr) },
+            offset: OFFSET,
+            _phantom: PhantomData,
+        }
+    }
+
+    /// Get the raw sentinel `list_head` pointer.
+    #[inline]
+    pub fn as_raw(&self) -> *mut bindings::list_head {
+        self.head.as_raw()
+    }
+
+    /// Check if the list is empty.
+    #[inline]
+    pub fn is_empty(&self) -> bool {
+        let raw = self.as_raw();
+        // SAFETY: self.as_raw() is valid per type invariants.
+        unsafe { (*raw).next == raw }
+    }
+
+    /// Create an iterator over typed items.
+    #[inline]
+    pub fn iter(&self) -> ClistIter<'a, T> {
+        ClistIter {
+            head_iter: ClistHeadIter {
+                current_head: self.head,
+                list_head: self.head,
+                exhausted: false,
+            },
+            offset: self.offset,
+            _phantom: PhantomData,
+        }
+    }
+}
+
+/// High-level iterator over typed list items.
+pub struct ClistIter<'a, T> {
+    head_iter: ClistHeadIter<'a>,
+    offset: usize,
+    _phantom: PhantomData<&'a T>,
+}
+
+impl<'a, T> Iterator for ClistIter<'a, T> {
+    type Item = &'a T;
+
+    fn next(&mut self) -> Option<Self::Item> {
+        let head = self.head_iter.next()?;
+
+        // Convert to item using offset.
+        // SAFETY:
+        // - `item_ptr` calculation from `offset` (calculated using offset_of!)
+        //    is valid per invariants.
+        Some(unsafe { &*head.as_raw().cast::<u8>().sub(self.offset).cast::<T>() })
+    }
+}
+
+impl<'a, T> FusedIterator for ClistIter<'a, T> {}
+
+/// Create a C doubly-circular linked list interface `Clist` from a raw `list_head` pointer.
+///
+/// This macro creates a `Clist<T>` that can iterate over items of type `$rust_type` linked
+/// via the `$field` field in the underlying C struct `$c_type`.
+///
+/// # Arguments
+///
+/// - `$head`: Raw pointer to the sentinel `list_head` object (`*mut bindings::list_head`).
+/// - `$rust_type`: Each item's rust wrapper type.
+/// - `$c_type`: Each item's C struct type that contains the embedded `list_head`.
+/// - `$field`: The name of the `list_head` field within the C struct.
+///
+/// # Safety
+///
+/// The caller must ensure:
+/// - `$head` is a valid, initialized sentinel `list_head` pointing to a list that remains
+///   unmodified for the lifetime of the rust `Clist`.
+/// - The list contains items of type `$c_type` linked via an embedded `$field`.
+/// - `$rust_type` is `#[repr(transparent)]` over `$c_type` or has compatible layout.
+/// - The macro is called from an unsafe block.
+///
+/// # Examples
+///
+/// Refer to the examples in the [crate::clist] module documentation.
+#[macro_export]
+macro_rules! clist_create {
+    ($head:expr, $rust_type:ty, $c_type:ty, $field:ident) => {
+        $crate::clist::Clist::<$rust_type>::from_raw_and_offset::<
+            { ::core::mem::offset_of!($c_type, $field) },
+        >($head)
+    };
+}
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index c2eea9a2a345..b69cc5ed3b59 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -72,6 +72,7 @@
 pub mod bug;
 #[doc(hidden)]
 pub mod build_assert;
+pub mod clist;
 pub mod clk;
 #[cfg(CONFIG_CONFIGFS_FS)]
 pub mod configfs;
-- 
2.34.1

