Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 21B88C6E142
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 11:54:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68EF810E231;
	Wed, 19 Nov 2025 10:54:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="drMcD8m3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011033.outbound.protection.outlook.com [52.101.52.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE7B610E231
 for <dri-devel@lists.freedesktop.org>; Wed, 19 Nov 2025 10:54:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lvq6yzf9jwvUXGrZC8MzFJWWxcAeYDB5Muf4S0Wsmx80w5W7N4BGNvwU4gwNQHdW7GTgM5/6cBIqyF5Mou4QW9Ol/Jx1Fv0GBuUmN0GDZkMuY7hrrPV/n2NX8aFK+iVfeNdyfwKeRM35M/sM37R+PS98vFYfRraT1VbaUpLJ/4SnRwqb2rI+H/B4ADy3qVQrXcHIjtRrpRhQCn/swBUwcwlpom4qwJ77Nd7/Xxvtkwxn4RA/EYRvB6irZG8XGKXk4uOBp2ddMiE0+Hi/paFMyYQrTNggFFS2w3WuFNREjcbufYNCXu44Aw9Tm0PALFIH1hd8EvDbzhX6WIsDWOvNVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ag859vXxBdrGBUrEIA/SqDdCkuaZFw8S6u7XInG3To0=;
 b=JDtXhDmGNffgsI/WeMBDvO+X4k8zWbgFEdsly4bVKFTBrwppvzoI9Eb7lFwBqo1Dg5A686ea86I7FSVAa/gtb/WqRZE3O9cfodKsocSAt74ShBtMc3WJA0/Kvb0qqQPhz+HPO5gg7aiIQuLfiOjXXU6MMAKWhvBGJxW/CkwB09EaujJtCDKJz3rUtb+4s/zcYVN1uZTllC+LZlBWnHHS8annDaBXKMQVnF7LRSRUT/ZMyOSeEA0hU5TGy+6OWFeRP5EW3h54o06yYpLz95DUk3plv+HTAXtRj6eRGrOGlK5d629fLw3VEtftcdy8s+BNtVjZEkD3pomKu49I6RmzFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ag859vXxBdrGBUrEIA/SqDdCkuaZFw8S6u7XInG3To0=;
 b=drMcD8m3MQYyDtlPw0nHNESo8EYY3dDKb2Zn0vnA5pC+Cyg5tRaXNKSI3cl7Vt7bkrXuYB/5PHqX8q7vVVxv5b28D4enyiPGtrMi3/URFbiRB1lpkiTy7/d8e6hspToBhtLy0xjfWapEMUyTBpvE5zrlDvhKhDlqUw6NmKMROD0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS2PR12MB9712.namprd12.prod.outlook.com (2603:10b6:8:275::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 10:54:50 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.021; Wed, 19 Nov 2025
 10:54:50 +0000
Message-ID: <cf54bdad-f603-437b-9871-d09f0242739c@amd.com>
Date: Wed, 19 Nov 2025 11:54:45 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1] tests: Add test suite for double-checking userptr
 write validity and VRAM
To: zhangzhijie <zhangzhijie@bosc.ac.cn>, Hawking.Zhang@amd.com,
 wangran@bosc.ac.cn, zhangjian@bosc.ac.cn, alexander.deucher@amd.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: botton_zhang@163.com, "Prosyak, Vitaly" <Vitaly.Prosyak@amd.com>
References: <20251119082841.1179938-1-zhangzhijie@bosc.ac.cn>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251119082841.1179938-1-zhangzhijie@bosc.ac.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0007.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c8::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS2PR12MB9712:EE_
X-MS-Office365-Filtering-Correlation-Id: 73dcd540-81a2-4005-55fb-08de275a1017
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aTg5aXVjcnU4blQrR25UUGVjSi9hV3RDMHFUNkg4b25CN29YeU55cW42Vm12?=
 =?utf-8?B?QytVVkZKcDhseWNKa0JieG5xU0xYZzNTeHZicDhrajFoYmwzOHFQdE9ESndO?=
 =?utf-8?B?UFBEUUptNVQwZ1owanplME5RM1BHUllJRkg1bU9XZk5uenRmcVlnWGc2OTMx?=
 =?utf-8?B?QUgwV3FxWkJ3bVRZdlEvbmd4dnZ6bTIzY01rVHhWZE1JaVdDeEdHWVA0WDNs?=
 =?utf-8?B?dUFwQk5Sam1wN2xCR1NhOUNBcGRZazJranE1MFI2THhZd1dCU2htTTJpd3pJ?=
 =?utf-8?B?emtrdll4YWJ1VnJzMXE0SGM1Qkl2MmdNMkU4aUY4cHRmTUgxbFRUKzIzSnBH?=
 =?utf-8?B?S0tjczQvV0xqdmhUV0lOTi9qTzZUZmIzRSswaGtuU3dHU3RVa1YyQ2ovcld1?=
 =?utf-8?B?Q29EQmlNSjIxN3JCRDJYMlB6RmZPYUJhbGpudG9iZytxM3hHRlFYTVV1NjlR?=
 =?utf-8?B?SWc3OWM2WDhGbWo5dGpWQjdsNXpLT0laY2U4azFBVlNyaWpZUy9sWXZ6a3gy?=
 =?utf-8?B?U1hLak15WkljZzFHcXl1Vm9CNnBVcTE3SUovYS9sakMvQmpWV2hUN2tyNzhp?=
 =?utf-8?B?aEoycGRJemc3cUoxTDdvMkhxU29Hbmd3WnJqblY3ZkczR3pDc0lDQ09wMkF3?=
 =?utf-8?B?d053Q2RKM2syZCtFMzFaZ09jSnh0TUdDWTIwb3ZFTnRKMjl4RzgvS3MzQkd6?=
 =?utf-8?B?d1RvVHE5NFZoSitwamFRMC9Da2QyMzBoWXMrclZjYVdJRXVlK0NmaDlQUUFB?=
 =?utf-8?B?V2tlZUtEVExRMUthemJnZWRkb2FkQk1HbGNESVp1bWRBQ2lKNFB2OE5aQUcw?=
 =?utf-8?B?SWJHME05TDJzVEREa2FPcmhtclArTDB2TEkxOGtROVZVRVJPNzRLTWEreExj?=
 =?utf-8?B?d3dyZE9DeUhZbTdGODJMc1paN1h0L3pjVnpVOEJqNEExMHp3dEJQZVdCNjkw?=
 =?utf-8?B?UFZCL3dKcm11bGZodW5GMDNZcEZkUWhRMUJJZEJiVFJYRmt1YXpjZTNmVzJH?=
 =?utf-8?B?MmR3TU9EVG9VM2dDNTNYNXZGSDIzSWlpMzgwem1UR0d2TlU4c0laV0pTemRO?=
 =?utf-8?B?U1NXWXVLRjNvVmUrRVp5S1hER0J6TVZ1MlQrbERnV2dZb0RBd0RWZEpTWW1K?=
 =?utf-8?B?ZUtYUFE1VmgxZDgxaEQ5bGowMjFzRkNVams4VzVyeW5tZWFoQk5hV2N0d05r?=
 =?utf-8?B?aDlWejdLYm9qRkNjbHRsR2REdEJoVk4xNEYvSCtOSk5XUjhUS1JYY0FQd3o2?=
 =?utf-8?B?WWZvZDFNUTl3VzlSd3Q3ejZJNmlXMWNoZmJXaVhjRnN3ckxMa2lzWW4wZUlh?=
 =?utf-8?B?K2VhUHEvSGhsMzRaUW5hQXlVUHZ2cVN3QitteVRhRm9XcG4vUXNjV01wcEFV?=
 =?utf-8?B?Y2E2d3NFVVdMdEJFYXNtb2xWbUZab1h0dk4yYlRKN0xwVVp3TEdqQ1kwSG5x?=
 =?utf-8?B?T2czNmRVendCWFpaR3pMYlo3YWFSZWM3Nm53a1RlZHF6em81SWhFWmQ1ME1V?=
 =?utf-8?B?emhCS0h0RlZxVXlZSGVuZlBsd2MyanlJVFdORlRta01RRWlScGE5TlVqeHlp?=
 =?utf-8?B?dWlFS25nNVFFaVZRSXpSZEFoQVNWUFErWVIrSnVjUXBzbkd1cjFXY3hPRnp1?=
 =?utf-8?B?M3kxRGhNWVpQbVlPeG5pZW90SFZibExpVlVsSmtzVTVKd2JZUGxsWERDZnZ3?=
 =?utf-8?B?djNjTDFPRHNXZW5DQVBuVUpBT1RPTDRxT0NoQkZnb0l0MlZFK3BlK1NOeDFH?=
 =?utf-8?B?ZXpGYkNwTTlZMjN3eDJzUmttTmtwQ29KdVRsZTl2K1J0bGhJRHJETlpUMkZo?=
 =?utf-8?B?N2ovY0N2MnRQT0I2YVZWYlRUOUhBNzZXK0piU1k2T0xIUi9laVZRb2wzc1JM?=
 =?utf-8?B?Ui9leGo3TzRVcU03Q2FLQ2MrN0o2ckovdTd2ekhVK3hUS1RJRXp3SHFmcVo1?=
 =?utf-8?Q?XxvzXq9mOucGCjsIVSAsGZJ/yPa6uLVy?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bFdJODVvYU5aeXg2ampkMitVN2k4Ymhzem9HSGtIVTBMSm1ycXBRUTUwR3BS?=
 =?utf-8?B?UUVaV1Q2SzlTKzFGK0RXbmYvRFNxY1duOTNRanBRSDN5U1J2WkZNVVdOdVZn?=
 =?utf-8?B?SWlxYjBWL291VkpYNitjQzM3QVVOODV3c0Q0TUUzMCtLMitOeTIvRm5XTFFk?=
 =?utf-8?B?ZFdmcE1lRE96OG85UUdyOWcrZnA1VnlVaGZ0dTZCczFweFVNb1crUnpJRTRp?=
 =?utf-8?B?U2ZTWEl0V2pGOFVVRGYxTlpSUjFSWXpWZTczQmlZa3pqeUhXOVZqdjFZQUJF?=
 =?utf-8?B?bUcwSnRZaXZtM3JOUTZhRHF6cVVvUDQybkRqcStubkM5VmJzWTczMUZ3MjRV?=
 =?utf-8?B?dEE5VXRldFlRUjFBTURmd3Q4K1JpMnFvZU9ucE5xQlBzc1JxdE9UeWhrTUdz?=
 =?utf-8?B?U00wR2JvczE1WFN2OHdLMldzZGRJWWkvSzNOSnlpbzJuL0JCZkM2SW1pY08x?=
 =?utf-8?B?UmxqbW9xYytSU2VzWUw4Y05yQzVQMnhSaE13UjBBdjZvOFhFQW0rK0k5NjlH?=
 =?utf-8?B?SEJ1bHFkeGkrNzBGNHN6RExZU1VYYXVNbnJMTnBCRHRWTVFkQXBxUDd5MWxT?=
 =?utf-8?B?dzhDNm85V0JGaFVkODdDd0E3L2VCSk9wYU40THpGNHR4Tms1Q0hhSTBGeE9O?=
 =?utf-8?B?SDhCR3NoeGFsazZDSUZSZmhRR2c4MWlqQmRoL2VZdmdRMldlVENqVy8vRWRO?=
 =?utf-8?B?QS85Z2tGdFJ3bmJyeHc5am8wR0kvMXhqek4rSnFqWmh3Z1N4Tk9VK2hTOGFD?=
 =?utf-8?B?L3BPTDVJbTVXTjBLQWozVE5nS295dnNFK3lMYW5ITHFnNmYzd1I2bnFtTDZl?=
 =?utf-8?B?MkdpZWo4Wkw0R0ZPRlY4ZGRzcXFxQXZkR3NDS0N4Y0dYeWxPS0J1TEE3SGhL?=
 =?utf-8?B?c1RybDlKM2FKY1hqbnBvOGdFRXJSWmlaaHJIeHFPTktLWmlGVk15eEhQd2Vp?=
 =?utf-8?B?L2V3Qk1RZVIvVlpTdWNJeDllRWJWbFZNZDFJUnhkYWx0S3hTR0ZvbU9oM0Mv?=
 =?utf-8?B?Yis0cG9SNjg1ajRvVC9yWkIwS3JOandHZFZtUzd5MXRXVDA0T2xpSUIyUmlP?=
 =?utf-8?B?VzA0SmdRKzlFNmFUSWd1TzJndEo5bjBQcEJINzQ5N0l6UGU5bzhBQ0ZMalJm?=
 =?utf-8?B?RmlZSGt2OVJGeVVQWE5QNUFTTjUzejVKYVdoSHBjblRZYXFlejEzL0l4WEVj?=
 =?utf-8?B?QnpNcjNSYzlOOERmNDZHNjZETHoxeXh0RWo0UkpmbkZmQUZUT1JpWGV2R2Z5?=
 =?utf-8?B?dDVNTHVCN05OaTE2bHVlZmc1Z0Z3OXVCOXBrTmtDQlZpMGwzRWFIOWJEaU8x?=
 =?utf-8?B?ZzZFaWVtMkF0dlhBcElBemsyU05XU2xwZGxyYi9nYlh0T25jcmplYWFUTVlF?=
 =?utf-8?B?aXlDeHJRc2c1K3lHdmNPOUtWRGJ4OTJxMGNBMGs1NTh1YzV1U0RpcWk5bXdD?=
 =?utf-8?B?MkgyYzhldURHL2lrREJWOUlucUxLRnh6OEtGTW5xWUNBWlB3ZlZjbHdZcUZ1?=
 =?utf-8?B?OEE2RUhva2o3b1kwVXE3OVJBd3VWKytteWRNbk9yN09Qb09uTXNkMnJvbTBo?=
 =?utf-8?B?SnNWWm9jSk84V01COVQzWW4vVzV1YitxK0RMZDJjdm9RaStnMlluSWdCb0Vz?=
 =?utf-8?B?U0U2WnRna1hSa0NIKytKZzlzV3ZXS0FUMzdkTVpWbmkxd29XemdkdmR3MkZ4?=
 =?utf-8?B?RUd1bW1KNUhGQnhCSVR3anVWNXdwVWdSMWpBWEhRUmczNEJpZVhRNUl5UjBR?=
 =?utf-8?B?dkw3Y09ZN0xFclJhdWtXb09GNndRbFQ3WjhIZDRIWlBPZFFZb1VtL2Z2SmVS?=
 =?utf-8?B?WVRKMkhIOU1rQ0tScVJIRG5XblhiMlREVGlFcURweXJ5RUNTbXkvRWorZ2Vh?=
 =?utf-8?B?ZjVrSmdScTFJSVVIVXhUVmRMQ1RVSzdRR0w2NkwxQ0pzdllGR0xqd3U1bnFs?=
 =?utf-8?B?d29Jc0pVRFYrSTNQYkIzUk82Y3FNTElSMVFjWG9LUy9Xek9HWHYyYVBnYW43?=
 =?utf-8?B?MWE1TzBGWHhYM2ZjVDVWWEU4L3Z0Zi9ReWpRaXhqN2pNcXJJUTVueW4xU2lB?=
 =?utf-8?B?WmdNOTB3NkhNSU9pOWdVcmxnVHp2a0dUek5kTkFrUDBaZUU5MzhBVTJQYmJS?=
 =?utf-8?Q?tNRAkDqx83/gueUZK7IbRkcxg?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 73dcd540-81a2-4005-55fb-08de275a1017
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 10:54:50.6767 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qwWFDsxhY2blerVVz5exNyolnluBlsrLjrfkPY9lnK4HLuFrUPEqISbJ0qwElUTD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9712
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

On 11/19/25 09:28, zhangzhijie wrote:
> Userptr resides in host memory, and PCIe writes involve cache coherence.
> By using SDMA to copy GTT to VRAM and then verifying the values in VRAM, we can validate GTT cache coherence.
> 
> Bo(Userptr) ----> SDMA ---> Bo(userptr) ----sdma-----> VRAM

In general nice to have, but the amdgpu tests in libdrm have been deprecated and not been updated in more than two years.

We have even removed them completely recently because people were accidentally using them on unsupported HW.

Instead the AMD team has switched over using IGT test cases in our CI system. Vitaly can probably point you to the code and maybe help porting the test case over.

Thanks,
Christian.

> 
> Signed-off-by: zhangzhijie <zhangzhijie@bosc.ac.cn>
> ---
>  tests/amdgpu/basic_tests.c | 155 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 155 insertions(+)
> 
> diff --git a/tests/amdgpu/basic_tests.c b/tests/amdgpu/basic_tests.c
> index 0e4a357b..223a9b0b 100644
> --- a/tests/amdgpu/basic_tests.c
> +++ b/tests/amdgpu/basic_tests.c
> @@ -2061,12 +2061,167 @@ static void amdgpu_command_submission_sdma_copy_linear(void)
>  {
>  	amdgpu_command_submission_copy_linear_helper(AMDGPU_HW_IP_DMA);
>  }
> +static void amdgpu_command_userptr_copy_to_vram_linear(void)
> +{
> +	int i, r, j;
> +	uint32_t *pm4 = NULL;
> +	uint64_t bo_mc;
> +	void *ptr = NULL;
> +	int pm4_dw = 256;
> +	int sdma_write_length = 4;
> +	amdgpu_bo_handle handle;
> +	amdgpu_context_handle context_handle;
> +	struct amdgpu_cs_ib_info *ib_info;
> +	struct amdgpu_cs_request *ibs_request;
> +	amdgpu_bo_handle buf_handle;
> +	amdgpu_va_handle va_handle;
> +
> +	amdgpu_bo_handle bo1;
> +	amdgpu_bo_handle *resources;
> +	uint64_t bo1_mc;
> +	volatile unsigned char *bo1_cpu;
> +	amdgpu_va_handle bo1_va_handle;
> +
> +
> +	r = amdgpu_bo_alloc_and_map(device_handle,
> +				sdma_write_length, 4096,
> +				AMDGPU_GEM_DOMAIN_VRAM,
> +				AMDGPU_GEM_CREATE_CPU_ACCESS_REQUIRED, &bo1,
> +				(void**)&bo1_cpu, &bo1_mc,
> +				&bo1_va_handle);
> +	CU_ASSERT_EQUAL(r, 0);
> +	/* set bo1 */
> +	memset((void*)bo1_cpu, 0xaa, sdma_write_length);
> +
> +	pm4 = calloc(pm4_dw, sizeof(*pm4));
> +	CU_ASSERT_NOT_EQUAL(pm4, NULL);
> +
> +	ib_info = calloc(1, sizeof(*ib_info));
> +	CU_ASSERT_NOT_EQUAL(ib_info, NULL);
> +
> +	ibs_request = calloc(1, sizeof(*ibs_request));
> +	CU_ASSERT_NOT_EQUAL(ibs_request, NULL);
> +
> +	r = amdgpu_cs_ctx_create(device_handle, &context_handle);
> +	CU_ASSERT_EQUAL(r, 0);
> +
> +	posix_memalign(&ptr, sysconf(_SC_PAGE_SIZE), BUFFER_SIZE);
> +	CU_ASSERT_NOT_EQUAL(ptr, NULL);
> +	memset(ptr, 0, BUFFER_SIZE);
> +
> +	r = amdgpu_create_bo_from_user_mem(device_handle,
> +					   ptr, BUFFER_SIZE, &buf_handle);
> +	CU_ASSERT_EQUAL(r, 0);
> +
> +	r = amdgpu_va_range_alloc(device_handle,
> +				  amdgpu_gpu_va_range_general,
> +				  BUFFER_SIZE, 1, 0, &bo_mc,
> +				  &va_handle, 0);
> +	CU_ASSERT_EQUAL(r, 0);
> +
> +	r = amdgpu_bo_va_op(buf_handle, 0, BUFFER_SIZE, bo_mc, 0, AMDGPU_VA_OP_MAP);
> +	CU_ASSERT_EQUAL(r, 0);
> +
> +	handle = buf_handle;
> +
> +	j = i = 0;
> +
> +	if (family_id == AMDGPU_FAMILY_SI)
> +		pm4[i++] = SDMA_PACKET_SI(SDMA_OPCODE_WRITE, 0, 0, 0,
> +				sdma_write_length);
> +	else
> +		pm4[i++] = SDMA_PACKET(SDMA_OPCODE_WRITE,
> +				SDMA_WRITE_SUB_OPCODE_LINEAR, 0);
> +	pm4[i++] = 0xffffffff & bo_mc;
> +	pm4[i++] = (0xffffffff00000000 & bo_mc) >> 32;
> +	if (family_id >= AMDGPU_FAMILY_AI)
> +		pm4[i++] = sdma_write_length - 1;
> +	else if (family_id != AMDGPU_FAMILY_SI)
> +		pm4[i++] = sdma_write_length;
> +
> +	while (j++ < sdma_write_length)
> +		pm4[i++] = 0xdeadbeaf;
> +
> +	if (!fork()) {
> +		pm4[0] = 0x0;
> +		exit(0);
> +	}
> +
> +	amdgpu_test_exec_cs_helper(context_handle,
> +				   AMDGPU_HW_IP_DMA, 0,
> +				   i, pm4,
> +				   1, &handle,
> +				   ib_info, ibs_request);
> +
> +	i = 0;
> +	sdma_write_length = 1024;
> +	if (family_id == AMDGPU_FAMILY_SI) {
> +		pm4[i++] =
> +		SDMA_PACKET_SI(SDMA_OPCODE_COPY_SI, 0, 0, 0, sdma_write_length);
> +		pm4[i++] = 0xffffffff & bo1_mc;
> +		pm4[i++] = 0xffffffff & bo_mc;
> +		pm4[i++] = (0xffffffff00000000 & bo1_mc) >> 32;
> +		pm4[i++] = (0xffffffff00000000 & bo_mc) >> 32;
> +	} else {
> +		pm4[i++] =
> +		SDMA_PACKET(SDMA_OPCODE_COPY, SDMA_COPY_SUB_OPCODE_LINEAR, 0);
> +		if (family_id >= AMDGPU_FAMILY_AI)
> +			pm4[i++] = sdma_write_length - 1;
> +		else
> +			pm4[i++] = sdma_write_length;
> +		pm4[i++] = 0;
> +		pm4[i++] = 0xffffffff & bo_mc;
> +		pm4[i++] = (0xffffffff00000000 & bo_mc) >> 32;
> +		pm4[i++] = 0xffffffff & bo1_mc;
> +		pm4[i++] = (0xffffffff00000000 & bo1_mc) >> 32;
> +	}
> +	/* prepare resource */
> +	resources = calloc(2, sizeof(amdgpu_bo_handle));
> +	CU_ASSERT_NOT_EQUAL(resources, NULL);
> +
> +	resources[0] = bo1;
> +	resources[1] = handle;
> +	amdgpu_test_exec_cs_helper(context_handle,
> +					AMDGPU_HW_IP_DMA, 0,
> +					i, pm4,
> +					2, resources,
> +					ib_info, ibs_request);
> +
> +	i = 0;
> +	while (i < 4) {
> +		CU_ASSERT_EQUAL(((int*)ptr)[i++], 0xdeadbeaf);
> +	}
> +
> +	i = 0;
> +	while (i < 4) {
> +		CU_ASSERT_EQUAL(((int*)bo1_cpu)[i++], 0xdeadbeaf);
> +	}
> +	free(ibs_request);
> +	free(ib_info);
> +	free(pm4);
> +
> +	r = amdgpu_bo_va_op(buf_handle, 0, BUFFER_SIZE, bo_mc, 0, AMDGPU_VA_OP_UNMAP);
> +	CU_ASSERT_EQUAL(r, 0);
> +	r = amdgpu_va_range_free(va_handle);
> +	CU_ASSERT_EQUAL(r, 0);
> +	r = amdgpu_bo_free(buf_handle);
> +	CU_ASSERT_EQUAL(r, 0);
> +	free(ptr);
> +	r = amdgpu_bo_unmap_and_free(bo1, bo1_va_handle, bo1_mc,
> +						sdma_write_length);
> +	CU_ASSERT_EQUAL(r, 0);
> +	r = amdgpu_cs_ctx_free(context_handle);
> +	CU_ASSERT_EQUAL(r, 0);
> +
> +	wait(NULL);
> +}
>  
>  static void amdgpu_command_submission_sdma(void)
>  {
>  	amdgpu_command_submission_sdma_write_linear();
>  	amdgpu_command_submission_sdma_const_fill();
>  	amdgpu_command_submission_sdma_copy_linear();
> +	amdgpu_command_userptr_copy_to_vram_linear();
>  }
>  
>  static void amdgpu_command_submission_multi_fence_wait_all(bool wait_all)

