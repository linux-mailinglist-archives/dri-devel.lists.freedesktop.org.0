Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 320E5B007D6
	for <lists+dri-devel@lfdr.de>; Thu, 10 Jul 2025 17:57:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8BE910E917;
	Thu, 10 Jul 2025 15:57:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="CWlxzgfk";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2065.outbound.protection.outlook.com [40.107.92.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB15310E914;
 Thu, 10 Jul 2025 15:57:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=akH3sHFe+RptBy2v7NpBxWEOU4afAfXC1mMil2qejjxC09Fua5bwscSetYdkQ3iRkkpvVrLBYdrjulOktyeoGPZAkv+Z2s3bgB9xnLZqD1h4tnYFq6YmHCfliasvRjmc2hY2wxP1tiyHP9gFnxOYFmrzgUIJxgdHkIDPFJVtQ1SZU1kElAblw/zOVisVU5MvVXjrBGScZlDmC5Xr+UYih+mCgWxGF7NaKkEk2BC08aTRG9icKdPr/WIBFUYr1lq9dK8gpyOJ5BXsExXjKi/zT2Ulz2H3dBBshfju7fJnU6+6DpqQTaoWbHYyLWsbmh0cAliHD60uo1lqJzNPm4ucng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JTn+QZkh/ySjvl+HBNEX7BtilHcxzZ0r/6xlxKOqvbw=;
 b=hB8B1Q7agvib0YLuvFHPoHMMDn/dHACENew9y5xbxHYtP8sJ9L5fa4LtMyr4ZyAVhySY8dt7gm7LRpoxNJGAozL42ekfI/RQVeiwBaTBqhEy5BMfTPUkLn9A1P/XdbUMfpzniXdqz7YzS6uvHD8LGzex81+kDOCEkZmpDIIf5H49BTIieu10b8qazInb7LSF+1/yRoC+pVUUdO77J8lbXgHKGQzMEd/lSf60Y2sW5F9dXqIiYW6cLd//9Kn/fYyCzLL9d8wkmfK9x33lRpn7RzIDMk0HUFULO19EcaNCsAmgMhlHA9FsPhN5otyFAUSN7sH6Bpff6p3yFZo0oXfzog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JTn+QZkh/ySjvl+HBNEX7BtilHcxzZ0r/6xlxKOqvbw=;
 b=CWlxzgfkNuOubnnLmKS/WHA1l3bWhknd2SaCYGvKy6yifNECArFJ+etmImmI9GvTO/owT7vroT0l+tH+vPu5UPfwxGlE4FaN71ro0TB35XRTcS6WelR6wdTekljBIyn/vbkfW6nEDs/n4CILqnzWt2d7VugxO+SB7NRgbcpyodY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH1PPF931B95D07.namprd12.prod.outlook.com
 (2603:10b6:61f:fc00::619) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Thu, 10 Jul
 2025 15:57:40 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%3]) with mapi id 15.20.8901.024; Thu, 10 Jul 2025
 15:57:39 +0000
Message-ID: <b6a83977-eeb7-494c-8e1e-1b11b25fd61e@amd.com>
Date: Thu, 10 Jul 2025 11:57:37 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 0/5] reduce system memory requirement for hibernation
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
References: <20250710062313.3226149-1-guoqing.zhang@amd.com>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <20250710062313.3226149-1-guoqing.zhang@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: YT3PR01CA0086.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::34) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH1PPF931B95D07:EE_
X-MS-Office365-Filtering-Correlation-Id: 0533cf53-667d-4618-bd3f-08ddbfca7f2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|366016|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Um52bUVpT1FaZnV2bWU0dmVVNHdIMElXVGJRaWNHOFBqaFo5QytJMUp0dW1R?=
 =?utf-8?B?bVFYWUFSdXEwS041TDREYTQ5NEduT0RjQ1pJd2pmeUdDVitIWllMNHRWQm1p?=
 =?utf-8?B?ZTRoSmtGZzRreWREazBaQ21Cc2dsek5CRGxzbnJCelkyQk85dU1rRUZZTGJs?=
 =?utf-8?B?Q040WnF0WGtUVnExYlliWUNzaVo4OXM1dGhENVIrYTAyWCtrOUJQYzNLa1E5?=
 =?utf-8?B?M3U1NmxJNEJ2dDJSWU5Md2F3ZTN2bVN5K1VLeDB4MVFRYzJYYThlQmU1dlUx?=
 =?utf-8?B?RjRqZFptQmszQ0Rwbm1CVzVMS1BRdEo2UTk3RUxVNGJWblZHVVZ0ZG4yTGZV?=
 =?utf-8?B?VDRlSFFHK1hkNjg2NjRxQjRQclQrNGR6NFB2SkxucktqY29rc1E3RlR1V1M3?=
 =?utf-8?B?Q28wWnZiV3A0cjJoUWJsS0xzellZVkR6ZzRvZGRCYjRIdWV0aHplYXVUUnc5?=
 =?utf-8?B?ZEEvb09VeDB3Z1l3bVhLSWh5L05aWWY5M0xUVDhVd1dkVVQ4YklHcVJpWklZ?=
 =?utf-8?B?dTdBeUhjUWxONEErYU0yQ2JUZFpQeUhheE1odG1JSXROek9DOW0zSFcxVnIz?=
 =?utf-8?B?M3VpeEZpS2VLUlcrVTBCeDAwOGtFZUhHK3IvOWZ5TEhZdEU3elU1dUN3aHRW?=
 =?utf-8?B?bU03bkNXUDU4RE8xd3Z4dDJKU0xKL24wejZSR09yaEl4SWs0OFphUXJlMnZV?=
 =?utf-8?B?aXU1bnZORGg4bmVvYVd5NzhwZW5UaGxhNXhXRUtTKzl1akRwbUVHcG1xU0Jj?=
 =?utf-8?B?cjZuNkRvVzhZU1MxeDZRaXllT21JcG5DSmZwUFhvZDBWSmZoclByZGJBWHR3?=
 =?utf-8?B?N1krSnc1L0JCN1NBakhQK2lOdFB1aUF6c2pzbUNMUTErYkNObVpjMlRrQVhL?=
 =?utf-8?B?U3Z3MXBMbTkxMUc0clBUWjBzWVlac3hPTVFVTmNkNWNXMHc5UkNvYzFBTTlI?=
 =?utf-8?B?d1hlL2VEaEMrT3pTUVkyNjJQemJ4dkNxaDl1S0JjSTVYcHRZMElrcXFMdExy?=
 =?utf-8?B?bHR0b0Y4SW45ekRkYWVZQ0J4UVhXQk1UTE41ejk3QjFMVUhNdTBBMWU4a1Bk?=
 =?utf-8?B?Tmljd3JjOUxLYWgxKzlBVThFdWhYQ3N5cy8wWENqejRLZGF3UXlwQ3V2dUtj?=
 =?utf-8?B?SVF6blFrNE9hYXlGbmExNnZQaUFPN3E3SW1PTUtsU1NZRWFrckVtRVJ1czlu?=
 =?utf-8?B?MlpJZnVTSG1oWklBZ0p4cDZRam9sRlNDZUpOaWFhS24wVDJXckRGYXlESzJK?=
 =?utf-8?B?OG1JNllVZHdqMFlFM0FkeHgyR1JRbWFKSFhCdDB2Q2ZJVGROMkROMU9WTjVF?=
 =?utf-8?B?dDdTbkVDZ3g0TmN3K3BweHVDbTE0dm5hOC9LMEt5MTVqelIwNUF6NW55UERO?=
 =?utf-8?B?Rm5rRnhETHVaTFpBTEpUc0VtZDJFU1dCKzNMZVBYU2pwN3crUzBEZ0xGUFM4?=
 =?utf-8?B?ZG9vemxnaW1mcSs5eXlTRTZvZ1dHU0k2YWlZV0hJVEpwR25nSjF4aVZaVjFt?=
 =?utf-8?B?UHNZbytOYlpGaUhyQ1RYdFljQU16T0dTNXJYdVE4dGpzM0d2S2pMMVQxNTFH?=
 =?utf-8?B?R2M0bHRmZEpjR3M5S2dsMnljSWZ6L2JwTkNnWWM1YzdVSDdxWWh0OXp4dVYv?=
 =?utf-8?B?UlJrQVdQT0RVK0NPT3d2dytYMnNud2NacEFXS3lGUTFmQlhJYWdtdzdYa3po?=
 =?utf-8?B?bERlZmQ5TlU1a3BSaG1wOExSRWNXL3o2U21mNDAyOVlORTRpY0toTzgxSjI3?=
 =?utf-8?B?L1VDWTBQejlCb2IxNjBMSG9hbWxMYmxDOWROVE1GcHdQVjZmNm1zUVd1UjJ1?=
 =?utf-8?B?U0pNOEZjQXlEMXhRcG1kang3T0dPNHlzUUEvUUVFcExvRWx0WEM3YmtkK21z?=
 =?utf-8?B?T3dpVTd6WHFOOUgrOEgzTWhmczg0VHR2bnVIOWF0VjBvYnVnNmgrSk1xZmdt?=
 =?utf-8?B?M0d5YkI1bUxkYVl5SkNhM3JnOFB2STV0Unc4WDdSYVQwbktXSDU4NWNXdmhp?=
 =?utf-8?B?R2srME1rVGhRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UlNKbEJOMURQaVUwUEYrVGk2azJwcFhLNmhjUWYzditTT0xSc2VRdWxxYk5q?=
 =?utf-8?B?allQWU4rcldWY0pGaGFXNUR0TGxpOHQyRk01ZVFLZVpoK1YzK3RIdzdQYkJ4?=
 =?utf-8?B?NWE2R2lwREhHWWpLMWhuVUw4Qm95bGlZOVFxRUxObUpWUHcxYms2dWc2aUgz?=
 =?utf-8?B?c3ZnR1pic2cwbi9DSkZXeUZNb3hOdjF0WGhBeG5CUjR0Sm1oS2JZbS9XM3dK?=
 =?utf-8?B?N3dOc2J3YmtuV1ZkaVEzb3lLbmFKS0VqekljU1diYkpGc1p2cmNpM3lFZmFn?=
 =?utf-8?B?Sk9mY3drUGppYkErR2ltd0d0anl3TWpibHMyamRJNEZyL3BmS1ZSeGRsZzhv?=
 =?utf-8?B?RWRSRXpQaEppMG1rN1lBZ0FpeWZCelRwY1RyRzZROVZYbVFlU0lRSG9JYkZ6?=
 =?utf-8?B?MGZYUlBmM3haYXhZZmJPQ01EdFBJL3hXTXRXcVZ0UnBjS1VVeE83cHhndXNj?=
 =?utf-8?B?ZFJSVkk1bTMwdThRdFpNMFhGb0djWWNwckV3Rm5OSk44Y0UwSm41bkNPbFc5?=
 =?utf-8?B?RlZFZ0diaWd4NnlWV3E5RnhWc0k5WmRrdzNWa3NRbmtpZXFKZ1NDRWtQUUVO?=
 =?utf-8?B?ZkR3MjRPYlpsbnJraHlFdkxEajRZMm1tblNPeExiWm1sSFpBRzR4YnhKYVdN?=
 =?utf-8?B?dHhGSW5CSjFRdThBSXd3QWFySW1LNXVYd3FRbG5yNDVjOVZFbWZOK2ZPaG1h?=
 =?utf-8?B?UDdVY3JLWHVkNXk0cy9IcXMwWEZjUm1neUdGdmdVVUE2NFZSYitsUlB5aE5R?=
 =?utf-8?B?VEJWQjRoc3hCR0xOR3BacVgyOUZPWmh5ZmpwSUFLZlNOOWhBWHQrc1BGQ1Rn?=
 =?utf-8?B?VWtGYUpLT1VjWkJPaVZFdWtEcnVzZnU1RXRhNktDM094VkwrYjdhU2NKNFQ5?=
 =?utf-8?B?VGg1R2lMNGtsM25EQjA0YWFpQlFndHhRcVRZR0hFWlFoOHcxOGM0K2JKUHhX?=
 =?utf-8?B?am9JMXVQTFZpUW1QcGE2UHFReTF0SmlNUnVRcngxNE5KRTR2cTlRcVA3TFBy?=
 =?utf-8?B?T2JLK2R0SDdpZ2VXcGE3aUFCdWxPYXFGVlcvMm5mREZBazJINWNGYldraEl0?=
 =?utf-8?B?U3h1am1wUElOZXR6UHhKM29jOW5IVG51QkVFUytlODZicVVId2ZHQ09sRksv?=
 =?utf-8?B?V3o3R0E4UkpSNFFudXRSWWtHZThZeHl1czNoOEhYb2lnNXcwZVRJdVBXTmZM?=
 =?utf-8?B?UmEvWUlVSzkxNUVUYXl3OGpQQzlrZmozaHJuUG1yRzltUWRHS2pQWTc4RllL?=
 =?utf-8?B?RFhNb2JSR3FNb0VZZmk3SWx5VTJIejV4allPNkxhbzkrUlYrK1ZvbmNiTTA4?=
 =?utf-8?B?c01nallreGhWRWdlaDNwSHBCVGo3Rk50RE5jYUM4QjZ1c3NmdW4vUi9WamdW?=
 =?utf-8?B?TUdUa2JUY0tqcVdyQ2dudGxHNVA4WFNaQWJ0cjRPMEUxU0RLZGNxdkVrMFVv?=
 =?utf-8?B?dHg2dUt0UGRJa0t2Wk1qWUcyZTFPdWtvU3VSZm1LZUs4aGNHQjJGNGJ1MTQ2?=
 =?utf-8?B?TWVrU3gzbko1RnpGVTE0b1BrcXdYYW9PNGdIdEdqeU9zdmExK0J4OTVVelJq?=
 =?utf-8?B?eXlEZk5HS0h0YWc2R2tyL3ZKcjdZUlFMQVF1WDVsQis3SmRrSmIxUEFXZENG?=
 =?utf-8?B?b0dFa0o2eVp4cmpYVFpaWEsrNGF2WXdLTzBRcE51THlzU2wxUGdjOFFWN3ZT?=
 =?utf-8?B?VUJrbnE3RkloVkJPZGIzWVJUL1U0VE0ySmUzRlVyRFRKQjFRVnBmbzMzTjli?=
 =?utf-8?B?VEpHU2MzUkZXcjBobERFQzRPQkVOUjQ1THUxZ056a2wrQ1d6a3orK0RVaTM4?=
 =?utf-8?B?MWRwUHhaZkV4emRZZ3RIR1lmaFIvRTVwNVIxcURWcWl0ZEEwNTFidWtQNE8x?=
 =?utf-8?B?c0FmK2JCNXpRSXlpT0l5K2tBd1Q5bDBET1dXNm9PazhMOWdoWkxJeC9LK3p5?=
 =?utf-8?B?NWZzZzR5Vmo1dUF3ZEl0WWpHazExcVhQenU2dXVlVVY5bDRKVWRjUjVuNVN0?=
 =?utf-8?B?aWM5djl4VzRtQXkya0xxT2pmdkxEUmFJZGxMSWdNVDcwUFB6eW1uQ0RXQUFP?=
 =?utf-8?B?ZVpqQTVrcmhlajlYaUgxNzJ1bDVjT1pmYXk2Uko1T2VFOE5aWlJmWkg5WGJo?=
 =?utf-8?Q?7a8GATIA3LfYMsARlGIuWmebp?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0533cf53-667d-4618-bd3f-08ddbfca7f2d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2025 15:57:39.6736 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uefM7HDL1C0OcUITouOJi97r0rlhXDC9AEU0Yi1rhhnnOYSRpORhxLUHKLrvLHnqcOD/ILKU0GYyre3P3cQPGg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH1PPF931B95D07
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

On 7/10/2025 2:23 AM, Samuel Zhang wrote:
> 
> Modern data center dGPUs are usually equipped with very large VRAM. On
> server with such dGPUs(192GB VRAM * 8) and 2TB system memory, hibernate
> will fail due to no enough free memory.
> 
> The root cause is that during hibernation all VRAM memory get evicted to
> GTT or shmem. In both case, it is in system memory and kernel will try to
> copy the pages to hibernation image. In the worst case, this causes 2
> copies of VRAM memory in system memory, 2TB is not enough for the
> hibernation image. 192GB * 8 * 2 = 3TB > 2TB.
> 
> The fix includes following changes. With these changes, there's much less
> pages needed to be copied to hibernate image and hibernation can succeed.
> * patch 1 and 2: move GTT to shmem after evicting VRAM. so that the GTT
>    pages can be freed.
> * patch 3: force write shmem pages to swap disk and free shmem pages.
> 
> 
> After swapout GTT to shmem in hibernation prepare stage, the GPU will be
> resumed again in thaw stage. The swapin and restore BOs of resume takes
> lots of time (50 mintues observed for 8 dGPUs). And it's unnecessary since
> writing hibernation image do not need GPU for hibernate successful case.
> * patch 4 and 5: skip resume of device in thaw stage for successful
>    hibernation case to reduce the hibernation time.
> 
> 
> v2:
> * split first patch to 2 patches, 1 for ttm, 1 for amdgpu
> * refined the new ttm api
> * add more comments for shrink_shmem_memory() and its callsite
> * export variable pm_transition in kernel
> * skip resume in thaw() for successful hibernation case
> v3:
> * refined ttm_device_prepare_hibernation() to accept device argument
> * use guard(mutex) to replace mutex_lock and mutex_unlock
> * move ttm_device_prepare_hibernation call to amdgpu_device_evict_resources()
> * add pm_transition_event(), instead of exporting pm_transition variable
> * refined amdgpu_pmops_thaw(), use switch-case for more clarity
> v4:
> * remove guard(mutex) and fix kdoc for ttm_device_prepare_hibernation
> * refined kdoc for pm_transition_event() and PM_EVENT_ messages
> * use dev_err in amdgpu_pmops_thaw()
> * add Reviewed-by and Acked-by for patch 2 3 and 5
> v5:
> * add Reviewed-by for patch 1
> * use pm_hibernate_is_recovering() to replace pm_transition_event()
> * check in_suspend in amdgpu_pmops_prepare() and amdgpu_pmops_poweroff()
> v6:
> * move pm_hibernate_is_recovering() from pm.h to suspend.h
> * rebase to next-20250709 tag of linux-next
> * add Tested-by for patch 5
> 
> 
> The merge options are either:
> * the linux-pm changes go to linux-pm and an immutable branch for drm to
>    merge
> * everything goes through amd-staging-drm-next (and an amdgpu PR to drm
>    later)
> * everything goes through drm-misc-next
> 
> Mario Limonciello think everything through drm-misc-next makes most sense
> if everyone is amenable.
> 

Applied, thanks.

530694f54dd5e (HEAD -> drm-misc-next, drm-misc/for-linux-next, 
drm-misc/drm-misc-next) drm/amdgpu: do not resume device in thaw for 
normal hibernation
c2aaddbd2dede PM: hibernate: add new api pm_hibernate_is_recovering()
2640e819474f4 PM: hibernate: shrink shmem pages after dev_pm_ops.prepare()
924dda024f3be drm/amdgpu: move GTT to shmem after eviction for hibernation
40b6a946d21ee drm/ttm: add new api ttm_device_prepare_hibernation()

> 
> Samuel Zhang (5):
> 1. drm/ttm: add new api ttm_device_prepare_hibernation()
> 2. drm/amdgpu: move GTT to shmem after eviction for hibernation
> 3. PM: hibernate: shrink shmem pages after dev_pm_ops.prepare()
> 4. PM: hibernate: add new api pm_hibernate_is_recovering()
> 5. drm/amdgpu: do not resume device in thaw for normal hibernation
> 
>   drivers/base/power/main.c                  | 14 ++++++++++++
>   drivers/gpu/drm/amd/amdgpu/amdgpu_device.c | 10 ++++++++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    | 17 ++++++++++++++
>   drivers/gpu/drm/ttm/ttm_device.c           | 23 +++++++++++++++++++
>   include/drm/ttm/ttm_device.h               |  1 +
>   include/linux/suspend.h                    |  2 ++
>   kernel/power/hibernate.c                   | 26 ++++++++++++++++++++++
>   7 files changed, 92 insertions(+), 1 deletion(-)
> 

