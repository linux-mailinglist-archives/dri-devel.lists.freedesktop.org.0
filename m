Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2G+dAdgonmn5TgQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:40:24 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 551BE18D7E8
	for <lists+dri-devel@lfdr.de>; Tue, 24 Feb 2026 23:40:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C342410E338;
	Tue, 24 Feb 2026 22:40:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NS9A+8Q9";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013039.outbound.protection.outlook.com
 [40.107.201.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A47F810E338;
 Tue, 24 Feb 2026 22:40:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QpIggOXfMctSLpiL3raJseZNNhkyA9IKFpzfeipUbh3k/5ndRAwdXJaZbu2MDRor6OOBP5VdQRmj+0HEIT1Gqyft3zVnx8SI9aaqofP/q31ChRGxdBIZ6bWYgxtkN7wibH0FX+FrK3zk1/hQP5YcHZ2FuQLfYagOeLLNnBYQHLInoWbmt71XWeMwdVx2azErvZUXCpQ81apD2qBHdxDdMkH7iquiw7nBcpkwtzp/qQzXorHG7q0ctWge6Ctj/KyynzANLaVLJLg0wG3GqLIl49d/bjCXWknT78n+I9xiQ4TUwKQ+xU2BZ5wIOkqMVnYwzV+VI5eb08F15Vh/rwrh+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m2KJEExGbHUKTHZLh9WzwS3DnurmBLVdVaZa+19E0ts=;
 b=qG8NvLZ97w9HwLAThY/LxZZBJHAzoU90XzrRufAZgQ1OpoheZDcftFCeZpNfdSgjFiEalO70ZfHF+JLP5DGZBRQ2bA2QZh1rvNuQlRZDcg5ScAcwi2eYCeEKgjlor3vZEmzk3h55tQjCCXsAFD+CBfRaOAm+LzqB2nlx/cBetUYBJvFHDzN+HqOin7LKmHjf0vQvEDJJ2No0L0VR/7M0ZLbytevxNd+c07WjfG9kCpqC/ss67BrV81PBONTI8MZF0fAb5gA+lx9XKnLBE5XVrc4HhTCuLsjLu1qTGOWoVZLx0sqFqCYbYwvc/3JVVXbC8EnsTChPXddHkL3MRW8bWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m2KJEExGbHUKTHZLh9WzwS3DnurmBLVdVaZa+19E0ts=;
 b=NS9A+8Q9zwQ4JoEFancDv6ydkhEk+C6Pril8VLWOtyNhcAZzV4DApUS6s2QXC29nON2Ot9lrmdP7/9OLRYxnE/ucSk2whg/2V4+31CVZeQ37uuLx4oDZHTpWCLM0cbxW39PfukH4IrqN8hcMhAGJEJGjyVxVob4vtPMBj2mxWCdE1jdTkLlaQavthYHv5fQQtlRh1GOekyea1i4VoiFvR1WksdHTiDhEnWh3Tv+XLSOsiut9eaLlPuzDSw0xTN5YpapOdrIsXdggkA5VswPlcioxdwN+ZQRL8SLoEySOBVPKbhRuYXZR43Vxq8aWk3oCWBZo4OLvfuoCdJe2pmyNsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 PH0PR12MB7816.namprd12.prod.outlook.com (2603:10b6:510:28c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 22:40:12 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 22:40:12 +0000
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
Subject: [PATCH v11 0/4] Rust GPU buddy allocator bindings
Date: Tue, 24 Feb 2026 17:40:01 -0500
Message-Id: <20260224224005.3232841-1-joelagnelf@nvidia.com>
X-Mailer: git-send-email 2.34.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN2PR18CA0014.namprd18.prod.outlook.com
 (2603:10b6:208:23c::19) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|PH0PR12MB7816:EE_
X-MS-Office365-Filtering-Correlation-Id: a215a304-a2ff-4e18-b132-08de73f5abd2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gCUYfLHwkP2XtNUanHWZQFYYMHlM67MWDv8Khm3RkPvljj7ypm2QFHV1MHdZ?=
 =?us-ascii?Q?AnlunVon759dbwU8B/CVU1oMDTp5dlESRvma8WkQPW55CNIJ0mH2hLOFVfJC?=
 =?us-ascii?Q?SBvAyCvZeTZ0aZG7C2yq/Q8Z95DsHZQD/tvRH+2Gw8bn83OK/sN649nmCuk2?=
 =?us-ascii?Q?U4BykYxN+Xj4DYyC8EZcJ7LN5LtAr8QwwczL/jY+swmKrEw7DgI8Tv5OskNq?=
 =?us-ascii?Q?rax7tqaKqp74n7OaURzTX3p4bAOxwVmezATWCl0d1Wjxp1SjthBJMIM5Phuy?=
 =?us-ascii?Q?dAP2spD1JbrTKk+8cbT/3KP4QK0Fg1RDFq2X5SidogDgkJ+AczpQCKl4rxbd?=
 =?us-ascii?Q?QwrOnLvG9NvzqPvcQcx9IGvKuwUnnTaj7R+H41CvXXRhZqLpPD5yDPT2bWjV?=
 =?us-ascii?Q?T/6r0mcBRaROhZKG125pvGWDIQ6rKuPQEDQGgm6QHKz6CGsxPSQD9uStqEk7?=
 =?us-ascii?Q?9yBSVUrWU8WM5f5rRczQHnm76LWN+IT8CqhtAXAxAt8ev5G2oy9Vczi3IGJd?=
 =?us-ascii?Q?jZBacxUEgzK0ajpZr77GpovmI+y0m/mxVeuXOwNd4ylFy2Kv60Iyoo5E7TCE?=
 =?us-ascii?Q?03N2U5D/ghTpGRupoVm0aIYD7q+eq21lh+NXf/0Mt7hCoEPvxrSpvChTOocf?=
 =?us-ascii?Q?HkaMoD8FxI/8ixjB2pzJM0n4qE0i+IN/yGtgHIPl56A9bve0Vm4EplfV7Evo?=
 =?us-ascii?Q?wFbkXxdTjWzPhn4NRrE5ayegpXsjtsDLUDWrfppZdGbBva/q7WFuSnb6o5dG?=
 =?us-ascii?Q?j5nIpCkSlPgqfF9yviBMGBLfr4qwstcvUIV4Qm0wl0bOTjFvDwpv9GiQOZ4A?=
 =?us-ascii?Q?cyqCbcJEkwq3xjXBo3VUzazPMErLF5yvZ1csw6QpL80K+VKfdFZWrWfxusXq?=
 =?us-ascii?Q?vV+JIjEmkr0RFIR2moVVkYIpAJ1ixiZ7mGgfqyEvfUBH8kg0guFc1EQhBOCV?=
 =?us-ascii?Q?//Ar6boXF7z+G3Sxaspb0kfBJLsvw0AHI13YC9UWJ40g8XvJmWZTu8PTZydV?=
 =?us-ascii?Q?qKMIL88QVMvYkHhXID1rxMerCoxYj82IKJaz8HDm7xYDsYWWUyKOLUPbNuk0?=
 =?us-ascii?Q?rV/B9grNIUU4RuHio2la2VW3+VVE9zPCZavTJUnGxZqlcI9ACxZ4uCE78qPx?=
 =?us-ascii?Q?oCcXPu1BDFhCDisGpfZmakCQNKjqZhdLGlotg6IOIdGKmzKrOXgBOFbfV6dP?=
 =?us-ascii?Q?pMOJ9EqL8J9NpCymKRf+xc384/tbNCPMxhcQEsjKknVt5XzPUTO5udJv0ECT?=
 =?us-ascii?Q?6jcsE9niC3dyPViLaS5gANE9lbgQGcuushISRdFz9ByfCTg0ZcMAXtBw/swP?=
 =?us-ascii?Q?y69LsC0FjUIRp7raDLoSWKx+J57vOzD/+ab8nebofsVM70JnB5kCdnMsG0F3?=
 =?us-ascii?Q?IgwRVfKdi32DkwLzIZeSGwpWl0aaMiguNoeNozEpSGIzXTdZV0V89xSgnejL?=
 =?us-ascii?Q?+hMtfuo44CnFAZtWAXyRRn/+VumQNq9nne7dJJCT9NqJ/aX39MqkFF7DCvYY?=
 =?us-ascii?Q?MapAdgOz8L24Trlo8m1nj5+AcOvgboEBHwJizLAmAfu2Gv/Ts+zD2hp8Gqc3?=
 =?us-ascii?Q?zNfzTvpU2yuveXv6lts=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JesUt2TBTJfwfE6D7ZimfqiFJgG4Q7XzdW/Q10KVVsKaPaLnHqmJI+t52vY2?=
 =?us-ascii?Q?U1p6FQCyWBl+6G3c8KcXEyFQDvHV5Jv0vJ1PgVo+lUrCoSqUHiOJj3QDB8hb?=
 =?us-ascii?Q?dYhGTV0yCteW4mIGb5qGxG8DfmckgmFwAG4sqcXLi/L6DKDzDbxesSBmG9Fh?=
 =?us-ascii?Q?sx+nrbtrddFR9w9B1R146b9lNvBkrH8wT9h2bXzmDqh8P5w+47Ez/wLEpnaH?=
 =?us-ascii?Q?gnxxLXcJlv9gA5pFCKBlw/KmP0xAoD4deV2y7N1E0KIYJu1cc8w80RWQi56H?=
 =?us-ascii?Q?Jpreb+LkD6p7vrWcFM8dxOAOzNQJDhTz+qRFQvTRQWqBfZV2LnZM4giP8gLW?=
 =?us-ascii?Q?cPpo6MypYhQdlFfRLgb5Xfi6KhTIVeRXAIwNPrEmsALURIRf+M65qFfIVP8E?=
 =?us-ascii?Q?WlcW8mcaaxyMCr0yrwHQetbJfasiISYjkVGwf+i4l9e5aSLAd3of+2IZpA57?=
 =?us-ascii?Q?CEfg4MEB3WtssXEFRqv5k1IFSA6D4NSQntHpsuJpJr+wPOuhpurAJbEmgKPi?=
 =?us-ascii?Q?JxhurMJZh3IjiPK9YO0ZtPc94ixUN4/Ot/lTQRJSTu8g+PDF6tP/3y+jfXhQ?=
 =?us-ascii?Q?TYEEsXupSkpzKdPkme1rLlIQMzl+PaHGUiIbBdR+hh3VLOYAbnhLQZOPgwor?=
 =?us-ascii?Q?yhQKvEUlN41K1RVxefTKXku7bibp0KF1bEvOwjZolPgSNDLwCzinGSuw0n03?=
 =?us-ascii?Q?8ARb94a82j6IWunBId2+JgFeVMQpltRCMneDG6fNA6N/AhAIuZbOXRKwOVxo?=
 =?us-ascii?Q?PpNKxVMTsU67IgyMDo3uRag4Xob6h29sd/rIHwJL12Zichqb+zAC6K9P+Xho?=
 =?us-ascii?Q?H0FeWZOJphCez/OYCTeQMMw+wwa415fSvwUgQi2QZZcP9FWbrKKUpcrXrVXG?=
 =?us-ascii?Q?sQGxwpXXNaOdFZ7zSmRnUdr+CRq77eJpNW7KZvPOWe93bRoAWAC3TupUquCs?=
 =?us-ascii?Q?Jur0IbTvnR1q/CFmeErrO7eaxK/XAnfMxgKgu7N8Fe/0RdYgFdDnT4nEp7gb?=
 =?us-ascii?Q?tRR4Bc1iSKADRqtM85KfsmmT7tGjIBgn1JcavKMChKxervxE3+TZZEDfgDm0?=
 =?us-ascii?Q?G1O4hTCiYUAklcQ/QNQDE383N2bRYug8vyJvlcHS51Bi71y51Cg50Mtg5YH5?=
 =?us-ascii?Q?C6jIOjecjPiIdgCyn3fMeW7G/GHSTnugg5PgI5AgsAsGCptH4CiJEFm+DS2e?=
 =?us-ascii?Q?mB2EdRQrAJno0Rm6cSJPflNU2iS7FVsMovdMtsTPJnUr3NUclfY5W7hLF2Sb?=
 =?us-ascii?Q?XP/WNns7uIteo3RXAc0IRc4uf9b5ukhS3TCM9Ufiw6S1mQFQ26eL3gfjqhj6?=
 =?us-ascii?Q?xMxRM4Iv2FG/zDpJNq+zwAxAERRbi5xx9RmA82tDbXBR4y6RbuSTvjwlJeDD?=
 =?us-ascii?Q?UoDeOgn3XF8l/lj7q3sM4qW4RlHerObPxCN9T3olTEwsaI2lK2kchBqtDiVp?=
 =?us-ascii?Q?aZMqMBdc/tz8cDi12fHu8yMcpZj49rtw/ts67yw9rLj/Fij96pBlDH1YCgn6?=
 =?us-ascii?Q?SG6DtnfvXWLPIQLUJaC3c1F81ClPGubxgD2yyusF1cCs6nn9QiNnOF6lxzwi?=
 =?us-ascii?Q?huxt3zN9c2nUE0NqlBuf52iGwfsuDk21Edk3wxKvjZAIVzee8xVnfzOjRh9A?=
 =?us-ascii?Q?GmvlW2uhmkgI0Ty+BlconKC9qiZvqQ5QvI6wZMDfbMc2MFGOn7bh3wM/iTVS?=
 =?us-ascii?Q?1lI5KZ5+JPZ6GEfKmmKk1ByvMKdxFckH9p8bfdW+eauasI/YKExY3fZ4A79i?=
 =?us-ascii?Q?PNfd/kiaag=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a215a304-a2ff-4e18-b132-08de73f5abd2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 22:40:12.2328 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tJT+R6Fc2NnKjOQofoGBQu1ZYwbXOcUesiVfEOEW929gqz6mvAGH2Gfxlr+8iZCGmGZEfaBgSEJvz4NLLRBa/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7816
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
	NEURAL_HAM(-0.00)[-0.891];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid]
X-Rspamd-Queue-Id: 551BE18D7E8
X-Rspamd-Action: no action

The series adds Rust GPU buddy allocator bindings for use by nova-core.

Note: Patches 1-3 are included for reference only and should not be merged
through this series. They are the DRM buddy allocator code movement patches
(already being pulled into upstream via drm-misc-next by Dave Airlie) and the
uninitialized buddy fix by Koen Koning (which is going in independently). They
are included here as they are prerequisites for the Rust GPU buddy bindings
(and could be further revised).

The series along with all dependencies, including clist and nova-core mm
patches, are available in:
https://git.kernel.org/pub/scm/linux/kernel/git/jfern/linux.git/log/?h=nova/mm

Changes from v10 to v11:
- Dropped "rust: ffi: Convert pub use to pub mod and create ffi module" patch;
  the ffi module restructuring will go through a different path.
- Dropped "rust: clist: Add support to interface with C linked lists" patch;
  the clist module will be submitted separately.
- Dropped "nova-core: Kconfig: Sort select statements alphabetically" cosmetic
  patch.
- Patches 1-3 (DRM buddy movement and fix) are included as reference only;
  they are already being pulled into upstream via drm-misc-next.
- Removed clist patches as those can go in independently (Alice).
- Moved the Kconfig GPU_BUDDY selection patch to nova-core mm series to enable
  it when it is actually used.
- Various nits to comments, etc.

Changes from v9 to v10:
- Absorbed the DRM buddy code movement patches into this series as patches 1-2.
  Dave Airlie reworked these into two parts for better git history.
- Added "gpu: Fix uninitialized buddy for built-in drivers" fix by Koen Koning,
  using subsys_initcall instead of module_init to fix NULL pointer dereference
  when built-in drivers use the buddy allocator before initialization.
- Added "rust: ffi: Convert pub use to pub mod and create ffi module" to prepare
  the ffi module for hosting clist as a sub-module.
- Moved clist from rust/kernel/clist.rs to rust/kernel/ffi/.
- Added "nova-core: Kconfig: Sort select statements alphabetically" (Danilo).

Changes from v8 to v9:
- Updated nova-core Kconfig patch: addressed sorting of Kconfig options.
- Added Daniel Almeida's Reviewed-by tag to clist patch.
- Minor refinements to GPU buddy bindings.

Changes from v7 to v8:
- Added nova-core Kconfig patch to select GPU_BUDDY for VRAM allocation.
- Various changes suggested by Danilo Krummrich, Gary Guo, and Daniel Almeida.
- Added Acked-by: Gary Guo for clist patch.

Changes from v6 to v7:
- Major restructuring: split the large 26-patch v6 RFC series. v7 only contains
  the Rust infrastructure patches (clist + GPU buddy bindings), extracted from
  the full nova-core MM series. The nova-core MM patches follow separately.
- Rebased on linux-next.

Changes from v5 to v6:
- Rebased on drm-rust-kernel/drm-rust-next.
- Expanded from 6 to 26 patches with full nova-core MM infrastructure including
  page table walker, VMM, BAR1 user interface, TLB flush, and GpuMm manager.

Changes from v4 to v5:
- Added PRAMIN aperture support with documentation and self-tests.
- Improved buddy allocator bindings (fewer lines of code).
- Based on drm-rust-next instead of linux-next.

Changes from v3 to v4:
- Combined the clist and DRM buddy series into a single coherent series.
- Added DRM buddy allocator movement from drivers/gpu/drm/ up to drivers/gpu/,
  renaming API from drm_buddy to gpu_buddy.
- Added Rust bindings for the GPU buddy allocator.

Changes from v2 to v3:
- Squashed 3 clist patches into one due to inter-dependencies.
- Changed Clist to Clist<'a, T> using const generic offset (Alex Courbot).
- Simplified C helpers to only list_add_tail (Alex Courbot, John Hubbard).
- Added init_list_head() Rust function (Alex Courbot).
- Added FusedIterator, PartialEq/Eq impls.
- Added MAINTAINERS entry (Miguel Ojeda).

Changes from v1 (RFC) to v2:
- Dropped DRM buddy allocator patches; series focuses solely on clist module.
- Dropped sample modules, replaced with doctests.
- Added proper lifetime management similar to scatterlist.
- Split clist into 3 separate patches.

Link to v10: https://lore.kernel.org/all/20260218205507.689429-1-joelagnelf@nvidia.com/

Joel Fernandes (3):
  gpu: Move DRM buddy allocator one level up (part one)
  gpu: Move DRM buddy allocator one level up (part two)
  rust: gpu: Add GPU buddy allocator bindings

Koen Koning (1):
  gpu: Fix uninitialized buddy for built-in drivers

 Documentation/gpu/drm-mm.rst                  |   10 +-
 MAINTAINERS                                   |   16 +-
 drivers/gpu/Kconfig                           |   13 +
 drivers/gpu/Makefile                          |    3 +-
 drivers/gpu/buddy.c                           | 1322 +++++++++++++++++
 drivers/gpu/drm/Kconfig                       |    5 +-
 drivers/gpu/drm/Kconfig.debug                 |    1 -
 drivers/gpu/drm/Makefile                      |    1 -
 drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c       |    2 +-
 .../gpu/drm/amd/amdgpu/amdgpu_res_cursor.h    |   12 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.c  |   79 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_vram_mgr.h  |   20 +-
 drivers/gpu/drm/drm_buddy.c                   | 1277 +---------------
 drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |    2 +-
 drivers/gpu/drm/i915/i915_scatterlist.c       |   10 +-
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.c |   55 +-
 drivers/gpu/drm/i915/i915_ttm_buddy_manager.h |    4 +-
 .../drm/i915/selftests/intel_memory_region.c  |   20 +-
 drivers/gpu/drm/tests/Makefile                |    1 -
 drivers/gpu/drm/tests/drm_exec_test.c         |    2 -
 drivers/gpu/drm/tests/drm_mm_test.c           |    2 -
 .../gpu/drm/ttm/tests/ttm_bo_validate_test.c  |    4 +-
 drivers/gpu/drm/ttm/tests/ttm_mock_manager.c  |   18 +-
 drivers/gpu/drm/ttm/tests/ttm_mock_manager.h  |    4 +-
 drivers/gpu/drm/xe/xe_res_cursor.h            |   34 +-
 drivers/gpu/drm/xe/xe_svm.c                   |   12 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c          |   71 +-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr_types.h    |    4 +-
 drivers/gpu/tests/Makefile                    |    4 +
 .../gpu_buddy_test.c}                         |  416 +++---
 .../lib/drm_random.c => tests/gpu_random.c}   |   18 +-
 .../lib/drm_random.h => tests/gpu_random.h}   |   18 +-
 drivers/video/Kconfig                         |    1 +
 include/drm/drm_buddy.h                       |  163 +-
 include/linux/gpu_buddy.h                     |  177 +++
 rust/bindings/bindings_helper.h               |   11 +
 rust/helpers/gpu.c                            |   23 +
 rust/helpers/helpers.c                        |    1 +
 rust/kernel/gpu/buddy.rs                      |  536 +++++++
 rust/kernel/gpu/mod.rs                        |    5 +
 rust/kernel/lib.rs                            |    2 +
 41 files changed, 2536 insertions(+), 1843 deletions(-)
 create mode 100644 drivers/gpu/Kconfig
 create mode 100644 drivers/gpu/buddy.c
 create mode 100644 drivers/gpu/tests/Makefile
 rename drivers/gpu/{drm/tests/drm_buddy_test.c => tests/gpu_buddy_test.c} (67%)
 rename drivers/gpu/{drm/lib/drm_random.c => tests/gpu_random.c} (59%)
 rename drivers/gpu/{drm/lib/drm_random.h => tests/gpu_random.h} (53%)
 create mode 100644 include/linux/gpu_buddy.h
 create mode 100644 rust/helpers/gpu.c
 create mode 100644 rust/kernel/gpu/buddy.rs
 create mode 100644 rust/kernel/gpu/mod.rs


base-commit: 2961f841b025fb234860bac26dfb7fa7cb0fb122
prerequisite-patch-id: f8778e0b72697243cfe40a8bfcc3ca1d66160b12
prerequisite-patch-id: 763b30c69f9806de97eb58bc8e3406feb6bf61b4
-- 
2.34.1

