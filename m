Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E8D3C6F779
	for <lists+dri-devel@lfdr.de>; Wed, 19 Nov 2025 15:57:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B7BA89E2A;
	Wed, 19 Nov 2025 14:57:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="oSqawTuR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012013.outbound.protection.outlook.com
 [40.93.195.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 354F989A4E;
 Wed, 19 Nov 2025 14:57:44 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vmkNYHUG/v+aiz7n8vlOd4FqWgiUJkDf9R3/3f/Sa2ks6hYXDpias7e9ScBWYy6OmQCVmu05UZrfoeDmeVF1JCJgjW/B0cJ5+6SKCbzWDnE899+BD+xfFmYPIgo2xCPd26GKkkvgydHzHdpl/8TJ9LQuwwe/aqbOIX2ZFAis3dMq6JMa1kTyZEpLv7A4d3nNGMUPSyx25XhuHeT6vr1gQp6eDWYXkGFaD0hlo5TBhwt97EdAKoM/a+8fxg3rDqaVmOTjgvJyAWEoQMQyQToQbIRMp7s6afdgh/eywXmbwhXi+RGzyhnh+J7wBpIUjNXWRqQ8SR03Z/pjfkh6UMOZNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W6dkCI3d+Thu0sISFir6zKuUnG8bnAQyoxkWFdtf8RI=;
 b=VK0rrPuuj8iwZ2Sk2Pb5fHfQYhiPi+hvEHOK+Pzu1BwQM4MVX/rq+t8J/p778RujJ3pBq7KSH7z6jrV6vdyDl4KOo80wKBATDUTTLrxg/KAiDeqj/vBqLKVwFqDhZF3U3Vm413kgCfhVgzgnIwkh/Gden8AWbZys3m14V1abKce9HZLCeR+Vv2Pnl5Vrbj4RkdkTKwNRuOAD3htlyhNXVRcqqP0WbWpGMmwFvziUQwZ7bOJLDYj8A/dUNkElGFxd6Z4v/QE9V9wjzM31BBwHeCcpkkmIcNNV8/TZ+oNqmKY23dEe75LX0SZjNQy7LitbAF8KXbtlWKsynXy1N+9+0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W6dkCI3d+Thu0sISFir6zKuUnG8bnAQyoxkWFdtf8RI=;
 b=oSqawTuReQCH2ZvgWO1M+Qx1rMC0cnjEO/Rx5vlszFjQt5VBkGY4l5npfsqmOuKnxuG8LZgNiMey0Y7w7T9DQIr7GO2iryNmDNiPEiBe9Bqs04lX9U6tDfB6PBlLQEdSrF+e/KNwtfkABc7KBKklGvwtt27zFX9xWd/H0/1p8C4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DS2PR12MB9638.namprd12.prod.outlook.com (2603:10b6:8:27b::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 14:57:36 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.021; Wed, 19 Nov 2025
 14:57:36 +0000
Message-ID: <9a669372-6e5e-4acd-8155-c44c57e649ae@amd.com>
Date: Wed, 19 Nov 2025 15:57:30 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 02/20] drm/ttm: rework pipelined eviction fence handling
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Huang Rui <ray.huang@amd.com>,
 Matthew Auld <matthew.auld@intel.com>,
 Matthew Brost <matthew.brost@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Sumit Semwal <sumit.semwal@linaro.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20251113160632.5889-1-pierre-eric.pelloux-prayer@amd.com>
 <20251113160632.5889-3-pierre-eric.pelloux-prayer@amd.com>
 <471b61ae7b130ea05b509a5fb0b7f3a4de59531a.camel@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <471b61ae7b130ea05b509a5fb0b7f3a4de59531a.camel@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0113.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::7) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DS2PR12MB9638:EE_
X-MS-Office365-Filtering-Correlation-Id: c204f926-7bdc-4ed0-226f-08de277bfa03
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|366016|376014|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b3NXek9JOWpIR1dtSGx5NzFiU3grd2lYVVVack5EUitENkphRXNBaXRFdDA1?=
 =?utf-8?B?SzV5QjdRU0RtSVJoNFRKdUFKMWZrVi85dkQxL2g2dUtpN2RHRGhEbVI4SmhV?=
 =?utf-8?B?bmJCWkp2Vjhza1QwVnZsY3gvK2d6akl6MmNUb3ZsWEx0azdRRDhyUEJTVDZE?=
 =?utf-8?B?N0xHY3NQQVlNT0hSYm9jckcwbjh2Q3MvLytlbll3QldlcWN1SnY1VWhGRFlu?=
 =?utf-8?B?YWFOb0xVQTN3SllERVJKbklqbnJ5S3RUakNTbWN4UzhDdGFDRk4xRXEyQzFT?=
 =?utf-8?B?akE4Z1pIRjErWnBSU083eTg1WXVVQWlPWGluZlQwT0c3U1lvYjFqUCtxNXB4?=
 =?utf-8?B?cndJUXkxb2F5ZXdiV1c1TGtLdmduUWJ1cmRxVTE5bUppVXR2Lzg0YVB0b1Jq?=
 =?utf-8?B?RUozdkhLOWREdFRRL09BN3NKS05uOE5EYi9DSTFia3lTOW53K2pTTml3MFlY?=
 =?utf-8?B?cXJSK2VWNDhpTlpIRDVBOHVZR0pBZ3hpUGd1eGtlYzh3cnVaUGVMcDVjbStp?=
 =?utf-8?B?NVJlRFJwazFhQnlUTzdVcjIzK1RJOXkzTGVnczc1YkFmUjNYZmF6RzgrUndh?=
 =?utf-8?B?dkdsUkZKWkF5dVdYejljN0JvY2cvOUl2MWFDTkxScFVXUnZ2VHY1ZGcwZmw2?=
 =?utf-8?B?azc3dTdoWjQzZFE3cFRYWkNnWnJWdkJSa2c3aWdjZUJyN3VhRVJrMTBVdU9U?=
 =?utf-8?B?N1FlN0RVa1NGWThGWmh1Z2Evd0xseU15Um52SmhLTENJN3VWZEk2bU5ENGFY?=
 =?utf-8?B?Qlh0Z01rMTgzbWtlakNEekdYTjloTUZqOWJQRndSanRnNldkUTlJOGwwYW5I?=
 =?utf-8?B?akhDMHp2Q2ZaQjN2Z0lwRG1CY0tSYVNmNlpsSzdsajRMNWNuODY2ejAxS1NN?=
 =?utf-8?B?MlV4QlUvalh5M0JPQk1LS1FiNXJNaktBUS9qZ1M3OFpZQUt0UmV0aHo4WjUr?=
 =?utf-8?B?clloeWdybkdsT0xuSENiakxxbnNxRU1KNDV4Y3p0RkQwVmd4REkybkZQYjJV?=
 =?utf-8?B?dXhRdEduU0E4YkYrS0tHL1hKSCtwcm45K0VYL0N6aVpqbzcxc0piMGtHTjFu?=
 =?utf-8?B?M0V3aElMTDl2bXFYSFRiTDRyK1ZuR0kwVUVtN0pjcUlmM2V2c0krNzNUWkJO?=
 =?utf-8?B?cW5IeWFrVTBrK1VCQ1AzUlBqSGE1NFFyMzRDRHJVVS9maEMzSTlzY2ZxUDJ3?=
 =?utf-8?B?NU5YVjZTRWpoZ29ad2haRDQrMHNIRlU2WEtzOGd2VlRMNjRmalB3ZjFBcE9Y?=
 =?utf-8?B?QklmUkROYjFwNldkdk5IZlR2QURGWVdYcWc1S1V1VTBmOUpES2JuM3NuRnNu?=
 =?utf-8?B?Uyt0ejNrdXl1OVZKSmRrYU1tSkZaZm93NVUzbVk1UStVY3hUNEV5S0lHYXBZ?=
 =?utf-8?B?c24vQlF0YjJSc3BWZ1Nma3ViUHdxZ0hMTDdKSGxLOTd4UGRWS01TOW1KcG52?=
 =?utf-8?B?MWp0UkhmeVFLcnQyZ2lldDkwNUM0K3BiMnpBd3FqME12bmI2ZE5UQUlFMTNU?=
 =?utf-8?B?RXNDa2t0b05YZnNXVGpLR1pZRzY2Tm9tcWxxUUptTVBVT1FNRVdpZzRFbXhN?=
 =?utf-8?B?V1hWaW5yRHhvUHNJUDFpYlBhL2xxeGJRSytLMGNRbjVzcURyNVNIaUpuTzB6?=
 =?utf-8?B?RXM5cFdTODUrVkRrd1ViTFlMcTZnRHFFZnprMFhjWm5ZU2syZnZqMWRHVGp2?=
 =?utf-8?B?VmxHdmFmWUo2MkwvRDl5S2xUN0tJY0xBb1l3bkxDWE5yMGJFMi9DR1Jaa01I?=
 =?utf-8?B?d0NTYVhhY3lLaTRzNGhIaXlRYW95VXVVYVZIS3pnTmZheHBWcXg0Yi84dmtT?=
 =?utf-8?B?dGtpWEhiVGk5ODVrbGxKWWYxQit1dlEvRGRvZFdiWkM5UmtPTFYwREVwNW83?=
 =?utf-8?B?Vk9WdGRZbDlMOFJBQXJ4QkphanVnZi96djA3aGdKeVFuL2wyWnltOUJINFNl?=
 =?utf-8?B?WWxSWDBqZnhjc2p6YmZIY2I0THdwd2NmK0kwcE5MSWJEOS93UzBUUiswNmdw?=
 =?utf-8?B?NE9NRGNsak43VURSUHJORk05eW5FWHNUQ0xOYW1sZHIxNExNRjI1SWYzVVVY?=
 =?utf-8?Q?4RAIfa?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024)(921020); DIR:OUT; SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TTJLNGxMWi81bkQ5TzBLQVVFSjdXVFVHL215RkY3N1BYSG9IMDVaT3d6NWt1?=
 =?utf-8?B?bk0rbkdvMVp3d2xPTXJ6bDh1RWl3akY4cmJGeUZZeGw1QkhZaENiZlJFWTFP?=
 =?utf-8?B?Z0hhcGU0MDFkRy9DNVd4VHJYckRocVdIMU1kUjR3RTJ1SGFqZUJRL0JVK09U?=
 =?utf-8?B?L0xsMFd2KzdWS3g5YnM0bTE3NHR0Ry9MRWIrdTFCM1RqVTUzR085TnJ1Y2lJ?=
 =?utf-8?B?dUV0alVWYllGbTNQK0FZR0tPYXBUMVJ0TVcyaUpvb0svTHl3SlRKU2NSbmY3?=
 =?utf-8?B?RE1YcE1LUDB6ZE1kNmFocDF1SzlqVDVxSTZPU1Q3K0dMVzJkMy82ck9BdDFW?=
 =?utf-8?B?LzVIR0NLNkVrWkladVh2eDlWK2RXU1VYK3RvL2FzeVJMWG5uY0pzY2J3dnVy?=
 =?utf-8?B?ZUtwS3J2NnVjSlhnY1R1RnpUdWoxcVNrdXpXSzZzOVVDajZPcUs0OEU2ajF3?=
 =?utf-8?B?U1RDQW9Ma05vbTBHM0pyZjVPTzIvNGswekk2M24vTElzaGtGYVlGOVRUVXh6?=
 =?utf-8?B?eCt2YytQZjJyVm5uSU0rZW9WMEs0dkl1S3A0N3Z2OTRuYnExcnFXSEd1TDFX?=
 =?utf-8?B?VG9QQno1Tm9naDRMWVJXQXFOYlJuL0M4SDR3M2pHNWhiNFNtUzFSbGVZdjBG?=
 =?utf-8?B?K0ExaExqVXd6L0lpWk5saWZoZ0VUc0lFb1lHL3FXMTVOcEpHbzQ5c3p0ckda?=
 =?utf-8?B?RWMzc3pReUdobTNtd3IyUnlQdFJrWkhhZWZ0SmI2TmRkNERveXlnVU9XekN2?=
 =?utf-8?B?TFBJTlZmY2lOUjlRQW5aWmNOL2NXbjBhWGdwVGF2Z2lRMkNCWjd2UVo2M0ht?=
 =?utf-8?B?OHNlczRISmY0K1NwWHY3d2hzOVRVcmZDUlpLOVZWM3RiZ0JmTGJyd2VwaWVa?=
 =?utf-8?B?QjErdk45b1BWWlpsa25tMFk3U1YwVUdoRjRBYlRCbTRNd211WEQ3RmFkdjA1?=
 =?utf-8?B?aERPTjU3R0Z5dDJqOVNCSmR0ai9DUzZaS0puR0RseVBDUjlRcE1jNjQzQzFS?=
 =?utf-8?B?alVNQmJuaXB5MmxqRTRwbGNZUmVXbHNBYU1naDFZNG9xc0pmTmlCSldqdktp?=
 =?utf-8?B?RWNBYnZSTDBZQWhxbEVrazBHSWkwYnYrZHVURlN1cnk5bGNUbmNsY1Fpc3ZW?=
 =?utf-8?B?UU44OWpoeEJscWFwNDh2RllOSy9MeHhEK3g3bEs2RlkvNlJFWXJtdXlldW5W?=
 =?utf-8?B?MDZlWGoxOWkyaVFOZzN1cFlKQ0h5eEVtQ2RIWFBIVzFGcFJFUjkzMkVQU290?=
 =?utf-8?B?RXE0dERmN2psa2RTNlE5QzBrMmE3blhpcFh0THBOdCtXS3dOaTNRQ0p2ZkEy?=
 =?utf-8?B?RkZ6R3VxSHg2UjgvbWRqRnJMU0ZNSFFNd00xR3dvZjVtOFBuUXJBTUdxZ3dM?=
 =?utf-8?B?dGpLdzBWOElJMHhxRmtlL2hIK2lTODkyZnhMZmQxVm00bDhQU3ovTDZ3V1RT?=
 =?utf-8?B?Mzlwd3ByRktDNUhSWUFuNkd4NkVuNFVYMUsrWGVVTVdKN3ZubzBsRS9EWnZo?=
 =?utf-8?B?KzNKUGt1RUNJR0dkNHUxdGF3MFJzaUZxTnRRSjdwaGVvNlN1UjBEVHJQVXhK?=
 =?utf-8?B?TW1VRE1McFZ1K005QmpOMXQ2VkVMT25NMHRUTGxqZkdKRExNZ0k2eU4vcjNX?=
 =?utf-8?B?dmUwNmRPY1BGTk01Q3lqYmpIV2txWUxLMDVpSDZkRHYrdENXeHhFemUyQlBX?=
 =?utf-8?B?bkdBUnZWdlNibTFFOTJxK3JybWl0SjJ3WWx4cUkrbi9GcUhWYURmNCtNbUV0?=
 =?utf-8?B?SUlTYm5xRWFJSy9sTEVqbUc2eVc1TTU2NzZseU5WOGN0TW5nUldpL1RvUVU5?=
 =?utf-8?B?YnBaSThwWFk1MlQvQVhYdTZ1MFo4MVo3SmpsRGxwVGR2NjhmWkk4QlVocTlF?=
 =?utf-8?B?aEFGNTV0RHE3a3owSkRkdEx4bUowcG1MeWJNNlFTeDJsQzhLQk9tYVluREJ6?=
 =?utf-8?B?VGdLaFdyWXliWmFmWitmblZkejRPUVBXNmdNaERTSVJ3ZC9FVG1RWGN5c3BO?=
 =?utf-8?B?cGVXSlZGZ090VzdyUEtsV1psTzQ2WXV6TjJDUlhQU2tMdXAzcmhuek1ia2Vt?=
 =?utf-8?B?RCtQRXpONm85dGJPKzFtRVFvRDhQTm5TZmFIM1pocExNOWIyaTlrclB3YTdj?=
 =?utf-8?Q?/tprIwPPAl96zl8GDEiQgRzRw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c204f926-7bdc-4ed0-226f-08de277bfa03
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 14:57:36.3897 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XTpBk3SlI0SU+0olvZFovpCytItwX5LWzvewAQiPxnKLwFzfW5CIsUrr4VmwE+3T
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9638
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

On 11/18/25 16:00, Thomas Hellström wrote:
> Hi, Pierre-Eric
> 
> On Thu, 2025-11-13 at 17:05 +0100, Pierre-Eric Pelloux-Prayer wrote:
>> Until now ttm stored a single pipelined eviction fence which means
>> drivers had to use a single entity for these evictions.
>>
>> To lift this requirement, this commit allows up to 8 entities to
>> be used.
>>
>> Ideally a dma_resv object would have been used as a container of
>> the eviction fences, but the locking rules makes it complex.
>> dma_resv all have the same ww_class, which means "Attempting to
>> lock more mutexes after ww_acquire_done." is an error.
>>
>> One alternative considered was to introduced a 2nd ww_class for
>> specific resv to hold a single "transient" lock (= the resv lock
>> would only be held for a short period, without taking any other
>> locks).
> 
> Wouldn't it be possible to use lockdep_set_class_and_name() to modify
> the resv lock class for these particular resv objects after they are
> allocated? Reusing the resv code certainly sounds attractive.

Even when we can convince lockdep that this is unproblematic I don't think re-using the dma_resv code here is a good idea.

We should avoid dynamic memory allocation is much as possible and a static array seems to do the job just fine.

Regards,
Christian.

> 
> Thanks,
> Thomas
> 

