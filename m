Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 73A66A16D94
	for <lists+dri-devel@lfdr.de>; Mon, 20 Jan 2025 14:44:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C740310E41B;
	Mon, 20 Jan 2025 13:44:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="G1jC7oEh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2061b.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2418::61b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9927510E419
 for <dri-devel@lists.freedesktop.org>; Mon, 20 Jan 2025 13:44:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jKMqra9VtQpo3Vl0XOA06ePSQ7VZ+KUbP+DJuD1Dp8KCYguMCR8Z/QFparn7XkSH7JVQSSfA7Ot0x517YMkh5TVrpvxjLmVHEy//T+jq5TrZKHvtHCylIl6H6vpsfhaJteX67dpMPXlez/K7440wcbaYkTBkmqodlY9ozbtIQj6mMfcO6k+ldkLdsD1xjmc/jKk5wCf4mm1qIZkAbvEOSeT6hPohHlb/Fdq6DnuLbBkdzP5AjmBu3rAwlejDQ3H2tEaEtAO2MEFS2JgEjMYLQX6GPhbdve6Y+noFY7uKaM0t9XUglwOwqLqUQIpYyKlKPL4mqXtc8YH52yUkNzjZJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aNMq6shzugyHf0NqHwBRJGQdA3omGz/1wVdBClhiDtk=;
 b=KUftGn0tT/jBc73eWNuqztgbjvRPXWlBEYUmoLZ2gZq0PGc7BvYD7I2GCxJseNxsCGcOoEM9OH+8OF61MaQl7SHKukL7slBFTczSNU3g6xeMhgEZqIVB1WIvbwqigPiNBTvwylrOoyWk/q0iZFq8TkV/uFhhYcUAH94BMxX32AFCivwwb1DpO3gShjPwPDESLjZmLQohh/knrxnfdTIozVK/0WDkGVA7kbAXhGm6bHMrmr05Rh7lnDP4w8l6Kx/bNC5mKlYutMNBo1MfkRhW+td+I6aCr26vKvthxGzYeaTdmCI5m8oNUv3aBe5US1JFAiQjzaz49XMvAmSe8438UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aNMq6shzugyHf0NqHwBRJGQdA3omGz/1wVdBClhiDtk=;
 b=G1jC7oEhfZ9njF95OtMRkj15lOZeatDo71NLwHGoP0A/brj8T3W2RHWpy4Yb4vu7d95AZkBB15Fhp/52nQY1d6bzfYppQyAKgz+bGtb+BetrhKL5E+CVTW1aGaJJ8KmoTp8yK3FqRFNZqIP4cvec/pQrJWCR2T6vnm25koX+tdc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN0PR12MB6271.namprd12.prod.outlook.com (2603:10b6:208:3c1::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Mon, 20 Jan
 2025 13:44:21 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8356.014; Mon, 20 Jan 2025
 13:44:20 +0000
Message-ID: <0d77dc64-df9c-457b-af3b-ecfa49dac7b4@amd.com>
Date: Mon, 20 Jan 2025 14:44:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 01/12] dma-buf: Introduce dma_buf_get_pfn_unlocked()
 kAPI
To: Xu Yilun <yilun.xu@linux.intel.com>
Cc: Jason Gunthorpe <jgg@nvidia.com>, Christoph Hellwig <hch@lst.de>,
 Leon Romanovsky <leonro@nvidia.com>, kvm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org, sumit.semwal@linaro.org,
 pbonzini@redhat.com, seanjc@google.com, alex.williamson@redhat.com,
 vivek.kasireddy@intel.com, dan.j.williams@intel.com, aik@amd.com,
 yilun.xu@intel.com, linux-coco@lists.linux.dev,
 linux-kernel@vger.kernel.org, lukas@wunner.de, yan.y.zhao@intel.com,
 leon@kernel.org, baolu.lu@linux.intel.com, zhenzhong.duan@intel.com,
 tao1.su@intel.com
References: <20250115133821.GO5556@nvidia.com>
 <f6c2524f-5ef5-4c2c-a464-a7b195e0bf6c@amd.com>
 <1afd5049-d1d4-4fd6-8259-e7a5454e6a1d@amd.com>
 <20250115141458.GP5556@nvidia.com>
 <c86cfee1-063a-4972-a343-ea0eff2141c9@amd.com>
 <86afb69a-79bd-4719-898e-c6c2e62103f7@amd.com>
 <20250115151056.GS5556@nvidia.com>
 <6f7a14aa-f607-45f9-9e15-759e26079dec@amd.com>
 <20250115170942.GT5556@nvidia.com>
 <5f588dac-d3e2-445d-9389-067b875412dc@amd.com>
 <ZnSm6ULbJbxOU27J@yilunxu-OptiPlex-7050>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <ZnSm6ULbJbxOU27J@yilunxu-OptiPlex-7050>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0171.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN0PR12MB6271:EE_
X-MS-Office365-Filtering-Correlation-Id: e0262313-7f98-4ce8-b2f8-08dd39588af4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SnZQWERVWVpjejlhbFVvT3AvTXJyb01PUFhuZDBKSHdZZEdzSXI1UVJWa21s?=
 =?utf-8?B?VkQ0dys2b0Z6ay9YbW5FR3c3TjZXeUYrNTBjSTVkOVR2cVl5dSszL01Wbm1a?=
 =?utf-8?B?K3prTnhtd2hCSEJUTkZYYlR0cm5GZ3NnVmlpdENFNDd1eEl5SEhqRktraURI?=
 =?utf-8?B?UVJXV1Ivb0NIVUZVZlFrYmpmaTBGNHAxdFQ1aGw0Uk45YjAzNk8xTThPQnIz?=
 =?utf-8?B?bi95Wjg4aFVxdmF1MzBUVjZMei9POFlHT1oyclZYOGtoSmI2M0N4MVowUUZM?=
 =?utf-8?B?THcrd3FaS0ZYUFhiSFdKNVhaMndEd3lKQ3JZaXJNRVNWY3pWK0VKYWp3QU44?=
 =?utf-8?B?YW1wOTlXWVFXaWtWNFplNkdvMkdjKzhjYTRuaWNOWVl2NHA3OHlEY3lBcEdN?=
 =?utf-8?B?U3FqT3lBYjNaVndiMjhyb3pxc0xqODRMMFFYdVJCOEdYUXhPMmZJM2RiMHRO?=
 =?utf-8?B?a1lpcnp5QWFNM1ZOaG1hczNOb0V0dUxLQWRWZ0Q0ZnlEVE9ta1RvZUE4TUJV?=
 =?utf-8?B?QnpBNlk2K01YZ0N1ZVlYeDhLekx3ZjJvVU45dVQzakloVG5iWS9lVkRuM1pm?=
 =?utf-8?B?dlY0ZCtCWUFVcnZrWER2RUgvZVM4V2owdldXL2VUbW1USytpOGZvRS8zYUJw?=
 =?utf-8?B?WXZzS2VSdW1vWkpkb09Fa3ZnK3FiM2FWYXFlOUF0cG1zZmV2d1BOeGU4M3lY?=
 =?utf-8?B?Y2diaTZmVFVXRnZENDN2NmxxWEhkc3BZZHVWUkd2WWRVYytES1NhOTZ1QTJh?=
 =?utf-8?B?L1NwMWk0ajNrbkVNc3pUb2JBeWd5S1MxRmFBRWpSUGxhRHRRNlRoZmh5eHdk?=
 =?utf-8?B?WTc4dE5wUG1DRThpWmd1cmpDczdFVVpONk1SOXlWVk10azlqVmt0NE1OMHBh?=
 =?utf-8?B?ZXVhT2JlWElJbGhQSnp0RWkvQWtMMERKWWs2UmJINmI5aEtjWHlEVGhZMGRK?=
 =?utf-8?B?cFR5akkwdXplQnpKVHp4M0gxNHhWV3c1encrQ3p5SGliT2ptcjBFTmt0UTkv?=
 =?utf-8?B?ejZ3cmpEcWNUWWtaRDdHOVd2SDFWNHlGSFp6QytLdnpOeWtBdVkyamFqZFpQ?=
 =?utf-8?B?cHV0RUluZ1l5WnFWZzFlY0I1Ulo5bllOQWxjeXQxdDlIM2Y0RS9JS2lMb0F6?=
 =?utf-8?B?cnJWd2pIa3VyWTJLbDBKbDFVQ0JaVjg1QXhGQnJKdVdwU0dMdmhGcFZkbGhi?=
 =?utf-8?B?c01VWDZJMGdqbks3ZlNKOTdsVkN0UTdFSW1UMUl6M0djWkRHaEJueE9oZVdk?=
 =?utf-8?B?WlR6R2l2U25pNmNVQjVpYUxXcFFUNDFZT3p2NlNpSFh0aFZWTy84dzJhc01m?=
 =?utf-8?B?MEhxdzF1cFpZdEkyNStndE5QL0hpUjd6RTFVYTdkZ2gxWUo2U2hnNUQxTEtY?=
 =?utf-8?B?clBVdk9WQ09jUC90REc3cVhKajk4aHJNWklMYVRUdm9vQ1hya21Xb2VBRWl0?=
 =?utf-8?B?QTB5d3hLUFFBZlAxcmV3eVdMWUsvd2U3SnFKcTVqNGVyUFE2ekF0Z3YzWGVt?=
 =?utf-8?B?V0FqcVpHbGRDWkhQZDNUa0pUNnNLMTc1ZW9wenZHV05iS0tvQ1FpWG9vbENY?=
 =?utf-8?B?YUV5ZWRZZkRSTTZUcnlwWElIeDJGUTdLVXhBZmVjS1JGb2RnRExIdDU3bHVy?=
 =?utf-8?B?UTljMmlLVE5vc1M0ZTRzU3NibkluTWJNK0RhZU1mQmtld2JDRnNZVi9tTnBs?=
 =?utf-8?B?c2l0WnZyZHBJK1NBTzZqZTNwclZjb25PcjJoWndoS0M0czFwQitFNkxxZzdx?=
 =?utf-8?B?SVVOZWgrVkxZVlVpc21ZZjNRY0ZacjlDVzdvaDhxbStUbU8rUHRWYVVQYndD?=
 =?utf-8?B?c045T3plUDNUeHFGOE5qT251Tll3eGFMVnhKRzJlZXA2RWxic2Nvci9oTzQ1?=
 =?utf-8?Q?BOGIc/rbxC49M?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V0srcHZzTURKYUZWZHRBTk5ZS3U2NlQ1RGo5RTJOWmxUdFVReVdSdHQ4bG1w?=
 =?utf-8?B?djgvQzZmSm1tcXRWMHRiMlBrQjJDbWJtRUE0TnBCbUs3cU9QVncwZWRNL0k4?=
 =?utf-8?B?Sk1kYlV5M1RBY1VPM2JjdkxzR0pjcjVYKzVWSytlMjFqQ2pEMmUxZnJMQmNF?=
 =?utf-8?B?NFg2aEIzMUhFYTRpRXZRK3hqcVZKc282dDBoRzJkYk9HTGIxYUg5N090VXl5?=
 =?utf-8?B?SG1xZGdvYkFoaEJ3enVvVXYxazlHMVQydFU4S2o5a25oTkpkYTdlZjJ0VVVV?=
 =?utf-8?B?c3dFZnVKbm4rOXFKVXJmempJdUlNVE51d09PSktoSDJjZkpDcXBmMzViQUJC?=
 =?utf-8?B?T3ZxT1FvekpjMVFmb0NzVUNNMHNyOFBsMGlRQUZEK1hNalQ3d3kxbDI5d3cv?=
 =?utf-8?B?bmVLSDZveE9zRStlZ0hMVU9MTWJWZ3dFNkwyNXk5OG56akx5N0RydUFVemkv?=
 =?utf-8?B?MmV6V3d4NzBkTXlmK2Roek8xd0VXSTJUeUtka0Z4eitaVTVVK2tod3E3WjFi?=
 =?utf-8?B?Y0lKRGJqZ0ZlTlRaSkhPU2ErRVNwbUZ5QjNjbE5Ra0lqRC82azJkUVRpZ3hS?=
 =?utf-8?B?R2psak1jeXQrSUN5SWxZSkg4TnpEYXJlVVdDMVdYc09hbXNoblFCOEoyMkhR?=
 =?utf-8?B?VU9vaGdwdVpSYzMxWGZkUERqcytEa3BteVBmdkRaQjI2NnQyajQ0bHlqRXJn?=
 =?utf-8?B?TjBURE5LbE44eTl5d3BkVDM2NWhGUkJMY2FtWlB2Qnc3Z0txV1pvMjl3aDVN?=
 =?utf-8?B?Y1RWZnFrUThUbE90YVZxcEVEMTExbVcrQ0dmWXlmUElwczVIUUZNV25MSjZ5?=
 =?utf-8?B?KytaOXNwb095SmhWMjhSZ2R3akVLaHI3eDM2RXduRWhxWTJxcXd3SWttVFRG?=
 =?utf-8?B?SHd5VXZ0VExkNGZtcjR4M2pTNWg2Yml4S1ljdWV2TmQ1Z3k1Q052ZHFUYWdt?=
 =?utf-8?B?WGZpa0g1OXVGQ200ZFFEU2NKdTVjaUd0S1YxK0lJUGYxMEcwTC9zWFRIR0Uy?=
 =?utf-8?B?b0dDNWZLeXdXek00aVZOMzM0UDMzU2hST0Njald2VHlLSVVsTVFtQmFoM0k5?=
 =?utf-8?B?QXZzaWtqWE9EZ2I2RmEzT3hNRkpmNlZNQjFnKzBKMzFoNVJEMWZuNTVtT2c0?=
 =?utf-8?B?QzZxZ2JnUW5pK0FmWTZWN1dEOTgrZlR4U3FpRFIzWnBXMThFWVUwS0RyUjEz?=
 =?utf-8?B?UWI1YlVpTjViZVRhNW9RVUZSTXRoVnlIaGdranpST3JNV0t5RTlkN3BzZEkx?=
 =?utf-8?B?T2JyV3BsL1BFZG00R09xS0FnL0d1N2ZnTmtUaTZyUnE3dzdnb3diMWJvN2ph?=
 =?utf-8?B?ZUZ6QWV5c2ZFTWE1NDJyMEVJNGxLQ1JJaWpTM1hESXIzSmhNTFI1eWtBOUdk?=
 =?utf-8?B?Y2ZMSDUxQnA2TjUzUnNkKzFUenVDZzNEY3VtbUc3bzBjazh2ME1tTVY1ci9k?=
 =?utf-8?B?NE5TR0NrQTAwQ0FGODIvL2QrU0NuNGc1L3c3ck0yaStaTnoxZitBRExqV1Rh?=
 =?utf-8?B?ZHMxSHoyU1phRXdvS2VxM2hjK3dEQnZrRmlINTgvVms1b0M5cWtVWUdpck1S?=
 =?utf-8?B?amR2MUVIMUNhcncrTHB5cHI0OHFTT1VVVG9aVGwzVXNGcjJLbzJwc1JtQmlB?=
 =?utf-8?B?eEhmMncwN0J3bTFvekRRUjFwRXA1K0JzQXUydmkzOExZb3Y1S25uL2pMWjF6?=
 =?utf-8?B?QVgyMlo0aEtrSTFpYlNZcVFOMlpLcUdRTUNnVE5DbzVoYWdtVzFsTEJxV1d5?=
 =?utf-8?B?WjVZZlZ2UUdsVzVPbTUwL2tYSUdWMUQ2ZEZPcDRtajl1SmZnVmFnZnBORjBY?=
 =?utf-8?B?b3hOaW9TZlAvbnNnTGkzSm9mU1AwejVZSHovbUdqemxNL3pVUFNuSVZRdDk2?=
 =?utf-8?B?T0ZtWHA3QTFTRmtwL012c1ZJMENmVlk5ajlRdmM5VWpIdjcxWlMzU0xpcUNT?=
 =?utf-8?B?TjBxN1paZFVLQ2p4UW1Ib0hpa2VONmQ2MVRza081TDR2QWJHY0NJSFBqSEM5?=
 =?utf-8?B?QzJmdG1hdjZJOW9LQmFhbmVEY1R1aWR3UHc0a3l1K1huak9lVzk1akwyN0F1?=
 =?utf-8?B?T2dORjZIdmtna05GblpRVkhpd2tCbmtpTFAwNmtKL2R1QVc3cktDeWg0TXVI?=
 =?utf-8?Q?vcVFdvDiD53hB+g+hmt/gsyj4?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0262313-7f98-4ce8-b2f8-08dd39588af4
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jan 2025 13:44:20.8701 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q+rm2VTl9msIv71h6Uo7d66GwH3aglle2Lrg2CnF2+CW7xAkq5Kynxm6HvssOOVj
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6271
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

Am 21.06.24 um 00:02 schrieb Xu Yilun:
> On Thu, Jan 16, 2025 at 04:13:13PM +0100, Christian König wrote:
>>     Am 15.01.25 um 18:09 schrieb Jason Gunthorpe:
>>
>>   On Wed, Jan 15, 2025 at 05:34:23PM +0100, Christian König wrote:
>>
>>      Granted, let me try to improve this.
>>      Here is a real world example of one of the issues we ran into and why
>>      CPU mappings of importers are redirected to the exporter.
>>      We have a good bunch of different exporters who track the CPU mappings
>>      of their backing store using address_space objects in one way or
>>      another and then uses unmap_mapping_range() to invalidate those CPU
>>      mappings.
>>      But when importers get the PFNs of the backing store they can look
>>      behind the curtain and directly insert this PFN into the CPU page
>>      tables.
>>      We had literally tons of cases like this where drivers developers cause
>>      access after free issues because the importer created a CPU mappings on
>>      their own without the exporter knowing about it.
>>      This is just one example of what we ran into. Additional to that
>>      basically the whole synchronization between drivers was overhauled as
>>      well because we found that we can't trust importers to always do the
>>      right thing.
>>
>>   But this, fundamentally, is importers creating attachments and then
>>   *ignoring the lifetime rules of DMABUF*. If you created an attachment,
>>   got a move and *ignored the move* because you put the PFN in your own
>>   VMA, then you are not following the attachment lifetime rules!
>>
>>     Move notify is solely for informing the importer that they need to
>>     re-fresh their DMA mappings and eventually block for ongoing DMA to end.
>>
>>     This semantics doesn't work well for CPU mappings because you need to hold
>>     the reservation lock to make sure that the information stay valid and you
>>     can't hold a lock while returning from a page fault.
> Dealing with CPU mapping and resource invalidation is a little hard, but is
> resolvable, by using other types of locks. And I guess for now dma-buf
> exporters should always handle this CPU mapping VS. invalidation contention if
> they support mmap().
>
> It is resolvable so with some invalidation notify, a decent importers could
> also handle the contention well.

That doesn't work like this.

See page tables updates under DMA-buf works by using the same locking 
approach for both the validation and invalidation side. In other words 
we hold the same lock while inserting and removing entries into/from the 
page tables.

That this here should be an unlocked API means that can only use it with 
pre-allocated and hard pinned memory without any chance to invalidate it 
while running. Otherwise you can never be sure of the validity of the 
address information you got from the exporter.

> IIUC now the only concern is importer device drivers are easier to do
> something wrong, so move CPU mapping things to exporter. But most of the
> exporters are also device drivers, why they are smarter?

Exporters always use their invalidation code path no matter if they are 
exporting their buffers for other to use or if they are stand alone.

If you do the invalidation on the importer side you always need both 
exporter and importer around to test it.

Additional to that we have much more importers than exporters. E.g. a 
lot of simple drivers only import DMA-heap buffers and never exports 
anything.

> And there are increasing mapping needs, today exporters help handle CPU primary
> mapping, tomorrow should they also help on all other mappings? Clearly it is
> not feasible. So maybe conditionally give trust to some importers.

Why should that be necessary? Exporters *must* know what somebody does 
with their buffers.

If you have an use case the exporter doesn't support in their mapping 
operation then that use case most likely doesn't work in the first place.

For example direct I/O is enabled/disabled by exporters on their CPU 
mappings based on if that works correctly for them. And importer simply 
doesn't know if they should use vm_insert_pfn() or vm_insert_page().

We could of course implement that logic into each importer to chose 
between the different approaches, but than each importer gains logic it 
only exercises with a specific exporter. And that doesn't seem to be a 
good idea at all.

Regards,
Christian.

>
> Thanks,
> Yilun

