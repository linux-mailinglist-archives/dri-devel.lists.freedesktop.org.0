Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJk4HwAsnmn5TgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:53:52 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F04718DBC8
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:53:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6FBD10E65D;
	Tue, 24 Feb 2026 22:53:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="VSsisazm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011026.outbound.protection.outlook.com [40.107.208.26])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A59710E64E;
 Tue, 24 Feb 2026 22:53:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B0+9nCDP6qEkguO+riegyaO72EkxVcFufaGpPT/MgYP/b6uf7yEe3hTOD1xuy5doQpRulKAQ4whhdwjWHIbQYJjhFurdLno71peVQqoDzaIgiTN9wDqVznvvYLcx9gbJl2FjUy9j+wwjVqgUtL2jl7mMtKNxfOCJ9Votr9Jc2EuiUMUu9J6rM/5sfWAdHLUn7c7w2Yeag+voKk/TG9HgCZyp7dzSZ0kevtvQi5d1pYRvRIGdkzhYIV974rENd3Rrub0A9M6sVsCoLJiCNKl7HfIjyo9pY3ukla1jyDZ0K+OVtxfFUQyxJ+1twOFLOz9PE5hRUz/81AK32KGgpB3qDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=66e5ni57tNSkTAcGTU+uRVMn1FyZZCrVv9Ht98+fr8Q=;
 b=LrBxTvDb0oZPWjxqKQKD4/9ZF9BDVhBhc2P9ALwkH3qg85HAQxP9vTQG33WEEqXBg0O4ANy/N1eQMvkD27kgAL1gHBq0g+LAI8avyBrpYzd3KLna+nV3uCzgkamePsuzSXcMpPgtFtby4s0M7pVwcX1fL1/bMwQzXN73GaQIyDeIMU2ZI8MBoeIulqLdf0wzeP1RM9VSx87UpQ8X/GYr0dZ7a0cJIPoIwMxU3UtUQOs2yTb9YwGtyLcGUiRSkxyTM1IvmUoRDS2Y2IgYdmT/B+LHI69oIPeIAu7OOKAervCCfYrgJni6gBA4uhzHa07AZm5657HFzaqiIaoCd/zu8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=66e5ni57tNSkTAcGTU+uRVMn1FyZZCrVv9Ht98+fr8Q=;
 b=VSsisazm7Wf1M5Y+2CHNKILG/IcaZOBTL25vs5dXuIYV2hS8JJsMIlaxraO3oqCQj32uWbOMZBZTNaDg/+Dh58L5ObxrMKG76kJOeEg6Ke84OzulVkf+x/DbU/2eO7Po6gAPDiUMr0RGfkXM1/DIwgNcLOJwN3aZ/xq6Ld/f0vw61iqPA6ZUHNiNh6unIYYAyo16tRp2ifAjUzHqiHtGwK4xz7UAGlJxi4mg5akQdWlrQ4BoyAQ3cbQ4kIQKKmXiWPFasH9MwpRyFvkwO8FQpsVuO2wg9lqtJLBxgnLnAUTTYNzJsbsEYD4PHk59b6pkaaaBUPJeO7rklC6bTCA6mA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SN7PR12MB6885.namprd12.prod.outlook.com (2603:10b6:806:263::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.21; Tue, 24 Feb 2026 22:53:38 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 22:53:38 +0000
From: Joel Fernandes <joelagnelf@nvidia.com>
To: linux-kernel@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Koen Koning <koen.koning@linux.intel.com>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 Nikola Djukic <ndjukic@nvidia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
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
 Helge Deller <deller@gmx.de>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Andrea Righi <arighi@nvidia.com>, Andy Ritger <aritger@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Balbir Singh <balbirs@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>, alexeyi@nvidia.com,
 Eliot Courtney <ecourtney@nvidia.com>, joel@joelfernandes.org,
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org, Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH v8 03/25] gpu: nova-core: gsp: Return GspStaticInfo and
 FbLayout from boot()
Date: Tue, 24 Feb 2026 17:53:01 -0500
Message-Id: <20260224225323.3312204-4-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224225323.3312204-1-joelagnelf@nvidia.com>
References: <20260224225323.3312204-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0036.namprd03.prod.outlook.com
 (2603:10b6:208:32d::11) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SN7PR12MB6885:EE_
X-MS-Office365-Filtering-Correlation-Id: c58778f5-1f99-4680-baec-08de73f78c7e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0SQ72sU0ad5pPMOp64aQ1wH4VOTuxCVbXk/XeT+kLK11XQmSC3K/KFWd54Ec?=
 =?us-ascii?Q?XmXUwCiis//nfEyNvrGp8sA9CTZbRWbgStjFsDUkEINBdCbsH/dbeJi+CKpS?=
 =?us-ascii?Q?V6NRqQzxL5SCJ682zxJKK6jBIFqK2h5J+0tByFfGxaBICEi6RnMedsoPbki6?=
 =?us-ascii?Q?rsDhix1xni+SCLBjVTqeajNywIzp2l3+qzoKQz/fwc+y6NQea+ddyRvZ2+7d?=
 =?us-ascii?Q?PcC69+sxCkyUfflWuU65uCYL5QCy6TRWoENkmjvmD21fUyabcUYiOZjYoGEp?=
 =?us-ascii?Q?sWRmExE/biZHwXrBmO3Mn0L8E0TMbpUrEjSmBnIgK123zyJX9PirSWuHJm/g?=
 =?us-ascii?Q?E5J8r7Nlg3ruthKQMPXVsPx8Oxo+HDgA5FX8AGIaCFxtJ+42+jLQCfs8dlqe?=
 =?us-ascii?Q?KjLwaT19IDXVnIvtxK8unRQPqkogA1wx05Z23zES1/zjLw0l1HVMCwwIKB/Y?=
 =?us-ascii?Q?VwUW/XOsWI5Z+XcFfBbv2BczzvmQ/xu0LhTAoqHaBUaRVVh9ZDBY7pT0kqzC?=
 =?us-ascii?Q?c7Zb/k83ZrJlIkL5XHJFPPtpOOeQ7XY66CW384ZsyeOQ+WS0Wlkw2oQV4t5d?=
 =?us-ascii?Q?wr1yU9qxcvFNek4l/y2vPgFFZN6mE42XZp7tpWMpTQsr0ynbhdE4SKS0XbGv?=
 =?us-ascii?Q?XKoNQo+XdUDX2Bee8ZulVm9O20X1bnoqVaIOczI9A2EfMYBuqY/tI5zwHIZv?=
 =?us-ascii?Q?uXl8i7thibmiA564qnxGzWyTkSCAYhYJBDuW0X6u4Wulqa/rkMIzI2Ah1av+?=
 =?us-ascii?Q?ErXAGqmvusLytra8vVJrql6o2VdYDpTuYKditkefwxI+d6AAXyC34lNDsrjV?=
 =?us-ascii?Q?HoQYFqugoeUnqhNkycNslztq8GTf1Lanj32LDmUWYoeESjBG+EeIFuCElFKr?=
 =?us-ascii?Q?wClNy6cjEhYjHgp+hPtW5okxuxVmAPbBXbQSkU5a+PnwwkKCDBrHiY1CV0vZ?=
 =?us-ascii?Q?OdTLz052wWW7Qiqowr2KPtnrdl3SzNK+GPD3EsZDl+L9lssFPaY1N6zhO33x?=
 =?us-ascii?Q?PhNrHweH33jqDlW/P2DON9BcTMT3pMNzFT0LOHdpkTko3ekvBuaMFz5/vgEi?=
 =?us-ascii?Q?hJEsIuMDUA+1JtXTZug+CHwzSUBlLuy2gYXEkrxERo1ZMpl7ksRcXVA8olZH?=
 =?us-ascii?Q?0KvEmBwJDLr9O4ekmEzvxqxT5mz8FnsjTQNTBiC3vl3klpqJOGrqyZG3rSEb?=
 =?us-ascii?Q?0jI/G4fHgAgQPovv7cNTN6uPV+hp4aekqwk8wDw64VgHe/G9e2vnUbuaafXc?=
 =?us-ascii?Q?+ctym4thnQnjPSo93GwgtKRxicfR1W4my8EFyYLhFDcUDka7j9lyoaLAeSJY?=
 =?us-ascii?Q?gfWIOmT5YPQ/cnaVMdozFENpavSLhGdbRekr/C3lWpNJHgCM9AXuDJi76H3a?=
 =?us-ascii?Q?fmkJoHOEP82gLQdgdyAziB3r8jNFKZq1elw272oClwN3kt8kTgQpWgsiMY3X?=
 =?us-ascii?Q?iHbuHhkoGYtunQcy+Nf8VZdW9BafDh7X5Hg+PkDpX8jTVaejh/g/LthtVmuV?=
 =?us-ascii?Q?nDBlMpjkKHaR71K+aBrBkRck2437tU054y7224lwnf4FdyO2j8CR5toPPZIo?=
 =?us-ascii?Q?3I5so0pSOpKFsr2vGqk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LSxo5ny7KUdr6JiXu0kZ6puN/RubpiC8wa75eZ+pTGSm1c2+i1NWXJnocoyG?=
 =?us-ascii?Q?EfGJNrccXd/yGy3OfGlCKHfFg2I/sPWYrSKALuLCNaqJexuW4KTZVd6iV6Fw?=
 =?us-ascii?Q?fQTyraPQ2NESphRArUZWIV3lupH2Hbfm9A80se1QZUxZaEk8UssaZbYV+plQ?=
 =?us-ascii?Q?OV2lN9Sg70uRxzv+uBWDw3LNPTLKuAJ4y32EXBfXMEBeB7G9obv4oD44KquY?=
 =?us-ascii?Q?qPhe4PcrZAkZYTPxfakNvduXXS9r9ZWvXgYs4dFJkfcpYwUV6Kt17CB7nStv?=
 =?us-ascii?Q?E16SK9lQjYSbtjobmGa1xYrsTewl26NU/8ctXez0Y9HizUDLO1McmMvTgStI?=
 =?us-ascii?Q?1OATFwIuW/s050k2+S2YWFuAbuYlUg0gWb17wcXAOuiZ5nzl2tpqxQhT+fy0?=
 =?us-ascii?Q?OrY/EdpoDmuJTM/9vT6mcnCdHmxIS8VBFKIgrJdsATVb8zmpaR4/vlOQ7EKP?=
 =?us-ascii?Q?7zR9qlFAUSfoZKQZJO8rUeRYzIngFZLuEWnqme4AQvsJ5qB4l1aep5GhbwbY?=
 =?us-ascii?Q?O839L1ewVLOY1V8Q0VdJzyIsvePSehPuiMiLR3Bn+48SEsB7qXxubQTd0AQM?=
 =?us-ascii?Q?u4mBuJajqvty/GejGMYlr+clPrICYbw8Iq7Srg5AaqyELgnhvlMgSIMbvbxF?=
 =?us-ascii?Q?uE9Dy7Myo8pCbEtPcOUZEOhdQ6bAWpV1lzRw8sbRS1OwKEs6QdyKRTsbsk2X?=
 =?us-ascii?Q?3Y8KPvs3iykIpP0aLTAHegV8istI48R/K+eRFAIHNaFn/fBAwleszhbiRCcj?=
 =?us-ascii?Q?hNrtuChb6q+yZWPXLBEyWfGdAAikH1siQL3VgHm7xK1R2yQm8m/NWxY/leTF?=
 =?us-ascii?Q?e86mX4wlokPTdKcZeb2Coo/uCGJ9eqVA4tVXfuwdc94VIeuoOJodSeZvTFFX?=
 =?us-ascii?Q?WGqZJwZLgq3mqg0zSs+JqVSYfo5BGgMdYHBZzmwiLKSUPcDhAY7sSiQpYw/Q?=
 =?us-ascii?Q?MtJGZiqWx7umxEm7nbf2UMwnl2HrzT86Ale321rfXJgjdsSngvDG2g+onsKy?=
 =?us-ascii?Q?X7ydrP5OCV1uWkglqRK5GJikGkX0QfOz29pWOLiojzOXOVQ3mHrojw6Xn2ay?=
 =?us-ascii?Q?l7ngvsXckw3JEHFkH9c0MNDoB/HLnpNUCu0MTrk9uwtXF1aKC4FTb/0sQFH0?=
 =?us-ascii?Q?IMlbXvDiRcJKsnwSHq6k8RkqpymAR0O+kaqB18YVRhHyer4ox/7J7a7Ecl3U?=
 =?us-ascii?Q?kEvulye3S799/KhGArguXCHUcYY0Y8ufiYK1bbCyXaw1Il5W4ytK9gZ7R0uX?=
 =?us-ascii?Q?Qrnd8km1PJECxqRa+GRgXa1xj/bXQuIFl+iURB+keIGXQ4SDlx9KLYdD4cGJ?=
 =?us-ascii?Q?aa6QaEx/e/PYjRovJrjZZwbb7KkSGXZSyuLpDFfs6Yf+c9ApLrQF3mu63FvV?=
 =?us-ascii?Q?2bNIW053AyPzYgbVTnmRinQvDcI2q7u/e8pXD6zePuj63aiEwMOhlrIKRrap?=
 =?us-ascii?Q?9D84JUEREpl2LFVvGBYrrkXeTiDssk8iZBvw2e5jkp5J6S4z3MG7WlBkpDyB?=
 =?us-ascii?Q?Ni6muhQkaEgCqCVudv3CcY88JVUgKYZ3iEuBeprqr4pFHq+is3np2VNUyLX/?=
 =?us-ascii?Q?9ehmDGioKfBgVaxQp3IIxO/odgf//p2MPZUD+MtocE/M4gufZZuFF2xK5oSu?=
 =?us-ascii?Q?cMtNOeCsMUibjF74TVfZzxs1KxyLWUDO1N60fj/o6BgxSGYN3TaINmIRuG6L?=
 =?us-ascii?Q?Ldq9+Z6FxewDuFx8nDgJa7Zzgp6BrHfZ5p9qm+JHq1yf/WoV8vxc8SJAdcLb?=
 =?us-ascii?Q?RNKMxM2FTA=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c58778f5-1f99-4680-baec-08de73f78c7e
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 22:53:38.6151 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eg2IdSJdwkuSJ2AzQ/nmxK+jg+WUx76OuyjdOXh+g8kS5SZoINyFbF9D+NZ/CenTt5WGLVXmSYvs8xwOUVZHXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6885
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
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FREEMAIL_CC(0.00)[kernel.org,garyguo.net,protonmail.com,google.com,umich.edu,redhat.com,collabora.com,linux.intel.com,lists.freedesktop.org,vger.kernel.org,nvidia.com,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,weathered-steel.dev,joelfernandes.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	RCPT_COUNT_GT_50(0.00)[57];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-0.937];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email]
X-Rspamd-Queue-Id: 2F04718DBC8
X-Rspamd-Action: no action

Refactor the GSP boot function to return the GspStaticInfo and FbLayout.

This enables access required for memory management initialization to:
- bar1_pde_base: BAR1 page directory base.
- bar2_pde_base: BAR2 page directory base.
- usable memory regions in vidmem.

Cc: Nikola Djukic <ndjukic@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs      |  9 +++++++--
 drivers/gpu/nova-core/gsp/boot.rs | 15 ++++++++++++---
 2 files changed, 19 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 9b042ef1a308..5e084ec7c926 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -18,7 +18,10 @@
     },
     fb::SysmemFlush,
     gfw,
-    gsp::Gsp,
+    gsp::{
+        commands::GetGspStaticInfoReply,
+        Gsp, //
+    },
     regs,
 };
 
@@ -252,6 +255,8 @@ pub(crate) struct Gpu {
     /// GSP runtime data. Temporarily an empty placeholder.
     #[pin]
     gsp: Gsp,
+    /// Static GPU information from GSP.
+    gsp_static_info: GetGspStaticInfoReply,
 }
 
 impl Gpu {
@@ -283,7 +288,7 @@ pub(crate) fn new<'a>(
 
             gsp <- Gsp::new(pdev),
 
-            _: { gsp.boot(pdev, bar, spec.chipset, gsp_falcon, sec2_falcon)? },
+            gsp_static_info: { gsp.boot(pdev, bar, spec.chipset, gsp_falcon, sec2_falcon)?.0 },
 
             bar: devres_bar,
         })
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index be427fe26a58..7a4a0c759267 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -32,7 +32,10 @@
     },
     gpu::Chipset,
     gsp::{
-        commands,
+        commands::{
+            self,
+            GetGspStaticInfoReply, //
+        },
         sequencer::{
             GspSequencer,
             GspSequencerParams, //
@@ -127,6 +130,12 @@ fn run_fwsec_frts(
     /// structures that the GSP will use at runtime.
     ///
     /// Upon return, the GSP is up and running, and its runtime object given as return value.
+    ///
+    /// Returns a tuple containing:
+    /// - [`GetGspStaticInfoReply`]: Static GPU information from GSP, including the BAR1 page
+    ///   directory base address needed for memory management.
+    /// - [`FbLayout`]: Frame buffer layout computed during boot, containing memory regions
+    ///   required for [`GpuMm`] initialization.
     pub(crate) fn boot(
         mut self: Pin<&mut Self>,
         pdev: &pci::Device<device::Bound>,
@@ -134,7 +143,7 @@ pub(crate) fn boot(
         chipset: Chipset,
         gsp_falcon: &Falcon<Gsp>,
         sec2_falcon: &Falcon<Sec2>,
-    ) -> Result {
+    ) -> Result<(GetGspStaticInfoReply, FbLayout)> {
         let dev = pdev.as_ref();
 
         let bios = Vbios::new(dev, bar)?;
@@ -243,6 +252,6 @@ pub(crate) fn boot(
             Err(e) => dev_warn!(pdev.as_ref(), "GPU name unavailable: {:?}\n", e),
         }
 
-        Ok(())
+        Ok((info, fb_layout))
     }
 }
-- 
2.34.1

