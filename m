Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 427E5A272F1
	for <lists+dri-devel@lfdr.de>; Tue,  4 Feb 2025 14:37:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E26F10E10D;
	Tue,  4 Feb 2025 13:37:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="bUbOZfvf";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2069.outbound.protection.outlook.com [40.107.96.69])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1832F10E64F;
 Tue,  4 Feb 2025 13:36:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SAr9+jsbnm79sB00hL5e2SwV2ZsKd+1/lvaQw9643jez4p5HyRqQq8L+CR7Fo98CkxpHFazJcsUMKKDJRu3uv2QXZnYyZ3kIzIqIG+HMTeNmk/rrEwSVRvWSDhaJ5qHuH4V2/q7ppPAd7F8iXruvqILLE1IXh/WCzM+bxORzT5X188vfawirxWQX8kSNirLQOPASZoMJg5Kxf5QWeUqlKxMreoxa+J1l6uF2FDGS+ZJ3B4Np16sWP1/StK56kVoKYIBwhsWtkwwZB5we8BwHkkeSR9a9564AOnRaVtChTaCPw7RjQbvDhM9vSW/Pv5AMb10ehXaE0WgRVHZ0VUg63Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i3b/pChOO+/Irow/CwiaflZmuM4kg/iSibYcpbamfW0=;
 b=R4QCtO8TRApUtGQEuMdZlqWgSTEPYuJs60705txzs0xmwMED9EX4fP1kAoIKXs4pf6xToLRqDwThnfll5O54BeayaFXs60WwbH5m9zqpU+r9+UKAC4XE26rPiR3Hou18vjexVT7w8iIkqKvnRap5OfswiqdRVBO9WnTkf/gBSnDykJHb2M0Snr25TUPnZKLAvaNBg4YkcwnYuXrR7qPR/rHJujReFz+57QWZIMJU9zCG4Pcz27NpCQ9Os85tAtcZQaaz4Lfr1sTpNdofmAsBDSTqwV5OeOXSawCHbqzpKGMjAddonwt4dlCq1CjKgLcuu9auj9niguuanP65i6z7dA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i3b/pChOO+/Irow/CwiaflZmuM4kg/iSibYcpbamfW0=;
 b=bUbOZfvfEpgRXtZSV88LBPSUpSwtej7PruhOqd59xp6aNe87PxXFDzeCZLeEHJSNZwVgUotaAPBGAaH8ua5LeASxx3ZtVw/VjNBaCxg0SIgXsKokdjD59dUNoL6acKg9UzuP8Nd6Ux0IYXMpbYmdEGflHd+DwyoqJ7VbRr8N6LI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by CY8PR12MB7362.namprd12.prod.outlook.com (2603:10b6:930:52::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.25; Tue, 4 Feb
 2025 13:36:20 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%7]) with mapi id 15.20.8398.021; Tue, 4 Feb 2025
 13:36:20 +0000
Message-ID: <2217a9b5-894a-4f1c-95f8-dbd6f18fc8b4@amd.com>
Date: Tue, 4 Feb 2025 14:36:13 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/3] drm/amdgpu: Explicit sync for GEM VA operations
To: Friedrich Vock <friedrich.vock@gmx.de>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, "Sharma, Shashank"
 <Shashank.Sharma@amd.com>, Alex Deucher <Alexander.Deucher@amd.com>
Cc: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Tatsuyuki Ishi <ishitatsuyuki@gmail.com>
References: <20240819072110.108715-1-friedrich.vock@gmx.de>
 <8488e172-4d50-4cd6-8d2b-fd86d6126425@amd.com>
 <e6330f10-a736-4ccd-8a0e-95e1899648d6@gmx.de>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <e6330f10-a736-4ccd-8a0e-95e1899648d6@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0442.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:c6::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|CY8PR12MB7362:EE_
X-MS-Office365-Filtering-Correlation-Id: c8603e3d-f381-4084-cd31-08dd4520e871
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NFllQUozUnlrT1JzamNlelhkTWNwOTYxZ0oraWxCR2psaUQ4K1FxKzlyLzdR?=
 =?utf-8?B?a3Q5aUtSbkdxdThmWVFsY1JUeUdhM1d4cEtKaGQxMVNidFdZWGVXRFlvS1dx?=
 =?utf-8?B?QTdOaUE3WThmNm1CeXZ6am5iVWNZV25oK1Z3dDZjUmMrZFY4L3FaUWdmbGZt?=
 =?utf-8?B?SkE4eTN5bHVJemlqaTVIYmZ2L3RJTnFSUERpWStyZzVIRnAwb2NTb21rRnBt?=
 =?utf-8?B?ZWJsYnpnTlJyREdKRHJ3WXRseHEzbUtWcWVQM3F5bW43T1FwMFBuWjRWbDBG?=
 =?utf-8?B?Ykx0aFI5M2d6dGNUYUdRamh3eVRzUjlhZjZFdEVpV2swMGpqQUlmZmpIUXI1?=
 =?utf-8?B?UHRTY3VwQngxSWJtMG14SUZsRUx1K1Z0M3FmQ0ZycmZNWHpCajVoeHZIWmRp?=
 =?utf-8?B?QkMvYzA2U3hnS05hd3lrY2xPKzROR0RUb2w5V09oTnFWR0tQcjZPRWNmQmUy?=
 =?utf-8?B?SU9vZkp5UEhyUUtBZFpEbWQyZVlyQmorcjRIVSsxREhDdWxZZDZUTk13MDJX?=
 =?utf-8?B?QUZXbTlXanNDSVJPcUU2RThaSk9HL3hKU1JVa05XUWp4NEJ4RUdCVWI0VmlM?=
 =?utf-8?B?cjZJcW9LWmx5TGwybkF1T3lkNEFhQWUzU0NYY3J3Mi9TM1NiUUd6S0hUT3Mz?=
 =?utf-8?B?QWVzcWZLdVc2eUNRTml2aFo3N2QvODF3ZDhTc0w5U1ZSMTVCQjdXK0hYRE5P?=
 =?utf-8?B?U2tSWkRyMnhxN0l1WW5KaTdMcVcwWDlyMHRiM0c5UU82cnRCWTRjTVcxeXht?=
 =?utf-8?B?R2FCbDdpS0RwVzdqT2h0LzduM05rU3QvcEo1UXJ5TEFPajdNcmU4UnE3d3lz?=
 =?utf-8?B?alA3czJsbGJrbWllemVNODhwem41OHhZUXRzMVZHWSs1MVQwdTc4cmxuRlIy?=
 =?utf-8?B?M0ExdTNXSUhXcisxNjFISjMzTWJKdmR4SjhESndqWUVRZGlHUzgreUx0VlZF?=
 =?utf-8?B?RXJzbGUwY0Y3d3E1N0s1VXpwVGRKa1MwcElTYnEwZVRmQkQ4d3pCQWszSW1u?=
 =?utf-8?B?UFVCRDRnbGo0alRzYVpWM1VlVE9oMy84bS9GWjZQWk83MVdjM2t6bis3aWpk?=
 =?utf-8?B?YmlUQ2k2cEIyZ1ZDQUIzamNyNGNmKzYyTFNJejhSUFdQYVFqektsV3NxTjhs?=
 =?utf-8?B?UUJzVE5aODF6T0FpQURRb21wNVhlbjAvTkZyNUNubWhhUzNKRjZHOXNpS1VE?=
 =?utf-8?B?Sk1LK0xwUXk5YzZLQ1dwNkU1Vi8yTk9MUVZkZTlVcVRCUHJTS3kxekN0ZTM0?=
 =?utf-8?B?ZEY3UDJpelp3Y2dkY3QwdWh0aXA5MURIeHFYZjdyT0d2KzFuTWhnYVhiZmdU?=
 =?utf-8?B?ZDh1b0cyZ3FrTHBmQW4zZTJkVEViS29NZ2ZKcy9YU2pUWlFaWitMVUdwUURW?=
 =?utf-8?B?eHdWQUhzOVZWQWtTd3Vja1pzeXRQMlBwM1lwNXJBRXpOQVQ3UUUrVitkTWZX?=
 =?utf-8?B?QW1JZXp5U3JBYkNBUzNHUmxodUdRTExQbk1rcVBnSnRYOTlpS2h2VEVBQ1Rw?=
 =?utf-8?B?YzlYazVQY29RMVVEQTJyY0RPUVFWNUtqZGdRVmZ0akNLeGJVMHU4OXdqMnZ2?=
 =?utf-8?B?WnpMZVUxWWpYUzBXbE5mL25EUUQ2VVdMblNFY29URlRSVVRTU24xMCtEWnV1?=
 =?utf-8?B?TXlveUFuZjMwYVFBbVFheUdEVVgwZ3lUc1gvLzJQVHYrRTYzTlNHVWoyWS9v?=
 =?utf-8?B?bXRHaWJ6REx1VVFlTkUvWWpnUWxDWUcyT2VrUEtCUVd3ek5xWFhoQTJGTEs2?=
 =?utf-8?B?SUtEUm5XWTBsUVUyUXpGVzNZeGVja2VmTDVCRFB1b2t5elZOdE1nSklGZlY0?=
 =?utf-8?B?SDlCcUt3ckl2aktNN1dOZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVl3ME4rU0VPV2pac3YrL3dRbU1pZWNXbWZGMlljaVBKYjR6aUZTOFoweml6?=
 =?utf-8?B?NGhZUjA5NitTYzZjNzZPQ3VnbFdqZFA0eFU1V0krcXM2NDM3WjFJdlpNb0Nw?=
 =?utf-8?B?b1Y1bkFLcTJobFAwQ2hLQkt3aE00a2lWTkozODI3SFFvTklLR0NqMGt6S3Jw?=
 =?utf-8?B?M1pGZm8rTDV1Ym5VSXlBWlN2RTZoRmV6ZjRWbSsxOW5UVGJQMk9PZUVVOVFW?=
 =?utf-8?B?ckY1dWJmQkw0eWwxYno4SWFrMW1BVFVMUzVRNUkrZUFyYkNXbkNNc3FzQlZl?=
 =?utf-8?B?TW5ueWJNc0I4RFZINHJlNGRCQjdwTm81NURTVDhPMURwWTVOekNZaWYvZEc3?=
 =?utf-8?B?dHU0NWcrOUx4ZTdxTE54a3ZISm8xNXBrTzRRekIzR2ZvamNaZE8rMlFRNGR5?=
 =?utf-8?B?UzF1ODVBWDFoVTV5bEJNSVNTMXRUTU9mNnJkZm0zSEdNNTNBVzVLYnRvL1RK?=
 =?utf-8?B?SEpUeDN3ajJCaVlQWFBYak52UUxIeTBxOU1YdldCSWwrbEllK3p3NVNJc081?=
 =?utf-8?B?NDF1bjFlY3liS3JVY2hqc3NOdnRJRE13a3J2WndSNXQrd3dxcFMyZE5ibXJI?=
 =?utf-8?B?Nm9TSVpGSE9wUGQ4cmIrcWhFckhGZkRFUGZxU0cxMTkzMHY5RjBpZi9DTU1E?=
 =?utf-8?B?RjFNbmFlblRDZCtQZkNTMFV1MVk1U0MxZjY0N2ZHUVRjSnF0emhRcDhneU5O?=
 =?utf-8?B?cGhhSWhtbUI2UDI5Ni9KNXIyWlJTWEdkWW1IUEFQdXJHVUozK3Y3MnVxbFFK?=
 =?utf-8?B?c0dQakJYbkRPUUhxOU1Yb2RhUnF0OHVFcit6eHFBNytCeVFndWFxOE5ncGxw?=
 =?utf-8?B?OXYzeEo2RUpWeC9DQmxKeTJIbW03MFZDWTR6cWI3WW8vT2tDOUdQYzVaZE9O?=
 =?utf-8?B?ZFV6QUx3VDZ2cyt4Um1EblpQVGZ3Si8zQjg1K2xvdmdqVlF1YjR6Q3VnY09u?=
 =?utf-8?B?Y2lpZDNyVkN6eVVoOHRabEg4c1o2bENDOEtqOVNQcHhvVWtRQVhjWkVFY1V2?=
 =?utf-8?B?QnBwQzZXUTBnLzh3R2cwcElLN2dlcFpIRmxNZ1JZYndSNWwxalJNSWRhYXgx?=
 =?utf-8?B?QjFnenRlYzJVMGVpMnRHOHFxaXNJWWVXSnJRTWJtWjV5WS9EdUxSaEQ0VUM0?=
 =?utf-8?B?WkhSbzlnNkNSZXEyQm12MEY1QVhvZXI2eW1kbGF4SGNXbzNJTmlGS2VRcDJG?=
 =?utf-8?B?NDVGQWl1bnlWTHJWd0M5Mkg4dDZHZStkZ25ZKzVhZTdpaXFQajNpQ2laUEgy?=
 =?utf-8?B?VDBqTm5wMzlZbWxwM1VnRFlyaGtuNmFZT1JNNExsbEJKN0RZNUhoT1RqT2Ft?=
 =?utf-8?B?R1RtWXZTTkZvQWIwbElUYjc2WGtSWVVWQ0pjTlNuRGMwUGJpc0hjZ05TWTJN?=
 =?utf-8?B?dVJzR2NTdmduSUlLdHV1RFlsTVNwYjZCSTk1b3VqbmF6V3QvNTFsTUxzZU54?=
 =?utf-8?B?dFJ0bmNOVURiNDduUG5oSGNyM1AwNjBLL2RRZE5TVkxndUlSRWJQQ1hDNTlJ?=
 =?utf-8?B?RlZZOE5lK1pOQ2twRnZ1cHIybWFVcjZ3eGlkU2M1bHgxeS9QRTh6a2Fad1NM?=
 =?utf-8?B?STJyU0UrOG5DWFNxbm9lM2JIVVhiaVB2YkFWekU4YzlVaU9GNzMwNU85V1BX?=
 =?utf-8?B?SnB4Unpzc2pkaldSR242cmlGMnpCQTM0R3ZnZDY5MzI2U2RhbWt6SDk3SXFU?=
 =?utf-8?B?elZweDRMODkwUzJnSGt0SU5TWG1HRXZtblBuMEg0eFk5WHlnUG5CSEx3WUth?=
 =?utf-8?B?WTRsMldBSHl4NTNUU2czTzRjMjZvMWVVRFhYbm55bzdiUGloZEJieUNlTHdE?=
 =?utf-8?B?Q0hTeFUzOWFIV3AxOW9EK1I3Z3VUbTJaTmpUL1dzSjdrNk5FNGVwRFozMkZ2?=
 =?utf-8?B?dk5SQmoxMlczVlNiWjNPR0FUNktvNWFlSWpTaTd6Ym13MjUvRERwZENzSStZ?=
 =?utf-8?B?cWdjTjVmT1hTbWc3UktOL3FJbFNCNnE1WGJiTVl0K3hJVGhyYndRWTNuOExo?=
 =?utf-8?B?S3E3a2lzU2ltS3ZIZmNqN2srbnVkWFN3KzVlNmZhNlJrNk9ldHYxZjNTT2N0?=
 =?utf-8?B?YXRDaVlsMllRWmVXTDJvdmZ0bnpPcTRIRHF2VE1meUY4d084OGYzYXRIMVpw?=
 =?utf-8?Q?Mk5Fr+XTusgpyEdp5yxDjh1kI?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8603e3d-f381-4084-cd31-08dd4520e871
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Feb 2025 13:36:20.0623 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Al/ajsykr4ORNz92H+aLfkPA6pdPf7nLm9QJqtvaqGIzkOlC1b2YRX51EdaGDL2L
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7362
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

Hi Friedrich,

adding Alex.

Am 04.02.25 um 13:32 schrieb Friedrich Vock:
> Hi,
>
> On 19.08.24 13:21, Christian König wrote:
>> Am 19.08.24 um 09:21 schrieb Friedrich Vock:
>>> In Vulkan, it is the application's responsibility to perform adequate
>>> synchronization before a sparse unmap, replace or BO destroy operation.
>>> This adds an option to AMDGPU_VA_OPs to disable redundant implicit sync
>>> that happens on sparse unmap or replace operations.
>>>
>>> This has seen a significant improvement in stutter in Forza Horizon 5
>>> and Forza Horizon 4. (As games that had significant issues in sparse
>>> binding related stutter).
>>
>> Looks pretty good, I have Shashank and his team working on the similar
>> patches ever since Bas initially came up with it since we need it for
>> user queues as well.
>>
>> Shashank can you take a look at the UAPI? Of hand looks pretty similar
>> to what we have done as well, doesn't it?
>>
>> For the internal implementation in the VM I'm currently working on a bug
>> fix for the KFD team, so this is subject to change anyway. Going to keep
>> this requirement here in mind while doing that, whatever implementation
>> we end up with we probably need to re-base it anyway.
>
> Bumping this again - it's been quite a while, what became of that KFD
> bugfix and the userqueue stuff? It'd be nice to finally make progress
> here, whether it's using the user queue interface you worked on or a
> re-spin of this. Maybe it's possible to split this off from the rest of
> the userqueue stuff and merge it beforehand if you're reasonably certain
> about how the uapi should look? Let me know.

That is merged into amd-staging-drm-next for quite a while now, but we 
only defined the interface and dropped all optimizations to initially 
get it upstream.

@Alex IIRC we pushed the KFD part upstream already, but the userqueue 
part is still waiting for the final firmware release, right?

Regards,
Christian.

>
> Thanks,
> Friedrich
>
>>
>> Regards,
>> Christian.
>>
>>>
>>> Userspace changes for this new version can be found at [1][2], and a
>>> kernel
>>> branch containing these patches can be found at [3].
>>>
>>> [1] https://gitlab.freedesktop.org/pixelcluster/drm/-/commits/vm-
>>> explicit-sync
>>> [2] https://gitlab.freedesktop.org/pixelcluster/mesa/-/commits/vm-
>>> explicit-sync
>>> [3] https://gitlab.freedesktop.org/pixelcluster/linux/-/commits/
>>> amdgpu-vm-explicit-sync
>>>
>>> v3 changes:
>>> - Rebased onto current amd-staging-drm-next
>>> - Added option to wait for drm_syncobjs instead of executing 
>>> immediately
>>>
>>> Tatsuyuki Ishi (3):
>>>    drm/amdgpu: Don't implicit sync PRT maps.
>>>    drm/amdgpu: Add optional explicit sync fences for GEM operations.
>>>    drm/amdgpu: Bump amdgpu driver version.
>>>
>>>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  |  2 +-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c       |  2 +-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  3 +-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       | 76 
>>> ++++++++++++++++---
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h    | 23 +++++-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_trace.h     |  6 +-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_umsch_mm.c  |  2 +-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        | 68 +++++++++++------
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        | 30 ++++----
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c    | 12 ++-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_pt.c     |  2 +-
>>>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c   |  9 +++
>>>   drivers/gpu/drm/amd/amdkfd/kfd_svm.c          | 18 ++---
>>>   include/uapi/drm/amdgpu_drm.h                 |  7 ++
>>>   14 files changed, 194 insertions(+), 66 deletions(-)
>>>
>>> -- 
>>> 2.46.0
>>>
>

