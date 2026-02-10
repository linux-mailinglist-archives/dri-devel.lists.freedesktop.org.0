Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uLvsNRGsi2lXYQAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 23:07:13 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A42711F9F8
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 23:07:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C832210E12F;
	Tue, 10 Feb 2026 22:07:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="E2UQQW0C";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012025.outbound.protection.outlook.com [52.101.53.25])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DC5810E101;
 Tue, 10 Feb 2026 22:07:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=x2auO9Hxi98dE2cbqbwyzzPmTwZInPH64dyFD0bAvotPVjhOc7VHbwu6xAxpmikFGCgeSnitMx/6MnQrGTS7Xu0B4selakT/O3xjkTcVRSrfrRivL5wX1qi+Yuo78biUtPtFZlsaLjOdOPEnnhUYvdGb4R+lIQfRAZj2vxCmR0F0UJ6jFVPFY4VQgUCNT/YTc+261fynu6swbnjt/iM6sSM04CTk+DOdGe8CMlTXqlAbB66/IW6TP5uQatJCFGPdVA0aD8yEn8eVrxSVS3U9KvwwJPG4FW0n0QLEKAKyuR5mxBwjsPRrP17uMLRPcGEh3vYSHeKyv31BKGtIakJfVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=X0p9wRx6f8e+s96niTG+ScxfDtd5ApIusmQIyx0B7XI=;
 b=WB3I2JMoZEmjZMjY+7sqUdssR2wjvN0+WD9OZmqwoQrNVmssAzyONtohl+OJs3/QO0GSpLMXk0a3xfNNSlDsb4h3DnQMJ/UHZ16/s9LfbQ+UZUKzv7hnHSqtR6YX/zrDKfW6h0+x1C14ogTRjqsTjqJ8X/cSY7QtJD4ar1J+phXUpeM0bwStXznj5Q1taUbwjm/4x8pz/Q0vsjhImmEEDlMcKwIBriW+5q98jMyohg0jxR8O9AtOk3KB7gqaJWSl0NDJU2v0c/XyatSAF6gAnCCECAQlVMCZm3CuPmr5HxEz0Ku9OpQrYX7j/CgNyjKeQuRcv1sVFXiIRlk4iQu7BQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=X0p9wRx6f8e+s96niTG+ScxfDtd5ApIusmQIyx0B7XI=;
 b=E2UQQW0C8nQzs++OAJ1p7il7k+X1Z1FVzGhQGK5O1n6hOYbIwMPBSPWcxQBvQ7nzT2/LWP9nql0WjRH5+fMxzcMBE6oHt50xahmVbcVxSoDsJhXPi0NiGMJQIheV0zdbU1ckeKGaKcvJB5xVPzl8j1UZHGG/HHODBBONPNZc4wwL+06lBlrRXM8wGYzYR8ZEzAofTcKHnuk6RBlk1NO17flrDebJ+EsB47l1HAYxZxGXm7bOvgilcWj3Olizu0V1ihXZJ8iTJaiHN29nWsRRZ70MU5Ivtvj1cJ29a7wNnawqpTxd2SoqEenAhqHZzLFc5AOVPk5SLYGTHPryOITS8A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DS0PR12MB6486.namprd12.prod.outlook.com (2603:10b6:8:c5::21) by
 DM4PR12MB8474.namprd12.prod.outlook.com (2603:10b6:8:181::13) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9587.18; Tue, 10 Feb 2026 22:06:55 +0000
Received: from DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33]) by DS0PR12MB6486.namprd12.prod.outlook.com
 ([fe80::88a9:f314:c95f:8b33%4]) with mapi id 15.20.9587.017; Tue, 10 Feb 2026
 22:06:55 +0000
Message-ID: <a7140f1d-b4de-412d-88a5-90e76d2200e3@nvidia.com>
Date: Tue, 10 Feb 2026 17:06:51 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -next v8 2/3] rust: gpu: Add GPU buddy allocator bindings
To: Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Vivi Rodrigo <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Rui Huang <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Helge Deller <deller@gmx.de>, Alice Ryhl <aliceryhl@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Edwin Peer <epeer@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 Andrea Righi <arighi@nvidia.com>, Andy Ritger <aritger@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, Balbir Singh <balbirs@nvidia.com>,
 Philipp Stanner <phasta@kernel.org>, Elle Rhumsaa
 <elle@weathered-steel.dev>, Daniel Almeida <daniel.almeida@collabora.com>,
 joel@joelfernandes.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 linux-fbdev@vger.kernel.org
References: <20260209214246.2783990-1-joelagnelf@nvidia.com>
 <20260209214246.2783990-3-joelagnelf@nvidia.com>
 <DGB9G697GSWO.3VBFGU5MKFPMR@kernel.org> <1770754015.1979311.8126@nvidia.com>
 <DGBL94I0E5UB.4LNH3JODOKPV@kernel.org>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DGBL94I0E5UB.4LNH3JODOKPV@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BLAPR05CA0033.namprd05.prod.outlook.com
 (2603:10b6:208:335::14) To DS0PR12MB6486.namprd12.prod.outlook.com
 (2603:10b6:8:c5::21)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR12MB6486:EE_|DM4PR12MB8474:EE_
X-MS-Office365-Filtering-Correlation-Id: d253c9da-74f4-4fde-b059-08de68f0b3eb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OTMrTlhjc0JFU3Njb2ZwUFpuMEI1dHdlWTBpaHI3NG9iU3hubHJEMTFNUGxk?=
 =?utf-8?B?VFY5eHRnajdSUFpjczdjWXBIZXJETzQrTGphOUFOWnFHcWx5MTlrd2xtMUND?=
 =?utf-8?B?cFRTSm5meFRINkFtcXB0dVJydkpVN3Q3UDgzMGxNZnF5eFFmUEhLck52V2Fs?=
 =?utf-8?B?aEQyUlhkUVZhbEdCSUVFcGFNaStPclhteVhJYXBnSkdPU2Zmb1Q1Z0dWK1hk?=
 =?utf-8?B?SVR1cHY0MmtmWXZvZkw4Z2hjWHhyQjFXVDlaTEJ6WUFuTGk3Rms5RUtLd1Nn?=
 =?utf-8?B?cDYzS21TUzhORkJWK2M1SVhwc1ZwZFhLYzhYcThsNmdTcGVJSEtuV3BJZmtC?=
 =?utf-8?B?UHREaDFhbEMxcHpMaVBRUnEzOWM1TGpGQmZQSldZdk9ZYnlZL3JhRmJ0a0dn?=
 =?utf-8?B?Zm9LTVFxK3ZISzFnT3JkMlVxK2s1ODdkdUhlZnRUY3pMUGd0RkJFN2ZIVWg4?=
 =?utf-8?B?QlZtamFvWWczdXJsZFdUT3lSTitFNWVRbGxQT1pTbElqeCsyOWxBZjdWN2ty?=
 =?utf-8?B?aWNpY3BrdEpCSkVMQU9xZ0xnalFCSXJVS3RPaDFydnBPT1R2MGZZWldmTnd1?=
 =?utf-8?B?UlY0V0VnK2NRQzJvQjFoSGowU0lZR3BLMmQwcDZjamhXbTBqVHZSdlFjTlNB?=
 =?utf-8?B?bTFmN0xobkIvR2s4MSttOC8rM0FGbS9NRHQyalJrNWpkMEZ2TERJMXc5WTFo?=
 =?utf-8?B?anljT3gzUXNubkU3OWpOajRFdmx2bFdJNEFwQ3RVUVZhcTcxSzNlU3JjM2I3?=
 =?utf-8?B?cFJYN2NndS9GM2xmWi9pTjZyTnd2c3drYlZSQnpnTlEyNk4rQmJMNXZITXdo?=
 =?utf-8?B?UjVoWkFwa0Z3bHF1T01NWm04N1c1d2ZOQ1lmQml5cXJSSmxLMHFKbmFSQVhJ?=
 =?utf-8?B?RDFld29YdUhuS2ttNWZwNk9Jcmk3S3BFN1BVQ1ltamFCK3ZQdFl5bTVXSlBZ?=
 =?utf-8?B?RHVPb1UvSlhsUTRibjBLSXVDbWt2SkJCWjVwWDRSUDBxY0hSUzVPVnU5WTRU?=
 =?utf-8?B?YlE1MUZUVEc1cjZYT1ZkdVZrQkhmSlN5N01MenpKNmwxeFh1S3ZMbURnaWZh?=
 =?utf-8?B?eUsxTlA4b0x6RTFrajJoSDlRV3RId2FxVE1aMncxQnhQUlE3M29DcFFEY2Ru?=
 =?utf-8?B?VFBzbGorYWpzOU1WR3ZVRzZrL0xGZGJ6RHMzMkFVTThTK1dnNjNMV1F1U25G?=
 =?utf-8?B?RWlKcXpyc21qVWJud2xvUEY0NlhuY281QWdPSWczVnFiNUdibFpidXRWQ2F0?=
 =?utf-8?B?MSszdml2d25udzNWeDU1dTdzM2NJcG42dHJzOVhnVlNpTHAzWlM4d285NEtn?=
 =?utf-8?B?WnNGOVpTV1FQQnZ4UDBHdE5FWXowK01QdkRScTJjbWpYdVlmSmR3S1RkMjM0?=
 =?utf-8?B?T3F1ejMrb0xrTExjL0dVWlc0MlNnV3NTaUsweFRpUXMzN09JeVVobW5ObVdx?=
 =?utf-8?B?bDBsTy9uOVFLMnZ3aDN3WW11WmJrRUF1cDUyTnVKS0ZGSHZaaWFnaTFTTHhJ?=
 =?utf-8?B?cEwrWmF6NVF4cng0SlhMUmhrL0R6ZWpRK2ROV0VZL3NMd1BuY2lUYWVzb1FJ?=
 =?utf-8?B?cHpMbzQ0b1NnMUhIYVR1blFKK0s5SXQ2QjduTm9vckxQcTZ1T2hQZlNHRzd1?=
 =?utf-8?B?bTkxOFpxOW0vaVYvN1F6clh5N3VnTjFBaWRSOHJyZ3V3ejJWaVlpZEJvZEhs?=
 =?utf-8?B?Yjhna1NEdE8wSmpsYi8rNTBMT0N3amhpQUY4c2R5R0VCQjF5MWhTRWFvVS84?=
 =?utf-8?B?UVNhRlN1K2FZVkZFOVF5bmNFaUZ5WDVTV1BkR3J0a3pjV2JXVU15cFpYZS9y?=
 =?utf-8?B?N3k3Tmp2ZFArOTY2SXhGUmpBb2VZRlpNeTk3UVJaVWx0emloR2hjaDQzVmQ1?=
 =?utf-8?B?TS9XYUhVaEl4MWtJK21RUm53MCtTRm9jbk1kbVQ1cmZENVhnVm9ScWdtN3p0?=
 =?utf-8?B?UEJZNTgrdGN5b0pwUFZOeTFOOWNXMmJMVnJ5TzQ1b1BoYlZ4WnErckl1QjJl?=
 =?utf-8?B?SW84K2JMRWVhejVjNVNhSFJzQ1o4djUwejhKSVlQUDlwQm1Ocm5QWGZHME1F?=
 =?utf-8?B?NHY1MW0zUDFsTlJjZkphNGZPTG5ONngzYm5hQ0pPdzdDKy9XTTlYQlRNaUFY?=
 =?utf-8?Q?oBTo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR12MB6486.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGZIbFZKemZQeFo5U1orY290MnFBZTJGaDB4RmhtVklSY01LMmFWaVp6YVdY?=
 =?utf-8?B?aDdhRTZFaTYxMUNiUG9mOUdlRmtpRWxaVURYT1UxS1Q5OEhtMTA1TVVHSVVP?=
 =?utf-8?B?NnhudE5rY1dyb3g1dmxaZll1NUpGUE1nNThsMVVGcDhKeUkzeGpEQjJVNE1z?=
 =?utf-8?B?T0pzUCttRDYzTnJudEpPbmlNWHFpNUR0Nys3NFc3cDBDSTl4U1lQZEZqUm1V?=
 =?utf-8?B?SEE4QVdYRUZIUlhhRVJsUkdCKzVzVytlb1FDSkI5YmxiZ0NhejUrc0lPajdj?=
 =?utf-8?B?ZHlNUmtrQ0c2cjJNUDdBZ3ZySElhbGsvZlI5TSswb2NQZlQ0UWpUMkVReVEr?=
 =?utf-8?B?MjRId0ZEdGlSakZaODBqRUJZQzJNMTdxaTZocTUrd1V0Q0VXcG01dzZiZTNQ?=
 =?utf-8?B?b1JZVFVabGViaHJ5WTdIejN6MkF4dEJvTHZBSVArSDl3OFdod1pDZEd3elZT?=
 =?utf-8?B?QWtPUWtMWnFxTlhpLzNEdnFhanZNYzNEYjZrRnRuODIvUnkwTzZjblZhQ0Vr?=
 =?utf-8?B?M1NqVENTcS9LU1NTayt0TG0wRGlnR3hIcjdUVzNZbGxsZHlzUmlKTHFJeGE2?=
 =?utf-8?B?Y1BYU0wzd3J3MmJ3VEViZTRVSTd5WjB5ZDVKcE8wRzRwekh4T3UvT2RmazdB?=
 =?utf-8?B?a3ZybTJnY05rNThBNnZvYlRGOGFLemxOQSt2NFZNZkdwMVNLZTNpWUtQWWlP?=
 =?utf-8?B?NUF4ZHk0NkpnSGpDcTh3d3FvRU1OQktIN09XY2VVUFpIYkJhR1Z6aUFBL3pL?=
 =?utf-8?B?b3oxWVhma2loM3oraktOTmxTT3VORkUrWHNGUHlQdmZPY2VvWXNMZmhqb2NI?=
 =?utf-8?B?aTdYMktLLy9kM3ZuMnNlK3Ird0xXTHM0WTRoaW40VzNicTNoc2ZpZDdwUjc0?=
 =?utf-8?B?VmtiRTZxWmxVWTVldUN0aDJIZG1mSHZrbmhxV2R1NS9DdnYrM1QvUEc2d2lk?=
 =?utf-8?B?N1NtTGlDMkJMVU9qRTgveXFNblNkemFtR2pIYyt3S3RBenJmc25WVDNrcEYx?=
 =?utf-8?B?SlBJY3lLU3FlT2dmSTA4b1QydFY4WUFLS3ZMQURTR0RzRlJ5ZExFTlRzNWw2?=
 =?utf-8?B?TnZSWi9kRHBSU1JNRElCclZRbzYwMFBrMHRuLzd5WDhDK1ZFamZrQ04xTmdC?=
 =?utf-8?B?ZmhsT3FZM0ZwdTltcjBNUlZtNUd5aFlUUWtHb2VlZDNTdEh6WGtpTGhNRnI0?=
 =?utf-8?B?blBPOFF5d3lFRnJENTIyOU8yOGxYdkpQRVNuL25jUlM0dnF5Y3k1TDlIdlJ4?=
 =?utf-8?B?MlROQmpXVmNHTW9UR2gxMTRuNW5NUHFYUldpYzRLZG9kMUZnbit2dC9SVHBM?=
 =?utf-8?B?T0E2VzBGRGRmMTZGMUYwVlRXQ25vbFhsU3YvUll1cDJ1b1AreFkvTmZQREtv?=
 =?utf-8?B?SUQvQkNLRHdra0Nja2V3UVNMbzJCSFMwLzJMOGpNVWczR3UzUHp5UHJOZWlw?=
 =?utf-8?B?Vys5U1JsTHZMZnJSVWpKZHhFUXZuenF1WTJRa3d1dkhxUldLZXVHUStmL3No?=
 =?utf-8?B?cWdBcE5nNFYvVXNhTldQZjBJR29QZkRsaFNNUG1lT2ozUUM5TnJXWUlubUYy?=
 =?utf-8?B?ZUtzR3ZSWlNyaTd0QTFFT1lwejByUXlRUUZoU0JCdUFveGtTZEJVb1BvMHM1?=
 =?utf-8?B?NjMxaEp5VFE2Sm5POU43OUx1dElZUlVCSlRnL0J5ZU5hK1pwNSsxU0hucWtB?=
 =?utf-8?B?UXJTd0g0K0IwcFY4QWs4cHZYOE1UWXUyLzcwRWxLdk5SU0Z6SnNSQXBubG5J?=
 =?utf-8?B?czY4NlpvQWFwTy9qUWdON2dsWVgrZ2VFNHo5YUo1UW90VEtvenk3NWFHZE9R?=
 =?utf-8?B?M2ZPZDBBVTBxWHFWaWRzU2JiajFkK0hLYTF2bWRVengyVlM3Q2pQZUh3UWRV?=
 =?utf-8?B?c1U5cTRDSWN2UFRxMGVhU3c1bHpwQTFKVDlhWExubjhhOVZrckt4ZEFTd0My?=
 =?utf-8?B?L0VnNkhxaUUxNGd6aDlXc3N3WFNpUGxOSWRHb0VTSHV6Q1l3S2dUUXEreHV1?=
 =?utf-8?B?N2VYR3VzN1JNOHo0MjVuOGJqb2R2WXM4a1dQRmxXQWhqVXMwMDg2L3pYMmNi?=
 =?utf-8?B?aUhwdE8zY3hRNzYySjgvbmp1UXJTTFZGdS96bi82V3lsNVpFUkR4R2xYMHBl?=
 =?utf-8?B?eGh0cXQyayt5Z3RaZzA4MDNuU000NE5sT2RWbGhNajdydHhZSUpac1BEcG0r?=
 =?utf-8?B?N2ZiT0lnWkMwT0JPcDlkR1Y0elZjZU5oYnBKcHZwbW1sV3VMbEF4WU5RRVlN?=
 =?utf-8?B?eUpadXphelc0bmZ3SlZDRGY2VkZFRXpFNUQrWWNwN1VZRzFTM2dzTFdVNGFv?=
 =?utf-8?B?YXVUd2J5MG5YcWErNjN6N2tOR1BITERjMmNOMGdMZ2JvRCtJdGdYdz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d253c9da-74f4-4fde-b059-08de68f0b3eb
X-MS-Exchange-CrossTenant-AuthSource: DS0PR12MB6486.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 22:06:55.6062 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iR49H+a/ceM6sdhDgYPLreHZPgS2ktxXAn23kxS9fOGrQY7okrsctwO+EGFpQyE6/jk+CMQZNuo+tPzyFrfoTw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8474
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
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,linux.intel.com,kernel.org,suse.de,gmail.com,ffwll.ch,lwn.net,amd.com,intel.com,ursulin.net,gmx.de,google.com,garyguo.net,protonmail.com,umich.edu,nvidia.com,weathered-steel.dev,collabora.com,joelfernandes.org,lists.freedesktop.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_GT_50(0.00)[50];
	FROM_NEQ_ENVFROM(0.00)[joelagnelf@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[nvidia.com:mid,Nvidia.com:dkim]
X-Rspamd-Queue-Id: 6A42711F9F8
X-Rspamd-Action: no action



On 2/10/2026 4:10 PM, Danilo Krummrich wrote:
>> I'll change this to return `impl PinInit<AllocatedBlocks, Error>` in the next
>> version. If a shared ownership use case arises later, we
>> can always add an `Arc`-returning convenience wrapper.
>
> I don't think we should, don't give drivers a reason to go for more allocations
> they actually need for convinience.

I wasn't implying to give reason to go for more allocations, it is about a
reference to the same allocation that may be required to be shared from multiple
objects for whatever reason. But again, currently we don't have a use case for that.

-- 
Joel Fernandes

