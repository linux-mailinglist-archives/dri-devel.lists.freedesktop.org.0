Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B75BBE1B50
	for <lists+dri-devel@lfdr.de>; Thu, 16 Oct 2025 08:24:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3488D10E952;
	Thu, 16 Oct 2025 06:24:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RTh20dkg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010001.outbound.protection.outlook.com [52.101.46.1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6AA310E94C;
 Thu, 16 Oct 2025 06:24:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HKuK8BlaZyNK2tJjpqntxSgFhNNtr5FfJg19tZlaX4+Y05qHSk6fbDPtQnZbKJxX8YT1xudVhknyVN6F1P1WbHHmRYFu/fmSOoz8+UyB1/7SPkEh9ie/LmfAdcvSNneWraYk/UZ1PGedArx5RYIe7gJwy/GE4iNFM/tv+4ISzzQikOrVy+Qqbd/lAk7sjX6kRBSHrkS3vCfo4i9mKvxFLxgc7fRgZvOy/ufJ/SH5YeeGvIn/xejyMpLnd5+aHEfSVMjqjaF8eWJOyoMu+/pGRxRGJ+iij3C6Ze9ifC6N2NfR5OIvA/yFrUrkY+03ps+Paq+iryS/cSvCyXbsyQX4vQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cXNwVv+JgFqFpbY02VnPd6lkTkI4U8eRR7m0jqcEajo=;
 b=e3z7CrTWlITFoxIoDpuXiTa1AJ4y+fXjmiLV/LANYB/MSQyqfuhKiOiHipop1S/WMFWvfIhJTtps2gPZ784L98WLTI3jiEjTHE+CDYfzj0bCE8rA2hgEm+xKeh+icgPZKQjNEtgAue1iQbPOJ4/vZ4rfx87S4Igq1TDVBGa+vpewE/55NaQbkWYvg/e8tBobk9jfBVERXFj/x1TTIRP9p8ivYUx472Fq6tPLPpMTU4WKsj0KkFF+c5izUb/PaGMTOEukTNzex6J3r9CrOPdARGm7oClLGkkTqoTNyYvmuMwKDjzLbiqeM0xvCYU2d00buaUmDMdWtZl0vL3quGlxsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cXNwVv+JgFqFpbY02VnPd6lkTkI4U8eRR7m0jqcEajo=;
 b=RTh20dkguTiUaDxR/YyHQt54dzClZi9eZEDETSIORQ0KdAZAspnYZEkMfO/SCN3WpEg2EH099oLm0NK9RzF4jfkUoBxsYVaTSqxkV9lA1HyX6ql8JwtVbUJS1GH5v3o6ak6mOlylpjXbZ0f8xQFPN3kTwNR/AuLeIgNZuprgftqwtB0ldMAAW22TpEv3i/3LRxiM4R9Q96902nLifXxqq2QIumXonCq0rBImFo7pGBV3xu6FV1nwIpCtp9fkTDwgiK4dtjCYpo0NLq6mwLr+6ZXOyIv+c95EnRqnKdl9ttz51/yT9XC+VpPHiwPlo1c7KURUpIM1rnYWtGoG3kuVEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA0PR12MB7603.namprd12.prod.outlook.com (2603:10b6:208:439::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.13; Thu, 16 Oct
 2025 06:24:40 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 06:24:40 +0000
Content-Type: text/plain; charset=UTF-8
Date: Thu, 16 Oct 2025 15:24:37 +0900
Message-Id: <DDJJ5GJI5HJ8.2388S19QXO8G0@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "David Airlie" <airlied@gmail.com>,
 "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "John Hubbard"
 <jhubbard@nvidia.com>, "Joel Fernandes" <joelagnelf@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v5 09/14] gpu: nova-core: Add bindings and accessors for
 GspSystemInfo
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Alistair Popple" <apopple@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <dri-devel@lists.freedesktop.org>,
 <dakr@kernel.org>, <acourbot@nvidia.com>
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251013062041.1639529-1-apopple@nvidia.com>
 <20251013062041.1639529-10-apopple@nvidia.com>
In-Reply-To: <20251013062041.1639529-10-apopple@nvidia.com>
X-ClientProxiedBy: TYCP286CA0019.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA0PR12MB7603:EE_
X-MS-Office365-Filtering-Correlation-Id: 981e1d71-d239-4f74-6604-08de0c7cb054
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|10070799003|1800799024|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VjNZT2hjU1hBbXNlTElUczBUR0NnSS9TRnpVWlc4OExjWTEvTlo4THBBMHdu?=
 =?utf-8?B?UzY1U1NBWXVpYnJ1V1FWek9wT2JWRWVRNWdpZ1hLWTBkYkVuZzM1UUJ5WVp1?=
 =?utf-8?B?MG9wRWJnRFExNytTaGk3eDNKWWtyTUpLc09EMElKWFZHazh5cEJsQXZnYXB1?=
 =?utf-8?B?NGdXLzZxMy85ZWZxeVBod1hSRjRSN25PS1ZzZkRITzlnMVhrL0p2WGRDV2Qv?=
 =?utf-8?B?OS9BTVhXeGJNNGJrb3p1Q1BNY3pkbTIvYWFUc21NK1JwaTNqQlZuOXg4b2R1?=
 =?utf-8?B?OXYrVzgxN0U4dDZMV0NkK2VobGROUFpQaW5ldmVlMnc2dXhYMENnM0Y5NGo4?=
 =?utf-8?B?ZkdlYzNaL1Q2Z1J5Y2JUNVB1NVVLMXhmb2VLQVQrcUZBbVVJeUVSR0ppTnhh?=
 =?utf-8?B?YUtDRHRaY0FuZXN0aVRDUEl5WDVCREJMdGRBTzFRdjh1RGhsNC9yd2krMU5P?=
 =?utf-8?B?eXhEcFdhRjFnZXVJTy9sdWZ4dkVCcUk1VTdxQ3ZHUUhCMkh5K2R4QzFraGIr?=
 =?utf-8?B?NG0yQjlEckFSRllVRnUwOEJ4ak93NklaamJDd09aQkJTQStqQ1BDaWxBNmFk?=
 =?utf-8?B?MDBOMkVrWmFHRGF0aGZlNkxnNExYMnlaM29NZEtQUXV1WW5CVWcxTEErMDBD?=
 =?utf-8?B?OHR1UUcxNS81QTlxa1VJYnFqdWdqV2sxenQzTWFRS1NNV283ZVVZeHE0NUpx?=
 =?utf-8?B?bXJtVmxmQVRndVRlWTZTUWsvWExWbVdwYkN4b2IrMGJ5QzVWL0UwcjMyQUVO?=
 =?utf-8?B?MDdHdTJEYmY2SUp1emFzNi9vZjY5cmxYcUZjS0pnaStrQnl2V09LVlIzcWRN?=
 =?utf-8?B?OTM2UVJ4bE0wbUlENWcyQ09JRUNodkEzSjF0K095dVBuZjV2b1ZHSExSR0lD?=
 =?utf-8?B?eG9vVVA5dTVmSUpzNmEvTXZtU0x0S1lTOUFRZjBKeUVCOEJZU1hSdld3NmZ0?=
 =?utf-8?B?cGtsZFFES3hDc3k1c3dJUTkwQWRjYklvOGNDL29vWGJNNExnd1IwU3lRY1ZQ?=
 =?utf-8?B?RGVUc0JTR29TaU0xSGxIWkhRV2E0NitqSUdjbmFMUjhhMzBHM1lUMjZOcXdH?=
 =?utf-8?B?dWJmRERqMWNscGdKZkU5QzNwQUVrc0RSTmFVWVB2Yll5SHA0SDVhNEVSekt2?=
 =?utf-8?B?aGFzS01qcitOTkdqVDRuelZJWklkS1FjeDdoRWU0eFZtUVBjbVJoM3Z6cW1J?=
 =?utf-8?B?ekNhS1ZaZ2l3dU9EZnMrYmtkVDR2TldOTFBuVEhRYTB2K3JOMTl0WHJDQmVE?=
 =?utf-8?B?U3JybXRtYU5KNFhzVXlZZE83YzUyNWF3bTM5bmZ1b0ZUQW0zRXBhWVRjMjEx?=
 =?utf-8?B?Y2xFNlBkd21rKzJWWHUrMkhJWlRSK2p2T3VaTTVpRzFpZkRVWnV2NVpnMW5O?=
 =?utf-8?B?cW9rYzYzMm5oVEJrN2w2OW5JMUI3ejF6Ri9lSkNPZ3JoaGtqNUJGanp6Rng3?=
 =?utf-8?B?WFhJV0xmdk90OExYZWVRSmpFZXJUY0tYUWpIa1R3Mkk2WlNqaUJ4TSsycXBR?=
 =?utf-8?B?OEtETWJ6N1VoeThDVUhwSmRuN0oyekdLV29razN0NVI5NWJaR1l0eTJLSXFO?=
 =?utf-8?B?dVpRbTVwN0hqMldpZGlLSFFGTHFUYTFqRmZLVUlzVmZFS2luQjU0ZHFhSkNR?=
 =?utf-8?B?amo1elRVMGcvOHFmK0dERUlrVFBhZjJ2VC92R3NqdGJlS1RqVnRiYkxQbm44?=
 =?utf-8?B?bVZFZE4xVUNtWElIcGNFR21uYUZpQ1NUSm5COURsMFNEaWNPR29qUVdJYUF2?=
 =?utf-8?B?OHNEbnlScCtBeSt1MlhPOUdOaHdCNmpYTVN4NjRXeklBeVJmdm54K0FPQTR6?=
 =?utf-8?B?YUlIN3Q1K0pETHNwbUIxT3YvbVBHYzFoeUVkdDhPS0ZldWEzS1EzazBqTkxZ?=
 =?utf-8?B?WHF3Ty9TTmVUL1hzVUZFeTE4a3hvdk1KUTdUQjhQdUs2QWlhYzc5QVpERklL?=
 =?utf-8?Q?BMTtUFX3DMmcJ5oWqk81ZX9ayGOJ68ef?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(10070799003)(1800799024)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TU5MRXhISVhqbGlzN25WZlNwN0xVSFltenZlcGxSWS90dUw3TGUvdXRKZVFU?=
 =?utf-8?B?anNmL1VVeGsrd00rUHh6UW52M01FK0o3cmxrV1llNVJPbWMrbkpuMW1BY1Q0?=
 =?utf-8?B?VDdVY2NJdVNIejJMSVkwa0MxbTdZbzFiTGVodzdRMUFpeXdmZTlCdTF6QlZE?=
 =?utf-8?B?enMrcjJFUWVBL2NlaWgwTEJDMDFidGpVR29YZnY5ZTVYamw5V2VSWDJtQjZJ?=
 =?utf-8?B?SkJ3cHE2bWZlWS9sY21LbG5QM2E5WEQxT3d1MytKVEY0WVo4K0dLelBQbThs?=
 =?utf-8?B?UGl5ZWJycnBhNTBJZ3B0TkZlZnpuQjlCUkZZT3V2Nm81L3hpM1B0dmZEZUJr?=
 =?utf-8?B?YXFkYkYwdGVVUnVMZjZ6c0JNVUorQ3BDVjM2SW5ZOE1kTldOUEIybU42dzFn?=
 =?utf-8?B?YWErOW42QldPcVhSZlRlYXdXOGU0OG95THA0NnFrOVJqTjdOVDJ3OHUxUlVS?=
 =?utf-8?B?d21Ic2laSmQ3c21XQW1kVk56YkVvYUpHSDg0WXJmcjNFUWZQOUliRmVJUG9z?=
 =?utf-8?B?UFdwcE9BRCtwZVVCL1Q0emNuSU1hTHhGcXJ6TlNSTGF3dUh3M3JvYXRCNGs3?=
 =?utf-8?B?WHR6ejlTTGFseW1BU1lZb3RSRGRQOWsxTUxzYjNneEIrT0E1SElLemorNmtj?=
 =?utf-8?B?U2dmTzd1Q0lYeGpwNkljVmVPcXZIeE05ZFh5dEN3aHFydDR0MWtrSmRhZTg5?=
 =?utf-8?B?RHhHOXRhVHV0NXhXMFl6RmdFbHNQamVYYmxnWDI2Q0U2YUJlQWppNWhaSHVj?=
 =?utf-8?B?aEluRWtGakltRzI3SG10VHA0TGxvZWxiWHZIOXJXOUtybXNua1Bpa3RTc0o2?=
 =?utf-8?B?dkJPT3BRVnZvK1MybVhISFlzaUFmeXdDT0RpVzZlZk5xOXovZUZySFVMWTZt?=
 =?utf-8?B?SzJFTDZKSVk3bkRrWEh1NDJNWHp6REdYbVlKMVpzSkJiNzQvTTF1S3hnQ2FB?=
 =?utf-8?B?NmZ6WG1Ia0pjZW9DY1lvUHU4SmxpWmlkbmlhU1liMTlNRGZGYWNPT1hadGZz?=
 =?utf-8?B?b0FTdFc3UVlDSnV6SnEvREFnVm9VOXZPTHo1YXBNZXNKV0pqOVArN0NlRzVm?=
 =?utf-8?B?SHFPYzd0WFRzNklMMUxpNUc3K1lkY0N6TTB6Nm02MTk4dnFVbUgyNmpBTlRL?=
 =?utf-8?B?OStCeFlpM284ank2SEtpMEtnREsrc3NqYnJZcENsdGJ4K3NNS3N5ZE80WmRN?=
 =?utf-8?B?a2M1VitHZTdVZVc0cXVPU1RJV1VhQ0RBd05BZ1FROXhUNFJ4V1JVK28xNDNP?=
 =?utf-8?B?OHc3UVhvTmQ4TTErWGFmbWM1TnQ4TzV4b3VFbjVyMHBrNlFBYjZycUpZcGJV?=
 =?utf-8?B?NnZ2T1pCeU96RGt6RGtTRnV5UnQ0WnpFSVpRaWI2NFo0Sk9OSVNNUVI2L1Ay?=
 =?utf-8?B?R1ZJSURueFBycVljeU92d0llQzgzVm1Rb0NwK05nd3h4d0NYZTNIMWlVTjJE?=
 =?utf-8?B?cHppaE8xSTFVUU9CRHVTbWlMZXd4TmNkZFFLYnpUc01CS2FzOHFLWURCclVI?=
 =?utf-8?B?M1M3V25iQXBIZVBtZ1NJK1dZSEVEcU5EWldRYnlKMHpuRnpLRjJHZDBhbkxL?=
 =?utf-8?B?bFlsOXBNaDAxajBFMnhaTHc0ejYrWjdkcFFIVWdwU0pUTEFjL3hJbEZJTmQ1?=
 =?utf-8?B?N3cvK0RDQzlscmh3eVpNMm9TMDY5Vm02alpMazY0OHFRZ2xIMmNpSU5EekV1?=
 =?utf-8?B?cWQ2T0lxTHhGUDNFSUQ5Y0ExMThxWVY5OVNBM1FYcjQvamxZUEszWFB4NFNT?=
 =?utf-8?B?b1p5Tlk0bkNUejFnOUJWYkZScU1FbnZaMGVaa05Ub1o0RExJMmRsZ1FCMDhW?=
 =?utf-8?B?RzM4Z3NVUXV5enhTa0dEOVR6N3ZsNGdaRnd1Y2k4aFc0RVR4ZzNYaHA0ejRh?=
 =?utf-8?B?OGcyaUNVbUdGekluNWViRDZTQVJNczl0eXp1ZmxsaW9iTTI5bjVlTHdFSXEx?=
 =?utf-8?B?QXcxMzNqWTlOckdGUlEyYVNib1U1U1dUZGMxdkZwNmd0WXBkRXBRclp5cEFW?=
 =?utf-8?B?NTdCdDdYeEplT1pubktvM0JONzRIT014VEdKOGxxY2NwbVJwaWtVcHhYWFdy?=
 =?utf-8?B?VnBPanRGVHJ0L05acGoyc1pwN2VoT2xTcVJCckRVNXI5NlZHOGczUW9RRmll?=
 =?utf-8?B?ZS9WTHZZVVdsL0NWQjZZOUZTaitNVExyNDlXTVRLMkk4NXNpaGNqYmxPRlZY?=
 =?utf-8?Q?KKBZ5qqijJogFsX1mq/ORKLehXPrhYEYcPZdVtDbmKjx?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 981e1d71-d239-4f74-6604-08de0c7cb054
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 06:24:40.8283 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DppN6jx6UJjfGIxMS7+M+9mG7NeLhRAebVcghRMEbP+ncPHy2rAYiNAgFHYFtL8C8/7Rbj6YFk9WC3xFrxvElg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7603
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

On Mon Oct 13, 2025 at 3:20 PM JST, Alistair Popple wrote:
> Adds bindings and an in-place initialiser for the GspSystemInfo struct.
>
> Signed-off-by: Alistair Popple <apopple@nvidia.com>

I am getting a new unused warnings on this patch - we should either
annotate or merge.
