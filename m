Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8DerDlPUl2mi9AIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 04:26:11 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F87A1645E4
	for <lists+dri-devel@lfdr.de>; Fri, 20 Feb 2026 04:26:10 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27BF310E186;
	Fri, 20 Feb 2026 03:26:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BZUZmVh3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011033.outbound.protection.outlook.com
 [40.93.194.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2C8810E186;
 Fri, 20 Feb 2026 03:26:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ha5u77YNaE7wrrzvJYDpkINeMYoe58R7krTvFkbgv01FwODl1O3dX2hIyO8j1WflzpxDkozVd6cj5mCWbdi51+Qy6Xkp45da2H9SdaT7K4tswMD58RH2Tr64FHJGj5LMhvmLv1ReHNEcuiPY833gwLa4EN8Jm2hFNdw3DqF84X2gRSEkOuW68JPIQ9jUaNZ8p1EUrvNOtmiZpIprMBQYgihMYimoaO49whri1GQNk4tZPxAGTeN/7LeIYHr3IkiDpCrRscXlqujxQtF+WwQwB7K6Of6BN5db5asiznvayLt8CFzUBZlcIVVn42RTn9kLMJYclbt9DFUofZFjYQkS5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cCWc9HamYXViX/dSkAj4lzbMEIYIIMN4TgYf7zbB5T4=;
 b=HRJn5jAUxM+4gt0KV7nWZeGaE2hNu/yO5JszyyQCfEYYvn3UqxgA178Fmz5IasrHeKYXxLCfF98afx7zrX9rqXhhnDMPv5zqbJmjUubntIyuXRqy+77vhrStVmCi+8Bo2val7ajanGuQ7lxmfbRjftSFAqpdjYPE4F/2UpU3xzOUK6yR+Blz4gTIOx+k3j6gBeAYp7pHVJk6si8LHC4yeWDXrfJa4u1P4Zb6k0IkVQHFJs42QEzRnd6y71mIZ//oGBovE1AV7kKmeVMFWSfplgZPS1SX7Bw6kkF2A/ONhMuerk21TiO89lXtdwSXfmZg9MUMRiBqD13P3Bjs/dQGuA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cCWc9HamYXViX/dSkAj4lzbMEIYIIMN4TgYf7zbB5T4=;
 b=BZUZmVh3x6P+ABi7BzrjDX2kgCAp9fFU6QDwvZvaqtn4YHZuC0mOKstgwzfI+n75HCl8BmyFmDmaDy3gSqkkqGFE53/hgw/TGpplmSMxDVSmZcOxm1J0VRBFtL5oH48hyqFl/RfnT8amZ/uPuZiQfDDD9RursayK+ZfbfqL4m2Q5aRL2Lsn4DApwPMwC7v+6UJBExM6vvNLr4uZjSdA2Z+tUGSFj30/ujt9zmCzZfQWpUj+GWdhnv0NwT97CHxAKE7X3fRqnmPjk/ZxNIAIw5BfcdS0k7ZEe3m6GKE4LZV2DfbHwPWr9CDtnv1ll/v1gvYDpFPF4gWLdDerWf6OKmQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB5619.namprd12.prod.outlook.com (2603:10b6:510:136::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.14; Fri, 20 Feb
 2026 03:25:59 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%3]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 03:25:59 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 20 Feb 2026 12:25:55 +0900
Message-Id: <DGJGVTN5H1L7.2IJTSNK4BINNQ@nvidia.com>
Cc: <linux-kernel@vger.kernel.org>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Simona Vetter" <simona@ffwll.ch>, "Jonathan Corbet" <corbet@lwn.net>,
 "Alex Deucher" <alexander.deucher@amd.com>,
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
 "Alistair Popple" <apopple@nvidia.com>, "Andrea Righi" <arighi@nvidia.com>,
 "Zhi Wang" <zhiw@nvidia.com>, "Philipp Stanner" <phasta@kernel.org>, "Elle
 Rhumsaa" <elle@weathered-steel.dev>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Eliot Courtney" <ecourtney@nvidia.com>,
 <joel@joelfernandes.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>,
 <linux-doc@vger.kernel.org>, <amd-gfx@lists.freedesktop.org>,
 <intel-gfx@lists.freedesktop.org>, <intel-xe@lists.freedesktop.org>,
 <linux-fbdev@vger.kernel.org>
Subject: Re: [PATCH v7 00/23] nova-core: Add memory management support
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>
References: <DGJ1G3D32OMK.30HANB1W46XVL@nvidia.com>
 <20260219194838.GA1013545@joelbox2>
In-Reply-To: <20260219194838.GA1013545@joelbox2>
X-ClientProxiedBy: TYWP286CA0032.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262::16) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB5619:EE_
X-MS-Office365-Filtering-Correlation-Id: 2348485e-395f-457f-a4f7-08de702fc446
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dG9YWXg1T1k5N1JiWEQ4eUZPTVZBUkpJdmRNTndLUXhoUGZxdVZ5ZVh2a2VG?=
 =?utf-8?B?UTEvdEhZRlJEYzlIRmhWRUhySU9PSkVBL0VBcTVNUzVZTkZsVUwwRGR5VGxi?=
 =?utf-8?B?NmV2b3pOQU90ZjRUNVIyY0xNRVcxQ0JuaUQ3REZ0d2JkWGYrZnlVUjJROFRM?=
 =?utf-8?B?UElHZGhZSmRQcFExNklob0djbWpLZEE2SUw2NkFhT2xiSU9oR3BpYUpndWFH?=
 =?utf-8?B?YXRwWDNvNVF4eDFMQ2dieDVBc0kzVHZLaXhieXI1UWdKcDNJTXdxdXNnTWtV?=
 =?utf-8?B?Z09WRWtWOFdyMFcwcnI0clRxUFNtSEFQSnhYdGlja3NXdEtHK2drbjN3ZnBj?=
 =?utf-8?B?dnpoYWo3VS9TMG1DMnJDMmY0cTNWK2haTzJITGNLdG5LTmZCTldORkU5anNT?=
 =?utf-8?B?YmtQTFhMUS9NbE9JYlkreVZIOC9JVHlUemllU2M5UVc3UlF2WGFNN2hnbzNV?=
 =?utf-8?B?WnlOSllFTCtaSVZRSnpmTTRONUowWTdseVA2YnpLZWt4bnVFbll2K0dMV2RR?=
 =?utf-8?B?WTFlbUROTFJHTTdzQW8veGlmblFRV2NnVit2RzVSNnpHQnhESllCSjdQQnZ6?=
 =?utf-8?B?TFpEWWJ3amdqZGpza01zOUYvbTYwVmVHVFQrNlJaTTN0aGxHVkJNZTMzVG9M?=
 =?utf-8?B?Tk41bTh5ZW5EZ2MrR3hRSVNUN3JiU2pLaC9ITUV5dGRPbU1kYTIxbEhrdjVk?=
 =?utf-8?B?eHhpRmhaQ1AveXl5RDFQMm9DS0doZmF1TG0rbkZTN1RXVHFoK0RWQkNDRlZB?=
 =?utf-8?B?RHZxVFgyQ2oyMXNGR05KMmFyeXpEeTRHeE84MjZJcnlaSitsaXRoR1E1c0Mw?=
 =?utf-8?B?MUNwSnpEZmVwOFRkUXBHT1A0Ky96QjM2U2lPNjRJWHZJdU1XMmVIdnZITmE4?=
 =?utf-8?B?UkVhVjQxMmVmN1JOUWZMeVdURkZoNXdZV3hsSmhtVll3N2ZpTVJFSWJQclBo?=
 =?utf-8?B?Zm16VDdLME9RMGt0akY5YzhKSjk3cDFFSmg1NDQzYm4rb09ydGY5YTBXblB6?=
 =?utf-8?B?cVUyR1IxTVI1aS8vU2xNb2FTYWFVakZFYTczZUlyZkViRmpMNTREcGhjdExl?=
 =?utf-8?B?OVdreGNuZVF0ekgySlRqSHUxWU9YYW5Yak9weHF6K3UyZU1EU3E1UW90WWdj?=
 =?utf-8?B?RFg1Wm05L2pLTDRMV2VZZ0Z0MlRxTDAzTmIxazF5dm1kb0lzczQxNlhFaElZ?=
 =?utf-8?B?eTlCZ21EcUgrdndka1pnOVJXUlJPWkY1bVlPU0RLaHE1YkY2V2tGV0tQV2Ix?=
 =?utf-8?B?ZFprdWtLSmJNcDdSbVNFYjNaSEtkSXc4VVUwbjhGNVQwb3cyV0h6KzdEeDMw?=
 =?utf-8?B?MjFpZ1BLQTRzTzZXbkxXRXJjUkFvNHkrcVY5WlNENWNNYVZpd1lDZ1lxZ0dM?=
 =?utf-8?B?ZjFoSDlkbDB0M3dUM3pHdTlobktQcnArVGNNSUdOZXUwaGNPcmdZQ09WQ2dP?=
 =?utf-8?B?a2RZcitwVTVQSHkrb1Vja3hOeFFJcDN6NUE3aXRpUEFrbzk5cFBRWEZVZnN3?=
 =?utf-8?B?THpGS3hBbi94bHJSTHpXQ0JzK0ZEbHZwSGJQdDB6b3VpN3JCb2FaNFFIUGNu?=
 =?utf-8?B?N2JLYksydHNpbkJnL0t4ZWNPeEY1VmR1ZTFJd0poYUpMek5EVU02aUQwZ0R4?=
 =?utf-8?B?M2N0UHNzMWltWTVWaHI3akJ3YnVyRmowcFVSM2p1RFB0OUxyc3BpTUJDbFo1?=
 =?utf-8?B?V2NxUXJuZVJXWHdWNXBPSWpCdVFnQi9NYTJzYk91alFyNU9ZOUdYVGg5VHY5?=
 =?utf-8?B?azBnVUNGYVhsN1Vyci9uOVQvVjhFL2IzUUhhbVNpWGNSb0t2MWFyZEVJRmdh?=
 =?utf-8?B?UWhmSlByMjZqZGpJSUhNN3cvcDV3YWhWcEpYZE9vMDhEdzZza0d3dEF4U2d0?=
 =?utf-8?B?SzZWZmNkRmRza2lGSTRFR1UzanZ6Q3M0RVJlMlMvS0VuZHJBWVRyMlJtUjhk?=
 =?utf-8?B?R0Jjbi8wcElLbm9BOUIwYWdNVUJ5WFlTWEIxc2dyZ0huSVdkbTlqQ09DMkcy?=
 =?utf-8?B?elZERGR4UE8xRm4rTHE5QkFvUE1KTUREVVl5YnZOVmJhNlpOVEtrQ3lKL09t?=
 =?utf-8?B?K0pTZ0ZJMGh2alAvOWhlejg4RzRYZWFWNmJsazZpcko1UWtaMFVSWDJVV1hv?=
 =?utf-8?Q?MQ3M=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkQxMDVxVEU5eGNyc20vZUxWU09scFNUUHFWRkFVc01YRmk4WkwrLzBHcFdP?=
 =?utf-8?B?VlZpQmVWVWtqYm01Tmx2RVJNL1UyZGdYVWlRN3hUdXB6SjhudmZNRHBMcVFQ?=
 =?utf-8?B?NCtjT01QZWNPSnlIVVFuRkVoNGo1V01NdnN3NlhKQ0k4ZjV1Uy9kT3NWQ1VE?=
 =?utf-8?B?ZHh5d2hFaHNQbGw2Skwra1hvL1ZySkFqaE9MMTdLYWJRNnErMjVZUkVrQzFM?=
 =?utf-8?B?UUR5M2JBSkk5YkErZkIrUWVtNXhOei9lTjJvL2xrRjBreFpUVmZmd2NpVDho?=
 =?utf-8?B?TXh5NDF0bGdmVFRieWtudWVtR2xOOFJ6VW8zc1hMbmZWMWFuZzlJM3N5V3V3?=
 =?utf-8?B?bGRpb3R6NHZQbGZXa2FMTldWUGREOVlyWUVJMjFDZUVEcytYKzAybHdOTFRQ?=
 =?utf-8?B?dHNPRnpuMG5jZVRnTTFWS1VuTDFFcE1YY2lXaEE5UnNzMmV6MTk2THN6eC9Z?=
 =?utf-8?B?a2p2MEMvRWZEMkd3dmFETkF4dGlWdDNkN1J4MWpqWWdGYk1heE9rS1ZwSzJW?=
 =?utf-8?B?SmNjMlBNYUtWa0VrLzBvcWU5QzltejFIdUhHazd0bHJoUVFkV3JvcndOVHNx?=
 =?utf-8?B?YjlVRXM3WW1EREZWb2EwdHl3aS91UlRYMkVUc01FYUJMekFvQXpER0RFaTA4?=
 =?utf-8?B?cFZmSHBtcmhjRGVUbFBRN2xncG15bEhlNnY5WUVJbTN2MHM1QkhTRHEzSThz?=
 =?utf-8?B?Z3lWeFhvNGJkM21tUzN3UFlDMzBtQ0p1OXBmMjFCbHpMbHpoRE9LR0l2OXdU?=
 =?utf-8?B?RThDeHArYXBpSVBlNXhDU2NDL2F0NFQ2elMrU3d6eUQzN2RvQ0xYdjV2NGoy?=
 =?utf-8?B?Z1dFYVNyQzRHQ29xZlhJMCtEOGZYcGlPVW96Y3J6d3pES2g3dHpZUUJGR2R5?=
 =?utf-8?B?YmVyeENUelo5WFM0TE1XT3dwL0pGaGlBVE4vU24zbCtzcjNiQW1nd2laSXpM?=
 =?utf-8?B?emRrVkM4TEUwVWhmUW1DK1hIaFdyYVRHbmJyT2FhMExvVmNuNFQxOVhRRUNB?=
 =?utf-8?B?QlB0Nnc1NkQ1Tm5Uc1VCR1FpNGhRdVV0aU5ZazlFVEpCVCtObVljMHBNWVpo?=
 =?utf-8?B?N0ZBalBWdnNhQmVEaHRYNVBRbElhTlNuWlc1N0t1WktQbG1hSmllMlkyeFNh?=
 =?utf-8?B?YVgzZ3dpRStlYUpvYlk3eTdQek5RR2hpSFp5RXBGNzhPN0RHTnVDWG8ySGxM?=
 =?utf-8?B?djIwaWYvT0N6ei9pRFpIVms4bTZTV250Mk1aZFhqR0JsNnhrT1RuOStkeC9k?=
 =?utf-8?B?MlFldXNWUlVteEFzaXRlc1VmdmpPV1p0bkc2NDc4RjhzT0RvbmJDd0tOeEkx?=
 =?utf-8?B?d2NwS1ZEWTRCeklNekwyUUZMcGg2SXBQMDI2OGF4RmFmQVNQVmRSUzc4dE9s?=
 =?utf-8?B?WVpyc0c2SXZMRzYvYVV3M29vMmhHai9wVEk4aTE3Q0Z2TTNQcDcvd1BZN01k?=
 =?utf-8?B?d2pjRlhaVVVGRXFnRGUzSlFPdVBrZEZCZjZVV0ZiQ3VDM1gyeDU0VXdIeGFm?=
 =?utf-8?B?akVpd0NpRjU1cEVFUWhWRHlDS0hvV2VYVVVFL0poYkRjUmNUZmpnMk5QZWZP?=
 =?utf-8?B?N3c5SmJVSVZ6WTdBRk53YUJnVWQvOWM4Qy9sWEJ0bEVwMmkySnFsQnpyYnR6?=
 =?utf-8?B?Z3JzdFVlSEx3eEZ2ak43UXBnNXVFZ0hvY0kxT2VNREVOc3JGejc3UFc5c3JW?=
 =?utf-8?B?OUUvUEZHQzRCeW5PNDRwOG53L050WXFSNnlBaFJsYlAyQmVZV3RnUXBidDYy?=
 =?utf-8?B?OE9TQjFyRkFaMDVOTnhwUm5WTmRNZ3lSUDcvRng0RFhJKzVCdGpmdWhRUmt1?=
 =?utf-8?B?YjV2KzFBRnYyUyt2Mks3RGk5Wi9nM1R2WnRFK2tFMGRBVlBjTEhGUmZ5V3Er?=
 =?utf-8?B?U09JWlk3LzdOWUQ5Q0xNTzVSYUU2QkNONkczYjVwcGs4RlRKYlhlNVU4aktr?=
 =?utf-8?B?Y2xScGNyR0F5eGxQTk1VN3paTjl6YnVtWitvRnMrY29EVk1SdFJoWGlSTVRr?=
 =?utf-8?B?aTdaSkFOZjd4Y0QwTG5wVnY5SjlZZ1BqVkI5cHo3SHhqVlZpUmw2WnFkYmlP?=
 =?utf-8?B?d2h3cTFVc2w3OHRUZzY1MW9FRDhUcldCRFlHdndINXVWQVNta3dJWktWOW9w?=
 =?utf-8?B?ZkRmN2l5NTFYTDU5azlXOHBIMFIvdW8ySVh4bk5pMlhlOHRoeVJ6SkZxMkNk?=
 =?utf-8?B?VGxLMFQ5aTcvQXUyQnJaVGVINDJTaVIwa2FxblpuVzdKQnROck52T1hDQ1FD?=
 =?utf-8?B?SkNRUy9ITkpIakFHelljZDMxZVNtN0FiN3RhUGowV3FOU05LZDNmL3lCUGJt?=
 =?utf-8?B?a0hhT3NpNlJnRE1DcU4yNlErcnljMkdVYXI5Ti9sVUVaekpYMklWVVhEejFH?=
 =?utf-8?Q?Txy1JTQuHr/aQtQoN5TQyH7v6wTsFgQcl8tbA7LP2cbJu?=
X-MS-Exchange-AntiSpam-MessageData-1: n+0+5mepwY6WBQ==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2348485e-395f-457f-a4f7-08de702fc446
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 03:25:59.3746 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: p1FrK6q49faN6aRQQCTms6pzcomrNymmwev3i/JE14emgq6P0kB8P8V2B53f/xaXc8BgXTYqDlhRQNc0259s2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5619
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
	RCPT_COUNT_TWELVE(0.00)[44];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,kernel.org,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,gmail.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[acourbot@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns,nvidia.com:mid]
X-Rspamd-Queue-Id: 8F87A1645E4
X-Rspamd-Action: no action

On Fri Feb 20, 2026 at 4:48 AM JST, Joel Fernandes wrote:
> Hi Alex,
>
> Thanks for taking the time to go through the series and for the effort
> of doing the reordering. Just to clarify, do you mean I should be
> sending each of the phases separately for review instead of in one
> series?

Sorry, forgot to reply to this. I think one series is fine now that
CList/buddy have been moved out, as it only spans one component
(nova-core) and forces us to keep the big picture in mind. The
reordering is just to enable a more granular review process and identify
the moving pieces more clearly.
