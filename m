Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53153C46EB2
	for <lists+dri-devel@lfdr.de>; Mon, 10 Nov 2025 14:34:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 97A4410E39E;
	Mon, 10 Nov 2025 13:34:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ukZQPjve";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012014.outbound.protection.outlook.com [40.107.209.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A6D610E39D;
 Mon, 10 Nov 2025 13:34:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aSLjDkTD7l/JSeqVvwCKG4pM+JGjFLgTzM+Cr5eDKA3y6Vi9/b2Chux+MSBxf7FNVDgCDfRpn/y5Dn9Eel+RFcbGZmh9s9KbVPtiFfgKpNdrxiWq5xBVa6LGteIcN+16ONIbPeZB7Sp9h0hD4/UIdBHvJ+9ifynsGXrHw4f3dqw0Tv4k754gEUsWWr9hD1Qx3eB8n8VLZsZ8W/UL1laseOKLabL54ntByJLeC2TmCsHST82D2fmCn+85BUNMOXGG4ql5MtfyExzD+lNW3WYogFb+zYNQAa32709bDHUd6H/+Hcw6wfXKoL4vqKeL5e1F6voOqi5p3RSrd0lsT6vhwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kU9DYYDP2N5hUMBzUA+gQNsKrg7tsji2ptDrnAqZGUw=;
 b=Imrs+jptbMcbcS31kv9Yh4sAjYPX0Q5B3+DvCGZctRq2bi5p92cfqba8Rz2OA8fIFCZPjFHeVFukKt0HOhQelnETGBzbccj+8MV2AI+2gqH7t/BORtX47+nnOTkoMTD1JCtuPsn5PoJAa/wikJqt6BcHnkulhsBkrHI4EEhgHH3SHITxE24rYl6kQEpOegwaa2jZ2hsFv4TIsI8NP4SUTe4zrvzUYyvioo4XCxwvvV+5KGl+3QPQWmimTzk0B0KVeWiCoOzNVahUL5mKo1V1Ok3FC6dZI9f0A+MFUKuqscA6CkqoDI/E6+HZFWemxLKoEQbH8NQ1768hNb64nzYGLw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kU9DYYDP2N5hUMBzUA+gQNsKrg7tsji2ptDrnAqZGUw=;
 b=ukZQPjvezP0GIWWsut45KXPDgFPzgcNNhuAlrwGnWmuSiw1UlUTxbBYqxJj7hgiHIEKIyh4RLqr9XYieaOC1fXEJHRMH07QPTTVBavIUrbOmEz2HpVPuUeoeKA+vIFduiab+xnMt8V8B+JDGcNjZEilReaNWBC7bFDgu1JWvLt5RkM5bLo8Rh0+3mae0TCArDFoS6k2PQkD7UQt3Ffkk4GLHb6CV2ReIawSQyXsxnMC+4PLp4IeZe2mzJRK8WHGEjQ6TPfJV70iY1X69TLh5HRmo6w+XV/LFwNOilW2oSpBI6KKI8G+A4cR78NPv4ZAHjYQTqlDhxyecZxNqLMY+Sg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA3PR12MB7784.namprd12.prod.outlook.com (2603:10b6:806:317::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Mon, 10 Nov
 2025 13:34:39 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 13:34:39 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Mon, 10 Nov 2025 22:34:13 +0900
Subject: [PATCH v9 05/15] gpu: nova-core: gsp: Create wpr metadata
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251110-gsp_boot-v9-5-8ae4058e3c0e@nvidia.com>
References: <20251110-gsp_boot-v9-0-8ae4058e3c0e@nvidia.com>
In-Reply-To: <20251110-gsp_boot-v9-0-8ae4058e3c0e@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>
Cc: John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>, nouveau@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP286CA0146.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:31b::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA3PR12MB7784:EE_
X-MS-Office365-Filtering-Correlation-Id: fa046ebf-6ff4-4267-f171-08de205de582
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|10070799003|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?akUwSXJGekVqSGwrdFpGeHBkOUNiNU9aWklVNWpreG1TM3d0SWZaa3B0VWRy?=
 =?utf-8?B?cEtTUHp4bkJMb1RHNWFDZE0rSHNNV2xVTHpqR1UxSmh4RW1xVURwUldubGZk?=
 =?utf-8?B?ZHBzMXdlaDBDcnNFcDRKNld6RHdLRWp3NU1sM3VCWlJJUkw1SGVOQ2xac0Rt?=
 =?utf-8?B?Wkg2Z1U1MUxyVWtWTFp3REJ4dUVreDFlVGJubXp6VjNKdFNpYnI1Tk1leE94?=
 =?utf-8?B?NFJaMDVMV1hLOGlBWUZkcE56VklWVFdtbXBER00wUjZPTGZKWU5mdDBjMFQ5?=
 =?utf-8?B?cmxnQXc5RjdXQ3E3bnBxMXpJZFhzWjdRZGJFS1daK0tlU1IrNy9DZ00ydTlW?=
 =?utf-8?B?djVndFNLVDViMUtjUDMrUWVFckUvSkhxMm1rWEE2Qlk5YnoxSFFIZVgvSU9m?=
 =?utf-8?B?TDlwRjA4NUJlMG5MdUgzYkxVT3VySGZ6Sk5mRHIrL3hMMklmWERBTi9yWTNJ?=
 =?utf-8?B?cUNTcEVwYU9XV2dScFEyMzVaMjBLdUVTWTNFWFBudnVSK25LTHFCSGlhdGZT?=
 =?utf-8?B?WDJBdVBaZ0pNMlovVmFqMkhKb2JSTEhtM05RYk83Z2ZhK05hMzlxcmNJTzFu?=
 =?utf-8?B?MDZsV1hvRWM5cUFCQ3N4OUlsVnQvRGJkYkoxZ3BUcTdHY2JEMWpqcE44ay9R?=
 =?utf-8?B?MWdaVDI0Q3dDUThlRTlEeU1mL1JBbURnSU5uV3ZGZWE4cVVhNjZxYzZuVVJt?=
 =?utf-8?B?aTR5eFZRVFF5eEpYNkYzaVFtMlRGQkVEYzdMWjJyaXVCb0pJaGgwZGQ1THJL?=
 =?utf-8?B?a09jaERrYldTa3Frb3JsSDNEVjNtMGZmaWdmQ0dKcnBmdzBBSENxdytRdVlB?=
 =?utf-8?B?bU1LNlltbUNOTlRZL0ZhaEthNHdQTzFaWDdTQmlQSDArb29qanowMTFZU2pD?=
 =?utf-8?B?azRIT290cnlkaGRLcnBWMXJxZTdUV0I2Z1BWd0hYVHVKUlgxQjgvSGN6MDhw?=
 =?utf-8?B?aHk1TFNJaEFiTldnckJLME9ObnlJVWtFMWtKTllQSGlVY3FLY3ErRTRKaFp1?=
 =?utf-8?B?MUtEeWxqUHllT1V3cEhvK3JRZDNKc3NxZzJuSXNFN0FWUzBud00zNzJIK2FN?=
 =?utf-8?B?MWIwc2ZON3BBV3ZNWXYvQkUrRlMxL2xSRUZmVWlLM1lMNTVSRitvemhWd01R?=
 =?utf-8?B?WlJwY0FqbXQ4SEVrdzRlQ1RxV2tzb3JxNnZzcGpjalRldFppeVNxWjlUNHpS?=
 =?utf-8?B?NHFzZk5IYkd2RTdpVDFZeks3S2dvNXFNbG44akZ6Wko0dVdwNDhqQXpQVHlO?=
 =?utf-8?B?Ui9hY3N6b2hKbVZuUUdBY3NaU0VwZ2hqc3YxL3hIYkdjcXE3QkNMTm1IMS9M?=
 =?utf-8?B?SVVSQkFlNzJRWnFMT1ByUW1zdW85RURnbTgyWlNyTzBEaEVETDkrZk5SdmlP?=
 =?utf-8?B?SWxYWlZOcnRhb2tUcTZaak9qZk5STFVnWEx1MVpYbkpBaFpkaUdZdm51aHpp?=
 =?utf-8?B?T2RtQmlMUHhEZzZEa2NRbDEzZnlPN0cvU1Exb2lLOS9zU25XS3daV29BQ08x?=
 =?utf-8?B?a1hHd24vRGlGRGJtOEhmdFd5eEFyM3JvdEcxQmhDbDZZak9UOTFiS09XSm9N?=
 =?utf-8?B?M081YjZJcXlsVzNERkI2aDhIVHVaREhscEpxYU1iS1R6bmhIbDBqYTNJSTNK?=
 =?utf-8?B?azJPTXJVeUdWMnRzK2J4cDBUa1BFYWNHSTM4THB3NjJZOXRQOUxuL1dSMVRz?=
 =?utf-8?B?U0VhYXNuUTlaVXBwMGhJVXgrcUVwRWczczc4QUNaK1dKNkxUQ1diT0RicTAw?=
 =?utf-8?B?b3VxVHVlRmp5WU9HeXNQcHJOMmpoSmFXZHdwVVM0b0hvR0E5R2d5N3pXV0pJ?=
 =?utf-8?B?c0dJbWhLSml0TXM1cjErbVpLUStjeHg4Y2RaZlRESndlQnJPb0xQS3hRMkFj?=
 =?utf-8?B?bE1Nd0docEZBdDVSanZDN0pjUkxKbndtSFpYM0FIM3U4MWcxQmZnM2pnZFBa?=
 =?utf-8?B?S1hpRjlNMUZtQ3p2ZWREZGJsdEFMeVZpajNobnVzOVZpZURzYmNVRE5QbE9v?=
 =?utf-8?Q?APmUmlgh2SeFNFFXzwhQPf0DfLGC6A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(10070799003)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGNmQW8xU0xrWnpDUWtaSEI1b01qUktScGh2bzIvRHpMalVCQ290K09wMHVs?=
 =?utf-8?B?RkdYK3A3KzM2Q2dGejRFMFFTdTBIQ1labWtPcTlTM3BRSzZlcW4zUnY4MWYr?=
 =?utf-8?B?Yld3OWNmNVlFTnV6czZTTVZPKzRtVk8vZGlJOW9xaW1oSlA0MWFOcnMreFo0?=
 =?utf-8?B?cG9tc3JRdlhGbVFIZzhPc2FqVHZWRlRURkY3b2lHdXIvNjBKUGFtQzJxRkZH?=
 =?utf-8?B?a0hzNnRNWTEyZWVOUjBpdEF6RnA5bVJadElYelNPQ3lKc1pUNXRJZjBLbTFz?=
 =?utf-8?B?VGZDMFpEWnh3ZzJFYjEyTjFYZ0x5SXZZVTlpK01EdEVXRmZnd0x6MWNUbkcw?=
 =?utf-8?B?RHR3M3BpLzZoN1RYa3RwaWtTejJFbU9oM29QeDViejAxTzNMQWo1QzAzV3JJ?=
 =?utf-8?B?TG84c1gxdDA4SGdkN1VxcHBybmx0ZW5jNG9sWGFCczVMWjhQWUhmNHh5NVRO?=
 =?utf-8?B?L2drdHBpN0hJUGttY2ZmdWpKVVdsT2k3c1E0bmNLZEt0L3NXK2JLSUZqV2tu?=
 =?utf-8?B?N3VZTFI1QUx6RnZtVGN1VEJ5ajBWdGcxeHdad1JLZGNFRktabThzU0R0a25Z?=
 =?utf-8?B?amcyMlFLV1dNVGowRlB5VGFBbjBIS2NvQTA2NWR2K2s2TjhlQXFUSWpQbzht?=
 =?utf-8?B?a3l4eWgyT1hCbnhsMUtwSEVOTWtBeDl0a1YyaW1BcDkrVGQ4Z3FXY0MrMzVh?=
 =?utf-8?B?cVpUTmJuOGZoWkFzRzFtbDRtbWVtT24vQmtuWllVYVI1cGpWdmhGZHpGMzRp?=
 =?utf-8?B?TUlOWGdvQVNqcmtuU09rR2VOa285UHBlMXRjY1MzOHFheWJqNDdrZTc4VWl1?=
 =?utf-8?B?ZTc5UUZ5Ri9CM1RENU9mdHBidWlrdStUbmlUUWFrT0RYWVRxUXp1blNBZW1w?=
 =?utf-8?B?NjB4UWkwRlIxY3ZLZGtOM2VsY1lMdm5RekxEZVVRWnNQengxcFRjL1R3dlBR?=
 =?utf-8?B?RFQ1MGdDVnYyY2VaUVVWSGtCdHRkcTFzQUZqdjdxNmczaHhGRk4vai92VnV1?=
 =?utf-8?B?OUVBMmNZNEF1Y0ZoeGNNTXY0UEdjM0V5RytGSXluSzVhQVFxWmR1SFZRZkMy?=
 =?utf-8?B?LytWWEFKT0kreDFxU0ZqWmkyeURJVXFrdkJRUUxtZmFiTTZUSTZUaFIvTUpi?=
 =?utf-8?B?azlER2lULzZXNnYxMCtoWTkwajNoaVphSWVPaHZzVmFldUFhTGYzMTJKWEp2?=
 =?utf-8?B?aERzL0FOQUxCdlpFUk1VeWRsaFhaOEZETUZMTGlHMDVvTFprSnhFZUpTSkdh?=
 =?utf-8?B?S0RRQUdOcVc5ZmJXMTNzUzRvTHZFd3JneWdJeUlPOEFuMzdTa0VSVHNhS0Yy?=
 =?utf-8?B?bGNuOGduNm1Ca0xMenRrWjN1bElIR2c1QnN6S2JKQk1mNi9XU1RkWkJTWEVm?=
 =?utf-8?B?cURyYWZMM2hqMFB2TXFBbStWdG5MQ0ttZ0xONG1IVkJiQStjNUpzVERkR1FT?=
 =?utf-8?B?czVBZy9Jam9SZmNEU3J4VEZ0R2o4dVd0SnlwK09HRGE3T1RWclNwdkxGSTVM?=
 =?utf-8?B?TE5Xd2xVVitRYlh5M2Q3bE00NTMvdGhwTFNjc2tYdExDN3NOMXZGdFpjMGpC?=
 =?utf-8?B?VnlFaU8zMnhJZ1ZiaEdEaWNrWlF3eEM5NXI4Z1lRVU10TjdFU2owaktmaTFz?=
 =?utf-8?B?MXFJSWJ2eS9YOGtBQzhqK0tBOVhlcnRyakFHMEZBcW91aGhQVWQ4SGQ1eFdZ?=
 =?utf-8?B?ZWgwWHdxVXBtT1ZMeEZBYnpETTllV1dGNTRQTXpNSlo3Q0wrL2I0amNHOHZt?=
 =?utf-8?B?MEZVWEk1MndkeGZSVlVORkJoNWdSWkVPcUxIUWxFajhsK0c1RmlVYWdOd3pF?=
 =?utf-8?B?YTlVcnZFSE1DNXgzV240NlZ2RWxRL0xQQzliQisrbDc5anRlWkJCMkpzM0I1?=
 =?utf-8?B?NU5na0RJdnBNc29YT0FwNTloeGdsT3d2YjIyclNWLzdKRlhrLzE1YytvWEFn?=
 =?utf-8?B?QUJ4bUNyUjZLbWJoY3lORm9lcTVhVTFTU1BZVmVHakRST0Z1OVpLZmRQQmFs?=
 =?utf-8?B?QTlrbzRIWDlYbkNNZC9MTG9VVDFqTlJZeHl2WE5hZHhHUVRMRUdPTEFSVzVD?=
 =?utf-8?B?bXdKOUR0MVk5VUQwQmM1THdmZnh2R2MrSmlYNHF1MGY3SG5mSFhXcXdIQUZt?=
 =?utf-8?B?UnhyNFYyWWlKMW5MM1Rqb1hQZHg1K0xiNlVzeWlHT2lBWVVkallHQ25pSHNr?=
 =?utf-8?Q?oKNc4ZLXaLjqMeJx0mKq0dmncjLFA+LT+u9I+AY9pUQA?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa046ebf-6ff4-4267-f171-08de205de582
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2025 13:34:38.9172 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nXXmXF7SlvSxApSAY5wzLeQtIx6Gqv1Cjc1v8G/hJpToq6tAbO6xG2Btl8FJ5uYh4BhCuTHxgKWg+02RzBYPJQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7784
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

From: Alistair Popple <apopple@nvidia.com>

The GSP requires some pieces of metadata to boot. These are passed in a
struct which the GSP transfers via DMA. Create this struct and get a
handle to it for future use when booting the GSP.

Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Alistair Popple <apopple@nvidia.com>
---
 drivers/gpu/nova-core/fb.rs                       |  1 -
 drivers/gpu/nova-core/firmware/gsp.rs             |  3 +-
 drivers/gpu/nova-core/firmware/riscv.rs           |  6 +--
 drivers/gpu/nova-core/gsp/boot.rs                 |  7 +++
 drivers/gpu/nova-core/gsp/fw.rs                   | 61 ++++++++++++++++++++++-
 drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs |  2 +
 6 files changed, 73 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/nova-core/fb.rs b/drivers/gpu/nova-core/fb.rs
index 156d9bf1f191..3c9cf151786c 100644
--- a/drivers/gpu/nova-core/fb.rs
+++ b/drivers/gpu/nova-core/fb.rs
@@ -98,7 +98,6 @@ pub(crate) fn unregister(&self, bar: &Bar0) {
 ///
 /// Contains ranges of GPU memory reserved for a given purpose during the GSP boot process.
 #[derive(Debug)]
-#[expect(dead_code)]
 pub(crate) struct FbLayout {
     /// Range of the framebuffer. Starts at `0`.
     pub(crate) fb: Range<u64>,
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 471ace238f62..0549805282ab 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -145,7 +145,7 @@ pub(crate) struct GspFirmware {
     /// Size in bytes of the firmware contained in [`Self::fw`].
     pub(crate) size: usize,
     /// Device-mapped GSP signatures matching the GPU's [`Chipset`].
-    signatures: DmaObject,
+    pub(crate) signatures: DmaObject,
     /// GSP bootloader, verifies the GSP firmware before loading and running it.
     pub(crate) bootloader: RiscvFirmware,
 }
@@ -231,7 +231,6 @@ pub(crate) fn new<'a, 'b>(
         }))
     }
 
-    #[expect(unused)]
     /// Returns the DMA handle of the radix3 level 0 page table.
     pub(crate) fn radix3_dma_handle(&self) -> DmaAddress {
         self.level0.dma_handle()
diff --git a/drivers/gpu/nova-core/firmware/riscv.rs b/drivers/gpu/nova-core/firmware/riscv.rs
index 3838fab8f1c0..7d82fb9876e8 100644
--- a/drivers/gpu/nova-core/firmware/riscv.rs
+++ b/drivers/gpu/nova-core/firmware/riscv.rs
@@ -60,11 +60,11 @@ fn new(bin_fw: &BinFirmware<'_>) -> Result<Self> {
 #[expect(unused)]
 pub(crate) struct RiscvFirmware {
     /// Offset at which the code starts in the firmware image.
-    code_offset: u32,
+    pub(crate) code_offset: u32,
     /// Offset at which the data starts in the firmware image.
-    data_offset: u32,
+    pub(crate) data_offset: u32,
     /// Offset at which the manifest starts in the firmware image.
-    manifest_offset: u32,
+    pub(crate) manifest_offset: u32,
     /// Application version.
     app_version: u32,
     /// Device-mapped firmware image.
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 979d3391e58c..5ea53250bf37 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -2,6 +2,8 @@
 
 use kernel::{
     device,
+    dma::CoherentAllocation,
+    dma_write,
     pci,
     prelude::*, //
 };
@@ -27,6 +29,7 @@
         FIRMWARE_VERSION, //
     },
     gpu::Chipset,
+    gsp::GspFwWprMeta,
     regs,
     vbios::Vbios,
 };
@@ -146,6 +149,10 @@ pub(crate) fn boot(
             bar,
         )?;
 
+        let wpr_meta =
+            CoherentAllocation::<GspFwWprMeta>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
+        dma_write!(wpr_meta[0] = GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
+
         Ok(())
     }
 }
diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index 458b5610061f..a6ee52475bdb 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -13,7 +13,10 @@
         Alignable,
         Alignment, //
     },
-    sizes::SZ_1M,
+    sizes::{
+        SZ_128K,
+        SZ_1M, //
+    },
     transmute::{
         AsBytes,
         FromBytes, //
@@ -21,6 +24,8 @@
 };
 
 use crate::{
+    fb::FbLayout,
+    firmware::gsp::GspFirmware,
     gpu::Chipset,
     num::{
         self,
@@ -122,6 +127,60 @@ pub(crate) fn wpr_heap_size(&self, chipset: Chipset, fb_size: u64) -> u64 {
 #[repr(transparent)]
 pub(crate) struct GspFwWprMeta(bindings::GspFwWprMeta);
 
+// SAFETY: Padding is explicit and does not contain uninitialized data.
+unsafe impl AsBytes for GspFwWprMeta {}
+
+// SAFETY: This struct only contains integer types for which all bit patterns
+// are valid.
+unsafe impl FromBytes for GspFwWprMeta {}
+
+type GspFwWprMetaBootResumeInfo = r570_144::GspFwWprMeta__bindgen_ty_1;
+type GspFwWprMetaBootInfo = r570_144::GspFwWprMeta__bindgen_ty_1__bindgen_ty_1;
+
+impl GspFwWprMeta {
+    /// Fill in and return a `GspFwWprMeta` suitable for booting `gsp_firmware` using the
+    /// `fb_layout` layout.
+    pub(crate) fn new(gsp_firmware: &GspFirmware, fb_layout: &FbLayout) -> Self {
+        Self(bindings::GspFwWprMeta {
+            // CAST: we want to store the bits of `GSP_FW_WPR_META_MAGIC` unmodified.
+            magic: r570_144::GSP_FW_WPR_META_MAGIC as u64,
+            revision: u64::from(r570_144::GSP_FW_WPR_META_REVISION),
+            sysmemAddrOfRadix3Elf: gsp_firmware.radix3_dma_handle(),
+            sizeOfRadix3Elf: u64::from_safe_cast(gsp_firmware.size),
+            sysmemAddrOfBootloader: gsp_firmware.bootloader.ucode.dma_handle(),
+            sizeOfBootloader: u64::from_safe_cast(gsp_firmware.bootloader.ucode.size()),
+            bootloaderCodeOffset: u64::from(gsp_firmware.bootloader.code_offset),
+            bootloaderDataOffset: u64::from(gsp_firmware.bootloader.data_offset),
+            bootloaderManifestOffset: u64::from(gsp_firmware.bootloader.manifest_offset),
+            __bindgen_anon_1: GspFwWprMetaBootResumeInfo {
+                __bindgen_anon_1: GspFwWprMetaBootInfo {
+                    sysmemAddrOfSignature: gsp_firmware.signatures.dma_handle(),
+                    sizeOfSignature: u64::from_safe_cast(gsp_firmware.signatures.size()),
+                },
+            },
+            gspFwRsvdStart: fb_layout.heap.start,
+            nonWprHeapOffset: fb_layout.heap.start,
+            nonWprHeapSize: fb_layout.heap.end - fb_layout.heap.start,
+            gspFwWprStart: fb_layout.wpr2.start,
+            gspFwHeapOffset: fb_layout.wpr2_heap.start,
+            gspFwHeapSize: fb_layout.wpr2_heap.end - fb_layout.wpr2_heap.start,
+            gspFwOffset: fb_layout.elf.start,
+            bootBinOffset: fb_layout.boot.start,
+            frtsOffset: fb_layout.frts.start,
+            frtsSize: fb_layout.frts.end - fb_layout.frts.start,
+            gspFwWprEnd: fb_layout
+                .vga_workspace
+                .start
+                .align_down(Alignment::new::<SZ_128K>()),
+            gspFwHeapVfPartitionCount: fb_layout.vf_partition_count,
+            fbSize: fb_layout.fb.end - fb_layout.fb.start,
+            vgaWorkspaceOffset: fb_layout.vga_workspace.start,
+            vgaWorkspaceSize: fb_layout.vga_workspace.end - fb_layout.vga_workspace.start,
+            ..Default::default()
+        })
+    }
+}
+
 /// Struct containing the arguments required to pass a memory buffer to the GSP
 /// for use during initialisation.
 ///
diff --git a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
index 6a14cc324391..392b25dc6991 100644
--- a/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
+++ b/drivers/gpu/nova-core/gsp/fw/r570_144/bindings.rs
@@ -9,6 +9,8 @@
 pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS2_MAX_MB: u32 = 256;
 pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MIN_MB: u32 = 88;
 pub const GSP_FW_HEAP_SIZE_OVERRIDE_LIBOS3_BAREMETAL_MAX_MB: u32 = 280;
+pub const GSP_FW_WPR_META_REVISION: u32 = 1;
+pub const GSP_FW_WPR_META_MAGIC: i64 = -2577556379034558285;
 pub type __u8 = ffi::c_uchar;
 pub type __u16 = ffi::c_ushort;
 pub type __u32 = ffi::c_uint;

-- 
2.51.2

