Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id UBAIFQeAcGktYAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 08:28:07 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0412852C9B
	for <lists+dri-devel@lfdr.de>; Wed, 21 Jan 2026 08:28:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 479B710E6D3;
	Wed, 21 Jan 2026 07:28:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="GpT49npf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010002.outbound.protection.outlook.com [52.101.61.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DEF410E6CF;
 Wed, 21 Jan 2026 07:28:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pmxse42eKMcZ2DE+HeKTz1wgOAdrf3IfGN4L5Luew1/pFcZAvZ/gHpPCeX5pOP41liC/bfMAxH2ShvQsAAz5M9OT1ZAV7s4gDUOgoQtzyeH6+cwbBm7tRIpeafYQaGqWnfNUp28VP82pphI/p0n+6HS69oCgelWW1lA6xoXHvrRxTc3gth6gu7czNYJHq8DYSqGbA0Yryjg0dBDxL5aBoRm1Z2LezI65Rot+upw0GzaFUqE3TUvMEMYbYQZ8dDOTnP2KMGgZKEBWV0Vf4m/BFfwoiHmIoB20DKzr61GFKT86/2/UAux0GZwybhIXBuiT1qz3jtBczJPq9M8Fmh0jLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UU0BnDKm6Jw6VPR+llbTYp8fU2+RJHE7neoydQrNvlY=;
 b=BPeAtDSQ+lO6JjHVSsuZYqFy6fe3I9vPktONGbsnPC07sh0t8zy1oDAQRnGhqGS8R/bTnsUKaUfQnxtAwVm0JtxiFaXDmZqVv0o90lHMThfveNWaYwy07rCBGVvU4SEDiAdiCcvEatImYoIzKu7hA2Zm8MZi20sbngehu9hH/HwuHsyU7qXyFD5uMDTLbX2b1ikjMaB6nlNf+9NEmU9+X0tjZ0sTOUifbibh1ldIh5mGqf1lQhuVQ6whMO55fCmdVA+fm+1+FUn1K9SQAhOU24sj3IhOPl5cgyGD8KT6fUNXbueRDVUum+zaKcIcJnQMxj3gBJO5ZJPM71Bzc2QGtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UU0BnDKm6Jw6VPR+llbTYp8fU2+RJHE7neoydQrNvlY=;
 b=GpT49npfmQNRtqzuf8mAHfgDaXtF8sMxonvUN2+BoxhT0/l1gh0/WUnY5cfMM9Cq2D5al15e0m1yizFLTw28V8CYcaDI56WUbaBQcW4W/ViWhZyHY4wAicawaSE7oHBufJINuWvWiFzYxwVC61AiO5eBwp6LYdZjtvyeu21pIK3ibR57cVRwfYdZI+HiCGxFJ/UYUQVw/UP8i19DybYJ5EIZLIKlZADoinZsvK2+C3teXuSFB6Yjyxze6E6HXkddaUXEMjuN7urB/bOk6L3mGNxsKACZhkw6KVekpCIYTDIVs8JNw1NivCI3uahpTrfmVkglsiNz7Drfh5aZfkjiAg==
Received: from BY5PR20CA0027.namprd20.prod.outlook.com (2603:10b6:a03:1f4::40)
 by MN2PR12MB4456.namprd12.prod.outlook.com (2603:10b6:208:266::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9542.9; Wed, 21 Jan
 2026 07:27:54 +0000
Received: from SJ1PEPF00002313.namprd03.prod.outlook.com
 (2603:10b6:a03:1f4:cafe::86) by BY5PR20CA0027.outlook.office365.com
 (2603:10b6:a03:1f4::40) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9542.9 via Frontend Transport; Wed,
 21 Jan 2026 07:27:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF00002313.mail.protection.outlook.com (10.167.242.167) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.4 via Frontend Transport; Wed, 21 Jan 2026 07:27:54 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 20 Jan
 2026 23:27:42 -0800
Received: from rnnvmail203.nvidia.com (10.129.68.9) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Tue, 20 Jan
 2026 23:27:41 -0800
Received: from inno-thin-client (10.127.8.10) by mail.nvidia.com (10.129.68.9)
 with Microsoft SMTP Server id 15.2.2562.20 via Frontend Transport;
 Tue, 20 Jan 2026 23:27:31 -0800
Date: Wed, 21 Jan 2026 09:27:30 +0200
From: Zhi Wang <zhiw@nvidia.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
CC: <linux-kernel@vger.kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, "Alex
 Deucher" <alexander.deucher@amd.com>, Christian =?UTF-8?B?S8O2bmln?=
 <christian.koenig@amd.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 "Joonas Lahtinen" <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi
 <rodrigo.vivi@intel.com>, Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui
 <ray.huang@amd.com>, Matthew Auld <matthew.auld@intel.com>, Matthew Brost
 <matthew.brost@intel.com>, Lucas De Marchi <lucas.demarchi@intel.com>, Thomas
 =?UTF-8?B?SGVsbHN0csO2bQ==?= <thomas.hellstrom@linux.intel.com>, Helge Deller
 <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor
 <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo
 <gary@garyguo.net>, =?UTF-8?B?QmrDtnJu?= Roy Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, "John
 Hubbard" <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, Alexandre Courbot
 <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>, Andy Ritger
 <aritger@nvidia.com>, Alexey Ivanov <alexeyi@nvidia.com>, Balbir Singh
 <balbirs@nvidia.com>, Philipp Stanner <phasta@kernel.org>, Elle Rhumsaa
 <elle@weathered-steel.dev>, Daniel Almeida <daniel.almeida@collabora.com>,
 <joel@joelfernandes.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH RFC v6 01/26] rust: clist: Add support to interface with
 C linked lists
Message-ID: <20260121092730.3628d290.zhiw@nvidia.com>
In-Reply-To: <20260120204303.3229303-2-joelagnelf@nvidia.com>
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
 <20260120204303.3229303-2-joelagnelf@nvidia.com>
Organization: NVIDIA
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset="US-ASCII"
Content-Transfer-Encoding: 7bit
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002313:EE_|MN2PR12MB4456:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f918599-7069-43f3-6508-08de58be97d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fWNZHfQ5YQoeg3Rpod5xCOFgzPyAOqY2+gKEEAQb3Z+oX4gSietvidB0vQnf?=
 =?us-ascii?Q?51vJilMSJymj4LIsjQXpUEwGqzvVCueNkZrqMRJXsf+ekJL/NDeTCW4O8Rc0?=
 =?us-ascii?Q?y/jKXEIKRQmsWIJsh5UH/Z3El7m3/HIP/2raULLBhn0xRlWWit3nuZHAsHYi?=
 =?us-ascii?Q?JCwUlQ8Yhm7QMtFymMeVgKrDUZjV5ikGhi+NUuYJ0or/hAbW/JYdfT/ncVR4?=
 =?us-ascii?Q?DURoY0phWhOlVaiGzDI4h1YQOIucUjZppEaBuifuD4Cnz/LoSr/exzCsSvqq?=
 =?us-ascii?Q?rp1+C7EquOtCpz1XRz1rnkzVuFsFFnz9ipWVUzKQY1f7zast6mhLUL5il0Fc?=
 =?us-ascii?Q?L1elbZW3C5gQfMNdsl1d4Z7A693IcMLAqZ+HU1b/QETZs9ZHrRhopdzFKZCd?=
 =?us-ascii?Q?aBe0mLUEgCW0Izt30c4bN3zXi5K0Z++jKXPLQF/IOfYqcr5PD/yOsoALEsML?=
 =?us-ascii?Q?jVG0TYf7+o1EQiUjRUJTaszNOPfxcxCpsFxzx0xyjqeIzwJnMXskSrNMmzzm?=
 =?us-ascii?Q?QwZipFOjuKzk8oQRjZv2f1YoW8keT+pd/ntm3C7tjk5vut72qst4gl9IPnkD?=
 =?us-ascii?Q?LajYErVHzg+Nyp6ZtiXkFATyS8jme+cl3HvQv+5QuUqeRl2wxZ8gDvh/Nx2D?=
 =?us-ascii?Q?iNWHKX9CWDVH+oOdezv8hgx4bsKDBymVV/r7qxqG/wVpmg3wSU+xcCKLEsLC?=
 =?us-ascii?Q?R9bwek18+nMgVrF34GPDfJw7+bupngKxsYgN4/gqoGeEqKkrgAmKefcVbvj0?=
 =?us-ascii?Q?2LfQ4J6r4SwQWpTq59kaCC8HTiYz0jW58MlB7fl8RbQl19GLRVL8r6Yk2vXu?=
 =?us-ascii?Q?b6azY+pfRMBhKVtOmBFe687OyuYh7EhjtRRbqBizvDqRaCmclTxiiKL2R0L+?=
 =?us-ascii?Q?tc2/1YcyQ6Ku9Ve5grxwZ352/fhjouvYfqBIiR81oVP9Ozje8M9JX6VkyQsG?=
 =?us-ascii?Q?MkFXYO+Va/hdTGPBOyLDQc1WNqDzv1/CYaHcUSj/Xq42sYdMomqsLMLN3h0e?=
 =?us-ascii?Q?LIZDV44LMpzYwXKr8/nW+KbDc29U0UtJL9/znDQSUK/VrHgTly6+tKNGBzK6?=
 =?us-ascii?Q?HILiOnrDYvxarcqB6ki6h9m5pdyGSODhN2UF123SQh3OB8UbnMR9TOp0BGvG?=
 =?us-ascii?Q?rxkblbrfFIccK0DWL6wBexzkQhEkuY7BCxeHalVFcTGJlUmcJE6k0ZlZh8/F?=
 =?us-ascii?Q?f3m0WgbbJanejdAZhig1cchiT5D7ZkoEsbLqn8hd3pNhBCr3sQZVHrNI/BfO?=
 =?us-ascii?Q?hs2dkoJBf9eNCpASRcCiiA8kcDDVYlxIDM3q+bPii8MZiJroFhBOv/vWersQ?=
 =?us-ascii?Q?XluWc8J+HzwZ8U0kmfZptQao/sZMNZMDRzdpYty09IIspOhaIflYFG+dHQkO?=
 =?us-ascii?Q?WBBX+eZJccVTinM2yh31zptEN3r40xvNUuw0/Xrur35bhjjsP26u3SYltFFr?=
 =?us-ascii?Q?cdNC3EZ2uI241aWD4sKkEdLNjcRx74hcIuJBenvYFw3JtF2L/GDVU51buIPM?=
 =?us-ascii?Q?oJSiWwyXNOG8BGV7V3jzZh2XQwcCa2FSKLGSi+x+dVs5Iozy02s0ScJVGg0i?=
 =?us-ascii?Q?yL2Y9Og6Q2AsqAyyB94Q0CRxOAGBvc+eC5fo0CbUWO1LzAULe4t3QceNwYMY?=
 =?us-ascii?Q?73+8lQ42w7EAmHlwjoPD0FQT2111QGaBGfcGcXSNM8RSJqoRPO+vuTD7R3hV?=
 =?us-ascii?Q?xpNJOA=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jan 2026 07:27:54.6863 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f918599-7069-43f3-6508-08de58be97d4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002313.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4456
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:email,nvidia.com:mid];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[zhiw@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_GT_50(0.00)[51];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 0412852C9B
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Tue, 20 Jan 2026 15:42:38 -0500
Joel Fernandes <joelagnelf@nvidia.com> wrote:

> Add a new module `clist` for working with C's doubly circular linked
> lists. Provide low-level iteration over list nodes.
> 
> Typed iteration over actual items is provided with a `clist_create`
> macro to assist in creation of the `Clist` type.
> 
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---

snip

> +/// Initialize a `list_head` object to point to itself.
> +///
> +/// # Safety
> +///
> +/// `list` must be a valid pointer to a `list_head` object.
> +#[inline]
> +pub unsafe fn init_list_head(list: *mut bindings::list_head) {
> +    // SAFETY: Caller guarantees `list` is a valid pointer to a
> `list_head`.
> +    unsafe {
> +        (*list).next = list;
> +        (*list).prev = list;
> +    }
> +}
> +

Might be better to have a C helper? since INIT_LIST_HEAD() has WRITE_ONCE()
for memory ordering. This one seems not equal to it.

Z.

> +/// Wraps a `list_head` object for use in intrusive linked lists.
> +///
> +/// # Invariants
> +///
> +/// - [`CListHead`] represents an allocated and valid `list_head`
> structure. +/// - Once a [`CListHead`] is created in Rust, it will not
> be modified by non-Rust code. +/// - All `list_head` for individual
> items are not modified for the lifetime of [`CListHead`].
> +#[repr(transparent)] +pub struct CListHead(Opaque<bindings::list_head>);
> +
> +impl CListHead {
> +    /// Create a `&CListHead` reference from a raw `list_head` pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// - `ptr` must be a valid pointer to an allocated and initialized
> `list_head` structure.
> +    /// - `ptr` must remain valid and unmodified for the lifetime `'a`.
> +    #[inline]
> +    pub unsafe fn from_raw<'a>(ptr: *mut bindings::list_head) -> &'a
> Self {
> +        // SAFETY:
> +        // - [`CListHead`] has same layout as `list_head`.
> +        // - `ptr` is valid and unmodified for 'a.
> +        unsafe { &*ptr.cast() }
> +    }
> +
> +    /// Get the raw `list_head` pointer.
> +    #[inline]
> +    pub fn as_raw(&self) -> *mut bindings::list_head {
> +        self.0.get()
> +    }
> +
> +    /// Get the next [`CListHead`] in the list.
> +    #[inline]
> +    pub fn next(&self) -> &Self {
> +        let raw = self.as_raw();
> +        // SAFETY:
> +        // - `self.as_raw()` is valid per type invariants.
> +        // - The `next` pointer is guaranteed to be non-NULL.
> +        unsafe { Self::from_raw((*raw).next) }
> +    }
> +
> +    /// Get the previous [`CListHead`] in the list.
> +    #[inline]
> +    pub fn prev(&self) -> &Self {
> +        let raw = self.as_raw();
> +        // SAFETY:
> +        // - self.as_raw() is valid per type invariants.
> +        // - The `prev` pointer is guaranteed to be non-NULL.
> +        unsafe { Self::from_raw((*raw).prev) }
> +    }
> +
> +    /// Check if this node is linked in a list (not isolated).
> +    #[inline]
> +    pub fn is_linked(&self) -> bool {
> +        let raw = self.as_raw();
> +        // SAFETY: self.as_raw() is valid per type invariants.
> +        unsafe { (*raw).next != raw && (*raw).prev != raw }
> +    }
> +
> +    /// Fallible pin-initializer that initializes and then calls user
> closure.
> +    ///
> +    /// Initializes the list head first, then passes `&CListHead` to
> the closure.
> +    /// This hides the raw FFI pointer from the user.
> +    pub fn try_init<E>(
> +        init_func: impl FnOnce(&CListHead) -> Result<(), E>,
> +    ) -> impl PinInit<Self, E> {
> +        // SAFETY: init_list_head initializes the list_head to point to
> itself.
> +        // After initialization, we create a reference to pass to the
> closure.
> +        unsafe {
> +            pin_init::pin_init_from_closure(move |slot: *mut Self| {
> +                init_list_head(slot.cast());
> +                // SAFETY: slot is now initialized, safe to create
> reference.
> +                init_func(&*slot)
> +            })
> +        }
> +    }
> +}
> +
> +// SAFETY: [`CListHead`] can be sent to any thread.
> +unsafe impl Send for CListHead {}
> +
> +// SAFETY: [`CListHead`] can be shared among threads as it is not
> modified +// by non-Rust code per type invariants.
> +unsafe impl Sync for CListHead {}
> +
> +impl PartialEq for CListHead {
> +    fn eq(&self, other: &Self) -> bool {
> +        self.as_raw() == other.as_raw()
> +    }
> +}
> +
> +impl Eq for CListHead {}
> +
> +/// Low-level iterator over `list_head` nodes.
> +///
> +/// An iterator used to iterate over a C intrusive linked list
> (`list_head`). Caller has to +/// perform conversion of returned
> [`CListHead`] to an item (using `container_of` macro or similar). +///
> +/// # Invariants
> +///
> +/// [`CListHeadIter`] is iterating over an allocated, initialized and
> valid list. +struct CListHeadIter<'a> {
> +    current_head: &'a CListHead,
> +    list_head: &'a CListHead,
> +}
> +
> +impl<'a> Iterator for CListHeadIter<'a> {
> +    type Item = &'a CListHead;
> +
> +    #[inline]
> +    fn next(&mut self) -> Option<Self::Item> {
> +        // Advance to next node.
> +        let next = self.current_head.next();
> +
> +        // Check if we've circled back to the sentinel head.
> +        if next == self.list_head {
> +            None
> +        } else {
> +            self.current_head = next;
> +            Some(self.current_head)
> +        }
> +    }
> +}
> +
> +impl<'a> FusedIterator for CListHeadIter<'a> {}
> +
> +/// A typed C linked list with a sentinel head.
> +///
> +/// A sentinel head represents the entire linked list and can be used
> for +/// iteration over items of type `T`, it is not associated with a
> specific item. +///
> +/// The const generic `OFFSET` specifies the byte offset of the
> `list_head` field within +/// the struct that `T` wraps.
> +///
> +/// # Invariants
> +///
> +/// - `head` is an allocated and valid C `list_head` structure that is
> the list's sentinel. +/// - `OFFSET` is the byte offset of the
> `list_head` field within the struct that `T` wraps. +/// - All the
> list's `list_head` nodes are allocated and have valid next/prev
> pointers. +/// - The underlying `list_head` (and entire list) is not
> modified for the lifetime `'a`. +pub struct CList<'a, T, const OFFSET:
> usize> {
> +    head: &'a CListHead,
> +    _phantom: PhantomData<&'a T>,
> +}
> +
> +impl<'a, T, const OFFSET: usize> CList<'a, T, OFFSET> {
> +    /// Create a typed [`CList`] from a raw sentinel `list_head`
> pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// - `ptr` must be a valid pointer to an allocated and initialized
> `list_head` structure
> +    ///   representing a list sentinel.
> +    /// - `ptr` must remain valid and unmodified for the lifetime `'a`.
> +    /// - The list must contain items where the `list_head` field is at
> byte offset `OFFSET`.
> +    /// - `T` must be `#[repr(transparent)]` over the C struct.
> +    #[inline]
> +    pub unsafe fn from_raw(ptr: *mut bindings::list_head) -> Self {
> +        Self {
> +            // SAFETY: Caller guarantees `ptr` is a valid, sentinel
> `list_head` object.
> +            head: unsafe { CListHead::from_raw(ptr) },
> +            _phantom: PhantomData,
> +        }
> +    }
> +
> +    /// Get the raw sentinel `list_head` pointer.
> +    #[inline]
> +    pub fn as_raw(&self) -> *mut bindings::list_head {
> +        self.head.as_raw()
> +    }
> +
> +    /// Check if the list is empty.
> +    #[inline]
> +    pub fn is_empty(&self) -> bool {
> +        let raw = self.as_raw();
> +        // SAFETY: self.as_raw() is valid per type invariants.
> +        unsafe { (*raw).next == raw }
> +    }
> +
> +    /// Create an iterator over typed items.
> +    #[inline]
> +    pub fn iter(&self) -> CListIter<'a, T, OFFSET> {
> +        CListIter {
> +            head_iter: CListHeadIter {
> +                current_head: self.head,
> +                list_head: self.head,
> +            },
> +            _phantom: PhantomData,
> +        }
> +    }
> +}
> +
> +/// High-level iterator over typed list items.
> +pub struct CListIter<'a, T, const OFFSET: usize> {
> +    head_iter: CListHeadIter<'a>,
> +    _phantom: PhantomData<&'a T>,
> +}
> +
> +impl<'a, T, const OFFSET: usize> Iterator for CListIter<'a, T, OFFSET> {
> +    type Item = &'a T;
> +
> +    fn next(&mut self) -> Option<Self::Item> {
> +        let head = self.head_iter.next()?;
> +
> +        // Convert to item using OFFSET.
> +        // SAFETY: `item_ptr` calculation from `OFFSET` (calculated
> using offset_of!)
> +        // is valid per invariants.
> +        Some(unsafe { &*head.as_raw().byte_sub(OFFSET).cast::<T>() })
> +    }
> +}
> +
> +impl<'a, T, const OFFSET: usize> FusedIterator for CListIter<'a, T,
> OFFSET> {} +
> +/// Create a C doubly-circular linked list interface [`CList`] from a
> raw `list_head` pointer. +///
> +/// This macro creates a [`CList<T, OFFSET>`] that can iterate over
> items of type `$rust_type` +/// linked via the `$field` field in the
> underlying C struct `$c_type`. +///
> +/// # Arguments
> +///
> +/// - `$head`: Raw pointer to the sentinel `list_head` object (`*mut
> bindings::list_head`). +/// - `$rust_type`: Each item's rust wrapper
> type. +/// - `$c_type`: Each item's C struct type that contains the
> embedded `list_head`. +/// - `$field`: The name of the `list_head` field
> within the C struct. +///
> +/// # Safety
> +///
> +/// The caller must ensure:
> +/// - `$head` is a valid, initialized sentinel `list_head` pointing to
> a list that remains +///   unmodified for the lifetime of the rust
> [`CList`]. +/// - The list contains items of type `$c_type` linked via
> an embedded `$field`. +/// - `$rust_type` is `#[repr(transparent)]` over
> `$c_type` or has compatible layout. +/// - The macro is called from an
> unsafe block. +///
> +/// # Examples
> +///
> +/// Refer to the examples in the [`crate::clist`] module documentation.
> +#[macro_export]
> +macro_rules! clist_create {
> +    ($head:expr, $rust_type:ty, $c_type:ty, $($field:tt).+) => {{
> +        // Compile-time check that field path is a list_head.
> +        let _: fn(*const $c_type) -> *const $crate::bindings::list_head
> =
> +            |p| ::core::ptr::addr_of!((*p).$($field).+);
> +
> +        // Calculate offset and create `CList`.
> +        const OFFSET: usize = ::core::mem::offset_of!($c_type,
> $($field).+);
> +        $crate::clist::CList::<$rust_type, OFFSET>::from_raw($head)
> +    }};
> +}
> diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
> index f812cf120042..cd7e6a1055b0 100644
> --- a/rust/kernel/lib.rs
> +++ b/rust/kernel/lib.rs
> @@ -75,6 +75,7 @@
>  pub mod bug;
>  #[doc(hidden)]
>  pub mod build_assert;
> +pub mod clist;
>  pub mod clk;
>  #[cfg(CONFIG_CONFIGFS_FS)]
>  pub mod configfs;

