Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id ONfNDlBZhmnQMAQAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 22:12:48 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF4AD1035A5
	for <lists+dri-devel@lfdr.de>; Fri, 06 Feb 2026 22:12:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E715910E91C;
	Fri,  6 Feb 2026 21:12:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Rm+68+Jx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010033.outbound.protection.outlook.com [52.101.85.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7887810E916;
 Fri,  6 Feb 2026 21:12:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QkfX/8wBO3MdUOxASCZ+UOg6iGZvvAES4KKMDoms4Ruvgd0s2slM9xD7zMQhWPACDGZ7a6Iu09SLvAc2DPBwcK/bEg97Q1COX27pJwnBDGj18VN8qr+Z2vIEwwvnocIqDTXlkgxUNYKdWsb1ET295nSHgDUx3xib4srbEZnA81MJMD/9etlWfkGnQtaVeHOfgmuTh93HLCJUb122MQAYTAYadTGge8WjLhFSmMi/9FHR2P5GmndQKvfi2NofWaBgTHEmjwpdTxyzu6xCBUj80IQ/s5ij8XBhgvCxAhr1/x7nkRWHGzJ4rjc5vo3a+ZP30AGnflslEjHYZ6VgftZqXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ujeA55ZG2Ry674badwSEK/LcK1yko1CUdt+7iAYT+DM=;
 b=KYBfThVKS4whv+a7TK0bNv49tF9ydmtntY35GoIPXomfiCIPbxL8I5nj4vsow6BzNJKIfocb/hanD6Cci0wxR35bUK9x8w8eSxyrygApN+F6J8TICdibhayMCpsfKlveGDLSpDAMJUK22qdb1E2nePZdt+S0fcyNL3vw1+EW371zOp5H7EfMyYWz5PnnDjo4G5a9Xroiuo7YMpcWKzcfJBFCogF5QXY6aIXYlrxhk6cbbtqQwk6IcYw+FPm7JpoOIrkH4Kv/BOhpkQ0V/19/YIsLg+iWYKm+x9DkaMWHztNxoR28sgC+gnnE9QqiVY/Kmxqnc0P1uU3ctcnbbD8cqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ujeA55ZG2Ry674badwSEK/LcK1yko1CUdt+7iAYT+DM=;
 b=Rm+68+JxOKAl9tF/h1hmB0/ndYrE95iTJuff75G64/Cjpdqerv4mGT9Z2sMFGsD72l7EjbUFK0sk+zO7xBQ6iOAI+e61z24/Ah6BsRWIyqbD4WFhYMu3csgpyMNJepgPU9QkDLnm++2iVbTTyRp1Rmj0iIAhaNnXawXTiiv84T9C/fYaaljUkA6dtrxaXV2CMbZ+8vtpf42LctcbsOIP9iQTrfHNjNjBYu4JbzSSF0txnoiWhXBSgFM5aPhda82nopPLUwKwBPqpOYuPFMpXrB2Odo94Hx2R+4daX7ftSVBbbsFcuISOfEaiZumkat7F9KNJRw6D1Zqzq5jqvtiuBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 IA4PR12MB9787.namprd12.prod.outlook.com (2603:10b6:208:54d::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.12; Fri, 6 Feb 2026 21:12:35 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9587.013; Fri, 6 Feb 2026
 21:12:34 +0000
Message-ID: <30888418-5ee0-4a09-9eed-c6cdad2761a5@nvidia.com>
Date: Fri, 6 Feb 2026 16:12:30 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v7 1/2] rust: clist: Add support to interface with C
 linked lists
To: Gary Guo <gary@garyguo.net>, Daniel Almeida <daniel.almeida@collabora.com>
Cc: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Andrea Righi <arighi@nvidia.com>, Andy Ritger <aritger@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Balbir Singh <balbirs@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>, Elle Rhumsaa
 <elle@weathered-steel.dev>, joel@joelfernandes.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org,
 amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
References: <20260206004110.1914814-1-joelagnelf@nvidia.com>
 <20260206004110.1914814-2-joelagnelf@nvidia.com>
 <73B64D35-6574-4776-962D-865465C40226@collabora.com>
 <8dde5b79-29d6-4840-be9a-31bc4af27cf9@nvidia.com>
 <DG86CJXCM7DB.1A4F4JTMSS9ZZ@garyguo.net>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DG86CJXCM7DB.1A4F4JTMSS9ZZ@garyguo.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN0PR05CA0007.namprd05.prod.outlook.com
 (2603:10b6:208:52c::9) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|IA4PR12MB9787:EE_
X-MS-Office365-Filtering-Correlation-Id: b5aeba5d-46cc-43da-2fb2-08de65c472a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Nmx0eVN5Y1pQaG1xcTVUcVl0UCszNWIwWTFwR2RuTTNKaWg4bGlHMk5iSlZw?=
 =?utf-8?B?TTJ6dXdBRURUZDl1eWpFZFFjR3RJNk9Wd204K1AzR1dyanZnaUJEVVFzb1JL?=
 =?utf-8?B?Umx6ays5OTBLb0pJcm5YODRod1BneFplOFI0ME9lYi9DWGFUTUwzakhxL2E0?=
 =?utf-8?B?VFE2NGt5VEU5VUl5WlVod0w4bXFIcXdoWDgxendtQUlSc3BTUUhTSXBzOVRn?=
 =?utf-8?B?VXFzR1A1UE4zRmFQeEhLY1p0OGhqTW9OU0pPUWk4TGpFbURzT1ZiL0xkdHMz?=
 =?utf-8?B?dFQ0ejd1UlluMXlvRmRUUjlLZmxUUW9rc0xldWxZNkswL0hBL3BySWw3YXN4?=
 =?utf-8?B?b29ZQ0tzMWY5ZzRyLytYKzRlQjVtMVVuODhKNjMzQXFCZUFYbU5IeE1PWDg4?=
 =?utf-8?B?Z0pycVFRamdjalRPYlNTK09nQnRvbmRuWjhDZnMzQXZ6QW5TMS9EUnFXdEd6?=
 =?utf-8?B?UGxvaGNTeitzVk5UKzErdE9ERmwzY1pPSFhVR0hFWU1hM3ZwbUlyMzVrZWIy?=
 =?utf-8?B?aFZNcE51MmxjZC95TTdOeG4vMTh6ZWxlMXhIVVZOSmtzOHZGVG9LQ3dMbzJ4?=
 =?utf-8?B?QmVwdVI4eFdtL1N6SXFsKzdtSlQraHg5NUJjR2pkQWJRaWhZbytmTURRL3hK?=
 =?utf-8?B?K21nUlBoTlFhbHV4TW1CNlNHY1pMYkF5T3RHQkYreEVkN0pSZzN2aDIwWFJw?=
 =?utf-8?B?Y3hZV3BDMjUrRFAxMWl5eFg2YU9QamtKOGpldjEwdHRwQ2padTJUZFNmbWd2?=
 =?utf-8?B?RW9EMTRvM0RMVmYweHZSYmRXUFV0VEsvU0ZJeS94TnBoa2xDN0J5SiszeUdo?=
 =?utf-8?B?eHJSTFFMcnFvR3VsTkZ3c290SS9NRFVNQ09CUWFyR3dBUXJzUTFsdC9weEk2?=
 =?utf-8?B?TDA1SjRYZ3JzS2RVUHpjQUhrTWxSRU81eTNhYmFEdW5PZXp4WHZoNFdUN3E3?=
 =?utf-8?B?cEp3NVo2RS9yOHZaTGF2djZ2YlVRMlJDTGJYTG1aOVhaTDNBZVZTdXJQckJz?=
 =?utf-8?B?UHZRSW5PeWRITzY2cW9YZjBSUlRtaEdzbDFiWFpZNDBQTG8wR1QvVVFrNC9F?=
 =?utf-8?B?UVpaM0hZNzVkakk5U2hDRVJTYWZBVThXL095ZEZ0R3FFMFlNc2sxMFZ2VHFk?=
 =?utf-8?B?OHI0Z1l5WFN0TUx0NlkrYzhYZGhWY05XU1Y2VXhncnpLSmdFamJZTEVzSHFn?=
 =?utf-8?B?Y0xHQm1xR2VQRyt5SjdNaENEVUpaQkxZVlY4MkZEaW5ZSkhuM2YvbWt1MURP?=
 =?utf-8?B?SDJ1UFd3Y1NJSE5UMzVRSE1jV0UxNnVGRk5rWjZQOWZFTXRRQlhldFd2V0pQ?=
 =?utf-8?B?dC9BQVdocHdtcXRGWk9sM2lCK2psaXlwSktjQ0NjSmNGT3EyTkhqZVptTWZs?=
 =?utf-8?B?cUQ0TTlhL011RHNJVWlFTUEyTzJkN3Q5ek4zNTFxR1ZxSFZabEc3QW9zL1ZT?=
 =?utf-8?B?SlkrVlUzdnRFZTR0ekE2UzFudytXWFFxK0s3ZkVqWlV1MjBuMWFpemxScTl2?=
 =?utf-8?B?NUlBUzJGWmpVbWp0Si9uSDZGTlBaOVlCMHBrRE85b1NUVXZsUVdFaHZqS2Fi?=
 =?utf-8?B?dWx6amNJb0p2TitOZWc4aEs3MUoza0VKVVBSR215alpRUU5jOEpqc01ocmZL?=
 =?utf-8?B?ZVVXQlJicUhMSFBmUXp5cE1jdUdvWEtDOGh1Z2lxVk04cEMwUHF2SUVsVVdp?=
 =?utf-8?B?V0dqdWl5b05POW4rT3d0RWpDYUNIZHoxOGcvNVhOM0hhZmRJVXZPZEtuVTdw?=
 =?utf-8?B?Y0Z0VnliQmVSVmMxbTVoQUFCQktsSkpYK1lvUHRMME56b2tYK01DK3RtZ09T?=
 =?utf-8?B?cXczTy9jdERTN05BNm14SVJOQWY2bnY1Nm9EUnorUlB1TThNR3laUzkxN0xM?=
 =?utf-8?B?YmJOeEtTdnYvSVQwaE5lOFV4Ky9XQXg1QUpRMkJJREtCZVFhNUN6RW5EZENJ?=
 =?utf-8?B?REh6NDV0ZXErTEJyakZnM0pLdWhaSW51Q01wSlNIcUR6OERVaEdaWm5uM0Zi?=
 =?utf-8?B?VXVCWCtpMzEzam5nUmhQMWVjOHgwUWFHTFFrMmFZaTRnTldHaytEMTlBcTcw?=
 =?utf-8?B?cFprZlpPYU5hbUMyNHBBdXBTNUY0QnZjdVVLMEQzc2pTOGFUblhpSG5yK256?=
 =?utf-8?Q?tVwQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dmFzU3JQemRLM2l5VVZvaUZDdWN1QVJqRXlwUS81WlQ3VkVvc0lUK3ZIcmRn?=
 =?utf-8?B?bnIyU29FY0drN0psbkNrR2tzRDBRWTNNd2cyeERBY3lveFZRWFIvUFQ1a014?=
 =?utf-8?B?NEJYS2xsZ2JmZ0RPNG4yWGxZbWlIdUVjY2lOWE4yYVpzQlRvOXFCL1Q4QTNj?=
 =?utf-8?B?TzlNWS82YmpISnN2WkJkOENIWEtCb0duSEJnM0tFNVZiN1hRbHlSMFY2RE9R?=
 =?utf-8?B?TVBWRDh2aFk2TXZXTStaWm13SjBoUStkZ3JFZDJzeDEzdDJpYWZwa0Q1N3FX?=
 =?utf-8?B?QWRCZGVNNDF6OVcxbGNIaDZraldqUm1DcFBDWDVWUzBlMFRRV3pXS1FpSUVx?=
 =?utf-8?B?WG92OTltb2JNMElqcS9ucUE2aUlWajU1V0N2SmduZnNhbFhBN25BQ0hqb2xr?=
 =?utf-8?B?dnplaXhmQzRrMERrS1hFQzFmUXMxZ2ZFcmRPendvZFZoUWdFM1p3ZXhnVFRS?=
 =?utf-8?B?VVJNNTcwWnU5SWpCUGp6RzFuR0lSakJjSUkySVZQMktKUHRuZDRsYllXL01X?=
 =?utf-8?B?dERyN0V2dEU4eXN4RDVpbVRmeW1CdWs2L29JUjNyclhMVDlnaC9uQTVEK3E5?=
 =?utf-8?B?UExxQmMzOWdFUmJkVVEvamR1VHlYQ2d3RER6NExvWTluRDM1WVBId0lLbTFQ?=
 =?utf-8?B?c3lxNHdIRkZKdExVNDlKbkVKQ0JWOGhvc3ZmU1RveFNFM3FIdmthajk0MU5u?=
 =?utf-8?B?VWN1cE1yN3dxM3c3bFBRdFpPYndVNTFQV2ovakZlT2o4Y2c1dEdrQnlCbmxE?=
 =?utf-8?B?VWVqMnUvZ2tsNmZQUm9KMVpuamMyalEwQkZTaGc0cTZXa0p2VGk5RXk1a0Y2?=
 =?utf-8?B?TkR0dVpoaHcrdjMzRzBkU2pGbWlhZ0VOeVVzejBlZWlzdlVVdFZlMUNpQkE5?=
 =?utf-8?B?TnFBMlV2Rm9ndFhuK09XRlJuOUNHTDBER3VyYkxPdkNkNlMrT0Y2ZTNYK3hI?=
 =?utf-8?B?NVV5ZnJJQlpNWDdtandLWnVvbFY5ZU1oL3EzVzA3dFFONmQwU1Q3NDdqcVRW?=
 =?utf-8?B?bUZUMG9yM3NNS3R3TTQzdGg2cmoreE5tRjlpdTd0U0NXWkxtOVVWNStoeklN?=
 =?utf-8?B?MW1hRUN0NkhjMi82ejhNQnpKU0E0blZmQktneHlXSXNDWWVvakxvL0xMY2Vx?=
 =?utf-8?B?M3A4dmhqQlZoVU9JRksxVWVMMHZLcjlKNWZiWGxUaDRTZFVzQUdWV05iakEy?=
 =?utf-8?B?dmFRd2ZoRytyazEwNjdIaTRkaHRqa3RtK1FEaEt6WVh2OHpmek1lZC9nMDRx?=
 =?utf-8?B?bUp0T253VVl1c2NIa2hCNmdTOTA0SjhmTGxLMVlnaFp3c3ZJajN5aDhDYzFp?=
 =?utf-8?B?QTlsQnFlaU1FajB3NTlDVTJDU1dSVm5tWksvL0VNNUw5ZlVNMTFSWnZuWWlw?=
 =?utf-8?B?TnJCTks1K1ZzaXRxdWlmSVpCWHJCeXlTMzNlNk9ySUxCbytuODhmdnZESHRJ?=
 =?utf-8?B?c0ZHN0N5TEFaWUVUQzRaSnRWMmlwc0x6bXRZQTc4UHVEYTNuYUdaU0kzNlhv?=
 =?utf-8?B?bHJaSUI1N0hXdEtITmJwSXVBTGlld09WeVpFNlpYMkFXdDVBdUR6b1pRVm5m?=
 =?utf-8?B?cUdsbm5vSGhHTWdqSGp3OW1OZXR2VXVUdnZhaVo4YmVSUHFlbmttUWM2cy9r?=
 =?utf-8?B?VlpiNHhjSjFUS1hWRXA4cWMyNEo3NWFTNXloMlY2dE82d1g1TVlnKzZlVzlQ?=
 =?utf-8?B?aVMwaHNvNURUZGJIRmJ3NjIvNjNOb3hDN2ZBc2ZIb0Jjd1hnclA4UG5HazJK?=
 =?utf-8?B?bUxCRE1nTHM2TWpEanNtN1pqU25TSWV5VGxpbFpmMFpMS3ZxL3pCSUNNOWxu?=
 =?utf-8?B?Y3VkWWRHMm9DOHVGNlhGa3g1MlgycjBHV1lWNnQ2a2pxYS9DeWx0SjJPUjM4?=
 =?utf-8?B?YkRPVjBabm5zcnA4aENvbEwxZ080dWVsVDRzc0o1UnY0QTZ3dUJGVkxMRGdI?=
 =?utf-8?B?Z3lJNFBGOG83NURBTHRoSWlYamFKMG03Wkg5OTdYWDJXWTU0cjR5YUt0RE1i?=
 =?utf-8?B?REZML0N3cHFOZS8yMmlzRzR3V1pac2ZUQnpyUmZpNzRkQ1FSdzAzVmxPODE5?=
 =?utf-8?B?REpFamx4amtRNzMyRjcrcm00Mk8xeWQ3aHA3VnpGbXdEZmc4bkFxajRJOEV6?=
 =?utf-8?B?ME1MTC9qK3V1aWR4ZzRIWHl5aU1NQzlOcmFqL1RMMHQ2V3RtSU9kZ3h5OFdw?=
 =?utf-8?B?SjJLa045TEV2MlhQTThoTWQwdjBoV0RueStZM0g4V2lVeUl4alZsQlRTelB5?=
 =?utf-8?B?ZDhDVWtIcU9MQWZ4ZVhjWUxsZUZYRk1HNkpjRDdmelJiZ0FWOHdrMGFTSVZs?=
 =?utf-8?B?MHlZRE9oTXc5ZTZoYjhmZ2NIVVNjaDhqeWN2NlFpTXJOWXljV080QT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b5aeba5d-46cc-43da-2fb2-08de65c472a2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Feb 2026 21:12:34.6614 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vKmHS6Qjx/388MAGH4OaCqQTCDYKdAx5JUwxA1YagD78oaiu9ALuxWz9ysX3F5eByswvrr+An3erIYId1XEUGQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR12MB9787
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,joelfernandes.org,lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[dri-devel];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid,Nvidia.com:dkim]
X-Rspamd-Queue-Id: CF4AD1035A5
X-Rspamd-Action: no action



On 2/6/2026 3:51 PM, Gary Guo wrote:
> On Fri Feb 6, 2026 at 8:46 PM GMT, Joel Fernandes wrote:
>> On 2/6/2026 12:49 PM, Daniel Almeida wrote:
>>>> +#[repr(transparent)]
>>>> +pub(crate) struct CList<T, const OFFSET: usize>(CListHead, PhantomData<T>);
>>>> +
>>>> +impl<T, const OFFSET: usize> CList<T, OFFSET> {
>>>> +    /// Create a typed [`CList`] reference from a raw sentinel `list_head` pointer.
>>>> +    ///
>>>> +    /// # Safety
>>>> +    ///
>>>> +    /// - `ptr` must be a valid pointer to an allocated and initialized `list_head` structure
>>>> +    ///   representing a list sentinel.
>>>> +    /// - `ptr` must remain valid and unmodified for the lifetime `'a`.
>>>> +    /// - The list must contain items where the `list_head` field is at byte offset `OFFSET`.
>>>> +    /// - `T` must be `#[repr(transparent)]` over the C struct.
>>>> +    #[inline]
>>>> +    pub(crate) unsafe fn from_raw<'a>(ptr: *mut bindings::list_head) -> &'a Self {
>>>> +        // SAFETY:
>>>> +        // - [`CList`] has same layout as [`CListHead`] due to repr(transparent).
>>>> +        // - Caller guarantees `ptr` is a valid, sentinel `list_head` object.
>>>> +        unsafe { &*ptr.cast() }
>>>> +    }
>>>> +
>>>> +    /// Check if the list is empty.
>>>> +    #[inline]
>>>> +    #[expect(dead_code)]
>>>> +    pub(crate) fn is_empty(&self) -> bool {
>>>
>>> Why can’t this be pub?
>>
>> I believe this was suggested by Gary. See the other thread where we are
>> discussing it (with Gary and Danilo) and let us discuss there.
> 
> I suggested the module to be `pub(crate)`. For the individual item it is not
> necessary if the module itself already have limited visibility.
> 
Sure, I can change it to module-level pub then, and drop the pub(crate) if
everyone agrees.

--
Joel Fernandes

