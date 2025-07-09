Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A793AFF208
	for <lists+dri-devel@lfdr.de>; Wed,  9 Jul 2025 21:50:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3A9B10E81B;
	Wed,  9 Jul 2025 19:50:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="W0ECGU5v";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B787510E80D;
 Wed,  9 Jul 2025 19:50:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EpijbeIW2DufPyVpsE+o9EPWy9kH5r2JAq3cBePYc6q7DbLsXrDVkGlTkVMBhERwv8CqzWwXUbxmw98lINqVSXOl67sokjsCGWW7GjphJ0ja9SE78gaQ4qko2sPAqMKqlfQq9ROhUCWRmBr3T4rPYw8MZ70XqbcwpvBG/u/BjC5Fe4rj63N9BA4bEGPwiL0txif9l/R/NAOb59W83fhwKc7gK3kWeqxvE5ILwbPF9zukx3ddGKwtvdYeNMhQux/eIqArI4W9jNbr4rMaWnYVquaTkBqtMgxDb7GWhkH9a3DhxCWyf3Krri/jpVa/VFYXtVKwnJiRLNOEuP0cx2BkPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=29nQHbM2Tna6/P5AZVVCMZsfMfhZ+c6zkXL9OpIR3nE=;
 b=UhaJCG6yayFYt5kTSQSSqDvW/HTczSCuyKzPSXfzTsQqg+BPYYyCkT85FsPlDrO953MLREwaMccAiP4xmwSx0FIw4HKo9H1MZTdPafmwrxlw9rZGMwBoL7CHld0S8zBiy1fDQcfo6w5DpB++GR0Xre+VOrLPxYHmcree2/cXME3pr0CvgpAcZfFxUtsMhBquTwviMA9jnDzbmvWvr5hfJeBe5D+wLykDdsWnM/+z8gIYXLiDYOXrhT5ec6A0Tu+B7BEPrbiaN4ciVhzCTxUARu4JpMEpzO46aY8JW1B9dPrq2L6PxYXS/MsVIgQiHde3FYKc2wPFBA3+SD+a19Zn2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=29nQHbM2Tna6/P5AZVVCMZsfMfhZ+c6zkXL9OpIR3nE=;
 b=W0ECGU5vw6vKpgk2NRcjVs3FmnRBml8iYSwhh0cE5k9tEEdkGVFhfb7hrkLRO0Ch7UpmEJAegFN2UpX9wAxDzNj3ZISc//B8uBq7N+/On6Dz9S2wyCvf9BFOLLJVjoSqhzFCO8Rst+GLh3dZDNKm/fA7M1JJ5e0fsN6L70WSgTs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by SA1PR12MB7444.namprd12.prod.outlook.com (2603:10b6:806:2b3::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.28; Wed, 9 Jul
 2025 19:50:35 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%3]) with mapi id 15.20.8901.024; Wed, 9 Jul 2025
 19:50:34 +0000
Message-ID: <6963322b-d4e2-4d4d-b4b6-e2c44d49a94b@amd.com>
Date: Wed, 9 Jul 2025 15:50:32 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/5] drm/amdgpu: do not resume device in thaw for
 normal hibernation
To: Samuel Zhang <guoqing.zhang@amd.com>, alexander.deucher@amd.com,
 christian.koenig@amd.com, rafael@kernel.org, len.brown@intel.com,
 pavel@kernel.org, gregkh@linuxfoundation.org, dakr@kernel.org,
 airlied@gmail.com, simona@ffwll.ch, ray.huang@amd.com,
 matthew.auld@intel.com, matthew.brost@intel.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de
Cc: lijo.lazar@amd.com, victor.zhao@amd.com, haijun.chang@amd.com,
 Qing.Ma@amd.com, Owen.Zhang2@amd.com, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20250709100512.3762063-1-guoqing.zhang@amd.com>
 <20250709100512.3762063-6-guoqing.zhang@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250709100512.3762063-6-guoqing.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0049.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::30) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|SA1PR12MB7444:EE_
X-MS-Office365-Filtering-Correlation-Id: e9d2c341-8dba-4b94-688e-08ddbf21de7d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SlNQcERYb09BSHIwUElpRHhMdW5wS1lTTHV5M1FoK2lZbGpyNVQzRnpwZ1pG?=
 =?utf-8?B?eTYrZ0hmc0xBUVBoeDBZUlAwZldIM1ZWVVFueHp4czAwT2J5Mk5iMm5vSWMz?=
 =?utf-8?B?YnYvQk5sNDlSd0FoTEhId25LZGRpU3Mrb1BycjNUT3pHeHRaeER4WEk4R1VK?=
 =?utf-8?B?TDVsYktwTm9wcDYxanZhNUFkeUhEZE1HQXFHYkZNdU1kRk10NlFtU3QrMDNS?=
 =?utf-8?B?bWtxbUhXYWh5b0hsaDBrZlVjWHJmYURMUzVNY25HVHR4eExGTFlxUGlicHQx?=
 =?utf-8?B?TitwbGJFcExLZzM0VUZiZzdlVi9Ib3g3STlIR1hoSlBBUFgyaXluUHNvbWgw?=
 =?utf-8?B?clpaZzNobjNPOVRuOFI3UzBKNVZkaG1KVGc0aVZyaGFWcWp0cTN2d081cGI5?=
 =?utf-8?B?cGFpK3NSdmlGalVGQ1paQ2lXQlV4aXpBNWMzdnIwVjNsNW5NbHMrMy9EYnEz?=
 =?utf-8?B?bHBTOThjcHJtNVQ3UGdSWHZOWnhjWXB5OUpYaVZnNUU2VU9sdWhYbTJob0s1?=
 =?utf-8?B?TnA2TFA5L3hHYmt3d0hvNlI0UmJTT1pzVTdQcllCRVhuT3k4WDFZaVdsMjlv?=
 =?utf-8?B?TU51Y3JFTEZhYnJtZVNpeERjZmZzREhIQzJ2amNlVEllT2U2WHNHcis5VXVM?=
 =?utf-8?B?dnYrK05uWGFwRDlGa3RuOTEzWEo2SWI3UVBDNmphMmd0UERqNzk4MUNKOGJI?=
 =?utf-8?B?NW9Gd0hGaEVOdUtUcUx6b283N053eGtXdmtQcUhUMmUzNzc1blBaK3I3NnQ0?=
 =?utf-8?B?dmJieGtveU5Ga0dGTGw2NWtUZ0lNNngrLytrYXl2Q0VDSVlOeHlnVERxNzBj?=
 =?utf-8?B?aG5TdWxuamtPWFExNEo1TnJHaHBvUUtRVHBxSmRZcGJiakVRRHBTb0lOUUVq?=
 =?utf-8?B?YUR2QVBOK054QTJncGxxQlkxRHlpNEk4emZMNVhTNHRiL2JGUFM5amRqN0Z4?=
 =?utf-8?B?UGdST1c1dlZGWUJUOTloc2tNclZybGs0M21lQk4rRkMrRTE3em5mQTQ3RUdK?=
 =?utf-8?B?a0FYTVVFVWNhMlZReTN6UDc1UHBzNCtRZDBicnZrRy9rbUVtNzZSOG9MZW8w?=
 =?utf-8?B?QmQ4SVlSd29ncGozVExZOWZUWVlSQ21wYUF2SkU5dkw4aHFnSmFqRkdSOWcw?=
 =?utf-8?B?ZHJsSWdYUTFna21CbVZ4aFEyQ0pSQXVqNHEza3AxUTdxaGlSNkNHL1FxajEr?=
 =?utf-8?B?bG4wSVdqWkJGbVJPNG1iSms5bU5PUjFMLzRScUFhRFlLUXErbHlLTVBJaW9G?=
 =?utf-8?B?Q0pIUmgwMmlLZTgxVTAxTWJsbzJSN2Q0YVRrUzJpZGJrR3cxWXNEUWlrYUhj?=
 =?utf-8?B?Z3BEQnp5NE1iUTZEZk0yV2xjaW4vUGY5MFJCU1Vhc3pKdzBxY0cwV2xPVWg4?=
 =?utf-8?B?NHRsNnVyRTdoRE9uSUM2aTRDclZVcUhiQlFUT0E1SEtEQWF3dDVDYWxEVVY2?=
 =?utf-8?B?aUF5cVpMcEhzVExacG93bXFabDZqQWRaRHBzc0lBazRvbGtIUW1ZaTVmUG1p?=
 =?utf-8?B?azFUQWw5Z3ZPU3l3U0ZzcllQSzdkZFpZNzh1SXY0YWpPRVV3bHdWMktLMjls?=
 =?utf-8?B?eFd6NFdLaFpVaUJFMXNPMk1oSlEwaE5Bd1MvUFgwQUVyMFNkSzJGeEZ4MWJ4?=
 =?utf-8?B?VWhBb3BLREJNZDd5SEQvYUNlWDJrd2hjWDVtYXFRVzZESWpPOTBIQ0NEZE9S?=
 =?utf-8?B?N3RUa1o5a0Y2WjhTN0NOQU1EbGR2bERweWw2WWJWejE1Mmo5TTlIdUVvTnpv?=
 =?utf-8?B?bkdqSW5VdUNBckozZWk2eThrczBKR3RZQzU3eUxLTDJLcmJsNVNVNHlxMTI3?=
 =?utf-8?B?NkZIczJwY1JxeWZTblRiRU1ta25sWHE4VFNWVjhpMithVDJ4R05PZ3Zld0dX?=
 =?utf-8?B?UHRyRUhvamF4aGpGZVIxcDdabDRDSEZVWVNaNjdpZFJqUzBTRzhoV1RwY1k1?=
 =?utf-8?B?eHRaSzc3ZWZ2VjRsRmE1NnFZb0FuREhtR0ZYZU1ScW5wV0ZTUjFqWHBuZXl2?=
 =?utf-8?B?NnlJbDFTQitRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZDludnBvb3o0RjN2UFpTZmRKeThJVm5sODMyRWFzMUx1Rko5QmgxemJxZjhG?=
 =?utf-8?B?dDFNNHArYXUwUFVNTUxFTXVrMnpuNHlhMkVVeGk0MzhIYkNRbTZ0U0Jvc2Rk?=
 =?utf-8?B?TTJTM09DZDhZUlZ2U3Zyc1FneGtObGF4WjIySWwxeUh3QnJXZ2dNZmVqM2Ro?=
 =?utf-8?B?UzZ4a09MTkxJNlNmWG05aGJSWmJmajhBbm5pS2NOc2loZjVpMWRRQU4wZUVP?=
 =?utf-8?B?QTRwTWdtaE9uR3EyVWZBaFgrTjVSMThYOWRWTXhlMEF0MWRVWDEydE5keGpn?=
 =?utf-8?B?UlZ4TlNSNmxQOTFKbHFxK3pkSDBtR1pybFpBVHZ0cCt1RHdLejFvbkJKMUxP?=
 =?utf-8?B?Njd6NXNsSzZFdXJpMW90eWVEMFNkNWtpRThzd056TzVKVThuR1RodmZhSDU4?=
 =?utf-8?B?OXJ4OVUxZytSZUkrU21UNG1leWFOZUlXMllaNW5wTjRhRXpmeWtwUlprYzNJ?=
 =?utf-8?B?MVF4eXVlekdpcFBhWFBxYlY4R1ZON0kweVV3YkZYS1BXeWMzRTFNdkVJMzZk?=
 =?utf-8?B?Tk1mdHhJRDk5VElYOWQ0U2FHSVBTQ1JaSVRqK24rWWNSc09OSGV6R3RSbDhJ?=
 =?utf-8?B?dmpsVlBhdllVcVQ0TWlpRURYMEk3UWllWG1JT2xUV2EvTDJsTEpmeVVpMHRo?=
 =?utf-8?B?N2pGV1RvUUFhN1pna1F4YzdrRGxvZHlpelpsMm1UYy9YbnlLL1g0UmdoMkRx?=
 =?utf-8?B?RGJzcjJiVXVMNktKSWdPckZMNzQ2RXdvUG5xcnFPcVh4aGNMTmlHaFBUVnBu?=
 =?utf-8?B?emIzdTBJd0ZUMTdncjQ2ODh4SG5HQWNxWlNnMmVPL2N0NTRRZGMyZXZ5VkR2?=
 =?utf-8?B?V3lIUitCOUNKU0djUVg1Yi9vLzRGK1RCNnBxVkpSVmhLaWNaTHFoNHk4aU5u?=
 =?utf-8?B?SVJKSFdYbXRTV0hVRFBCOFUzZDhlZHd4SlB2cmh1Q0l3cGtpaForZW5EZ0dK?=
 =?utf-8?B?T2pjUnd2UDNZZHZxZFRwaCtsWGdSWUFPK29TZVpKb0JvKzVNRGQyTVJwNWtv?=
 =?utf-8?B?ZGlCMzhrUzNGYWxhbUxCUTJWWHRDbUtnamRyRWlEakg2ZUJtTlB3RjcrckRl?=
 =?utf-8?B?TVI0d29NRnp4T3h3ZStDNm1vSm5RRG9ueU94c1dPT2RvMGF1eEhXdVkrb2Nn?=
 =?utf-8?B?K3ZpUlNHcXJZNGg4Unl1UGJXSVhJekk4cUNCajB0TWV4WXRxcDJYMWRzVnZZ?=
 =?utf-8?B?NVZ2M3JIZUdDS2pUNG14V1k4SnMzdXd2Wm9CcTA4VnhNdzBQSk5yTmxnOVhC?=
 =?utf-8?B?a2h5N0NQWUZOYll1YmY2MzJWWjBRZ0UvbG11V2lsYURsaG5ERTREMlpld3Ur?=
 =?utf-8?B?SzRaSmdOVUZhbmtXQzRjSUJqNFF6YmY2TktmQkpqUnlWRHJLTnhnYjFyU1Rz?=
 =?utf-8?B?VUxoMWFncU11YTVJbHVuWjM2bFJwU3BlY1prN2VLK1NyNDJ4ZElZWCsyTnRZ?=
 =?utf-8?B?K0FaZi9zMzBpbHhTdzFuTEd4R1Z4UkV1cFJNUllyeHkzellxZVJldEtmMVB2?=
 =?utf-8?B?MjQwRnBHL1VDMDRDaUJyc1MxcWJQMCtKd1QwSER2OGtaZU9UeVllSDA1VEpx?=
 =?utf-8?B?UVlMREhIb2ZOU0JBbEtodit1TUJwUVJ1S0dHZUpxQkpWZTZyUVB2Vmx5R1cw?=
 =?utf-8?B?bTFvSlRVYjRjeHBteDJJOE01ZFpJZHVuOW9OMERLclNpc2ZWZlBzSCtSYmJo?=
 =?utf-8?B?WHJ4NmhSdkFYUGhRZkVVVEFaeVlRbHBIUGxoU1FlZkNLNDdleFdESklLVkdP?=
 =?utf-8?B?U3c3S0pGSWhTZjAwOUkrQWdkc0Z5RW15SzdUb29ZVHRLZGdrdnBXTGloZEVv?=
 =?utf-8?B?YWRvY0xPWlBhSW1FK3l2dWg4T1BLQTFqeFlkSEgxSUQ2VFJLUGpyQ21zelBv?=
 =?utf-8?B?K1oyamt0RU5EbGM3QkFRNTFJT1VvMmdCUzdrQS9sTStDdTg1ZCtEbUNGQUpy?=
 =?utf-8?B?dGRTbkJNTldubnpDcVFQNzFxQjJ3K3pJd3o5N1UxUituejFOcXlIdHJxVzB4?=
 =?utf-8?B?QWprNVlRVnFEdEpndUQ5OGcyZGtlR29FR01sVkdueTVCbEFjQi9pRVM5Yk5i?=
 =?utf-8?B?eXRRR3pCTjZDU0R1ZnZ5UmZPTURTL1Y2NkNMeTVxeGorTTVZQkRoVGJqbWxP?=
 =?utf-8?Q?jjDnBa6IYDK/u3uth/9VcJuwq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9d2c341-8dba-4b94-688e-08ddbf21de7d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2025 19:50:34.7129 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /tyV+t03XnnybNTdHfW1SLl4rLtZm/d8u0PlWGw//uy9DxuCqn5I8FgPOsA/ql6B2oIpvZVu4wDeMgz6/UErpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7444
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

On 7/9/2025 6:05 AM, Samuel Zhang wrote:
> For normal hibernation, GPU do not need to be resumed in thaw since it is
> not involved in writing the hibernation image. Skip resume in this case
> can reduce the hibernation time.
> 
> On VM with 8 * 192GB VRAM dGPUs, 98% VRAM usage and 1.7TB system memory,
> this can save 50 minutes.
> 
> Signed-off-by: Samuel Zhang <guoqing.zhang@amd.com>

I hand modified the patches for other changes missing from linux-next in 
your base.

I checked on an APU with an eDP display connected and from a VT 
hibernate does keep the display off now so this is definitely an 
improvement there too.

Tested-by: Mario Limonciello <mario.limonciello@amd.com>

> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> index 4f8632737574..b24c420983ef 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c
> @@ -2541,6 +2541,10 @@ amdgpu_pci_shutdown(struct pci_dev *pdev)
>   	if (amdgpu_ras_intr_triggered())
>   		return;
>   
> +	/* device maybe not resumed here, return immediately in this case */
> +	if (adev->in_s4 && adev->in_suspend)
> +		return;
> +
>   	/* if we are running in a VM, make sure the device
>   	 * torn down properly on reboot/shutdown.
>   	 * unfortunately we can't detect certain
> @@ -2557,6 +2561,10 @@ static int amdgpu_pmops_prepare(struct device *dev)
>   	struct drm_device *drm_dev = dev_get_drvdata(dev);
>   	struct amdgpu_device *adev = drm_to_adev(drm_dev);
>   
> +	/* device maybe not resumed here, return immediately in this case */
> +	if (adev->in_s4 && adev->in_suspend)
> +		return 0;
> +

Is this one right?  Don't we still want to call prepare() for all the HW 
IP blocks?  The eviction call that happens in prepare() is a no-op but 
there are other IP blocks with an prepare_suspend() callback like DCN.

That is I think you're destroying the optimization from commit 
50e0bae34fa6b ("drm/amd/display: Add and use new dm_prepare_suspend() 
callback") by adding this code here.


>   	/* Return a positive number here so
>   	 * DPM_FLAG_SMART_SUSPEND works properly
>   	 */
> @@ -2655,12 +2663,21 @@ static int amdgpu_pmops_thaw(struct device *dev)
>   {
>   	struct drm_device *drm_dev = dev_get_drvdata(dev);
>   
> +	/* do not resume device if it's normal hibernation */
> +	if (!pm_hibernate_is_recovering())
> +		return 0;
> +
>   	return amdgpu_device_resume(drm_dev, true);
>   }
>   
>   static int amdgpu_pmops_poweroff(struct device *dev)
>   {
>   	struct drm_device *drm_dev = dev_get_drvdata(dev);
> +	struct amdgpu_device *adev = drm_to_adev(drm_dev);
> +
> +	/* device maybe not resumed here, return immediately in this case */
> +	if (adev->in_s4 && adev->in_suspend)
> +		return 0;
>   
>   	return amdgpu_device_suspend(drm_dev, true);
>   }

