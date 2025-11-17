Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8464BC630B9
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 10:07:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D883810E308;
	Mon, 17 Nov 2025 09:07:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="cAKn2WUP";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012004.outbound.protection.outlook.com [52.101.53.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABDE910E330;
 Mon, 17 Nov 2025 09:07:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K+ns3jnaYCP5jgZYrE1kaSTduLm4Ohf5+2gfzEElvxfuQpVX42TILPdno1e6T+yyHmEZTcI7CiZYi7tEMfEDbjdWbwB/zvW7/WSLfGIkV/Cnsx3IdFsi44uzOEVRBhmIfmEcMyvN0viPiXlhPhkvzJXnRc8j5sC6rHmFkPvbq3S7VVEI+x3+Zr3fNdlP4QTlhwEcz+aouxZ9cLBJFZPdEEGLPGt5IidfT5EsgBDV1mWmymFt0eL3kbH88le5PaF+vrA6Xf4lwsrWi5fxpqqisQ3ImbaPIAse3Q21whQMXJvjaXXG9McwvWOV7YwKBcPC2UDgtRxFtCbvoun0LDZnAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OkPATOVH4oy/lRVYchQTlXrs4Wa6ghd3UGYXKRc8CH4=;
 b=mXHJ7ClQUSYqeWvPhHGOJ1GWWj+tJLBoFS/b4WWtw+TIGsa0ZzJKaeOTVPIcxqm1H7iNadP6sMRRShCwhQzqce+1FPOjsUfv9oeEl4D/apM0DBLQjHS2mdzWOdyXINWvzgEvFhrvl8ITulBp3BkrAp9CJ1YApZmXLjGFi7qL6vIdXZPnuaoBspL0/DhvobwbdvN5ej56X9PASRsekvl01LqYBnO1QFByejbqvnxoC8zisDGEhQbfBUO+StWqNZTPRHFKLz3PxE18Waz2ditiKaq9NjlsSRTY6lSp8kAu0KEf5/vYrUx/Y3LJuVaFjLe52RHMbyKVy+p8zFPvQHSCFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OkPATOVH4oy/lRVYchQTlXrs4Wa6ghd3UGYXKRc8CH4=;
 b=cAKn2WUPx0LVXBY4BAtOXU4far3nF+SCWHczffFJxp0+9EZNPJq+X9sWmuqAycxPUIttrHrf9OvQpVozcdNtpJB6hTnhzeOg48rvT9C3jThtEsaXU6EMCdQPLTqJl6QhZXoKibZI/sLmdvsIsC5auTQeYjBfQGCYZNEmSX7aV98=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY5PR12MB6384.namprd12.prod.outlook.com (2603:10b6:930:3c::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.19; Mon, 17 Nov
 2025 09:07:15 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 09:07:15 +0000
Message-ID: <ff7a82a5-eeb7-4dec-861d-8fb861e79368@amd.com>
Date: Mon, 17 Nov 2025 10:07:08 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/20] drm/amdgpu: use TTM_NUM_MOVE_FENCES when
 reserving fences
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>,
 Rodrigo Siqueira <siqueira@igalia.com>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251113160632.5889-1-pierre-eric.pelloux-prayer@amd.com>
 <20251113160632.5889-13-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251113160632.5889-13-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN0PR04CA0069.namprd04.prod.outlook.com
 (2603:10b6:408:ea::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY5PR12MB6384:EE_
X-MS-Office365-Filtering-Correlation-Id: 68a6cb7b-d9cc-48ac-1d72-08de25b8b35c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cStwVzZ5bHFWK1dTT3RaZllJUzFBdDVOZXRuWkIxZW56TThLQ1IzR0Excko1?=
 =?utf-8?B?bHdYUnlFOFhtY3I5ZjJUVjdRY2kycm11RFhLL25ZV3g3MVBHUFZPZjRnTU9S?=
 =?utf-8?B?QkNhK05UZVE4NGF3MmlQQlJIUFJ4djRVbjRYYUt3SXpDNzc3dWpvVmdWclZ3?=
 =?utf-8?B?cXpyWFpBbStXTGpYeHhyNy92eEgwUWZEbUZyUFFBUDNmZkpmQjBHbWREZ2RW?=
 =?utf-8?B?RlFvbGZyNlNTMlpEa29NL0ZyODJQVGREdzVGUGJJa1NKa1NSOFlUWkJpSXB6?=
 =?utf-8?B?TDRCUnlqTm51MWR5MkQ2SHhRNnVSM3hIcm5aMk9IRVF1MDFEc1UzcjJGWkRL?=
 =?utf-8?B?S2FxZFd4T3A4elpRR210NHgwVlRKWk1vblkwclIvWWxTWngwbmgrKzBpUWFL?=
 =?utf-8?B?UDVHcWwwbG9XNDlseWVqSUQ0QW1randrVWoyYjhIMGFSRThId3IwUlFaZUFC?=
 =?utf-8?B?dkN2MjA1akg2YThKTmgyY0kxVG5XakR1clNGM1daZGRIZTRINm9vZExLODBD?=
 =?utf-8?B?NHNYY2d3S0hRWmtkQmc4Z2p6VG4vekhDK0lFZE93SGhVT1hqK0M4WXhtWlF5?=
 =?utf-8?B?TUZrN2dITmRqeUlJRjkxR295a3VKaGd1YzNhWlBGSkdEelpPMXFMQWE3ZW5J?=
 =?utf-8?B?Sjh5b2hPTVR1V3hPTzhHMFRiVXZhMC9EZDVhdUx5KzFpcDZVUXo5MDE2VGRN?=
 =?utf-8?B?NTNuTCtOWTlDTzZZV2tsdjFZcFNPV0tLWlpHSFNrWnU2OE91ZEwva1Z6dlZk?=
 =?utf-8?B?Sk1nemRhV2E1aUg2cWZJZSttSDhXSlpJYllkSEZ5UW9TU0dqUS9GcEM2Z0lO?=
 =?utf-8?B?ZjdsVzJhOXNFaWMwSXYwQWtLQkF3bVQ0Q1QxdGJMbGw1NUgvY0RPRVR1WDhE?=
 =?utf-8?B?UXRkV2dvaFo0MWtkSDNpZXorMmlQMDYvdFZRdXJrekJLb0UwRDRVWlduQWdt?=
 =?utf-8?B?UGt2VkpXVjk4aXhvZkNlSElsdkIwZGp1NFhUb2M3N3ZQbVdsVXB4MjhqSWpG?=
 =?utf-8?B?ZHpobUdEK3g2N1hEZ2RLSzZONmZTY0V5VDZjUm10OHpVSkJLU0JjK3pLZlJr?=
 =?utf-8?B?dHR0SFZuVURodzR0S2YwOEgra0VLQ1ZRanV3cmdjWVY0SmJCN2hGbEJEUkNk?=
 =?utf-8?B?YlZCdFdZTm5GNUdNdklySFhYajRiOTUxQ2tzWGxEbTFDOERSY1hsY3FidzBZ?=
 =?utf-8?B?d2YrVW5aL3h0UmdUT25YaXVsRGFVT0pWaWp2eG8xdTdSM2Y2T0F0TmRIZlMy?=
 =?utf-8?B?dEdkcW1jVGNBUjNLR1pJbFlkQytkajQvTk5VaE5EanNvcm5UNG5aS1Z4MklX?=
 =?utf-8?B?VXEwSk9rSXB5bG45WXdHM2Mzb1liczB5WldheU5ENnBFc2VWNzA3TXBHSGtq?=
 =?utf-8?B?dlNwZDBQSVFwTkYwdHhybGphL2dhYlJKeEtxUDBLK0tPYldaWjJTNlRPRGR6?=
 =?utf-8?B?MU1aN3pUM2IzaWFLWHpXQit5dGEvaTd5S1VoTFJRMk1OMmVpNitMa0E0R3V3?=
 =?utf-8?B?d01YSGhhQ01uR2RUcVdBdXVjY0lvSGtSRmkrZkZ0bXBsRjFtQTB2RXYvVk9S?=
 =?utf-8?B?SklTaTlHZlM1SkJMTGtPVUVMTmQyWUJvU3kyYy9VNE5EODZrTEhMVTNCN2Fo?=
 =?utf-8?B?UmNKcWNnYVpQQ1dzRFU4M25IZFcwUi9RRE1lM295cmVrM0pZNUF6NlBCTUJB?=
 =?utf-8?B?T3NNVndQU2xaZk0xVVJ3dVkrV3JPS0F4T0wvaFU0eEZKcHRsa3FNM2h6Y0NU?=
 =?utf-8?B?ZldKVzE4a0FWMHZZa2xMV2JobTNyYUE4WVlzYmc4UjVla3k5M0ZVbzdDOExa?=
 =?utf-8?B?bjlyb2YwenAybGxjeTRTc1l1Qmhnc2lFMXNBUkVBZklSRndjTitTSDFjakVG?=
 =?utf-8?B?R0FIb1FKT1JnMmllT0lpTjJXQnV6VGhITzBqbjh0cWViSmVpV0M4Zkpid3Ir?=
 =?utf-8?Q?DGXo4wNTyvpH6nqsiPn+ff2482aIdbfL?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGptQmpLa0tOWnAyaTIreEtjTTNyQ1ozTTZxVjM3N2Jmd3lJQ1dXeE11NmRR?=
 =?utf-8?B?S3grY1JBMEFhSVljVmZYeDgwbS9JWlQ2RkY5MG9FalIxUkNKUjBCZldSNUdW?=
 =?utf-8?B?My9EcWxsYlFqSDJGUVdKVjUzT0NNKzFGSWlRemFVUnN0OUhER0h6NXduOFpp?=
 =?utf-8?B?NFNMci9jbEpLTXF6dElEV0g5UlNEU3NVd2JaaUZTTHlvQnhZb09wNTczN3VZ?=
 =?utf-8?B?YWRDamZKT1U0Q3pGQVNOazV1a3lDSE9MUXFLTEZtYmc4OTUxS2VYQ3Z1ckNu?=
 =?utf-8?B?Ui9DQ2J3VnAzM0RRQllGL0xEL1VaSUJjbDY4Y0ZiZWl2SWtNRzJDVENJWEtn?=
 =?utf-8?B?dGMxL0xGa0pTcEpXczRaTlRKQ2dsakY4QXJNWXRsaTdlYitFZ1czTi9HUFlN?=
 =?utf-8?B?d0V6UEtqdjdjK1pQRTQvLzJ0V2hHdC9jUE5yMjNQckNyZlNMVmxPK2VMbW56?=
 =?utf-8?B?bExUYkVkZXVJY0VYQ3RaeUNwT3Jid3hwUVgwV0xDVTlGYlBORjhFaWJFbkNL?=
 =?utf-8?B?azQwSVc1ckpkcFB6b3Z3Und5SmZ5QTdpdTdQTFNNZ0djeXQxejV0cTBjOXhv?=
 =?utf-8?B?UjRNM1hzOWZnZFBHNzVLOXBXdkxZdzkrSmlCVnRCbmRRaGNKSWNiSWtwL3h1?=
 =?utf-8?B?bjVQb3IrdzlJUUlyRVRQMTMvdGpDeHovUDQ3ME5NZUwxRE1kUjFycEhjeEw3?=
 =?utf-8?B?KzFHbEhMOXovbThCdzhyc3YxUnBaRWxKRVFyMWhoTTdkMGR1UUtETUlkOGI2?=
 =?utf-8?B?RnBJUy9QY2NpTHdhMGIyaER6Q3VodEJ0TVlZR2ZScTIvTWdybmg1cThmVFVC?=
 =?utf-8?B?UXpzY1FTQkVLOG5kaU1vZkk2Z2k5SHhMcS8xUXhXOUNCQk1TN0pkV0x6TDI1?=
 =?utf-8?B?OTVvZVJoc0JxNmpzRHY5QTVYVFcrZm0zTThZUi8vZFVudkl4TW05bzgyOEZn?=
 =?utf-8?B?d0RFSTVGRzJGVnpJaDVLaW5zM3VHMzlZb0JoT2xQOW9hK0xVVksxNk1IMUpF?=
 =?utf-8?B?cWt6UDhJcVRQRDhnY28wNHVBcFpKU3huYVdTU1pXWGZwVlNqd2hYK0FKanFp?=
 =?utf-8?B?aHcrY2JKbGw5OWVoVm1Ybk1yWVo0eFE4L1poVi90bXBKSmFVOG1ENWFrQVhU?=
 =?utf-8?B?VkxNenlYVHZiUkVTQXZJMEk2d096NDFWaGUyQlhzMHJEKzRsR3pmbUdSU0dU?=
 =?utf-8?B?N1lFSENlUDdMZzNRL3JHZmJHR2Z6MGJ5dkNCQ1hvYkhnMkp6bVB1SFVXS0VW?=
 =?utf-8?B?QjBVTytUcHdmOW9qUngxandhR1l2Q0x5cnlPdWVQME5YaVZTSFZ5SENYT1Ni?=
 =?utf-8?B?R3ladFJnV01SSFpOanE3dkVBUkVyZU5zNnZSWUc5OXVqaFVEWjlzY1pPK00r?=
 =?utf-8?B?VkxIQ1JzWkppL3dXM1owUlk1TDdhWktla1RDeEJSQ3NobjNuU0RoVGpLNy9J?=
 =?utf-8?B?SGxSOVlkTXhvR1RKYWQvNXNqdE1XdUhRd0ZkS1R0czA0VnlwMkFNYVF1bjdO?=
 =?utf-8?B?OFlaNjJmSmMvZS9mTEpNUjlid0QvMVRaTFN3RGlSS3MwNk5aKzA3ZS9wMWhn?=
 =?utf-8?B?SVJWQUFyckpsUDJWb1lZUFg2Z1BRMVRxbzFpTjRUOHQ5YTVTV2ZqTFZVQWJa?=
 =?utf-8?B?WjdkRk5FU2tjbWpLWk5GNW1qb0R5alIrd2ZtczI0dklQQU9GSWxnUGVod2FN?=
 =?utf-8?B?cENKSjJLbmlYMCtWWmVpVCtrakJxOHgvVTJxTGFPT081V2VuZVhNRzJrTTcz?=
 =?utf-8?B?LzV4V1h5Y0pUTUExRm9wSjliZElzTkx2TjZ3akRsakhoYlREUHMwdFJlNUI0?=
 =?utf-8?B?anNjd29nMW9ISVl2bG5GYVcwTGdrUUJLZzJGODF3OTBXQVR3SDdsSS95WERZ?=
 =?utf-8?B?S1VmcG5OWEswSmt1TTFMbTdRbDV3d1liYmtuQytydFZNQW1rMkZmb01nVWZm?=
 =?utf-8?B?c1BSak13bFVIVER3dFYzZGFuQzVNTHV6VTdIUi9WNVFhbW43Uk1QOHkzYnJu?=
 =?utf-8?B?YmEyMEgzdERuOEp2QzlBV29rdFppQ0QzanV1VGQ3UXp6MTRTZjJQajhYR01Q?=
 =?utf-8?B?ZVREN2FGKzkzb0lRZ0dJZlQ0SXJTYlROSnc3QzIzQ2EwSU5XS3dSZDR4R2J3?=
 =?utf-8?Q?r3XY+DGON8gK4o+ubK6Wd/wbS?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68a6cb7b-d9cc-48ac-1d72-08de25b8b35c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 09:07:15.0329 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IJbV3dF14zt4XCScUSESq/f4xLVkZdX8dZeRNYHn6JxGngnW53h0UQSfvuT24hRC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6384
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

On 11/13/25 17:05, Pierre-Eric Pelloux-Prayer wrote:
> Use TTM_NUM_MOVE_FENCES as an upperbound of how many fences
> ttm might need to deal with moves/evictions.
> 
> ---
> v2: removed drm_err calls
> ---
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c                  | 5 ++---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c                 | 2 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c                | 6 ++----
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c                  | 3 ++-
>  drivers/gpu/drm/amd/amdkfd/kfd_svm.c                    | 3 +--
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 6 ++----
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c    | 6 ++----
>  7 files changed, 12 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> index ecdfe6cb36cc..0338522761bc 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c
> @@ -916,9 +916,8 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
>  			goto out_free_user_pages;
>  
>  		amdgpu_bo_list_for_each_entry(e, p->bo_list) {
> -			/* One fence for TTM and one for each CS job */
>  			r = drm_exec_prepare_obj(&p->exec, &e->bo->tbo.base,
> -						 1 + p->gang_size);
> +						 TTM_NUM_MOVE_FENCES + p->gang_size);
>  			drm_exec_retry_on_contention(&p->exec);
>  			if (unlikely(r))
>  				goto out_free_user_pages;
> @@ -928,7 +927,7 @@ static int amdgpu_cs_parser_bos(struct amdgpu_cs_parser *p,
>  
>  		if (p->uf_bo) {
>  			r = drm_exec_prepare_obj(&p->exec, &p->uf_bo->tbo.base,
> -						 1 + p->gang_size);
> +						 TTM_NUM_MOVE_FENCES + p->gang_size);
>  			drm_exec_retry_on_contention(&p->exec);
>  			if (unlikely(r))
>  				goto out_free_user_pages;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> index ce073e894584..2fe6899f6344 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c
> @@ -353,7 +353,7 @@ static void amdgpu_gem_object_close(struct drm_gem_object *obj,
>  
>  	drm_exec_init(&exec, DRM_EXEC_IGNORE_DUPLICATES, 0);
>  	drm_exec_until_all_locked(&exec) {
> -		r = drm_exec_prepare_obj(&exec, &bo->tbo.base, 1);
> +		r = drm_exec_prepare_obj(&exec, &bo->tbo.base, TTM_NUM_MOVE_FENCES);
>  		drm_exec_retry_on_contention(&exec);
>  		if (unlikely(r))
>  			goto out_unlock;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> index 79bad9cbe2ab..b92561eea3da 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vkms.c
> @@ -326,11 +326,9 @@ static int amdgpu_vkms_prepare_fb(struct drm_plane *plane,
>  		return r;
>  	}
>  
> -	r = dma_resv_reserve_fences(rbo->tbo.base.resv, 1);
> -	if (r) {
> -		dev_err(adev->dev, "allocating fence slot failed (%d)\n", r);
> +	r = dma_resv_reserve_fences(rbo->tbo.base.resv, TTM_NUM_MOVE_FENCES);
> +	if (r)
>  		goto error_unlock;
> -	}
>  
>  	if (plane->type != DRM_PLANE_TYPE_CURSOR)
>  		domain = amdgpu_display_supported_domains(adev, rbo->flags);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index 2f8e83f840a8..aaa44199e9f4 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -2630,7 +2630,8 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>  	}
>  
>  	amdgpu_vm_bo_base_init(&vm->root, vm, root_bo);
> -	r = dma_resv_reserve_fences(root_bo->tbo.base.resv, 1);
> +	r = dma_resv_reserve_fences(root_bo->tbo.base.resv,
> +				    TTM_NUM_MOVE_FENCES);
>  	if (r)
>  		goto error_free_root;
>  
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> index ffb7b36e577c..968cef1cbea6 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_svm.c
> @@ -627,9 +627,8 @@ svm_range_vram_node_new(struct kfd_node *node, struct svm_range *prange,
>  		}
>  	}
>  
> -	r = dma_resv_reserve_fences(bo->tbo.base.resv, 1);
> +	r = dma_resv_reserve_fences(bo->tbo.base.resv, TTM_NUM_MOVE_FENCES);
>  	if (r) {
> -		pr_debug("failed %d to reserve bo\n", r);
>  		amdgpu_bo_unreserve(bo);
>  		goto reserve_bo_failed;
>  	}
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> index 56cb866ac6f8..ceb55dd183ed 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> @@ -952,11 +952,9 @@ static int amdgpu_dm_plane_helper_prepare_fb(struct drm_plane *plane,
>  		return r;
>  	}
>  
> -	r = dma_resv_reserve_fences(rbo->tbo.base.resv, 1);
> -	if (r) {
> -		drm_err(adev_to_drm(adev), "reserving fence slot failed (%d)\n", r);
> +	r = dma_resv_reserve_fences(rbo->tbo.base.resv, TTM_NUM_MOVE_FENCES);
> +	if (r)
>  		goto error_unlock;
> -	}
>  
>  	if (plane->type != DRM_PLANE_TYPE_CURSOR)
>  		domain = amdgpu_display_supported_domains(adev, rbo->flags);
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
> index d9527c05fc87..110f0173eee6 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_wb.c
> @@ -106,11 +106,9 @@ static int amdgpu_dm_wb_prepare_job(struct drm_writeback_connector *wb_connector
>  		return r;
>  	}
>  
> -	r = dma_resv_reserve_fences(rbo->tbo.base.resv, 1);
> -	if (r) {
> -		drm_err(adev_to_drm(adev), "reserving fence slot failed (%d)\n", r);
> +	r = dma_resv_reserve_fences(rbo->tbo.base.resv, TTM_NUM_MOVE_FENCES);
> +	if (r)
>  		goto error_unlock;
> -	}
>  
>  	domain = amdgpu_display_supported_domains(adev, rbo->flags);
>  

