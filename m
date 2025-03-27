Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD84CA728EE
	for <lists+dri-devel@lfdr.de>; Thu, 27 Mar 2025 04:00:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E64CB10E033;
	Thu, 27 Mar 2025 03:00:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="IQWShX/B";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2085.outbound.protection.outlook.com [40.107.243.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA4F510E033
 for <dri-devel@lists.freedesktop.org>; Thu, 27 Mar 2025 03:00:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IcrJD0PlAB2JBJudx1stED2DOEf8WqXzuZXzWB+ZXs5KoNHKzX8UBHzIsMG/hNVVRq7TOreBmDxOBEIauSiVZzi7pZ/8jHLzECDPakrRvO9nm4ejtFaUrWmNl5PBoqiPV6GnAq1dMalQeXZqdwmT0YOGyGyuXCQQd1v0vpWgSB4ygSAu8DbSS5YeLrZp3qFPmQa/E9SQh0SYhgY74uEq8H3Evq+K6EACpcIsa+IDYbFvtRWWjnMYHAPENax312lD+JdVMZqs9IAUl0cZZrxkp3ejJmUjsMFg9L4o+7o7ycdH5ryu+y0LzCDTbTTjExcGduxUD/JRyON/OfT35oB4Kg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HOzNwJItS+k6ycju4iE/t3t7F9Rco16stq0ISmURIDk=;
 b=qTydzRhu++PtIP/dmEL63qfjSQuYn7rblbOuso8czAnTTZozsXMsPP+iL/wPlp2CayDh1wXKc78uVf1YWtdgdLXgSSSyFE0PKQJOcwHh4pdaUN+UJONZtES/2m/SzDXZqAFFfWKCGCU5CXSqlmfk0EeXqHRqTpaOEK9N292HMprzyCFOPE+NYUswzvi7HQ256XLW0jBb3jBOi4HEDFru2Ic1vzTa1WQ7Mmmh9ju3RyFA9rM0fGfmb6LeYz1aLlCNoiKq58bqAEPuP4F5erUqspSWfaWULNyvOYjQBfTRK2nTJNQAVCvrQEs4kM9THFbc2YhGKdlYnqjSfkEvJKQxTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HOzNwJItS+k6ycju4iE/t3t7F9Rco16stq0ISmURIDk=;
 b=IQWShX/BB2qYzh39YxB0pqxLBjFJ3ZEodXpbnKGS5uxFX3SKJBuT1CJ8ob+vs2IRzoQ6TUU+4jN0L8NJd94IzDBoWBpmgX9uWuxzee8t+7aRfaO/+XRXKtkzsE5MhRCWvsdnlm9ca3kP1OutzWEp5ypwb0OZcm86kn3Q8C3cNsQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6435.namprd12.prod.outlook.com (2603:10b6:208:3ad::10)
 by CH0PR12MB8579.namprd12.prod.outlook.com (2603:10b6:610:182::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.44; Thu, 27 Mar
 2025 03:00:38 +0000
Received: from IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::273a:80c9:35fc:6941]) by IA1PR12MB6435.namprd12.prod.outlook.com
 ([fe80::273a:80c9:35fc:6941%4]) with mapi id 15.20.8534.043; Thu, 27 Mar 2025
 03:00:38 +0000
Message-ID: <79d642cc-fe61-48c3-bda1-aafeeb07fe2a@amd.com>
Date: Thu, 27 Mar 2025 11:00:27 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/7] virtio-gpu api: add blob userptr resource
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Demi Marie Obenour <demiobenour@gmail.com>, David Airlie
 <airlied@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>, Chia-I Wu
 <olvaffe@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>,
 Huang Rui <ray.huang@amd.com>
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250228053650.393646-1-honglei1.huang@amd.com>
 <20250228053650.393646-2-honglei1.huang@amd.com>
 <cd9f85a5-0d99-4007-bba2-d792ac9d84da@gmail.com>
 <c2d1334f-6f5a-493f-bbf0-3e92789f128a@amd.com>
 <85470439-3c03-4787-be91-b6b680a5aca5@collabora.com>
Content-Language: en-US
From: "Huang, Honglei1" <Honglei1.Huang@amd.com>
In-Reply-To: <85470439-3c03-4787-be91-b6b680a5aca5@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR06CA0187.apcprd06.prod.outlook.com (2603:1096:4:1::19)
 To IA1PR12MB6435.namprd12.prod.outlook.com
 (2603:10b6:208:3ad::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6435:EE_|CH0PR12MB8579:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a5633e1-8b6d-4204-3945-08dd6cdb8d39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TnF6SFhBL2kwMGZjWlR3bjkxaGYzVWg0QlR5a293YzNpKzNEcVFJQWo3SHJF?=
 =?utf-8?B?bnZJZXcwaUNYWXFJanR3MGpHYW5FTzRKQ0crWVpQTDEwYTJQWVMyY0QrUkR5?=
 =?utf-8?B?ckswMzczVm13S2ZpOEZiUHBvY05LNHl6MUtONHFzUVR1MUtocVdiUjJuTGtC?=
 =?utf-8?B?S0ZkN0UwSjRzaU1UVWp4dEY5Wmg0QnROa0ZNVGZIdzFDWWZ4RDRqSXdHdEJw?=
 =?utf-8?B?STF1UlovaVVtOVlKK0tOSmZRY0FRQ2k4RlNZemRPOWYwc3JPOEdTdGt4NlJD?=
 =?utf-8?B?RnBrcXdaOWdEekZEKzVDdUhNV0ZOZEJ1ZkJlOFlWZllkcTRvTGd5NVJIYkhp?=
 =?utf-8?B?WDRCS1dnV0pCRElUMVlsTWhya0pOZUhZa2JnTTVDT0pPb1dmNnlCcEU0NU50?=
 =?utf-8?B?MFdIYVBobjJGUHRIenFzQlpVZEk1Zmd4Rmx3R2FYSDJPQnFodm9HdUh3dHR1?=
 =?utf-8?B?Zm1wQTFqNVpmMEw1SHdza21lUGk3MkJ3dC9hWU5kRnNMMkZMR0pRZzVUaFhP?=
 =?utf-8?B?MjNHU0M3b3A5TFVLcGdkSVZFNmhaTjlXNktuaWpFV0F4NXQ1RWc0ZVp2Rkt2?=
 =?utf-8?B?UlBMdEtRaHA4WHNTK3hzSE1oMDdZS0pWZFJ0ODdkL0xZWmsrR255TGQyQVZ6?=
 =?utf-8?B?OVBvYUdPM0Q4blduR0RkdlRxVzhCZ3ZqZjlkeTIrdVJ5OW9PUFlqTXp2eDVH?=
 =?utf-8?B?dGEwVnNGRlFBRzEvaXhMem1qaVJSc2l2VGpHdG1MRWNHa2trUlhJY3hXeWxG?=
 =?utf-8?B?eXptMWxWcmtjakZxRVhMUm5nQWpjM2c1azdBMUNzVE5URHNNVFhLQjdnSGhR?=
 =?utf-8?B?Njk1aWx1UkRUaTBqNXAzNFVBcW93L3BQeCtlblB5Vk9IS3JQWHFKd3NQbUVX?=
 =?utf-8?B?cGNBRE0zd3pqYUk2L3ZRTXVzdGMzYmJWNjVzS0J2UHNRMmp1R1d4aUdFdDhs?=
 =?utf-8?B?MGpvSlhwdU1qWnBKTDVvUWw1cVlsSlZuNHRkQU54c0pETXdpMGYzQlZtd1p0?=
 =?utf-8?B?bEoxemF5WEp0K2dYanlhVllCalc1MDQvbFdOTlBhMC9ETGdqc3lSR0tjVm8x?=
 =?utf-8?B?MW5rT0xsdFBhZWNJQUw1bS8yLzduVkJGNzk2RnVHU1FxZXdwV2ZsTE9YTnJm?=
 =?utf-8?B?ckROS3pHSTdvck40OVdQMi9qT3BPcTVHS1ZxZElGK1dRaENwZ2QrN0FiT0gw?=
 =?utf-8?B?VGVuTzlvY05wTFVmbGFLZ0JBNFJHZ2MvWjR5d3dCNHZZbm05WENwZ21CTzY4?=
 =?utf-8?B?ZGdIT0o2VUtqTWNBazl5ekF6ajJWQU1NQlk1VUtNK3NTdlJMQWVVT0VrYzlo?=
 =?utf-8?B?aXh0aElwR050dExvdWU5cjhZMnhOK0Jxa3BKYXhYcXZyWDBZdFRBOGg0U2tT?=
 =?utf-8?B?S2lSM0loMTNjaTRvU2pUcVhJUUVLOVFMMU1TN01PaEFzT0FJQlExZjAyRkV1?=
 =?utf-8?B?b2V5anhtTldybzltZnNvTUlqdWhJQjZNcjg4WUV4R01QUE0vOWs1bnR3bWtn?=
 =?utf-8?B?TVN3V1JCM013V3pubFhSR1BLUmx0cGtLTFVaSnIyU0QzZ0ZXaWFodkk1MDQ5?=
 =?utf-8?B?a2kxQUs0VEJ3ZVloWW0wcWVNU0ZYNEl2eDZSNDlZM3NiUFRpSktldkZjc3dK?=
 =?utf-8?B?WUpUcm9UajlLSjNERlFGTm1PKzY0bUMzWFhlLys1djRKaUM1M0J2RUJWRzUx?=
 =?utf-8?B?Zks5clV1bjliVTFUaDdVTTQweWkzZkRkSzRvczZkb3psQzF4OTd3bHNET2xF?=
 =?utf-8?B?d0FSWW5MbXo2Mm5OL1lhVlRCUGRhMzMyOWZFR1VDMStialFGaU1MZ0t2UFJo?=
 =?utf-8?B?Slk0RllML1dTT2NTeHpzUjF5UXBZTVZUVGtqclBob0k3c2MvTEtrTkJNdExu?=
 =?utf-8?B?V0N3ZGh0bVVHNHBDdlJuV25tWEhEajJzSTVHL3hDbERiYUJLbW8yOGhFUk5i?=
 =?utf-8?B?OEQ0SWptcVgwc0x2aEtRSUEyRy90T0VON0xpMXVNUFFuNTFjcjVkMDBEN1lJ?=
 =?utf-8?B?TzZ6aUZQbFB3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR12MB6435.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Yk50UGR3OGJERHMwQk5WSWhYRzRyYVFKOHZZWSsrK2FYM2dUYWNacHNvZDdM?=
 =?utf-8?B?UkQ4cmZzRkxzNzkrV0ZSYUlPMDU5WnJyQzVyMFdYeUx2aGs5enFJNjRmZnpO?=
 =?utf-8?B?QU5rZWVtU1NETFZ1dVg4TzcyTDQ5NCsrV1ZiOEVVYVU1Y01yYU5vS3QrY25F?=
 =?utf-8?B?M2ZRNis2bVdhRGw0OCtScHY2ZTV4QlRoUmU5SEtEa2NWY1h3Q1g4ZkNOb0FX?=
 =?utf-8?B?dzk1VHU3UjZmVGhKSFRjeU5jQ2JJUWhnUUF4WGJnRGVMWDAwK2lQeE9iTm9a?=
 =?utf-8?B?UXVLRE5PTmpUWXdQR1VvMUFHQnI0TEVkQVF6TDhBOCswRVdRTzQvU0djeFcv?=
 =?utf-8?B?QkhWNkxjQmx2ckVEV1h0L3RMRm96MWlXZGFleWErYkZHemhVUSs0aU5nUUtB?=
 =?utf-8?B?ZW5nYVZ3NUNTMkNwVVphMFM5WHhRaTVSTGZRMDgrMEZxc1VuRkhsZ1daN2pr?=
 =?utf-8?B?YWlhN29LT1RGaVJMNk9VYU8wUXMrUmRRQ0dORXFpM3JXSy9XaTdrNEZXdGMz?=
 =?utf-8?B?eU1qeVJRS1BYQnJjYnNsRld1c2RWWm5OTjJPZ1VsU1JacmVPVi81TW02MXY0?=
 =?utf-8?B?Z1V6eTA1WWFpNzFkS1duODNvRzJOWmEwWGdXNTEySkZnOE1WWklpVE54TW5L?=
 =?utf-8?B?WUptUTgvZ0JacTdSN1ViSWtaWmNHVkNmUmRTWUJ6djdYNjJSV2tXVUpUZm9W?=
 =?utf-8?B?L0F5anhtTURsK25TaVZzVm54QS9MVFcrZkJBZW92emc5ZUJLQTBBc1hVUVY1?=
 =?utf-8?B?VjVxakZpMFliN252eHFoZzBTZUYvWXYzSjRnUDhSMkVNeGdMd2h2MmRWeTNX?=
 =?utf-8?B?L3doRWJLVFhZZ05TSnZMMW5OUVlueFp5bStCV214K3Y3MVhiWnhJdCs1OG1a?=
 =?utf-8?B?RTBVTk5DZEY1SEVnQTdNdVluVDJXdW5jOFNwZW9KSlhuUGdEUzV1K1BFR1Fj?=
 =?utf-8?B?RXlJcmpXaWpzaitPZFQzRUlPQ2QvaTEwVjFhQ0RoRkJTdHpzZTZ5V2w3SC9P?=
 =?utf-8?B?M0pycE9lSi9EelVpQ3VkdWI3bm5pWjhsSHliQkxIcXhGSm9JTm05aVdWaXJj?=
 =?utf-8?B?WWxZc2g0azJHRUFaZHMvcTU3RnJoVHB3dis0WXlmSlcwRVlyS3k3L3BzWXVp?=
 =?utf-8?B?MStZb3kvenlGZDNtd3FsOC9nZ1lGUmlaOGtrTlhtSjZ4Y1QyZVp3ODFtZUVG?=
 =?utf-8?B?ZzF5Mk9XYmFLZTlPWlExbnkxTU5HRzdYbElRTGtZdXY3dG5zVjlUZkNUS213?=
 =?utf-8?B?WEJHMUZlZnNDUXdET3pMYllRU0JKY0gzMm90d3ROS2lqdUdnckxNckl6OUUx?=
 =?utf-8?B?WnVGa0IwbTVuUzRtRDhnNkIwNzY5cHBuRWUxM0ZuOUNvZ2UwWmF0QjBId1lZ?=
 =?utf-8?B?TXNxcHVVVG5oKzgrNGlJd1BqLy91Q0NNVlh3b3pxSUxNUkNtQ2pScWNZWm9u?=
 =?utf-8?B?NE9hNUxyekVEM0ZIVFpHQzZSYjZtaUFQN0JDalg4UjRkMGdYblZ6Vk4zU0x3?=
 =?utf-8?B?cFFLMWVJdVFjeGZmMTQ5dThhN0dBRlI5bXVUc0E1aS9JaTBCc1FEMEUyd1pD?=
 =?utf-8?B?UnFNcUZRdjZYdUVXZG1vbE5aY0t3ZWk3T2d2WEM1QkxNSm1FL29uN0xOVnpv?=
 =?utf-8?B?aE56QXNLNTM0d2E4bEJhNjhMS0NNZTRQbGhTUmI5RzBaVjUyRW1CUEFGcmgv?=
 =?utf-8?B?aHliZUhPVGk4MUxJaktXVjVhbisydmVYbms1TEJyREx2WitKbFlqTzBuOFZz?=
 =?utf-8?B?QzBiRVp1M0hMd0gwS2Y4Y0FWdkdMU3VKTW9IM2ZGNTZvU1FxYnBvZnd1N0sz?=
 =?utf-8?B?dGozcWUwbDJnbTRoc0FDcG4zMzBTakU2OElOZlZhemhJLzZ3V3VFaHpTSThV?=
 =?utf-8?B?a0w2VGF5VmN0WDBFeUJCSWpPd2w5U3o2MzBQWHFTTEZmRzVxZjc3WlJ2ais3?=
 =?utf-8?B?elA0Y0t2Q2wvM2ZiaHNsM1ZYd1p0bmFBMWlIVlArM0k0dVFKWm8xOWtCek9h?=
 =?utf-8?B?MU5BekkvNG9QLzdoc25jYjVrVW43ZnV0V0JUK3dOQnpxVGh4UTFkdVRSTm1h?=
 =?utf-8?B?Q3N5aURoL3loQXFpZ3FxSkJEb2NtZlhLaVMzdHpqUlFPK2JzVjBpVHBRZlJz?=
 =?utf-8?Q?D+B6Do5tPODAtcu1h0W4R9VY/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a5633e1-8b6d-4204-3945-08dd6cdb8d39
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6435.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2025 03:00:38.3537 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d7vgDnj9OBvj0khKCkz5/rbQ6zOpgIASI4bjJEaiEAz8Rd6IdYhX8sBeB93OjV+SI3J4og9tNgQMdU/F9nOgpA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8579
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



On 2025/3/26 22:46, Dmitry Osipenko wrote:
> On 3/6/25 13:51, Huang, Honglei1 wrote:
>>
>> On 2025/3/1 5:21, Demi Marie Obenour wrote:
>>> On 2/28/25 12:36 AM, Honglei Huang wrote:
>>>> From: Honglei Huang <Honglei1.Huang@amd.com>
>>>>
>>>> Add a new resource for blob resource, called userptr, used for let
>>>> host access guest user space memory, to acquire buffer based userptr
>>>> feature in virtio GPU.
>>>>
>>>> - The capset VIRTIO_GPU_CAPSET_HSAKMT used for context init,
>>>> in this series patches only HSAKMT context can use the userptr
>>>> feature. HSAKMT is a GPU compute library in HSA stack, like
>>>> the role libdrm in mesa stack.
>>>
>>> Userptr should not be limited to HSMKMT contexts.  Userptr can
>>> accelerate shm buffers by avoiding a copy from guest to host, and
>>> it can be implemented using grant tables on Xen.
>>
>> Yes, I totally agree userptr can accelerate shm buffers, but I currently
>> don't know if there are any other projects working on similar features,
>> or if maintainers have any opinions or better ways to implement them, so
>> I temporarily limit this feature to HSAKMT context only.
>>
>> I am waiting for everyone's opinions, please provide your thoughts.
> 
> USERPTR should be relevant for anything Vulkan-related, like Venus and
> native contexts. I expect that this new feature will work universally
> good for all context types.
> 
> In order to merge USERPTR support upstream, we at least will need to
> prototype the guest USERPTR in one of native context driver to know that
> it works. You'll need to post the whole set of host/guest USERPTR
> patches including QEMU and etc, not just the kernel patches.

Ok totally understood, I will upload other components as soon as 
possiable, cause we only have limited resource for this matter, please 
understand the speed is relatively slow.
And for Vulkan use case, yes it is very important, I will make some 
prototype implementation for it, and will test it locally. The 
implementation for USERPTR must comply with Vulakan's standard.
Really thanks for your comments.

Reagrds,
Honglei

> 

