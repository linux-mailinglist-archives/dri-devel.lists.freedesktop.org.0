Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 6CMYCQMsnmmkTwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:53:55 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C785F18DBF2
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:53:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6C5210E64F;
	Tue, 24 Feb 2026 22:53:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="H0fvtBsh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010052.outbound.protection.outlook.com
 [52.101.193.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0665E10E661;
 Tue, 24 Feb 2026 22:53:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ts9iGhrA0Sr+Oaz2j+N5mRpf6JVMVum7I4vxifRLdLzLmLR6NhSGdY0uRgY0FVUbUu8JYKaY4pe3Ajke+Hww70+jtwRw+3B5ruN94LfICRNVw/oCVdkR8wKKwdXzlMJrvEvSCXmozI1XqRvOyK7LivXIKw0tT16Xi9FXa1ekgIZBJBSA1RKII+fbGfIaRnpSzWQw4hbBBZGL4uoUX4iUKYe1qAgexqLn6hGrZcDcIfBujKfMR6fhhGkdT9HuVfM6mDkiMRl0t+1jdB+Fi79r4S3npNioHXGrwcCJLWhiSNt+5pDIikb/h4DJ5TnP6nOObX3sGADxYdTAbKONe7MMng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5LnvUzMJZ5UwmXtWlM5z1ltDRIxnT/1ctW1IEGuLbM8=;
 b=Utt7fwfocuXJ2vQx5POei8vEo2OtbT5PzJ2pRhYh0xMDKNDcuSKOebXCoOCPkAF+TnjSyQjLkZ4azKk6YmP52xz8QwA9pNRtE/EbtHiJ4YsVLeeolprD//gTm6XgxroJdIVvHHJarKvplnEWZNahKpB56FYq+KB2d/8j/0V9cjCoT9sBy3puFK7sUHVOLg0wGx1Rmob6/tzF5KZbXiijvQZ6CbjmnkDdfr2eZUGTXNRVl/CoyUcTmc3JbMX+DDJ08Px3j2mvnVY0/FJ6oWpRJvkZBlBDbhucWT+jCMcfi73LS1s/d76e76z8dEjjWrn3ruYcNd239+NNB6pxWdBn9Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5LnvUzMJZ5UwmXtWlM5z1ltDRIxnT/1ctW1IEGuLbM8=;
 b=H0fvtBshsJma4zEuGVtO8HkaJfWotyqLHO95RJvrgRVDyOLnVenCXIPCyyF/oruinLsF+ca0rCsBP60mRBkz0achRTjiUQOK33Kg9a84wBpl27i5lKV5WIES8j6I46VL/aytqQ9DEBILCdGVonPTnpyWN4PA7bR9ym2bQfaBLPDqWOUSPaloUBhD2I/KcrG/dJEpfMiXGViZNDXf8rNvMyCB2spea+g6CjrfPp1cUM5z09wV0pr0BAI4c6lK6st6mLnfSEwBZwCvAwB3JVqVUDeD9s+szeDA2xXuLb039x7H1ZX5166yu54TTXvtw4X/HGGXIWD0Vkg3MKLZDqHFAQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SN7PR12MB6885.namprd12.prod.outlook.com (2603:10b6:806:263::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.21; Tue, 24 Feb 2026 22:53:41 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 22:53:41 +0000
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
Subject: [PATCH v8 05/25] gpu: nova-core: fb: Add usable_vram field to FbLayout
Date: Tue, 24 Feb 2026 17:53:03 -0500
Message-Id: <20260224225323.3312204-6-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224225323.3312204-1-joelagnelf@nvidia.com>
References: <20260224225323.3312204-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR18CA0007.namprd18.prod.outlook.com
 (2603:10b6:208:23c::12) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SN7PR12MB6885:EE_
X-MS-Office365-Filtering-Correlation-Id: 66fb8f91-2132-4a24-c042-08de73f78e46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WbBeGvhdBgN0qNyC00gcNdhVsez+MK3OK5VFvuGDu+2nBNu892xaY0Mk6OD8?=
 =?us-ascii?Q?/mlTEu12/CECuJhGA7flnfde2Uc/NDOJxHUyOMXFXHihwfcrGzI7Vwj5KoIo?=
 =?us-ascii?Q?DxxjJUAi4aoeOQLaLseDavFsnlsqZiPpOqLO5gbELwqfHSWCWPWWL2UoluNm?=
 =?us-ascii?Q?p+5j2PY07EheuAhNmblFb2DlsPKJnqsZ697OXyGCURUcDNa7x3MgCePOZucH?=
 =?us-ascii?Q?aaKRThIvSmHBFaDGZ9+boFOw4O9WvHuMxT6DT+zFranU5qXgoy7jbMiPSPUY?=
 =?us-ascii?Q?AOM7lsom0rIM5LZEaO3U5xVD0xrg+58450X53Kv12o/6aS/q5o/2mEKc7K3a?=
 =?us-ascii?Q?Nn6c+G65DvqcCqm1Pd/uKeWAOQBh5PYyhYZG9uzXfRL0+Rq3Ejll3AcnFR27?=
 =?us-ascii?Q?JVIVEtS5ClQnaFixGctm5P47gG+4mOzD8+X0BXQRME58HpOcMDVYQUJHl3v+?=
 =?us-ascii?Q?hxF/3NmQKuVFae8TzcrCtecW6ImfWma38Tg0cbM1Wywx8Px6VvRTTBPHE+4A?=
 =?us-ascii?Q?azKStrTZFYD6b6MuF1t8KUBy75tOipOJq3ABbmrMAyvwt67ycxlzjmAaqL9M?=
 =?us-ascii?Q?MI1FhicVZBdEy6XrcxZNpc2avlDZP8BzUNIy1cmkS4BgezmMwDQBhzZjcQzd?=
 =?us-ascii?Q?xiFm6IdqhtTQCbCuYHix2WK155EPbBn91OhmUSkMuGHgud/VEG/kkB2CLvnb?=
 =?us-ascii?Q?gP+9n+vBiMEef70rNu1XCZ+FWwjFVs2mEU1p/dh6VQRlK9KcrWJvHq+Z9PE3?=
 =?us-ascii?Q?m8TLURfPQy8jfnBTnbqh1ToMGzBnr5S0fL9KlaRf7S0Ewoynb+pTW3at5WW+?=
 =?us-ascii?Q?ut58+nM+rSfiZCZD6zi5g/UERaDmy13KtZy0/bcD5PfVkD8x6Bo4NWGs5dAQ?=
 =?us-ascii?Q?5XJ1/ImTX+czuyziBHm8v5fOU7XRgMKLqHuPuG0FAXuX1DK6B9U7RICT5BNW?=
 =?us-ascii?Q?4gS3rvt8JO8AjkMfDv0+hmMXrhvWyg3OV0S+FdJS26uCcy0PLz+TrIIY/pBc?=
 =?us-ascii?Q?26J+c9MasN+ivZyqcLJzQO44Zwrek0dseIHPrdZ7tWTybtrG/G1ZaWEOFSpp?=
 =?us-ascii?Q?oTrc7AWJ8AWKCqBlLhLtdDoD7XUR58vmUnh+1yWRbvwvU8RvQTHY8eWkV0OA?=
 =?us-ascii?Q?GRndnfxBGkAd0KAUADCwmtaOlVYksZGNmmkS3a/bQorxO5fc7ArCsv4Hcrgx?=
 =?us-ascii?Q?t8FhDzjFAYjZKC1wYi2HIatJG3By0aoPEvxi749ZCXPeDacvVZpq9+lgyjpr?=
 =?us-ascii?Q?T9ooC1w/fhsl6DhEWXLWs6aW8fZvz57fNFyfPPAu3gpGXZwsHBu6yIqPOsAZ?=
 =?us-ascii?Q?64QCM2cUfqz0dQO+x8gkJlh4nthZuyek71hEDHUpjQ4AxlbWQALbt1JxAkUs?=
 =?us-ascii?Q?H3LC4xfU/lCgp1t0n0K3k7ZdP9UtVJyIiB0qSHOM53fTdUu9zGPjWo3T1KlW?=
 =?us-ascii?Q?3gKz9975M+pZdP3/fkUgbpEQCWfqEySXBqr689+37YkMSxO2+vFKmCJAtH4m?=
 =?us-ascii?Q?tbLjgizs04KNuj9kJarms7lWTK5Wnni5aYCAptuqEbVeVF1P8fVG5LWFqoz1?=
 =?us-ascii?Q?rIGfA22PAZ57l2fdUF4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0xtMHVzcbV93mlQ9b/iWNSf+RSfzRvSelWyBTtThdEiQF6iWuoLgEXvi1phz?=
 =?us-ascii?Q?EJPvNsY+vdglensgBoyj4CwvoeSxc65wMYm8dR1GC6cP5U9FL9GIn0uA8D40?=
 =?us-ascii?Q?dZB+jQRIpwJDLL4MeJSxTS5x9emeuq8hxSeADl0KuHCVBTSh7fAsfPpJdwNM?=
 =?us-ascii?Q?XPrgTewKHdvr3o9OfYjzYJZmopaVeR88R44q51bWKix1lALk9Cf9FBHxx46b?=
 =?us-ascii?Q?dIcDtz3l32sHTPBNLMyKpBniqJmNu/eYQw7qqbixmBUAswAa7FE6qYKSZNtq?=
 =?us-ascii?Q?j/st4doI9InL7VMf2gV+d3xou9amKKQa9qxc+zx4fcaUYA3V6zZeXffs8GX0?=
 =?us-ascii?Q?bGuCnmoH0jr5DJtb3xwmFVCCgej4EIU0R5T+dGesoq+NzyW23NqdjJRYS+Gr?=
 =?us-ascii?Q?4WebogE5kWR3KvNcBQblm9qET91U921RxnYBWZYzq/l3nWjd4Ai+COVhzdkh?=
 =?us-ascii?Q?RwA8sd7leOrrxO4plh5SdejNOR1TCHekulGpXCh8HU1pV9GMnDuQX1hq7P1G?=
 =?us-ascii?Q?GmuwiVXmU2OEhF6Qm8VJOUi1mxH9h+UueQC1JoR7frdZm2xeVJRi8jKeDYNb?=
 =?us-ascii?Q?a0I8hrGVrkS5NR3CUyQIAuLKEDB4yRKt07DZpMxsVu2fIgoy8LFIU4dW3ECO?=
 =?us-ascii?Q?Ev1HhghjluYLQeM1gfXpUH8bblmzoQUvqflqWwx80p7BT+gk/0pVS+itDWcb?=
 =?us-ascii?Q?uYvIiRrieWysHQuC4DZ1MaSD8u9vwtWRspUag+lyRP7eeaMuv5aamUqnohs4?=
 =?us-ascii?Q?grhYVwz3RomtP2xwaeQpBsnnTxc0xnXlm2ycW3CkhyORXY9gTV8rkrTslRXN?=
 =?us-ascii?Q?vrNoSrlbuVJT282iF9kEZodUnMmrbjyRSGBwCM/FUz70NsEF7T26s3HTYNPe?=
 =?us-ascii?Q?AivrDaSEByLBgpLLsgix/IEb6s1G1wyJ7NdZA/5tNUtmbJyOuQpUdRHMD83c?=
 =?us-ascii?Q?aof7poVZu9BEm4uWEPXLrd66ElTS3mfjBIpvAtPVzdY/OD5Ng/+7CHjfg4Oy?=
 =?us-ascii?Q?Qx6sW+mr78F8/+4XvkrXhLkKmR0SDsdNHid3AulX22i/bWD6qGomwE0Pyuom?=
 =?us-ascii?Q?E/qmeXujSJQ1QMXqPncCa4GikWoJ/rKfsNtSz8vVuojBD5IDQ1FC/mjlTa5u?=
 =?us-ascii?Q?2zNrrYX0NMQQPdofdXjIIkBEOXp5philDExZDf9WGd4dBSufC+NfB2c+tABt?=
 =?us-ascii?Q?IU7Pwc0/Vl7VTWMbksVQPZ8ASiQnyUhVjorFqdXGGfYHstF2yv3oIMsoiJWs?=
 =?us-ascii?Q?PY9ISb/rV7FqbEDB0D3jPFjgXaw02h0feItjRZsFx/bNCHkeKYP1Lp2y+2Oa?=
 =?us-ascii?Q?icrRLS46wrKhCKbJwyT6402/biXOJljD06eouviMhDZC1/5yrK8RlnlSUbck?=
 =?us-ascii?Q?5AySSdXtrmUamjCI0DNiuNHMDNdTG1R9eHWbHja2xsa+Hg1FknHxTor8RyCt?=
 =?us-ascii?Q?zD9f2bjmF8pWpr8uIwbN77Ihx/eqChwJixrSUpw9aIRfHGAqcrVYEic95XPn?=
 =?us-ascii?Q?7QZEGThbaWv0GsQ7Vm0wwn+Fl6FCk/zbuI2HZXe1sIuDWJpOwEjSf2SW8vsE?=
 =?us-ascii?Q?8tpGcicY6L7JSHFgAolsaoS38cB3KGORWibxN9xbBzNswjp2j0EF5BRt7se5?=
 =?us-ascii?Q?PRhzOnZj//HdY8J4Bf4fEHny5ZvzYy1CkVrBxIZERinCD89B8QBBZLDL9dEl?=
 =?us-ascii?Q?3Fo5/1qpOadfV8UXyYbnis/p/2NMWKS52JfZIjLIrr+VNGHmPI0ACKOtIPg6?=
 =?us-ascii?Q?kTPuSBoXvw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66fb8f91-2132-4a24-c042-08de73f78e46
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 22:53:41.5956 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ug/dJPfJuBKJbrIhmsfg9VZqLyD7IJ9ueLgE7iGdrxiUJ57usxk7TJeN/8cXxfiNhfSdQVH78UWFzexhelZTtA==
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
	NEURAL_HAM(-0.00)[-0.941];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: C785F18DBF2
X-Rspamd-Action: no action

Add usable_vram field to FbLayout to store the usable VRAM region for
driver allocations. This is populated after GSP boot with the region
extracted from GSP's fbRegionInfoParams.

FbLayout is now a two-phase structure:
1. new() computes firmware layout from hardware
2. set_usable_vram() populates usable region from GSP

The new usable_vram field represents the actual usable VRAM region
(~23.7GB on a 24GB GPU GA102 Ampere GPU).

Cc: Nikola Djukic <ndjukic@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs | 26 +++++++++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index c62abcaed547..d4d0f50d7afd 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -97,6 +97,10 @@ pub(crate) fn unregister(&self, bar: &Bar0) {
 /// Layout of the GPU framebuffer memory.
 ///
 /// Contains ranges of GPU memory reserved for a given purpose during the GSP boot process.
+///
+/// This structure is populated in 2 steps:
+/// 1. [`FbLayout::new()`] computes firmware layout from hardware.
+/// 2. [`FbLayout::set_usable_vram()`] populates usable region from GSP response.
 #[derive(Debug)]
 pub(crate) struct FbLayout {
     /// Range of the framebuffer. Starts at `0`.
@@ -111,10 +115,16 @@ pub(crate) struct FbLayout {
     pub(crate) elf: Range<u64>,
     /// WPR2 heap.
     pub(crate) wpr2_heap: Range<u64>,
-    /// WPR2 region range, starting with an instance of `GspFwWprMeta`.
+    /// WPR2 region range, starting with an instance of [`GspFwWprMeta`].
     pub(crate) wpr2: Range<u64>,
+    /// Non-WPR heap carved before WPR2, used by GSP firmware.
     pub(crate) heap: Range<u64>,
     pub(crate) vf_partition_count: u8,
+    /// Usable VRAM region for driver allocations (from GSP `fbRegionInfoParams`).
+    ///
+    /// Initially [`None`], populated after GSP boot with usable region info.
+    #[allow(dead_code)]
+    pub(crate) usable_vram: Option<Range<u64>>,
 }
 
 impl FbLayout {
@@ -212,6 +222,20 @@ pub(crate) fn new(chipset: Chipset, bar: &Bar0, gsp_fw: &GspFirmware) -> Result<
             wpr2,
             heap,
             vf_partition_count: 0,
+            usable_vram: None,
         })
     }
+
+    /// Set the usable VRAM region from GSP response.
+    ///
+    /// Called after GSP boot with the first usable region extracted from
+    /// GSP's `fbRegionInfoParams`. Usable regions are those that:
+    /// - Are not reserved for firmware internal use.
+    /// - Are not protected (hardware-enforced access restrictions).
+    /// - Support compression (can use GPU memory compression for bandwidth).
+    /// - Support ISO (isochronous memory for display requiring guaranteed bandwidth).
+    #[allow(dead_code)]
+    pub(crate) fn set_usable_vram(&mut self, base: u64, size: u64) {
+        self.usable_vram = Some(base..base.saturating_add(size));
+    }
 }
-- 
2.34.1

