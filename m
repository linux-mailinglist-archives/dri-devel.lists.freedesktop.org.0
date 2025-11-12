Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D3D2CC52905
	for <lists+dri-devel@lfdr.de>; Wed, 12 Nov 2025 14:53:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38E5510E737;
	Wed, 12 Nov 2025 13:53:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="ijryVfXY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011064.outbound.protection.outlook.com
 [40.93.194.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59E5F10E722;
 Wed, 12 Nov 2025 13:53:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Xmb1KgiilMETv9DMaVlLkGLgsxQ+BBflJc/OZ9tfWi5Hu+gbFnBQBkaXy20Z75yiB86EEu9fXmhqprlqSPYhFGWuPra7U07S2uy1MdIZi94U+vHcjH3+vv0r3cnabCzwNw/7YK6kXtl6P5yLdf4/uqYbZ3CTxO3D6o1G4vaTC/2TFVMROI25LC1pIY17XKKEZW0wvo3SY4OH4TtptKstKlHwXVJKG2pPHYKnOGgk1KlZtOvkBDvVyvjdS+2UVRHhdTYC02EWX1XwRe28vZsCSiKeU/rrtWgRkqwcKWyxcN142wn9iG1aJpv4ls6hKWLax/Yf9uWH3HFvwPnhUADn4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y1VMYWFjC6bpwi80ZvUeX73iARx9w0hgNuWUf/AMqPU=;
 b=sLQGxW6Vusn0FNnctps6i/kAVdCxeNycW/16bxMFA1Zpf1E8MUUQnG41MasRAxZfS7vr+NXIWm6Ei/2yuNwxMNIbhazCAjBYR5ar+0PhIsGrvxStAtyyrA1LllyhJXiGEYO1KpzPNSQeqx5DjUm0sCOMMFuHKc7EcPjtfRgwWXs7IIXF8GR98OfdTJtYV6RkJZx/3dFz1VWUFzGkhOLULK/6jLTTGyU3DCVEQabzIGN4faGVcPIKNpLmeA3YdqV7hrUa8+I0K76806fu6yBgk+arVJAIrSgZVicmSEL1Fa0YpBux3rcUpxfk8O8YoQIVsWR89ioLNyZgEEVQ3mOTTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y1VMYWFjC6bpwi80ZvUeX73iARx9w0hgNuWUf/AMqPU=;
 b=ijryVfXYVrkTuwjCZaMruOmrWBuT6J0euvDPgXPzkibvaLPYAoFwoz/oQewgEw48ahmnuSYiEOVzbdHrmMZTvMwoW7gcWqg0STYGDj1AoWPuEteI1EIZ2xhzEQ2jZsMUP/+k0XMT/w+5ertE/kJkyA50cnL7Bw+A3YMJVA1GNrk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH7PR12MB6490.namprd12.prod.outlook.com (2603:10b6:510:1f5::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 12 Nov
 2025 13:53:09 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%4]) with mapi id 15.20.9320.013; Wed, 12 Nov 2025
 13:53:09 +0000
Message-ID: <52d862d2-fd26-4770-91ab-9a2ea8073282@amd.com>
Date: Wed, 12 Nov 2025 14:53:05 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/20] dma-buf: use inline lock for the dma-fence-array
To: phasta@kernel.org, alexdeucher@gmail.com, simona.vetter@ffwll.ch,
 tursulin@ursulin.net, airlied@gmail.com, felix.kuehling@amd.com,
 matthew.brost@intel.com
Cc: dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20251031134442.113648-1-christian.koenig@amd.com>
 <20251031134442.113648-8-christian.koenig@amd.com>
 <54bdf125bec4dd612d45fc96bb81f03e5a432b02.camel@mailbox.org>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <54bdf125bec4dd612d45fc96bb81f03e5a432b02.camel@mailbox.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0118.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::9) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH7PR12MB6490:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a256a46-1b7a-4eaa-2604-08de21f2d009
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?U2h1bFFLcTl2OVUrcTk2VElZN3QvQVpsTXRBOUcxa2tJSENHSitlSVhrSURK?=
 =?utf-8?B?TVpqc3VDQkp3cUtMY0w1dmRjNXpSeCs1NDNFZDdiTjI3djE0K0plWDZ1V2x5?=
 =?utf-8?B?OGlRdjhIZlRycTFHaFdMcCtiVndvRE9TU3VIZmRpeFEvSmZ6UStFc1IxN1Mw?=
 =?utf-8?B?TG4wdzNPSUdVMkRDajA2RTUvaXN4dUsrYmliWjd2NmRBeWtNNjJSNVp5WWVV?=
 =?utf-8?B?S216MnQ5YXNkaU9zQ3hvVThTNzM1eE43TzFxT09jT3pnOGxQa1FGbHpoQ0JK?=
 =?utf-8?B?cy9BVUdHTENzUlMvb2FXWW1KbjJybWU1QlcrRXZYaUIxR0ppWFYxYS9abUQ0?=
 =?utf-8?B?NEtLa05QTUtpZTBnZ2F3YXhXY2lPeFJUWDkwVWRiczRxSXFRNTJwM1JDbndO?=
 =?utf-8?B?Mmc5MkRRTDBOWEkvdUlLLyt0NVNhVFZwMWRrVGI1ZVRLLzZ3aDVVWnFKdjVy?=
 =?utf-8?B?a1pRb0ZERGt4SDRDM1J0V3lkcFM2aGpnUXNKRGFVTU1USHNYR1JOU1FnenBH?=
 =?utf-8?B?T2FOZXQ0NTRwTFdvVGM4WkNlVXpPK0l3OFRVSnBjNFVPNWN2SHY3dFFhcFhJ?=
 =?utf-8?B?UGttaEJkOVRXSTlmeXhJei8rRGh3anF1K0RQZlRyeWZoVkIzcjVBNmd0YWlD?=
 =?utf-8?B?L1JKTldPRzVldGFiYTcwZ2NYV213WnpZN2lFMkJtSGdyZ0UzMGZGeWdRelpN?=
 =?utf-8?B?ZkJaVHo3WXhBZkgwdk9zdjFBZ2w2RHV1WlN4UDkvQXNUbjFodzZyUVVTNnk5?=
 =?utf-8?B?NFVvbUxNck42b0diZUJSRVRvV25HbWFUY2dIWlFhM0dwM1hic0RHakVVdEZn?=
 =?utf-8?B?OHg4S0cxVzZKQSs5SFVkampxUWRSOG9xdmJQbHl0K3FHdXg4RTlQWDV6YXkv?=
 =?utf-8?B?K0pwVm1zYUNVU1hiSVhGblZHOW1kVzZjTzNTam15L0REbk5IdG5ZNkFSaGdX?=
 =?utf-8?B?M1Nia2EzMk9WeE4xcE9Ob2RpN2tXMU1sUWZGVEpRTkFZczNVU2R5RkszSnJi?=
 =?utf-8?B?TnREaG9pakhlN25kVHJhTHp4RERtOCtpSHFOeHJCQ3dzWGsveUxDRHlaa1Ny?=
 =?utf-8?B?ZzdOcC95MkpPdGd2akNNR09TWDI0ZnJQd2s4amhYanlTMThuZkRZUkc5ejM3?=
 =?utf-8?B?VnlEak5NRi94NEMxSExTb2xZTWNsdmNBVHU5TjYrWVAvdVRUY3o2NmwwVW5n?=
 =?utf-8?B?dUlEYVE4VCs5dC94Z2crNHN1a3orTXZWK1RrT1R5WmxERGNRekZMT1RQeVEv?=
 =?utf-8?B?cVUrTC94dkxpR3dLVkpQN1cvRU5Ocks4RFRLSHJkczBRYVpUaWQ1L1pDSVNr?=
 =?utf-8?B?Rkw3Nk84SVJPK2xEVmthSmlma2lHYkgxZ2c1NTRpR3N3c0ZmamdOa3Y3T293?=
 =?utf-8?B?TE5DaFJlbWFmMWdzS084NXpobzk3UzduU2tzRjRhQ0VPdlVYZ2Ura080NkNF?=
 =?utf-8?B?d2tReER2NHd3TzF3SDBoTzl1QmhiVnEwVUN4VEdQaTFOS3N6dG50dW81Ukhz?=
 =?utf-8?B?SHZjN3JnWE9BbFVYVzJtT1E0cTBMRC9UcVEwQnlNZkRZWlpBTXRobjZuZVl1?=
 =?utf-8?B?K29CUUZCalBCS2ZZWTBpNVl1bFVscjBMVWxDd0ZqNkk0UExiYmZyWkpaam9j?=
 =?utf-8?B?eTI1UHozUFkxY0lJdG8vTC9ONG53cm5saEhWOVNhc085cEQveUJZRklFSU9k?=
 =?utf-8?B?SnB1eTY2S1A0VVFIZW81WElaUXpXUTZQZU50dk1XZTZLa2hBd1VrRmxSMHNQ?=
 =?utf-8?B?RjVFckRhU3U1OVVRNVVxM2kwNnpqNDFQekoydGJlbHpOLzF5d1RPall1WDNz?=
 =?utf-8?B?cmZGZWpySGtyUkVFMHdTL1ZpcUo5U0d3elpRZHloc2diU29HTjJvYVRtU2wz?=
 =?utf-8?B?OUxmUFRDV21lT0E1TjNaZzhKRjFhOXBoYXZCT3g0b1ZCclQzbDJSdWFEbFlY?=
 =?utf-8?Q?vdESBNFRu/SUbgCbchgLqKkOFdJ8TZjo?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SGpQeGxydzFrQWY0MXNJTWFkcVRhbzErcmY5YnBmNTRFSFc3dFI3Q3U2RmJV?=
 =?utf-8?B?OTYySlRJanY2Rkk2Wis1ZlIwQXNMN3BIRVpWWDZEdXlJUExnZEtIeUk1WUVn?=
 =?utf-8?B?d3czWHpLL0pJM0I1QmhYb2R0YjljZFRlVGZ4bHVCbW9TbzJxOUNXT2RmaEkz?=
 =?utf-8?B?bTVDczlqZ1JyUVNlQk9FKzJLOE5ORlVBZ1VHdGt0NjBsdHcvUEVZaUpQUDlp?=
 =?utf-8?B?U25aVGdJaThjVGpzK042S3BqMmZ0MU5CNTVsZ3NFQXBIdjFqVm5nU09rejBH?=
 =?utf-8?B?dlpMYnFpSHhjZ3lwdVEyK0RUSmxqakFmM2JmTldaTm5mL1g3bUJTVXNBWk5a?=
 =?utf-8?B?UTdWSUoxZ3oxdTNRRkxKTzhMZFExLzFUNmtqS1BUR3ErNVljcFBaaENlTHZv?=
 =?utf-8?B?d2psY05aVGU1MDVRcjJDVDljV2Y1TmlzN3lZemViU1FDVGNpNE9LTVBjSVZs?=
 =?utf-8?B?cUR1cENwUytKOFd6cURvb2dtTmlVeTI2NmgrY1lzRnFiVHY0Rnhsa2VkckNB?=
 =?utf-8?B?K2l4WHA4OUxjNHJaTDF4dFVoMUY0aUNyc3Y2Z3ZxSmFnazUrQ1BEdXJVTDlK?=
 =?utf-8?B?bFBScXRtWXhQZ2NWNVVpZGRsMnBLTUZML2VYNnhmZXIxampYMDdONVBYNFJp?=
 =?utf-8?B?bHV5QmVzL1E0UU52OFVLaXp2ck5mNjRsZVlIWVk1L0FnMEFOemZybkdRSWlF?=
 =?utf-8?B?U2NhM3ZuUFB1V2FhNHZ5L3AyQTlrUzl3dlB3WmY1VWliakxuYk5hcGJoR3pT?=
 =?utf-8?B?L3UzaGNHMVJsWlBKbmtYMjdRK1N0cWgwQkxaQ3VmdXluNHMzREV1QjZqMEdT?=
 =?utf-8?B?QkgydWc2Q0pDS1ZhTWRwRFlmZTBPcFJWdTZ4MmdzVmdzRU9ibzFHRUM3MG1k?=
 =?utf-8?B?cW9SR0NLSUhTZVNEd2cvamhVVHVybnhvZGpxUlYxRzAvNUlLT1ZNOVY0YWc4?=
 =?utf-8?B?QnRlQVlMYzE2WElKcjFFQXgwWjRHTTlKcFpMK01WeDdrbUozSmJVWXVzZEhw?=
 =?utf-8?B?NXJMcDErTHhmcG92L0FUSjRNNFd0SFR3V2dwMTRrUHdWNklIWXBxMThIYlBx?=
 =?utf-8?B?TjcxK2xMNWN2Z01YSHc3NWZXMEdNdk9obFh6alRoUjJ0RENyQlpuUXEwYUJP?=
 =?utf-8?B?eXVUeDV5M0JRZVptRkR3OGRCMEFNOWhmWWxxTHNFUkY5WGgzeWo1cFI1UHVW?=
 =?utf-8?B?ZWFXb3F3cmhpWEg4RktjUzE0SW0wb0R6SU12Sm1Gc2VKVld2bEVjOUY4YmdD?=
 =?utf-8?B?anM3VFpkNy8wLzBJa3BobjV1a2RZWk9nNGdOcCtGNWh6blQyQzJPTU9FUUh5?=
 =?utf-8?B?SDg2V1RVNWtySGhmS25qTEZxSmQ1cDJkWmlETkZkTUxEb1ZjdU9QbVN5Rld3?=
 =?utf-8?B?K0ordWNZeDlpWFlXaUhyMUdvaTdCWTJERkNrUVAyR3V4TFBuNkp5SEpWRWRI?=
 =?utf-8?B?dndKMzVqSHdMbXVJaFBkQ1pTQXRuUHNTcU05TmFMb1hSMis2T1VPZWxqMWpM?=
 =?utf-8?B?ZFE0aWZrQlluZnFSR3hqdUcxOUNkbldYUWZqeXZncUh0emFXRzVucDkvTGZy?=
 =?utf-8?B?SWRZN05kbllyb0hPam1Fb0RuNSs5NGpUQ2NLUTJ3WnlGNWpZRStTbTk2UDBO?=
 =?utf-8?B?Q1JCSjJyaFNwTE5MNnlGWFM3cSt0b2ZvRUlGSmtnUDlvQUpIT3YvZm5JQ0xF?=
 =?utf-8?B?a2ZXeDZPbkJCRFRUVFRYRjlsOTBKNnUydUhodUhPNzZSRytCQkFEb3JyVmFR?=
 =?utf-8?B?bUpVU1pVRFJocDg0eXJMV0EvWWRQTWFhK0VIeVQwZ3JldHIvR2xYRks4MEVy?=
 =?utf-8?B?MUExdmQrZXBZcng1ZWV1OS9BdDExMVYzemNWWnVRV2ZwRm1zSkJhZkRPWDAz?=
 =?utf-8?B?bGplSE1jVFdIV0RkamU2aHNvU2d1M0w2Sm5penhSclVFSitsMmh3QWVFSXJM?=
 =?utf-8?B?VFpLSnR3ZjlOM21sQWVqT092K2RHUDgveitUUXEwWnBvcXlOb3ZIRTk3S2ZW?=
 =?utf-8?B?MjMxeVpkS3h4b04zZjkvS29TbzNqdytUemZwNGlHRjZseVZHaGJDZk10THM1?=
 =?utf-8?B?QTZORldwZ09xemRsemRScFJCa2RxWnZiWVBMbTJvTnIyRU5Za0FHeG02NVFU?=
 =?utf-8?Q?wmDdhC/nUL9qEa/EOzeU60cPY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a256a46-1b7a-4eaa-2604-08de21f2d009
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Nov 2025 13:53:09.5833 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GHjjzlAsdl+s9ATUcG1QmhJ5tbAlUM7wW0gMCIgRS/D05De4UNVG5KbEUHMXcl2w
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6490
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

On 11/7/25 13:04, Philipp Stanner wrote:
> On Fri, 2025-10-31 at 14:16 +0100, Christian König wrote:
>> Just as proof of concept and minor cleanup.
> 
> I maintain that even relatively simple commits should give a new reader
> ore one who's browsing through the log in 3 years a rough idea what's
> going on.
> 
> That is: quickly describe what the situation (motivation) is and what
> the commit does.
> 
> At the very least "proof of concept" is nothing anyone would expect in
> a non-RFC patch. To me as a non-expert in dma-buf it's not clear at all
> whether this patch here is actually necessary, i.e., solves a problem. 

Proof of concept in the sense "I use this patch to test the concept with with the kernel unit tests and robots".

> I also don't see how replacing one lock position with another is a
> "cleanup". Sharing spinlocks is perfectly legal and will remain so, no?

Well that's the more interesting question.

On the one hand I'm now pretty sure that allowing those shared fences was a really bad idea, there is simply no valid use case for them.

On the other hand changing all the existing implementations would be tons of work with limited gain. I already tried that before and without some intermediate solution like this here it would be an enormous patch set touching all current implementations at the same time.

Regards,
Christian.

> 
> P.
> 
> 


