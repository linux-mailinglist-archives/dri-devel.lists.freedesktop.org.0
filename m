Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OLOAB+0HhmkRJQQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 16:25:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A722FFFB62
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 16:25:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 756C210E818;
	Fri,  6 Feb 2026 15:25:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=garyguo.net header.i=@garyguo.net header.b="MO8brYge";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from LO2P265CU024.outbound.protection.outlook.com
 (mail-uksouthazon11021106.outbound.protection.outlook.com [52.101.95.106])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CE0A10E802;
 Fri,  6 Feb 2026 15:25:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ed31dG5gIUaX19QNeCMX3SUWdvfCtcW9z53twtn3d8lO4qlcHGId6iML8oHEV64LCKCPUnL0ouaSS+fCv8/swMALd4XEhRsVjHBRvL5T6QK/idb1Kla1t1EUw61Yu+x85B6w4uK6VLg+Ar6BzLdFpY6mgEhOSIevFQygAkNxJLDF/KVdxmfnyujsH2TkBh1HEfqYynrdcb75vx1v2UbbGdQ2/O2TOVP0hlpG9ZtkLi5gWLFDA0pBqhYMgog51UbPxbXY8Vg/P9typmtedPJNgRGP0KjH7r2E91oIjARRAlc2MFqBrTpuFqbE9E+NC4DJa3CUM2ppyR5wL/Mq3zn9NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KQvHxMx7JoTJHPA5XV/I4+Z7d6Vwkl3RgGTg5LMilSo=;
 b=Abiv8CbFCqW54QORmiWv0HpTwn7MV637wNJdkrPZA+mpFP6fV/iKMigXgWumZT2vK8FBIoIoEpT5Aum8vYua3ugKba1Dd31/ORw80TDFYrCe8+gjd+IJ9aeHUDQOXP4zfdh9KYAZTFal++rxSpq1qqHFj0fOWwxZH6pDjWxcJPiPH62Q154h3kAJ+FdOpg0TEvrWUjSZ3EupF0w54PrpbKuFGBFZeRxEGsfTK8Ou4d4LuEMaR4lf8S//IQW5yPwVl3Ehbukp+Tgb48XBrPapFygX06YCbNNAFn01fVsITcXiCSKpc/Mht9g+Adj7jE6jz9xeBDNfSVwNE4cdj3RH6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=garyguo.net; dmarc=pass action=none header.from=garyguo.net;
 dkim=pass header.d=garyguo.net; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=garyguo.net;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KQvHxMx7JoTJHPA5XV/I4+Z7d6Vwkl3RgGTg5LMilSo=;
 b=MO8brYge8Q0y4gc6Hf8jBtK0YbKFzfPBnWD8dUfaoZ2MLjvg2SxmH3vyt7FRDn2kGv03jLPdoa+ZkZQvrWtlUkYSGvymTBJIv1UqdvL8Vd+eHRVNQvVnLMH2uafrf1uFJR6kmMKK1Q3sVf33U0p1yiMKyEz9muzVzQZd1fv8tZQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=garyguo.net;
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:488::16)
 by LO0P265MB6996.GBRP265.PROD.OUTLOOK.COM (2603:10a6:600:2ed::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Fri, 6 Feb
 2026 15:25:23 +0000
Received: from LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986]) by LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 ([fe80::1c3:ceba:21b4:9986%5]) with mapi id 15.20.9564.016; Fri, 6 Feb 2026
 15:25:23 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Feb 2026 15:25:23 +0000
Message-Id: <DG7ZF1UT98RQ.3F42J3ULGV2OC@garyguo.net>
Cc: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Jonathan
 Corbet" <corbet@lwn.net>, "Alex Deucher" <alexander.deucher@amd.com>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, "Jani Nikula"
 <jani.nikula@linux.intel.com>, "Joonas Lahtinen"
 <joonas.lahtinen@linux.intel.com>, "Rodrigo Vivi" <rodrigo.vivi@intel.com>,
 "Tvrtko Ursulin" <tursulin@ursulin.net>, "Huang Rui" <ray.huang@amd.com>,
 "Matthew Auld" <matthew.auld@intel.com>, "Matthew Brost"
 <matthew.brost@intel.com>, "Lucas De Marchi" <lucas.demarchi@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 "Helge Deller" <deller@gmx.de>, "Danilo Krummrich" <dakr@kernel.org>,
 "Alice Ryhl" <aliceryhl@google.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Edwin Peer"
 <epeer@nvidia.com>, "Alexandre Courbot" <acourbot@nvidia.com>, "Andrea
 Righi" <arighi@nvidia.com>, "Andy Ritger" <aritger@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "Balbir Singh" <balbirs@nvidia.com>, "Philipp Stanner"
 <phasta@kernel.org>, "Elle Rhumsaa" <elle@weathered-steel.dev>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, <joel@joelfernandes.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <amd-gfx@lists.freedesktop.org>, <intel-gfx@lists.freedesktop.org>,
 <intel-xe@lists.freedesktop.org>, <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH -next v7 1/2] rust: clist: Add support to interface with
 C linked lists
From: "Gary Guo" <gary@garyguo.net>
To: "Joel Fernandes" <joelagnelf@nvidia.com>, <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.21.0
References: <20260206004110.1914814-1-joelagnelf@nvidia.com>
 <20260206004110.1914814-2-joelagnelf@nvidia.com>
In-Reply-To: <20260206004110.1914814-2-joelagnelf@nvidia.com>
X-ClientProxiedBy: LO4P123CA0049.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:152::18) To LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:488::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LOVP265MB8871:EE_|LO0P265MB6996:EE_
X-MS-Office365-Filtering-Correlation-Id: 18293bb9-b3ba-401f-289e-08de6593f288
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NGxJdnhnbHp3VGl3b3FTenZuRkZnMnhIdFBCUmY3U3dsVHpLbXNyakxvMnVp?=
 =?utf-8?B?K2FQZzBDenJvMW1MeWZPZ1lsN3RLSzNHa093TlhKeU1CaGFSdmJzV2pzNXNG?=
 =?utf-8?B?VDFhWDFaWUErRFRxdXZId2pmTzZoYzMrWjlFdXh6djRLLytIaEpNbDdudXhP?=
 =?utf-8?B?Ym1kZ05UQ1lwUnE5SDVvSGZqVCtFdmJZaWpLVTN4ZWpSTVdMWFFHcG14WE1Q?=
 =?utf-8?B?OG9lK0MxWXNjSWc4R2dieUVZbkx3TFhWTW9sdDFjeXFGVzZVRTZuemlJSXhT?=
 =?utf-8?B?MzJDaklmMm5TcUZ4MEI1SzNpUXAvK3JnaHhGVlpqWXVjdjJFd2FJZWFpMUEx?=
 =?utf-8?B?dTVXR1ZMUFVyTmJiUVRiUkp3SkFISEx3Z3lXR3ZMSnVvbS96bWxrcXdDbnp2?=
 =?utf-8?B?TkkrZGN5S2ZaeHlrenQ4a3ZRTlkvdWZEeGtnU1BaMjRmSW43S2lBRFNNV09Z?=
 =?utf-8?B?a0tZL1JoNGNURXluWGVNWHlYK2FCeTBEL3d4UDF1SzZtM3Fmam96WC84YUd5?=
 =?utf-8?B?WmMzTGYzZEVxdVpaMlJiZ05CSWRJK2VncW9sNW5wWU1JbjBoN1hiN1FvcEcr?=
 =?utf-8?B?L2xSUUtLQi9KWG5yWlNxK0ZhcnUzOHVCeXNzaGlJd2w4REMyRVQwa2JiWUE2?=
 =?utf-8?B?a2RLQ29qTHZDbTRSV1dzS21wWktiWStyWTN0Z2Rsa0lJQisrT3pPWUJlRkd2?=
 =?utf-8?B?K1JJcm1OWkVMVklnVHpRQXRaN09Ea1FXUVA5S0JvMFMzTFdvbFh5SjFCZ1Yr?=
 =?utf-8?B?aWJLbE9rMVRzcUI1RElUVHQvb3hoQVcwVCtyMWZ2ZnovRWFZVDc5dE02RkdE?=
 =?utf-8?B?ajRiN010ZU9RSWQ1Sjg2b29TZ3hpVG82eFhnUFhwb3FxMk50LzlHRXNuanY5?=
 =?utf-8?B?bnp0K2gzc3RFVSs5c2N2Ni91TkhzRHB2ZitreUxxWjhnTnpoVUpMNHF5eU9u?=
 =?utf-8?B?SkU2SGRyNVArNTBoZGdFcGJaUnZjUHlJZEVJTk9hYzhQT0tTalBpV2MzaGpp?=
 =?utf-8?B?ODNyMjA4QnNZUE9qWjlPWXd0ZndNRE5HUVhETWVZblRhNExmQXZNNXh0NW9X?=
 =?utf-8?B?V253c3R6Y1NmWEV0alpTcytENWdYbkhJUmU0MDNZSjlROTcyajdVbWk5bzc1?=
 =?utf-8?B?OGk5cWxPM2NOTFlDQnhBcE9FWjNJcnEvZGhPUFJiOGliQU9BSUJ2S2dKRFdU?=
 =?utf-8?B?bURMZTVvY0xoeEk3MW4rcnUrNjRQbXg2WUVhRFNLeW40NDFydFZaVEJWRVd2?=
 =?utf-8?B?c0hGOWFGTldyRWdobjdXeUhNRkxRVmwwZDBJTHp1ZGdvQUNIcnRoV21aeW55?=
 =?utf-8?B?c0VZUlB4NVl5aWhBcGtkRFdNd1ZYMUtrT3JWWGhkSDVtYVNlS2RnZEdyRVhR?=
 =?utf-8?B?OUFkaVFOSkc2ZEF3akNGQkVUVTNWTEZzQXA2YnNwSTZLZzhpWXFUQWV3Kzhq?=
 =?utf-8?B?cTU0am45cURuRTF4TEZRU01HT2RaV3R3ZHdia3MvYWJ6QURreWI3UGxuZFpZ?=
 =?utf-8?B?LzlvanFiNFRzTGI4QlVNZ3ZkM0tyVUxyOGY0QWNCVFNVSlErUWhRVGMyYnZU?=
 =?utf-8?B?SkJsUnlEL0NLSGRsVHJMSHEyN2sxODdXa1JJRVdCZnQxQ09la0c1SnR3U25Q?=
 =?utf-8?B?TlNGckZRTlp4MkNTQUdxWHQrZEFZMS9ISEZ5MjNEYWx5clVLMTZFa2ROa2NF?=
 =?utf-8?B?elM5MGd5NDZFbHdSWUlZWXZwaGlGWkpHdFJVZlhNd0l2ZEZoQXYyL1JkOExB?=
 =?utf-8?B?dmdWZWVrNHBEb2o5NGwxU1U0TlhGUzBUVkJOSjBPU1FmZVB1Tm5KR21yZHhm?=
 =?utf-8?B?NG1pSEhqNExTYVJPVWsrZHpFUjNTTnR4UFEvbktVbVZ5WlB5Q0plZ3ZnYnFK?=
 =?utf-8?B?WW5XMklwNHdYWExjdGdUOHhhYXNuZlEwMXRiKzBMMDFFenl6NUxMak9vNUtR?=
 =?utf-8?B?MStzdUhSSk9heHdPLzdyeEtkOXo3S2MrTkJmK25jZmRQdnZoMHA0Y2pIblEz?=
 =?utf-8?B?UVJnNDE0czMzZU02R0pmbHZrbmVHbEUwTytnTm1GSU9xUW1CYkhTbkkyY3hs?=
 =?utf-8?B?bFBya2hPZEF4MkJIREh6bDJFMGpKRk5RTzRDZzRQTUs2R1ZnOTE4NU9CWSsz?=
 =?utf-8?Q?ZvZ0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(7053199007); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T3ExVWhRVjlpNmh3TS92ZzlBbGROdGxDUDk2Ty80N3NycDJWcmltYXQrU1h3?=
 =?utf-8?B?dTdoYXI0RUpxSVpmWTRDZDM3RGlZclB5Q3ZpU0RuZW1FUWNIbk1BMU80YjR0?=
 =?utf-8?B?V0FHRmFxeVoxMjFUcTdWU016MURPZXdWQTBvMVNPQkkzT1JTRXNmQjhDdXlT?=
 =?utf-8?B?MXhwT0s1cTVraW43ZDkxejRWSHltK1hjV24zeGJ5R3czY3daL1JheXZYNHU3?=
 =?utf-8?B?UnZ1VFZXMmhzcktVRTQ1RDg0MXo2RFcvVE8rYkgwREMrRjdIVVkwWnhrc3Fn?=
 =?utf-8?B?cUllUjJrRGU1RDZSa3lQb1ozY0N0NGRoRG1odktyNjJxNHdaZUx0TlRnSmtP?=
 =?utf-8?B?V0ZOZVl4SDc3dzEvSVVTZnJrU0pnV0E2WGRjZzdYRVdsNW1UZEVFWjNDMXl1?=
 =?utf-8?B?bERiOHVseGIvTkZRaDV4c21YbmQ3Ny9YZ0hLWFVoWmY5VGhCOE91SE5vOFd4?=
 =?utf-8?B?d0l6Q2wxcTZsMVlqSkJQM3hMQ1V3SHZrTWE4MkJlZzhWZTBnalNkV2dCc0M3?=
 =?utf-8?B?VGxtQjhIRU5ySmlBYkttY0VTZWFRaVJ3dFdsRVRzdGV0ZHU4bTlhN3NPZnV6?=
 =?utf-8?B?TU5WWEpzSkpwMyttU1BzalpWYU1VNTlJaGxWaElkbjY0ZWUrRXdWVUUxd1dh?=
 =?utf-8?B?ck9DTFQydlQrZE1LWXVYN0dwTnJvOWF6WkZqZXU0U1hKbGk3UFJkaU1BcVQ2?=
 =?utf-8?B?dVZYZVhsUFJIOUZpV2FOR1JiKzBKSTc2Yml4cTlPYkltczhBOG5sdXdRYlhv?=
 =?utf-8?B?OFJTb1JEYlMzVWluSkRCRkhYV1FLZlpOVXJYS0FqSGticXJnMW55Q2YwdEFF?=
 =?utf-8?B?czJGT1d6cmtoaFU4TUs1a09CUXpGOWdhYUFHN1dXVkpiY29HUnFtK3Y2MUF0?=
 =?utf-8?B?QmFNRUZzcGdwM1h0WlZBR3lBZi9KS3l1UUcrc2VBWGhtTHZTUXl2b29BRE1q?=
 =?utf-8?B?d0kramdObGRUejFRWEtmOUdxZkUrM3J4N2ZBa1JQbTR0UVp4Z2p5TWtWdDZy?=
 =?utf-8?B?U2d2Yk8rRjQzcDQ5eUFlaTJzYURDMk1JT0RyUGo4aDI5MWdwQk1uK3NEZGZZ?=
 =?utf-8?B?RjVmOWl5MkZUbmIzS2Q0QkNwd0djSkd6SG42bTg5R3FtK0g3QTJ6Z1ZaVER2?=
 =?utf-8?B?SjFnR2ZDOVRRN2RxcGdMb2lxY0pXS053c1hZUkZ5OW9PMkhWL2J0dUVlT1Bx?=
 =?utf-8?B?WHVOdTRKZUhrYWQ4eU5saEFBSEFHM1J2TjlSTkQrVS96SVlmNkNtMkNhTDhk?=
 =?utf-8?B?cmorSXNvck5helZtd3lpbENXMW5zak9Bak5QOEN2ZWpxMm0wYXBXSnRqeml3?=
 =?utf-8?B?Uy93RDRQcWdjamxxVFNWTWRuakdTRHlIeFFJZDV3c2s2d0VNMGNmZXJuVEVy?=
 =?utf-8?B?SXhNejFBOERtdGw4MllCZTJyWHRlaTN0L1BuRXltaEpHMGl4NjdlWmc5VFlu?=
 =?utf-8?B?bHBwYmN6Wk1DbnZRTlZkaVVBb0lmOTY4NlhCSHVXS1kvSmpQQmNXbktnT3pD?=
 =?utf-8?B?RFZETTB3ckMxcWd2US96VllFdmtxeWxadHdud0lBNG0vM0tOK1haeFFjYnZu?=
 =?utf-8?B?ZTNJQUhOaHlJM043UElmdlZ5a3hpZVhTaE1YUGJxRExVejlSKytoQnJRWU5w?=
 =?utf-8?B?ZmRpZ1VmdHU3YTNiNjhwUUVFcTA1Y0thMVpEdy9WeUtVRGc5NjRhdVBUM3Ay?=
 =?utf-8?B?VDVWaUpKc2pUdEZETGc0OXNtMVlKb0tjamt1RlFhZFBXWXFhWWcwOEFPLzBG?=
 =?utf-8?B?eGRFSk5vbkI1c1lZTExjL1p5RlNLS1dPSDU4NTNFYmdPQjVaL2dvL1BjM1Vp?=
 =?utf-8?B?cVBHSE5DUEVLNlA4eUlnUm5hYlFUU1owT2l3ZHVUQlU2bGZoQ3pielc4REpO?=
 =?utf-8?B?cHBvbXhGWnUzMFdVWG5MZTlRUUxBWTdVVFlkcW0xRm9xNDB5VmdiTVBYV0lp?=
 =?utf-8?B?UERLYnVFT3dQeTJ2UXVYRXhhckVEdXJYQTgrYXNTTkZXZUd5WkNoZHFvbEp6?=
 =?utf-8?B?R0lqTlBOUWJEU2E0ZmhnNWorRkFjcXZNbmM5dWFLWEU5RDhWN05tbUExM1ZZ?=
 =?utf-8?B?Rk50ZGQ2Z3NrR0dXdC9CS3JsSXY2TkZFVnBISGxOKy9rVWNrazNueWNQSDN6?=
 =?utf-8?B?ZEtCdGJtbmIxRFYxTThMWnJXenM3TVQxS2F2YWZvYjFhaWx3bDVieXpQaXNO?=
 =?utf-8?B?cHdDb2luRTJRc0ZPbU5BaXZ5S0x3d05UMElqQVBJdFNrRlF2Z2lKUGxoNjU1?=
 =?utf-8?B?VWQ5ajFNLzh2OXBBTzVrYStWdUNBK1h2emgxUld1ZFZENE5FUDlaVUFyQmhO?=
 =?utf-8?Q?6BUsAlCm7tU27zNbI4?=
X-OriginatorOrg: garyguo.net
X-MS-Exchange-CrossTenant-Network-Message-Id: 18293bb9-b3ba-401f-289e-08de6593f288
X-MS-Exchange-CrossTenant-AuthSource: LOVP265MB8871.GBRP265.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 15:25:23.8017 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bbc898ad-b10f-4e10-8552-d9377b823d45
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YJqK2C8PqqUS57tQAuOCVB+MsjMSgPyw1Gzo1U+IvstfHe3sQJvhsaSbZzv2uK+YUQbqesOym14TI6xFfNyxiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LO0P265MB6996
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
	DMARC_POLICY_ALLOW(-0.50)[garyguo.net,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[garyguo.net:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org,vger.kernel.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[51];
	FROM_NEQ_ENVFROM(0.00)[gary@garyguo.net,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[garyguo.net:+];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[garyguo.net:email,garyguo.net:dkim,garyguo.net:mid,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:email]
X-Rspamd-Queue-Id: A722FFFB62
X-Rspamd-Action: no action

On Fri Feb 6, 2026 at 12:41 AM GMT, Joel Fernandes wrote:
> Add a new module `clist` for working with C's doubly circular linked
> lists. Provide low-level iteration over list nodes.
>
> Typed iteration over actual items is provided with a `clist_create`
> macro to assist in creation of the `CList` type.
>
> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> ---
>  MAINTAINERS            |   7 +
>  drivers/gpu/Kconfig    |   7 +
>  rust/helpers/helpers.c |   1 +
>  rust/helpers/list.c    |  21 +++
>  rust/kernel/clist.rs   | 315 +++++++++++++++++++++++++++++++++++++++++
>  rust/kernel/lib.rs     |   2 +
>  6 files changed, 353 insertions(+)
>  create mode 100644 rust/helpers/list.c
>  create mode 100644 rust/kernel/clist.rs
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 900fc00b73e6..310bb479260c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23204,6 +23204,13 @@ S:	Maintained
>  T:	git https://github.com/Rust-for-Linux/linux.git rust-analyzer-next
>  F:	scripts/generate_rust_analyzer.py
> =20
> +RUST TO C LIST INTERFACES
> +M:	Joel Fernandes <joelagnelf@nvidia.com>
> +M:	Alexandre Courbot <acourbot@nvidia.com>
> +L:	rust-for-linux@vger.kernel.org
> +S:	Maintained
> +F:	rust/kernel/clist.rs

I still think we should try to work on a more powerful list infra that work=
s for
both C and Rust, but I reckon that is a longer term effort, and shouldn't
prevent a simpler version from getting in and be used by abstractions that =
need
it. So

Acked-by: Gary Guo <gary@garyguo.net>

Some nits below:

> +
>  RXRPC SOCKETS (AF_RXRPC)
>  M:	David Howells <dhowells@redhat.com>
>  M:	Marc Dionne <marc.dionne@auristor.com>
> diff --git a/drivers/gpu/Kconfig b/drivers/gpu/Kconfig
> index 22dd29cd50b5..2c3dec070645 100644
> --- a/drivers/gpu/Kconfig
> +++ b/drivers/gpu/Kconfig
> @@ -1,7 +1,14 @@
>  # SPDX-License-Identifier: GPL-2.0
> =20
> +config RUST_CLIST
> +	bool
> +	depends on RUST
> +	help
> +	  Rust abstraction for interfacing with C linked lists.

I am not sure if we need extra config entry. This is fully generic so shoul=
dn't
generate any code unless there is an user.

> +
>  config GPU_BUDDY
>  	bool
> +	select RUST_CLIST if RUST
>  	help
>  	  A page based buddy allocator for GPU memory.
> =20
> diff --git a/rust/helpers/helpers.c b/rust/helpers/helpers.c
> index a3c42e51f00a..724fcb8240ac 100644
> --- a/rust/helpers/helpers.c
> +++ b/rust/helpers/helpers.c
> @@ -35,6 +35,7 @@
>  #include "io.c"
>  #include "jump_label.c"
>  #include "kunit.c"
> +#include "list.c"
>  #include "maple_tree.c"
>  #include "mm.c"
>  #include "mutex.c"
> diff --git a/rust/helpers/list.c b/rust/helpers/list.c
> new file mode 100644
> index 000000000000..3390b154fa36
> --- /dev/null
> +++ b/rust/helpers/list.c
> @@ -0,0 +1,21 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +/*
> + * Helpers for C Circular doubly linked list implementation.
> + */
> +
> +#include <linux/list.h>
> +
> +#ifndef __rust_helper
> +#define __rust_helper
> +#endif

This shouldn't be needed.

> +
> +__rust_helper void rust_helper_INIT_LIST_HEAD(struct list_head *list)
> +{
> +	INIT_LIST_HEAD(list);
> +}
> +
> +__rust_helper void rust_helper_list_add_tail(struct list_head *new, stru=
ct list_head *head)
> +{
> +	list_add_tail(new, head);
> +}
> diff --git a/rust/kernel/clist.rs b/rust/kernel/clist.rs
> new file mode 100644
> index 000000000000..1f6d4db13c1d
> --- /dev/null
> +++ b/rust/kernel/clist.rs
> @@ -0,0 +1,315 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +//! A C doubly circular intrusive linked list interface for rust code.
> +//!
> +//! # Examples
> +//!
> +//! ```
> +//! use kernel::{
> +//!     bindings,
> +//!     clist_create,
> +//!     types::Opaque, //
> +//! };
> +//! # // Create test list with values (0, 10, 20) - normally done by C c=
ode but it is
> +//! # // emulated here for doctests using the C bindings.
> +//! # use core::mem::MaybeUninit;
> +//! #
> +//! # /// C struct with embedded `list_head` (typically will be allocate=
d by C code).
> +//! # #[repr(C)]
> +//! # pub(crate) struct SampleItemC {
> +//! #     pub value: i32,
> +//! #     pub link: bindings::list_head,
> +//! # }
> +//! #
> +//! # let mut head =3D MaybeUninit::<bindings::list_head>::uninit();
> +//! #
> +//! # let head =3D head.as_mut_ptr();
> +//! # // SAFETY: head and all the items are test objects allocated in th=
is scope.
> +//! # unsafe { bindings::INIT_LIST_HEAD(head) };
> +//! #
> +//! # let mut items =3D [
> +//! #     MaybeUninit::<SampleItemC>::uninit(),
> +//! #     MaybeUninit::<SampleItemC>::uninit(),
> +//! #     MaybeUninit::<SampleItemC>::uninit(),
> +//! # ];
> +//! #
> +//! # for (i, item) in items.iter_mut().enumerate() {
> +//! #     let ptr =3D item.as_mut_ptr();
> +//! #     // SAFETY: pointers are to allocated test objects with a list_=
head field.
> +//! #     unsafe {
> +//! #         (*ptr).value =3D i as i32 * 10;
> +//! #         // addr_of_mut!() computes address of link directly as lin=
k is uninitialized.
> +//! #         bindings::INIT_LIST_HEAD(core::ptr::addr_of_mut!((*ptr).li=
nk));
> +//! #         bindings::list_add_tail(&mut (*ptr).link, head);
> +//! #     }
> +//! # }
> +//!
> +//! // Rust wrapper for the C struct.
> +//! // The list item struct in this example is defined in C code as:
> +//! //   struct SampleItemC {
> +//! //       int value;
> +//! //       struct list_head link;
> +//! //   };
> +//! //
> +//! #[repr(transparent)]
> +//! pub(crate) struct Item(Opaque<SampleItemC>);
> +//!
> +//! impl Item {
> +//!     pub(crate) fn value(&self) -> i32 {
> +//!         // SAFETY: [`Item`] has same layout as [`SampleItemC`].
> +//!         unsafe { (*self.0.get()).value }
> +//!     }
> +//! }
> +//!
> +//! // Create typed [`CList`] from sentinel head.
> +//! // SAFETY: head is valid, items are [`SampleItemC`] with embedded `l=
ink` field.
> +//! let list =3D unsafe { clist_create!(head, Item, SampleItemC, link) }=
;
> +//!
> +//! // Iterate directly over typed items.
> +//! let mut found_0 =3D false;
> +//! let mut found_10 =3D false;
> +//! let mut found_20 =3D false;
> +//!
> +//! for item in list.iter() {
> +//!     let val =3D item.value();
> +//!     if val =3D=3D 0 { found_0 =3D true; }
> +//!     if val =3D=3D 10 { found_10 =3D true; }
> +//!     if val =3D=3D 20 { found_20 =3D true; }
> +//! }
> +//!
> +//! assert!(found_0 && found_10 && found_20);
> +//! ```
> +
> +use core::{
> +    iter::FusedIterator,
> +    marker::PhantomData, //
> +};
> +
> +use crate::{
> +    bindings,
> +    types::Opaque, //
> +};
> +
> +use pin_init::PinInit;
> +
> +/// Wraps a `list_head` object for use in intrusive linked lists.
> +///
> +/// # Invariants
> +///
> +/// - [`CListHead`] represents an allocated and valid `list_head` struct=
ure.
> +/// - Once a [`CListHead`] is created in Rust, it will not be modified b=
y non-Rust code.
> +/// - All `list_head` for individual items are not modified for the life=
time of [`CListHead`].
> +#[repr(transparent)]
> +pub(crate) struct CListHead(Opaque<bindings::list_head>);
> +
> +impl CListHead {
> +    /// Create a `&CListHead` reference from a raw `list_head` pointer.
> +    ///
> +    /// # Safety
> +    ///
> +    /// - `ptr` must be a valid pointer to an allocated and initialized =
`list_head` structure.
> +    /// - `ptr` must remain valid and unmodified for the lifetime `'a`.
> +    #[inline]
> +    pub(crate) unsafe fn from_raw<'a>(ptr: *mut bindings::list_head) -> =
&'a Self {
> +        // SAFETY:
> +        // - [`CListHead`] has same layout as `list_head`.
> +        // - `ptr` is valid and unmodified for 'a.
> +        unsafe { &*ptr.cast() }
> +    }
> +
> +    /// Get the raw `list_head` pointer.
> +    #[inline]
> +    pub(crate) fn as_raw(&self) -> *mut bindings::list_head {
> +        self.0.get()
> +    }
> +
> +    /// Get the next [`CListHead`] in the list.
> +    #[inline]
> +    pub(crate) fn next(&self) -> &Self {
> +        let raw =3D self.as_raw();
> +        // SAFETY:
> +        // - `self.as_raw()` is valid per type invariants.
> +        // - The `next` pointer is guaranteed to be non-NULL.
> +        unsafe { Self::from_raw((*raw).next) }
> +    }
> +
> +    /// Check if this node is linked in a list (not isolated).
> +    #[inline]
> +    pub(crate) fn is_linked(&self) -> bool {
> +        let raw =3D self.as_raw();
> +        // SAFETY: self.as_raw() is valid per type invariants.
> +        unsafe { (*raw).next !=3D raw && (*raw).prev !=3D raw }
> +    }
> +
> +    /// Pin-initializer that initializes the list head.
> +    pub(crate) fn new() -> impl PinInit<Self> {
> +        // SAFETY: `INIT_LIST_HEAD` initializes `slot` to a valid empty =
list.
> +        unsafe {
> +            pin_init::pin_init_from_closure(move |slot: *mut Self| {

pin_init::ffi_init should be used for this.

> +                bindings::INIT_LIST_HEAD(slot.cast());
> +                Ok(())
> +            })
> +        }
> +    }
> +}
> +
> +// SAFETY: [`CListHead`] can be sent to any thread.
> +unsafe impl Send for CListHead {}
> +
> +// SAFETY: [`CListHead`] can be shared among threads as it is not modifi=
ed
> +// by non-Rust code per type invariants.
> +unsafe impl Sync for CListHead {}
> +
> +impl PartialEq for CListHead {

#[inline]

> +    fn eq(&self, other: &Self) -> bool {
> +        core::ptr::eq(self, other)
> +    }
> +}
> +
> +impl Eq for CListHead {}

