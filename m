Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77A2BA85DA5
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 14:50:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D8CD10EB9F;
	Fri, 11 Apr 2025 12:50:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JhgGu10J";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2048.outbound.protection.outlook.com [40.107.92.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADF4410EB93;
 Fri, 11 Apr 2025 12:50:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TWAzqNKJ+wNKVzDisje9/WRRNISGwgOQFyC8yg3LwJLpBGYuaFrh89qlBvm5Yt91LzwVHcH6yTUbPNgg29YeoIjDW9oPuGxbRi5pyYc9PjwJ7T/F8WsIUY54AhLZ6SGLFQUpDMdm8Z08s0799InyrKsNig3v9ABiNoua/mkn4mDZ8SKo3fqAqe0dHIoXb8hjzWENBCRHgnRZqXfsg9zPCm84UV3NXzRefQZquq9WNk4JWRWPCNkM+qjBc0Sv04SBSMyERKdu/n73DLxsyOa63Tw8HACQk2NFv9DtmZAVtTn2tK4NwaMYfUNceFNKLp5vTcYUF3yme2U9sv2R9esQfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d28RgpgevPepMuuyujO1E/zV7cGNAMa12UvrlTdDdlM=;
 b=M/a9ofn270Xw7DOgv56ZAPxojxinZx2wDT8So5TZcK5LEn+L9shDX2JAPaaxykAbiC9WPNCY6YY5zyetyI/oSEXfLr2XCu6Cn3qe2qfoIXH3JMYMQKQzUFXd8uNOiqbo6d3I5y9gerYauzFMkVosmUO1hppkjl3gqCgrIFlmneXaiQ+9TiHDlVJe478r/my0OSb5P+dyVVvuV2i0cyw+H7GA2HLXcbkPRV1csfIBKB8Ns2CWq2ec8PWBy2w4urKRAy20GCqoh9FURHivY7M2M3NkmqXaQEeshk4wQaa3ZMIgYqXG6nxTjt0JXuUtaTwEaUP3Gh4cZN80MSo3FUTx6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d28RgpgevPepMuuyujO1E/zV7cGNAMa12UvrlTdDdlM=;
 b=JhgGu10JUF/6AMpXjpUSoV7t1oGKwNuUJgP1EYXS/T9HwIVLhxOgYLOig+rIy9pjra7cMiuyouIKgd4tCgtxeqqR5puy4GYrq2SqLqK1+wLsP7qRm68/MoDmWEUWfZOx4BexlAS2+ZKxAhdDhTZk/vmFB6EDuBKqARIiBgWEJcs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB6133.namprd12.prod.outlook.com (2603:10b6:8:ae::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8606.32; Fri, 11 Apr 2025 12:50:30 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8632.021; Fri, 11 Apr 2025
 12:50:30 +0000
Message-ID: <0de085c4-0940-4f7a-83b9-5c8444070fb3@amd.com>
Date: Fri, 11 Apr 2025 14:50:19 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/8] drm: Introduce sparse GEM shmem
To: Simona Vetter <simona.vetter@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>
Cc: Alyssa Rosenzweig <alyssa@rosenzweig.io>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 =?UTF-8?Q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>,
 lima@lists.freedesktop.org, Qiang Yu <yuq825@gmail.com>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>, kernel@collabora.com,
 Faith Ekstrand <faith.ekstrand@collabora.com>
References: <20250404092634.2968115-1-boris.brezillon@collabora.com>
 <20250410164809.21109cbc@collabora.com>
 <d4ebcb9f-ca1e-40ae-bc3c-613f88552b94@amd.com>
 <20250410175349.6bf6a4ea@collabora.com>
 <d0ab2ffe-77ee-4bda-b127-8648acb71409@amd.com>
 <20250410192054.24a592a5@collabora.com> <Z_gHX5AqQkhbXOjd@blossom>
 <20250410204155.55d5cfc7@collabora.com> <Z_kEjFjmsumfmbfM@phenom.ffwll.local>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <Z_kEjFjmsumfmbfM@phenom.ffwll.local>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0006.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB6133:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e346003-524a-4f56-4771-08dd78f770df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cTFHNWd6RE9lODB6YnE1aVZJdmwvOXhsWWJlUGY1Q1BvTzB3TlpRd0pDell1?=
 =?utf-8?B?UStLeUNoMlcvSnBmL1BRaEZRVUxlZUNrQVNXcjNsb0g4Qy9NMGFWME9pSHBo?=
 =?utf-8?B?WlJUOU9heDhsZnZzTi9MaWV6aFphTVNhRElVUjZxUFNlRkwvbjJIK05zWHVS?=
 =?utf-8?B?ckhsa2ZvZ1BkenFWUUxtQlAvbzZyd1Ayd0lUN3ZyQ3pFVWpmcmtqbU5Rc2pD?=
 =?utf-8?B?YSt3NDc3aTlYd1lXNGNjeTZzU0s5YVEra1phTnVwZGJ2bTI1TzlLNThqdkNM?=
 =?utf-8?B?UEF6S2FZd1UzSVhHcGkybGl6OHRlNmVTS1lha2JreEc2THd2R3ZIdjJlaE91?=
 =?utf-8?B?aFFtZllZeitvRDBmbWhhTkJXajUrclowRklFZndOQU1NYW0wWUVCK3NmaC9K?=
 =?utf-8?B?VUg4QjIvMDA3ZXdQQjMrd21FN3RSRVoxVG9hQm4yelk4Vkhuc0lWUWZ6ZEth?=
 =?utf-8?B?emk0TVdJV2RIMWJqSkwwOGtQajJRY2pTZGJYbmlZZFpzUWU2QmluaC9VbnhR?=
 =?utf-8?B?REJEU0hwM3RsTC9oYUdBejRYNndHc2FKMlAyTWl0OGNPam02UU52VGhuVTUz?=
 =?utf-8?B?S3hCQzNIQkVSZHoyVFUyQlZucGhUUUppZyt0TkU5cG1HMUgvRGxtMEx2NmVL?=
 =?utf-8?B?RFFyZVFxeFAxWHJXSFA3TStsNE9ySzhoTFo3a3RCQ0lxanFrV0IybzEvT1Bk?=
 =?utf-8?B?VmpkU09JUFdyUzlqdEVRb0dXRTFzMFQvM2ZQUUZYdnpzSHMzMDdLc0tzcTJN?=
 =?utf-8?B?Mnd2eWFjYUowMzVCb0tMMzZEdHQxU0RURXBpalczM1IrUWsySmZLUVRzS0l3?=
 =?utf-8?B?OEhQOFVtdmQvTm5XYWNYNzFaMFRWbnptTUZOblhVVnNMWFV5RUJDbmtvQ2wy?=
 =?utf-8?B?YTRiMndYT0ZwRXJ5eGxUbGgyL1NVK01XQnhFTjhUMEZSaEVTUWhtRkZqcDR4?=
 =?utf-8?B?N1MvMytiM2Ivb3dJcjQzc0ljeXpUUnhWT0JSdEdzS2hwNWVuTkVhYUhvZkxx?=
 =?utf-8?B?SFd2eVhmR2FZTVVHYTAwMTlSdFlUVThLUGg3elcxNEkyWE5VcmtjNnozeXJ1?=
 =?utf-8?B?K2xyVm02TnFsS0JuMDUxZFdyamUya0ppY0JZT0dLMGdWQ0FWMHFtdmVKN0p6?=
 =?utf-8?B?WGR3Zm1OOEZURzV1S2FVSUhXd2hVTDViTFU3ZklEeXVJT2JCSGFHeDZocS9l?=
 =?utf-8?B?SjlRUWViR3plc2ZOWWJnemUxTWcwSjA1VHJXcG81L1hWb0ZwdGlMV0Y5MHNH?=
 =?utf-8?B?bkYvVzdBVEsrRFhManlJSFBwbFZHa0xZVU9HMTZNc2kzU0MybXVGWEF2SHhw?=
 =?utf-8?B?QklmMVJCaU5uc3VoZDBIV1BZczUrcndpMDRxUUdqWE5RdmFIbmdtNmdSSlJM?=
 =?utf-8?B?N1YyYTNTTURqUDRmbVl4cWZPZFZRR2NUc2k3VDlWME8zanNBT2JPSEVDUEFy?=
 =?utf-8?B?N1lyRjVXVk4vZm9iVGU2SjQ1ZzFFNDRxZCsyaTRkdkVQT0lWTVgxSXpQL20w?=
 =?utf-8?B?UjlaZzlManpkam1wYkVHbjlJSTJWdC9NMzZYbFAwQ2JrVnhjTEUzZlNUdE96?=
 =?utf-8?B?THVlTlZWdU1RaHJHUFJqOUdpUlJaSTVRemw5M1hxbGpOWFRaRHpTOGlpOGNE?=
 =?utf-8?B?SUJ5RUZ5cGR6YnBJTDl0Y05namlYZHVKWGk1dXNPeG1rNkk1N25YMDBKbVQ5?=
 =?utf-8?B?VS9NWUkyVDBiM1lYVjNVTXh4Q0cwQjBmOVFBNklYWGwxbHpXSVY1V1F5Wm5l?=
 =?utf-8?B?bzdCaDNXWUFZbUMwemhvdE5YbENJQVdSb1YyQ0NwbE9HY0xWODdTcm83bDR2?=
 =?utf-8?B?dWxib1drVGJHRDFacUNoNjBKNlUydnhxOXJJbS9SdnNRNmEvRVgwRTlDL0Jl?=
 =?utf-8?B?emZKcitMZDF5WC81TzkrSnphbDdnRExka2VTc3NodGppYzlNdHp5a04yZTcy?=
 =?utf-8?Q?7KpI3ZI2ZeM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VzhQTEhwYkh4RitiNXVnOGUxYUVPZjU0V3Q2ck1JdGh3c05waDdMRitycDVF?=
 =?utf-8?B?S2J1ZHNVaEpNZVJkdE5FRmM2dUVFdVgvVlZ4NWFGL2VjaWdlV0tvZ0ZIT3RI?=
 =?utf-8?B?YWVLSC9Ya0J3RXBmNk1hbWU1dFZyK0NlTXdOeDB5ZVdLYVJTeUw4YW9Xd0Ru?=
 =?utf-8?B?aFNZWjNJT2hXQVRtWG5Hem41d2pwUzM3S2dqVVo5RjVwbUFxL2RxdDEyU3VQ?=
 =?utf-8?B?RHNTQTlCbjN1LzZQRUZJcU80cHFXVUhrMkk1UGZaTnY3Q2tuL052V1g1c0sz?=
 =?utf-8?B?eDJTb1l3VkJUT2Y5b0VrRzdFSGpNRDFrVTdxcHl5L25nVEZpejRFa2ZxanUr?=
 =?utf-8?B?S2VHMzh5SVFOK2hvUjBoMWZ3cUdxN0hLdWwvUkR0UFBHdDdMRXpMem80YlRy?=
 =?utf-8?B?d2srR0FjNTdVNXNiSnlxYk03clNTQVJRdU1BUXhTN2xlN1NEVWc2dEZuTENE?=
 =?utf-8?B?Ui9YUjdLMWFhS0hMSlpteVNJeUhFMnZOQmdTeENwWFlwcFFOcHAvR2o2Y01k?=
 =?utf-8?B?QXFZUU5OVTBmZ0pPeDdBTFVFdGpqcDdSeWZhMU9lR1V5eVpxSEU1V3FVNGE3?=
 =?utf-8?B?SVBtNzYwSmdiNUkzV3h3YndhcVlNY3cxaG5Tc3J3UTNvY25YaUJxazNxQ0tz?=
 =?utf-8?B?bG1BV0dRZXg4RmxsNHBXVk5WZ243NWhYU3NRMzI0YlRpT1A0NmRldTJvc2ZT?=
 =?utf-8?B?TG4yajA0Skx0Q1d0TmxOYWQ5NHZKcnhBV3p0L0preWk3SFR6dysxVGxFMVJH?=
 =?utf-8?B?Y0xUdXBpcmxGUVFpeHFZZmdwWEdDNVFRUG9MNmVJQzVTWTdPUU9peitrbk8x?=
 =?utf-8?B?NEFNdzZMSzFiWDgwM2xNWHJvM2ZCSGlyZTgwNWU0cFM3aEkxajJpaExzdCtq?=
 =?utf-8?B?bGZpWldKYVl6MENjZEZ6U0FpZXFWNXJSVVNZZG9EQ3V3YUJ6TVpPVldOZFR6?=
 =?utf-8?B?cjZhTzRWdkJHTGZvbmd3d1g5SEpTRGIxOXNDbXZscjgvbEY3SWdEaHdmTWRK?=
 =?utf-8?B?MXhaM0dGaTJFdTBPQlR0WEwxc05mcVYyb2c4c1JkU1VQMlRuMkVhZFdnREFO?=
 =?utf-8?B?ejFrSjdWMDk2c3drUE9iU0kvMTJWK0xFMkZJdm9McWhCZElNWnNzYzJRbDRI?=
 =?utf-8?B?MXRacGpyRnZWTGRTNzBhRGE3QURiQ0Z4eC9PQlpVaElsRHk0ejRrSlBSTXdD?=
 =?utf-8?B?M1pOVkV4ZjhWUWIyZXlGWnNpNVRzUDhiSmZYOEhZNzNWb3VML2tFaWRMeHpo?=
 =?utf-8?B?Unk3ZlRKYStGSVE3R0JMY2xMclE4QXY0Wm16SEx1WjVDVkY1b3ZuRTU0WVo2?=
 =?utf-8?B?T2xZSFJVTjVTeVcrMzR1NjdHaWpxMWRkRTZMa29yTHlOaXowZlY5bHZ2NFdV?=
 =?utf-8?B?aDBoZjNxVzFQbVh2WXRBcG4yUC8zMEhFOW4yNWoxcVRKQ08xVTFpMzZlMU5i?=
 =?utf-8?B?YVhSUVV0Nng0eWdWenNKSWdvcFdLbW03K3diZ1ZFTXB3cU1GSGN2QjFRNWNy?=
 =?utf-8?B?MEp2RHYrMTZudEtkSTc5ZFNpbVp4VVdETGtDSFA3RDd4K0ZZKzZQMCtyWVpM?=
 =?utf-8?B?dGFtYUdZa3dUY3RseHVGYi93cTFBVSsyV0VnTGk5NnBwc2JjVG9RUlpNd3Bn?=
 =?utf-8?B?UmFJTmQ0VERYZlFnbXBYenJkNmNGaWdFZExDS2lLSVZDUitobVBBN3dYc2ps?=
 =?utf-8?B?cmVNNUJZeXliNS9kUDZPK09Fek90ajcrcFVwbFplL2p4dzZVcUZBMUkxa2VL?=
 =?utf-8?B?RUtQSFNtN3BxOUx6ZVdNQXcwYUpoTVcrcExlYnM4MFdGNkJhbUdhMDN6bmtp?=
 =?utf-8?B?d2pWakRnTXQvNmQ2dkN0V0ZXcVZLVjBpcythK2EvL0dpT1dMVWEwME45OWJl?=
 =?utf-8?B?TUk1YlJjWlBQeWt1c1lrNnZKd1lyaVhyUDlkQTN3N0k3UUV0TzRvWHY0aVJj?=
 =?utf-8?B?RnRzc0hSV3ROTytMOW5ZZlcyUlBua3Q5NkZITVZNUEQwNmxaQ3VsdUJxQTds?=
 =?utf-8?B?c0NKTEU5VUFYMEZvakRwcmpoYVlMbS9pbEVuK2crMEZIb08wcXFYb0FIWEdy?=
 =?utf-8?B?Z2JNQmJBbTV3ZDM5WGNJNTA2OXNGU2Z2T0oveU1EZml4dHZBV2tXaHJJQVNL?=
 =?utf-8?Q?Lv91B5o3WfN/EyciJINTI3nRs?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e346003-524a-4f56-4771-08dd78f770df
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Apr 2025 12:50:30.3451 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TBw5Jw+aNIQeF4k9qqkEJemZn3mtZX7nbxHWvzq7jc0swezQlj11Hn8JixS6jhLq
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6133
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

Am 11.04.25 um 14:01 schrieb Simona Vetter:
> On Thu, Apr 10, 2025 at 08:41:55PM +0200, Boris Brezillon wrote:
>> On Thu, 10 Apr 2025 14:01:03 -0400
>> Alyssa Rosenzweig <alyssa@rosenzweig.io> wrote:
>>
>>>>>> In Panfrost and Lima, we don't have this concept of "incremental
>>>>>> rendering", so when we fail the allocation, we just fail the GPU job
>>>>>> with an unhandled GPU fault.    
>>>>> To be honest I think that this is enough to mark those two drivers as
>>>>> broken.  It's documented that this approach is a no-go for upstream
>>>>> drivers.
>>>>>
>>>>> How widely is that used?  
>>>> It exists in lima and panfrost, and I wouldn't be surprised if a similar
>>>> mechanism was used in other drivers for tiler-based GPUs (etnaviv,
>>>> freedreno, powervr, ...), because ultimately that's how tilers work:
>>>> the amount of memory needed to store per-tile primitives (and metadata)
>>>> depends on what the geometry pipeline feeds the tiler with, and that
>>>> can't be predicted. If you over-provision, that's memory the system won't
>>>> be able to use while rendering takes place, even though only a small
>>>> portion might actually be used by the GPU. If your allocation is too
>>>> small, it will either trigger a GPU fault (for HW not supporting an
>>>> "incremental rendering" mode) or under-perform (because flushing
>>>> primitives has a huge cost on tilers).  
>>> Yes and no.
>>>
>>> Although we can't allocate more memory for /this/ frame, we know the
>>> required size is probably constant across its lifetime. That gives a
>>> simple heuristic to manage the tiler heap efficiently without
>>> allocations - even fallible ones - in the fence signal path:
>>>
>>> * Start with a small fixed size tiler heap
>>> * Try to render, let incremental rendering kick in when it's too small.
>>> * When cleaning up the job, check if we used incremental rendering.
>>> * If we did - double the size of the heap the next time we submit work.
>>>
>>> The tiler heap still grows dynamically - it just does so over the span
>>> of a couple frames. In practice that means a tiny hit to startup time as
>>> we dynamically figure out the right size, incurring extra flushing at
>>> the start, without needing any "grow-on-page-fault" heroics.
>>>
>>> This should solve the problem completely for CSF/panthor. So it's only
>>> hardware that architecturally cannot do incremental rendering (older
>>> Mali: panfrost/lima) where we need this mess.
>> OTOH, if we need something
>> for Utgard(Lima)/Midgard/Bifrost/Valhall(Panfrost), why not use the same
>> thing for CSF, since CSF is arguably the sanest of all the HW
>> architectures listed above: allocation can fail/be non-blocking,
>> because there's a fallback to incremental rendering when it fails.
> So this is a really horrible idea to sort this out for panfrost hardware,
> which doesn't have a tiler cache flush as a fallback. It's roughly three
> stages:
>
> 1. A pile of clever tricks to make the chances of running out of memory
> really low. Most of these also make sense for panthor platforms, just as a
> performance optimization.
>
> 2. I terrible way to handle the unavoidable VK_DEVICE_LOST, but in a way
> such that the impact should be minimal. This is nasty, and we really want
> to avoid that for panthor.
>
> 3. Mesa quirks so that 2 doesn't actually ever happen in practice.
>
> 1. Clever tricks
> ----------------
>
> This is a cascade of tricks we can pull in the gpu fault handler:
>
> 1a. Allocate with GFP_NORECLAIM. We want this first because that triggers
>   background reclaim, and that might be enough to get us through and free
>   some easy caches (like clean fs cache and stuff like that which can just
>   be dropped).
>
> 1b Userspace needs to guesstimate a good guess for how much we'll need. I'm
>   hoping that between render target size and maybe counting the total
>   amounts of vertices we can do a decent guesstimate for many workloads.
>   Note that goal here is not to ensure success, but just to get the rough
>   ballpark. The actual starting number here should aim fairly low, so that
>   we avoid wasting memory since this is memory wasted on every context
>   (that uses a feature which needs dynamic memory allocation, which I
>   guess for pan* is everything, but for apple it would be more limited).
>
> 1c The kernel then keeps an additional global memory pool. Note this would
>   not have the same semantics as mempool.h, which is aimed GFP_NOIO
>   forward progress guarantees, but more as a preallocation pool. In every
>   CS ioctl we'll make sure the pool is filled, and we probably want to
>   size the pool relative to the context with the biggest dynamic memory
>   usage. So probably this thing needs a shrinker, so we can reclaim it
>   when you don't run an app with a huge buffer need on the gpu anymore.
>
>   Note that we're still not sizing this to guarantee success, but together
>   with the userspace heuristics it should be big enough to almost always
>   work out. And since it's global reserve we can afford to waste a bit
>   more memory on this one. We might also want to scale this pool by the
>   total memory available, like the watermarks core mm computes. We'll only
>   hang onto this memory when the gpu is in active usage, so this should be
>   fine.
>
>   Also the preallocation would need to happen without holding the memory
>   pool look, so that we can use GFP_KERNEL.
>
> Up to this point I think it's all tricks that panthor also wants to
> employ.
>
> 1d Next up is scratch dynamic memory. If we can assume that the memory does
>   not need to survive a batchbuffer (hopefully the case with vulkan render
>   pass) we could steal such memory from other contexts. We could even do
>   that for contexts which are queued but not yet running on the hardware
>   (might need unloading them to be doable with fw renderers like
>   panthor/CSF) as long as we keep such stolen dynamic memory on a separate
>   free list. Because if we'd entirely free this, or release it into the
>   memory pool we'll make things worse for these other contexts, we need to
>   be able to guarantee that any context can always get all the stolen
>   dynamic pages back before we start running it on the gpu.
>
> Since the tracking for the memory pool in 1c and the stolen memory in 1d
> has a bunch of tricky corner cases we probably want that as a drm helper
> which globally does that book-keeping for all drm/sched instances. That
> might even help if some NN accel thing also needs this on the same SoC.
>
> 1e Finally, if all else is lost we can try GFP_ATOMIC. This will eat into
>   reserve memory pools the core mm maintains. And hopefully we've spent
>   enough time between this step and the initial GFP_NORECLAIM that
>   background reclaim had a chance to free some memory, hence why all the
>   memory pool and memory stealing tricks should be in between.
>
> The above will need quite some tuning to make sure it works as often as
> possible, without wasting undue amounts of memory. It's classic memory
> overcommit tuning.
>
> 2. Device Lost
> --------------
>
> At this point we're left with no other choice than to kill the context.
> And userspace should be able to cope with VK_DEVICE_LOST (hopefully zink
> does), but it will probably not cope well with an entire strom of these
> just to get the first frame out.
>
> Here comes the horrible trick:
>
> We'll keep rendering the entire frame by just smashing one single reserve
> page (per context) into the pte every time there's a fault. It will result
> in total garbage, and we probably want to shot the context the moment the
> VS stages have finished, but it allows us to collect an accurate estimate
> of how much memory we'd have needed. We need to pass that to the vulkan
> driver as part of the device lost processing, so that it can keep that as
> the starting point for the userspace dynamic memory requirement
> guesstimate as a lower bound. Together with the (scaled to that
> requirement) gpu driver memory pool and the core mm watermarks, that
> should allow us to not hit a device lost again hopefully.
>
> I think if the CS ioctl both takes the current guesstimate from userspace,
> and passes back whatever the current maximum known to the kernel is (we
> need that anyway for the steps in stage 1 to make sense I think), then
> that should also work for dead context where the CS ioctl returns -EIO or
> something like that.

+1

It is a bit radical but as far as I can see that is the way to go.

Additionally I think it's a must have to have a module parameter or similar to exercise this situation even without getting the whole kernel into an OOM situation.

Fault injection to exercise fallback paths are is just mandatory for stuff like that.

Regards,
Christian.


>
> 3. Mesa quirks
> --------------
>
> A database of the fixed dynamic memory requirements we get from step 2
> (through bug reports), so that we can avoid that mess going forward.
>
> If there's too many of those, we'll probably need to improve the
> guesstimation 1b if it's systematically off by too much. We might even
> need to store that on-disk, like shader caches, so that you get a crash
> once and then it should work even without an explicit mesa quirk.
>
> Documentation
> -------------
>
> Assuming this is not too terrible an idea and we reach some consensus, I
> think it'd be good to bake this into a doc patch somewhere in the
> dma_fence documentation. Also including Alyssa recipe for when you have
> hardware support for flushing partial rendering. And maybe generalized so
> it makes sense for the GS/streamout/... fun on apple hardware.
>
> And perhaps with a section added that points to actual code to help make
> this happen like the sparse bo support in this series.
>
> Cheers, Sima

