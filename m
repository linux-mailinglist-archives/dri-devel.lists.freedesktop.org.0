Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 895E5A07C58
	for <lists+dri-devel@lfdr.de>; Thu,  9 Jan 2025 16:47:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EB2D10EE77;
	Thu,  9 Jan 2025 15:47:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="0hROKexh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2060f.outbound.protection.outlook.com
 [IPv6:2a01:111:f403:2417::60f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5230F10EE77
 for <dri-devel@lists.freedesktop.org>; Thu,  9 Jan 2025 15:47:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AiErukit9vJ0H9/JPKflFdY/x+9URw6sN0b0o5rmgBqzP5p9mn7sPqQMf24EvK0iZwqWRVguuLPgRIBTFY5bH8hyhsY5oQ+2/NNAp5AY4Jv7h7sOS4LeOPkGVlK0Bn5GQuZQlz6rd0WGM+imOtSvpj31WTE+XouYO3LH2K0JVuFnBkCvWSq+gbLQ8eQoxgMxx7hKV65oDv2uz2zwVzspxm0p2UUtRWxt9hKccHlgS/cXoeO2KQbY9auh45FHdCWFMqQqOwlKzYLzwcqY9GDUBLAQ6oWoj7Br18I98bSxu8t4Bq+ElvDAenVY98jTH4nEXLavRUjhn3A0yCEp/KqViA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lZdd+suEdVbEBuKjr516MYcBcyXO7VkBGq67YDxy06E=;
 b=EEaY2Jx4Qhv2P5d3coiamUaLy+a1VIsjWEBs56y9LIh9LWqNNde+Q8hp6tEcoaVgeiHhQU/z2+2zC9CCcP3YtJSATSt19k4ppmiF3wfguDpktDbvbg+0oWfWPwUA01HxKymH25eVxZiT6GyroDCr7fBdetF7xPWHdq40PB8ARFPmkkMcMAhX0XQV3oUT4Qz3CzMEM7qn6xU0cK7ers//MqO5JkU5Fi2x5jK/fSGw0Kvg9cf3LJ294DAREOLKOoqU/gB1KmolaLv6iIAehy002ZCmHiYayzE/c7Kait8GXcGq/lMBb4a/MiGuSUlfxmzkluaO4VjSx4F33bPi+f8+fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=lZdd+suEdVbEBuKjr516MYcBcyXO7VkBGq67YDxy06E=;
 b=0hROKexhldzv4wZ6wxYXxUU3cJEHWgfeLW58r4zhTuC7+GULsW/L7Gap8ZB4EefkLCpIVMJZrCT90OldPiznJsfW30tNPxZxYF/5eQsymddktDzrer3yDYk7G3Vw2xAGdH4uaVDX8SWaDslbubh6R052Mp1wHlY2aJdnzGQNsg0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by DM4PR12MB6205.namprd12.prod.outlook.com (2603:10b6:8:a8::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Thu, 9 Jan
 2025 15:47:41 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8335.010; Thu, 9 Jan 2025
 15:47:40 +0000
Message-ID: <315ad397-cc08-4a1e-a2ad-108aeb1464d5@amd.com>
Date: Thu, 9 Jan 2025 16:47:35 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] dma-fence: Add a single fence fast path for fence
 merging
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Friedrich Vock <friedrich.vock@gmx.de>
References: <20241115102153.1980-1-tursulin@igalia.com>
 <20241115102153.1980-4-tursulin@igalia.com>
 <39453319-a786-42d2-b670-40073a008b21@igalia.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <39453319-a786-42d2-b670-40073a008b21@igalia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0266.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e8::14) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|DM4PR12MB6205:EE_
X-MS-Office365-Filtering-Correlation-Id: 77a8e41d-ea17-4be0-7d20-08dd30c4f2c9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bWJRRmZROUdiK1FSOVhkOHY2MnpReDV5R0RZVzdjeEtUd05zVG0rODU0eWs5?=
 =?utf-8?B?dGJyN0FlM2tyR2ZjaUhGZ3VYWGFSM2pPeDJJTmk1Vm1nTmFPRFk2Q2xGMlNB?=
 =?utf-8?B?WDFLNENrcUY1T1JQTW9aaTh5MEZGNy9CNzFiYjdkbmd1cTlEUjFSUWpEZ01I?=
 =?utf-8?B?ajZrSkZQNkVleEpna1dLUTdLbFpGWGdsQXptUFB0Slg0WnpZSFQvK0ZubDI5?=
 =?utf-8?B?cXBjWHdYNExsazcyNVNqWlZWemxhb2oxZDJ6aVE5WGtVc0tSd3hxOTRBbDFq?=
 =?utf-8?B?VU5Ga1Jkc2xXQk5MZDZYZGkxVTdmZGlaaDNaYURGS2F5WFlQd0Qzckw0a2Zz?=
 =?utf-8?B?Y29abzJ3TzBiS3c5V2hZKytUNnVidDlYZVMrcnY5U3NLOXhWdDBjeWZ0TGV2?=
 =?utf-8?B?ZStkTVVoRzV4cklqdUI4Sk1MVjZMK3dFWFV3YlRsdHlSbUxEaTdSTnZScXRi?=
 =?utf-8?B?bkFhOGxpWnFkTnhGZE1sd3VUY2ZPVzQzQk1SNWFQeEFjSVRsUkd3MUZXY3F1?=
 =?utf-8?B?bEVyeGFZVUROYXE2ZjZJWnpUbDJjVXBEeFVOMGdtWTZBOFA0VkM0K01XN29O?=
 =?utf-8?B?NE9XYjk0Z2FVUmdKWkFsOTZPVjd5V24xRUZYRHR5OE5jdTFvQWk1MzY5cjkv?=
 =?utf-8?B?QUVDa3lkVkhrSFQxeHo1Y3ZtS1BSS3JScTByU3h0NDBQMmo5ampaaHk4SVJs?=
 =?utf-8?B?UTc4bDlXZllxeWJvVGJEYmp5R2V3Q05ONmRDL1Y2ZWFaMUJmRWZ0T0tnNnhI?=
 =?utf-8?B?WjJtZHRkNVUwTTl4WnFDYVp6TTNhRlhUdU55MmdOK0NpTW1WRlA4N2dqd3hm?=
 =?utf-8?B?SHpjd0tuTlhBZFdXdzBZZDRVZSs5Sm5OTTBoQkNDOU9QTWhOMW1JS2EyZE00?=
 =?utf-8?B?QSt1eXc3SHc4cDc0bnlOcG5QeHp3UHZHTmU3VnY0UG9mMFJEVkhvK2Y2ZDBC?=
 =?utf-8?B?dW5ELzRGWVpFTVpsNFh2MEpMT3laTEp4UGk5NEZjWHlVS0dtQWtOWG5Qczdt?=
 =?utf-8?B?LzF0cUk3M29KOHFOZjhvUWhLSGUzMEQyaSsyVS95ZzRxTVNxaFM2clNyT3VS?=
 =?utf-8?B?V3pSOExscEdkeVZ3dldWbTJiUkNJck52NjVPc2dxaU9CSHNGQzRuQWtwZzlw?=
 =?utf-8?B?UE9XQllwdlhtdWlTZFB0dmNoZ3lYdUo2RDd2T0JCQWJIaUpKbVNLQmtZSk9j?=
 =?utf-8?B?N3pacWVTc0NQdnluUGw2OW9SODRrVExxVE5UdmE5aDRiZ2p1VFJJMk5vU1pC?=
 =?utf-8?B?QThXSDlRdHBhRmZ5M1RjYjg0UENLTFhVdk4xdmZMYkNIeXpiV2JxcGpNOWFl?=
 =?utf-8?B?TjFDejFseitweHRMdE9XelZIUWpEYWg4OXU2eElVcWIrSlF1NjJZU3ZDOFUy?=
 =?utf-8?B?SW5BbEVwbGhRd3h5akVVaGxENEUzbU5sWlFZNHpMVUJkdHd2NStiUHpRdEVy?=
 =?utf-8?B?ekErWWlzTWROeVpWcis0TGFKQ05ZQ21TalN2bW1xR2twN0JVbEZZK2pVOXgw?=
 =?utf-8?B?bzlUMkJkWURWNUJaaDEyUk15R2tJbDRWZ08rVTdQNWp1TlV2enE2WWlQaE9Y?=
 =?utf-8?B?dkphWXVGdHRFS1hzQ3Q4TFp3S0FURDlILzFndjVOdlFzaENndlZOZ1VMdVdC?=
 =?utf-8?B?b0VZUEJWc2x3ZVBOYm9sZ3FBMDVIL2ZocDNReTE1MGViV2sxakEyYVJVSklB?=
 =?utf-8?B?QUtNQTlkUEVNalU1MnhlOURzdmp4TkRVTy9sZkFvc3J6MGM5aHRtMUVWS0Fm?=
 =?utf-8?B?bWphSVQrQkNRaXRhNGdBZjJRUGNwemMvMmlEQ1E1T3VaaUx1bWY0T3dWU2Nq?=
 =?utf-8?B?Ym5nZURwSmtucGMyMElBUzBkK0daM05VcGNEVVl6MVdwQXhiVGM2eGpNTXIv?=
 =?utf-8?Q?bUoyo7cPLx57D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THB1MlZpWTRVSGlmcHh2eDNrZkMyNitTRENJN0hMN1JXdTZTcHJNSjRVcjBV?=
 =?utf-8?B?aUt5b1kxTVhSNjdDSG5oSURWOVE0a3pqS0ZiR2E2cDIwOVB5M1BmSXdhWlkx?=
 =?utf-8?B?MUJhcTRmL0gzSDhOclNIWEcyNUlUanYybXcwRHF1MHZLdTAzWDBJSG5HQS92?=
 =?utf-8?B?WkJ0dFMrTzlxSVpyMy9xbHRSTWtnbU9yNFJSZ3FGRE1NL09Mc0l3bmxUYTNt?=
 =?utf-8?B?SXYxUlZkdWRFM2RXQVdnNUxUei91QW4xeUpaWFNYTTRBQVRnUHlnWjF5a1gz?=
 =?utf-8?B?M2s2T1BKZWE2c3ZpdzArdkpINDQ5ZlRheTVzR0p4N21ma1pSb1llc05hK2Jx?=
 =?utf-8?B?Z1dwU2RkNldZdlpOUlAxakI2WEtlZHdkeEFySll0Y1ExNU1mR1hpUmNwQmht?=
 =?utf-8?B?MEtTS0t3eTdwTnBBK3VYRnk1cEdRdWpNVGI3YnBpZDNvT0g3SGNrdmZsYkh0?=
 =?utf-8?B?U2FZVUo3T2U1cnN3SzBSTDQ1RWVmQ3FYSVUxTjBuL09lV0VGa2xzbDA1VG9k?=
 =?utf-8?B?UTBVRGVsMUdLNitvRFM4dC9wOEd4SWk3RlJnS0xXRk52dEpucW43MTVXcFZx?=
 =?utf-8?B?OHBaQ255dkFwbC9IVUhLcFhuQWdiUTNwTzJqbWdpVVl2dENFNHhaOTdhSjE0?=
 =?utf-8?B?VGUzNDdIWWJPaVhPWThrbUFzdjBZL1lDVlIzb1lNU29iVGxmYWt2MGlKN3ox?=
 =?utf-8?B?bWZIWGl0SVdSSFFVOUZpYU5tRGlsaUxxZEkrQ2hveWx4T0VXTTBZck03ZHZz?=
 =?utf-8?B?UW5WbTVyaU1TMW5OaFZxZlN4S1B5dmRhWTJYMWtpR2x6bVhPUE9GSFBtdXZ4?=
 =?utf-8?B?UllnWXB2Q1g3cG5qZUxhMHdObTUyRFg3K2lZclNXWWkwNzl5WUlaTUNpaHN6?=
 =?utf-8?B?QytlamFtQ3BVOTlYdXg3T3htNExvY1BlSThhTVZITFF4Q2xVYldlbUYrbUpW?=
 =?utf-8?B?eUc2OFJsdjlSNjFqMzRoM3owOWxrOXRIa0RzaTdYZmdVV3lZYnhKZ3pnRjY3?=
 =?utf-8?B?MUd0em04ZXh5djdLWEhrS1NQS2VhM0t4dTdaVlo1a2ltWTc1S0tMMDRWTzk1?=
 =?utf-8?B?OEp2Smo5aG5lRzNoRm4yclU1QzRNVW84Tm5BS09MK3RMYjFQK1hIc1N2cVY5?=
 =?utf-8?B?UkRLejZqWFhkd0lBSndKOHdUSGVoOUdMWmJRdnBlQW5ZVENCUE5JcGhEbXJw?=
 =?utf-8?B?S3NzbzdRa3NhSmtscms2VVlDSm9hcFN1dnA5Nk9IYkdqd1ZjcU0wNGptTlRq?=
 =?utf-8?B?OHpNUEdQU1RYQUlsbVU1di8xZGdFR2M5WTlmekJMbjdlQkUzVE9IZkxuZkxX?=
 =?utf-8?B?bitVMitnT0pLMHVyVi9weHpmcU1Sc2xSeWtUQVRGNE5mTk5sR3dqSGFib3B3?=
 =?utf-8?B?enpkejFlSFJCZVJwc2wrbkhaUmhtMndkNm9aNE9CU1ZnUlovNzhjekxlKzNt?=
 =?utf-8?B?dlB6ZUZQUFdPUmNhRlZINzJteFZKdzRqSy82akQxeSszVXBOUk90eGNVS29B?=
 =?utf-8?B?N1B3cDdDZ2FlaDhrMU9IS0hlUGN2UytpcDRlYkZ4VWJOZnFKZ2lYUDRUODRX?=
 =?utf-8?B?ODRBZDVWKy9uQ1RLMm10cjQrWENEMnFSdFBZOWFvUWxhbSthT1A2YTkrNUln?=
 =?utf-8?B?TUpNSVBxQnJoeTUzUncrUnFGeHlVd3pTZ0JnQ3pIYStMbFNITlRqYmVhS3pt?=
 =?utf-8?B?Y01sVCtTTnkrZ2tIVFEyTkJybWV3SEUydWhObVJKWFE2UmJJd2VDVVkzdjdz?=
 =?utf-8?B?RUloVFByRm1GV0dQOGl6TXFLb2lZYytWb2x1WU1jZ1E5ak1US3dUQnhRcGRx?=
 =?utf-8?B?WDNva2lSTXBPNitvdU8vZTdza3FaeXVZWm9qRHB3SGVUR3dGdEVwWVZKN1VM?=
 =?utf-8?B?N3pKQWViZjJMUkVDaXhObjhaeWRYRW16SWlVMG9DRjl1ekgyenNFYnZNdXZo?=
 =?utf-8?B?Y1ZlakU0dnU1bjZoZk8vaDE2bWEzTnRqUmhEaG5oOGFtdm5NdzFvdTlBSzEv?=
 =?utf-8?B?QkVRL2pURnV4VGI2ZDFpWG5HZThoQTB3emlqMGVTVG1oWmtqSE1FaDE1L3hr?=
 =?utf-8?B?K25DZ3ZEeE80SzdXeEVpdUMyQnNLaWhrRnhFOXZJRWNlcU9WUDFOalkxNHNX?=
 =?utf-8?Q?j8Lo3qEen3AD12PnG9DmRJ7xT?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 77a8e41d-ea17-4be0-7d20-08dd30c4f2c9
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jan 2025 15:47:40.2811 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cpHdOHIyOjxVIMGUl1yIajvQQErAcTYaNrRJUS20qY1Qfuk+ebt7zfGAa9Fog31R
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6205
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

And pushed to drm-misc-next.

Sorry I'm still catching up from the holidays,
Christian.

Am 09.01.25 um 11:53 schrieb Tvrtko Ursulin:
>
> Christian - it looks this patch could be merged now.
>
> Thanks,
>
> Tvrtko
>
> On 15/11/2024 10:21, Tvrtko Ursulin wrote:
>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>
>> Testing some workloads in two different scenarios, such as games running
>> under Gamescope on a Steam Deck, or vkcube under a Plasma desktop, shows
>> that in a significant portion of calls the dma_fence_unwrap_merge helper
>> is called with just a single unsignalled fence.
>>
>> Therefore it is worthile to add a fast path for that case and so bypass
>> the memory allocation and insertion sort attempts.
>>
>> Tested scenarios:
>>
>> 1) Hogwarts Legacy under Gamescope
>>
>> ~1500 calls per second to __dma_fence_unwrap_merge.
>>
>> Percentages per number of fences buckets, before and after checking for
>> signalled status, sorting and flattening:
>>
>>     N       Before      After
>>     0       0.85%
>>     1      69.80%        ->   The new fast path.
>>    2-9     29.36%        9%   (Ie. 91% of this bucket flattened to 1 
>> fence)
>>   10-19
>>   20-40
>>    50+
>>
>> 2) Cyberpunk 2077 under Gamescope
>>
>> ~2400 calls per second.
>>
>>     N       Before      After
>>     0       0.71%
>>     1      52.53%        ->    The new fast path.
>>    2-9     44.38%      50.60%  (Ie. half resolved to a single fence)
>>   10-19     2.34%
>>   20-40     0.06%
>>    50+
>>
>> 3) vkcube under Plasma
>>
>> 90 calls per second.
>>
>>     N       Before      After
>>     0
>>     1
>>    2-9      100%         0%   (Ie. all resolved to a single fence)
>>   10-19
>>   20-40
>>    50+
>>
>> In the case of vkcube all invocations in the 2-9 bucket were actually
>> just two input fences.
>>
>> v2:
>>   * Correct local variable name and hold on to unsignaled reference. 
>> (Chistian)
>>
>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>> Cc: Christian König <christian.koenig@amd.com>
>> Cc: Friedrich Vock <friedrich.vock@gmx.de>
>> ---
>>   drivers/dma-buf/dma-fence-unwrap.c | 11 ++++++++++-
>>   1 file changed, 10 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/dma-buf/dma-fence-unwrap.c 
>> b/drivers/dma-buf/dma-fence-unwrap.c
>> index 6345062731f1..2a059ac0ed27 100644
>> --- a/drivers/dma-buf/dma-fence-unwrap.c
>> +++ b/drivers/dma-buf/dma-fence-unwrap.c
>> @@ -84,8 +84,8 @@ struct dma_fence *__dma_fence_unwrap_merge(unsigned 
>> int num_fences,
>>                          struct dma_fence **fences,
>>                          struct dma_fence_unwrap *iter)
>>   {
>> +    struct dma_fence *tmp, *unsignaled = NULL, **array;
>>       struct dma_fence_array *result;
>> -    struct dma_fence *tmp, **array;
>>       ktime_t timestamp;
>>       int i, j, count;
>>   @@ -94,6 +94,8 @@ struct dma_fence 
>> *__dma_fence_unwrap_merge(unsigned int num_fences,
>>       for (i = 0; i < num_fences; ++i) {
>>           dma_fence_unwrap_for_each(tmp, &iter[i], fences[i]) {
>>               if (!dma_fence_is_signaled(tmp)) {
>> +                dma_fence_put(unsignaled);
>> +                unsignaled = dma_fence_get(tmp);
>>                   ++count;
>>               } else {
>>                   ktime_t t = dma_fence_timestamp(tmp);
>> @@ -107,9 +109,16 @@ struct dma_fence 
>> *__dma_fence_unwrap_merge(unsigned int num_fences,
>>       /*
>>        * If we couldn't find a pending fence just return a private 
>> signaled
>>        * fence with the timestamp of the last signaled one.
>> +     *
>> +     * Or if there was a single unsignaled fence left we can return it
>> +     * directly and early since that is a major path on many workloads.
>>        */
>>       if (count == 0)
>>           return dma_fence_allocate_private_stub(timestamp);
>> +    else if (count == 1)
>> +        return unsignaled;
>> +
>> +    dma_fence_put(unsignaled);
>>         array = kmalloc_array(count, sizeof(*array), GFP_KERNEL);
>>       if (!array)

