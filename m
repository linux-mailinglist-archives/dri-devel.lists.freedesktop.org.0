Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 49F55AD587F
	for <lists+dri-devel@lfdr.de>; Wed, 11 Jun 2025 16:21:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E378910E672;
	Wed, 11 Jun 2025 14:21:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="s9UumqlB";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2055.outbound.protection.outlook.com [40.107.223.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1024510E672;
 Wed, 11 Jun 2025 14:21:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k2Ro94p2ndPziFX74OhkgFeGywues5A9AiQzepzaSRQuIvoV5LhaSRS/YnSMRkZrHb/YBN8dzZ4YhOYFZaEU6vLDYYxI9X9oj1fXzaD4cyBZ3OdCwWtua2hv1OeTYiPsq4xSYxMxH4YqBfxQM25Szb7jWt8xEpJThE2IlQibZCz6kqmcYHkWUdIcUbLrU2bJJzUKwKRpvu9SQ4OETPbxD9mJ2GrdrreTYyYCNsL6VeBJRLiT2zaSc1Bs3KV0a4dFw9TIz7R086Wn4ZIbjE4Jd9LbFbEuu1MMDNtMIOHkPfqm32UqQSRp/U4lHtUASBR8oqKGaf7BsRlbb3zAqWzLpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oIw2NCRIqzuy2p72AgmpBRZLLuzcO57hWDo4ifr68Kk=;
 b=nWAu20VgyXliZX45IsHUnSG4ubgCDCGWs4DNY7rPp9jc94EcgPE92bAJbXdXwYBWz0QkFsKgGuXKI5+pqa5BBV+oZ0YeP3SpkkE75LTo8g2jdJuuQHnAk5EBL92FXj+S3WqBX00RJ/NP6bwodEv8gYqrRiYuw9qMmS6FZhQWTrzBL4VNTey+hU82vJcmbkgEJzqLR4zskhSH3Hwm5x55HX12Nu8GKJ2wofk0YBW37R4M5xGTv47DAD9qjmSydPZPxoU7lT6f1fmZFFRwYhxD1Ru0kx5PYE71HAJQzdD2H2WCZUe1j83PAlERiCGKnzV0cT0lc6Ya/3JRa2XrL8g93g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oIw2NCRIqzuy2p72AgmpBRZLLuzcO57hWDo4ifr68Kk=;
 b=s9UumqlBgmVj71xtipt5JxBRFLWiIUBRe39q2tR198KTgTs/OuM5OMGIdjiYiPwewTRE5yBhSgEp2tUkIG92UdrPw1NQO6DqtGKZJkz/koMWyKqYuKHvD3wKt9NoQO5rTPMSh0vWBfy2ox7SVlz5tF9rcxgbNvGUks/5zGr215w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by LV3PR12MB9167.namprd12.prod.outlook.com (2603:10b6:408:196::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.22; Wed, 11 Jun
 2025 14:21:47 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8722.031; Wed, 11 Jun 2025
 14:21:44 +0000
Message-ID: <b57b6549-7dbe-45fe-ab8e-4232041ec1a5@amd.com>
Date: Wed, 11 Jun 2025 16:21:39 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 6/6] drm/syncobj: Add a fast path to
 drm_syncobj_array_find
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, =?UTF-8?Q?Michel_D=C3=A4nzer?=
 <michel.daenzer@mailbox.org>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>
References: <20250611140057.27259-1-tvrtko.ursulin@igalia.com>
 <20250611140057.27259-7-tvrtko.ursulin@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20250611140057.27259-7-tvrtko.ursulin@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MN2PR10CA0032.namprd10.prod.outlook.com
 (2603:10b6:208:120::45) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|LV3PR12MB9167:EE_
X-MS-Office365-Filtering-Correlation-Id: 86da0afa-f9e2-4cc2-95a8-08dda8f34ab6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NkpQWDBSRWVHb1RyRG9IOHVxeXNOQ0FPZXNoLzhPQjhqOWJUK1l5eEhjRjRC?=
 =?utf-8?B?ZklFZDRCZTBYR0xoWUIreVlDSjBBdDlvanZHeG5Jb3EvbC9JMDNvazVRQ2ZF?=
 =?utf-8?B?SitSOGxycTA5ZnYzc2FkZGRhZzRvK0YxWmlZaW1QMFBna1pneG5OOUp0T3RT?=
 =?utf-8?B?YlhxSVU3bDNPeGovWkdZZ0h3OXczazQrVktYSDlBd0ZnTnpHMURMeTlVaU5p?=
 =?utf-8?B?RmtSbXZlY2RBR21vTkxlM1ZJRTFzYmJlVFpCRTZxUUIwa28wa25xSjdPK090?=
 =?utf-8?B?VnFMR2xaQWNiaG1FZ2UxRkNXMlpvOWUyU01tTGJJdWVWblJwRVVGLzFWWG5K?=
 =?utf-8?B?YVJYbk5IL1FNUWRHMHBla1dVOHRpMzVKN2pTQmF6RmZoNThBajh2aHpVZFl6?=
 =?utf-8?B?ZFprNDh6RXFzTjZaVXBmdGl3VG1sVURyTWRsMENWdXByREZpdFZuTUdkV2px?=
 =?utf-8?B?NTZHVlBLZnBKb2FOQWN5c0lmSXRvQ2dmU2txZVRJUUVTemt3eDJEMTc2Sjdn?=
 =?utf-8?B?eFRyU2VHalRIR1ZPUVVFbTlPY21YNEhNMVp0UHhVWVhwWE9UdGFBMkN2Tjg0?=
 =?utf-8?B?RDNQYkt2S3YvZXBQb29PdG1wRUt1UWU0bU9La2NSK0loUVlTQVM4b2F3bnZD?=
 =?utf-8?B?WUJrdkhjZ3ZFT0x2Y0toelpZNmZrTzk0WnJ5NEQzYXlZMlNTemtVanRpYyt3?=
 =?utf-8?B?Z3VRcjhJa3VmY25qVWhQNHZMMzRoQmVhWkYvUjZmeWNnVjVaMUdaRTRHZUJj?=
 =?utf-8?B?RUZFbEZ1QlpqM3pGQ3lzVXEwZm5ZL1FqRVl0OXdIcEp1N0RZMFlud2xDMW5r?=
 =?utf-8?B?NFptMERrVmM2TnNFeXFzNXVnSGhnNFU4Z1g5K1BBcGg5N2orbndLd1lzRUJW?=
 =?utf-8?B?UzF6Z1UxbWxWMDM4a1ZuYzJ1YzQ1MWlsK3c2NGxtYzhoUjhsNVEyK1hjZVQ4?=
 =?utf-8?B?L1Zhc3RoaWtYS1dYb2hqSi9WK3VWS1NGSG15Qjc0NUJoeFMvMExGUVQ3MEYy?=
 =?utf-8?B?OTFZSjVYc3hzb2YxbDRRcEJJZlNxaHZRdHF1dXBWdGNRS1lxenE3RHRkR3NY?=
 =?utf-8?B?SFRmcUs2YTFjQVlIamo1dTJWYllWZG05Y2l4VUZNUFY2cU9oNWUzSnNSclBJ?=
 =?utf-8?B?MDFmNEsrL2ZKWjEzb1J6TGxxT2F1THo4RUxvOENES2J2TC9LTmVKb1JFZklq?=
 =?utf-8?B?YkN2U2hGWnh5WkVkU1RrUUl5Y2x0NlU5a1YyV0NqYmQxeTRIVk9scTF4VS9p?=
 =?utf-8?B?YnorWmlEc3Jnczc3aFNOQUlFN040ZzVQKzNncXU5S0JlWldTMktncXNibDl1?=
 =?utf-8?B?NCtRWGR4TzZLcHoxdHVhTWVvME1LREFIOHdOTEprWTFuamdHakZ2ZWV6YXBv?=
 =?utf-8?B?Tk93aytIQnU5WVBmMG1xMzFBc3hZeWExa1JxaFg2R2Uxc2dLVUhHU2xUSnZM?=
 =?utf-8?B?VUJ0ZGplMFRvbFlHRWRjb3M0cExOZlNKcmtuUFRPZUhkQ2pYYjkvQlNZSm53?=
 =?utf-8?B?akJoeS9ydzd2SHFuR25Md0xyUjJ1RTF4aGF1RUZCSnl1YThuTy92V0NrcGRC?=
 =?utf-8?B?NDdqR3pZU1kzNTJqMFIxUEYvckUwS3F5MnVBRFZVNjhyUjg4c3lLVFY5d3dx?=
 =?utf-8?B?TG4xQTNoZnd6eXJoUG9WM2V4OGdEVCtrUEFkQ0NSVFJJNnBhOHIyZE9veXFJ?=
 =?utf-8?B?TTJNNXM4T1BDaERjZlBqMi9ubHlZR1o4Yk9YVktuRlhkNVZWRGtPT2d0R2pM?=
 =?utf-8?B?NGIxR1V0Ty9RNlNzQWRpZ0o2OVMrS0dmNk9nZmxqTDF2UnY2elBLNm5OZC9P?=
 =?utf-8?B?b09YTGdzV0pEaFhMaFhya1MydlVpNzJrOG1URjBEcWlWZmxCMUdycFV2OXdw?=
 =?utf-8?B?ZVZid3FmekNNeTk4RmgyL2Z4Skcremt4NFRIWC8zeUtITzF4YmRiSndmNUxy?=
 =?utf-8?Q?AcGPfW2NyxE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?and3eTcrb0VQNGsxMlpmNlh1TlliQnZnaEs4azFTQlJoaEFtY05QT0NPbmV2?=
 =?utf-8?B?VThHZm1zQTNQR1VCQVBMNm5yMUtkdzA1WXhCblRxQUt0OXVQeW1pTzAvMnFW?=
 =?utf-8?B?SkxOQW5IVVlENENFd1NXMDE0Y0pFbFlHenZxbGlyQi9PcHU2N0svV3d6NllB?=
 =?utf-8?B?ZDlFNmRtL1h1QnF4WlJsRkFobkd3NCtPblB5RUMxQTMxZnU1U3d3WUYrbzlZ?=
 =?utf-8?B?UzFuVTI0U1VnU0dwNEZEZjBFc0F6bUtZOHk1NG5JUllZS2hiNUdJSjYvejZS?=
 =?utf-8?B?VDVFUXAwUkZOSC9JVW5PeWZpWHA2bVN2YlNOWEM2VWZqamZSU1hEdWtaSXVV?=
 =?utf-8?B?MjJKaDRYQTh5bW1FK2lZNW1sTXAwWGZvMXBaZS8xUzRtVUtHVkJsWXdKR0p1?=
 =?utf-8?B?VjdKSHNabE1VVUdHOGdEV010NFAwLzhhQ05qK1JuMm5QZ1hVZG9HTGlRMU0v?=
 =?utf-8?B?T2Ztb3dBZThGejdXK3BQVGpuNnc0YkQvOGIyeng2VlZrYzVQelJySDllcWZR?=
 =?utf-8?B?NWgrYTZqU29ONHRscW1lMXFrcGp6MkkwQUVuRktFeVVVMVllS25Qbmhkelha?=
 =?utf-8?B?RTJzNGE0ZDZWWFFxRENCNXdCSkRHQ290RTlHVzN1Qkw2cnV3MGdYKzN6MlVF?=
 =?utf-8?B?a0JSZ052WUx5Y3YyeWxSY3NSR1duRU12RFhnaE9jd3FReHBVR1UzN2xFNGdD?=
 =?utf-8?B?V1U4Q2tSUUROTlJSdmUyRGxWdEZtcWUxa1M0SzF4OWVJQVJvODViVG9QYUht?=
 =?utf-8?B?MmRSMi9ZWEFsMjNBc2xpYUFkNTlnUWxDOUp5bjJ1L2YzeDkvL3hnZktqNmhK?=
 =?utf-8?B?SzdPeDFpRThXY0RLT1VxQ3kvc1F6Y1BLcEVuNEZaUUViZGxhQ0NXZUVjOSsy?=
 =?utf-8?B?WVJ3RzBkTkpYN1QrZWlvTHlIMFNlRGJobHVNSWEwSXM4bHFNNGthVlNBdW1k?=
 =?utf-8?B?VGFmY1hidmh2M0VSREJQZU1NS1ozenA5NllWWnhab01vaGFxYWxEeVdHSkE4?=
 =?utf-8?B?UTh2b1RsWUFJaEttMTVEZ2NCYU5BMnIvV3JwSlFUZVFMRXd3amdEQk9rWk5x?=
 =?utf-8?B?RGhJRHMram9NNGNsd3pjS2dIS0V6Y2VXRDRzNWJnV3krOVBUWXBIcVFmWERr?=
 =?utf-8?B?NXN3UkdyNi9pQWVBQnJmbUl6UlV5Q0lYd2J4SmU1eVFkb3ViRGF1VFRjUWNo?=
 =?utf-8?B?Wk0wTUg0NXJPQU16WHBZTDNSVUxZa1VIQzRRWTEvUjlEa2hlSTRiR0JlTjZU?=
 =?utf-8?B?dE8vNmYyVU1PNUt2Ynk2N0Ntdnh3TzBBQ0NXeEdjc2lJendXWmY4c0pVRHVP?=
 =?utf-8?B?UG1hQVQ0cEh5UUhYUU4waUM0NVRGZjJYRHUwbTV3NCt6MVdHUXFoOWd2djJo?=
 =?utf-8?B?T3RhR0kvOTBLNmUybjNWZGUxMFhSUWZ5bVhaTlJMYngyTXBHWGFnRWxPVjht?=
 =?utf-8?B?RE5tUFVrVmhUbG5naTRJQndhcHlTMlNtK1FTTWRhazBmdkkrWUlJN2ppR2dJ?=
 =?utf-8?B?azd3UFlKaG1TdzhwdWwzenBZNnN1ZG9wUDNaZzduMEZ1ckxGSHFQcWZ1bHhi?=
 =?utf-8?B?Sks0cmp0aHVkRERMWXpEeENmT1FnL2dqSkNubElyU3laVXdxQkFoeTlJMXQ3?=
 =?utf-8?B?QUJHdW14N2pKc1c1SEZiWExhR0JQZTRmY1JsWmtzR1dzQzhNZzlwRWpZR2tq?=
 =?utf-8?B?dnVwbExzZmhKWHNUYTJGc1FOeG1BYUpSeTZxWDR6SitNWURic0JXSjBDNWFR?=
 =?utf-8?B?b1U1WjdUYmIrVllIRTZocTFCR1hEMEkrU3JzdGdMWGNRYm94RXhQZ0c5aUVl?=
 =?utf-8?B?UHY1R1pMb1BwQ2g2ZHFKMmpHYU5YellOTy9kK3BCdG9mY29ScCtDY2FJb2xx?=
 =?utf-8?B?RWdPUFhid3pCTmsxbHN0a2ozeTYvL0tMTzluSDQ4Q3EvMnZaOVdPMTc4RHEw?=
 =?utf-8?B?WXNjcXZncEZnYnZ3NGd6SG9zdGRIWmlrSzN5aXlRc1dxVDhWNjNBaGRvdUtK?=
 =?utf-8?B?WS9QVzBWWG9HWHRpcGtiZzJpZzNqUjQySnJXeVA3Vkg1cStweWFmbldvTkgr?=
 =?utf-8?B?MG5ENmlBTlJranZJZm1rN0FQendFU0UzRWcyZ2huT29oWWU0L0krTDRTL1Nu?=
 =?utf-8?Q?8Y/Zx9u0XaInIztjEs8/0zrxU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86da0afa-f9e2-4cc2-95a8-08dda8f34ab6
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Jun 2025 14:21:44.3596 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4xoeE3Wwvsa7jAx/xMbsYRjMkzIxsL69AgbyKcOUvHRcDwDk78NTQmw6ZhUt220n
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9167
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

On 6/11/25 16:00, Tvrtko Ursulin wrote:
> Running the Cyberpunk 2077 benchmark we can observe that the lookup helper
> is relatively hot, but the 97% of the calls are for a single object. (~3%
> for two points, and never more than three points. While a more trivial
> workload like vkmark under Plasma is even more skewed to single point
> lookups.)
> 
> Therefore lets add a fast path to bypass the kmalloc_array/kfree and use a
> pre-allocated stack array for those cases.

Have you considered using memdup_user()? That's using a separate bucket IIRC and might give similar performance.

If that is still not sufficient I'm really wondering if we shouldn't have a macro for doing this. It's a really common use case as far as I can see.

Regards,
Christian.

> 
> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Reviewed-by: Maíra Canal <mcanal@igalia.com>
> ---
> v2:
>  * Added comments describing how the fast path arrays were sized.
>  * Make container freeing criteria clearer by using a boolean.
> ---
>  drivers/gpu/drm/drm_syncobj.c | 56 +++++++++++++++++++++++++++--------
>  1 file changed, 44 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_syncobj.c b/drivers/gpu/drm/drm_syncobj.c
> index be5905dca87f..65c301852f0d 100644
> --- a/drivers/gpu/drm/drm_syncobj.c
> +++ b/drivers/gpu/drm/drm_syncobj.c
> @@ -1259,6 +1259,8 @@ EXPORT_SYMBOL(drm_timeout_abs_to_jiffies);
>  static int drm_syncobj_array_find(struct drm_file *file_private,
>  				  u32 __user *handles,
>  				  uint32_t count,
> +				  struct drm_syncobj **stack_syncobjs,
> +				  u32 stack_count,
>  				  struct drm_syncobj ***syncobjs_out)
>  {
>  	struct drm_syncobj **syncobjs;
> @@ -1268,9 +1270,13 @@ static int drm_syncobj_array_find(struct drm_file *file_private,
>  	if (!access_ok(handles, count * sizeof(*handles)))
>  		return -EFAULT;
>  
> -	syncobjs = kmalloc_array(count, sizeof(*syncobjs), GFP_KERNEL);
> -	if (!syncobjs)
> -		return -ENOMEM;
> +	if (count > stack_count) {
> +		syncobjs = kmalloc_array(count, sizeof(*syncobjs), GFP_KERNEL);
> +		if (!syncobjs)
> +			return -ENOMEM;
> +	} else {
> +		syncobjs = stack_syncobjs;
> +	}
>  
>  	for (i = 0; i < count; i++) {
>  		u32 handle;
> @@ -1292,25 +1298,31 @@ static int drm_syncobj_array_find(struct drm_file *file_private,
>  err_put_syncobjs:
>  	while (i-- > 0)
>  		drm_syncobj_put(syncobjs[i]);
> -	kfree(syncobjs);
> +
> +	if (syncobjs != stack_syncobjs)
> +		kfree(syncobjs);
>  
>  	return ret;
>  }
>  
>  static void drm_syncobj_array_free(struct drm_syncobj **syncobjs,
> -				   uint32_t count)
> +				   uint32_t count,
> +				   bool free_container)
>  {
>  	uint32_t i;
>  
>  	for (i = 0; i < count; i++)
>  		drm_syncobj_put(syncobjs[i]);
> -	kfree(syncobjs);
> +
> +	if (free_container)
> +		kfree(syncobjs);
>  }
>  
>  int
>  drm_syncobj_wait_ioctl(struct drm_device *dev, void *data,
>  		       struct drm_file *file_private)
>  {
> +	struct drm_syncobj *stack_syncobjs[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
>  	struct drm_syncobj_wait *args = data;
>  	ktime_t deadline, *pdeadline = NULL;
>  	u32 count = args->count_handles;
> @@ -1336,6 +1348,8 @@ drm_syncobj_wait_ioctl(struct drm_device *dev, void *data,
>  	ret = drm_syncobj_array_find(file_private,
>  				     u64_to_user_ptr(args->handles),
>  				     count,
> +				     stack_syncobjs,
> +				     ARRAY_SIZE(stack_syncobjs),
>  				     &syncobjs);
>  	if (ret < 0)
>  		return ret;
> @@ -1354,7 +1368,7 @@ drm_syncobj_wait_ioctl(struct drm_device *dev, void *data,
>  						 &first,
>  						 pdeadline);
>  
> -	drm_syncobj_array_free(syncobjs, count);
> +	drm_syncobj_array_free(syncobjs, count, syncobjs != stack_syncobjs);
>  
>  	if (timeout < 0)
>  		return timeout;
> @@ -1368,6 +1382,7 @@ int
>  drm_syncobj_timeline_wait_ioctl(struct drm_device *dev, void *data,
>  				struct drm_file *file_private)
>  {
> +	struct drm_syncobj *stack_syncobjs[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
>  	struct drm_syncobj_timeline_wait *args = data;
>  	ktime_t deadline, *pdeadline = NULL;
>  	u32 count = args->count_handles;
> @@ -1394,6 +1409,8 @@ drm_syncobj_timeline_wait_ioctl(struct drm_device *dev, void *data,
>  	ret = drm_syncobj_array_find(file_private,
>  				     u64_to_user_ptr(args->handles),
>  				     count,
> +				     stack_syncobjs,
> +				     ARRAY_SIZE(stack_syncobjs),
>  				     &syncobjs);
>  	if (ret < 0)
>  		return ret;
> @@ -1412,7 +1429,7 @@ drm_syncobj_timeline_wait_ioctl(struct drm_device *dev, void *data,
>  						 &first,
>  						 pdeadline);
>  
> -	drm_syncobj_array_free(syncobjs, count);
> +	drm_syncobj_array_free(syncobjs, count, syncobjs != stack_syncobjs);
>  
>  	if (timeout < 0)
>  		return timeout;
> @@ -1529,6 +1546,7 @@ int
>  drm_syncobj_reset_ioctl(struct drm_device *dev, void *data,
>  			struct drm_file *file_private)
>  {
> +	struct drm_syncobj *stack_syncobjs[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
>  	struct drm_syncobj_array *args = data;
>  	struct drm_syncobj **syncobjs;
>  	uint32_t i;
> @@ -1546,6 +1564,8 @@ drm_syncobj_reset_ioctl(struct drm_device *dev, void *data,
>  	ret = drm_syncobj_array_find(file_private,
>  				     u64_to_user_ptr(args->handles),
>  				     args->count_handles,
> +				     stack_syncobjs,
> +				     ARRAY_SIZE(stack_syncobjs),
>  				     &syncobjs);
>  	if (ret < 0)
>  		return ret;
> @@ -1553,7 +1573,8 @@ drm_syncobj_reset_ioctl(struct drm_device *dev, void *data,
>  	for (i = 0; i < args->count_handles; i++)
>  		drm_syncobj_replace_fence(syncobjs[i], NULL);
>  
> -	drm_syncobj_array_free(syncobjs, args->count_handles);
> +	drm_syncobj_array_free(syncobjs, args->count_handles,
> +			       syncobjs != stack_syncobjs);
>  
>  	return 0;
>  }
> @@ -1562,6 +1583,7 @@ int
>  drm_syncobj_signal_ioctl(struct drm_device *dev, void *data,
>  			 struct drm_file *file_private)
>  {
> +	struct drm_syncobj *stack_syncobjs[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
>  	struct drm_syncobj_array *args = data;
>  	struct drm_syncobj **syncobjs;
>  	uint32_t i;
> @@ -1579,6 +1601,8 @@ drm_syncobj_signal_ioctl(struct drm_device *dev, void *data,
>  	ret = drm_syncobj_array_find(file_private,
>  				     u64_to_user_ptr(args->handles),
>  				     args->count_handles,
> +				     stack_syncobjs,
> +				     ARRAY_SIZE(stack_syncobjs),
>  				     &syncobjs);
>  	if (ret < 0)
>  		return ret;
> @@ -1589,7 +1613,8 @@ drm_syncobj_signal_ioctl(struct drm_device *dev, void *data,
>  			break;
>  	}
>  
> -	drm_syncobj_array_free(syncobjs, args->count_handles);
> +	drm_syncobj_array_free(syncobjs, args->count_handles,
> +			       syncobjs != stack_syncobjs);
>  
>  	return ret;
>  }
> @@ -1598,6 +1623,7 @@ int
>  drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
>  				  struct drm_file *file_private)
>  {
> +	struct drm_syncobj *stack_syncobjs[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
>  	struct drm_syncobj_timeline_array *args = data;
>  	uint64_t __user *points = u64_to_user_ptr(args->points);
>  	uint32_t i, j, count = args->count_handles;
> @@ -1617,6 +1643,8 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
>  	ret = drm_syncobj_array_find(file_private,
>  				     u64_to_user_ptr(args->handles),
>  				     count,
> +				     stack_syncobjs,
> +				     ARRAY_SIZE(stack_syncobjs),
>  				     &syncobjs);
>  	if (ret < 0)
>  		return ret;
> @@ -1653,7 +1681,7 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
>  err_chains:
>  	kfree(chains);
>  out:
> -	drm_syncobj_array_free(syncobjs, count);
> +	drm_syncobj_array_free(syncobjs, count, syncobjs != stack_syncobjs);
>  
>  	return ret;
>  }
> @@ -1661,6 +1689,7 @@ drm_syncobj_timeline_signal_ioctl(struct drm_device *dev, void *data,
>  int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
>  			    struct drm_file *file_private)
>  {
> +	struct drm_syncobj *stack_syncobjs[DRM_SYNCOBJ_FAST_PATH_ENTRIES];
>  	struct drm_syncobj_timeline_array *args = data;
>  	struct drm_syncobj **syncobjs;
>  	uint64_t __user *points = u64_to_user_ptr(args->points);
> @@ -1679,6 +1708,8 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
>  	ret = drm_syncobj_array_find(file_private,
>  				     u64_to_user_ptr(args->handles),
>  				     args->count_handles,
> +				     stack_syncobjs,
> +				     ARRAY_SIZE(stack_syncobjs),
>  				     &syncobjs);
>  	if (ret < 0)
>  		return ret;
> @@ -1722,7 +1753,8 @@ int drm_syncobj_query_ioctl(struct drm_device *dev, void *data,
>  		if (ret)
>  			break;
>  	}
> -	drm_syncobj_array_free(syncobjs, args->count_handles);
> +	drm_syncobj_array_free(syncobjs, args->count_handles,
> +			       syncobjs != stack_syncobjs);
>  
>  	return ret;
>  }

