Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oKweCBMsnmmkTwQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:54:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DD718DCD0
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:54:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A855410E6A8;
	Tue, 24 Feb 2026 22:54:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WMpfvFIh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011036.outbound.protection.outlook.com [52.101.62.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80EC210E697;
 Tue, 24 Feb 2026 22:54:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DwNs9KLWzaLYu2sYzu4r9ipFQ2AnLnO2HdfxYf0LspYKYph1i892jnQwqxXtbGLySh5/DKe2HSg/27FdPTOp7D/Avrn23hOVzjCSvxRwtM2FuwRsYOi5jQJs2cDYgPsJjp2xyqzKdQK3DtZTjPBx2UgapNlReZW6Ads33uzJcwPf/zLLc9v8rjQXUI3FIVJ43YvSwK/SfumUt7aQiDhufmxPg0P/Iw6z5uwLbo6uNT/Q3sC4hykxOHiNiBU06S3e9DeR40I0f9ASZsqdq/i0y2gNNKoHK2x9U3U1v/MnlBK/GfY/FRW9eHyo4rw+IiB5pwdT24/nexe8O+oW0McMJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+lBa+2JhwIy6vutK1Sf5Rc6RIUX8XIfnNRUDWYL7oKY=;
 b=ae9dgon/f0YnOkV/9UyExknSNjkNEnapdWvoOGg4Wh1ehsWXsk2dIr/EH+EAxm+vsfRHOIgoneW4bP9sDnFYlC+WtJV/52rUnzgmWVILp9wzu0avGLizciCl9XyE0Fdomsskf41eKRwDyqIl5mdudPu0Pvsqy0THr4nOYa/aZBp9Yba/Mjdd0VPMVGC5t0AWz2fZVjqSpH7n1UdeChMC+y9KTLdej3xii3M8ij2F3q2q883sJaPli18Zu7Cb13cHBIEeH2tq/dUYxy0ctKSxl6/CZvjSGt3EkXupzCUggrD5+D8q/GFb64gaBRLNQKWkfe7uOLPqN97ZkTSjTvQ3nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+lBa+2JhwIy6vutK1Sf5Rc6RIUX8XIfnNRUDWYL7oKY=;
 b=WMpfvFIhzBvQ1gCCKtjAVDbTvx3xhDdd0OfZOKqVElfzeAMsoP8YQPvWu1MK+zZtW4r7k2g6lM+Q4VThwSSXOhmrfAAPvt0ax85Ub2AD36xV2FLkkhgSwze3WaXqZe7tii+8HqwYqJ8JBA7P0HB9AhXtfIzVpmYgf6E5HKZ2xla8ySBqKWFN9YUuWaN4MFUUsdpiOc27/SknC+n6bwaV8DOxLMhiiE6SCfjud45JqgGRV9Ls38+61nOEGPPtFe+RcC9iJND+jvgIOUtgFfSofcyREkWzfKwwyBGzCFhKPc2kt9YKreq3y5RoQLfduIxRDeqomVvTOVQBOJAwuc1Eww==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SN7PR12MB6885.namprd12.prod.outlook.com (2603:10b6:806:263::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.21; Tue, 24 Feb 2026 22:53:53 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 22:53:53 +0000
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
Subject: [PATCH v8 13/25] gpu: nova-core: mm: Add MMU v2 page table types
Date: Tue, 24 Feb 2026 17:53:11 -0500
Message-Id: <20260224225323.3312204-14-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260224225323.3312204-1-joelagnelf@nvidia.com>
References: <20260224225323.3312204-1-joelagnelf@nvidia.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0074.namprd13.prod.outlook.com
 (2603:10b6:208:2b8::19) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SN7PR12MB6885:EE_
X-MS-Office365-Filtering-Correlation-Id: 600ed1eb-fbfe-413a-de52-08de73f7952d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5jIAoIMdpZudIbWa9O51jToBsB/wVhFoAUGg4uQivwnhlkozI5yhKkQYRFTE?=
 =?us-ascii?Q?lKq2S+tZ4DGZ5vbcttk4XNwJi7Clxk4mS7YJUPSKle6J1aMsjas4NKBxg2pn?=
 =?us-ascii?Q?zrT0/ns+AxNIRndxz28ombW0Ul6keAmqjvcNsdWYU0RnYl7OG/NRvCUBG41l?=
 =?us-ascii?Q?mLFHuH9S0y6FeU8WnlkhvdCvRf2vhsp6SQrNWXmmxtK749cO1yMMkRiFlg+i?=
 =?us-ascii?Q?spZwA5CN8926og67oBi7neAYALk5SpOhkTJYV4+kTGZKs0hWBuQkLdNfzO0t?=
 =?us-ascii?Q?oCb3tXhPToa0/UMNToKEyWYlGURkmKr5DeThzDoIrFZnM+rs93z7nSq28zaj?=
 =?us-ascii?Q?mCvFoFDpaGpRtI/AqSL1fj4YsSbicon4d4J6VwrleTPE6s6ELWEGccs9O0wv?=
 =?us-ascii?Q?p0u5Vp7FUkiMp4EQJBTm9kFL/1n95O7/L/O2cnIboP+Y7AM9S8vhbQkYw8o2?=
 =?us-ascii?Q?zbx+R3WBvDOzvsgiOhK5cuHpd5LYpRZyJCibwIK5pfWMqXtZ53ppFRtd6UVE?=
 =?us-ascii?Q?dCKhHJx9tqcNscP+xJnsWjWuz0fV3v7HUl7wRgyINoFG0dj20y5E+C+iyiRG?=
 =?us-ascii?Q?gaPpKRJ+b9zFDA+AZ+meuQ6qLTGAUPqapdGmA2J2QdGBK8RHdqzeMGwOre2E?=
 =?us-ascii?Q?aS8Sa/8ZEALvX2/KDUf43CJeKdpSiUuWqGQ1AHi7O3uixAhsa+ABRrFf9yCd?=
 =?us-ascii?Q?h0f4DN4nJMipw83dNxL4uprIpyfYcPqgDMHBUuWq36nTDlxwUjzcC/ZGgsXn?=
 =?us-ascii?Q?DU0A8AaoCPkWMuPR39dmyKe7vVb4azr6ryK/yO1+KMVo2ef1NV8stWAXV9Sl?=
 =?us-ascii?Q?B1oJGM8Yv3uZsqa9Yy+FDPVgBZ/8tkwdLHeAvR0f9lnBirufWgHYZsB+vDoU?=
 =?us-ascii?Q?fdij7rG/GNfnsOzeGuw0e7KxZNYcWdyAIJjRM9HgWI7FDUPXOvS38sIlDrqf?=
 =?us-ascii?Q?R6yyxiHWkDQtAGxopvMRxneSq9WR++bjLc5rvXlz8Ji2os5ed09IqLm+zaXE?=
 =?us-ascii?Q?yUwgbxWSXqLb0muVOzl9PqARzy86ZuwBZxDihe79tVlcjFAA/PY1h59IqLD4?=
 =?us-ascii?Q?V46AxlbyFIyyRvdlA/qs+Rs+h6XJpFtuKHe2nBG/LQGuMvIU/X+0d6Ere9dL?=
 =?us-ascii?Q?I/jZOqothntNAyeJ/6aP8dVAEIoCVmzaI754071zNqHEQ12AfyZL3S6Va0pi?=
 =?us-ascii?Q?cmCA/0LoAsUC0ixYFfb/KrPOKEXm7bmO8MGU9lRKWdxWt0tdoR/G/p4Z6/Fv?=
 =?us-ascii?Q?1R3ygYQr7DtV6JIDXfs4/vc3pfWxBEF0mQ072F1oA6bT1oXBtQ2+BlOt/XrB?=
 =?us-ascii?Q?l68vXI4Je7+IUCP8nXUMeXOubhqCpRiJPdosYUMkyaT3rnKbcavHyrYlWkKs?=
 =?us-ascii?Q?ny05QrP4o9DsuIqytdaz7ig9/MdvXi3XOCotOywfKRLmjjBKfyYAYXkveOSo?=
 =?us-ascii?Q?ZPmfTlXu9KPSE2AYoxkdjvEqv+vz047tpFFEMtYzOIJ3ZM0vz9Bm9+LYRm8Y?=
 =?us-ascii?Q?UUuOF4XBZdzvwRf9MaFDq3Qsu869SGVWL0My7bNA9vdqsbtVZcDraQy5L8er?=
 =?us-ascii?Q?u3gUJmiGYiY7ZU1vyww=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8hgcB+YOr3soGf4Bc3Wp0f1E4s+DWrDEx8I8UeY9mT7RhcZ6il5WmmoM3blT?=
 =?us-ascii?Q?1NDv0SscPX9/JZNoDg5IdHd/apfeaMtK9WISPtfHYZ/bl7xtzGb0gbGGzMLz?=
 =?us-ascii?Q?TuU2+mVLG6St7Jn6nal2kHsir6kViYVmiTTjn9te6lXt01u5dU/tFT5smuyF?=
 =?us-ascii?Q?g7hN3YVsOpivZ6alRrQKncI/d4gpai498SDQ4zs2Y51J8mj/fzGeZHZoF1fP?=
 =?us-ascii?Q?nfnDIItTBj/ron4h1b/IWZ8SSXUPpzm+VPDzNbrnaiob0dFoT72BGnBtiTay?=
 =?us-ascii?Q?3AyTY6bUT5DfTH0cifzTmVyzuojU3s7KunerVxNZUIOgasQYrBNqB9HvwT3d?=
 =?us-ascii?Q?pgzdO9uKHm1HwsG234Gl+y0doNi79TBuxkMWArDnZ7GUPMMT8MsY3uxwq/dh?=
 =?us-ascii?Q?l6k/eCuCY9PoOABvzTnEHzP7evejUeD/sHp/uyq/h/7mI2SZoMQDpgL2QuHI?=
 =?us-ascii?Q?poIVzSnnRJ2j6pAke2R7+cpSkLqlNSIhOpJEW18soykpNRzDPw9jnfxz5AZ0?=
 =?us-ascii?Q?B8yoYItmOPrvNMhd+rk2fR3Lm3FIX/XVG+yWdUfMOlwo2l9C3Y/XZv5YNsCA?=
 =?us-ascii?Q?9r5ctl0xK3F+TxA1JcYk3jRULOwN1IffwJzyGN37+uiE73nFBi76Zccn7vR3?=
 =?us-ascii?Q?UOE0rtLceMRyMlguGRNa1Zw1Xaeg9eoLjrudIediuYbttrMDPOWPA/3JX1Cb?=
 =?us-ascii?Q?2q8cmGFJ/gxgJxY62LaRIVfzUdwtPXISXBKwNY6yQ1jra2uJ8f93pefUoETO?=
 =?us-ascii?Q?YSHOsCQQNhCk2FhegBYiAToSnkB1NW0zvb31yV3oi2ArZLzCzTqYtGBsrcEH?=
 =?us-ascii?Q?Qz3t6YrID3XOuFcdlU6cLQLLFyGE8UF1G43R8/z6q2zKOplEDcWFsA/rCcRd?=
 =?us-ascii?Q?2f1YE/YdaVXHChL2dwBt7RDpq95mh/+OWqNvQ57NhEuPH4JFoyNKrkbuDBSP?=
 =?us-ascii?Q?SmBVNRuuRo5NCtwDjDndG5hrJVMq/DQuBwfyH69g/1TMVyKUH/ebp1I6Cgrj?=
 =?us-ascii?Q?wfFvJg1wXW5Pypl6gAcoDz3SYIYiMrw1OkGKccUjjAO1nppRKFr0Sjo9TaTZ?=
 =?us-ascii?Q?00wV8Gq/YBnXd58HFTeifCnFEu1Wy4m2YluHC88nUSAmAfrTB9xO5QR1sG9m?=
 =?us-ascii?Q?BZIymL0Eqn9rGeRVZV6BbyF4hyp7LJYk6mDOZWrNOtGYdFSfmuRkx5YY5TVM?=
 =?us-ascii?Q?qXtbhtP7OrJnYQLmz9j4kf8qfTvsl9jIjSCuu5brI2Uh3QwBvR5V5HN0QkYK?=
 =?us-ascii?Q?0gYyBKmPcTQFh/bIezhWDmpdXphJyCkkzk3FS5JcSZ9ZXpzSh1TxxUt4sWO5?=
 =?us-ascii?Q?vi7HIAbUdPNmBDsdqQd0qMoaKIfjvXlcNgONMtqX4CzxkF7ypC1RsTbIlS2B?=
 =?us-ascii?Q?wjz6ruUFJoNvBnk+ako0rmb70vySY9NC/w2fTRrzzoccsa7bQJTkjLJ5rbz2?=
 =?us-ascii?Q?JjLiYtzH4MxINsDa/OPRhukkhaNmRrDbKF2HiDLsxU41/2yOleLHFqVZTR1q?=
 =?us-ascii?Q?1CD1En8REwF0rBArQz8Hpgpd56Jv855G6oTm/gupTtNPBXPWDNEStRxFrmYW?=
 =?us-ascii?Q?YGukbKIWvbj6VzunhBqUh2ny4JgahZQ8cZ1Jff0JDKM1OS++BIw26LfE0dFF?=
 =?us-ascii?Q?OzqoHa7NN9mRoHtiO9acZvb8iFC5RSFZSOu9PeCXoFD5uWMSmqRMbMKG3hs3?=
 =?us-ascii?Q?el/0KNbv+u9NLl2Ajw4k8j8RfLAHkTOG0TvAFP0rOlJ2O+14gu8EPOEMA+aA?=
 =?us-ascii?Q?Ll1tTBne5Q=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 600ed1eb-fbfe-413a-de52-08de73f7952d
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 22:53:53.1363 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l+btezFR6isGp/yeI5+/Km1JQdjuypTv7+mQLBSQdkR5FU1q10/ItVN9HEBEKmbFlUkNNApU/ngfTpGbGu6FUQ==
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
	NEURAL_HAM(-0.00)[-0.923];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,nvidia.com:email,Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A7DD718DCD0
X-Rspamd-Action: no action

Add page table entry and directory structures for MMU version 2
used by Turing/Ampere/Ada GPUs.

Cc: Nikola Djukic <ndjukic@nvidia.com>
Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
---
 drivers/gpu/nova-core/mm/pagetable.rs      |   1 +
 drivers/gpu/nova-core/mm/pagetable/ver2.rs | 199 +++++++++++++++++++++
 2 files changed, 200 insertions(+)
 create mode 100644 drivers/gpu/nova-core/mm/pagetable/ver2.rs

diff --git a/drivers/gpu/nova-core/mm/pagetable.rs b/drivers/gpu/nova-core/mm/pagetable.rs
index aea06e5da4ff..925063fde45d 100644
--- a/drivers/gpu/nova-core/mm/pagetable.rs
+++ b/drivers/gpu/nova-core/mm/pagetable.rs
@@ -7,6 +7,7 @@
 //! - Memory aperture types for PDEs and PTEs
 
 #![expect(dead_code)]
+pub(crate) mod ver2;
 
 use crate::gpu::Architecture;
 
diff --git a/drivers/gpu/nova-core/mm/pagetable/ver2.rs b/drivers/gpu/nova-core/mm/pagetable/ver2.rs
new file mode 100644
index 000000000000..d30a9a8bddbd
--- /dev/null
+++ b/drivers/gpu/nova-core/mm/pagetable/ver2.rs
@@ -0,0 +1,199 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! MMU v2 page table types for Turing and Ampere GPUs.
+//!
+//! This module defines MMU version 2 specific types (Turing, Ampere and Ada GPUs).
+//!
+//! Bit field layouts derived from the NVIDIA OpenRM documentation:
+//! `open-gpu-kernel-modules/src/common/inc/swref/published/turing/tu102/dev_mmu.h`
+
+#![expect(dead_code)]
+
+use super::{
+    AperturePde,
+    AperturePte,
+    PageTableLevel, //
+};
+use crate::mm::{
+    Pfn,
+    VramAddress, //
+};
+
+/// PDE levels for MMU v2 (5-level hierarchy: PDB -> L1 -> L2 -> L3 -> L4).
+pub(crate) const PDE_LEVELS: &[PageTableLevel] = &[
+    PageTableLevel::Pdb,
+    PageTableLevel::L1,
+    PageTableLevel::L2,
+    PageTableLevel::L3,
+];
+
+/// PTE level for MMU v2.
+pub(crate) const PTE_LEVEL: PageTableLevel = PageTableLevel::L4;
+
+/// Dual PDE level for MMU v2 (128-bit entries).
+pub(crate) const DUAL_PDE_LEVEL: PageTableLevel = PageTableLevel::L3;
+
+// Page Table Entry (PTE) for MMU v2 - 64-bit entry at level 4.
+bitfield! {
+    pub(crate) struct Pte(u64), "Page Table Entry for MMU v2" {
+        0:0     valid               as bool, "Entry is valid";
+        2:1     aperture            as u8 => AperturePte, "Memory aperture type";
+        3:3     volatile            as bool, "Volatile (bypass L2 cache)";
+        4:4     encrypted           as bool, "Encryption enabled (Confidential Computing)";
+        5:5     privilege           as bool, "Privileged access only";
+        6:6     read_only           as bool, "Write protection";
+        7:7     atomic_disable      as bool, "Atomic operations disabled";
+        53:8    frame_number_sys    as u64 => Pfn, "Frame number for system memory";
+        32:8    frame_number_vid    as u64 => Pfn, "Frame number for video memory";
+        35:33   peer_id             as u8, "Peer GPU ID for peer memory (0-7)";
+        53:36   comptagline         as u32, "Compression tag line bits";
+        63:56   kind                as u8, "Surface kind/format";
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
+    pub(crate) fn new_vram(pfn: Pfn, writable: bool) -> Self {
+        Self::default()
+            .set_valid(true)
+            .set_aperture(AperturePte::VideoMemory)
+            .set_frame_number_vid(pfn)
+            .set_read_only(!writable)
+    }
+
+    /// Create an invalid PTE.
+    pub(crate) fn invalid() -> Self {
+        Self::default()
+    }
+
+    /// Get the frame number based on aperture type.
+    pub(crate) fn frame_number(&self) -> Pfn {
+        match self.aperture() {
+            AperturePte::VideoMemory => self.frame_number_vid(),
+            _ => self.frame_number_sys(),
+        }
+    }
+
+    /// Get the raw `u64` value.
+    pub(crate) fn raw_u64(&self) -> u64 {
+        self.0
+    }
+}
+
+// Page Directory Entry (PDE) for MMU v2 - 64-bit entry at levels 0-2.
+bitfield! {
+    pub(crate) struct Pde(u64), "Page Directory Entry for MMU v2" {
+        0:0     valid_inverted      as bool, "Valid bit (inverted logic)";
+        2:1     aperture            as u8 => AperturePde, "Memory aperture type";
+        3:3     volatile            as bool, "Volatile (bypass L2 cache)";
+        5:5     no_ats              as bool, "Disable Address Translation Services";
+        53:8    table_frame_sys     as u64 => Pfn, "Table frame number for system memory";
+        32:8    table_frame_vid     as u64 => Pfn, "Table frame number for video memory";
+        35:33   peer_id             as u8, "Peer GPU ID (0-7)";
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
+            .set_valid_inverted(false) // 0 = valid
+            .set_aperture(AperturePde::VideoMemory)
+            .set_table_frame_vid(table_pfn)
+    }
+
+    /// Create an invalid PDE.
+    pub(crate) fn invalid() -> Self {
+        Self::default()
+            .set_valid_inverted(true)
+            .set_aperture(AperturePde::Invalid)
+    }
+
+    /// Check if this PDE is valid.
+    pub(crate) fn is_valid(&self) -> bool {
+        !self.valid_inverted() && self.aperture() != AperturePde::Invalid
+    }
+
+    /// Get the table frame number based on aperture type.
+    pub(crate) fn table_frame(&self) -> Pfn {
+        match self.aperture() {
+            AperturePde::VideoMemory => self.table_frame_vid(),
+            _ => self.table_frame_sys(),
+        }
+    }
+
+    /// Get the VRAM address of the page table.
+    pub(crate) fn table_vram_address(&self) -> VramAddress {
+        debug_assert!(
+            self.aperture() == AperturePde::VideoMemory,
+            "table_vram_address called on non-VRAM PDE (aperture: {:?})",
+            self.aperture()
+        );
+        VramAddress::from(self.table_frame_vid())
+    }
+
+    /// Get the raw `u64` value of the PDE.
+    pub(crate) fn raw_u64(&self) -> u64 {
+        self.0
+    }
+}
+
+/// Dual PDE at Level 3 - 128-bit entry of Large/Small Page Table pointers.
+///
+/// The dual PDE supports both large (64KB) and small (4KB) page tables.
+#[repr(C)]
+#[derive(Debug, Clone, Copy, Default)]
+pub(crate) struct DualPde {
+    /// Large/Big Page Table pointer (lower 64 bits).
+    pub big: Pde,
+    /// Small Page Table pointer (upper 64 bits).
+    pub small: Pde,
+}
+
+impl DualPde {
+    /// Create a dual PDE from raw 128-bit value (two `u64`s).
+    pub(crate) fn new(big: u64, small: u64) -> Self {
+        Self {
+            big: Pde::new(big),
+            small: Pde::new(small),
+        }
+    }
+
+    /// Create a dual PDE with only the small page table pointer set.
+    ///
+    /// Note: The big (LPT) portion is set to 0, not `Pde::invalid()`.
+    /// According to hardware documentation, clearing bit 0 of the 128-bit
+    /// entry makes the PDE behave as a "normal" PDE. Using `Pde::invalid()`
+    /// would set bit 0 (valid_inverted), which breaks page table walking.
+    pub(crate) fn new_small(table_pfn: Pfn) -> Self {
+        Self {
+            big: Pde::new(0),
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
+
+    /// Get the small page table PFN.
+    pub(crate) fn small_pfn(&self) -> Pfn {
+        self.small.table_frame()
+    }
+}
-- 
2.34.1

