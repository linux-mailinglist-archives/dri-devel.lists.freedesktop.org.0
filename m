Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 202AEA39D94
	for <lists+dri-devel@lfdr.de>; Tue, 18 Feb 2025 14:35:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A04010E6B8;
	Tue, 18 Feb 2025 13:35:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="aPxKwgPs";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2049.outbound.protection.outlook.com [40.107.223.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC19F10E2C1;
 Tue, 18 Feb 2025 13:35:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lngtYH/uVad2CrEFokVYaWI4DMPe7eEKKoSxiyUrnJ7956LxKd5atAm7dCy6g+o/SSIZNk20M8Tu4xGlmYZoSNB6FhrV1yoxneOR72i9vGufbS1WSL2sVrJUhq48UtFefodI+4sSFF3PFJp+z3sxF2K7tjNbv3N9RZ7tbrfuuskrCVLl0XZnj6rByar36SoJa/Gn2seZ6GXPeTQZa928sZs4u2foAx0EtwZqbh2W9tugXAgzeMbScaVnkD/Y4DCsIB+n4gETI5X0ZL//HqggtgTYIl98URKcx4UiINBMEEk1kFnecH1gtcDzZXcglm6FNmxOHfLOQW6hXtMpf7xwPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dKe11YKkiL4j+iFYIOy4W/xpRtlCxtPt21QyPDH6ytY=;
 b=e1wr62TCC9v8mHDnIFUQmFKdRJ+xvYA8t+oLPJ5E9d5vHUmVX5GEUhitd7S3mtOd98Uxf/VAhXxb/74Tq2P62NzS2RF0KN/IFNXpbH0HSK41ZHOlFeTmdoLqZMoEhdCdVfX/lqp6vfPA1IMmknXqbNx45B9PU35rLY7geVU1DGKYAIpomID8zRKG0PhIVtMHgjCwNvJZ4RmAfYIsrCBHORVZ5LuRr5RVBxl/M1bB9n1O1fi7S5OGChe7H3H+iWGwkNzJuvLpMO0bpQg2F7hn7OkmEGdLL3rr4GSyDK75DvVdHk2iDWm+NhDn+WnSB0I/2DDHOSecEMqDUPxxIpKqmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dKe11YKkiL4j+iFYIOy4W/xpRtlCxtPt21QyPDH6ytY=;
 b=aPxKwgPsm23MbGldANbmmJvCswvZK99VGViww0VMC+vg8Em2rm3DGyPVKPqpnZ0qEng281ADDLiA9PFdKgRR33Z1DrTzz7DsEI9phYrpT627WHjeyLKIKPvfqmYwclb+ykQyedmWggx6x6+7Cp4LMgBS4DGUda3ryn+fu7t8kI+ZE7gRGdsntjSOJV/9UoJuWFKWvIm8e9EVQGfHMwo2GXjXm8NyzVcFCsVXytfIyornIHQB0w2i2U1+e4kXw4BxTp09FDcOZN+fVKjaIPAArg1GphXXMuA3SD2og+LmAjObmZQ5MKztYA5eip6M8gEGsyIgYdE/Ho5bVLoI4uVRTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB9193.namprd12.prod.outlook.com (2603:10b6:610:195::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.17; Tue, 18 Feb
 2025 13:35:06 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%6]) with mapi id 15.20.8445.017; Tue, 18 Feb 2025
 13:35:06 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 18 Feb 2025 22:35:03 +0900
Message-Id: <D7VM09MPOS3J.2B45SGKHY5QG0@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "David Airlie" <airlied@gmail.com>, "John Hubbard"
 <jhubbard@nvidia.com>, "Ben Skeggs" <bskeggs@nvidia.com>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>
Subject: Re: [RFC PATCH 0/3] gpu: nova-core: add basic timer subdevice
 implementation
X-Mailer: aerc 0.20.1-0-g2ecb8770224a
References: <20250217-nova_timer-v1-0-78c5ace2d987@nvidia.com>
 <Z7OrKX3zzjrzZdyz@pollux>
In-Reply-To: <Z7OrKX3zzjrzZdyz@pollux>
X-ClientProxiedBy: OS7PR01CA0190.jpnprd01.prod.outlook.com
 (2603:1096:604:250::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB9193:EE_
X-MS-Office365-Filtering-Correlation-Id: 6764883c-1290-45e8-a95d-08dd50210e79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|366016|376014|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZGg1cXZiLzRvdmp3R1hKQkhWb05pWFdGZUFMeFRBSXlaS09oNFRlZlB1Vlh6?=
 =?utf-8?B?bTF2TDRGd0ordHlJQld2aDRXeC9yTDFVNWRwME9MbGs5UVdpaVdQTWZIL1lm?=
 =?utf-8?B?S2JJemxWUUJHSWROeUIweUltbXc0clUxTEF3WXlkQjEzcWdUNHloS0RTSTZy?=
 =?utf-8?B?c1RLMnpnU0dZa1BBaG1oa0QzZXEyWDJUOTRLRW5KNG55SFpUWE03ZmRNUm5K?=
 =?utf-8?B?b0YvSkhYdXRydWVIZEpEeFAvMXdSdW9RcnhwMXNBbE54Uys0YTdHSzBCd1V4?=
 =?utf-8?B?QmZ3Z2wwRUZEbU1WMFkrNDJRRk5Sb1VGdnVVcHE0RVFmNUtNUEpnREtwZVNx?=
 =?utf-8?B?QnRZclJnYXByMFFwQ3VtejIvS3Fic2xKTkFPQmVBb1IzdUdOcUFzTmpBVTVO?=
 =?utf-8?B?UGRmWld2bS9HUmNUNXBMWnZTSnhxNWMrMlpXdDVQelk3RlEyUktQd1ExaW1m?=
 =?utf-8?B?ZzhYaU04aVJOcURUUlRmbTQwTEo0V2xQWEF1M0EweTRiQnFIcmowUUxZVEVF?=
 =?utf-8?B?YURmcEhtMDVBZWkrTnJWemNyamg1Z0xwSzJOMDVxY2Ztd1lQbGtZS01iekJ4?=
 =?utf-8?B?YWxENzlFMUtCZFBmK08za1NYM0dFWmFpbUdINnVpTndpYVAwYUJWb0ltTnRj?=
 =?utf-8?B?eDBKaGttYk5kbDZSd011MmQ0WkMxZ1JEUFVKK2ljNFE1K0o3dlVDWVZvTDcv?=
 =?utf-8?B?ZVlFamJsN09GejQ1bXhPL2RrbXgwbk0zenJSWjFrMlVzYW9SR1pkQ0dPYUtX?=
 =?utf-8?B?LzZ3SFJvWldzcS8rcHdseUUrY2FNQkJkdm5jdllZMjk4TCt5RHNRNjZNeWxR?=
 =?utf-8?B?TURtT0srd25iaWlGT1VyUDVMcGd3b0V5d2ZGWVlwSllsQmtkMWs3cDk3dlJX?=
 =?utf-8?B?dERkQjRwanNhZ3hQbmM0cGhsR1hCK3ZRUGw3TnlTdmpLdmN5QThod3lLSFk0?=
 =?utf-8?B?UVJDMExxa2lJTjVLUkVlN3N0UTIwdUZ3VFVma1o1Z1J4bFdJQVF5UisyV1V1?=
 =?utf-8?B?enpIRVdaVHl5bW1YTlBLMGY4UldmYkhBSzFMMHg5RmRhQVZSY1RzUjZXMGla?=
 =?utf-8?B?SlZDYnZNZ3NjaU05R0ZNNUZTQURLTHVEYkJzSjh2Nyt0VnpVWWYyWkhQRzUw?=
 =?utf-8?B?MlpkV1hkRHllZ2VXc1F2eHEraWNkSjZJVGpkdDRTWVhlb1JCSERlQmE0RVF6?=
 =?utf-8?B?Q1Z0b1FvclhWNnE2WnFlS3pJTmxiTnRpYThqelVhUWZGZWdSdDdQTUdBeU1m?=
 =?utf-8?B?WGhKUU42eWJJWm9rdkY3YUp6YnZjdmtINFREYkJtVkx4NWgxaFNlcW0wbitS?=
 =?utf-8?B?eXNrVHhUbVcvZjhUUGwrbnhGenFwUHpEVWs5YzlKMkxMUHRRQmhmVmdxamhW?=
 =?utf-8?B?anRDU0RNRDVmU05UWFNXRXEvS2xUS29aK1FFQ0o2VXRxeGpmYmJ2c2MxR3RJ?=
 =?utf-8?B?eVJKS1RSN0h5dmQrNWpJaGh5R3RJdlBQYm02N05VR3FOMFhHYUp1YTl0Zmgr?=
 =?utf-8?B?ZFQxa1RRUVV5bWV1MDN3aGNDNjBXaVhwTlA2YWlhVjM4T3E3RjFGbkNhNExC?=
 =?utf-8?B?dU5KbDNDSTA1eDR0NEJZVmVzNmdoT3Y3WUpydUhZckc0MTkxbG13ZEFSRW9O?=
 =?utf-8?B?V0RnemthSUpmK3JScXU2Um9JQWRvdXVLM2pta3h4clZldmtRZ08vNy9IaU5L?=
 =?utf-8?B?b1A1QS9wNlZlZGMyQThnVVJEZTlwZ1c3Y2xwMVhQaTJzVXlMWnA4WTJydy9K?=
 =?utf-8?B?SzY3QTBidjNCMGZDT3dXdXI1MDlaL0txSFdnOWlGNDNqczFYOFFEd0ptQnpD?=
 =?utf-8?B?cW5LMENqR1EwSUNGMHZtUTlHdklMVVpyaUxKNmpjRytpckZ0S3JlTTFTQWc5?=
 =?utf-8?Q?UvRmmyPfxYs0y?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(10070799003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NllwdC9sNm4wQzIwVWhJQUlwbTl3R2c1aXF5SmprbnZQY2NwSmFpZUhWOVdl?=
 =?utf-8?B?WlRabkU0U1F3dGpwRk40WE40VXVscjR5U051bllnM2kydUNVTGswVDMzN3FN?=
 =?utf-8?B?Skgwb0UxYXVpVHR4UW1ud3pKeXQ3citRQ2pSalZxYVk4SVhISGNaMmdzWkJ5?=
 =?utf-8?B?V09PZndjZnlqZG41dkxFQW1NL2Q2UkhjMnQ4MHNrTTRoNGpPcGNrWHFsdmh2?=
 =?utf-8?B?clppOUlKUXhTS3puMGREQ0xXRTZVL0lMRC81MThWUG9zbDFCZjRRWHd2ZUNw?=
 =?utf-8?B?K3NVRXdBdXN3RjVBcHhQVDVDRy9lcWFIMzh2cytIUDd1SzRXak1jUkZidzNl?=
 =?utf-8?B?c09XVnpOV3B5RHhEWkhFeE84RUUrdTUxRGxpMldwUWE5cFpMSitVRDN3ZWND?=
 =?utf-8?B?ZW13MFJreVFOZGoxK29JcjgvSkpaOXlBLytsdUczVWpsYWZGcENzaVh5Zjli?=
 =?utf-8?B?S0tiTFdHRmp0RHNBR0o4VUVaNm9uelBSdzRuL0hUb2p2NFRIMnFYbnZ0RFN4?=
 =?utf-8?B?N09tSllPUXo1dnEzS0FkZjFvY0pvOGpYd05PSWRyLzZqUkxoYTF4RSt5UVRG?=
 =?utf-8?B?ZWpNZmNIMDVuZ3lMWUpvaE1QV2NmOUlxUUpLUXNrdHJxcTgxaTdaNWRvZmVv?=
 =?utf-8?B?TW5sSmZRd3AycWlibCtpNzlNZlZ6YVFPTkpaazJHWU95U0xFT1pFeEJveFlK?=
 =?utf-8?B?VEx2Y1BERHpwT0pBbVZtU3U5R2hwWGkvcG05dGw2WlJBOXJ1dEZxbVkxbSsr?=
 =?utf-8?B?bkc2WnpSRDVDdEdNZmZmeE9BakZ0RVBJL3NxTzEzK01yd0QvVEVGcG9IUjlT?=
 =?utf-8?B?NEpXc3dScFlRMkJIUmNZMXNkbkFlR0c2T3Ayd3JielFPNXltRXZydjZNZEl4?=
 =?utf-8?B?VE03bTN0Q3VSclZrS0gyd0ttMW12V2xZZWF3UVRPM2ErUEROZUVQQzRKY1I2?=
 =?utf-8?B?cW81dkJDL3dOOEVEQjRQZ2xUWVpmOTc0OGh4Q0VHQUw5NWFBTzJpOFhVbTJ6?=
 =?utf-8?B?N1pMK21EaEczekFEV0lJbnZzN3dWbUxlWmFCQUZYZlBPMWZXSUZqQ1I2T2tM?=
 =?utf-8?B?RXpDT0xtS2MvYURHVE8yWXA5cHdDOXFYbXJtNXhPNkhsbEQyOUtxYUZwNUNj?=
 =?utf-8?B?NzhRT2FERTZyK0JzdWozRVJCdjBkcGVHMXJyam56SGZQbkpyQm5xSTc4VUZX?=
 =?utf-8?B?ZmdmMmtXYS9WVVdUeENSV1JYcHJkR0phRkRFY3FVam04ZzhSM2tRVVFNQUk2?=
 =?utf-8?B?V3g2bEFycThtSW5rYzB6QVdieWNQZXVXbnViNXFXZkNNYkFLZG9qaU5mT1NH?=
 =?utf-8?B?R1ArdWdQVHB0aGNlM01CQTdUcnNIZU1lRktBSTNyNXo2dU9UWngvbFRTdUJu?=
 =?utf-8?B?dDdoTUJOUFZnTFIzS2RYLzZFSkpycitpME9XSFYzWnpKdi9udVNrdjAvRkQx?=
 =?utf-8?B?Zi9nUnV1QmZDL1lJemptdnV2UGRMMlRkbVRTemNwYURPYWlZV0hOSXVPV0d0?=
 =?utf-8?B?WW9JaEJIQ1hEb1pyQy9idlliWXp4ZlUwZ3hCUldTbjY4UW1oNUtwMEhTYzMw?=
 =?utf-8?B?d3h2YWRramt6b3ZPU2huT2dMYVo4bExQUTEvRlhtcFN0bDdORlpuRXRFaC9p?=
 =?utf-8?B?TjZ4QTQvV01NYUxmV3IxR1A5elYrN25vSVhFYWZvTHNoSm5tTGQ2elV6SElG?=
 =?utf-8?B?NS9YbnhkTFd0Z2VWZGhwSkxOSzBkanUyLytCbGJPb0NwLzg1L2ErV1JHYU40?=
 =?utf-8?B?Mk55Nks4ZloyQnQ4d0R4TG8wNlI1MzFBODBUT0txbDdPUjFpSjh6eld6cklh?=
 =?utf-8?B?ZEkrbjlzaE9qcGdpd29HKzlQQm5ibGxMLzlNbmZrNjl1NlhydFJENFdoc2Q0?=
 =?utf-8?B?c05RWWFOQjlOKzVNVHQxZkhmY3lLMVQ1VjNDSVEvS0JSOTNjQ1krZXJPOEVU?=
 =?utf-8?B?ays5bnVhS0FtTXk1SHU0L0V5QTRadldDaWlGZkpYL0dlektZVC9Dd1U2bFV6?=
 =?utf-8?B?V3N4NDl1OHBRTnBtSFptM293Rm80Rngzb2pmQklPUTAwc21HUjJoQkpEOEti?=
 =?utf-8?B?QjN6VkxlRDQ5Q25IVDd0ZisyMEo3cjFrZG16Z3ZxN3M0OGZyZk55S2E0RUlP?=
 =?utf-8?B?WTJwWHIweWovdEtKdE5TS1oxbzdmNEJ6VmtmeFhWckpsL3pQaklIblVFNmU5?=
 =?utf-8?Q?oNE6SYChN81+QyoKSwjOyLorAnM4EuxioTdTki2AIpNS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6764883c-1290-45e8-a95d-08dd50210e79
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2025 13:35:06.6142 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r3LdU+wRf1BoGW+Ahv3bUmyx3DFfuEntjj++A30NhNLtWUFrDgYxKK/OkCGjOMtvY777hBgtTuuNhCUT0J2rng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9193
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

Hi Danilo,

On Tue Feb 18, 2025 at 6:33 AM JST, Danilo Krummrich wrote:
> Hi Alex,
>
> On Mon, Feb 17, 2025 at 11:04:45PM +0900, Alexandre Courbot wrote:
>> Hi everyone,
>>=20
>> This short RFC is based on top of Danilo's initial driver stub series
>> [1] and has for goal to initiate discussions and hopefully some design
>> decisions using the simplest subdevice of the GPU (the timer) as an
>> example, before implementing more devices allowing the GPU
>> initialization sequence to progress (Falcon being the logical next step
>> so we can get the GSP rolling).
>>=20
>> It is kept simple and short for that purpose, and to avoid bumping into
>> a wall with much more device code because my assumptions were incorrect.
>>=20
>> This is my first time trying to write Rust kernel code, and some of my
>> questions below are probably due to me not understanding yet how to use
>> the core kernel interfaces. So before going further I thought it would
>> make sense to raise the most obvious questions that came to my mind
>> while writing this draft:
>
> Thanks for sending this RFC, that makes a lot of sense.
>
> It's great to see you picking up work on Nova and Rust in the kernel in g=
eneral!
>
> One nit: For the future, please make sure to copy in the folks listed und=
er the
> RUST entry in the maintainers file explicitly.

Ack. I tend to get nervous as the list of recipients increases and
reduce it to the people I believe will be strictly interested, but will
refrain from doing that in the future.

>
>>=20
>> - Where and how to store subdevices. The timer device is currently a
>>   direct member of the GPU structure. It might work for GSP devices
>>   which are IIUC supposed to have at least a few fixed devices required
>>   to bring the GSP up ; but as a general rule this probably won't scale
>>   as not all subdevices are present on all GPU variants, or in the same
>>   numbers. So we will probably need to find an equivalent to the
>>   `subdev` linked list in Nouveau.
>
> Hm...I think a Vec should probably do the job for this. Once we know the
> chipset, we know the exact topology of subdevices too.
>
>>=20
>> - BAR sharing between subdevices. Right now each subdevice gets access
>>   to the full BAR range. I am wondering whether we could not split it
>>   into the relevant slices for each-subdevice, and transfer ownership of
>>   each slice to the device that is supposed to use it. That way each
>>   register would have a single owner, which is arguably safer - but
>>   maybe not as flexible as we will need down the road?
>
> I think for self-contained subdevices we can easily add an abstraction fo=
r
> pci_iomap_range() to pci::Device. I considered doing that from the get-go=
, but
> then decided to wait until we have some actual use for that.

Yeah, my comment was just to check whether this makes sense at all, we
can definitely live without it for now. Would be a nice safety addition
though IMHO.

>
> For where we have to share a mapping of the same set of registers between
> multiple structures, I think we have to embedd in into an Arc (unfortunat=
ely,
> we can't re-use the inner Arc of Devres for that).
>
> An alternative would be to request a whole new mapping, i.e. Devres<pci::=
Bar>
> instance, but that includes an inner Arc anyways and, hence, is more cost=
ly.

Another way could be to make the owning subdevice itself implement the
required functionality through a method that other devices could call as
needed.

>
>>=20
>> - On a related note, since the BAR is behind a Devres its availability
>>   must first be secured before any hardware access using try_access().
>>   Doing this on a per-register or per-operation basis looks overkill, so
>>   all methods that access the BAR take a reference to it, allowing to
>>   call try_access() from the highest-level caller and thus reducing the
>>   number of times this needs to be performed. Doing so comes at the cost
>>   of an extra argument to most subdevice methods ; but also with the
>>   benefit that we don't need to put the BAR behind another Arc and share
>>   it across all subdevices. I don't know which design is better here,
>>   and input would be very welcome.
>
> I'm not sure I understand you correctly, because what you describe here s=
eem to
> be two different things to me.
>
> 1. How to avoid unnecessary calls to try_access().
>
> This is why I made Boot0.read() take a &RevocableGuard<'_, Bar0> as argum=
ent. I
> think we can just call try_access() once and then propage the guard throu=
gh the
> callchain, where necessary.
>
> 2. Share the MMIO mapping between subdevices.
>
> This is where I can follow. How does 1. help with that? How are 1. and 2.
> related?

The idea was that by having the Gpu device secure access to the Bar and
pass a reference to the guard (or to the Bar itself since the guard
implements Deref, as I mentioned in [1]), we can avoid the repeated
calls to try_access() AND "share" the Bar between all the subdevices
through an argument instead of e.g. wrapping it into another Arc that
each subdevice would store.

But as Dave pointed out, it looks like this won't work in practice
anyway, so we can probably drop that idea...

[1] https://lore.kernel.org/nouveau/D7Q79WJZSFEK.R9BX1V85SV1Z@nvidia.com/
