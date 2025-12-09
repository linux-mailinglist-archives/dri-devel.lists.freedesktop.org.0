Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E17ECB05E1
	for <lists+dri-devel@lfdr.de>; Tue, 09 Dec 2025 16:13:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B619910E1EB;
	Tue,  9 Dec 2025 15:13:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="yIgYCAsm";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011012.outbound.protection.outlook.com [40.107.208.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7DBCB10E1EB;
 Tue,  9 Dec 2025 15:13:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t95qVXrwFSxgpDqZAD1Y8WXWyc/q4NvTCqxA1nh0HG+ymf3vcRVq/Juv+nhigYe6vWZCPvjE9Jz6vNIBDcThBrrtAG6IdGaXvkRjVUMbWn1XpVWIJRnryNyl8ypfE2sx+E7ncEl/Yb/A3LBGgDVY4cRylsVh6oqiETO7L27HxlW5fcCZ3+2SSfqeHHu92YDvEh/uMzB/fQfQlzpqcY2CbpZ6f/QIb51ordDskqJGGYcG4ZJYmUKSlFZCJOPAeYmf1uW2+rWgAMESsRqIs5cPERagiXjz0UEVUqRKmcZNKrVX5Qt15Tp8jry+Km2Iw1iJ5//7EEXzdcg+wfDDo9ShzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F2aN6+PZCoEcZKq993W3RIDp8eNKI009oSxriseclB8=;
 b=H0rV1+8IEXJfTyoq67Eo7viZJhur2JAZ5DifNbbITK6A6AsHP8NP79YGvGgVutzJEmOoTbrGm8qw3Ta3zcLrHgP1Cle6EjWEysJIx+TW2FjM83YE9XOc43NkxFpGoTHjY0MwATfruSqwPLpg+fTFJYhHbXd5sMWyPqzRTetIDE0V5VbcgO4qZ+vca9dAKFtWj0bk+SihqnLpRlHtGRU605cardEcp9cqwTjAj0mh8iY9twP5WiuJ6mQ0NxyCVWExhDffCEybc3ToFHz+61hBmL4n8bPCoRK1KlH+SiOuhVIe9Nqgg8Tnuf5oPdlWRzQUnHBdOCd5NdS9wmYTnEzQ7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=F2aN6+PZCoEcZKq993W3RIDp8eNKI009oSxriseclB8=;
 b=yIgYCAsmPZ42xV7MoWf6fyBrwc3kNcGDv/g5NLIlawBEKXWvsP/8w6x3dHbnc9J/k/Bqn5QdU3AD8lQ+Nhxsy6KDnblRhI4LBzghJ8DpFceZB4mlHTOEdwLkofVbcQSLftPSlswlZEcWVvARtNCJn7hmLQgY7IfRimfK4IqwjNI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5126.namprd12.prod.outlook.com (2603:10b6:208:312::8)
 by DS5PPFBABE93B01.namprd12.prod.outlook.com (2603:10b6:f:fc00::65f)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Tue, 9 Dec
 2025 15:12:45 +0000
Received: from BL1PR12MB5126.namprd12.prod.outlook.com
 ([fe80::c3e7:1bc5:2b91:1cfe]) by BL1PR12MB5126.namprd12.prod.outlook.com
 ([fe80::c3e7:1bc5:2b91:1cfe%4]) with mapi id 15.20.9412.005; Tue, 9 Dec 2025
 15:12:44 +0000
Message-ID: <c78c6b61-a28c-43b7-8c88-ddce497a465d@amd.com>
Date: Tue, 9 Dec 2025 10:12:04 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/2] Fixes on CM3 helper for plane shaper LUT
To: Melissa Wen <mwen@igalia.com>,
 Matthew Schwartz <matthew.schwartz@linux.dev>
Cc: airlied@gmail.com, alexander.deucher@amd.com, christian.koenig@amd.com,
 simona@ffwll.ch, siqueira@igalia.com, sunpeng.li@amd.com,
 kernel-dev@igalia.com, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20251208234741.293037-1-mwen@igalia.com>
 <6fbc0496-9a96-4f72-a8d8-66b7885bdaf6@linux.dev>
 <ae3d39ec-e220-435e-9cc9-e316591cf0f1@igalia.com>
 <bb175945-665b-4cbc-b021-45e19e0f0e84@igalia.com>
Content-Language: en-US
From: Harry Wentland <harry.wentland@amd.com>
In-Reply-To: <bb175945-665b-4cbc-b021-45e19e0f0e84@igalia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQZPR01CA0100.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:83::21) To BL1PR12MB5126.namprd12.prod.outlook.com
 (2603:10b6:208:312::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5126:EE_|DS5PPFBABE93B01:EE_
X-MS-Office365-Filtering-Correlation-Id: 61fe48b3-9cd9-46b7-980b-08de3735679f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VStSYUN5MVV3azdUTHkwUHRYSDE4a04zTVgvM09WZXJ1VnpHdlhzK0YwdjNC?=
 =?utf-8?B?WEJUUzF1d2ViQTNhMWNGZlhjV0p3bEFjRmlXbyt2WEt4UFBSWWFmNFUzZkxu?=
 =?utf-8?B?ZmdVanJrSlRMVWpPWnhwZ2U1bzFzcW5FMHMrQThQN2dHOGZ1OGxiUWRzMXA0?=
 =?utf-8?B?TERzODMzUVIrNlB2cVZDV3R4aUkzRUZDL0NMd2RSaE5LbWZIVkNKeFgzaEt5?=
 =?utf-8?B?aFpoVUUxbDhRVjlPdmhTRzZkbHZQZzgza3pzZjhjdG91ejZQV2dmMGZRdTZI?=
 =?utf-8?B?UnlmWUpCU2VlMlg0L0ZqWHh6d1BFRXZQK1BWSFliV3p1S203SFlNdGpJYnVH?=
 =?utf-8?B?cUZWcTZ0RndPS0pHSU9CY01xenNGeUwwckZWU3lrSyt3WmRBbWUrQWM3bEpR?=
 =?utf-8?B?QVB3b21XeDB2SHBVSmdVZE9hWTFxejcyU1FxTitGNXFhUFFDQW9pVXBabTRB?=
 =?utf-8?B?WDlVVlhhbFRTRUNRSFhKQ1Y5YjRTNVo3Q040NUxkR1JCeVZ2Nzk4c0w2U0ZG?=
 =?utf-8?B?Y1VQY2RxL2ZCS1ZZSTVhUUVTWEI0M2p2VU5lNW5pZVJhT1J6K1JCbjgwQm5v?=
 =?utf-8?B?REVROHYwNXowMElQY1R0TVZ6Tk9SYU9HNnJWcldTcHA2K0UyRG0vU3RWN2ZQ?=
 =?utf-8?B?bmVlWkY2YXNESE4xbE5mL1lhTFdGOEtVRFgzNU9lVmZjbGpqOGZieDR4VS9K?=
 =?utf-8?B?YzlMbG9aQ1Q0Vis5WjV0bEluaVlvOVdqQ2ZHbjUwbEsrQ3R1RFJORWw0d1dH?=
 =?utf-8?B?YXlLb1didDN6UlllcldsWW1XRXJHTnVxcTZpZDVsMEVneGJ1eFh0US9YTW14?=
 =?utf-8?B?Q0x2S3plYzhQaldIbC9zR1hWbUxaUEljWGpWdFdKVHV6VllDdk5WaWdlZk0z?=
 =?utf-8?B?YW9zZ3BXTnhDMEJzdlZyNVM5SXc4RlZkNG9OOFBveDNHekNYMXhkVjBBM2h5?=
 =?utf-8?B?bFlSYk1Rc1JlZloyNFFQaExoYkRCWVZGeFRpMm8rVU9yVEg4Umw0bE5iTEFB?=
 =?utf-8?B?RngyUHV6WkhEdStHbjV1MENkR3lONVFkZHVCekJnOXd4YXRHeTY5NkJ4UjFM?=
 =?utf-8?B?U3ZaaEtZTmo3RWs4Rm1yanZ3TnM5SlhQYy9ySDJ6V2R4a0JKUnNUcFVWb3k0?=
 =?utf-8?B?QkN2NEJDRnhqNXJuUlJFQWpzMnllYS8rQ0NNYkpCN1k1ckkrZFMxbzRiK3pr?=
 =?utf-8?B?SVc4ZmF2TmZkdTVFT3cvNFVuSXo0Wmh1aURmNnpmQ3pWTEZRbXk4Zkt3dHdy?=
 =?utf-8?B?Yi8yVDJzaGhUTFRtZmpUVENGMDZEMlJNRDJlbG84WEMwMlprYmlqdktVOEFh?=
 =?utf-8?B?OXROS08xQis5eVVUZ0xzUlRtd0xVL2JNdG9FK1ZVNWhJekRvSjRRaVlFNklr?=
 =?utf-8?B?NklEdzRoREt5R05tcjhHN1NabmdFZGNOVGp5dUFRL0tEWk9KMFBEdHdRclBK?=
 =?utf-8?B?MWVpZkJoNzJZQVphY01LbXMvcHRjVU1BV003UWtkcGF2R2R3VkpRaHJsNW1J?=
 =?utf-8?B?OS9TRy9GS1ZJWmxTYjkzS0lnN3hBbkY2aDl6WUdJOGtQYTdqZGZkQy9VVFFI?=
 =?utf-8?B?VUp0Z25COHVNMzdLb1BiSjd4TzNadk1UYWR6ZXlIUXJ0SDN2cWx0eFpSZEww?=
 =?utf-8?B?OUtpUVo4MVZEbWllM1JGSUNzcE9SK3NoU2sxTWhEZm8vUVdJdHdiWlQxNlZE?=
 =?utf-8?B?SGJsZmV6YVpuU3NCbC9kb1ZxU0dwbzYySW5NMHI4NVlZRHZBd3oxcTBoQWdy?=
 =?utf-8?B?L0c0VkxCNXNzaVVVaHlvRTJiRnB6Vy9pM0tvbytwMENzZUlDUU43QkdDak9K?=
 =?utf-8?B?clJWaDRCUGxHYlF2dHQ3akJBZ0xhRThJOURLbkdXWk1QdHZod1NtcllFTEo1?=
 =?utf-8?B?V2o2TTEwWnV1d1cwRkRIYkkxSWwxdVFhTEE1MXF1SUJueXc9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL1PR12MB5126.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NHR4MjV0TmJ3RVpPa21IRCtCbkJjN3VjL3NvS1FNWTVGcTYvK2VWZm1OaDlD?=
 =?utf-8?B?bFdJVUFaVkhOcWpLNGxidEwvTVVyT3pEMnJYMVJWRkEwblhOWDJuZ3RnTkQw?=
 =?utf-8?B?NDNEVEtyamkwaFpkQ1VOQm04ajU4RGRwRFZHNDdzY1lPYW5wZGdYUmVDZDg3?=
 =?utf-8?B?VVRuNzRWS0p4Ym5qSERzZkdRdlpWWUxxNEM3bEpuelJSOTZKWE0rQjJRV2Vv?=
 =?utf-8?B?VG1hRi9QMTlZT3hKMURoQmpqMmEwQW1veGczT3JnSUdQUFlMNG13SXNpejdx?=
 =?utf-8?B?a0NlUWJzWiswTkprV1NaOWxIUGt0c21ZQU1BdVBJZU5pL2tCYW15V0dvT3d2?=
 =?utf-8?B?b1Q1QjEzVWUzK1pyRk84YS9ad012dGJQTzM5SWkyRlg3bFBGcUJDcjE3QVFs?=
 =?utf-8?B?OUdkUFU2TWhyajRwbXhOZDBybEdQQ0g1NFpFdUoyZGpNLzhidnFhZE5MSm4w?=
 =?utf-8?B?bEVRZHJZYlBtZko1NHhSV2hTaDQrRXV6OGt3WWlxeDJ1QS9WZHFueGpwMXVD?=
 =?utf-8?B?S0duQ0FKSm40TVJhK2dCTWo3L1VDYk0xQ2F6aG1iTmU2NnlaS29aZGFXVFR0?=
 =?utf-8?B?NGI3YmpDV3ZnSFkxUnhwTEVMMnlTTEk4WjA5d3VaRmkyZXlaT25pc3MyaGxQ?=
 =?utf-8?B?bXdhelNEODFUT0VVakltQkl3VTBhTkNvcXZMMEhTWWVvb3VXd3RuQjI5Tndn?=
 =?utf-8?B?VFBKVUtnQVh4Nzk4YW84N01abzAxMVhuQmdQMkhESEVCYzRsbDZvY0FTWERm?=
 =?utf-8?B?K0xkQjZyLzd3YzNZcTJXczQ1U2YzaTB4aGVDZURvOTJFVEhTS2p4VTZvUitT?=
 =?utf-8?B?NHZTaFRwNTlnRzBOb3g1eXpBaDNYTmpRWE9DU0s2M3k5QStnRzNsQi9JV0Uw?=
 =?utf-8?B?amxEQU45QS9CUlhYRWdEaEwrT3NaTlRveDRSazlWSkt5RFF3Y29xZS9YUnEy?=
 =?utf-8?B?S2ZEdnF2eFNLbHJaZE56NkovYXJBREhlTzU3K1dwWlQvejR2eGo2ZERBcVJx?=
 =?utf-8?B?T1FDVlUzaWUxSWU3MUhVS3l4MTZvZ2R3cGhVS1BQQnA5WGgvZzFBd3pOV2pK?=
 =?utf-8?B?WEs1ZzBXSVU3N1BRWGg0dHJ1RWxNb3ord0FiSG5VREc0UnFOYXR5Rm9IR0kw?=
 =?utf-8?B?RzhIbTJQeW05Z1N4WEZHMFVxbzZLdVEzMnhSdFArMk4ycTVHMzZkQ0F6a01q?=
 =?utf-8?B?RTErOFY3L2JEWStoVndiTHNHMm52aUcvMThCd2tsQ0dpb1BVSHFrZk9ndlI3?=
 =?utf-8?B?N3I3YjV1aUQ5S1hzYmo3MldyMmlsNnQrZXdHU011NHFuU1MrN3EyZ1VnOHVF?=
 =?utf-8?B?OGVVRlNDYXprV1hOaVdKR1JNeUVERnJjbENHOHFkUGJXaC9Kc3FRamtqZXBO?=
 =?utf-8?B?TUxNTXhSRnY5SnhEck5HblhJOXhTeTFVQ3BSZUFrenh3VkMwR3BRWWJrZy9s?=
 =?utf-8?B?Z0Z3K25XeUQzM0w2UjFkc2RFblR0NGZieDZKSXc2MDAyTnVxZTZqMHhyVGIw?=
 =?utf-8?B?aWl1Rnl6dEpZenUxYzlybGhWNVZKTUJhdElsSzNvTHdFbHBwcmw2UENPYTE1?=
 =?utf-8?B?bVArZ1l2enZ0eWpYMHJsMkh4V00zNUZDU3FMZlo4M2plOVYrWUkwTGt4MVZG?=
 =?utf-8?B?bDB6RFJITVZPNnZYa0xzZW5TYUFhQXJyTE80ZVZhUldNc0NnMEFiTkViMy9z?=
 =?utf-8?B?Sk53SENEREU1VEhDMHVZWXU1ZzJFby9lTSsvRGJkUFhxdk83WHExY2MvaHVY?=
 =?utf-8?B?bGcyNWtJTDJ1elEyUkpxbmh3bzZNYnBwVldLVGJSSlFDS2VjdHBFdkFVUWQ5?=
 =?utf-8?B?ZGxzWXVpNjY0dmJLd0htZkszcjIvQnptWUxoZFlBY3Vub1JFQjh1Z3lPdFJk?=
 =?utf-8?B?cGxIZGdhV1BYdVFKdm9hQi9pZHRLcHhheDQrRnFvN2ZvRzFCM3hwSDVqb3pD?=
 =?utf-8?B?QnRYUGFoUHo0ZFJQMEtUeHFOY0E0WmtpeHlsYVFTbjRSUUlJZERVb2dUZC8w?=
 =?utf-8?B?QXppeGJ0aC9raEhtMVQ2QzZWWmVqZEFxMkN2dXgycWQ5OTMwV0N0OE5iNHYw?=
 =?utf-8?B?OWVpZnc2WFVlcWVOc1U0cnRPLzdLK0VRMDdxeGliRTYxN1BrQjVNT00zMUY5?=
 =?utf-8?Q?77d/RiyJwJMdgx3Qcurmbkeii?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 61fe48b3-9cd9-46b7-980b-08de3735679f
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5126.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Dec 2025 15:12:44.5889 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FFBpVMVK9wFfaSSmY6Wuq15sWKMKJmJ8vxLHxFVX4e/lNdPBfdn2GfgFaMZWn4UGMs91c8awgrkvPswsTijPAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS5PPFBABE93B01
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



On 2025-12-09 09:44, Melissa Wen wrote:
> 
> 
> On 09/12/2025 11:31, Melissa Wen wrote:
>>
>>
>> On 08/12/2025 22:34, Matthew Schwartz wrote:
>>>
>>>> On Dec 8, 2025, at 3:48 PM, Melissa Wen <mwen@igalia.com> wrote:
>>>>
>>>> ﻿There are some unexpected banding and shimmer effects when using
>>>> steamOS/gamescope color pipeline for HDR on DCN32 or newer families.
>>>> Those problems are not present in Steam Deck (DCN301). It happens on
>>>> DCN32 because plane shaper LUT uses DCN30 CM3 helper to translate curves
>>>> instead of DCN10 CM helper. This series identifies the necessary changes
>>>> on CM3 helper to reduce differences on color transformation made by
>>>> those two helpers.
>>>>
>>>> Patch 1 aims to solve the shimmer/colorful points that looks like a
>>>> wrong map of black values on red/green/blue colors. Patch 2 extends the
>>>> delta clamping fix made in commit 27fc10d1095f ("drm/amd/display: Fix
>>>> the delta clamping for shaper LUT") to solve some banding effects.
>>>>
>>>> Banding is not fully solved by any helper and needs further
>>>> investigation.
>>>>
>>>> One easy way to check the current and expected behavior is moving the
>>>> cursor (doing composition) to get the expected result from GFX. When the
>>>> cursor disappears, those color transformations are back to be done by
>>>> the display hw.
>>> Hi Melissa,
>>>
>>> Could you share how you’re testing the gamescope color pipeline with HDR on DCN32, i.e display and connection type? Are any extra gamescope or kernel patches required?
>>>
>>> At least on my own DCN32 setup (AMD 7900XTX) + my primary monitor (an LG 45gx950a-b) via DisplayPort or my DCN35 setup + integrated HDR OLED screen (Legion Go 2), gamescope always composites when HDR is enabled. I applied your patches on top of kernel 6.18, and my kernel is built with CONFIG_DRM_AMD_COLOR_STEAMDECK=y (the downstream name of AMD_PRIVATE_COLOR for SteamOS), so that shouldn't be an issue. I tried everything from 1280x720p -> 5120x2160p, and it does not work on any resolution.
>> Hi Matt,
>>
>> You need to hack the DPP color caps to enabled SHAPER/3D and BLEND LUTs as below:
>>
>> diff --git i/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c w/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
>> index b276fec3e479..96b4f3239fb1 100644
>> --- i/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
>> +++ w/drivers/gpu/drm/amd/display/dc/resource/dcn32/dcn32_resource.c
>> @@ -2256,8 +2256,8 @@ static bool dcn32_resource_construct(
>>         dc->caps.color.dpp.gamma_corr = 1;
>>         dc->caps.color.dpp.dgam_rom_for_yuv = 0;
>>
>> -       dc->caps.color.dpp.hw_3d_lut = 0;
>> -       dc->caps.color.dpp.ogam_ram = 0;  // no OGAM in DPP since DCN1
>> +       dc->caps.color.dpp.hw_3d_lut = 1;
>> +       dc->caps.color.dpp.ogam_ram = 1;  // no OGAM in DPP since DCN1
>>         // no OGAM ROM on DCN2 and later ASICs
>>         dc->caps.color.dpp.ogam_rom_caps.srgb = 0;
>>         dc->caps.color.dpp.ogam_rom_caps.bt2020 = 0;
>>
>> In short, you need to change `caps.color.dpp.hw_3d_lut` and `caps.color.dpp.ogam_ram` to 1 in the dcnX_resource.c file to say there is a "plane" color caps.
>> The thing is that, in DCN32+, these color caps are not part of DPP anymore, they are MPC capabilities in MCM that can be moved before or after blending.
>> But the current kernel implementation checks DPP color caps to expose plane color proprerties.
>> Checking MPC and where the MCM is positioned would be more complex, but not impossible. Something to improve in the future yes.
> 
> Just found this: dpp_color_caps.hw_3d_lut || dm->dc->caps.color.mpc.preblend (https://gitlab.freedesktop.org/agd5f/linux/-/blob/amd-staging-drm-next/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_plane.c#L1636)
> 
> Should be enough for new kernel versions. So you might need only the blend LUT hack.
> 
>>
>> You need to confirm that your `drm_info` shows all AMD plane color properties, but gamescope basically checks CTM and BLEND_TF as you can see here:
>> https://github.com/ValveSoftware/gamescope/blob/master/src/Backends/DRMBackend.cpp#L3347
>>

Are you testing this with AMD_PRIVATE_COLOR, or with the newly merged color pipeline API? If it's the former, then the kernel needs to be built with an explicit -DAMD_PRIVATE_COLOR for this to work.

Harry

>> Let me know if it works for you.
>>
>> BR,
>>
>> Melissa
>>
>>>
>>> Thanks,
>>> Matt
>>>
>>>> Lemme know your thoughts!
>>>>
>>>> Melissa
>>>>
>>>> Melissa Wen (2):
>>>>   drm/amd/display: fix wrong color value mapping on DCN32 shaper LUT
>>>>   drm/amd/display: extend delta clamping logic to CM3 LUT helper
>>>>
>>>> .../amd/display/dc/dcn30/dcn30_cm_common.c    | 32 +++++++++++++++----
>>>> .../display/dc/dwb/dcn30/dcn30_cm_common.h    |  2 +-
>>>> .../amd/display/dc/hwss/dcn30/dcn30_hwseq.c   |  9 +++---
>>>> .../amd/display/dc/hwss/dcn32/dcn32_hwseq.c   | 17 ++++++----
>>>> .../amd/display/dc/hwss/dcn401/dcn401_hwseq.c | 16 ++++++----
>>>> 5 files changed, 50 insertions(+), 26 deletions(-)
>>>>
>>>> -- 
>>>> 2.51.0
>>>>
>>
> 

