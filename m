Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D535CAE8211
	for <lists+dri-devel@lfdr.de>; Wed, 25 Jun 2025 13:55:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94E6410E6EA;
	Wed, 25 Jun 2025 11:55:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2YciUaTw";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2063.outbound.protection.outlook.com [40.107.92.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5895510E6EA
 for <dri-devel@lists.freedesktop.org>; Wed, 25 Jun 2025 11:55:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o7cLXWLvMauwcIqhbmYr6rHxByOqXltgjZdVeDw1XgAHtyhKojP+kzAIoJehy46KU6e5OrzLpwGwIOAaCYbOIacrRKpo8l0FPO/SkzZ/no5MxxaEWdfbzGa0vs++nEyEq/jqAOr5WwoL6AxOjUf/8Ex6PaJGk/jaiCGxFwCHxdQhBhOhm/7o2eKE3NjVEV2/nQ3exyVr2rJx36wbFqwdwFnYFE694TJMGgATKBbDgZgPsuIhuXI/vAq9l3t2Vpe0foMbYiGUY/YSDs8EpQ3om3+0LUimceovwbiTTCvWaWt3KYc0MDOG2v+ntCfKLmHux9NO/RmWeboxeOhWfEg67g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a80sCdWRO1Cc2lXE6PCrmPi4Uq79x1cCZ40YEIbSfo0=;
 b=xS0ThjSqa4MYnRTqtyHCIKkiKesXGApEHkjXgavYUD+d+GT8w7t8QouQfEHWDgDmAtMEmhjCa49SlHNE6Q2Tcyk+gMhqZEBbAV3DxyaQoEwJ8C4aGxS2ngQlCAu/QiN+a779Ugug0cZL0mTe3M/ILrQlcndRV7P3TH1aPsC/hLrFPl7Q+aXw5B+HDvb5OKnqHgk4ItUGed9ZShewiiaEXUC8Eu//FUgGQwByH9kJ7u9sc4+sUcQjzNyx51+bo3wtJEZGOQQgLTOGdMvlky+XVahu9FyW4PN3MqeBBQWookhUAh+Ne2Wujafn2OfHx38bTVso8royl+TUIlNdy2Luzw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a80sCdWRO1Cc2lXE6PCrmPi4Uq79x1cCZ40YEIbSfo0=;
 b=2YciUaTw/MHhV9cQ3TPDmmQNMjvyReIr8ARa0gZaPgd+9gC2v5cO69s5PXZ+dKKzQ8Fxey0pYfOYIDIsVS25Vw3N8i4wws33EM8Tiyk87M04DRirVccemNom418E/vxxFZzWh3xdo1MEgdawq7gLPj+pm939FYQZWBKrcZ2og+o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by PH8PR12MB7421.namprd12.prod.outlook.com (2603:10b6:510:22b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.20; Wed, 25 Jun
 2025 11:55:04 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8857.026; Wed, 25 Jun 2025
 11:55:04 +0000
Message-ID: <7dd0885a-7e7c-41a9-ae81-811fc344caf5@amd.com>
Date: Wed, 25 Jun 2025 13:55:00 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] mm: add gpu active/reclaim per-node stat counters (v2)
To: David Airlie <airlied@redhat.com>
Cc: Dave Airlie <airlied@gmail.com>, dri-devel@lists.freedesktop.org,
 Matthew Brost <matthew.brost@intel.com>, Johannes Weiner
 <hannes@cmpxchg.org>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>
References: <20250619072026.635133-1-airlied@gmail.com>
 <724720cd-eb05-4fc0-85a1-f6b60649b1ad@amd.com>
 <CAMwc25ruHtW165VRuDv5_tjaZGcL5H9CWeTjcCstXK09bDPhdw@mail.gmail.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <CAMwc25ruHtW165VRuDv5_tjaZGcL5H9CWeTjcCstXK09bDPhdw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR4P281CA0385.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f7::10) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|PH8PR12MB7421:EE_
X-MS-Office365-Filtering-Correlation-Id: f35a1b7a-1831-4806-a328-08ddb3df1f1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?TWZ5OUtCL3VvWHlGemd6WG5BVGNRSUZkK3pFUG5ZcXNabE4wZGpxMHU4c3lL?=
 =?utf-8?B?cmlUWUlrc3JWSllzeE5sL0FOVzV4c2hLM01YK1hRQVRubkFvcDc0TlVuL2VN?=
 =?utf-8?B?aUdudkVPWnAwa0E0MjdVTmZPZHd2QWNZUGJNZnBSWFlleWJQV2g0SUxpb3BW?=
 =?utf-8?B?NWFSY2lKdG9wV0FMdStrMG5WbmZvMkZ0OVBBMnFmUzZQcEZ1RkhpMzBTc2hQ?=
 =?utf-8?B?QlFIekVQZDlwclQ5MU1vMnVGbGFHYzlNTEN6R3dxUW5wYkNEdDlZQVZ2V3VG?=
 =?utf-8?B?MHBNT2M3TFVFMkZYRU0wWjZicWdUWGFUaVJxdE5xeHJ6eUxCeUIxU0wrVGdV?=
 =?utf-8?B?MGxxZk41N1R3NHpINVhjc3F1YkVyaGJkeVBYK3VrOVN1RFNyMU9YazlrbUJO?=
 =?utf-8?B?V1VlYnBhd0lxUTdwR3BYaDk5NjdHdGJOQkFtMDVzQlkvNmNlMXNraERXSERX?=
 =?utf-8?B?RXNNVUVUcnJPVXRjU2RqU3VGTGtCRXFZSTB1MXplYkQra3lNR2R3MjZMTXVy?=
 =?utf-8?B?dWlxUVdsMGl0alVZV1RTb1dGWmJhdStlMWZoYm1EVG9FMk9wOVc1YkgyR3pv?=
 =?utf-8?B?QTRWOElwV0hpcFplejN5WXFPZzNuSDUvSDJCTDdyTlNaaDRDMngzZGlNdnAv?=
 =?utf-8?B?aHJGMzh4aVViMmg3MEovRUJNNzQzQjVIeVVYOEh0ai8xS1BsWG5zL0RZODRo?=
 =?utf-8?B?b2V1L2xTKzZuUXgzUThsdUxXSFJmeE9zaExTVmoxd3lZUlBzSzdFdHdReE5V?=
 =?utf-8?B?ME8wMXhkT244bGk5SHRtRmg0b0l4UFFzN203a2pYcVF1aGRDbllSVlN1ZjVi?=
 =?utf-8?B?U20yNzNXOXhqdFpVSitWRXZ6OGJmTk5nUlNrV2syZlpoUDBOTTVhVGVlcE5m?=
 =?utf-8?B?bytjYlpaWkQwOGc1bjhGYWg3d3I2eDkzU1UrWmdMSjFGazlKenpJaXZRQVp3?=
 =?utf-8?B?VkpkQ0JpQ0FJWkZGV3p3ZHZFbWg3K2Q2NDk2VTFRV2IyaStjb3pYUm5oT1N5?=
 =?utf-8?B?VDFvUXZrY0ZiaHJYQ3pDcGNQMDhubE80TEtITGl6bG50aFFSTTdDNmlkOUFS?=
 =?utf-8?B?djBQekh1NEdQWTh5bHZGcVNsMURYcURyK0ZwUGNDak92dG1XRnQrZTYydUJF?=
 =?utf-8?B?THNuTjNhaW44b2FpQ0t3NTNvUWZDeUpDWlY1WDJTMWFKTmpQVE5vSkR1cVBv?=
 =?utf-8?B?ZXhQTWk4QzJKZ1Z4OVMyMDlTTWp2WERDZFd3WDVERmNBSFlGbHgzdDZ2YmRi?=
 =?utf-8?B?R1ZlYVNORzZONFRRbUdySWJHejRzOWZob0I1aXRQV0J1K013QUFPZzNtaTE1?=
 =?utf-8?B?bDRBTlp0STZSNlFwUW5JMmtBTGJyQjVLMlI5Zk5jTUFqNTR3dm9XZVBQbmt5?=
 =?utf-8?B?ZFJJYlRZNitBS3NoZEVhWXpXT3NmODNLWis0MnZSRDJ0S080VTRWbjVCR0Fx?=
 =?utf-8?B?Wnl2WEFIM3JZZUt4MVVFQzA1L203OFNsKzlBZ1RrYkZuVlY0VFdpU0dLNHJJ?=
 =?utf-8?B?WFlsdTE2RmpkQUNBV3lHSXZqV2xuRTlQK1E1NnJZUFc0eEZsK29pOW9YSVQ3?=
 =?utf-8?B?dTNYdjZiT3VWeVJsSDlBcHRFRWhwTXZWOVVBb0pvUUxRVEh5WWptU0xvQStO?=
 =?utf-8?B?VVBYajBVcGxTL2dzejRQeXdrdzRvNk1KZ05wcDRnZUVIWDBRdm56bURkais5?=
 =?utf-8?B?RDVUaFlCbDdQRlZVVUJid3MrVXpqcDQ4ZXBBRjhlQWRvZzg3M0VYMXVGNklr?=
 =?utf-8?B?dUh4MnpNK0Fmc1MzbnJ0M0tlM1pGbXV1WlJEMmE3MzRyUnhhY2NlVWw3cWdV?=
 =?utf-8?B?ZndYTHBBdzlFRG9QZTMzVFRISG8vY08veE10N0JyNmFVQmI2TC9vV2dyRzJw?=
 =?utf-8?B?RzRpSHJIbHRORUZONUZFS2dGNTVFZUFuOWdIdzF0d3k1TGRSVTBWaDRMVGZR?=
 =?utf-8?Q?CgQh9TYAcyA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SHNlUzNURzk1blZ3cVEyR2E5TllQaTIzcGwyNGdUVnphbnhWRHdZb3NCNEdP?=
 =?utf-8?B?WEYybDBxNjlVVjhqc09HM0xoSkFpL05veFZWRXorSllROFhQb1RYM2tlR09E?=
 =?utf-8?B?ZENsdm5mUGc1RmpUYmo4ME9jR1loOFJxbmZGYjk1YUcrYTk1WEdTall0THZt?=
 =?utf-8?B?SHhLTW0wdTd4TU11N0JxSk9QODFwUjJTSU1YSzcyUGJDSEM5SWxtUXZQNGlu?=
 =?utf-8?B?eEU5Y0NWUVQ1VE9PSXp1TGxteHRleGN4Y3M4V3M4RlZUdm1Nc0VCUDJ0R29u?=
 =?utf-8?B?R3hnQldEUkcwV1JmMXhzRmNCT0I4SXhPVUdTS05BQ1NnTlduNCs2akpvSy93?=
 =?utf-8?B?ZlA5YlRHOW5mNTNLVUUvelREZXowWG02UGVHUHlWOTVlSkE2OU8xYnpweUFT?=
 =?utf-8?B?czBEUE8vTklEaDc5a09BU3laVlNHNzhwSVI4aXRQakF5MWxDaG93SzkreHlG?=
 =?utf-8?B?SGJxamZ2MEp3eENrUWYwcnFtNGJDUndrVVM2eVBCY3BhZi9CTzhHQXdUTUpE?=
 =?utf-8?B?TnhmbDZRaXRacDUvN3dIeHhhYkJQNmUvZkRIdDNLLzRqZjZIOU5sdi9HVGRK?=
 =?utf-8?B?aTdlUE5kQ3EzK3RmMDN0Q1FvbDlUVU9jNlcyVVhBN0FtMU9wQklNNWo0NVpE?=
 =?utf-8?B?dzNUeDZIcVJ2U2xWbDhrN3h6dU9nTnpxa1FBblhPMldablpCcG9SNVE2TWpp?=
 =?utf-8?B?MjRZR0dmYkVhLzBIbnRTaUdFa21taDR4KzU3akRvT3JwZ3ZReEQxanl0dVVE?=
 =?utf-8?B?aFdBdWJvUVVCY0NPUTU0dmNlSUNSR1BwdnVEV1NCMTRaSDJKbFQwSVdtR3FB?=
 =?utf-8?B?bWhkUXkxK2ZpRUVCbkJoWFZ0a0djdkhzNDBveksxUlRoTitRS0lOQ09KVEUx?=
 =?utf-8?B?eGZ4Ni83WExKcDNta3FFTE0xMUN3a2I4YjNWQktiTFR1ZEowWFdDMnBtZEFv?=
 =?utf-8?B?bW1PVmcraGRLUUlqOVRBc1h1SVIvTXd6UUFOdGZTZmVvQ3RRQmd3MTJFcUlW?=
 =?utf-8?B?MHNIK0I4Q05kV1E2Q3ZLeVB6QlZaeW04SlhmNWRkUzNXMHorcVZFdzRrOHJO?=
 =?utf-8?B?Qit4U2FCUlpUUG0vNy9OVmxMQnpadHZQSitnZlBWbmFXNTJQaEFQUXFuZGts?=
 =?utf-8?B?Y2FPOFgvMjM1cmJYWFo0cStYZ0xTRUdQTjRVNXA5c3g0QkV2Mm9SbldWZWVZ?=
 =?utf-8?B?eDVNTVd6Vm1xaERRVkRJWk9rTWh6UzU5OXRYc056L0RNT1FiSnZKa1d4QmZl?=
 =?utf-8?B?VENEd3pOOGhXL3BIUXpxWTdDSXZnZ1RmVml5K0hHN2NaUWo5UkZ0VXlsK3E2?=
 =?utf-8?B?VVpBME9OME95ZXFHczRiSXBPWGhHQUtIN2RWK2F0Smp4ZERDeUpDMXUvK2Z1?=
 =?utf-8?B?cDUrNmRKYlFYT1dlbC9Xem12Sk9hKzVuWGFMaWF3Q0F2SUVFcmh1QnIyWEpk?=
 =?utf-8?B?SGlzZllMMUxOdUtKdklJRTc4Z1oxNVphNFNhTFo1VTBVVTBxclZvZXVkT0JQ?=
 =?utf-8?B?N09vTVRvYk94K0V6QlFsV3NhMldmUzhkaDRESlhBK1MzeWZGWEtwUmxkZGY4?=
 =?utf-8?B?Qmc0a2Nmc3dqMUFNQkFpb21uaGpiblk2bE5DV0ovMFpZN25WY3A4NksrVVNJ?=
 =?utf-8?B?Yk9IdlcwVTVsWjdlMEtSaHdOcTd5RklXa3c2WlE5em51eHplWjJjVnJzWjd2?=
 =?utf-8?B?R0RMKzd0cDBpajJFUFV5RHMzTWk3dnJ0ZVo5dlAwc2pyYUNtSG0wL3hwczVU?=
 =?utf-8?B?SVdwN2ptY0x2SXI2M09SQ09KTkhKV293NTZUMFNqN2g0Rm5MQXJXM1N3QlIx?=
 =?utf-8?B?L1BxU0YyMXZtZUlxRDdFSVFibDBpWWtEKzZzZkJ4dEw3U0pFWndnQkI3cjhu?=
 =?utf-8?B?OWxIWGl4anBUMHlqdS9PdTJGVHg1TzNhcmlweFBJU3dGaElJT1BCcXlwSXAr?=
 =?utf-8?B?QjI5dStkb3dRL0Q2OGpaamtzUjI1VFJZWXRZQnVOZXg5Wkxja1EwejI4a05L?=
 =?utf-8?B?T0tsM21UakVpWFcxQ1RwYlZLQTRSYU1jZXR5NmNxMDJjMG9vdDVwa2tSVSt6?=
 =?utf-8?B?cmRUdHlJUlJPQ1FZM2NhVHJXTnQrbWpSQ2NaVUhoaWRVZnJBN2NoWDhsSlNW?=
 =?utf-8?Q?UK7Un/3eQOHGJ+20O66SV2JBZ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f35a1b7a-1831-4806-a328-08ddb3df1f1d
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Jun 2025 11:55:04.2558 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: R8aWFRIl7GyZhrv+QQcV6vrNiQjR3G/DRCHT8wiynT4gQgFGoN+huSEX0BvdliAu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7421
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

On 24.06.25 03:12, David Airlie wrote:
> On Mon, Jun 23, 2025 at 6:54 PM Christian König
> <christian.koenig@amd.com> wrote:
>>
>> On 6/19/25 09:20, Dave Airlie wrote:
>>> From: Dave Airlie <airlied@redhat.com>
>>>
>>> While discussing memcg intergration with gpu memory allocations,
>>> it was pointed out that there was no numa/system counters for
>>> GPU memory allocations.
>>>
>>> With more integrated memory GPU server systems turning up, and
>>> more requirements for memory tracking it seems we should start
>>> closing the gap.
>>>
>>> Add two counters to track GPU per-node system memory allocations.
>>>
>>> The first is currently allocated to GPU objects, and the second
>>> is for memory that is stored in GPU page pools that can be reclaimed,
>>> by the shrinker.
>>>
>>> Cc: Christian Koenig <christian.koenig@amd.com>
>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>> Cc: Johannes Weiner <hannes@cmpxchg.org>
>>> Cc: linux-mm@kvack.org
>>> Cc: Andrew Morton <akpm@linux-foundation.org>
>>> Signed-off-by: Dave Airlie <airlied@redhat.com>
>>>
>>> ---
>>>
>>> v2: add more info to the documentation on this memory.
>>>
>>> I'd like to get acks to merge this via the drm tree, if possible,
>>>
>>> Dave.
>>> ---
>>>  Documentation/filesystems/proc.rst | 8 ++++++++
>>>  drivers/base/node.c                | 5 +++++
>>>  fs/proc/meminfo.c                  | 6 ++++++
>>>  include/linux/mmzone.h             | 2 ++
>>>  mm/show_mem.c                      | 9 +++++++--
>>>  mm/vmstat.c                        | 2 ++
>>>  6 files changed, 30 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
>>> index 5236cb52e357..7cc5a9185190 100644
>>> --- a/Documentation/filesystems/proc.rst
>>> +++ b/Documentation/filesystems/proc.rst
>>> @@ -1095,6 +1095,8 @@ Example output. You may not have all of these fields.
>>>      CmaFree:               0 kB
>>>      Unaccepted:            0 kB
>>>      Balloon:               0 kB
>>> +    GPUActive:             0 kB
>>> +    GPUReclaim:            0 kB
>>
>> Active certainly makes sense, but I think we should rather disable the pool on newer CPUs than adding reclaimable memory here.
> 
> I'm not just concerned about newer platforms though, even on Fedora 42
> on my test ryzen1+7900xt machine, with a desktop session running
> 
> nr_gpu_active 7473
> nr_gpu_reclaim 6656
> 
> It's not an insignificant amount of memory.

That was not what I meant, that you have quite a bunch of memory allocated to the GPU is correct.

But the problem is more that we used the pool for way to many thinks which is actually not necessary.

But granted this is orthogonal to that patch here.

> I also think if we get to
> some sort of discardable GTT objects with a shrinker they should
> probably be accounted in reclaim.

The problem is that this is extremely driver specific.

On amdgpu we have some temporary buffers which can be reclaimed immediately, but the really big chunk is for example what XE does with it's shrinker.

See Thomas TTM patches from a few month ago. If memory is active or reclaimable does not depend on how it is allocated, but on how it is used.

So the accounting need to be at the driver level if you really want to distinct between the two states.

Christian.

> 
> Dave.
> 

