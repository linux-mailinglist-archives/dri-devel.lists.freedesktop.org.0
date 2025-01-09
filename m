Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C36DA0782A
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 14:51:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82FB210EDE8;
	Thu,  9 Jan 2025 13:51:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="i/6KX55b";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2072.outbound.protection.outlook.com [40.107.101.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09FE310EDE8
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 13:51:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GUsSipC+GMYNIvFJp+EQ0XKGSNL2mx4gxOKk2/E8HhYFXxvZtqENX5a8qPOB6KymxU08ovDN6z2w4qRK73zjDZxz9VGH1nan3bMLRXHfGDBGSB/o9w2wGoKqUvSKGkSR1CkEjibdNqkDznhP+As9JRPuprqF1aWQ1D2LZTeGHKBqF99W99LQ8CEUzfW076XYsAYAeaHTbRm4APBoP9kSmLsAlBWyRGbOVlwytyYDlOx51vnHxpGizaMc9GPbz2rZHAgDSBrdxFxClf+y19bjST6xAWCZ/1wHOjvR1Uoh1SceQ/G5kcgfIkHHs7Gm+4oHR7L5JwCnaMffwF5V6nk4uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CFGz4I30rnbQR4a4ln3tsLrof0QQZ5/Yo5ob5k0wHhY=;
 b=p99AWM8W+VGUSJ26Fi8cK1F8n3WxN3zAHG7Uy7BwV1c/5LxX/xR9SJmgjdaTrx6KLfLDRrOUnmWDnBowHdnrWMW6x636sgzUpO2IhFLCcrFt41IPb935dMGJxNfIhIF+l30aNbjdzbMY2cej94906kitQvM7rHJMD39uGKizsezMLVMfaEsaX4DklhMZ2KQ7rMSVwX8AqIUOhxMcTnLMVLpwh2s1xgluBG80AkZoPzbGqdx9S3m6gg72xsm8wHvwGRs0pkoSGPU2pDtBzXH1VpBXrR5uF//UbLbv8Lw/llTku0Z6hZPCfBr0Yj67cI18hO+PyMyHyEw/z5o17T5Wjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CFGz4I30rnbQR4a4ln3tsLrof0QQZ5/Yo5ob5k0wHhY=;
 b=i/6KX55baa5S0liEZsBJdxcC5vPjD2/B7JcqkbIXJXljM9N5tZkY9oZx0UABF+S6dkD/7Xb8raxw7fzW5bkAe7qG3o14G+8daJp/C3cdspbfiiKkiHidLJiYXylVg2ynCX4fFy2kHUj+W1zqJKLz1ULaCFGtTJm2wgYVbXuLg7o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BY5PR12MB4099.namprd12.prod.outlook.com (2603:10b6:a03:20f::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Thu, 9 Jan
 2025 13:51:15 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8335.010; Thu, 9 Jan 2025
 13:51:15 +0000
Message-ID: <5a8c5f2c-b4fe-4061-a465-ba37ec9a568a@amd.com>
Date: Thu, 9 Jan 2025 14:51:09 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 16/18] drm/sched: Connect with dma-fence deadlines
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Danilo Krummrich <dakr@redhat.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Philipp Stanner <pstanner@redhat.com>, Rob Clark <robdclark@gmail.com>
References: <20250108183528.41007-1-tvrtko.ursulin@igalia.com>
 <20250108183528.41007-17-tvrtko.ursulin@igalia.com>
 <562bc7ae-ba04-4dc9-a524-3bbf3e8afd50@amd.com>
 <8afc7179-7ea4-4350-8382-618c90658c94@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <8afc7179-7ea4-4350-8382-618c90658c94@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR0P281CA0103.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a9::16) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BY5PR12MB4099:EE_
X-MS-Office365-Filtering-Correlation-Id: f4c156a0-118e-44f7-7667-08dd30b4af42
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bnMxM0p2OFczdGQ1YjIxK2phRDVHM0pDL0xsYzh1RUl0aG9iUllYMEJCQlVJ?=
 =?utf-8?B?a3h5ZkkwM0RaejRVMU4wQjM3eXROSUwzVmZab2drQnowSnVpSGlVSkJtd1Nv?=
 =?utf-8?B?M0NrUzZzRFQzTDQyL3QvVTFhNytXR1dOVHdLYjBiMXpwZDdJU3B2dlp2cnRR?=
 =?utf-8?B?RVhSSFFxMUtrcFYzbE9hVnE2UGVjMWpYQVl0VTA1SWZUR3RzVDE5UHNKbjdZ?=
 =?utf-8?B?K0pqY3F6VW1wd0RTcW1BM1VQWG02N2pzd0R5L0hPQmE2SmtSajhQemhWaEtI?=
 =?utf-8?B?Vk9EQWRXZGRWYmRkMHZmOVVrbUV3WXJuZFJOR01RK09MNWl6eThZMmxiTnJh?=
 =?utf-8?B?RmhKM2w1WE1NOUhQQzBNNVNGcUNrSDRrL2liZGJPNW9pZmVYaUhQUWVBQ2Z0?=
 =?utf-8?B?QUlwT3o1bkpDT3ZrV0VOK3Rwc0JRTHNWTHBKM2FTMS9mWlU2eWpHQitGYURk?=
 =?utf-8?B?Vjd1MnkydDkwbnJBdys2aGhiV0RZQlBUQWIvRS9sVk9RUE5rUmhDYWhKVXpk?=
 =?utf-8?B?eUNGYUhIVStkeXV5YmN1MTFibGJobklEYUhJOVJqVUxzVEZYZXliUFVVOTVU?=
 =?utf-8?B?UEM3djVhMzhlRmU0VGZGUC8zSURpSS9VQ1ljVmdLYkpRaUhOUGhIS3hoOWhi?=
 =?utf-8?B?SjVDSDdsbERET3ZJNGdma01PMlNGbWN3eG41WUEzczBEL0VGakJwY0VtR1Vu?=
 =?utf-8?B?eWFXcDc5M2pZYzkySGZQczdtQTd4ajZsNytOMkQ3OHZwWEo0Vmp6Wk5LTVVv?=
 =?utf-8?B?K3NKUHYxUUlwRG5nR1NqQWpMSUNMTFJzaGVPMEZGNlFVcmVOSlBoUVRJRTZy?=
 =?utf-8?B?UGRYTmphSlU1WkxJT2NPSzI5RVAvMVFEUzdEVTgwbis1SnVsMTVyZ2dJeTdO?=
 =?utf-8?B?RFRLTi9LRnpGMHovUnJXTnpyVjZmUFZ5V0JXUUdMbHYzaUZ1c1RKSTdxMGht?=
 =?utf-8?B?Tk5QK0QzZ1VUZWxHeFBwdjFqZFZZVDdMcjU5WEV5b1hMWkZDOTRjRmNXMnlh?=
 =?utf-8?B?WUZESWxnZDhKUHoveE9yTytRM2FlU1lUc3JZY2hyc0F2cnlEQjFFR1U4SHFu?=
 =?utf-8?B?SXVvTnVoMzdNdkVZRjNTMXUzbUFMLzRwQldVQWRpUEhvYmx6ZjZSOTRsaDc5?=
 =?utf-8?B?OUp2TEJDMnB5eFQwT0lGMFdsU2JNWG15YWRPS3cxRUdKVG9yQm9iZjlXRzRi?=
 =?utf-8?B?c3VCN0dXMC83Y2M0ZHNFSHJqVm9IK2tiSldNWGZyT0lhL0IvZmRUTWpEaXlj?=
 =?utf-8?B?YUpwTk9pNTBDazZaQkoxeVJYNHRaWllhMWtzQkgwOUVMeFFCKzdnMzd4OUJ3?=
 =?utf-8?B?eWtFb0JiU0tkNVlOTEtJTk1KYitIVWNzeDZOdHYrYXF3RmlKS0Z1aU5INXJ6?=
 =?utf-8?B?ajcwRFJZS0hHY2VPaHczL2ZBQTRDQ1ovOUlmYVYveXJ3cWNJMGUzN3RBei9r?=
 =?utf-8?B?N29aMXV1dkF6S1BldHlaWHhKYmRFM1pxS0FjREd1a1JxeTBBbUpjRjRFYnRI?=
 =?utf-8?B?cDl4a1hodXFFbW5WLy8vZXVITUtMUllURWNpZFpDeGZVNlhXakpmNjJhWVFk?=
 =?utf-8?B?VTYyeFVZSjRFZ0FYc1Q5M2tZdG1LNHBaMWlhVkVyakhqcnh0VFNSSGhNOUdz?=
 =?utf-8?B?VGFadnpyRU1zVlM5RnF0VFh1dVhIRkE4WGFDcmNhMmVKYVp6MTB3K2Y1VUNx?=
 =?utf-8?B?TjRNbVJYT21BOXBpMSt4OW1tR1lNMEsxbEVzQUR2Ti9YOExTdkJMeTZuYVZU?=
 =?utf-8?B?UVFFN1l6aWpXZEtBZzZsbi9NeGFZNTRJSXFVME1XaXVybityTVpra2hrTVJo?=
 =?utf-8?B?MGF5dGg1cjdUQUJYZFpyWG5oME9LenVOTWdDQXRMQ1dOMmdPY0FoVnBxR0Ri?=
 =?utf-8?Q?06IlOD+8DTIAL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bWZFeCtLQ285K0JjWnFKY20rR2dpdUN6Wk91dVpFMVdLSXhEVGU2TVNKVVhF?=
 =?utf-8?B?OWhkVWdFTlRKS25rNUtobFlmY09IeDUvQnp1Y3RXUHJ3dVNIRWNWRXAwRlpq?=
 =?utf-8?B?MjJhZnB0TmVQZTBUdXVBcHNSZ2FRcGNzMHVjekdkY0ZjMmNDbVFNSFhMMElT?=
 =?utf-8?B?RlE0dXdBY0loL2pndnc2SHpFU1VJZnRVRTNQNzlNK010RTRaVGZaalE3VWxB?=
 =?utf-8?B?Z2tXY1lzdTdJbVFZeHZzTjVHTlJMUHFrRkhBdVc4M0RQYmJLZmFPWS9ZbTFX?=
 =?utf-8?B?dXExaDB5Vml1ZVhkVUNpdkFrZVJ3bm1XTkZyMjFWMGJCcElmYk9qQ1RKMmhX?=
 =?utf-8?B?dWRmQTJzRU5mcjlRME9xQ0RvKzIrQkdxL2hEcy9qQy9lMTBsYTM5Qm1Va2s0?=
 =?utf-8?B?UHlWSXBxVHQzZkUybVViOEUrU1N2NENDOWEzVlpLYWRLN09NMGRTUExkaHBQ?=
 =?utf-8?B?Z1J4TkUrSmY2TTNjcmZyNVpRcGdIU3BhclF0U2FqVU5WVnB4TzQrcjlJV3ZZ?=
 =?utf-8?B?RWxqemZQNDQrSU1WdVpTUC9kQ292MXhLTEN6MVZxaEt0TTJkb3B5YXlsN2xD?=
 =?utf-8?B?ZXF3YjhsTWpROVptY3BoZUUwMnJOQXlqN090QUxkZm92ekNXNjgwT0NpQmNk?=
 =?utf-8?B?TTd5ZmVsN1Mxd2pHTFMxWXl4eis4SU8veVRXTUorSmJNdmlqeVIzYnplemll?=
 =?utf-8?B?d0pHcXFnWm0rWEZDQUErLzNGeHM0a0E2ampIdlVxeC9JT3E1RUVyZERRaDRq?=
 =?utf-8?B?Zmt6bkZLeWpBbGRhMHI3VE93c2dySWdTZjh4cnArb21ra1ZEcUlJcVZpU0pN?=
 =?utf-8?B?V2wvWjFMM0xqK1ZLRmFITEtWdzZud0NBZk9IdENnYUx4Rk9uL1Mvd3hUNUdo?=
 =?utf-8?B?eWpWSmMxNldNUUphaEpaeWVEZ3NUQkltZzF3dFZwMWVkbUNkdGlJM1BZbUNZ?=
 =?utf-8?B?WUd5dk9CSXF5NE16d25ZbWJVbnpBZDVEWmpva3J5M01NUzNMUWo0ckpzSGZR?=
 =?utf-8?B?VW5JazA4MHNFeFZicmhXMkpvbTBPVGxwRlpncW1pbFhSOEd5YlpiSHI2VVZv?=
 =?utf-8?B?TCtrVEhCVnhQK2xJUE93YVJKaDNVSm5lVWpFcUdDLzV2ZFdiUlh6SzNkdmdQ?=
 =?utf-8?B?aGptQUZHeHFTaVpjMWd6OVlyQWMwRHdmTjRqRWhTcXRHdUJxMXdCelVISXFF?=
 =?utf-8?B?dVd0TG9zK2tqVjJLQno0UHhTbWw1b2JvSHF1Nlk1dmZGT1JTem1wTEdHWW81?=
 =?utf-8?B?cUhFendQK2prR3hRcFJaMkI5dE4rNFAxeHMvdjZIMEdmeWNXZmJncm5teHlK?=
 =?utf-8?B?VzJLeHlVb3RDUXJPMWtQMjlKSVpYTmpuZkZSbUhIVTlCa2lzSVp4bXFvWlM1?=
 =?utf-8?B?RjdkbVdnSVFsRGhVNGZXaEpZQXJiM2JOSzNtUTk3L3hVOVFjWktsWE5LSFdl?=
 =?utf-8?B?V0RDNGpNY3J0b1hMS1c1aTkxUE52M0dFcW1HZXY1bVk4MTJmNWh2NGR4SVlV?=
 =?utf-8?B?bDBGbk9iZ3JpL1VocW5HZHNXYlJ6UER2b2p1UURoVUdsdGFUbU16TzRtZDZ2?=
 =?utf-8?B?KzB5dGVYMFZsSVMzVEJ2ZGcvM0pweEMwY0RMb3lqVUc1bmtTTWJ3ZFE5WUIr?=
 =?utf-8?B?dHpMRmZUbHRkYzhvZGhpRmh0UUwva2NKZDRpeXI2UVVtSUkwNmJ1R2lHbGFk?=
 =?utf-8?B?eE1CNTM0K1NNTk81RUtRdnF1WFIrV1QvTUFXZ3g4SVN4aVk4cjNWeDEwdGVy?=
 =?utf-8?B?b1VhYXBCZ2hUNGttS3BLMDhBY1didVl1M2ZLYTVubXRaN3M0SFF4ZS9HZlBa?=
 =?utf-8?B?NWdoRTl2ZUFPVnJkZW9KdHladndsR0pBU2RjcVBLOEhnTWUrbU9mZmlreGN6?=
 =?utf-8?B?N0lxWG83RWhGb2tIcG5KRmJxOEpFVFhIWEZTZms1UitCSXhqQXN3VnBIT1Zs?=
 =?utf-8?B?RWdiZUZqUEZURzZGU01yaG5uV3NXa29sQmQrRzU0eHpiZldXTFB5N1JjajAv?=
 =?utf-8?B?TlRjK3RXZTNoZUxDa2Z3b1BYUDQ2QlpvcXlESU5vT003UGhGNjVWOWJhN0RV?=
 =?utf-8?B?QUNrRno0N3ZxSWZyT0NzbzBscUYvMWs0Rk5RanpTeG1maUpZeFBsRmVQYWlY?=
 =?utf-8?Q?1ATHSUVyZhHuXK1l/sJNqSG8j?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f4c156a0-118e-44f7-7667-08dd30b4af42
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 13:51:15.1792 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4ebwWV+oyS5LiDP404CHufPeqoh6v3AvBr5bD0qonv4C5fb9PHc7U6pbgQJrytgU
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4099
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

Am 09.01.25 um 14:41 schrieb Tvrtko Ursulin:
>
> On 09/01/2025 13:07, Christian König wrote:
>> Am 08.01.25 um 19:35 schrieb Tvrtko Ursulin:
>>> Now that the scheduling policy is deadline based it feels completely
>>> natural to allow propagating externaly set deadlines to the scheduler.
>>>
>>> Scheduler deadlines are not a guarantee but as the dma-fence 
>>> facility is
>>> already in use by userspace lets wire it up.
>>>
>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Danilo Krummrich <dakr@redhat.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Philipp Stanner <pstanner@redhat.com>
>>> Cc: Rob Clark <robdclark@gmail.com>
>>> ---
>>>   drivers/gpu/drm/scheduler/sched_entity.c | 24 
>>> ++++++++++++++++++++++--
>>>   1 file changed, 22 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c 
>>> b/drivers/gpu/drm/scheduler/sched_entity.c
>>> index 98c78d1373d8..db5d34310b18 100644
>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>> @@ -410,7 +410,16 @@ ktime_t
>>>   drm_sched_entity_get_job_deadline(struct drm_sched_entity *entity,
>>>                     struct drm_sched_job *job)
>>>   {
>>> -    return __drm_sched_entity_get_job_deadline(entity, 
>>> job->submit_ts);
>>> +    struct drm_sched_fence *s_fence = job->s_fence;
>>> +    struct dma_fence *fence = &s_fence->finished;
>>> +    ktime_t deadline;
>>> +
>>> +    deadline = __drm_sched_entity_get_job_deadline(entity, 
>>> job->submit_ts);
>>> +    if (test_bit(DRM_SCHED_FENCE_FLAG_HAS_DEADLINE_BIT, 
>>> &fence->flags) &&
>>> +        ktime_before(s_fence->deadline, deadline))
>>> +        deadline = s_fence->deadline;
>>> +
>>> +    return deadline;
>>>   }
>>>   /*
>>> @@ -579,9 +588,12 @@ void drm_sched_entity_select_rq(struct 
>>> drm_sched_entity *entity)
>>>    */
>>>   void drm_sched_entity_push_job(struct drm_sched_job *sched_job)
>>>   {
>>> +    struct drm_sched_fence *s_fence = sched_job->s_fence;
>>>       struct drm_sched_entity *entity = sched_job->entity;
>>> -    bool first;
>>> +    struct dma_fence *fence = &s_fence->finished;
>>> +    ktime_t fence_deadline;
>>>       ktime_t submit_ts;
>>> +    bool first;
>>>       trace_drm_sched_job(sched_job, entity);
>>>       atomic_inc(entity->rq->sched->score);
>>> @@ -593,6 +605,11 @@ void drm_sched_entity_push_job(struct 
>>> drm_sched_job *sched_job)
>>>        * Make sure to set the submit_ts first, to avoid a race.
>>>        */
>>>       sched_job->submit_ts = submit_ts = ktime_get();
>>> +    if (test_bit(DRM_SCHED_FENCE_FLAG_HAS_DEADLINE_BIT, 
>>> &fence->flags))
>>> +        fence_deadline = s_fence->deadline;
>>> +    else
>>> +        fence_deadline = KTIME_MAX;
>>> +
>>
>> That makes no sense. When the job is pushed the fence is not made 
>> public yet.
>>
>> So no deadline can be set on the fence.
>
> You are correct, the push side of things was a mistake a laziness that 
> I did not remove it from the RFC.
>
>>>       first = spsc_queue_push(&entity->job_queue, 
>>> &sched_job->queue_node);
>>>       /* first job wakes up scheduler */
>>> @@ -601,6 +618,9 @@ void drm_sched_entity_push_job(struct 
>>> drm_sched_job *sched_job)
>>>           submit_ts = __drm_sched_entity_get_job_deadline(entity,
>>>                                   submit_ts);
>>> +        if (ktime_before(fence_deadline, submit_ts))
>>> +            submit_ts = fence_deadline;
>>> +
>>
>> Yeah, that won't work at all as far as I can see.
>
> It works from the pop side though.

Yeah, but only partially.

>
> When job N is scheduled, deadline is taken from N+1 and tree 
> re-balanced. At the point of N scheduling N+1 can definitely have a 
> real deadline set.

The fundamental design problem with the fence deadline approach is that 
it sets the deadline only on the last submission instead of the first one.

E.g. unigine heaven for example uses 3 submissions on a typical system.

We would somehow need to propagate a deadline to previous submissions 
for this to work halve way correctly.

> What does not work is for queue depth of one. No way at the moment to 
> "bump" the entity in the tree while N is waiting for submission 
> because we cannot dereference the entity from the job. (I had that in 
> v1 of the series and realized it was unsafe.)
>
> I (very) briefly though about reference counting entities but quickly 
> had a feeling it would be annoying. So for now this patch only offers 
> a partial solution.

Nah, please not.

Regards,
Christian.

>
> Regards,
>
> Tvrtko
>
>>>           sched = drm_sched_rq_add_entity(entity->rq, entity, 
>>> submit_ts);
>>>           if (sched)
>>>               drm_sched_wakeup(sched);
>>

