Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wH6GCOpUimlvJgAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 22:43:06 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9DF114E1F
	for <lists+dri-devel@lfdr.de>; Mon, 09 Feb 2026 22:43:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C2BB10E47E;
	Mon,  9 Feb 2026 21:43:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="TuA4yLrW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012063.outbound.protection.outlook.com [52.101.53.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D777B10E383;
 Mon,  9 Feb 2026 21:42:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d3YC765H5WqgBS50vRKTE/uc9k9H1znUGMGkxW3SnQ0EuOa+34Mz0hUbuLEL6cTDCMbhXxZwYTuiDkhYx39edaA8A4XQiZGFryz2jYBjohg7saggpwwjn4gYvHb0o/kVimoqxB01gLKGsKDvZr5CFwUcmYWa8gOyBxnaOAlq8j0KDLcW8hnpMaftU8CVprKPqGCw2Cfnugod6ZN/n7SWv7iBfhbbKcewfB992FF8DJWnQTcKH13yIsTLeefaEClwheYOD6OtsWXMtvrk29CNmxmYs7fYz4wgZGfnBnWMxiak03Z4v5rf2hvaN3qLrohiDbaxUCmSx12u6da1nWr6zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UeSLBx5HG5IIZ64btf3v6IyHy3qTPtChaKYpG0W8cSM=;
 b=epDAlJglGpbgtP8t3GcQId048N8FBI00hREzbZZ8OYtgccDMDUYo+/tQloavKXwPepabosZwF83cpVT5xaGopyTBxHEiMDu4NwgzKeciozElHYX9XLRO1T7E3bJb9R2HzcWe0dkYouUA0hPjqIBOVj7Dk6fSmp0Foqo1IdoWnT6bF+sRp0OU3cOK3dUC0mdA+STas+B0sQL0QKlq6QnLTkI1p0pJKVqrK5o+sge/V2eV1V0LCameJP4ULMgvSjjLJyT90PKHNPUHKKtGirEMIkHBoQUO9rGvJL1Alo4YezxYyG4VOwp9xfpWWZlZjxJf9am3t3RPSV6KgTmhSx2svw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UeSLBx5HG5IIZ64btf3v6IyHy3qTPtChaKYpG0W8cSM=;
 b=TuA4yLrWPIe/Tb9yBvc/V+Sl53AZleWeQ2pbu9+EdzgLgU2xu3rxHf4wNe8aZM4K0Y1T7oF87POp3OdzWMwMcoNMgfu36p6s0M/4fQzEYvZ02KnbM59f3OLTx0gRUXRHMt/wrwOscWOAnXeul+1tUstbPXrr+AQ73+kK/vaWrApLGPnijX6pSCjZlyhbBs+05TxIWVPwLOVqHL70iWL5C2J8UA1jKNHhtz8bPBMSVlQCHmywKaJSTdlikZqx+B6+DaAGZnC7jcNZRkO44iHC9FAgu34o/bxGdAuY0Dv8warkb+kledhKDKoWElh2ntJtq5eAZL9r6ziIt/BFmi0puQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SA1PR12MB8948.namprd12.prod.outlook.com (2603:10b6:806:38e::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.18; Mon, 9 Feb 2026 21:42:53 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9587.017; Mon, 9 Feb 2026
 21:42:53 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Andrea Righi <arighi@nvidia.com>, Andy Ritger <aritger@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Balbir Singh <balbirs@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH -next v8 0/3] rust: Add CList and GPU buddy allocator bindings
Date: Mon,  9 Feb 2026 16:42:43 -0500
Message-Id: <20260209214246.2783990-1-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR01CA0053.prod.exchangelabs.com (2603:10b6:208:23f::22)
 To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SA1PR12MB8948:EE_
X-MS-Office365-Filtering-Correlation-Id: b5dc039e-b849-4b85-3869-08de68242dfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1ftLYy4lW4JIq1K4HnhQPTfjBf38bqjOEmNFn2WcLrTudKoMbNCnHoW72q2k?=
 =?us-ascii?Q?gcBfTMzHy4E0GLPbkhiOJK0yzrKrT0WCmYaP7Yy1a/uOBKpov0I/Oc6/GLLJ?=
 =?us-ascii?Q?4irrjBREZ7UGsgpqO0gbrLX12AXT7LsvMBgW6726WrTaZG5Y0v1Ph7Liv3Fj?=
 =?us-ascii?Q?ufUm2ZL+TDBuc8ds3eidPg88groLVIIKi/I/qHDChd5SMrGn0af86GRtQx8u?=
 =?us-ascii?Q?uZaS0525dU9MnRgaWqjue67d2y6XIBc8czdcg/O51zE7bjZmDDrUg9+rzkZ8?=
 =?us-ascii?Q?zfiHX6Qe6ehEkZ02kOvMvXWJckh+/bq+tM9TCLzAZdRy4JB4HwwsXLAbq7/s?=
 =?us-ascii?Q?PRJ+vScSaw4VwZ+8oD4vlWBjFyVpH2T6mAXJI/JgZvNL91WvVlB9QaV5OoFR?=
 =?us-ascii?Q?xXW8C0P+T8ikK70iZ1BImfWXa0WrF4lkrbzmD8VUYVFWi/FpFyLJy0ad/d3n?=
 =?us-ascii?Q?vnPGK5hLb7Bp8G/pXUNQvEcdrX8TSefI+5fEiKQYC+sTB0jMLVsQ7Cw5tBc7?=
 =?us-ascii?Q?yrkKjxwkZ3PlYlCKY+tsU2FLZjOMG943fPEcnYceA9UqghRrVZTn2wO4xxfH?=
 =?us-ascii?Q?qxBTGyLwMOFRtVnMZn3FIXYX8cRIcwpZgMbdkKL1e+YcUY+JwQT1BFE+ouxK?=
 =?us-ascii?Q?7+buxZl1hatJo/tdDtB8UOV6lli3lqaI5Z4lH3DCbvhfrZPcx7WKuVdsa6v8?=
 =?us-ascii?Q?5fIwhZkOAPk8e/iOr8bS8mR3LmSGlGOOLvsjZjpfb+3NGKbhqj5wrK76mmG2?=
 =?us-ascii?Q?fHiAR2pA6wM0sPm7t6N25CMqBl+XQSc+SEu8PHng2LRX+61Cz94wCmnym9v4?=
 =?us-ascii?Q?z56E+lA0o8H9Byxh2YIBtrtlEwKkG0SNfYRrV7p2pzy7zz9EZH+ZyfJ7cqtw?=
 =?us-ascii?Q?PAQTCze0rb6TZrKmZboSoUHls9FtSoVK+3a8QJ/gD++/fkZbo+C1NSgUGdBd?=
 =?us-ascii?Q?SQ1er0QOin5WirCHvWsD+ulECE7Cus9gL63j5ycBBSc31sdtvT1JrLR65Wb+?=
 =?us-ascii?Q?maxxVbfATxrzYAzRZNsIHHRSBfWO5Ad99CYhaljN2+i9jlNGUvkSTKD7SnT/?=
 =?us-ascii?Q?mv1S+S8UV59vblQR3rqis6dRtE7RNfjru9Z30xeBI1Ct5hP+nbwNb2VKNF6t?=
 =?us-ascii?Q?qKryvIfCfVh+FlcZ8iXqlb6btdDBCZ22StyemgMJfsA+T0c+bbmAdB2VGgcE?=
 =?us-ascii?Q?JSgLGSrTTmH2WU54A1PGr6hjVrPAcbkUP1PCjY9R6Xps2Cb8si5njy9imXG+?=
 =?us-ascii?Q?Xhw/LnHKIo7SAPfdAfYbf7tfnJl++RtLMuNpJQ96Z5mCCJEfwyIPc39c5pXr?=
 =?us-ascii?Q?HE8yYbI1pjf2CgmfJFf1Q59VuCe+F/11eaFpdERX8zGLWfBslBakZVGYG94Q?=
 =?us-ascii?Q?OCUVo7MUBHGSEgQ6oTNDbguFDwFBbybTvwFc0LZ+wLkOyH4qLFqSTaam9VoF?=
 =?us-ascii?Q?2Xc4UdlfqQb/6iknL24eIMq2fM/FklF1Na6gG4hiL1dR3yL2Z5xX0SiNkl+F?=
 =?us-ascii?Q?zPucyvLpAYoRQmn8GOr2bryTUAnvIofefu8gBpF65aYXI/0PKTq/lslWLDC6?=
 =?us-ascii?Q?Ik+sl3rz6Oqrj7BnzAM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?gjy9PZq2AL8QneexdE5SE70tjEz2I3fLRM70LS93d1xdtjTDcT9E2er19KZn?=
 =?us-ascii?Q?tWSIh/BRT2DlvYE0Xg+AiXiBTQfpqNkmw5kA9FmZT9lo0aicEF9mv36dLfmE?=
 =?us-ascii?Q?dlrQWquK+NNS2bG6hkILiGnfAvNxl51Kz953W1QKxCSqfAR/mKVa/jwm9i9D?=
 =?us-ascii?Q?u4Iq/776LJ4NnOI9DvZZzKSwBC625Kwkbq57RvUmpu5FnrL6Cm7nujsDG3vq?=
 =?us-ascii?Q?VPUwUuK2aB7nC4ivZJiJjUET78VkhC2iNbgHPTx2FLsJ+kRLb/C8ejgk6Ttn?=
 =?us-ascii?Q?jesWAaonwI31jhFWE0tR7rnLuiw0TXQhKOmnXXC8aG1yfMQH36wa1ygyRwzJ?=
 =?us-ascii?Q?EshQxk8svFY3/P1XaOqFUCf7WBjePATG6z5W+1SfF1uC6b8aDfhYs4H/RzmA?=
 =?us-ascii?Q?3nGLDjm0RlM65LhhgnyHpI/G8APOomykK12HWzvSO3qxY2bNIkeQcWoF0nVi?=
 =?us-ascii?Q?tyt8M5O24l8iMRhcRZAazn9EhcifjIrdii1Uk9WkdFiCgpswQy8jY2Q698me?=
 =?us-ascii?Q?xCOm6N0gXJrAZh4OX+/1AdAJZwMI0qulkL37zhvYIWRYYibOwxT4X0OpkcyX?=
 =?us-ascii?Q?PnpIGbumCUPs7qB8IEe8s6DkWh4TNaQAzN+Zm6YgRgcCnaulcfeEBil2Awj3?=
 =?us-ascii?Q?AJwEFH0Kx12FbHbZenssy2uCoWFm+ySymJk26uIUUoVzonWatnoCEv3EXR/n?=
 =?us-ascii?Q?EYCFC0g6uT0gzQhYjf29jqwWrOy650sPHc5cGYGwhrNtZ52KUPCqGk9zKBhn?=
 =?us-ascii?Q?UQkxOZiKelI6vQkOQpw2w2dLltPwv44hjnAG7ZLA9bo/+irmmFKMLIELkxWk?=
 =?us-ascii?Q?OOTMB8nrO2PnSWHllUadU40w1kpQ2BXailPOcz8sFQ12HVNI75CH33l2Iy0/?=
 =?us-ascii?Q?8GkCkYLznP2lq8ut4d+m8wPGplgej5fIwQgkb8iZkPpsNWyvRq74l7fvVi5c?=
 =?us-ascii?Q?bEstfVyK2lSen6EqsRwfIc4c9m+xEk8qk17+I0KhElcKopqzEC5LjtwqAdXp?=
 =?us-ascii?Q?heSbl8S/6PDrlh+YT4uChrEAzVBasu0bhRSMalFJe/mlx7/Z4K+y+vziZ8CW?=
 =?us-ascii?Q?1zUjrijAvM/VneCPzCFh6/sJM+7guj/QvYzb9y9u/vsb7W1ZX5ViAAJIfzFD?=
 =?us-ascii?Q?M/p/n+BY43JC6CaoVVKBwrCZ6+01VmQI+Gml5kTtB2ugpbOAgshmhp9ysp5h?=
 =?us-ascii?Q?bNFtqyWOX2khJR6q3MWXdS8bGalpLxbgssMZMsyjR7Vh24ADUW+jxQlQctHA?=
 =?us-ascii?Q?mwF1j8gMcJv4Fa5EC39649lV9xfAvRekh2KCsRDY9h+SZHZL6+M9XUbd/Nb6?=
 =?us-ascii?Q?WasdV3zzvmxijQjqWIA6/iMiP6WV9qvOSSqJQAKtKtZ99AXAgca02VdjSJId?=
 =?us-ascii?Q?6twJ+QeGE1Lmb7XVu+FC2smyngi3kgoNXeTRMS2LUY/Hdckrf3k+7kaajmJ7?=
 =?us-ascii?Q?J/S6GGuwPPRy6MM7hdehJoT61j0FhxfzIb45DAgY9e8caMSHS3nCB66id8Af?=
 =?us-ascii?Q?3vw3ZWpTWCOeBalAd+q6nUhhL16U+P4LOwAp02f7v0HZlI6Mio0tnwDnVIVV?=
 =?us-ascii?Q?W6DWDX1P6ZOuxdemXWTFKGfHi5YDXkcROL/sm1yi+rXIOUZqGNMo5OQTF7Wc?=
 =?us-ascii?Q?80ppx+bO4X9XSTqpzz5rv3n0gKcXR5wgBzqz/u6+/RB41Exx/yYeSH+2M20L?=
 =?us-ascii?Q?8dmIWB/fCOKR1SS83hc7xVgKyGbr50JID41yz1F15R4iZZ73uAjaONcRieiX?=
 =?us-ascii?Q?QjmaiiPxtA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5dc039e-b849-4b85-3869-08de68242dfc
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2026 21:42:53.5062 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5p0v6hgV+Or7fA8Tgvr3vFnrV1lGUuCTOqTprJmUKKEDRfuY2Vp8uxa6Be0dEiT9JE1OedtBLWNaaxijCnbvww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8948
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
X-Spamd-Result: default: False [0.69 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	R_MISSING_CHARSET(0.50)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org,vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[51];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: BD9DF114E1F
X-Rspamd-Action: no action

Changes from v7 to v8:

his series provides Rust infrastructure needed for nova-core memory management.
CList module for interfacing with linked lists, GPU buddy allocator bindings
for physical memory management in nova-core and nova-core Kconfig change to
select GPU_BUDDY.

The clist patch (patch 1) is independent and go through any tree. The other 2
patches depend on the DRM buddy code movement patch as a prerequisite, a
version of which is now in drm-misc-next:
https://lore.kernel.org/all/20260206003451.1914130-1-joelagnelf@nvidia.com/

Based on linux-next.

v7->v8:
Various changes suggested by Danilo, Gary, Daniel. Added tags.
Link to v7: https://lore.kernel.org/all/20260206004110.1914814-1-joelagnelf@nvidia.com/

Joel Fernandes (3):
  rust: clist: Add support to interface with C linked lists
  rust: gpu: Add GPU buddy allocator bindings
  nova-core: mm: Select GPU_BUDDY for VRAM allocation

 MAINTAINERS                     |   7 +
 drivers/gpu/nova-core/Kconfig   |   1 +
 rust/bindings/bindings_helper.h |  11 +
 rust/helpers/gpu.c              |  23 ++
 rust/helpers/helpers.c          |   2 +
 rust/helpers/list.c             |  17 +
 rust/kernel/clist.rs            | 320 +++++++++++++++++++
 rust/kernel/gpu/buddy.rs        | 530 ++++++++++++++++++++++++++++++++
 rust/kernel/gpu/mod.rs          |   5 +
 rust/kernel/lib.rs              |   3 +
 10 files changed, 919 insertions(+)
 create mode 100644 rust/helpers/gpu.c
 create mode 100644 rust/helpers/list.c
 create mode 100644 rust/kernel/clist.rs
 create mode 100644 rust/kernel/gpu/buddy.rs
 create mode 100644 rust/kernel/gpu/mod.rs

-- 
2.34.1

