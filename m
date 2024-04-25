Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9EEC38B1B4C
	for <lists+dri-devel@lfdr.de>; Thu, 25 Apr 2024 08:55:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07A8C10FC25;
	Thu, 25 Apr 2024 06:55:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="KeTpWXyN";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2064.outbound.protection.outlook.com [40.107.92.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19FDB10FAD1;
 Thu, 25 Apr 2024 06:54:58 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oy6XPcpWz/MJNc8dbQytQ5CdOSS+32fIM0HFWfISjFWxygapP3T8qCVeXwZcbN6fyZcVZCB/pibpmTn3kYVUtr/jZk+l9YfhW0doKrLRoced7Mxha+V9PQeXgssPZgjjo50djPyfLeeqHHq6hJckreZc+cBMYFe7wM6C3fsfRsd97nRjNracG15F4MAFuEbGvwSCHy0OROTGu+et8MkmYmCnCIB9LpKJWfXxEIeDmKxir4yPY77qAdyA8URhiys/AyhZs+dQUNBPuYautF7zB+IhGj/WMnMsdPtGQoXjcmChOL8PAJDgZUIpzZGwL53mwOz+hOr7l3xbDHLYF3o4rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ILgPV44cEuX5Q91S2+r86La/fbsYRq8mAnmRFfKPW3g=;
 b=CUVBDekLu+nM8eKcqKyKkxl1Xb4l4AFlrlSzznT1S1D7t/k4rqtYl9rN3ivBD9WujaKtzOYEDoXaBeOeRdLOvAI2cljdpN+Tc9LLsCQowOpUo+wV9JZQ4WqZFyEPbvLLl0ko7gpSXZafEvXbZ2AbaskT9JDc3Br0xx91LOKPiuUaGtsqjiUdrCugkaWqQlB+qTRLWdiBFzvpYv96ktrHkM/TD3eUCp1vBlmX89Gvt36qpuOYH+hHWfKvgil0FUu0pZAPO3zQ30dHCq4dWIcEi5mzBzbV1NM/RM26X1SGuLNyKte/bsEATxTcWn5aZt2/Rzbw8wHVuJ+bN5IWQkyhoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ILgPV44cEuX5Q91S2+r86La/fbsYRq8mAnmRFfKPW3g=;
 b=KeTpWXyN8mBMZvza8csMD3QtCP1izkTXtIX5yrZ+mWUhPkzt9cqQsWAg9e2ZdaCQKQ/Jjy7MWbTjjid9oy2UAHw/tNvvPHdB7oRfhkR0Clm/tGNTi/Di9CuTG0l2rcpmA23A6SpcpD6sTXjYkcCwWzmyHO/Jx2Zl3K/pbSxxeu8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB7434.namprd12.prod.outlook.com (2603:10b6:930:52::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.46; Thu, 25 Apr
 2024 06:54:55 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::f2b6:1034:76e8:f15a%6]) with mapi id 15.20.7519.021; Thu, 25 Apr 2024
 06:54:55 +0000
Message-ID: <074aca15-650e-4cbb-8998-6d7f97e6e0c5@amd.com>
Date: Thu, 25 Apr 2024 08:54:49 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 00/18] TTM interface for managing VRAM oversubscription
To: Friedrich Vock <friedrich.vock@gmx.de>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
Cc: Pierre-Loup Griffais <pgriffais@valvesoftware.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>, Joshua Ashton
 <joshua@froggi.es>, Alex Deucher <alexander.deucher@amd.com>
References: <20240424165937.54759-1-friedrich.vock@gmx.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240424165937.54759-1-friedrich.vock@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR0P281CA0152.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b3::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB7434:EE_
X-MS-Office365-Filtering-Correlation-Id: e3bf1e34-ea56-4ef8-479e-08dc64f49d56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?d1pBZFZaYVRZSHB0N0pJUm5TSTc4c1ZQVGM5a0I5TjIxeVBpazBUZGZOeEw2?=
 =?utf-8?B?WkxnSG8zWCthTmN1eTJCWlFCSGwyaWIyNTIvNjRUQk05M1MyeWU0aUk1UTRM?=
 =?utf-8?B?clFURlh6WXZOcDdXNWJpRnhJbUpMSDVrZm9zTjlNODdTTXJDMmVGR1lLNDdZ?=
 =?utf-8?B?VFA0UVNDTWdSUWhkR2xlcmRyMTkzdGE3YXlBZE1WRExWSGYvUS8wVmNkbk9G?=
 =?utf-8?B?THNoY0k1OVNPcFg2WXVKdnMvcTJKbmxKcFZSUmZ3VFVnN1FhTGNiRkV5YWh1?=
 =?utf-8?B?UW9JTWswNTlCS0dTby9hMzRpWkp3QXkvbnQwaXkrR2ZyVVp6MkRtZC80ZGVz?=
 =?utf-8?B?YmFRRTNnOWtRenM0QWtQQUpxZjVHMmU4bERQRTh2SlJCdEpiRGgzcFhtNmRi?=
 =?utf-8?B?dHZGYklYeXRaemJRTlZVUVpCaFdFKzNqd20zbFpVcTcvK1BnSk1OVnp1RHJH?=
 =?utf-8?B?aTVDaCtjSkZFOWkrWURSOUdHSGRwVEtKT1FOQktmeDZOUEg4RDVhTVFlbHVL?=
 =?utf-8?B?WXBTZ1gwV3JSVGQyOHhhdUxMVjM4OWxNR2s3Mkg5ckMyVmQrdW52bVpFaTd0?=
 =?utf-8?B?TmtHekR5UC9NR05WV2hKTFpET2wxWHl0eFBVdlgzNmYwSU84N3NMaU42MW5Y?=
 =?utf-8?B?RmhQY0NzY0Q0KzBvWEttaWR3UllXOFFPbU9ML1FveVhRWmk5V09lWk1hUWFQ?=
 =?utf-8?B?aGVzVGh6Nk5TMjRjd0NWbVg0c2htSzhHeXpMbTFrQmRzbVo5eWFMWFFJVnVY?=
 =?utf-8?B?T0FjVHAreXZnRW5nQWhxaGVOS2hodTdLV1BUWnpuNDJqczhGa2p6a0dvSnd4?=
 =?utf-8?B?TlVxdXBTNnNOa3ZCYXcxK3pLTVpqVVhiL3RGcEwzYTN6bUNtZkNOL0JBZ3Rv?=
 =?utf-8?B?TEF1MU9IcDE5NlU0eVhGUTlVTk5PY1ZoKzZ0V1MzVHRBamV2TDNDY3RITmh6?=
 =?utf-8?B?WDRWNHdCRzBhb093YkVQOFllVU82U0RpdHlrVm5sZDhkT2taYitiUkxRRGtO?=
 =?utf-8?B?N0M3eDBTL05Wc0YrQTZxcUl2Y1dpWkpkRHg0N09SN294YTlmc3kzeE5zZkpp?=
 =?utf-8?B?cW1hVVFlYzJpUmhicnNmM3ZTOXB3WTM5STdaK3VvSzYycFFDaTN5QmxvWmR4?=
 =?utf-8?B?OEordXpKck9JOUlnamJEVi9TMTVlZWltYWd2Q04xWVgwMG9FMEVwemFJWmYx?=
 =?utf-8?B?SU9pb3lkNndYNGRQYTJMVGpmbkUzSTZKV215dFZUU3hqNFRJY0ZFcUFmaTU4?=
 =?utf-8?B?ak82WVJJaHZnOFAwV0ROUU10R1hvWG5SV0N0aWZ2NnlPMWRTRUlKcGVUM1BM?=
 =?utf-8?B?NzdHSGcvbHlnaE5yMjBiNUtrdHl3WmRYaDEyTHRacStoN243Uk9UUEd1cysw?=
 =?utf-8?B?SU5wR2piNVlWL2RKVEEyWmgwUVJHTzVBbk5jeUIycWNob0d6ZDArSWZEWlgr?=
 =?utf-8?B?YlloVjBWb0pqTVZvd1VESWxsNkdwV1BUZUQxdjhzV0FvYzhpbmVEMk4yQ01j?=
 =?utf-8?B?MVdWSzRNNHdBZDRqSGRuZDZoY1dGdWhIaEJuSTl2YklJb211Tm1RMGRTZVJT?=
 =?utf-8?B?OEp0VEg5SXFnL21GYld6Sk95Qy9lRE9NT1UzTGZxQUd2V2lJZGZPR2Q4b3Yx?=
 =?utf-8?Q?DTTJes9sf5KRuMMB+t2VI6hu8mUrNOmLIUyy1xuS5S0c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eFF5YUwzODNEZzZ5UW9ITTF4Q3RKUzViZVlTS1ZiYUllek93Q0MyZkJyRUsv?=
 =?utf-8?B?T0JkQ0d5RTl0eUxlZFdHMnFqM0tWSHRoYTlXcS9XMFlvcjFXK3Z4d1QxQzF6?=
 =?utf-8?B?UHZZSnU1YkhVNzhWWU1HZkR0VDZUZVVzMktkM3k3VDhWblVLK0xIZGI0VFpy?=
 =?utf-8?B?SWV1aUFrRXpQdUpFd3huU1JHZjR2Q1lSbXR2b0FaLzh4bW0zVWVaRU41NjJu?=
 =?utf-8?B?cmRabmVZRVU1ZGI5K1N3bDFFc3YzUXdGRDFRaVljajFHZWtnc2NRcUhQMk9w?=
 =?utf-8?B?L09OdllqTWZHd05qYlVqYlVOVTFnSFVYRFdXNFJRL2hDdDl6TU1tRDZTQ1hR?=
 =?utf-8?B?UlhxOWNnTzFqY25Tb2ZQSkpLS285OE9MMlB6UGFkRFptWmtmZjV3eWJjM3Rw?=
 =?utf-8?B?QVk5YkVkRy9lVTNnZjhmWVk0SVdTZ25YTUI0QmJnY25BSUUyWkFnTzdqR2R2?=
 =?utf-8?B?RDF6cDhMVU03WmxzemFzT3F4Z0V2OFZWNDhmREtOWS83SHFrMytqRE04L2dC?=
 =?utf-8?B?bzJGMmxjdjI1S1dXL3hLOVhKMW80UmlDMEFvZzZLNHI1aXZVSXBsVDJMcjY5?=
 =?utf-8?B?MlpVRUVtUXVIdjRnNVJvazViOUd2YjFZUTNPSHhSNG9aMTZlRnIwbUxXdkMx?=
 =?utf-8?B?aWFJVVQzS2JMUm42bkw0cHNlUEEvY3BIYzVOK3ovSi9zd2hVNktLd0Z5M2Vw?=
 =?utf-8?B?WHVoc2Uxd0VmQVpuMzZDZ3lvTG5kYncram42OElpWllwV296WUhXRmUxbW5l?=
 =?utf-8?B?eHBFYnE1TGp6WmpWY3drZnc2Zy8wOThzNStaOEFnUHNCbGwvdUZWVFI1SkZH?=
 =?utf-8?B?ZERBd2hXa0ZyakRUdDZQOXBXeE56RlJBZVQrS3V0bjBSekp5dW1rZ3NoSWJr?=
 =?utf-8?B?RFgwNDZaUVR0Yk9MbldEOHBjeGZDczFXdmRic3ZJM2k5WmpIUVpTMHgybTg3?=
 =?utf-8?B?a0dVbElqRkpzQUI0NXZqbkJqT2RIZ0VvUCtmUlRXWVhiaE5UM2s5WUpCWGpH?=
 =?utf-8?B?R21Vc1psSlEzR01UZXhaa1ZXSTFSazZWZ2I2cFFSUGcxZjAzOHVxTGsvenVi?=
 =?utf-8?B?Q1NBRWZVYnMvMGo2UzY1dis1SUxYWGduY2ljMWFMWWVwbVpXSTJOWjhNNFlk?=
 =?utf-8?B?cHlORWNuNVZWSnRmQ1BJTXpBcDZYY0Z5V0hKMW1NRnJxZThGVlREY0VHVVBB?=
 =?utf-8?B?aFl6bEFqSHFFeHlpMGRmQk1NMTVCakFrTEFkNjVlcHkvbUprYys2RzNUcEU5?=
 =?utf-8?B?UjFjdDVOekJTaUdzTEtOaE5uMnVZcDRjbDRGSXgzVXJ5dkViZitmaTFUdUVo?=
 =?utf-8?B?aVQ1c1o0dzZBRloxT3NPWFExTWxiS0ZzTW9NMnIxRm1WQ1lPOGdjcENva29T?=
 =?utf-8?B?Q0JvY3pVd2NSL3dKMnZrSjZ2bUpQRjZLaUp0dHBqVDh6T3BiTlZrWjB0YVhU?=
 =?utf-8?B?cTU3bVVTdXoxR1JvQjUrelJoZkJWYnlYaml5UCtBakZIZEJHd01LNEVjNy94?=
 =?utf-8?B?VGc4RnVJc2JUUThZK1N6TFFPejhGVGFKTjNrSWNQZXJuSTN3aGZVbXN5VTky?=
 =?utf-8?B?S2luek83ZWRLWndJVjAzVjVuS3NwM2k1M2MyS0ZtQkJNcDZGUXVSTS94VFh3?=
 =?utf-8?B?ZkdUZXM2THRkd1E4NEwzemh4clRVMUNURllTQ09mNmlnSnFMOXRDMWdVbllW?=
 =?utf-8?B?ZFRxdnlmcGV0SkZvTGUrZ0hWRTZNcXNEYWlCVHllRUUxSjVqcmhaVFRCQm9S?=
 =?utf-8?B?UXRiQ010ZGd2b1JIeEtGYkVCMjN2bmxTNi9ZR3d6V1BGbkpHRDZTY0ZkcnRN?=
 =?utf-8?B?NUpuL3FBZXljMWRscGJWY1hwZFo2MExIWVpCUkxYanc0U2lURU5YSTkweHk3?=
 =?utf-8?B?U0QwWGdUVVN3ZnU3TkpMaFFBRDNPVTdYL2pGb3FpMUdEZThvaFpRYnQ3N1JM?=
 =?utf-8?B?MWVjUHUrMTA3aHlaR3dDWUt2UHRJVCsxcC85dWMvNDB1bEVpWko3M1R5bVkw?=
 =?utf-8?B?d0U1MGJpdzIwalBpdzhDSWRqdmJxVFJPUGQ2b2VLUkJ0VWI4Wjk1alVqbEVX?=
 =?utf-8?B?ZFFhcUsxTWM5SGVlcmx6SEpwQ1ppYnFGZEdSTlNsVGVnNTYvRHFrMkVZTjlG?=
 =?utf-8?Q?nX8YoBQQcPAZvTOkugwKAlf/e?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e3bf1e34-ea56-4ef8-479e-08dc64f49d56
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Apr 2024 06:54:55.5117 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WuiQoTZDnYD7xXZQfh1iNmPQUW0gs+/edb8rvzYRRI4Cpy33ZDSOyU/uOtmSxD7X
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7434
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

In general: Yes please :)

But are exercising a lot of ideas we have already thrown over board over 
the years.

The general idea Marek and I have been working on for a while now is 
rather to make TTM aware of userspace "clients".

In other words we should start with having a TTM structure in the fpriv 
of the drivers and then track there how much VRAM was evicted for each 
client.

This should then be balanced so that each client gets it's equal share 
of VRAM and we pretty much end up with a static situation which only 
changes when applications become inactive/active (based on their GPU 
activity).

I will mail you some of the stuff we already came up with later on.

Regards,
Christian.

Am 24.04.24 um 18:56 schrieb Friedrich Vock:
> Hi everyone,
>
> recently I've been looking into remedies for apps (in particular, newer
> games) that experience significant performance loss when they start to
> hit VRAM limits, especially on older or lower-end cards that struggle
> to fit both desktop apps and all the game data into VRAM at once.
>
> The root of the problem lies in the fact that from userspace's POV,
> buffer eviction is very opaque: Userspace applications/drivers cannot
> tell how oversubscribed VRAM is, nor do they have fine-grained control
> over which buffers get evicted.  At the same time, with GPU APIs becoming
> increasingly lower-level and GPU-driven, only the application itself
> can know which buffers are used within a particular submission, and
> how important each buffer is. For this, GPU APIs include interfaces
> to query oversubscription and specify memory priorities: In Vulkan,
> oversubscription can be queried through the VK_EXT_memory_budget
> extension. Different buffers can also be assigned priorities via the
> VK_EXT_pageable_device_local_memory extension. Modern games, especially
> D3D12 games via vkd3d-proton, rely on oversubscription being reported and
> priorities being respected in order to perform their memory management.
>
> However, relaying this information to the kernel via the current KMD uAPIs
> is not possible. On AMDGPU for example, all work submissions include a
> "bo list" that contains any buffer object that is accessed during the
> course of the submission. If VRAM is oversubscribed and a buffer in the
> list was evicted to system memory, that buffer is moved back to VRAM
> (potentially evicting other unused buffers).
>
> Since the usermode driver doesn't know what buffers are used by the
> application, its only choice is to submit a bo list that contains every
> buffer the application has allocated. In case of VRAM oversubscription,
> it is highly likely that some of the application's buffers were evicted,
> which almost guarantees that some buffers will get moved around. Since
> the bo list is only known at submit time, this also means the buffers
> will get moved right before submitting application work, which is the
> worst possible time to move buffers from a latency perspective. Another
> consequence of the large bo list is that nearly all memory from other
> applications will be evicted, too. When different applications (e.g. game
> and compositor) submit work one after the other, this causes a ping-pong
> effect where each app's submission evicts the other app's memory,
> resulting in a large amount of unnecessary moves.
>
> This overly aggressive eviction behavior led to RADV adopting a change
> that effectively allows all VRAM applications to reside in system memory
> [1].  This worked around the ping-ponging/excessive buffer moving problem,
> but also meant that any memory evicted to system memory would forever
> stay there, regardless of how VRAM is used.
>
> My proposal aims at providing a middle ground between these extremes.
> The goals I want to meet are:
> - Userspace is accurately informed about VRAM oversubscription/how much
>    VRAM has been evicted
> - Buffer eviction respects priorities set by userspace - Wasteful
>    ping-ponging is avoided to the extent possible
>
> I have been testing out some prototypes, and came up with this rough
> sketch of an API:
>
> - For each ttm_resource_manager, the amount of evicted memory is tracked
>    (similarly to how "usage" tracks the memory usage). When memory is
>    evicted via ttm_bo_evict, the size of the evicted memory is added, when
>    memory is un-evicted (see below), its size is subtracted. The amount of
>    evicted memory for e.g. VRAM can be queried by userspace via an ioctl.
>
> - Each ttm_resource_manager maintains a list of evicted buffer objects.
>
> - ttm_mem_unevict walks the list of evicted bos for a given
>    ttm_resource_manager and tries moving evicted resources back. When a
>    buffer is freed, this function is called to immediately restore some
>    evicted memory.
>
> - Each ttm_buffer_object independently tracks the mem_type it wants
>    to reside in.
>
> - ttm_bo_try_unevict is added as a helper function which attempts to
>    move the buffer to its preferred mem_type. If no space is available
>    there, it fails with -ENOSPC/-ENOMEM.
>
> - Similar to how ttm_bo_evict works, each driver can implement
>    uneviction_valuable/unevict_flags callbacks to control buffer
>    un-eviction.
>
> This is what patches 1-10 accomplish (together with an amdgpu
> implementation utilizing the new API).
>
> Userspace priorities could then be implemented as follows:
>
> - TTM already manages priorities for each buffer object. These priorities
>    can be updated by userspace via a GEM_OP ioctl to inform the kernel
>    which buffers should be evicted before others. If an ioctl increases
>    the priority of a buffer, ttm_bo_try_unevict is called on that buffer to
>    try and move it back (potentially evicting buffers with a lower
>    priority)
>
> - Buffers should never be evicted by other buffers with equal/lower
>    priority, but if there is a buffer with lower priority occupying VRAM,
>    it should be evicted in favor of the higher-priority one. This prevents
>    ping-ponging between buffers that try evicting each other and is
>    trivially implementable with an early-exit in ttm_mem_evict_first.
>
> This is covered in patches 11-15, with the new features exposed to
> userspace in patches 16-18.
>
> I also have a RADV branch utilizing this API at [2], which I use for
> testing.
>
> This implementation is stil very much WIP, although the D3D12 games I
> tested already seemed to benefit from it. Nevertheless, are still quite
> a few TODOs and unresolved questions/problems.
>
> Some kernel drivers (e.g i915) already use TTM priorities for
> kernel-internal purposes. Of course, some of the highest priorities
> should stay reserved for these purposes (with userspace being able to
> use the lower priorities).
>
> Another problem with priorities is the possibility of apps starving other
> apps by occupying all of VRAM with high-priority allocations. A possible
> solution could be include restricting the highest priority/priorities
> to important apps like compositors.
>
> Tying into this problem, only apps that are actively cooperating
> to reduce memory pressure can benefit from the current memory priority
> implementation. Eventually the priority system could also be utilized
> to benefit all applications, for example with the desktop environment
> boosting the priority of the currently-focused app/its cgroup (to
> provide the best QoS to the apps the user is actively using). A full
> implementation of this is probably out-of-scope for this initial proposal,
> but it's probably a good idea to consider this as a possible future use
> of the priority API.
>
> I'm primarily looking to integrate this into amdgpu to solve the
> issues I've seen there, but I'm also interested in feedback from
> other drivers. Is this something you'd be interested in? Do you
> have any objections/comments/questions about my proposed design?
>
> Thanks,
> Friedrich
>
> [1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/6833
> [2] https://gitlab.freedesktop.org/pixelcluster/mesa/-/tree/spilling
>
> Friedrich Vock (18):
>    drm/ttm: Add tracking for evicted memory
>    drm/ttm: Add per-BO eviction tracking
>    drm/ttm: Implement BO eviction tracking
>    drm/ttm: Add driver funcs for uneviction control
>    drm/ttm: Add option to evict no BOs in operation
>    drm/ttm: Add public buffer eviction/uneviction functions
>    drm/amdgpu: Add TTM uneviction control functions
>    drm/amdgpu: Don't try moving BOs to preferred domain before submit
>    drm/amdgpu: Don't mark VRAM as a busy placement for VRAM|GTT resources
>    drm/amdgpu: Don't add GTT to initial domains after failing to allocate
>      VRAM
>    drm/ttm: Bump BO priority count
>    drm/ttm: Do not evict BOs with higher priority
>    drm/ttm: Implement ttm_bo_update_priority
>    drm/ttm: Consider BOs placed in non-favorite locations evicted
>    drm/amdgpu: Set a default priority for user/kernel BOs
>    drm/amdgpu: Implement SET_PRIORITY GEM op
>    drm/amdgpu: Implement EVICTED_VRAM query
>    drm/amdgpu: Bump minor version
>
>   drivers/gpu/drm/amd/amdgpu/amdgpu.h        |   2 -
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c     | 191 +---------------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.h     |   4 -
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |   3 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c    |  25 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_kms.c    |   3 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  26 ++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h |   4 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    |  50 ++++
>   drivers/gpu/drm/ttm/ttm_bo.c               | 253 ++++++++++++++++++++-
>   drivers/gpu/drm/ttm/ttm_bo_util.c          |   3 +
>   drivers/gpu/drm/ttm/ttm_device.c           |   1 +
>   drivers/gpu/drm/ttm/ttm_resource.c         |  19 +-
>   include/drm/ttm/ttm_bo.h                   |  22 ++
>   include/drm/ttm/ttm_device.h               |  28 +++
>   include/drm/ttm/ttm_resource.h             |  11 +-
>   include/uapi/drm/amdgpu_drm.h              |   3 +
>   17 files changed, 430 insertions(+), 218 deletions(-)
>
> --
> 2.44.0
>

