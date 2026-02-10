Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id WIGBOxPAi2l6aQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 00:32:35 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90DC811FFFE
	for <lists+dri-devel@lfdr.de>; Wed, 11 Feb 2026 00:32:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47B6510E61B;
	Tue, 10 Feb 2026 23:32:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ViKnszD9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012023.outbound.protection.outlook.com
 [40.107.200.23])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 92E6410E135;
 Tue, 10 Feb 2026 23:32:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cyn/hiQ1UbaLcThu6QwzITUsTsfnJAuYpLPdKuzBFYlG68B34Zw1/JHhxcTNcI6h2UEvVSrrM4nFQW124dbh1jBNbRdPtXSQ2Ffmuqt9I0x4R7nqzhEuMNmRCiM36sHtJZaYQuRVDpmUTBfKk+lE5F6mhSyWTiykyonu3jrW/iIUayXZspkQSNGUkJu+PWh+7Joo8ahYZ90tVOtraLYGdpUoe9B+XWx/q/QzYV1cs1T1NHcZGd4LhUCODFfOVJb/1ur2ymG12W5XJRalVOaLBc7jR6B4MRGsej4sOVnYYP0hfQCkB8ydwHUX4DNUgOIiZtaCf0drBOSMvcsEiVN67Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I6pP5iyuhAc03+N+96TCvFk9mmUr48kpVZssCE8l//Y=;
 b=R+f0LoRad+9hreMxGtxokNfDanqEwAuZkHKeu7tV72bgqcEZJiIUZujA1byGUdXzsrC4QA5pjv2lgB+PMPlLbnVvkuKIjxBzvM788S5cgjo/bhVWPEYQD3rLTAnYbzSPOUkJOk1W/oinQn5IXFpFa8EWAW6JI/U7Z7ZKxnGMO9BTVr2JPfBSbqBDCa8/1OukKzUSqpuZY4oOi5z2pPM4e2cIJKB1z1vW5g2mDKI1trsBMRZMROPhiRwdyy9lfKaAnjMPLvdaMPBKNC0eD1OkoLK3cHVAOjTq/qXsp18ygAPZvAnYbKDncfRnViuSn4hfgKA1GUlEGh8rYsFS3uJ+5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I6pP5iyuhAc03+N+96TCvFk9mmUr48kpVZssCE8l//Y=;
 b=ViKnszD9JKpVvDGFVlJeLafwwAsepC5ZwfOPdlsvS9np0ER26yvxzZQtk89NlFTkc2ah5kKJ2B6kXQX+qP2zLx8dh7wWJew+uFpRBbslqoMKaQ82CHbK4lkRhvJ4qqY6Jr90k9pOJkSOzgowCi9XgBhX55rEuGY2tFB1rkGuMGskr6yp++wvwPgAgVamveS0yvcxmGVuPjzTq6gVaeYT8xWdnST1MH1rSMDgqOFPCe38yTX5OCT6Jtz7DXAqUaEsQo2DxWZ+/laSOSZze8A8j3aV+8Pdo2tXv2yuVY9FLJgrDpbKTWNFSvFMaym0Bji4T23vw9Kv/0NloQslm0WRMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 IA1PR12MB8586.namprd12.prod.outlook.com (2603:10b6:208:44e::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9611.10; Tue, 10 Feb 2026 23:32:17 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 23:32:17 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
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
 Trevor Gross <tmgross@umich.edu>, Alistair Popple <apopple@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 David Airlie <airlied@gmail.com>, Edwin Peer <epeer@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Andy Ritger <aritger@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH -next v9 2/3] rust: gpu: Add GPU buddy allocator bindings
Date: Tue, 10 Feb 2026 18:32:03 -0500
Message-Id: <20260210233204.790524-3-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260210233204.790524-1-joelagnelf@nvidia.com>
References: <20260210233204.790524-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CYXPR02CA0026.namprd02.prod.outlook.com
 (2603:10b6:930:cc::9) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|IA1PR12MB8586:EE_
X-MS-Office365-Filtering-Correlation-Id: 669fb05f-e16f-4076-0425-08de68fca0d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gM+ztHJrz38G3/5Uci0+JS1lQAgOMQ6zktmttEyNvOH+PpZUvuIA1a72V4ma?=
 =?us-ascii?Q?EWk9jOZce3TPXpW2YxoQFpspq6th8+1HXrFSw0qAjCYP4IdaAYAay1fEgYZd?=
 =?us-ascii?Q?NrFAWuNuisigVyOCuycdQhJSJkYVQjyBarJ7lwwKYrtvybiEEnvu2nacWgI8?=
 =?us-ascii?Q?Ld28z5ANwFFY72+ukOcnvgZVydxcedKJzXo1fztF2zR4VBu7l5HeEWCE5sEh?=
 =?us-ascii?Q?HVsX9pBgbyjVFSdprjvLC8WMUpO2VYHXKARyMAQJS8mwcRsoP1SXuUwLi0qZ?=
 =?us-ascii?Q?5CFomlUwiiUrrY44h34ax6F8tArCQzWKR/FVSfp8ymwue/JwiIYwXhF6mBgh?=
 =?us-ascii?Q?pnqOx9Re/TxSL9bFi+UOHA7SMYReonrsWXqk+s4Cxx/bHChGtLkbUtRk5uUn?=
 =?us-ascii?Q?Sgk9jx0MNi7IfpAU6k7sKG6x/9N1HwyEbzUC+OFfLmKW/PjxvcOjBKIhB9ON?=
 =?us-ascii?Q?jb+kRB3vZlmDNxIm11nvH3RsaAq/8bSTUiBJ8BWItqfG4hu7tl41gFtYwKC+?=
 =?us-ascii?Q?9axcE4o1tU3XVdQ1aQOdr4ZZnFDpGaQDgFplibroG8ujKWUMT2wPSAdeTQhb?=
 =?us-ascii?Q?6YDzXFVd+acFb2OdC1kkUAu9UIMFJwBgduvuYf4PS4e5RK/F2Z6MWoJReEmC?=
 =?us-ascii?Q?wthSXbEfkdsE97l+Fh3fpk1zNA6ANh0JJOkPeDWff49LDsCsEbSwLu5CJ2AD?=
 =?us-ascii?Q?7SfXykf7pBCZcncSege1af61kAuPPwuC77isW5cjk/BiIZ17AX0S2/T8LTc8?=
 =?us-ascii?Q?Y/QX5FX0foirLuCOqORRiMVk6QYYsYgu87IM/SKo0uqqsOE/Nnre4XaQh32H?=
 =?us-ascii?Q?RYIXIMArL1QzHDEAd9OjSChDH+WSMQBlH35K3bl2fcXmtsc+eiHmPvrAg+zp?=
 =?us-ascii?Q?r0bVQl5E5oJERo5YgIOYicnlsrP7bTLIFmj5aFBn1r2T3aP1eceqJcwUkiy8?=
 =?us-ascii?Q?XvGgYXG8+7VDiRS3Nbk5+8wsENLilPirofWkmA4y+mZ8G3ARNqKo6h76jvGd?=
 =?us-ascii?Q?WxnxlA8ON+lA/Z3iAibDUDxQfcxv1mzQo4+5fleQjybToVLBKs2kYH/SSOK5?=
 =?us-ascii?Q?/lemNA6LErWQBhUBlgBcXBIN7uuayW0jy4+mnGXR0ebR8B9q3hYmcIDihOq6?=
 =?us-ascii?Q?Hfs+BjAiQxbvoVMOxPF4ROkang9QVw3ryIy3PYjr5lKlwR3h3WDoaurEJ2/H?=
 =?us-ascii?Q?mCXygi4YrJqUKA9TvbkoQ2QcBXULKj/Oe/tcXEu3SqcjmcTA6VITlBOksRu/?=
 =?us-ascii?Q?UR02IU7y6TglhQ8Dwxx5h1HODuVp2wPAXEemHmm3H14V8bX2wZSjRvgeW6yQ?=
 =?us-ascii?Q?dotSM+Z95mAwmT8BeT8abqQPbOqrcD1rkQpu1pH8Byh1clq/MoXSVRL42xLI?=
 =?us-ascii?Q?9ta7p9JviSH3dIc8CnzyOFMTmhIpOCEX6UHqm6Eyy0UaJdM7SuZXfKUnwa6O?=
 =?us-ascii?Q?1d9z2keN0/DR/6nRy6XnEvB3TxixeR0Y7o1tf7o3gP+b8NSoD55h5iwHTuFK?=
 =?us-ascii?Q?kzVjhxZjSpDx7dmyZhWaVaeQtv7PzCNktUN+IhEQUrZGMWog0d8rAvR3Dgdb?=
 =?us-ascii?Q?O0wl7tkQwowdI69KBAs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iWxKYecOKhZfae+2v2CPqZrzGpwk3OBSZSZzZ2PBHfxntOvF3YlWSuYubJvH?=
 =?us-ascii?Q?TFmNla0p2H95e1I5sqnhnIAHoM8dOMeTaWcLbBNGOKb6u9ZwacW0mmizAxuv?=
 =?us-ascii?Q?sxlxGDoBEup22dZ2Jpjs8gbfjy+upc/gcn0kfAXhlh6vhQLXeuH2CEFKUn7c?=
 =?us-ascii?Q?hN+Pqm6InqNXdHnYQsjX4gbMgiGpUoIGcBCTMNqi7JTBoXnwh6TrO7EUUDoy?=
 =?us-ascii?Q?gMdmZ3ztWAuL98F1TIDLXl0CggqMlyjgcw0sNFxLRNjotwZXLymO4/lsE8+P?=
 =?us-ascii?Q?22ouYpTKIVcBNdMRrqf151VMxR0wDYaifzk/ihka7UbF9P/B56uhVqHNSvjX?=
 =?us-ascii?Q?48H7i3d/NqeNYgZxdCU/YhSo1J72O390BNnG8L7HxQIYKlviOmLdAbp7heFc?=
 =?us-ascii?Q?gJ8GpX1Xx+dlJqWPtq3oZTr05I+pI4OKWV8ye/j0FZMokWCMAhj5ejvpbOS4?=
 =?us-ascii?Q?hwCsIM3CtWMETXyV2LezfSR0wfEg1O6Ev1mg6j1II5cO1ouh+3ucKpsdDKnZ?=
 =?us-ascii?Q?Xo3AKKtzCDWrbGOrJnas9zHu/KUIaZsSlyRVikyjPQaB+IxgVthtSXlUySoR?=
 =?us-ascii?Q?zeFzpupcRtXJw0TmNJwBoW/VOMTpGOkMWmVQl5+XsRi1JGL5KZ9pd3iU9Fym?=
 =?us-ascii?Q?ZneI5QyxoB/1+OuFtzKutiC4yFFHtGP/q8/y0u9xZdEaL+1hndkT/aC3r9VS?=
 =?us-ascii?Q?0dpIOdRE4XqLV43/35Dy+j5BDirVw0m+uD/za7KpEo/7vDKlFTrp1zsq4Mbc?=
 =?us-ascii?Q?vSoQFBC9GbqEG25Ma/k/ZplLXt1Tvxjjfh/cgbvo5epH4f5kW67ZS89P9c3+?=
 =?us-ascii?Q?ybs9P1jQWwM8B84TbTWKNMyrR6zymdY+LZsRzv0lLoZepWGK76Nq6oCPK7OM?=
 =?us-ascii?Q?FXb+yQ3Q+iBVPGHO4r6utMZ8DgLSSmXMI7dHmE8HUGflJtlCd2LtbjVUP54v?=
 =?us-ascii?Q?o4ZWn4uDAnP8tih32MoGPtFWAKJTOcjhqio+Sk+jlLKv3u7WfJOmHwpqmAPL?=
 =?us-ascii?Q?+BcKVYFexoP7HRxbVVQiM/RH+ERbZDsUumUwiXZniSddAErJlvzXhOWsZ7R9?=
 =?us-ascii?Q?ReYbZhfrFj4kB0/SIeWbsII/oe1bYbVz9pkqBta5SpvJ28szZg8yq4baBnFp?=
 =?us-ascii?Q?6B/EayPy/qaqSuGxOzVg70bW1q9lNeeRDhaU/o3+Wh0QcL1qAy2KekitiMxJ?=
 =?us-ascii?Q?r0QkISngTQ0eH/pTl/mQUHvwK2rvGDjRy+qf6GRschgspaP5irND/EJfj6yO?=
 =?us-ascii?Q?qvyQSHgmMjyNfxcdhDtEd4F3cpDhRuVueud7MI0hNfUw3i4AF/e4fuHxi//n?=
 =?us-ascii?Q?DehYYkjHhcUi4CpPRrBP8G1+Ry0wt1SDaFqno9h2oit9y3JHsDtcIMw2MrtT?=
 =?us-ascii?Q?NfVHE2UOz7rHbwctZWofyBviPdqAQj8Mam82yZrKXta3elt9DSsGGDEWP2Gf?=
 =?us-ascii?Q?Qu2R73YUV5VoACjPiaE2ZZVf+aAtpkLlonqfEmfOJ/sneUtkrsK5iZNjBrUH?=
 =?us-ascii?Q?pItrARDG1Wf8y5UCZLlDhlHUI19OCPzoC/v30fZATaVAMJdW6ieFzoKjanPE?=
 =?us-ascii?Q?9Pa3wgoQLx0Cu6210ywwLm8fAp0F8klTRn51JwMhrkVzDCbI4xN2Bh1hsYL+?=
 =?us-ascii?Q?Rrx5X6sNylRQaV/yXN3nsfKxEUgF9on5FZC018758Ku2XqAN88rZ7TtyTYcE?=
 =?us-ascii?Q?iT88f6fDFD44Fy6EGbDXCA39nGdZmQ6xxntLn28cFqcFBDjORfQZLJ0ZkJdu?=
 =?us-ascii?Q?/Ib3sNma9w=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 669fb05f-e16f-4076-0425-08de68fca0d1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 23:32:17.3794 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RW610ZATMspjsBme3KJqxmzyg5Geaf0vfeyaLBSMlk3IOrYJhkvGqm9z7h3hhdhQAyZAlwjuwF9KuOuYGBTulw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8586
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
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,gmail.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org,vger.kernel.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 90DC811FFFE
X-Rspamd-Action: no action

Add safe Rust abstractions over the Linux kernel's GPU buddy
allocator for physical memory management. The GPU buddy allocator
implements a binary buddy system useful for GPU physical memory
allocation. nova-core will use it for physical memory allocation.

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
index 000000000000..102414eba65a
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
+    clist::CListHead,
+    clist_create,
+    error::to_result,
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
+        Ok(Self(Arc::pin_init(
+            GpuBuddyInner::new(params),
+            GFP_KERNEL,
+        )?))
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
+    /// Returns an iterator yielding [`AllocatedBlock`] references. The blocks
+    /// are only valid for the duration of the borrow of `self`.
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
+// SAFETY: `Block` is a transparent wrapper over `gpu_buddy_block` which is not
+// modified after allocation. It can be safely sent between threads.
+unsafe impl Send for Block {}
+
+// SAFETY: `Block` is a transparent wrapper over `gpu_buddy_block` which is not
+// modified after allocation. It can be safely shared among threads.
+unsafe impl Sync for Block {}
+
+/// An allocated block with access to the allocation list.
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
index fe711d34ca1e..02ec5b9b22c8 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -98,6 +98,8 @@
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

