Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28259C51224
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 09:34:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A98C410E6D3;
	Wed, 12 Nov 2025 08:34:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mGxG+iA5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011003.outbound.protection.outlook.com [52.101.62.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B812F10E6D2;
 Wed, 12 Nov 2025 08:34:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J4f1UV611dQaOyoD7MY8Qn1Nj7093DuYcPvZL1ef5CzZ9SX29pTv5bYriK3xejmsod8dEm6/r6vGk4b4O9FV+O5U/mrpCUIFLRJqAjMjfOCA5aAzs6MrXr6pfg6Ct99DUuhobXJ/yN53r/1T1gG2KHzCaZjwihbCLX9wsnTsGIDi5A7edI5Z0P3BJgcFDehehjrJGlWbb9JYmvysf0JQNXuXiM+nJdf3UMrX2MOjf8JwnyHiTU64/zBFHZzSUbmgrv/hP6nBtQwxCS2CvQ/KZG2ebjslu5W3r63PWqJg//qGvOtgPlEGdazisExOpOnBXHdWoQehlTb9LLrznppFQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5TWVhtFhwrAENOhW2lACbGXVTKpTpm6/v3FFKYgEp0c=;
 b=NH6eyIfSXYiN6aGjiEdF+jST7topRJKNumGVKIFxi8//swrcVJII0I4nmw/la6HtYq0Ni5nAZroha8NALqOQdGSFe8uy5d958Q5x2bIxOkPe9RGy9o+l2FMoae8QH42qmoSREHeDkSCYgQQLlin0P7U5pHiDT9UURy9Iv+40SopF4rLSWQ+oseNWgtIv4xfFI0f5xRwKOc3tPV9vTcXdJXw2ONAl/2XJHilzzKDaf6LROJwFtGl9K1N1JEIltVihE1KAo4+r/AY43WlKa2CzXEhogkj1HwY7/2NVEAR9Lzn9iCbDwPc8zR4xmWYjeFaJV/aNTJi+tJ4mPaTU+/UCaw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5TWVhtFhwrAENOhW2lACbGXVTKpTpm6/v3FFKYgEp0c=;
 b=mGxG+iA5yieBp9cPVibIIhrFlZX/M9mKpALSLFSeG99fCPkWW7hKDQ5VrgJxDeZ4Bd0Hd6Q4qnorGM3rTL+I1Rlw2PJTTzbNC9TMi//jlj0LqUYjJ57l7AnQ2S1uz+irYYTg2u6x+PVRzrYFvdfmi2EbkqYf4riucaSWqrbgpiE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SN7PR12MB7130.namprd12.prod.outlook.com (2603:10b6:806:2a2::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 08:34:20 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 08:34:20 +0000
Message-ID: <32a918b6-37bc-4d83-ae72-35010d4f1a8d@amd.com>
Date: Wed, 12 Nov 2025 09:34:09 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/5] drm/amdkfd: Add batch SVM range registration
 support
To: Honglei Huang <honglei1.huang@amd.com>, Felix.Kuehling@amd.com,
 alexander.deucher@amd.com, Ray.Huang@amd.com
Cc: dmitry.osipenko@collabora.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, akpm@linux-foundation.org, honghuang@amd.com
References: <20251112072910.3716944-1-honglei1.huang@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251112072910.3716944-1-honglei1.huang@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BN9P222CA0026.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:408:10c::31) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SN7PR12MB7130:EE_
X-MS-Office365-Filtering-Correlation-Id: 08c8a5c8-2998-478c-1cc0-08de21c6464f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U092czY0RWZQUUFlVFM3WitoQVR2Q2hReEN5MkxMMHFiTlJHZkx0ODB5SVVv?=
 =?utf-8?B?VHZmMm5JWlgwWGp0WTNYd21uM2hWYkVXbms4dDBqQ0VVU052VTlNbS93ZWZJ?=
 =?utf-8?B?Y0YxZXF3VkJERzVsc08zc3VQZ3o3OEpEYmh5dnNuNjhXMDI3MWcwRjg2L1JK?=
 =?utf-8?B?UStLdHB4OVJ5V3pHZkpET3EvY3VQaktFTW9mbnBLR2NRRFpqcHc2ZkwxOTJS?=
 =?utf-8?B?YlhmSGczaWdhaEoxVlRNYjBoL0Y5MXFGY3BydU9NdjBVREZOdU0rbXVQV04x?=
 =?utf-8?B?QjB5ZWh6Ni9JdHNWNW1kUCtFOGNxZU9CVGpLM1JLZHRTNFlVYldMYU54MlFv?=
 =?utf-8?B?aFFxY2Q3N0hYWHRFVGtsT1VzaE9ORDlEY2I1dXFlYWZtSTJBUWpyRXdJekRu?=
 =?utf-8?B?ZmhhMTh1eVU2bGNKRnk2MVcwVGI5cUVCaStqUGlCL250WFYyWEtIVW85eTIr?=
 =?utf-8?B?YWxrTlV4a0QwMGdBaWx3RVFxQU01NFV6bC9IeWdJcjgwb0RnNWdhQkpmVFVa?=
 =?utf-8?B?ZTRrVzRJaWhyeTQ3T0lpM1dyTi9lU3g4RWttd2tzelF1YlVjbHplemFVdTJH?=
 =?utf-8?B?aEVXYWhSRFhmbEsvRDlWTlVaWjV4TUpZZEVvV0tZcmRnblEwTndIRUJnK0FZ?=
 =?utf-8?B?RHpTT1RxaWpyOVRWRkMrWG95SHN1d05kUFlqT1MvaGtjcnJabmVzVWRsdUZa?=
 =?utf-8?B?aWxlOU9LMWpJZHppMUpjQVU5NFROOE1pcjd2a1l5MHl4VVVEcnBURW1QR2hs?=
 =?utf-8?B?YkZkczlPaGZVcjJqMFB4SXZvM3AwMzV1Q3MwSEJsTmtCaGU3cDdZNDFlWTcw?=
 =?utf-8?B?TXU1THdLQ3hvZGVsbXNCRzg0Ync0dUVQSmM4VU1iL3RjT211c1oxMTVuaGtK?=
 =?utf-8?B?Mmh6b1NXUWNqdDkvNThKV1ZHcURoUEh1VnBseGVYTVVvS2E0ZnVNN1hRMmxV?=
 =?utf-8?B?djB1ZEdDdDYwcUtXRkdLUDhPcHd2T2pHNVQwN1p5UGY0M3RUSk93aUEweVRr?=
 =?utf-8?B?b3VtZHlQcE80eklReGxyRkFGZGVXaXZ2blVPSXg2S1ZhMFAzUllNTmlBMXk1?=
 =?utf-8?B?elpablkwcUppNGN3R0xyejhXdjlod2JlOGkrNGF4V1FSN0VVdHE5dEtZY29D?=
 =?utf-8?B?aHJwK0N1K3JqQk9CWThlQlRQd0dLVklLUDFaclVIbWF0cnQzdDRmbzVqNmJO?=
 =?utf-8?B?TXBwRk12cjV5RGs0ZUF6dllXVnpKN3crREZQRFM5VkxZQnpzZm1xZUxvS0N5?=
 =?utf-8?B?czVvNVJhMHlSa0pub04yMW5lZ3BVWi9Hb0NpQjdTQjk2Z3FBUU9XZUtWMWY4?=
 =?utf-8?B?eVV3dGhOcjdNM2Q4aTVCRHdZa1IwQkZIVkMzTktxc2VsSDBrV21WODVlSEww?=
 =?utf-8?B?KzkyaG9FUHBvMlRGem5TaUtYQjQvcFBoclpWd3l3bFVpYWJIWUNmenRSMm84?=
 =?utf-8?B?NTFqeFYrRHZ6d2FoNXVyZUwwRmt5aWVCM3lsUzBIc0w5VXVJUDFOc2YzWDkz?=
 =?utf-8?B?eW90S3lwL1JsQnI3U1lNdXduRmkzVUJMaERPWk5zY2dxUkU2eStGWkVlcE1p?=
 =?utf-8?B?RUFNdUprV3QyenA4YlBzNUhHSWhxNEN5clpLWGo0bHdYN05OaGE3UVNiVXhr?=
 =?utf-8?B?OS9EUTBib0NZSUxXM0t4UUh4RExLdFJWbldlNjRZWTAvMXpmRi9iMXl2TkdR?=
 =?utf-8?B?VnlKUXpUdEZ0RS82YktBeittQk50Y1VmVVp6Mk9RQVd4Z1NBT2dmcHlveUk3?=
 =?utf-8?B?YmlMSjB6Y3NVeVJqcUNOQWRBTUROdlNmN2lRWnIwL3dLNDFUQlNSVTVKeEo5?=
 =?utf-8?B?bkdrT3lxbjZQNFJqOGxKY1NoY1FSVEJOMThBbElaM3pmR0UvaEEzcEdnSHRL?=
 =?utf-8?B?KzEzUzQ2SnNsYWRPRm0xaVNPTHV1WWdLcHN3WG80YUx2Z1BTZlJFSXd4OWpE?=
 =?utf-8?B?a3k2THMyQjJ0RVo0eE01cGdDZHJKUTUzWGQzcG5YcHI1UUN6dmtnM0NCNWJu?=
 =?utf-8?B?SW9FYVB2OURRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z1hCNWVOSENzMzY1SVdONVpQaFlpNGNWeExSU2FYWnNPeGF0cGk4Uk1uVHds?=
 =?utf-8?B?eEZnMnU0YkhrSjV0ZS81bTZERitRWnR3akgyeFRlem1RamcxVW5MdWpKVTdo?=
 =?utf-8?B?Q0lRUVlYdlphNXdpaDdUK3c2ejRNQkg5b24vZzcrMGduZ3FxdHp6ck5rOWZo?=
 =?utf-8?B?UmZ1MHVzdUtXN3ZpM2JUMHc0dTFRa0hSQm1qNTE1TmozMUdxVkU0R0VoeWs5?=
 =?utf-8?B?eS9majUxdEkxRWxQS2pJbFU2S25tU1pUTUdXQmEyd0g0TVpxYy82QWhmRURV?=
 =?utf-8?B?UHJqVTJWZE5aSmh6aVAxTlNFMVdqbWs2ZDFuZzRIdEJEWlVSZ0RGczVZUGV1?=
 =?utf-8?B?Rnp6dDY2MGtrbUI4RzJUdW9RbFVUVjU5VkN6bDM2YndTektJZXFTUXpkekM3?=
 =?utf-8?B?T0o3eXhMeEF0cnBxT2EzZzF0em05eEtsUitJWCtBQVpCRHR5dndYMUFBMzdI?=
 =?utf-8?B?OWV2Rm9jQXlVdVc4dzl5cFJicjZvOHVXR1pHek80WDlTcE0vdzh5cUc5a09i?=
 =?utf-8?B?Q0dqaDhkSUVRQ2ZOQ1pRQW42c0dPZDRrQnFtay9NbXZPVVliaERDQkhzZkJF?=
 =?utf-8?B?MnZLOW9zNm9wYjkvRE9BRitQcXhFNzRERk1VaVlHN2R2L2RZQTR0NHFSUTNG?=
 =?utf-8?B?RWRhcTBzQ3VKS2dzZTFzdldxR0RuYVZRMDlZTStXYllnU2NubkxXMXRoRTU3?=
 =?utf-8?B?Z1lGL2tMOVNaODJiQXZ0QUgyN3c5OXk5TnV5TnR3ZndyRGNmanlmYXc1Z2dT?=
 =?utf-8?B?b2o5Z25pdlVlak5vcnlrWTU0RmNxcHlrYkRUcmxJbTVqYUt3ejgwcU1DV1kv?=
 =?utf-8?B?YXRTMzJIbFFhNDM5VHFHVUZwdTlocHgrQTdKa0EzeFJxazFxanpYOTlvakJU?=
 =?utf-8?B?QktzWjloWXVkTjZLRzZJMTJRbVFMUCtTOW4rVS9zN0p4MG5OMHl4NU9rR0Fp?=
 =?utf-8?B?clVQdzhvaFdnbFZsY25TMUx1bkM4WnFXaHZmRUdPbTJPSzc1T3huTlczR2x1?=
 =?utf-8?B?cnJJWTNxWlhYbC91Y0l3R05Qd1dqZTk0TnRXSSt1K2lxSnJOVVJPOFRaWDVR?=
 =?utf-8?B?WGk3YldDYjNVbjdVV0kwNXp3cmJXZ3RzUlVkZDErWlcvaHF1bXpUU1BwOW9Y?=
 =?utf-8?B?eVd4YWw5dndzS3lwcHh0b1hPTVkwbUFDNURialRETjY2aHVhTXN2cmNNZnVi?=
 =?utf-8?B?ZVlpZmY5aXpldUNWQWZQNXE3djJ0SjFkUkpkUE8zejdUQ1huZnQwZmU2L2pY?=
 =?utf-8?B?R3dBcWxBMjlZdU04Umt4QmZzWEhVbWhvYTlhdWwrWGI3U0lQbzhKeDNFTWlN?=
 =?utf-8?B?eVZIcHBzczFaMDVxT1NhejlxcDJwK1dRN2R3VW5RQWRoWkMvdXpCYU4wUUl1?=
 =?utf-8?B?N2NaQjdpbEt0QUlmWUR6WmU4alhlS2U2bW9BSVVGOS9IV255TVl3S0pKTEpU?=
 =?utf-8?B?TDdvTjkrb1BGd2g0ZGxEQWoyS1Q5ZWFTQW1hbGpSNXVvSmVOVkFwdTV0YmFl?=
 =?utf-8?B?M09ra2tVOXJmZjVxNUVjN2pLMitGd21QRjNFOXZIU1J4RjBhS2ZYZXNVWDdC?=
 =?utf-8?B?NDBTRi9ZZ0NLU01ibFBwVXgzWnRhTGZYMGJqdnk4NUVKQldwZlhlN1RLeTBq?=
 =?utf-8?B?bXV3SGhIdy9SQndiaCt4OEhEMXVvenpTTUNlZWRUSmtZeC85VmVwVzNtWmdQ?=
 =?utf-8?B?RTBJVHczZWtXcGxhRkRjNlZrQjczaDNCTERJNFJ0NVVhOXh6Qm1KRmZ0WGJv?=
 =?utf-8?B?RU41cjNUalR4RDVuajZKZUdKeGRSNmtjOHB2OWUzTUJGQVNiSFdIMjNtR1pX?=
 =?utf-8?B?akxqMVVoamNEck40UGZrQ2xHa3Mxei9qL003Zks3TjhDY0s2MmNCUDdDaEt0?=
 =?utf-8?B?Q3lMcFpXVzhQTWdrRmxINmdYYkZXY3BXL0prOUVGUzFndDdXY1V2ODkxVkwr?=
 =?utf-8?B?OXNLMEhOYVlxREhhbE5mUVVvb3hwR29NZnZoWkRJa0J2NnQ3TXY1dm5SZG1Z?=
 =?utf-8?B?WGlKZW1sQi9pN1JoSUU4N0dMSHl2YTdIdEp3MUJEWS8xaUVlNjBmL3dtVjJH?=
 =?utf-8?B?QjNjTGJyS3ErNVNBaXBkd0pia2V1bGg5QW9HYWI4QjY5RU9MSDZkVEY5Z0sw?=
 =?utf-8?Q?f8uNm6N5Z/FPE/7vaQf8A79Eg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08c8a5c8-2998-478c-1cc0-08de21c6464f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 08:34:20.2436 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: leCC98dtmB9i4ncimR9HPapfKbWezP6pCuzpx3pH84BFfUVUbF7FViEx86c2eJwP
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7130
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

Hi,

On 11/12/25 08:29, Honglei Huang wrote:
> Hi all,
> 
> This RFC patch series introduces a new mechanism for batch registration of
> multiple non-contiguous SVM (Shared Virtual Memory) ranges in a single ioctl
> call. The primary goal of this series is to start a discussion about the best
> approach to handle scattered user memory allocations in GPU workloads.
> 
> Background and Motivation
> ==========================
> 
> Current applications using ROCm/HSA often need to register many scattered
> memory buffers (e.g., multiple malloc() allocations) for GPU access. With the
> existing AMDKFD_IOC_SVM ioctl, each range must be registered individually,
> leading to:
> - Blocking issue in some special use cases with many memory ranges
> - High system call overhead when dealing with dozens or hundreds of ranges
> - Inefficient resource management
> - Complexity in userspace applications
> 
> Use Case Example
> ================
> 
> Consider a typical ML/HPC workload that allocates 100+ small buffers across
> different parts of the address space. Currently, this requires 100+ separate
> ioctl calls. The proposed batch interface reduces this to a single call.

Yeah, that's an intentional limitation.

In an IOCTL interface you usually need to guarantee that the operation either completes or fails in a transactional manner.

It is possible to implement this, but usually rather tricky if you do multiple operations in a single IOCTL. So you really need a good use case to justify the added complexity.

> Paravirtualized environments exacerbate this issue, as KVM's memory backing
> is often non-contiguous at the host level. In virtualized environments, guest
> physical memory appears contiguous to the VM but is actually scattered across
> host memory pages. This fragmentation means that what appears as a single
> large allocation in the guest may require multiple discrete SVM registrations
> to properly handle the underlying host memory layout, further multiplying the
> number of required ioctl calls.
SVM with dynamic migration under KVM is most likely a dead end to begin with.

The only possibility to implement it is with memory pinning which is basically userptr.

Or a rather slow client side IOMMU emulation to catch concurrent DMA transfers to get the necessary information onto the host side.

Intel calls this approach colIOMMU: https://www.usenix.org/system/files/atc20-paper236-slides-tian.pdf

> Current Implementation - A Workaround Approach
> ===============================================
> 
> This patch series implements a WORKAROUND solution that pins user pages in
> memory to enable batch registration. While functional, this approach has
> several significant limitations:
> 
> **Major Concern: Memory Pinning**
> - The implementation uses pin_user_pages_fast() to lock pages in RAM
> - This defeats the purpose of SVM's on-demand paging mechanism
> - Prevents memory oversubscription and dynamic migration
> - May cause memory pressure on systems with limited RAM
> - Goes against the fundamental design philosophy of HMM-based SVM

That again is perfectly intentional. Any other mode doesn't really make sense with KVM.

> **Known Limitations:**
> 1. Increased memory footprint due to pinned pages
> 2. Potential for memory fragmentation
> 3. No support for transparent huge pages in pinned regions
> 4. Limited interaction with memory cgroups and resource controls
> 5. Complexity in handling VMA operations and lifecycle management
> 6. May interfere with NUMA optimization and page migration
> 
> Why Submit This RFC?
> ====================
> 
> Despite the limitations above, I am submitting this series to:
> 
> 1. **Start the Discussion**: I want community feedback on whether batch
>    registration is a useful feature worth pursuing.
> 
> 2. **Explore Better Alternatives**: Is there a way to achieve batch
>    registration without pinning? Could I extend HMM to better support
>    this use case?

There is an ongoing unification project between KFD and KGD, we are currently looking into the SVM part on a weekly basis.

Saying that we probably need a really good justification to add new features to the KFD interfaces cause this is going to delay the unification.

Regards,
Christian.

> 
> 3. **Understand Trade-offs**: For some workloads, the performance benefit
>    of batch registration might outweigh the drawbacks of pinning. I'd
>    like to understand where the balance lies.
> 
> Questions for the Community
> ============================
> 
> 1. Are there existing mechanisms in HMM or mm that could support batch
>    operations without pinning?
> 
> 2. Would a different approach (e.g., async registration, delayed validation)
>    be more acceptable?
> 
> Alternative Approaches Considered
> ==================================
> 
> I've considered several alternatives:
> 
> A) **Pure HMM approach**: Register ranges without pinning, rely entirely on
> 
> B) **Userspace batching library**: Hide multiple ioctls behind a library.
> 
> Patch Series Overview
> =====================
> 
> Patch 1: Add KFD_IOCTL_SVM_ATTR_MAPPED attribute type
> Patch 2: Define data structures for batch SVM range registration
> Patch 3: Add new AMDKFD_IOC_SVM_RANGES ioctl command
> Patch 4: Implement page pinning mechanism for scattered ranges
> Patch 5: Wire up the ioctl handler and attribute processing
> 
> Testing
> =======
> 
> The series has been tested with:
> - Multiple scattered malloc() allocations (2-2000+ ranges)
> - Various allocation sizes (4KB to 1G+)
> - GPU compute workloads using the registered ranges
> - Memory pressure scenarios
> - OpecnCL CTS in KVM guest environment
> - HIP catch tests in KVM guest environment
> - Some AI applications like Stable Diffusion, ComfyUI, 3B LLM models based
>   on HuggingFace transformers
> 
> I understand this approach is not ideal and are committed to working on a
> better solution based on community feedback. This RFC is the starting point
> for that discussion.
> 
> Thank you for your time and consideration.
> 
> Best regards,
> Honglei Huang
> 
> ---
> 
> Honglei Huang (5):
>   drm/amdkfd: Add KFD_IOCTL_SVM_ATTR_MAPPED attribute
>   drm/amdkfd: Add SVM ranges data structures
>   drm/amdkfd: Add AMDKFD_IOC_SVM_RANGES ioctl command
>   drm/amdkfd: Add support for pinned user pages in SVM ranges
>   drm/amdkfd: Wire up SVM ranges ioctl handler
> 
>  drivers/gpu/drm/amd/amdkfd/kfd_chardev.c |  67 +++++++++++
>  drivers/gpu/drm/amd/amdkfd/kfd_svm.c     | 232 +++++++++++++++++++++++++++++--
>  drivers/gpu/drm/amd/amdkfd/kfd_svm.h     |   3 +
>  include/uapi/linux/kfd_ioctl.h           |  52 +++++++-
>  4 files changed, 348 insertions(+), 6 deletions(-)

