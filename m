Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E478BB8B32
	for <lists+dri-devel@lfdr.de>; Sat, 04 Oct 2025 10:31:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F170010E0E6;
	Sat,  4 Oct 2025 08:31:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="z8PQHtBi";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010018.outbound.protection.outlook.com
 [52.101.193.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8E6A10E02C;
 Sat,  4 Oct 2025 08:31:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=up4jFDMlr580ddVIbduVrpG2+T53eU6JTgfRL02wGbW1NA3J1+AI8x1PfpkDoxs1Z+sebmeKVedTeej8xiLAQk4jozy5QVojVBcrnNbLicdO7SGUj0WtC9tMQ3Qfsh9G2W3TSAXTitkzb/SVQLOlKEqeRyFFwf07JnhKTQTsgAhgwlCFaKQxcqLIm43TSUeleSfYQZm7hCV19cmKKAushfX6bKtJ1EzUCyzKyYx5m/h+fILe7djjZVtSikfALTMM5BlqiPQTorvDX2NP6tas/YYB8MFr/12Z2JRFVPXVyM3TMkNBV3B01NkcgpI7Vu2O4AkGUW3ONVsp5VSaUpz0Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JTHxjXpg4zxk+SvUrjJ9W9C1kh1rcydCz1gW9VCqwcA=;
 b=ZFZCoA1cF20AJeYgc0v6M+oe6Za731vBTIpPLTmIcMGls3HU9FmtBxQOX5f27iiQ0U5Hrxs+V8mW1bmsEspRAMYYjqB4+EsZVYpmS7MVHYj82rj8AlbJiIyA8Jo9CvPeY01UJfr6dpyKhjZLoYi6fhdYsZ9wncwcOJkE2hiFf6oL4dTmAuG8jpEKFs+KMX4TZptyCBt8Yrsj4H5ci04FutP9qQsWwZMt6HK3VnQe8cC8WGPhEzaavIqAOYBe4aOq0NhyTYps/VKO1vZVREJV76T7tM5rm9o9Gv41TwSFqhPvqyEuHZMjDBTZuCHfYuo+uJxdhNWdUcy+30zSlHq8Eg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JTHxjXpg4zxk+SvUrjJ9W9C1kh1rcydCz1gW9VCqwcA=;
 b=z8PQHtBi7aSvH0F9mt3QSlUpYGqKFR3MMEqZU1RODDLaioVWxkzQpej99wMVsvnrQdAq5IL7Bg71Q6HJGCBsbml6QRUgCCzXe9Rx5xywJfVv7ze1VbHN1EJ72kkdre4XZsdz3PLh1CG8jCrXSyNwUzRMj6kbwM+8OV6TkayxG/c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH8PR12MB7301.namprd12.prod.outlook.com (2603:10b6:510:222::12)
 by MW4PR12MB6849.namprd12.prod.outlook.com (2603:10b6:303:20d::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Sat, 4 Oct
 2025 08:30:59 +0000
Received: from PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350]) by PH8PR12MB7301.namprd12.prod.outlook.com
 ([fe80::a929:e8eb:ef22:6350%5]) with mapi id 15.20.9182.017; Sat, 4 Oct 2025
 08:30:59 +0000
Message-ID: <309348d2-80a5-46ed-999f-80a113adad23@amd.com>
Date: Sat, 4 Oct 2025 14:00:49 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/3] drm/buddy: Separate clear and dirty free block
 trees
To: Matthew Auld <matthew.auld@intel.com>, christian.koenig@amd.com,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org
Cc: alexander.deucher@amd.com, jani.nikula@linux.intel.com,
 peterz@infradead.org, samuel.pitoiset@gmail.com, stable@vger.kernel.org
References: <20250923090242.60649-1-Arunpravin.PaneerSelvam@amd.com>
 <20250923090242.60649-2-Arunpravin.PaneerSelvam@amd.com>
 <c1936b9c-3c0c-4a33-84e8-574d67790265@intel.com>
Content-Language: en-US
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <c1936b9c-3c0c-4a33-84e8-574d67790265@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0189.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:be::11) To PH8PR12MB7301.namprd12.prod.outlook.com
 (2603:10b6:510:222::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR12MB7301:EE_|MW4PR12MB6849:EE_
X-MS-Office365-Filtering-Correlation-Id: 15dc3fb9-98be-4efc-bba5-08de03205859
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RmVCTG82K2dJc1kyd0tJVU5iZkdvQ3ZNNXlSRFFUNExod1g5R3hnMUlqMGp1?=
 =?utf-8?B?QkZLY1RkaVhucnB3Q2R6M05NQlkzMlkzNHhvWFdWK1JwMFFXMmVpZEhPM3FT?=
 =?utf-8?B?TlV5YWZPcHlMbXVhQTIxbGNncUM0NXptbklGTVBFV0pUaGRRVE5qam56V3dl?=
 =?utf-8?B?RDE3a3QraU1UWk9UUGw3Qnh6ek1ObFJpWmxyaFc5b2gzSENlMFkvSUtkellU?=
 =?utf-8?B?U1Vyam9uM3V4NDg4ekxUQzQ5eHh6SnVLS3NIaWxtQUxwQ3M4KzBXUC9wNW5k?=
 =?utf-8?B?YWlKSmU0UnlPbW1ZRTFETjJrT21FOHpNTmFERDVHWHRmYnkxcmE2UGpjdEpR?=
 =?utf-8?B?RXFGbVBMY1pQbUtFNDVkSUdMZEFWQWM0eDRzYUVyS241UWRERkg0YXVuWDBZ?=
 =?utf-8?B?eW1KVTVYZTdxRkhkVDBQU21EY1NPeFR6VUlpZDNUSzR6NGdka1NkME1iUEp1?=
 =?utf-8?B?dHNTUkRRTDA4aTc5VXcyakRhRjJ2eTJxMU9vT1dQamhXbEt6dU9nR2ErU2VP?=
 =?utf-8?B?R0R6anRyZENhcjV1Rk11dlE0WHRxUXZ1MXYvOVpDOUxZVHBla3lVN1orUXJm?=
 =?utf-8?B?ejF5YURsY3Y1WnVuSGZoVGlhOWFIMVpHUk1ReE9sK2oxQllObjZPSjRtKzRr?=
 =?utf-8?B?akZQbUpNTzJaQnZOYmg5TnZQZDUwUnllSk1aWVRQSzRQZFNJTzB1WnRhVy8x?=
 =?utf-8?B?Q2tWQ0FGNXFzWE9RRFFYUk9XVm5Dem9CeXRYNTlyK2IzK2JXVmNKd0g1RmdW?=
 =?utf-8?B?MkFOT0FENzdYN1FpbS9oVXJJN0M2TjdWdzlqZHpQNTJCbU9HN2l6Zmp5VnR5?=
 =?utf-8?B?b0twYWdRL3AyNXlnSmdMZnV5UEZyMzA4ZU5wMExjcDJIRVpBbjZRY3daTTJ0?=
 =?utf-8?B?K09pbEtZL2VSWW9KdmI5MVNWakRqRzQ2SHVLeGJFYUhML0tLQ1BSVU1TSVp2?=
 =?utf-8?B?Q3MwY1JDTXRSaDdka2lsSDczcG1TdkRNcU9EV0psbmtSYnpHMlo1VGwzL21v?=
 =?utf-8?B?ZFd3WThieGJLenBxNEtpdzMxS1JNOG8rUUFuK1dNTEN3NmVVaFBjd1pMRVIv?=
 =?utf-8?B?OUowajZ1WHRIMG1UNkt2M0tJRVJNTUhYcU1DdUFJZStSK1N5KzlBbDRNd2c3?=
 =?utf-8?B?NWtFVnJPa2NaRU1PMzZPY1JRR0t1Z1d0MFpCKzVUVFdMamhRdHVpY0Fzb1Ny?=
 =?utf-8?B?STRTM09lT0xlaGZuZXdUNjRoU1RtRnEvNy9yNHV5OWU5SVNBeXRhZFNOREs0?=
 =?utf-8?B?bDdiRW5zSmVTbVdGT1JRazFVMGQyd3dyY2ZFUWRNeXdDQmk5YmlabytUUFNC?=
 =?utf-8?B?dWcwTFpSQUNYSldxUFNzYW5mejlZdHJnY2xQeGJFdnJOd2I3YTVYMnV1bThv?=
 =?utf-8?B?S3ZVVDNVNWhIU1VpVHdGa0ttUjNzeFBVNmZQWUVEenYwVXMydDEyY2twYmQv?=
 =?utf-8?B?OXFTQ1ZnR0o5aWNybGltK1g1ZHNickpIdzFjU2YwcTBVR1kwSldkbU0zRUEv?=
 =?utf-8?B?bjU5WHpqenNoN2llL1NvY1BtQ2wzR0FCYVBJOE5sbk9vQTRWRTUzT3gzMDgy?=
 =?utf-8?B?TUpYT2xqTStFNFlqVGdJa2gweHZaS2hsa0Z5dEtuS3RvNTNYZ1ZNMDVQKy96?=
 =?utf-8?B?Q0RVRE4vRFNHNjFnWDFES0RkdXIxYjNlMWpxMFhWNTAxTW04MGZ0VDJvOXlG?=
 =?utf-8?B?ZVg0Z1N3TmpiZUJpS096eStzeHdsb3lwV1hhM3ZzeG96Z1JJMjZaOHpXWWhm?=
 =?utf-8?B?MmN3Q2E2WDkyMXlKcXBhNGRqZ1pFZzlvRW5kNURZRUFVbG1ObldFQ0FYWWkx?=
 =?utf-8?B?MVY0MUVsNjZDU3FuQy9Ebi9NT01JeVdjZnErWDV4Y3lCbkt3YTkzNm9hc3JI?=
 =?utf-8?B?SGx0a0Y2ZHEwR0hwMFVXWTBHUC9OSEpDRnlMVkNCblpoT1dncWJoV0pCZG5X?=
 =?utf-8?Q?ie76DMWZ3gYLzr3NtAlxetEp4AiHd/dq?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR12MB7301.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnJHNDRXRmNqNUdNVHdTdlFMb2RkSlVoVnZzMXNrNXA0QVhwcDNLWHBVZkth?=
 =?utf-8?B?R3UrOWpVNnRYaTZPN09pZnVJQXl4QkJuQUx1SWhBWlJjdnlMYXgvaTVmb3Q2?=
 =?utf-8?B?aVFnUFErZHZjL05zV0xPTlZoa1U5NzU0eHRPWnhZMkpwL3BRZlZ2aDhJMk9j?=
 =?utf-8?B?QmpKTUovY1dxZ2oySXlvUmVPNTJDUFY3S0k4V3FQMDRjc2szUmZQMWNESGN3?=
 =?utf-8?B?UVdZMXNNVjFBRlFRSTFZWWxZWnpxOG0wMTlQOXRQNUE3TmFpYUhFUm1GQ1pM?=
 =?utf-8?B?TWgzVERyMDZIa2p2S1c2dG5UVlVNMzNaeGxSZjhDbjJ5eE5taU1HTTJ6dDBv?=
 =?utf-8?B?TUZ3Q09JNnl1RHdCN1FjZlA3Y2JMUFpGRi91Mld4c0c1M2xJRFJ5WU0vVU4r?=
 =?utf-8?B?blllZFk4S0lIR2ZvazduamcwRElHV1J4eHRiM2pySFBBVVJjVGxNaWtzWFJN?=
 =?utf-8?B?MldTcEhZYjdGWkgvaUF4Z2NLdzk0c01UUmZlNGJlcDdUWFo3UENYQk9tcEUz?=
 =?utf-8?B?Y2xzOGIxSDA3WjNZU1lzWGNLMzFxT2w0OHpiZVZ6N1h2R2dKd0hDV3A3eGJH?=
 =?utf-8?B?dFpJNzMxSUFocWx1R3JSSkdoSkZSc1BNY0Nuck16aStqMGlLYXZtV1NWaDd6?=
 =?utf-8?B?eXUrMW5hR0MrRC9NR1RNOTN6VlFvVFFhMHh3WlJINTlvcm94SDhqd080YTVJ?=
 =?utf-8?B?V2N4T0RKMStORnY5bmxqQjMwbkIreVJrL2d2UnlRNVZNUm4xQXVucThvem1i?=
 =?utf-8?B?Zmh5L002dThkN2x3dm1kMnNCUFEwU3h4OG9PTFpVTmpPb2lZZGYwcytySDdi?=
 =?utf-8?B?b3EwcncwY2tnVDJqUFRkd1diQTU5YnRsUC91Q0dLa1lFRGN2YmlBdGRwMDd5?=
 =?utf-8?B?dVY1ZHhhM3BEVUdtM2hQbDFNOFppeUo2NHVPTEp2NVFWaHJtYVY1Ui9UQkZE?=
 =?utf-8?B?a3FEN3Y4WTZKWjIwanhnbCtFTlRlZGxQNmdFZEdhM1VmNVZyL2ZvS2RWdTVD?=
 =?utf-8?B?U1NHSTFZT05ZR2VkRTl3R0tMZlJ6WTVlWEd1dGt5RUhPOExqdzFhSkYwUmFp?=
 =?utf-8?B?cTk2c2I0NHZoQ1IyUEYyTHBORzMzekpCVXh6SXNxWjVidjFreEJNTHQrWWZ6?=
 =?utf-8?B?NVk0anJ1WHd1MnJFdGJIbVpTdnJPOHhvcVhlSnI4ckpYNzM0M2ZNbFgxWTN0?=
 =?utf-8?B?b2FCd1NxcjhzVHZOSmErU1FrVnlzSU9aeGU3a3BsWHA3L0lMd1Jad1pXdHBz?=
 =?utf-8?B?bzh4ODVTNm5TUmllTUJyQXI5Y1AxWGpoNWFPbkQxWmNxMk1MZEc3Y21ManU0?=
 =?utf-8?B?R1Bib0xCQjhlSGw3a1pYdnB4Y0grVHRQNU1kdjRSVUcrY3p4OUEvL2x2aE1p?=
 =?utf-8?B?aENkNXpLZVVCK1RuZWJyR21IT1JHMnRoQ2RXSUtMcy9EVTNwQ2gvTEpKSDZz?=
 =?utf-8?B?QW1jd3M2T2J5VStxVXFmMkVSb25pd2ZIQ0ZHL0NRZE4xekN3RCtFQkVjYTIx?=
 =?utf-8?B?dHBMdE0wYnM5ZUhML0c4ZENoc0NqNjZheEc3UHQvaUE0bXd1SUY3Mll3bUEr?=
 =?utf-8?B?cnRzQnB0ZXpzWTV2TDZVcEV3OWNxSHpwc1hEYlJTWnVvUHBlTGtQNEpDbTRC?=
 =?utf-8?B?eVU1QmM3dyt5UTNPM2djcFVCbFJCMnZKZEcwTy9TbXJzaDhRcFN5NTZWcW9o?=
 =?utf-8?B?amxMQ3lYbTlkS3pFbm96WVZvTUwxRU9pRUdnMk5JMU1SZWhEWllmQTVNcDFR?=
 =?utf-8?B?YmdTS05IalVTejhUVEtOWURHU3V4bml1RHlneHpXcTNyM3RpcG5oTEJ3ZEdH?=
 =?utf-8?B?SElOYTFEaDJYckJsZlVqK3BVUERtZkhqVHRKL2Z3b3RpV1pqcTdlMXpjbHA5?=
 =?utf-8?B?dVBuM2hOU1hUS1JZbWFzMVdZZnNiSStYblBqQ3kvNVl0WG5GK3prcURraEFk?=
 =?utf-8?B?ZzR0bjkrTlN0TTVqVW5JVzJKYjBoOC9tL3lzV055YmJhbkJBSGtuZE9sRkgy?=
 =?utf-8?B?aTQ5M1pMZUJ3OFNyLzNDV1lvcDBvV3gzM29OQ3pwYnIwcTdkY0VYd0o5dE1P?=
 =?utf-8?B?b2Q0TG03VFJvUkUxQk5sSm1RNDBwV0pNdU1YVlU3MTNvbFhieGowcUY2ZVR6?=
 =?utf-8?Q?kvBIy7EOcfBhztGEQm7CgFGen?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 15dc3fb9-98be-4efc-bba5-08de03205859
X-MS-Exchange-CrossTenant-AuthSource: PH8PR12MB7301.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Oct 2025 08:30:59.4456 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4dKPAslJ0Vm04/AECTCPPhYs6eH3r0yig5mPm7goOplR1ZY1iyswYMeBtNzRmOVNMN3YbR0lIMTuliqD7w1W/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6849
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

Hi Matthew,

On 9/26/2025 10:38 PM, Matthew Auld wrote:
> On 23/09/2025 10:02, Arunpravin Paneer Selvam wrote:
>> Maintain two separate RB trees per order - one for clear (zeroed) blocks
>> and another for dirty (uncleared) blocks. This separation improves
>> code clarity and makes it more obvious which tree is being searched
>> during allocation. It also improves scalability and efficiency when
>> searching for a specific type of block, avoiding unnecessary checks
>> and making the allocator more predictable under fragmentation.
>>
>> The changes have been validated using the existing drm_buddy_test
>> KUnit test cases, along with selected graphics workloads,
>> to ensure correctness and avoid regressions.
>>
>> v2: Missed adding the suggested-by tag. Added it in v2.
>>
>> v3(Matthew):
>>    - Remove the double underscores from the internal functions.
>>    - Rename the internal functions to have less generic names.
>>    - Fix the error handling code.
>>    - Pass tree argument for the tree macro.
>>    - Use the existing dirty/free bit instead of new tree field.
>>    - Make free_trees[] instead of clear_tree and dirty_tree for
>>      more cleaner approach.
>>
>> v4:
>>    - A bug was reported by Intel CI and it is fixed by
>>      Matthew Auld.
>>    - Replace the get_root function with
>>      &mm->free_trees[tree][order] (Matthew)
>>    - Remove the unnecessary rbtree_is_empty() check (Matthew)
>>    - Remove the unnecessary get_tree_for_flags() function.
>>    - Rename get_tree_for_block() name with get_block_tree() for more
>>      clarity.
>>
>> v5(Jani Nikula):
>>    - Don't use static inline in .c files.
>>    - enum free_tree and enumerator names are quite generic for a header
>>      and usage and the whole enum should be an implementation detail.
>>
>> v6:
>>    - Rewrite the __force_merge() function using the rb_last() and 
>> rb_prev().
>>
>> Cc: stable@vger.kernel.org
>> Fixes: a68c7eaa7a8f ("drm/amdgpu: Enable clear page functionality")
>> Signed-off-by: Arunpravin Paneer Selvam 
>> <Arunpravin.PaneerSelvam@amd.com>
>> Suggested-by: Matthew Auld <matthew.auld@intel.com>
>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4260
>> ---
>>   drivers/gpu/drm/drm_buddy.c | 321 ++++++++++++++++++++----------------
>>   include/drm/drm_buddy.h     |   2 +-
>>   2 files changed, 182 insertions(+), 141 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>> index 67aa67229cc3..6e12a0b5d5e3 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
>> @@ -12,9 +12,16 @@
>>     #include <drm/drm_buddy.h>
>>   +enum drm_buddy_free_tree {
>> +    DRM_BUDDY_CLEAR_TREE = 0,
>> +    DRM_BUDDY_DIRTY_TREE,
>> +    DRM_BUDDY_MAX_FREE_TREES,
>> +};
>> +
>>   static struct kmem_cache *slab_blocks;
>>   -#define rbtree_get_free_block(node) rb_entry((node), struct 
>> drm_buddy_block, rb)
>> +#define for_each_free_tree(tree) \
>> +    for ((tree) = 0; (tree) < DRM_BUDDY_MAX_FREE_TREES; (tree)++)
>
> Some places seem to open code this? Maybe just drop this or use it 
> everywhere?
I replaced all open code places with the for_each_free_tree(tree) macro.
>
>>     static struct drm_buddy_block *drm_block_alloc(struct drm_buddy *mm,
>>                              struct drm_buddy_block *parent,
>> @@ -45,6 +52,30 @@ static void drm_block_free(struct drm_buddy *mm,
>>       kmem_cache_free(slab_blocks, block);
>>   }
>>   +static enum drm_buddy_free_tree
>> +get_block_tree(struct drm_buddy_block *block)
>> +{
>> +    return drm_buddy_block_is_clear(block) ?
>> +           DRM_BUDDY_CLEAR_TREE : DRM_BUDDY_DIRTY_TREE;
>> +}
>> +
>> +static struct drm_buddy_block *
>> +rbtree_get_free_block(const struct rb_node *node)
>> +{
>> +    return node ? rb_entry(node, struct drm_buddy_block, rb) : NULL;
>> +}
>> +
>> +static struct drm_buddy_block *
>> +rbtree_last_free_block(struct rb_root *root)
>> +{
>> +    return rbtree_get_free_block(rb_last(root));
>> +}
>> +
>> +static bool rbtree_is_empty(struct rb_root *root)
>> +{
>> +    return RB_EMPTY_ROOT(root);
>> +}
>> +
>>   static bool drm_buddy_block_offset_less(const struct 
>> drm_buddy_block *block,
>>                       const struct drm_buddy_block *node)
>>   {
>> @@ -59,37 +90,28 @@ static bool rbtree_block_offset_less(struct 
>> rb_node *block,
>>   }
>>     static void rbtree_insert(struct drm_buddy *mm,
>> -              struct drm_buddy_block *block)
>> +              struct drm_buddy_block *block,
>> +              enum drm_buddy_free_tree tree)
>>   {
>>       rb_add(&block->rb,
>> -           &mm->free_tree[drm_buddy_block_order(block)],
>> + &mm->free_trees[tree][drm_buddy_block_order(block)],
>>              rbtree_block_offset_less);
>>   }
>>     static void rbtree_remove(struct drm_buddy *mm,
>>                 struct drm_buddy_block *block)
>>   {
>> +    unsigned int order = drm_buddy_block_order(block);
>>       struct rb_root *root;
>> +    enum drm_buddy_free_tree tree;
>>   -    root = &mm->free_tree[drm_buddy_block_order(block)];
>> -    rb_erase(&block->rb, root);
>> +    tree = get_block_tree(block);
>> +    root = &mm->free_trees[tree][order];
>>   +    rb_erase(&block->rb, root);
>>       RB_CLEAR_NODE(&block->rb);
>>   }
>>   -static struct drm_buddy_block *
>> -rbtree_last_entry(struct drm_buddy *mm, unsigned int order)
>> -{
>> -    struct rb_node *node = rb_last(&mm->free_tree[order]);
>> -
>> -    return node ? rb_entry(node, struct drm_buddy_block, rb) : NULL;
>> -}
>> -
>> -static bool rbtree_is_empty(struct drm_buddy *mm, unsigned int order)
>> -{
>> -    return RB_EMPTY_ROOT(&mm->free_tree[order]);
>> -}
>> -
>>   static void clear_reset(struct drm_buddy_block *block)
>>   {
>>       block->header &= ~DRM_BUDDY_HEADER_CLEAR;
>> @@ -112,10 +134,13 @@ static void mark_allocated(struct drm_buddy *mm,
>>   static void mark_free(struct drm_buddy *mm,
>>                 struct drm_buddy_block *block)
>>   {
>> +    enum drm_buddy_free_tree tree;
>> +
>>       block->header &= ~DRM_BUDDY_HEADER_STATE;
>>       block->header |= DRM_BUDDY_FREE;
>>   -    rbtree_insert(mm, block);
>> +    tree = get_block_tree(block);
>> +    rbtree_insert(mm, block, tree);
>>   }
>>     static void mark_split(struct drm_buddy *mm,
>> @@ -201,6 +226,7 @@ static int __force_merge(struct drm_buddy *mm,
>>                u64 end,
>>                unsigned int min_order)
>>   {
>> +    enum drm_buddy_free_tree tree;
>>       unsigned int order;
>>       int i;
>>   @@ -210,45 +236,48 @@ static int __force_merge(struct drm_buddy *mm,
>>       if (min_order > mm->max_order)
>>           return -EINVAL;
>>   -    for (i = min_order - 1; i >= 0; i--) {
>> -        struct rb_root *root = &mm->free_tree[i];
>> -        struct rb_node *iter;
>> +    for_each_free_tree(tree) {
>> +        for (i = min_order - 1; i >= 0; i--) {
>> +            struct rb_node *iter = rb_last(&mm->free_trees[tree][i]);
>>   -        iter = rb_last(root);
>> -
>> -        while (iter) {
>> -            struct drm_buddy_block *block, *buddy;
>> -            u64 block_start, block_end;
>> +            while (iter) {
>> +                struct drm_buddy_block *block, *buddy;
>> +                u64 block_start, block_end;
>>   -            block = rbtree_get_free_block(iter);
>> -            iter = rb_prev(iter);
>> +                block = rbtree_get_free_block(iter);
>> +                iter = rb_prev(iter);
>>   -            if (!block || !block->parent)
>> -                continue;
>> +                if (!block || !block->parent)
>> +                    continue;
>>   -            block_start = drm_buddy_block_offset(block);
>> -            block_end = block_start + drm_buddy_block_size(mm, 
>> block) - 1;
>> +                block_start = drm_buddy_block_offset(block);
>> +                block_end = block_start + drm_buddy_block_size(mm, 
>> block) - 1;
>>   -            if (!contains(start, end, block_start, block_end))
>> -                continue;
>> +                if (!contains(start, end, block_start, block_end))
>> +                    continue;
>>   -            buddy = __get_buddy(block);
>> -            if (!drm_buddy_block_is_free(buddy))
>> -                continue;
>> +                buddy = __get_buddy(block);
>> +                if (!drm_buddy_block_is_free(buddy))
>> +                    continue;
>>   -            WARN_ON(drm_buddy_block_is_clear(block) ==
>> -                drm_buddy_block_is_clear(buddy));
>> +                WARN_ON(drm_buddy_block_is_clear(block) ==
>> +                    drm_buddy_block_is_clear(buddy));
>>   -            if (iter == &buddy->rb)
>> -                iter = rb_prev(iter);
>> +                /*
>> +                 * Advance to the next node when the current node is 
>> the buddy,
>> +                 * as freeing the block will also remove its buddy 
>> from the tree.
>> +                 */
>> +                if (iter == &buddy->rb)
>> +                    iter = rb_prev(iter);
>>   -            rbtree_remove(mm, block);
>> -            if (drm_buddy_block_is_clear(block))
>> -                mm->clear_avail -= drm_buddy_block_size(mm, block);
>> +                rbtree_remove(mm, block);
>> +                if (drm_buddy_block_is_clear(block))
>> +                    mm->clear_avail -= drm_buddy_block_size(mm, block);
>>   -            order = __drm_buddy_free(mm, block, true);
>> -            if (order >= min_order)
>> -                return 0;
>> +                order = __drm_buddy_free(mm, block, true);
>> +                if (order >= min_order)
>> +                    return 0;
>> +            }
>
> Do we need all these changes in __force_merge? Can't we just always 
> pick the dirty tree and keep everything else the same? If something is 
> non-merged there must be a dirty block preventing that, and when force 
> merging everything unmerged will be re-labled as dirty anyway, so the 
> second loop through the clean tree should always yield nothing?
When running the new KUnit performance test (Allocation under severe 
fragmentation), the test first allocates blocks of size 8 KiB with 64 
KiB alignment. As a result, the allocator initially allocates 64 KiB and 
then trims it down to 8 KiB. The allocations are then split into two 
groups and freed with different flags to prevent block coalescing. This 
creates a highly fragmented memory space with many scattered holes.

After this setup, the test attempts to allocate new 64 KiB blocks, which 
triggers repeated calls to force_merge() as it tries to merge smaller, 
lower-order blocks to form the required 64 KiB regions.
 From my testing, using only the dirty tree takes about 57 seconds, 
whereas iterating over the clear list first takes only about 186ms.

__force_merge
tree = 1 --- count = 30987, order = 3
tree = 1 --- count = 30987, order = 2
tree = 1 --- count = 30987, order = 1

__force_merge
tree = 0 --count=0, order = 3
tree = 0 --count=0, order = 2
tree = 0 --count=30334, order = 1

When only the dirty tree is used, the control unnecessarily iterates 
over the order-3 and order-2 entries before reaching order-1, causing a 
significant delay (Here order 3 and order 2 cannot be merged with their 
buddies, since they are split and not free). In contrast, iterating the 
clear tree first allows the control flow to skip directly to order-1 
(since orders 3 and 2 are empty), completing much faster.

Initially, AFAIK, the dirty tree tends to have more blocks in the higher 
orders. Keeping the clear tree first helps avoid these unnecessary 
iterations. Moreover, prioritizing the clear tree does not cause any 
functional difference - when a cleared block merges with a dirty block, 
the buddy is removed from the dirty tree as well. Therefore, iterating 
over the clear tree is harmless and, in certain cases, significantly 
improves performance compared to starting with the dirty tree.

This difference arises because allocations always come from the dirty 
list. The allocator trims each block to the requested size and reinserts 
the remaining fragments back into the dirty list, causing the dirty tree 
to accumulate far more blocks than the clear list. Please let me know 
your thoughts.

>
>>           }
>>       }
>>   @@ -269,7 +298,7 @@ static int __force_merge(struct drm_buddy *mm,
>>    */
>>   int drm_buddy_init(struct drm_buddy *mm, u64 size, u64 chunk_size)
>>   {
>> -    unsigned int i;
>> +    unsigned int i, j;
>>       u64 offset;
>>         if (size < chunk_size)
>> @@ -291,14 +320,22 @@ int drm_buddy_init(struct drm_buddy *mm, u64 
>> size, u64 chunk_size)
>>         BUG_ON(mm->max_order > DRM_BUDDY_MAX_ORDER);
>>   -    mm->free_tree = kmalloc_array(mm->max_order + 1,
>> -                      sizeof(struct rb_root),
>> -                      GFP_KERNEL);
>> -    if (!mm->free_tree)
>> +    mm->free_trees = kmalloc_array(DRM_BUDDY_MAX_FREE_TREES,
>> +                       sizeof(*mm->free_trees),
>> +                       GFP_KERNEL);
>> +    if (!mm->free_trees)
>>           return -ENOMEM;
>>   -    for (i = 0; i <= mm->max_order; ++i)
>> -        mm->free_tree[i] = RB_ROOT;
>> +    for (i = 0; i < DRM_BUDDY_MAX_FREE_TREES; i++) {
>> +        mm->free_trees[i] = kmalloc_array(mm->max_order + 1,
>> +                          sizeof(struct rb_root),
>> +                          GFP_KERNEL);
>> +        if (!mm->free_trees[i])
>> +            goto out_free_tree;
>> +
>> +        for (j = 0; j <= mm->max_order; ++j)
>> +            mm->free_trees[i][j] = RB_ROOT;
>> +    }
>>         mm->n_roots = hweight64(size);
>>   @@ -346,7 +383,9 @@ int drm_buddy_init(struct drm_buddy *mm, u64 
>> size, u64 chunk_size)
>>           drm_block_free(mm, mm->roots[i]);
>>       kfree(mm->roots);
>>   out_free_tree:
>> -    kfree(mm->free_tree);
>> +    while (i--)
>> +        kfree(mm->free_trees[i]);
>
> out_free_roots is also decrementing 'i' here it seems, so looks like 
> this might blow up?
Good catch, thanks. I have fixed the problem.
>
>> +    kfree(mm->free_trees);
>>       return -ENOMEM;
>>   }
>>   EXPORT_SYMBOL(drm_buddy_init);
>> @@ -382,8 +421,9 @@ void drm_buddy_fini(struct drm_buddy *mm)
>>         WARN_ON(mm->avail != mm->size);
>>   +    for (i = 0; i < DRM_BUDDY_MAX_FREE_TREES; i++)
>> +        kfree(mm->free_trees[i]);
>>       kfree(mm->roots);
>> -    kfree(mm->free_tree);
>>   }
>>   EXPORT_SYMBOL(drm_buddy_fini);
>>   @@ -407,8 +447,7 @@ static int split_block(struct drm_buddy *mm,
>>           return -ENOMEM;
>>       }
>>   -    mark_free(mm, block->left);
>> -    mark_free(mm, block->right);
>> +    mark_split(mm, block);
>>         if (drm_buddy_block_is_clear(block)) {
>>           mark_cleared(block->left);
>> @@ -416,7 +455,8 @@ static int split_block(struct drm_buddy *mm,
>>           clear_reset(block);
>>       }
>>   -    mark_split(mm, block);
>> +    mark_free(mm, block->left);
>> +    mark_free(mm, block->right);
>>         return 0;
>>   }
>> @@ -449,6 +489,7 @@ EXPORT_SYMBOL(drm_get_buddy);
>>    */
>>   void drm_buddy_reset_clear(struct drm_buddy *mm, bool is_clear)
>>   {
>> +    enum drm_buddy_free_tree src_tree, dst_tree;
>>       u64 root_size, size, start;
>>       unsigned int order;
>>       int i;
>> @@ -463,19 +504,24 @@ void drm_buddy_reset_clear(struct drm_buddy 
>> *mm, bool is_clear)
>>           size -= root_size;
>>       }
>>   +    src_tree = is_clear ? DRM_BUDDY_DIRTY_TREE : 
>> DRM_BUDDY_CLEAR_TREE;
>> +    dst_tree = is_clear ? DRM_BUDDY_CLEAR_TREE : DRM_BUDDY_DIRTY_TREE;
>> +
>>       for (i = 0; i <= mm->max_order; ++i) {
>> +        struct rb_root *root = &mm->free_trees[src_tree][i];
>>           struct drm_buddy_block *block, *tmp;
>>   -        rbtree_postorder_for_each_entry_safe(block, tmp, 
>> &mm->free_tree[i], rb) {
>> -            if (is_clear != drm_buddy_block_is_clear(block)) {
>> -                if (is_clear) {
>> -                    mark_cleared(block);
>> -                    mm->clear_avail += drm_buddy_block_size(mm, block);
>> -                } else {
>> -                    clear_reset(block);
>> -                    mm->clear_avail -= drm_buddy_block_size(mm, block);
>> -                }
>> +        rbtree_postorder_for_each_entry_safe(block, tmp, root, rb) {
>> +            rbtree_remove(mm, block);
>> +            if (is_clear) {
>> +                mark_cleared(block);
>> +                mm->clear_avail += drm_buddy_block_size(mm, block);
>> +            } else {
>> +                clear_reset(block);
>> +                mm->clear_avail -= drm_buddy_block_size(mm, block);
>>               }
>> +
>> +            rbtree_insert(mm, block, dst_tree);
>>           }
>>       }
>>   }
>> @@ -665,27 +711,17 @@ __drm_buddy_alloc_range_bias(struct drm_buddy *mm,
>>   }
>>     static struct drm_buddy_block *
>> -get_maxblock(struct drm_buddy *mm, unsigned int order,
>> -         unsigned long flags)
>> +get_maxblock(struct drm_buddy *mm,
>> +         unsigned int order,
>> +         enum drm_buddy_free_tree tree)
>>   {
>>       struct drm_buddy_block *max_block = NULL, *block = NULL;
>> +    struct rb_root *root;
>>       unsigned int i;
>>         for (i = order; i <= mm->max_order; ++i) {
>> -        struct rb_node *iter = rb_last(&mm->free_tree[i]);
>> -        struct drm_buddy_block *tmp_block;
>> -
>> -        while (iter) {
>> -            tmp_block = rbtree_get_free_block(iter);
>> -
>> -            if (!block_incompatible(tmp_block, flags)) {
>> -                block = tmp_block;
>> -                break;
>> -            }
>> -
>> -            iter = rb_prev(iter);
>> -        }
>> -
>> +        root = &mm->free_trees[tree][i];
>> +        block = rbtree_last_free_block(root);
>>           if (!block)
>>               continue;
>>   @@ -709,43 +745,39 @@ alloc_from_freetree(struct drm_buddy *mm,
>>               unsigned long flags)
>>   {
>>       struct drm_buddy_block *block = NULL;
>> +    struct rb_root *root;
>> +    enum drm_buddy_free_tree tree;
>>       unsigned int tmp;
>>       int err;
>>   +    tree = (flags & DRM_BUDDY_CLEAR_ALLOCATION) ?
>> +        DRM_BUDDY_CLEAR_TREE : DRM_BUDDY_DIRTY_TREE;
>> +
>>       if (flags & DRM_BUDDY_TOPDOWN_ALLOCATION) {
>> -        block = get_maxblock(mm, order, flags);
>> +        block = get_maxblock(mm, order, tree);
>>           if (block)
>>               /* Store the obtained block order */
>>               tmp = drm_buddy_block_order(block);
>>       } else {
>>           for (tmp = order; tmp <= mm->max_order; ++tmp) {
>> -            struct rb_node *iter = rb_last(&mm->free_tree[tmp]);
>> -            struct drm_buddy_block *tmp_block;
>> -
>> -            while (iter) {
>> -                tmp_block = rbtree_get_free_block(iter);
>> -
>> -                if (!block_incompatible(tmp_block, flags)) {
>> -                    block = tmp_block;
>> -                    break;
>> -                }
>> -
>> -                iter = rb_prev(iter);
>> -            }
>> -
>> +            /* Get RB tree root for this order and tree */
>> +            root = &mm->free_trees[tree][tmp];
>> +            block = rbtree_last_free_block(root);
>>               if (block)
>>                   break;
>>           }
>>       }
>>         if (!block) {
>> -        /* Fallback method */
>> +        /* Try allocating from the other tree */
>> +        tree = (tree == DRM_BUDDY_CLEAR_TREE) ?
>> +            DRM_BUDDY_DIRTY_TREE : DRM_BUDDY_CLEAR_TREE;
>> +
>>           for (tmp = order; tmp <= mm->max_order; ++tmp) {
>> -            if (!rbtree_is_empty(mm, tmp)) {
>
> Did you mean to drop the is_empty() check here? If it's overkill I 
> think better just not add it in the previous patch?
Modified in v8.
>
>> -                block = rbtree_last_entry(mm, tmp);
>> -                if (block)
>> -                    break;
>> -            }
>> +            root = &mm->free_trees[tree][tmp];
>> +            block = rbtree_last_free_block(root);
>> +            if (block)
>> +                break;
>>           }
>>             if (!block)
>> @@ -887,9 +919,9 @@ static int __alloc_contig_try_harder(struct 
>> drm_buddy *mm,
>>                        struct list_head *blocks)
>>   {
>>       u64 rhs_offset, lhs_offset, lhs_size, filled;
>> +    enum drm_buddy_free_tree tree;
>>       struct drm_buddy_block *block;
>>       LIST_HEAD(blocks_lhs);
>> -    struct rb_node *iter;
>>       unsigned long pages;
>>       unsigned int order;
>>       u64 modify_size;
>> @@ -901,40 +933,43 @@ static int __alloc_contig_try_harder(struct 
>> drm_buddy *mm,
>>       if (order == 0)
>>           return -ENOSPC;
>>   -    if (rbtree_is_empty(mm, order))
>> +    if 
>> (rbtree_is_empty(&mm->free_trees[DRM_BUDDY_CLEAR_TREE][order]) &&
>> + rbtree_is_empty(&mm->free_trees[DRM_BUDDY_DIRTY_TREE][order]))
>
> Could potentially merge this with the for_each_tree loop below?
Modified in v8.

Regards,
Arun.
>
> Otherwise,
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>
>>           return -ENOSPC;
>>   -    iter = rb_last(&mm->free_tree[order]);
>> -
>> -    while (iter) {
>> -        block = rbtree_get_free_block(iter);
>> -
>> -        /* Allocate blocks traversing RHS */
>> -        rhs_offset = drm_buddy_block_offset(block);
>> -        err =  __drm_buddy_alloc_range(mm, rhs_offset, size,
>> -                           &filled, blocks);
>> -        if (!err || err != -ENOSPC)
>> -            return err;
>> -
>> -        lhs_size = max((size - filled), min_block_size);
>> -        if (!IS_ALIGNED(lhs_size, min_block_size))
>> -            lhs_size = round_up(lhs_size, min_block_size);
>> -
>> -        /* Allocate blocks traversing LHS */
>> -        lhs_offset = drm_buddy_block_offset(block) - lhs_size;
>> -        err =  __drm_buddy_alloc_range(mm, lhs_offset, lhs_size,
>> -                           NULL, &blocks_lhs);
>> -        if (!err) {
>> -            list_splice(&blocks_lhs, blocks);
>> -            return 0;
>> -        } else if (err != -ENOSPC) {
>> +    for_each_free_tree(tree) {
>> +        struct rb_node *iter = rb_last(&mm->free_trees[tree][order]);
>> +
>> +        while (iter) {
>> +            block = rbtree_get_free_block(iter);
>> +
>> +            /* Allocate blocks traversing RHS */
>> +            rhs_offset = drm_buddy_block_offset(block);
>> +            err =  __drm_buddy_alloc_range(mm, rhs_offset, size,
>> +                               &filled, blocks);
>> +            if (!err || err != -ENOSPC)
>> +                return err;
>> +
>> +            lhs_size = max((size - filled), min_block_size);
>> +            if (!IS_ALIGNED(lhs_size, min_block_size))
>> +                lhs_size = round_up(lhs_size, min_block_size);
>> +
>> +            /* Allocate blocks traversing LHS */
>> +            lhs_offset = drm_buddy_block_offset(block) - lhs_size;
>> +            err =  __drm_buddy_alloc_range(mm, lhs_offset, lhs_size,
>> +                               NULL, &blocks_lhs);
>> +            if (!err) {
>> +                list_splice(&blocks_lhs, blocks);
>> +                return 0;
>> +            } else if (err != -ENOSPC) {
>> +                drm_buddy_free_list_internal(mm, blocks);
>> +                return err;
>> +            }
>> +            /* Free blocks for the next iteration */
>>               drm_buddy_free_list_internal(mm, blocks);
>> -            return err;
>> -        }
>> -        /* Free blocks for the next iteration */
>> -        drm_buddy_free_list_internal(mm, blocks);
>>   -        iter = rb_prev(iter);
>> +            iter = rb_prev(iter);
>> +        }
>>       }
>>         return -ENOSPC;
>> @@ -1239,6 +1274,7 @@ EXPORT_SYMBOL(drm_buddy_block_print);
>>    */
>>   void drm_buddy_print(struct drm_buddy *mm, struct drm_printer *p)
>>   {
>> +    enum drm_buddy_free_tree tree;
>>       int order;
>>         drm_printf(p, "chunk_size: %lluKiB, total: %lluMiB, free: 
>> %lluMiB, clear_free: %lluMiB\n",
>> @@ -1246,11 +1282,16 @@ void drm_buddy_print(struct drm_buddy *mm, 
>> struct drm_printer *p)
>>         for (order = mm->max_order; order >= 0; order--) {
>>           struct drm_buddy_block *block, *tmp;
>> +        struct rb_root *root;
>>           u64 count = 0, free;
>>   -        rbtree_postorder_for_each_entry_safe(block, tmp, 
>> &mm->free_tree[order], rb) {
>> -            BUG_ON(!drm_buddy_block_is_free(block));
>> -            count++;
>> +        for_each_free_tree(tree) {
>> +            root = &mm->free_trees[tree][order];
>> +
>> +            rbtree_postorder_for_each_entry_safe(block, tmp, root, 
>> rb) {
>> +                BUG_ON(!drm_buddy_block_is_free(block));
>> +                count++;
>> +            }
>>           }
>>             drm_printf(p, "order-%2d ", order);
>> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h
>> index 9ee105d4309f..d7891d08f67a 100644
>> --- a/include/drm/drm_buddy.h
>> +++ b/include/drm/drm_buddy.h
>> @@ -73,7 +73,7 @@ struct drm_buddy_block {
>>    */
>>   struct drm_buddy {
>>       /* Maintain a free list for each order. */
>> -    struct rb_root *free_tree;
>> +    struct rb_root **free_trees;
>>         /*
>>        * Maintain explicit binary tree(s) to track the allocation of the
>

