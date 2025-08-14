Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9617B268A8
	for <lists+dri-devel@lfdr.de>; Thu, 14 Aug 2025 16:10:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34D6610E0C3;
	Thu, 14 Aug 2025 14:10:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="PBFwoX+e";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2046.outbound.protection.outlook.com [40.107.92.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD52810E0C3
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Aug 2025 14:10:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QeGI7OCCmD9HulAWlP1EiFzx0aMrTKmu2Z9xGSU/cLsZFac4BQ5n8LkDTenj5NN8Y0dMmwIz2ea2cDzdtamR/35hJIgLr56xIZJSSEi3lpYr5Fyf+gvXZQndPJKWpffsfW0rlHkRmCz/DVhKQKAKJw3HrKDphD2NTsqDZKCeqUifcLHBacjlYvB7y21lkzKDy5LK7bK8Wwwdft4e/lCycP8VdPQsa9LgvymkYH6PLaVANCY+9CUssgirWw1Oi93/pk587j/bONaRTX8EoxjV7tj3Dl3fKsSKInKoHl1pM9ktODZTxG1pd3TjtLztB72zBW783Yr7QyKwwcb5jT0L+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qcQTgjp1PzdFcRfJzXu3pUC35i0XTzn95rns8ncgh5A=;
 b=DSX9GXlmxxnJ+PzXpLiERoKIK6EY89BNJFGnKCbr3bXeCkCHTlSxTk4lEYO/q7qU/1a4ZaHeuwt7xoK8tDWOhmXLsLUbcWoXdPe6sfi89ZTZ0iDh8V9mB42BcX/NiVaUyNhca3Ao4LR1Z0ATmljhEF0Lk9Tzbjm/HfxiHmR0MzBw8iEC04C3VPKuTSSjPe8Lwxc7KKalTr5TN7dekXvkR87IiuxR8b0aHP+vvj1xHfjeIHEulylftc00tHiigg8jW1QQfuJ/0AI311t18NK9vUl7GidBBulK38JsJ8nX5p+47qEgJdiPs66K4LoyZnEnZ/soXpwd1XvxYgIlkvqO8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qcQTgjp1PzdFcRfJzXu3pUC35i0XTzn95rns8ncgh5A=;
 b=PBFwoX+edjkhgmxvw2O4/+Z9t5gGfUkpuBHEH54MDYNlhXRYGNZ15JhPbNKtKXvMQ5s0hIE9+Xx2kQGBvjG6+OOUXTEQkbGHxzOEpaFA9g4O9yh/mS/QkFtF5kF4XBHMEMMmbneauTGR/SEmmHQ2jhxNR29g4NOsiLwwSapVwD8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS0PR12MB6438.namprd12.prod.outlook.com (2603:10b6:8:ca::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.15; Thu, 14 Aug
 2025 14:10:01 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9031.014; Thu, 14 Aug 2025
 14:10:01 +0000
Message-ID: <efb53c2d-3722-43ad-af69-def5d3a999e7@amd.com>
Date: Thu, 14 Aug 2025 16:09:56 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/sched: Remove mention of indirect buffers
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Danilo Krummrich <dakr@kernel.org>,
 Matthew Brost <matthew.brost@intel.com>, Philipp Stanner <phasta@kernel.org>
References: <20250814133627.2550-1-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250814133627.2550-1-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0043.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:92::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS0PR12MB6438:EE_
X-MS-Office365-Filtering-Correlation-Id: f62e2cda-f5d3-44eb-9586-08dddb3c425f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cGZSK1pualFLL3NmdEkzdFN6RmlQOWdxRng5ZWxvWEJJY1JSdGloT3VlNjE0?=
 =?utf-8?B?cXZkWjdxbGZua3R0eFY3anc5bGRBMXp2cE9xNWFzU3BDS0lkMzFFbWFQa2Jy?=
 =?utf-8?B?c1gyNHV5MU1admt6V3F5WUF2SHpUdjQ4SisrdzczMWNYMmMreGNseHJYSkg4?=
 =?utf-8?B?cHV2VTVGcFJZZFZqM0E1OFNuMElLeDQ3ZitoZnA3WTAvdUZ5L1JUOWtLODhB?=
 =?utf-8?B?RHFJSjQ3YXAxakVIN1JoRkRic1BuUlhIOThJNk9GRmt2UDUzRXl6U1ZiMFl6?=
 =?utf-8?B?UHpvdDZDcmlpeEFIWnVTK3BjRDN0N00rTndCSDZOVGZhci9Tb1lrWDlGUG1m?=
 =?utf-8?B?TU43QjQySTZSWDZnaFNRczhqa3o1dFlUeGp2SWhOK3VkNHdMUW9JcWxoNjAz?=
 =?utf-8?B?Ymc4T2pBUEtkQ2hxT2VTZU5hUzh0NkhhTEFpc2Q1TW00c3pmaVFMYjlJelBn?=
 =?utf-8?B?MTlaQmVlUjEzSjcveFlld3hyUG42U000ZUNVbEhLY3pzUytVK1FqS3RkQXFl?=
 =?utf-8?B?V3JmZUFuMTR5a25KeXdWOERlTmFOckZ6ZU9uMlNQS1NKRUlacGRKN2dpbFhl?=
 =?utf-8?B?UTNOWjdzbkNQeCtPVUh0a1NlMDF0clJZYy9xNXZaY1pXNWt3TTZ2TllpNnBq?=
 =?utf-8?B?NUpCbGFLaFVUZDJQcFBqSFdpbFU2RFQveUVxenl2RnhKTlc2NkZxd3NGcGVK?=
 =?utf-8?B?cExlZ0hDSXpjc0tRR2g1YUVNZnNEdG1xNDFQc1dsaGpFMm1oSi9CRkFWc25B?=
 =?utf-8?B?d04xNE5nTlIwWGEybHZLOWw0bHpZM3V5QmxMczFvWVIzeEs2SkdVRkV2N0Ra?=
 =?utf-8?B?L3hOaHJOMUZCRFBTeW5PamYwLytPZ1J1cGtxMWZudy9Lb0hLaXYwS3dyR05N?=
 =?utf-8?B?T2R2QlhhbFZSVlZUWWJtQzNoZytXMDJDUDdiNVN6eGFMYTBObFdyanVMTFlU?=
 =?utf-8?B?U2FITG44ODk0TGJCWmx1SWZPby9HM1RFczRxQ1d6SDdZc2FwVHErSXNMOSt0?=
 =?utf-8?B?QUo1M2FGYVUyQlFqK2Z4WXdLdGdBVlkwNWp4S3IxdkkxS2Y5VGQxUDdIa2Vn?=
 =?utf-8?B?NjE0NTVPZVI4RVM0bWlmZWZIL2dOdFhUeS9rWk10MW5aZzR6QW42NXFjbzhB?=
 =?utf-8?B?VkJheWdXdlFyeXIzWm1RZDV1NEtsamNicHZvVVg3SjVlcVErL3E1UkZaODZj?=
 =?utf-8?B?UzNLRHc4Y25pRmpNa0pGK0hMMUpxTS9WQkQyN3Y1YnhETVJ0dTBNZXZZUmJK?=
 =?utf-8?B?ZzcyQTFDVVllYnBNazBNMTQxb0ExT24zWk1heDZIS0l6ZlJMOGh3QVdzV3k5?=
 =?utf-8?B?djRaa3BZSGVYNTNaVmxjalZ4L1VXeTQxYTEzQjNCRlJmcFh3eWFKRWxtVCt2?=
 =?utf-8?B?MGEza05wRFA3TUhSYU96aUVSUEh5VkxIb1Q5ZS9QTnlIL1RwVjFoMDZEL2Yv?=
 =?utf-8?B?RHNtcnhZNDRjTWkvaEtnMUdJejd0cHNxb3h2MnVWbE9ZZ0UxSGhiQVUxc2JR?=
 =?utf-8?B?TGl3YnUvNTZBTHBuaDJaL0krT0VEQWpaYjZTbFNhaUxDU21KVFNzcEJ2L2I4?=
 =?utf-8?B?TkhHZjFQcHlFRy9wZXYxcTRVMVgrS2llVTdGb25SMEZEaDJSeDlqTkpRY2JB?=
 =?utf-8?B?dCtsaXhKRklEZ1F6WEdPcWRMODlxd0ZVN0Y0MzhhNjVQemlIMTVleGNKTGlP?=
 =?utf-8?B?OGVFUWptQ3RHOExlTDBEUGozQzZYNThxQjljL0RvclI5MmtiZlVJR05JZ2ha?=
 =?utf-8?B?TjZwcE1GRFNnWjZSdzJXaWc1UHc1RFE4QU9ERXZXVmVDNWVwYzFWbU5BQTdN?=
 =?utf-8?B?VXpBUmNCRkFYZW56QU51QmMrTk9taFVhdXNYOHRXNDVLaE4xUmNhM1FSNHF6?=
 =?utf-8?B?UEpTQ2N3RmJ1eWNyVjl5K2NkVmMyV2RZWncvbGRoTjFmY0QxZUFpQmV2OWFQ?=
 =?utf-8?Q?s1VPoXAoV9I=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXo4UkR4OGhQWS85QjRnQWlWcVVYcStWeEtMaWpPMGNjZHNLYnpqUTJ1NWZT?=
 =?utf-8?B?dU5WRXkyYVdEREZONmtsRFNsU0NLekdjb2tSUTBIMUo2OUI5ckU3Q3kyNENm?=
 =?utf-8?B?dFVFck5vYUdvN2FVcFFWcTg1Z244Qm4vUkIyemM4M2pCM3R3UkFkamh2Vnl0?=
 =?utf-8?B?cEY3RUdyNjRLbDhuQ25qbU9LOVgyY09JWHZHcnhFZ0kwR2k1Si9LRUpGTjRK?=
 =?utf-8?B?amRMMWpKR3NoMVVMR3FpZ3ZoS1VTNGNiUWE1dW55RkNIdkt3QkJ3NVdyQjlT?=
 =?utf-8?B?RmFSQnRLeUJPY3JTYnNnM3phUmN0TE9saENRZVFxbXJoSWJQeDE2Rm8xSHZO?=
 =?utf-8?B?S2cvVk80WnljaWNmc0FPbHpSVlJtc1hMWkVhbExOUm1UWkhGRUsyMEM3bDNu?=
 =?utf-8?B?OTZERkpVbUc3Lzh4bTVJZmQ4S3BSNmVnQzVqNWQ4UldvRjY1QmxKcVZudXVU?=
 =?utf-8?B?b214Y29ad2ZNMUFON3NKSnk0VU1OOWFaanFXSFZXRWVVb3IwRFJ3L21qOCt5?=
 =?utf-8?B?L2d3VGRxMTRySDYzZFJTd0Fac2R2dm85TWYrSU1pV0gzWGR5bE82UUVNaFcy?=
 =?utf-8?B?N3VSUE5ub2hmbkJuQnVId0dHdXNycENBSXY3T1dFQ1dkWkJZN3JqbGJUVXY4?=
 =?utf-8?B?ZUxNRCtyUndHYStESko2WXlPdDl3QU5CWk9YdmFiY0drMmZqbjIxZkNZWjJj?=
 =?utf-8?B?dFZhQXBNREVwRzkvYjM0eHBDempQUXloQ2t4MlMwSFFxc011L1U2N2JLZ3Iz?=
 =?utf-8?B?S1JxcGVOUElMa0xkbHRycUxocngxSndUdTNwZGFCR0pIaldZMGJTenZMQWVw?=
 =?utf-8?B?YnBOYnlwajdnYmlTbDJFRmMzYVBsODBYMzV2NWMyaGk1eVdQWDMxM1J6VnRy?=
 =?utf-8?B?b3ovdFNjOG1qMTcvY2NMcHY0WlM5M3VmS091eTA4N0lhLzdPL1lVSUorMXE1?=
 =?utf-8?B?RFdDNXRKUGUvWlJiR3hWUG1ReEQvT3M3N0dDWHdxazEzdm4yS0Z3cko4amFK?=
 =?utf-8?B?d0JRZk1YRzBoZXZoU3A3a1ErU0dYdE5TR0JHaWRBRWJ0UDZQa09xdWVlU3V4?=
 =?utf-8?B?Y0dCaXdIbHVMVEw0ZDdjVHFSTW00MzYyWG53YWIxdkpvT2pxV2tGeFJjYlY5?=
 =?utf-8?B?WHplaTJYWlFpTlY4bVlZVzlPM3o0QkNYKzc5SWF6R1lYdjRwcHBXSGFpT0g1?=
 =?utf-8?B?YVpoWW5ZQVowTUgzMEVveVVwQktqOFFoaDd4SWxmQldCMW4xMUQvVy9LamlR?=
 =?utf-8?B?ZENvWVgwWitQbUxibXFQVlBUTEYxODA5b1NLV1g1R0NXMEVsRURyQTJ6cDVa?=
 =?utf-8?B?MStYa3VrS1JLaWdxcW9CUEVNUmZwRzloQTlGOGlndDdEOFp2cmVHWmlWTFUx?=
 =?utf-8?B?T3ZmdWZuUDF0OFhRWXk0TzEyVFh6MVBOYlJPZTRUYUhyWGFMZnRqVWQ1TXpE?=
 =?utf-8?B?UkpHclJVOVcwOVgxNzFycUNXZ3lkNEZJbThuVmx4WHZLUXZ3cGJyUmZYOFB0?=
 =?utf-8?B?NUJaK3N2amNOZCtHd2hhS2l3VTIxRStLQURTT0crY1FtUXpPZ3Q0ckp3UVFT?=
 =?utf-8?B?VlpSazUzVlJnTzJpLy9zQWhGZ05hWXlpRFJ5UVp0c283TFg0a1RWbzlkK3pS?=
 =?utf-8?B?Y3BPSzJBMFJKVCtUWExYSjdqODJ4c3RQYW9TZ3Z1ODhuQVdvUzVOZno3Wlo4?=
 =?utf-8?B?SjI4YnlUZVpNNUQ0eGRia214NkdsNEVOakhJbnphOU1QTWtGUVUrUGwvbzFN?=
 =?utf-8?B?MktLbWZEenZKUzNDMWNnOG1pVWpnRnJOYXFxQTdWZFJsNS9kMHJTc1ZWTmlG?=
 =?utf-8?B?TG1XRytsd2kwYnBvVXdrSTZJakpSMXUyZjZNU1dLV2F6dXhjd1RPWXlIRS9B?=
 =?utf-8?B?VVZQV0NWbkFMUWdKSnIrV0ZGZ1F0aks3YjlRNFNORUVSTVNmSGFycXowY3ZM?=
 =?utf-8?B?VDJmNTdOMGxrRmZBclJ0SVovQWh0dTVJb0ltWURmQ0hXd1k1MTQrWVRZWlBE?=
 =?utf-8?B?dkJSRVBBNjB1YkZSK2N1djFSKzk3dlNBWmUwZGUzM2ZrUGFXY0V6YkduTkVm?=
 =?utf-8?B?ekhBRzJmZncwRUNMcWtBM1ZKcFlNcFJpWkFUdWFJbUsrVmNwL3BhckVUbkR2?=
 =?utf-8?Q?WWXetrfW1i4URdm9/CnLQseOn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f62e2cda-f5d3-44eb-9586-08dddb3c425f
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2025 14:10:01.5849 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gugwZLH80eJNGeheQOt5HYUT5VvL696bKHqcLB/DyiHaDE8v4BYSI6yGBxPZ89vf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6438
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

On 14.08.25 15:36, Tvrtko Ursulin wrote:
> Indirect buffers are an AMD term describing essentialy a job submitted to
> the scheduler, just a lower level one. Since scheduler was promoted to be
> generic long ago, lets replace those references with jobs.
> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: Philipp Stanner <phasta@kernel.org>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/scheduler/sched_entity.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c b/drivers/gpu/drm/scheduler/sched_entity.c
> index 8867b95ab089..254932b9050e 100644
> --- a/drivers/gpu/drm/scheduler/sched_entity.c
> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
> @@ -285,9 +285,9 @@ long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout)
>  		return 0;
>  
>  	sched = entity->rq->sched;
> -	/**
> -	 * The client will not queue more IBs during this fini, consume existing
> -	 * queued IBs or discard them on SIGKILL
> +	/*
> +	 * The client will not queue more jobs during this fini - consume
> +	 * existing queued ones, or discard them on SIGKILL.
>  	 */
>  	if (current->flags & PF_EXITING) {
>  		if (timeout)
> @@ -300,7 +300,7 @@ long drm_sched_entity_flush(struct drm_sched_entity *entity, long timeout)
>  				    drm_sched_entity_is_idle(entity));
>  	}
>  
> -	/* For killed process disable any more IBs enqueue right now */
> +	/* For a killed process disallow further enqueueing of jobs. */
>  	last_user = cmpxchg(&entity->last_user, current->group_leader, NULL);
>  	if ((!last_user || last_user == current->group_leader) &&
>  	    (current->flags & PF_EXITING) && (current->exit_code == SIGKILL))
> @@ -324,9 +324,9 @@ EXPORT_SYMBOL(drm_sched_entity_flush);
>  void drm_sched_entity_fini(struct drm_sched_entity *entity)
>  {
>  	/*
> -	 * If consumption of existing IBs wasn't completed. Forcefully remove
> -	 * them here. Also makes sure that the scheduler won't touch this entity
> -	 * any more.
> +	 * If consumption of existing jobs wasn't completed forcefully remove
> +	 * them. Also makes sure that the scheduler won't touch this entity any
> +	 * more.
>  	 */
>  	drm_sched_entity_kill(entity);
>  

