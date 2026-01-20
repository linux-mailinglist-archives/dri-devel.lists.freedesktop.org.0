Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iJ4/Ayfpb2m+UQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 21:44:23 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B024A4B976
	for <lists+dri-devel@lfdr.de>; Tue, 20 Jan 2026 21:44:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB0F710E667;
	Tue, 20 Jan 2026 20:44:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RdvGxp2Y";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010061.outbound.protection.outlook.com
 [40.93.198.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B798910E669;
 Tue, 20 Jan 2026 20:44:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e7k8Gn4DviaqIUUG6IKuFOg541Z4pX+PLovZshoOwiMn4UNO9/1j5oPCyH3CGMKGHCqFEeHvW2ixw0JmtzzEQVWxCWk7y5p964+7LnobIh1NT+LmKSyi4vwhf0agqmoT8qxCSuFWX7M03ucBcEZoYMXuIBnR+99I30wN8TtbzzUS5U6nrWYj8WqJ3J3+T9DsXW3jGFpINhHQK4+mtZG9FcFvRN/N3FRft6fz31M81nz/Fy1240HMd1z6kjEacPb+94Irfg/97bPuWbhITe0UAg3U9/qNP8K/difZzZQh0zpbvA9Tn6bNjgVqnfKKuF3qjNuHESuKxlaFC2xggFfuMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6yRVboplO90TzjcIjEANi6cuPnd6sJxAsHzQVkJvErI=;
 b=D7g8sI7kbNxzR4Fx7vQzt231BwTKIzyKLOkf8Ic6UdN2ny8SaWeFRvnM+vqrEk8EzX/uYWIJtKmmod9ZcvL4VOWSqSdJaTHsVKqEdETjjfNXEghG2vx3BGuir1Wnd6FJOsidZB9LloydYwCEVo/5ofbU1SslC5THqvbtk4t4BjU2QatLUjHTt6ZQzaCqQ11ISiKRkQ2Pm+J+nUoLNUY5J+g4MzHmmU9EAzhF3ZiCoopGjftHCVB0mgD2D2Aixzmps8aaCIItQ+CuyILHE9pMM7qzYqmB07UvqopqHIUB5/OheBY3lbpZXkVtQAgJnPB2C8jGUb/SafrLOKkIFWEtRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6yRVboplO90TzjcIjEANi6cuPnd6sJxAsHzQVkJvErI=;
 b=RdvGxp2YWFW/H1iRdqEixgE8C20Zt3PUo1Tbq5itGEKSyuhudNFXzrRXETOc1vJLLxQrADKlNYdiVqbnQqfwhiZxFdFqTQl0rTqDfqA3hd+H9ohvxFrNIuMxARZx7LSol2fkNCmLBlW6Mw65q0v22cXtM3JZT7e8ihX/+Whhr6r63B2gM4lu14ZmgQedqVl4roD3dECVW2O/C4Qf2NkO7aRgwa8AIWWvIC5R2jBTMLeAw8YP3p6awIJ7Hex+ALbZ3Wb75rl2ysgvKALIM7AE+tSaU6Z3pFbaU7+l2hB/XDXRU206y5hPsvfxVw9cP0qB9yrqF/eewJjlVAbJh/VkDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH7PR12MB6809.namprd12.prod.outlook.com (2603:10b6:510:1af::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.12; Tue, 20 Jan 2026 20:44:12 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9542.008; Tue, 20 Jan 2026
 20:44:12 +0000
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
Subject: [PATCH RFC v6 12/26] nova-core: mm: Add MMU v3 page table types
Date: Tue, 20 Jan 2026 15:42:49 -0500
Message-Id: <20260120204303.3229303-13-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260120204303.3229303-1-joelagnelf@nvidia.com>
References: <20260120204303.3229303-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN0P221CA0013.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:52a::18) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH7PR12MB6809:EE_
X-MS-Office365-Filtering-Correlation-Id: d69d5491-326a-4df7-b63c-08de5864aab7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?OSP6jTihiVoDJb5I3chf1ch4h1QBA1Z4H+711It8W1WzzVfr6LwARxV/ttVE?=
 =?us-ascii?Q?8ZTPEEGQZFJ8Njv8jCMyXKQdC5rcimZVEU9OCFMbHZurI0r7uehTEVwPrJvT?=
 =?us-ascii?Q?3lKcB8pQBtM21r/yE1pEUVsJI53mVjEFIAI/82m9tmk8PpU3w5O1j6cRGxPK?=
 =?us-ascii?Q?9+kvMcl65RdBv47eVz/Dt1aDXPnghw/cCw8ntDyPaf/GQEt4+ZTsM618LYNH?=
 =?us-ascii?Q?EpsAbzbH2yBhyzW2r7IoA/T5xOYgY67OsNOjxZtj3bdSce655nFq47OBo+So?=
 =?us-ascii?Q?XoWGw2qSGGHXR43P9Yra49aGIWyneCOZGNAaEQqFnCnBD42Dqo4wRNagk3W8?=
 =?us-ascii?Q?TvDuFRMF6oMbe0/QeK95KiEWVf5yJQTmyAMbGG8/BDgvou3MNBoD5VV1XTAE?=
 =?us-ascii?Q?jMsj4KC/HyU9/R3DUmm9XlhsHjZARUMhQKYmnb/3yCsiUKDo4fbQLmfJzTOH?=
 =?us-ascii?Q?zOLU/CbE5fRYGUZl7T+RMri4am/7ziGrgx9VJuYUGpWCgDEVB3sR0P3AvkRZ?=
 =?us-ascii?Q?ft5loyVYmYfiOkK+htEf3ypwEF1zKquJo7cNVyEcCvN9eaQaRyq1OIbaPQK0?=
 =?us-ascii?Q?0pur94QBjjKvqGt+Ag3CEjTJ0/PL0Iy9HG5dchlzole2Pq3Go2YzRZQ9AI93?=
 =?us-ascii?Q?YeensQmFg4rkRKU3aWHSITuogD9cpIhwCjn6bIe+LCCiiBri74VZqktN3V9i?=
 =?us-ascii?Q?PeQEIufA0ZDO58dV5qNbYsDzR4L54Nvcw+PlYLpReMndffit7lWVY8bqpPho?=
 =?us-ascii?Q?j+KmrGw/raUB1ZMxq/RkKI0NOlPXD/e1EdYxkQ0PImKUb8J7rH7hqW1pCbc2?=
 =?us-ascii?Q?4LyYolP+wWxgB4CdTJZd2kDqg37ZAhVqAEv5CL2p9oGbaIv0P3NrpxvMVVFf?=
 =?us-ascii?Q?S459qdlA2Oj++7hVFyJjBIo2ZrWUBi0mFGgt7PqjN27p5JSPwOvLA0IvW6a+?=
 =?us-ascii?Q?jAe/o7x+m7xQpPIM3T6F6fiQXmltcsptwnMYEdUYrc7JjLy2r9sFNYUQdsk4?=
 =?us-ascii?Q?PByyGmub6teDW3NqBPqXQNlwu6IYylCYWV634oOs84BvslSmb5N2y1kbt74N?=
 =?us-ascii?Q?AnGlW3sl7+Vc/NWi/yz8gDyOj2rSCP/ueiZBbCz27NkFMqrSaj9jJu6DEFZe?=
 =?us-ascii?Q?BHmzdfQ7RTJdp+m0UecIYvj+Fiv4wZTtFyOuq+nOd9dJn0ljQ7AFwkZGBCw2?=
 =?us-ascii?Q?ZCyYYRJs/PpgyK3hlQRraJXDT3cB0nO0Xrz+tZwk7vVFmdFSAkNAIz564gOz?=
 =?us-ascii?Q?a3/FFA1hfpTY2gWzzR7DSt8DvoZcmYNdPaxH4XwhMctDcgIZLACmaiNATdwy?=
 =?us-ascii?Q?fZ1rf+6O2YEtCysv9Re9N3j7DDcd0BI3qDAb0/SsqgTF0z0H5ql0FV4lQT7D?=
 =?us-ascii?Q?Zs2LiEfb4Yqw76UscM5iVPnC9XKNjZQ5vpSHxNWIFtfFDE2jXPilIFWI8hIp?=
 =?us-ascii?Q?QB2ERWvhpVWzoQQ42doES/K78+SDkMVbykDAUXeEuDQuKSm7K6GvQfkd1HPM?=
 =?us-ascii?Q?jhisYMlU75cR6C7or9yMWlC8XmeaykprKy7taDj3MzBtX+YDet3UgAj2bBua?=
 =?us-ascii?Q?yuTfP06ukH1dQSqgc+c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wTnduWGBsLwt6lSTEfHoRAPVAu7N9aZ37t8QeblDEMAtHS8qsjAwCqk7mHih?=
 =?us-ascii?Q?bYsep0DQt+oVFbA77kJSBX4zpbmlVQ1PkKyecsGlLtNKwlX0fL+YxU/4RDcD?=
 =?us-ascii?Q?K1scFNsZjk8yL6zZYrPSJbF/W6J9dg+MvgyfVJJeAz38OHrb18oB7sIDSd8x?=
 =?us-ascii?Q?cemi3B7HI+KV33Rgno50UB3d4Usb1g0g56PpMpU8VaqD/DPbr0z6zY6XIgwG?=
 =?us-ascii?Q?vJC6OrEGMEk6bnYX9WMPCpTygBFBzuqpxzP3NsnC/vz1uYF/X5YdKvF2VaQV?=
 =?us-ascii?Q?/V/s/mcP6uTmVOwTjIlXKVCq/nX38IbK1bFZkbZhuq3HZ6w+VLCgvXMRK+ZX?=
 =?us-ascii?Q?LvRn+AWhsCF132LftyBkPKnA8iGp60kICHYf4NioFJmVuLHGvSMCY/DReRsL?=
 =?us-ascii?Q?XkDhdJxy8d97G/0/w6t6Hq3fucjeQsR20laikuT4LtB6bfuggAa/FmlSjY+a?=
 =?us-ascii?Q?89+gflvcQz4tLmkFM8sra6BvsjUUmXDK5BZqqAe+WxtQPww15uZ5TYKGcbHe?=
 =?us-ascii?Q?BZJw3tWWpLSSKpkx9QAxjrZmdoyhYF0opcde5gXNAmXBoohqPWxHCpK81oGb?=
 =?us-ascii?Q?KqvyujaUqBn7EXIFdInMHfBQdRMRsnQY4EP+OHsWnnrVQc3YN22+8QQaFea0?=
 =?us-ascii?Q?l3m8s+JuU+/z78ln3LWmwMdcVkxjVCDRf6s6vfgK2gwVwsI7eUx+Ndi6lqGS?=
 =?us-ascii?Q?6c7NESXTycUHL/lJDHmlz4PJS/Y2PsqaBiSHRHKVCeFcBravf/C8BJoM0Lxy?=
 =?us-ascii?Q?WP4XKMt8Ho7d+opvlFS+IsBB00xpbfEbTSS5C8+Fnc64TEV7ZLuHDYflg18/?=
 =?us-ascii?Q?hN3TegSNx91CMbBF2ScmVwzPhbKN42mJKFqPPgv7rkeBaRnWtpGzA6Ma0lqR?=
 =?us-ascii?Q?7WUiD+QR9DAl9hWD05MYffwMMyAyU2HzQ0AioC3GR5rHKYmzQG47Ndeol7sA?=
 =?us-ascii?Q?jdGf/y+suFA1r+xiRYJI+1dkI3F+TeNdWe9TblEFeGH0sc3muQJWuG7EE7Sj?=
 =?us-ascii?Q?5tkRsivyulryrYNTpFPJHN4Np971/8iNhkAlMrIWAbIDSTj2Tg2YT8egmw8h?=
 =?us-ascii?Q?5gA9RFUPEVAe3RZ4Eb8N5td3iGX6J6MAf+at0DU06RO5pKTGpUWQDXhJsHdz?=
 =?us-ascii?Q?Siy2TPDeS3yOlqo4+o7m/CIQ/jhKfOXPcMN8/lzccNN7S95r22OJi5xdJdTa?=
 =?us-ascii?Q?jtA34A9f76JTZ4riv/tWs5eRX+2tLg7XsnfgidHCm6zvuRj9kXcltgXfnxF6?=
 =?us-ascii?Q?fbbN7a5Li5TEpjdieuIxJgsmOtlTFMQKNkexY6/ZHowuXcqoypnQmigXjens?=
 =?us-ascii?Q?R7qMoCvkKLJV7iSb86IijcBgFD32hjfG/IDPaUci5k4bMifE61h1mlzkIZVW?=
 =?us-ascii?Q?3sV42eedfvUMFA1ga/Tf7ReQJvsWh9ye8firCU8EjjmB4T7jAtV7TifZXEK8?=
 =?us-ascii?Q?O9bc4xkklg/z0s3rXBg62984njT6wq7jcy90DhrcvgXpbsavpdkYo3IgbEC4?=
 =?us-ascii?Q?gxKfUkKp+OSTLOUIn8AsQDZgXtsYrv9RSS1KBld6MBwS1JOncl9+RAUNmI/b?=
 =?us-ascii?Q?1p3PEnD/gGkWHjvylLN45mogcwABi1XJ8a3zqBXt49uk3sDjG++YN+2Sm3d0?=
 =?us-ascii?Q?yZWKr/kY4pxXvbmKuxRZA/porirSGMpDjp1t1OgRkh7ZXCabZT25VIR4gXeL?=
 =?us-ascii?Q?lVBTglDTBHDmBKap/mJOtTHdr+hp+gX/duTadEOZ7QTh2/Okkvhy9E9Do2YL?=
 =?us-ascii?Q?Dq5zwzzDCg=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d69d5491-326a-4df7-b63c-08de5864aab7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2026 20:44:11.8968 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ClUQd2y/B7CMIAuujTIqCbgFc3jsbKb+1csBxvHOMYrPBmU3gbx8ZsWxSWx6nu2+pIHSiAm1Fvo6P8FSvvO00w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6809
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
X-Rspamd-Queue-Id: B024A4B976
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Add page table entry and directory structures for MMU version 3
used by Hopper and later GPUs.

Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/mm/pagetable/mod.rs  |   1 +
 drivers/gpu/nova-core/mm/pagetable/ver3.rs | 286 +++++++++++++++++++++
 2 files changed, 287 insertions(+)
 create mode 100644 drivers/gpu/nova-core/mm/pagetable/ver3.rs

diff --git a/drivers/gpu/nova-core/mm/pagetable/mod.rs b/drivers/gpu/nova-core/mm/pagetable/mod.rs
index 787755e89a5b..3b1324add844 100644
--- a/drivers/gpu/nova-core/mm/pagetable/mod.rs
+++ b/drivers/gpu/nova-core/mm/pagetable/mod.rs
@@ -8,6 +8,7 @@
 
 #![expect(dead_code)]
 pub(crate) mod ver2;
+pub(crate) mod ver3;
 
 use crate::gpu::Architecture;
 
diff --git a/drivers/gpu/nova-core/mm/pagetable/ver3.rs b/drivers/gpu/nova-core/mm/pagetable/ver3.rs
new file mode 100644
index 000000000000..6a5618fbb63d
--- /dev/null
+++ b/drivers/gpu/nova-core/mm/pagetable/ver3.rs
@@ -0,0 +1,286 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! MMU v3 page table types for Hopper and later GPUs.
+//!
+//! This module defines MMU version 3 specific types (Hopper and later GPUs).
+//!
+//! Key differences from MMU v2:
+//! - Unified 40-bit address field for all apertures (v2 had separate sys/vid fields).
+//! - PCF (Page Classification Field) replaces separate privilege/RO/atomic/cache bits.
+//! - KIND field is 4 bits (not 8).
+//! - IS_PTE bit in PDE to support large pages directly.
+//! - No COMPTAGLINE field (compression handled differently in v3).
+//! - No separate ENCRYPTED bit.
+//!
+//! Bit field layouts derived from the NVIDIA OpenRM documentation:
+//! `open-gpu-kernel-modules/src/common/inc/swref/published/hopper/gh100/dev_mmu.h`
+
+#![expect(dead_code)]
+
+use super::{
+    AperturePde,
+    AperturePte, //
+};
+use crate::mm::{
+    Pfn,
+    VramAddress, //
+};
+use kernel::prelude::*;
+
+// Page Classification Field (PCF) - 5 bits for PTEs in MMU v3.
+bitfield! {
+    pub(crate) struct PtePcf(u8), "Page Classification Field for PTEs" {
+        0:0     uncached    as bool, "Bypass L2 cache (0=cached, 1=bypass)";
+        1:1     acd         as bool, "Access counting disabled (0=enabled, 1=disabled)";
+        2:2     read_only   as bool, "Read-only access (0=read-write, 1=read-only)";
+        3:3     no_atomic   as bool, "Atomics disabled (0=enabled, 1=disabled)";
+        4:4     privileged  as bool, "Privileged access only (0=regular, 1=privileged)";
+    }
+}
+
+impl PtePcf {
+    /// Create PCF for read-write mapping (cached, no atomics, regular mode).
+    pub(crate) fn rw() -> Self {
+        Self::default().set_no_atomic(true)
+    }
+
+    /// Create PCF for read-only mapping (cached, no atomics, regular mode).
+    pub(crate) fn ro() -> Self {
+        Self::default().set_read_only(true).set_no_atomic(true)
+    }
+
+    /// Get the raw `u8` value.
+    pub(crate) fn raw_u8(&self) -> u8 {
+        self.0
+    }
+}
+
+impl From<u8> for PtePcf {
+    fn from(val: u8) -> Self {
+        Self(val)
+    }
+}
+
+// Page Classification Field (PCF) - 3 bits for PDEs in MMU v3.
+// Controls Address Translation Services (ATS) and caching.
+bitfield! {
+    pub(crate) struct PdePcf(u8), "Page Classification Field for PDEs" {
+        0:0     uncached    as bool, "Bypass L2 cache (0=cached, 1=bypass)";
+        1:1     no_ats      as bool, "Address Translation Services disabled (0=enabled, 1=disabled)";
+    }
+}
+
+impl PdePcf {
+    /// Create PCF for cached mapping with ATS enabled (default).
+    pub(crate) fn cached() -> Self {
+        Self::default()
+    }
+
+    /// Get the raw `u8` value.
+    pub(crate) fn raw_u8(&self) -> u8 {
+        self.0
+    }
+}
+
+impl From<u8> for PdePcf {
+    fn from(val: u8) -> Self {
+        Self(val)
+    }
+}
+
+// Page Table Entry (PTE) for MMU v3.
+bitfield! {
+    pub(crate) struct Pte(u64), "Page Table Entry for MMU v3" {
+        0:0     valid           as bool, "Entry is valid";
+        2:1     aperture        as u8 => AperturePte, "Memory aperture type";
+        7:3     pcf             as u8 => PtePcf, "Page Classification Field";
+        11:8    kind            as u8, "Surface kind (4 bits, 0x0=pitch, 0xF=invalid)";
+        51:12   frame_number    as u64 => Pfn, "Physical frame number (for all apertures)";
+        63:61   peer_id         as u8, "Peer GPU ID for peer memory (0-7)";
+    }
+}
+
+impl Pte {
+    /// Create a PTE from a `u64` value.
+    pub(crate) fn new(val: u64) -> Self {
+        Self(val)
+    }
+
+    /// Create a valid PTE for video memory.
+    pub(crate) fn new_vram(frame: Pfn, writable: bool) -> Self {
+        let pcf = if writable { PtePcf::rw() } else { PtePcf::ro() };
+        Self::default()
+            .set_valid(true)
+            .set_aperture(AperturePte::VideoMemory)
+            .set_pcf(pcf)
+            .set_frame_number(frame)
+    }
+
+    /// Create an invalid PTE.
+    pub(crate) fn invalid() -> Self {
+        Self::default()
+    }
+
+    /// Get the raw `u64` value.
+    pub(crate) fn raw_u64(&self) -> u64 {
+        self.0
+    }
+}
+
+// Page Directory Entry (PDE) for MMU v3.
+//
+// Note: v3 uses a unified 40-bit address field (v2 had separate sys/vid address fields).
+bitfield! {
+    pub(crate) struct Pde(u64), "Page Directory Entry for MMU v3 (Hopper+)" {
+        0:0     is_pte      as bool, "Entry is a PTE (0=PDE, 1=large page PTE)";
+        2:1     aperture    as u8 => AperturePde, "Memory aperture (0=invalid, 1=vidmem, 2=coherent, 3=non-coherent)";
+        5:3     pcf         as u8 => PdePcf, "Page Classification Field (3 bits for PDE)";
+        51:12   table_frame as u64 => Pfn, "Table frame number (40-bit unified address)";
+    }
+}
+
+impl Pde {
+    /// Create a PDE from a `u64` value.
+    pub(crate) fn new(val: u64) -> Self {
+        Self(val)
+    }
+
+    /// Create a valid PDE pointing to a page table in video memory.
+    pub(crate) fn new_vram(table_pfn: Pfn) -> Self {
+        Self::default()
+            .set_is_pte(false)
+            .set_aperture(AperturePde::VideoMemory)
+            .set_table_frame(table_pfn)
+    }
+
+    /// Create an invalid PDE.
+    pub(crate) fn invalid() -> Self {
+        Self::default().set_aperture(AperturePde::Invalid)
+    }
+
+    /// Check if this PDE is valid.
+    pub(crate) fn is_valid(&self) -> bool {
+        self.aperture() != AperturePde::Invalid
+    }
+
+    /// Get the VRAM address of the page table.
+    pub(crate) fn table_vram_address(&self) -> VramAddress {
+        debug_assert!(
+            self.aperture() == AperturePde::VideoMemory,
+            "table_vram_address called on non-VRAM PDE (aperture: {:?})",
+            self.aperture()
+        );
+        VramAddress::from(self.table_frame())
+    }
+
+    /// Get the raw `u64` value.
+    pub(crate) fn raw_u64(&self) -> u64 {
+        self.0
+    }
+}
+
+// Big Page Table pointer for Dual PDE - 64-bit lower word of the 128-bit Dual PDE.
+bitfield! {
+    pub(crate) struct DualPdeBig(u64), "Big Page Table pointer in Dual PDE (MMU v3)" {
+        0:0     is_pte      as bool, "Entry is a PTE (for large pages)";
+        2:1     aperture    as u8 => AperturePde, "Memory aperture type";
+        5:3     pcf         as u8 => PdePcf, "Page Classification Field";
+        51:8    table_frame as u64, "Table frame (table address 256-byte aligned)";
+    }
+}
+
+impl DualPdeBig {
+    /// Create a big page table pointer from a `u64` value.
+    pub(crate) fn new(val: u64) -> Self {
+        Self(val)
+    }
+
+    /// Create an invalid big page table pointer.
+    pub(crate) fn invalid() -> Self {
+        Self::default().set_aperture(AperturePde::Invalid)
+    }
+
+    /// Create a valid big PDE pointing to a page table in video memory.
+    pub(crate) fn new_vram(table_addr: VramAddress) -> Result<Self> {
+        // Big page table addresses must be 256-byte aligned (shift 8).
+        if table_addr.raw_u64() & 0xFF != 0 {
+            return Err(EINVAL);
+        }
+
+        let table_frame = table_addr.raw_u64() >> 8;
+        Ok(Self::default()
+            .set_is_pte(false)
+            .set_aperture(AperturePde::VideoMemory)
+            .set_table_frame(table_frame))
+    }
+
+    /// Check if this big PDE is valid.
+    pub(crate) fn is_valid(&self) -> bool {
+        self.aperture() != AperturePde::Invalid
+    }
+
+    /// Get the VRAM address of the big page table.
+    pub(crate) fn table_vram_address(&self) -> VramAddress {
+        debug_assert!(
+            self.aperture() == AperturePde::VideoMemory,
+            "table_vram_address called on non-VRAM DualPdeBig (aperture: {:?})",
+            self.aperture()
+        );
+        VramAddress::new(self.table_frame() << 8)
+    }
+
+    /// Get the raw `u64` value.
+    pub(crate) fn raw_u64(&self) -> u64 {
+        self.0
+    }
+}
+
+/// Dual PDE at Level 3 for MMU v3 - 128-bit entry.
+///
+/// Contains both big (64KB) and small (4KB) page table pointers:
+/// - Lower 64 bits: Big Page Table pointer.
+/// - Upper 64 bits: Small Page Table pointer.
+///
+/// ## Note
+///
+/// The big and small page table pointers have different address layouts:
+/// - Big address = field value << 8 (256-byte alignment).
+/// - Small address = field value << 12 (4KB alignment).
+///
+/// This is why `DualPdeBig` is a separate type from `Pde`.
+#[repr(C)]
+#[derive(Debug, Clone, Copy, Default)]
+pub(crate) struct DualPde {
+    /// Big Page Table pointer.
+    pub big: DualPdeBig,
+    /// Small Page Table pointer.
+    pub small: Pde,
+}
+
+impl DualPde {
+    /// Create a dual PDE from raw 128-bit value (two `u64`s).
+    pub(crate) fn new(big: u64, small: u64) -> Self {
+        Self {
+            big: DualPdeBig::new(big),
+            small: Pde::new(small),
+        }
+    }
+
+    /// Create a dual PDE with only the small page table pointer set.
+    pub(crate) fn new_small(table_pfn: Pfn) -> Self {
+        Self {
+            big: DualPdeBig::invalid(),
+            small: Pde::new_vram(table_pfn),
+        }
+    }
+
+    /// Check if the small page table pointer is valid.
+    pub(crate) fn has_small(&self) -> bool {
+        self.small.is_valid()
+    }
+
+    /// Check if the big page table pointer is valid.
+    pub(crate) fn has_big(&self) -> bool {
+        self.big.is_valid()
+    }
+}
-- 
2.34.1

