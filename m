Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IIyKCmUnlmnxbQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 21:56:05 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD55159A30
	for <lists+dri-devel@lfdr.de>; Wed, 18 Feb 2026 21:56:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11C1710E61C;
	Wed, 18 Feb 2026 20:56:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RQX2P1TE";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012011.outbound.protection.outlook.com [52.101.43.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B584910E5DB;
 Wed, 18 Feb 2026 20:56:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xjL3vLp+URzzPEckFTbUUIiKNJlv0JXwe1BizyJwxdPBJqb3xIPiDPAL+OKjtpFIE0GBSXtCXS7/F2D4jqkBXHupknAD+44lnyfSOr/LBvgku9cnN2ZqQ1fSjiPzYST9/ncJ4VYQRqYb+dQdJ9xZtV8rEs7OexKOMtYRpoYNxhdhaL11VcvzcVbm3zkjN42k+aBPgFhCorySeIH5Xt1BPGpQTgQKj1iTVb5cBuwcKv+q4Ns6TaM0Pkv5FmPgJVtT9AcYh+mno+9eCLy9iD6fJPHQFrhdHCppFO+DtNAejHMWwMh7PyJ2B07xU+ZG08w++zE7KKN0Vt/qmfopugyBng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uNCuLDjI5WQAKFhZUiPsezPXg/Okst63sxhV4OLaUN8=;
 b=qsvkg/IRnsxw15yepWDJIfdvDKH0ci0bvBtloP5czUxqWBR/kuX2NpvO93n6To3PyJfa+EP32/tLNAPgLN3kGZ0drDgNMZQmlZTj07btBJ6a671m7a1TTcMdYfxWLsqpc3dDnVFnAvAO0ODoFbfhGIaVy88ICzubX2hcuoCiOfgE5r8XKTkj5cCN8l4ytW5Z9X0fJqjfZ7Je97zZTROAhvbU2SF6j5Cb41GYhk+Zw4+wDbWHZijV2fUus1Gd2uRFN2lyn5EEkt8FP3AlcG3m1PXqn97BM0W5HuMHB4lUhkYNaCEzwbJRI0sZP/pmCG3amWB4D4SlbgbqcbOGs6Z0pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uNCuLDjI5WQAKFhZUiPsezPXg/Okst63sxhV4OLaUN8=;
 b=RQX2P1TEHNvFuAwytSwr0esVwJTEcmdb7QdlSmrPgV6mI8dDjMu6TmD6Hu+IFu9P8lXkuqw0qXVxlb4dFzQbju/w4u3aP3/YZLINB+7AifAIrrDsNqGEZv8rcPlYfCyWc+pR/47NU0rbhwqkwvqhGMjOJu5gV5pqTzIqa+76e/hQenDM/jnD4cdomg+rkQ9yTnHUEAjZctv8ebsighgEX7ear+F22yUa46hFasc4W97likUqzMeKollrdge8XHv9uritOB4jN4Q6haPxqygGUrOYU+kjfMsswu0i/2TrNavl9V0dL5ZpztI2tUrIbl583zmWnjMejz7ildBLcGPgmA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 CY8PR12MB7611.namprd12.prod.outlook.com (2603:10b6:930:9b::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.13; Wed, 18 Feb 2026 20:55:55 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 20:55:55 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>
Cc: Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>, Nikola Djukic <ndjukic@nvidia.com>
Subject: [PATCH v10 6/8] rust: gpu: Add GPU buddy allocator bindings
Date: Wed, 18 Feb 2026 15:55:04 -0500
Message-Id: <20260218205507.689429-7-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260218205507.689429-1-joelagnelf@nvidia.com>
References: <20260218205507.689429-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN0PR03CA0008.namprd03.prod.outlook.com
 (2603:10b6:208:52f::15) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|CY8PR12MB7611:EE_
X-MS-Office365-Filtering-Correlation-Id: df42a31c-1aff-4dab-8b11-08de6f301bf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?/UE1dNpCthk08JJYQsdAeOdvmml2Q0NAQlvHEbBqDWrXx9+PXur8//a9Ocr+?=
 =?us-ascii?Q?5cMiaX4LR48V1Sfu4QYOkSihmKHtV9099gIo8XCFTdGuPpXbJINIhBgKsc3E?=
 =?us-ascii?Q?iqJUUeLOtggWw3sTb2BqkdoMf2R6KPa0IGEBbQKWjPBri8h5QXmme5FdS3yy?=
 =?us-ascii?Q?bUV7fLoapbcJAdxVhFDUWkKRnFUUS2aKNFZ8yNZfFoK+tWGfibafYZDGqX0d?=
 =?us-ascii?Q?UUM/qcvwOSKlVOXj/5J4AqqFT6WaLwzGt+1dqRp6MBbemHMEMxxLQruK/v9Z?=
 =?us-ascii?Q?/GE4gLm0+Bm4jB3SyxHYHIIMMAqoFZX7gyZpkoxVcvWLYoecCDgSje0leeMH?=
 =?us-ascii?Q?t/6HxfJGQFHErCVeYspBJ+XO+J5N0RN6UXa3TZiMvA1IEnUMdFt+xdNz5FeM?=
 =?us-ascii?Q?r9w5MxUcrnDyjwV0egNCdRczpdsjZel+2EflFfjYX/IxphBJ4vcR4jgqjKVc?=
 =?us-ascii?Q?ttulMHY04KynIREIEoUVymmCBP1wYx64p0ntAZSeM6dqEmSPPSjnuwTMy5jf?=
 =?us-ascii?Q?tReaUfelUcHXPqHd5KJPlaqJ9DJCm4KXTTfbcK5JNrCrzSwchPm/i861lO96?=
 =?us-ascii?Q?zJwg0O78PvTeDIZ3VwBiPaGdhack8QVWMePGCLNpcoazGkBUUnUqGXnZfsdP?=
 =?us-ascii?Q?KY780eJ88NUkflailm21J9C2DCJrviVMrj/8oXWryGy4/evQ9fnYm6YkRdGT?=
 =?us-ascii?Q?WqFTfmKjNn6FIuXZLTbcCIOwIw7cvJ0OjesbxY1079uYhiYft97eEewpaWYF?=
 =?us-ascii?Q?uWHjSAGRFvlJJxEaoOwkKtTxqujLeNua3Hj/x44rnOQ7U5PMn/ZIDqkXElpZ?=
 =?us-ascii?Q?LCtCriona1BFkDC0e3Cg979IfgvSBw/1Xra78Z0L6C6QbgUpUtva6yUeGbys?=
 =?us-ascii?Q?e8G3CNPu+slbYGmWA0ZKReWTiduIhZ63ngCgtMeswn5fCVMBYrK/0rELd3Ei?=
 =?us-ascii?Q?jGeBpHn90SSGYHwiFUl+pwLfRl/2ilawq66Yp9KnyDHofOTOmffZeWpgZO8G?=
 =?us-ascii?Q?LIbffR0juxbU3k7P59dawMDDcbfmOaNMQphS0iwjmLVBo3bnkLedpqGF0dMi?=
 =?us-ascii?Q?TetcZejdEBwZ2eCUMyapNhrrZDwMnVfPZ9aoQTkDADj8qfxmn8VjtTEEU1sO?=
 =?us-ascii?Q?HTWvfck/yUTCftBNRuGMFELT6CeF8smCw8B6eYqWJIX41TKQJ8D1FZXX5YuA?=
 =?us-ascii?Q?DJNGZtL7Lq05tXKq/s35tg2yOpn2jXzw4AF5TufHQ4C2B6fzxIduru3OFf46?=
 =?us-ascii?Q?/tiMbNPc0c3fAalNvDGdliAXaqBgt825A2+/K9BQubzG8apXGJ/+Rp8ys94x?=
 =?us-ascii?Q?UQKOh3wvOe2dH0MAqda8EVDCG6rcLOuIGDVmZwVKXeYRcGkBJ7uCUO3pWQME?=
 =?us-ascii?Q?9SdaUe2EvjoBt/YsBYyonZEk0LlW6pP4XXkm5jqNHvuv0vhc/5lHXFzxA50k?=
 =?us-ascii?Q?S1bTGCFemBKtx0kaCRR0jrZyjgkutr8ISV8RLvZU0SogqlEtzWSl+AfhSf+b?=
 =?us-ascii?Q?NlxCKqSAGv9Wbne89TQdbuoK2mLe9Bs3KkxIEqION17Ka+y3GpW5hU73dctb?=
 =?us-ascii?Q?eAz+71SqVb97qDB9jaRZli8LkdSZuSDfli7U44HzrvqHYwIRw2vse5IrdVqY?=
 =?us-ascii?Q?+Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zozRoDSw6jgSbRB3XYKSYgSgWWucBWmZNpHB0rozpEaKT03X39SBAbM2Py9x?=
 =?us-ascii?Q?mQroS2O023xvg3ARnP7xwbg1XCsjl0G9eisBq+Cj4gFPZ5RxuZKdPYA5gzcF?=
 =?us-ascii?Q?mJZ/Y54JRo/LjNF5/XTxr5Qyh/9d1aXhthYp62JOCpMrtMbYRkt74dzF3/sd?=
 =?us-ascii?Q?5kNg/fv4l9oNUohjTpFGujv2wx53wZ9Gt+DfY90vaodWd1fba1sqWRK+Wa+p?=
 =?us-ascii?Q?7s+NKQZRs3+tKOuhq4+NPaCxpw2HZ66P9XQTCB0aoLfyf1fI7PLD1hYURX+Z?=
 =?us-ascii?Q?a2Pvvq2ujTF3o+T7wgIgP90cHZniUrJS9JgpLJA2O5pVEYt6PONQmnV+PToe?=
 =?us-ascii?Q?yHKy4y5FsQv+Kik7qkjdCRy9TxWrJsdWewPMXEpgjZsue1yGKebT7rO4nvDX?=
 =?us-ascii?Q?pCexkeFjBJgeIq9AGKv/xKuNbZjdzTHvuAKgpymmxd2Q20hQ8fJozu9mT5m7?=
 =?us-ascii?Q?q8JR4wZWGcMziW2qGFcZ1RCZxX74AT2BUrHljtEWXXL6CUBTvVTQ6CTPoHti?=
 =?us-ascii?Q?3TCQQw4PKzWjDLnUtolGw5hDQEswAnnBWRBrPzawc9k04RQBFMOZv+7tw5D5?=
 =?us-ascii?Q?fEkmWmTM/FXqetaOF/VygiFZWLRB0Mts5M8euI2eSpE3jjyv5ADuNf9qFjWj?=
 =?us-ascii?Q?nDbJnwQF8YXOKpBUrj9D/lhueumgHsvT+twycz5wTvhlcoBCM7NWdYxQmI/T?=
 =?us-ascii?Q?U47MB/vAJ8HrR9H3ZhFH7nsgn5sUV/X2hP6peXuIsex+D0Gzo2Cx39ZnHCW7?=
 =?us-ascii?Q?2ykFIrnl7tdtUscAsMmSu4X/dWzFm721KU2prW0l+UfmqeOr9i2DBpSFvZdJ?=
 =?us-ascii?Q?/GfZPxMwqoYjTCSBUn4wjgi+36pzUqNnen31XJr7a7i7rbj68biEE38ThosU?=
 =?us-ascii?Q?Pr9OpcODZF7/Bx9ylRuPzodqGtsnzurMO8L0tCQd0dXPxMHoJorsuZaqeBXW?=
 =?us-ascii?Q?xJ9RDXXo2FqdCZfUhC1JOE/RPikBifVhRvl4V4F8YXeDnLMQiQBJ2iE0FZmV?=
 =?us-ascii?Q?ySkvZfrEQ9kyAE/aZGAIz26eJ+2FUpOg4pJfNpsn+pZK45eHq8q91tXg44EX?=
 =?us-ascii?Q?Xchvxo7Kh0QEkrPve9LYGVLKrJxVcPpWzfpEJH462unRP/F0xdJUb/qHP4Bv?=
 =?us-ascii?Q?gLWQEmy5jwCS9fVg9Rgfhped4CowjH6r0hNX83BvU4stloB1ASOSXculYI1a?=
 =?us-ascii?Q?kpxLlYW+2UNW9CWjLgv2tfIUALCYsxLpJvLA+SxagahwH8AJUpHahE0JpovK?=
 =?us-ascii?Q?Z6rnvdIT/gJeaWVtL7mrKouTL6pI4FvvTvgGalKcyi2oFQ8yhGWWIaY4Bn3q?=
 =?us-ascii?Q?AKH+lLougVZqXNi+n+JC5nJDHDDDWUjKCA6tBkXQ74bj6eyEOu8NpsUQqh4n?=
 =?us-ascii?Q?IEqNl32a3c8VQ8FYyD+bKOu42pELRDqx3QsMjJOlDfzo1NoZH3t/Cl3U/KOk?=
 =?us-ascii?Q?8ey9+Ady51eaE8cReb9RQp7QuiWzjo/LJ83lKggnVLq0IJoUlwWwYX7tV5CF?=
 =?us-ascii?Q?q4C4NfxiWZmMFLakSl6PDPG/f7evZbfyHYRpC20lWlKuCwHsMKdw55lWU40s?=
 =?us-ascii?Q?xydiwzT7qDld48X/+TYoMMaGbdnaN3cSaFoNSkqPoK2sEfSkwJPa5Gc22Quy?=
 =?us-ascii?Q?v145uyVZ56NXwsRar4S+q/Hsf3SjvLrbw+0vsqLBBtKB8CVrntPqzz1m2j+d?=
 =?us-ascii?Q?G11RneppwVbJbvNDqKxDQalbMuficAoaKBFeoT4lT7OgbVk8jOzUKIS8Pryy?=
 =?us-ascii?Q?FehkI5+Zlw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df42a31c-1aff-4dab-8b11-08de6f301bf2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 20:55:55.3255 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nxf79WA74PrPZT1RiWYHiG8DgoCj6kdrTE8PQb5Xm4uSCfVYxdr8pX11cVhosOvJm1Aj8excr8EJLM1qIA3vvQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7611
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.81 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[vger.kernel.org,kernel.org,garyguo.net,protonmail.com,google.com,umich.edu];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[18];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,Nvidia.com:dkim]
X-Rspamd-Queue-Id: CBD55159A30
X-Rspamd-Action: no action

Add safe Rust abstractions over the Linux kernel's GPU buddy
allocator for physical memory management. The GPU buddy allocator
implements a binary buddy system useful for GPU physical memory
allocation. nova-core will use it for physical memory allocation.

Cc: Nikola Djukic <ndjukic@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 rust/bindings/bindings_helper.h |  11 +
 rust/helpers/gpu.c              |  23 ++
 rust/helpers/helpers.c          |   1 +
 rust/kernel/gpu/buddy.rs        | 537 ++++++++++++++++++++++++++++++++
 rust/kernel/gpu/mod.rs          |   5 +
 rust/kernel/lib.rs              |   2 +
 6 files changed, 579 insertions(+)
 create mode 100644 rust/helpers/gpu.c
 create mode 100644 rust/kernel/gpu/buddy.rs
 create mode 100644 rust/kernel/gpu/mod.rs

diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
index 083cc44aa952..dbb765a9fdbd 100644
--- a/rust/bindings/bindings_helper.h
+++ b/rust/bindings/bindings_helper.h
@@ -29,6 +29,7 @@
 #include <linux/hrtimer_types.h>
 
 #include <linux/acpi.h>
+#include <linux/gpu_buddy.h>
 #include <drm/drm_device.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_file.h>
@@ -146,6 +147,16 @@ const vm_flags_t RUST_CONST_HELPER_VM_MIXEDMAP = VM_MIXEDMAP;
 const vm_flags_t RUST_CONST_HELPER_VM_HUGEPAGE = VM_HUGEPAGE;
 const vm_flags_t RUST_CONST_HELPER_VM_NOHUGEPAGE = VM_NOHUGEPAGE;
 
+#if IS_ENABLED(CONFIG_GPU_BUDDY)
+const unsigned long RUST_CONST_HELPER_GPU_BUDDY_RANGE_ALLOCATION = GPU_BUDDY_RANGE_ALLOCATION;
+const unsigned long RUST_CONST_HELPER_GPU_BUDDY_TOPDOWN_ALLOCATION = GPU_BUDDY_TOPDOWN_ALLOCATION;
+const unsigned long RUST_CONST_HELPER_GPU_BUDDY_CONTIGUOUS_ALLOCATION =
+								GPU_BUDDY_CONTIGUOUS_ALLOCATION;
+const unsigned long RUST_CONST_HELPER_GPU_BUDDY_CLEAR_ALLOCATION = GPU_BUDDY_CLEAR_ALLOCATION;
+const unsigned long RUST_CONST_HELPER_GPU_BUDDY_CLEARED = GPU_BUDDY_CLEARED;
+const unsigned long RUST_CONST_HELPER_GPU_BUDDY_TRIM_DISABLE = GPU_BUDDY_TRIM_DISABLE;
+#endif
+
 #if IS_ENABLED(CONFIG_ANDROID_BINDER_IPC_RUST)
 #include "../../drivers/android/binder/rust_binder.h"
 #include "../../drivers/android/binder/rust_binder_events.h"
diff --git a/rust/helpers/gpu.c b/rust/helpers/gpu.c
new file mode 100644
index 000000000000..38b1a4e6bef8
--- /dev/null
+++ b/rust/helpers/gpu.c
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0
+
+#include <linux/gpu_buddy.h>
+
+#ifdef CONFIG_GPU_BUDDY
+
+__rust_helper u64 rust_helper_gpu_buddy_block_offset(const struct gpu_buddy_block *block)
+{
+	return gpu_buddy_block_offset(block);
+}
+
+__rust_helper unsigned int rust_helper_gpu_buddy_block_order(struct gpu_buddy_block *block)
+{
+	return gpu_buddy_block_order(block);
+}
+
+__rust_helper u64 rust_helper_gpu_buddy_block_size(struct gpu_buddy *mm,
+						   struct gpu_buddy_block *block)
+{
+	return gpu_buddy_block_size(mm, block);
+}
+
+#endif /* CONFIG_GPU_BUDDY */
diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
index 724fcb8240ac..a53929ce52a3 100644
--- a/rust/helpers/helpers.c
+++ b/rust/helpers/helpers.c
@@ -32,6 +32,7 @@
 #include "err.c"
 #include "irq.c"
 #include "fs.c"
+#include "gpu.c"
 #include "io.c"
 #include "jump_label.c"
 #include "kunit.c"
diff --git a/rust/kernel/gpu/buddy.rs b/rust/kernel/gpu/buddy.rs
new file mode 100644
index 000000000000..5df7a2199671
--- /dev/null
+++ b/rust/kernel/gpu/buddy.rs
@@ -0,0 +1,537 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! GPU buddy allocator bindings.
+//!
+//! C header: [`include/linux/gpu_buddy.h`](srctree/include/linux/gpu_buddy.h)
+//!
+//! This module provides Rust abstractions over the Linux kernel's GPU buddy
+//! allocator, which implements a binary buddy memory allocator.
+//!
+//! The buddy allocator manages a contiguous address space and allocates blocks
+//! in power-of-two sizes, useful for GPU physical memory management.
+//!
+//! # Examples
+//!
+//! ```
+//! use kernel::{
+//!     gpu::buddy::{BuddyFlags, GpuBuddy, GpuBuddyAllocParams, GpuBuddyParams},
+//!     prelude::*,
+//!     sizes::*, //
+//! };
+//!
+//! // Create a 1GB buddy allocator with 4KB minimum chunk size.
+//! let buddy = GpuBuddy::new(GpuBuddyParams {
+//!     base_offset_bytes: 0,
+//!     physical_memory_size_bytes: SZ_1G as u64,
+//!     chunk_size_bytes: SZ_4K as u64,
+//! })?;
+//!
+//! // Verify initial state.
+//! assert_eq!(buddy.size(), SZ_1G as u64);
+//! assert_eq!(buddy.chunk_size(), SZ_4K as u64);
+//! let initial_free = buddy.free_memory_bytes();
+//!
+//! // Base allocation params - mutated between calls for field overrides.
+//! let mut params = GpuBuddyAllocParams {
+//!     start_range_address: 0,
+//!     end_range_address: 0,   // Entire range.
+//!     size_bytes: SZ_16M as u64,
+//!     min_block_size_bytes: SZ_16M as u64,
+//!     buddy_flags: BuddyFlags::try_new(BuddyFlags::RANGE_ALLOCATION)?,
+//! };
+//!
+//! // Test top-down allocation (allocates from highest addresses).
+//! params.buddy_flags = BuddyFlags::try_new(BuddyFlags::TOPDOWN_ALLOCATION)?;
+//! let topdown = KBox::pin_init(buddy.alloc_blocks(&params), GFP_KERNEL)?;
+//! assert_eq!(buddy.free_memory_bytes(), initial_free - SZ_16M as u64);
+//!
+//! for block in topdown.iter() {
+//!     assert_eq!(block.offset(), (SZ_1G - SZ_16M) as u64);
+//!     assert_eq!(block.order(), 12); // 2^12 pages
+//!     assert_eq!(block.size(), SZ_16M as u64);
+//! }
+//! drop(topdown);
+//! assert_eq!(buddy.free_memory_bytes(), initial_free);
+//!
+//! // Allocate 16MB - should result in a single 16MB block at offset 0.
+//! params.buddy_flags = BuddyFlags::try_new(BuddyFlags::RANGE_ALLOCATION)?;
+//! let allocated = KBox::pin_init(buddy.alloc_blocks(&params), GFP_KERNEL)?;
+//! assert_eq!(buddy.free_memory_bytes(), initial_free - SZ_16M as u64);
+//!
+//! for block in allocated.iter() {
+//!     assert_eq!(block.offset(), 0);
+//!     assert_eq!(block.order(), 12); // 2^12 pages
+//!     assert_eq!(block.size(), SZ_16M as u64);
+//! }
+//! drop(allocated);
+//! assert_eq!(buddy.free_memory_bytes(), initial_free);
+//!
+//! // Test non-contiguous allocation with fragmented memory.
+//! // Create fragmentation by allocating 4MB blocks at [0,4M) and [8M,12M).
+//! params.end_range_address = SZ_4M as u64;
+//! params.size_bytes = SZ_4M as u64;
+//! params.min_block_size_bytes = SZ_4M as u64;
+//! let frag1 = KBox::pin_init(buddy.alloc_blocks(&params), GFP_KERNEL)?;
+//! assert_eq!(buddy.free_memory_bytes(), initial_free - SZ_4M as u64);
+//!
+//! params.start_range_address = SZ_8M as u64;
+//! params.end_range_address = (SZ_8M + SZ_4M) as u64;
+//! let frag2 = KBox::pin_init(buddy.alloc_blocks(&params), GFP_KERNEL)?;
+//! assert_eq!(buddy.free_memory_bytes(), initial_free - SZ_8M as u64);
+//!
+//! // Allocate 8MB without CONTIGUOUS - should return 2 blocks from the holes.
+//! params.start_range_address = 0;
+//! params.end_range_address = SZ_16M as u64;
+//! params.size_bytes = SZ_8M as u64;
+//! let fragmented = KBox::pin_init(buddy.alloc_blocks(&params), GFP_KERNEL)?;
+//! assert_eq!(buddy.free_memory_bytes(), initial_free - (SZ_16M) as u64);
+//!
+//! let (mut count, mut total) = (0u32, 0u64);
+//! for block in fragmented.iter() {
+//!     // The 8MB allocation should return 2 blocks, each 4MB.
+//!     assert_eq!(block.size(), SZ_4M as u64);
+//!     total += block.size();
+//!     count += 1;
+//! }
+//! assert_eq!(total, SZ_8M as u64);
+//! assert_eq!(count, 2);
+//! drop(fragmented);
+//! drop(frag2);
+//! drop(frag1);
+//! assert_eq!(buddy.free_memory_bytes(), initial_free);
+//!
+//! // Test CONTIGUOUS failure when only fragmented space available.
+//! // Create a small buddy allocator with only 16MB of memory.
+//! let small = GpuBuddy::new(GpuBuddyParams {
+//!     base_offset_bytes: 0,
+//!     physical_memory_size_bytes: SZ_16M as u64,
+//!     chunk_size_bytes: SZ_4K as u64,
+//! })?;
+//!
+//! // Allocate 4MB blocks at [0,4M) and [8M,12M) to create fragmented memory.
+//! params.start_range_address = 0;
+//! params.end_range_address = SZ_4M as u64;
+//! params.size_bytes = SZ_4M as u64;
+//! let hole1 = KBox::pin_init(small.alloc_blocks(&params), GFP_KERNEL)?;
+//!
+//! params.start_range_address = SZ_8M as u64;
+//! params.end_range_address = (SZ_8M + SZ_4M) as u64;
+//! let hole2 = KBox::pin_init(small.alloc_blocks(&params), GFP_KERNEL)?;
+//!
+//! // 8MB contiguous should fail - only two non-contiguous 4MB holes exist.
+//! params.start_range_address = 0;
+//! params.end_range_address = 0;
+//! params.size_bytes = SZ_8M as u64;
+//! params.buddy_flags = BuddyFlags::try_new(BuddyFlags::CONTIGUOUS_ALLOCATION)?;
+//! let result = KBox::pin_init(small.alloc_blocks(&params), GFP_KERNEL);
+//! assert!(result.is_err());
+//! drop(hole2);
+//! drop(hole1);
+//!
+//! # Ok::<(), Error>(())
+//! ```
+
+use crate::{
+    bindings,
+    clist_create,
+    error::to_result,
+    ffi::clist::CListHead,
+    new_mutex,
+    prelude::*,
+    sync::{
+        lock::mutex::MutexGuard,
+        Arc,
+        Mutex, //
+    },
+    types::Opaque,
+};
+
+/// Flags for GPU buddy allocator operations.
+///
+/// These flags control the allocation behavior of the buddy allocator.
+#[derive(Clone, Copy, Default, PartialEq, Eq)]
+pub struct BuddyFlags(usize);
+
+impl BuddyFlags {
+    /// Range-based allocation from start to end addresses.
+    pub const RANGE_ALLOCATION: usize = bindings::GPU_BUDDY_RANGE_ALLOCATION;
+
+    /// Allocate from top of address space downward.
+    pub const TOPDOWN_ALLOCATION: usize = bindings::GPU_BUDDY_TOPDOWN_ALLOCATION;
+
+    /// Allocate physically contiguous blocks.
+    pub const CONTIGUOUS_ALLOCATION: usize = bindings::GPU_BUDDY_CONTIGUOUS_ALLOCATION;
+
+    /// Request allocation from the cleared (zeroed) memory. The zero'ing is not
+    /// done by the allocator, but by the caller before freeing old blocks.
+    pub const CLEAR_ALLOCATION: usize = bindings::GPU_BUDDY_CLEAR_ALLOCATION;
+
+    /// Disable trimming of partially used blocks.
+    pub const TRIM_DISABLE: usize = bindings::GPU_BUDDY_TRIM_DISABLE;
+
+    /// Mark blocks as cleared (zeroed) when freeing. When set during free,
+    /// indicates that the caller has already zeroed the memory.
+    pub const CLEARED: usize = bindings::GPU_BUDDY_CLEARED;
+
+    /// Create [`BuddyFlags`] from a raw value with validation.
+    ///
+    /// Use `|` operator to combine flags if needed, before calling this method.
+    pub fn try_new(flags: usize) -> Result<Self> {
+        // Flags must not exceed u32::MAX to satisfy the GPU buddy allocator C API.
+        if flags > u32::MAX as usize {
+            return Err(EINVAL);
+        }
+
+        // `TOPDOWN_ALLOCATION` only works without `RANGE_ALLOCATION`. When both are
+        // set, `TOPDOWN_ALLOCATION` is silently ignored by the allocator. Reject this.
+        if (flags & Self::RANGE_ALLOCATION) != 0 && (flags & Self::TOPDOWN_ALLOCATION) != 0 {
+            return Err(EINVAL);
+        }
+
+        Ok(Self(flags))
+    }
+
+    /// Get raw value of the flags.
+    pub(crate) fn as_raw(self) -> usize {
+        self.0
+    }
+}
+
+/// Parameters for creating a GPU buddy allocator.
+pub struct GpuBuddyParams {
+    /// Base offset in bytes where the managed memory region starts.
+    /// Allocations will be offset by this value.
+    pub base_offset_bytes: u64,
+    /// Total physical memory size managed by the allocator in bytes.
+    pub physical_memory_size_bytes: u64,
+    /// Minimum allocation unit / chunk size in bytes, must be >= 4KB.
+    pub chunk_size_bytes: u64,
+}
+
+/// Parameters for allocating blocks from a GPU buddy allocator.
+pub struct GpuBuddyAllocParams {
+    /// Start of allocation range in bytes. Use 0 for beginning.
+    pub start_range_address: u64,
+    /// End of allocation range in bytes. Use 0 for entire range.
+    pub end_range_address: u64,
+    /// Total size to allocate in bytes.
+    pub size_bytes: u64,
+    /// Minimum block size for fragmented allocations in bytes.
+    pub min_block_size_bytes: u64,
+    /// Buddy allocator behavior flags.
+    pub buddy_flags: BuddyFlags,
+}
+
+/// Inner structure holding the actual buddy allocator.
+///
+/// # Synchronization
+///
+/// The C `gpu_buddy` API requires synchronization (see `include/linux/gpu_buddy.h`).
+/// The internal [`GpuBuddyGuard`] ensures that the lock is held for all
+/// allocator and free operations, preventing races between concurrent allocations
+/// and the freeing that occurs when [`AllocatedBlocks`] is dropped.
+///
+/// # Invariants
+///
+/// The inner [`Opaque`] contains a valid, initialized buddy allocator.
+#[pin_data(PinnedDrop)]
+struct GpuBuddyInner {
+    #[pin]
+    inner: Opaque<bindings::gpu_buddy>,
+    // TODO: Replace `Mutex<()>` with `Mutex<Opaque<..>>` once `Mutex::new()`
+    // accepts `impl PinInit<T>`.
+    #[pin]
+    lock: Mutex<()>,
+    /// Base offset for all allocations (does not change after init).
+    base_offset: u64,
+    /// Cached chunk size (does not change after init).
+    chunk_size: u64,
+    /// Cached total size (does not change after init).
+    size: u64,
+}
+
+impl GpuBuddyInner {
+    /// Create a pin-initializer for the buddy allocator.
+    fn new(params: GpuBuddyParams) -> impl PinInit<Self, Error> {
+        let base_offset = params.base_offset_bytes;
+        let size = params.physical_memory_size_bytes;
+        let chunk_size = params.chunk_size_bytes;
+
+        try_pin_init!(Self {
+            inner <- Opaque::try_ffi_init(|ptr| {
+                // SAFETY: ptr points to valid uninitialized memory from the pin-init
+                // infrastructure. gpu_buddy_init will initialize the structure.
+                to_result(unsafe { bindings::gpu_buddy_init(ptr, size, chunk_size) })
+            }),
+            lock <- new_mutex!(()),
+            base_offset: base_offset,
+            chunk_size: chunk_size,
+            size: size,
+        })
+    }
+
+    /// Lock the mutex and return a guard for accessing the allocator.
+    fn lock(&self) -> GpuBuddyGuard<'_> {
+        GpuBuddyGuard {
+            inner: self,
+            _guard: self.lock.lock(),
+        }
+    }
+}
+
+#[pinned_drop]
+impl PinnedDrop for GpuBuddyInner {
+    fn drop(self: Pin<&mut Self>) {
+        let guard = self.lock();
+
+        // SAFETY: guard provides exclusive access to the allocator.
+        unsafe {
+            bindings::gpu_buddy_fini(guard.as_raw());
+        }
+    }
+}
+
+// SAFETY: [`GpuBuddyInner`] can be sent between threads.
+unsafe impl Send for GpuBuddyInner {}
+
+// SAFETY: [`GpuBuddyInner`] is `Sync` because the internal [`GpuBuddyGuard`]
+// serializes all access to the C allocator, preventing data races.
+unsafe impl Sync for GpuBuddyInner {}
+
+/// Guard that proves the lock is held, enabling access to the allocator.
+///
+/// # Invariants
+///
+/// The inner `_guard` holds the lock for the duration of this guard's lifetime.
+pub(crate) struct GpuBuddyGuard<'a> {
+    inner: &'a GpuBuddyInner,
+    _guard: MutexGuard<'a, ()>,
+}
+
+impl GpuBuddyGuard<'_> {
+    /// Get a raw pointer to the underlying C `gpu_buddy` structure.
+    fn as_raw(&self) -> *mut bindings::gpu_buddy {
+        self.inner.inner.get()
+    }
+}
+
+/// GPU buddy allocator instance.
+///
+/// This structure wraps the C `gpu_buddy` allocator using reference counting.
+/// The allocator is automatically cleaned up when all references are dropped.
+///
+/// # Invariants
+///
+/// The inner [`Arc`] points to a valid, initialized GPU buddy allocator.
+pub struct GpuBuddy(Arc<GpuBuddyInner>);
+
+impl GpuBuddy {
+    /// Create a new buddy allocator.
+    ///
+    /// Creates a buddy allocator that manages a contiguous address space of the given
+    /// size, with the specified minimum allocation unit (chunk_size must be at least 4KB).
+    pub fn new(params: GpuBuddyParams) -> Result<Self> {
+        Ok(Self(Arc::pin_init(GpuBuddyInner::new(params), GFP_KERNEL)?))
+    }
+
+    /// Get the base offset for allocations.
+    pub fn base_offset(&self) -> u64 {
+        self.0.base_offset
+    }
+
+    /// Get the chunk size (minimum allocation unit).
+    pub fn chunk_size(&self) -> u64 {
+        self.0.chunk_size
+    }
+
+    /// Get the total managed size.
+    pub fn size(&self) -> u64 {
+        self.0.size
+    }
+
+    /// Get the available (free) memory in bytes.
+    pub fn free_memory_bytes(&self) -> u64 {
+        let guard = self.0.lock();
+        // SAFETY: guard provides exclusive access to the allocator.
+        unsafe { (*guard.as_raw()).avail }
+    }
+
+    /// Allocate blocks from the buddy allocator.
+    ///
+    /// Returns a pin-initializer for [`AllocatedBlocks`].
+    ///
+    /// Takes `&self` instead of `&mut self` because the internal [`Mutex`] provides
+    /// synchronization - no external `&mut` exclusivity needed.
+    pub fn alloc_blocks(
+        &self,
+        params: &GpuBuddyAllocParams,
+    ) -> impl PinInit<AllocatedBlocks, Error> {
+        let buddy_arc = Arc::clone(&self.0);
+        let start = params.start_range_address;
+        let end = params.end_range_address;
+        let size = params.size_bytes;
+        let min_block_size = params.min_block_size_bytes;
+        let flags = params.buddy_flags;
+
+        // Create pin-initializer that initializes list and allocates blocks.
+        try_pin_init!(AllocatedBlocks {
+            buddy: buddy_arc,
+            list <- CListHead::new(),
+            flags: flags,
+            _: {
+                // Lock while allocating to serialize with concurrent frees.
+                let guard = buddy.lock();
+
+                // SAFETY: `guard` provides exclusive access to the buddy allocator.
+                to_result(unsafe {
+                    bindings::gpu_buddy_alloc_blocks(
+                        guard.as_raw(),
+                        start,
+                        end,
+                        size,
+                        min_block_size,
+                        list.as_raw(),
+                        flags.as_raw(),
+                    )
+                })?
+            }
+        })
+    }
+}
+
+/// Allocated blocks from the buddy allocator with automatic cleanup.
+///
+/// This structure owns a list of allocated blocks and ensures they are
+/// automatically freed when dropped. Use `iter()` to iterate over all
+/// allocated [`Block`] structures.
+///
+/// # Invariants
+///
+/// - `list` is an initialized, valid list head containing allocated blocks.
+/// - `buddy` references a valid [`GpuBuddyInner`].
+#[pin_data(PinnedDrop)]
+pub struct AllocatedBlocks {
+    #[pin]
+    list: CListHead,
+    buddy: Arc<GpuBuddyInner>,
+    flags: BuddyFlags,
+}
+
+impl AllocatedBlocks {
+    /// Check if the block list is empty.
+    pub fn is_empty(&self) -> bool {
+        // An empty list head points to itself.
+        !self.list.is_linked()
+    }
+
+    /// Iterate over allocated blocks.
+    ///
+    /// Returns an iterator yielding [`AllocatedBlock`] values. Each [`AllocatedBlock`]
+    /// borrows `self` and is only valid for the duration of that borrow.
+    pub fn iter(&self) -> impl Iterator<Item = AllocatedBlock<'_>> + '_ {
+        // SAFETY: list contains gpu_buddy_block items linked via __bindgen_anon_1.link.
+        let clist = unsafe {
+            clist_create!(
+                self.list.as_raw(),
+                Block,
+                bindings::gpu_buddy_block,
+                __bindgen_anon_1.link
+            )
+        };
+
+        clist
+            .iter()
+            .map(|block| AllocatedBlock { block, alloc: self })
+    }
+}
+
+#[pinned_drop]
+impl PinnedDrop for AllocatedBlocks {
+    fn drop(self: Pin<&mut Self>) {
+        let guard = self.buddy.lock();
+
+        // SAFETY:
+        // - list is valid per the type's invariants.
+        // - guard provides exclusive access to the allocator.
+        // CAST: BuddyFlags were validated to fit in u32 at construction.
+        unsafe {
+            bindings::gpu_buddy_free_list(
+                guard.as_raw(),
+                self.list.as_raw(),
+                self.flags.as_raw() as u32,
+            );
+        }
+    }
+}
+
+/// A GPU buddy block.
+///
+/// Transparent wrapper over C `gpu_buddy_block` structure. This type is returned
+/// as references from [`CListIter`] during iteration over [`AllocatedBlocks`].
+///
+/// # Invariants
+///
+/// The inner [`Opaque`] contains a valid, allocated `gpu_buddy_block`.
+#[repr(transparent)]
+pub struct Block(Opaque<bindings::gpu_buddy_block>);
+
+impl Block {
+    /// Get a raw pointer to the underlying C block.
+    fn as_raw(&self) -> *mut bindings::gpu_buddy_block {
+        self.0.get()
+    }
+
+    /// Get the block's offset in the address space.
+    pub(crate) fn offset(&self) -> u64 {
+        // SAFETY: self.as_raw() is valid per the type's invariants.
+        unsafe { bindings::gpu_buddy_block_offset(self.as_raw()) }
+    }
+
+    /// Get the block order.
+    pub(crate) fn order(&self) -> u32 {
+        // SAFETY: self.as_raw() is valid per the type's invariants.
+        unsafe { bindings::gpu_buddy_block_order(self.as_raw()) }
+    }
+}
+
+// SAFETY: `Block` is is not modified after allocation for the lifetime
+// of `AllocatedBlock`.
+unsafe impl Send for Block {}
+
+// SAFETY: `Block` is is not modified after allocation for the lifetime
+// of `AllocatedBlock`.
+unsafe impl Sync for Block {}
+
+/// An allocated block with access to the GPU buddy allocator.
+///
+/// It is returned by [`AllocatedBlocks::iter()`] and provides access to the
+/// GPU buddy allocator required for some accessors.
+///
+/// # Invariants
+///
+/// - `block` is a valid reference to an allocated [`Block`].
+/// - `alloc` is a valid reference to the [`AllocatedBlocks`] that owns this block.
+pub struct AllocatedBlock<'a> {
+    block: &'a Block,
+    alloc: &'a AllocatedBlocks,
+}
+
+impl AllocatedBlock<'_> {
+    /// Get the block's offset in the address space.
+    ///
+    /// Returns the absolute offset including the allocator's base offset.
+    /// This is the actual address to use for accessing the allocated memory.
+    pub fn offset(&self) -> u64 {
+        self.alloc.buddy.base_offset + self.block.offset()
+    }
+
+    /// Get the block order (size = chunk_size << order).
+    pub fn order(&self) -> u32 {
+        self.block.order()
+    }
+
+    /// Get the block's size in bytes.
+    pub fn size(&self) -> u64 {
+        self.alloc.buddy.chunk_size << self.block.order()
+    }
+}
diff --git a/rust/kernel/gpu/mod.rs b/rust/kernel/gpu/mod.rs
new file mode 100644
index 000000000000..8f25e6367edc
--- /dev/null
+++ b/rust/kernel/gpu/mod.rs
@@ -0,0 +1,5 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! GPU subsystem abstractions.
+
+pub mod buddy;
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 0a77b4c0ffeb..1cd6feff4f02 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -96,6 +96,8 @@
 pub mod firmware;
 pub mod fmt;
 pub mod fs;
+#[cfg(CONFIG_GPU_BUDDY)]
+pub mod gpu;
 #[cfg(CONFIG_I2C = "y")]
 pub mod i2c;
 pub mod id_pool;
-- 
2.34.1

