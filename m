Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1D89C4F34E
	for <lists+dri-devel@lfdr.de>; Tue, 11 Nov 2025 18:13:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32CC510E619;
	Tue, 11 Nov 2025 17:13:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WXFB7cmI";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010068.outbound.protection.outlook.com [52.101.85.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3534810E610;
 Tue, 11 Nov 2025 17:13:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZTZx/F5JgleK+Y+vsJ2enLvu5rzixX1ArLVXnIX22uaKMwZiEMMx9mCt/mvFS4DNMSt9qDC/D9+uxqzn37LNEzqBAxwqBo6M3FAe2pc8UtpdIZYxBgT7JVJyA3QdP9XA6DTJPDI/Hi9wUdY+tCKgZSODc+dYrQjcUCHbA2TANa7OzzrZ22OK/ZgdleOn+LNsOmja1s0oD7M98nwG1h3lRIu+/9yz+a5aN/TCNMD7KRqZf0+tYu4L3yB7wXWapgxJh5nWcKVTd3lNyeMC1nEPV0i/qSSRPrAI8D1aZH7DoF9NQOSCCoFPCTH5YTGpU6RQLvziUUAujxlZ7mFyvklRpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R2XmfnR6AeRRa02lZxlBdXkTXQ42eLuqGF6x1gwGbH8=;
 b=lLs/vVXBr1CWZRVArN99nspKppIOlePAvHUprD+hUGHL55RccdxJdrtWyweu/N7eSeHMg90RhtEU/96NcU4B55F+e0I5zwaOKp/zUVWfQ6rFa/d9QqF9X2g5osjsq/iEjNdAbr2yiYyIEbaOubEYcSuAGxfhYheDR4XDfhe7IoQNfzGNBkhzmUgmveXg9zk1TvovkkJHWIoEXtSfYtFvn637DjJdoStZ2yJZ7YvMLlvDMuGMiw8mS3b+44oZno+HtnMNd2OsUcGG6x/uE1jYaYMw2TlO9PCsaTR/jUH4tTATFavDS1CVPPJmwCk+czGgb8w4Hv70cYo2CYtDsCqSIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=R2XmfnR6AeRRa02lZxlBdXkTXQ42eLuqGF6x1gwGbH8=;
 b=WXFB7cmIuUUW1uyVDwvgQaN0ZgHuP/KnUyKQaahY0iVNysCs5JycHm7jROkXemR12/KTaKfvMZdfuWrIIAB58J4Y5J53GhTTVEw2tS1yJkfXvJ6ZdgFSK00Lv/3v+39q/wbd68CzJ5aTutx4o56qLgvcXxWAFARncgjk21teZWzCOmcocapCtaNxGM8DgJLmItgY0DiUX3eA5LaTQ38EBwTkMyKgYxXGL+vgBdQVatGq0nCOYDgYOVM8TndIpj3Q4uRbZe+hiare68DDNCIT6TianlQ5AXNpCF3nkgGsNDgjChnSMRwiH++ViurrtfMdLylHc/WmrcKcW22WpCZfpQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by BL1PR12MB5730.namprd12.prod.outlook.com (2603:10b6:208:385::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Tue, 11 Nov
 2025 17:13:24 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9298.015; Tue, 11 Nov 2025
 17:13:24 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dakr@kernel.org, airlied@gmail.com
Cc: acourbot@nvidia.com, apopple@nvidia.com, ojeda@kernel.org,
 alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org,
 aliceryhl@google.com, tmgross@umich.edu, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 jhubbard@nvidia.com, joelagnelf@nvidia.com, ttabi@nvidia.com,
 joel@joelfernandes.org, elle@weathered-steel.dev,
 daniel.almeida@collabora.com, arighi@nvidia.com, phasta@kernel.org,
 nouveau@lists.freedesktop.org
Subject: [PATCH v2 1/3] rust: helpers: Add list helpers for C linked list
 operations
Date: Tue, 11 Nov 2025 12:13:12 -0500
Message-Id: <20251111171315.2196103-1-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0200.namprd13.prod.outlook.com
 (2603:10b6:208:2be::25) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|BL1PR12MB5730:EE_
X-MS-Office365-Filtering-Correlation-Id: d0357731-0756-4a62-8902-08de21459f52
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fRdQshzOQnCw8uKr5U/v4o+5oh8xn1Mjmr9RuvomyB/QsAgEC3+763hxHnv7?=
 =?us-ascii?Q?nqKCyL+hMBPegO37jKltFc1NCaI6IxseRZAlnIB4S2JrnyO+4Q/sUjTZy9r6?=
 =?us-ascii?Q?Jn6+A7Z+kymYUnVmPClGQvvkwezntu3QfgZLe4sdBClBlQlRJ3ykYE57D/WK?=
 =?us-ascii?Q?N+64mTZOxvPsfqdeUbzPyPpb0dCgPZLCRWoK1/rYDzTXv+eTDnZjDNrrlN71?=
 =?us-ascii?Q?wl8U/lSFKnt/Etd6/wrNzbE+KGHCP1TgPmeTaPfZUrqPmLwqw1VCwsqOdOGy?=
 =?us-ascii?Q?kURlFVfGVfOZAT/8I3q2YWktozaMd+yiZ+mp52fX1j0+eZDnTGHtZtnS3EVA?=
 =?us-ascii?Q?iW/TKNGILqqN0W/jF47TlwDv/+yl0VAW2/eYtOWou+X0hqKNzEPm1R+L2oFV?=
 =?us-ascii?Q?Aq8ZLNiwXb5n5lRsQvQZdPCDrxR6s1mBXdZrQ9C/vq6ZBlLVZMHdFIY0Y1rd?=
 =?us-ascii?Q?B/eh2oicy7nMYscDdeA2NE1LMTgQafkasRoey9e6OxtogjQ1yzz0lgTgjtRp?=
 =?us-ascii?Q?pvYtb83NlZ65lbJgFsfZ3Lt3JXbi1LUubsHcau/WeDZbW8zJmg9pJRReED8w?=
 =?us-ascii?Q?Tr//6RplOfNGsAd70ydjTFhGne+4L5ncnooeTzfNnsJil03bUtqCnBsDyPTW?=
 =?us-ascii?Q?dPFRLjpNk6MBd5szS5FPG0SsPrpOX44MvR6+qpsGruWAZxA8J3vrdnB+VGhd?=
 =?us-ascii?Q?h23RsySFQ4vptqs1SvTlY8H8iKgkpOf+l5NJJNursRlaD7QHtSaBurzIwN0E?=
 =?us-ascii?Q?Us9reUhUfanrN7sopedDQANzTRP19Fmy6tnoVgi1H69AyR5bnFVGjzMGwgf7?=
 =?us-ascii?Q?J3zOmkudlOrOJF0k0X1ZVW1OVBPv46qObsjOuzoxLuorHqILZdHFooHjni5Q?=
 =?us-ascii?Q?Ni4i4W06uoIKcuP5IEz3FFPTn26O3REu5Fk9/7x/50vCswn3bugRLwGTPbJB?=
 =?us-ascii?Q?gfxJqPnm4wgn1a+5cw7HHLh+9ZaBABnktMoK9MbVV78qWeBXg1MnIVGjt924?=
 =?us-ascii?Q?nn6r51YNtSuIHbLwNjmnH3o04CB+YTYt5Av1sPxj+b/P+7k2vTTZGJP7h7z/?=
 =?us-ascii?Q?0uwKU+7bA50t3Vj6kj9BxH7tUc4X8Gn2eEsOSNJZVDrFg+F5s79yGFwXb5sc?=
 =?us-ascii?Q?fnhSDexUtqGNQJIpG8Zrro7qvINx+t0UAiSBndzhagh5lefVVQJ1eb4SRBNJ?=
 =?us-ascii?Q?Xpy2gc9lVzW1ODNM/SEgasWPfYadXotNJTMLXF/TkAPUsa3y9Wmyhe632uPf?=
 =?us-ascii?Q?FleiBWxqhY5GxLoDhjGbDRjVof0GG+NBaEl0L0MtuGAIViO+g/4nQVPqFaBX?=
 =?us-ascii?Q?aKmcqEK7Y05Q8BnAQg/x3WqMiAGAQJ3cyePRZ+UDMyCzZgrSbJwaUtM8VoAb?=
 =?us-ascii?Q?zUgiuy4bgN5UUuJN9oVLxqSsct3jCRbLLli7Br8lYWuzFJrvvRpEOu9qAdXK?=
 =?us-ascii?Q?L3NU8MtzJxtPuA6Qi6Jqn1Iriua6x7RD?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GVR5ueLTztWOqOJzu6/YfucISYbNO8ybtgl2d3BEiOyebHV8Owru1U0ZDR7N?=
 =?us-ascii?Q?a0C9tM1TdL0j11/gFk/77tEfJpP6/LvC2xwyFqAcXUH/pZLcaWS1TVVsbKwA?=
 =?us-ascii?Q?NB7u+Zn4opfT7dL2JN/ROwuzebj3UVSpZFqaFlGpJDjbCfiYgGLDCQdqZgqq?=
 =?us-ascii?Q?TLrs6tzViRf9LBi4Tql5Y4x524R+ap7hhN9eMPeyX941ZIcZrgUpc63CN0jm?=
 =?us-ascii?Q?ZnDcyVkUUncUJaWZDOtE4elDS3yh2BnnCnuXilmHLw3lkyMGymml12Q9uN/g?=
 =?us-ascii?Q?kbQeoDQs1ZaIW3ooPWBAB1nDA/F4ztL8dN5p5b0+9nWvzlPk9mKLq4m2Exiu?=
 =?us-ascii?Q?g4QuQz84s6jbXMASh+tWLx2972L79bQIKeGHthPWyn4H65o8vohkycdErZsd?=
 =?us-ascii?Q?0VgUu7GaSh5ucwgH9UCd7/b7fVptLbGRePsAKBCoX6v97htRBudSt7Dyhspj?=
 =?us-ascii?Q?ctv/Q0jI+v3XUOhwfKu0zBoZ+5ciAG+CWqmvjyUVxS2yqtVwEYGfL22tutBN?=
 =?us-ascii?Q?I0v2FKrB/7ed9i1d3eNbd0R05XtVmOpz1klgA1ek51ARScxPn1n1QfcloN3O?=
 =?us-ascii?Q?3q+lbr2Kq9koq5JbpcvHybKu/gj6WcBobN+GYD1Wmbre9GhZJLWFezGxRS6l?=
 =?us-ascii?Q?8AYK0PU5ydvzxnboj9vqTllxl46Am//n/1LXr+k13VlkWo+TGSbnMfkoNIX/?=
 =?us-ascii?Q?sujLrroHyeas+hA3g5sMXiG9KFD3/qUL4pAKG8Db52v2BhTRYJYLpSOHIu68?=
 =?us-ascii?Q?wrzgC1W8r5lbKHVM0p8XtuOdKm+SW1/Js/6yOrf9DrLL55B7Eq1JuVgKk2LT?=
 =?us-ascii?Q?hFJ9LnF3b98qOOPoOS44H6NHSNzqsuhxjInAmcmI4Kx0x9KaPzZl5MFWgc82?=
 =?us-ascii?Q?qw77th+rwrjzlUcwITK5b2VpgYiHzumvBfvGEFC9+OZxUFIWpFJJP4hm8rDg?=
 =?us-ascii?Q?ewgxrvCNfFWfLNNZ+/yJhSjprv1A/oGDhvLDgJTrRmEKRg8j0hKK13e/dUAg?=
 =?us-ascii?Q?F27+Os0CR+g+yloIisUKmYAuKIOTkJTx3jfG35SdYkXnVq9Fxx0sIhQkoEFr?=
 =?us-ascii?Q?3FBVIadb4JdLJwdv/BuPX2k+PkH9txF31JeuzALZpu6gZ6r9tQJv/liAkQQN?=
 =?us-ascii?Q?N+awjQK3uWT78bUvPIh4H22CQ+Hq+9F/ufESpy3NQRRTWMkoE+B+O14ZKNsX?=
 =?us-ascii?Q?Hf7uFYdjAymFAMdPEk6dAezskY42xNY/059S+fvmY69SJvjG6IvXt/havQPf?=
 =?us-ascii?Q?KVh9ABjaKkKVSJ10KiTKiUaSwvfAJwv7Y91NFFSFhUbXBEwMGhIPl667irXY?=
 =?us-ascii?Q?NWy4t7ceL91ROpnU+OK/1MytbpBWVun42sC38DwX0Qfm6yHBav/3P+rGa0hI?=
 =?us-ascii?Q?RYeTtsza846EfUyLPrVf4iPJJFYMrBNiuZ7geGOBgzWe/8mWvdaEu1yF+uUC?=
 =?us-ascii?Q?pj18glzPyczHGInO6lU8DBlRfJUXvLch4U2S0ymSyuLzBa7ebaMyEJ63uvXn?=
 =?us-ascii?Q?jWycra/vQkwaI/dbQX/bFqN5YaoJaTun13LbwcA+YUhMNJIYDQuZ4Km66hDI?=
 =?us-ascii?Q?e5HDQG75FfJwVbx9ACCyydQKDTYgJQLVoOHm1TUj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d0357731-0756-4a62-8902-08de21459f52
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2025 17:13:24.4735 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 50keQRaZ440gXubkch2+aHu7umBtgBrbCoTMxbt+c/cK3S+9nUbi0Fg9JOeUNefxnoWhdZA/ELrgBTkUDWfqjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5730
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

Add Rust helper functions for common C linked list operations
that are implemented as macros or inline functions and thus not
directly accessible from Rust.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 rust/helpers/helpers.c |  1 +
 rust/helpers/list.c    | 32 ++++++++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)
 create mode 100644 rust/helpers/list.c

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
index 000000000000..fea2a18621da
--- /dev/null
+++ b/rust/helpers/list.c
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: GPL-2.0
+
+/*
+ * Helpers for C Circular doubly linked list implementation.
+ */
+
+#include <linux/list.h>
+
+bool rust_helper_list_empty(const struct list_head *head)
+{
+	return list_empty(head);
+}
+
+void rust_helper_list_del(struct list_head *entry)
+{
+	list_del(entry);
+}
+
+void rust_helper_INIT_LIST_HEAD(struct list_head *list)
+{
+	INIT_LIST_HEAD(list);
+}
+
+void rust_helper_list_add(struct list_head *new, struct list_head *head)
+{
+	list_add(new, head);
+}
+
+void rust_helper_list_add_tail(struct list_head *new, struct list_head *head)
+{
+	list_add_tail(new, head);
+}
-- 
2.34.1

