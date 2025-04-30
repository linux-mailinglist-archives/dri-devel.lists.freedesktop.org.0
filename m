Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F300EAA587D
	for <lists+dri-devel@lfdr.de>; Thu,  1 May 2025 01:09:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 556C710E12B;
	Wed, 30 Apr 2025 23:09:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="he4wbsew";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2047.outbound.protection.outlook.com [40.107.236.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D35F10E12B;
 Wed, 30 Apr 2025 23:09:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iiR0sbOPtYBH8ggMYNhMfLVtCiNlo9iKDdicPWMGk5JXX+YmF+jbuYlQ96vHWjgb8P+Zf7gmXHMuimVYkuxxbwbXTmn9jZ8kjOoNcX6pDsX0g5Om2RmVBDMRhK2HYWqNBbiGVXxDKjpIuh9vpyTJNOZ/0Z1ioTX3rA1xnx4OJ9gcS/hOXefyE/SugR/PNUTb+xAksyMdvxFxjLHIdYC1bYfvBxl9tfpvto703WyPqVzx82V7ShDjaJ9FB7JGqUbH3oAfHF/vOILAoRvAcNdA8zibjoffH+uaeseV/M4osHyEv1I47wPrencdyO2I1tNMCST9KFNTWwrtutRhF1BjRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eYgN7QAhKjNz2BYeqW3MIUeU2JzgkpccgoIQLiMkVTc=;
 b=uuYOQNYWBRJ9jfOWe6FjRyhC5Kp5DrNSrVrwfvD4NwuVdI4KFtJuofNhfpmGqmG4K99zJp4nZiOytSBHSUd4VyL8fubuqnAQEuty035TPRpJHb6oWTTq/GtU5ycfUqYBrMB1Jni1srum01aGMXmWc6htONzrAXykm5/sy/MGBLkAyfAgJmlEOMvJS/MY7Uc4ISnFxsrNVHWC0Wi9HUri94G9bnbtYVhKCoRaxSflOFevUwVxYqC9vRS0dUxLsl1rB3RVwHpw9XcumE3BElz+xtcDZYhCJFEE5EHEdnARw9BiYobMsOFCIVEypD48bGr8ouDfHwIWetRT9mv5YvlOYg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eYgN7QAhKjNz2BYeqW3MIUeU2JzgkpccgoIQLiMkVTc=;
 b=he4wbsew6FIzLXt6WhBLkmk5OB9Mu6+nL4ZC9Lz457fc09FGalm8TBC2vOZDhbI01uxqPsUukO1ytKB2MDGxI4b3fNI4Yu3awTBcdQQR0XCC4rRkKrbn+zsMcBfYnRZF/MYXcNrJ35kXVbLCDjFU4wfvepT5ie1VZycijT3a47/5GoXOH29dYZRWd+0F+PR+ZY5VaoGyxDyuklQZHTAlMB6zpQ1eEYKNrD1Bs4jelq16Ea7kiMDerACnsJVZhmHs0BCg0yVTj9Ewxh3hYtsKpf8HkRWw5bnD1PqFXnqGJKspVw2+8DOX2mJUs51QAVEG9/G5fddLhBoyYlqT8zOiyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by DM4PR12MB7622.namprd12.prod.outlook.com (2603:10b6:8:109::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Wed, 30 Apr
 2025 23:08:58 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.8699.021; Wed, 30 Apr 2025
 23:08:58 +0000
Message-ID: <de6cef4c-d412-4494-b4e0-6be63172410f@nvidia.com>
Date: Wed, 30 Apr 2025 19:08:54 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/16] gpu: nova-core: add falcon register definitions and
 base code
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jonathan Corbet <corbet@lwn.net>, John Hubbard <jhubbard@nvidia.com>,
 Ben Skeggs <bskeggs@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20250420-nova-frts-v1-0-ecd1cca23963@nvidia.com>
 <20250420-nova-frts-v1-11-ecd1cca23963@nvidia.com>
 <aAerWF9j5d01pQv0@cassiopeiae> <D9K09AU4KTQJ.3TVVZPMDB0H7I@nvidia.com>
 <9977ad2e-ce2d-48b5-a222-f74a821abfeb@nvidia.com> <aBJo9qNDn8xDEwlk@pollux>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <aBJo9qNDn8xDEwlk@pollux>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN0PR04CA0080.namprd04.prod.outlook.com
 (2603:10b6:408:ea::25) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|DM4PR12MB7622:EE_
X-MS-Office365-Filtering-Correlation-Id: 91be78b1-8c19-4b81-ff7e-08dd883bfc90
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OFJqaCtqN28yckc5VHM0Vnk1R1pFSjJEaU5xMk90Z1BNSC8xb2twcGRlcE1o?=
 =?utf-8?B?MnJDTVZFbHpBbnV6d2tFUTNYOXVJQndiNVppeTRGNGMwWjVPUzNsUUZzQVRS?=
 =?utf-8?B?SHBjSXBSMks4dkRUdGJOeVFwQTh6NUt3RFZuWnZ4WXF5Ny9XZGtFaURSQnRa?=
 =?utf-8?B?SzR4T3JGUkVBOUE0disxeFh2bkV5bjlQZHh3TjBVQVVHSUQ0V21WNWVrQ0pJ?=
 =?utf-8?B?Qk9QRVo4UWthWnJrVEJ4VmJQR3lsaXNMRHFFeXA5bTQ5NUJLYnpGa0pURUNJ?=
 =?utf-8?B?dXpCaytxbjhBOStLYmJSS3A0SkRMUmprSGFVWGRiY1h1c2pjUDBxZ01pMHZD?=
 =?utf-8?B?LzZZNFoxeTJZNy9tdUMvVUtyMGRFaEhYdk10WDF4L1NERitvcmFzZ25xTGVu?=
 =?utf-8?B?dHFNcTRhNWR2dXZLRGlOaGhjdjR5QklaQllSRmhqK3Z2NEhiOThDYjVVVU1S?=
 =?utf-8?B?L2RNdHdDc2RFaiszbjk2ZWUzaGRNSmVtNjNVMERpYUNiNGJvRWhZK3piVHJt?=
 =?utf-8?B?RmNpQi92QkJRZFJmSkxXWjJlSnRoMERFTlYzc0xuRDgrMGsySW5oU0M3SmVz?=
 =?utf-8?B?WnlBc0VqTEZlR3hyM1hILzdGRlFFRXhEdUFwTTlkWHlFTnlpOFllTnZwV25U?=
 =?utf-8?B?U011RW5HcDdKVEVVN0c3NDVPZ2hKUVFYa3ZyUXEvWVp4ampxc3UzTlUzUjd4?=
 =?utf-8?B?WlhpS0FxOEJ3ekdBZlU0QWJ4RnlEOU9LcVhOWE15eUNtaUZpNC9hWFNRRzdW?=
 =?utf-8?B?KzdraGdOYXFscDE5U0NCWGxvNUxmMm5tYmpIWm1WMWo3U2RLZkdWaXc0TkV3?=
 =?utf-8?B?cloxRm1kQm9CanRlUjZDdVJ2SGtiRFpZMjlhVWFwQzFialZsV2trUEMzZUFC?=
 =?utf-8?B?RjdKQTV1UURjMVl3bGR2dUFQWFU2MDlvMTJqaERWbTRXY3hxeEowTVBzQm5o?=
 =?utf-8?B?U2gwdXFISlJMbHRoc1FsUUxLRXhwSyswWkxuckdjNjVJZVp3UEljYjFKNjF2?=
 =?utf-8?B?TnZSdml2ejZHeFE3aWUrL2xsSWZpVmxaRm1lRjJSK0MwbDMrdnE5SDBoTjJW?=
 =?utf-8?B?SkIxbkZadEFEd2xldHQxSTlWQndUbW5PTVE3TjNKL1VETFNCQXdWb3JNMlZG?=
 =?utf-8?B?NGlDNE50anVrLzBYeFQ1TitJTGQ5S0FhRERFNjJqSys4UGY1M0V5MFI5YXBF?=
 =?utf-8?B?SktZUStnMFY1aEEyM0JOMFRIYUtHVy9RKytnVE9sNjNxcjM0ZmVTemtGRGdp?=
 =?utf-8?B?dWl6RmdIUkVwbmpLdVg0R0tROFl0d200RzdSa0RMQVh6ZWpidno5dVJoMGlY?=
 =?utf-8?B?ejJ2MjZFdlEyVTgxMFdkZHU1NTc4TXhRSHV2Zm1aVUplV3BjQnJTRCs2L05a?=
 =?utf-8?B?L0s1UU1teFhrM0VFZ3dCZTZmamphTkdGM2VVY0dXT3ZYUlJsTy9UaUI4SXVp?=
 =?utf-8?B?UFZ3eTVYTVF4NUV1YXFHdFp6K2JLMTZ1MisyNXdzZDZkSmhPV2tGNVowVXdh?=
 =?utf-8?B?c2IrbjlpczRpVE5YYkdnZzR0Q1NrZW92cDBXUW9wazNGNmZWb2gvVkdHSmJ5?=
 =?utf-8?B?ZkNTZFpvclhMVlFidGprcnEwOVl2SWgvVzBLWFdmb3locFp4TEYyYzNSWVZ6?=
 =?utf-8?B?SlN5cTJ5WWNrSXNGQmxLT2NkUzFhVzB3NjJUVW4xd042Mi81eXJFMHhXQith?=
 =?utf-8?B?WnNXUEZvSkVXbTNwdkJRZmRQNXIvbEVhSHFBUnlhbTZCc045WjM4WVZoYWhV?=
 =?utf-8?B?WHlsd2U4K08yQXdRZGM1MWw3Q1ZSUm5lOHZoZzVQcm1SSzRMdTVzRTFWTCtE?=
 =?utf-8?B?eWY3dHZjOXZ0M0dDcUtZSmV1by9MQ1FsU3YyelR3RDk5RDl6dmJEa2Q0anVy?=
 =?utf-8?B?eGF4cnF1ckU0cU9tZWFHR3RJZW1RSWpGeXBza0d3NE5DUWlWVlJuMnBjYVpi?=
 =?utf-8?Q?XpXXjw1/duM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHQ2T2czQU4xYldYb0ZtWTVSN2RGUEJjbTFzdGcwZG9OYmx4YU04N0swK0Fn?=
 =?utf-8?B?dVVPaVF5K1BQSWh1bi9ra3A0N2k2eHBjaHhERTAzb1J1YVRBTXJqUmFZY1Rk?=
 =?utf-8?B?V3lCbnQvZWdGRWYyTE1iZ0ZzMlhMTGlyaFB5eHVCdU5IdzBKZVlKRHA4OUw2?=
 =?utf-8?B?Y1BJM2lMNnk1SzdSV2FrWjZZR05mb3piR1VsMVVwYmJCRkNuWmVGb1Q3OUcx?=
 =?utf-8?B?TWxZdzM3b1pGYTF2WlNLUmpsMXpsSkhUaDZ3UlpLTFN6bEZZMmxlb3VnbTlp?=
 =?utf-8?B?TUJpQmJHejZZSWdSY0NLMExSK2NzNWV2TXc3UjBxWkRRWFpZOW9JR0R6QWZU?=
 =?utf-8?B?UnoxOXEvRCtUYTZEeWxZdFFyL0s2SmI2UkE1cEdYT0hWR2dyci9iYk5XV1ho?=
 =?utf-8?B?YXVSUkdpY3JLd01ESEpUeGZmNnZHQW9sdUk3cEN1MXZBeFcvVVA0L1Q4YlBi?=
 =?utf-8?B?ZU1CeTEyVjRGNkFSc0NJQlNuM0U0UEh1WGZqeGVSeEUxYXY5UFRmSFVvcTBk?=
 =?utf-8?B?dUJJY1V3Tk1LMjgwdDBkbktxWFFxZzc1bGFhVjJ5eUNZS1dQckFPQmtjSGpD?=
 =?utf-8?B?OHhRanI3cnBRamRWWmFuL2JJYXRRVHFUd2hXWVZZYkxid3E4WVZDU0djL1oz?=
 =?utf-8?B?d051bTZyODVSZDVzQmM4MUVHOXFnRTBnNUVCa2g5ZitWQzhPNFhXRFd2SDJQ?=
 =?utf-8?B?cUxUMElwSnJoNU9hTEVyVDR5R2R2ZlVpVmR3MzY2MjNvb1N4M3AyV0VRK1lX?=
 =?utf-8?B?R1ZCOHlMTVlWK3NSMW1Vb0xlZjZGcGQ3TEYyUEdmYUttN04xWDBsdmFMMStI?=
 =?utf-8?B?cGpnZnovQmZiKzZWcmdjT09BMHVtQy9sQzcyRWdqUHN5eFUzY084bm9SbkJy?=
 =?utf-8?B?R2hBYmk1cTFIRmdKWTZtQ01HQWxtbHZyUnVkT3dFN1RFS1JqRXRtOG8rdHB4?=
 =?utf-8?B?WjJyY2E1MVZ3eGVEZm5jNW5heUhIR1RiZDROZzhyRHE1NmVPNGZDVFBNb2Rp?=
 =?utf-8?B?ZnJ2OUdZYnNvZlJrK3FKT0xmb3dEKzV3YWEraHMvZU55S1pkdDFhNzNCYmRP?=
 =?utf-8?B?QUMzUWRaNTRBdVNoSDJHMDFvVjJUbnVPLzgyNFdsQVBoMG5tckVtWmJOSWZ4?=
 =?utf-8?B?eXZMY3ozUWJLbU9raXAzdjBQQldxWGptYnNIVDBKeDhVems2b2t3ditEY2Q3?=
 =?utf-8?B?RU9FMzlxb2lwNDMzWjRWbnRXakQrcW0xRksvbk4vMnVtNWN0Y3cyR2lkMjlS?=
 =?utf-8?B?T1ZuWElzc2hSZzNlN2NXVGtxUnZtN0JNU2dJL25VY1Iyb1c2NFRwNjVkamJi?=
 =?utf-8?B?MXBoZjMzbEt1ME1lZzAxZzg3ZU0zaW9MZVdFSk1reTlGTkJVM2d3NHpCUDJK?=
 =?utf-8?B?Q29QQm56NUpuaDJIdk5HclpDb3EzUDZxUlRPYmN6R2JSY1BicC82V3MzclBj?=
 =?utf-8?B?WkgvK2NFTjdQZS9uMG5BVk1uME81dWI1N0NHeTV4YmR5THY3bXpxcU5PQXZa?=
 =?utf-8?B?dE5kNURvQk5FTVEwWGpnMk80OVJIbWV1NHVxQ2tyU2hpMXVadWZKa0tzUS9J?=
 =?utf-8?B?bXhqL3VLOFF0L0VNdTAveU4yM0tRYXMybUtNQ3NLUzYwbDJnOTZJVk5Lbm85?=
 =?utf-8?B?QkVqZTY0ZzMwRHltN3N1akxyTVZKeEVWemFBOVZSUEJNY3pnS3J3dzh3bTFv?=
 =?utf-8?B?VnNlMTBPb2kxL01qd2luY1JtSE5oZGFPcUIxaUtzYkxZV1BObGZJbExXR1JW?=
 =?utf-8?B?ZkovdlNRZHpzbndWci94TElqb1dEblRQZGpIdU5lOHlwMC9hNE1vVjhuT2px?=
 =?utf-8?B?RTZSUml2ZDFuSmNoWHNCWVU2eWM5R0lRdU5OQ1BPSzJiRFZHYzRzRTRRMita?=
 =?utf-8?B?ZE11alN6SjhQTDFyNktjUkhNbXNEczFOUjJyUXdwSm96dzBaejdhTmdnaHB0?=
 =?utf-8?B?K3huMUEvTlRHcXF1Y25FeWxsMW9NR1V4UXFCMGFnRHpOaUx4ck1hdExralpZ?=
 =?utf-8?B?NC9GY2E2RUQwMkM2bmIwWVdtb2JuOHg3Nzk2d0NwODNPbENJYnZ1WjVscUlM?=
 =?utf-8?B?ZnRaL2hQVk1CQlRLQmdPTXF2ODZLT3FJek94M3Fqc1NnVXloWGgzMTY2KzFT?=
 =?utf-8?Q?0hiFskdpbnQUlY3V1OyM2RUr2?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91be78b1-8c19-4b81-ff7e-08dd883bfc90
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Apr 2025 23:08:58.0934 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FBQneCmsIb2G5nJIVOwZoxDxxKKsRAxAkOjpbZD8rmU7Wl8FlL4Mbp8ZtUWOoUUoaXXw0lmnG2+PEYmcvL2zFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7622
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

On 4/30/2025 2:16 PM, Danilo Krummrich wrote:
[...]
>>> It is also the one that makes use of methods to abstract things (vs.
>>> fixed parameters), so it is a natural candidate for using virtual
>>> methods. I am not a fan of having ever-growing boilerplate match
>>> statements for each method that needs to be abstracted, especially since
>>> this is that virtual methods do without requiring extra code, and for a
>>> runtime penalty that is completely negligible in our context and IMHO
>>> completely balanced by the smaller binary size that results from their
>>> use.
>>
>> Adding to what Alex said, note that the runtime cost is still there even without
>> using dyn. Because at runtime, the match conditionals need to route function
>> calls to the right place.
> 
> Honestly, I don't know how dynamic dispatch scales compared to static dispatch
> with conditionals.
> 
> OOC, I briefly looked for a benchmark and found [3], which doesn't look
> unreasonable at a first glance.
> 
> I modified it real quick to have more than 2 actions. [4]
> 
> 2 Actions
> ---------
> Dynamic Dispatch: time:   [2.0679 ns 2.0825 ns 2.0945 ns]
>  Static Dispatch: time:   [850.29 ps 851.05 ps 852.36 ps]
> 
> 20 Actions
> ----------
> Dynamic Dispatch: time:   [21.368 ns 21.827 ns 22.284 ns]
>  Static Dispatch: time:   [1.3623 ns 1.3703 ns 1.3793 ns]
> 
> 100 Actions
> -----------
> Dynamic Dispatch: time:   [103.72 ns 104.33 ns 105.13 ns]
>  Static Dispatch: time:   [4.5905 ns 4.6311 ns 4.6775 ns]
> 
> Absolutely take it with a grain of salt, I neither spend a lot of brain power
> nor time on this, which usually is not a great combination with benchmarking
> things. :)

Interesting, thanks for running the benchmark. I think this could be because of
function inlining during the static dispatch, so maybe at runtime there is no
overhead after all, even with long match statements. Just speculating, I have
not looked at codegen for this or anything.

But as you noted, the overhead still is not that much an issue (unless say the
method in concern is in an extremely hot path).

> 
> However, I think it's probably not too important here. Hence, feel free to go
> with dynamic dispatch for this.

Ok thanks, sounds good to me. It does seem the code is a lot more readable IMHO
as well, with dyn.

>> I am just not seeing the benefits of not using dyn for
>> this use case and only drawbacks. IMHO, we should try to not be doing the
>> compiler's job.
>>
>> Maybe the only benefit is you don't need an Arc or Kbox wrapper?
> 
> That's not a huge concern for me, it's only one single allocation per Engine,
> correct?

Yes, that's right. I was more referring to the fact that static dispatch as in
your example does not need Arc/Box, however even with Arc/Box IMHO the
readability of the code using dyn is more due to the lack of long match
statements on the access methods.

thanks,

- Joel

