Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DAE55B2BCC4
	for <lists+dri-devel@lfdr.de>; Tue, 19 Aug 2025 11:15:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B4A3610E57E;
	Tue, 19 Aug 2025 09:15:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="K5KWSMKo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2053.outbound.protection.outlook.com [40.107.243.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E0A510E57E;
 Tue, 19 Aug 2025 09:15:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nPoxR/iAvKC6A356YnPOWJr+hxDKRzGH2Gk/dlu4a9dlVJks3nEsodPuWo2JrnC+q36IZbxFmo5SeRF2J5XZg3ITQpIiQzyLCtGgig2bdvDMVCU+aRSfyB0Ss87yebeqMDtUuXznjaoM645MjQWHHoUOgyi5UM/l0Wq1F8FdHJoYyaEU4uSLh+p3i5HXKeDrzsGyprq3lnZwn5MdOOBtV2DwmcqKZyLhtjVoMZeSb2DUYQ0+n7kFlcFL4MB9CWO6SVDXxQpaJOwD99CQ84DkAn0452+ILnIo2t+PVb8AEUh6d1jaAh2l2PgsFeAS5IEOe+ZqoM+6sIJW2JtyLrTviQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cxgu4VMMvXFy9zjrzTJjug+s8V3eVJXWeMJ732Qz5CM=;
 b=GU+L/jvLv4yiIQtNFz4+m3/1Yhcs4R2CO9QXa5z5bhiegJ3GDwAwvZCY1GPRPjxulGli4St5jMgb/TsCxXhoaNAOUo4Z0Vq8w+7d4XW8VJAuilWxpZ0wZspCpc5w/PxcJP9Qc1E7Md9DwBhZQyyURYgpp5qkyjUY8/JQ8EIo3Xx6X7BuWsiR4dUDf//11ixQtsItj7fvD3CNMCxqA3cP/OCy4t964mEv2c0lU/FioANmlIhxy56Af/y9KYgBETG9b1A7nVD2Gs+OZK7lvWVwJyeDAGkxEXbggnFNhgJ0ARTli1Zd4yOtcVRVHfxxm5w7rKOhYBhdIIgB5DNw9rap+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cxgu4VMMvXFy9zjrzTJjug+s8V3eVJXWeMJ732Qz5CM=;
 b=K5KWSMKoi8yypdvx+hRpXlGWtyYUIWsK+35KI/ubKHSCPRGM2WFeVcUelcJdBESk/H6NLL/lpBJQjudLtnYFN6bpvToC6a4S+2MQwPpiUOZdS5rX2jtpatRxXmF2gb3wiiFrAQNszwe64YNLc2djDLS85LWNq2Jn8lGCsk6wwFE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by IA0PPFAF883AE17.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::be1) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9031.24; Tue, 19 Aug
 2025 09:15:18 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.9031.023; Tue, 19 Aug 2025
 09:15:17 +0000
Message-ID: <94132288-a3a5-49e7-8f3b-2f7983f3bc51@amd.com>
Date: Tue, 19 Aug 2025 11:15:08 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] dma-buf/fence-chain: Speed up processing of rearmed
 callbacks
To: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
Cc: Sumit Semwal <sumit.semwal@linaro.org>,
 Gustavo Padovan <gustavo@padovan.org>,
 Chris Wilson <chris.p.wilson@linux.intel.com>, linux-media@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
 linux-kernel@vger.kernel.org, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org
References: <20250814094824.217142-6-janusz.krzysztofik@linux.intel.com>
 <2443311.NG923GbCHz@jkrzyszt-mobl2.ger.corp.intel.com>
 <c4bac4d8-9c5b-446c-b9a1-1bc7ac6b38ff@amd.com>
 <2067093.PIDvDuAF1L@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <2067093.PIDvDuAF1L@jkrzyszt-mobl2.ger.corp.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0189.namprd13.prod.outlook.com
 (2603:10b6:208:2be::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|IA0PPFAF883AE17:EE_
X-MS-Office365-Filtering-Correlation-Id: 629249c9-a483-4424-613a-08dddf00e9ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SXNkdUdUUTZWNUNzanh6b2ZqU0JWdHh6dDRtZ2JyY2hhM0ZtdXI2T0NYcDIr?=
 =?utf-8?B?bEhwUy9WeWNINDNBYUhkUlZPSmYyUXh6S0JLcy9yTlphUDN0bEVtRWVLSnEz?=
 =?utf-8?B?TWx3Vms3ckFmRWhyS2lmT2FVVUl6YVRaVTZpWkt6RlJpUkZiYm4wd0VUajV0?=
 =?utf-8?B?cGpBOVZ1eTBGdEdGa29VdC9qNVpaVmxGVUdMT1E4eVRMMHEvdzU5L3k4QmM2?=
 =?utf-8?B?NWpGa0FPVGlmSmpNV3lRUGlvVENMSmlPUkxyeGNVa0lhNUt3ajh4WUZjVEpD?=
 =?utf-8?B?NkVrQXJFYVR4SHFQanVHUkgwQTRMT2NIYUhyTkJXYko2U0FTUENSbndraC9S?=
 =?utf-8?B?Qmp2NW5FREJsRFhtUUtGTlBuTmJ6Rk00SDVXQmxlVnZySTJKQkRWaTMvRzRX?=
 =?utf-8?B?cUZLZ1dlc2hVMjltNlgyVzdYK0FpNjRhQ1FrT1dIVWp6ZzEvaXZoOC9TdkFv?=
 =?utf-8?B?Rks0NmxQUWtLTDVaQ1JLbFJuNXhvWXBLWXpGbWVyUWVaSUtQcXZjL2JXUHlX?=
 =?utf-8?B?MlJlZTlrNi80dEN2MmNsaFpMbkdqdDVTUVFaaExPTjJGQXR1TlNGMlVXWEpk?=
 =?utf-8?B?cG41SC9nUHN0ZSttWlpmM3U2ZDJmQVZJNytLZ0RvejBJRGdLT1IvVzFldGZn?=
 =?utf-8?B?ZlR2bjhwKzQyUG1NWmxJbktMMWtiL1dVY0x2bnhDWW5vRkJxWWc1TFVjQ3gx?=
 =?utf-8?B?bmoxWmJCQWh6OXdVVVR2Vy9UUHJsUTdaRXhKd05LYWVEY0U0dk1YblhPTWZk?=
 =?utf-8?B?SFBoYitoN0NKSnArUG94QmxKeW9PeDR1S0RCQ05Ia1U1STI0eDkvYnJkQS9o?=
 =?utf-8?B?Z1JRemFsaE1PTklPN0tHR2RFcDRzbDA0VWlrN2pOdUx4d0dkRmJES3g5eC9G?=
 =?utf-8?B?a2ZtSm1mb2RvZVpzNWF2NFhsaDFwYXRySm0zOXBXbGFKM08vZDI0aERsSk10?=
 =?utf-8?B?bUZqZS8vMUxKZ2RFcWM1T29SaGRwM2pTSmgwQ0RCZjRFOXdWWjM5TkdkOGEv?=
 =?utf-8?B?RnAwSDkyaFUvbVdEUFZKeXFaMTNGcnRLV3hQY2hFdW9HTGtRSnhKazZKYzZG?=
 =?utf-8?B?eENDbHlJck5JbUsvS05IbXFsQmxMeHpISUhBUEIva2pELzRLbFRoNHptdXdx?=
 =?utf-8?B?TUlBTzBXL3JKWHRvYWJiNXBWV21kRjBZMUhNbktZcnJ5aEtraTA2SjkzbFpn?=
 =?utf-8?B?TkUzaExyaVZPOWtjaE5oSXNQL1lVRWNFME5tMldsVzZGc2dmSE9ZTkhMREpU?=
 =?utf-8?B?aUhSVWxZdnYzdFU2QS9mRGF5WmFzN04wajJKUUJ5b1NpZFhGc0pvZngrb3l5?=
 =?utf-8?B?a0hrZUM1cHN4TXlkSE4xSmsrYVlOeGdTem1WQ1FKVmtmTEhsb212cjh6VHRt?=
 =?utf-8?B?VHY5VVhYR05qT3lwU2RScC8xTERYTDVKTlRqZXU3cUtEK1RKVkRuUXFLQkxN?=
 =?utf-8?B?bVNTMityNjI3NVYrbENaWWlsT0lkYWxYRExKRHN6eU1Yc21hekJHakNEVE9U?=
 =?utf-8?B?bHZQZ2I0NVhYdzlWRmlBK0lJSVUzZnJ4bnMxVUc2SzJadzErSVd4cGtFR1dN?=
 =?utf-8?B?ei9DVERvT3dleUVsV3RvbmxpTE44MzVPY25pMm9GQnYzUm5NMiszV0laaUQ0?=
 =?utf-8?B?YTZ5QnVCalNHS0kxa0Y2dXpqcHl0NXFKdXF5Q0MzRVBxWDM2SEJFOXVxd2lo?=
 =?utf-8?B?YWpheHFQQzFzTVhXWW0wRFZTYWkzLzNReDZVWTV5enZEelF1K1dieTR0MEk5?=
 =?utf-8?B?TE5jTUsyUVcrWDVtRFV0N0VIVTdpcVR3WUVOK1VkVHhQUXVtZ2ZzYmdmT2pQ?=
 =?utf-8?Q?Q7U1jBWNxmeOmtVP7sXgxvXq4w3XXZkNQ8x38=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDB4ZnJWbTNSZDdoZFFVR1p1dzB5YXdaeThFUmVDaFpvZjFjaEFBa3V5N2hh?=
 =?utf-8?B?YTl3Y2RDc0YyUGR2WlduZkhnMFlocWljYzZMc2lUNEFoYlVaMU96VGplTCs1?=
 =?utf-8?B?bldLcW5xcFRES1lRZS9xbExmckVVRmFJLzhBWlpZZ3ByeDlBVkxDZHFJM0Vp?=
 =?utf-8?B?WVdGcm1LamltdXpER01wMTZHOW42Mm4wRWRMamZZZkZTL2hONnREK3RlcFEx?=
 =?utf-8?B?UXQ0dXlpS2JVZ29TUjVQRzhzYmZzKzVzQ1RPbUxkVFpLVU1vU0VCaUFWam54?=
 =?utf-8?B?OWJwcnJuSHdSTjJ5anM5bnZ1dS95cjFMQ3JXakNmTVFmSWNpYkFMOW1HWk5T?=
 =?utf-8?B?VTg2SFJuUkRtSk1MS1FqdXE4Ris5eHJkSzFiK2pzNnZZWjJGOUlWZi9obVBT?=
 =?utf-8?B?alhIdjFVWjdoaVRlNXk5c2RXZzRXOGZzelkvNlhLRkJJVndGdFgrTGtNaXFt?=
 =?utf-8?B?cGxJaDZNWWZOZ1NURm0yb1U2cEo3RDExYzJ4N1M5c2VLR09tREsvZnZRN3Yv?=
 =?utf-8?B?eG85aTU0ZEJCNy9uU1ByZC96WlJoL1gxRXRVeEJDekxDRHREYnhkOHE4Mkd3?=
 =?utf-8?B?RFI1Wnk0dkhnci9PbWgydzlqdmVxbEFNaHpYZjVOaEs1Y1AveTQ1S2pKYU1t?=
 =?utf-8?B?UFB3NDZzYk5mblJrc3lJcnJrSUdoWEZmUXVLaTJIRFI1S2F3Qm5sYmVGTkNw?=
 =?utf-8?B?OGw1YldnSVlEYnlsUEw0TWZDcjByRUdiVDk5SFJnbmZ1UUhPdGFSK0JUMFBX?=
 =?utf-8?B?eUtZQmQvK25tU2U0ZldSKzZhNXpGL3ZJSTlLSVIwWElRQnE0blRMdmhZaUV1?=
 =?utf-8?B?MDVkWjIwbE9UZGFKQ2ptVnpEcHYwZGV4S1JJYU42L3haMWNtMStBT2FXUlgv?=
 =?utf-8?B?bGQyUE9taXhyallnOWtWT0JnbDVnQkZUbEZuV1lpankraTBOWmk4UzFXcURp?=
 =?utf-8?B?YmhONVpGN1J5NC8zMklxRHAwTWhNSlpMVTVhWkVHWVY1TU96MlU3UkUrWVhv?=
 =?utf-8?B?aGQvSC96RWpXZThQeEgycVhEVzVKTHV0WFlGTm93RTRnWEVvR2krcHBkWG9w?=
 =?utf-8?B?ODR3QXlIUzJ6eGFteVFnWTQrT09PWE42Q3hoOVEwMUFySWRaVi9IdzNNTHh6?=
 =?utf-8?B?UEx5bEE5SStLTytsRzR2M3BrVEpnaTVYL2dpVG11UExGSGJEcVNMVFBIOXNk?=
 =?utf-8?B?Ym94NU1xSmhyY0R5MTFFRVRUZ0s2bmVPajY3TjF1M2ZDd1JheTJFdUN0WXpi?=
 =?utf-8?B?bnhRRGJXS1lMUUU0dUlhRHZaZklmdkM3ZWN2ZHRGOU9MWjNjNHBOV1oyaTFu?=
 =?utf-8?B?YzBpTEtlZ2FIcElYVlgvM1I4bGpzcUhraDRBU1ZhLytWZzJEamtPY3FFMzJh?=
 =?utf-8?B?cVlRa2RrS0RwQVpFbHJBaTcxdlFxalBpa3ZsS0paM01pdnUvYnJkWDdmZkY4?=
 =?utf-8?B?VzhmWU5RaUg3V3V5MlJoQXNTMXlpYmdWZzJMVy9FbzR4TTV3MDdiUUNlOGhE?=
 =?utf-8?B?SzlQVnJEQkIvcllJaXg3bXFiQ0s5Rk0rVThKNnU5MWJkYzVQbEtWSis4Y3hy?=
 =?utf-8?B?UlFjamJYVjV0MVpzWmNHNzU2cTcvUHlZVG9kcnNQdGZ2UWhKWjB6STFUTzdZ?=
 =?utf-8?B?dXBiWTdSMG92b24yT0FQUXFIU0I5NUFVclJDNWUwR2xMSVNkZ3JEdStXaFhl?=
 =?utf-8?B?QXhVb09CUmM1TXg2OEhoWTBjWHBkbGdzQU56ck9qZ3ZDc2xhdVNpcFJNSkRj?=
 =?utf-8?B?TFhsdU0rZWpEaDEvcjRSUjZoaWxzSmpoUXpaQWJaR3dXUjQ4bW5sNk0yZFhk?=
 =?utf-8?B?MEgxTGIxNis1SUNNZjI1ZzFHS3dGdEZ4UFEvUVFRV0xoaE8vaXlsd2FSTVJH?=
 =?utf-8?B?K0FhNjlmSXRKcHlDckpRN1FPZ0drZDZmb2RwWDJPa25pQVRqVC9RR3JpYkM4?=
 =?utf-8?B?M2VHajNYdEc1dUVkcVVHeFBRQ3dGY0ZNaHk0Wk80dFM1amNmNmlSMWNyNGZx?=
 =?utf-8?B?MHZKK1JsNVM3TlpodUVCOW12TTR0U28ycytMTFdCTHE4VElzeEJWK3RqRGFP?=
 =?utf-8?B?OXpXUUhpWmR3cU1vTTJhZTQ2dWI3bWRJZXJ6OTJXL1d5V2NDU0FXVlRlQjIv?=
 =?utf-8?Q?cFFudgN0KJZi/ZFaMEtl7kmo2?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 629249c9-a483-4424-613a-08dddf00e9ba
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2025 09:15:17.2145 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jBwO3nLxPdWo18zkLCDEoPSk4avbeFwAvaP5WfufQkYU8V8w0eGGGlsUgGgSx3FA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPFAF883AE17
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

On 19.08.25 11:04, Janusz Krzysztofik wrote:
> On Monday, 18 August 2025 16:42:56 CEST Christian König wrote:
>> On 18.08.25 16:30, Janusz Krzysztofik wrote:
>>> Hi Christian,
>>>
>>> On Thursday, 14 August 2025 14:24:29 CEST Christian König wrote:
>>>>
>>>> On 14.08.25 10:16, Janusz Krzysztofik wrote:
>>>>> When first user starts waiting on a not yet signaled fence of a chain
>>>>> link, a dma_fence_chain callback is added to a user fence of that link.
>>>>> When the user fence of that chain link is then signaled, the chain is
>>>>> traversed in search for a first not signaled link and the callback is
>>>>> rearmed on a user fence of that link.
>>>>>
>>>>> Since chain fences may be exposed to user space, e.g. over drm_syncobj
>>>>> IOCTLs, users may start waiting on any link of the chain, then many links
>>>>> of a chain may have signaling enabled and their callbacks added to their
>>>>> user fences.  Once an arbitrary user fence is signaled, all
>>>>> dma_fence_chain callbacks added to it so far must be rearmed to another
>>>>> user fence of the chain.  In extreme scenarios, when all N links of a
>>>>> chain are awaited and then signaled in reverse order, the dma_fence_chain
>>>>> callback may be called up to N * (N + 1) / 2 times (an arithmetic series).
>>>>>
>>>>> To avoid that potential excessive accumulation of dma_fence_chain
>>>>> callbacks, rearm a trimmed-down, signal only callback version to the base
>>>>> fence of a previous link, if not yet signaled, otherwise just signal the
>>>>> base fence of the current link instead of traversing the chain in search
>>>>> for a first not signaled link and moving all callbacks collected so far to
>>>>> a user fence of that link.
>>>>
>>>> Well clear NAK to that! You can easily overflow the kernel stack with that!
>>>
>>> I'll be happy to propose a better solution, but for that I need to understand 
>>> better your message.  Could you please point out an exact piece of the 
>>> proposed code and/or describe a scenario where you can see the risk of stack 
>>> overflow?
>>
>> The sentence "rearm .. to the base fence of a previous link" sounds like you are trying to install a callback on the signaling to the previous chain element.
>>
>> That is exactly what I pointed out previously where you need to be super careful because when this chain signals the callbacks will execute recursively which means that you can trivially overflow the kernel stack if you have more than a handful of chain elements.
>>
>> In other words A waits for B, B waits for C, C waits for D etc.... when D finally signals it will call C which in turn calls B which in turn calls A.
> 
> OK, maybe my commit description was not precise enough, however, I didn't 
> describe implementation details (how) intentionally.
> When D signals then it doesn't call C directly, only it submits an irq work 
> that calls C.  Then C doesn't just call B, only it submits another irq work 
> that calls B, and so on.
> Doesn't that code pattern effectively break the recursion loop into separate 
> work items, each with its own separate stack?

No, it's architecture dependent if the irq_work executes on a separate stack or not.

You would need a work_struct to really separate the two and I would reject that because it adds additional latency to the signaling path.

>>
>> Even if the chain is a recursive data structure you absolutely can't use recursion for the handling of it.
>>
>> Maybe I misunderstood your textual description but reading a sentence like this rings all alarm bells here. Otherwise I can't see what the patch is supposed to be optimizing.
> 
> OK, maybe I should start my commit description of this patch with a copy of 
> the first sentence from cover letter and also from patch 1/4 description that 
> informs about the problem as reported by CI.  Maybe I should also provide a 
> comparison of measured signaling times from trybot executions [1][2][3].  
> Here are example numbers from CI machine fi-bsw-n3050:

Yeah and I've pointed out before that this is irrelevant.

The problem is *not* the dma_fence_chain implementation, that one is doing exactly what is expected to do.

The problem is that the test case is nonsense. I've pointed that out numerous times now!

Regards,
Christian.

> 
> With signaling time reports only added to selftests (patch 1 of 4):
> <6> [777.914451] dma-buf: Running dma_fence_chain/wait_forward
> <6> [778.123516] wait_forward: 4096 signals in 21373487 ns
> <6> [778.335709] dma-buf: Running dma_fence_chain/wait_backward
> <6> [795.791546] wait_backward: 4096 signals in 17249051192 ns
> <6> [795.859699] dma-buf: Running dma_fence_chain/wait_random
> <6> [796.161375] wait_random: 4096 signals in 97386256 ns
> 
> With dma_fence_enable_signaling() replaced in selftests with dma_fence_wait() 
> (patches 1-3 of 4):
> <6> [782.505692] dma-buf: Running dma_fence_chain/wait_forward
> <6> [784.609213] wait_forward: 4096 signals in 36513103 ns
> <3> [784.837226] Reported -4 for kthread_stop_put(0)!
> <6> [785.147643] dma-buf: Running dma_fence_chain/wait_backward
> <6> [806.367763] wait_backward: 4096 signals in 18428009499 ns
> <6> [807.175325] dma-buf: Running dma_fence_chain/wait_random
> <6> [809.453942] wait_random: 4096 signals in 119761950 ns
> 
> With the fix (patches 1-4 of 4):
> <6> [731.519020] dma-buf: Running dma_fence_chain/wait_forward
> <6> [733.623375] wait_forward: 4096 signals in 31890220 ns
> <6> [734.258972] dma-buf: Running dma_fence_chain/wait_backward
> <6> [736.267325] wait_backward: 4096 signals in 39007955 ns
> <6> [736.700221] dma-buf: Running dma_fence_chain/wait_random
> <6> [739.346706] wait_random: 4096 signals in 48384865 ns
> 
> Signaling time in wait_backward selftest has been reduced from 17s to 39ms.
> 
> [1] https://intel-gfx-ci.01.org/tree/drm-tip/Trybot_152785v1/index.html?
> [2] https://intel-gfx-ci.01.org/tree/drm-tip/Trybot_152828v2/index.html?
> [3] https://intel-gfx-ci.01.org/tree/drm-tip/Trybot_152830v2/index.html?
> 
>>
>>>>
>>>> Additional to this messing with the fence ops outside of the dma_fence code is an absolute no-go.
>>>
>>> Could you please explain what piece of code you are referring to when you say 
>>> "messing with the fence ops outside the dma_fence code"?  If not this patch 
>>> then which particular one of this series did you mean?  I'm assuming you 
>>> didn't mean drm_syncobj code that I mentioned in my commit descriptions.
>>
>> See below.
>>
>>>
>>> Thanks,
>>> Janusz
>>>
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>
>>>>> Closes: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/12904
>>>>> Suggested-by: Chris Wilson <chris.p.wilson@linux.intel.com>
>>>>> Signed-off-by: Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>
>>>>> ---
>>>>>  drivers/dma-buf/dma-fence-chain.c | 101 +++++++++++++++++++++++++-----
>>>>>  1 file changed, 84 insertions(+), 17 deletions(-)
>>>>>
>>>>> diff --git a/drivers/dma-buf/dma-fence-chain.c b/drivers/dma-buf/dma-fence-chain.c
>>>>> index a8a90acf4f34d..90eff264ee05c 100644
>>>>> --- a/drivers/dma-buf/dma-fence-chain.c
>>>>> +++ b/drivers/dma-buf/dma-fence-chain.c
>>>>> @@ -119,46 +119,113 @@ static const char *dma_fence_chain_get_timeline_name(struct dma_fence *fence)
>>>>>          return "unbound";
>>>>>  }
>>>>>  
>>>>> -static void dma_fence_chain_irq_work(struct irq_work *work)
>>>>> +static void signal_irq_work(struct irq_work *work)
>>>>>  {
>>>>>  	struct dma_fence_chain *chain;
>>>>>  
>>>>>  	chain = container_of(work, typeof(*chain), work);
>>>>>  
>>>>> -	/* Try to rearm the callback */
>>>>> -	if (!dma_fence_chain_enable_signaling(&chain->base))
>>>>> -		/* Ok, we are done. No more unsignaled fences left */
>>>>> -		dma_fence_signal(&chain->base);
>>>>> +	dma_fence_signal(&chain->base);
>>>>>  	dma_fence_put(&chain->base);
>>>>>  }
>>>>>  
>>>>> -static void dma_fence_chain_cb(struct dma_fence *f, struct dma_fence_cb *cb)
>>>>> +static void signal_cb(struct dma_fence *f, struct dma_fence_cb *cb)
>>>>> +{
>>>>> +	struct dma_fence_chain *chain;
>>>>> +
>>>>> +	chain = container_of(cb, typeof(*chain), cb);
>>>>> +	init_irq_work(&chain->work, signal_irq_work);
>>>>> +	irq_work_queue(&chain->work);
>>>>> +}
>>>>> +
>>>>> +static void rearm_irq_work(struct irq_work *work)
>>>>> +{
>>>>> +	struct dma_fence_chain *chain;
>>>>> +	struct dma_fence *prev;
>>>>> +
>>>>> +	chain = container_of(work, typeof(*chain), work);
>>>>> +
>>>>> +	rcu_read_lock();
>>>>> +	prev = rcu_dereference(chain->prev);
>>>>> +	if (prev && dma_fence_add_callback(prev, &chain->cb, signal_cb))
>>>>> +		prev = NULL;
>>>>> +	rcu_read_unlock();
>>>>> +	if (prev)
>>>>> +		return;
>>>>> +
>>>>> +	/* Ok, we are done. No more unsignaled fences left */
>>>>> +	signal_irq_work(work);
>>>>> +}
>>>>> +
>>>>> +static inline bool fence_is_signaled__nested(struct dma_fence *fence)
>>>>> +{
>>>>> +	if (test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
>>>>> +		return true;
>>>>> +
>>
>>>>> +	if (fence->ops->signaled && fence->ops->signaled(fence)) {
>>
>> Calling this outside of dma-fence.[ch] is a clear no-go.
> 
> But this patch applies only to drivers/dma-buf/dma-fence-chain.c, not 
> outside of it.
> 
> Thanks,
> Janusz
> 
>>
>> Regards,
>> Christian.
>>
>>>>> +		unsigned long flags;
>>>>> +
>>>>> +		spin_lock_irqsave_nested(fence->lock, flags, SINGLE_DEPTH_NESTING);
>>>>> +		dma_fence_signal_locked(fence);
>>>>> +		spin_unlock_irqrestore(fence->lock, flags);
>>>>> +
>>>>> +		return true;
>>>>> +	}
>>>>> +
>>>>> +	return false;
>>>>> +}
>>>>> +
>>>>> +static bool prev_is_signaled(struct dma_fence_chain *chain)
>>>>> +{
>>>>> +	struct dma_fence *prev;
>>>>> +	bool result;
>>>>> +
>>>>> +	rcu_read_lock();
>>>>> +	prev = rcu_dereference(chain->prev);
>>>>> +	result = !prev || fence_is_signaled__nested(prev);
>>>>> +	rcu_read_unlock();
>>>>> +
>>>>> +	return result;
>>>>> +}
>>>>> +
>>>>> +static void rearm_or_signal_cb(struct dma_fence *f, struct dma_fence_cb *cb)
>>>>>  {
>>>>>  	struct dma_fence_chain *chain;
>>>>>  
>>>>>  	chain = container_of(cb, typeof(*chain), cb);
>>>>> -	init_irq_work(&chain->work, dma_fence_chain_irq_work);
>>>>> +	if (prev_is_signaled(chain)) {
>>>>> +		/* Ok, we are done. No more unsignaled fences left */
>>>>> +		init_irq_work(&chain->work, signal_irq_work);
>>>>> +	} else {
>>>>> +		/* Try to rearm the callback */
>>>>> +		init_irq_work(&chain->work, rearm_irq_work);
>>>>> +	}
>>>>> +
>>>>>  	irq_work_queue(&chain->work);
>>>>> -	dma_fence_put(f);
>>>>>  }
>>>>>  
>>>>>  static bool dma_fence_chain_enable_signaling(struct dma_fence *fence)
>>>>>  {
>>>>>  	struct dma_fence_chain *head = to_dma_fence_chain(fence);
>>>>> +	int err = -ENOENT;
>>>>>  
>>>>> -	dma_fence_get(&head->base);
>>>>> -	dma_fence_chain_for_each(fence, &head->base) {
>>>>> -		struct dma_fence *f = dma_fence_chain_contained(fence);
>>>>> +	if (WARN_ON(!head))
>>>>> +		return false;
>>>>>  
>>>>> -		dma_fence_get(f);
>>>>> -		if (!dma_fence_add_callback(f, &head->cb, dma_fence_chain_cb)) {
>>>>> +	dma_fence_get(fence);
>>>>> +	if (head->fence)
>>>>> +		err = dma_fence_add_callback(head->fence, &head->cb, rearm_or_signal_cb);
>>>>> +	if (err) {
>>>>> +		if (prev_is_signaled(head)) {
>>>>>  			dma_fence_put(fence);
>>>>> -			return true;
>>>>> +		} else {
>>>>> +			init_irq_work(&head->work, rearm_irq_work);
>>>>> +			irq_work_queue(&head->work);
>>>>> +			err = 0;
>>>>>  		}
>>>>> -		dma_fence_put(f);
>>>>>  	}
>>>>> -	dma_fence_put(&head->base);
>>>>> -	return false;
>>>>> +
>>>>> +	return !err;
>>>>>  }
>>>>>  
>>>>>  static bool dma_fence_chain_signaled(struct dma_fence *fence)
>>>>
>>>>
>>>
>>>
>>>
>>>
>>
>>
> 
> 
> 
> 

