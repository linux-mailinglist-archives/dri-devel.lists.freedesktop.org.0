Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C8189C47BF
	for <lists+dri-devel@lfdr.de>; Mon, 11 Nov 2024 22:11:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5380A10E106;
	Mon, 11 Nov 2024 21:11:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bDSJ1mh5";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2040.outbound.protection.outlook.com [40.107.244.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6C0110E106;
 Mon, 11 Nov 2024 21:11:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S0NJA5Q5QYYxMTX3j8LgnuxJ3eXd1WU/nSeCvDQDwK2BmTq0GFBAWla+KeWaS5My/zXCNFyLgTj5gMICExPqL1rNnaS6TpgdPezKPi/fdiC9KFttllmdMzdCL0kDA8AwyqPvaPNIO4XGawNuuyU+QkteO/AzPFOw7aX5HnlOmZuAtftb8snfBEYuW+CYKKaBDfGyO6yrdrJV4e1Wv07Fte+bctnfP3a8IUCXsaXogPWMHxOXHgUFWWdhfLMjH0vCksLt1VKDFzcVVPynnVaCSJ8XbbIhn0AxHoMixqwVnAr5QY9CAPg03FUSDN4G6IjKuV6vdEEIcJA26J4XUAx6LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HZ04U8OaPoQYpeP8Fh5zOz3tA0y6zad5Agehw40qrqA=;
 b=ZHD1crbUQNRvS25P4DovYxR18ujiOkntgKBisPLUKccNWsuIfITWwb9zrZ/BEvl72//ZcqjbXrqB7zrtaX2B/hmZ3CvJOVYFrGsg/BIxkNN+sxYIwaCcU3piYWcsG+YNXKuUhH+tfE3bLU3oAUawxHdxkVIJiMFKdUzfSFpjSRqRrinkTwtVLVw2zIKT1lWJ8qRpMvdmHYJjGc+f5o5UR2XWdG5otQGZEFcilA3S65rHcjNQKQUfhrYsi8h25nJPVG6f9vsf7h2uzIJauh5fXEt/lSCZVsx8ahyzDKyWQzXSsVfVrYln6Nkl065LfognQxOPoikxKZjWKqhRJZJEhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HZ04U8OaPoQYpeP8Fh5zOz3tA0y6zad5Agehw40qrqA=;
 b=bDSJ1mh5GLCcDBOEcnbfQ+GL0bRUAwKwUNi0/h41RvbUV8nCE3IFP7DibkO6kCsH0hjWjPpM1Fmw+tX+YnSoG8pr6/aokY3oTVtz0k61q8LvRhaIN+ksJffLtrg6FCRtmX6v/wJ4T/LuJq17qr9ullg8PDcnvP+Ef3RiNF+T3IM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CO6PR12MB5427.namprd12.prod.outlook.com (2603:10b6:5:358::13)
 by MN0PR12MB6173.namprd12.prod.outlook.com (2603:10b6:208:3c6::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.28; Mon, 11 Nov
 2024 21:10:51 +0000
Received: from CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062]) by CO6PR12MB5427.namprd12.prod.outlook.com
 ([fe80::1c2f:5c82:2d9c:6062%5]) with mapi id 15.20.8137.027; Mon, 11 Nov 2024
 21:10:49 +0000
Message-ID: <3a97b828-2864-45fd-9fa1-5341bd456d3e@amd.com>
Date: Mon, 11 Nov 2024 16:10:44 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RESEND v9 2/2] drm/amdgpu: Enable async flip on overlay
 planes
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Leo Li <sunpeng.li@amd.com>, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 Xinhui Pan <Xinhui.Pan@amd.com>, dmitry.baryshkov@linaro.org,
 Simon Ser <contact@emersion.fr>, joshua@froggi.es,
 Xaver Hugl <xaver.hugl@gmail.com>, Daniel Stone <daniel@fooishbar.org>,
 ville.syrjala@linux.intel.com
Cc: kernel-dev@igalia.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org
References: <20241101-tonyk-async_flip-v9-0-681814efbfbe@igalia.com>
 <20241101-tonyk-async_flip-v9-2-681814efbfbe@igalia.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <20241101-tonyk-async_flip-v9-2-681814efbfbe@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR01CA0004.CANPRD01.PROD.OUTLOOK.COM (2603:10b6:c01::12)
 To CO6PR12MB5427.namprd12.prod.outlook.com
 (2603:10b6:5:358::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO6PR12MB5427:EE_|MN0PR12MB6173:EE_
X-MS-Office365-Filtering-Correlation-Id: 035e680c-670a-4f56-ae1d-08dd029550fb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|366016|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RHZGRDNpM3dLbmQrc0QvOElycU0xWm5vY1dqeDBlMEJnV0hTR1p1dGd2ZDdq?=
 =?utf-8?B?MHp0SWhkVHl1TE0zYnlybE1wTjR2TDhCVTNqaStzOUpxclVMQkxVSVR2NmYz?=
 =?utf-8?B?cFdwQ01vN3FhMlJBU28venNwM1RUd3ZYVVFoZzVJOVlFbWRCcDRSckVMK3RZ?=
 =?utf-8?B?WkZBR0xJNFI3Z1BQMy8xcVRhWEVack5rQjBnREJaV3Z0UEtOZlN3Z0NWWHR1?=
 =?utf-8?B?bENXeTBVeVl6YW9hK25ZcWVPTU5rVW5Ud0R2c2hSWm8wbXdsZVdDYlJSV3BT?=
 =?utf-8?B?V0JXTFhpUENOWjR0bC9mZmpuNG4zWG8vWkJSbTZONGJpcUFOMjRkYUgzc0pQ?=
 =?utf-8?B?Uk0yK282OGcwWWtzZ1JGbmpKb3ZVY1ZUcTQraXhGK3hmMGlhZTllZk5nc25F?=
 =?utf-8?B?UmE3SVFyM2dkc1BWakN0NHBOcTBEdzhPUDUzSEJjalpaTEVkWlltd3ZGR0M5?=
 =?utf-8?B?WkVNK0dhWERwMDFNTVkxM1Nyd29NQUlOamVxdXBSbDA5ZHdpeVFsd01JTGcx?=
 =?utf-8?B?SWFCWUkwTWdpNTdjY2RyaS9vNGFGY0p0aDFBWTJtWFJQWlhtNjBJUEFZN0lY?=
 =?utf-8?B?UlVxV3BHbWN2UnQyS2czeTFXV2NnbzJUK2JuU2o0RVpldjR2NUU2TXh6ZFFV?=
 =?utf-8?B?N2VIQk5ZdUo2WVU2UkZVclRJcXdhS2ZrZXhTZDY2UEdwcm9WVzdIN25ZdGFX?=
 =?utf-8?B?Tk1OQWRZRzdyakI4d25hZTVIYnB5UDNaQm54MndzVlJiVjlKVFdwWmRZVHU3?=
 =?utf-8?B?SDFTV3pNVFhBNW9kZ3NBczl6bWJFTzY5bnMrRXREY0RyMVJMd21IdEJocW9o?=
 =?utf-8?B?OXJ1TkZsZWFLbVZDdlBTc2JHQlpYb1FRbjNrNyt6Zmttby9Fb25Cd1FURUJS?=
 =?utf-8?B?TVVodlhhLzUwOFhLWkpVdG5UMmZRWWdUNUZLZ3RMV01WZVNEMjlicTNXSGZJ?=
 =?utf-8?B?eW0zb1NIdWtDdzBLOVRwelI4MHBlNXlwVEJienJSaUtxQml3VlJmb01GNEFR?=
 =?utf-8?B?YUU2NStzdURpVHhTcjNBR2hWdXhWU2MwMldsWUhtRWFYUlhpai9RYTUzKzNI?=
 =?utf-8?B?RjNLZnJrMFNCT3hYTldneXhQb24vM2ViRlhMNmMxTC9DOHBsUktreGRnT2tY?=
 =?utf-8?B?Sko1bHo4VkhVNlVNSjg5TE9WUkJmOUxaOXFMTUdCV3ZaQ1ZiVW5WSmtoVnBH?=
 =?utf-8?B?VTVtZ3FCTWJaMzgxbExXa0UzTG9FcXdJWTlONXllMnRyei9mQys2Ylp6MGpT?=
 =?utf-8?B?YUNaMi82SXRVeG54UUhLNGltcFVUekJCeXE2RlE3b2JkcTk3NkNDMzUwZGRr?=
 =?utf-8?B?SHhMdVNJNzhtQWg5b25jZEI1NFhJaUVveHBTamVzdjkvMjVpcDVGdVluTVlr?=
 =?utf-8?B?bFBhZGxodkwwalNMdVdiM0JidXdwK0dybFdIM1NKeUhUVkQzTTIzd2kvN0g4?=
 =?utf-8?B?VHIvcGY1QSs3WVQ4a2N3N1Zxc1ZUWXN3ajUxR1h5Rnk2SXVUZVJWTkNpSlJp?=
 =?utf-8?B?VFlycFNWNCtzcVFhYUtpNVVMUUJhbXpXNkNHZEJwdTQ1cWxKcVJudTJEL3hJ?=
 =?utf-8?B?cDlnZ05VN0lJNTlLeElJZlRYOGtleitWeEg4MVBPM0U1akNEVzdSMWVwSnNo?=
 =?utf-8?B?OG9TZk9IY3oyVkpQWGF6cGNMeWFOZ3RWb3ljRWhSWWlWa21mR20zOGdKQWhk?=
 =?utf-8?B?d0NIdURLUHUreW1BcjZteU00aXhEUllSRFJYcTB4V1o1Nytwd29kNy9BWHZo?=
 =?utf-8?B?ZEVyZmJLYUVZL0lQek1tVVdTZFM1dGNUTHNBR2JnLzJkL1lEWW9jaklEV2Fn?=
 =?utf-8?Q?3hx89Xhr3rpCZ7zc1Uyy3AObxtpAUHkPCKbtg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO6PR12MB5427.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N21YK2l2OXhKM1RkV0pKd3ZWbDdOQkRTMkZTN3NFeU5mWFFrVWN6WktaUlVr?=
 =?utf-8?B?RFI3eDEzLzBpbWpyYWFBTTR0YlRsTVpLQ0hrVSt2U3BQRko5aGwyT3JWdjFn?=
 =?utf-8?B?WSt4SXFUNHZua3FMbDY5NktiZjRwNFZaaVk4UWp5a2FJT2VrQURzVS9rZ3Vt?=
 =?utf-8?B?WXphREo2Q3Zpb3UxSVZLbDh5ODAxRTZldjRteUoxWlNkMlUwUDJRNFBCRG1r?=
 =?utf-8?B?aXZrNXB0cVY3RTlYSE9nNGJjRHpZVHdXaDlBMFV0RkIrNnk3WmdINjlQZ1Ew?=
 =?utf-8?B?THhOQnpZRHFUVzFWT3hWRXJmNkhpTUVUYmhGRVJTU3gxQXBySkF3d0RJb241?=
 =?utf-8?B?Rmp5cmV1UEdzUGlWR3J2UG4zMG5iZThjN0xOVWNPeXdOQlVGVGo3dEtDSGQ4?=
 =?utf-8?B?Q0tQL01xUE5nejZTY3NWTHZpTXF2MC9xRm84Z2pwaDdYYitRY1JVcmFaZmhl?=
 =?utf-8?B?dUpiNzVtTlUxQVZqK1NONDdhcjAwdmlRQXBmQkkwZUdCS25wRlY3ZFRuRHhs?=
 =?utf-8?B?aTVqdWt5K1RLUVhyZk5HTHJ4NW02WXVXT1pBeTZiTUtGc0NkMzVhZGhGMjgw?=
 =?utf-8?B?ZytGTncyaWdlLzA5bE1MWGlLQVRWQ3RhbzdpTG9ubWtDUFpCekF1VXF2Nkx5?=
 =?utf-8?B?MkJQWktkbzlzUmdhbTZENzdhbzhoVW9CcFhSLzAydGUwT1FNZm0rNG5ubVhi?=
 =?utf-8?B?eGFtTTJXUUQ5R3NXc2k0T0ZvVk5laHBUVndjeTRPZVhId3RkVmtxM1E2RmM4?=
 =?utf-8?B?NE8rRGZYcTRlK1hDMm1IUm5nakw0UzZlU2FtWWg3Qy9LdHh1dUhSUUtaWWdQ?=
 =?utf-8?B?cjBSYS83clRkcUNIRFA5WFErUVFENC9PVnhES1I0cDl4Sy9GWVFJVFJRV2Qv?=
 =?utf-8?B?ZzZmTmVqbXZEZktmMHhGNmIzNkN2VmxGUWR0L1Z6eFlVdU9xcXR2dXFYdGZQ?=
 =?utf-8?B?ZEthUDFFOXJtSk13MUVsczlsTmI5SEJ1Sks5a2xERnJVVDZPNFRVYmx4Qy9M?=
 =?utf-8?B?VHQrR2NjT3drU2dGVDF2TUp6ME9Pa1RZYVhDVVVlL1JyWkhkM1J2U3N5KzNN?=
 =?utf-8?B?N2ZadXhTOUdBMk1UOG8vS3kvNGNlTnV0UzRpSW1uSVBJTWdkcFZuNmprNTNu?=
 =?utf-8?B?YjYyNEp0d1RsQTI4R1dIdWVBd3I0amd4UG5BcGF1SWJaSVAwWmdkR0lIcFcx?=
 =?utf-8?B?c0orY0tHREpFR1V5VW1BSnFsc2d4bCt3djB6eWlhcDN2WTh5S2RkcGtsSXFs?=
 =?utf-8?B?VjhBSytJQ3RQbkhvQ09lM2crRHZPZmpvOGM1ZEMxdEJrL0hZeWZZTnE1UCtO?=
 =?utf-8?B?Y2Vhbk1zaDZEOFIzMzhQNTFNS2wvdVZJZEpOU0MybnRjcHBFQU5kY2NuaEVs?=
 =?utf-8?B?ekE1bjBVQXBGZXBKM29zc3J1M0lWQzNYNGpXdGkzTjdBWnZoZ2R1YzZvZEY0?=
 =?utf-8?B?eGhBUm9EOGRISUVkNXZEMER4MHU1SGpuaHVrSTZoVWROVitiMHRxR3cvbjJ1?=
 =?utf-8?B?cmt6QWdiMXo2MHZ4a2NFK2lVMXJpbHdySDBrM0dGNHZjbWtaQnAraU8wZC9j?=
 =?utf-8?B?WU9HeEN6SGp0WnIyc0pDZkJRVjFtYWQwNWltQytQT2JJTFo2Ti9OOUdzVXBZ?=
 =?utf-8?B?N1NZdEFXaGIzM3FmNXBIdjZpVW5ka2hIaUFua1lCTDJzc1dPMzlPQUFuUy9O?=
 =?utf-8?B?RXVyQVNxZE1vTktPSWtKNEZtWlMzQ250eXRqUzhUVU1idWI5cFJaNHdsaVBT?=
 =?utf-8?B?Uy9OTSt0V2I3dFJKWFZuQU12ZnJ2YjltYWlGUm01VWRPdmxJcUJORE9PUC9K?=
 =?utf-8?B?TUpQUGNvRlcva0NFa2ZGV2dreVFYcXkwK3dJTnhVbmowclArNHJPQmNlQS9a?=
 =?utf-8?B?VlpaSFNEL3JKM0grVjJzamtjVFhKV09kQmVXeTZYd2JNdC9zaU9xcS9aRENu?=
 =?utf-8?B?ZHhFbHJCZzYwbGRXM255VTQ2QUcyVXpPOW01ZUZ0L3JWbzlrUkpSQ3FwVHpG?=
 =?utf-8?B?UlF1TUlqQWpZekdvUTYyMDRZR0lDdEhnc0l5TVpkY052RFNSVCtzSERUSStW?=
 =?utf-8?B?aEsxcHQ5ZFRhdHRrRVA3VmxDb0FLU0xVRVR1OWZUM1E5dzRCR1hVTGZqT2d5?=
 =?utf-8?Q?qIv09FUP19VKIXLM6tMMGiZbl?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 035e680c-670a-4f56-ae1d-08dd029550fb
X-MS-Exchange-CrossTenant-AuthSource: CO6PR12MB5427.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Nov 2024 21:10:49.0677 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jh4tm23iREG8CVP1xM56y1BDpY5FsZS3EeqGzfj4dcr4jCd8sf6aCQZ+gmRWOqQuP9di319BMQ208AsiDwmYRA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6173
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

On 2024-11-01 14:23, André Almeida wrote:
> amdgpu can handle async flips on overlay planes, so allow it for atomic
> async checks.
> 
> Signed-off-by: André Almeida <andrealmeid@igalia.com>
> ---
>  drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> index 495e3cd70426db0182cb2811bc6d5d09f52f8a4b..4c6aed5ca777d76245f5f2865046f0f598be342a 100644
> --- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> +++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c
> @@ -1266,8 +1266,7 @@ static int amdgpu_dm_plane_atomic_async_check(struct drm_plane *plane,
>  	struct drm_plane_state *new_plane_state;
>  	struct dm_crtc_state *dm_new_crtc_state;
>  
> -	/* Only support async updates on cursor planes. */
> -	if (plane->type != DRM_PLANE_TYPE_CURSOR)
> +	if (plane->type != DRM_PLANE_TYPE_CURSOR && plane->type != DRM_PLANE_TYPE_OVERLAY)

This wouldn't just be called for flips, though, but could also be
called for updates on a plane, right? Those could cause for problems.

There's also nothing special about OVERLAY vs PRIMARY planes, other
than that amdgpu needs a PRIMARY plane, IIRC. So updates on PRIMARY
planes should also work (or not).

Maybe this should check that we're actually dealing with a simple
flip, i.e., a simple surface address update.

Harry

>  		return -EINVAL;
>  
>  	new_plane_state = drm_atomic_get_new_plane_state(state, plane);
> 

