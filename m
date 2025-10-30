Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 83A61C21DA4
	for <lists+dri-devel@lfdr.de>; Thu, 30 Oct 2025 20:06:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05D7510EA0C;
	Thu, 30 Oct 2025 19:06:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="EwZjMJTK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012034.outbound.protection.outlook.com [52.101.53.34])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DFE710EA0E;
 Thu, 30 Oct 2025 19:06:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lqxGd783p4DM1d7vwm5ZhiuGdoZmzOn8qg5sCiFT9QxD33bXUswjmCJTTSfgpSqK3FlvYbvHD5C+2Ml98JKIy2ct1jyTrTwFmTdxpUfKDjFT7yNdTWeMS6B0GX+x7mtu3r+NgsEgZpdf/JEVuE6avK3kzo2e5Y27hdvZFZ0/gTTCVH3NS4WdeVSdTsbOUOuHeSVwXX4HJJzXPxDTPDzRQj/gt0FlZMDv6nW/el/QDQSf/2KIY7pctf9lTCrBxdaxA+WbGPu27QoOufPf2DRYmr6BxnZ6IhfKu3rLUr2efEarwkkgVp4D2GSKI7RmS94N6jFnlSPx1iudKQuEHaqIZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=etJbbMeqdAuZRh/HJvZ2cLD+tgdVu/ko2JD1/SlDlII=;
 b=hdj6t9nfK43nU/+8Yp/ZfzY3jMVxzCjDCAAR/RDvLbdFZQwRaAlzvktIx0QHpUjOKJU5ghk27PI27cnef7QgE/V+JKNu9vcnQ2CT3l2KGs6B5zxS8dpcRuYcU81R2Af7Zp4yjfsgTBODAqP6ymNCzqTNjlp6MhxLVPPNfrFxQcxW6BzMVOK1tDclkb7cs4ertbwhCVlwLh/7M/VNNVYK1uZQeRSBhmH8XxgtgX7/IgM5slAXLt7j8xy41xUFhSnoHajhGlLqHYmAD1h7mQsKp+YinYWj8TMsxB7e1TLptf6qi2uYzskUTVLnU8tOhzqI70IahtmLaA4M63UHiDc0FA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=etJbbMeqdAuZRh/HJvZ2cLD+tgdVu/ko2JD1/SlDlII=;
 b=EwZjMJTKp8HeAkXV1VbWZRf01/0dTiVQuSJImA9yKN29MHjsMa6mom1clEVrXXz9GQbhIoEFByjjFkp2o5pixvmF5XhAGhT8Gch1oZIBzYH5mKaPezpntpWgA2+/KLvQ93SpRSDq7OgB7RHISWF1hHE4DdAN7WrklfTsUkRUgUf/yIqMGsE3oXlTVBPgGw4ccD88igd83So4912ryuHKWYL2F5ZPg3PLX8xba3S7UwNhJ0b0wR9I/Rjj45SYtEicpmHEShlU8jEQFIS5Xkn9odXkSKabd0SdARhIZfB0XAVLOFuOLAybAzS7kKop0cFMcxBlqHsODT9jPsckLbjeIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DS5PPFBABE93B01.namprd12.prod.outlook.com (2603:10b6:f:fc00::65f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.14; Thu, 30 Oct
 2025 19:06:31 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9228.015; Thu, 30 Oct 2025
 19:06:30 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dakr@kernel.org,
 David Airlie <airlied@gmail.com>
Cc: acourbot@nvidia.com, Alistair Popple <apopple@nvidia.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 bjorn3_gh@protonmail.com, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 Timur Tabi <ttabi@nvidia.com>, joel@joelfernandes.org,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Andrea Righi <arighi@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 nouveau@lists.freedesktop.org
Subject: [PATCH RFC 2/4] samples: rust: Add sample demonstrating C linked list
 iteration
Date: Thu, 30 Oct 2025 15:06:11 -0400
Message-Id: <20251030190613.1224287-3-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251030190613.1224287-1-joelagnelf@nvidia.com>
References: <20251030190613.1224287-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0579.namprd03.prod.outlook.com
 (2603:10b6:408:10d::14) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DS5PPFBABE93B01:EE_
X-MS-Office365-Filtering-Correlation-Id: dc53d27f-b101-487b-2e9a-08de17e76d5c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YBqd2stBHY53LF/ZcGtKDnTixWwBbVdsa8mhDpPLa3gGxZRH8Ev5zxtCjeNO?=
 =?us-ascii?Q?dVHyipdS++ztJh15rFE0dYB8OEfrzK/1xe1GtBuPiyRykUKcWZjyv12DglM3?=
 =?us-ascii?Q?WqNBE5sM/OQrV/2Jc62WVM5Qq6uUNWJS1v484QTYacH9wRjMAhZqFreAzjJ/?=
 =?us-ascii?Q?cDKOtuuLXrER/eSEIJiPU0RBPDaW+bEiIsA/2dvEO/6lTtNT0DQDAeP8SNsV?=
 =?us-ascii?Q?wTzGcjwTziUF/7j303PThsIJzCOFao3qyIdPTsKn/DHCLfsSfPr1w+4rWpiV?=
 =?us-ascii?Q?Scj2VehNoCyZpCwmwtWam6M1CmQG1NocebPoJ2EKXy0omprPl0aipqm4SXtG?=
 =?us-ascii?Q?VOBmywUERDUNObgxbuTmEvZzZPWVfMUaf6SjouHlEmhRvYEUmZ5Ggorr2rEf?=
 =?us-ascii?Q?t8+BHcAX6zOuvpUMpGMN8+TCB8o/zbxpYU/R/08ccdRkMPar3iGfgsZsE3Rd?=
 =?us-ascii?Q?jmD8cH4Blfzkp/lYkMHUddkq/Kd7O+0E9Y3wreolIpR0LS0u0WhQs1CNMxie?=
 =?us-ascii?Q?8asbolwhe4xdXaLBhjqhJbl/68pd/eiSj6R07v6j0pAgUFDCyaaMmOhB3Pqd?=
 =?us-ascii?Q?dKtA+xiJCf0Oz37X8JVCbEwXT46d65a9F5nn+K9BR94hg8ivbCYuCkd0h1X0?=
 =?us-ascii?Q?vyyE1hZ1llKCw3zbouUCmi45d8kfrIGXz9AwNfEef3cbddZ0KykdAweh1Dwu?=
 =?us-ascii?Q?dFHE/sdVJ9KZDKst0dIoXfnzGP6ADvnYcGrLXueu7oMb5ZCwDEK47iFQda8+?=
 =?us-ascii?Q?6TAomRrf/ma/Zo8TT2fZLx4i1L2WHFdBXVlr5riQ7ufszp0JSdMJycEEHHbm?=
 =?us-ascii?Q?123+Sx7CbpLmSLYhj83uIYSvFuBKNSIxkjDYaTUURQxIbmAxtoyIRRqV2Je5?=
 =?us-ascii?Q?9Vev3iQ6D4gKIwFZZ0KGWDnyoyqBwo32V8fI2Db+AtZ8pdEr6CLMEaDkyBLY?=
 =?us-ascii?Q?7sd0YFV0hBEizj71wA8c0yCGVNdkdEUbJkzJ8GA2B84oi2E4CfoMknserCjt?=
 =?us-ascii?Q?aHZzE1B4hiIwNzNzdfQIemSn29ZmkASNXMkI23RQztDYPt+WJqq+JirdolcW?=
 =?us-ascii?Q?IKUjDlbqoNyyjnLQILJwcpRD/ZhCbYYm4E/i0/Qa29WNS21HWC9zx2Lxslzu?=
 =?us-ascii?Q?o0LYKcGWDK5JD6u/hkUczcrFAf1p8le6xbIFjjSM+xKoesGtTti5GMUil6WY?=
 =?us-ascii?Q?Rzb0ZSoack6uXIU/tls20KltM6Bvu94o5i9s6dFRyBleR7ZftQVHJi/1BAbQ?=
 =?us-ascii?Q?nk0SXBdV++/MZNfJgDW+QhT0NHGhYmvDALjHl3dyW7Dl95jM4VZyw/mmEhpB?=
 =?us-ascii?Q?OPcCN+g4pl57Asb5FyK3tvaApLYa+6Z3F6D+jEKrZN5IJKQgSTfUQMpqmKfN?=
 =?us-ascii?Q?0d++b9S1Gs+iUXci1ed+xmAzEsBA2KllyJMpZoyZakRwmMv7HBHR29lF8WBY?=
 =?us-ascii?Q?cRvA+dnwRMiisIfETB3rv9zQ3XHpF7fY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?RsO2V4nPUA0OmFOcXsM/bosUsDyMJpgs6jvvQDQx4ebr8afg6BlPOdoScOI2?=
 =?us-ascii?Q?5yhAVrM35Bt/VzyQ7XmXdpTaVXLyQPVo8BE7FsV5w/Dqd8ufwTMliZoNRIV+?=
 =?us-ascii?Q?xkWSd9YbJbDUvX2rngoQI/xxtWZC+IWBK18t3YjR1ZdaeQf7YwKxzXmq9LYP?=
 =?us-ascii?Q?hONtdNJBzxhkdZStZ9bCMOHa1L9ynXZg0Q98h7PElaIbCvVXGXSOTudUqGDd?=
 =?us-ascii?Q?87UmJ/0qIXXM+qpjbFcwkvrO/wqaIGe1ngXJA8MKaV87FXIyjhkb9MsARma2?=
 =?us-ascii?Q?envQSQs7duU9oY2qiLlbE4jM4qE0UBNv3xukUt4XBkUoCeNcl+93ebq3CLSr?=
 =?us-ascii?Q?WfkAipEAgFDcF9GpIKwv5+WyVXWb/cg4ZJF/PFdkSxPhm7a+sfyKJyexNMM4?=
 =?us-ascii?Q?/e4DF/kaFQjcl9fbAcxBEEYYcCOGlJp2OjjQpMF+/wgSj1pxVM+Jt1R1xhxx?=
 =?us-ascii?Q?eN1v4AyJW7/2o7ROu/CTn7HYXDUaMw32cjaNmqLws+Bab7BmfLRYaNI/pXt+?=
 =?us-ascii?Q?3Oyg/QfZ+NdYYPulAffsD5p5sukaoT4eWarmnNy07Gmp8GVRKU7CXZqrSyCK?=
 =?us-ascii?Q?6NxeMLT9HQsJoRAYq7Sx2bnZlUc14fqZRO5uFK3m1gIqDxYreL92EHmnanDh?=
 =?us-ascii?Q?JQuiaVngSGoE67Bw+c1P2Z2GlALbVETuFawXEYgD9kZMlXKIYT25JIY94SFG?=
 =?us-ascii?Q?dX8DUB/REMTPLPqYfGavrHIPD+yZHZSWe04JTIaq58VeUgKUUPqW9gRFey4+?=
 =?us-ascii?Q?womrgANqoJiV1m/8ckDRvkWU0Uw78P9TpmWmaMiCWEd5seEB4tLYAqnljmPy?=
 =?us-ascii?Q?iybvKwfCdUmEDm5KA5h3kF8WoAik34JhX86t6aZsc/SnR4mAnZM0GTn3xqHO?=
 =?us-ascii?Q?dsS9/jnnK+6HnruBf5Y9zg8qaKGIiteOnP4KPbc0ucZ3jGLn/EKT74ZbRdqZ?=
 =?us-ascii?Q?YKvQ8nG0iXe0k0O0mzA7awl1w7G4ZjK4v9LbVW5rXsrkej99UcFhrTL0jGYc?=
 =?us-ascii?Q?/X0dvG1k1MqmOSsCj+WARRUc1083ByWiVQOf4qpSkbL63q3gqsTsGpwchqbA?=
 =?us-ascii?Q?1/gF22NKRvfyJ/dOmrGWphZoQbrBoR2q3riWh7okWoY8c3j9xjmTiP/Fqfii?=
 =?us-ascii?Q?ajVX3Ujn8HRGFoklSwKk7R1cYcXGs+aUAWJxTJq7QaSS04/0SFcLUm8rGyVb?=
 =?us-ascii?Q?kU+LY+vnvha1XWEZaSPlEJW2yD2y9IwguqYfpZCN+5G7uWzWuB26Mn+K1TfA?=
 =?us-ascii?Q?SkQOcJ4z/OuJYA8X97sTVeitTjaatW5+TQ3b7pZSx8GpUKSj+cXKzDoVSVLd?=
 =?us-ascii?Q?qJwPOvAkAs5gb0WdvM89h2ms4z3BZ1Az8IXVpZ7ciLABQzCCBLYUssaogW7h?=
 =?us-ascii?Q?3nkUPE2UTDkHbBSBV5iekKoMBLahxTJaeLAZczUmWsnOq0PRWsk2wPiOZY6w?=
 =?us-ascii?Q?/k1dOEgyMKg8ZS7nEpLCbn2qAftaxvgYCiRHcvuNtW5lYkzeT2tOTbI49bu8?=
 =?us-ascii?Q?s4OytqAGmgCsN9t4wCV5v5aYBC2cgtK681NwulPUw74RuvKx0QiUcDVEuMKU?=
 =?us-ascii?Q?+dKgrALP/jDGU8VebhaBhwRmxn44RPlrb2FoR0I/?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dc53d27f-b101-487b-2e9a-08de17e76d5c
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 19:06:27.6498 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dbfHFnTF7M4Afqlanf9AIDHlz55Y4vJnNUc5x5BqOevX7x7SRoE3yMwQhu3sJUk0ZBp1kt6+rM+Cm+Ev2xDvOg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFBABE93B01
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

Demonstrates usage of the clist module for iterating over
C-managed linked lists. C code creates and populates the list,
Rust code performs safe iteration using the clist abstraction.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 samples/rust/Kconfig            |  11 +++
 samples/rust/Makefile           |   2 +
 samples/rust/rust_clist_c.c     |  54 +++++++++++++
 samples/rust/rust_clist_main.rs | 138 ++++++++++++++++++++++++++++++++
 4 files changed, 205 insertions(+)
 create mode 100644 samples/rust/rust_clist_c.c
 create mode 100644 samples/rust/rust_clist_main.rs

diff --git a/samples/rust/Kconfig b/samples/rust/Kconfig
index c1cc787a9add..b45631e2593c 100644
--- a/samples/rust/Kconfig
+++ b/samples/rust/Kconfig
@@ -10,6 +10,17 @@ menuconfig SAMPLES_RUST
 
 if SAMPLES_RUST
 
+config SAMPLE_RUST_CLIST
+	tristate "C Linked List sample"
+	help
+	  This option builds the Rust CList sample demonstrating
+	  the clist module for working with C list_head structures.
+
+	  To compile this as a module, choose M here:
+	  the module will be called rust_clist.
+
+	  If unsure, say N.
+
 config SAMPLE_RUST_CONFIGFS
 	tristate "Configfs sample"
 	depends on CONFIGFS_FS
diff --git a/samples/rust/Makefile b/samples/rust/Makefile
index cf8422f8f219..f8899c0df762 100644
--- a/samples/rust/Makefile
+++ b/samples/rust/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 ccflags-y += -I$(src)				# needed for trace events
 
+obj-$(CONFIG_SAMPLE_RUST_CLIST)			+= rust_clist.o
 obj-$(CONFIG_SAMPLE_RUST_MINIMAL)		+= rust_minimal.o
 obj-$(CONFIG_SAMPLE_RUST_MISC_DEVICE)		+= rust_misc_device.o
 obj-$(CONFIG_SAMPLE_RUST_PRINT)			+= rust_print.o
@@ -14,6 +15,7 @@ obj-$(CONFIG_SAMPLE_RUST_DRIVER_FAUX)		+= rust_driver_faux.o
 obj-$(CONFIG_SAMPLE_RUST_DRIVER_AUXILIARY)	+= rust_driver_auxiliary.o
 obj-$(CONFIG_SAMPLE_RUST_CONFIGFS)		+= rust_configfs.o
 
+rust_clist-y := rust_clist_main.o rust_clist_c.o
 rust_print-y := rust_print_main.o rust_print_events.o
 
 subdir-$(CONFIG_SAMPLE_RUST_HOSTPROGS)		+= hostprogs
diff --git a/samples/rust/rust_clist_c.c b/samples/rust/rust_clist_c.c
new file mode 100644
index 000000000000..7a8f5e6c642a
--- /dev/null
+++ b/samples/rust/rust_clist_c.c
@@ -0,0 +1,54 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/list.h>
+#include <linux/slab.h>
+
+/* Sample item with embedded C list_head */
+struct sample_item_c {
+	int value;
+	struct list_head link;
+};
+
+/* Create a list_head and populate it with items */
+struct list_head *clist_sample_create(int count)
+{
+	struct list_head *head;
+	int i;
+
+	head = kmalloc(sizeof(*head), GFP_KERNEL);
+	if (!head)
+		return NULL;
+
+	INIT_LIST_HEAD(head);
+
+	/* Populate with items */
+	for (i = 0; i < count; i++) {
+		struct sample_item_c *item = kmalloc(sizeof(*item), GFP_KERNEL);
+
+		if (!item)
+			continue;
+
+		item->value = i * 10;
+		INIT_LIST_HEAD(&item->link);
+		list_add_tail(&item->link, head);
+	}
+
+	return head;
+}
+
+/* Free the list_head and all items */
+void clist_sample_free(struct list_head *head)
+{
+	struct sample_item_c *item, *tmp;
+
+	if (!head)
+		return;
+
+	/* Free all items in the list */
+	list_for_each_entry_safe(item, tmp, head, link) {
+		list_del(&item->link);
+		kfree(item);
+	}
+
+	kfree(head);
+}
diff --git a/samples/rust/rust_clist_main.rs b/samples/rust/rust_clist_main.rs
new file mode 100644
index 000000000000..6600b0c79558
--- /dev/null
+++ b/samples/rust/rust_clist_main.rs
@@ -0,0 +1,138 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Sample for Rust code interfacing with C linked lists (list_head).
+//!
+//! This sample demonstrates iteration of a C-managed linked list using the [`clist`] module.
+//! C code creates and populates the list, Rust code performs iteration.
+
+use core::ptr::NonNull;
+use kernel::{
+    bindings,
+    clist,
+    container_of,
+    prelude::*, //
+};
+
+module! {
+    type: RustClistModule,
+    name: "rust_clist",
+    authors: ["Joel Fernandes"],
+    description: "Rust Clist sample",
+    license: "GPL",
+}
+
+// FFI declarations for C functions
+extern "C" {
+    fn clist_sample_create(count: i32) -> *mut bindings::list_head;
+    fn clist_sample_free(head: *mut bindings::list_head);
+}
+
+/// Sample item with embedded C list_head (This would typically be a C struct).
+#[repr(C)]
+struct SampleItemC {
+    value: i32,
+    link: bindings::list_head,
+}
+
+/// Rust wrapper for SampleItemC object pointer allocated on the C side.
+///
+/// # Invariants
+///
+/// `ptr` points to a valid [`SampleItemC`] with an initialized embedded `list_head`.
+struct SampleItem {
+    ptr: NonNull<SampleItemC>,
+}
+
+impl clist::FromListHead for SampleItem {
+    unsafe fn from_list_head(link: *const bindings::list_head) -> Self {
+        // SAFETY: Caller ensures link points to a valid, initialized list_head.
+        unsafe {
+            let item_ptr = container_of!(link, SampleItemC, link) as *mut _;
+            SampleItem {
+                ptr: NonNull::new_unchecked(item_ptr),
+            }
+        }
+    }
+}
+
+impl SampleItem {
+    /// Get the value from the sample item.
+    fn value(&self) -> i32 {
+        // SAFETY: self.ptr is valid as per the SampleItem invariants.
+        unsafe { (*self.ptr.as_ptr()).value }
+    }
+}
+
+/// Clist struct - holds the C list_head and manages its lifecycle.
+#[repr(C)]
+struct RustClist {
+    list_head: NonNull<bindings::list_head>,
+}
+
+// SAFETY: RustClist can be sent between threads since it only holds a pointer
+// which can be accessed from any thread with proper synchronization.
+unsafe impl Send for RustClist {}
+
+impl RustClist {
+    /// Create a container for a pointer to a C-allocated list_head.
+    fn new(list_head: *mut bindings::list_head) -> Self {
+        // SAFETY: Caller ensures list_head is a valid, non-null pointer.
+        Self {
+            list_head: unsafe { NonNull::new_unchecked(list_head) },
+        }
+    }
+
+    /// Demonstrate iteration over the list.
+    fn do_iteration(&self) {
+        // Wrap the C list_head with a Rust [`Clist`].
+        // SAFETY: list_head is a valid, initialized, populated list_head.
+        let list = unsafe { clist::Clist::<SampleItem>::new(self.list_head.as_ptr()) };
+        pr_info!("Created C list with items, is_empty: {}\n", list.is_empty());
+
+        // Iterate over the list.
+        pr_info!("Iterating over C list from Rust:\n");
+        for item in list.iter() {
+            pr_info!("  Item value: {}\n", item.value());
+        }
+
+        pr_info!("Iteration complete\n");
+    }
+}
+
+impl Drop for RustClist {
+    fn drop(&mut self) {
+        // Free the list and all items using C FFI.
+        // SAFETY: list_head was allocated by clist_sample_create.
+        // C side handles freeing both the list_head and all items.
+        unsafe {
+            clist_sample_free(self.list_head.as_ptr());
+        }
+    }
+}
+
+struct RustClistModule;
+
+impl kernel::Module for RustClistModule {
+    fn init(_module: &'static ThisModule) -> Result<Self> {
+        pr_info!("Rust Clist sample (init)\n");
+
+        // C creates and populates a list_head with items.
+        // SAFETY: clist_sample_create allocates, initializes, and populates a list.
+        let c_list_head = unsafe { clist_sample_create(6) };
+        if c_list_head.is_null() {
+            pr_err!("Failed to create and populate C list\n");
+            return Err(ENOMEM);
+        }
+
+        // Create the list container (separate from module).
+        let rust_clist = RustClist::new(c_list_head);
+
+        // Demonstrate list operations.
+        rust_clist.do_iteration();
+
+        // rust_clist is dropped here, which frees the C list via Drop impl.
+        pr_info!("Rust Clist sample (exit)\n");
+
+        Ok(RustClistModule {})
+    }
+}
-- 
2.34.1

