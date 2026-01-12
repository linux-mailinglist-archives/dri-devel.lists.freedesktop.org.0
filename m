Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2052D1552B
	for <lists+dri-devel@lfdr.de>; Mon, 12 Jan 2026 21:51:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C81A10E431;
	Mon, 12 Jan 2026 20:51:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="W9VaEXG2";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010000.outbound.protection.outlook.com
 [52.101.193.0])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E00110E42E;
 Mon, 12 Jan 2026 20:51:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bu3wrA05qZk0LVsDAELR6Z9PxbbUC4VeSQ8AJPJjZ0ZLXgh5AamukAkAWsN7NuZW8MSIWb4bVnTS4/5DlnjWU8OXTstKbNz3azNpZe/lLiOtxuWIriIvQV6Mq+waqRiaOf40NAVFRN8wsmiZViZ1lsqQnljjmdETZiCnmmIP001rKMcyyKsWAp9K2ki9p9Ock0bmFmHvVgJOLSLAcOydeTjzSynIbiuGCLsi5yrGvGInu3Vd5e1tT5ThFFEUaR9cZA1tGDO43aJGw0Nv/OXqQep0KbJtQcR8m1QxIZ9GnLqChK3ecnfMKQmriXCN18I7J+z39KVxZbVWS7He0VS6ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zXSZqavnKdvkdrRDlysfZWmP0iB4O1kaqAvyHa9x4zo=;
 b=V1HBMtuCZUbSXMvKJO39o2Qzmgqcw857zOqGGw5ovbSPr8Xz1DzgT7y/Fly7Y+edCuj2cra5Hv44CR18gBN/llRyj0PyNeeIWuOUz4N1dJgmHK4X97vUE65MxI+uCk5DOcvREIpIQ+NvjQZljr6LfyMFoSR4mbNd+vVCElDjLMT3/s4+69gaIpyAxyMwNNTx0QeYF8XmO6KPnlfunDkn30oeJEy/2SsXZJHV4wiwWEwo29EvhrIoD3bb6sAtU79fze4y8AoI79zMLz58+gB2TzCIkgj8Dd5wSBz9gGY5XWOw0sX8NlCa5HAFCxxJ1Hk0jB+YxrdPl7aeNF1EG/a8EA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zXSZqavnKdvkdrRDlysfZWmP0iB4O1kaqAvyHa9x4zo=;
 b=W9VaEXG27Sc235WF0zUZB5HrtXSGXBq50RNPocYtHdwx/ayndITpiZZufjUSAl0H2ioQJy4obnn5wdHeP1hjSTAFybrPEZexXomaHRRcuSp9qO4WYI0kUfsros4hIypCra6N8v35Xz+bT+bYKBNNC4srrF+FZhx3PDPaE1M4Ipo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (2603:10b6:408:118::14)
 by MN2PR12MB4144.namprd12.prod.outlook.com (2603:10b6:208:15f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 20:51:07 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::9269:317f:e85:cf81%7]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 20:51:07 +0000
Message-ID: <78db6cf0-f119-4788-9bda-5f45e9d60899@amd.com>
Date: Mon, 12 Jan 2026 15:51:04 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] drm/amdkfd: Add batch userptr allocation support
To: Honglei Huang <honghuan@amd.com>
Cc: dmitry.osipenko@collabora.com, Xinhui.Pan@amd.com, airlied@gmail.com,
 daniel@ffwll.ch, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, akpm@linux-foundation.org,
 Honglei Huang <honglei1.huang@amd.com>, alexander.deucher@amd.com,
 Ray.Huang@amd.com, =?UTF-8?Q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>
References: <20260104072122.3045656-1-honglei1.huang@amd.com>
 <64f0d21c-1217-4f84-b1ce-b65c1f5c2ef1@amd.com>
 <b6004bee-ffef-48ea-ba0d-57b390cb771c@amd.com>
 <76c44385-bcf8-4820-a909-569bd2d36198@amd.com>
 <ab5d1bb7-7896-49fd-a9ea-19294f4f57ca@amd.com>
 <dc1f5de7-40c4-4649-8f2f-0fee4b540783@amd.com>
 <ee4e502b-7b49-4ef7-b7b7-20afba189e1c@amd.com>
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
Organization: AMD Inc.
In-Reply-To: <ee4e502b-7b49-4ef7-b7b7-20afba189e1c@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YQBPR0101CA0122.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:5::25) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR12MB5115:EE_|MN2PR12MB4144:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b6bffb7-dfbc-4db5-9740-08de521c4f51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a3J2dXZMalJMaVd2c0FLRGVMMlJ6RTJEYkZUVTdUUDc4cWtLQkpuNndRanJL?=
 =?utf-8?B?czgwNmFHUEVvcTR3UmxCeTZCK2pOaEdjVm5yZ2M3NlBodlp2eFRvYTJqL21U?=
 =?utf-8?B?WjN6dzRueHRWb1J3UnFqMHN0UEsvUCtESklDV3hVRy9PY3ZYeXRjUzBjNjZW?=
 =?utf-8?B?bnc0V1VQZlpUY2pGdzRFUzZBQjVac2xIK0hyeEwvS3B3ZXRZd1pPV3lJMUNO?=
 =?utf-8?B?R3FsR3lPNkQva2phVkJKYk1wbjdBRTJWMXdDcHBBLzNNZFdJaWt1VUxreENE?=
 =?utf-8?B?RXlMVXBUaWV3V2UvMTlIMS9GS0NjaWY3NVpncm9GVUZuRkpCUmwwbVRnNEd2?=
 =?utf-8?B?UzB0TlNhRTJ6aW8zNmRyZEV2L3NicElBZDd0NzdiTTd1a1BndWFCeEZMMXl3?=
 =?utf-8?B?YlgzS0s3Y2FvR2I2UUhKMEM3K2ZNTVhxb1lhNHhma0VBaTQ1Y3RKa0lIOE5U?=
 =?utf-8?B?eWFFZjVDWlNsU0RQK0h0NU9hNHMxRHRuNmFCR0VrQWUzVy9BK2R2Y3FWVXdD?=
 =?utf-8?B?aVZLM1N6M1N1cmtHNmwwemZCaDRoL0QzT2JsRCt1RzFyYkIyZm15WUhvZ1lT?=
 =?utf-8?B?TCttRzlTZ0xLancwUkNsQVEvOTVtREx2eThjVFgvYmlneGUzSjFodUxnL01j?=
 =?utf-8?B?ZHQ2d0c1SFBJeHkxT0ZteEREZlFEVmxyUTd2bHk0T3RNUWhpdkNVd09RQnll?=
 =?utf-8?B?NHBOTk5Qa3Y5a0VlKzg4Zzk0bldvT0xwNXFHR282UFM0UVRNaHNLZ3F0Ukl2?=
 =?utf-8?B?OUd2R2xIdU5MQjQ5T2UyQWhaVmJDY211WVdITUlkUGxLY3RQaHVZSDJjS1VN?=
 =?utf-8?B?OWZodFo3RGdpYm5EWDEycmFxVDFCbmxsS2R5T2I2YUxXeFA5MXFmV2FDbG1u?=
 =?utf-8?B?WnB6VzNsd3loK01uQ3p0ZzVVTVBPSlJKbXlqVW1UMXpKVTVUaTFGWUl4MUtG?=
 =?utf-8?B?UnVFbms5QjhPQW00WmRXLzRiUFlzL1ZCQ3NZTmhYMnlPNVZBK1hZNmJuOEx1?=
 =?utf-8?B?dURPOS8xdDdhbDBnUkxEK05XdmZzazB5Rm1oRlNuYjFIcy9PdmZIY0ZVMmVh?=
 =?utf-8?B?WGoySHJzRFFqYzBRU1RKNTRCNjIyTzN5Q3VMVkpvOCtJSlRuNXNZWDRjbWpD?=
 =?utf-8?B?SnJJcEFSUVlEb1Y1dWJ0UENZTFlvYzMrWURuNWU5YUhveURDRHJJRnZUWUkr?=
 =?utf-8?B?TlhRNVc0QXZjT3VjWXFyVzJDNGtPK20wb0xObW9XTElOeXNVcThHSXN6d2tD?=
 =?utf-8?B?RUNwejd0b2JuYm5WaE92NHduZzRmNEZpdHh1WXJmYm5nSTlCVFhaME5IL3Yv?=
 =?utf-8?B?V2hIaGt6ai8wcnFKV0NScjBzbzVwQ0R5M0pRTkRkNk9nTndORWdRd0c4aEI5?=
 =?utf-8?B?VWRKZjN1N2xJekxZWUhTL1IxMFRyZklrT1NRSCtndytaMHY3QVRkR0tFNU9D?=
 =?utf-8?B?bmVFRXIwNDJQNWNVSGpyTmdJcTdINC9TdEZrM05KMUFaMWZBeDM0dDVmL2Uz?=
 =?utf-8?B?NnFESW1jSGhyTFRER3NQLzROTW8vQlE3cEVXMk43OHlyMktkVXJEUUdmcysy?=
 =?utf-8?B?NENGVG5IMnVicS9uUmxUczVucWRqRk1xanVFZ3RXb0kvTzZXZjJDZ1U1UDBN?=
 =?utf-8?B?UzdoWnhTZGhBdldZbW9HOFI1YzJsaHlYa08vQ0pmSXlaTjY4bTFLejRrbk9Y?=
 =?utf-8?B?QVVZOURVZTU2NXdReGpmZVJkTnp3L1BhVStweVAwRlEyazlEbGltWHYxQjYv?=
 =?utf-8?B?SjdveitzaEFEZEUrOEl5aVRJM0lJVzdGODdhcWgrTG5ESnhrRHJOQ3N1WWpI?=
 =?utf-8?B?RGs1YzArakRNN1FMMXpLSXQ5UlRCc1B4NEZveXAyem9QdmtCb0ZNZUsvMkds?=
 =?utf-8?B?MVE1bkxoSnJiRmF4cmtMMVBDWGhHMGwwUTFnSHJ3bjUzVDNUeVp0TWFVTXNY?=
 =?utf-8?B?QmozRUFNNjQyZFh4VW5VYmxxNktDVi9QSUIxcVBmSmtIRkkzTWZ6dkU1QjJ4?=
 =?utf-8?B?ZWthQllBQnBBPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?T1F2b1MyNldJbWU3S28yQlYrU01NejZpcjJya3kyVWlabXNOL3NtTmVndmhR?=
 =?utf-8?B?VmhBNHJ3cHhjZVRwMHRCblJoT0pOc1UvZlNTdDBIanNUWmFvNTZMNEpBVFdZ?=
 =?utf-8?B?bkFOVFA0RUIxQnI2WENKcDh3Q21QdzFwNG1Ra21RR1BQQ0FlcXp4Rm15SUcz?=
 =?utf-8?B?K2t1QTJjeHVxUlcxR085eWFzeVJLSXNyZWV4TDl3dEFvSkVSclBRVjVIU0kr?=
 =?utf-8?B?Mk9oTUZ4UWNrS0NaTndic2NWS1VoczFpYUtaeXQ1R09ObTVBaTBaMDNENHV0?=
 =?utf-8?B?eWIvWWllRldvSnVoQVljL25UeTM1QXBaTmxSWWJlN3RLWGFsUXMvQXErMTVD?=
 =?utf-8?B?UTViUko0YkFZNVZPcW1iZ0NJeWxiRCtPZkFiZnlvaDloVzFWTUkrcXViYUFJ?=
 =?utf-8?B?YVJjazUzTmVuNUdSTnY1RWJ4eEZnVEVwME5BdDNUcTk3NjVFMTVsTTZjNGIw?=
 =?utf-8?B?akdkZUxqZ0RscGVld1IxblBIb2JCd1g0Z0ZwOSsxL1hIYVExanhwcDdCYk1L?=
 =?utf-8?B?S0IvbWtlOEVycy95YTNscjVpT3FQU0xvdmNGQkM2Q3B3T1JpRmo3NEo3Z1c3?=
 =?utf-8?B?MnVuV0ZoWm5BaUhUdUpyUlNKZXlGaGpxdjNmNk94UjRmWm10MTlOaUFxczIz?=
 =?utf-8?B?T0tZeVB0WEtLUExGOHgwbU91c0paank5UUFLSUY2dmVad0xXVVI2S01wRktj?=
 =?utf-8?B?YmZpRkllU1hER3k5NVFvVXpVYWs3QWNzKytiZ3BoSzR4bGFVK1lGSXFFMlpE?=
 =?utf-8?B?OTZtUHBDSXNXYk1STGVtV0s0MkJjbmVxbGdIN3lmYXVjZTIrYzhPV0tOcGFL?=
 =?utf-8?B?dkNIMCtURURPUWxpQWNVQjMwNGlENHAxL012cXhWY2lHYjF0aEg4bndybG5R?=
 =?utf-8?B?OU1COStUQ1d4Nm1vdEZ3UWVZZE9ibkFjYVg2SWpPaEtQdWpRRlZoTFJKUjJ4?=
 =?utf-8?B?TDJITXQ5TUJwVUZSb3JUNlBYbzVlbEJpZWc2ZUZEejJaUGR0enRzeFR3UnBr?=
 =?utf-8?B?MnJDWmMwRU4vOXhocVdQdVNZams0RUxrTzdwb0RRYy96Qi84a3VyRSs3NjBB?=
 =?utf-8?B?N2xCWkNoZ3d2T0drdFlKTkV5WWdFNTBhWk5tMWo5bDg4ZG5LRXpZbkR4dFVF?=
 =?utf-8?B?bU41RU9NV3ErRmhwazQ4eFNteFpmZjdydzl3RmRQU0l2dCtXSDhrNzBIdmZG?=
 =?utf-8?B?aFAvVzJWTHBZS2dpNDJhYmxTUzlOeUpXdEhGbU5MYkZTVGpwWExpOThnV0NO?=
 =?utf-8?B?TzBwdTExNjRiejI2cUtWTjd3em1vTzNSMDBTelJlZEJlbHE3b3lLMTFhdXZB?=
 =?utf-8?B?RjVheUhPeVozSmYyMS9aTW5ocXFrUmhpWmdLcldYcUx1OC9RZDVCQlZxREV6?=
 =?utf-8?B?bnlqYTdMNXNGSmlVM0hISFdFei9BdkRMK2JBdFVYWlB6NlhDQlhpUG1uaCt4?=
 =?utf-8?B?Qm00bEE4eWh1Ym95dVlIdC9Wci9qaWFWNnk4MytKbWtGUE9XejhiL1hNRGFZ?=
 =?utf-8?B?Q3ExeXZMSEpWa3NXbkNvbEZjMkM1VGVsbVEzWEFLS3JIOWxWVnVyVnpOSjJl?=
 =?utf-8?B?K2ZrNTFBemFSVllFTFNvOCtLWHNlcEJIazQwYjhKa0Z2Z2dZSDVSME9lSG44?=
 =?utf-8?B?cnNZWWtueXZHdWFnQXRGSG5mbkVtWXdYMWJZcDk3b2hNTnR3eDUySTY2OGll?=
 =?utf-8?B?VEJqa0tEQWJWY2xZdGdhdUtLZFVWd1I3cnJvK25WV1pIK3NobTkvczVyZlVw?=
 =?utf-8?B?blU1M0ZCek9ybU5yVmVRc2VHOWZFcW1HK204VldMM3F0NE9LckdmZ2Jod3lv?=
 =?utf-8?B?ZjVTZ21Ucm1jQVBBUTBDSDR4UTdQZUdpUmlhZ0JjeUpwZUZjekk2a1RueExM?=
 =?utf-8?B?SUJEREsydE00RmdVQmpvd1N6VnJSdXpzV1Z5TFE0ZS82bDU5S2IvS0FzbjFB?=
 =?utf-8?B?bnpad2U0M2xZM05qemsrdmMvR090cm5TdWhtbDQ5dHl6NG13WXRLb1o5dFZw?=
 =?utf-8?B?akxJNmhjMFNSdWk3RHo4bEJicDVpT0oyWlZtVmZMRHpYbTJuRko2cUhQQlg1?=
 =?utf-8?B?d0V2WTEwU3o5SGdSZit0aWFzTE5UZEh4WEovVkQzd1prbnMxS3V6elZJZ2x5?=
 =?utf-8?B?Q0kxSEVjVzNjVDR2OWdLWmFOYnNNNS9VN1dWU1B0M1JoREtxclpaOFhBb0Zp?=
 =?utf-8?B?UlhOb01sNXZEalhlUFU3YS85aktmVVRHNS8yeGtNalNkVUZZS2FQL0Fycm5M?=
 =?utf-8?B?SXQyeW5kVTRJMllHWURLZEVpY2wzd2pHbzg5djRkT2VxOGpkemdRdktMZlhL?=
 =?utf-8?B?WVhycHNvM24rMDVTaW9lUldpVFhIZVFNaVpHYzkyMzhRWVIzbXRsUT09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b6bffb7-dfbc-4db5-9740-08de521c4f51
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 20:51:07.7803 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uFzXe99gFCcUOxbmjVYS0ZASMicEkGn9fMzGZl+xuKeNOgz0q8If6h5ne8k3uGqfbce1suPwurgi76pCqSOvmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4144
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


On 2026-01-12 06:55, Honglei Huang wrote:
>
> Hi Felix,
>
> Thank you for the clarification about the render node transition.
>
> I went back and checked the relevant DRM code, and I found that it is 
> missing some infrastructure and it seems like the SVM is not supported 
> in drm.
>
> And most current hardware platforms utilize the KFD driver, we must
> rely on the KFD infrastructure to enable this functionality. The DRM 
> stack currently lacks the SVM infrastructure, and building it from 
> scratch is not feasible for immediate deployment needs.

As far as I can tell, you're not using any SVM infrastructure. In fact 
you specifically made the point that SVM wasn't suitable for your 
application because you wanted to map non-contiguous CPU address ranges 
into a contiguous GPU address range. So I don't understand what your 
dependency on SVM infrastructure is here.

The DRM stack uses HMM under the hood for its userptr implementation, 
which should be quite similar to what KFD does. The difference is in the 
MMU notifier handling. I guess that's where some work would be needed so 
that amdgpu_mn_invalidate_range_start_gfx can invoke 
amdgpu_amdkfd_evict_userptr to stop usermode queues. Or maybe some 
allocation flag in the userptr BO that tells amdgpu_hmm_register to hook 
up the HSA MMU notifier.

And then you'd need to add support to the 
amdgpu_amdkfd_restore_userptr_worker to validate and map userptr BOs 
managed through the GEM API.

I'm not saying this is easy. I spent months trying to get this to work 
reliably for DMABuf imports a few years ago.

Regards,
   Felix


>
> Therefore, I plan to continue with my previous direction to find a 
> "minimal impact" technical solution within KFD. 
>
> Regards,
> Honglei
>
> On 2026/1/10 10:28, Honglei Huang wrote:
>>
>> Hi Felix,
>>
>> You're right - I understand now that the render node transition is 
>> already
>> Appreciate the clarification.
>>
>> Regards,
>> Honglei
>>
>>
>> On 2026/1/10 05:14, Kuehling, Felix wrote:
>>> FWIW, ROCr already uses rendernode APIs for our implementation of 
>>> the CUDA VM API (DMABuf imports into rendernode contexts that share 
>>> the VA space with KFD and VA mappings with more flexibility than 
>>> what we have in the KFD API). So the transition to render node APIs 
>>> has already started, especially in the memory management area. It's 
>>> not some far- off future thing.
>>>
>>> Regards,
>>>    Felix
>>>
>>> On 2026-01-09 04:07, Christian König wrote:
>>>> Hi Honglei,
>>>>
>>>> I have to agree with Felix. Adding such complexity to the KFD API 
>>>> is a clear no-go from my side.
>>>>
>>>> Just skimming over the patch it's obvious that this isn't correctly 
>>>> implemented. You simply can't the MMU notifier ranges likes this.
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>> On 1/9/26 08:55, Honglei Huang wrote:
>>>>> Hi Felix,
>>>>>
>>>>> Thank you for the feedback. I understand your concern about API 
>>>>> maintenance.
>>>>>
>>>>>  From what I can see, KFD is still the core driver for all GPU 
>>>>> compute workloads. The entire compute ecosystem is built on KFD's 
>>>>> infrastructure and continues to rely on it. While the unification 
>>>>> work is ongoing, any transition to DRM render node APIs would 
>>>>> naturally take considerable time, and KFD is expected to remain 
>>>>> the primary interface for compute for the foreseeable future. This 
>>>>> batch allocation issue is affecting performance in some specific 
>>>>> computing scenarios.
>>>>>
>>>>> You're absolutely right about the API proliferation concern. Based 
>>>>> on your feedback, I'd like to revise the approach for v3 to 
>>>>> minimize impact by reusing the existing ioctl instead of adding a 
>>>>> new API:
>>>>>
>>>>> - Reuse existing AMDKFD_IOC_ALLOC_MEMORY_OF_GPU ioctl
>>>>> - Add one flag: KFD_IOC_ALLOC_MEM_FLAGS_USERPTR_BATCH
>>>>> - When flag is set, mmap_offset field points to range array
>>>>> - No new ioctl command, no new structure
>>>>>
>>>>> This changes the API surface from adding a new ioctl to adding 
>>>>> just one flag.
>>>>>
>>>>> Actually the implementation modifies DRM's GPU memory management
>>>>> infrastructure in amdgpu_amdkfd_gpuvm.c. If DRM render node needs 
>>>>> similar functionality later, these functions could be directly 
>>>>> reused.
>>>>>
>>>>> Would you be willing to review v3 with this approach?
>>>>>
>>>>> Regards,
>>>>> Honglei Huang
>>>>>
>>>>> On 2026/1/9 03:46, Felix Kuehling wrote:
>>>>>> I don't have time to review this in detail right now. I am 
>>>>>> concerned about adding new KFD API, when the trend is moving 
>>>>>> towards DRM render node APIs. This creates additional burden for 
>>>>>> ongoing support of these APIs in addition to the inevitable DRM 
>>>>>> render node duplicates we'll have in the future. Would it be 
>>>>>> possible to implement this batch userptr allocation in a render 
>>>>>> node API from the start?
>>>>>>
>>>>>> Regards,
>>>>>>     Felix
>>>>>>
>>>>>>
>>>>>> On 2026-01-04 02:21, Honglei Huang wrote:
>>>>>>> From: Honglei Huang <honghuan@amd.com>
>>>>>>>
>>>>>>> Hi all,
>>>>>>>
>>>>>>> This is v2 of the patch series to support allocating multiple 
>>>>>>> non- contiguous
>>>>>>> CPU virtual address ranges that map to a single contiguous GPU 
>>>>>>> virtual address.
>>>>>>>
>>>>>>> **Key improvements over v1:**
>>>>>>> - NO memory pinning: uses HMM for page tracking, pages can be 
>>>>>>> swapped/ migrated
>>>>>>> - NO impact on SVM subsystem: avoids complexity during KFD/KGD 
>>>>>>> unification
>>>>>>> - Better approach: userptr's VA remapping design is ideal for 
>>>>>>> scattered VA registration
>>>>>>>
>>>>>>> Based on community feedback, v2 takes a completely different 
>>>>>>> implementation
>>>>>>> approach by leveraging the existing userptr infrastructure 
>>>>>>> rather than
>>>>>>> introducing new SVM-based mechanisms that required memory pinning.
>>>>>>>
>>>>>>> Changes from v1
>>>>>>> ===============
>>>>>>>
>>>>>>> v1 attempted to solve this problem through the SVM subsystem by:
>>>>>>> - Adding a new AMDKFD_IOC_SVM_RANGES ioctl for batch SVM range 
>>>>>>> registration
>>>>>>> - Introducing KFD_IOCTL_SVM_ATTR_MAPPED attribute for special 
>>>>>>> VMA handling
>>>>>>> - Using pin_user_pages_fast() to pin scattered memory ranges
>>>>>>> - Registering multiple SVM ranges with pinned pages
>>>>>>>
>>>>>>> This approach had significant drawbacks:
>>>>>>> 1. Memory pinning defeated the purpose of HMM-based SVM's on- 
>>>>>>> demand paging
>>>>>>> 2. Added complexity to the SVM subsystem
>>>>>>> 3. Prevented memory oversubscription and dynamic migration
>>>>>>> 4. Could cause memory pressure due to locked pages
>>>>>>> 5. Interfered with NUMA optimization and page migration
>>>>>>>
>>>>>>> v2 Implementation Approach
>>>>>>> ==========================
>>>>>>>
>>>>>>> 1. **No memory pinning required**
>>>>>>>      - Uses HMM (Heterogeneous Memory Management) for page tracking
>>>>>>>      - Pages are NOT pinned, can be swapped/migrated when not in 
>>>>>>> use
>>>>>>>      - Supports dynamic page eviction and on-demand restore like 
>>>>>>> standard userptr
>>>>>>>
>>>>>>> 2. **Zero impact on KFD SVM subsystem**
>>>>>>>      - Extends ALLOC_MEMORY_OF_GPU path, not SVM
>>>>>>>      - New ioctl: AMDKFD_IOC_ALLOC_MEMORY_OF_GPU_BATCH
>>>>>>>      - Zero changes to SVM code, limited scope of changes
>>>>>>>
>>>>>>> 3. **Perfect fit for non-contiguous VA registration**
>>>>>>>      - Userptr design naturally supports GPU VA != CPU VA mapping
>>>>>>>      - Multiple non-contiguous CPU VA ranges -> single 
>>>>>>> contiguous GPU VA
>>>>>>>      - Unlike KFD SVM which maintains VA identity, userptr 
>>>>>>> allows remapping,
>>>>>>>        This VA remapping capability makes userptr ideal for 
>>>>>>> scattered allocations
>>>>>>>
>>>>>>> **Implementation Details:**
>>>>>>>      - Each CPU VA range gets its own mmu_interval_notifier for 
>>>>>>> invalidation
>>>>>>>      - All ranges validated together and mapped to contiguous 
>>>>>>> GPU VA
>>>>>>>      - Single kgd_mem object with array of user_range_info 
>>>>>>> structures
>>>>>>>      - Unified eviction/restore path for all ranges in a batch
>>>>>>>
>>>>>>> Patch Series Overview
>>>>>>> =====================
>>>>>>>
>>>>>>> Patch 1/4: Add AMDKFD_IOC_ALLOC_MEMORY_OF_GPU_BATCH ioctl and 
>>>>>>> data structures
>>>>>>>       - New ioctl command and kfd_ioctl_userptr_range structure
>>>>>>>       - UAPI for userspace to request batch userptr allocation
>>>>>>>
>>>>>>> Patch 2/4: Extend kgd_mem for batch userptr support
>>>>>>>       - Add user_range_info and associated fields to kgd_mem
>>>>>>>       - Data structures for tracking multiple ranges per allocation
>>>>>>>
>>>>>>> Patch 3/4: Implement batch userptr allocation and management
>>>>>>>       - Core functions: init_user_pages_batch(), 
>>>>>>> get_user_pages_batch()
>>>>>>>       - Per-range eviction/restore handlers with unified management
>>>>>>>       - Integration with existing userptr eviction/validation flows
>>>>>>>
>>>>>>> Patch 4/4: Wire up batch userptr ioctl handler
>>>>>>>       - Ioctl handler with input validation
>>>>>>>       - SVM conflict checking for GPU VA and CPU VA ranges
>>>>>>>       - Integration with kfd_process and process_device 
>>>>>>> infrastructure
>>>>>>>
>>>>>>> Performance Comparison
>>>>>>> ======================
>>>>>>>
>>>>>>> Before implementing this patch, we attempted a userspace 
>>>>>>> solution that makes
>>>>>>> multiple calls to the existing AMDKFD_IOC_ALLOC_MEMORY_OF_GPU 
>>>>>>> ioctl to
>>>>>>> register non-contiguous VA ranges individually. This approach 
>>>>>>> resulted in
>>>>>>> severe performance degradation:
>>>>>>>
>>>>>>> **Userspace Multiple ioctl Approach:**
>>>>>>> - Benchmark score: ~80,000 (down from 200,000 on bare metal)
>>>>>>> - Performance loss: 60% degradation
>>>>>>>
>>>>>>> **This Kernel Batch ioctl Approach:**
>>>>>>> - Benchmark score: 160,000 - 190,000 (80%-95% of bare metal)
>>>>>>> - Performance improvement: 2x-2.4x faster than userspace approach
>>>>>>> - Achieves near-native performance in virtualized environments
>>>>>>>
>>>>>>> The batch registration in kernel avoids the repeated syscall 
>>>>>>> overhead and
>>>>>>> enables efficient unified management of scattered VA ranges, 
>>>>>>> recovering most
>>>>>>> of the performance lost to virtualization.
>>>>>>>
>>>>>>> Testing Results
>>>>>>> ===============
>>>>>>>
>>>>>>> The series has been tested with:
>>>>>>> - Multiple scattered malloc() allocations (2-4000+ ranges)
>>>>>>> - Various allocation sizes (4KB to 1G+ per range)
>>>>>>> - GPU compute workloads using the batch-allocated ranges
>>>>>>> - Memory pressure scenarios and eviction/restore cycles
>>>>>>> - OpenCL CTS in KVM guest environment
>>>>>>> - HIP catch tests in KVM guest environment
>>>>>>> - AI workloads: Stable Diffusion, ComfyUI in virtualized 
>>>>>>> environments
>>>>>>> - Small LLM inference (3B-7B models) using HuggingFace transformers
>>>>>>>
>>>>>>> Corresponding userspace patche
>>>>>>> ================================
>>>>>>> Userspace ROCm changes for new ioctl:
>>>>>>> - libhsakmt: https://github.com/ROCm/rocm-systems/commit/ 
>>>>>>> ac21716e5d6f68ec524e50eeef10d1d6ad7eae86
>>>>>>>
>>>>>>> Thank you for your review and waiting for the feedback.
>>>>>>>
>>>>>>> Best regards,
>>>>>>> Honglei Huang
>>>>>>>
>>>>>>> Honglei Huang (4):
>>>>>>>     drm/amdkfd: Add batch userptr allocation UAPI
>>>>>>>     drm/amdkfd: Extend kgd_mem for batch userptr support
>>>>>>>     drm/amdkfd: Implement batch userptr allocation and management
>>>>>>>     drm/amdkfd: Wire up batch userptr ioctl handler
>>>>>>>
>>>>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_amdkfd.h    |  21 +
>>>>>>>    .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 543 
>>>>>>> +++++++++++ + +++++-
>>>>>>>    drivers/gpu/drm/amd/amdkfd/kfd_chardev.c      | 159 +++++
>>>>>>>    include/uapi/linux/kfd_ioctl.h                |  37 +-
>>>>>>>    4 files changed, 740 insertions(+), 20 deletions(-)
>>>>>>>
>>
>
