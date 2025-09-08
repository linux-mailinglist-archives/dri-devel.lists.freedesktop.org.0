Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2650AB496CE
	for <lists+dri-devel@lfdr.de>; Mon,  8 Sep 2025 19:16:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD9F410E581;
	Mon,  8 Sep 2025 17:16:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hCyWJ//D";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2074.outbound.protection.outlook.com [40.107.236.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C831810E581;
 Mon,  8 Sep 2025 17:16:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=g5ZHo1O9nUdVy/R55EoVEW4qae4FJKkanKzdI6dCGJxNn9y2lNZJbZI0dX5PEkPU0TqamTrxgsdtzhVQGGlXMJdsuKHQHNC0/1kniT352PFjPPHRC7VDByXNMoBR7xUqmqU2qd+JEaglZmDW7gqY5TwRL0kLPS1hO++JVrEUpwbcZN2Ckq6gSdpzqrPg7Kk+PbF0IvLv1bIMgF8ue9ZnsQFjSLb/6HdNhkD+mOItBsWiNVSZHmZYdxwIAIRxWfpM261cWOR6bSh7y2FKSHHiKi4XBu8+tNlj4H+KodNlIG2KLYksZIM+cSdF6T/wrc37mqYkwE738l3MQOvH4qgrvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=abKRamqklDYS6Wz82fwA/rb8c8L58gFO0Kda8D/1pF8=;
 b=Go8TL+WOzNw1x45vBLNE5z3N2oPi2aSA6IGX6CihNYUiTi42++9D2atYjUXBf6llGlgSXf9AVtW5hIDCVnsh4YonuUQIpEzwaeLI0cJs5yS/D2Cfkj2TMOE4bvamJV62sy5/vS+w2B7n1De3mDny4TygbiMnPAM4hdEF4Y90XLGZnPDDBepSuquYRvtvOSRFn0p3AFZIDYDVZRzmyRt0IGCjVsK6SE7raFcLYZASqTTrxBNO9hLe2J9OOJl9IE8ilh/bW4hnXl0k+vB9VU93KoAjTuilxwvBHk4pXizXv07gKNxPrMNfmPUJYA4VMZqHd2rOVHcueu9Pp7MzGfgW+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=abKRamqklDYS6Wz82fwA/rb8c8L58gFO0Kda8D/1pF8=;
 b=hCyWJ//DZFhfHdaAo0bW8ZAB4gPgkRjgSmJaOj6FWD6+h+PbEmt/+zsvdMoESfM98mYT8toq0jvuoKVd4JbIUzMdW1pU4BRD4j4/6tZ8KcdgPepr4C7oFYKh0tuDzu21Ecr3WvUfh5xnczm/1ISSAv80shqp38/HtAPLyujvs4WqvLLZ0CAv/hm+nD5et02z2TLMqX/pghzXNKFhinP8IeZODLzIiVdOgdZIaF+Voye/oI0l3Cfrg1ioiEnYaPUvxzm+GJOMM8CHbG4ojlmo6LJJMrcn/GPj0LSKsgKPWFbnO8v/TI8EqOxOnrdkxGWf24ZToAw3t4hafnHnFYgegQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from SN7PR12MB8059.namprd12.prod.outlook.com (2603:10b6:806:32b::7)
 by SN7PR12MB8790.namprd12.prod.outlook.com (2603:10b6:806:34b::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Mon, 8 Sep
 2025 17:16:05 +0000
Received: from SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91]) by SN7PR12MB8059.namprd12.prod.outlook.com
 ([fe80::4ee2:654e:1fe8:4b91%3]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 17:16:05 +0000
Message-ID: <3ef9e2c2-560e-4b58-96f8-a6db4236fe0e@nvidia.com>
Date: Mon, 8 Sep 2025 13:16:01 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] nova-core: bitstruct: Move bitfield-specific code
 from register! into new macro
To: Alexandre Courbot <acourbot@nvidia.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, dakr@kernel.org
Cc: Alistair Popple <apopple@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 John Hubbard <jhubbard@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 joel@joelfernandes.org, Elle Rhumsaa <elle@weathered-steel.dev>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org
References: <20250903215428.1296517-1-joelagnelf@nvidia.com>
 <20250903215428.1296517-2-joelagnelf@nvidia.com>
 <DCN39JCF1DIJ.3JESSN7N9WJBP@nvidia.com>
Content-Language: en-US
From: Joel Fernandes <joelagnelf@nvidia.com>
In-Reply-To: <DCN39JCF1DIJ.3JESSN7N9WJBP@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1P221CA0043.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:208:5b5::13) To SN7PR12MB8059.namprd12.prod.outlook.com
 (2603:10b6:806:32b::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR12MB8059:EE_|SN7PR12MB8790:EE_
X-MS-Office365-Filtering-Correlation-Id: 75845a3d-07df-49b6-aaf7-08ddeefb6510
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q0lGK1FZa0djNjhqb2xDd2xJY3EwTTQyNGdCbUpwTExZQ1F0UHpGQTRMb0pS?=
 =?utf-8?B?TnVjOGhicS91U2QrZm5MY1c3ZlYyMWRraWNUaC9vTnFnYXZsbWMwQ1NrQmh1?=
 =?utf-8?B?QXpZYzhiYXJ1UjQxdzl0dHZxdEc4QW5XSC9uRXduUEFqWmg5WTRRUTQ3dk9u?=
 =?utf-8?B?S3BVUEdjbHY4NTdkRzR0b3dZbmtNdWp5Ly9xRGpyaVU0MUluM0NrR3NlZXJE?=
 =?utf-8?B?WjNoN1F2M1h5MjdWTEs1aXV4elZWQUNKak9pd2VvcFI3UDQ2NzZOOFNZa0s4?=
 =?utf-8?B?MlJTckIvSFJMSDA3MXhvZmRxckh5QjRFaDhnNGVkTVZ4VUYxTnVzeFN2NXFk?=
 =?utf-8?B?OGRjVVFHZWdGOSs5bitDTlR0UFpBbUdaU1VtT3dFYURnckhnR0RtelNmMDll?=
 =?utf-8?B?Nmd1d05pemJ3RUlUenp6MFBIT3dUek1yMU1kVzBwY2xhQU5oZ0NzS24ySzRX?=
 =?utf-8?B?ZTVLUUw3Yy9rVGZSb3lTY3FMTFRjR1BWRjFLdllLbDlqZTZHVVRUVzFkbTlq?=
 =?utf-8?B?OW0wYVBidmRHMk9HQzlFa3ExZUFPa01XZ3NVYXpTeWhIczB4M0x5UTNEU3Vv?=
 =?utf-8?B?clR5MmNZUHU2Z21OdjlHei85R2Vaa21YSmZJT1JjbWhyN1I5QitqV2pxeFJ1?=
 =?utf-8?B?ait5WFQ5NGE2ZExQVnRrYW5iZXJHOUczUzdZblZpZC9zaHN1UTRDeWd2Um1W?=
 =?utf-8?B?ZFZKMkZad2g1L0E4d2VCRDNUcDVSdkkyLzFGcDFoZCs2NWRKRHVWbml6MFFh?=
 =?utf-8?B?M0dSaWs1YXhNMnJTYis4Y01Bb3hzdnd1UHF3Z1RscTlFb2RKODYvTkcvdkxK?=
 =?utf-8?B?MVdhekh1WVcxdG54VVJ3ajBieFVrS09FUHNLM0V3RDRZUzlFRWxqNlllSHgr?=
 =?utf-8?B?OUNnS05UWDJRWHNPN3UwZjlmQkdaeWxuZ2NDY3R4bE15SU9MNG42VVB6MFVD?=
 =?utf-8?B?bnNySVV5WnpqbzFTQTYxdmdxcFNWYzhMaWYzRHdhWGM3c2VONVhaa2JQbVZk?=
 =?utf-8?B?dzdzYVE2UjhOY0VnNE9CTTBEenhrc0dCOEZJSlVvQ0NzQTlzc2locWd5MVpQ?=
 =?utf-8?B?cWtEU0ZhbVpnbi83ZGswdzdCNGFwNXIxd01GTnlVM1Qvd080SnhDMitIRVVJ?=
 =?utf-8?B?cS9DUmNDK2VIU1JGOEdPeFlXU3daZmJmM2R0VFhMam1DeEFIOUR2dDlmMnVR?=
 =?utf-8?B?QjgwUXdNVWVnblFZaWZJRlV2RmdlUmNNNFY2NnF2eXQ0RDUxZ2VKNWFjZEtT?=
 =?utf-8?B?Y3l1VGtRUWJwLzhyRi9UMFdrMERWNm9rTURXemZYejAvcUtLdzV1NnU3VVUw?=
 =?utf-8?B?c1R1OXhHcVBqNENFdzFNbDlqemkrNDQ5Nm83RlVocW1HeEI5bFhhSVNBdlNz?=
 =?utf-8?B?MDB4amRtdzlYYmNtbUVkeEtvaXJ5Y3Q1aGZOQVNubGp0UFIxd1Exd2FwaENq?=
 =?utf-8?B?NVdSU01WNG84T3hhSC9KK3JOb0lXRkpURjVFNStzSFcvbDFWM0VFRDJGT2pz?=
 =?utf-8?B?ZXg4c0VWbG15QVFYcDEzbVMrVnIzSEE1MVVONFJJSTVjbEpKcFBsQzI0UEJu?=
 =?utf-8?B?U0JHUjQ1MTBiUEVlbGkzODJXWWRvVFRXVnFoNFZXd2VMaXJmWWg3eGFSanhU?=
 =?utf-8?B?SlFlaFluY1Bldnc1SGZONjdFdmhtN2Q1d3ZPeE5PVlBWRE1VV1VBY296OWxD?=
 =?utf-8?B?YjNuZFdnQStZVVVianRNQ3NlcGxqN21peFloVFpLOVphRHNrRzJSWFFBTm4r?=
 =?utf-8?B?STZzQ3libzgxVk1oRTUzSUdUYzloRDI5R3R1c25iTUwwaW5JMmQ5cFh6elY5?=
 =?utf-8?B?ai9mLzRyRG85U3gycm1PSFdFVTNpM0haL0I0cGtZN1ZBUm93dzAyb3d2RklG?=
 =?utf-8?B?VzZ2Tlc0QkFpU1RmQXFuamhBd2xVc3l6ZWVmZ2cyQzFXaStoVis4dytiWVBw?=
 =?utf-8?Q?dw9pdmKyrkY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8059.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UkxDMnpjd2E0elVDRmxlTXRzNGFCK0dBSGx3YnpkcWc2SGluY2lqTnZBaW55?=
 =?utf-8?B?dkkrbUcxLytHQkxlYTdyRm5BazIzUmpaajdCcGZRb3g4SWFhZFI2RHRSQno5?=
 =?utf-8?B?VkVsb0pqVFc5aEhsN3JoMDBDMnBFT0VhY3ZFRUsySFJ5OEszS3kxN3ltVVQv?=
 =?utf-8?B?cHFlV2ViVDdnWE1JRjV2bS9ZbXdPWUlsYzl1NTdqYmphQmhneS9LcWpGc1JU?=
 =?utf-8?B?WnZNNFZzdUlSeWpPWTdieEdRcnFGMFB2RnV5VXlBWHk0eFhSdjJEVWdxSmIy?=
 =?utf-8?B?ZERhT3NZOVZYQmRJbWVJaHRwczBKZnRvZUZIbDJFOXdkM3VLY1RCNlhESDRz?=
 =?utf-8?B?WmY3K0dzYVJXL0haclc2R2ExUnMyWVBtaTVYTVgrRGpxV0ZSR3FETVZSWEt6?=
 =?utf-8?B?Ny90U1FMd2ZyVm9LZUYzZnJuYmpPdEVvbWZ2ZWdMVU84SjZudGk2VWxFRU1N?=
 =?utf-8?B?WjY1MnZRb3lWYk9leUFKTFBhbEtNay9OeitERmdNWGt0b20xeTlHODM0bnR3?=
 =?utf-8?B?cnBIdDFzNU0vTjhvODNJUThLaG1BUDhKMG1sdkptNHp2MitoTEZBbktRWXNi?=
 =?utf-8?B?Yis3M2drajk0MVh2TlI5a2ZmNG4vNzdNbVNJSWN5RVRGMHEvOXd4OWQ5UVh6?=
 =?utf-8?B?b0JrajJtbjJIdjBkOG1IeFdzNng4UGo5OXpYZGttQktBWWx3dHRtOEZGdzd3?=
 =?utf-8?B?YjdHSmhFZHh6Z0JRYk1VQTBJWmYwZHVYRUJsK0Uvdk9hQjBYQUJ6UzhZb2w2?=
 =?utf-8?B?WW5sK2NqMmhQVUpDc0RUZ2FCMzRoRllFYWNreGVZK2wwM2x0SGtCektXWXk1?=
 =?utf-8?B?U3ZJaGdNc3FTVDF3V2pkQi9LSlZ2MThwNndJNjBDK21IVmlaUDZ4UHJBejVj?=
 =?utf-8?B?ZHRjY2prc3Z1dWJWWktISzd1VnZnWWh2R3hqTUN1ckgxSndzb0pLVm05RzJM?=
 =?utf-8?B?RjdjSTlVK1poSjJqVTh5U3FWU29tM0pSaUx1NUhBRVlOQnpUdk41Q1hmNU55?=
 =?utf-8?B?RElEelhxYUVKcVhucUlnZ29HV1dxeFBYVEVRdHN1NlA0YXRlN0wxTDBCNG9y?=
 =?utf-8?B?andPcTdQT0RQbHMrU1NJQk5qUnZ2dGpLTlBzUmVrSnBSbGtSSmUxQXM5b3Jx?=
 =?utf-8?B?bld0aDVvMUZiS2NvdjVJNVM3QUtlQTFQNU5RUUxuRG9CN1c0VFFDM1NDZG5B?=
 =?utf-8?B?cVVwbUFDVGlheXRBVzFnazVrWUpVV3c3bExlUTlTN3NOQnBPb1VWRHA3VTk3?=
 =?utf-8?B?ZzdpZU8xai9YV1BYZC9qVEhBMzNLUlh5WktPdDQxdVIvVFhWZDRza0RxVjNT?=
 =?utf-8?B?bG42WkRnY09uUHkyam02VVBEUWF0TjNDdzVnZzlpWkgyQmtPTDIvWHlJc0V2?=
 =?utf-8?B?cnNiOVhmdzF6aWhBdStRS1NlUVFJWDBlTUxKTFAxbEY4TGduN29wVm9wY0NV?=
 =?utf-8?B?cWw0ZzRLMzd4QXBjZlVYdWxwUlYxVU5qWFlZaVcwMkkxbkU2aDF5Vm1XR2xx?=
 =?utf-8?B?WWd4WU1OeUFLUllnVlc4L3hBRkNqejkvbUhQY1RpUjFrNVJlbm5hak9wTE5B?=
 =?utf-8?B?czNIUUFHVVFxVE1jQmxscDU1Qk5qVFBrclZqcWNjQXppWTM3Vk82UEcxeW9m?=
 =?utf-8?B?WnUreW04YUJiaWhQMzc1Tm10Mm1LZjVSSTR2V095QkZ0aDQ3c082YVZwVHBQ?=
 =?utf-8?B?UjZ4ckRHb1RhbExHVG9pQ2gya3k4bmhwdE4yaGowRTErb2tFQ3llL2RKV3ky?=
 =?utf-8?B?dGI0WHlyd0dPT1lxVkRmaTE1UVowUUJwOWx5YlMzemc5SkxEVHdSWnV0N2Yy?=
 =?utf-8?B?N0FqcGJEUzhINlFvbUtmQkNhRjVzTW9ia1ZWMFlaRCtKaGNaVkxENUp6N3h1?=
 =?utf-8?B?Q0tRQU1GT3FpbjhZbGZ0TWdFRDE0cG4rb3Jyb3ZqZmVsVkErVEZWcm5vN3pF?=
 =?utf-8?B?Wlhxa0NtR3lJdVI0a0JCV0owMXdNKzZqY0JPWjdYSm9EdFcyK0hkeUVvcklK?=
 =?utf-8?B?QVZKcWFXZ3haMXprVjkyL0NZSnZNNUk5dUdtTXY5ODF6RlJnMXhQcTFPSWd0?=
 =?utf-8?B?dXM0UllQdm9mc3FBOWlMZDVXNjdsRkdlRzJHTWtoeDE1S2g0ZEtBeGJRenBt?=
 =?utf-8?Q?Dt98j92v7BuCsa+IVbamAbrP1?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75845a3d-07df-49b6-aaf7-08ddeefb6510
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8059.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 17:16:05.7700 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6H2oQkxxxNfIKh/FEiCQkPmTTytXWQinR9V7VV/i3eco0+TFilROnJc7RcWpZbbWfqQJ/jvxNTHuaD9ib2GK5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8790
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

Hi Alex,

On 9/7/2025 11:12 PM, Alexandre Courbot wrote:
> On Thu Sep 4, 2025 at 6:54 AM JST, Joel Fernandes wrote:
>> The bitfield-specific into new macro. This will be used to define
>> structs with bitfields, similar to C language.
>>
>> Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
>> ---
>>  drivers/gpu/nova-core/bitstruct.rs   | 271 +++++++++++++++++++++++++++
>>  drivers/gpu/nova-core/nova_core.rs   |   3 +
>>  drivers/gpu/nova-core/regs/macros.rs | 247 +-----------------------
>>  3 files changed, 282 insertions(+), 239 deletions(-)
>>  create mode 100644 drivers/gpu/nova-core/bitstruct.rs
>>
>> diff --git a/drivers/gpu/nova-core/bitstruct.rs b/drivers/gpu/nova-core/bitstruct.rs
>> new file mode 100644
>> index 000000000000..1dd9edab7d07
>> --- /dev/null
>> +++ b/drivers/gpu/nova-core/bitstruct.rs
>> @@ -0,0 +1,271 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +//
>> +// bitstruct.rs — Bitfield library for Rust structures
>> +//
>> +// A library that provides support for defining bit fields in Rust
>> +// structures. Also used from things that need bitfields like register macro.
>> +///
>> +/// # Syntax
>> +///
>> +/// ```rust
>> +/// bitstruct! {
>> +///     struct ControlReg {
> 
> The `struct` naming here looks a bit confusing to me - as of this patch,
> this is a u32, right? And eventually these types will be limited to primitive types,
> so why not just `ControlReg: u32 {` ?

This is done in a later patch. This patch is only code movement, in later patch
we add precisely the syntax you're describing when we add storage types, and
update the register! macro. In this patch bitstruct is only u32.

> 
>> +///         3:0       mode        as u8 ?=> Mode;
>> +///         7:4       state       as u8 => State;
>> +///     }
>> +/// }
>> +/// ```
> 
> As this will move to the kernel crate, it is particularly important to
> make sure that this example can compile and run - so please provide
> simple definitions for `Mode` and `State` to make sure the kunit tests
> will pass after patch 4 (in the current state I'm pretty sure they won't).

Good catch. This will blow up the example though. I will change it to no_run
like the register! macro did if that's Ok.

> 
>> +///
>> +/// This generates a struct with:
>> +/// - Field accessors: `mode()`, `state()`, etc.
>> +/// - Field setters: `set_mode()`, `set_state()`, etc. (supports builder pattern).
>> +/// - Debug and Default implementations
>> +///
>> +/// The field setters can be used with the builder pattern, example:
>> +/// ControlReg::default().set_mode(mode).set_state(state);
>> +///
>> +/// Fields are defined as follows:
>> +///
>> +/// - `as <type>` simply returns the field value casted to <type>, typically `u32`, `u16`, `u8` or
>> +///   `bool`. Note that `bool` fields must have a range of 1 bit.
>> +/// - `as <type> => <into_type>` calls `<into_type>`'s `From::<<type>>` implementation and returns
>> +///   the result.
>> +/// - `as <type> ?=> <try_into_type>` calls `<try_into_type>`'s `TryFrom::<<type>>` implementation
>> +///   and returns the result. This is useful with fields for which not all values are valid.
> 
> Can you remove the related documentation from `register!` and replace it
> with a sentence like "Please look at the [`bitstruct`] macro for the
> complete syntax of fields definitions"? This will ensure we don't have
> to update the documentation twice if/when the syntax gets updated.

Sure!

> 
> The rest of the patch is a perfect move (with a few renames) of the
> internal rules from one macro to the other, which makes it really easy
> to review. Thanks for doing this!

My pleasure, thanks for the suggestion!

 - Joel


