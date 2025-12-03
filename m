Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C3F0C9F0B2
	for <lists+dri-devel@lfdr.de>; Wed, 03 Dec 2025 14:03:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9502810E17E;
	Wed,  3 Dec 2025 13:03:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="3GicCB86";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH8PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11012008.outbound.protection.outlook.com [40.107.209.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B9D910E153;
 Wed,  3 Dec 2025 13:03:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V74zGEvB8jpLoIFfvfoaLKRp9ukWJ9yIGhDGdT7/c/EDfECZa/pMDuxtJOy3u0HclTN6a2dn4r8cH5S6lezah1llePJsMeZdsEzcTc2uT92p1DO6Dp6VJhfZftite8YTi2aQUW3yiRpwPA1z97QXxjMMM00hxy0n92csmD/ky2reQvQ9dkG6SoG9PSGfYjGv3sctsLDXCP26vWwUKOfHCB99Ii1FNe8n9uuT7M0m02a2EtkZGjHeSy40FjnODxY/1YzieaWfN48U/cBB4Wp/foc5nD4a+9WKGk95doif2S1fASOECtsMrxt9HwqH4NFTPTCLy7B7cJWsVjAmOpOuXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PhDhJufJzMoGX9VaWMI5KNQEWEyxKwIb6ZhpRnDuVPc=;
 b=i1as3SdjYbE3F2pmeaYx/ef5QDQqKxWjUv8Y31GJoH32X6D030wyEByRSmYM3ieZ1avzyncA5t7bENhtpTGmwBT625DMLzizku2t/YJVlX1+spWwwqjL5S0fLRfUF4m7n6M9s1MuckCc2rEerjJw8NcDLCUD+GwCdEWA2pnGSriayjMtdNkikpu1iuW/BGEml3g77Dod6+vode+cFhtg17TAngQU1K+wZydxfRRpTvLTAYfWlYF8j9bQiZxwPX/Zxaan0OlHNv2ULpGOTg9Mx/kEdA/BjroFw3bMaSdYn2VV+/gqXFIv5m8Y8loxIMKIEAe4H3q5G86/FrlFr7HZGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PhDhJufJzMoGX9VaWMI5KNQEWEyxKwIb6ZhpRnDuVPc=;
 b=3GicCB86rtnT738jcV3ry7YxVYwOh3SW6NP3ZXlVRErq7sMNZ31MY4lzqHe6G2wipGkkudFiReEesc1BEBdamA7gOnvoyy0VMBEhE8wv/twJ0UXjeRJeS5GoIEC1iV+JWYfA0MgKFc8FtWS/pUEYK18Lt2TcbdQk1YkgGPNvS2w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM6PR12MB4420.namprd12.prod.outlook.com (2603:10b6:5:2a7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Wed, 3 Dec
 2025 13:03:41 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9388.003; Wed, 3 Dec 2025
 13:03:41 +0000
Message-ID: <f220ad03-1ad2-44aa-a46c-0a638dd64d8a@amd.com>
Date: Wed, 3 Dec 2025 14:03:33 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/8] dma-buf/dma-fence: Add
 dma_fence_test_signaled_flag()
To: Philipp Stanner <phasta@kernel.org>,
 Sumit Semwal <sumit.semwal@linaro.org>, Gustavo Padovan
 <gustavo@padovan.org>, Felix Kuehling <Felix.Kuehling@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Tvrtko Ursulin
 <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas De Marchi <lucas.demarchi@intel.com>,
 =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
References: <20251201105011.19386-2-phasta@kernel.org>
 <20251201105011.19386-3-phasta@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20251201105011.19386-3-phasta@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0090.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9b::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM6PR12MB4420:EE_
X-MS-Office365-Filtering-Correlation-Id: b935885b-5b33-4117-56e5-08de326c6193
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|7053199007|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U0NBMFZQTVc0MmhQM245V25sOU9LT2hucExJUERmQkh0cWNLVkFTMlN4SXc4?=
 =?utf-8?B?SzhSRWpZVFVTSnMrSTk5RVo2ak1kSThSRXYzTjJuU2xRRm9OSEtmRGZuc01p?=
 =?utf-8?B?T3RpK3kxNWV5TEIwVFFPbnVxSXFzcXZubUFMTzZYQWVJL2lRUXdkVllScFdG?=
 =?utf-8?B?UmNIa0k1UmFvMkVOdC94dUVUS2l0QnBEdmFLYUp6ZWh0MStuS25MUXVteGtQ?=
 =?utf-8?B?WHNLcGhody9Dc2NWTHlQWWY1STdJUStYVFhtcUwxektWWWdSa3V3WmxRZnNs?=
 =?utf-8?B?Q3oyc3N3ZTBtbXA0Ni9wSURORWd4eXJTS1p5Y1draytQSnlVRytWbzQ3OHU4?=
 =?utf-8?B?cG1QVXdnNnprcHYySXVuTlFrNWhTTWhjYU1ueUZKbk5DV0VLcFlYSjd0S0Rr?=
 =?utf-8?B?WG9DOW5ydGZjTFcwUTE3Yy9ZVWNVb3J2VnlMcWl4bzQ1dXE0aEhlcTRoTnd6?=
 =?utf-8?B?TUx5cTh4Uzk3a0p0VFBHakQvSmRWNllPbW1BVGhOK3A3UWNKQ2t1S29veDNB?=
 =?utf-8?B?YkZIa0tZeHRCOStqU2Z5UkJxQnQvS3hPM2xveFRkVUNCWU0rMFVWeGJzNWxT?=
 =?utf-8?B?c1J2Y2NQRzlNdEt5K0lTUWRMNEg5RUlGS04zZDBhdkZ1aThqNHZXeWdaMGxG?=
 =?utf-8?B?T2FVZ29KN0ZJazVIZ09OT01memtwVjFnL1JvNTltcHo3emZKZW5hMEhtb0Fj?=
 =?utf-8?B?QjdzdGRwcThpdWFIY3N5bnlIMFRFS3RWQ2tXS3Nxd2lFTWdkdnVoQXFYeGVW?=
 =?utf-8?B?T2x2dWZqeWZqMXUwamJGVDR4VmNrcklTN3ZFNThQZVEzL3RvVlIyeHNhdGlV?=
 =?utf-8?B?aVZPdGp2cjNxUEdZaHRMclpRM2wyN1lLanVZckZBWHoxZllZSEtMU1JKaVI0?=
 =?utf-8?B?WnFzWDNoYUVaUUxCejY0aHh4ejR1V21jVmRPQVhXL2J2dGlXK2dRcG90a3hB?=
 =?utf-8?B?VitINStQdEtnakRBN3ZlVjdhbm9FbVhwU0ZJeFozeFhYdFdqeUUwZUtLTTU0?=
 =?utf-8?B?TnZod3dKV2pJZ1NzdjV0QUhjUWs5N3d0amxINVlybFNaK00zYithSklHUVEw?=
 =?utf-8?B?OTNkNVFOVkdyQ3JJemdFNHg3VXVjSDkvcm8wazV2VitMaFU0eGpBQWx3dHNr?=
 =?utf-8?B?a1kxV05mODlrcFB6Q0Z0blk5UGhSSmE2cksvNmJnUjJRdWFlYXJ3RUtLRmQy?=
 =?utf-8?B?Qjkzc2ZzV21YeDNpd05wMjVITkcyV3pFMDI5RHBkRk9pYlVFYWx5clI4OFRl?=
 =?utf-8?B?Q0E4TVRNZ1NuYVVRVjQ1ajNwYTR0SGY4LzU3K2VqK1ZyZDAzOUppMmVRUkti?=
 =?utf-8?B?T3ZkWVk5cW9ibXlVcVE4NzhORXgzdUhZQjNGMFh5SEdvWDhLQlFnY09Wc2Vs?=
 =?utf-8?B?Y3dpQlBqb1crSC9jMUZrancyeTlwZDM3Z01aaDZYYkxqdkY0MUpEYnFTUnBD?=
 =?utf-8?B?b1pyN1RXTkJyVmlTRnEzR1VTdWtJUnBaOGVOYnNOTjBpY3BKM2hMMkNKQ2hE?=
 =?utf-8?B?UkljdUppZWhIZUFzS25HdVNJRkowTUM2SStpYVdSUmxYWWhiYjNNa0V2M29H?=
 =?utf-8?B?MjFNUHkzUm14ZGNlMUtac214WjdYaEFXMXRXeHhqNzlIdTdNd0JpR2ErN2V3?=
 =?utf-8?B?aWtJdUlXT3IweHBnMVp0YTNOajhsd0lQcFo5QVFFQ3dlbjczVC9TVUk2UkhM?=
 =?utf-8?B?d1htYlJRMXErS0J3azMvL05OZXp1eGV3U0dNUDhvb0UyOGd0NUUvY0tiVUJy?=
 =?utf-8?B?d1N0R0FUaUtJUjR1V1JaYVRRdkVzb3ZQb2pRU0hPUmhnK3lBMnBOWi8rcU1m?=
 =?utf-8?B?Q3k4TDhWVHgxZWJVU0Yza05tU2xJWkNCQkRJSjNadE80cU04RHhVNHArS2s1?=
 =?utf-8?B?RkR4K284TmZLRUZYVTkyRnFJQkxzcDJCalZoWUg2WFJSV0l0SXNlK2ZxeDJK?=
 =?utf-8?B?TnVlYXFtWEw0RW9PS2xNbFNDb2w1OXJjQXE4RkhBZVNsZGNkWGpuMWI3dE5G?=
 =?utf-8?Q?kIQAngT2R24a3K/7y4UPSD9bj3znsU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(7053199007)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MVNLait3bEM3ekJKUFRVaEIySG9jSzVPT0RUdEIxZGVXWU4wN0pPcVFRYkFG?=
 =?utf-8?B?d1FOWEpGMXREZ3IzSnZwdCt5YjYxV0pWcnRFUVlIcDMvb3kxQ1FnOUZSRURi?=
 =?utf-8?B?SjNaQXl3YzQrN2hwY1E5MG0rM0owMnZWeUxMaWk5NnAzVGN0YVY1VEljak1j?=
 =?utf-8?B?UUl2SE5IV0hUL3BhTmxqSHlTUGEzRE5JdUJmMHkreVdITy9iSWVHQ2FFNVhF?=
 =?utf-8?B?WG04RzI2d2RBMnhMTnQ4QlNjUkF5VXRyYW9IdXd3VU9vZDErblJLVmdqWGRs?=
 =?utf-8?B?cHUyNlRHamtSKzVtdXU4QUdWZjE0d3VhQURXZk0raE5OVkxQK0g5bkNjWk1n?=
 =?utf-8?B?SnFmbnMrOGRlZVdHdCsvcWcwZFdMMlVhVk9waWE3M2E3eEt2bE1oclkvcGw2?=
 =?utf-8?B?cXpXNTlBb1RTdzlVdzJocUJ3OVhPbnVVWFkyZzVvcjlxbUd0c1hzeGJ6YUdN?=
 =?utf-8?B?Mmx0bE9rcWpaM2lzUFVrb3N5aFhxN2ZqRmp5dnFaNDZwaWU2b1lKTTJmcXpt?=
 =?utf-8?B?TWJYbHZuUk9zVlRpSkNvcGlsTzdpQXdLamkwMjBTQXNFdmFXek93MlQrYkha?=
 =?utf-8?B?THF1bWppaTV5SDB4KzQvb0lOS1RVc3pHZlVJWVc4cGRnMXJERlkzdnRXRmlq?=
 =?utf-8?B?MUlJUUVOaTNKdTFMWmYzazFNLzRwcTRRdVlrQmdzSkRlRlBMczlQVUhIM2Z1?=
 =?utf-8?B?bEticjB6UndKTHdkdnIxcVd2ZHdQU1NnamNtOXNKOFFteGEvelV2eHNLVFdJ?=
 =?utf-8?B?a1ZIR3NtR3N4QlBVMVM0WGRpN3RwM20yZzRHMWE5dTIyRFZoR2QxK3paNm1s?=
 =?utf-8?B?QUkrek9ZWWdvcGVxbUNoOWVwN0c4OGZPVzF1eDFmZGdRUlJ3U2dFblBmNDU2?=
 =?utf-8?B?MVRFbmpwQytSaVNad0FuWjRkNGRIR0NqSnYvM2J3ckV4WTk0Z1J6Nm4vcUZ5?=
 =?utf-8?B?UjBMNmRxTGpmVndXSVQxL3J3akh4R0lQN3RmN25GNEdGb1luNGlOSDJaOUl6?=
 =?utf-8?B?YzhJYVAzc2wwRVRpL1VQS1p3ZzR6cCtWM3g2V2dLRnJZWURvMXk0c3RKeVhq?=
 =?utf-8?B?Nk9LS2xWMDdWZVJwZHdjbnJqZjRadlVpSmN1Z3RXWmJTWW1pdkhlaEV6cXZ0?=
 =?utf-8?B?bUFrZ1Y0U1FnV0pCQWJMdXFNQ01ReEpDS1VqQWMvSGhJRllhcXlFMHRENkNO?=
 =?utf-8?B?MmhNMC9OQUxPbTZZbHRqaVR2cG92Wlp4S2R2K2pDQ0k0bU53S0RhbjVxN0N6?=
 =?utf-8?B?WW1EZWZHclBsTE9qSHcyMnhEZmk5WTRadHFPYUoxWVZJczhNV2VxMVAySC9y?=
 =?utf-8?B?YXVXQ1B6MzRoZzRaTkw2R1lkaENBclR3d2JXSHAxWG5hVWpYS1pPdTJlSGFG?=
 =?utf-8?B?aU84OWJUcThldlhpRFE1T05GUWJqT0NEK3p5dXZoVkFUb0RXZnQ0alpwclNz?=
 =?utf-8?B?S09Db0plQ0NRMmo3cE5PU1B3VXBFRnlzYVZReW9zcFd4Ukl3K25hUGhBTklJ?=
 =?utf-8?B?OUlLbExNZ0lHd2RxYngyVFZUTVdobEtSc053TlhMTVBmcXhwYlYxdUo0aEhK?=
 =?utf-8?B?YmJSU08yZEZlMlZiNmJRN0xyd1F1Z3djWHFZVHhxQVZkK3dHcmtiU3piUU9I?=
 =?utf-8?B?a1B3d0ZPUDBnanczUHR4TC9ZUzFrbnBTVkhvNXlXOWdINXNnZWJoUlBvcmFi?=
 =?utf-8?B?all0LzZQbCtYdUxUSmVwclA1dHlsbktyMWRQRWZYRGJjY1VUMThQWHlQTVJk?=
 =?utf-8?B?bjNzaEJtZ1EwT09WWlJQUjk0blAySmhZNGZaRjNPa3NoZzV4UXF5YkliVUh6?=
 =?utf-8?B?K3M2S1UzZ1hjaXR3NExrT1RkTFZmSUZHMkRmYThCRmJwZ0VvclV1T09VSkhI?=
 =?utf-8?B?SmYyaCt1TEs3UVltTzlIUEw5K29RYTZzOXlnRFAwQXJsUk9WRndpZFc1c3FD?=
 =?utf-8?B?eWJnV3dqVzUrZ0NEaHVvNENvb2RHbVBHTlpuY1dCQmpsWnJZdFFHYUNVWU4z?=
 =?utf-8?B?SmZrL1NvcXZyOUV6cWptdk1IUi81SWVPZnRrUWxXamlMN3F3STAzWHdxL2FN?=
 =?utf-8?B?Y1JkMlhCTlFYNExjVHZmZzI2K0ZCcEZHRWdTME9qUDEza2d0eEdOZTRVUk9k?=
 =?utf-8?Q?KjhY5O+sDDtcKXNrmo8r09H8r?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b935885b-5b33-4117-56e5-08de326c6193
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 13:03:41.1049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZUFeqIVf52BIrnkCod+VOEfTijn+XEtuWVppBltl/AoqkGqlUaxyARSUEAuQ8VoH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4420
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

On 12/1/25 11:50, Philipp Stanner wrote:
> The dma_fence framework checks at many places whether the signaled flag
> of a fence is already set. The code can be simplified and made more
> readable by providing a helper function for that.
> 
> Add dma_fence_test_signaled_flag(), which only checks whether a fence is
> signaled. Use it internally.
> 
> Suggested-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> Signed-off-by: Philipp Stanner <phasta@kernel.org>

Reviewed-by: Christian König <christian.koenig@amd.com>

> ---
>  drivers/dma-buf/dma-fence.c | 16 ++++++++--------
>  include/linux/dma-fence.h   | 24 ++++++++++++++++++++++--
>  2 files changed, 30 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/dma-buf/dma-fence.c b/drivers/dma-buf/dma-fence.c
> index 39e6f93dc310..96d72ffc0750 100644
> --- a/drivers/dma-buf/dma-fence.c
> +++ b/drivers/dma-buf/dma-fence.c
> @@ -545,7 +545,7 @@ void dma_fence_release(struct kref *kref)
>  	trace_dma_fence_destroy(fence);
>  
>  	if (!list_empty(&fence->cb_list) &&
> -	    !test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
> +	    !dma_fence_test_signaled_flag(fence)) {
>  		const char __rcu *timeline;
>  		const char __rcu *driver;
>  		unsigned long flags;
> @@ -602,7 +602,7 @@ static bool __dma_fence_enable_signaling(struct dma_fence *fence)
>  	was_set = test_and_set_bit(DMA_FENCE_FLAG_ENABLE_SIGNAL_BIT,
>  				   &fence->flags);
>  
> -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> +	if (dma_fence_test_signaled_flag(fence))
>  		return false;
>  
>  	if (!was_set && fence->ops->enable_signaling) {
> @@ -666,7 +666,7 @@ int dma_fence_add_callback(struct dma_fence *fence, struct dma_fence_cb *cb,
>  	if (WARN_ON(!fence || !func))
>  		return -EINVAL;
>  
> -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
> +	if (dma_fence_test_signaled_flag(fence)) {
>  		INIT_LIST_HEAD(&cb->node);
>  		return -ENOENT;
>  	}
> @@ -783,7 +783,7 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
>  
>  	spin_lock_irqsave(fence->lock, flags);
>  
> -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> +	if (dma_fence_test_signaled_flag(fence))
>  		goto out;
>  
>  	if (intr && signal_pending(current)) {
> @@ -800,7 +800,7 @@ dma_fence_default_wait(struct dma_fence *fence, bool intr, signed long timeout)
>  	cb.task = current;
>  	list_add(&cb.base.node, &fence->cb_list);
>  
> -	while (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags) && ret > 0) {
> +	while (!dma_fence_test_signaled_flag(fence) && ret > 0) {
>  		if (intr)
>  			__set_current_state(TASK_INTERRUPTIBLE);
>  		else
> @@ -832,7 +832,7 @@ dma_fence_test_signaled_any(struct dma_fence **fences, uint32_t count,
>  
>  	for (i = 0; i < count; ++i) {
>  		struct dma_fence *fence = fences[i];
> -		if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags)) {
> +		if (dma_fence_test_signaled_flag(fence)) {
>  			if (idx)
>  				*idx = i;
>  			return true;
> @@ -1108,7 +1108,7 @@ const char __rcu *dma_fence_driver_name(struct dma_fence *fence)
>  	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
>  			 "RCU protection is required for safe access to returned string");
>  
> -	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> +	if (!dma_fence_test_signaled_flag(fence))
>  		return fence->ops->get_driver_name(fence);
>  	else
>  		return "detached-driver";
> @@ -1140,7 +1140,7 @@ const char __rcu *dma_fence_timeline_name(struct dma_fence *fence)
>  	RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
>  			 "RCU protection is required for safe access to returned string");
>  
> -	if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> +	if (!dma_fence_test_signaled_flag(fence))
>  		return fence->ops->get_timeline_name(fence);
>  	else
>  		return "signaled-timeline";
> diff --git a/include/linux/dma-fence.h b/include/linux/dma-fence.h
> index 64639e104110..19972f5d176f 100644
> --- a/include/linux/dma-fence.h
> +++ b/include/linux/dma-fence.h
> @@ -401,6 +401,26 @@ void dma_fence_enable_sw_signaling(struct dma_fence *fence);
>  const char __rcu *dma_fence_driver_name(struct dma_fence *fence);
>  const char __rcu *dma_fence_timeline_name(struct dma_fence *fence);
>  
> +/*
> + * dma_fence_test_signaled_flag - Only check whether a fence is signaled yet.
> + * @fence: the fence to check
> + *
> + * This function just checks whether @fence is signaled, without interacting
> + * with the fence in any way. The user must, therefore, ensure through other
> + * means that fences get signaled eventually.
> + *
> + * This function uses test_bit(), which is thread-safe. Naturally, this function
> + * should be used opportunistically; a fence could get signaled at any moment
> + * after the check is done.
> + *
> + * Return: true if signaled, false otherwise.
> + */
> +static inline bool
> +dma_fence_test_signaled_flag(struct dma_fence *fence)
> +{
> +	return test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags);
> +}
> +
>  /**
>   * dma_fence_is_signaled_locked - Return an indication if the fence
>   *                                is signaled yet.
> @@ -418,7 +438,7 @@ const char __rcu *dma_fence_timeline_name(struct dma_fence *fence);
>  static inline bool
>  dma_fence_is_signaled_locked(struct dma_fence *fence)
>  {
> -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> +	if (dma_fence_test_signaled_flag(fence))
>  		return true;
>  
>  	if (fence->ops->signaled && fence->ops->signaled(fence)) {
> @@ -448,7 +468,7 @@ dma_fence_is_signaled_locked(struct dma_fence *fence)
>  static inline bool
>  dma_fence_is_signaled(struct dma_fence *fence)
>  {
> -	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> +	if (dma_fence_test_signaled_flag(fence))
>  		return true;
>  
>  	if (fence->ops->signaled && fence->ops->signaled(fence)) {

