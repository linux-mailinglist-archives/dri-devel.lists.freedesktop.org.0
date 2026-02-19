Return-Path: <dri-devel-bounces@lists.freedesktop.org>
Delivered-To: lists+dri-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2DQVAZ68lmkylQIAu9opvQ
	(envelope-from <dri-devel-bounces@lists.freedesktop.org>)
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 08:32:46 +0100
X-Original-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7C8715CB52
	for <lists+dri-devel@lfdr.de>; Thu, 19 Feb 2026 08:32:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E737D10E682;
	Thu, 19 Feb 2026 07:32:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MU2WTpQV";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010009.outbound.protection.outlook.com [52.101.201.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4C5210E6A6;
 Thu, 19 Feb 2026 07:32:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Cj5FJQ0oOuDwWSyTKHyQHFVRn4IjKb2yv8NILSvqz7CXBfIbvLx8V0yus2K8MDLQrFHgQ+7QGuYrmN+eLnUOrC+AE9mOVZgoejzcgsnmedvrEfRRWKm4aj02mWEZjZrpLoxxKxaUKYYOJ0Tz+KQTbHN9bJEvTFg+asIqOpiTtVjsxWEWNrGhB48Z+xg+D8j8/Ej8mPrW6C+AilgUQDLpVtgmhPScE3DFG6JdutO6AvPOyuZepf3c7MYJnUEqZDo3esdH4yyWYDOSWK36kkE9WolipRUHRJI3wAu0T9FjhswZmtIxNzH0lXuAT4yQx6wD+GOzJukKk1XOClURxfKoIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+l8zeIumXAmE1bCoH4xQWEBFgp6f7b5v6lLWV6HSedQ=;
 b=nnoSf9/3NQee31nsksAGCuvnHAb36iIA/M16SxG8eUSVLOLxxScqkcXj+2XBSbb1iomOkDPxMbkNDtkX4jYdjIz2UnWy5z0ZdFdJaj5unA5kueJySYxIltAvUtMVTaUgzItVN+bcWzDvGaC5kag+K+IbTbqBAvgIWKCg3OWd9lr9K+hI96L1qJsypFJ2uyf5O985uSql13IF1wD1xKwcDwPjkD5kXYeZeS5virCEEycCJRWAuk7QjA+NNehz/YKcg/KOIK9p+UUJHsRSeugX69FEE91m4G8QDo47M+AZTXDFq2KNNEKqc6vnXz0N1F2LcBXXmJoxw/KyaL0yiyDAmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+l8zeIumXAmE1bCoH4xQWEBFgp6f7b5v6lLWV6HSedQ=;
 b=MU2WTpQVp5I72IicgRPh/VDmhLKOgeiWVwdXSXyayUegX82wXoSO1CvdOk1uqpy7pgeeQ/yt9JpFVx8S2qK3qwh+2rTX1bvmg2JecoqU+jmg5PE5CEVpF3we2+SssgVuIM8icm5L3W7+Sar5l37IDTEmkNulk5dblfT9wwHkUsiMINMUq5pYOU91nG2dA2lPSRB8bOmgerxObMn1ubAKdr+885SU+Pw/f15fuvxVkfP749BOShOfvHfAs0OxAwmTfoKpuYravwnU7BnhVW+Tzlq9OM7nWC6UnVKK+HQLkKub2unO4P7zMBv2JN+6vg5j6X/0IKpTNUiWbBWGbKOd/g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BL0PR12MB2353.namprd12.prod.outlook.com (2603:10b6:207:4c::31)
 by SJ2PR12MB7990.namprd12.prod.outlook.com (2603:10b6:a03:4c3::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Thu, 19 Feb
 2026 07:32:40 +0000
Received: from BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0]) by BL0PR12MB2353.namprd12.prod.outlook.com
 ([fe80::99b:dcff:8d6d:78e0%4]) with mapi id 15.20.9632.010; Thu, 19 Feb 2026
 07:32:40 +0000
From: Eliot Courtney <ecourtney@nvidia.com>
Date: Thu, 19 Feb 2026 16:30:56 +0900
Subject: [PATCH v2 7/9] gpu: nova-core: gsp: add command_size helper
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-cmdq-continuation-v2-7-2e8b7615536f@nvidia.com>
References: <20260219-cmdq-continuation-v2-0-2e8b7615536f@nvidia.com>
In-Reply-To: <20260219-cmdq-continuation-v2-0-2e8b7615536f@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Miguel Ojeda <ojeda@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 Eliot Courtney <ecourtney@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYXPR01CA0043.jpnprd01.prod.outlook.com
 (2603:1096:403:a::13) To BL0PR12MB2353.namprd12.prod.outlook.com
 (2603:10b6:207:4c::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL0PR12MB2353:EE_|SJ2PR12MB7990:EE_
X-MS-Office365-Filtering-Correlation-Id: c03f506a-a26d-44fc-018c-08de6f890fe8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|10070799003|1800799024|376014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WElyV1M0bmlzWVpFN2pXU3FSZ2ZrcExNQ2NRSWRuSStyK1FscjRBUk5uZVBL?=
 =?utf-8?B?WEJZOW1uOUFjKzQzOXBaM2dWR0JReG1tY0s1OTEweWVpVWhLSVdwajR2eGhn?=
 =?utf-8?B?a1FKWi85eEdERytJcko5NWtQa1h0R3h2WUZzTGZ5L1NTc0llbjZjRjNnL1Jv?=
 =?utf-8?B?b01TTDRkNWpDL0tmVTU5QXhLOCtNWENTTHFBSjIreFpNZDdhcC9pVmdaNVUw?=
 =?utf-8?B?a2p4aURPRnpZSVpaWVl1SlBObWpBTCtmcGMxb0NPNTRzblAyR3p0QkM0OVpW?=
 =?utf-8?B?L1dGTUk2YSttNmJCb3lzQ3RUeURBMERyZGM2a01sYlRsVkRYajVGUjdNMHpC?=
 =?utf-8?B?aGVRc1NnR1BoRHBCMHNlWTVWdzBrZGJGcUlkVjMreGFLTklHZDlmRGtFMDBS?=
 =?utf-8?B?S2U5Qk43cVVZQXVMcXlBUVlldU0yU1RBczFmYjJTeDBjdW9QUmxhdDc0a3Jk?=
 =?utf-8?B?c0trVEVaT0Zwc0t3elZZVFJyK2FBeVVFV2ZPYnRjUEUwakVGOWU0THdRUlRZ?=
 =?utf-8?B?eTNZS1Ewc1dQaXVxNGlTMlhmcXZlMzR2aXQzRVV3U1cyYUs3YXhDR3FDTnFD?=
 =?utf-8?B?UTdvaEw4Y3ZxZHlrcWZmd1JWamVPYit4NlJ1c3lLUzgvcTkwKzQzVjhaUS9v?=
 =?utf-8?B?dUIzUnl4Q004aldGRVZzbnY0dmFPdWtuRzFRV3cwUkswV3JSK0xzYUJVY1ZM?=
 =?utf-8?B?ejNsYUNmT0g5UVhYTkhkaXpuZjJRZ0ZqT0d3aXNsMEJOeDNCTGRRa2k5MnJS?=
 =?utf-8?B?YmEyVWZucE44US9ZS3RKVXJQUGIrWmt6NjJaczVZdTVlUklyUTZyVmlBeWpN?=
 =?utf-8?B?ZytoUzB3MlVpQzlEb3JsZWxXQjliV1ZxWndMTi9uSDl5T09IZXY4ZkRnS055?=
 =?utf-8?B?alNvMzFIQVcwd0VlSWw0cEo1VExNNXE3T2UraUJ6Z2xhUS9KL254QTh1UkYr?=
 =?utf-8?B?eHR5MnNzci9ab3hwYVNySmsrYXdvczlWdTNPbDJQMml3cUc1RkExV1RmbDVP?=
 =?utf-8?B?N1VSOWp5RzlpMGw2RXQ5ZnB2cHJaOWJHRzdGR0tDSG5BN0lJYmhVUkg3TDRN?=
 =?utf-8?B?d095S0x4L3l6SVJRbVVvVVVRcFFPY3lTb2d2U1hKRGF3SU82WDJXRlExMzNh?=
 =?utf-8?B?cFJodlpwUzZBR1RNTVFrN3NnYmtIa0V2Zm5IcWhqQkVIWGJuL1psd3kvMFM1?=
 =?utf-8?B?MVJETVN3M0FWR3JTZkhxMTMzcXUvcm4waWJNekJaOXZ2dy8vd1pCeG5tcm4y?=
 =?utf-8?B?bnFKU0d6SVJpTkNOUG1oS3ZOS2t6VU9qUnY3Y0NIaFlURTFpbzdsZTdFNXBy?=
 =?utf-8?B?QVhqOXNod1lDdGNoYnZCcGhjUElxbm9QUjB2YVd2WGVyM3U4S0VZVGRmOElD?=
 =?utf-8?B?VjR4M0NyTlNMOGR6KzBuUVl0Q2thYmFUYUhTZXUxc2VaYVQvRi9rYmVIcGZ2?=
 =?utf-8?B?bWc5aHhtNkt0eEc4RzlGZGVLamNrem9HZkltdzFKN21GaHRIbExURWhuQ0h5?=
 =?utf-8?B?ejBiL3BmbFBoYWovREdmcVkyeDZqdUh6WS85Z0VUQjlKK2VkSFdrWUJFMzZ0?=
 =?utf-8?B?MTJMNkhhdkpWQUdUelpiQ3pjWlZ4c0JrMHYwSmMzcHRVTmp3K0lsTCtQbUFh?=
 =?utf-8?B?TkhUTHByNVhMb3ZEcnpFREU1blN5dFdQbDNGT2l1RHEyY1FMZWsyN29Mc21w?=
 =?utf-8?B?YU9PUVJuOEJUcUxrOUNTS3YyV2d1SHI2azllN2tYSDlFeTRwN3l2L21rOVpF?=
 =?utf-8?B?cXA2RHkrWXZ2OElpM2J6TVF3SGVRWDFpeUpMYk14REF6NlFpSzFmVVkyMkNV?=
 =?utf-8?B?b0NKQU8zd1BGcjRZR1B1TzU1VTBJNW5nczFjNXlWUHNTYmlHdGkybXBFQndx?=
 =?utf-8?B?UnJEK2VlTkVCUWd3WDhIR1JDSEtXSmJtSVdlNng3b1Bsd2Rib2x4RzBpTVhE?=
 =?utf-8?B?Q2dGRTJmZk5WbzF1Y1NmNTQwU0FIK0xvRmpIWjFqV0pZWk43WEZvbHpIUTZ4?=
 =?utf-8?B?d2ZXUW8rV0tuK0I5ZDhldDJvWEgvcUVYeGpMVXY4SXhjZDQvbldFQ0hNU1c2?=
 =?utf-8?B?Vk5BdnpENWFFOVpQR3h0RnNkb2sxQmFVS1QxRFNZeEovNjU3eHBQckhYNnYx?=
 =?utf-8?B?d3JSZWtlZHZOTXRaNXlFQUlUV0M4VHR3NElvRTJad1lYelBVc1BjVkJGejlt?=
 =?utf-8?B?UEE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL0PR12MB2353.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(10070799003)(1800799024)(376014)(366016)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SktxZld6b1J0NndOOGZ0ZWRFeW9Hb09NV3R2VHNJd1VhUWQ0eThmQkFQdVJx?=
 =?utf-8?B?TCt0aWhqbHYyRDFrNzhhOTJRNmZ0U3o5UHhOdmg0VjZ4TnFUK25CTTB4Rkhm?=
 =?utf-8?B?ekM2Z1B4S0FKVFRXWHd5MllpMloyMHd6QjJDL1BpSkIwYXl0R0lqdVZpR09w?=
 =?utf-8?B?bmxkTEo0eHdtMGE1NWNWaXJ3WDVtV2cwbkpRTXZqV055Yk9kTHlIbnhlaGlZ?=
 =?utf-8?B?NzlRbWxud0lCeGNvTEk4d1F1VGZieU04ODloQk8raVZ3b09LMDV2UmZvakJI?=
 =?utf-8?B?TXk3ZE1SRFBMUzdVRmFvUmVqNDJPVmxDaVJGYlRCdHRSSGtjU3dGUHpOT3RL?=
 =?utf-8?B?MUVvVExUbTV1SUp0RFlmUFpvRzZLWmk5ZndGUm9OKy96Ky9YNmlERkY5Mjkz?=
 =?utf-8?B?cnRzSjhNd3JONCtvYVEvMk5kNm8xQlJQU21DcU5taU96VkZ1am9ZS1AwT1NE?=
 =?utf-8?B?amdTRjUzbVFiYXR4bUxkWkwzSllCTFJIcG9xWFpaa0FJai9rdXJMK1NPZm5q?=
 =?utf-8?B?K2h5S2FrdlpSZWdCNDNRbGdOMTVkbzJQWVhqdzh2T2h5MS9xZW1RdG81U3Y3?=
 =?utf-8?B?TTFnR25DYzdTb0dYNWQvT243YVBHbkxoclRpcjJTUXAxSXpPbHZoSXZ5S1lh?=
 =?utf-8?B?TGgwZzUzMmhBdmJENlN1c1RYSDRZK0JyNGE3SU1MSkt1WGFvUGQyeEpqa29Q?=
 =?utf-8?B?VnpOSEpxWks3ZVNGaHE2MEQ3ZjNpS3hCbjJzbTJwOEpJZVBud2VRZzdTL0Vq?=
 =?utf-8?B?TXZGZlRxZFkxZHR5dVU5WlNNc1lqQXpUcm5HcUdkODA2S3lxTUJlN0lWRDRV?=
 =?utf-8?B?QmFqZnZhWll6N242SUhDdkl5VmkxOEFrbmthS2h1YlNnNm5KbWttZEVRTjlz?=
 =?utf-8?B?ZS9NL2hMTnVCUkMyQ3Ryc2haTS9PVUcxTDF1UG1OMnN6QkxCUzFmdFYwdVRX?=
 =?utf-8?B?VnZza05GNTFZSjNYd0dLWVAxZXJHU2NzQUgxaFBMNkxpOGp1dHVYek4rWExF?=
 =?utf-8?B?bklwSG9YeHY1ZFQ5T3ZSVEJMcys1cFBaZUtpcXhMWkhNRjBGVXF3L09XM21l?=
 =?utf-8?B?MDFKbVp3Um45WDVwTi81YzBnMDU4ODBsclB6L1h0M3ZMRUlITEwzS0Z2MUxR?=
 =?utf-8?B?SjBxRjl4Z1BQOCsvY3F0bWIzNS90Q3RLd01QTWtRdVdNSWg0S25NNHU5by9h?=
 =?utf-8?B?RENUYmJGTlU2NWwrK2pOMzNvZnVacEZFdmdtRTBwZ0J2QzJNNWlWWndvYk9l?=
 =?utf-8?B?TjdHTkZxTWtiQmxSUm02cHdFV08ySGEzdlEveVdzN0VBNXY0UHZhOFhEV2JL?=
 =?utf-8?B?UFZwaldEaGRyN3lOS2M1Y0Z5c0RHMytUL0IvS0hjMk1MTFBGZkd0VXV2SHoz?=
 =?utf-8?B?bjhBSjQwVHZodDl4bzNIbWNpSy82ZGVsSW1TdGxYSDJMMExKTTJ5Qjh4KzFP?=
 =?utf-8?B?VUxqWWZuVUE5c2djSFBldVFtK1IzNW5MdTVEMXphMFFtTENPNGNBdDFDUGg4?=
 =?utf-8?B?cHRJU0xpNG54MWZKL2NwQ1pZbERDMm1nbHcvZkdVQzBWUWJpL09BNWZGTWR0?=
 =?utf-8?B?RlJaTldneHZiSmswZTF2cEgwZWxQdGJrL1l4cGZFSVduSHRUZU8yVW41L0NX?=
 =?utf-8?B?SnM0SFhCVTVnZHpnY25VR3BXY3BMSFp1WDNqQ215UXBWUmRQV1BTOFlNMnV1?=
 =?utf-8?B?TXQ2d29OQmMrQWdVTzhUdWluMmtiK1NsR2c0MzE1Y05UcElvYm9oMnJyUkU1?=
 =?utf-8?B?bW5BSGthSjJnQ2dpOG5zb2tjbEtpUHQyRDZzK3VFbWtGRm9qZFdVYUVjK2Fa?=
 =?utf-8?B?eDdudUdQcG9VMmE0S0EzTzFMWnN5WVVDYVVSQ0lLbXBLaHNOWlV1cUFvZWtK?=
 =?utf-8?B?czdTS3hTUWNGdUU1a015NEpsWWoyTWFVVU1PUHNLSEVkOVYzZUY4cjZCcWdx?=
 =?utf-8?B?TFZKRHB6UkVBQzJwTEkrTFJJRzg3WVBXSDhyYmtPZTRhNVlhOEJ1akpqOW84?=
 =?utf-8?B?d2tqdTZXYUhhNGdKUCtENXVxM0FRSit4dDdXS2hjQW50S2xXNi9zQndhL09J?=
 =?utf-8?B?R2ROdzY4QXkzckxEYXorMDNzQ0gxMzh1TmpvUnM2RFdiSzJqWmxkMXZLWFBU?=
 =?utf-8?B?aGFOQm1ZNkxXOEJDUVd0Q3ZIMlFwbEcxNHZyaUVLWTBPODdaSzBWaVRNWlF0?=
 =?utf-8?B?blBzL3dtSStYMXI5NDZxZWkyY3ExY2hIYVYwN1U4N1VQekhRUXBiTU5KeUVL?=
 =?utf-8?B?WFJFdXpxb2FBS08wa05FZVkwT0hoY3NVelRLMGtUSHFpT1pubkkwblRXR3Zq?=
 =?utf-8?B?b1lzTlNJNUFQUkpxSk1kOVlXNERpaXVrTktPY2c4dlBsd0k4cTc5ZzRkQVJz?=
 =?utf-8?Q?2CB+aH0iHrlvox5JVUadBiDQWqu5JIBSE6B7VPdEQTw2s?=
X-MS-Exchange-AntiSpam-MessageData-1: iSeilHVMq/dtsg==
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c03f506a-a26d-44fc-018c-08de6f890fe8
X-MS-Exchange-CrossTenant-AuthSource: BL0PR12MB2353.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2026 07:32:40.1958 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: We+JmPQdg1fuHnb1cx2xg9q3l9Bn95qtLMnm1wrc4sawNLo0KiXH8qiYJHVy6J/Skt9Jc2yoa+mdwcu6jnpa1A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB7990
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
	DMARC_POLICY_ALLOW(-0.50)[nvidia.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[Nvidia.com:s=selector2];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[kernel.org,google.com,nvidia.com,gmail.com,ffwll.ch,garyguo.net,protonmail.com,umich.edu];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[17];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[ecourtney@nvidia.com,dri-devel-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[Nvidia.com:+];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TAGGED_RCPT(0.00)[dri-devel];
	DBL_BLOCKED_OPENRESOLVER(0.00)[Nvidia.com:dkim,nvidia.com:mid,nvidia.com:email,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: A7C8715CB52
X-Rspamd-Action: no action

Add a helper function which computes the size of a command.

Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
---
 drivers/gpu/nova-core/gsp/cmdq.rs | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/gsp/cmdq.rs b/drivers/gpu/nova-core/gsp/cmdq.rs
index 1547687834f8..f832252ae45c 100644
--- a/drivers/gpu/nova-core/gsp/cmdq.rs
+++ b/drivers/gpu/nova-core/gsp/cmdq.rs
@@ -437,6 +437,15 @@ struct GspMessage<'a> {
     contents: (&'a [u8], &'a [u8]),
 }
 
+/// Computes the total size of the command (not including the [`GspMsgElement`] header), including
+/// its variable-length payload.
+fn command_size<M>(command: &M) -> usize
+where
+    M: CommandToGsp,
+{
+    size_of::<M::Command>() + command.variable_payload_len()
+}
+
 /// GSP command queue.
 ///
 /// Provides the ability to send commands and receive messages from the GSP using a shared memory
@@ -513,7 +522,7 @@ pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
         // This allows all error types, including `Infallible`, to be used for `M::InitError`.
         Error: From<M::InitError>,
     {
-        let command_size = size_of::<M::Command>() + command.variable_payload_len();
+        let command_size = command_size(&command);
         let dst = self
             .gsp_mem
             .allocate_command(command_size, Delta::from_secs(1))?;

-- 
2.53.0

