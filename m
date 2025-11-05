Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 180E6C3508A
	for <lists+dri-devel@lfdr.de>; Wed, 05 Nov 2025 11:07:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9867510E6F3;
	Wed,  5 Nov 2025 10:07:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="WPHUt4b1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013036.outbound.protection.outlook.com
 [40.107.201.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2322E10E165;
 Wed,  5 Nov 2025 10:07:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sJe2SmknfTqK6fEAoITjkI8hNPoOG8Xrwmfjg35DSheQ6VnzWXZPp8zfbhev/62cuehns9NANE5ssl9QEeTWYwnV+GHWI6nyW9qgbjSPgdbrxX4v5eL6EsBvpQJHcAQYQ41RXJSqDhVFIdCZ5dxy1aj8ZCg39a7iPJuxHldhbofgGfVTbhCSOGiTzcN99KLa6nfbV8crM+gE2j3JIpqt21xzfjqqhdVtX/egdU0GdPH5Np1Vo4U/8CsDoLLbaYV1wmIYjyanvDNuWEgjbcibHbeAYtK2aPQ9aq6MNB0qEFLXOimm2xDw8tW54zNw7x/XoSe3bgdWRTcIMz/GUCeeAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ac7lMtAupSsNw9cLRk18OYqLm4HZWAQuy1jpzRff6bI=;
 b=wVVsjaJYuTFq5nx3NROuQe8OKkfmn76Kr2aAERnx4C2Pwb0mJKJ08xqPYTN9pa0fqKpFuNfC2rcgy+YwHf4hVWfdP+ubW88PpHw3nfC1rhk/CuXoMmp4C6TwZ1Qr97Q6pRn+yHG90NgUAsEMOEr1VtmXjF8b1KyTjSN5+LO+DqZsCHJgswGGtqenSjz1/ttOtBkMBOjXG2dQ1pZdGMSeqn10fWap/Qbi0kBVqbjwBKR+KMQ9omTJV0esdigRp3TavMHY3WzC+s4gAmyZvIpYZRjZAjUT70/wezNC9RFgrOBwkayn8Viund8M7dNcBhiEDANTenjlA86nJ8tzI8lzhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ac7lMtAupSsNw9cLRk18OYqLm4HZWAQuy1jpzRff6bI=;
 b=WPHUt4b1B1Jnku1Hodm0s7BrrhN4a6deyU96Nk86G9VBLJaEVFK4+MqN3349u6T76tffd/mxsTRfo09Mh9YPJK3CJtyTMSNmpwX5yp6dGZeREnZw8vkx4c3ujgX++Dah1OxkbypgDk9j9j+mSEztEpyr4k3E3A1pFtoeZDgAC+U=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com (2603:10b6:a03:42b::13)
 by DS2PR12MB9799.namprd12.prod.outlook.com (2603:10b6:8:270::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Wed, 5 Nov
 2025 10:07:37 +0000
Received: from SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062]) by SJ0PR12MB5673.namprd12.prod.outlook.com
 ([fe80::ec7a:dd71:9d6c:3062%4]) with mapi id 15.20.9275.015; Wed, 5 Nov 2025
 10:07:37 +0000
Message-ID: <9d3fb5f6-6e54-46e0-9b49-23bce4f4bfd9@amd.com>
Date: Wed, 5 Nov 2025 11:07:32 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 17/20] drm/amdgpu: get rid of amdgpu_ttm_clear_buffer
To: Pierre-Eric Pelloux-Prayer <pierre-eric@damsy.net>,
 Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
 linaro-mm-sig@lists.linaro.org
References: <20251104083605.13677-1-pierre-eric.pelloux-prayer@amd.com>
 <20251104083605.13677-18-pierre-eric.pelloux-prayer@amd.com>
 <ca139b41-b4c3-4f0a-a2c1-8cfab6032625@amd.com>
 <9742acac-9402-4351-8cff-559ba6536629@damsy.net>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <9742acac-9402-4351-8cff-559ba6536629@damsy.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: LV3P220CA0026.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:408:234::27) To SJ0PR12MB5673.namprd12.prod.outlook.com
 (2603:10b6:a03:42b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ0PR12MB5673:EE_|DS2PR12MB9799:EE_
X-MS-Office365-Filtering-Correlation-Id: 8485eabd-8ea2-45d6-47e9-08de1c5325cf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?V2pURGJlODBmWmJqd3o1OUg4RFZlOGFoN09lWWQrTDJmNHU2eHJrQkFMQVNM?=
 =?utf-8?B?ejM2QXhxODBYcHlmVDhOSUpMeTJzaTJJYXlVUTY4cHh2T282ajBUSE9JK2Ji?=
 =?utf-8?B?Z052WWpBVVNpdmNtUnRhVUk5aXZIVjVXTnNNOW9NMVJORzBqYTl4Z3FGNjNN?=
 =?utf-8?B?T01YM1FZUkN2Kytma0VPTGwyaXNVR212bi9CZlAxUXo0R0kyTUszSWQ2ZUMv?=
 =?utf-8?B?Yk9pU2FNT2hua2pjVWFzNzRGZHZTcTRBS3prMmFJTnNaTUd4WXBoK1F6ak11?=
 =?utf-8?B?ZGRMUnVRaHRoTVZVWTJqaEpMTHNKR3FuaTFod0hEVjF6MUhDMnJwQjJRMjhV?=
 =?utf-8?B?ZlJ4b0gycnBadXdLTlpqWm1zbzNrUFhVS0crRy9XQkFJS2c0RFM3aGtaQm14?=
 =?utf-8?B?RVhKZnZWM0ZrZE9sRGltZnNRblJhOHlpcmxxUzhzZVRGVURhWUtycFZQeTFt?=
 =?utf-8?B?SEt6SzhxVUREdzllSGdESFRjNXY4ajRJcXgzdG5vaFpZTG9BTHF4VUQvZ05n?=
 =?utf-8?B?eWpUakhMOTJqaHg0R2tVUE4vVGU3djdweTdCVi84UC9QcnAvMW9jVU1VYXFo?=
 =?utf-8?B?NTdwaWxmM0hRaWpsdXRvLzF6NVY2eUZWSnIzd3pqSVF3WExvb05mUWxYcnpl?=
 =?utf-8?B?bGRzWnBNVVBSaUUxL3VBZXhqMDNVRWFxRytxYW4velVkdTdUbndGSmx2VGtn?=
 =?utf-8?B?dndKdE54KzB5eGp0T0VBNk95Q2I1eUF6S0ZWQlNrL0IvN3dZK0JsNUVtSzJH?=
 =?utf-8?B?Vk1IQ204OGJOcisyWnJURU50T3hjWXZ4cUxBRTNBRDV4ODRhSW9vZEN6RWVK?=
 =?utf-8?B?QjVRSXRURExDVWI4ODRlZXBwOVhhRUtwS2tQeVUzRUVPMUs3MHJFMTlrRE41?=
 =?utf-8?B?VGF0UFZEUVZxYXdua1BmdFNnTEdHMzJ2ZzJCUTQrVEhEd1dwR3VBeE1udmxx?=
 =?utf-8?B?Y0lHSHVYVU1LRytjd29VZlBNR2c5eVdMVlhVbTRKc2dsSng5NjRHczIwZWJy?=
 =?utf-8?B?OEFJSy94M2NWM1k3WEtsRzY2SFpGV1k1YytvNENQOFArZ2ErWi9XNkxwMDIr?=
 =?utf-8?B?U0YrTk5aNCtDaVFZbHhiRkhQR3Q1SjB2RGNXK3FKUjFLZi85Zk9UdFNEemlw?=
 =?utf-8?B?QUx2cWlJWWNNVzNRVGRGbjl1cyt2WURiZnptUG1peW1GdGI4OCs1WVVWQmhT?=
 =?utf-8?B?NU9PT1dPeFZNdmVUU3lXMXZQc0laL1drMDZxNDNTU2NzVURxR2VoY25ER3ZN?=
 =?utf-8?B?aEtRcllpOFRaSlFuSi9kZ28zSUo4aitldE5jNGJJeERMY2NTc1JjZXJoOXZ6?=
 =?utf-8?B?THZpaWpha3MwSlc2QkhOYkVSMnFrTlM1U0lvbkVWT05QTDRLYlVlbS9QL1hq?=
 =?utf-8?B?M29wMmRZL0hpVkxmMnF3SGRtMmdVRUJiYXp2dkVHOXowTXFnQkRhN1ZFTThv?=
 =?utf-8?B?eTduRVh5V0Ezc0lUWC9ISm1MZFcyK0hhWExFWFgramViU1hMMkVLTjIrUkdT?=
 =?utf-8?B?Mkxwa0pSR3ZzQXhkT3FYT09mN0NYb3RiVE5uOFFkUVpsVW45Q3FyYzl3cmlP?=
 =?utf-8?B?YWozdis3TGFUV3pvTHBuVVhqVWxmbVZYamNaMTEwdld0aW5YZ21aSzYzc1Ju?=
 =?utf-8?B?Si82RDl3SE5pMjZCRXZiU045a0xNQUNWT1VSWnNNMXN0cy84a0xYWGkvcXhY?=
 =?utf-8?B?MjNsbXdVSU1NajgyWkdjQllyQ0VZcnNsSmx4SnZRMmsvQnJIU1htYjhVS0V4?=
 =?utf-8?B?RHI5VFdKWHpSNzl4dko1ejVTenRGUXJWZEg5eDcrUzBNZW1FQktlenZwWWRJ?=
 =?utf-8?B?UXFMK0UyQkZnOXhOaUEwaWhVM0xjZVFjTkdkb2ZidE0zMDE5ZnRndXNqUndV?=
 =?utf-8?B?NWRFWlA2VkpnakN3STBXZUJXaDYrZm41c0d1RWIyTFBBd0xPS1RBejN2V2Qr?=
 =?utf-8?Q?65/bk8AkZHE/3GDoJdJE5vWWmnKr+iyC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ0PR12MB5673.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cVh4T0UyckdzSkllTG5EYmV3MHRvRitXMWpPdkxRTnptSVZTeEYrY2NwWWdl?=
 =?utf-8?B?U0xaVDhWdHVDb3drU2RjTDBBZHFEUWNCNXBBbkZoUVpTeG90akhKM052UGFw?=
 =?utf-8?B?Uzk0N3lGOHZEa3hqMjkzNVZGWi9wMFlGdURYOTVYT2pQbXpzUkNaMDVWT1hJ?=
 =?utf-8?B?bWRRbnhUYXlqcXdTU3drZU9jMG0vemNqOGxNZFdMTXZEQU9xZmFnMTk2T3Iv?=
 =?utf-8?B?UytWWU90SVN5bGg4dDRhQmlVU1k2cWdsa09PeWs3TU9mc3VnRU5vS1VXeCtX?=
 =?utf-8?B?MGorUzZWaVViYkZYN3Ftb1ZIclovRXROYXJyYWFRbS9GNVpBVGFJQ2F0eUM2?=
 =?utf-8?B?ckV6R2tLSnNkYlhlZEV4Z2dIRzcvT1JmdHdqOHo2b3Q2WVJtenY1c1hqd2JT?=
 =?utf-8?B?MEZXcThaV2xOSnowRGplU2FHRTk1aWNUcGlOMFN1MjY4MTF4bVRJTUhIaW1p?=
 =?utf-8?B?ZlE3bVZUMmFhU0dZTGM4UGlPUGJNQ0ROejNQK3ZpWk0wT1FaMWVKRS9wR1gz?=
 =?utf-8?B?K20wbzhabEwrY2dGS082WjYxeXJ3YnFrdFJWcUpSZ3JFdXVvd1NSc2ZuaVVK?=
 =?utf-8?B?ancxY1Jxdy9PRTZVYUxuTW5HVXY4NllXT2Foak1LcGU2a1QwcDh4SStYNnpa?=
 =?utf-8?B?Nm96cjVtY1NuNEFvandNUlNaV1EzdmI5RSt5L2xUS0RTV1JMQUl1a1JlcDBE?=
 =?utf-8?B?RUt5SGl5Z28vV1Q2REI4WjRxcUhFRmwyeHU2bFlKZnFWZEdvWkE1a1RLWVNB?=
 =?utf-8?B?eUtaTk42Q3BmZEJFLzRuVDFRYjVqTmZvRnA3aGhFekJRUWlYcDFlaDh6Syty?=
 =?utf-8?B?QzlyaHE3bVhhdlUyTW1objBxQklxZ1NpYysrZ1VQUnljMW94VWJzOFRnNDAx?=
 =?utf-8?B?U2tRSUlqK1hKM0MvNXo5WjVyRG9EMzhRVThNcW02NWRxcUFUam94Yjh6MHlY?=
 =?utf-8?B?Y1U5UDljSk52WUdvYTNPSlYzR0ZOY0VPVnhzUXZKZHpyOHJ2WUluaURkd0tC?=
 =?utf-8?B?TldVZGlhZ1ZacTVmVmMwbjdoY090SlVUSk1OM0kvVE12QVBtam9KaVRsb1o5?=
 =?utf-8?B?NURGT1JPdmJHVUpNemZGdXdGMGdrVld0ZkdSRzBHTXlFMWtEODg4SGIyN3ZQ?=
 =?utf-8?B?cVlvRFkrRU1CdHVHRVJRRnQ1RmdlQTFxa2tLUG4rTGdxcHNaVExMU2VVTkIx?=
 =?utf-8?B?djQ0b29wSEFWdExGSmd1MDlrdUdCeGtENDc0Y0F4ZjR2VDI2RFNqdDdGWGZh?=
 =?utf-8?B?eCttRHFWalJabXdic09yQ0JwRXFsSVZzM3FLR1QyNVhENThXY28wdUN5VVFo?=
 =?utf-8?B?VXpsQWRwY2V2NnVWbUZaNVNpZ2xpNXgwZGc4YmVkelNQamR6bTFzRGJSZEFR?=
 =?utf-8?B?NCs1bXRyWHJhUk8wUDk5dzlVTEVBSGdpRUk0M3Bmc1h6YTlTZG5yMWdnbU1F?=
 =?utf-8?B?V0RnU09RdjB2dTZkZ3JqbHFET09KSFpYTkZrYTJZUWlSMUhob1FMNTdCeENt?=
 =?utf-8?B?OHRPRlVldnJ2bWU2eWhqbGtJYmZPZjJWVVh0YjI1emVMSmJyU25RUzlPNnFH?=
 =?utf-8?B?T2M5M3pTdDlGVWg3SjZ4OVB6aUozY01Fa1ZGTWNQNVhrMVpoTXdhSHlsVFVC?=
 =?utf-8?B?N2dEeE1NaWc1dEtJMzQvSldVY2tHaFBWSmREcGFxbzRjNVBuTTZJUFVUb1RC?=
 =?utf-8?B?b0pvVDBnSWtFUTZOSVd3YnYrYnAzR0pDNjM1WS9wZ2ZlNXZIekROTGk0R0NL?=
 =?utf-8?B?U3JPN1ZCTHhrbGMxNHRNeGIwTVJNa2wxSk9tOUVOOUhaT1k4MWZEWXlCeUly?=
 =?utf-8?B?UDVnaVNZemdhS3ozYTR3NmhWYm84OFZrcHRnUmNCSEs2TEhHVHkxZE5QdEVG?=
 =?utf-8?B?Y0IvMUlCUUlxdlZyVGdSMENxbFRyb28ya2ZIUHVVbjlpUmk1RHgxRjc2Z0VS?=
 =?utf-8?B?bi94VFVma1lNWUZ5dkxTdjFGMmlzR0d6SmhFZUN4L2tGNU9zS2FjQlluZDZh?=
 =?utf-8?B?Y0hOaExYKzFlZElaMUZsWHZWT1BpQXZMYkd3U0I4K2VDclpqeGRKcHJ5T2lO?=
 =?utf-8?B?TW9nOVgvUytjZjlwb0lWcGgyQUE0ZUNIZEhRazVCOU1SNTZpWlEzSE9KV0pS?=
 =?utf-8?Q?LobcKTTH1yJKP8ngyZYCl/6zr?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8485eabd-8ea2-45d6-47e9-08de1c5325cf
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB5673.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2025 10:07:37.6568 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /gTE3K+8j7cS/yPZlXGNOc7zCr7E9ELv3oMB+NV7gjsaI4Iq0CA7dV10W45217d3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9799
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

On 11/5/25 10:30, Pierre-Eric Pelloux-Prayer wrote:
> 
> 
> Le 05/11/2025 à 09:46, Christian König a écrit :
>>
>>
>> On 11/4/25 09:35, Pierre-Eric Pelloux-Prayer wrote:
>>> It's doing the same thing as amdgpu_fill_buffer(src_data=0), so drop it.
>>>
>>> The only caveat is that amdgpu_res_cleared() return value is only valid
>>> right after allocation.
>>>
>>> Signed-off-by: Pierre-Eric Pelloux-Prayer <pierre-eric.pelloux-prayer@amd.com>
>>> ---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c |  9 +--
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c    | 86 ++++------------------
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h    |  3 -
>>>   3 files changed, 18 insertions(+), 80 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>> index 4a69324bb730..410e9b68ff81 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
>>> @@ -723,15 +723,10 @@ int amdgpu_bo_create(struct amdgpu_device *adev,
>>>         if (bp->flags & AMDGPU_GEM_CREATE_VRAM_CLEARED &&
>>>           bo->tbo.resource->mem_type == TTM_PL_VRAM) {
>>> -        struct dma_fence *fence;
>>> -
>>> -        r = amdgpu_ttm_clear_buffer(bo, bo->tbo.base.resv, &fence);
>>> +        r = amdgpu_fill_buffer(NULL, bo, 0, NULL,
>>> +                       NULL, AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER);
>>>           if (unlikely(r))
>>>               goto fail_unreserve;
>>> -
>>> -        dma_resv_add_fence(bo->tbo.base.resv, fence,
>>> -                   DMA_RESV_USAGE_KERNEL);
>>> -        dma_fence_put(fence);
>>>       }
>>>       if (!bp->resv)
>>>           amdgpu_bo_unreserve(bo);
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> index d88bdb2ac083..1f553c56f31d 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
>>> @@ -2412,75 +2412,6 @@ static int amdgpu_ttm_fill_mem(struct amdgpu_ring *ring,
>>>       return 0;
>>>   }
>>>   -/**
>>> - * amdgpu_ttm_clear_buffer - clear memory buffers
>>> - * @bo: amdgpu buffer object
>>> - * @resv: reservation object
>>> - * @fence: dma_fence associated with the operation
>>> - *
>>> - * Clear the memory buffer resource.
>>> - *
>>> - * Returns:
>>> - * 0 for success or a negative error code on failure.
>>> - */
>>> -int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>>> -                struct dma_resv *resv,
>>> -                struct dma_fence **fence)
>>> -{
>>> -    struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
>>> -    struct amdgpu_ring *ring = adev->mman.buffer_funcs_rings[0];
>>> -    struct amdgpu_ttm_entity *entity;
>>> -    struct amdgpu_res_cursor cursor;
>>> -    u64 addr;
>>> -    int r = 0;
>>> -
>>> -    if (!adev->mman.buffer_funcs_enabled)
>>> -        return -EINVAL;
>>> -
>>> -    if (!fence)
>>> -        return -EINVAL;
>>> -    entity = &adev->mman.clear_entities[0];
>>> -    *fence = dma_fence_get_stub();
>>> -
>>> -    amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &cursor);
>>> -
>>> -    mutex_lock(&entity->gart_window_lock);
>>> -    while (cursor.remaining) {
>>> -        struct dma_fence *next = NULL;
>>> -        u64 size;
>>> -
>>> -        if (amdgpu_res_cleared(&cursor)) {
>>> -            amdgpu_res_next(&cursor, cursor.size);
>>> -            continue;
>>> -        }
>>> -
>>> -        /* Never clear more than 256MiB at once to avoid timeouts */
>>> -        size = min(cursor.size, 256ULL << 20);
>>> -
>>> -        r = amdgpu_ttm_map_buffer(&entity->base,
>>> -                      &bo->tbo, bo->tbo.resource, &cursor,
>>> -                      entity->gart_window_id1, ring, false, &size, &addr,
>>> -                      NULL, NULL);
>>> -        if (r)
>>> -            goto err;
>>> -
>>> -        r = amdgpu_ttm_fill_mem(ring, &entity->base, 0, addr, size, resv,
>>> -                    &next, true,
>>> -                    AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER);
>>> -        if (r)
>>> -            goto err;
>>> -
>>> -        dma_fence_put(*fence);
>>> -        *fence = next;
>>> -
>>> -        amdgpu_res_next(&cursor, size);
>>> -    }
>>> -err:
>>> -    mutex_unlock(&entity->gart_window_lock);
>>> -
>>> -    return r;
>>> -}
>>> -
>>>   /**
>>>    * amdgpu_fill_buffer - fill a buffer with a given value
>>>    * @entity: optional entity to use. If NULL, the clearing entities will be
>>> @@ -2508,6 +2439,9 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
>>>       struct amdgpu_res_cursor dst;
>>>       uint64_t cur_size, to;
>>>       int r, e, n_fences;
>>
>>> +    /* The clear flag is only valid directly after allocation. */
>>> +    bool consider_clear_flag =
>>> +        src_data == 0 && k_job_id == AMDGPU_KERNEL_JOB_ID_TTM_CLEAR_BUFFER;
>>
>> Absolutely clear NAK to that.
> 
> I suppose the NAK applies to the check, not the general idea of the patch?

Correct.

> In that case, would passing "bool consider_clear_flag" as a parameter be ok ?

And then determining the k_job_id based on this new flag? Yeah, that sounds much cleaner.

Christian.

> 
> Pierre-Eric
> 
>>
>> Christian.
>>
>>>         /* The fences will be either added to the resv object or the last fence
>>>        * will be returned to the caller. In the latter case, all fill jobs will
>>> @@ -2531,6 +2465,11 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
>>>           while (dst.remaining) {
>>>               cur_size = min(dst.size, 256ULL << 20);
>>>   +            if (consider_clear_flag && amdgpu_res_cleared(&dst)) {
>>> +                amdgpu_res_next(&dst, dst.size);
>>> +                continue;
>>> +            }
>>> +
>>>               n_fences += 1;
>>>               amdgpu_res_next(&dst, cur_size);
>>>           }
>>> @@ -2550,6 +2489,11 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
>>>       amdgpu_res_first(bo->tbo.resource, 0, amdgpu_bo_size(bo), &dst);
>>>         while (dst.remaining) {
>>> +        if (consider_clear_flag && amdgpu_res_cleared(&dst)) {
>>> +            amdgpu_res_next(&dst, dst.size);
>>> +            continue;
>>> +        }
>>> +
>>>           /* Never fill more than 256MiB at once to avoid timeouts */
>>>           cur_size = min(dst.size, 256ULL << 20);
>>>   @@ -2574,8 +2518,10 @@ int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
>>>               goto error;
>>>           }
>>>   +
>>>           r = amdgpu_ttm_fill_mem(ring, &entity->base,
>>> -                    src_data, to, cur_size, resv,
>>> +                    src_data, to, cur_size,
>>> +                    resv,
>>>                       &fence, true, k_job_id);
>>>           if (r) {
>>>               mutex_unlock(&entity->gart_window_lock);
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>> index c059a3d52b57..97e73919cb0c 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.h
>>> @@ -182,9 +182,6 @@ int amdgpu_copy_buffer(struct amdgpu_ring *ring,
>>>                  struct dma_resv *resv,
>>>                  struct dma_fence **fence,
>>>                  bool vm_needs_flush, uint32_t copy_flags);
>>> -int amdgpu_ttm_clear_buffer(struct amdgpu_bo *bo,
>>> -                struct dma_resv *resv,
>>> -                struct dma_fence **fence);
>>>   int amdgpu_fill_buffer(struct amdgpu_ttm_entity *entity,
>>>                  struct amdgpu_bo *bo,
>>>                  uint32_t src_data,

