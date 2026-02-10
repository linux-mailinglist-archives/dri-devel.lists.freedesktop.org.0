Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IEZZInGQi2nkWAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 21:09:21 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0493111EE9D
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 21:09:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D16C310E3A9;
	Tue, 10 Feb 2026 20:09:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rJ6ua7pj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010053.outbound.protection.outlook.com [52.101.46.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25EEA10E00C;
 Tue, 10 Feb 2026 20:09:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HFa6XEuQvY3YmfuSFaXyg8AKLvyDFOScsztvy5ZxpWQ21hhqfE/no5XFhQAFVYJQjuB/4kIZeyyszJV/6hqonP+pmY1DfyxVqLo1Fd19DhrKoE6Ys0kCVWCGWFi2qNX5x8y+GocSHadOku8nSsS2FR74fFMWYRdz9GSXZJttJuqcW54I/vU7nlwv6ERU+rSkXi9FD0Sfli+nPySNEGUEgM8ZZjOU/p2L2omZ9tDa3yf8OZcsht+OsIixy3b8ZJDk5BL5ciIMObQJkjpmTCye6DeNjwqe4Naba6myCB+oDxvHw83XamcYqQVq1UGV5GjtiWMf9lMke6RmU73xZ2AYiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jZ4+chmas31OUL6N87u/D7q7qhVmMGBGoBxUWAe7d6g=;
 b=SOQBTLJdSV4D9CpVX+iBlloWk+hBNZYvUMECJ1xsrLEo3ycXaNl0TnMQ912CBUZ6uNf5fMtFAUAhyoj6oV4ONKRTYuBSiowE1kCv8mQCmqw5GIgr++OpmW8A8fKmrYH/xe+8Uf2a8IIMtY8LAF1oDBO0w2QunSngKplosKRs5ZRatQKlrrg7NoPs9d/5i3bX/CWdplEyut5EvuFJr+jYEiztF2OIkr61XKwBNKl9KZuX9vXXV+MF36sv4hRDdB5pZaL38es8e+OTcMN77J1yk/yZDZT9OvLePO3ZjAEoSeX2OVkLEisAlMQlSQY4RLCT5HrDz+FKzGuqKbGUK78mtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jZ4+chmas31OUL6N87u/D7q7qhVmMGBGoBxUWAe7d6g=;
 b=rJ6ua7pj4rZrFNynK67jvdN/ZQsELudokWMOvddL69hFmwRLd8v0OqV9t5hnKOhJfEm09bWAafVn5C4wPTnEr0P7ifkhbKqGa5EbQCqMg2CoG4j261pjyDMfkcqE2Y0NBSJfJJRJXMfmv0X8cEnRz5ER8RZCYg8k9xAurSDWWiA+iuVf2BJnrpnmeisMa9FtlF2znid1CORXFu/PtnfB/Li7xn8xK/nmCxygsL4k3cfboarQaOMrRTU/k1/11AOiTFBYgeLGGDp5okQUu9C+XFZuZgRGeWy9io3SmAxe9jiNUG4N6ADRe1axKGiQsmUn9Cl3vJx74LWnID0TKYOE+A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SJ5PPFCB5E1B8F5.namprd12.prod.outlook.com (2603:10b6:a0f:fc02::9a1)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.20; Tue, 10 Feb
 2026 20:09:07 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 20:09:07 +0000
Date: Tue, 10 Feb 2026 15:09:05 -0500
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Vivi Rodrigo <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Rui Huang <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Alice Ryhl <aliceryhl@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Andrea Righi <arighi@nvidia.com>, Andy Ritger <aritger@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Balbir Singh <balbirs@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 joel@joelfernandes.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
Subject: Re: [PATCH -next v8 2/3] rust: gpu: Add GPU buddy allocator bindings
Message-ID: <1770754015.1979311.8126@nvidia.com>
References: <20260209214246.2783990-1-joelagnelf@nvidia.com>
 <20260209214246.2783990-3-joelagnelf@nvidia.com>
 <DGB9G697GSWO.3VBFGU5MKFPMR@kernel.org>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DGB9G697GSWO.3VBFGU5MKFPMR@kernel.org>
X-ClientProxiedBy: BL1PR13CA0197.namprd13.prod.outlook.com
 (2603:10b6:208:2be::22) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SJ5PPFCB5E1B8F5:EE_
X-MS-Office365-Filtering-Correlation-Id: 32f49907-22ed-4507-7e0f-08de68e03f24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HrlNwSasCOdOCnrYsdptgDyluhHg/qik3SoA0EBMoLwPkhobCWnKT/MvS8b8?=
 =?us-ascii?Q?/+BoRLq4mK+EOYj1w7KiWgj+PNZiE+bQO06lV5xb2qiLd0AHUoCQl+F8Y5cF?=
 =?us-ascii?Q?h+8nqh51aMRJMrg1QMpOtMB41s+r9Zzps0+DhQdph7Q1yrN1dYRNIKPf3IKL?=
 =?us-ascii?Q?AjWC7BQzYjvZ/wkQr8CgrQJgP5aGewkmgQ9ZYCfyZ85vNDUoUoZt0duvv9WL?=
 =?us-ascii?Q?z9gQBU5wz7rxmMDle765pROYFUNuSpsocqZKSoLsx0OBSwC0xteLKlSm5D83?=
 =?us-ascii?Q?esFYkNHbmjXnxUZvvS0b9qws0UeJ/vpS/tZ6ufaYFQJOEkLxFI84olD5Wm1/?=
 =?us-ascii?Q?dRfeKrM3lQ4Dfey2U8NhWoAdmhtfbGbSdZSZ3rtXDtf81UczelaSclp33FWb?=
 =?us-ascii?Q?/Kx3M6l+TpIXaZhbm0B/nytos99dY1NltybwOrpS6+1BHy/nuxUXg08WIq/B?=
 =?us-ascii?Q?K8eDCjJFpSlHIt7tJUpGVZvDtYZu8hYpBUDlsLCHmVpuLMNwjGsFCm1ZgUS7?=
 =?us-ascii?Q?UNpZyYn78uYZEzYEgn8FANRQbF5O8tGE7ozMqgn7JQe/u7p5DE18pGcd2rXx?=
 =?us-ascii?Q?kJ+qov1nk1GRKbg9CPRJ7GMP72LDs+aHxH8blNtUemZKZwu9dZ/NUtdQyfb4?=
 =?us-ascii?Q?q0XQuZvdaDrdvw40UfSF0j5KyCaAXGn8d6WTqBHZDQeRlDXZgnSjDSBKtK7+?=
 =?us-ascii?Q?Mv6IEsCu1VVTUAfQe7bF+py3ssV54Brm3oNLhh8fpJRq5c1syvSE3X6p3uKx?=
 =?us-ascii?Q?jlnycV9Oi+ABNylHUhlf0YP/0jSH2/9ZhANteJndYZAy3aaf/GPEMk20AhMJ?=
 =?us-ascii?Q?J5XIBv8v9h4cfBASkhOLxCGV2GKESqE+I8vNd+mzV1Bs4TDP87e5DDJPKIoj?=
 =?us-ascii?Q?EtT+waZ7eVAcfqZAAav9qC+aXPNoW4Ce/liBXbiDG0TA6Rc7sR2MuCM/BZbU?=
 =?us-ascii?Q?45e5XPvg6b9ZPT2FY0yKbWnOOOJrPe/b7E8QICY9a9/iGswdvl74iCcS1NnQ?=
 =?us-ascii?Q?Mzp48eKKip4zy8m4xZeyvR8Qi9pbvr5qD7rAqegZOL5OdkeVyqtGk7gmiCxI?=
 =?us-ascii?Q?AR25x1AIOBzP9jKqVmk1x/XZ0yr29dS3M0Y5qUgpijgg7FJDQZdT8P3nosKj?=
 =?us-ascii?Q?2D8E9GUFUn2fUGDeVrIIFflJkY2ysHE1obNbKeCqyWBKw3BcjiKnCgtrUtbr?=
 =?us-ascii?Q?32JDA2N/XkmoLcxHtrmp+R7tiCLRFJIZNPnA21dR84jssZLQjuO7K4sTwNuR?=
 =?us-ascii?Q?4Nw7GMqIcG9mcRKpYGj+yIIGSmyHHRnT/UGXxjQKmGC9iZks1fsGLALkwnFY?=
 =?us-ascii?Q?RvVpAW1UZ3q1uQSSdWwG4oFV9m/w6BPziByR4ssc/pQCN87OD378XQ9rwhlr?=
 =?us-ascii?Q?vj0otiidOZXHOBWCCKfDmkVLtpRdkSh2+2fCdvbNGvpYhXeE5dbWmtRnuk7W?=
 =?us-ascii?Q?km2uUlksWXs/VY3ujDEclmX6MiNnJUfxp+NyfIflFenHDcGRTSuvTy8BmnXW?=
 =?us-ascii?Q?L322EA9yFUe3250HILNNpJePO9IYsqQziVuipa77o2wCfSBj1dSwF75f7NY/?=
 =?us-ascii?Q?LhrYZEbruEfw2VihT/I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?nYWuWvzSsbWVUV6DeyT3NXF9aNF3JWaV0w77vQ8b1RGTHiYDLkVx8wk5JpH9?=
 =?us-ascii?Q?2ZHvpBHj/mtI96xzWgAPVzNQ8TmBSdUVlhqJ2LIZYGqSS88nnCJ+9jvDpVha?=
 =?us-ascii?Q?/YXIzbxs7O2YS/y30h5x6wwFWe8jqSNMuspNHVifMdYRaVG/OFfblAEtvRIq?=
 =?us-ascii?Q?P+6ZWhwola2CJcrD7x3oevsMcPoC3IufGxL+nrLpeO3rFjdffMJFrHwr2VgL?=
 =?us-ascii?Q?wm61Ct27XlmRI4TlX2d7veAlaO2CIogP8T7lryMhlOgHdfb7xG35TIeou+Q5?=
 =?us-ascii?Q?mzfWHppLm/0LyLny834cShTXZjIU+kpE59fdx9VdpWgAN8oOG26pAh9EYZG/?=
 =?us-ascii?Q?bdBdXvVWmYCMqHGehTpvAWakN6VLZqL9h4WmCsowHQfau2n1vsTOHdhfHB0E?=
 =?us-ascii?Q?GQQHW6n9X6Py8Xzxc1SDzj/ru5lEk6TZHEpzinkUYplEldS8p12bu2oCWg3n?=
 =?us-ascii?Q?KZ7tV7fG4YEntyzjOZUf3ceO7Tb/AIw8kin1vnz2u1E/+mdjsgsSs3UEEPpl?=
 =?us-ascii?Q?Am03G+eFHBeCoCfbApTq51f4FLysQiWs5EWgdhAuvxizqKdu2lYIDNMxO5Aj?=
 =?us-ascii?Q?lwLC3nfUdkYlQTo4i1bS2ZZNI86DctkhB9qCa5QpKoNJKov6Aeq8M5uPabyc?=
 =?us-ascii?Q?LxohGx1vdGFR92r4Zu9lWM290CwKHmx4JDea9hVkBmylLBuVLLA869TTKQ8M?=
 =?us-ascii?Q?rNwgnZ8kO+iUqMzs4a5aH0VOFyN88CeS0F2DkKkm9RNC41B9aI8VaCtINhCB?=
 =?us-ascii?Q?woOhbEW0Amz9caZJXygRp6Kqqd0keMqDxsa2TnQoROVmmFig7fEm0nyTw/wL?=
 =?us-ascii?Q?FUrY35HKuGLQ0seKMVJ/f1lmTJrIFGU+NFgzM/YzzOybyXAAW138HCGf/5Ev?=
 =?us-ascii?Q?aNMxuxMEIv/TvqF6orKQQm6Y9UwM1vYQ/WW5qex2LK79thqr7ENpWoxmCpR1?=
 =?us-ascii?Q?ucQPkb5teR4XzLvqQR/oHjMhBLdl9NDgV/cvMShJPf4Ag7YGKMUMZAFdl9hF?=
 =?us-ascii?Q?lZ2Dz5KDeS7F4V6QgrKOGwtOWhm3MFhso7FRweYBJygzQbQPCZ4nCczFgkn+?=
 =?us-ascii?Q?MwkJ4f0BOrvSpk6C6DRihpIi6oU3tsMdqJgPOsZtxbAkzQW/tsdP3DIZeJxl?=
 =?us-ascii?Q?dEiyjC3hvKQ2y0oqZdURkmEjU5/hwBz+hh1uZLyGJ9/a221F37mP0ZDZaN/A?=
 =?us-ascii?Q?t1G0UWWdrvAcWsCeo2be6fNLmAU0rL/w/Bagh0y5VbnF0IboWKkWDL3hm1Xb?=
 =?us-ascii?Q?eYBqyWCprhZ1DHJfiviUDgtZBnSmf0D93/kA0XZ5PvVug0EFW5j2WxrsVquQ?=
 =?us-ascii?Q?EbxzD57Qg5paeMv3QhRb/nbmp3G8Kw2BNqm52v2gHffjJWBSKsl5Oz1EVDmk?=
 =?us-ascii?Q?CdlHFnQvbzJryIciXZf/J2y6b68X2wIHop8uKMmwbwUK43bUMEvTqs0hrPDj?=
 =?us-ascii?Q?w1Fn3cmIfT8RX4ZDGEv++FbIBvWPZrAuBj5gPN/WTmr8pi1mCN2xcxlYTW+i?=
 =?us-ascii?Q?YouP0xXR2gwJjsMCapkYFrUm81jZh5txry2J1KjZ2t3ESVsD66qTz3U2T7uM?=
 =?us-ascii?Q?hArRK5PJmxM28LLANrFgPWykjdRUud4BNffYuFSXVoMACB1VoIhhHqbuexI9?=
 =?us-ascii?Q?UfLc4zJ88Ey1K9N2D7B9nfLetV/y7rRuVA1eTo1icLlmXzht0MKEi9/2rrwy?=
 =?us-ascii?Q?nFsxyPo+RdNwB+lli1DUmFBZ8th7iGpkXJTwKT3mQdLrgb2NPd0Be9+sx/+4?=
 =?us-ascii?Q?w5V4cnjhOQ=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32f49907-22ed-4507-7e0f-08de68e03f24
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 20:09:07.6663 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nLoPllwMvM3kufJN7+6uY/Wsrpc0CIe4qJ+yS5kYuQaD3ZdWims9b6XGryzBorqJxsl9o2j4+9QXoXENx/Q9Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFCB5E1B8F5
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
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 0493111EE9D
X-Rspamd-Action: no action

Hi Danilo,

Thanks for the review!

On Tue, Feb 10, 2026 at 12:55:01PM +0100, Danilo Krummrich wrote:
> On Mon Feb 9, 2026 at 10:42 PM CET, Joel Fernandes wrote:
> 
> [...]
> 
>> +//! params.size_bytes = SZ_8M as u64;
> 
> It looks there are ~30 occurences of `as u64` in this example code, which seems
> quite inconvinient for drivers.
> 
> In nova-core I proposed to have FromSafeCast / IntoSafeCast for usize, u32 and
> u64, which would help here as well, once factored out.
> 
> But even this seems pretty annoying. I wonder if we should just have separate
> 64-bit size constants, as they'd be pretty useful in other places as well, e.g.
> GPUVM.

Agreed, the `as u64` casts are verbose. Note that these are only in the doc
examples -- actual driver code (e.g. nova-core) already uses
FromSafeCast/IntoSafeCast from your nova-core patches [1]. Once those traits
are factored out of nova-core into a shared kernel crate location, I can update
the examples to use them instead.

Since the doc examples live outside nova-core, I suggest let us keep it as using
as for now. Thoughts?

[1] https://lore.kernel.org/all/20251029-nova-as-v3-5-6a30c7333ad9@nvidia.com/

>> +#[pin_data(PinnedDrop)]
>> +struct GpuBuddyInner {
>> +    #[pin]
>> +    inner: Opaque<bindings::gpu_buddy>,
>> +    #[pin]
>> +    lock: Mutex<()>,
> 
> Why don't we have the mutex around the Opaque<bindings::gpu_buddy>? It's the
> only field the mutex does protect.
> 
> Is it because mutex does not take an impl PinInit? If so, we should add a
> comment with a proper TODO.

Correct, that is the reason. I'll add a TODO comment in
the next version explaining this limitation.

>> +impl GpuBuddyInner {
>> +    /// Create a pin-initializer for the buddy allocator.
>> +    fn new(params: &GpuBuddyParams) -> impl PinInit<Self, Error> {
> 
> I think we can just pass them by value, they shouldn't be needed anymore after
> the GpuBuddy instance has been constructed.

Dave Airlie specifically reviewed this in RFC v6 and recommended passing by
reference rather than by value [2]:

  "maybe we should pass them as non-mutable references, but I don't think
   there is any point in passing them by value ever."

The params are also reused in practice -- the doc examples show the same
`GpuBuddyParams` being used repeatedly. References
avoid unnecessary copies for this reuse pattern.

[2] https://lore.kernel.org/all/CAPM=9tyL_Cq3+qWc4A41p7eqnNDLS1APUEeUbaQyJ46YDkipVw@mail.gmail.com/

>> +    pub fn new(params: &GpuBuddyParams) -> Result<Self> {
> 
> Same here, we should be able to take this by value.

Same reasoning as above.

>> +    pub fn alloc_blocks(&self, params: &GpuBuddyAllocParams) -> Result<Arc<AllocatedBlocks>> {
> 
> Why do we force a reference count here? I think we should just return
> impl PinInit<AllocatedBlocks, Error> and let the driver decide where to
> initialize the object, no?
> 
> I.e. what if the driver wants to store additional data in a driver private
> structure? Then we'd need two allocations otherwise and another reference count
> in the worst case.

Good point. The reason I had `Arc` was to anticipate potential shared ownership
use cases, but at the moment there is no such use case
in nova-core -- each `AllocatedBlocks` has a single owner.

I'll change this to return `impl PinInit<AllocatedBlocks, Error>` in the next
version. If a shared ownership use case arises later, we
can always add an `Arc`-returning convenience wrapper.

For the nova-core side, the field would change from
`KVec<Arc<AllocatedBlocks>>` to `KVec<Pin<KBox<AllocatedBlocks>>>`, which
works fine I think.

-- 
Joel Fernandes

