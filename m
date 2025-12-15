Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 489BFCBEC6D
	for <lists+dri-devel@lfdr.de>; Mon, 15 Dec 2025 16:55:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DCC310E60C;
	Mon, 15 Dec 2025 15:55:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="LglPuNZW";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012058.outbound.protection.outlook.com [52.101.48.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DED9010E60C
 for <dri-devel@lists.freedesktop.org>; Mon, 15 Dec 2025 15:55:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FPgwoEnGBtDNeg3tw8mU3E/fvGSMK9GZYckfsm4qda3XNvZPcgYQCSY4GrsiFQ/A7q1cnhL20A2lS0cy2hDjS6NlnwA9oovlh+VxVdWHT1OXimXyBHF7zrpm84ZRPM5vxGEVQcqcaTRzsYVeNVk5jNxyg+r5D8IiPQLE/hkbDI9g4H59PRrp7P3Gg7SJn4lUIMqlGIChgRp1Fn6TJpebkmlJaTYmJcbqjqi39Y1azMJJs9YT5LlbSDsjhOtTV7pOgIxCCetgkf9X3WuZtnbJZ7IEpuCGnVBnVIfYp3U50KX0HCS/qxeFEKAZlxj+lOmuNU/acNpu572zzp7I5yKgFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z5gvmKBU/EL+91MmOS5LZzSnfku1VlXJVhPWVz1F3Ko=;
 b=vEWHG3H7Pxz6UxXSJqkHiVcSUVYHTJE82cb1Es4knd0L+t1E14KZEuilbosW040aMqDcl50egT9YKEERe5Xc9b4kZD6Uuur4iO1Eejvcp+WZxqyYtF743QlE4TouFtNeq91c0h3ArH5mE5o3BqCBKf+yjp6CH6iT/r1WR2/3EE+WMNqvApwl9Z4tcHGQIWZ6T5nasY3x6tQI63uGbS2FqyEXvge3nt2xer5qzqmLqFbsa+CO4PWbE2Sxa54stKSpKhmynAb2LNzjACBQTGTJo/v9pS2BN0HOCBBIhJ+vroNMNMJGfAxbZvGS/mLikX6X2gBgpx6yFw6EExrYo6dnfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z5gvmKBU/EL+91MmOS5LZzSnfku1VlXJVhPWVz1F3Ko=;
 b=LglPuNZWYtRYg8ENMoCvj0OqLA1raiGyglbFcUozt1QG0V/6qzJ0QdJnJvoQs3Ml/tp2kPzBRnaMMx7mnLotfxwmsq9Zqx/o2G2dBVuPVoIms/ih8upKZHYyPAGAwb4uMkXAtV+sTejOQKyVodimwHl6ASBK3T+rM4ePpCx8rRM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB9152.namprd12.prod.outlook.com (2603:10b6:510:2ec::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.13; Mon, 15 Dec
 2025 15:55:47 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9412.011; Mon, 15 Dec 2025
 15:55:47 +0000
Message-ID: <20b229f6-dcce-4bbc-8274-7744b26bfcac@amd.com>
Date: Mon, 15 Dec 2025 16:55:41 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/19] drm/sched: use inline locks for the drm-sched-fence
To: Tvrtko Ursulin <tursulin@ursulin.net>, phasta@mailbox.org,
 matthew.brost@intel.com, sumit.semwal@linaro.org
Cc: dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org
References: <20251211122407.1709-1-christian.koenig@amd.com>
 <20251211122407.1709-10-christian.koenig@amd.com>
 <9ef8686f-820f-41e9-985e-40411b4b9bd3@ursulin.net>
 <587fb06e-cfac-4603-b074-a9b382ecea31@amd.com>
 <e19284e2-ff38-415d-a44d-0ab610032d24@ursulin.net>
 <6e2e258a-0c20-4229-8301-5a217f29eea6@amd.com>
 <07ad04cd-de4e-4c12-823d-cb3024816382@ursulin.net>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <07ad04cd-de4e-4c12-823d-cb3024816382@ursulin.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: YT4P288CA0050.CANP288.PROD.OUTLOOK.COM
 (2603:10b6:b01:d2::8) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB9152:EE_
X-MS-Office365-Filtering-Correlation-Id: 43deed12-21f5-40a8-4b11-08de3bf269a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eFhoejR3RjAzK2NNTndnT0krSWphdlY3VXdaMXdmdjdJRTNnMU9KUzJ2NThx?=
 =?utf-8?B?U3I3SkZKdW1hK0hNZHdmUHhhckVIQjY3ZXhEaUd0ejZZNVlUSEN4Z3VtSjFH?=
 =?utf-8?B?ZkNqRXRrSXU2M0didzI0anVxL3M5V2JvMkh3cnJFa09mR2twT21lNHJFSkZY?=
 =?utf-8?B?cHNOYTA4MFB3MjVkUmpKa2xXcGhORHozdUxBWERkVEdEYm9FdEhFSDhtN1Mv?=
 =?utf-8?B?MTBSNWZwejlFWUkxWHhtZnBYbndzTU5RK1JvQjNtdGZCcUFIU0h4TjIyTTFz?=
 =?utf-8?B?RndsY1dCZVZqUUNRR0hvcit3VWpxbDJUc1hkcFRhZXFLWm9DdjhieExHeWx2?=
 =?utf-8?B?SVNJSENNY0FLOG9RMkNmZDNSMnU4VkZ4cHdaOFlaRExMaXVvdkN0QzRBMk9I?=
 =?utf-8?B?blRTeHRDYmdBRUZrbTJxOWpQUU5MbUVuNVR4YUlORVJzV1BNbVQ4aVFNbWhT?=
 =?utf-8?B?OUdMM2tOa2M1YjlhbXRmOHBNSTVZWnF1dnlNMkN6Ly80U2dTTjQvT2N6aUtY?=
 =?utf-8?B?c294cjMrck9MblV3Y05BYzFKTVd4TGkrK25zV1ZEZFlPZlhKQk9zblNCRmpw?=
 =?utf-8?B?aS90MlY5NUx0dm5vSGg0YllobjJiSk5YTVBTQThtVm54RTdLbWxDelJ5RFlh?=
 =?utf-8?B?MnRlRnduZVVRelN4cUJwcDRpMzhFcEpIS3NPVlhPc2ZIQVM2YzVxRUFZYUFO?=
 =?utf-8?B?ckc5VGtFVDBCRDI2alJ5dVRXUkdWbS8ydTlaNE93dFEwVS9kN0RoV2ZUSmNT?=
 =?utf-8?B?c2VCeXdyV0dTZ0hoV1JlUG9GRTRPK0FlRWV4TTdwZk9JMytLeEoxTFdDQ1Rk?=
 =?utf-8?B?OFF6Y1oweTAySTBQVzBwejZlbkVxSlhhTTNySWRTOVJTV2NwRVB0aVo5dE1X?=
 =?utf-8?B?M1ZveGVNMmllVVRZK3JTVWQvR2UzRXkwR01US2kxQ1gramUrMjBJc0JwMWU0?=
 =?utf-8?B?WGhRZWdvaVBIZ2xrVUlYQVRKUWlBTjJpM2pjOGZzV1QwaEUxaVV5eUdKczJ3?=
 =?utf-8?B?d3ZoYzFoNTJsZmZFbk4va0Z1V041Uld6Z1BYZXlPNTFWSU5seHVUUU9RNWJH?=
 =?utf-8?B?ZGU3b1lTeVV6QWlmYXNHeVpnVittRTlLWmFxSC9DdXJ6MDhDeEdjaThUdG9i?=
 =?utf-8?B?U2Q5NFBKVjVLNDUrZGN3WG5hSnl3ZEJZanBXdm5BODJGVGoyME92RFJYWnZH?=
 =?utf-8?B?QUFpb0h0NkYrUmUzb3F6TURlNUFSODZreWVmdmt4OUlneTRHa3VZNWRKOGRj?=
 =?utf-8?B?K3llSFpSR0JnU0x2ZFBkbW5FK1NOUXFkbUIrQUpBaWxFaXJDL21sNHk5c0gr?=
 =?utf-8?B?alpadGlWOWkzQkhCc3pHYVBpQ1U5NnBnQnN2cGtISERlMkRtdlBGN2tzTmFX?=
 =?utf-8?B?VkRIdzl6cXRXNk9EODZ2cGxZVGV5TExPaUFBOWl2cU45VFNMbnk0WXVYT095?=
 =?utf-8?B?Q3V4Ym55ZVlWbEFpRFdTNFFWb2g1Y1hRTldMNnBxOVk5dDZaeTUxazRUVWNC?=
 =?utf-8?B?SFRmUGhJNFkzOTR4T01jYVQzYjYyRmk1YXptQnRhRzd2WXRwTndUNFdwTXlB?=
 =?utf-8?B?RGNlQXVERnRyVXEvU1lLNGdEQlk0dmkvLzY0cmJrYlozUU81MlMvV01YaVRi?=
 =?utf-8?B?NjZ3OU43MVFpZGVRZkZKUHZ3d3MyZm1BbmcrT0R0TmVEc0RxUXBnc1RTeE11?=
 =?utf-8?B?ejVidW5Db0RNWE1Db0lIaVlqRjM5ZVArYmo4ZWxETHhDdk1nUElzOUIwRG0r?=
 =?utf-8?B?RXp5Sml6TUo1U1ZBbHJ2V1dIejFRNENBQ0M2dU1jcUFxV1Z3cnNmK05VZS8v?=
 =?utf-8?B?N2FRRDNRRFZFRW5TTzE2WEcxU2pOeGRrclJTUHlOQ0V0TXBiaEU0b0pqK2dV?=
 =?utf-8?B?RVFvQkpuV2czU2dOZ1NRYTZzd1pqQk5Lb0FmYVFhM041UUwwTmF6SnpvNzZU?=
 =?utf-8?Q?FdQ0HfpQD7gILjgo0uVNxq2pUcMBAgDp?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cTMrcGx2TmZvOXdRbnkzME5sYjRkQkJQckQzOFdHUXNGVkJhK2ZsZUNKTDlK?=
 =?utf-8?B?UGh2YzZ1WGpOTzMvemthcjRJOVl3dzFsSGNhcEhqMDRaT2F0L24zS2hCbEVv?=
 =?utf-8?B?WE1nVnVvdStGd0tXN3RZSTdQdUszWDlOR3ZnMS9QckpBMG9ucTd6TEZnQ3k2?=
 =?utf-8?B?MUpUbWlVMGNIZjBXc2NyWEo3VFZqekVYdWxuVGJpN3BVUjNyMXVvVHV0Vjla?=
 =?utf-8?B?R3gzQWVLZk1taU1venhscTY3ckc3bXBQTGJnTGJnY1hVeUJBZ0h2YWtNaHR4?=
 =?utf-8?B?ZjkvRThrWVMzL2M5NDdURXN4MjBEZGdqUlVDYnRpTFVDOVMwY3FudjBLUTYz?=
 =?utf-8?B?RU8rRUYzd3JyU0IzSjNQclQxSEJXdDFENzVDeG84aE5kK1NteVp2d1d5WVNv?=
 =?utf-8?B?Nk9VZkQ1aEZvREl5ZEpZUHNwdWJkQlhGWHRiZmZoYytQY1BOS3gzdW1MUkxh?=
 =?utf-8?B?OENKZEJYZzlBZ2o0dHpIMUhObFl4MWFSSmc0MnI2MmVkb25ydG00QzI3Nmlz?=
 =?utf-8?B?NXV1bDR3N1dxOWJCQ24xd0ZaWWd1MHhuUllhRmhwb2VJSUVRQnB1SVgwTW5h?=
 =?utf-8?B?N05SWEhoYjFJL0Qra1VYOVgxREVDeEZmUmM2VGl0UHFtejcrR3NMbjQxaGVO?=
 =?utf-8?B?eEdWTmxYN3hCaHBxMzNjSUkxMWZMcVZyUlJIcGZSMzdDNFcwbURnVEd5eG02?=
 =?utf-8?B?dVpSM29SaVhPcys3bm5VM252WkY1eFpEOFVPMHpsNHF1S08xYXJVODk3K2hL?=
 =?utf-8?B?djkyY2xRSUZtWnNMUnYycFowYmlNQnRwMFBqaGZMOFpmUmZIbVhMdVBHay8w?=
 =?utf-8?B?UnZ3UmpGUy9xUXFXZi9RUnpUYjVXeDVKclVDZnZvTlZiaWZZT1pGYnNOMklE?=
 =?utf-8?B?eGZhcVRkczA0cHhqeGs5SFEwQmRsYXlxZmJRT1YxV2Y1clpxZExHU3hJa1I1?=
 =?utf-8?B?M1ZaRFFSSk9UY2NROUhhT1lLUnJMNU5mWVp6ZnRIV05DMUJJNXRSU2h0OVdO?=
 =?utf-8?B?TkxXTHYvNTFmdDk1OGora2VBZVQ3QnY0cTNjNWpVWWhoZWJhenpkWnU3YS8w?=
 =?utf-8?B?R0k2aXA4dTlPTWx4U1NYcjBmU2tWTmlmNlBFcWRwZVhvUGVyQnQrYWw0ZXBY?=
 =?utf-8?B?eEZxSTdDcGJBRW9XYlJPYzNVTXYrWStsT2NIS1djUVpJY3lUYWIwWFVpdlRX?=
 =?utf-8?B?OXE0Z0VqVVp4TWY3RC9md0tGbFNyQjlRN3hsUWxYUXdPZWJuZnpzdHF0a0FD?=
 =?utf-8?B?QURBSkJsMTJ3NXFVTmhPK0xyRE02RUg1NEFQY1NiMWptQUNYUDZlbzlsK3Vy?=
 =?utf-8?B?VU1wNm9vNGRLZ3V4UlNNUFpqa081RXRuQ3lOTVVRMXVra0tkOGh4dUFCcE1w?=
 =?utf-8?B?NVZETlF0Q0tBdlJJaEZnWWlFWm9BOW5FK3dwQXk1VTBMR0dzN2VpeFpHaUVQ?=
 =?utf-8?B?L2paeC95R2MrY2g2QzdvSk1JWmpJeG5Kd0dhYTV2NjBEeWF6OXBZWG13enYw?=
 =?utf-8?B?WDhpYklXbElmK28vdmswbnIweW1va1hQWHUzNnJBWVd1SksxeUZXWXU4U2NC?=
 =?utf-8?B?MlQvQ29hN2VZWEVubXZvNXBYSUY0Z2JCUWNMNjNXQUcySzdRa1g0NWtUNWRK?=
 =?utf-8?B?RDRIYkVzOU85bjFvdWprM0dVWmc2Ukt0SnFGOXVjbmFsanNUTFNRQXg0d3Zu?=
 =?utf-8?B?aG9UaTVGSkI3VVBna0g4VGtnb3JxRkhmRFBkQ2o3Y3EzQU5lNkVEa3ora3ZP?=
 =?utf-8?B?SjZJY0Rpelg5VEkvSXVyTC82Nks4OEx5amwxRzkvNGxSUERtS1c5UFJaeWsy?=
 =?utf-8?B?b3RvZStEMmFYS2ZhMTV5RFR6d3F1cEppdWQ4UVNJc3VCNDBzUHhRVDVRQlVD?=
 =?utf-8?B?Ti8zS244Zjg0STcxODV0bmVGSDNQMGZDamdKcktGVEVMdXBKTmhYTm1keTIx?=
 =?utf-8?B?Z040UjI1U0NhT1NmZnhrS3pIL0U1SGZKeVRnWlR6SEF0TTRMSkNNVkcxa29L?=
 =?utf-8?B?VTVldklEMHpvZG85bmZJTHFLMEZscTB3OEUzRnZVUDc1U0xVVDRNblAvM21V?=
 =?utf-8?B?Q2ZZVk1QckN6YitMN1JHRU9LK1BuL01MejdpeWJsK1VtVDY4K0VXbzQ2VFox?=
 =?utf-8?Q?iAtTGXJRicQQwfCpnY1ecIm0p?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43deed12-21f5-40a8-4b11-08de3bf269a0
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Dec 2025 15:55:47.4611 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1f4E/vwnoO3drRINidl1mHDaw0p8X03Y4Wsahd4gMC/BCv9Z0fRY2ARm18QDPphm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9152
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

On 12/15/25 16:53, Tvrtko Ursulin wrote:
> 
> On 15/12/2025 15:38, Christian König wrote:
>> On 12/15/25 10:20, Tvrtko Ursulin wrote:
>>>
>>> On 12/12/2025 15:50, Christian König wrote:
>>>> On 12/11/25 16:13, Tvrtko Ursulin wrote:
>>>>>
>>>>> On 11/12/2025 13:16, Christian König wrote:
>>>>>> Using the inline lock is now the recommended way for dma_fence implementations.
>>>>>>
>>>>>> So use this approach for the scheduler fences as well just in case if
>>>>>> anybody uses this as blueprint for its own implementation.
>>>>>>
>>>>>> Also saves about 4 bytes for the external spinlock.
>>>>>>
>>>>>> Signed-off-by: Christian König <christian.koenig@amd.com>
>>>>>> ---
>>>>>>     drivers/gpu/drm/scheduler/sched_fence.c | 7 +++----
>>>>>>     include/drm/gpu_scheduler.h             | 4 ----
>>>>>>     2 files changed, 3 insertions(+), 8 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_fence.c b/drivers/gpu/drm/scheduler/sched_fence.c
>>>>>> index 08ccbde8b2f5..47471b9e43f9 100644
>>>>>> --- a/drivers/gpu/drm/scheduler/sched_fence.c
>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_fence.c
>>>>>> @@ -161,7 +161,7 @@ static void drm_sched_fence_set_deadline_finished(struct dma_fence *f,
>>>>>>         /* If we already have an earlier deadline, keep it: */
>>>>>>         if (test_bit(DRM_SCHED_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags) &&
>>>>>>             ktime_before(fence->deadline, deadline)) {
>>>>>> -        spin_unlock_irqrestore(&fence->lock, flags);
>>>>>> +        dma_fence_unlock_irqrestore(f, flags);
>>>>>
>>>>> Rebase error I guess. Pull into the locking helpers patch.
>>>>
>>>> No that is actually completely intentional here.
>>>>
>>>> Previously we had a separate lock which protected both the DMA-fences as well as the deadline state.
>>>>
>>>> Now we turn that upside down by dropping the separate lock and protecting the deadline state with the dma_fence lock instead.
>>>
>>> I don't follow. The code is currently like this:
>>>
>>> static void drm_sched_fence_set_deadline_finished(struct dma_fence *f,
>>>                            ktime_t deadline)
>>> {
>>>      struct drm_sched_fence *fence = to_drm_sched_fence(f);
>>>      struct dma_fence *parent;
>>>      unsigned long flags;
>>>
>>>      spin_lock_irqsave(&fence->lock, flags);
>>>
>>>      /* If we already have an earlier deadline, keep it: */
>>>      if (test_bit(DRM_SCHED_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags) &&
>>>          ktime_before(fence->deadline, deadline)) {
>>>          spin_unlock_irqrestore(&fence->lock, flags);
>>>          return;
>>>      }
>>>
>>>      fence->deadline = deadline;
>>>      set_bit(DRM_SCHED_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags);
>>>
>>>      spin_unlock_irqrestore(&fence->lock, flags);...
>>>
>>> The diff changes one out of the three lock/unlock operations. Other two are changed in 3/19. All three should surely be changed in the same patch.
>>
>> We could change those spin_lock/unlock calls in patch #3, but I don't think that this is clean.
>>
>> See the code here currently uses fence->lock and patch #3 would change it to use fence->finished->lock instead. That might be the pointer at the moment, but that is just by coincident and not design.
>>
>> Only this change here ontop makes it intentional that we use fence->finished->lock for everything.
> 
> Sorry I still don't follow. After 3/19 and before this 9/19 the function looks like this:
> 
> static void drm_sched_fence_set_deadline_finished(struct dma_fence *f,
>                           ktime_t deadline)
> {
>     struct drm_sched_fence *fence = to_drm_sched_fence(f);
>     struct dma_fence *parent;
>     unsigned long flags;
> 
>     dma_fence_lock_irqsave(f, flags);
> 
>     /* If we already have an earlier deadline, keep it: */
>     if (test_bit(DRM_SCHED_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags) &&
>         ktime_before(fence->deadline, deadline)) {
>         spin_unlock_irqrestore(&fence->lock, flags);
>         return;
>     }
> 
>     fence->deadline = deadline;
>     set_bit(DRM_SCHED_FENCE_FLAG_HAS_DEADLINE_BIT, &f->flags);
> 
>     dma_fence_unlock_irqrestore(f, flags);
> 
> Notice the lonely spin_unlock_irqrestore on the early return path while other two use the dma_fence_(un)lock helpers. Am I blind or how is that clean?

Oh, that's what you mean. Sorry I was blind!

Yeah that is clearly unintentional.

Thanks,
Christian.

> 
> Regards,
> 
> Tvrtko
> 
>>
>> Regards,
>> Christian.
>>
>>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>>
>>>> Regards,
>>>> Christian.
>>>>
>>>>>
>>>>> Regards,
>>>>>
>>>>> Tvrtko
>>>>>
>>>>>>             return;
>>>>>>         }
>>>>>>     @@ -217,7 +217,6 @@ struct drm_sched_fence *drm_sched_fence_alloc(struct drm_sched_entity *entity,
>>>>>>           fence->owner = owner;
>>>>>>         fence->drm_client_id = drm_client_id;
>>>>>> -    spin_lock_init(&fence->lock);
>>>>>>           return fence;
>>>>>>     }
>>>>>> @@ -230,9 +229,9 @@ void drm_sched_fence_init(struct drm_sched_fence *fence,
>>>>>>         fence->sched = entity->rq->sched;
>>>>>>         seq = atomic_inc_return(&entity->fence_seq);
>>>>>>         dma_fence_init(&fence->scheduled, &drm_sched_fence_ops_scheduled,
>>>>>> -               &fence->lock, entity->fence_context, seq);
>>>>>> +               NULL, entity->fence_context, seq);
>>>>>>         dma_fence_init(&fence->finished, &drm_sched_fence_ops_finished,
>>>>>> -               &fence->lock, entity->fence_context + 1, seq);
>>>>>> +               NULL, entity->fence_context + 1, seq);
>>>>>>     }
>>>>>>       module_init(drm_sched_fence_slab_init);
>>>>>> diff --git a/include/drm/gpu_scheduler.h b/include/drm/gpu_scheduler.h
>>>>>> index fb88301b3c45..b77f24a783e3 100644
>>>>>> --- a/include/drm/gpu_scheduler.h
>>>>>> +++ b/include/drm/gpu_scheduler.h
>>>>>> @@ -297,10 +297,6 @@ struct drm_sched_fence {
>>>>>>              * belongs to.
>>>>>>              */
>>>>>>         struct drm_gpu_scheduler    *sched;
>>>>>> -        /**
>>>>>> -         * @lock: the lock used by the scheduled and the finished fences.
>>>>>> -         */
>>>>>> -    spinlock_t            lock;
>>>>>>             /**
>>>>>>              * @owner: job owner for debugging
>>>>>>              */
>>>>>
>>>>
>>>
>>
> 

