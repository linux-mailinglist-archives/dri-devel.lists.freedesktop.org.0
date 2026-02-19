Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IGhwOX9glmkTegIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 01:59:43 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B18315B493
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 01:59:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1034310E645;
	Thu, 19 Feb 2026 00:59:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="oUaslmmx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012049.outbound.protection.outlook.com
 [40.107.200.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BB8210E213;
 Thu, 19 Feb 2026 00:59:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nAKihvoVkDmiFk+pn+FYeDDBXcRVuZTZFV7HVlbstLWeaDhGBmS7uSF9qUE9Z99ldAeW8bgvT429s0NU/5EOcaK9wbR+X/kT5Sk48YT5ojE3MLllLAV4EX/pZYJvx08odyFaaZ5Z2fjeppVv3iiX3zfYYgfiydAOqlKaqG9V3pJtpOn4JV4FR647IMFaeHacNVAtSb6xIHObKD9xq/NnXdxmpilmxTJ0LI1yLKFP+PjFdkssxZg7MmzrUvql5s/BNoRz7lj6FGVZPe8p0s5mO7yVgWaGo4k5EKZi69VOgRsMSFJiM7wBBXiocQ6F8VOciWSS/9EmfG20ZziTz4/DXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zJmh1j4MTGxOrnOZdTMN7jm8SKekQLLJR5RviScspao=;
 b=kCyE4TpbfHUgmu6V+w0YlDp1CdC5Glppswnn6DcbayJ6/Egyu8C3WKEoS3pP2kAUXy53yGYXQDYhLNA4rf54KR0o9VQWxDJ705lZVB5Lk40sYAFVbxdScSfrF5sA0f4lQHBOasbiC6IN5k0OrwoHgjpEtW+7xOHaBBYUoIZYeoXXPuBohuFqVdoJkpvMtN/6ZQnHbTERvEOOefnmUavgC6aqhJ/sr2k+cqLRt2lLyL3EjYpro1+RU0PSgKDeb2A76Kaz6SfqQalPWTAlVl8L5+ckgY9FPpoxlRNcHawWsJu5e0eY9PJjhMBsm157xQLVpBvNLVPSx4IU71n+Fv0voQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zJmh1j4MTGxOrnOZdTMN7jm8SKekQLLJR5RviScspao=;
 b=oUaslmmxi/kPLhjnAXfoujQqaitjqKlVmHwj5FsDIOxXokYrLULZX8cIYbgvMpaMRb06RRCEIcJt9b4gP18ZZHf/KXLT6p8NY7qSXqQAjrh7lMICYI0H4RyvvUqlU5kbvBhvjq3VJJGUTfjH4q0pTTY76V8PwxO05J4ww+pokqwvSrN9TFiqrDkwk97CAplLy5B3xXhXTk82jf0S0BaMlYQp1TiImjpadl4W5jLjEWBlU9h//N5vFNZBgzajtTVhnQK/4UOMKVemuj9cbVQXFdJ4tzAaI+WFiB0zoVFc+6tZbAR2ywCSjLaeWYizHP85YL+zg2WxeaOBUPl4K4QEsw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 DS0PR12MB7653.namprd12.prod.outlook.com (2603:10b6:8:13e::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9632.14; Thu, 19 Feb 2026 00:59:29 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 00:59:29 +0000
Date: Wed, 18 Feb 2026 19:59:27 -0500
From: Joel Fernandes <joelagnelf@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 Thomas =?iso-8859-1?Q?Hellstr=F6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Alistair Popple <apopple@nvidia.com>,
 Andrea Righi <arighi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>,
 Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH -next v9 1/3] rust: clist: Add support to interface with
 C linked lists
Message-ID: <1771462209.c70cb872032e4abe@nvidia.com>
References: <20260210233204.790524-1-joelagnelf@nvidia.com>
 <20260210233204.790524-2-joelagnelf@nvidia.com>
 <DGIIMT4F1GWA.12UFBEUAC80VW@nvidia.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DGIIMT4F1GWA.12UFBEUAC80VW@nvidia.com>
X-ClientProxiedBy: BLAPR03CA0172.namprd03.prod.outlook.com
 (2603:10b6:208:32f::12) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|DS0PR12MB7653:EE_
X-MS-Office365-Filtering-Correlation-Id: d4b09a72-cf29-4fcb-8792-08de6f5222c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?egGFtr2vYlL2Fu9n5TzSiRLVTE9sPmAGmnp80u5y0k0m8fR5dOsjInxcMk+E?=
 =?us-ascii?Q?xkZRzKlfe6Lph7BJfExNJ+/AQfxdG+jcVoZl189uTghTbqcgthjYGuDvLxJe?=
 =?us-ascii?Q?FBzffT4fM2jStk0yWznz0tm6S1AWzMihyxxIMRneOFuAozslyIs4IKaiiBTb?=
 =?us-ascii?Q?dW9qTbalum+dz/ANzaEJJBumvx5oxbFVu2yNIeEFpNoCtnZs4BEQjcgj6PKb?=
 =?us-ascii?Q?/kEHPaCcX8Uz4Kf57i1+pxEz/ozbjP0PwtkhJE+RZbHv/qv1BOsHoqYcL548?=
 =?us-ascii?Q?LHmMWpkk206d8O6E5imAobquZNkReZcN7sd+Fv9pw8KJcFbagdYF7qona1i7?=
 =?us-ascii?Q?GcrqKjp6ndNvledLKETcBNMX0d1BFQDRb0rpJSN2tERZsYHfW2ac0lcAN8Z8?=
 =?us-ascii?Q?4XVDAVhcVl/aLbKcFFBQfF2OK4WDbB2+oNTdwOfNXgJxfHamCsz1lnnFeArc?=
 =?us-ascii?Q?G3RkhRRgKnXNX0azjrxdxhnMSdtmNU5uSLBM8NNi4yFbY93RAq/G21qleXu6?=
 =?us-ascii?Q?/0E53hIn2sGL19eDJwTzWYjE1IXIDxVhCy3V0pEyKab/SZ01+WdXrP30fjJ3?=
 =?us-ascii?Q?KyxEXRseWNRPNtxwgS9GeLV2GXJpy406SwRjqAEn4WNG5tJrJ1mNWA3blW/7?=
 =?us-ascii?Q?wCU/oWEr0FHeqa2LO40jhFtfI/qUE00Ym8dhCrff/YKUp18gjGDemQpjwpt8?=
 =?us-ascii?Q?OzMZuZ58ZeyGN7PbUeQXWR90jlPrYjjpSfOd5/niwAw+u8dClZbptPQEe/g/?=
 =?us-ascii?Q?Eyr/Ph+VM2mLmB/GePPDtfMqWhTrVSXo+ZbJes1YFX5LZdM4YCvKe+lkGiKL?=
 =?us-ascii?Q?m5zpEsvM9NfCNO65EuOeGbGjt510f1h0KDfZwZRu4sjkGfRnyTcbf8NRhg30?=
 =?us-ascii?Q?XchLmOe2Lm7kPKVYkMczkHQuqjCNslwYQtXr55GWX4V5ceEi5R40wcqpBRE2?=
 =?us-ascii?Q?VziH6sy3tQ9hSzpqxVQ2LczfI8HmdN+1SknIfniIom4XnQomxU/ZjQtSW6eT?=
 =?us-ascii?Q?geTdg4+4P1tg/lfWXnY/042I9vUcAA0Ab3LHyzDxm2ft9tg+IpeEPKa/daLL?=
 =?us-ascii?Q?HL4Y5NmytqjiqR91ncUhmkD8j5OH5G6pvodBGKRA2auKBRAsaMgrqf9dSUmy?=
 =?us-ascii?Q?50giZjHtRSoY0ymGYCTuJXgN5WtKp+BR1OwYqDoWX1eZafQlvYVsnDBMIbQz?=
 =?us-ascii?Q?hhYPCrXK6pFs46dOjTcSf7rwm9/Kfen3hKnXgyn+YDKz2J124oHo2nUiJ1pI?=
 =?us-ascii?Q?NeIt7sPQ/oE4CJotDessosdnQUpXMGtGvgPnqQth3ZZSd7E3RG9NIRA6kRv6?=
 =?us-ascii?Q?AwuSMREGqPcwl7b1Kyie+Q64ONNEI2Lli5o5f+JXRnMuUMEQw3inudnfapnf?=
 =?us-ascii?Q?Z52h3Donzrs3+qGzMj09tu3hNFTlhekM66j422KZFkYC/8SoCBXGJO0olENp?=
 =?us-ascii?Q?X5IQdsfXpBngmdDscLwJhJ3atBtWdzGEtPCy855GrSvNOp2vO5tUpezpdLaM?=
 =?us-ascii?Q?EY4NBT1PEPvuiAxtNG8tjMHDdJhONuycyyAo/AouGfxKyH17imBzkQpIjo58?=
 =?us-ascii?Q?ALfwxr8wKTW06nDlBa0=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JOPE/mstImJ6TE2T7Kr3QN5R9Gkk5/iYy85q2VN8HpuZnpZ+aWLrgRuPLDuo?=
 =?us-ascii?Q?SIr27IoK3kzbbRUDIeHTVJwT+KaJqAsf0mo9fLjxkS2lV1RQy7DoLy0Fml9Y?=
 =?us-ascii?Q?/sTbX8bOUg1nulVHEgVB0oHcqPS5Vd8m5+LTkKJVB9ZjklvxU5wnRkxHyN9q?=
 =?us-ascii?Q?X1HpidR9bowv2+oyQ9Jx/1+rc56l0PqPdYzl3WzHMEXYBtnFLhS3B8BOs1Ba?=
 =?us-ascii?Q?cHtOkf3HU/g6NaLraOdTxMkt2Vo3WnX8O3QSkEEAdi/fVThSCPjMV8SeCC7Z?=
 =?us-ascii?Q?RcwyZuXUzONgTcW5VrHRvexXtg36U5S7WSG5uw4LdU/BC3cMEx8RlI2d3Zpt?=
 =?us-ascii?Q?CFPU8cLZD0AD6FkCmTfBXjdX/CrQeBQyIPVcokpH4ppucN+KtbGM4AwGy8uc?=
 =?us-ascii?Q?wJ5EF+aYLkvlHZevmt626NKMr2L2v/jF8PdRNVI2TYXZ/HR2zk5d3MNGwZVH?=
 =?us-ascii?Q?QP1GDnyjizzJdBlE3PEXjLoxflN/NAG/TdBT2x++yVwn3FYdQhemsKN0Rykr?=
 =?us-ascii?Q?7AFxuAG0suKgCCmEpj0q7jfxSYmxejBNdlM0HtkUWlkQDKWgmWlEwokCJfrf?=
 =?us-ascii?Q?iSgTgP5GVIaxfarcN47SrfelakGIWCCgk/+Oi0ndTwLgm2nCZvF3YemhHY4d?=
 =?us-ascii?Q?bVe+61LbJCE6u6di1XLODshx8P/JtqxxzhLY+Py0mrhyA9pKoDQu7lWP+50g?=
 =?us-ascii?Q?/7v7gHGAgEVFVToQ1YQJVk7ErBp4V3p5d9GXHliFCODeC62b16jwEYQosSFT?=
 =?us-ascii?Q?x00AJbkSlzQSW9woOe/T5XjUqeFdhrg7SmbrghbKzwsuxk/vyPPwb0hFnqiq?=
 =?us-ascii?Q?xV68zhU/hjXf4b6R3hvdJ9rhGwde+syhjp8V483VPC8fLJsT7nPXrlsB1f0m?=
 =?us-ascii?Q?UJPX8zOnrEVYsw5BB4u7mdJtKxRfJqe5v5fXpFm/UWc5eLTqj2o7KJrRRED6?=
 =?us-ascii?Q?XldCUnZJbzduTbao0XUVavrLcOYEBESKaxdr5Y8goiV2wWTFNNESHIPC6xgq?=
 =?us-ascii?Q?BQN/zzrfIfQ2iNGEsG6f1lSyQvOyxC4K+/fSija9nUf4lJkQDtuwXXbBdrU/?=
 =?us-ascii?Q?343sia15P4/FfE0l9huz8d3f4ApN7X8W4RveACHqyhBwhGidvo0xNOUOwj4x?=
 =?us-ascii?Q?xSLlLHKcppEHFlPWdR+/pMgQydSKTqKi2lKc20yW0/i+pa7fHCF23oqcsNnr?=
 =?us-ascii?Q?FiWDLJROMV1ePVIYnXjc/lYjt4eSHDljHLhvRCXVml7W4o2frV+eQbCZOFKy?=
 =?us-ascii?Q?DqTabNUukYyyF8nb9bpg+IGpWiEpXtgh4z6hG+4YpVSO+CdFyNjUbK7GKX1o?=
 =?us-ascii?Q?Wo4isInGgyzunhpeiA3pwiUDZobZtJ+WNff+11vF8g51x9UOb132UcZjnfMD?=
 =?us-ascii?Q?lW3Favh4CYdMw10VO15lapFZhtR5SizRL46Te9Bd4POJURemECiBcilGdLLa?=
 =?us-ascii?Q?Mw/xum4IdaxfnmAa4TQltBZxbiUzbc0+unNhh8t40/0lVYG7C3+TdJLEBuVJ?=
 =?us-ascii?Q?xvIkQuXSN6XXdrx9DvX73kLxrFwK+oJk9w6/L8cKrMppqWTKJtc4ZVBlYrFO?=
 =?us-ascii?Q?+Nd1UZ41es0OAn7YAwy6DzuhJayLi8lNtHkKKMKngVoDXkHIXDMErQDFB1ji?=
 =?us-ascii?Q?/as2TNcAfhCk3yVW88U18kpLST6o8BJWncEsFoMO6pVJpjFIlnJ6K2Ds+8W7?=
 =?us-ascii?Q?JjB0+tSBuRrlq4xx0Ok5YCpKusohPqSEIPxiaAx9v9Cd4JpzkF+YigExRw5j?=
 =?us-ascii?Q?EY3S0idgXw=3D=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d4b09a72-cf29-4fcb-8792-08de6f5222c0
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 00:59:29.5666 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8jQTZ+Amd2lBO/tnoch1gFpBbH0POELZ1O6UVa2FSMKFbdhpFcDVzid1YBDXYhN/Sgv/OzzhIMceVpwFytCFzw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7653
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[42];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,kernel.org,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,gmail.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid]
X-Rspamd-Queue-Id: 9B18315B493
X-Rspamd-Action: no action

On Thu, 19 Feb 2026 09:35:31 +0900, Alexandre Courbot wrote:

[...]

> I asked this a couple of times ([1], [2]) but got no reply, so let me
> try again. :) Given that `list_head` is doubly-linked, can we also
> implement `DoubleEndedIterator`?
> 
> This can be done in a follow-up patch but should be there eventually as
> C lists are often parsed in both directions.
> 
> [1] https://lore.kernel.org/all/DEGQCMSX1SGZ.2NQDPG5KUNA9D@nvidia.com/
> [2] https://lore.kernel.org/all/DEOLRLCZQMBG.1WHBR4YL8SKYR@nvidia.com/

There was a lot of redesign and you only mentioned it as an optional
suggestion and there several higher priority comments.

Anyway, I disagree. I don't think there's a use case for
DoubleEndedIterator at the moment -- none of the current users of clist need
reverse iteration. I'd prefer to keep the interface minimal and add it when
there's an actual need for it, rather than adding API surface that nobody
uses. If a usecase comes up, we can always trivially add it.

(will look at other comments in the morning, its night for me).

Thanks,

-- 
Joel Fernandes
