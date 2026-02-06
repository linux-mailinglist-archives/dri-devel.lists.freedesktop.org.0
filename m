Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OEM+I7U4hWlf+QMAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 01:41:25 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0971F8B42
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 01:41:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E6F310E03B;
	Fri,  6 Feb 2026 00:41:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="m91KO6QK";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011022.outbound.protection.outlook.com [40.107.208.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B483210E03B;
 Fri,  6 Feb 2026 00:41:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YZKVP+p2S1KhTmzJ8piHsDJapwvzZvHgn+LiqluCEVDRdwYLYlc8J3UQdtOMjV8oYLxJGS2ALF/VtHLTLgGnYUi8Tvc1ExWi/E6npSIi/7PtnPx77c8yNUWyPqlM7AYvolIfGolGZLJXB26HD4eniQHUTdfyythN0NSJPmnFynzpe7OUg6YE1IGIb2P2YsgC94pEUM4y8I8w31vRPJnXAl56U4OIohk7bOI5cufN40trbNsSQTK7tZ5Tgr9N0CZxdpRURjHHYaTyBkbxtgSSHHf4p4W+aS3RaJ/fJMSQZhlW39T0X/5pwAcbMnkLwoApA5NCH1xZYxwK5WaPs6jxow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0GGqSbMaD4vtlkjUCpfxfnKIkLGuXja7VqYWpYezB30=;
 b=bOZx3bIUUoOX9mBISJxbPEC/b3GEMSOmFwFvY4ughZhHP4+Qwhs1rmN64DGxQylG/qgyoSQjVpWG4LyG503eZHNzJffPaGgpLfPEdnLgRaarS/hjT3RPL+itvoEthv+GukUs1NiaHJRdC5QPzprJYtlgcPXVnRQMMssl9dIpIgOoKSguSIftrUirDLiyO39Ib2K5mi7BOYeb2bLPwXudUrrrhXFBw67umHwJpxT30lIul7ikvaPSs0wp1UHmUCkCfKvGbhPhcaikhtdEaNpn54cltuGpDLCfwwm/M/dsPp3yleqOn3e11GQTml0SKHZZb2eEBESwclRTxjWpovGsbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0GGqSbMaD4vtlkjUCpfxfnKIkLGuXja7VqYWpYezB30=;
 b=m91KO6QKcGFffbisgklwOBtCbk35Ypf4AtP53F2c5t7c583uiD34EH8OIiXl3yS5rf+bcoqQ/UjHhEqusfzqOXLcd49iZTmahcHT45Xw4FnUxHayGlYadg9auYDnCU7fRlDY9YkXsMtJPC2hwFYp8p+zKq/CTH9Po9nEtxxCv1d2riEpFnDWBYubZMTB5aV+ZnkYyXiOa8RVGhufq2zRqMQHt4euzYDOdhPn9vETZtibAlAMiN8MS01l+Ai/vXbxHslu+ssKNvz/XDbM6GM2qGRRtF/D+fYrBlrJrcUJKs7sjFoHXgJR0shkCEzWovsrIpOhuLJQ6T4+0rlVH0Rujg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 SA1PR12MB8860.namprd12.prod.outlook.com (2603:10b6:806:38b::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 00:41:15 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9587.010; Fri, 6 Feb 2026
 00:41:15 +0000
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
Subject: [PATCH -next v7 0/2] rust: Add CList and GPU buddy allocator bindings
Date: Thu,  5 Feb 2026 19:41:08 -0500
Message-Id: <20260206004110.1914814-1-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BLAPR03CA0067.namprd03.prod.outlook.com
 (2603:10b6:208:329::12) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|SA1PR12MB8860:EE_
X-MS-Office365-Filtering-Correlation-Id: b929e66f-5aa6-478c-72bf-08de65186f2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rWHrXz3vfSWBL8g8KGNekR16UXrDy+JUJb9KpeqmO3THfJ9ZZd/sw/JVDr0g?=
 =?us-ascii?Q?6fHjwne/BxmyQMB5e7ArP6gKnLBgITKu0JDTMA8AgRbFWsfsVWe9/tBktG/g?=
 =?us-ascii?Q?zcxH77bvdxPtdHayDqI88vWzf6EgqGqkuc1CWyxa2dL8d2toZUy//wHBbe8F?=
 =?us-ascii?Q?IvUi0U7Urz9ypjRp/3FCrtVyDG0PvQo/BDNopel85C3uUMcUtAovXR6QaI7f?=
 =?us-ascii?Q?RwjTZQOOTuJh4q20W/X/KZpHVs1UmeDYugb8H27bfmlKOfYAN6A4q4HSB3Ae?=
 =?us-ascii?Q?cm4uremWcMBhAcjZSdfzVclBpvFpEunI33K62LP+GmkAEHEwxbs3s7TqlejL?=
 =?us-ascii?Q?eyify5DsRy2dXiUCBs9Wk175mEg2Evm1R5i42CE1QUGKaodqNPazGzefAVH6?=
 =?us-ascii?Q?f1/7dGBbW5ALpeAhyV6Lr8Gwaf1xDRSkO2TzEPWaFQhtoLIZENpdB4Ee9MIO?=
 =?us-ascii?Q?Yp1bivQtWinPOlZC6gs8/3pFlT1g5I2JUZiFh1RsXMPaxOfRsjawiAZfJOe+?=
 =?us-ascii?Q?5AVxkcOIwP4xr85id18ImRy3s2hxoPFuAqQp3QbDNYohgnS1BeIuO/zEtaMN?=
 =?us-ascii?Q?Cck2uoQJVO9T0nKPLtjEucXk6u94bwP5f9HGpN2H3DPe/EZHR984ZukuBYqH?=
 =?us-ascii?Q?HijVMSDap2D0ixPjQT3uMIpecK3T+oeoGQs7yqFmgNvfc49Hv/S48TYLjNHz?=
 =?us-ascii?Q?NK6pQ5K4poQUFQ5LsXCNFTQfEUMAi5CfihB1W2Sid3+MOiHVw7IC0ExLYw80?=
 =?us-ascii?Q?94Bm3qaJkDMxjkEI7S1YZt8UGnf2+9Ra63buh0xe5nG4lxgBv33ojaabyI6I?=
 =?us-ascii?Q?TYy3CPbjRYtOcgg39oG8cYGepj7REMA2T1U+kGgmyIjX6f14LlcK/4Lan9ps?=
 =?us-ascii?Q?pJKlASkVumQa3gd13HyTZMhzt7QR35wIIjSS8mij5h28Wj0liChla325GX/o?=
 =?us-ascii?Q?1jiJug9KL3LcBxugbF+FWKPQUByVFjGlVdhTwYJlA+uQDsnPhJWiGXfOoQgt?=
 =?us-ascii?Q?0O7txDR2Pd4eztNSGAStEGnqzPhn561vkYqjj0ZTPf0FRrB1xj4DNa24/nmo?=
 =?us-ascii?Q?L/t4tWvUviOVV38Tv2+TFYz+/CO/BSiAEMMTBo4oLH8Ln5TqMdwLDrZTtSlz?=
 =?us-ascii?Q?ri137/e4sVjiNAjFyNirv+9+kVctmkpWDXlBGOirkztlMuVDA1zBhYskMo/S?=
 =?us-ascii?Q?/zCKdmM09ty6U1HCNvmO1fWEvR63pDm7eLxztPFNAo6LjT6cErFY9/z6cE/1?=
 =?us-ascii?Q?z9I8VUzhb5aRtfZidTytuUr6aghgDdzpuU21I8UrElOeOGzv4mN4ToCJ5DQ/?=
 =?us-ascii?Q?ffmnIPCQ2LiAolYAOqM4xLrePAtih3y8fCBa0PdlJ67UqYJ32wgc0cMXqFY6?=
 =?us-ascii?Q?ejsmuGrxZV507ld7YOFGCbq15eK99Ql6LFU+efyOLhAnU2wrpHTqCagymJp4?=
 =?us-ascii?Q?dBC8lza49luHlFGbZJRXpLEBz5cOfVLakUWnvJFJ2JJmFpos4FkcZr6skRTT?=
 =?us-ascii?Q?bJ7SMUnaWALyyg45x47SzQCRWE4qmKchh18p3SZHsrllPWvSO/+0eZ/dV5cJ?=
 =?us-ascii?Q?4wxjHkJQJKLETM/B/CI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Bl7E2iNEx1VtCThiWA6ifPwsQo0aohgoTxg94RvM0qMljRPEHnyh6cPZ3845?=
 =?us-ascii?Q?R3kdQYEooMMkLv9GeCwoexZxtl+lwe/UotuNHjHU4J/pxZgj/1GXeRPRCtIT?=
 =?us-ascii?Q?VHRV5NjsYQnyEFupz8+BpUC0eUI7rRrQl9KygjJhpj1L9mn7Mb6Ut4/mgBKl?=
 =?us-ascii?Q?2tPRt+cAXthRw3WJc6G6j94IPVVQ2Uwkna4VokNfDqCizDZlk1wa/wPFlkuE?=
 =?us-ascii?Q?KKcYQlUiAUGVcnTnt0y20jMi/z210L0hLuFmSp63zzmph213Jql4atjh/cOy?=
 =?us-ascii?Q?yBL1cCgAGQ+b4GuXnBkozvh17+eODtk67W65kjKYJKT6UM2anElpXIYTzKYf?=
 =?us-ascii?Q?5E16ZXO4UnaKxUPw/l2WEwluHGDFX2y9Fh4onF0rXNRB3Nj+L4fQhHKA9fup?=
 =?us-ascii?Q?oShSQeEbypleGHDqbz7Ku/arlkPVFQH242ip3MYycVhjdrr0W0U6LvwMgk4G?=
 =?us-ascii?Q?S/1uK/wqeatp7m5EYE5qPRG6mgMM3vV8huslHbFSF4FCee82ohs1mbF1CQjW?=
 =?us-ascii?Q?qe4QF3G0uYuriWUzTPf9EcwrH+cD5ZbonNVoq/7HlxbnKcL/nMu6ghS5TrJq?=
 =?us-ascii?Q?xQM7Ss5i8Rv5eEbXMbHrFMpk2znFS4yuTGT6EfWI239/famwCq60kgR5F/JB?=
 =?us-ascii?Q?g3Q35UJzgDmejpQXN3Ul0Fk2Rhg96RS4YziE6KEW3lLf/zDLAYGElu+R281l?=
 =?us-ascii?Q?Gbns4/XPUuqIQdEdIhkO1i3mIXmTt/QTgLGGT0xeKLQv7NpYLJ6oCjBDOOxQ?=
 =?us-ascii?Q?uwbuUDo0KXX4TdPYWAvRzlXk726Z0ig/V6wPVY2x7snm+KU7VmJ5PqsW2tYE?=
 =?us-ascii?Q?d8p/fNedYaxmwIYQXfiXkNbn8JoSKmN3s54ehLUlPSH6F5y3Ac882oPd0Mac?=
 =?us-ascii?Q?gnRXRXGUy0p4zp4cYLfn8nQLb/+PIwixDyYDOCTPP7mte5qAzQ6OmwpbRGOt?=
 =?us-ascii?Q?2trkIU0hZKqGH1mD2tz2LxMAhYPXPSCwhYpkxddIOOs1Uxf41YGoUdhByD6t?=
 =?us-ascii?Q?iZrmcBt/2KO1agNUlkulVkc9R+4QfNmIsH+BGm8OOepiC8OqzXqIKVmXcPVG?=
 =?us-ascii?Q?JtiAxbSGeGgMawqOY8zBeVEtj8nKwaL60JegYWCsEPh0oDp97vOSAIH5xqxB?=
 =?us-ascii?Q?7ag5jHjs1cpRJ4BiQsgoURw46wdf9rQU6jsZYu1U2pmFSJCpUOsu6WZJ3aPT?=
 =?us-ascii?Q?o3uBk07j4nkpShVDUNJkUQLnttAdl45khwSFEDz5IQ4wKUVc5IClpW7YU+WK?=
 =?us-ascii?Q?gOCNjymtLn0XeVtCtebTHpojFqvnaDpsrwnEZj33E/wnewHraOMYGuA3vTuj?=
 =?us-ascii?Q?GDU8xsn5SMKle8c3tC0vb1kfyh2MxR3U9MxydHm5q7ZOQtMw4FoCZkHghYm0?=
 =?us-ascii?Q?65gAtM+wBWvey2jh9eypRNIR5uIe6dCJe3xr1ffSFMhIAccoouXH1TYyrXvc?=
 =?us-ascii?Q?14H8VLf3zzqnG4hah49tHcGGryJerrFRe2LgP8Zmswsx/fmYunFejNWLBZ8O?=
 =?us-ascii?Q?g1QK2h2dVpRaBlZCv9Y0n23LIiWgHEDfsaB653aJrWfmyrXn4Y0+gVoQ7VR4?=
 =?us-ascii?Q?en08+h8BgbCllv3xOnT/isq3PrClb/v32V0RpFJhDgpFVczgDPADQP7COCDO?=
 =?us-ascii?Q?0tlRYUWdQCKWxhl0Mglr2VhSCcNdO+gumz3BRQ5GAZVtoFnYk1OLq/QwgVIO?=
 =?us-ascii?Q?li4t3tP578Vx716Jr1OYIKtRU4dgPmmZBDeXDawbaD+ARBqiYyd8b2ZULarX?=
 =?us-ascii?Q?MmdyAHAMWw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b929e66f-5aa6-478c-72bf-08de65186f2b
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 00:41:15.3390 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IKMc6rYQQFooi3Jr/c6lm3FQBNrL/vx90qKbrnkwEea8njmFwtIF7S3qTtS9spA5dOW//6BfVlmv1zVvkBzOPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8860
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
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	RCPT_COUNT_GT_50(0.00)[51];
	TAGGED_RCPT(0.00)[dri-devel];
	NEURAL_HAM(-0.00)[-1.000];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: F0971F8B42
X-Rspamd-Action: no action

This series provides Rust bindings infrastructure needed for nova-core
memory management:

1. CList module for interfacing with C circular linked lists, required
   for iterating over GPU buddy allocator blocks.

2. GPU buddy allocator bindings for physical memory management in
   nova-core.

These patches are based on the RFC v6 nova-core memory management series:
https://lore.kernel.org/all/20260120204303.3229303-1-joelagnelf@nvidia.com/

Main changes from v6 are based on suggestions by Gary and Dave.

This patch requires the DRM buddy code movement patch as a prerequisite:
https://lore.kernel.org/all/20260206003451.1914130-1-joelagnelf@nvidia.com/

Rebased on linux-next commit 9845cf73f7db ("Add linux-next specific files
for 20260205").

Joel Fernandes (2):
  rust: clist: Add support to interface with C linked lists
  rust: gpu: Add GPU buddy allocator bindings

 MAINTAINERS                     |   7 +
 drivers/gpu/Kconfig             |   7 +
 rust/bindings/bindings_helper.h |  11 +
 rust/helpers/gpu.c              |  23 ++
 rust/helpers/helpers.c          |   2 +
 rust/helpers/list.c             |  21 ++
 rust/kernel/clist.rs            | 315 +++++++++++++++++++
 rust/kernel/gpu/buddy.rs        | 530 ++++++++++++++++++++++++++++++++
 rust/kernel/gpu/mod.rs          |   5 +
 rust/kernel/lib.rs              |   4 +
 10 files changed, 925 insertions(+)
 create mode 100644 rust/helpers/gpu.c
 create mode 100644 rust/helpers/list.c
 create mode 100644 rust/kernel/clist.rs
 create mode 100644 rust/kernel/gpu/buddy.rs
 create mode 100644 rust/kernel/gpu/mod.rs

-- 
2.34.1

