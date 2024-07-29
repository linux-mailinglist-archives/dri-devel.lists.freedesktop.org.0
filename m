Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E172E93FD27
	for <lists+dri-devel@lfdr.de>; Mon, 29 Jul 2024 20:12:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D28610E456;
	Mon, 29 Jul 2024 18:12:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="nooh6ege";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2065.outbound.protection.outlook.com [40.107.236.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1D2A10E445;
 Mon, 29 Jul 2024 18:12:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SvhkwaGn0hFkTuUlxUJCKHskM/5bgV7YilRZmzSmrSmijTOcnQ2q+5cCNwdc1a3QfFpUHJtqLLwVGLdhE2XmfWUtPLitDycYlYk9IzfaUSxBT+0QTgvDQURJsKGSILIxujhiZ0hAysCtfKxmdE3vsamXjnRtqnElX2pMNs0lKRqGMolyyI+6QRBJk/wS51CaZmo0pv16smmwNHmpCh2j9P18cpRcUA0wH2byk+Vj5oEMcBAItwWuqr3CC4uq3uAe7hL7dJv04JfioOzE8inMatSPN0TXJPG2rDIomt4BbXE8pqCU8JEDs/Bq5aUxQCukhoZSI+rtX0QsE9Wcy67nSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SraV6Y3epCgdc02KsjO9zz2WNXy2XgweMb2G5QcUBbA=;
 b=yjgieEUcyTNvDKf0dZZ7mzpYGNVdMTRamYLOIdezReDixjkc0VGvTkHlhexprRChiWBmsmIszBCA1nafiuvXhyqjEs517dUe+mK1u3MloegfTLq1ijdxI73cFJnZW8R27E2bo2P1DPfVLDqWSeI9ahku4kxQDSiZWDfhE/EA+20hlonpzmZVV3G5cbSskoDgorBhYwNPP8Fiw3iuVP2rUdVQk1A6LRI/yCvPjwUuAVbV30zPcCp/f0Ya1caaYsaRSAGQL6RvKOLgf7AqMHR++TFnb2nJ8pfplCYervmyBHU+EAxf/rRJggdAkrCsyAEdBDK/xeQOmeNiNwe7qW0ucA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SraV6Y3epCgdc02KsjO9zz2WNXy2XgweMb2G5QcUBbA=;
 b=nooh6egexj6aneOOFqjv/9KRst8qWU3mTiDMrfuxi5HOHcSKhvOn1xsGiZC/y+oPdlk2R73q0Rkoj29HvzLkJEO8Ta1zFyYzBOK50ZU/Dy+uqVRMIOwVhQ5vPtcRyxmqpXVpqeDXZy62v39KHc4OyHa0Bt1xwSJVdmQokJ7+5Jw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by BY1PR12MB8446.namprd12.prod.outlook.com (2603:10b6:a03:52d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28; Mon, 29 Jul
 2024 18:12:07 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.7807.026; Mon, 29 Jul 2024
 18:12:07 +0000
Message-ID: <cb85a5c1-526b-4024-8e8f-23c2fe0d8381@amd.com>
Date: Mon, 29 Jul 2024 20:12:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/radeon/evergreen_cs: fix int overflow errors in cs
 track offsets
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
To: Nikita Zhandarovich <n.zhandarovich@fintech.ru>,
 Alex Deucher <alexdeucher@gmail.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, Xinhui Pan
 <Xinhui.Pan@amd.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jerome Glisse <jglisse@redhat.com>,
 Dave Airlie <airlied@redhat.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 lvc-project@linuxtesting.org, stable@vger.kernel.org
References: <20240725180950.15820-1-n.zhandarovich@fintech.ru>
 <e5199bf0-0861-4b79-8f32-d14a784b116f@amd.com>
 <CADnq5_PuzU12x=M09HaGkG7Yqg8Lk1M1nWDAut7iP09TT33D6g@mail.gmail.com>
 <fb530f45-df88-402a-9dc0-99298b88754c@amd.com>
 <e497f5cb-a3cb-477b-8947-f96276e401b7@fintech.ru>
 <1914cfcb-9700-4274-8120-9746e241cb54@amd.com>
Content-Language: en-US
In-Reply-To: <1914cfcb-9700-4274-8120-9746e241cb54@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0276.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e6::6) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|BY1PR12MB8446:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d44fc42-8b46-4773-eb4f-08dcaff9f4e5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WVdyaWNQVks2cWt6ZlpUeHAxNEw2SndXTVBISmhwdTRBMWF1SDN3eXdFeWZh?=
 =?utf-8?B?c0dpSURsalFTamxBMUJET3RvMi9hSlkzSzdoVDZyWlVlOFIvMGR0a0MyRVk3?=
 =?utf-8?B?SUhFZ0M1emZ5dlNrb09MTzBjR1FiR0RaMHRCOXNtZ3NiZ013MVhROGZ1d1Vt?=
 =?utf-8?B?Q0E1N21vWjVOelNXMURqcFh4eDMreWl4SVFFTFlmVEZBc0hQWSttTXNHbHdL?=
 =?utf-8?B?dWY4b3BzekEvN05WYUp6ZjJDM2IwSWExQi9lU051Y2I0SmNYcUVRem9hZStV?=
 =?utf-8?B?WUdyK21DNDRPT1NHbHFobkNtcFJVYTFva0NHbGRHemV1MDRrZVdCekRZcFBP?=
 =?utf-8?B?aDBYVFI1ZEhNNmtyMzhyVThNR2xPMDhjNUJBRUg4RXZJcnBENFZZdzdJSVEx?=
 =?utf-8?B?MWRBUS9ZMEpramFBbk85dThMMG11cUh5Sm1nWXNxSDlLRXh6R3NKUGFMa3Vy?=
 =?utf-8?B?MlJlcVgrZVB1bXdGTGlLVTNYU0ZnQ3JtSWVHaDg3ZGZCTlBMSUVEbThsV3ho?=
 =?utf-8?B?enVLdzM2bnNOMUYyZWlhcThNOXpFTSt2ZVh5a2g3SkZZclB6bGNBRThaZSt5?=
 =?utf-8?B?UjNaNWF4bG5ZOURkeE9vbHhzSmhUOWZ6RHFOdERoVnpqUFo4Vm5BWlpiMktT?=
 =?utf-8?B?NzZOQTA5ZnpjOHEvUUFaQThpdjdQbC9ETlc4Y0F6L3N2NHgwNE12S29yek5N?=
 =?utf-8?B?QUI0SzZYVHdrYXR4MUxpRVV4NVFhMTJhQ3hKQW9QN0NRK2NtaGJOYTVjRmE3?=
 =?utf-8?B?SW1rdlhybGRzOFgrUjBVSDgxemxkYkI2T3Z4N2h3SEtoaWhnQ0FueFZoMEtT?=
 =?utf-8?B?UndpUS93aEpNSWphMHN4dkpUamJTYk1hT1BpVktYMmI3WHlxRUVuTGRoY3Vp?=
 =?utf-8?B?dEk2NktIcW5nMnJVTmJmRlRhOUlmWDdIOWh3VUtRN3RMSTVpd0Uzb1ZZVmI0?=
 =?utf-8?B?dWNwZldkRHVvNXEraXkwb3pCOE5XZUs0TlhXbUE0YXZMR1VUWjlFaGFSWkZi?=
 =?utf-8?B?eitnVktiTDlSQnJiQ3ljaVkrR2R6U2FabmRUVXVCNXRrTHpVV0NLM2Nvb21n?=
 =?utf-8?B?QlVCV1F6c0huTExGeVhublRTN1pWVFhMWmF1LzZGdUR1SDdGaDZ2cnlERVg1?=
 =?utf-8?B?Ym9UektxNmp3d3RHWjFEK2EzeTB1U3A3WklJSUZndDRrd0Y0aTZvckNzRkNn?=
 =?utf-8?B?RjlQdjc0U01nOE1pSFNQVE5tbDZ1aGZRaEVEdVMxNlpqV2N0VHlHZzJycm5F?=
 =?utf-8?B?Y0ZZUDlVbUovd3A2L24zTWVLcTdScjFFVEI2aFNjVkFBUldsR2lETDJQekg0?=
 =?utf-8?B?aEcvZlFpWFhLUDQ0YU8yZk5DK0Q3Q1JoeituWFdxRVdKK0lyRCtkNi9RS0Vi?=
 =?utf-8?B?SmhLREhCeDZ1dlpmSCtKbGprekZlbk9TdTcvRjlSM3hBbXZvQkVsRkhpc0Jt?=
 =?utf-8?B?RWduUHkyU3Nrb28rOEg1TklRMEgxditKdlF0NFJGSFhyZGZDeXJJQ3BnQStm?=
 =?utf-8?B?YXU5aXI4RUJ2VkZETHlBYmtXbWFLMEhrUGl5MzVSZUMxcTRaRkE3em1VNHhy?=
 =?utf-8?B?YXJvZ1I0bHlGVzBHRXpnMG1GMVpSbWhPalJCVkZHMFN3UmpYS0NxODFnWmtO?=
 =?utf-8?B?T1F3Rm1HdC9CQ1VNcWc2T0M4ajhiNC9Yd2VRQS92THNMa1oxUGpCdEc1ZnZQ?=
 =?utf-8?B?bFZQUkVJaVdaYXBQWUNYcTRFeEZqUXNuR0ZReDlYcitVMnFlQm5tNnhzOThw?=
 =?utf-8?B?UjRybTdvekwvWkdvQWlTR256VVBUTVJKM3FjY2FmUXhqUTVsUGlnMkNJWUFY?=
 =?utf-8?B?WkljbDFyVUhBTWs1YVcvQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L24zUjU3RENoRXg0OVEzb0dUV3ZMOTd6bnIzRllzTHVFV3JCOUdMaTEwZk5C?=
 =?utf-8?B?blFEcmdNdGYxcWJIT3dVYk9ja01sNC9NTFFYb0krZHFhTDg5WkFkU1Vnc2lm?=
 =?utf-8?B?SzJOd2Zod2VacmVwUjZraTEyNTBWeG0wUVViT1ZzTGFCcGdURkdUUWZPWExK?=
 =?utf-8?B?cXczaGUwajJxcDhFQVBDWnoyZ0duUk0yZ1FQdGtGQ21OWjduZkRHbEtKL1ZK?=
 =?utf-8?B?c0xrNjFtYjN4dldzNFc4REFTT1A3OFhBOURYZnJQYjNyT2l2TS9xQ0h4TTEw?=
 =?utf-8?B?dUpneXRCZjZYYjF4d3gyKytNakhFR1BrSmRDb2JXYnRPT0lnRm90eGlWL3pn?=
 =?utf-8?B?WCtkb21KSFhFanpGWC9XZTh3ZW1KWkVndEptOTJEc0lDbGtQNTVsQm10QWYy?=
 =?utf-8?B?ZThlNk82VXUzT1JEb2VtblN6L0plS1B1YTJBWkJHRjNFdXZmam1HRi9DSyt1?=
 =?utf-8?B?aUpJaDJaN2RncCtIa0UwSGlWMG14ZWw1QW9wV2hDU3RJaHdWb1lYd2tSVG41?=
 =?utf-8?B?TGtSY3RUSHoySUZIMC9yQTgxOXlxQXhjMXU0SUd0SkYzakQ3NU9SVlhqbzA2?=
 =?utf-8?B?SldIUGYzSW91WGx3elBqenVEQ3ZsT0JMWFQ2ejBRaVg4U0M4cUkwbTVEbmxZ?=
 =?utf-8?B?ak43dUFHaUwxbHQ0cVZFVDlxT0Y3czBBTDloOGtmUXpad1EwMGt5bTBocndw?=
 =?utf-8?B?SktDN3FvZHJQVFZEUnJ4T2RTR2xtQWF5eDB6aFFYZTdqek1GUG9OZHdENFZ1?=
 =?utf-8?B?WVY4aThjVTBWZGo3TmVPYlFTOEpmbEdyckFYbzA0VHBzc1VzOXdVM3ZhRC95?=
 =?utf-8?B?MlFNM1o0cU9aREdkeFg2UWN2YytRMHgzUDlFRlNaL1NJVXdYeVByTmNqL3hG?=
 =?utf-8?B?OFRIVlJFV2FDUjBYcWR0bno0YkRFTnhNdFJrMEpGZ0FtMUpLSWNPem5IdVVS?=
 =?utf-8?B?TjZUN1J3N3dGMVJaZ0dnbHlkeDZ5WXpGcHZkM0tBWGxlVHNZV2FqcVRudjZp?=
 =?utf-8?B?eEJuYmhsUlhQeEZ5eGtYUHpkNWU1bldWTE5iRnBBYVJXdWxWelFWQlRFN3JH?=
 =?utf-8?B?YzNIZ2sydHZKU2hMOXdEeklJWTNqM1RVU3JPYVBIYmZaVkVBNHljT2s5aThY?=
 =?utf-8?B?V2hKWU5WUUZ1Z1ZkYWNzdHJKaHNrTE1LcUsyVkV5RGM0N2taMUNub3drVUMw?=
 =?utf-8?B?bThVeGVTNmJHclZhdThrSTZhSjRwWTBsMGJENW1rMWlTdUhrVnEreVVYZDgr?=
 =?utf-8?B?bHB5akNFbGdvM1VUTHdjTmx4N0tadGlXQXZGT2dnUGpPYjBQT0djcnMvTzRF?=
 =?utf-8?B?ejdlZ28wemhmVkRZWDI0SkFSRS9Bci9aZVlMRDZqSWNoMVhLTFBKaFVVY3cw?=
 =?utf-8?B?Y011WUNFRTZIb1B0bzFPNFhtT3Z2UXdCZXJQZTlvSHErc2lrWkRZa0xoMnVN?=
 =?utf-8?B?UFhlaG9yMnVqT3NZbHpoM2huVGdGNFpqK2FRNDIzTVJGTDlWOENKa1pGTXNZ?=
 =?utf-8?B?T0t6QUNMbTBzSlo0Smhhc0p0MllMdnFNRE9ac0dSVEFYcnFHcW13V1lBWHVx?=
 =?utf-8?B?WTBNNWFZWWVkNzRyRmc2STRFMjY1MWVmWkhONGY5VUo1bjJzRmlHWUU0Yytw?=
 =?utf-8?B?cDNDcDAxYzBWUjM2b0xZNms2NXBwdDZGd2dvWFpyNC9VZHI0cTFycTFrQkxh?=
 =?utf-8?B?QVcvRHU2TENLTU9OZGJJbUZDKzNvaTM4elk4TmFWMmFQQnh4UTFxay92bGcy?=
 =?utf-8?B?cUlOTnlCTzJ3SWR0WUxqZFVTeGpvbDVISEIwNnJ3VWlZTitycEk0Lzgzamo4?=
 =?utf-8?B?dFdwaHRyZlZrNUFld1JFNXZERnZuWmRmQTMrc3Q3bTJOaUpXbzZZTlhWWHEv?=
 =?utf-8?B?bzZ6UTZyWXU0a2Y1MUdpeEpheEhXeXZtR1NCTzVaTTBXdlBhRVkyTW0wM3lO?=
 =?utf-8?B?NHpJTnVMbUZBT3BQM3FOa1U0MmhBZTRxS0ZDWi9JeDc2QSt5YzhCQkJYSlNw?=
 =?utf-8?B?a1ZxTzNiV0QycmtiSlAyRXJ2N0hMVEUzZS94YURoOWRRanBrUFV4SHFiRGpZ?=
 =?utf-8?B?QkpMeGYyQTlsNHlrbit4VkRUSEl2Q0F0UjNnc2Zkd1UxUy96aTR6aFB1WW9L?=
 =?utf-8?Q?8y3td8VzpQlc5VAzVLxqlO6YN?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d44fc42-8b46-4773-eb4f-08dcaff9f4e5
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2024 18:12:07.1369 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Fxjd0Rkz0HKuk4A8JhUxi6fU/vOe4JYCpyue6/mgY14x2cT5Mog3dlqYmfntsFwW
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR12MB8446
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

Am 29.07.24 um 20:04 schrieb Christian König:
> Am 29.07.24 um 19:26 schrieb Nikita Zhandarovich:
>> Hi,
>>
>> On 7/29/24 02:23, Christian König wrote:
>>> Am 26.07.24 um 14:52 schrieb Alex Deucher:
>>>> On Fri, Jul 26, 2024 at 3:05 AM Christian König
>>>> <christian.koenig@amd.com> wrote:
>>>>> Am 25.07.24 um 20:09 schrieb Nikita Zhandarovich:
>>>>>> Several cs track offsets (such as 'track->db_s_read_offset')
>>>>>> either are initialized with or plainly take big enough values that,
>>>>>> once shifted 8 bits left, may be hit with integer overflow if the
>>>>>> resulting values end up going over u32 limit.
>>>>>>
>>>>>> Some debug prints take this into account (see according 
>>>>>> dev_warn() in
>>>>>> evergreen_cs_track_validate_stencil()), even if the actual
>>>>>> calculated value assigned to local 'offset' variable is missing
>>>>>> similar proper expansion.
>>>>>>
>>>>>> Mitigate the problem by casting the type of right operands to the
>>>>>> wider type of corresponding left ones in all such cases.
>>>>>>
>>>>>> Found by Linux Verification Center (linuxtesting.org) with static
>>>>>> analysis tool SVACE.
>>>>>>
>>>>>> Fixes: 285484e2d55e ("drm/radeon: add support for evergreen/ni
>>>>>> tiling informations v11")
>>>>>> Cc: stable@vger.kernel.org
>>>>> Well first of all the long cast doesn't makes the value 64bit, it
>>>>> depends on the architecture.
>>>>>
>>>>> Then IIRC the underlying hw can only handle a 32bit address space so
>>>>> having the offset as long is incorrect to begin with.
>>>> Evergreen chips support a 36 bit internal address space and NI and
>>>> newer support a 40 bit one, so this is applicable.
>>> In that case I strongly suggest that we replace the unsigned long with
>>> u64 or otherwise we get different behavior on 32 and 64bit machines.
>>>
>>> Regards,
>>> Christian.
>>>
>> To be clear, I'll prepare v2 patch that changes 'offset' to u64 as well
>> as the cast of 'track->db_z_read_offset' (and the likes) to u64 too.
>>
>> On the other note, should I also include casting to wider type of the
>> expression surf.layer_size * mslice (example down below) in
>> evergreen_cs_track_validate_cb() and other similar functions? I can't
>> properly gauge if the result will definitively fit into u32, maybe it
>> makes sense to expand it as well?
>
> The integer overflows caused by shifts are irrelevant and doesn't need 
> any fixing in the first place.

Wait a second.

Thinking more about it the integer overflows are actually necessary 
because that is exactly what happens in the hardware as well.

If you don't overflow those shifts you actually create a security 
problem because the HW the might access at a different offset then you 
calculated here.

We need to use something like a mask or use lower_32_bits() here.

Regards,
Christian.

>
> The point is rather that we need to avoid multiplication overflows and 
> the security problems which come with those.
>
>>
>> 441         }
>> 442
>> 443         offset += surf.layer_size * mslice;
>
> In other words that here needs to be validated correctly.
>
> Regards,
> Christian.
>
>> 444         if (offset > radeon_bo_size(track->cb_color_bo[id])) {
>> 445                 /* old ddx are broken they allocate bo with w*h*bpp
>>
>> Regards,
>> Nikita
>>>> Alex
>>>>
>>>>> And finally that is absolutely not material for stable.
>>>>>
>>>>> Regards,
>>>>> Christian.
>>>>>
>>>>>> Signed-off-by: Nikita Zhandarovich <n.zhandarovich@fintech.ru>
>>>>>> ---
>>>>>> P.S. While I am not certain that track->cb_color_bo_offset[id]
>>>>>> actually ends up taking values high enough to cause an overflow,
>>>>>> nonetheless I thought it prudent to cast it to ulong as well.
>>>>>>
>>>>>>     drivers/gpu/drm/radeon/evergreen_cs.c | 18 +++++++++---------
>>>>>>     1 file changed, 9 insertions(+), 9 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/radeon/evergreen_cs.c
>>>>>> b/drivers/gpu/drm/radeon/evergreen_cs.c
>>>>>> index 1fe6e0d883c7..d734d221e2da 100644
>>>>>> --- a/drivers/gpu/drm/radeon/evergreen_cs.c
>>>>>> +++ b/drivers/gpu/drm/radeon/evergreen_cs.c
>>>>>> @@ -433,7 +433,7 @@ static int evergreen_cs_track_validate_cb(struct
>>>>>> radeon_cs_parser *p, unsigned i
>>>>>>                 return r;
>>>>>>         }
>>>>>>
>>>>>> -     offset = track->cb_color_bo_offset[id] << 8;
>>>>>> +     offset = (unsigned long)track->cb_color_bo_offset[id] << 8;
>>>>>>         if (offset & (surf.base_align - 1)) {
>>>>>>                 dev_warn(p->dev, "%s:%d cb[%d] bo base %ld not
>>>>>> aligned with %ld\n",
>>>>>>                          __func__, __LINE__, id, offset,
>>>>>> surf.base_align);
>>>>>> @@ -455,7 +455,7 @@ static int evergreen_cs_track_validate_cb(struct
>>>>>> radeon_cs_parser *p, unsigned i
>>>>>>                                 min = surf.nby - 8;
>>>>>>                         }
>>>>>>                         bsize = 
>>>>>> radeon_bo_size(track->cb_color_bo[id]);
>>>>>> -                     tmp = track->cb_color_bo_offset[id] << 8;
>>>>>> +                     tmp = (unsigned
>>>>>> long)track->cb_color_bo_offset[id] << 8;
>>>>>>                         for (nby = surf.nby; nby > min; nby--) {
>>>>>>                                 size = nby * surf.nbx * surf.bpe *
>>>>>> surf.nsamples;
>>>>>>                                 if ((tmp + size * mslice) <= 
>>>>>> bsize) {
>>>>>> @@ -476,10 +476,10 @@ static int
>>>>>> evergreen_cs_track_validate_cb(struct radeon_cs_parser *p, 
>>>>>> unsigned i
>>>>>>                         }
>>>>>>                 }
>>>>>>                 dev_warn(p->dev, "%s:%d cb[%d] bo too small (layer
>>>>>> size %d, "
>>>>>> -                      "offset %d, max layer %d, bo size %ld, slice
>>>>>> %d)\n",
>>>>>> +                      "offset %ld, max layer %d, bo size %ld, slice
>>>>>> %d)\n",
>>>>>>                          __func__, __LINE__, id, surf.layer_size,
>>>>>> -                     track->cb_color_bo_offset[id] << 8, mslice,
>>>>>> - radeon_bo_size(track->cb_color_bo[id]), slice);
>>>>>> +                     (unsigned long)track->cb_color_bo_offset[id]
>>>>>> << 8,
>>>>>> +                     mslice,
>>>>>> radeon_bo_size(track->cb_color_bo[id]), slice);
>>>>>>                 dev_warn(p->dev, "%s:%d problematic surf: (%d %d) 
>>>>>> (%d
>>>>>> %d %d %d %d %d %d)\n",
>>>>>>                          __func__, __LINE__, surf.nbx, surf.nby,
>>>>>>                         surf.mode, surf.bpe, surf.nsamples,
>>>>>> @@ -608,7 +608,7 @@ static int
>>>>>> evergreen_cs_track_validate_stencil(struct radeon_cs_parser *p)
>>>>>>                 return r;
>>>>>>         }
>>>>>>
>>>>>> -     offset = track->db_s_read_offset << 8;
>>>>>> +     offset = (unsigned long)track->db_s_read_offset << 8;
>>>>>>         if (offset & (surf.base_align - 1)) {
>>>>>>                 dev_warn(p->dev, "%s:%d stencil read bo base %ld not
>>>>>> aligned with %ld\n",
>>>>>>                          __func__, __LINE__, offset, 
>>>>>> surf.base_align);
>>>>>> @@ -627,7 +627,7 @@ static int
>>>>>> evergreen_cs_track_validate_stencil(struct radeon_cs_parser *p)
>>>>>>                 return -EINVAL;
>>>>>>         }
>>>>>>
>>>>>> -     offset = track->db_s_write_offset << 8;
>>>>>> +     offset = (unsigned long)track->db_s_write_offset << 8;
>>>>>>         if (offset & (surf.base_align - 1)) {
>>>>>>                 dev_warn(p->dev, "%s:%d stencil write bo base %ld 
>>>>>> not
>>>>>> aligned with %ld\n",
>>>>>>                          __func__, __LINE__, offset, 
>>>>>> surf.base_align);
>>>>>> @@ -706,7 +706,7 @@ static int
>>>>>> evergreen_cs_track_validate_depth(struct radeon_cs_parser *p)
>>>>>>                 return r;
>>>>>>         }
>>>>>>
>>>>>> -     offset = track->db_z_read_offset << 8;
>>>>>> +     offset = (unsigned long)track->db_z_read_offset << 8;
>>>>>>         if (offset & (surf.base_align - 1)) {
>>>>>>                 dev_warn(p->dev, "%s:%d stencil read bo base %ld not
>>>>>> aligned with %ld\n",
>>>>>>                          __func__, __LINE__, offset, 
>>>>>> surf.base_align);
>>>>>> @@ -722,7 +722,7 @@ static int
>>>>>> evergreen_cs_track_validate_depth(struct radeon_cs_parser *p)
>>>>>>                 return -EINVAL;
>>>>>>         }
>>>>>>
>>>>>> -     offset = track->db_z_write_offset << 8;
>>>>>> +     offset = (unsigned long)track->db_z_write_offset << 8;
>>>>>>         if (offset & (surf.base_align - 1)) {
>>>>>>                 dev_warn(p->dev, "%s:%d stencil write bo base %ld 
>>>>>> not
>>>>>> aligned with %ld\n",
>>>>>>                          __func__, __LINE__, offset, 
>>>>>> surf.base_align);
>

