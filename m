Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DECAFB3B953
	for <lists+dri-devel@lfdr.de>; Fri, 29 Aug 2025 12:54:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EA7710EB7E;
	Fri, 29 Aug 2025 10:54:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="BFsYv6SW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2084.outbound.protection.outlook.com [40.107.244.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EFDA10EB7E
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Aug 2025 10:54:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dYrc+ZaXvrZdpPgCcGiw1NRd6B8znMZii69gWSzAIVjvGKQrQ0yodYwGCZcFJ9lKzJW96pHbWbLSXx/7PMSrj79rsXWfiIlLP1hBBzMVtkHzV3gNVwX9IC7kvswxcCpUf4J74cqjJclrTV02z3Mrp40KMzEf+9VsYotArsJNCQmZhJyuPwrnuLjIB2HguKil1ktbOcY7cTl5yGd2lIncK6ouiaup/FIRJJTsQKfaSbIgD3IxFZfc8tSvxJ9ZxppJr9vkC3DWAIAQ2kUW2xpPi4giRXy7V/tq9wr0WZsh2RKg2O6P7SH+4TeSmnfGIc7M8nIzsKBszc161via0VeOMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jjN+dBJQmqWZDtHV85W4gdCUOu7KoqnFAJat1JwRWC4=;
 b=BqORa9wQmTPwElQufoRoxkmGgIpFqpPP67WrBPkzpuY4T7TUUHPkyJvYgYtefoM60FSHG3UPCO329jaVDcEzREAzpYFoituK+OkIlBv4pejuaOsIkWOshduuMwiSYwtsjnS5z7t1tfTHUdbvgcW1D4krd8RZqTX+o+TgCcR8OqZdJa1lP9+4t4QYe6fLnsz1wgZwNR9qpM4D9w3mg27EWE6L6Gyqe/dXYJ1m5gbyr+4N+AflLxne2VNco1ufHf/Id2wJzEZUpwcZmf2Ah2fUk0GWWhF57tq7PLKHNqRdIoK7MjiaxFv8fFSD68CFPuLHS5Kzs/ZYq/3LNcJIx49O4A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jjN+dBJQmqWZDtHV85W4gdCUOu7KoqnFAJat1JwRWC4=;
 b=BFsYv6SWnFwSeV+BMEXDOEnXa6au8tbAGo2Ap9Ny4hlDHsqJmz1uKwoiShDCYFQY7M7p1MYdBtx+xTO9foa6jBmj0oKhL4cnqdf0/VskSUNTrORd36HW+5WwyWgW6sBSbbkZLdbdiuvubUVRREcN2N6FMGpw3LqXiYqC19bdsvU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS7PR12MB6119.namprd12.prod.outlook.com (2603:10b6:8:99::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9052.14; Fri, 29 Aug 2025 10:54:28 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9073.017; Fri, 29 Aug 2025
 10:54:28 +0000
Message-ID: <26259e0b-a0db-44e7-acd4-cbc769b4513d@amd.com>
Date: Fri, 29 Aug 2025 12:54:22 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/test: drm_exec: use kzalloc() to allocate GEM objects
To: Danilo Krummrich <dakr@kernel.org>, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, Alice Ryhl <aliceryhl@google.com>
References: <20250829075633.2306-1-dakr@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250829075633.2306-1-dakr@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0058.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cc::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS7PR12MB6119:EE_
X-MS-Office365-Filtering-Correlation-Id: 74c8e87a-7a3d-4a0b-3d00-08dde6ea6d00
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TGZHOXFFdjdRVEFwbUZreHpxS3E1QWlyclN6MjFUTmVESDRWSE9KOXZDZjhY?=
 =?utf-8?B?UGRRdVlIOXVYTkg3ZUlGNjBxRWJCbHJ4Uk5XVlJDZUF3L0IxSUpTUVIvV3NR?=
 =?utf-8?B?SVlrRnQ5Vk82RWtaSEsyVlUxdXlDOWZmVmpUNFJNeHdOYjA2ajdjay92d3dm?=
 =?utf-8?B?NVdTRmpKY1FOaGRmYm5iK0lUQUkwRlNKcTlwLzdkV2lMOFBwNFpQZzAxNTEr?=
 =?utf-8?B?RFQ0V2hiQStZd01OMzhoM3BWalJSbTlPTlZybWF2ck84OW5NRVJ5V0tteFlV?=
 =?utf-8?B?Rk5jNHkraWZvSk52RzZXbTFkSjRPMmdqczdwaHVnN1BSQTVjR25zTVhoZGVx?=
 =?utf-8?B?TkVUaUdRSUdBbEZQQzBUZllIOGxlRTYxZTdyQ3hsUUtkakxXOFUwZVhNK1J3?=
 =?utf-8?B?eHJydlh0ZnZqVjFBZVJpbzNqbjV2Z0tMRjU2S0h3cUhjNGFRZUF3VjZnTWZY?=
 =?utf-8?B?WVNEd0t5dlhtNlVYd1dsZnhJbUpicXFmNE9WWlpPeVMrTnNITitYdFRXRjNO?=
 =?utf-8?B?TEVlSEt1a21tamFOOCttTXAraWF2SmhRTGEvbnBBckJjcXBPVzUzMUNwRVkz?=
 =?utf-8?B?MVJLQk1rdS9hWGUvSmhzNjlMZ0QwNlpFM2dDb2VWS1Y5ME4veUhST0lFTWNS?=
 =?utf-8?B?R3dzVVovcXJTOTdiN3dxSFAxbWhWSi8wTTMzL3Y3VGpmbGgwczNYQlljeUtL?=
 =?utf-8?B?QzUvLzhFazhIaUdsd1JEcHFmZHlhWlBpUTdyNE5pWGZ4Zm1sckJvQWg4a0pm?=
 =?utf-8?B?OUNsbDdnNTQ0Z0NtMzdpc1p6NGE2cldGcVEzYWdKSTFGSXg0aml1WmlzaXlQ?=
 =?utf-8?B?Rm01OU53RjV6SzZCRnhSNkE0aHltVWliV0FCaVRpT2h0QTVZN3ZJdlVvOUYx?=
 =?utf-8?B?U0xNQ20vZERqNDdkZFphcG9sVG5tSWV6SzVyaFdXSUkwQnNOTzQ1Zk1MN0Vp?=
 =?utf-8?B?Qit5U1U0K2VOSWZmcms4L0JUaHN5NjJKUzdkRC9jOTE1MkxNUXgwalNjNU5v?=
 =?utf-8?B?SnBqckZDd2dNOFRBWlNHQWtLWWtFbmcvRDcxdlB2bWwxNUtzQXdWbFJVd3lm?=
 =?utf-8?B?aVREVExHRjcxbW9JczRoN0NVdUQycEZUUmFad0l1eWQ5VGwvT2pNQncvVTU0?=
 =?utf-8?B?Mi8zZ3ptSUY2WlVmYmtUMXkrcDNwU0RuODdocS9hWVgyaFZKOHZHZTkxYmZS?=
 =?utf-8?B?L2VHUzlscnZkL1hpVGpoMzFZenhkZnREVnlRbmFtSU51N2VvSzAyN1NpOUZG?=
 =?utf-8?B?d3Zzb2RLZGFFeUlGRUEyeDJrdDZnYlRVZVhObXJ3MzkzVTRCNW9LdTNleXVQ?=
 =?utf-8?B?dnJnZ0tEMEJRM0NKekFKOG1PQmVPMllkYzF0ZUNSdXA2VXBnMUdVbWgxRlRM?=
 =?utf-8?B?VmtucTRXb3JHd1IrRDhCWmxaYzUrWmxEYlJnWFZ0bzE1cDUwdFFJSi9WRVlt?=
 =?utf-8?B?aDJLdUgyb2NrbktRWE9yYUFvRnV1c3dOMElVNmE3VGo1S1pWMG1Sb1U5eTIv?=
 =?utf-8?B?elpzc1R6SWthZVNhWlR1WU1LUkZGSVBWWkNSTjBtcUxmaVlCWS9taGlEVnZZ?=
 =?utf-8?B?RE1IUTh1MjBRYk42dzFmajBrZHN2Ri9ENUtpOTFYM0ZCWnVNZ3VnNGV0VldS?=
 =?utf-8?B?a2RNZEYrVTc3Q00wUjhWcnpVLzFaQnRLVnNiYzRpRkhiVHNuS0JXVTJxcmRs?=
 =?utf-8?B?eHlDZmRoVUUrOE56dDAvc1UvaXMxampWMzRHUTQwSFdCck50bS9mY0QvazFh?=
 =?utf-8?B?WFVHQktaejhCNVI3TGF1dWdZNkk5UFY0WkdjcUpEUXBxMXB2WThKNzQ4bldN?=
 =?utf-8?B?RUR6TCticGxaM0NFeUczTGI1ai9pRlAxK0M1S3hsTGlDay9qN1BmQXovVW1H?=
 =?utf-8?B?UHZMQTYrTkJNYnJCMHlDeEZscUZlNW9ZY3BkZlZDNFQvb0N4NkcvL0p3VzRB?=
 =?utf-8?Q?3Nm5kiYZ0yo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MWMwNFVuTWZHZkFJNmg5Z3dMbFVkNEZMWUFvWUZvRHkwTERqMmRUZktlU1k4?=
 =?utf-8?B?Mm0xR2VkM2VSUjcxTXpVQnAyYkpPdW9lVUU1WGdBTjZNRlJTS2ZvcDMvZGIr?=
 =?utf-8?B?NU43ZEI4bUZncWpUc3pvMmhCS21nNFVRakJDcmZYWFZIeG5udXBaVmlpVmFV?=
 =?utf-8?B?OFNodkN4Q2lCSWk4Qy9NcHRSNFpqNzU4NklDdjZLWTd1RUJWdmhnL0ZwY0FW?=
 =?utf-8?B?M2hQd2pCYnRhMWJpSzhkWlB3cElBeVVtYklKTnJ2aEVtbStlMW9wTC9SUlRz?=
 =?utf-8?B?KzJVSkp5ajZ0ZzUvMmJMVDU5SUZOcDAxa0Fld2RaV3JmQnRUVVhVamRhWWNK?=
 =?utf-8?B?dmZQUzViL3ZnVkI4TVpkaTdFZTRiM1FOZ0NoaDlvY0dhK0ZXSTJLL1FhZ0Vz?=
 =?utf-8?B?UloxTHI0bEFSdCtJcVQvN0ZrQ2RpWEx6NW5qZjIra0lEL1Zmb0Y0WStIZjZL?=
 =?utf-8?B?UExreXRXQUduRFNseGU4UXNnNkRrNU1lVFcxRFB6OWsyMW9uVXMrUkpXMitZ?=
 =?utf-8?B?dWN6Znl0aTJEMTM5RVV2YThVc3dteXAyNXU2ZVZGQ014ODlzU1dYenUyREE1?=
 =?utf-8?B?WXhGL0VLYTVHNU9BeW9vZXBuYzExdkdiWmZkQ0Y5cW96dmxycWN6ajJnZUJW?=
 =?utf-8?B?V1JwV1lhM0RSSldpc0hYS1BiT1R2R1lMRERvMDFEalFBai84S29hTHA4RzRB?=
 =?utf-8?B?cTlTVGtuVUVXQWJyYmxjMHRvaVBaQnVDVWtGS1dKZmlka3V0MG1NelBaTHc4?=
 =?utf-8?B?Uy9OUm9UdU1LRnlBWVNYS2N3WUhhTGdFdUI1VHg1d1NqbEpEdFk5QmkxNlcr?=
 =?utf-8?B?RldOeDRqUjFjeXBHR1A0eEtUblJybUE2U29qYjVlRnlZTlJxeW5rTXhTWVZP?=
 =?utf-8?B?TW9rNlpuNmYvL0drbTQrYzZFN25jc2RBY09GM2p5cWg2WlhjaFg5VnNMa3cy?=
 =?utf-8?B?WXdzeW9STGY4aEFCdDg5NURHcmVvdlJKSCtJcUpxeWtJM0V0bXZUZlNzOTVE?=
 =?utf-8?B?ZVBWSzR5cGJQQ29RYUJNQ2cwaWxXTGo2aWxGVjJIcHFKU1JyWWtkK0VvZ1Ev?=
 =?utf-8?B?QVlZYWFiSnNpMk41ZENQd1NsdTlrYmZHOU1kV1lEMWQwOHAzb3pLT3RjM1Bv?=
 =?utf-8?B?ZHRFcFJXMVp6dzBUa1NWd3ZNUEFtSkk4akpUd2RvVWlhZUJLaGhRN1lKZVBU?=
 =?utf-8?B?RFZsWDJGZnJjWnpjTVR2YjJnZkh3TzBlRlVzL2ZGL0h3WUtCYmNUQjljbkxU?=
 =?utf-8?B?T25ad2ZQMFZtbUNYSGJFN29qbkh3UFRXc2JoUW5nRmoxcUF3MnN5TXhjRG5O?=
 =?utf-8?B?NGtEYjk1MldocGhKZGQ3dUNEOXdpY2thRUt4Q21RUHpIeTJXMXdiRG5Kb3lz?=
 =?utf-8?B?Y3ZlYU1lQWtXN0YzOFNnUHhzR1Ewb1hjbldhOEJOamFnNFIxUk1wV3VvMERC?=
 =?utf-8?B?TlJyVytJeVJ6ZUlrcUdMQTg2VGZRSjFNNzh5OW52Z1dCejB2ZVJGaHBzTHIy?=
 =?utf-8?B?RUNnYmk0TWR1ZFQ0OUFJSU1WNXpQaGx6cFJRTU5vWVhEZ1piYThaOFNna0Fo?=
 =?utf-8?B?amR4ZmtQWXczeGIxMEJoeHprRGw2ZmxXM0pJcUxFMGQ0dExTdGlIZjdScDJu?=
 =?utf-8?B?UDAxM09tb0VvNFJheGJRNElHOCtzTVJQbWdoZHVQeDRFUTRjTWxmY3JhRHp1?=
 =?utf-8?B?eGN6RWt4NFBxQUs3NHY0RlBvSGRDci9sY01neHp2dUxRU1lnMUZ5SWhKWS9x?=
 =?utf-8?B?dExmd2s2a3o4c0o0Q0c1aDIxZ0RjaU80RU85YjFqMkVNQmR5QTQ1ZllBbUNN?=
 =?utf-8?B?azUwdDd4VTY4OVZINGxvSUdYdE5JbFRYbmpqWE1UdnhjYk5nU1lBNVpzaXB6?=
 =?utf-8?B?ZlBTdWw4WHpGRklHblVaT3BwcVo5SUZsQ2lJTm10Nmw5eit4MWsvVW52SmNZ?=
 =?utf-8?B?SERXTERNSGFxa09laUttZnZOTmt1bjdOZXJqZFc2eHczUzFydjdqSlJVMitz?=
 =?utf-8?B?K3BoNzMxeTBneTBMTFZFQ1VxU2k4MHZyVlZvUGdMM29KaENIQVlidG5ndVhP?=
 =?utf-8?B?UDh1REJXV243bDYya3l1N0NleXcvY3ZLRll1ZG5HM3R2ZDRRYjZ2UkdqSTha?=
 =?utf-8?Q?Ok6Rk5EE+OoNM+j4YT+IcP7JA?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 74c8e87a-7a3d-4a0b-3d00-08dde6ea6d00
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2025 10:54:28.3750 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yAO2qSQh5rcl4uPj72+s0YkkOKqoJxKuVmA8OMTdDbSDkV5+zwEIdh1zYzVZXxpV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6119
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



On 29.08.25 09:55, Danilo Krummrich wrote:
> Since commit e7fa80e2932c ("drm_gem: add mutex to drm_gem_object.gpuva")
> it is possible for test_prepare_array() to exceed a stack frame size of
> 2048 bytes depending on the exact configuration of the kernel.
> 
>   drivers/gpu/drm/tests/drm_exec_test.c: In function ‘test_prepare_array’:
>   drivers/gpu/drm/tests/drm_exec_test.c:171:1: error: the frame size of 2128 bytes is larger than 2048 bytes [-Werror=frame-larger-than=]
>     171 | }
>         | ^
>   cc1: all warnings being treated as errors
>   make[6]: *** [scripts/Makefile.build:287: drivers/gpu/drm/tests/drm_exec_test.o] Error 1
>   make[6]: *** Waiting for unfinished jobs....
> 
> In order to fix this, allocate the GEM objects in test_prepare_array()
> with kzalloc(), rather than placing them on the stack.
> 
> Cc: Alice Ryhl <aliceryhl@google.com>
> Cc: Christian König <christian.koenig@amd.com>
> Fixes: e7fa80e2932c ("drm_gem: add mutex to drm_gem_object.gpuva")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/tests/drm_exec_test.c | 26 +++++++++++++++++++-------
>  1 file changed, 19 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/tests/drm_exec_test.c b/drivers/gpu/drm/tests/drm_exec_test.c
> index d6c4dd1194a0..d59ec3baae1d 100644
> --- a/drivers/gpu/drm/tests/drm_exec_test.c
> +++ b/drivers/gpu/drm/tests/drm_exec_test.c
> @@ -150,14 +150,22 @@ static void test_prepare(struct kunit *test)
>  static void test_prepare_array(struct kunit *test)
>  {
>  	struct drm_exec_priv *priv = test->priv;
> -	struct drm_gem_object gobj1 = { };
> -	struct drm_gem_object gobj2 = { };
> -	struct drm_gem_object *array[] = { &gobj1, &gobj2 };
> +	struct drm_gem_object *gobj1;
> +	struct drm_gem_object *gobj2;
> +	struct drm_gem_object *array[] = {
> +		(gobj1 = kzalloc(sizeof(*gobj1), GFP_KERNEL)),
> +		(gobj2 = kzalloc(sizeof(*gobj2), GFP_KERNEL)),
> +	};
>  	struct drm_exec exec;
>  	int ret;
>  
> -	drm_gem_private_object_init(priv->drm, &gobj1, PAGE_SIZE);
> -	drm_gem_private_object_init(priv->drm, &gobj2, PAGE_SIZE);
> +	if (!gobj1 || !gobj2) {
> +		KUNIT_FAIL(test, "Failed to allocate GEM objects.\n");
> +		goto out;
> +	}
> +
> +	drm_gem_private_object_init(priv->drm, gobj1, PAGE_SIZE);
> +	drm_gem_private_object_init(priv->drm, gobj2, PAGE_SIZE);
>  
>  	drm_exec_init(&exec, DRM_EXEC_INTERRUPTIBLE_WAIT, 0);
>  	drm_exec_until_all_locked(&exec)
> @@ -166,8 +174,12 @@ static void test_prepare_array(struct kunit *test)
>  	KUNIT_EXPECT_EQ(test, ret, 0);
>  	drm_exec_fini(&exec);
>  
> -	drm_gem_private_object_fini(&gobj1);
> -	drm_gem_private_object_fini(&gobj2);
> +	drm_gem_private_object_fini(gobj1);
> +	drm_gem_private_object_fini(gobj2);
> +
> +out:
> +	kfree(gobj1);
> +	kfree(gobj2);
>  }
>  
>  static void test_multiple_loops(struct kunit *test)
> 
> base-commit: 0b6da6d3a8d5391ff9da2358ac5afd8b7badd943

