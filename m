Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F53FBCAF4F
	for <lists+dri-devel@lfdr.de>; Thu, 09 Oct 2025 23:41:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF53910EB2B;
	Thu,  9 Oct 2025 21:41:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pd3JUIXm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010009.outbound.protection.outlook.com [52.101.56.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C27BD10EB23;
 Thu,  9 Oct 2025 21:41:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rPTWYKxEA0gS2R5lUteRrlqtaF6kcnkm1hBk8i4O3hjB43TOluqlVLJYzMVxNQo/ogrqloXcCShZFRwsJmCraDNEe+IIoBraNEqnrkzITs9DwCWd+qnQkPamVNLfiOlZQuiqiop4LE+Nepd4aCczqh4visEc5wl2gajQCgLHjw31lZcOGfPE37eLHCCmVwlD+m5fTibLVZHouSD8Jh9QYDsHOJpURcg2uDa3CXrkOIgxoi1ivpseYODlPRtqKLPGYKN4BoIRx4+iCNr9pq+c8JdN0itUN3FVQfP1fpREAGXZR3k3U68M3vIzABOP+faA9C/QsOGKT/WPyXW+3QjdcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S/rXxko3KXBw5fqKv8KZ3qF9OJFZgsRBl3aj9jTP0sU=;
 b=VsieZmzdFHJM4bD/hs5GVE7mNowfZCD0eCO4yWj+fW0lpq+LrPpyPjKYx+xYSnjoyLNmesx+G3KgsVhxgQr4fEcfLVQKRfgbr0ZqxV0rJSfZ85AKDFuvVEwX6H++bWFvSLhMsHFc7pQ99UIjzbMJ2TniE3P1n9Ob/iqLDD5Kk3raP97Gvc0JTk8eImNwQ/POBNwq5vjpuNtJ7UNzSNfJ8LlZBsbOw4Fn6I5XxCpMT95CvxRW6nsjwZ1AAaaGL/HgKUDknptsSUgOj5uwI8Y8zUxSBPCX7EDC1ynnK/WcJxWWS8jy1oS2Xh2WUAJchZsWEn4RlkaHgwbeAJj1PtFpzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S/rXxko3KXBw5fqKv8KZ3qF9OJFZgsRBl3aj9jTP0sU=;
 b=pd3JUIXmRHGdFuSjYHFOFKyJ/mQvcxwmLo5QZOYwKv6PUetnWqoYvuUOSG0zjwIhLW58DvU1rAuIlg1j3kI3NA0dmV4t2iDs9BDHe88b8BbiKZQw9Lwc2VR4hgs2Q03CS35V2SzjIiGa6aVwseZUzGBASRA9CCiY1uxCAfMILTrIWQYiPy4QvFhDfYb2UuPj27qD9Gfkn1Al3Uw3XAmLPvOYtMNLZ9HuMsfQFm/Po8ERNf5FG4ceqjTq9YYaSZ0skEfF3dEW7miGRnFM9HlyuGwxW4oVGitFab4TGcsJaBJKUzdQpuipj1/6gehYPos1eUlyV8xXRspoewIdoDnuIg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SA1PR12MB8724.namprd12.prod.outlook.com (2603:10b6:806:38b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.10; Thu, 9 Oct
 2025 21:41:39 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%2]) with mapi id 15.20.9203.009; Thu, 9 Oct 2025
 21:41:39 +0000
Message-ID: <f2592e5a-1aff-455b-a640-477f8c2be562@nvidia.com>
Date: Thu, 9 Oct 2025 17:41:36 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 04/13] gpu: nova-core: Add a slice-buffer (sbuffer)
 datastructure
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
 Alistair Popple <apopple@nvidia.com>
Cc: rust-for-linux@vger.kernel.org, dri-devel@lists.freedesktop.org,
 dakr@kernel.org, acourbot@nvidia.com, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 Lyude Paul <lyude@redhat.com>
References: <20251008001253.437911-1-apopple@nvidia.com>
 <20251008001253.437911-5-apopple@nvidia.com>
 <CANiq72k5f3f8Kys40sRmaKR8eeq8-4DsDkWDkwMPZ0A1JSFj8g@mail.gmail.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <CANiq72k5f3f8Kys40sRmaKR8eeq8-4DsDkWDkwMPZ0A1JSFj8g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0267.namprd13.prod.outlook.com
 (2603:10b6:208:2ba::32) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SA1PR12MB8724:EE_
X-MS-Office365-Filtering-Correlation-Id: b900d33e-70bf-42e2-cc1d-08de077ca0d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aCtSNWpnamVxZzdYbXdERm1OOW1WeFpsTGwyUDc5TU50Z3Btb1JtOVVmZnpv?=
 =?utf-8?B?VzFjNDc2YXZISUl6aUU1UnZCK0dnZENodmJlN1hXOFpNSWlPakpMUWRPNGJr?=
 =?utf-8?B?SURvWkV5MEpFUldFclJsS2NOV1h2VklrTEkzVCtRbEpxbGVxaEVtajVPMFdk?=
 =?utf-8?B?SUxTcDJXODJ1Z0hqeEdSSjVHY2lXZlFNTnRISXFyTnFmM05SOC91MGlObVNw?=
 =?utf-8?B?VFRsUXREY0JhcFNmSzYzQW1WVDF5TGtHemFSdkptNlhQNXBXZTdEZlRzTEk1?=
 =?utf-8?B?eGN1VDZrNXRhU3d0YjcvMFlkSDRXYS9wMjFHdTFOUkRWbUVYNmMwWng0MEFQ?=
 =?utf-8?B?SEcvbkxCaUFuV0lhVHduSEJrZXUveExRNHZLYW1ORXZxS1pkR2hiTGhwT0Zr?=
 =?utf-8?B?aXVMbE5kVnNxbUZOZVU0K0ZrNlIvaExjUnhXNnYwTlBGVXVzTTA2bXgxYWJJ?=
 =?utf-8?B?QSs2eDQ2bnF2bjdDSVFGK2U2c3YvSkRJN2NUT3NVRDVLWTZpUW40SFhaMHpJ?=
 =?utf-8?B?QUVSQitiSkNDTndFVi85dWR0QklJUjM1TWgwWVQ3Z2U2ejBwTCtyRVBDQ2RM?=
 =?utf-8?B?UDRpdGdNSkZDU2hxeDNKTXBMWTJXbVE0VGtueW93YjFRRmRFQ1hmd1BTZDlZ?=
 =?utf-8?B?NFNpZmh1Rm50U05Md28vSGlpWU9ZcHJoY3dRdUg3ZVNDQTZmbnNaeGpVdVFV?=
 =?utf-8?B?VXdEaXhINTU5QmR2V3BZZi9NVmZjN2VQY1AzRjZWb3Zxdjc4T2R0WDlnODhX?=
 =?utf-8?B?czQxZk41SndGRmZUdWw3dUw2ZC9QZzVERUdqREs1d2JaMWpMN21CczhSTVJu?=
 =?utf-8?B?Z0lYWDJ0NEdRcm5WQU1WUWJLRlYyMnBhcEhwckZyc0tJczJIbE1tOStmOUJh?=
 =?utf-8?B?Y21rWFloTndYcmMxQnA3M0sxU2tGaExyYnNQSUlIbmFFN25tNk9UWkZraUNB?=
 =?utf-8?B?K0lvUXV3RGRXQ2Fvd2kvS2NQaUNFMGZZOE5jRnBJd0VHUzhWZTFGMDNQNU56?=
 =?utf-8?B?NS81UGlBNEo0cVE5Wk44NGZaWG9rZDFlOVpvRE9CSU04YnJQYjVReWdvWWdR?=
 =?utf-8?B?b3VuNXJ3dklIRTUrWWQrZ1pFWFUyY1dtUEk3a3I5emdBVVVWb2VsaGdPZEFi?=
 =?utf-8?B?UVdWNUlMSXJIbzdyZS8wbEFaMWU5WGRtRkptSlZucjBhL3NlWHBuM0pTLzhX?=
 =?utf-8?B?S0VNa2phVkRKZ05ZL1hRcmtUaGdTbm5RSlVGU0hzZWdtOGZNNDNhK3ZDcENp?=
 =?utf-8?B?SzY0ajRVc0lncXBwMzRjdzBrSXhXdTM0b0E4S1BHYUhsZjd2Mko2eVVQTFRV?=
 =?utf-8?B?VS9qS3BjY1NkcVloYVlLUnVuYjROZ0dSR1I5MWx4YnkvWGt2djdyNENza2E2?=
 =?utf-8?B?WndXY3JTVmtSMExrSzByZGdMcUJsbHRHU2dvQ1p5QWtWMVFER21zNkVpS1VF?=
 =?utf-8?B?YU9iS01hejRoS2JSTG1DbFJzeVlld0JKQTBwTjBRUURucnZFV0s4OWcxb3N4?=
 =?utf-8?B?WU9mYUpVY2cwczYvZDMwZUlmOEJ4WGtPb01OODNRRnhlRDhnbE83T215TUlM?=
 =?utf-8?B?OXk0N0dtZFRZbkIwa00yb2tkVlRsVFhtZ1hoSjdobE8yaWlQdDdDYTNoOWYw?=
 =?utf-8?B?ZUZZTW5RTW9YR2FYSzhvRUtOREdweHM0eUU5cE5kc3dFelBGK2Nra29DRUlm?=
 =?utf-8?B?emJmcmRsZXhjL0VLREV1MDd4WTVUR0tNYTZCdmlqR1BqVEpROXJQQlZOaGdO?=
 =?utf-8?B?dFNUdGR1N3R0S0dLUjRURTF1aCtLd1AzZWdmM0k2dkprWUd0UXFRZGZtVHdB?=
 =?utf-8?B?Z1RRdXdSYmh6REE3cVVhNWsvMFcxV3BqRzlITlVXWTMwSDBJMVd2N3hsY2Ru?=
 =?utf-8?B?S2tlTWpVQXNZd1pVd2kyVzBJU055T3NQNmhFUjZjblNWb2Ixa2MvbU40R0pm?=
 =?utf-8?B?V1EybjUrRE4wbmdxU3h1b3JsRTNDTUhhSFpHRmZ5TFo3KzIxenkvS3lTWklY?=
 =?utf-8?B?YVBnMHJIMmJnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2xtVEpTall6TlZoL0FhczZEQk96dGVLLytudzdBSnM4T3pOeFkvdmpuRnVp?=
 =?utf-8?B?OUllc040Zm0wMFc5ek5GY29nYkZLcVV5dnNYT053bkdYS1hSeG80SW5CWGsr?=
 =?utf-8?B?dEMyWU5Nc3d1Z0VwNFkwZkFXdmhXNVZpQldOWTNyeEFYUlJ4NWN6aFJWOXc5?=
 =?utf-8?B?NmZ6akl6ZWVNR0dUMDNtMFNMRXFMdHcrbVg4cllDb3JOWW1EK1UwUEhLVnRM?=
 =?utf-8?B?K3YyOEJuUnFnUmRHTXY5TExSN3YyTGMwVmtiQVhZYVNwOXlhYXFYc0dJZ1cw?=
 =?utf-8?B?ODF0Vk5aM2QwbER5SS96cDZIUXJhNEVkUUlTeFgzS0REazNBNmpNUk1ib2F0?=
 =?utf-8?B?ekROb3JNV3UzNDlPTGZ2NXl3WE9GeUlqekVGaGhTQlArQndEZDBuK2F0Qm1M?=
 =?utf-8?B?SzY4Nko4eFRQNHJ6QTE3Q3JaTTI1ZUQ5dmtFbmRBeHA1NGZZdi9ZYlVOQURh?=
 =?utf-8?B?Qk5KYnBIcGpaL0lBMG16UUM0TG4wVUk3K1NQcld4VldQMmtaSmJnN2MycHRE?=
 =?utf-8?B?OFhLM1dBT1ZMaEROSnpFclBmSjE3SHJGQUUzVHRndEMrbXdqQk92cnFKZUZ6?=
 =?utf-8?B?WWhhTXRNc1ZqejRXNmh3K2hRblFZaVFDQzNxVWdWR2EvVmRoS2VoSUlkdlBn?=
 =?utf-8?B?TTdBaHV6bGkyYS9DdmVocHVjbjY4bzZoSDlyVldoZ3hLelFjbEhNU1ptWGxK?=
 =?utf-8?B?azlTZG10bXR3TXQxK0dXeFBiQ0podVpScVI2Y01hUVowK3oxNnhFYkhKUUlG?=
 =?utf-8?B?UDgwa3pqVks3bVlqNHRXYjNSWXRPMFNlc2didURYS2xzdHVBM2dKa0x1MkJW?=
 =?utf-8?B?anhMYm51SDJ3NEJDUWxyQTNoa0RqK3hKUC9JNmRGVVRtUVNza2VhNG9mcGFT?=
 =?utf-8?B?Zmc4dVVWYzVOQUZQd2VtMDkrbG5XV1hXYVBnbkFobGlXTHpuM283NEFpWGZl?=
 =?utf-8?B?ekFZajVmRVd6M1hqL0tMNDZVMTdJQlZ2cmUyT3pMaDdoeXk2R3RwWGxnajcz?=
 =?utf-8?B?bm5mZWhPVnBFQXNMNGMwSUY5SjhFVjlJNlUwdkV3UTJpbkZ3OFZ4Rm5EVnNT?=
 =?utf-8?B?T0hqVnBuWklCb1Q5SzN2UTNoZjBVaW5Hd3ZpVHRod3pyUzZ1c2lvWlRyNlJ2?=
 =?utf-8?B?R3Z6M1VvdURQQW5RZE5qZFk3bHVGRnZXbStnTCtWN2tYell5RnpSNlEyUjRK?=
 =?utf-8?B?cUplOW5kRnEyUlRYZHk3b3Z0RHRmNjNnYmpEeGhDaTBJTVVrMERMMUlRZ1pL?=
 =?utf-8?B?NDlSSzM4N1A3a1pOOUxoRGdvUytzTmlKZTRUNjRNdVQ0VVMvdG1uNEJRNEQ5?=
 =?utf-8?B?MnBnWExJN2tVVWJ2a1o2RDhkWDJIQUVtT0llU1BhVS9MYVhGNTBFQUZKblRV?=
 =?utf-8?B?Z21ZUVQ2NFJlQnpRN21zbnIvN0gvOVgxWEpyWGYzOW5pNmlHcTk3UXFpYWtl?=
 =?utf-8?B?M29NTVdCMlZ4ZUdWYXN3VE9vZ3ZDNUVxa0JrUTRzc1A5dURzM01Ud3czSnZ4?=
 =?utf-8?B?c0xCQmNORFA4QXE5NkM0ZGtHdTVMdUREV2tpTXl5eWdKemZ0ekZhWGZELzZI?=
 =?utf-8?B?VGlFR1JCdTM4YUdnTlNhVm5qOFg4TGExOFdGekFqUWNDYjlKSEVuVThwdnY3?=
 =?utf-8?B?bXB1bTBEZlc4RmZPcUtZeURDZVBoYVhlQWVJeTA4Z3paRlRBa1pYK1pJWU9C?=
 =?utf-8?B?dUFaYlNlZFpRUVVHanBrc083ekkzc2FKREJvZFI3U3dDajVNVE50VHBUK1ZJ?=
 =?utf-8?B?VXNHZC82WGl1QU9mN0tBRU1FVFdiZSs2eUcwR0hFUnBYYXI1bmhwRkdsMHRE?=
 =?utf-8?B?Wit5ZU5FWjVoNFVYd2Erbmt5WWxMZlZZa2pBMDQxQ2huSlZCMFFGOFdvODM2?=
 =?utf-8?B?Q3UwVTFvYmpxMTluWEt1U1FUc2hxVFFhVXJaa1UvRWFPN296TzhwOHFqWjdt?=
 =?utf-8?B?WlI2ZmEvSDBqUEdKTVRoY0Rlc1RnQ2tRV2s5SkdQdFhiWDZ3VVo1a3pVS0pq?=
 =?utf-8?B?TTlrSXUyQXJ1MjFuNFh4NkhpSVI4TkhGSnhKK0U2RUczTDFtN1Zva1llWkNQ?=
 =?utf-8?B?S1hTdUhlS1gwTVJuUkRScU8rV2VjTDJXeEtTcWZ4R3RhNUFxMk5uRVJOcE5v?=
 =?utf-8?B?ZXUramxNYzgxRXMwVG5qNU05bVlKUkwwR0pYbklVK0JQd0dIKzdHTldBc0hJ?=
 =?utf-8?B?QXc9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b900d33e-70bf-42e2-cc1d-08de077ca0d6
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 21:41:39.6533 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qGZhxNWtGE9RmWci4L3wiBJjdhYA71tFnaMCGRtWZbKsvJn8wc0KeJkv8e9xKZy+K/bH9aEcfo5x/l1NKT2NxQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB8724
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



On 10/8/2025 12:56 PM, Miguel Ojeda wrote:
> On Wed, Oct 8, 2025 at 2:13 AM Alistair Popple <apopple@nvidia.com> wrote:
>>
>> +/// Example:
>> +///
>> +/// let mut buf1 = [0u8; 3];
>> +/// let mut buf2 = [0u8; 5];
>> +/// let mut sbuffer = SWriteBuffer::new([&buf1, &buf2]);
>> +///
>> +/// let data = b"hellowo";
>> +/// let result = sbuffer.write_all(0, data);
>> +///
>> +/// A sliding window of slices to proceed.
> 
> Please write documentation in the expected format, i.e. using a code
> block and a header:
> 
>     https://docs.kernel.org/rust/coding-guidelines.html#code-documentation

Sorry about that. I will fix this up for the next series posting.

> Eventually, this documentation will get rendered just like the
> `kernel` crate (and the examples building/running as tests etc.),
> which requires following the expected conventions.
> 
> By the way, is the sentence "A sliding window of slices to proceed." cut?
> 
It is a typo, should be "A sliding window of slices to process". Will fix :)

thanks,

 - Joel


