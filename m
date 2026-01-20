Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cLNzJzXpb2m+UQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 21:44:37 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F4A64BA30
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 21:44:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DA2210E6C3;
	Tue, 20 Jan 2026 20:44:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="SFbaOI9n";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010042.outbound.protection.outlook.com [52.101.46.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F55810E6AA;
 Tue, 20 Jan 2026 20:44:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yPssT70Q7iX+Ne8qhl9X3sW+f7RIp4/2urzrr+N09Lrq8o2vhiAqVWsyDqHV4IejhXiOw2+t8lf1uw02ipm6pIwr64/B4PKit8XAWAXFkg/ZXZt4c6LtgQmUQHpwD07BDEn0XlhBBTjiSAzvCA6fgWl1UReVMDh1RIiJv+If43xf7C4DTNIvEZtWGs95H5Icd3Ily7bYGudvR+/YEeX7mOy71ub7Mx5ZmEj8f7pbY9KjNu6rmYHId6C5h4PA8QtryIxhxXeBOJT0qHCv6ytUu/eDHptw3a4a/0zsuqJoLepU4lPJoBa3Ur7Y1tXhnSV0lYb4s34KKZmYe1opkhiQeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UgTvhrFc94ewpmDmJnjeTW6p43ibTABd9ly9FRs8LHU=;
 b=srkZLIY2eYn9OUxXu5Vl8KhQdfBtpiN2AOlr5hWtiV/0TQhGsdhXTSK8DNRnQT3iDGYS7GddaLn5AhyvY0W0o5UnmVkWI/R2toxtLrV9THqhC5JVuPE7PtoMVWFih36YylrSKLRJR065KMwMXLtrUuZGqRW5A0UxsMEbx224RkNOphhVoeGN5JuYF9nddiljb+m2QRl8hm1dYhDrQkUok8IdYMbyK2MN5xxLSu/wdN4kRNTjC1ZmGraWinSulvj0HPr2kR5+nb4/BTYEs/yEwvZ4KCV+Q6GtHqXZuEm0U2ZaZsswpeUSlyhJk1CLxZkkpGPelD9VaTEQVkY66RcppA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UgTvhrFc94ewpmDmJnjeTW6p43ibTABd9ly9FRs8LHU=;
 b=SFbaOI9n9G6zFAmwiPyRAh/vrFbPsH5yel2lUyN2DzG6QAt71H/snseSZ6zHhS5YVAwu+4y0qXlN3m6JaaInjPyVNUPowvNexEoJzN0bGOi72djgWbJNIwVTqUGE0mdk+/jC4QsljId32/M/5kH0GRyDLHrSV3/WgeITj5Cwq/cJgl4crdKqOxkF0uLTLKKMvX8uZ2YGMb9G95bRAMqkpNYfytIoHJddvbo3A78Q3iWAt64dr9BrZ3MV6YEeJXCjzq6CjEkG3/cOoxe5Es3GojLCmURW7dYGtf8V2WomV3mL0Ykgm1PlGYru0vpm2bDkBH0lr3X5lgg9Vax3jvEPrQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 CY1PR12MB9651.namprd12.prod.outlook.com (2603:10b6:930:104::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.13; Tue, 20 Jan 2026 20:44:23 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.008; Tue, 20 Jan 2026
 20:44:23 +0000
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
 Zhi Wang <zhiw@nvidia.com>, Alexey Ivanov <alexeyi@nvidia.com>,
 Balbir Singh <balbirs@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org,
 Joel Fernandes <joelagnelf@nvidia.com>
Subject: [PATCH RFC v6 19/26] nova-core: mm: Add BAR1 user interface
Date: Tue, 20 Jan 2026 15:42:56 -0500
Message-Id: <20260120204303.3229303-20-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260120204303.3229303-1-joelagnelf@nvidia.com>
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR03CA0002.namprd03.prod.outlook.com
 (2603:10b6:208:23a::7) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|CY1PR12MB9651:EE_
X-MS-Office365-Filtering-Correlation-Id: 2472d1dc-b7a6-4f1b-74ed-08de5864b155
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RxtV1sXTjfcw9QgdDJwhh9v4KuZlEAthSvkVOpBbOBXHYqTeYX0HfNUyl7Qz?=
 =?us-ascii?Q?xUnid4DvcP+FEbf2IkgBFheTpltv4DACgzHPbGk81s6eSdlv8fB+Z+n+UVjp?=
 =?us-ascii?Q?l/roHCch76mALmAlORlvzSqUeOKf6MO1bQlDKTREhMBRKWuIII6B7UIP7Z3T?=
 =?us-ascii?Q?MYa77Jr3ZSinTVxQ2TM2UpEz4+tzAzovz5nOsUxrMOa/G5fc/hZoreGEinPD?=
 =?us-ascii?Q?pqeCZo4GXSOVwAMrA4RCQZs+tjZM+mFp11KkEmCbJF1zn9VHAhyFRCkB4X8e?=
 =?us-ascii?Q?dz4ruOY08hk8GI367+jinoSwUAgz6Lw/2ufwbhb1DIO5WOEMuPcHvkAfj7W5?=
 =?us-ascii?Q?EmXRtLg5KIQvtSyW6sM/HO81XuZ/UZK24F60lyy9jYbvlTHIQcncPhDc0JJO?=
 =?us-ascii?Q?nJEOn2lWlP0ugm2usMLNJjUeWqLoYVxjesuQ+0dVoNFWR/MUEa2q9g4689g6?=
 =?us-ascii?Q?6hi2CR7I/lfbpfxYHsxjbK4JHA3teZ35HLFNXButEoAbSqnj2jD+eq2YVmj4?=
 =?us-ascii?Q?PRiTQY+saos9qweJlryZmDnQ+6c3hzLHTIO2eP0PcWHSvX3gb1iNacr0BBzL?=
 =?us-ascii?Q?krs31f/tsQC3zOCh3LYd4l7oW4mGzw+capbS0i0aPGEcWKv6gj21ZnNcq3XI?=
 =?us-ascii?Q?vSqWg4DfYHUZ1FI+d/7CAtuNicCtd1L/P+a2ZEgsJxABCzWJKEyfx5i9paKW?=
 =?us-ascii?Q?E0Mi/lYTkvyGMXIPrYiULe7v7k/U69W77qJEOlo7iol+vMdGNfMS0XIZ5GX5?=
 =?us-ascii?Q?KrpbEmqUWX9lgkFqJqNUHPRUe1wgENwmB1rhwaDTfp2DmmvkLOAiiPYFinCL?=
 =?us-ascii?Q?3K3LaPNCaSZ4NAW894FJFAf13oEYXu4WguhPa9eUWaDmtfuNFnl9e83fsbZZ?=
 =?us-ascii?Q?/Mcm11L39uQWy79nckNE+wQUmmQK53AgkvJzucWC0S5ajN4+Xr+RT5kJmsPa?=
 =?us-ascii?Q?8KLz36Emtbs1mBGu4hFAaqB6/WYJKFJjP3ah586BEx6mm3q45/6sIYukXAxl?=
 =?us-ascii?Q?cic9+DEkhf4DtcgP82po4gKCN8FmwJ1nMF+92yyv6U/KBfIni0o8lgpkHiBm?=
 =?us-ascii?Q?1+Rljjh+uX4zwpOo+FgCJ4JUTvQIqQoz8lL1vFX4PpW6rMNXUrnyZ66cNKo1?=
 =?us-ascii?Q?v1Xb2FfBCQdUFNr2wjiA/OE1Mavb3uQAZJSKvcnaJcinWANDc61x25a4SkRx?=
 =?us-ascii?Q?K7Xwa9uAzl73bvRPrvsjEWg+Yiru632N1YlRlHwHHXjLcKev978de4xvumAH?=
 =?us-ascii?Q?vkl9XlWbb7C3v7swEZq+m7fUzjrmDORNtq7jQN6XsjrRPBvZ6gxz/bQbZ3d2?=
 =?us-ascii?Q?q3dROm77nrYcFQmq2BK1gPSG9btyABTNhzX73BpuaF2X4DoPTiOUeJ45XxbM?=
 =?us-ascii?Q?/hQOqGacZbkYmkV0MCraHiKnmY+aan4D0YyGziUjbspJivuNdZ2U43/XYdqB?=
 =?us-ascii?Q?dUBEWREPSK3i1r9jMeI0pSXom1YLRiToDQlW1A0VlKvBe72CTxMypIiWnRL3?=
 =?us-ascii?Q?qvxfRlynpaPYqj7HEBxb+/D9quyvPqfWJMWgrUI6gmhMKZIefIXYq3AiGa+A?=
 =?us-ascii?Q?SHH1EHQCpDYf6CGk1H8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tmfvBXXZakrNS6076cJx3xgGtb0haPnKS2CwkunsQ1syPdgtP7AS1YSZZU1E?=
 =?us-ascii?Q?cMf/C5y4FH5D25ANKISaXnx4t3ZO4wURAQdwaat5BRkYzPRFmvMgmdcETylW?=
 =?us-ascii?Q?G8hmYDec8qhjYv5q/g+ac6JTRfQs8uJmeAjLazyq+a96cngJC8r4yWeNYQ+I?=
 =?us-ascii?Q?JSMLbcdI6NqzlCdU4n0hzTm6tVYmshj0UXQD4noo/VtS7ojxJwNvzDHkVuQd?=
 =?us-ascii?Q?WhbQ7aREm54X5xBtb0uTVjy6d7lDzxz+QmH8kOj1+Ab3jnCm3t79x5iThnJ3?=
 =?us-ascii?Q?3+O+rFdQD6DOpBNjg0Ft/foT5ARYBlhFHXKpVEasuhWgWzGmQ0pFQy5zRHa0?=
 =?us-ascii?Q?GWwkVGBfPzTMzdzv0TiEcoUqPujFqzE3okZHGyP9OD4cCq0u/R6TYxAIcE4Y?=
 =?us-ascii?Q?3hFf5rv7LVT5Oh8aEf8Rqff21bvm1A0cYZNhy+bD6TCk3S3LwxMQOi/odsWC?=
 =?us-ascii?Q?00Tj8Y92AbQM9mP6tFdHimUExPKYvvkK1LK/2wWo0tgekuIFVZ3R1u20gEse?=
 =?us-ascii?Q?cg5a8u5lB/h25GCOwXXJgP1ZGS46ltAxlo23M56X5j0GPF2ygjgMGF56z24i?=
 =?us-ascii?Q?FnkRyRM8qt77GvdaymgpL7gvbS4vnxuOuUA+Nh7OGZ20kx0cSiSoEBrEFvqc?=
 =?us-ascii?Q?EVzq1drsjLs16WinXe45PKKlUth5ssGh36MdABTb7kYvSQdCEnMijowf4dF8?=
 =?us-ascii?Q?IISrX9aF2jEW1V9B95BdHHAUJl9DjZNWqKTkvXyxVtcuJaki1/6yYHBWn9kT?=
 =?us-ascii?Q?skwd1hYw3jEZB4wtjI/nvLEZ2LHTgSCZbD5B9B3yFhPqEAZRRMDzavswIQg2?=
 =?us-ascii?Q?AUEpVbRGuZGIEz5BF7SMNOIGRcum8AI3VFa5PWX9nJHKhY+tAqq+UHXFLGfL?=
 =?us-ascii?Q?qlstM3tuydtCIaDty5rpfAaMv30tCVrEQ8aKNNXqxBrlhSxY7usOofI60MbU?=
 =?us-ascii?Q?E+g5tkTXrjtfAlWYWGEo5RxHoorqwKKkCHw/0yfGy+CRoxvE385NkNVmB0EJ?=
 =?us-ascii?Q?hpVbNCe8RJmt+6z9Omxo9fbrX7VgxRcN0Oy+ngeTTm01MWMHeCnghSRt+cSd?=
 =?us-ascii?Q?Yc9oU/sLbKX7aQ8dkFikuzzgUgqh4SnaglKxBqq1i+HCqm2FxpiXYWoRtAtV?=
 =?us-ascii?Q?pYcJj2lCrGi0EtpeT0szZNakcxvslaNSwFO8ebJPBLu0betfvtmILC0pfB+i?=
 =?us-ascii?Q?wkvYyiszV5HvGl1iIaqO/kLgS5JZ7irw28g3cC21SN9GfPcC0bGd1LpW96T0?=
 =?us-ascii?Q?peO9H6jgWLaT8+KXut3a1zVub5TvFiTvcVHBMGi056jNXY1vsK1s5x330rwP?=
 =?us-ascii?Q?8A4pNtrcM8tWSUnX1brV1g/DJvQNCGDlqJdT97JWtjQcUuIkLmuXUFKSwJ/L?=
 =?us-ascii?Q?f3as0EKx9VLfGJOJ/rCDb2ZcNw4SNbOXtxk5XnRYKOzHDhQKLUY8mcAgFeTr?=
 =?us-ascii?Q?dfpH3WQAOyhwT9QVPBTE6vLob1Ru5olvg2Va3SQkNBOvjQiW4IROmUKcs8DT?=
 =?us-ascii?Q?o+EWf0MVrzLoeefWuP03JOh2/itLjgZt2muz0ZHEx2UBx72oyLSUgt5wC+zX?=
 =?us-ascii?Q?LYKWpPXFOkS8TdQyEL0QIlTrtEeXMQm5sL+GRaYFVQvW9CE4nDYdtCnhpYsZ?=
 =?us-ascii?Q?7i5iPu5yMGh1wAvh+qHl5ZpiNPa92ZMqG3oZP/IaHXUcoFf2crkzogiFHBlP?=
 =?us-ascii?Q?Gx/7UwKbMO8rRWFLGWEwicNLqZ3Sr8z4ElC70fov4lEvC1oYO39Pg2dMxW7q?=
 =?us-ascii?Q?RCwdVKTgGg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2472d1dc-b7a6-4f1b-74ed-08de5864b155
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 20:44:23.2422 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mXDBl8Sl8QVkcacUJdvDgtSeR7pNtb6ZSTTKP41q0p2Q2EhRaHz0ZSmppeiNjkDORlvt2HdjerVoweSNTz+Avw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9651
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
	RCPT_COUNT_GT_50(0.00)[52];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:email,nvidia.com:mid,Nvidia.com:dkim,gabe.freedesktop.org:rdns,gabe.freedesktop.org:helo]
X-Rspamd-Queue-Id: 4F4A64BA30
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add the BAR1 user interface for CPU access to GPU video memory through
the BAR1 aperture.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/driver.rs      |   1 -
 drivers/gpu/nova-core/mm/bar_user.rs | 195 +++++++++++++++++++++++++++
 drivers/gpu/nova-core/mm/mod.rs      |   1 +
 3 files changed, 196 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/nova-core/mm/bar_user.rs

diff --git a/drivers/gpu/nova-core/driver.rs b/drivers/gpu/nova-core/driver.rs
index f30ffa45cf13..d8b2e967ba4c 100644
--- a/drivers/gpu/nova-core/driver.rs
+++ b/drivers/gpu/nova-core/driver.rs
@@ -42,7 +42,6 @@ pub(crate) struct NovaCore {
 const GPU_DMA_BITS: u32 = 47;
 
 pub(crate) type Bar0 = pci::Bar<BAR0_SIZE>;
-#[expect(dead_code)]
 pub(crate) type Bar1 = pci::Bar<BAR1_SIZE>;
 
 kernel::pci_device_table!(
diff --git a/drivers/gpu/nova-core/mm/bar_user.rs b/drivers/gpu/nova-core/mm/bar_user.rs
new file mode 100644
index 000000000000..288dec0ae920
--- /dev/null
+++ b/drivers/gpu/nova-core/mm/bar_user.rs
@@ -0,0 +1,195 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! BAR1 user interface for CPU access to GPU virtual memory.
+//!
+//! BAR1 provides a PCIe aperture for CPU access to GPU video memory through
+//! the GPU's MMU. The [`BarUser`] struct owns a VMM and provides BAR1-specific
+//! mapping operations with automatic cleanup.
+//!
+//! [`BarUser::map()`] returns a [`BarAccess`] object that provides read/write
+//! accessors to the mapped region. When [`BarAccess`] is dropped, the pages
+//! are automatically unmapped and the virtual range is freed.
+//!
+//! Some uses of BAR1 are:
+//! - USERD writes: CPU submits work by writing GP_PUT to userspace doorbell.
+//! - User-space mmap: Applications access GPU buffers via mmap().
+//!
+//! # Example
+//!
+//! ```ignore
+//! use crate::mm::bar_user::BarUser;
+//!
+//! fn setup_bar1(mm: &mut GpuMm, bar1: &Bar1, pdb_addr: VramAddress) -> Result<()> {
+//!     let mut bar_user = BarUser::new(pdb_addr, MmuVersion::V2, 0x1000_0000)?;
+//!
+//!     // Map discontiguous physical pages to contiguous virtual range.
+//!     let pfns = [Pfn::new(0x100), Pfn::new(0x500), Pfn::new(0x200)];
+//!     let access = bar_user.map(mm, bar1, &pfns, true)?;
+//!
+//!     // Access the mapped region (offset is within the mapped range).
+//!     access.try_write32(0xDEAD_BEEF, 0x0)?;  // Page 0, offset 0
+//!     access.try_write32(0xCAFE_BABE, 0x1000)?;  // Page 1, offset 0
+//!
+//!     let val = access.try_read32(0x0)?;
+//!     assert_eq!(val, 0xDEAD_BEEF);
+//!
+//!     // Pages unmapped when `access` is dropped.
+//!     Ok(())
+//! }
+//! ```
+
+use kernel::{
+    gpu::buddy::AllocatedBlocks,
+    prelude::*,
+    sync::Arc, //
+};
+
+use crate::{
+    driver::Bar1,
+    mm::{
+        pagetable::MmuVersion,
+        vmm::Vmm,
+        GpuMm,
+        Pfn,
+        Vfn,
+        VirtualAddress,
+        VramAddress,
+        PAGE_SIZE, //
+    },
+};
+
+/// BAR1 user interface for virtual memory mappings.
+///
+/// Owns a VMM instance with virtual address tracking and provides
+/// BAR1-specific mapping and cleanup operations.
+pub(crate) struct BarUser {
+    vmm: Vmm,
+}
+
+impl BarUser {
+    /// Create a new [`BarUser`] with virtual address tracking.
+    pub(crate) fn new(
+        pdb_addr: VramAddress,
+        mmu_version: MmuVersion,
+        va_size: u64,
+    ) -> Result<Self> {
+        Ok(Self {
+            vmm: Vmm::new(pdb_addr, mmu_version, va_size)?,
+        })
+    }
+
+    /// Map a list of physical frame numbers to a contiguous virtual range.
+    ///
+    /// Allocates a contiguous virtual range from the VMM's virtual address range
+    /// allocator, maps each PFN to consecutive VFNs, and returns a [`BarAccess`] object
+    /// for accessing the mapped region.
+    ///
+    /// The mappings are automatically unmapped and the virtual range is freed
+    /// when the returned [`BarAccess`] is dropped.
+    pub(crate) fn map<'a>(
+        &'a mut self,
+        mm: &'a mut GpuMm,
+        bar: &'a Bar1,
+        pfns: &[Pfn],
+        writable: bool,
+    ) -> Result<BarAccess<'a>> {
+        let num_pages = pfns.len();
+        if num_pages == 0 {
+            return Err(EINVAL);
+        }
+
+        // Allocate contiguous virtual range.
+        let (vfn_start, vfn_alloc) = self.vmm.alloc_vfn_range(num_pages)?;
+
+        // Map each PFN to its corresponding VFN.
+        for (i, &pfn) in pfns.iter().enumerate() {
+            let vfn = Vfn::new(vfn_start.raw() + i as u64);
+            self.vmm.map_page(mm, vfn, pfn, writable)?;
+        }
+
+        Ok(BarAccess {
+            vmm: &mut self.vmm,
+            mm,
+            bar,
+            vfn_start,
+            num_pages,
+            _vfn_alloc: vfn_alloc,
+        })
+    }
+}
+
+/// Access object for a mapped BAR1 region.
+///
+/// Provides read/write accessors to the mapped region. When dropped, automatically
+/// unmaps all pages and frees the virtual range.
+pub(crate) struct BarAccess<'a> {
+    vmm: &'a mut Vmm,
+    mm: &'a mut GpuMm,
+    bar: &'a Bar1,
+    vfn_start: Vfn,
+    num_pages: usize,
+    /// Holds the virtual range allocation; freed when [`BarAccess`] is dropped.
+    _vfn_alloc: Arc<AllocatedBlocks>,
+}
+
+impl<'a> BarAccess<'a> {
+    /// Get the base virtual address of this mapping.
+    pub(crate) fn base(&self) -> VirtualAddress {
+        VirtualAddress::from(self.vfn_start)
+    }
+
+    /// Get the total size of the mapped region in bytes.
+    pub(crate) fn size(&self) -> usize {
+        self.num_pages * PAGE_SIZE
+    }
+
+    /// Get the starting virtual frame number.
+    pub(crate) fn vfn_start(&self) -> Vfn {
+        self.vfn_start
+    }
+
+    /// Get the number of pages in this mapping.
+    pub(crate) fn num_pages(&self) -> usize {
+        self.num_pages
+    }
+
+    /// Translate an offset within this mapping to a BAR1 aperture offset.
+    fn bar_offset(&self, offset: usize) -> Result<usize> {
+        if offset >= self.size() {
+            return Err(EINVAL);
+        }
+        Ok(self.vfn_start.raw() as usize * PAGE_SIZE + offset)
+    }
+
+    // Fallible accessors with runtime bounds checking.
+
+    /// Read a 32-bit value at the given offset.
+    pub(crate) fn try_read32(&self, offset: usize) -> Result<u32> {
+        self.bar.try_read32(self.bar_offset(offset)?)
+    }
+
+    /// Write a 32-bit value at the given offset.
+    pub(crate) fn try_write32(&self, value: u32, offset: usize) -> Result {
+        self.bar.try_write32(value, self.bar_offset(offset)?)
+    }
+
+    /// Read a 64-bit value at the given offset.
+    pub(crate) fn try_read64(&self, offset: usize) -> Result<u64> {
+        self.bar.try_read64(self.bar_offset(offset)?)
+    }
+
+    /// Write a 64-bit value at the given offset.
+    pub(crate) fn try_write64(&self, value: u64, offset: usize) -> Result {
+        self.bar.try_write64(value, self.bar_offset(offset)?)
+    }
+}
+
+impl Drop for BarAccess<'_> {
+    fn drop(&mut self) {
+        // Unmap all pages in this access range.
+        for i in 0..self.num_pages {
+            let vfn = Vfn::new(self.vfn_start.raw() + i as u64);
+            let _ = self.vmm.unmap_page(self.mm, vfn);
+        }
+    }
+}
diff --git a/drivers/gpu/nova-core/mm/mod.rs b/drivers/gpu/nova-core/mm/mod.rs
index 53d726eb7296..449c2dea3e07 100644
--- a/drivers/gpu/nova-core/mm/mod.rs
+++ b/drivers/gpu/nova-core/mm/mod.rs
@@ -4,6 +4,7 @@
 
 #![expect(dead_code)]
 
+pub(crate) mod bar_user;
 pub(crate) mod pagetable;
 pub(crate) mod pramin;
 pub(crate) mod tlb;
-- 
2.34.1

