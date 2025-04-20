Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FB00A947AA
	for <lists+dri-devel@lfdr.de>; Sun, 20 Apr 2025 14:20:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D5B4C10E2DC;
	Sun, 20 Apr 2025 12:20:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cWvJfyQd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2042.outbound.protection.outlook.com [40.107.220.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C23510E2A1;
 Sun, 20 Apr 2025 12:20:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k77CfjjwPbRhTFj9juTmjZFwoio+nWvSgwMvMIjk9Rcjia9c580Y+y+goZHIfdCJviBtgmxYtN3+5WiR2LUhsJT8mgbgSg1R4JW+OeFBgoBnFEIOwKJoItTW8fJk/4ajimLkIvqvLAiGFfjBG0KGKdCX09sI6BtcELEmcVqKzZh1hP5HfydH7qKtr5k0sh2JRT0UKymWBThjDx4T3lD/sq+XCgSIguzxUUl0m6A8xwtj1QqUIVc2wXl3WIdxP8pRBDPhoKcISlCuR3GeRKh8LrtAXe+99VqgcncEkPnsKH5a1iE/Og/LFnIBVa22qHT6LfYja8lfnj9M62y03LTFlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XmWSj57R3v+UIceJhRruaNFfPcJL96GvOx+Ep5xc3PM=;
 b=IU4tXSa0dwGO+MbiWJDoL6HTAO5ryz2h4VTcaCzCEWobqQxSSGhtlZ4FIUBZFYFN5VnT8dLhJdq4vCxrN3pCw/OdLLwF+XQEGeAphK8Qm8b9bzRFgaXcQZ05ZDdZn8bMt0L0U3X2vvqgkhzLb2WvlYQiJbkDdr5jCpvfD5Fjhjvnd6WeFcxTSAfcgKxmeNLiNDp5eKF+81QMlVhbPehn50Sawwd4Rx+QGJFeWVRO/6SOFzW+V/nVdEVzwtO6hSOMVMLQLRO1/dY0AlL/A6kFkAaVpXoLRNIEBPSoiLSsWHEqadxEZBKBQtenoTJhYGjcPk6v2gL/rVFi9VSbcDhrwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XmWSj57R3v+UIceJhRruaNFfPcJL96GvOx+Ep5xc3PM=;
 b=cWvJfyQdnZw6lwSb9BB6x18tqCceIGdHrhVTPEzFWdBQMcc8y2yDimblATmMRBmv7dvhiTo0WDpERasG8bq/MiPgfxl+NHBMTptUNkaNlYEtFgzVQzp0NdqMqR9yIOE4n1RlL+lsDtvu9ugPYzWigN038In+dl8H/dM5ZLVwvVtQ39dthcfQQxvxKa2FESFsEinMrJGYcOafe7oEUaPnTzYBI8RxJoksqKeTuJ/JREfFDrOrM1Mla3vKLHMsWC+X6LrKIG9Yw2HedStYKcauAkveO6ziz1DH/kARsv8Bs29gz4RLbFQE78sLT3t6oCukZXWttUwCSZGi6Qg7KtDoTA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB9175.namprd12.prod.outlook.com (2603:10b6:510:2e6::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.33; Sun, 20 Apr
 2025 12:20:05 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8655.025; Sun, 20 Apr 2025
 12:20:05 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Sun, 20 Apr 2025 21:19:36 +0900
Subject: [PATCH 04/16] gpu: nova-core: add missing GA100 definition
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250420-nova-frts-v1-4-ecd1cca23963@nvidia.com>
References: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
In-Reply-To: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jonathan Corbet <corbet@lwn.net>
Cc: John Hubbard <jhubbard@nvidia.com>, Ben Skeggs <bskeggs@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYAPR01CA0234.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::30) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB9175:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c4401e8-7033-4794-9a3f-08dd8005ae98
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|10070799003|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cW1mbE9LL0hYeTFTaXp4cUJ0ZFZLbTg2ZzYrRUxGeHcvaFZpdkVtRVR4c2ZU?=
 =?utf-8?B?SU1GQ0JheThmMW1aWmhKcS9hTVJURW9INFJtOUZrNFpGZzVjK1ZxenhmdHN3?=
 =?utf-8?B?bHBNai9UTGt2QUMzOXlKeGh6bzFaY2x6S3NPcGJYV1VqREJNc2ZDMUNQVXdy?=
 =?utf-8?B?alYrVm55VlZNVm9UaHVRWmxEVnp3bW0rcmREcVoxOGovYUdBdDBWNUVGeDRk?=
 =?utf-8?B?MjZMdllsNEQ4bExqeGhKekczcEFJR21QVGtEUnIwT3JrREE1alRNODVtN2Vu?=
 =?utf-8?B?UURNM2RXUGRZWnpuNUthL1hEWXlJTzdlQ25waHVubk9rUm9Pa0RFRkc4WVhL?=
 =?utf-8?B?ZXErQmlQY2kwWmJpQW8vYnJVbkdWdWdOeHg1V2ZKSGJLeUw1eHp0eVZrVnJO?=
 =?utf-8?B?eUZ5QklhdGtVVGcwSHcrNDJoL0x4Y2VNa2lKa082MVMrQTZGQ1hqZ21xMytz?=
 =?utf-8?B?Ulk4Sm9jcmxzZFZMK3U1NFJnc2hCQUswRC95MEV3MWRNSkViRnRRQW9NM3Fx?=
 =?utf-8?B?U3lwSWp5MExpSm4vTVlNUHd6UHVRZnpydGhGRFd3SVdpeExvYjZkd1R5Snps?=
 =?utf-8?B?Vko4ZlJqVmxOVlc5VnpVdDNmQVdyV2pRajlrcjM3cVZhbFo4dnAvQUtSdjIz?=
 =?utf-8?B?M2xMYTV0TFhFZ2FZelhZcURkN0h5ZHhLeDE5UFM4dUlyQWJ3MSs1UG1NN1Z4?=
 =?utf-8?B?c3hVaHFOTmlSdkNnTWVzZXRaZDU2aHB0OG80M1c0SkVwT1NFQlBLZTBBbFdv?=
 =?utf-8?B?USs3TXkrRFlsQmFVUVpKUHI4OXpMTDVIREhkL1pZNXdVU21JSi9ETll0TS8x?=
 =?utf-8?B?TTFQb1RYa3Q3Zm55QzgxSVNFdUtnN2ZydVlPaVUwY28rV0U2SFdBWmFVdnpv?=
 =?utf-8?B?NE5iVWNPNTlGbFI5eUl6c2k0RTRXRDVQRmFYcjc1djRsR3hSSkR6bHJIdmdH?=
 =?utf-8?B?bk9tOHk2eElaaUh2NWRJNlo1RENBNGk1Q0FPWEVVTXVTWXg2OGs2L2VmZWZm?=
 =?utf-8?B?Y3doZElzQnhhUWY1enI3L3hQdlRsRDY1ZnFiZ25yY3gzRDlvUGNpMUhjMEFO?=
 =?utf-8?B?Y2hKOENmME5CSlhCUi9ZVHE3dU4yVVduTUpXU3JNeGpYdG84S2ZGZFpMcmN6?=
 =?utf-8?B?bjhMQ3RXMWYvTE1iNExsZ1h5KzQreXp0RXJkWHgvK1doUFBSRloyR0N1cVdO?=
 =?utf-8?B?NUpjbkJhT3ZlcFBvajBPYkJMclYrMS9Vb0l3cjhlRXNjUXpBMXBubUp3Qkla?=
 =?utf-8?B?dFFjdERrbnZkVXJBdXRoZTUvYUZjdjJoRzdpdDFFYWp1cmg4cGNzbVJRT0NR?=
 =?utf-8?B?a043TklvMVZqdWtzWFBueGVEdmxIWk1ZVkM3QU1YWGlkMzlBckR5ODZvQ29w?=
 =?utf-8?B?eXJUVnVhZnUrNW01b2RhcDF0aEszVUFrUktkaHdKRUhhaE9kUFJ4MHg3WkFK?=
 =?utf-8?B?N244cVhvM1p4SWM2U3RUTDBOSzdJcFhHL1IxTERiSnluZXRQQW13WDcweGFz?=
 =?utf-8?B?TVRnL0lHRlB1R05LMnZQdStDM0FmcXJyZzRBS29zTEx2QkR4N3NGeFd3R2hx?=
 =?utf-8?B?VVp2SmU4bUxEcnZxZSt0ZDRoTmU1SzB6YnlCcUxUOE0zeWwxbW16clFOT0RZ?=
 =?utf-8?B?Z2pWUkdKL3BjOEZ4N05UOVh6MHZlY25iamtpcndVNVBaUW53WjczR3BpSnln?=
 =?utf-8?B?ZlRab0pHRWZsMkZxUnpiNGZ5SlV0WVVZMDlqd2h6a3VaM1lKSU1mdjlRNms5?=
 =?utf-8?B?M3RUN2sxNDVYeENNNHRrZ2JaODNSZjlGcSsvUlBHMUcxQjh5VkpmZktnQTcx?=
 =?utf-8?B?dEJVdThOeVRWaGVhTXEvdkpTUkN0WVZ1SzZQb0c3WDExVUN0L0JEdlNrYnhL?=
 =?utf-8?B?TGV4OG5qWmZCTmZDSjlCcHNjZHhtNjVBVHlDS0V2SUh3azRWcGh4a2l0ajhO?=
 =?utf-8?B?Vkdza3NSdUZGanFQenNhMnBYT0wyUGFHZloxSE1PajViUjdNQS9ZY0RRaUlI?=
 =?utf-8?B?MnNQd255a2hnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(10070799003)(1800799024)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VXJDdFNqd1VLbnlUdit0NW9BeG8xVE5iSHNKNGtETW50RmNMR3k3a3gyNmxZ?=
 =?utf-8?B?c2tKNi9sNmI3SE52blIvZHp5emRjbDBsTysvM1BuWGFsRE9GbXpycFAzU0VL?=
 =?utf-8?B?aDg4NzVhZ1JUMll3cy9Qb0IvVWt0WGlMNFRmRHBHbyt4KytyTXlCUEphMU51?=
 =?utf-8?B?MktDWWdBbTV6aVMwbXMzdU9mTWdYQlhtSHlOVUVJVzgvRURtMnIza2VuVENE?=
 =?utf-8?B?eW1rRFdZTHN3NlJrajlyaHdPcnB1ekJSUlR4UDBtR3NxZWZaRlFGN0EzZnE4?=
 =?utf-8?B?dkFFalVKbXdmS1ZqZUYyZ0NpNm1CV1dLSnJ6SjIrWFdEMCtTRitmeXJOTU5a?=
 =?utf-8?B?dmNCWTZzekIreDBNcy9jcFJnWXFDZENSQzZkSXhiU3EvZXZaTHJLODM4endY?=
 =?utf-8?B?cjZDWEJwSkpIREZ6N0FycnBMbEZoL3Buc2ZxcC9FTDk0N2ZzL0R3TGtLQ3ZX?=
 =?utf-8?B?MjRRUjVzTzhFZXV4QVhWaXA2RFYwZ0lCYzNJa2E2V1NmcldpQjVLVkczTmQ5?=
 =?utf-8?B?T1Z5bTRZdHcyQmlwYXJPNUFDTmE5bDFNZ1NDU29vSFFXMC9yK0FkZ0V3L3c0?=
 =?utf-8?B?NTQrSWVscEltdVc4WkduYlBYSEVzYTNuejZFcTlaUWpRczJlNmtjWkM1NHhp?=
 =?utf-8?B?YUQxUkhzNTFabDAyQmxxY1dRZy96eS9FcHBUWjNkMlVSZ0F1QVJtcURjb2Iv?=
 =?utf-8?B?UEpCNVpFWXl3NzZLSEIwVlJpZ2d2bzJvWTVUakpzbERzNkx5STVVMXpuSURW?=
 =?utf-8?B?YkQrNm51cmZDN2FzZG5wMFZhOTJPMEJENHdkZ2lmdlNBbVdHOXhYb2JNcWdl?=
 =?utf-8?B?blFIemVYSTUxWEloTEgzS3VDUGVXbnRQM0lMMVpRdGtBTjFGVGxrcENRYmVH?=
 =?utf-8?B?KytLb0lMSjIxVWd6aGc2THErT1ZYc0o3OGlybStZT1BWLy96bjhORU5IczQz?=
 =?utf-8?B?TWFLUStySWRqNS9FVjdZK0dBVFRmaWtZSldFRVUrOGxkU0ZCdTVMQWRRcjRL?=
 =?utf-8?B?a0ZFY3pTcHBGWVVnSERoNm1tVmNGZHVZamNFUVpmV1JpOERuK2V5L09sblZ5?=
 =?utf-8?B?RzZXOTZDV0NlOEJPaWc4UGtKK1BmQThENzMwbVhHUzVVSVhyN1BFbU1aZjVm?=
 =?utf-8?B?WHByRENyczVqUEZLWEN4QTFSeFV5SkpRMk5Ea2kxcHBGV3psU25wWFZjZ2s1?=
 =?utf-8?B?eGZHU0hTallQVC9qU3E0TFp3TWpLUW9vbk0xc1JIK0FNN1hqcHpjcUUvZXRm?=
 =?utf-8?B?M1dJU2dvVExkcEw0K1dWT2JjQk1QajUveUNwdllwTmdSSHB4K0daYWVmYWx5?=
 =?utf-8?B?VHpkeFBxY3M2b0FPdVI3c3NHN0VXSFJpcnNBTjU5WVR5K0hiY0pnbzNOK1Rv?=
 =?utf-8?B?dTBxVDBrT2tHY2xGNytrU2JwYTRSNXo0ZjdZYVQrbElPZjdjOVRqNVU1ckRX?=
 =?utf-8?B?QVdiT1RIbnRKVGd4Z01rSDJyMkpwdlQ5NW50SVY3MmdiOW16LzFDMndsQndL?=
 =?utf-8?B?V3QvdUVRNDhTUWp1L0ZUalBqY3VJTFZhUnNmRWt3d1NZQWE1anNWSUEwYXMz?=
 =?utf-8?B?NHNBTy9jck5RZTdjUWwwSE9uejlXVnpsQTlhNmMrTHdHaE40eTZKUGhrM0pp?=
 =?utf-8?B?UmtKWXNFejUveDNNMEVsUnhORlcxTlBNcTFvRXh6TFhDUFNpTVByK2xRM2tV?=
 =?utf-8?B?SGdJM09pMkRRd1I1NEFqVHRsNUN2RUszWkdZdXBDSEdJNjBsVERlaFcyRHhp?=
 =?utf-8?B?SktRZ0hYbHE2VGd6Z1N6S3h6MW4rSVlVQWY5bnhTNVVUajVaUGJ2MFA1aFcv?=
 =?utf-8?B?Ni9sZ3dJOHR3TWJTYzRZVGhsa1U2TGVBUW9QcHBKSzV1VEY5c3JxUTJFdk5i?=
 =?utf-8?B?WWJ6eWthYzFaSDlZUnFCTmNDNW9jY3pLLzNNQzcxZVFmaGxUVWlLRktZckU3?=
 =?utf-8?B?Q3NTTWowdG4yRWgzRHRSc2RETEpvT2ZFVWEwck4zZXloVHF6RHpHYUVtdnFY?=
 =?utf-8?B?eExPa25leStYaHlOSmh2VEVOZ2hRNW9tbWIwcURrM1FPejQyaS9LTW0wWkE5?=
 =?utf-8?B?eDNkODRqcldRak4xTThFeGVTaTl0VXBQU2x0UmNsdHp3WTZ5R1JjQzUzc2R1?=
 =?utf-8?B?c3pUT3kxTmkyM2s0a09QNUFWamNXWS9mVzZmNkVhZmszM1k2eUUxaTJuMmlP?=
 =?utf-8?Q?H3pZkZE8A+e12iGt3H5czFtcvaVkCV3RQ5Pfyofy7UKY?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c4401e8-7033-4794-9a3f-08dd8005ae98
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Apr 2025 12:20:05.0140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Yb/vWrFK9jDdQ/v5hmhq40oQPWa79e4XsacXODRouXn1xIvxprtgn2toP1YUpLjN/JuNgsd/We9GMahbUA9gkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9175
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

linux-firmware contains a directory for GA100, and it is a defined
chipset in Nouveau.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 4de67a2dc16302c00530026156d7264cbc7e5b32..9fe6aedaa9563799c2624d461d4e37ee9b094909 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -54,6 +54,7 @@ fn try_from(value: u32) -> Result<Self, Self::Error> {
     TU117 = 0x167,
     TU116 = 0x168,
     // Ampere
+    GA100 = 0x170,
     GA102 = 0x172,
     GA103 = 0x173,
     GA104 = 0x174,
@@ -73,7 +74,7 @@ pub(crate) fn arch(&self) -> Architecture {
             Self::TU102 | Self::TU104 | Self::TU106 | Self::TU117 | Self::TU116 => {
                 Architecture::Turing
             }
-            Self::GA102 | Self::GA103 | Self::GA104 | Self::GA106 | Self::GA107 => {
+            Self::GA100 | Self::GA102 | Self::GA103 | Self::GA104 | Self::GA106 | Self::GA107 => {
                 Architecture::Ampere
             }
             Self::AD102 | Self::AD103 | Self::AD104 | Self::AD106 | Self::AD107 => {

-- 
2.49.0

