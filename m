Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8DCB29029E7
	for <lists+dri-devel@lfdr.de>; Mon, 10 Jun 2024 22:20:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4984310E5E0;
	Mon, 10 Jun 2024 20:20:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="YizGa4yy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2075.outbound.protection.outlook.com [40.107.243.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C547D10E5DF;
 Mon, 10 Jun 2024 20:20:25 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=THlILN0oYiVhzJZBv9Q75arbxLfwULOflIODhglwScqpA/m+nihZ9Q5U7Kj3p1dDGaxHDcewFQWQbCGuJBl5xSrcq7xrOGDsG/CteVcwPAtZrHz9Xgmupb0kKcuFSUvbJXwMV5aqUHg1HwoAtUZj03NMV8QEVShJx/ZPwf9GCMvvoUWov/o1F/1jUkZ1dLZOicakFPKluNRLMxdGNWW7Ey9FXJmyyXiYhLYZRZBA3knBOmDeFoNoep63GBurCPGJjk0HXXrKzIqCgkCK8VDcKj50Zqo2miE8mUkbvkYYUgHFfGgy73AjJu92Lz6mS4LveJcrAWTUta2vaAc1k1sdhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G60IRxdhNH9gk2WHRuXUJv9ACEWQAqRao1BHVrTRHZ8=;
 b=lUaxb7HzxHJc7PwctTzCI7Z3Hp8ov3WcDVdXlQp6yISoo21NUH+QBYfiFgvgRzU3Zi0+vsyGRlZBmgb2G6njprhnJMdZmNdwAgc4HB2NeG8hDnln/vCWqKWovDhFxwJ99prtR+n8ttqBLd82ry/82vz21br6998WaaWS/VNJbQiBh0csgUg1BIq2sxj2YjFJVNO0jUFuh49QHSJI4lg67anYs9bqCOFCO6Adbr5Chpn+ZxIoM8sOMP1xH+lOMZfNM4nENe+WsJsrxDnhc0x7hJtZl/YtGM+el7E9vRB9QRt8W/VZbIH7xHhAs3wQfS7FCyvf50VSp9Dig1VAFBsMSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G60IRxdhNH9gk2WHRuXUJv9ACEWQAqRao1BHVrTRHZ8=;
 b=YizGa4yynZWEXIhfhFMvtS5NZCoaXFZzi2/zTXe57V+Oxe5v3sqwkYBFKwLOOTsrB2O2ScWxXtjDkMWGZWCYQmSSt+8dw9RMGuYm74hPYIiakZB560swdULuOK2auGNfCmyfDcQgnCsPkusAsJSQpph++iwoCGAuGDXr2/vhlgg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN0PR12MB6101.namprd12.prod.outlook.com (2603:10b6:208:3cb::10)
 by CH3PR12MB9100.namprd12.prod.outlook.com (2603:10b6:610:1a8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.36; Mon, 10 Jun
 2024 20:20:23 +0000
Received: from MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca]) by MN0PR12MB6101.namprd12.prod.outlook.com
 ([fe80::37ee:a763:6d04:81ca%4]) with mapi id 15.20.7633.036; Mon, 10 Jun 2024
 20:20:23 +0000
Message-ID: <556979e9-c3d1-45d9-aaa5-b5a17422db5f@amd.com>
Date: Mon, 10 Jun 2024 15:20:20 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/amd: force min_input_signal to 0 on Framework AMD
 13/16
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Kieran Levin <ktl@framework.net>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dustin Howett <dustin@howett.net>, Matt Hartley <matt.hartley@gmail.com>
References: <20240610-amdgpu-min-backlight-quirk-v1-1-8459895a5b2a@weissschuh.net>
 <74f3c189-f3d3-4dca-9357-d4bc8f98da08@amd.com>
 <0759ed40-efef-4230-86fc-cdf6702843e6@t-8ch.de>
Content-Language: en-US
From: Mario Limonciello <mario.limonciello@amd.com>
In-Reply-To: <0759ed40-efef-4230-86fc-cdf6702843e6@t-8ch.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA9PR13CA0101.namprd13.prod.outlook.com
 (2603:10b6:806:24::16) To MN0PR12MB6101.namprd12.prod.outlook.com
 (2603:10b6:208:3cb::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR12MB6101:EE_|CH3PR12MB9100:EE_
X-MS-Office365-Filtering-Correlation-Id: ab10e2ca-45a6-4b9e-2ee3-08dc898ac1bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230031|376005|366007|1800799015;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q2ZQekwxREZXcGtnaGhWemY1TnpLd1dhalB2NDBueUpLTGlicm9sVlJSRXVy?=
 =?utf-8?B?MFdDcGtlakl6RTZydWNYSmpJNjBIN2xWZStNOStkT1BSQVdJMjh2R2VZYUJR?=
 =?utf-8?B?QVRlZjNCNXA1SXA5eUdXMTFQZDZNOVcwaTZBb2NKaktOYytIaUtvNlZyNjZ3?=
 =?utf-8?B?NGhibnFpVWsyUGZ4YjdvRFZBSkFROFdTMGpEdDVzY1NBWHQxZitoUDZjZFBM?=
 =?utf-8?B?NTVxaEpDTmtMc2VTWUJHdVhxM0dkVGI2ODBqYWlNQjc1VW1IWEdvZFQra2dj?=
 =?utf-8?B?d1dseWJFZ09jN0dvalZNb2lLa1B4K1VjbCtRaTRSZHV3UTk1c3cra0l2T0Fp?=
 =?utf-8?B?SDBFaWNINmRtUEhjSUNNWFJqU0FOOXhZeDY3bzhxd1dmTXNjeFBCNzVXTHFW?=
 =?utf-8?B?bGkyR0RnK2x6ZzFJRTVUbkNBVzJ0UjB1b1BtSk83U2pMdXFEMDdVVGd3WlNi?=
 =?utf-8?B?L3BZalFPci9TREdDR1FsVnpTY3RFWXdXM1FkOXo4ZmM4eUdxV0laS0d6cTBu?=
 =?utf-8?B?Z0h5N1VZWlNOSjR1aDJxeEI0VnltT1BKTnh2T0RweW5RQmw2OWI1bGkwSmIx?=
 =?utf-8?B?U0J0NmdNM25kd3h3anpKVndhT0Q0TzJCcUUyZ3VqS2NvSW5DUzVnSFF5dFpU?=
 =?utf-8?B?cUwvNG1WS1BvbWRBQkRyZFBRcTNQeldFR3Y5MGIrMisyTnpJUC9Nc09GUUt2?=
 =?utf-8?B?SjMxakJobm85NXpIR25SUEFQSnBQcXFjMmhkVGRSd3dydS9MVEhNOUVuc2RD?=
 =?utf-8?B?T1FPZ0YzbDZVVTY5NlhRV3U2cWpucWpLekJMWS81TXNiZEtVcCtCVi84MFRH?=
 =?utf-8?B?OWxnby81ODR0enlSbkN6U0liYUdMdUNGNkcxTUloYzlxa2puZ1J0R3U1WGI5?=
 =?utf-8?B?UWJZaDhLQXpidEpydDN1MlFWdjBkWXpReER0cmNmWjk3cEh4KytzOHhmR1dW?=
 =?utf-8?B?eUl6ZVdxaFkxWnVNUVZ1UUplRm9PL20wNGdqOG51QXJDMFNLVXdndURscVYz?=
 =?utf-8?B?ZHllSEZCRkp0UlNpdHM4dEU2aFRnZFViZzBXTTgzYjVBckMvMXhYQXlDWTF5?=
 =?utf-8?B?Si9hMk16bURoMGNDUlBpLzNCRHl6bFpLaHFadW5vclpTTlpNT2NpNGhxYkVv?=
 =?utf-8?B?NlZZVm15WkZCY0hFcXova3BBNTl1ZGJCOVBabmpBT2ZBdm14VThMYk1nR2VL?=
 =?utf-8?B?WnpkUWpKeW1CbjRwUEhyYTRkSURpVnZNanNIZ1A5YTJCTHhpQ0N3ZXYrRm9Z?=
 =?utf-8?B?U1NESjkyZFJEVEd2K3F2NTNWQWFpVkU5eHpWSjB3eE1aUkNXVVlLVmlUNTFV?=
 =?utf-8?B?UnVuL3ZsYXA1aXplZWV6M3FrS1VmZGZ0N01IYUp0VTRVS2NIOEEvRzBXWUZC?=
 =?utf-8?B?NmZ3aldBWHQ3NTBQQ2R6WE1YU1F6VUpja1F6WlBveTdFQTh6bXB6NG9NdDAw?=
 =?utf-8?B?czNRZDJkeldnem1FUHBFRkZ5d2RnN3QwRTdycVlZQlVCTVZZRjlibHFOWXpR?=
 =?utf-8?B?VDFBSTI5MFV4cDkrWm0wMmFRM2NJMHh3bW9sWHkvOUJzUlBmcGw3d0xKZnN5?=
 =?utf-8?B?bTVuVnE3UkZSblJSdloyblZheStqc2NaZDh0SU9Sb0JjblZpZE5qVk5TYXht?=
 =?utf-8?B?dytIL3hnZjV6OUQ1Q1g5cXNaZ2RwRGd5QjAvMGZaalU2ZnN6MGNFQUFpVXJr?=
 =?utf-8?Q?VZcqjsUozg9PVfa4fSK1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR12MB6101.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZENTb2pVY2xlNzRHTlV5WU42dlRONng1c05NM0pXbnBuc3BGeGNsNGVkNGxE?=
 =?utf-8?B?ZjNVUXEyNkNjalBjbGg4a096NU9nVlRUUVV4enNkUTdMYWVFRmRVMmowRmtv?=
 =?utf-8?B?MVp6Rm84NmpzS1RhNEZmZHFWdmRxQjNQSzN5WnNIdGgvN0tnRG5VN2tVSE1U?=
 =?utf-8?B?OHhDOWZHUnM4cDZ4QlZWc0NMTnovWjlkbEtCc0VsY0h5YWpUekVIaFN6a09o?=
 =?utf-8?B?NWUvOVlsQ1lCbVFIL3ZWcUwrWmQ2RHpmaStCMlEvNnVnS2ZRL3VRVHVsd0x4?=
 =?utf-8?B?ejhxclpkVlkyN0wwSmJjOEw0TDZ5NWZ0bXlVVG5SRFR5ZmcyRlVVcWtNUElU?=
 =?utf-8?B?RTZ6RFdYd3p2MUVDUi9zNGlaR014RExvWjNQR0dDUzRWUTZqK2hRYUZaRHRn?=
 =?utf-8?B?SGxReFE4SUVkbzRpVW5LWC9BbWlwUUVEQmwzVGdMNEVzV0d0cGFYZk1YejdC?=
 =?utf-8?B?eVFSWDNoYmtDQ0NYektVK2JFdEJsWkR6OEdUa2dZSEFHYmFqM05oVmZqZzlC?=
 =?utf-8?B?TEZzTVU5QnNSTDNXMUtBT3JHL0ZXcFpXb3FzTmhEejBHSk9Md0poTGhWNjFY?=
 =?utf-8?B?MFdFOEZTYnNQQzNjZVlsbkZ5VVlTVjhLc0lKZU5Xc3JPYStrRVFpUzFVQkZD?=
 =?utf-8?B?VTdZUllxdkZvQ0NpZC9uV3VRS2VIclhLa0ZSL243b0h3a2s5b01xRUFWOEVP?=
 =?utf-8?B?aXFNUW5LdDV1ZU9UdVhBbzlHL2I3RG9lUGJNMFM5VkxHRVF3c1BNVXFnVE44?=
 =?utf-8?B?a1V3K3RpQnBDRkNtUktEYmpnYk1VenYxTDRJRTdvUlEvTXVRNEZZVno0N2Rx?=
 =?utf-8?B?ekJtZkU2c1pTdnBEREVTQ05HcmZhOVhyZmlSS3JRVkhEOU5oUEZ4WXpvcUpG?=
 =?utf-8?B?UWNDRThtczk1YWw1dm1od3JXV2tsN1lIQnlkWDlWa0E5REM4Rm5zMVNNOS9z?=
 =?utf-8?B?ejlqU21wZ0NFV2dlM0pNTjZ3VFY5K1VNK2lOL1JGWXozMXFIQ2NJYnVPcXla?=
 =?utf-8?B?RlJwTWVNdC90TElLaHNERTljOEF5TzcydEFpTUxqd0gzKzl0YmVrS1VUVG9M?=
 =?utf-8?B?N2RtVUFpN0ExeW5qMmhCQmhEeDQ1Wmd2dDA5b09mQk8rUkhiQUFUeExCQ3p5?=
 =?utf-8?B?bDhpdVBubkMvaTBTbkVtNk5BOHBtMXlSc2pqMlhPcGk1NHU3Q3dnZklXSWIz?=
 =?utf-8?B?K3daV0VLMytxN3I4N1M3dE1Yd3NPYThhWWYwWTVzQ09QOG13aVhjekJhUTdX?=
 =?utf-8?B?alJZMG5FdDhlNnRSYzhBdkJNeDdMTU5zSlg2RlZMNGwyTGlDWjZkR0pxT3lQ?=
 =?utf-8?B?d0NGcEhpRSs1TDd6NXpqVWxRNEo3ZlVDWGlDVzMzWk1DUHVWUXoxdSsvRk1x?=
 =?utf-8?B?elArNUh6bTh4UDhCOEtDcXAvYmQ2cUp3L1dqQUw3SGpmOVE0Z3k0UGNEWlI5?=
 =?utf-8?B?cllqaUszQ2ZySGxyODR2d2FNMWh3Q3VFdkRadldOK0hhekdRRE5TUUh0dkI3?=
 =?utf-8?B?RG5BdTVnTk9JREU1aG90M0x1VWl3ZG9LblZwZytHRiszOU9POVpGdmVwTUJD?=
 =?utf-8?B?cEJrYXpGcG1yb0I2b0ovK08zUFBTTStXTTd4dDIyTENKYXB1V29neUZOWVJR?=
 =?utf-8?B?RjNEeDk2TENDa3gzR2psTFZUUis3eldwOGNGNFJ2MUxUVmxGSC9rK1ZtTUkw?=
 =?utf-8?B?TE16amdwMFJQcWVSMENjNFNQNkg1cjEzNm83WjN2eWFpL08yNzRROFA3V3cx?=
 =?utf-8?B?ck9TdVdYNk5xTFYyL1VYaW42dDVSYWFoRkI2TWNjNk55Y3pFbDNGSVlhcVo3?=
 =?utf-8?B?bWlzWVRyUkpYcVRZN1Z4b3pRbkxNaDk5ekgxQ0g4dE9UVnFMdThYb0h1bU5U?=
 =?utf-8?B?K2xPWVdQcTRiVEFMTTVSTGh4bjZ3WDJsdU9WbStmdGFqTk1RU3d1YU52anRH?=
 =?utf-8?B?aUhiM2RzdkJocXJ4cmdvcmZvaWFhN0JhcHk4RmJVaHdPL1F5VDFPSVNQekdi?=
 =?utf-8?B?bExRNE40NWdkSGpuZk02SGxDdG5rZVlHOUJPcTFNMHhRV09ub2ErNmRZeWQ5?=
 =?utf-8?B?S2dSMXRwS0hjQVZqaWZMSzIxRXYrYVR3MXZYVWU3R3VEQ2lmdklMZnhhak81?=
 =?utf-8?Q?79ugpPGgYSi/qoNEur2CMEL+F?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ab10e2ca-45a6-4b9e-2ee3-08dc898ac1bf
X-MS-Exchange-CrossTenant-AuthSource: MN0PR12MB6101.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2024 20:20:23.0221 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PcGTI+3+i/3YmztJg+D3YSexGQKLbusfovW1wzKNqpw4U0+akBJuKNPlCr9eWPqHZFNGMH+2AHTIHr6fFXLLiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9100
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

On 6/10/2024 15:12, Thomas Weißschuh wrote:
> On 2024-06-10 14:58:02+0000, Mario Limonciello wrote:
>> +Kieran
>>
>> On 6/10/2024 14:26, Thomas Weißschuh wrote:
>>> The value of "min_input_signal" returned from ATIF on a Framework AMD 13
>>> is "12". This leads to a fairly bright minimum display backlight.
>>>
>>> Introduce a quirk to override "min_input_signal" to "0" which leads to a
>>> much lower minimum brightness, which is still readable even in daylight.
>>>
>>> Tested on a Framework AMD 13 BIOS 3.05 and Framework AMD 16.
>>>
>>> Link: https://community.frame.work/t/25711/9
>>> Link: https://community.frame.work/t/47036
>>> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
>>> ---
>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c | 35 ++++++++++++++++++++++++++++++++
>>>    1 file changed, 35 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
>>> index 7099ff9cf8c5..b481889f7491 100644
>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_acpi.c
>>> @@ -25,6 +25,7 @@
>>>    #include <linux/pci.h>
>>>    #include <linux/acpi.h>
>>>    #include <linux/backlight.h>
>>> +#include <linux/dmi.h>
>>>    #include <linux/slab.h>
>>>    #include <linux/xarray.h>
>>>    #include <linux/power_supply.h>
>>> @@ -130,6 +131,35 @@ static struct amdgpu_acpi_priv {
>>>    	struct amdgpu_atcs atcs;
>>>    } amdgpu_acpi_priv;
>>> +struct amdgpu_acpi_quirks {
>>> +	bool ignore_min_input_signal;
>>> +};
>>> +
>>> +static const struct dmi_system_id amdgpu_acpi_quirk_table[] = {
>>> +	{
>>> +		/* the Framework Laptop 13 (AMD Ryzen) and 16 (AMD Ryzen) */
>>> +		.matches = {
>>> +			DMI_MATCH(DMI_SYS_VENDOR, "Framework"),
>>> +			DMI_MATCH(DMI_PRODUCT_NAME, "AMD Ryzen"),
>>> +			DMI_MATCH(DMI_PRODUCT_FAMILY, "Laptop"),
>>> +		},
>>
>> Two problems I see:
>>
>> 1) This really "should" be fixed in the BIOS. I added Kieran to the thread
>> for comments if that's viable.
> 
> Agreed!
> 
>> 2) IMO this is going to match too liberally across all potential Framework
>> models.  If they introduce a refreshed motherboard for either product then
>> the quirk would apply to both products when we don't know that such a
>> deficiency would exist.
> 
> Also agreed.
> In addition to be really specific this should also match by display type
> (via EDID?).
> 
> So far this was only tested with the matte panel.
> (I forgot to mention that, sorry)

Yeah; I would expect this also matters for the new high res panel that 
they announced whether this value can work.

> 
>> You can reference drivers/platform/x86/amd/pmc/pmc-quirks.c for what we used
>> for a quirk that was matching against a single product and single BIOS.
> 
> Will do for the next revision, but let's gather some feedback first.

👍

> 
>> But FWIW if that issue isn't fixed in the next BIOS I think we'll end up
>> needing to tear out the BIOS string match and match just the platform.
> 
> I'm wondering what the longterm strategy will have to be.
> Given that there are different kinds of displays, and new ones will be
> released, each new display type will require an update to the firmware.
> 
> When there are no firmware updates for a device anymore, but new,
> compatible displays are released, then the kernel will need the quirks
> again.

Yeah I think all this points to the 'best' home for this is BIOS.

Framework can test whether the 0 value works on all the displays they 
want to support and look for negative impacts for all OSes they support.

> 
>>> +		.driver_data = &(struct amdgpu_acpi_quirks) {
>>> +			.ignore_min_input_signal = true,
>>> +		},
>>> +	},
>>> +	{}
>>> +};
>>> +
>>> +static const struct amdgpu_acpi_quirks *amdgpu_acpi_get_quirks(void)
>>> +{
>>> +	const struct dmi_system_id *dmi_id;
>>> +
>>> +	dmi_id = dmi_first_match(amdgpu_acpi_quirk_table);
>>> +	if (!dmi_id)
>>> +		return NULL;
>>> +	return dmi_id->driver_data;
>>> +}
>>> +
>>>    /* Call the ATIF method
>>>     */
>>>    /**
>>> @@ -1388,6 +1418,7 @@ bool amdgpu_acpi_should_gpu_reset(struct amdgpu_device *adev)
>>>     */
>>>    void amdgpu_acpi_detect(void)
>>>    {
>>> +	const struct amdgpu_acpi_quirks *quirks = amdgpu_acpi_get_quirks();
>>>    	struct amdgpu_atif *atif = &amdgpu_acpi_priv.atif;
>>>    	struct amdgpu_atcs *atcs = &amdgpu_acpi_priv.atcs;
>>>    	struct pci_dev *pdev = NULL;
>>> @@ -1429,6 +1460,10 @@ void amdgpu_acpi_detect(void)
>>>    					ret);
>>>    			atif->backlight_caps.caps_valid = false;
>>>    		}
>>> +		if (quirks && quirks->ignore_min_input_signal) {
>>> +			DRM_INFO("amdgpu_acpi quirk: min_input_signal=0\n");
>>> +			atif->backlight_caps.min_input_signal = 0;
>>> +		}
>>>    	} else {
>>>    		atif->backlight_caps.caps_valid = false;
>>>    	}
>>>
>>> ---
>>> base-commit: 83a7eefedc9b56fe7bfeff13b6c7356688ffa670
>>> change-id: 20240610-amdgpu-min-backlight-quirk-8402fd8e736a
>>>
>>> Best regards,
>>

