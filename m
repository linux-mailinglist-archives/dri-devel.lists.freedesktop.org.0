Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wKMdFZ1Si2kMUAAAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 16:45:33 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 960C511CB0E
	for <lists+dri-devel@lfdr.de>; Tue, 10 Feb 2026 16:45:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 616E310E11B;
	Tue, 10 Feb 2026 15:45:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="pf3W83R3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010018.outbound.protection.outlook.com
 [52.101.193.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6128910E11B
 for <dri-devel@lists.freedesktop.org>; Tue, 10 Feb 2026 15:45:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bnfLsbreIjS2duRPdvgDCGn2nFojEm4zteptD4UsEzJrP3I4zGRGpkjNWNR3WMtSQ9pAcNZ9ijNuc4r4ub1BlhLpb8rZBrCmgNXySkb2/Ukf30XK2bPIw0nrl8RaTaK/IidY9PZ1JKEE01dsYE76Ae7r5eFaaQ7oSp1pev3Pt9o2nnkLeF+iuBYp5PRW6TU6Fqzc9KQiddDQ3AarDRVfblPkAF2S5RZQdVSGyrnHCRIxUWW4bmDv8qa70OvemGiAjo5gTGctQCVUBvfFsBlmbta0fELLIKj8KsSshV/DJNgcjka+ciDxAryXt9v/ITHTbIVICDfYY/AbRa40ZN8JfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PWZDKAWUXv8EIjMd/ekW0zPNVmrdTvdQMt63VXv8/qw=;
 b=XSrdyplcxxFhhlooXiWqGyy8sfxS+bl9RMJdBKR5BcsbQmwEFNZIFF1Ds8JPn9iblMIwhYspdwbpmb1vILkyrewX5VRfdM0Szhku68TGcWQB8azrMDHKgFN3QQ4luyYTQnwKhv56zJszuTnMMbPkN72XZUcyuWzH6RlrrZeBQajRGRAUumZ1hYoePYhK8+Mh/muxJg9tgX/6AC2/cgikFXVpqF5U4RdpKJq3/RDymyZcjCasf9KFboE1mycyvt4m4kZ1BHQohf89i0E7w3N79/EsXy0Cc67/7Q4QRCGKXY0ueQfz++NCBCnUlgh8Jnoku4dDxsXsFqEu7iXLwGeu1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PWZDKAWUXv8EIjMd/ekW0zPNVmrdTvdQMt63VXv8/qw=;
 b=pf3W83R3J6rna+dSw63zJe4mEs0w7hDJrP/EU4qcr973GdR1mNBsrqSh1QNvxsgNPyIid0nip/9Pd52NU8vDSYI+15d1FuCeuHN7+788m8pVMO7LZJVMl+u0UFPYXKP5mLfUARB1Jis0JE6P0FllLlt5QIE0647FeS2+fo8+BFY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB6698.namprd12.prod.outlook.com (2603:10b6:510:1cd::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9587.15; Tue, 10 Feb
 2026 15:45:19 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::ce69:cfae:774d:a65c%5]) with mapi id 15.20.9611.006; Tue, 10 Feb 2026
 15:45:19 +0000
Message-ID: <d9e00d8c-93c0-45f8-95f2-3235fb781e7a@amd.com>
Date: Tue, 10 Feb 2026 16:45:14 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 2/4] rust: sync: Add dma_fence abstractions
To: Alice Ryhl <aliceryhl@google.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>,
 Philipp Stanner <phasta@mailbox.org>, phasta@kernel.org,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Gary Guo <gary@garyguo.net>,
 Benno Lossin <lossin@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
References: <20260209155843.725dcfe1@fedora>
 <c319c349-eb95-4c38-84fb-47440daefc3b@amd.com> <aYruaIxn8sMXVI0r@google.com>
 <20260210101525.7fb85f25@fedora> <aYsFKOVrsMQeAHoi@google.com>
 <20260210133617.0a4be958@fedora> <aYsvc3Q8h-Gg27-g@google.com>
 <20260210142631.6f8a3411@fedora> <aYs3VVH_UXMFa5oC@google.com>
 <f4c32d9a-7303-4a50-aafc-8039102fbd3e@amd.com> <aYtJznZcCEYBffil@google.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <aYtJznZcCEYBffil@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN1PR13CA0003.namprd13.prod.outlook.com
 (2603:10b6:408:e2::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH8PR12MB6698:EE_
X-MS-Office365-Filtering-Correlation-Id: 51393184-5abf-49ed-b6f9-08de68bb64d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|7053199007|7142099003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NndHYWVRbkNGL0EzcTdSSWNOZ01DSmhRcXErbmJzaXFYaFZsbHZXbHRVU2xM?=
 =?utf-8?B?bU53eVg0WmQ2d1Y1YjBLVEI2R3ZkcGNFbTNHVjNBV3NXa29HL01FL1VpT3By?=
 =?utf-8?B?VS9kbXdDVFVSZjlqa05VZ2UvbHFrclpZOUcxU1FsWlVRK0NhdXdJOHVUVzFv?=
 =?utf-8?B?K3N4UHpYSGY4dU5iTFNycFVpZDFTQU92dkxuTVdEbXdkc1JaY1pSNVBpZ3pp?=
 =?utf-8?B?K0Z0ZTNpcnRMSGJITEVBaWtFVC9ic3IwYWVtTUpGUHVXYmZ4VHh6bFZsMUFZ?=
 =?utf-8?B?bkltOTc4V3M5cXhXRmZ6Y0phTGJVYkc1TG43UzNMTmFJRWpJRGVHSElZbFV0?=
 =?utf-8?B?dEdoMHJicHNYUmVVWDVnZUh5enRhTjBESkVEMktNS0p3eGJXNVlpVGNmWWpP?=
 =?utf-8?B?QkhNcTZhbGFoaXBnVEdHVEVxWTNLMFVvZTM2RndvRW9STU9nbXNtM01PUnlN?=
 =?utf-8?B?b1pBV2pzQzVmNmwwRXlaUWNXMDlYVlp5WEtxbFpody9ka0RjaGd3Z3BubFl2?=
 =?utf-8?B?eEtEcFhKTHpGRzM0SGkwbHB4ekU3SWpDSnN3OVpudWRFRDZwaS9GeDMzdlZM?=
 =?utf-8?B?czAyMk8zbXE2U2VMR09SV2oxa3h0Z21PZzJGSWpLNHdXcC83Z2JncVZKSlJj?=
 =?utf-8?B?TWRIRVpWdUJrTHpNaXl1RnhST2llRmdnR0RFRjFSVEdQR29OeWN2V2EyN3Bq?=
 =?utf-8?B?VzJQaFVzK0dYdGprbHFTdjI5VVYzYlc1dlN6UmJiSnNYR2dMSTQzVk0ycXNI?=
 =?utf-8?B?Slh2MmRSYStYWXdLV1lEbEFQQzZTVFo2amdGcDNDUjZqbEF4c1plTm9GcW8x?=
 =?utf-8?B?d1UvR3E4YStHaW1TeWtSVXExdHpQRU5hZ3JSWEJ4R1l1dGpwSGV5bkNXU0Jt?=
 =?utf-8?B?M1daUkNKdVdTMWE3aVZHSXFrYmJpRXpCSFdYZURDNE5QT1RPQk9JeG5QSmNo?=
 =?utf-8?B?UmtvVG03YU8yUzVFemxsSG1BYmh1RlFnTEZWWk5xaVFsTTNFeDNGVTcwaXdG?=
 =?utf-8?B?TTJLL1l1RTRsOHNENjVxNkM2K2tTYXEyMG9BY0RiY3NRa2xQR25jdG9hdE8r?=
 =?utf-8?B?bmNZckVnL1ZtUVo4UzhtUTlNMTNDZ1R3RU9YSnBKNlJJUUFrekc3MGp4RTdG?=
 =?utf-8?B?UzZIUzRqNkRURXhJbi9xempZbi9LZzJROHdBNjQ3ZG5GNjdQMGcyNWc3YkZq?=
 =?utf-8?B?WDYxT0ErUzU3c1BFS3AxWUdsa3BMYnRxWkJIL0hGUVRKS2F0Q2k0alpNUXJC?=
 =?utf-8?B?dUgwbnBPYmM1d1ZHd2I2WFNBTDRyM0VlNUJxRExKU21Mamk3T25DMkgxQm9x?=
 =?utf-8?B?Z2h2aWpRMEVHMkp1c3pKRGxOay9IQTN6NGl3aXlZSTVJRUtCYVZwcEg4cWJN?=
 =?utf-8?B?OFdyUFNVS2swdUpDOWJhdFh1b3lGQ3RtUWxiR1JoQ2lNL0JkR2lPMzkzRjdT?=
 =?utf-8?B?ZjlNQU1UY0RHbnFRNkhmVGloa0JBTFdsaE9haFRpM2d5R0plcVBZRHBhLzRW?=
 =?utf-8?B?eVJrUVR0QjJ4SjB6ampqaWh6RE5TR2hFM00rYWNMSkhjUVdMVzVlZkFwUzVy?=
 =?utf-8?B?Y2JZTCtQcmFvWFVoVlJJcWNzeDdqVVdWdVhyVi9uSi9qNko1UC9JNGtqV0ov?=
 =?utf-8?B?TU85V0pNSWtGakREWitCcWNaQzJiMVpHTWlQS2ZKRmQybzF0T2d0bW9CNjJD?=
 =?utf-8?B?TUE4dW5oY2g0VkVSVWUrV0plUlZyNjdGMWJJSHhCZ0c0dENPVE9mbzdIUUwx?=
 =?utf-8?B?YTQvY20xbXVOcEl5cGFlRFJLNFUvbkx3VzlpSVU1OXlXcUN3ejFZb3JPTWts?=
 =?utf-8?B?alI4dmRoU3VzWHNVM0Ywc0w5WS9ZYXROcEl3dktVLy96dS84Mk1lMWlIK240?=
 =?utf-8?B?QmFFc0N5Z0pUNVh3MTBncFk4eVpBWlBSWTJUSFBWbzhqTzV5ODd6YTVPck9I?=
 =?utf-8?B?ME4wcjZOczUwNklxWEFYcDVDTXVMb09xcGFxRzdEdjFEME84anh2YzJmdkFx?=
 =?utf-8?B?SS9oREVkRmQ3dUlCTlBtNzdIRDYyZEtzV1NxTEZVUzlsZlVQWW05NWszOHlr?=
 =?utf-8?B?aUJUR245YnArbVlVZTVqcDdlYmlTL0pRMlJNUlFvQy9QdGpOcU1NNE5LaXpo?=
 =?utf-8?Q?LOjc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007)(7142099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUZXMjVCYkJsbm9hU1FhOENnWHl0WkUxeVJhWFZjZWQ5VnRzanZnK0dxc1Rz?=
 =?utf-8?B?Z1FNTlM1cS82Y0FLaFZEVkFUanh4ZUNVUzJqb3ZqVG5EVzBjbHREdHdjWkdr?=
 =?utf-8?B?WWJvbWpJM2F6RVczRy9WZDhOTkltZzBEU2xsSGQ3RHZLMktpYVBFckxHeExw?=
 =?utf-8?B?cUM4QTBld3E4VXBpZ0lRbG16bTc1TUF0MUdGa3FERFBpTFFkaG9RWEFNeGo0?=
 =?utf-8?B?SEZFNUp1dXQ4UVR0SjVpbWlUOFFzZHloQTI4UXRDK2k5ci9yK2lQOVFBOGVp?=
 =?utf-8?B?UmkrdVNtSmc1MUtmUU9CbDF2MHpJR3FFOXZZclJwRnVqaGlRVWVwK0h0L2NK?=
 =?utf-8?B?dWN1d1ZQQ2NBRDdHTFJ1RklBc2FMTVBFTmpQUzBid3dxS2IzTGZoMUFiZHdm?=
 =?utf-8?B?VURuZUU5TktYV2liS0UyWnBla25RazZqN2I1UnlLcFZOb1puY21NU2VqTisz?=
 =?utf-8?B?Y3kvWm93dEw2c1kvSlBJOWtnL0F6UTdSVEgxWE1MNHFlNVgranJwbHZ2ZUhx?=
 =?utf-8?B?ckh4UElGenhPSEVGdXNwQ2lEdVZTWXdwQWh0SllMaHhFN2NpSERib3J5ZFdx?=
 =?utf-8?B?cTIvbmhVZk9ONDJHWHl5di9NL1k4OTUxdUhpaDZ5dHZGSjh6MHRIVVM5ZXk0?=
 =?utf-8?B?alZGTmpKaWNJVitLd0FJMnJiUGZORm1hNW9abVRtdEtuUUZQNC9jZDVBTlpB?=
 =?utf-8?B?THBnNEV4dHBEaVNDUkZTR2hjZ2tEMUpJUkdhTFFwaDJIN0FvUXhXSU9IQVVM?=
 =?utf-8?B?YWYyME5JMTliZFNhODZMc0ZwY2xMemU1eklVUTlWNFFTTDBIZ1Y2Q21kTmlt?=
 =?utf-8?B?dElwZ3Q5R080b1FnWno4em5XVTZ2MlpRS2xlcVU2Rzh0QlBaMWZvamFQZkM4?=
 =?utf-8?B?MGtaUHk1RzZhTnl3NU1YU21ZT0ZSQXJiS1YyZkt6aTB3R0pUTEErbk5xR0o0?=
 =?utf-8?B?ekNWUU1nTXMzT2paWEdmYnZpVUh2bC9HVnNiUXBFNTBiWFN0b0FxeTVSSWVV?=
 =?utf-8?B?WUM0UWFOWlp1dUxkTkhoZGJLTkhPMkZSNGJndSsxMlZBTDA4UVIyV0xVTkFi?=
 =?utf-8?B?TWNPaWFWUlVMamRBc2V6WnRzTjdVVDRoMVI1WG1QYktyZUdqZ3FCMk5LVy83?=
 =?utf-8?B?di9EM1cwY3ZyQ3gyWVpObmhudHJwZ201cjJ2bHEvcy9EaHB1Uk11WmRKWENY?=
 =?utf-8?B?aUR0L1FMWnFzMDdrRjNTNUFKd0pVVjdoQWwzbklUMk9lZE1VSkgvdVdEM3Za?=
 =?utf-8?B?c2VPNGJPWXlKdUxDOE94L3JrK08rRlNXTkRLeHl2R1pwdjJsNnEwd0QyYmlh?=
 =?utf-8?B?bkdhaDFhYXA3TXk5ME5EUVRGaU5LY1JudC9RYU9MWk5pc085TG5RMHRGNkhv?=
 =?utf-8?B?dk56Ni9ySmUzR2tUWE9CVHZrVFpGa0pWZzkremhSYnl1QSsyQUt6U1pOVHFJ?=
 =?utf-8?B?STBCVDdsR2dyN2h2Rjk1VHpYZENOb2NEemZlQ1JrVXkyOUdka1plbXRUQ3la?=
 =?utf-8?B?bmwyUFA2WGF2WUFFb1FYUzBvWmlzczBya3NqcXNQNGtlOERUaEV1QnlkWEJ2?=
 =?utf-8?B?enU5QnVzaTNDcUVjbkdTdUVmbmdtOU5EbS9oSWJXNDloMDJDd0YrZ3hGaUxG?=
 =?utf-8?B?M3owZ2hhR0p2a0JaVzgrb3ZtMXJ3NTRCSTJOd0NPY29VblhYSjlhaVF3SEVC?=
 =?utf-8?B?Q1BINU9jRm1BTWJMaVR3UER4SEJBWERCTGV3cjVqekNZNnllTHFObzVMTXBv?=
 =?utf-8?B?eWV1L1B0M1ZPeXM5Z0l2enZjaGp4ZHpab3A4ZmJ0UE9KWnlyWnF1U3JwN09W?=
 =?utf-8?B?RnBRWEVoV0Y0N1hyb016TlZ4STZHTmFWNVQ3MUFvRmFtUjd0MmQ2YnQ0eUdh?=
 =?utf-8?B?bVI0SDV6VFhOalQxWTBlZFZzcE5vaWFpVDZjVkJwUlNjejArQ0E2NjBIbm1U?=
 =?utf-8?B?WEdlSERwbEo0c2dxclBUTWF4N3JUQzBpblB6eEs0aEU1SE5lNCthNmFRMWlx?=
 =?utf-8?B?Vzh4UHUweWUyUFpoRHFOTHBIeGkzRDNnRWVKNmdjUGQ2U1Bza1p4UjZqMko4?=
 =?utf-8?B?OFQ1MUZISk9oMENKMk1XTG1GWXFkRHlBamhBaDRzN2FIMXgvaGs4YUhFOFNG?=
 =?utf-8?B?SXc5MDFlTDlsMGhpeGJCekRFUlhVTmZPV0VubDRQeUlhWWZWdTJPVC9iTngz?=
 =?utf-8?B?YmpSZzJKTG1JTVRVTHdibGlHWWpVQWdzeWRKL0NKb1ZkcU1pUkhoSlY1UVdW?=
 =?utf-8?B?aG1aZjdyODVQa1hjVFZOS3FJbmptMHVHd1h5UXNrQTErMllkWFZiQzNNK2xQ?=
 =?utf-8?Q?HcVkfmX3bg3p65PGPB?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51393184-5abf-49ed-b6f9-08de68bb64d5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2026 15:45:19.6091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QcWx6RlpQzAbIE5zVO9uzy3I7OaE7BUluVcXJdd8A0By//EFiZ302jbVvmpF/wo8
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6698
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
X-Spamd-Result: default: False [-2.31 / 15.00];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector10001:i=1];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:aliceryhl@google.com,m:boris.brezillon@collabora.com,m:phasta@mailbox.org,m:phasta@kernel.org,m:dakr@kernel.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:gary@garyguo.net,m:lossin@kernel.org,m:daniel.almeida@collabora.com,m:joelagnelf@nvidia.com,m:linux-kernel@vger.kernel.org,m:rust-for-linux@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FORGED_SENDER(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FORWARDED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[amd.com:+];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[dri-devel@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[christian.koenig@amd.com,dri-devel-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[collabora.com,mailbox.org,kernel.org,gmail.com,ffwll.ch,garyguo.net,nvidia.com,vger.kernel.org,lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[dri-devel];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 960C511CB0E
X-Rspamd-Action: no action

On 2/10/26 16:07, Alice Ryhl wrote:
> On Tue, Feb 10, 2026 at 02:56:52PM +0100, Christian König wrote:
>> On 2/10/26 14:49, Alice Ryhl wrote:
>>> On Tue, Feb 10, 2026 at 02:26:31PM +0100, Boris Brezillon wrote:
>>>> On Tue, 10 Feb 2026 13:15:31 +0000
>>>> Alice Ryhl <aliceryhl@google.com> wrote:
>>>>
>>>>> On Tue, Feb 10, 2026 at 01:36:17PM +0100, Boris Brezillon wrote:
>>>>>> On Tue, 10 Feb 2026 10:15:04 +0000
>>>>>> Alice Ryhl <aliceryhl@google.com> wrote:
>>>>>>   
>>>>>>> impl MustBeSignalled<'_> {
>>>>>>>     /// Drivers generally should not use this one.
>>>>>>>     fn i_promise_it_will_be_signalled(self) -> WillBeSignalled { ... }
>>>>>>>
>>>>>>>     /// One way to ensure the fence has been signalled is to signal it.
>>>>>>>     fn signal_fence(self) -> WillBeSignalled {
>>>>>>>         self.fence.signal();
>>>>>>>         self.i_promise_it_will_be_signalled()
>>>>>>>     }
>>>>>>>
>>>>>>>     /// Another way to ensure the fence will be signalled is to spawn a
>>>>>>>     /// workqueue item that promises to signal it.
>>>>>>>     fn transfer_to_wq(
>>>>>>>         self,
>>>>>>>         wq: &Workqueue,
>>>>>>>         item: impl DmaFenceWorkItem,
>>>>>>>     ) -> WillBeSignalled {
>>>>>>>         // briefly obtain the lock class of the wq to indicate to
>>>>>>>         // lockdep that the signalling path "blocks" on arbitrary jobs
>>>>>>>         // from this wq completing
>>>>>>>         bindings::lock_acquire(&wq->key);
>>>>>>>         bindings::lock_release(&wq->key);
>>>>>>>
>>>>>>>         // enqueue the job
>>>>>>>         wq.enqueue(item, wq);
>>>>>>>
>>>>>>>         // The signature of DmaFenceWorkItem::run() promises to arrange
>>>>>>>         // for it to be signalled.
>>>>>>>         self.i_promise_it_will_be_signalled()
>>>>>>>     }  
>>>>>>
>>>>>> I guess what's still missing is some sort of `transfer_to_hw()`
>>>>>> function and way to flag the IRQ handler taking over the fence
>>>>>> signaling token.  
>>>>>
>>>>> Yes, transfer to hardware needs to be another piece of logic similar to
>>>>> transfer to wq. And I imagine there are many ways such a transfer to
>>>>> hardware could work.
>>>>>
>>>>> Unless you have a timeout on it, in which case the WillBeSignalled is
>>>>> satisfied by the fact you have a timeout alone, and the signalling that
>>>>> happens from the irq is just an opportunistic signal from outside the
>>>>> dma fence signalling critical path.
>>>>
>>>> Yes and no. If it deadlocks in the completion WorkItem because of
>>>> allocations (or any of the forbidden use cases), I think we want to
>>>> catch that, because that's a sign fences are likely to end up with
>>>> timeouts when they should have otherwise been signaled properly.
>>>>
>>>>> Well ... unless triggering timeouts can block on GFP_KERNEL
>>>>> allocations...
>>>>
>>>> I mean, the timeout handler should also be considered a DMA-signalling
>>>> path, and the same rules should apply to it.
>>>
>>> I guess that's fair. Even with a timeout you want both to be signalling
>>> path.
>>>
>>> I guess more generally, if a fence is signalled by mechanism A or B,
>>> whichever happens first, you have the choice between:
>>
>> That doesn't happen in practice.
>>
>> For each fence you only have one signaling path you need to guarantee
>> forward progress for.
>>
>> All other signaling paths are just opportunistically optimizations
>> which *can* signal the fence, but there is no guarantee that they
>> will.
>>
>> We used to have some exceptions to that, especially around aborting
>> submissions, but those turned out to be a really bad idea as well.  
>>
>> Thinking more about it you should probably enforce that there is only
>> one signaling path for each fence signaling.
> 
> I'm not really convinced by this.
> 
> First, the timeout path must be a fence signalling path because the
> reason you have a timeout in the first place is because the hw might
> never signal the fence. So if the timeout path deadlocks on a
> kmalloc(GFP_KERNEL) and the hw never comes around to wake you up, boom.

Mhm, good point. On the other hand the timeout handling should probably be considered part of the normal signaling path.

In other words the timeout handler either disables the normal signaling path (e.g. by disabling the interrupt) and then reset the HW or it tells the HW to force signal some work and observes the result.

So it can be that the timeout handler finishes only after the fence is signaled from the normal signaling paths.

> Second, for the reasons I mentioned you also want the signal-from-irq
> path to be a fence signalling critical path, because if we allow you to
> kmalloc(GFP_KERNEL) on the path from getting notification from hardware
> to signalling the fence, then you may deadlock until the timeout
> triggers ... even if the deadlock is only temporary, we should still
> avoid such cases IMO. Thus, the hw signal path should also be a fence
> signalling critical path.

As far as I remember we didn't had any of such cases.

You can't call kmalloc(GFP_KERNEL) from an interrupt handler, so you would need something like irq->work item->kmalloc(GFP_KERNEL)->signaling and I think that's unlikely to be implemented this way.

But yeah, it is still something which should be prevented somehow.

Christian.

> 
> Alice

