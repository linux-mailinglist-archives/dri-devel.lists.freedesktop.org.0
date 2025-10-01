Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CB5BBAF10F
	for <lists+dri-devel@lfdr.de>; Wed, 01 Oct 2025 06:00:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1621D10E65A;
	Wed,  1 Oct 2025 04:00:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="R5U76Kbg";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010017.outbound.protection.outlook.com [52.101.201.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BBB610E2E6;
 Wed,  1 Oct 2025 04:00:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nvgTfKLvfuE+Lmef3WQXlBOG7fDXIRjzOlMyN0trYZ33dwR+woB9ZJANIu90VCH518n1/D6DspvKCtNyKWfwoO3u1IIgpDnhrvVj4MRcEnqY4f03yfjkcl1N1owQu4aOT68uWmDgf/Dl+EXviOIsMtB1gSkrxKSn8FgNJraxJSHIn2vZSx1MmuKteJCnARzJL3bv8MSdt8tZnAoH2FlQjWwEWQbksEam+fZooPNr7E/NRTpyVH+iA361KbZt6ieFWwlqGuzso0HCcQ7tvHuzfahMcZqk73fb4jG62Xz1MfGaM7QRxk29p64x9NIF1AZw4+n7LN6WIZvwKZ4UlObaVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QKvsuKT/fP/EiLYJuonJJqKWj5maha53984BKxQHBU8=;
 b=S3NLReh4Mr0r/5ZWAL8F95zw0/AkBpHH40yJrbDOOYUzcQCS11HOmkgohwV9HcdPwaRvrGsNpM2aUYp4nRey+ssrfP8/+KNnvMNa26N04K+2AUyDxYlGl0bxQafJJQ1nijFH6KzHkxxbc1lWL7jRbD9BZ2Tm7tsj/1Qy2ZqtsRYzcm/ZEwa1iA51HTnhVixSaAsKoKsUIZgCtmenrK0q0NaUaQqCC4sQHzVVdmEtAZEl8oIk46x8eYnnlzBYiqtQTmmIlEH82m2tiKbKxCTiYMAflRJlRY4YyM8u7qE7Qcn6TsHtYzCMfuOARp+XPu1JI9Zm8/63xK8K0ENHqS0jBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QKvsuKT/fP/EiLYJuonJJqKWj5maha53984BKxQHBU8=;
 b=R5U76KbgX1WXjmq7HbOmYTif/0zt8XvijOoVhG6amj3jkhgU6MYHML4wr6E0XVyEMbOdKiHZpU4tfJjx+hBTJptlWp0A8QdHK4mIvImfSwjfnMsW8NBrDOcQ5HCmYxNTFUgfDUt0N5IIrQmk5OEF0iwJmAUEgBWie/ou2PKWg4c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7301.namprd12.prod.outlook.com (2603:10b6:510:222::12)
 by MW4PR12MB7336.namprd12.prod.outlook.com (2603:10b6:303:21a::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Wed, 1 Oct
 2025 03:59:56 +0000
Received: from PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350]) by PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350%5]) with mapi id 15.20.9160.015; Wed, 1 Oct 2025
 03:59:56 +0000
Message-ID: <f17b2883-125c-41b7-8be6-714da5597abd@amd.com>
Date: Wed, 1 Oct 2025 09:29:47 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/3] drm/buddy: Add KUnit tests for allocator
 performance under fragmentation
To: Matthew Auld <matthew.auld@intel.com>, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: alexander.deucher@amd.com, jani.nikula@linux.intel.com,
 peterz@infradead.org, samuel.pitoiset@gmail.com
References: <20250923090242.60649-1-Arunpravin.PaneerSelvam@amd.com>
 <20250923090242.60649-3-Arunpravin.PaneerSelvam@amd.com>
 <f2db7484-efd4-459a-93b2-b6097d7e86f5@intel.com>
Content-Language: en-US
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <f2db7484-efd4-459a-93b2-b6097d7e86f5@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SI2P153CA0021.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::20) To PH8PR12MB7301.namprd12.prod.outlook.com
 (2603:10b6:510:222::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7301:EE_|MW4PR12MB7336:EE_
X-MS-Office365-Filtering-Correlation-Id: aadbd58d-e6ae-4d74-e96a-08de009efbc9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OXJiK2s2ODEvN2Yva1dWL0hZUHF4NElVZnZKNkJVNmRTblhEUFp4a3RYMXBt?=
 =?utf-8?B?VGtEREJMcGRpVjZYNGk1YlRtU3lUWXZQQjJQU3BFa1Fvd2JhSDNWd1FxZDFn?=
 =?utf-8?B?YlFVOUF2Zmo2R3NnNXl0UlFTam5uZGg0OHpHeDVkZzhTMHNnSVY5MzdJSGY2?=
 =?utf-8?B?N25YOTYyNGpqeVRtRlo3b0U1ZElWZjhqS2lkNSszd2FEbEZycWl1cVJndUZC?=
 =?utf-8?B?RUJ4R203aTBxeDEyb2NHTnY0V1FNVlZkV3Q0RldvVlA5MjQzUEN6ZGZDRldv?=
 =?utf-8?B?UUJDdDJHU3dMTGdJclJwWjcvWmo4MmYvdjcrZW9DMitXV1k4U1lEZVUvZ2VS?=
 =?utf-8?B?K25xZ2Q3ODliemphSlA2aVRtODJNZFZicTczQ3FMTkloWUV2bE1NMTRGUFhx?=
 =?utf-8?B?aFpxRlVqdHQ3MGVjSmNCeUpzQmhUNXdReXBQVjlQOXY3KzNLSVNXTEJPV2k2?=
 =?utf-8?B?cU1ORjh4cHNtMEZlZHJuQi9hRUp6NHJ6ck5hb3BRRi9nUFQrZTE2L2VwMTVa?=
 =?utf-8?B?VE5XT05xM2t0bjUvMFhoRTdSSVBEc01PL0kyZWdrVnczc011TlBjYnJzVCtD?=
 =?utf-8?B?MnJ6SXc4UGJmRUJHb0JQOFFYZ2NvZ1ZMc1BBTjNWM0s5amtBWU41MVZsZEJI?=
 =?utf-8?B?bllVK1ZjQnFJRG5MazA0citwWTN4dm5YVkllTHpRWnY2clJpL1lxd1ErNHRM?=
 =?utf-8?B?eWljSjI0WUxHbnhNclRIcWVhSG8xVHMveXQ4L05xL2NXYUFhSzk4TTVKZ2Mx?=
 =?utf-8?B?a25mem1IUEJVdnlOeE9KN0NKYmhKS3l5dTVoa0F0V2FQUCtuQ2NXN0ZHRTMv?=
 =?utf-8?B?TFhiMk5MSXFFbUhHOWF5L1lBbmNBc0RCa2NWZXJlc3lneUEyeVRaK2JpZmIy?=
 =?utf-8?B?Ylg2dldHSDRVaDlxTC9SS2V2aTBGbDFkVlN0c2xrOTk3TTBxUlhYVzJCZ1RT?=
 =?utf-8?B?d0hCOEV3NVRSNVBrVW1uZjlrTG44RlZMc3h6R2ZPbStJbmhCYTgwck1LWGtM?=
 =?utf-8?B?WmJPaXVnM3B4UXgwWWVFYUpiZWtXbUdFTTdYSW1sM1BHcnF5NUljNkpCdTg4?=
 =?utf-8?B?YTB5OFFuRkwrMWJURFdaODVTY202NWtKU1c0V2luUEZLVE5EbDRCMEJkTzV1?=
 =?utf-8?B?MjhIQmJVWSsrZTRPck40amxhWVAzdzJnQXdPaEp4WmNJZjN3WXZUbmkrTEhF?=
 =?utf-8?B?b3BBMzV6dXVTOEVXQzIra01XVThUYzQ0SHEyTjZMSUQxTEcvZ1huY0JMRC9D?=
 =?utf-8?B?NVdjMEd5TjQySEdLZkU3R0RSb3V2RUY1ckFYSGZzZVRhUllhU0tnZWJpUC81?=
 =?utf-8?B?bW90SnB4VDVGemQ2M2lveDdJUTFUVm9wcnRhNnNocVkwVzJJMUI2aFoyVEhp?=
 =?utf-8?B?dWxDdllILytSeDcyTVlxcXhEVXp6MG1tdFkzdXNpdVQyQU5JQ2Y3R091MEpx?=
 =?utf-8?B?ZGNsUnYwdGg0MVVBeHo2OUJNWFBVb2hwVXp4Z2E1YlAzblpvOWVndjNzMmJ2?=
 =?utf-8?B?R3VPOHNXMGNmNUJiVXV6OStZZytkMk1pQmpaKzRBOFVET3d2bXJHQjhaZkdT?=
 =?utf-8?B?L2FJUktmcGtVdThtQWxCWlowSlZETnk2aklkU3A1ZDNyWU90d3FOazM4eGFu?=
 =?utf-8?B?RXNSRlhad2Nib1F5S0R2bUw5ZmI4WHJ0VWg1cXVtMlhYYkkwME5COUF5Mjlk?=
 =?utf-8?B?cWVLQ1k0RmdMVS8xZ1R2UHNTQkpQSkhMZGZIcW14aEtrM3B0dGJPRlJLdTJa?=
 =?utf-8?B?K3czS0t0clNvc3RvQ1l0WmR0cmxqM0ZyeUhpS29yRkt3ZGNiMzVxdkhNY2xp?=
 =?utf-8?B?cklveWJwYWUrcWlUUWFiWW9LN2VMUFdEMmtkTWRXWlYvWm44bytOSUhVcnVK?=
 =?utf-8?B?K3N5K2lXWjlDd3lwWDA2Ri8zZ0ttSERHczM2U2dtbnExWEdUQjR4QUsxdXgy?=
 =?utf-8?Q?3Vk+vxXB2PtBeVr9WS+q6vCUJnPGAQEF?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7301.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?M3hCNkxQQ29BckNFZDE2VGJHeFNxdjRER3cyOHM3eEVYaXg0b0lQTDRhZlhl?=
 =?utf-8?B?Ynhhajd5MjB3bVMxMjVlVlYwVlMyRFFuYlE1aTEyRHNvdHkrQXBTR1FXbkla?=
 =?utf-8?B?RURJMzVJaVVIY204c2dyYnh1NlJoNTNJNzZWakFCcVJMcUsvbGozYXRlNjdS?=
 =?utf-8?B?TE56RFAzUXIwVDdmS2svSzV2dVBDYTVmRldZMmcySXpEQ0dGb1ZuclF6WmpK?=
 =?utf-8?B?NmxTNzJXQ3cyWkVQOHVWTDJSUTdnZS9DbGFQaFdaYUQ5TnFqdjN1anVoUmM1?=
 =?utf-8?B?ZzZOS3g2Tnp1Z0wwei9wc3VNa1VjUGN2ZnA4WkpPejAzNlZ1VisvRStoVlN5?=
 =?utf-8?B?Z0RSajlEM1RpWE9nZjdqQzkzK2l3RjM0NjlTZUt0S1B4cVQvaTAzd1VpTzhI?=
 =?utf-8?B?YnpoVnVVRU9IRVIveG9lSzNoOFF2ODZ3MFZHZ0xNVXlxUUw2WWhadXpxWVpu?=
 =?utf-8?B?QWNqbkt0YWhqVHNlc3hsSVBVMm9zTk1rQWF6NGJ6eGF6Z2VhcWVBaDJVSlk3?=
 =?utf-8?B?aytmOWF2aXZtZjRFN1VZTmlEU1A5S1RJdmUyUmg2YzZVSXpGZFU2d2xiQ21t?=
 =?utf-8?B?cGV4bW52NHVMbEF3VitCTXVpVFhONmF5aG45cWpYcEFNRGFQS3AzRFg5R2dm?=
 =?utf-8?B?MDNTUXhnWHI0dnAwQmZra09qaGFjRm5neEtWRVRBT0FxUGN2SzllQWVwUFBO?=
 =?utf-8?B?U2N0Q0pnQTNmRmZOVUE0eVg3SmlSYWdoS1VyUXlMVDE4Y0Z1SFFPSGZBZDQz?=
 =?utf-8?B?Z2RwVExXWUpGYTY1UjNkMVFjSEpRRm9RNW10R2xOUXpxQUVUR0pFcWNzbC9B?=
 =?utf-8?B?L2MyK2hSK3hXOStHY3k4Nlc1MTB4M3BacXZqWkhYOWZDaHB4eDlJYm9XN3Bm?=
 =?utf-8?B?azVtdTJ5bDJvb2M3TlI1dlYxSXZPSjFIa0ZidjUrNmhnZ1FaQ2VtbGkvMHdS?=
 =?utf-8?B?cXRldDMzQjdCQzd5bzZtYTRaZU16Wk5idGRrU0ttdy8zTGZVNGhucjA0bmF4?=
 =?utf-8?B?SlRieFlGN25mM3RrSXN2cllDeHpjM3U2N2xDY1pSMEdsVEhnalNlTlkrMnkx?=
 =?utf-8?B?TVFrcUwwTnBtVDVRL1VCQmpycVZpTldBdkhOTVVKREtxMkpkZUZhdUMvdTdV?=
 =?utf-8?B?VzRVWGRrOHZueCtVK1VVQkExS25YajBYWGNYdkxTNGFhTm1MWlZ6a1dRWndm?=
 =?utf-8?B?eVU2ODJPWUJCQ2JTbEQyZVh1YWNDMEo4TkNGUFZDajlyd1NYWFFqNkVnTXJl?=
 =?utf-8?B?OEQ0bjNWN2dJd1JCdzgxUE5SMXZFK1FTTytVNE1KN0RhaWFYWVN5ZXFNallK?=
 =?utf-8?B?T05EVC9xZDVKdjh0bGtnd05HYWFnbU0wM0ZGZ2RKNnVMYXdhck5FdlpOOG13?=
 =?utf-8?B?TXQyeUhUNEhrQ01QRW5GblVFMzZrQVIzNy9aUnQ1ZEQ1QzlaSjNwV2Q0S3Z5?=
 =?utf-8?B?ekNBckFBZnVRK3d0cXVMRGMwa280T1pZSkdqQXFCU0pRL1JlVnZkNXFreFV4?=
 =?utf-8?B?NTZMTHRNNVpjUWUwam9hbGo1ZDdDSk0xYWNpbU9vTXQ1ODBPbzlsblh2djFx?=
 =?utf-8?B?MXpTbStCb0pmNHJwdk9PdkNTWUVmQ240UHZoeTdaRDRPWDZONFJTUmZPLzZy?=
 =?utf-8?B?MTU1Y2tIQjR5TWZCaUhWNVk2VzJ2dEVUU1VMUkc1UDU5emxJS0dwRC80ejJr?=
 =?utf-8?B?Wjd1TTVMS0tOblRWR281OVJ4N0VCQ3NKOEJUSTdHbkxKZ1FCb2xNTUt1YzhT?=
 =?utf-8?B?KzRCcG5BSTg3M2sxRHdqSWhXQnNPcmFNM0hUbmU2WWRVblZ2TlUwcDdGbjZP?=
 =?utf-8?B?Ry9kK2pNQ2NKcDQ5dWlSbWVZTlU3ZXFOTGhWcWQ0VWQxbFBmVGJVR3NITCt4?=
 =?utf-8?B?eXVyMHV5TWJUeU5BZnA5Ylh3YmRlUlRpQnhvZFpGNkk4d080MlpaMFpKbXBH?=
 =?utf-8?B?YUpVazd0Vi9mNWg0Q1FzampiUllmNHJFR3FYYXlUenhRT3E4WU5uTzJWb254?=
 =?utf-8?B?RXFYd0hYMm15T2pvS25mdExhazRJLytHWWd0VjBnOHVsbXBGdlF4VllDeFVH?=
 =?utf-8?B?N05Na1E2c20yV0IvN3pNQjdHWWJOYnNadTJFdmsrSW5XajhDUHB3OEFlMk9U?=
 =?utf-8?Q?0cX7mOItyLVsckcjzr1LPK8KO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aadbd58d-e6ae-4d74-e96a-08de009efbc9
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7301.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2025 03:59:56.5653 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8/n7Mj85r4jym7ZBbESfvHA5cX75QoqhQY29xRNGkYewjyIPqeRNvxzslfMUyOTMNzjQACZFfs5YXq3RXmN4Qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7336
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



On 9/26/2025 4:30 PM, Matthew Auld wrote:
> On 23/09/2025 10:02, Arunpravin Paneer Selvam wrote:
>> Add KUnit test cases that create severe memory fragmentation and
>> measure allocation/free performance.
>>
>> The tests simulate two scenarios -
>>
>> 1. Allocation under severe fragmentation
>>     - Allocate the entire 4 GiB space as 8 KiB blocks with 64 KiB 
>> alignment,
>>       split them into two groups and free with mixed flags to block 
>> coalescing.
>>     - Repeatedly allocate and free 64 KiB blocks while timing the loop.
>>     - Freelist runtime: 76475 ms(76.5 seconds), soft-lockup triggered.
>>       RB-tree runtime: 186 ms.
>>
>> 2. Reverse free order under fragmentation
>>     - Create a similarly fragmented space, free half the blocks, reverse
>>       the order of the remainder, and release them with the cleared 
>> flag.
>>     - Freelist runtime: 85620 ms(85.6 seconds).
>>       RB-tree runtime: 114 ms.
>>
>> Signed-off-by: Arunpravin Paneer Selvam 
>> <Arunpravin.PaneerSelvam@amd.com>
>> ---
>>   drivers/gpu/drm/tests/drm_buddy_test.c | 110 +++++++++++++++++++++++++
>>   1 file changed, 110 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c 
>> b/drivers/gpu/drm/tests/drm_buddy_test.c
>> index 7a0e523651f0..19b49fb6ec19 100644
>> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
>> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
>> @@ -21,6 +21,115 @@ static inline u64 get_size(int order, u64 
>> chunk_size)
>>       return (1 << order) * chunk_size;
>>   }
>>   +static void drm_test_buddy_fragmentation_performance(struct kunit 
>> *test)
>> +{
>> +    const unsigned long max_acceptable_time_ms = 1000;
>> +    struct drm_buddy_block *block, *tmp;
>> +    int num_blocks, i, ret, count = 0;
>> +    LIST_HEAD(allocated_blocks);
>> +    unsigned long elapsed_ms;
>> +    LIST_HEAD(reverse_list);
>> +    LIST_HEAD(test_blocks);
>> +    LIST_HEAD(clear_list);
>> +    LIST_HEAD(dirty_list);
>> +    LIST_HEAD(free_list);
>> +    struct drm_buddy mm;
>> +    u64 mm_size = SZ_4G;
>> +    ktime_t start, end;
>> +
>> +    /*
>> +     * Allocation under severe fragmentation
>> +     *
>> +     * Create severe fragmentation by allocating the entire 4 GiB 
>> address space
>> +     * as tiny 8 KiB blocks but forcing a 64 KiB alignment. The 
>> resulting pattern
>> +     * leaves many scattered holes. Split the allocations into two 
>> groups and
>> +     * return them with different flags to block coalescing, then 
>> repeatedly
>> +     * allocate and free 64 KiB blocks while timing the loop. This 
>> stresses how
>> +     * quickly the allocator can satisfy larger, aligned requests 
>> from a pool of
>> +     * highly fragmented space.
>> +     */
>> +    KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_init(&mm, mm_size, SZ_4K),
>> +                   "buddy_init failed\n");
>> +
>> +    num_blocks = mm_size / SZ_64K;
>> +
>> +    start = ktime_get();
>> +    /* Allocate with maximum fragmentation - 8K blocks with 64K 
>> alignment */
>> +    for (i = 0; i < num_blocks; i++)
>> +        KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, 
>> mm_size, SZ_8K, SZ_64K,
>> +                                    &allocated_blocks, 0),
>> +                    "buddy_alloc hit an error size=%u\n", SZ_8K);
>> +
>> +    list_for_each_entry_safe(block, tmp, &allocated_blocks, link) {
>> +        if (count % 4 == 0 || count % 4 == 3)
>> +            list_move_tail(&block->link, &clear_list);
>> +        else
>> +            list_move_tail(&block->link, &dirty_list);
>> +        count++;
>> +    }
>> +
>> +    /* Free with different flags to ensure no coalescing */
>> +    drm_buddy_free_list(&mm, &clear_list, DRM_BUDDY_CLEARED);
>> +    drm_buddy_free_list(&mm, &dirty_list, 0);
>> +
>> +    for (i = 0; i < num_blocks; i++)
>> +        KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, 
>> mm_size, SZ_64K, SZ_64K,
>> +                                    &test_blocks, 0),
>> +                    "buddy_alloc hit an error size=%u\n", SZ_64K);
>> +    drm_buddy_free_list(&mm, &test_blocks, 0);
>> +
>> +    end = ktime_get();
>> +    elapsed_ms = ktime_to_ms(ktime_sub(end, start));
>> +    /* Performance validation */
>> +    KUNIT_EXPECT_LT_MSG(test, elapsed_ms, max_acceptable_time_ms,
>> +                "Fragmented allocation took %lu ms (max acceptable: 
>> %lu ms)",
>> +                elapsed_ms, max_acceptable_time_ms);
>> +    drm_buddy_fini(&mm);
>> +
>> +    /*
>> +     * Reverse free order under fragmentation
>> +     *
>> +     * Construct a fragmented 4 GiB space by allocating every 8 KiB 
>> block with
>> +     * 64 KiB alignment, creating a dense scatter of small regions. 
>> Half of the
>> +     * blocks are selectively freed to form sparse gaps, while the 
>> remaining
>> +     * allocations are preserved, reordered in reverse, and released 
>> back with
>> +     * the cleared flag. This models a pathological reverse-ordered 
>> free pattern
>> +     * and measures how quickly the allocator can merge and reclaim 
>> space when
>> +     * deallocation occurs in the opposite order of allocation, 
>> exposing the
>> +     * cost difference between a linear freelist scan and an ordered 
>> tree lookup.
>> +     */
>> +    ret = drm_buddy_init(&mm, mm_size, SZ_4K);
>> +    KUNIT_ASSERT_EQ(test, ret, 0);
>> +
>> +    start = ktime_get();
>> +    /* Allocate maximum fragmentation */
>> +    for (i = 0; i < num_blocks; i++)
>> +        KUNIT_ASSERT_FALSE_MSG(test, drm_buddy_alloc_blocks(&mm, 0, 
>> mm_size, SZ_8K, SZ_64K,
>> +                                    &allocated_blocks, 0),
>> +                    "buddy_alloc hit an error size=%u\n", SZ_8K);
>> +
>> +    list_for_each_entry_safe(block, tmp, &allocated_blocks, link) {
>> +        if (count % 2 == 0)
>> +            list_move_tail(&block->link, &free_list);
>> +        count++;
>> +    }
>> +    drm_buddy_free_list(&mm, &free_list, DRM_BUDDY_CLEARED);
>> +
>> +    list_for_each_entry_safe_reverse(block, tmp, &allocated_blocks, 
>> link)
>> +        list_move(&block->link, &reverse_list);
>> +    drm_buddy_free_list(&mm, &reverse_list, DRM_BUDDY_CLEARED);
>> +
>> +    end = ktime_get();
>> +    elapsed_ms = ktime_to_ms(ktime_sub(end, start));
>> +
>> +    /* Performance validation */
>> +    KUNIT_EXPECT_LT_MSG(test, elapsed_ms, max_acceptable_time_ms,
>> +                "Reverse-ordered free took %lu ms (max acceptable: 
>> %lu ms)",
>> +                elapsed_ms, max_acceptable_time_ms);
>
> Sorry for the delay. We are pretty sure these time asserts are not 
> going to be flaky over many thousands of runs across different types 
> of machines (maybe some underpowered atom)?
yes, correct. I have updated the performance test to avoid the hard 
coded timing thresholds. And the test now measures and reports execution 
time instead of enforcing a 1000ms limit,
since run times vary across machines. This ensures the test remains 
portable and stable, while still exposing the performance data for 
regression tracking.

Regards,
Arun.
>
> Assuming not a concern,
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>
>> +
>> +    drm_buddy_fini(&mm);
>> +}
>> +
>>   static void drm_test_buddy_alloc_range_bias(struct kunit *test)
>>   {
>>       u32 mm_size, size, ps, bias_size, bias_start, bias_end, bias_rem;
>> @@ -772,6 +881,7 @@ static struct kunit_case drm_buddy_tests[] = {
>>       KUNIT_CASE(drm_test_buddy_alloc_contiguous),
>>       KUNIT_CASE(drm_test_buddy_alloc_clear),
>>       KUNIT_CASE(drm_test_buddy_alloc_range_bias),
>> +    KUNIT_CASE(drm_test_buddy_fragmentation_performance),
>>       {}
>>   };
>

