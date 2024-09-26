Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93E59986FC0
	for <lists+dri-devel@lfdr.de>; Thu, 26 Sep 2024 11:16:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A9A710E27F;
	Thu, 26 Sep 2024 09:16:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="mqND3cRd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2068.outbound.protection.outlook.com [40.107.237.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF1EC10E27F;
 Thu, 26 Sep 2024 09:16:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AHlMmhBh7t9+EX+/S8Xa9J1Y6gMWng1mmf/sx21cD9fpXw18wzoD0A6Hd3Bg3ZkqzdmBussCHxwa6IBcwd//Aq70jXmxYPasEk8nD5se6ZwCuCS/rwOJAkqeeTjvl13bWjOLM4BrFbZphVZz9Od3ZeBR/tQzgC8mpY29CsOWSqUhLVoIjLL3P3j6j9d9/oz2R5OAgYp9XJxznqNVUD6XPUdKzSK7nMBm3eEI3RnV75x6BRYMMx1HGEOCgTxvN5sHJCiiTD0R5OAHqzUTSlzgtAP1qSmRua3i03HXRIqC5Ws5k5M8rWSZf9tvrdORz0Sp6uziwNZKuL7q3DIhSQ4hzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=310sypkS95c7DhyX7alQw28f5wDMlyq+66VHQkuRX38=;
 b=umKgpWLJdzDjoJhyKhvxaJEIZQIqyiqouB25g5y2JJNS47tVg1Af7GZ/cC2vp2/8CIbt97Vk0JqWfop8aBH9MZW8W7sxQUh+HFCKsKnE6T3fZiKUd8xcou4AHrVWwp8Mi4hXRtIWvMBvMjajsDnl1uRjMAY3K+065I8cyxUBQBkR59WrHx6BA+artfYKg4c21R/N/FQxfSwdN89IFqceiFTBAdZnrb2icG1CMT0kawhwHai5UK3OeF/NYaYovW8vkeoRLn+Ke1LNwa7KcH3JE5/5wVlhwpHXRcqlCrj97ky1GdWThcvp7HRi8Z9SUnDDbYeV4VmY4MpbpUTZxuVgcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=310sypkS95c7DhyX7alQw28f5wDMlyq+66VHQkuRX38=;
 b=mqND3cRdh9wbvbpC6qpwC7do6kMhS7KOd0O71qStMG8vxLWqgrak+N3OiUJ5BJnoFSWgDW5QTF7zyA9377gMRBAfTuM3xX3YjbbrSX0IvIwUPCM6ryfkdJb/exs9iM8NsqRFXxsnkW2YCXNfr77/K4TS/Ni+/sTW8d/B/MGCMyM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ1PR12MB6122.namprd12.prod.outlook.com (2603:10b6:a03:45b::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Thu, 26 Sep
 2024 09:15:57 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%2]) with mapi id 15.20.7982.012; Thu, 26 Sep 2024
 09:15:57 +0000
Message-ID: <c3696639-225d-490e-974f-231de10c0c81@amd.com>
Date: Thu, 26 Sep 2024 11:15:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/sched: Further optimise drm_sched_entity_push_job
To: Philipp Stanner <pstanner@redhat.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <ckoenig.leichtzumerken@gmail.com>,
 Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 Tvrtko Ursulin <tursulin@igalia.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
Cc: kernel-dev@igalia.com, Alex Deucher <alexander.deucher@amd.com>,
 Luben Tuikov <ltuikov89@gmail.com>, Matthew Brost <matthew.brost@intel.com>
References: <20240913160559.49054-9-tursulin@igalia.com>
 <20240916173007.118-1-tursulin@igalia.com>
 <478b066b-af6c-43a2-9e0e-a19344893bc0@gmail.com>
 <dfec609d-bbf8-4b6e-ad26-84e869694acc@igalia.com>
 <2ad66742-f572-4edc-957c-fcbd8c5a5917@igalia.com>
 <657ad50f-5458-4477-a348-5869c0282e35@gmail.com>
 <9ce9169b453a5cce8e276b88defb1995a6006a15.camel@redhat.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <9ce9169b453a5cce8e276b88defb1995a6006a15.camel@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0144.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:95::15) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ1PR12MB6122:EE_
X-MS-Office365-Filtering-Correlation-Id: a842f5dd-f28d-4e76-934d-08dcde0bd449
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SVlNL0JSRDlYdkExQzlkZ0hqTEpvODg1NUtWbWdoQnpBd2VPeU9xRmJuazBS?=
 =?utf-8?B?TitkZG9EbFkxcTZ2V3dMRWlEeWFRamdzTGVVbEQxWmIrVC9VSnZscE5RMUdB?=
 =?utf-8?B?eGk2QmhmYUVrZGZRbHVCdTAvS0luekFVTk10SC8vbGdXZ0ttb3YzTlBmeUw5?=
 =?utf-8?B?aU9TaG83NVZIL1V2S3luamlEVmhtVEYvck9DbTFIOUJGSmovdURGYnk3T1Zw?=
 =?utf-8?B?cDhjK0RUZnExK3ByQTJJTTMwYnpuSUpScEx1d0xNdFZLaWdqSEhwMXhYY1RJ?=
 =?utf-8?B?Z0xDNFNPYWhVREl6VUJRUGQ0UjZ5dlhxSGQxRzd1d3hNS2ZIc1pWcmpuTmJl?=
 =?utf-8?B?dHBiYUM4VGk0MHcrVjdlZFUrYnkvaTFhcGFhd2tNaVJVaStybU1WVmdoOEw3?=
 =?utf-8?B?K2pTY29DdzV4SkcwdElGMTFNZVZaejh6QzQzbi9uZVpJdDJnREZQa2t3aDFm?=
 =?utf-8?B?QzlINGpxM2JEUUlkOUU1aDQxNmh0NThOaVE1RVRveGMzRm9RZDFUQ1RQTEQ1?=
 =?utf-8?B?ZkEzQUFDUnhwbGJWMlV1YSs1S3dDQ1NTU3dUaUV1NCtEekdwbG9FRTdRMC9h?=
 =?utf-8?B?enZ6S21JRVpObEY4QmROb0Z2MmxGTjdDdEhJek1QcU8xbDF3bnRvb3VuWm80?=
 =?utf-8?B?RXpxeE42T2c0cXhOTGkrRFYxeG94enBGb1lXYTJ1WiswTnN6UXc2VUdjdWt1?=
 =?utf-8?B?TWIwcjF0L3JrMExxUHNha25BM2pQZms0YmpPVWhSSlM2Z1c1Mzd6STMxU3A5?=
 =?utf-8?B?bmVHd3duTTVIcnBUL2pybGo3U3hmOEZaTS9LVCtFMkVWcWNSZHorcm92dW9B?=
 =?utf-8?B?VW04ZVd3NWdwR28rTjdUOUVMWjdNRTNySkk5QUJ2c1I0UmZFSUhpQ2diUVNV?=
 =?utf-8?B?SUt6bjBxMnc5cldXdE5XY1ZjemNMbUZ1REVhcmg4ajJENnpUYVFNNmltczBE?=
 =?utf-8?B?OHdVWCs0TjQ1SElMeHFuWTRQQUltUW4zekV1WGluWU9abjVTU0tVZDB1cWYw?=
 =?utf-8?B?RzVaaUtCZnFIMDlNRDJWQURjYUxQaWNTcFBmeSs4cEw5ODRpSnZwZFdGV0Za?=
 =?utf-8?B?dlZqaHpEWmFnUFdQWU5PRExDbnVrWmlOejRJUVBBcWhpSTkwVk9RVnptZ05i?=
 =?utf-8?B?Ym9mLy9iTzFRZU1mYndqdi9NaU1LNVNodStDUno1ekpZeDFyWE5UQy9JTVlX?=
 =?utf-8?B?ckp4c3BrWTRsUnUxaTIyTHJtT3BzUHJUdlQwZXloRU4xb2JKL0xyZHRaSHdk?=
 =?utf-8?B?b2N1TEIwYjN0Q2plZ2ZkMFhQejJSeDFENkF2VXEzZHJNYnRYQU0zUzFoMEoz?=
 =?utf-8?B?aldYd1FFOE9CbVJnWjhFbVFUdzFEKzVBVWkzaTBIVWFOOW4zZ1NqTTNnMmpR?=
 =?utf-8?B?R1NSTTZrRFp5ampaZ2JkN0VkdmhUemFxOWI2MEFRdDkvb3NoVDExb0gzZmlE?=
 =?utf-8?B?QmM2U0ZzWjhSQkFjYWlzQ1E3M0ZvZDJGakI0ZW9tazNQOVpRMGZRbnJWcmw3?=
 =?utf-8?B?VVRrSk5ZeHorSnB0YWpMN285T2pmZ3JXby9nd0NiaTAvR3ZRU25NVy85QllG?=
 =?utf-8?B?QVlWVTBZUEhEUGNCTVhGQTZiK0ZibHZlNmxVMllBdHVsamZOaTA5QSs2UGV4?=
 =?utf-8?B?UGE4eHhaOHVIbk5YQnByb1YrTFZHSng3SXhLK2RiMWdUam94bG5Na0FkaEx0?=
 =?utf-8?B?eTVHejh4bEdnSkZoM2lpeW9HZGM5NzU5OEdSUzIwU1c0U0JMU0oydHNneFZq?=
 =?utf-8?B?LzVGUjBqV2dSZmQ1blJPY1VaZFZmc0dvbDZqbkNBTlNOd1Y3eEYrdzdVQ2R1?=
 =?utf-8?B?bkFMbktHb2VrWTlndVJVZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aEtqQ1JVUFdvUVRWeURmUWVCVElCVWhYUEo0bzNQdGFUZ2ZUZm0yK01YUnc4?=
 =?utf-8?B?VG1qOTIzaXE4QVVIK1FCOWRHQUJtS1QyZ1cyZ3V3c1ZjZitPN1ZNZjdnUS9X?=
 =?utf-8?B?aHlJMWp5ZFJ0VC9DQmt3UHhiMndSVlMxbk4vMW94TzNCYzBxU09IUU5CbVVX?=
 =?utf-8?B?SE9Qdm1hN3dkK3FvOUdKNkMwK05JK1lCRWVoQmZFWkRySUVqVVVTVFNjRDV6?=
 =?utf-8?B?VmRLbEoyY0VhWGswRklLQUlHZzBUM0UzYjVSaDhIS0VCMUtvYmxCSXpZVytR?=
 =?utf-8?B?dnlUOGdXVGJZVFhuYXkya2RYc0l2TUN6anR6T2tZYThlVzNJandiT3BVeFVU?=
 =?utf-8?B?cWdBV01rNGg1a0xRY2J2SndocE8ycXMxM2EwaGtXOC9xenBxQUtoMTN5K1VY?=
 =?utf-8?B?cm84MzVNRlgybWY1ZWpmb0JkMVZWMGhTL2JBL2R5Rjd5QkVleWpnQ0xFdGNP?=
 =?utf-8?B?TUJ4MzFCZzBjbGVXU0owekRGS0pGdDBOLzQyOU1uTlpZc2xYZ1podE5BQ3NO?=
 =?utf-8?B?QnNRN2dsb1JKZ1F6NFdQWG1xRmRoWjByUzdZNThFanhOV3A3ZGlDTE5PTWwz?=
 =?utf-8?B?bXZvY1BKMUg3VHo0amc2ejNhOUlBeTk0WjZ5ZHh6c3pkQ3pJR3FINUZzT3lx?=
 =?utf-8?B?MWN5NXBoVHl3VURJQlVjd2xEK2Vod081cWx2b0ttQVozM3ZDZm90UjQwallM?=
 =?utf-8?B?UnFpendrN3FoSW4vSGxjQ2VpYUVNcnUzS0MzSHVIaUw5ei9SRitFd05SRFhN?=
 =?utf-8?B?TEI2NHZNR3BVbUhreW9ZUVNkNFF1OTFlS3h5QmhaNm4vU2RPRmZNc1M5aENN?=
 =?utf-8?B?QkNDdlZaOVQyek93VUhqSWwvdG1RUTZYa1hSVG5QSVRCQzZzTi96QnJZeGhq?=
 =?utf-8?B?Z05uK1N3ZWNvaE9zSnliekQwRUV6N3htbnhxRGgzQ28wWGZOa3lpNkRzd3ZF?=
 =?utf-8?B?cHB0aDZ2d1JIaXdLUVh1RDBqTHoyN2NQcW5BdkxDc0lnVXFwLzN6TWlhZSsr?=
 =?utf-8?B?a1lqcjVhbFZKQjhudkkvSGlYaXlTTDdtQkNUMDhBVHNnS0ZXNlQybnlhVURy?=
 =?utf-8?B?c2pOaWhCWUVPT2RWZUZPTkxXU1NaZUJOaXFuemFjdEFQRUdFOW93SXFPWkhE?=
 =?utf-8?B?MUZ1MTR0YnRPcGE0aHpKWUVQY0hSMW1rbkZpVTNvWDBGNjV4dzNwTzdNVTVT?=
 =?utf-8?B?V3pvMlBQdzhCRTFwQXRHWGJsK2tZVnhHazkrUHdnL1hhMnBDR1lJM29UckVo?=
 =?utf-8?B?VUo1MmtDZjZBdGdYUTIxOWRYYWJncjNKWVNuWnJ1alpFV3IwOWhXWlhHNWZp?=
 =?utf-8?B?Q3pVV2FiMlR0VWNHN01XZXRITEs0aDVkQjVwMExIU3Y2N0Y2RUZkNnl2Kzl6?=
 =?utf-8?B?bjl3Y3pndGpqK1l6dUdjdzZkQXRDaXQ4cjU0RGl5THNpRG5pRjFyWjV0aFlx?=
 =?utf-8?B?WnVsdzVjWVNEL0hKUzlKNUdvVlloR2U1ZkRJbXlSNXVETEJRVmovcHlCN2t6?=
 =?utf-8?B?Y2VUUE9nc1lWR25sbFpBYTBLVmFVUklVVUhIL0lTR0sxNlJBcG01bUNGSm84?=
 =?utf-8?B?dW9iZXhNWGFDR0YxdWMwVFBwQ1JFN0EraVR0WkNNb1hJOTJmamFQU290NVdL?=
 =?utf-8?B?NkgwUndic2U3YzFybzYyeERYUGlEWmtyMFc3VGFpQzAzSHU4UWpZeEZmN0hZ?=
 =?utf-8?B?NFlKbDR3MDdYdkpkcnFlam9QcStqMTMvV1E1NVhhcU5qTHhwTDBGNmMrS3hJ?=
 =?utf-8?B?MXFHanlxTytmZllkOFZGekR0aWVVVVVOSDRSQ0pQVThXQ3NZUkp3blBjUEhs?=
 =?utf-8?B?LzVGSHJHY3pSM1FiR1ovRE5vTjY4L2xEVUdHVHdtNWh2S3hBQ2dCanU0L3Zr?=
 =?utf-8?B?bXFmNlZvNVhWY0J3bGNnSnVuN3lhU1NmdEVnY3A4VERDcDYrR0VTK1FNTytv?=
 =?utf-8?B?b3RQeWM1NkNJVFRjempVaWJwRmVwQXY5T21CN24rUVhwaGF1SUF5M3FyY21x?=
 =?utf-8?B?Q0EwbHh3a0R0ZzN6aWpweGdmb3BuK0MwQmJOeHJGSzlQQ1Q5OWhpRDBJYXZW?=
 =?utf-8?B?ZGVta1hKQmFydFMwVEVURm5GQUNCVlY0OEtRUXYzWWZ4UElVempqNjdRZnF5?=
 =?utf-8?Q?43T0=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a842f5dd-f28d-4e76-934d-08dcde0bd449
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2024 09:15:56.9777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rrgg87M9HvD62Bgwlfhtb6b+z1YvsanenMGrGtHkjShRyeOkvvlTUWLlsKD4x2qA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6122
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

Am 26.09.24 um 10:18 schrieb Philipp Stanner:
> On Tue, 2024-09-24 at 14:02 +0200, Christian König wrote:
>> Am 24.09.24 um 11:58 schrieb Tvrtko Ursulin:
>>> On 24/09/2024 10:45, Tvrtko Ursulin wrote:
>>>> On 24/09/2024 09:20, Christian König wrote:
>>>>> Am 16.09.24 um 19:30 schrieb Tvrtko Ursulin:
>>>>>> From: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>>>>
>>>>>> Having removed one re-lock cycle on the entity->lock in a
>>>>>> patch titled
>>>>>> "drm/sched: Optimise drm_sched_entity_push_job", with only a
>>>>>> tiny bit
>>>>>> larger refactoring we can do the same optimisation on the rq-
>>>>>>> lock.
>>>>>> (Currently both drm_sched_rq_add_entity() and
>>>>>> drm_sched_rq_update_fifo_locked() take and release the same
>>>>>> lock.)
>>>>>>
>>>>>> To achieve this we make drm_sched_rq_update_fifo_locked() and
>>>>>> drm_sched_rq_add_entity() expect the rq->lock to be held.
>>>>>>
>>>>>> We also align drm_sched_rq_update_fifo_locked(),
>>>>>> drm_sched_rq_add_entity() and
>>>>>> drm_sched_rq_remove_fifo_locked() function signatures, by
>>>>>> adding rq
>>>>>> as a
>>>>>> parameter to the latter.
>>>>>>
>>>>>> v2:
>>>>>>    * Fix after rebase of the series.
>>>>>>    * Avoid naming incosistency between
>>>>>> drm_sched_rq_add/remove.
>>>>>> (Christian)
>>>>>>
>>>>>> Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
>>>>>> Cc: Christian König <christian.koenig@amd.com>
>>>>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>>>>> Cc: Luben Tuikov <ltuikov89@gmail.com>
>>>>>> Cc: Matthew Brost <matthew.brost@intel.com>
>>>>>> Cc: Philipp Stanner <pstanner@redhat.com>
>>>>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>>> Thanks!
>>>>
>>>> Are you okay to pull into drm-misc-next or we should do some more
>>>> testing on this?
>>>>
>>>> And/or should I resend the series once more in it's entirety so
>>>> this
>>>> v2 is not a reply-to to the original?
>>> I have to respin for the drm_sched_wakeup fix that landed.
>> When I should push the series to drm-misc-next then please send it to
>> me
>> once more.
>>
>> On the other hand we should now have to maintainers for that.
> Yup, will pick up this responsibilities soonish. Danilo and I have been
> on conference recently and I'm out of office soon for a bit, but you
> can expect me / us to take over that work soonish in early autumn.

But please don't push this set. I have messed up the push because I 
didn't realized that the first three patches were supposed to land in 
-fixes instead of -next.

Should be cleaned up my me by the end of the day.

Sorry for the noise,
Christian.

>
> Regards,
> P.
>
>> Regards,
>> Christian.
>>
>>> Regards,
>>>
>>> Tvrtko
>>>
>>>> Regards,
>>>>
>>>> Tvrtko
>>>>
>>>>>> ---
>>>>>>    drivers/gpu/drm/scheduler/sched_entity.c | 12 ++++++++--
>>>>>>    drivers/gpu/drm/scheduler/sched_main.c   | 29
>>>>>> ++++++++++++------------
>>>>>>    include/drm/gpu_scheduler.h              |  3 ++-
>>>>>>    3 files changed, 26 insertions(+), 18 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>> b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>> index d982cebc6bee..8ace1f1ea66b 100644
>>>>>> --- a/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_entity.c
>>>>>> @@ -515,9 +515,14 @@ struct drm_sched_job
>>>>>> *drm_sched_entity_pop_job(struct drm_sched_entity *entity)
>>>>>>            next =
>>>>>> to_drm_sched_job(spsc_queue_peek(&entity->job_queue));
>>>>>>            if (next) {
>>>>>> +            struct drm_sched_rq *rq;
>>>>>> +
>>>>>>                spin_lock(&entity->lock);
>>>>>> -            drm_sched_rq_update_fifo_locked(entity,
>>>>>> +            rq = entity->rq;
>>>>>> +            spin_lock(&rq->lock);
>>>>>> +            drm_sched_rq_update_fifo_locked(entity, rq,
>>>>>>                                next->submit_ts);
>>>>>> +            spin_unlock(&rq->lock);
>>>>>>                spin_unlock(&entity->lock);
>>>>>>            }
>>>>>>        }
>>>>>> @@ -618,11 +623,14 @@ void drm_sched_entity_push_job(struct
>>>>>> drm_sched_job *sched_job)
>>>>>>            sched = rq->sched;
>>>>>>            atomic_inc(sched->score);
>>>>>> +
>>>>>> +        spin_lock(&rq->lock);
>>>>>>            drm_sched_rq_add_entity(rq, entity);
>>>>>>            if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>>>>>> -            drm_sched_rq_update_fifo_locked(entity,
>>>>>> submit_ts);
>>>>>> +            drm_sched_rq_update_fifo_locked(entity, rq,
>>>>>> submit_ts);
>>>>>> +        spin_unlock(&rq->lock);
>>>>>>            spin_unlock(&entity->lock);
>>>>>>            drm_sched_wakeup(sched, entity);
>>>>>> diff --git a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>> b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>> index 18a952f73ecb..5c83fb92bb89 100644
>>>>>> --- a/drivers/gpu/drm/scheduler/sched_main.c
>>>>>> +++ b/drivers/gpu/drm/scheduler/sched_main.c
>>>>>> @@ -153,17 +153,18 @@ static __always_inline bool
>>>>>> drm_sched_entity_compare_before(struct rb_node *a,
>>>>>>        return ktime_before(ent_a->oldest_job_waiting,
>>>>>> ent_b->oldest_job_waiting);
>>>>>>    }
>>>>>> -static inline void drm_sched_rq_remove_fifo_locked(struct
>>>>>> drm_sched_entity *entity)
>>>>>> +static void drm_sched_rq_remove_fifo_locked(struct
>>>>>> drm_sched_entity *entity,
>>>>>> +                        struct drm_sched_rq *rq)
>>>>>>    {
>>>>>> -    struct drm_sched_rq *rq = entity->rq;
>>>>>> -
>>>>>>        if (!RB_EMPTY_NODE(&entity->rb_tree_node)) {
>>>>>>            rb_erase_cached(&entity->rb_tree_node, &rq-
>>>>>>> rb_tree_root);
>>>>>>            RB_CLEAR_NODE(&entity->rb_tree_node);
>>>>>>        }
>>>>>>    }
>>>>>> -void drm_sched_rq_update_fifo_locked(struct drm_sched_entity
>>>>>> *entity, ktime_t ts)
>>>>>> +void drm_sched_rq_update_fifo_locked(struct drm_sched_entity
>>>>>> *entity,
>>>>>> +                     struct drm_sched_rq *rq,
>>>>>> +                     ktime_t ts)
>>>>>>    {
>>>>>>        /*
>>>>>>         * Both locks need to be grabbed, one to protect from
>>>>>> entity->rq change
>>>>>> @@ -171,17 +172,14 @@ void
>>>>>> drm_sched_rq_update_fifo_locked(struct
>>>>>> drm_sched_entity *entity, ktime_t ts
>>>>>>         * other to update the rb tree structure.
>>>>>>         */
>>>>>>        lockdep_assert_held(&entity->lock);
>>>>>> +    lockdep_assert_held(&rq->lock);
>>>>>> -    spin_lock(&entity->rq->lock);
>>>>>> -
>>>>>> -    drm_sched_rq_remove_fifo_locked(entity);
>>>>>> +    drm_sched_rq_remove_fifo_locked(entity, rq);
>>>>>>        entity->oldest_job_waiting = ts;
>>>>>> -    rb_add_cached(&entity->rb_tree_node, &entity->rq-
>>>>>>> rb_tree_root,
>>>>>> +    rb_add_cached(&entity->rb_tree_node, &rq->rb_tree_root,
>>>>>>                  drm_sched_entity_compare_before);
>>>>>> -
>>>>>> -    spin_unlock(&entity->rq->lock);
>>>>>>    }
>>>>>>    /**
>>>>>> @@ -213,15 +211,14 @@ static void drm_sched_rq_init(struct
>>>>>> drm_gpu_scheduler *sched,
>>>>>>    void drm_sched_rq_add_entity(struct drm_sched_rq *rq,
>>>>>>                     struct drm_sched_entity *entity)
>>>>>>    {
>>>>>> +    lockdep_assert_held(&entity->lock);
>>>>>> +    lockdep_assert_held(&rq->lock);
>>>>>> +
>>>>>>        if (!list_empty(&entity->list))
>>>>>>            return;
>>>>>> -    spin_lock(&rq->lock);
>>>>>> -
>>>>>>        atomic_inc(rq->sched->score);
>>>>>>        list_add_tail(&entity->list, &rq->entities);
>>>>>> -
>>>>>> -    spin_unlock(&rq->lock);
>>>>>>    }
>>>>>>    /**
>>>>>> @@ -235,6 +232,8 @@ void drm_sched_rq_add_entity(struct
>>>>>> drm_sched_rq *rq,
>>>>>>    void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>>>>>                    struct drm_sched_entity *entity)
>>>>>>    {
>>>>>> +    lockdep_assert_held(&entity->lock);
>>>>>> +
>>>>>>        if (list_empty(&entity->list))
>>>>>>            return;
>>>>>> @@ -247,7 +246,7 @@ void drm_sched_rq_remove_entity(struct
>>>>>> drm_sched_rq *rq,
>>>>>>            rq->current_entity = NULL;
>>>>>>        if (drm_sched_policy == DRM_SCHED_POLICY_FIFO)
>>>>>> -        drm_sched_rq_remove_fifo_locked(entity);
>>>>>> +        drm_sched_rq_remove_fifo_locked(entity, rq);
>>>>>>        spin_unlock(&rq->lock);
>>>>>>    }
>>>>>> diff --git a/include/drm/gpu_scheduler.h
>>>>>> b/include/drm/gpu_scheduler.h
>>>>>> index 80198e6cf537..b21806d5a8eb 100644
>>>>>> --- a/include/drm/gpu_scheduler.h
>>>>>> +++ b/include/drm/gpu_scheduler.h
>>>>>> @@ -596,7 +596,8 @@ void drm_sched_rq_add_entity(struct
>>>>>> drm_sched_rq *rq,
>>>>>>    void drm_sched_rq_remove_entity(struct drm_sched_rq *rq,
>>>>>>                    struct drm_sched_entity *entity);
>>>>>> -void drm_sched_rq_update_fifo_locked(struct drm_sched_entity
>>>>>> *entity, ktime_t ts);
>>>>>> +void drm_sched_rq_update_fifo_locked(struct drm_sched_entity
>>>>>> *entity,
>>>>>> +                     struct drm_sched_rq *rq, ktime_t ts);
>>>>>>    int drm_sched_entity_init(struct drm_sched_entity *entity,
>>>>>>                  enum drm_sched_priority priority,

