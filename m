Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F901A8B1F2
	for <lists+dri-devel@lfdr.de>; Wed, 16 Apr 2025 09:22:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ACB5710E85C;
	Wed, 16 Apr 2025 07:22:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BcE5FnzB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2075.outbound.protection.outlook.com [40.107.94.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A004F10E85A;
 Wed, 16 Apr 2025 07:22:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aR7GODIfD+Sm0gHTilo9A0/SIJUAQ9WhvuQMJ2HFqdY9i2lB1kfGhgfQWL5c9FqQssXo0wHckd4BpY5ivcm0G2avRLzKUoVD2jOmbGZY3Nr6DcLYDSUnz7ffAMwtBQCpO3EnR1FOKozSjmaTSXYJhCrbXLQw+UVs4kUPJf0OFHVLzEceDgiksumm2ZwN0ub0nWBc3fHY4Mr4io60LL630pFT2rLWULr8titnXunnQm9upjuLKOoBhu4Fju04enrJEtdcmXP+VHw5ukx1YP99/bTIc1egy80VE8Teh/RZuZwWGOvzJdZ2qKgxsjBjNklHzIEV3D1UkmcYeUCpCgO6LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PUVBGNA/tdTCDXD+r7GYPaXu6lJwQTVOXAxizx0MhPs=;
 b=RqHhbGgXHA7rPMD2bLuD9DZyFchO4lNQSjpc4pR6DAINyyMjJmwgb2n4MmklQW7BjQ1jevWvZH4mHr9yAeeV6K1pUlc4Gtydr7+KqnrVNAg/QjNUTpyLn8d/M7YD9uU576bu89Bgwe1VTRv0ceDgP4MBaBEWSy7VBfnKqgntDq5+rPeSQQDAaY7oUHY51UQe+OrtMVYKfnlOQJJCeZ7RyMqIRH1eipoai7XdjJMB+t0FgPk8aoOeByYQjKAhZiQBmydZ8WnG9zPoLgUZIuXUXuk0RFDqOefvC1hhAHBl5u3rZVcvEd3eqiyypnq8cuqQu08X070isSlZ9H9RhVM4Xw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PUVBGNA/tdTCDXD+r7GYPaXu6lJwQTVOXAxizx0MhPs=;
 b=BcE5FnzB3qnrBdaR+lrf329zvo8HJkBqoph5OpRkGR4J8zBEYoR1pf+5ucnx/0XuZRyFg0WHzyrpmq6JReQaIMx/O89a+ATJusrv9E2/QYNt1I3az+0DN4eKJ6ToOPmKrUgtSGGBhu61L2KmQHi7DnAH3FbTy/BfCQIcoiNCT5I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5753.namprd12.prod.outlook.com (2603:10b6:208:390::15)
 by PH0PR12MB7864.namprd12.prod.outlook.com (2603:10b6:510:26c::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Wed, 16 Apr
 2025 07:22:49 +0000
Received: from BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e]) by BL1PR12MB5753.namprd12.prod.outlook.com
 ([fe80::2b0e:7fc3:1d21:5d2e%3]) with mapi id 15.20.8655.021; Wed, 16 Apr 2025
 07:22:48 +0000
Message-ID: <2203cab6-9e84-4140-8f8a-e376b4487f36@amd.com>
Date: Wed, 16 Apr 2025 12:52:42 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] drm/amdgpu: change DRM_ERROR to drm_file_err in
 amdgpu_userqueue.c
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Sunil Khatri <sunil.khatri@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
References: <20250415184318.2465197-1-sunil.khatri@amd.com>
 <20250415184318.2465197-4-sunil.khatri@amd.com>
 <8b5614f3-4500-4bf3-b497-cc5cd8b9a5e7@igalia.com>
Content-Language: en-US
From: "Khatri, Sunil" <sukhatri@amd.com>
In-Reply-To: <8b5614f3-4500-4bf3-b497-cc5cd8b9a5e7@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN4P287CA0113.INDP287.PROD.OUTLOOK.COM
 (2603:1096:c01:2ad::9) To BL1PR12MB5753.namprd12.prod.outlook.com
 (2603:10b6:208:390::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5753:EE_|PH0PR12MB7864:EE_
X-MS-Office365-Filtering-Correlation-Id: bff247e8-0431-4f86-1811-08dd7cb77d8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?ZmxDOE9LdnVHdWhKV09jM29NZzMxQU54ZlBQVHA4WktvZG9ZUlpJeWE0VTZP?=
 =?utf-8?B?Y2d4cm5Ka0Jqb0pvU1AwZXNKS28yclhKcll1d2NYcEtLQzJFVENrOXlXbUhB?=
 =?utf-8?B?dWpVSWxhbTM3RGxXU01xYW81cFZPd2xacGZLZ3M1YzZKZG9qN29BME4yaFFs?=
 =?utf-8?B?MU9ZbThzdFFYSUxPazNOT2liTUZ6Z3g0S3oyTEVMYnA0M2dJZWt6WXRVeElr?=
 =?utf-8?B?bkc5N2hKaEpRaHczY25MNkhYejYzRUJzdlJJcnVrSzdCR1l6aFJ1SjhCSXZu?=
 =?utf-8?B?dWpvcnR5WDAraDJRMmxjVGpWOFBmS3RnWVltWW44NmREdlM1Z2xQSVF5Qk9G?=
 =?utf-8?B?VnIvV1RZNy9DbWhkL0xoWmJFUWQ1YmVXTHZaMnc5ZHVxOGhFbG1GdWJTKzcy?=
 =?utf-8?B?UkNpYmY4WXVpaFZEa0JtSlZ6c3ZISTh2N3lSSDV0Q0Ivcjg1STFmNFdvZll3?=
 =?utf-8?B?UVhKWlozOUxYYTdoVEU4WUl0dXVPaitNSlF0Z2dMVGVwME5kcDduc1JSdGxR?=
 =?utf-8?B?Rk9JT08xVENwOHAzMDZIcG1zaDJtWm5IYnZxQXQyYzlDbWN1N2l0NVdYVXNo?=
 =?utf-8?B?djBPWjloeGNXaUJXZklLeG5OTFBtZjdpekVEUEgrSDYyNnNLWXlSOWowRTJY?=
 =?utf-8?B?WEdjMWhaa3BKdS9oQk00OFVKRklrWWRNZXU4SzlDSDFZYTZGYkQzekN0Nk51?=
 =?utf-8?B?dFdrdFRuUDUyK0hWRXI4eGhnZGpnbW5yTGZaRjh0ajdPM1VlTFRkQjA1TXpz?=
 =?utf-8?B?YkcvVWNnK0NYeEFGUzR6Rk1ra1BkaWlBQU12cEdLMWcvME5LZ0Q4V1ZLSmR3?=
 =?utf-8?B?RmFUS3l6REtlRUh5MG42UDF0cmoveC80NzdxUDVIY2llNFF0ejZ0THF4dy9t?=
 =?utf-8?B?Mi90VU1ieFM2ak1NQnhISjFNejFsS1h2Z25kRm85L25GcXFxU2tkczlWM1JW?=
 =?utf-8?B?T1RHdUExc1RaSkRITjhIZFFjYUFiYjJQWHdkWEE0V3dWOFd4MVBGZ0FiZUhv?=
 =?utf-8?B?NmRmUmY4RkljMjBUZWdSdGxMNjJvMjhTaHRacUNGbkRMSjkvaXZJYVE4cEla?=
 =?utf-8?B?UlNuRUhLZGpwVHBBTGVCRHhHa2Z4NVpORWRaTWFNMGlJaVFBUU5pWnhZemxz?=
 =?utf-8?B?WUtKVHJoVzNPYnBBQzlMdURmaHNQZGxEWkRvSm5JeU9HMGFNQlVlZktvNnhG?=
 =?utf-8?B?UlIydE94K0hrMHZrdk1TazlwRkQxeHM4OEN3aEdxazBmSUsrZWpWVkZJZ29i?=
 =?utf-8?B?ZkI4cE9MNkRvWTZZZWJ2SEtWNTBkdlZrbTBMUjdLcnhybzZ1MDRXTmxNMnZp?=
 =?utf-8?B?SEd6RXYxa0g1UitkYngveUlPL1ZpYyt6U0c2bUt1TzZTcUVyVUJURFIyOGVZ?=
 =?utf-8?B?bGVrK0dTSE14NWZEVW04aXp3QThLMUljUHhRSjBwb3dIY0FrMlErVGk3REdD?=
 =?utf-8?B?VVlzVHRVamFpTlVmYlpxcVZNZWpHbVgxb2l0WEJ4a1l0aTZXdXA1RE9wY2VJ?=
 =?utf-8?B?cU9OeHRSS2l2aFhtZWtrbkRsdmR6Z2JqZjM0K3ZTMnJvQytIUU92NTQza05a?=
 =?utf-8?B?eHlNN0J4TkUvb0o1U21YYlRNZnpGMU56V2dXRWV1bTNWT1prR25vamlXZFl1?=
 =?utf-8?B?UHNlSUgzRmRycjZNaTJ6amRnUlN1aHg2SGdkLytkTjR0cW01d0k1b3haU0xW?=
 =?utf-8?B?bnlNOTNOd2ZndTdJK1R0VDVtYjU0NEhwR0dRanpYMVFOSFA0dzg5U0lwSUNt?=
 =?utf-8?B?RWNyeWx5UlZGeE0yZUdiQTVoVklBTkloL1hxWDZOczR0d3l4SkZ5VlZESEIv?=
 =?utf-8?B?aXJiQzhiWlVUM29rYTNKK2VTdExVeHFIUDNKUy94WTdRVlJva3lKRlVEbG56?=
 =?utf-8?B?T1JwT3crd3NvTHJOK3ZBRHVRM2k5UmF5K2RSUkNMNWt2a2hScVV6OG04YlN1?=
 =?utf-8?Q?bN9YHDp3tDM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5753.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2ZSNmtGcjBpZ3g1U0VhVGVoUDZHT2U3Znh4OGRBZmFOTU1xd3kza1NuaEps?=
 =?utf-8?B?QWVoTm91VnVOS2hmUS96Q0M0Qlh0dTdUVi96K3pwYU5uZEhQZUVLSnROV3BO?=
 =?utf-8?B?aUs5bjdBTDV5UXcxUUx3VHdKS2MyZ2txNm5YUFNUb1JFZkorWmd0VE8zWDE5?=
 =?utf-8?B?MFhWMDNEQkJEbmt0S3hvbmVPaUJHMVZwZ0swS2xVbUc1QlNEdG55bU1lTlQ0?=
 =?utf-8?B?STF5elhQUFJqWlpqOHlZK3lTTjc0eUNERzQ5WTdERlgxNGJDNVY3UFoxNVpV?=
 =?utf-8?B?eG9PWkNVa2dNdUxHRFUyRDczZVpVcTRNVnU5dzRDZHU5UW1Eb0pLdTFlTnFG?=
 =?utf-8?B?dFdXNEUzMCtBNU9icVg0WThNOUVPaWRPZ3FBQnlMMThRM1dSN0tVak9mOTNQ?=
 =?utf-8?B?NG54djRMOGtxY0laZzJHaUhFZFkrNnppbVRZMTgrS296STJKNmxiaUljYXFV?=
 =?utf-8?B?NXFQMG1BYmNBV2FPZ1pJVjVNSG1sbWdFU1h2MEdiSnZ5aEk2TUw0TzJXaXR0?=
 =?utf-8?B?cFA5MC9saEFRVUFVOVNUQkc2TkttV2J0c28yTlRIU004aUdtZXgyK3JSNS9V?=
 =?utf-8?B?UU1OOU1IdXVWOTdkSWJhR3VqSDYzT2twcmZuaVZ1Rko5OVlYNUpscExDSldi?=
 =?utf-8?B?Q3pTc256cTBoTHV5Mk41YUtGRktBcThSNzUvY1Bncm04a0Z5V0pudXBlb0tI?=
 =?utf-8?B?RzRXWkpDNXRxSnRCSkVDZE5WcXVnK1pyUVNxckV6a0tUOU8xMEF5dTJNTFVu?=
 =?utf-8?B?L21VSjBYbmhpTUJoUXpvTWhFV0hpOVE5TTBFMitIRS9WUVduczc3UHppc0Vx?=
 =?utf-8?B?STVnK3dKM1VIYTM4OEFJMVVvT0N5MWVrMmszM0dmcFF3Tk9LYTlQdmVoc2xU?=
 =?utf-8?B?anpCN2RwT0VPbFFEQlNVenhHbERWdkFoayszMmtUc1JwYUhHTDRnOWlqVGJr?=
 =?utf-8?B?S2lsbDhpVkhtZi81cFl6a2lTUkg1WmY5TWF5MWRoRlEzQk1iSVY0cUVIQjB6?=
 =?utf-8?B?RVQ0R1Bwa0dlVGEwRklZQ1hPYnArTUpSYlB4ZnN6MytaZ0sxaHN6QytJNkd1?=
 =?utf-8?B?NTFIczdTbGh2TzVvM1R0QlgxQnlIZStlYjl5dHRGeTlRTHhZRkwzOE9KMUNz?=
 =?utf-8?B?ZmZSbmJPbE9KWFZmcVdvYTJReFlXc3k2SitFZE8ydVdBVkhTS1RsdW5lVjR4?=
 =?utf-8?B?NFJpdUVqclZBbGZkcy8zakV1V3FOWmhaSmNvYlRwODRQZlpldG9YbXM2NU1D?=
 =?utf-8?B?a2F0UVJ0bGRLenh2eEp6UnZsTzNZN25VbDFqb2pTZXROU0NIbWNVQzEzZ2V3?=
 =?utf-8?B?Q1JZU3liYnNHb0dWYlprY1NGa25KYm0zeVJOdUdYa3dOaEtDM00rNUVPT08z?=
 =?utf-8?B?QVBvekRxemZxUytBNkNYTDFCcllTMUZvVVZlN0NkWjZQVW5lUGQ2ZGh1Y0FZ?=
 =?utf-8?B?SmdyL2pSYlo0OGwveUw4cHhaVFBINThSVEtXN2hYMGNOY2dNM0RCTmVGamd4?=
 =?utf-8?B?QnBKN3FrOTNLV0JJMDFuVjMrdzZGblVTTTJ2M2FaZkQyVkk1ZTk2SHdpc21r?=
 =?utf-8?B?V3Q4bmFxZVZSbXRnR2NObVZ5TVJjTDlOZzBQRFdQeVdoRkxEaWhpcEZ0enQw?=
 =?utf-8?B?K3YrRlc0ZGN5S2swNWFYYktiN1NxK01TbVVCOHRqVXZtbW9PZlRYS25tTk1C?=
 =?utf-8?B?TExxT09tYWxEZk4yVEt5VHRTbmVUTlJ0cmx1QjVYZGRJYXdiRVAxQy8zNml5?=
 =?utf-8?B?Nmd3dzA1cWM5dzJBQUFESlJKa25lMWRKaFR6YktLc0FnUnJWa0pHUDlYZUtr?=
 =?utf-8?B?K1F5T3Q3OVZablhVUlpsOGpMOEU4cXNsUm9tVGJ1eXF6NE54SThTcjVJTktN?=
 =?utf-8?B?OWRUbkVlTXE4ak1QN3ZmeWNzZEhWelpEdkZ5cHNDRlY3UUR1SEdXSFJZOGRu?=
 =?utf-8?B?MjQwUTBxNlFxUHFCL1g0Y0dpRm1DZnJmaXNQOTN6cWhCQi8zWGtPYVZyY01o?=
 =?utf-8?B?WG9FbFgvK3dkeWxjMk4yQ3RudVd6cEN2VXJkR0F6N1FSVzE4aEFvMFZBRnBv?=
 =?utf-8?B?aG82Mm92K09PWmwxb0c0Qk54N3gzc0gzRk5WaVo5dmgvNnlUK3N6eXRBdWxE?=
 =?utf-8?Q?63NWuJgGcHzhAgwHbqBW+RGIQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bff247e8-0431-4f86-1811-08dd7cb77d8d
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5753.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2025 07:22:48.7308 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ScR6p8HZQTySFUTDY21wBl/IwbDRkRjMjUcde9kHOe7zxLn0Kp9zsGnXIgPx0lqtRNLME2aU0ZJzxulo1jouWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7864
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


On 4/16/2025 12:48 PM, Tvrtko Ursulin wrote:
>
> On 15/04/2025 19:43, Sunil Khatri wrote:
>> change the DRM_ERROR to drm_file_err which gives the drm device
>> information too which is useful in case of multiple GPU's and also
>> add process information.
>>
>> Signed-off-by: Sunil Khatri <sunil.khatri@amd.com>
>> ---
>>   drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c | 59 +++++++++++--------
>>   1 file changed, 33 insertions(+), 26 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c 
>> b/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c
>> index 05c1ee27a319..e07dff14256c 100644
>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c
>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_userqueue.c
>> @@ -123,25 +123,25 @@ int amdgpu_userqueue_create_object(struct 
>> amdgpu_userq_mgr *uq_mgr,
>>         r = amdgpu_bo_create(adev, &bp, &userq_obj->obj);
>>       if (r) {
>> -        DRM_ERROR("Failed to allocate BO for userqueue (%d)", r);
>> +        drm_file_err(uq_mgr->file, "Failed to allocate BO for 
>> userqueue (%d)", r);
>>           return r;
>>       }
>>         r = amdgpu_bo_reserve(userq_obj->obj, true);
>>       if (r) {
>> -        DRM_ERROR("Failed to reserve BO to map (%d)", r);
>> +        drm_file_err(uq_mgr->file, "Failed to reserve BO to map 
>> (%d)", r);
>>           goto free_obj;
>>       }
>>         r = amdgpu_ttm_alloc_gart(&(userq_obj->obj)->tbo);
>>       if (r) {
>> -        DRM_ERROR("Failed to alloc GART for userqueue object (%d)", r);
>> +        drm_file_err(uq_mgr->file, "Failed to alloc GART for 
>> userqueue object (%d)", r);
>>           goto unresv;
>>       }
>>         r = amdgpu_bo_kmap(userq_obj->obj, &userq_obj->cpu_ptr);
>>       if (r) {
>> -        DRM_ERROR("Failed to map BO for userqueue (%d)", r);
>> +        drm_file_err(uq_mgr->file, "Failed to map BO for userqueue 
>> (%d)", r);
>>           goto unresv;
>>       }
>>   @@ -177,7 +177,7 @@ amdgpu_userqueue_get_doorbell_index(struct 
>> amdgpu_userq_mgr *uq_mgr,
>>         gobj = drm_gem_object_lookup(filp, db_info->doorbell_handle);
>>       if (gobj == NULL) {
>> -        DRM_ERROR("Can't find GEM object for doorbell\n");
>> +        drm_file_err(uq_mgr->file, "Can't find GEM object for 
>> doorbell\n");
>>           return -EINVAL;
>>       }
>>   @@ -187,13 +187,15 @@ amdgpu_userqueue_get_doorbell_index(struct 
>> amdgpu_userq_mgr *uq_mgr,
>>       /* Pin the BO before generating the index, unpin in queue 
>> destroy */
>>       r = amdgpu_bo_pin(db_obj->obj, AMDGPU_GEM_DOMAIN_DOORBELL);
>>       if (r) {
>> -        DRM_ERROR("[Usermode queues] Failed to pin doorbell object\n");
>> +        drm_file_err(uq_mgr->file,
>> +            "[Usermode queues] Failed to pin doorbell object\n");
>
> Indentation could be off here (and a few more below), if it isn't my 
> email client not displaying it properly.

Noted, will check again for indentation.

regards
Sunil

>
>>           goto unref_bo;
>>       }
>>         r = amdgpu_bo_reserve(db_obj->obj, true);
>>       if (r) {
>> -        DRM_ERROR("[Usermode queues] Failed to pin doorbell object\n");
>> +        drm_file_err(uq_mgr->file,
>> +            "[Usermode queues] Failed to pin doorbell object\n");
>>           goto unpin_bo;
>>       }
>>   @@ -215,14 +217,16 @@ amdgpu_userqueue_get_doorbell_index(struct 
>> amdgpu_userq_mgr *uq_mgr,
>>           break;
>>         default:
>> -        DRM_ERROR("[Usermode queues] IP %d not support\n", 
>> db_info->queue_type);
>> +    drm_file_err(uq_mgr->file,
>> +            "[Usermode queues] IP %d not support\n", 
>> db_info->queue_type);
>>           r = -EINVAL;
>>           goto unpin_bo;
>>       }
>>         index = amdgpu_doorbell_index_on_bar(uq_mgr->adev, db_obj->obj,
>>                            db_info->doorbell_offset, db_size);
>> -    DRM_DEBUG_DRIVER("[Usermode queues] doorbell index=%lld\n", index);
>> +    drm_dbg_driver(adev_to_drm(uq_mgr->adev),
>> +               "[Usermode queues] doorbell index=%lld\n", index);
>
> This and others are technically okay but not what the commit message 
> says. I'd say either split them into a separate patch or change the 
> commit message to just say something like "Add device and client 
> information to userq logging" so you give patch a wider mandate. ;)
>
Sure will split the patch and update commit message to precisely say 
what is being done.

Regards
Sunil Khatri


>
>>       amdgpu_bo_unreserve(db_obj->obj);
>>       return index;
>>   @@ -249,7 +253,7 @@ amdgpu_userqueue_destroy(struct drm_file *filp, 
>> int queue_id)
>>         queue = amdgpu_userqueue_find(uq_mgr, queue_id);
>>       if (!queue) {
>> -        DRM_DEBUG_DRIVER("Invalid queue id to destroy\n");
>> +        drm_dbg_driver(adev_to_drm(uq_mgr->adev), "Invalid queue id 
>> to destroy\n");
>>           mutex_unlock(&uq_mgr->userq_mutex);
>>           return -EINVAL;
>>       }
>> @@ -282,7 +286,8 @@ amdgpu_userqueue_create(struct drm_file *filp, 
>> union drm_amdgpu_userq *args)
>>       if (args->in.ip_type != AMDGPU_HW_IP_GFX &&
>>           args->in.ip_type != AMDGPU_HW_IP_DMA &&
>>           args->in.ip_type != AMDGPU_HW_IP_COMPUTE) {
>> -        DRM_ERROR("Usermode queue doesn't support IP type %u\n", 
>> args->in.ip_type);
>> +        drm_file_err(uq_mgr->file,
>> +            "Usermode queue doesn't support IP type %u\n", 
>> args->in.ip_type);
>>           return -EINVAL;
>>       }
>>   @@ -304,14 +309,16 @@ amdgpu_userqueue_create(struct drm_file 
>> *filp, union drm_amdgpu_userq *args)
>>         uq_funcs = adev->userq_funcs[args->in.ip_type];
>>       if (!uq_funcs) {
>> -        DRM_ERROR("Usermode queue is not supported for this IP 
>> (%u)\n", args->in.ip_type);
>> +        drm_file_err(uq_mgr->file,
>> +            "Usermode queue is not supported for this IP (%u)\n",
>> +            args->in.ip_type);
>>           r = -EINVAL;
>>           goto unlock;
>>       }
>>         queue = kzalloc(sizeof(struct amdgpu_usermode_queue), 
>> GFP_KERNEL);
>>       if (!queue) {
>> -        DRM_ERROR("Failed to allocate memory for queue\n");
>> +        drm_file_err(uq_mgr->file, "Failed to allocate memory for 
>> queue\n");
>>           r = -ENOMEM;
>>           goto unlock;
>>       }
>> @@ -327,7 +334,7 @@ amdgpu_userqueue_create(struct drm_file *filp, 
>> union drm_amdgpu_userq *args)
>>       /* Convert relative doorbell offset into absolute doorbell 
>> index */
>>       index = amdgpu_userqueue_get_doorbell_index(uq_mgr, &db_info, 
>> filp);
>>       if (index == (uint64_t)-EINVAL) {
>> -        DRM_ERROR("Failed to get doorbell for queue\n");
>> +        drm_file_err(uq_mgr->file, "Failed to get doorbell for 
>> queue\n");
>>           kfree(queue);
>>           goto unlock;
>>       }
>> @@ -336,13 +343,13 @@ amdgpu_userqueue_create(struct drm_file *filp, 
>> union drm_amdgpu_userq *args)
>>       xa_init_flags(&queue->fence_drv_xa, XA_FLAGS_ALLOC);
>>       r = amdgpu_userq_fence_driver_alloc(adev, queue);
>>       if (r) {
>> -        DRM_ERROR("Failed to alloc fence driver\n");
>> +        drm_file_err(uq_mgr->file, "Failed to alloc fence driver\n");
>>           goto unlock;
>>       }
>>         r = uq_funcs->mqd_create(uq_mgr, &args->in, queue);
>>       if (r) {
>> -        DRM_ERROR("Failed to create Queue\n");
>> +        drm_file_err(uq_mgr->file, "Failed to create Queue\n");
>
> My OCD is upset by inconsistencies of queue vs Queue and queue vs 
> usermode queue vs user queue. Looks like a good opportunity to tidy 
> things up while touching the lines.
I see the frustration. let me update those to all say the same thing.
>
>> amdgpu_userq_fence_driver_free(queue);
>>           kfree(queue);
>>           goto unlock;
>> @@ -350,7 +357,7 @@ amdgpu_userqueue_create(struct drm_file *filp, 
>> union drm_amdgpu_userq *args)
>>         qid = idr_alloc(&uq_mgr->userq_idr, queue, 1, 
>> AMDGPU_MAX_USERQ_COUNT, GFP_KERNEL);
>>       if (qid < 0) {
>> -        DRM_ERROR("Failed to allocate a queue id\n");
>> +        drm_file_err(uq_mgr->file, "Failed to allocate a queue id\n");
>>           amdgpu_userq_fence_driver_free(queue);
>>           uq_funcs->mqd_destroy(uq_mgr, queue);
>>           kfree(queue);
>> @@ -360,7 +367,7 @@ amdgpu_userqueue_create(struct drm_file *filp, 
>> union drm_amdgpu_userq *args)
>>         r = uq_funcs->map(uq_mgr, queue);
>>       if (r) {
>> -        DRM_ERROR("Failed to map Queue\n");
>> +        drm_file_err(uq_mgr->file, "Failed to map Queue\n");
>>           idr_remove(&uq_mgr->userq_idr, qid);
>>           amdgpu_userq_fence_driver_free(queue);
>>           uq_funcs->mqd_destroy(uq_mgr, queue);
>> @@ -388,7 +395,7 @@ int amdgpu_userq_ioctl(struct drm_device *dev, 
>> void *data,
>>               return -EINVAL;
>>           r = amdgpu_userqueue_create(filp, args);
>>           if (r)
>> -            DRM_ERROR("Failed to create usermode queue\n");
>> +            drm_file_err(filp, "Failed to create usermode queue\n");
>
> Not really a kernel wide error if userspace passed invalid arguements 
> to the ioctl. Usually it is good to avoid allowing userspace at will 
> log spamming.

I would prefer to handle all such things separately. Might be touching a 
lot other places too, hope thats fine.

regards

Sunil

>
> Regards,
>
> Tvrtko
>
>>           break;
>>         case AMDGPU_USERQ_OP_FREE:
>> @@ -406,11 +413,11 @@ int amdgpu_userq_ioctl(struct drm_device *dev, 
>> void *data,
>>               return -EINVAL;
>>           r = amdgpu_userqueue_destroy(filp, args->in.queue_id);
>>           if (r)
>> -            DRM_ERROR("Failed to destroy usermode queue\n");
>> +            drm_file_err(filp, "Failed to destroy usermode queue\n");
>>           break;
>>         default:
>> -        DRM_DEBUG_DRIVER("Invalid user queue op specified: %d\n", 
>> args->in.op);
>> +        drm_dbg_driver(dev, "Invalid user queue op specified: %d\n", 
>> args->in.op);
>>           return -EINVAL;
>>       }
>>   @@ -479,7 +486,7 @@ amdgpu_userqueue_validate_bos(struct 
>> amdgpu_userq_mgr *uq_mgr)
>>           ret = amdgpu_vm_lock_pd(vm, &exec, 2);
>>           drm_exec_retry_on_contention(&exec);
>>           if (unlikely(ret)) {
>> -            DRM_ERROR("Failed to lock PD\n");
>> +            drm_file_err(uq_mgr->file, "Failed to lock PD\n");
>>               goto unlock_all;
>>           }
>>   @@ -519,7 +526,7 @@ amdgpu_userqueue_validate_bos(struct 
>> amdgpu_userq_mgr *uq_mgr)
>>           bo = bo_va->base.bo;
>>           ret = amdgpu_userqueue_validate_vm_bo(NULL, bo);
>>           if (ret) {
>> -            DRM_ERROR("Failed to validate BO\n");
>> +            drm_file_err(uq_mgr->file, "Failed to validate BO\n");
>>               goto unlock_all;
>>           }
>>   @@ -550,7 +557,7 @@ amdgpu_userqueue_validate_bos(struct 
>> amdgpu_userq_mgr *uq_mgr)
>>         ret = amdgpu_eviction_fence_replace_fence(&fpriv->evf_mgr, 
>> &exec);
>>       if (ret)
>> -        DRM_ERROR("Failed to replace eviction fence\n");
>> +        drm_file_err(uq_mgr->file, "Failed to replace eviction 
>> fence\n");
>>     unlock_all:
>>       drm_exec_fini(&exec);
>> @@ -569,13 +576,13 @@ static void 
>> amdgpu_userqueue_resume_worker(struct work_struct *work)
>>         ret = amdgpu_userqueue_validate_bos(uq_mgr);
>>       if (ret) {
>> -        DRM_ERROR("Failed to validate BOs to restore\n");
>> +        drm_file_err(uq_mgr->file, "Failed to validate BOs to 
>> restore\n");
>>           goto unlock;
>>       }
>>         ret = amdgpu_userqueue_resume_all(uq_mgr);
>>       if (ret) {
>> -        DRM_ERROR("Failed to resume all queues\n");
>> +        drm_file_err(uq_mgr->file, "Failed to resume all queues\n");
>>           goto unlock;
>>       }
>
