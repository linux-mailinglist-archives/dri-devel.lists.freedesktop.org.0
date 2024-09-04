Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A859696B8DF
	for <lists+dri-devel@lfdr.de>; Wed,  4 Sep 2024 12:47:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0575010E74F;
	Wed,  4 Sep 2024 10:47:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="JhouapUp";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E9E410E74F;
 Wed,  4 Sep 2024 10:47:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iauAQtZR/uV1Z8Qn/2ZJb7EynEDgiEYZf61pK1nj/H8Q3hfPWZvW5pOWuBlT2qPHxbZ6eXa1QHBukdvn7V1qrJDiPmjJMgDwB1juXMhS/i8bleU9Di5hW6E61Ei+1r1golsJgjIhy7PRRnW9Tmu6BDx2PjvCz+1lFMoD46oskKrz6TXJvWcTiCJursBzUXu0DxxDtMo3w5R1Fl6t+1OD8LyN5u5dQI+a/A3aLyFrgt83tee14IFfQ8OyoMFGE2ENM+VztnQq81+1kz6O6qAD0/89iPGHXxcPz5D2aXTdyrAhYTzUq1MRqB+5SeQcrbzGb37EZ62H9z/SlIKDiy6OKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZYUZkY9elbXQZSsde/UyEIXDT3eMNCrCxh6HX4IWoR0=;
 b=gzPzUhFAWc+W6y/bIBidcG6wkjS/DUlv/xtaRMO4CHXn5vC2tMqhs7CPiMs+UY41cpl+Vm8vSq+wrDPAaRAH4L77Bp+p1hvTBC5VGij/0+Z4brSxcytZwjfyfD0Za2zC9Xg6PfOJ65BphOKRtGoQPgHNTn3UedYYkUHCOoKZPkO1BPppIphciAs6Iq35gwVqh0vZ7BFmwUIJyjod75yTjszgPWb4iLJMYXy9Ad/zK8xicUS34k37TPfjcQGWNp0wv5CloxbYVpqLtDC0ju0ysT+n44Pf9CMtuPjlpXyT3kWENEjJN4zL9+B8b9wmFkCNwl1ItH4g10eNSyndeGCmkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZYUZkY9elbXQZSsde/UyEIXDT3eMNCrCxh6HX4IWoR0=;
 b=JhouapUp7D33VV0GYToeuBrj3yZtWK2W1W2vd9t0xFzUyG2wLN9R/o4UBWhXa8hWcsR26Lrpoh/autMFl8ozpJJXGkI6CNAq3pbsTi5xpIqHcm0lrG+hRmrcfsHlmGgp6A2RTz6fN7GCq5xxqvWeI4V3i7/szE9bzPFccpvw5Fk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by DS0PR12MB8576.namprd12.prod.outlook.com (2603:10b6:8:165::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Wed, 4 Sep
 2024 10:47:17 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062%3]) with mapi id 15.20.7918.024; Wed, 4 Sep 2024
 10:47:17 +0000
Message-ID: <78c687b5-2dd1-4d6f-a6c3-22769d75bbb6@amd.com>
Date: Wed, 4 Sep 2024 12:47:12 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] drm/ttm: Move swapped objects off the manager's
 LRU list
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
References: <20240904070808.95126-1-thomas.hellstrom@linux.intel.com>
 <20240904070808.95126-2-thomas.hellstrom@linux.intel.com>
 <91936a3d-b8c1-41f6-95e0-870fc1c2d007@amd.com>
 <e3c6ba4eb2349cb160996a913132e022af63abd8.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <e3c6ba4eb2349cb160996a913132e022af63abd8.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0259.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::9) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|DS0PR12MB8576:EE_
X-MS-Office365-Filtering-Correlation-Id: 0a0a6f87-97df-4f8f-b22e-08dccccef1a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z3RpdEZPT1ArMExpSlIzV2hZNmNabXU4WDJYeW16SitFQUZpZ0MyWmxwZXpw?=
 =?utf-8?B?dVFZdkdHVzZaT3hKeWVCdXBqcnpURWlVc2VQSFVmK1loaEh3YWl3OU0rS2Vr?=
 =?utf-8?B?YUpnUUNGQUxNaEtZdDViWi9BN0xvT1c0N0FPajRRTndBUk1wLzNsaklvUHcv?=
 =?utf-8?B?RzNRMk9iaFBlMWNWVWQrNXIvdDdNUDd5MDArbGRXOTJQQ1VURGpQdW0rMDVE?=
 =?utf-8?B?eVBtMVMrNUorcjk0U1dxcXZTUXBjajVaeC9rcG41cUllcE5WaGZoMnh4eDNj?=
 =?utf-8?B?RWttV2RadzgwYUVwd2pyNkx6M21nWG9VSU1zREt4OHJxRWxIQklaQ01jRnZy?=
 =?utf-8?B?TDZkUDF1RlB0cEJSQkxxUWRVUS9rMDBkT3k1WmVVTW84UFpGWjNGOXNBMlJY?=
 =?utf-8?B?S3EybGgzTm14QTFVYkNCcWt1YmE1R1F0OFdDZ0MzQWR1OU9YN0cwWHliOVdD?=
 =?utf-8?B?OTJ0ZU8xMTJDSUZTVFVpMFdZRzhBaWJ2Q0hrb3k4TVQzYW1KZ2ZjNVordmxl?=
 =?utf-8?B?NXZDdFFEcXYrUjZrbTcrdjRSK2ZXbW9aei9WdWtQZzg5UUtyRHBXc0NETVlw?=
 =?utf-8?B?VEUzWkw5akU2UGp3SGNuSHBEVDZqN2g4MUhCL0ZlRzNzNnEzcklvSFdPUUNq?=
 =?utf-8?B?MDBNOHlrdnRheFVRVmZVSk5WMjRBTEpRekVIMXlMVnlnenQ5M3VOdXg2TVBm?=
 =?utf-8?B?MVNwdmprWXdFdVNYM1ptR1Y4NUNhWi9EQzFZbEtScG9UakdXNkhIcGdQZlJm?=
 =?utf-8?B?Tjd4ZVM5MlZUQmQwVHU3RmNSckVnanJJS3hPakhKWXlKN2xTZ0Q5b3ZHRXFp?=
 =?utf-8?B?ZUNkM0NJVU5CTktKSTVtZWJDY1lNNG5adFV4YWFlQWc2WnhvNURydUd2UE5L?=
 =?utf-8?B?b1lGdkJRcHYyek9nTDN6aWlwZ2J5eXpZTVhHeENDMDhOOVZza0x4S2hHaGJP?=
 =?utf-8?B?eHRvaXM5OFhNUnExaFRFYzFkSlROU1AraXJKQ3RDREFudkNCQnRwa1c5blNY?=
 =?utf-8?B?V1BCeHgyc1VZaW9WYnZHdy9URUowczFwMys0cm12eXhkNjdDY2k5Z0VvZkwy?=
 =?utf-8?B?Y2tRbktBQ0lwNVNSMXVFV0pzb0Y5RW9nV3RWdDcyaWVQNW1mdHkxNDByVXpW?=
 =?utf-8?B?ZTllcTFzTzdNZjZwU01ETm52WWh0SE5LQVZ3a0t5bC9WWStFVDRLaGJ5anky?=
 =?utf-8?B?Rzk4eW1zY3VERW1sQ1ZxRWVIYUs0SWwrRUZDdXVuNEdyNWN4L3VUMDcvNTNI?=
 =?utf-8?B?TythV0hYK1BlV0xhV2ZzSFhWTGZOL2ZEZU9tT3FEREd4MmJTcERYYjA0QWpU?=
 =?utf-8?B?WjRhWFdPSE16d3hjOTNncnZSeDdnaTZTbFZFaUlqWDJEMFJucDZTd1g1MWFr?=
 =?utf-8?B?MmRlbnRYdzdPb09ZSzArRnI3ODY5d2N4S3JtYnpDOURJcVZmM24yOXhudUNq?=
 =?utf-8?B?L3pGRW0xdGRXaE9Yd2pNYjZaaDNaeGtHRElVMmtLRE1qNnBYWlI1Wnl6WDk5?=
 =?utf-8?B?aGdweWxEVHJGSkpDNEpPNnJZekJuZnVaNXlEZGJrd0tDVktxelZJcThhdi9Z?=
 =?utf-8?B?cDFjUExLdUNoUk5tV3BZOVZRckdNZGowKzFuaUN0dTc3QlpyNWgxZ0dTTENy?=
 =?utf-8?B?Mm5JNHMxYzRCa2cyUFgzZlVkc3p2aFRkWDlLV0Q3MHMvREFBTDJOSGRkUGlQ?=
 =?utf-8?B?K25jdjdHRXAyd1FJSFdQaGpDSzhKZktxQ3Z0dTNuYXQ5L09BTmoxcnJ3cnk1?=
 =?utf-8?B?WDJ4NFhieVlTbGNpVWJYdmkvTUJMNjNzSjVrZnkrU1Yxd2ROK25BcDRlWkww?=
 =?utf-8?B?T2UvbXBPcHAvSldCUDduQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Y0VPSW5hVWlRYnQ3U01lWnd1dFhnYU5DVjdXYmlNSkJXejN5T1NmN2ErS25q?=
 =?utf-8?B?V0RwRFZnTldaS3BKNm14anZlTjNyamlTNHlBWENVK1BYNVRGdWlUZmxDRWVD?=
 =?utf-8?B?UW5PN0k1Wk5PYzRtS1dyK2EvVHpSREdQT0dpSGZGZ1piSnZ3L1JvSjJ6QkhR?=
 =?utf-8?B?cDdnVHFXRWZHRzQrRVM4L1BJclAyYXlxQWZFWksrcVB3UUdJZS9OUzIzdkMr?=
 =?utf-8?B?b1B3dWUyQTNEQ25NRml2YUFUNklkdUNFQXVid2diM0Q4dlhaV2wwV3VUOVJp?=
 =?utf-8?B?ZjljdmlNVWkxZzd0MHZsb3BVSlNZOEpyM2N4TjZZSlVDeVN6VStwS3dyZTdp?=
 =?utf-8?B?WDdSSEo5YVZpbkEvMzcxcnlPcTVlMEdKQ2R3UDlPK0xRcW1uQmNGcWlaWS96?=
 =?utf-8?B?ZnB3NTFjNHJtZmVlQXNWMzRnT3NVb2RXRnNLYmVrYVU1b0ROdnJVS01jc1py?=
 =?utf-8?B?elJiSWJGTWNIK2c2blNXNU9FTDlhMTg3LzZSYnZQYWFkbnQyQ0VXZUdaUmh1?=
 =?utf-8?B?azdqNDZuVzRmYUMrVXVrcnRGYzRFd0VxUDZLbTlOT05vUDkvS1BzVThkZjJN?=
 =?utf-8?B?RmlGZk53b2NaVXZSY3VzV3d3VjM3VFhRd013OUVja1lJZ3BiVk41UzV1K0tv?=
 =?utf-8?B?OFJhRkQvUUFydkVCWUFubGVJM1lxMlQxUHZJLzc3VjlWMTVXaGovUDRUaStn?=
 =?utf-8?B?SnRjMkxJMUJ5VUk5WGhrblVIdjJCUzNaUTRCcStSSnM1OFdwZDFCOEUvdGht?=
 =?utf-8?B?L2xMY1lQcTMvVXF3Yy9KUVJ1d09EWTdzVWFGSGR1di9ObUxYRFdoT1V3UTg3?=
 =?utf-8?B?MlZyakpXUUFHWmdsSW1hWUdyMFRYeW1iRHp2K05NN1czc0FEN3I5ckw2MlB0?=
 =?utf-8?B?OXhiNW1MVnhtZUJONHlDVGx3azRhVGc0aTVrQUo1dERoYUczbE9BQVlHRGpB?=
 =?utf-8?B?dTk2cG1XZmNwSlhISU80b3VsYTdzcXNwejFYRUZrOXZIQ2lhR2c1b1ByS0Yr?=
 =?utf-8?B?bGFuNjh6aDVVS0pBR0l4UlRlUUxtbFFNd1VublRxR0p1TGxCa2p5SmxZck1r?=
 =?utf-8?B?YzFyU2p6Y1ZxV015RmFYUUpCVFRyM2ZFOWJaek1zM1ZLK21hM2NqTzJtaE42?=
 =?utf-8?B?ei9OSllDOVZFamtqWDVmQXV0M3ZlM3JSZHRjN00yZndKWUZCajBiaFdEa0dw?=
 =?utf-8?B?eDVZWUMwVHNHM1ZPODc5MzU5OCtUckYvSlJoR1c2WHdRWXh4aUNUbmNjMlND?=
 =?utf-8?B?ZTAyNnZRMWRKRmk4UlZzSy93bnZ1MG1MM1JKRktWVDl5Unc4VStBRlFwK1c0?=
 =?utf-8?B?a2RiaVNHMDZ0eFlRYXRzMjFnQlBCVVA2MCs1ZHV0a1hRVGViQUdQVTZDSFpG?=
 =?utf-8?B?RytuYnpXeHZMb1VQUTZSL0VSVktKZGdKeThjeWNHTmFnM1lycGw2QmFveHpl?=
 =?utf-8?B?VnFWU0tOUktLZGRHSVNkM09NbzJNY2hiQ214ei80SG9UdXNwRkpaRXlYREYx?=
 =?utf-8?B?TzJRMmZISGZZb1lBMWw4NHk2R2NLMVZxY0hBdDcvL0p2QTVRVmpnbnY0b0FL?=
 =?utf-8?B?SlQ2VVp0TjZqU3NrdUpTZW05YS92WUJONzVPMnMvWHFsR3UxSkxWOEg0Sm9Y?=
 =?utf-8?B?SENueU1Ld3JOU283SXJJckhvVzZVMjRVNGw5UUE0b05jc2dsa2t6dEhNeFV2?=
 =?utf-8?B?YzJvYjNoSTVBaGsxVDFnOCtJUDRtdXRGYmdiNVhUQitsY0liNFQvS3FxVzV3?=
 =?utf-8?B?OWlDTlp2QVdYL0owYld6YWRiRTd2OFBqc3NEc2JqcnByQVE2a0wyczh4Q0JD?=
 =?utf-8?B?b1BpNUxpbXNpN2p5RVdITTBqcEJkWlYyNUpvaDVRU1daUEpDMGVqa0tCVzBF?=
 =?utf-8?B?UUtra2hLak1IdVVhRThYNG00QUFlY2ZycjY2OTRaWkZKUFdkVFdjb2R3RGt0?=
 =?utf-8?B?Yzh2RHFuN1JGcHA5RjZsNXRrMFFOS2FKWXlyN1FQclZJRU1ZTEk3ZDMzQ0V0?=
 =?utf-8?B?N20vazd3dmZHdmhjdFF0cWhQekJsUWFsVW1ieWR5RzVQY1VYd2F1VHh5eHVr?=
 =?utf-8?B?NFdoWjNySnN6ZXdVZUFKcWJCMDlYOThlYU1SOUVaWFhtZmtSSjBjZUR3cmF3?=
 =?utf-8?Q?qvn+2zeo0n5i2lyLBJ2GHd/5N?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a0a6f87-97df-4f8f-b22e-08dccccef1a9
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Sep 2024 10:47:17.0465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H4fUUVx64rkWOHmUKtwHm5FTUMexGXYFIvhaq+prtsLBmFVawWHAZoI6ip2KSfjF
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8576
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

Am 04.09.24 um 10:54 schrieb Thomas Hellström:
> On Wed, 2024-09-04 at 10:50 +0200, Christian König wrote:
>> Am 04.09.24 um 09:08 schrieb Thomas Hellström:
>>> Resources of swapped objects remains on the TTM_PL_SYSTEM manager's
>>> LRU list, which is bad for the LRU walk efficiency.
>>>
>>> Rename the device-wide "pinned" list to "unevictable" and move
>>> also resources of swapped-out objects to that list.
>>>
>>> An alternative would be to create an "UNEVICTABLE" priority to
>>> be able to keep the pinned- and swapped objects on their
>>> respective manager's LRU without affecting the LRU walk efficiency.
>>>
>>> v2:
>>> - Remove a bogus WARN_ON (Christian König)
>>> - Update ttm_resource_[add|del] bulk move (Christian König)
>>> - Fix TTM KUNIT tests (Intel CI)
>>> v3:
>>> - Check for non-NULL bo->resource in ttm_bo_populate().
>>> v4:
>>> - Don't move to LRU tail during swapout until the resource
>>>     is properly swapped or there was a swapout failure.
>>>     (Intel Ci)
>>> - Add a newline after checkpatch check.
>>>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: <dri-devel@lists.freedesktop.org>
>>> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>> I really wonder if having a SWAPPED wouldn't be cleaner in the long
>> run.
>>
>> Anyway, that seems to work for now. So patch is Reviewed-by:
>> Christian
>> König <christian.koenig@amd.com>.
> Thanks. Are you ok with the changes to the pinning patch that happened
> after yoour R-B as well?

I was already wondering why the increment used to be separate while 
reviewing the initial version. So yes that looks better now.

>
> Ack to merge through drm-misc-next once CI is clean?

Yeah, works for me.

Christian.

>
> /Thomas
>
>
>> Regards,
>> Christian.
>>
>>> ---
>>>    drivers/gpu/drm/i915/gem/i915_gem_ttm.c       |  2 +-
>>>    drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c  |  2 +-
>>>    drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c    |  4 +-
>>>    drivers/gpu/drm/ttm/tests/ttm_bo_test.c       |  4 +-
>>>    drivers/gpu/drm/ttm/tests/ttm_resource_test.c |  6 +-
>>>    drivers/gpu/drm/ttm/ttm_bo.c                  | 59
>>> ++++++++++++++++++-
>>>    drivers/gpu/drm/ttm/ttm_bo_util.c             |  6 +-
>>>    drivers/gpu/drm/ttm/ttm_bo_vm.c               |  2 +-
>>>    drivers/gpu/drm/ttm/ttm_device.c              |  4 +-
>>>    drivers/gpu/drm/ttm/ttm_resource.c            | 15 +++--
>>>    drivers/gpu/drm/ttm/ttm_tt.c                  |  3 +
>>>    drivers/gpu/drm/xe/xe_bo.c                    |  4 +-
>>>    include/drm/ttm/ttm_bo.h                      |  2 +
>>>    include/drm/ttm/ttm_device.h                  |  5 +-
>>>    include/drm/ttm/ttm_tt.h                      |  5 ++
>>>    15 files changed, 96 insertions(+), 27 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>> index 5c72462d1f57..7de284766f82 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm.c
>>> @@ -808,7 +808,7 @@ static int __i915_ttm_get_pages(struct
>>> drm_i915_gem_object *obj,
>>>    	}
>>>    
>>>    	if (bo->ttm && !ttm_tt_is_populated(bo->ttm)) {
>>> -		ret = ttm_tt_populate(bo->bdev, bo->ttm, &ctx);
>>> +		ret = ttm_bo_populate(bo, &ctx);
>>>    		if (ret)
>>>    			return ret;
>>>    
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>>> index 03b00a03a634..041dab543b78 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_move.c
>>> @@ -624,7 +624,7 @@ int i915_ttm_move(struct ttm_buffer_object *bo,
>>> bool evict,
>>>    
>>>    	/* Populate ttm with pages if needed. Typically system
>>> memory. */
>>>    	if (ttm && (dst_man->use_tt || (ttm->page_flags &
>>> TTM_TT_FLAG_SWAPPED))) {
>>> -		ret = ttm_tt_populate(bo->bdev, ttm, ctx);
>>> +		ret = ttm_bo_populate(bo, ctx);
>>>    		if (ret)
>>>    			return ret;
>>>    	}
>>> diff --git a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
>>> b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
>>> index ad649523d5e0..61596cecce4d 100644
>>> --- a/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
>>> +++ b/drivers/gpu/drm/i915/gem/i915_gem_ttm_pm.c
>>> @@ -90,7 +90,7 @@ static int i915_ttm_backup(struct
>>> i915_gem_apply_to_region *apply,
>>>    		goto out_no_lock;
>>>    
>>>    	backup_bo = i915_gem_to_ttm(backup);
>>> -	err = ttm_tt_populate(backup_bo->bdev, backup_bo->ttm,
>>> &ctx);
>>> +	err = ttm_bo_populate(backup_bo, &ctx);
>>>    	if (err)
>>>    		goto out_no_populate;
>>>    
>>> @@ -189,7 +189,7 @@ static int i915_ttm_restore(struct
>>> i915_gem_apply_to_region *apply,
>>>    	if (!backup_bo->resource)
>>>    		err = ttm_bo_validate(backup_bo,
>>> i915_ttm_sys_placement(), &ctx);
>>>    	if (!err)
>>> -		err = ttm_tt_populate(backup_bo->bdev, backup_bo-
>>>> ttm, &ctx);
>>> +		err = ttm_bo_populate(backup_bo, &ctx);
>>>    	if (!err) {
>>>    		err = i915_gem_obj_copy_ttm(obj, backup, pm_apply-
>>>> allow_gpu,
>>>    					    false);
>>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
>>> b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
>>> index f0a7eb62116c..3139fd9128d8 100644
>>> --- a/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
>>> +++ b/drivers/gpu/drm/ttm/tests/ttm_bo_test.c
>>> @@ -308,11 +308,11 @@ static void ttm_bo_unreserve_pinned(struct
>>> kunit *test)
>>>    	err = ttm_resource_alloc(bo, place, &res2);
>>>    	KUNIT_ASSERT_EQ(test, err, 0);
>>>    	KUNIT_ASSERT_EQ(test,
>>> -			list_is_last(&res2->lru.link, &priv-
>>>> ttm_dev->pinned), 1);
>>> +			list_is_last(&res2->lru.link, &priv-
>>>> ttm_dev->unevictable), 1);
>>>    
>>>    	ttm_bo_unreserve(bo);
>>>    	KUNIT_ASSERT_EQ(test,
>>> -			list_is_last(&res1->lru.link, &priv-
>>>> ttm_dev->pinned), 1);
>>> +			list_is_last(&res1->lru.link, &priv-
>>>> ttm_dev->unevictable), 1);
>>>    
>>>    	ttm_resource_free(bo, &res1);
>>>    	ttm_resource_free(bo, &res2);
>>> diff --git a/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
>>> b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
>>> index 22260e7aea58..a9f4b81921c3 100644
>>> --- a/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
>>> +++ b/drivers/gpu/drm/ttm/tests/ttm_resource_test.c
>>> @@ -164,18 +164,18 @@ static void ttm_resource_init_pinned(struct
>>> kunit *test)
>>>    
>>>    	res = kunit_kzalloc(test, sizeof(*res), GFP_KERNEL);
>>>    	KUNIT_ASSERT_NOT_NULL(test, res);
>>> -	KUNIT_ASSERT_TRUE(test, list_empty(&bo->bdev->pinned));
>>> +	KUNIT_ASSERT_TRUE(test, list_empty(&bo->bdev-
>>>> unevictable));
>>>    
>>>    	dma_resv_lock(bo->base.resv, NULL);
>>>    	ttm_bo_pin(bo);
>>>    	ttm_resource_init(bo, place, res);
>>> -	KUNIT_ASSERT_TRUE(test, list_is_singular(&bo->bdev-
>>>> pinned));
>>> +	KUNIT_ASSERT_TRUE(test, list_is_singular(&bo->bdev-
>>>> unevictable));
>>>    
>>>    	ttm_bo_unpin(bo);
>>>    	ttm_resource_fini(man, res);
>>>    	dma_resv_unlock(bo->base.resv);
>>>    
>>> -	KUNIT_ASSERT_TRUE(test, list_empty(&bo->bdev->pinned));
>>> +	KUNIT_ASSERT_TRUE(test, list_empty(&bo->bdev-
>>>> unevictable));
>>>    }
>>>    
>>>    static void ttm_resource_fini_basic(struct kunit *test)
>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c
>>> b/drivers/gpu/drm/ttm/ttm_bo.c
>>> index 320592435252..875b024913a0 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_bo.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
>>> @@ -139,7 +139,7 @@ static int ttm_bo_handle_move_mem(struct
>>> ttm_buffer_object *bo,
>>>    			goto out_err;
>>>    
>>>    		if (mem->mem_type != TTM_PL_SYSTEM) {
>>> -			ret = ttm_tt_populate(bo->bdev, bo->ttm,
>>> ctx);
>>> +			ret = ttm_bo_populate(bo, ctx);
>>>    			if (ret)
>>>    				goto out_err;
>>>    		}
>>> @@ -1128,9 +1128,20 @@ ttm_bo_swapout_cb(struct ttm_lru_walk *walk,
>>> struct ttm_buffer_object *bo)
>>>    	if (bo->bdev->funcs->swap_notify)
>>>    		bo->bdev->funcs->swap_notify(bo);
>>>    
>>> -	if (ttm_tt_is_populated(bo->ttm))
>>> +	if (ttm_tt_is_populated(bo->ttm)) {
>>> +		spin_lock(&bo->bdev->lru_lock);
>>> +		ttm_resource_del_bulk_move(bo->resource, bo);
>>> +		spin_unlock(&bo->bdev->lru_lock);
>>> +
>>>    		ret = ttm_tt_swapout(bo->bdev, bo->ttm,
>>> swapout_walk->gfp_flags);
>>>    
>>> +		spin_lock(&bo->bdev->lru_lock);
>>> +		if (ret)
>>> +			ttm_resource_add_bulk_move(bo->resource,
>>> bo);
>>> +		ttm_resource_move_to_lru_tail(bo->resource);
>>> +		spin_unlock(&bo->bdev->lru_lock);
>>> +	}
>>> +
>>>    out:
>>>    	/* Consider -ENOMEM and -ENOSPC non-fatal. */
>>>    	if (ret == -ENOMEM || ret == -ENOSPC)
>>> @@ -1180,3 +1191,47 @@ void ttm_bo_tt_destroy(struct
>>> ttm_buffer_object *bo)
>>>    	ttm_tt_destroy(bo->bdev, bo->ttm);
>>>    	bo->ttm = NULL;
>>>    }
>>> +
>>> +/**
>>> + * ttm_bo_populate() - Ensure that a buffer object has backing
>>> pages
>>> + * @bo: The buffer object
>>> + * @ctx: The ttm_operation_ctx governing the operation.
>>> + *
>>> + * For buffer objects in a memory type whose manager uses
>>> + * struct ttm_tt for backing pages, ensure those backing pages
>>> + * are present and with valid content. The bo's resource is also
>>> + * placed on the correct LRU list if it was previously swapped
>>> + * out.
>>> + *
>>> + * Return: 0 if successful, negative error code on failure.
>>> + * Note: May return -EINTR or -ERESTARTSYS if @ctx::interruptible
>>> + * is set to true.
>>> + */
>>> +int ttm_bo_populate(struct ttm_buffer_object *bo,
>>> +		    struct ttm_operation_ctx *ctx)
>>> +{
>>> +	struct ttm_tt *tt = bo->ttm;
>>> +	bool swapped;
>>> +	int ret;
>>> +
>>> +	dma_resv_assert_held(bo->base.resv);
>>> +
>>> +	if (!tt)
>>> +		return 0;
>>> +
>>> +	swapped = ttm_tt_is_swapped(tt);
>>> +	ret = ttm_tt_populate(bo->bdev, tt, ctx);
>>> +	if (ret)
>>> +		return ret;
>>> +
>>> +	if (swapped && !ttm_tt_is_swapped(tt) && !bo->pin_count &&
>>> +	    bo->resource) {
>>> +		spin_lock(&bo->bdev->lru_lock);
>>> +		ttm_resource_add_bulk_move(bo->resource, bo);
>>> +		ttm_resource_move_to_lru_tail(bo->resource);
>>> +		spin_unlock(&bo->bdev->lru_lock);
>>> +	}
>>> +
>>> +	return 0;
>>> +}
>>> +EXPORT_SYMBOL(ttm_bo_populate);
>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c
>>> b/drivers/gpu/drm/ttm/ttm_bo_util.c
>>> index 3c07f4712d5c..d939925efa81 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
>>> @@ -163,7 +163,7 @@ int ttm_bo_move_memcpy(struct ttm_buffer_object
>>> *bo,
>>>    	src_man = ttm_manager_type(bdev, src_mem->mem_type);
>>>    	if (ttm && ((ttm->page_flags & TTM_TT_FLAG_SWAPPED) ||
>>>    		    dst_man->use_tt)) {
>>> -		ret = ttm_tt_populate(bdev, ttm, ctx);
>>> +		ret = ttm_bo_populate(bo, ctx);
>>>    		if (ret)
>>>    			return ret;
>>>    	}
>>> @@ -350,7 +350,7 @@ static int ttm_bo_kmap_ttm(struct
>>> ttm_buffer_object *bo,
>>>    
>>>    	BUG_ON(!ttm);
>>>    
>>> -	ret = ttm_tt_populate(bo->bdev, ttm, &ctx);
>>> +	ret = ttm_bo_populate(bo, &ctx);
>>>    	if (ret)
>>>    		return ret;
>>>    
>>> @@ -507,7 +507,7 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo,
>>> struct iosys_map *map)
>>>    		pgprot_t prot;
>>>    		void *vaddr;
>>>    
>>> -		ret = ttm_tt_populate(bo->bdev, ttm, &ctx);
>>> +		ret = ttm_bo_populate(bo, &ctx);
>>>    		if (ret)
>>>    			return ret;
>>>    
>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>> b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>> index 4212b8c91dd4..2c699ed1963a 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>> @@ -224,7 +224,7 @@ vm_fault_t ttm_bo_vm_fault_reserved(struct
>>> vm_fault *vmf,
>>>    		};
>>>    
>>>    		ttm = bo->ttm;
>>> -		err = ttm_tt_populate(bdev, bo->ttm, &ctx);
>>> +		err = ttm_bo_populate(bo, &ctx);
>>>    		if (err) {
>>>    			if (err == -EINTR || err == -ERESTARTSYS
>>> ||
>>>    			    err == -EAGAIN)
>>> diff --git a/drivers/gpu/drm/ttm/ttm_device.c
>>> b/drivers/gpu/drm/ttm/ttm_device.c
>>> index e7cc4954c1bc..02e797fd1891 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_device.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_device.c
>>> @@ -216,7 +216,7 @@ int ttm_device_init(struct ttm_device *bdev,
>>> const struct ttm_device_funcs *func
>>>    
>>>    	bdev->vma_manager = vma_manager;
>>>    	spin_lock_init(&bdev->lru_lock);
>>> -	INIT_LIST_HEAD(&bdev->pinned);
>>> +	INIT_LIST_HEAD(&bdev->unevictable);
>>>    	bdev->dev_mapping = mapping;
>>>    	mutex_lock(&ttm_global_mutex);
>>>    	list_add_tail(&bdev->device_list, &glob->device_list);
>>> @@ -283,7 +283,7 @@ void ttm_device_clear_dma_mappings(struct
>>> ttm_device *bdev)
>>>    	struct ttm_resource_manager *man;
>>>    	unsigned int i, j;
>>>    
>>> -	ttm_device_clear_lru_dma_mappings(bdev, &bdev->pinned);
>>> +	ttm_device_clear_lru_dma_mappings(bdev, &bdev-
>>>> unevictable);
>>>    
>>>    	for (i = TTM_PL_SYSTEM; i < TTM_NUM_MEM_TYPES; ++i) {
>>>    		man = ttm_manager_type(bdev, i);
>>> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c
>>> b/drivers/gpu/drm/ttm/ttm_resource.c
>>> index 6d764ba88aab..93b44043b428 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_resource.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
>>> @@ -30,6 +30,7 @@
>>>    #include <drm/ttm/ttm_bo.h>
>>>    #include <drm/ttm/ttm_placement.h>
>>>    #include <drm/ttm/ttm_resource.h>
>>> +#include <drm/ttm/ttm_tt.h>
>>>    
>>>    #include <drm/drm_util.h>
>>>    
>>> @@ -239,7 +240,8 @@ static void ttm_lru_bulk_move_del(struct
>>> ttm_lru_bulk_move *bulk,
>>>    void ttm_resource_add_bulk_move(struct ttm_resource *res,
>>>    				struct ttm_buffer_object *bo)
>>>    {
>>> -	if (bo->bulk_move && !bo->pin_count)
>>> +	if (bo->bulk_move && !bo->pin_count &&
>>> +	    (!bo->ttm || !ttm_tt_is_swapped(bo->ttm)))
>>>    		ttm_lru_bulk_move_add(bo->bulk_move, res);
>>>    }
>>>    
>>> @@ -247,7 +249,8 @@ void ttm_resource_add_bulk_move(struct
>>> ttm_resource *res,
>>>    void ttm_resource_del_bulk_move(struct ttm_resource *res,
>>>    				struct ttm_buffer_object *bo)
>>>    {
>>> -	if (bo->bulk_move && !bo->pin_count)
>>> +	if (bo->bulk_move && !bo->pin_count &&
>>> +	    (!bo->ttm || !ttm_tt_is_swapped(bo->ttm)))
>>>    		ttm_lru_bulk_move_del(bo->bulk_move, res);
>>>    }
>>>    
>>> @@ -259,8 +262,8 @@ void ttm_resource_move_to_lru_tail(struct
>>> ttm_resource *res)
>>>    
>>>    	lockdep_assert_held(&bo->bdev->lru_lock);
>>>    
>>> -	if (bo->pin_count) {
>>> -		list_move_tail(&res->lru.link, &bdev->pinned);
>>> +	if (bo->pin_count || (bo->ttm && ttm_tt_is_swapped(bo-
>>>> ttm))) {
>>> +		list_move_tail(&res->lru.link, &bdev-
>>>> unevictable);
>>>    
>>>    	} else	if (bo->bulk_move) {
>>>    		struct ttm_lru_bulk_move_pos *pos =
>>> @@ -301,8 +304,8 @@ void ttm_resource_init(struct ttm_buffer_object
>>> *bo,
>>>    
>>>    	man = ttm_manager_type(bo->bdev, place->mem_type);
>>>    	spin_lock(&bo->bdev->lru_lock);
>>> -	if (bo->pin_count)
>>> -		list_add_tail(&res->lru.link, &bo->bdev->pinned);
>>> +	if (bo->pin_count || (bo->ttm && ttm_tt_is_swapped(bo-
>>>> ttm)))
>>> +		list_add_tail(&res->lru.link, &bo->bdev-
>>>> unevictable);
>>>    	else
>>>    		list_add_tail(&res->lru.link, &man->lru[bo-
>>>> priority]);
>>>    	man->usage += res->size;
>>> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c
>>> b/drivers/gpu/drm/ttm/ttm_tt.c
>>> index 4b51b9023126..3baf215eca23 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_tt.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
>>> @@ -367,7 +367,10 @@ int ttm_tt_populate(struct ttm_device *bdev,
>>>    	}
>>>    	return ret;
>>>    }
>>> +
>>> +#if IS_ENABLED(CONFIG_DRM_TTM_KUNIT_TEST)
>>>    EXPORT_SYMBOL(ttm_tt_populate);
>>> +#endif
>>>    
>>>    void ttm_tt_unpopulate(struct ttm_device *bdev, struct ttm_tt
>>> *ttm)
>>>    {
>>> diff --git a/drivers/gpu/drm/xe/xe_bo.c
>>> b/drivers/gpu/drm/xe/xe_bo.c
>>> index a8e4d46d9123..f34daae2cf2b 100644
>>> --- a/drivers/gpu/drm/xe/xe_bo.c
>>> +++ b/drivers/gpu/drm/xe/xe_bo.c
>>> @@ -892,7 +892,7 @@ int xe_bo_evict_pinned(struct xe_bo *bo)
>>>    		}
>>>    	}
>>>    
>>> -	ret = ttm_tt_populate(bo->ttm.bdev, bo->ttm.ttm, &ctx);
>>> +	ret = ttm_bo_populate(&bo->ttm, &ctx);
>>>    	if (ret)
>>>    		goto err_res_free;
>>>    
>>> @@ -945,7 +945,7 @@ int xe_bo_restore_pinned(struct xe_bo *bo)
>>>    	if (ret)
>>>    		return ret;
>>>    
>>> -	ret = ttm_tt_populate(bo->ttm.bdev, bo->ttm.ttm, &ctx);
>>> +	ret = ttm_bo_populate(&bo->ttm, &ctx);
>>>    	if (ret)
>>>    		goto err_res_free;
>>>    
>>> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
>>> index 7b56d1ca36d7..5804408815be 100644
>>> --- a/include/drm/ttm/ttm_bo.h
>>> +++ b/include/drm/ttm/ttm_bo.h
>>> @@ -462,5 +462,7 @@ int ttm_bo_pipeline_gutting(struct
>>> ttm_buffer_object *bo);
>>>    pgprot_t ttm_io_prot(struct ttm_buffer_object *bo, struct
>>> ttm_resource *res,
>>>    		     pgprot_t tmp);
>>>    void ttm_bo_tt_destroy(struct ttm_buffer_object *bo);
>>> +int ttm_bo_populate(struct ttm_buffer_object *bo,
>>> +		    struct ttm_operation_ctx *ctx);
>>>    
>>>    #endif
>>> diff --git a/include/drm/ttm/ttm_device.h
>>> b/include/drm/ttm/ttm_device.h
>>> index c22f30535c84..438358f72716 100644
>>> --- a/include/drm/ttm/ttm_device.h
>>> +++ b/include/drm/ttm/ttm_device.h
>>> @@ -252,9 +252,10 @@ struct ttm_device {
>>>    	spinlock_t lru_lock;
>>>    
>>>    	/**
>>> -	 * @pinned: Buffer objects which are pinned and so not on
>>> any LRU list.
>>> +	 * @unevictable Buffer objects which are pinned or swapped
>>> and as such
>>> +	 * not on an LRU list.
>>>    	 */
>>> -	struct list_head pinned;
>>> +	struct list_head unevictable;
>>>    
>>>    	/**
>>>    	 * @dev_mapping: A pointer to the struct address_space for
>>> invalidating
>>> diff --git a/include/drm/ttm/ttm_tt.h b/include/drm/ttm/ttm_tt.h
>>> index 2b9d856ff388..991edafdb2dd 100644
>>> --- a/include/drm/ttm/ttm_tt.h
>>> +++ b/include/drm/ttm/ttm_tt.h
>>> @@ -129,6 +129,11 @@ static inline bool ttm_tt_is_populated(struct
>>> ttm_tt *tt)
>>>    	return tt->page_flags & TTM_TT_FLAG_PRIV_POPULATED;
>>>    }
>>>    
>>> +static inline bool ttm_tt_is_swapped(const struct ttm_tt *tt)
>>> +{
>>> +	return tt->page_flags & TTM_TT_FLAG_SWAPPED;
>>> +}
>>> +
>>>    /**
>>>     * ttm_tt_create
>>>     *

