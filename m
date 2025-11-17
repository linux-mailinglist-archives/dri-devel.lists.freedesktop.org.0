Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 808D7C6311D
	for <lists+dri-devel@lfdr.de>; Mon, 17 Nov 2025 10:12:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C856510E30B;
	Mon, 17 Nov 2025 09:12:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="FzmphKDd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012050.outbound.protection.outlook.com [40.107.209.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A12BD10E311;
 Mon, 17 Nov 2025 09:12:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nu0qYbdyBPIEHL56We8UQi44fE0beZYguGO9DAyGRlhndR5nYJOdlML58rSaAQZQ4N3anem9/Qs2IUztIoQM2pmByVKe4nEhi8Xhj6VQief89jgBbO8qTWFuTem99O0Pp4DKSOFS8nf7FbthgcMWC3d6oQUwQDu8RhZ41lfggb0uOwCBQVHTEMjjU6pckCz9H/8CCIP3PsAqVFgWr1Wj4ErmmurH+mRs8qy8AuT2D/48GdmRuBwy+WY7HWFMimh3T8OCTCVIGtMbDP3dj43r5YIfFH5MimfTbc/NxvKAYyCxmr6CKpYjysZ4vk2y1t+jmsqMkKyZNWVOktMVQMiArA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IkdqdmrBVKQy2wWmCwwFSi0p/ZqKJ+s7EOGjjFf8YaA=;
 b=fspMzmy8tQOfT8X1FF/j+bZNs9sl1DQN+/RL2ujbmc6fYIARk26xXDWGjE/hqqMTrEJOzjvBguNHnaU/rPDHuonzPaQH1p0ldHnm2qSAy7ZZu9u8T/jeA2bYz+0PCuIdy6ay6QrvWOiAIUQb9L6n9OOKS/6NK1HtKUbNgme+zoaiYSjJTxK0U06+jkF4gHE3zERoiSl1BrXblIxpbvrKsRKdtkf+pHAEmG9dgW4/1CjRmSRuJyiWSuHIKh87g8+lEChlWMvJFKy/5arnFXGOV2l+kT4DtZBXsdfeQH+xAQc2NJUDjwTlWZoam1vjU4uQiUBpizF48AjxyQD3cnujbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IkdqdmrBVKQy2wWmCwwFSi0p/ZqKJ+s7EOGjjFf8YaA=;
 b=FzmphKDd5mmCpbgRckUNmshhaajznKeSWpKdC2b0XODt1tkKxk/vrQICJJhpqVVWzmukwe8lTfGCpEYZJV3HvrNiLiGJ9O1ZbO+KAnb48ckXA3P4+AUe1PxVksdV+RSSeG2Si5J8P+LgWttutQ1MU8vbC45jDNMKq0BJxd/Y1Kg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB8265.namprd12.prod.outlook.com (2603:10b6:930:72::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Mon, 17 Nov
 2025 09:12:50 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.021; Mon, 17 Nov 2025
 09:12:50 +0000
Message-ID: <2ee1929f-4518-434a-b388-7eadee10d40f@amd.com>
Date: Mon, 17 Nov 2025 10:12:44 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/20] drm/amdgpu: use multiple entities in
 amdgpu_move_blit
To: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251113160632.5889-1-pierre-eric.pelloux-prayer@amd.com>
 <20251113160632.5889-14-pierre-eric.pelloux-prayer@amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251113160632.5889-14-pierre-eric.pelloux-prayer@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BN9P221CA0004.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:408:10a::12) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB8265:EE_
X-MS-Office365-Filtering-Correlation-Id: 116c91cd-a9f3-4d66-b3a0-08de25b97b22
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Rkk4OTR0MXBkWVZZdUJVOGJXY3BuVG9WWFZmY2pxU1QvWXNpMnB6NnlIZ01i?=
 =?utf-8?B?dG9CaENZSzJpRVdNUjJ2VDZJLzRoNUtGMTdHS1FlN1MvaFprSjZicyt2elhH?=
 =?utf-8?B?NTkvbWFQT21YR2ZnMHZaSENrbGV4d2c4clEyZ09JRGRaYVNKRzM3VWRnalFZ?=
 =?utf-8?B?eWlZZWM1ZmdMYUphWU9JejJ5TCt1OW1NSzhvU0tYcjlWdnIyRjNVVmdiZTl1?=
 =?utf-8?B?aGl3L0NOa3czbWtpSXlZdUJSMnNPSmUrY0tEbXE2UnoyU1praS9ScDdIb0lx?=
 =?utf-8?B?ekVqaUJkWm43QnloMlJFRUdvZGVoRGowbVVBdlhGU0p4Z3RNamxKRXdnSTVy?=
 =?utf-8?B?S0x6eEpuTjNtem1hZk9OTEpqWmdtRFFDRFNwOEZuTTFNQkNwa0F3QTRqYWVR?=
 =?utf-8?B?QmptYzI1d3VIWXFRWmtQTlJIV0FPSndSMzE1QkIzQk01SGVxZGNXRUlleGVT?=
 =?utf-8?B?cDAzY1BreDVNZU0zeGNDejJ5QzNaRStKakpjN0NRWFo5YzVmYllZbkRXMVY5?=
 =?utf-8?B?cXorL0x5QThyU1lvbXdwcXB1L3lOQVh5aHphZSs1cVBNTDhqSmg0bytVZnVo?=
 =?utf-8?B?TjdyVXg4RDZWUU5KbXV1YXhhdkF5R3FRMUtOT0JOQ2NhS1VWQzNPWHpzaWNp?=
 =?utf-8?B?MFl6bzVhU09BS29pcUJXTXhDd01ub3paRkg1R0NNY0p6MkFaenQ2L1c4RXQ3?=
 =?utf-8?B?SFJhYUs2Tm5vK1RabEFKWk96UWZBRDRqQzN2dXV5aFZmQTF0bmpoNUZ3cWVB?=
 =?utf-8?B?RzNRUTV1eENqZGpsbndCcGJhZDdRaVd4aXE0NVhwNHRqd3pxMWNGUFhsUE1I?=
 =?utf-8?B?NVZRa1VoNWxKbmRpVGwyVGkrdlIrcldBcFN5eGMzbitETjg0TUJKSmVDWlo4?=
 =?utf-8?B?VDhpWUZsWnR5T3daSWJzUTd6NU4wMmVPNDhCeE1jNnhhSkNGVHhLc3dkREZE?=
 =?utf-8?B?THVINlZxRGE4ZlRiQlVtcTJLTGNzYnh0Vnd0R3VWYmR3R1ZSN3NTUGltclZv?=
 =?utf-8?B?YXZyeXN4UVBwZWVCeWxvRXlCeTc1UGxITUZ1T3RFSFRFL2RPeTRjQ0NOUGtN?=
 =?utf-8?B?bVpLUkF2MFhxaDRXY3pwdzMxYURSWnphVmwrNDFRMGh5dlRTMlkyTUVYUExl?=
 =?utf-8?B?YjVoU0ZCWG1raENBN0xwdXd3YklrOHRqSTF1UmpuakZmZnYxb1hFQ0VaMGJ4?=
 =?utf-8?B?TThCeVRoSFB4YXpqVnBLWFV6aWVoYnVSUStPZHdyVFR3ZnJVV3FsZi8xb0pF?=
 =?utf-8?B?R0hHS2pxWHRQYUt4aWxWbUxoOHZGS1p1cEFId0JyemhkemRYUkxrdS8wL0I2?=
 =?utf-8?B?QlFaOGgzQWlBVGZxaDN3dk5PYVBHZDNCM3Q2TnlxRVpHQ3lVTDNMSFdWSVRT?=
 =?utf-8?B?cko1MEZ1UG5pVklZc0lIZjEyRU1HTUF6R21oK3NleW5wMXdKNDBjSno1TlRF?=
 =?utf-8?B?SVkxY1lGZFpZN2JldU12REM1OVhPdXM5ZDhQWS9aZ0RwYjlxUkdWRkp4Yy91?=
 =?utf-8?B?RVRzYStqVmFaNFFTcnJWeTVoR3RkdmxOcFJFM1h6ckpMWDc5ZDdjT0lDaC9x?=
 =?utf-8?B?RHZmLzQ5N2NVSGJXMCtHRjhBMUZ4SzFmMC9FditEcEl3cUxtT2psL1ZqTWx5?=
 =?utf-8?B?S0xPcEUwaXhvWDhzNEpTNmV4ZE1VU3hoeU5IS2wxTS94aWI1RGRhSWpoMVo0?=
 =?utf-8?B?WUczNHZ1OEJjTEhWYUpWemhXeHNrYmNPeC91VGF5UmxYQkVOdEQ0ZWwxbVd1?=
 =?utf-8?B?a2JuU3R6SzBlTVdnbzI4ekwxNkxQNGZtcVM3elNCNm1yRmhKcDNEa2p1Z2Jk?=
 =?utf-8?B?eGJjYzI5ckdUTDZtZVk4bGtVYzB5cHJlSVpPc2VlSmtoN3VyV24vK3kzdmQw?=
 =?utf-8?B?VlMvRStIc2RkT21acXZ4R0c5anY5aWIzV0tZVXp3WmJMMUdocStCM3NmSXB0?=
 =?utf-8?Q?RNpk2ybfsBXeRki0DB4hCWLeaZasLmYN?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NExLc1g5Y3RMTDVtQTBwbTc5c3ZjMk5GTENzS1hCejRxL1BjUkliclEvUk9i?=
 =?utf-8?B?VXBIaURUbUJIclFsZXFlN1FGUnRLeFJiN1ZoT2tjR3NJcng1SWlnZm15UnBQ?=
 =?utf-8?B?a1JrYzJOc1ZFUWluN3VZeDdkMUhYclFHSTBFOXpYazNLbER0NGNZU1pDam9u?=
 =?utf-8?B?SWVGZWhFR1BESzkvcVdZT0xoTUgxQXVNdXVnQjJONWZUc0VwRDFQWDZ5OWVO?=
 =?utf-8?B?SXFhT2plYzI4aDhBdVRiTXpEaXI4bTlHM0V1L2dsYnVYUXY5ZFFzQndJSlI5?=
 =?utf-8?B?Mk9FYmtZVjJtN05oK1dqcEQrdk5VQUVGUGR6QWFYaG4rVVo4bGxuekdZU3Vh?=
 =?utf-8?B?ZnRPUjNuUFNyVDZROXd1NStCRXE0ejZHNEphemtyNlF0WksrR2JLQk9MbmRV?=
 =?utf-8?B?Vm9OZi9ieW9lTURuMjFaQzFaNDhhWVhDd2wzUTByOE51NjJoenU5MlBhdG9w?=
 =?utf-8?B?VnNlK1JGNE02OGtsUHdkUDUwbE5LSFUxQ2dlNHBwQ3dZR1E1SHhlb2F3R2ZK?=
 =?utf-8?B?QUc3YVdxK0FCZEtXdTk1VlB2NS94dGx5UXo1T3Vmb2s3ZUMrTUxYZ1M3UkZh?=
 =?utf-8?B?NnFPb24vQ2RmT0dTWXBmckhrV0hhTVFPNWN2am8zeFE3WmM4c08zN2pSYktV?=
 =?utf-8?B?T3AycWxmM1pqdXlHMlBwS21UVlJQNWpiVUZLZFhBYUc1ZWtuK1p4ZE1sWmQx?=
 =?utf-8?B?R2I3U3MwNXBBMEEwam9UNEFYSi9mRk8wRndITmU1YkxRSEltRVQzRkc4QzlU?=
 =?utf-8?B?a1hza1hKdisvWFd4eGh2b3BLZjd0d0tiK1lpWTZUbVcrQW5tbHVWNWdKOHZs?=
 =?utf-8?B?ZFA0WWdrSXliOVh6cC9ySTBlQlNoVlRTQktrNXprUFlNTTNFb2lHRmJnRnZQ?=
 =?utf-8?B?OG4vVkxXdXBBdVUvbDk4amlULzZQUGpsLzZmY1VITlRQVzVQMXpsUng0T3NR?=
 =?utf-8?B?QVRnaXcwUldWU2ZIUUd2dmNYNHRVVk1YY1VpMVZwbUhlRGNZWVlLbyt3MGU1?=
 =?utf-8?B?bDhPei8vME5sN1d2bDNKbER0YXYrV1RaMmFjK3NRZFFQZEpZSjdpRllEYlN3?=
 =?utf-8?B?M3UxNWp3MTJEaVpoNTNwZXN4RjVvZFMrQm1KY21FRUJqZmxtNlNmM1krS2hK?=
 =?utf-8?B?QzRxd0xiVzBBcXhMemJJZjRiN0F3Mmo5YThIbU1PaEU1M0VzcVRzd3RNUzEv?=
 =?utf-8?B?OGt1d0xLVktwaXlzR3l2NElUU0dvM0VJTENSeWdlLzB5aDZ1djJWNWtTVEUx?=
 =?utf-8?B?ak5OQUZYNGw1cW5QRGRGQ25oeXN1d3Qza2pRUkRLRkViNHRaWnZ5MEpkVDNB?=
 =?utf-8?B?TE94bjVGN3Jnay9qeXJTdXpQMzJKbTU5WGdjbWVLak9pWkE0V1JZWVR3cFpB?=
 =?utf-8?B?K0FRVGdnM21DbzFwa0syUmo3RXNDVnpiWnB2YURmV1NnSVJQN1pmT1JzbmY0?=
 =?utf-8?B?THFLOFdpTzM3M3ZyR3Fid25NSzZyVjhGOTV6Zms1R3FHazhyT2xGT01zSVNu?=
 =?utf-8?B?Wk5mSlJNOFJKY09mVFNIWDJZR0E0MThqNXpQS0lUeFNUdXNqa0x6Q1o2cWN3?=
 =?utf-8?B?MUhXajY5YjhoRk15R0ZscGdwOGFZUi96aVg0cE95bklvOVJoRzB0b1FYQjNn?=
 =?utf-8?B?a1pCZS9lU2JTbTdnbmxVdDVESkJjb1FEeUdsYTRTclp6SU9DcGRqclFuS0t6?=
 =?utf-8?B?VlliaE10bktnQmRNelI0MkxWM2cwSXUyOWJIdFd1R240NHJwYTM2ZGxQNjUr?=
 =?utf-8?B?b0t3MnZheU8yNVRuTExDanY5RmQ3aVYrb3VsMmJhZ29GYzBGUFZpQlZOQmJO?=
 =?utf-8?B?QVgyK2EwRFMxZzRsSDFKZjFpVklIUld5Vm5oa25nMEJvaTl5R3RVdzhKekM5?=
 =?utf-8?B?a0RTdTdzVkFYeXduZ3dwWWFKQ0tOMXhZR1hnZWZtZHBRQ2NpWGhEY3VRVVVk?=
 =?utf-8?B?UWVKN3RSS21kMExhclJ2cGpEcDhTRzdOZkE2ZmdINW9CK3lmYUVwTXNpa1Bm?=
 =?utf-8?B?RmJSNFQ1cDAyT0d6bFZWY0I1Q3hIbEFaWVR3R3JIK1pOT1R1Wm4ya3JJS0Jp?=
 =?utf-8?B?TGt1N0VSQ1dJUzdGdWh6QnlPaEVRK0tvbVUrblNVdDlOa0RzOWFzZXJOQlEy?=
 =?utf-8?Q?1X6lX9pl5aa5rXhADIw4UmUP1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 116c91cd-a9f3-4d66-b3a0-08de25b97b22
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Nov 2025 09:12:50.0448 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TpACid12UZ/tOz4tuFYgDWheW9CBAGva3B7dJ4IQfoHXMJK35im71sDa4lnxmt2w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8265
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
> Thanks to "drm/ttm: rework pipelined eviction fence handling", ttm
> can deal correctly with moves and evictions being executed from
> different contexts.
> 
> Create several entities and use them in a round-robin fashion.
> 
> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
> ---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c | 13 ++++++++++---
>  drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h |  1 +
>  2 files changed, 11 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 486c701d0d5b..6c333dba7a35 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -401,6 +401,7 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
>  {
>  	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->bdev);
>  	struct amdgpu_bo *abo = ttm_to_amdgpu_bo(bo);
> +	struct amdgpu_ttm_buffer_entity *entity;
>  	struct amdgpu_copy_mem src, dst;
>  	struct dma_fence *fence = NULL;
>  	int r;
> @@ -412,8 +413,12 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
>  	src.offset = 0;
>  	dst.offset = 0;
>  
> +	int e = atomic_inc_return(&adev->mman.next_move_entity) %
> +				  adev->mman.num_move_entities;
> +	entity = &adev->mman.move_entities[e];

Similar to clears this could be a sepatate function, but not a must have.

Reviewed-by: Christian König <christian.koenig@amd.com> either way.

Regards,
Christian.

> +
>  	r = amdgpu_ttm_copy_mem_to_mem(adev,
> -				       &adev->mman.move_entities[0],
> +				       entity,
>  				       &src, &dst,
>  				       new_mem->size,
>  				       amdgpu_bo_encrypted(abo),
> @@ -426,7 +431,7 @@ static int amdgpu_move_blit(struct ttm_buffer_object *bo,
>  	    (abo->flags & AMDGPU_GEM_CREATE_VRAM_WIPE_ON_RELEASE)) {
>  		struct dma_fence *wipe_fence = NULL;
>  
> -		r = amdgpu_fill_buffer(&adev->mman.move_entities[0],
> +		r = amdgpu_fill_buffer(entity,
>  				       abo, 0, NULL, &wipe_fence, fence,
>  				       AMDGPU_KERNEL_JOB_ID_MOVE_BLIT);
>  		if (r) {
> @@ -2179,7 +2184,8 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  	struct ttm_resource_manager *man = ttm_manager_type(&adev->mman.bdev, TTM_PL_VRAM);
>  	uint64_t size;
>  	int r, i, j;
> -	u32 num_clear_entities, num_move_entities, windows, w;
> +	u32 num_clear_entities, num_move_entities;
> +	u32 windows, w;
>  
>  	num_clear_entities = adev->sdma.num_instances;
>  	num_move_entities = MIN(adev->sdma.num_instances, TTM_NUM_MOVE_FENCES);
> @@ -2205,6 +2211,7 @@ u32 amdgpu_ttm_set_buffer_funcs_status(struct amdgpu_device *adev, bool enable)
>  		}
>  
>  		adev->mman.num_move_entities = num_move_entities;
> +		atomic_set(&adev->mman.next_move_entity, 0);
>  		for (i = 0; i < num_move_entities; i++) {
>  			r = drm_sched_entity_init(&adev->mman.move_entities[i].base,
>  						  DRM_SCHED_PRIORITY_NORMAL, &sched,
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> index 781b0bdca56c..4844f001f590 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
> @@ -76,6 +76,7 @@ struct amdgpu_mman {
>  	atomic_t next_clear_entity;
>  	u32 num_clear_entities;
>  	struct amdgpu_ttm_buffer_entity move_entities[TTM_NUM_MOVE_FENCES];
> +	atomic_t next_move_entity;
>  	u32 num_move_entities;
>  
>  	struct amdgpu_vram_mgr vram_mgr;

