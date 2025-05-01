Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07E6DAA5F9E
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 16:08:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ABD3D10E85B;
	Thu,  1 May 2025 14:07:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ctTGqCEn";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2050.outbound.protection.outlook.com [40.107.92.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7A5D10E85B;
 Thu,  1 May 2025 14:07:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qAkIG3Ukb+kWJRlIAfO9Zsx99AhN0KuGnHiALerzKRjh3zz3Eh7pPiR/KzbsK9xgIKYkkwPx7DdAKwiD2WbZIX13QLtZiQ/H8LCCEt9vfIx70c7UREuhxR/eOjaRhglo/60/myVFOzXcch65V6wV8WJ2sOG22JIAIxLnE3UBILWBiQe3dUzjnfTVs5FdbJWIgIhRGPoHnbyUbaJNBB1wPrJst+Jf7R4ildFbh5ux1TnH2H9spf13jLN/iNefCm9gtPdEXmfN+4dIlurBPq/r5w6LNhvF5WdBIU4xMWACCfgyGFQ2RseZF31OuHaQsIB9aIEiKmwYNa01m07zUqxUFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O1pwyLgKF4Sbfk7PGv9h7mqW0z9D/zYKrWuxn563pWc=;
 b=M8v7oUDHUJVGy6iFQ2UeP0ReDo8PQj7XsKexP1+w0xJucCTWfoxEZw3FuFIc6R50cpho4rUg6v4MuAluVuDD9sen2HKFTRir6gdj5RECvSy8bvYGfDSGRCIY7rKg9YiDAP3s/CEKACmu3sGKOK7Dy0S++EDLbJHlK+vOsHDPjcIgWlXg1XRbG/kQxE2Z3x5TXcOc2Vsbyiu6DTUl3sBnvZ6J82uD4kIuO75YfkC7PhBC3pak3Y7wXMSiv1EXqP4J5u67uQ4IXKmgw+qo2eWTzmJVpK4Fb95b/07+YqEatoK0Yf1Vj1dpJc5/crl4MR/pMPND5hlvVi3LZOXyQQjbLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O1pwyLgKF4Sbfk7PGv9h7mqW0z9D/zYKrWuxn563pWc=;
 b=ctTGqCEnq3Rpr6YcgsWWdcZbvG0SiwOG4/BLOd+cybvdX9iQKSWsKC3EIKgPuwSL1s0VpML+B+AVqx+dJ0kumQdJ/Jz2oQLlNZYT+HnRLXN9NZNun3cgLbFAgRGWl32Rx/hGQR+f78wXccYONQ4IrUFjqkeXFjfFEUjuvy+R8rXJYETsBdhRhIenCscvHkNkscejtK5gYLgh/7OS5VERbzPOM+Lqdw3E0UEhsf4c+dgJNDX6wRYvdRPL8kLmSDTdatGJdNPYn6NsgdZ6XTfWWvaXbDBHghzqVm3H/LFo9ZGqigz/iroflLO3Q7jn7LWEjjFV92VOn+i4tlbw4EFYng==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS7PR12MB5862.namprd12.prod.outlook.com (2603:10b6:8:79::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.19; Thu, 1 May 2025 14:07:28 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8699.012; Thu, 1 May 2025
 14:07:28 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 01 May 2025 23:07:25 +0900
Message-Id: <D9KVS9Y14F7Y.2ZE3NDGDKD0LO@nvidia.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <benno.lossin@proton.me>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "Jonathan Corbet"
 <corbet@lwn.net>, "John Hubbard" <jhubbard@nvidia.com>, "Ben Skeggs"
 <bskeggs@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 <dri-devel@lists.freedesktop.org>
Subject: Re: [PATCH 11/16] gpu: nova-core: add falcon register definitions
 and base code
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Joel Fernandes" <joelagnelf@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
 <20250420-nova-frts-v1-11-ecd1cca23963@nvidia.com>
 <aAerWF9j5d01pQv0@cassiopeiae> <D9K09AU4KTQJ.3TVVZPMDB0H7I@nvidia.com>
 <9977ad2e-ce2d-48b5-a222-f74a821abfeb@nvidia.com> <aBJo9qNDn8xDEwlk@pollux>
 <D9KDYOVU0EG3.2TA8UJHMW66Q6@nvidia.com>
 <8cd32991-cb4e-4c07-98b0-ab73c2039250@nvidia.com>
In-Reply-To: <8cd32991-cb4e-4c07-98b0-ab73c2039250@nvidia.com>
X-ClientProxiedBy: TYWPR01CA0027.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS7PR12MB5862:EE_
X-MS-Office365-Filtering-Correlation-Id: 838099f6-35f6-42e8-9fd5-08dd88b98184
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|7416014|376014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Sm9kSUJ1NWdmcHUrTHoxZERRYXZBbkVwUTNvK25NODZ6aTA3ZEVOQUVWR044?=
 =?utf-8?B?dERRUFB0bDAwZWlMVmRLNWFJRFFkODU5VnM5YzM3eDI0R2dQRGpWZmU1TzU5?=
 =?utf-8?B?TmpDeDhDZmdzUUpleC96K2s3THhRMStUR2pxSmJQNk5RZUxlNnMreXQzY2pQ?=
 =?utf-8?B?eWVZR1luTi92VG5qMEMvM3YrUzhNd25CSlRkZEMxbzkyaTMxZlRqamFUUnEv?=
 =?utf-8?B?cys4dDRwKzQwZTR6Qy9XbnJKM1FFODNCU3VSM1BoeUdIWkdqSytua1FPVHdO?=
 =?utf-8?B?Y293Vyt0Tk9kY3Bxd21YQmpsV0h4dlA5MUxScmQreVh3OTl0dE4rSTNwb0NR?=
 =?utf-8?B?dy9lWVFJaXM5dVdkVEVQZ3JaZlVuKysxMEp6cm5nMXpRWUFBWGtGSW5OaXdH?=
 =?utf-8?B?V2pRalpZT2JPWE9Fa3BlMklSQ3JxcHRxbVc3M2ZubzkwR2xQTnVXcEp1NjNQ?=
 =?utf-8?B?S1hVVkNJQ2hzSTRnNHlKeVhhR0dyVHBVTmZldE5yWDdhVHdEYkEwOXR1c3Z3?=
 =?utf-8?B?ZVk1WE5KVXI1NXJtWWt5MGNYaDVwYkhkNDRId3FCalJxUTZLMGtiU3ZFY2Rk?=
 =?utf-8?B?SXUzb3RuZXRRNTdCaDcvaWZrcVc4cTh6YTkyNVgrVC93TURKcHNnRHMrZHNT?=
 =?utf-8?B?K0dVRVFjQVV6SWxBUDk4Ly9nOUUxdXZoYVVEUWk1UmRKLzJienZETUdTNVBB?=
 =?utf-8?B?a2NVMjRFUTVscVlnUG9LUG1CRkt2Nm8rZCsxdldUQ3pZUTkvcFRtdEJmTmF1?=
 =?utf-8?B?eGJXN0NXWitQSnRhbWl4M0JRaUZsdWVSNFNTNVQ1amhXY1JPcVVTencvWkY2?=
 =?utf-8?B?VmhJaHd5V2dUQVVFaHdJbWtnbkhWSWx2Uldwa2l0M0lkTkEzWUFYR2FMUXA4?=
 =?utf-8?B?bGpaZSt2dkdUTWUya1RMS3BBYWRIUUE5MkhnaUxLTlo4MVNLTVlmTkRxbEpy?=
 =?utf-8?B?SXdwVlErNFFHOG1Pdlh4QWlkMTl3VDMxMzN3YXltU0pGQUtUckJhQzZReW1V?=
 =?utf-8?B?aVNHbW02VVZlV01YRElqZ3p6b0VhUjVCOWRsUThodFROcmlQMDVSRVpQcjZl?=
 =?utf-8?B?ZkVZYzBtTzlZSFNOR1lNcUhIdU53UXVTWnB3VUMxa2I5Y0FJcE9pUWZHSnpJ?=
 =?utf-8?B?aHZxOWRRTHkrV1VmNzJwNUZFV1VHMmR6UDZuTDQ5TGNRbllRbTVaanhYOCt2?=
 =?utf-8?B?K1IwZThBNUdscEhHeXlkM1V6MnFLVWludUxyVGJkOXJLLzdtaU5VanIwbzky?=
 =?utf-8?B?MnFJMGVCaytGWDh3VW0zZm1LczRuczNIMm1xSzUxR3UwUFJxZkdPT09WODRs?=
 =?utf-8?B?VkRrSkp6bmdrMXN4c3ZEekkzVnZ2RzRxY0JlWnZxYktLRGNLVlkyUzBXQ0R2?=
 =?utf-8?B?STFLRFZiU3dTblBYU3R6d2thR1VnRW8vRGVQRGdiWThKQWJTWUZKc011eGNU?=
 =?utf-8?B?Mk1tOWxXZ3lHejZwL0pvdlQrRUFXZS96UythMlhIekdTMVhEaEpxMTQ3VTln?=
 =?utf-8?B?aEllNHpIUjI0WG0yVUx5UkdhNVVZdGF5Zy9BMUxTL3dXNDBJSmVDeHdRNXNI?=
 =?utf-8?B?bzJFUkpGcW45TklrN2FmNi9FbWQ1U2tDaVdvRi83SVRGQWwyS1JFbVQ1TkJa?=
 =?utf-8?B?V21leFE0MXFLRHBlenVGWlhvT3gzR25KMXFwK2ljcG8raTNJZWhseWtGZzdx?=
 =?utf-8?B?VEcvaFJkZkRKVGlwbGNNbUM5VmxrditweFc3eEtiMGg0MWMwMjRoZ1dLMGh0?=
 =?utf-8?B?Z01rbVJZT2pjTWh3Zm83TDRac2FGZTJhbXM3STBoV1BnSllyV2tzcGJRTjNX?=
 =?utf-8?B?dndrS1dzeXhsQmJ2b1dsZXkwUUlmWHVWLzFQb3QwNXNDUllSRTVOdTRlRjNa?=
 =?utf-8?B?Y0ZzZWlLdjFFR0ZKOUdXenhQb3E4aFNRaXVrNVF2WVU3am03S0tiSUEvSFFy?=
 =?utf-8?Q?X6jCM5qqm5E=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(7416014)(376014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFE0b3ROTlVEaGFaNzNDZzNLeVVTdnBBbEdVSVpXUzFlRUpHQ3F0TWFTMFlY?=
 =?utf-8?B?Z0VnSS9UaC9HTzZNeVQ3RWtneXAvYjhFdXorMEtrRG9mNWxpcTByd01qMk53?=
 =?utf-8?B?Q1NTRHJwQXZzYlE1cmRjNUtERktWN1ByTUk5WmFrSXpXY0tPcTVrNnd6T2Z5?=
 =?utf-8?B?TXJBbjM4RlF5Rzg2OHJtNmpoN0VOclZ6T3hrdkF2TkVJOU8vdW5DenVMN0VY?=
 =?utf-8?B?aDNiQ1hjSk01VGtKbzhHcGROeUF6aTEvaEkwYTkweFo1Ukg2cENwbGRHYlV0?=
 =?utf-8?B?cVBYRVd2LzFjSURIQUFCNjVpTS9MNGwvOUsweGJQSVBKWXpoT2NkYVU2TWth?=
 =?utf-8?B?bWg1U21JaFJEdzZDUGJFUFdZSkRkUWlBS2N1M1hwdzcvdys4aXcxWlI4SXpk?=
 =?utf-8?B?NTJ5Z1E0NTRsUEVReklHcENaWHBVZXB4cWZmcCtrZUpUbFdHemxUbDdlYmdT?=
 =?utf-8?B?cjFRZHk1TWRybmp3eHRnNnZJaEJpOWVLN3JBN0J1YWo0c0NvcVF5Ly95MXY3?=
 =?utf-8?B?UDlXMTJBdVF5aTJXc3Q2aTl4L29sWk9sWHVBamhuL2NDYTd2ZUF1Ky9GNzF0?=
 =?utf-8?B?NGE4ZjFWb0gxa0RORStZa3lrUXEycy9zdkpkNkxHdlNXemVlUWZVZXhORmcw?=
 =?utf-8?B?dFFaM1hPWlJoV0IweitEMWw4ZXNCWkNpT3F5UmRscjQrZEZ5emt5aVhhYjVB?=
 =?utf-8?B?ZlNIbDFuZ0NJUTRWNzFPcEQ1aVNRYXA0M0JUWTZaYU9FMVJMcktxVENONExs?=
 =?utf-8?B?L0xaalN0M0NJZlloTXZDaXlqSGtYeDVVVWhRbGdoeFFuU2greE9wVFRHUHBK?=
 =?utf-8?B?N1lZQ1VRZWV0TU84WTlQUnhCVm0vU1RpblREYU5FeUkrSHJQaXVLR01rZjRJ?=
 =?utf-8?B?NlpQU29nRnZXeXI4a3djd0xzbjdqRDcyajJscWUzMFhrSmxpSU05TmRUTHNt?=
 =?utf-8?B?aUwxam5VL2l5SkhjTGRVMjJ5aHUzZWNucnZUYXpPZmRMcW5yRVhPaVJiSDZH?=
 =?utf-8?B?Q1RWSFJnYk5RYnFodFRjS2xScDNuMnlKcGwwUG1pUnFLNjkzVXk5WThUVEcv?=
 =?utf-8?B?R1JNK0oxRlRvSHk5RGdTVVk0NEdyYVZuT01oZTBMQnpVaVpiM0NsNkZGYzFk?=
 =?utf-8?B?enA2TmgveU9LcnZVWUhkY2Vxc0FUckJSV0xNYnlNenJ5ejEwNS9sbVdIaHNV?=
 =?utf-8?B?NjFHZk03TzNLdUZtN1NTKzBTYWVxK3BOY2I1cWJ2MGd2Z2lZd3JlWWtpM1Zy?=
 =?utf-8?B?WFprRUJERjZrTFIwV24yUkcyUHJid0RqdWhMTzBmN0VFZ3p3YVVCNEYzdDRW?=
 =?utf-8?B?YzRSbjlOK3RGM0Z6ckZmVTJsR2IreTgycVIzd3ZaWVlTN2dxNjZOeWRHQ2NF?=
 =?utf-8?B?d1QzVjAwVXpva3lJR0dTcS8rbkR5MkRqa2NpZEFQc282ZmVtbEJpSjFnZkR0?=
 =?utf-8?B?ME5Xak11aWZpSTU3VFV0d0FvdGVGaS9XRXdFWmpERnBDRmw5aGQxUFE2MVps?=
 =?utf-8?B?bnBrMUJrelJSeTBMU1k4K080T2hhVXAycTVROVh2L3FIQzFUSnpVZVZaQzI5?=
 =?utf-8?B?MDNveUZEZlhreUQwMDhyZ2JLalplUXVGUFVpU1l3YUVqenFKTTEyekdQbG5X?=
 =?utf-8?B?NnFDSzUrbW9rYzdKL0J1SjJyL044RjQzS2tHa1FXWFNNVVZYa2FhUUdXTnhJ?=
 =?utf-8?B?NEhwNVIvVDJvb2QwZER4N2hnNFhhRFVOOTBjcHBZYTgrTmRocHg1TEVEU1la?=
 =?utf-8?B?ZnQvR3gwT0hyOGExODFLU1VySUJLUEJZU1BtUmpVMmNSTFpHcWNPSTVzbHlN?=
 =?utf-8?B?RWtNMVdnOE92TVhwRDlxZEh0MTNKTlJFQUhCejVvcVAyM1hUOUdXMWswYXpR?=
 =?utf-8?B?Q3dsSGt0SUVlUVRkc1dCMHl3Ymc5bDFKWG5PbjVoWDRsdW9tSmpVdXdvK2Jl?=
 =?utf-8?B?R0xMZllnNVZLY1BTMUJwM09XQWxxUUN6OU1YOUxZaURCZzc4S0NVcm9ENVh0?=
 =?utf-8?B?V2dJZVRzS0RINzduRnVpUWRTYVZzb1dLMURxdnEvamljVjhWU0k5TjhrUlcy?=
 =?utf-8?B?RGNVYU9NU3dQNGZjOUxQRmhUSWpGRWtVM2ZvRSsyTFFtUTNpOVgzNzl6aHkz?=
 =?utf-8?B?MmRMcWg3RE9Cclhnd1dqNkZuRnByWlhsUU54SllQc2ZiVjJ4cHRwWFpUS1Y4?=
 =?utf-8?Q?6FFxIOC8f/tcrcit1rQbhNpZQeiDl4Zhe5M3KG7xHaVH?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 838099f6-35f6-42e8-9fd5-08dd88b98184
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 May 2025 14:07:28.1876 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OITRMAyOb6j4qOUkXLLdJV7i7DeV6jWduD9CodiDMyjEvrfgVvYyFJzQPscYoIJBazaUkvPZMItiAhy5VyXKbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5862
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

On Thu May 1, 2025 at 9:22 AM JST, Joel Fernandes wrote:
> Hi Alex,
>
> On 4/30/2025 8:09 PM, Alexandre Courbot wrote:
>>>> I am just not seeing the benefits of not using dyn for
>>>> this use case and only drawbacks. IMHO, we should try to not be doing =
the
>>>> compiler's job.
>>>>
>>>> Maybe the only benefit is you don't need an Arc or Kbox wrapper?
>>> That's not a huge concern for me, it's only one single allocation per E=
ngine,
>>> correct?
>> Correct. Note that for other engines we will be able to store the HALs a=
s
>> static singletons instead of building them on the heap like I am
>> currently doing. The reason for doing this on falcon is that the
>> dual-dimension of the instances makes it more complex to build and look
>> them up.
>>=20
>> ... or maybe I could just use a macro? Let me try that and see whether
>> it works.
>
> Do you mean a macro for create_falcon_hal which adds an entry to this?
>
>  let hal =3D match chipset {
>     Chipset::GA102 | Chipset::GA103 | Chipset::GA104 | Chipset::GA106
> |Chipset::GA107 =3D> { .. }
>
>
> Actually it would be nice if a single macro defined both a chipset and cr=
eated
> the hal together in the above list, that way the definition of a "chipset=
" is in
> a singe place. Kind of like what I did in the vbios patch for various Bio=
sImage.
> But not sure how easy it is to do for Falcon.
>
> Or perhaps you meant a macro that statically allocates the Engine + HAL
> combination, and avoids need for Arc/KBox and their corresponding allocat=
ions?

I was thinking of a macro to create all the Chipset * Engine static
instances of HALs, and generate the body of a lookup function to return
the right one for a given Chipset at runtime.

But trying to write it, I realized it wasn't as easy as I thought since
generics cannot be used as macro parameters - i.e. if you have=20
<E: Engine> as a generic and pass `E` to the macro, it will see... `E`
and not whatever was bound to `E` when the code is monomorphized (macros
are expanded before generics it seems).

A solution to that would involve new traits and a bunch of boilerplate,
which I have decided is not worth the trouble to save one 8-bytes object
on the heap per falcon instance. :) I'll keep things as they currently
are for now.
