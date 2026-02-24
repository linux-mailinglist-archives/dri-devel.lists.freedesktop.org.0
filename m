Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id mLUvFBosnmn5TgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:54:18 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD2DE18DD3A
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:54:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3990110E6B4;
	Tue, 24 Feb 2026 22:54:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="s5te/amN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011004.outbound.protection.outlook.com [52.101.62.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD08010E68F;
 Tue, 24 Feb 2026 22:54:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CY2WEriKJTp8hZ3ARYIJwRcq5lx0Qk8/qNLJs8KpAt51kpgxn6Ph8gvMDXyi3APWaAETH4MfvtL7VwQLzD+DFqbolcyazOvdkVpreXQnw75RbVXqwC2yoY0xTcVAaDL36CQOFcWSarOYs0MwIHDyu4vNzOE0hPkMSJ1qhDm7bLo3c5tLX6R9Uhi/bu3wl1v71nOJBySU8ACm1Z0R8O1ytR2+vg8aVWU13oS2K09SnnI3zz0xvDb5Um4GWZXK0Ta7CzzrclgqTQ6e07T+PO2D6ckS/XPkI5GXzXaItIwj43jiGx+eVoq6HipquWUkZ9dJNVsVtF3zMwtKDoXyMPSprw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dgOw+wd+nKjMfYqb5M9KNTkWu/50KdaaXd4EdDyQ0r4=;
 b=B3MaoYcITugRfKyU2cQRI4FyL467XPFDY03+z+P0U8GmiP5RkyMfswELDHvtGfab6dN2kFv0d/WuE+wL6SOzWV787TX9/QjOc9hTKxX4jy4pYs7ufWZ5XH9CYG66aneXwsbLLjZ/j9BYhYRbDDNDH56ZWFTVpbN7DaQSLAajqZ6FxJk1frG6XPKe8OTNbdVD2J4wFCTWxBTZqbebAYjDKTB0tuOuBfE1un7k/M1Wow35pjuIYBOi+I7oAP3uupv+8782Y3pWb/1+f6xa8g23vB+IRslhiKmO7FSHUzb2mx1OGHvzC5KOyqIOtOYlrrDUG++0iJ1DXOhTcCize49Fdg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dgOw+wd+nKjMfYqb5M9KNTkWu/50KdaaXd4EdDyQ0r4=;
 b=s5te/amNOS9HIDCTaPA1Osu5VDUcCK/sUYnUGmtSvOF2uPwo4yoguqmuH46JCM0YU0XSXCf7uUk+lePLZn5qL2XE7dyeYCgMeuyzcGluLm2y5DCBLqeycImaa1mjD7taiVor3Vy9R8QFpIYlXtePQh3Uy5spLE++F5nJrd2Xnyvu6RxEDdf1c9V4GUG0Cq0mXx+tcKeAVoIV+1wGoFxYVoN+Z6+y25jvb9OJfmvkCoxCeIU0M0Kp9rXDkO2nHeXb/3Ue6IU1l1VtTli/hvoJAYJKgTTsNznZb1MlShm9ImtNHTRSFf2lM87zkuGA55gpvSDP5vz8G2qJDmGLOQHyNg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SN7PR12MB6885.namprd12.prod.outlook.com (2603:10b6:806:263::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.21; Tue, 24 Feb 2026 22:54:01 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 22:54:01 +0000
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
Subject: [PATCH v8 17/25] gpu: nova-core: mm: Add Virtual Memory Manager
Date: Tue, 24 Feb 2026 17:53:15 -0500
Message-Id: <20260224225323.3312204-18-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224225323.3312204-1-joelagnelf@nvidia.com>
References: <20260224225323.3312204-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR16CA0053.namprd16.prod.outlook.com
 (2603:10b6:208:234::22) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SN7PR12MB6885:EE_
X-MS-Office365-Filtering-Correlation-Id: 539501ac-efdb-4bd2-f857-08de73f7986d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?a0IvTvelzkude0DEs9OuShke+gpKaPJ7uR+/NpMXOjp6GZwTtusWk3pjTj6k?=
 =?us-ascii?Q?FiCFtfEY9zIovWeENTMDvq4dPi6CYxMp55oFM6vfJLqLq3Zc+99PT54lqo8X?=
 =?us-ascii?Q?voTPzU/H2jp4Mc6yf3/2edvkuNRMmytu5x6Du/da788027JuQnn6XITtvjfC?=
 =?us-ascii?Q?ciUntw4VdAaoBxo5NPNmxz/EKnnZmYlp+rcynZOQzZwKHNxxHxfAWnu0n8nv?=
 =?us-ascii?Q?rt46noOmlKQPCVZkelcsiJagUaQQh5GdY8IY3adJGuaqx/tDWOaGsd95IcK3?=
 =?us-ascii?Q?E8q8KdY5fRC4qWx/XFToNa2X6D0aKTNrRZ4oa7Xm/ATg9GmsooOIUWBlrITF?=
 =?us-ascii?Q?yFosf58Rv1vTTOR5mSahavq8FxNT9ZHqPGNl3LZmTsWbQyCKP/UsgQPK4d47?=
 =?us-ascii?Q?wq4Qukx7lZQu+vBK4o5o6BFFpBPYI7gybmUAXmL4im9FhMeke04j2zp7td7P?=
 =?us-ascii?Q?kTRj8v+9SGBxdPycD1sN+j0O3wUkAtQFecpbLxXO9m7ZWto7NPy4vYDvfrJh?=
 =?us-ascii?Q?JU1tCfxpYpcmdoXxp9e/ZJX9cESJ0Wo22m7yxadONMxq6Yu5bRE9fqMhL8Ky?=
 =?us-ascii?Q?L+91ohlmHyQcj9ps/KDSbl0Exao9GPkWttQRPtP488zXIWcU1NbRKu/NBIzt?=
 =?us-ascii?Q?w1o4Sp0g0IqvUUbbm8hI1I79JIUMrFlVzrZhDczsUZspoVRI1jiDiD7XTHKv?=
 =?us-ascii?Q?8m6zrAWS9fvCnnt0A32d2fmilSLAtPlScIsVE4PgQhn7oPkivT+RVsM6ZsA3?=
 =?us-ascii?Q?igrvnAaUH/Iu2a7JlorDiH/IGpZ62XIB37hedCbN374AdxH54PP51Tx0IURx?=
 =?us-ascii?Q?LBFkvEQiBR6QOpRvI+WSM/0DluWHbhp73DWirNa1vLybOtgwgUN98AVBiCiI?=
 =?us-ascii?Q?i4TImjEjZmuOadwCIoYY3flE+MZR8FA4Sva7QffKx43iCgpDuk3CD+3ciqyh?=
 =?us-ascii?Q?MuNJfH43q8hHOBlDw/EwRwHDF+6yzF/SNt2G4K+RxzlwayiL83k0gXzabvlZ?=
 =?us-ascii?Q?azmYuhJROjaWCxrgW0OaO0W+24LasOwRRmhbzaCtuqEc5zJJEwkd3igsVya2?=
 =?us-ascii?Q?OquVFlzYiwLth88MK/SJ0ehRoMHpBDg/7gPJdt5BY4AKiwArFctbZ0TYMfM+?=
 =?us-ascii?Q?iD2FqvvKhorSciOEQZgPojv2KoRYAV8pHxwiGm6Ou/Rkm5Pz67SVliH0Fy0Y?=
 =?us-ascii?Q?SXKmUOgNICtd/f7eAid2M1ZvuLJ4u4fLx4ONLZZZ4Apd1gyDu45IJo8C9kHm?=
 =?us-ascii?Q?w00a94P9rLF+X29XPiu1NxGM5TiDxvuLxR/Mi+i9AFyPL9DFEsm00AxmpYeI?=
 =?us-ascii?Q?XAxY8yIH+1S2q7oT1aR2PxHsE50CAZsfT3OXDPPe6yKblTWBpGU7NB5xcwZK?=
 =?us-ascii?Q?qMK8RjREdZr3119tD4pJDNum25JW6QA0xLscFanTvBLsEbXN3bEJl7QzAfoW?=
 =?us-ascii?Q?+MUIWkXUW5nnR6ukg3tXUlnjeKGhwixF3pwqcHz0A5EEJgItGlBKgNEdN6Ga?=
 =?us-ascii?Q?h1DxLs/DMohItGgj6oG+Teq5+ZqzoxftXrf0lSno5MMYTvDuOq9qGGA9tfct?=
 =?us-ascii?Q?rHZkGFRLwvQHH+mrHGw=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i8LLL6vhyommBdBUnT/sXbA/HV9zIb9tGg602iYT77MCrqCWw70bR5E8xnX4?=
 =?us-ascii?Q?wB4+nk9iNLvEwOg30/Yx2culAVl594S6fj98pSX9XRW/n4IER8sb5e3GF2sG?=
 =?us-ascii?Q?pxj+PVecOxsbw6jf0hlPO2keatXyvR2cYvPuyq0j4NIlrnFjz3ihsb+w1cG7?=
 =?us-ascii?Q?kw9GDRoLiruawKTOX+KJ8R/13UsUX3GexqFcLJVv11ETRKg5c/kaWvKddeXU?=
 =?us-ascii?Q?n1lmgcUKLBNLa6yB7Xxe/t1nYFlP3jJGZDfmbMRAqpRRmDBMEFWzZrKvjYAz?=
 =?us-ascii?Q?nTwJisHj3s9jwnUex7wM2iyY/WeQYhLswF8s2kh29nc1z2S4CCU+Bmoe5u5W?=
 =?us-ascii?Q?QU5l6JLvF/X8pat0YkN/Sarf5e8ndXmtj4MVQsNeaT6XAqz+ri0IEy9kr/nV?=
 =?us-ascii?Q?MGrFs/7uuWSoY0P3QwjR2Avf1wuFUkAVp3iFywEahfrMde0JG4C0iT1BRO2I?=
 =?us-ascii?Q?bpJpO1lGw619Ac3fcM4xzQJslu4Hp8xNLGNnz9RXuJtYWX5Lg2T7TkfvElN7?=
 =?us-ascii?Q?oHfHQ2wc+zrXqykpR2hHmA8ohhsGUJzgGpm1auESsDY2zFiRI54JL1owwsNu?=
 =?us-ascii?Q?S4Lu/kebEasCGP9pYBuNbyGekyiawNRbu+WRBqbzyYRcwkgQ8YWRvCRVYyk2?=
 =?us-ascii?Q?A6fGHmAcpolgsZJ6Qa9MDzdPi6WwJFiRKsXm5PvhZCW+p7lkq0Ye1G3mRtPM?=
 =?us-ascii?Q?ey9X2ZBTc7IoFXjqC8nQydAyspcwJehl7leg5NVktcg9lf4WvDAflsT0ae3s?=
 =?us-ascii?Q?HdT/qnry3ZvyDUHFvqj2cyNNL5V+KC30LGskGeD1n+li/0qcvv+Bs9zio2ja?=
 =?us-ascii?Q?dTvFjask3UgeuGd1YmivAZqpTs6QPX2KTnhQN74+ibXFoi5VEKRNpX34xpxD?=
 =?us-ascii?Q?TSOqxEu1vNC3eOXfQZ7zE5mSkVbADCxQ27Idp1ZeaxcYdYSCIWKImnoZ++7l?=
 =?us-ascii?Q?Jni0peEBo2AH3x4AVfe0emGqPl/uPE5WtHTiroNayIquIuj295ty5VmUOmRB?=
 =?us-ascii?Q?Mj3LnKdXBRNqfikmrRzu/ZRsUr3mvAuTj0QSp6EdqnhR4UkokDeNvpTb3KQb?=
 =?us-ascii?Q?MLardu91Y9RpMJGB8QANKAHczUR1VQ4QbOG21luh4m4coF1PyokWyb2PY6fq?=
 =?us-ascii?Q?xaMpOb9s3WrzxqAvtIrSktYuUPRYALp54J5b87UTARxZw5Qf1uN7aPSeWRo2?=
 =?us-ascii?Q?WBByTCdb7L3zFjjw8qoUve+r6h/hZVuT2b6VNtPx5tlOXMs2rUjbZz8WjmSb?=
 =?us-ascii?Q?rIluqjR4LCAgRJWtQA2G7DOykazTUKaylC7+3/67XGENuNCJSkZlv3JDqjkU?=
 =?us-ascii?Q?NchQfPpEl7Bgc0oeaf+YeL5SzFWlUaYy/u94SY9bzr5RILQWy2iLyAyMzRfC?=
 =?us-ascii?Q?/KJSaM142T9r0C+pj8OOFkaKyCeH/bJ3IsYCGpJYgFPNCRQwUy0oZ8kKQckw?=
 =?us-ascii?Q?Ykw4UqaoYHwkOulteh5Z7N5uEc/47c76KLMha+Zr5W0pqSd9oQ7ra91dxtBw?=
 =?us-ascii?Q?iuPaWKLRuM53tHb0pvKGWcaT9JnVEaF8r2+6XweN0Ps5FjOrhKrdMJQzIxD1?=
 =?us-ascii?Q?iTfwg19jgTKmijkjVh1+kOarkyxXpTMbgvwJXw2h0f6DRX8DUN4xM4jo7ypE?=
 =?us-ascii?Q?h0eBcTF5/8y+8ONEm7ToN8RvlybicbaN91nrU7fRdgzn5fmoDzcLZJiqWvUc?=
 =?us-ascii?Q?16GMVvmeEZQN1ewVfsPnDTe/3coZombjwdsUqJxw/addTaeyU6uO2gKs2bYb?=
 =?us-ascii?Q?q8nNkOuILg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 539501ac-efdb-4bd2-f857-08de73f7986d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 22:53:58.5766 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LPGSiJTviaY1CVqTGsX+mCktGcJZ8ofm0PpUKRL+wQ7+GIZYQgnF9aYRWqsUprf5JilHQq6uynMCwIGvnSVZfQ==
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
	NEURAL_HAM(-0.00)[-0.938];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: BD2DE18DD3A
X-Rspamd-Action: no action

Add the Virtual Memory Manager (VMM) infrastructure for GPU address
space management. Each Vmm instance manages a single address space
identified by its Page Directory Base (PDB) address, used for Channel,
BAR1 and BAR2 mappings.

Mapping APIs and virtual address range tracking are added in later
commits.

Cc: Nikola Djukic <ndjukic@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/mm.rs     |  1 +
 drivers/gpu/nova-core/mm/vmm.rs | 63 +++++++++++++++++++++++++++++++++
 2 files changed, 64 insertions(+)
 create mode 100644 drivers/gpu/nova-core/mm/vmm.rs

diff --git a/drivers/gpu/nova-core/mm.rs b/drivers/gpu/nova-core/mm.rs
index 7a76af313d53..594ac93497aa 100644
--- a/drivers/gpu/nova-core/mm.rs
+++ b/drivers/gpu/nova-core/mm.rs
@@ -7,6 +7,7 @@
 pub(crate) mod pagetable;
 pub(crate) mod pramin;
 pub(crate) mod tlb;
+pub(crate) mod vmm;
 
 use kernel::{
     devres::Devres,
diff --git a/drivers/gpu/nova-core/mm/vmm.rs b/drivers/gpu/nova-core/mm/vmm.rs
new file mode 100644
index 000000000000..0e1b0d668c57
--- /dev/null
+++ b/drivers/gpu/nova-core/mm/vmm.rs
@@ -0,0 +1,63 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Virtual Memory Manager for NVIDIA GPU page table management.
+//!
+//! The [`Vmm`] provides high-level page mapping and unmapping operations for GPU
+//! virtual address spaces (Channels, BAR1, BAR2). It wraps the page table walker
+//! and handles TLB flushing after modifications.
+
+#![allow(dead_code)]
+
+use kernel::{
+    gpu::buddy::AllocatedBlocks,
+    prelude::*, //
+};
+
+use crate::mm::{
+    pagetable::{
+        walk::{PtWalk, WalkResult},
+        MmuVersion, //
+    },
+    GpuMm,
+    Pfn,
+    Vfn,
+    VramAddress, //
+};
+
+/// Virtual Memory Manager for a GPU address space.
+///
+/// Each [`Vmm`] instance manages a single address space identified by its Page
+/// Directory Base (`PDB`) address. The [`Vmm`] is used for Channel, BAR1 and
+/// BAR2 mappings.
+pub(crate) struct Vmm {
+    pub(crate) pdb_addr: VramAddress,
+    pub(crate) mmu_version: MmuVersion,
+    /// Page table allocations required for mappings.
+    page_table_allocs: KVec<Pin<KBox<AllocatedBlocks>>>,
+}
+
+impl Vmm {
+    /// Create a new [`Vmm`] for the given Page Directory Base address.
+    pub(crate) fn new(pdb_addr: VramAddress, mmu_version: MmuVersion) -> Result<Self> {
+        // Only MMU v2 is supported for now.
+        if mmu_version != MmuVersion::V2 {
+            return Err(ENOTSUPP);
+        }
+
+        Ok(Self {
+            pdb_addr,
+            mmu_version,
+            page_table_allocs: KVec::new(),
+        })
+    }
+
+    /// Read the [`Pfn`] for a mapped [`Vfn`] if one is mapped.
+    pub(crate) fn read_mapping(&self, mm: &GpuMm, vfn: Vfn) -> Result<Option<Pfn>> {
+        let walker = PtWalk::new(self.pdb_addr, self.mmu_version);
+
+        match walker.walk_to_pte_lookup(mm, vfn)? {
+            WalkResult::Mapped { pfn, .. } => Ok(Some(pfn)),
+            WalkResult::Unmapped { .. } | WalkResult::PageTableMissing => Ok(None),
+        }
+    }
+}
-- 
2.34.1

