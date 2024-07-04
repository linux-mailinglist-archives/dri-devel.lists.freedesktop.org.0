Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F14369272DD
	for <lists+dri-devel@lfdr.de>; Thu,  4 Jul 2024 11:22:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07B1810EA56;
	Thu,  4 Jul 2024 09:22:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="2mWsM8tR";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2066.outbound.protection.outlook.com [40.107.96.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E22E10EA56;
 Thu,  4 Jul 2024 09:21:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AtDFMrIh/XcM4+LzG9jq4m4USNIhhrhJK6x+qGLUu/eC7UipQ3rqOvtgPuHR8M0Xbep2Hkg0mK2M8viEEBIQ2VbcFWSYlyyXa15u6sjDfXcMHeN3x3WapeJ6h1AAFJd6m3yjaFHmoaE0KOSXXss3aquRKPFB9Gdf2tk8y7kUtQcZ22DcCdbX0dz2eLt6oxuD8yXj6Mhex2ByYezAhNsJKKkyN3Czyg2AoZ77Y+APKzHVJg3MvrGrVCG9nZp+Emtb/ptKyhll/G+hfNJuPyd/ZIV3oAU2byoh0DljAEZDrMi0g7sK/TOk165YV0VJzg/hqoGRe2SJ7Mkv6HkjqjyUhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Y3CBfRtzN1pCzBHfQ279oFBiUULTh+bW3y0MBAZt/s0=;
 b=cL/OCLYYhghtxYAHymNuOUuE/Zww98OsOGOd3VwotqmXSdI7shL3V7PBYoBMY1fUDnT9wr9iO9Dq9iLc7VVpKvu865Dtb8zUpogj2ewfZp9gy7GQcj8nYFg8cyzQXFy+Vzu0qYD0pQWSzhl9MZmmGWL87W8yQJ+5aoRNRFM6LFexNvHWmAoNU3CiaehMCCwR3p7CrpwmBmMeyRdkKjRfdBfBnflwZpMZcIppbn8JtR95y7v+8xqTvZQOFR/SYWpwGUUxcpZjerbslmKif7u4k6imYdzn06jADKuKjPHZz08nChjwmB5XlqLlrfgF+ZHoliHqBiN+X8SwZtDcAMxstQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y3CBfRtzN1pCzBHfQ279oFBiUULTh+bW3y0MBAZt/s0=;
 b=2mWsM8tRasCsqceAid7EhHf8KqbSbnxi6UHSL9lieoKW2bbN9s3xCU8mbEmNIdkMt7YgiWHsQ+m6h6HqHy3eHM2dUZvKgdeI0GUoQLOyHrDuaZsssQHwcIWeSfAxE6ajklclCztp0OV6HmAHQQ8wo+OqKXrkw3TGT7Ru3qb+nAk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by SJ2PR12MB8977.namprd12.prod.outlook.com (2603:10b6:a03:539::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.39; Thu, 4 Jul
 2024 09:21:55 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%6]) with mapi id 15.20.7741.017; Thu, 4 Jul 2024
 09:21:55 +0000
Message-ID: <6e675fdb-7656-46f1-8753-ade66ef9de7b@amd.com>
Date: Thu, 4 Jul 2024 11:21:50 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 04/12] drm/ttm, drm/amdgpu, drm/xe: Consider hitch
 moves within bulk sublist moves
To: =?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org
Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 Matthew Brost <matthew.brost@intel.com>, dri-devel@lists.freedesktop.org
References: <20240703153813.182001-1-thomas.hellstrom@linux.intel.com>
 <20240703153813.182001-5-thomas.hellstrom@linux.intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <20240703153813.182001-5-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR2P281CA0115.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:9d::17) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|SJ2PR12MB8977:EE_
X-MS-Office365-Filtering-Correlation-Id: 62b9c8b9-a0b4-4676-61de-08dc9c0abf33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?QzJaVTExUTZDOStNL3Z5Qng1Y2NkZHBlcW1iR3psdGg2K1laeGx0VnB3dXZF?=
 =?utf-8?B?NytGdlM0bGFPS3h0SGwvaWZER0hkMDdVNU5uV0lBKzZKb3pzVnRUTE9mUFd3?=
 =?utf-8?B?WFpIRWpSYmtjc0hjbkRlaVpkdmNBRGxKdkYwVmVzMThTMUpDRHZmanlNcUJi?=
 =?utf-8?B?WXRkS0ZiNDlaRkh4OE9DdzF0eEdBTDc2a2dRL0NLbVFrLzhtTzZVdDlIbCtq?=
 =?utf-8?B?QXR2WXFrRDNXc0h3NEN1MFNYWmNJcUQzM3pHaCs4Y1o5OGx6V0w5aEJ2emhZ?=
 =?utf-8?B?ZWR6c09oVS82NlpnK2pyWWl5VitxRlV5a2VSQzRCYnZqcSsxWk1LUHBkc1ZG?=
 =?utf-8?B?WE9DMkN2K0l3b0g5STdKTlpjZWg2ckJmSFJEdUFBS3JLalA5TGhYSUxiS0Jo?=
 =?utf-8?B?OS9BZ3B3ZDVhM2t5bHowUlE1ME1KMk9oSG1OanpMN2Fsb2JCUDRKMFh5MjVE?=
 =?utf-8?B?dDhBN1JoSXcvbkxGY25yb0RDQ3o4MDdGREZpK1NvZEVrRFBsU1FQM21uU1pk?=
 =?utf-8?B?QkdoSE9obWl4Zk1XM21CV1lkYUZUeW1PRFQ3TTg0VS9BWW1TR2dDbWo0WGJ2?=
 =?utf-8?B?QnlTT0hwNUVleUIvZTBlMnpsQ01FcjcrNWd0QWZuU2ZhUWlrTWwwcHllYXNP?=
 =?utf-8?B?NFBTd1liOWNYR0FiTEtnUzJkeGh0QzA5L3gzSThVcmFvcHZ6OVY4NFhzTzBG?=
 =?utf-8?B?bTM1SlNIQndmSXdIWU9aR2s4NmxOQW80cXd6QXkyS21uMzhHdHBWUnVRTkY1?=
 =?utf-8?B?V1luRC83SFVWU0s1VGxVY0xFb0VNRnNVYU1YUzVKSWFoZG9wVUU5VFFGQVlT?=
 =?utf-8?B?K2lvaWhNWGIxRnRMNEF1WGR4WVVjZS8wREdYaUwzaDd4bGVWb0JDUXRCTE04?=
 =?utf-8?B?Nk04V29lWXMzQXpBbndaQXl0NVJkSXBIMWhqV05wcVRPcGZGOGF1Ym9yK0xu?=
 =?utf-8?B?c0kwSUtpVkM5VTFuRW4wTWJpMG5UNVg0dDFPWHBtSTI0NzJvNUpoT2RoRWhq?=
 =?utf-8?B?VmRjWVZYM1lmN3E2ZkxTSkdzdXQyQ0xhT0FOM3k0QU1odWQxT3JwQUc1Z2JQ?=
 =?utf-8?B?cjlIRWM5c2YvZEdGaTAySmxJNWx2OUNXVVpBcWhpOS9LRUF2RTVtby8wb2xr?=
 =?utf-8?B?V1BobksrNG5sRWlOOGZDRXVSdEE1bjFaYi9yMTVhdFVVbFhWSUY5czN0UG5s?=
 =?utf-8?B?dFJpMldoanl0VFFLbnNROW9NK3BuRGJGZ05tMXM2V0lsUVFWekhCUFpZYkxQ?=
 =?utf-8?B?dElsTllqT1FnK1RpNnMwS1lFUjFMalFiaVAzZEk2c3RTV25sOGZOT0hMYWEv?=
 =?utf-8?B?VVM1MDNHNktDKy80ZUVTZ3FNcG8yNDJKVlpnT0h3RnNBNk1UQzEwL0plYWo4?=
 =?utf-8?B?OWRMVjE1QmpTUmh0OWQwbjdOT0JWNlJ5T0tUOFYvRTY3RWIzQTFhNG9kVjR3?=
 =?utf-8?B?WmdGakJ0bEloK25TSU4zUktSRjJhOEcxcUNEV0ptSnVyYXk3cFhRZVk1K2Vn?=
 =?utf-8?B?ZVE5UlJOcEpaWmgwMmR4SUJOWGlVY2NXTU03TU1PY2FDa3FwVGJ6dmEzWU1Q?=
 =?utf-8?B?TWtNampqMXg5SUJ2ZE04M0JNeGRxUmlTbnp0V1dndWthNUFzdkRCcXpmV0VP?=
 =?utf-8?B?VEdjYTdzMXlENEttU0E0UWd1d0Njd3BCcy8vaDFKRENEZm9uam1zeDBCR2px?=
 =?utf-8?B?REVnNDVVWGJ6NVhFcXFYSk1Ra0JSMVkvdVl5Y09rM296aUVvY01jaUdydnZp?=
 =?utf-8?B?Qy80LzZmVWpzc1VMbXpuWC9uTkJKQnlDaHlPV0Z3NjBFRDBKK05kNWo5R3Zv?=
 =?utf-8?B?RllYeXBnL2Mva3B2dmtyZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TUF0N0MzaThxWDN5RVUyQ3oxS3hoSFhTOVdQNllDTU52M0hXb2Q1K2hENWpK?=
 =?utf-8?B?aTRBVGxlby80UjVtOVN2Nmt1S0FRdEQyTG9EVFIzQWJvak1ZMWtKWXJ3NmN1?=
 =?utf-8?B?Umt6RTdCZGZLNE9CQUxvUWZMdXMyTzZiWUh2Q1BHb1J1dFczN1hQRzNsMHB6?=
 =?utf-8?B?MkhZYWw4b0ZTaGNJOVdxdnc1MzB6Rit5K2E5ZUdsSlRReUVEUEhPY2hYS2k3?=
 =?utf-8?B?RTJKMGNDY2lTVVFsL1NZZUZQYThhRFdWL1o0c0U4cXJFdTNmUW9XSzJ0UlpE?=
 =?utf-8?B?by9sR2hjOE1jSm5PV2hWZ0Q0QXRTNkt3dlBoaHdBK1dWM24zdTJEcllqY1px?=
 =?utf-8?B?dXdQcVc1YUp6b2hRM1lCT2VEVEFVRjJ0cHFReE5abTBnaHV4eDBMaVdrNktQ?=
 =?utf-8?B?VnJpTThHbU51QklkWVpCQzN6SGsxNnZYNWplejhiNnYwOHlHRjNONGNST1VE?=
 =?utf-8?B?UG0xWUNTaVBYekloOVVnUWNxU2NJSUJTZEZ5NHdla292N21UN0c3ZzdZMXEr?=
 =?utf-8?B?V2R4ZE9KNnJ5S1pmUU0vQ3F4c2ExSWN1UHhMa3B6c0NyMGtNYmV0SnV4MWRx?=
 =?utf-8?B?RzkzSStuY1A5bkJPWFR1UmwxNU54cVB5SlE3Q0lVeTFaU3IyVGszREJuUDNB?=
 =?utf-8?B?blVMUFJ6Q2N1MktweEZGQUdkanE4UmNrdGtLdnNqU0p4MU5YV1dvSUszTm9S?=
 =?utf-8?B?UkFRRWw5cWkxaFAyb2hwa1Ruem8ydFBLVncwcnhvK3FWMTVTUnNWL1FJa1BW?=
 =?utf-8?B?cWYxUHpROHVDdWR6WUlvaCs4VnN6Ry9EWFZMTGZWTlFJS01kbHFmUEFNanMr?=
 =?utf-8?B?MklkWjlDQ3h5Y2JtY0xzMzBKUjZjM25qMVcvVW4xNGY3MlVLSDZSZG9vMWw1?=
 =?utf-8?B?MXFTVmo4RDF4NmVtaWRzdUpMcU9wY25uZXVpZksxd2MyZmJNNzdzdmtRZ0lV?=
 =?utf-8?B?VFR2ek5YYW81d0lMQVVvUzZjSHhBMktwZzVQbWF1ekNtOVdsT3BzeUp5Q0dU?=
 =?utf-8?B?bWVqc2JiaURkVmExcjdLWGszMjM2N1R6YUhqNW9XYlczZ1BFNVBFVlpSWmRY?=
 =?utf-8?B?U1VaYWxpRXV5bG1QaFVlaVUxMTgvSWNLRXpqNnd6OXg4aXFiTUhvNkNTWmd4?=
 =?utf-8?B?RjlIRXdNa2c5TGlFbHJEMkJjMm9oN3I4ZEpJbjJxV3B3QTlJaEozN1FlRGo2?=
 =?utf-8?B?alJxZ0N5Vnh4ZEtDekFaMEI3dmZzTnB1RmdlbERPTGtGYVRSVEVRRzI1NnVj?=
 =?utf-8?B?SWQ0MitTSlhpN2QzNlpxckVXL01UN3FKejhkcmI4OThxYVVCK3A2eXloRHhh?=
 =?utf-8?B?NkxHNVc2akxlMFdNVDUva3lPMkZQNUpVaEhDbUJCTnIrNlBISUVPbjkvYVRx?=
 =?utf-8?B?ZzBoSHNoVWxnMGNsRTd0UG9xYXpsKzFGT0lJa2NVSGN2R1FMMkNFSnhBSjJo?=
 =?utf-8?B?QXpOMXFsN1dlZEZac2hGbE4xNmZ4bG5pZXBQVFppUWxVbTRxUFNaR1M5ZG9T?=
 =?utf-8?B?ZHNidVMxTTJQcFVLRVlMU1orUnlFUG5SQ2YwR1dPSFBzdzlqb05VZGdGekFa?=
 =?utf-8?B?Z2g5VVR1b3RxZnBjcTZmYk0raFl5Tld5NWRBN2tEMjJpUzBITTJwVHNLU3Fm?=
 =?utf-8?B?L3FyYWd0ZkdqNDl5NjFmeEdhMGg2VGNlT0RIdHhjQW03YXNZRDYwWlRmUDF3?=
 =?utf-8?B?U2ovcGFINW44Mi9NcDNxNnhrMnRnb0phVjlLUWdZN1Z6WTdSaHREMjlVNk5P?=
 =?utf-8?B?UmZkZU55QjNsTncrT04zSWNWT2RxRS9SL2ZKNXdpdWk5Rnl1RWRzdW15WFdi?=
 =?utf-8?B?YzAxQzJMS2l6Yk9wODJyczZYOUxmQjlqdzRROEZFWDAwNXBMOHJWMk84V056?=
 =?utf-8?B?WHZCUmpCdEpuelNJUXpySEk4OGFWOGJIekhIZTBHWGNzNFpXZlZPSlNwUzRW?=
 =?utf-8?B?S2JQT1JkRTAzY3pFcXNsMkpwUmRCMkR0L0NHelpwdVJFSE0rcUtKOTJXcndW?=
 =?utf-8?B?OWpicVkxQm9lcU9wZ0FDMFp6Uko0cmxhQnJRcVorTnN4U3dFUUU1OG9rVTJ3?=
 =?utf-8?B?bGFjb0ZnZnhDaGNzUEI3bmZFYUlqVnhaUEMvVEZvamoyeXJ2TE5oQzgwR2R6?=
 =?utf-8?Q?a33+Z3jNyqHIZAnkEai/eB7yj?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62b9c8b9-a0b4-4676-61de-08dc9c0abf33
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 09:21:55.2440 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rFE63eVsPghz51oYI0/Ib/jZ66H59cE8o0BHT+Kxn+R5jaSZJgE8zggF79gILHq/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8977
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

Am 03.07.24 um 17:38 schrieb Thomas Hellström:
> To address the problem with hitches moving when bulk move
> sublists are lru-bumped, register the list cursors with the
> ttm_lru_bulk_move structure when traversing its list, and
> when lru-bumping the list, move the cursor hitch to the tail.
> This also means it's mandatory for drivers to call
> ttm_lru_bulk_move_init() and ttm_lru_bulk_move_fini() when
> initializing and finalizing the bulk move structure, so add
> those calls to the amdgpu- and xe driver.
>
> Compared to v1 this is slightly more code but less fragile
> and hopefully easier to understand.

This is the only patch in the series which I see critical.

I think the final goal when using drm_exec in TTMs eviction path is to 
keep all evicted (or evicting) BOs locked until we have enough space.

This means that for bulk move sections on the LRU we would lock the 
first BO and would only drop that lock again if we have gone over the 
full bulk move section and know that all BOs are not valuable for eviction.

Because of this the issue of having to consider hitches move with a bulk 
move section on the LRU doesn't even occur because for that a concurrent 
process would need to grab the common lock of the BOs in the bulk move 
section.

Regards,
Christian.


>
> Changes in previous series:
> - Completely rework the functionality
> - Avoid a NULL pointer dereference assigning manager->mem_type
> - Remove some leftover code causing build problems
> v2:
> - For hitch bulk tail moves, store the mem_type in the cursor
>    instead of with the manager.
> v3:
> - Remove leftover mem_type member from change in v2.
> v6:
> - Add some lockdep asserts (Matthew Brost)
> - Avoid NULL pointer dereference (Matthew Brost)
> - No need to check bo->resource before dereferencing
>    bo->bulk_move (Matthew Brost)
>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> Cc: Matthew Brost <matthew.brost@intel.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c |  4 ++
>   drivers/gpu/drm/ttm/ttm_resource.c     | 92 ++++++++++++++++++++++++++
>   drivers/gpu/drm/xe/xe_vm.c             |  4 ++
>   include/drm/ttm/ttm_resource.h         | 56 ++++++++++------
>   4 files changed, 135 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> index 3abfa66d72a2..97743993d711 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c
> @@ -2420,6 +2420,8 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>   	if (r)
>   		return r;
>   
> +	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
> +
>   	vm->is_compute_context = false;
>   
>   	vm->use_cpu_for_update = !!(adev->vm_manager.vm_update_mode &
> @@ -2484,6 +2486,7 @@ int amdgpu_vm_init(struct amdgpu_device *adev, struct amdgpu_vm *vm,
>   error_free_delayed:
>   	dma_fence_put(vm->last_tlb_flush);
>   	dma_fence_put(vm->last_unlocked);
> +	ttm_lru_bulk_move_fini(&adev->mman.bdev, &vm->lru_bulk_move);
>   	amdgpu_vm_fini_entities(vm);
>   
>   	return r;
> @@ -2640,6 +2643,7 @@ void amdgpu_vm_fini(struct amdgpu_device *adev, struct amdgpu_vm *vm)
>   		}
>   	}
>   
> +	ttm_lru_bulk_move_fini(&adev->mman.bdev, &vm->lru_bulk_move);
>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index 9c8b6499edfb..b6a2daac5518 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -33,6 +33,53 @@
>   
>   #include <drm/drm_util.h>
>   
> +/* Detach the cursor from the bulk move list*/
> +static void
> +ttm_resource_cursor_clear_bulk(struct ttm_resource_cursor *cursor)
> +{
> +	lockdep_assert_held(&cursor->man->bdev->lru_lock);
> +
> +	cursor->bulk = NULL;
> +	list_del_init(&cursor->bulk_link);
> +}
> +
> +/* Move the cursor to the end of the bulk move list it's in */
> +static void ttm_resource_cursor_move_bulk_tail(struct ttm_lru_bulk_move *bulk,
> +					       struct ttm_resource_cursor *cursor)
> +{
> +	struct ttm_lru_bulk_move_pos *pos;
> +
> +	lockdep_assert_held(&cursor->man->bdev->lru_lock);
> +
> +	if (WARN_ON_ONCE(bulk != cursor->bulk)) {
> +		list_del_init(&cursor->bulk_link);
> +		return;
> +	}
> +
> +	pos = &bulk->pos[cursor->mem_type][cursor->priority];
> +	if (pos->last)
> +		list_move(&cursor->hitch.link, &pos->last->lru.link);
> +	ttm_resource_cursor_clear_bulk(cursor);
> +}
> +
> +/* Move all cursors attached to a bulk move to its end */
> +static void ttm_bulk_move_adjust_cursors(struct ttm_lru_bulk_move *bulk)
> +{
> +	struct ttm_resource_cursor *cursor, *next;
> +
> +	list_for_each_entry_safe(cursor, next, &bulk->cursor_list, bulk_link)
> +		ttm_resource_cursor_move_bulk_tail(bulk, cursor);
> +}
> +
> +/* Remove a cursor from an empty bulk move list */
> +static void ttm_bulk_move_drop_cursors(struct ttm_lru_bulk_move *bulk)
> +{
> +	struct ttm_resource_cursor *cursor, *next;
> +
> +	list_for_each_entry_safe(cursor, next, &bulk->cursor_list, bulk_link)
> +		ttm_resource_cursor_clear_bulk(cursor);
> +}
> +
>   /**
>    * ttm_resource_cursor_fini_locked() - Finalize the LRU list cursor usage
>    * @cursor: The struct ttm_resource_cursor to finalize.
> @@ -45,6 +92,7 @@ void ttm_resource_cursor_fini_locked(struct ttm_resource_cursor *cursor)
>   {
>   	lockdep_assert_held(&cursor->man->bdev->lru_lock);
>   	list_del_init(&cursor->hitch.link);
> +	ttm_resource_cursor_clear_bulk(cursor);
>   }
>   
>   /**
> @@ -73,9 +121,27 @@ void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor)
>   void ttm_lru_bulk_move_init(struct ttm_lru_bulk_move *bulk)
>   {
>   	memset(bulk, 0, sizeof(*bulk));
> +	INIT_LIST_HEAD(&bulk->cursor_list);
>   }
>   EXPORT_SYMBOL(ttm_lru_bulk_move_init);
>   
> +/**
> + * ttm_lru_bulk_move_fini - finalize a bulk move structure
> + * @bdev: The struct ttm_device
> + * @bulk: the structure to finalize
> + *
> + * Sanity checks that bulk moves don't have any
> + * resources left and hence no cursors attached.
> + */
> +void ttm_lru_bulk_move_fini(struct ttm_device *bdev,
> +			    struct ttm_lru_bulk_move *bulk)
> +{
> +	spin_lock(&bdev->lru_lock);
> +	ttm_bulk_move_drop_cursors(bulk);
> +	spin_unlock(&bdev->lru_lock);
> +}
> +EXPORT_SYMBOL(ttm_lru_bulk_move_fini);
> +
>   /**
>    * ttm_lru_bulk_move_tail - bulk move range of resources to the LRU tail.
>    *
> @@ -88,6 +154,7 @@ void ttm_lru_bulk_move_tail(struct ttm_lru_bulk_move *bulk)
>   {
>   	unsigned i, j;
>   
> +	ttm_bulk_move_adjust_cursors(bulk);
>   	for (i = 0; i < TTM_NUM_MEM_TYPES; ++i) {
>   		for (j = 0; j < TTM_MAX_BO_PRIORITY; ++j) {
>   			struct ttm_lru_bulk_move_pos *pos = &bulk->pos[i][j];
> @@ -515,6 +582,28 @@ void ttm_resource_manager_debug(struct ttm_resource_manager *man,
>   }
>   EXPORT_SYMBOL(ttm_resource_manager_debug);
>   
> +static void
> +ttm_resource_cursor_check_bulk(struct ttm_resource_cursor *cursor,
> +			       struct ttm_lru_item *next_lru)
> +{
> +	struct ttm_resource *next = ttm_lru_item_to_res(next_lru);
> +	struct ttm_lru_bulk_move *bulk = NULL;
> +	struct ttm_buffer_object *bo = next->bo;
> +
> +	lockdep_assert_held(&cursor->man->bdev->lru_lock);
> +	bulk = bo->bulk_move;
> +
> +	if (cursor->bulk != bulk) {
> +		if (bulk) {
> +			list_move_tail(&cursor->bulk_link, &bulk->cursor_list);
> +			cursor->mem_type = next->mem_type;
> +		} else {
> +			list_del_init(&cursor->bulk_link);
> +		}
> +		cursor->bulk = bulk;
> +	}
> +}
> +
>   /**
>    * ttm_resource_manager_first() - Start iterating over the resources
>    * of a resource manager
> @@ -535,6 +624,7 @@ ttm_resource_manager_first(struct ttm_resource_manager *man,
>   	cursor->priority = 0;
>   	cursor->man = man;
>   	ttm_lru_item_init(&cursor->hitch, TTM_LRU_HITCH);
> +	INIT_LIST_HEAD(&cursor->bulk_link);
>   	list_add(&cursor->hitch.link, &man->lru[cursor->priority]);
>   
>   	return ttm_resource_manager_next(cursor);
> @@ -559,6 +649,7 @@ ttm_resource_manager_next(struct ttm_resource_cursor *cursor)
>   		lru = &cursor->hitch;
>   		list_for_each_entry_continue(lru, &man->lru[cursor->priority], link) {
>   			if (ttm_lru_item_is_res(lru)) {
> +				ttm_resource_cursor_check_bulk(cursor, lru);
>   				list_move(&cursor->hitch.link, &lru->link);
>   				return ttm_lru_item_to_res(lru);
>   			}
> @@ -568,6 +659,7 @@ ttm_resource_manager_next(struct ttm_resource_cursor *cursor)
>   			break;
>   
>   		list_move(&cursor->hitch.link, &man->lru[cursor->priority]);
> +		ttm_resource_cursor_clear_bulk(cursor);
>   	}
>   
>   	ttm_resource_cursor_fini_locked(cursor);
> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
> index 5b166fa03684..0c7e327bc9a2 100644
> --- a/drivers/gpu/drm/xe/xe_vm.c
> +++ b/drivers/gpu/drm/xe/xe_vm.c
> @@ -1335,6 +1335,8 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>   
>   	INIT_WORK(&vm->destroy_work, vm_destroy_work_func);
>   
> +	ttm_lru_bulk_move_init(&vm->lru_bulk_move);
> +
>   	INIT_LIST_HEAD(&vm->preempt.exec_queues);
>   	vm->preempt.min_run_period_ms = 10;	/* FIXME: Wire up to uAPI */
>   
> @@ -1458,6 +1460,7 @@ struct xe_vm *xe_vm_create(struct xe_device *xe, u32 flags)
>   	mutex_destroy(&vm->snap_mutex);
>   	for_each_tile(tile, xe, id)
>   		xe_range_fence_tree_fini(&vm->rftree[id]);
> +	ttm_lru_bulk_move_fini(&xe->ttm, &vm->lru_bulk_move);
>   	kfree(vm);
>   	if (flags & XE_VM_FLAG_LR_MODE)
>   		xe_pm_runtime_put(xe);
> @@ -1601,6 +1604,7 @@ static void vm_destroy_work_func(struct work_struct *w)
>   		XE_WARN_ON(vm->pt_root[id]);
>   
>   	trace_xe_vm_free(vm);
> +	ttm_lru_bulk_move_fini(&xe->ttm, &vm->lru_bulk_move);
>   	kfree(vm);
>   }
>   
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> index 8fac781f641e..571abb4861a6 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -269,26 +269,6 @@ ttm_lru_item_to_res(struct ttm_lru_item *item)
>   	return container_of(item, struct ttm_resource, lru);
>   }
>   
> -/**
> - * struct ttm_resource_cursor
> - *
> - * @man: The resource manager currently being iterated over.
> - * @hitch: A hitch list node inserted before the next resource
> - * to iterate over.
> - * @priority: the current priority
> - *
> - * Cursor to iterate over the resources in a manager.
> - */
> -struct ttm_resource_cursor {
> -	struct ttm_resource_manager *man;
> -	struct ttm_lru_item hitch;
> -	unsigned int priority;
> -};
> -
> -void ttm_resource_cursor_fini_locked(struct ttm_resource_cursor *cursor);
> -
> -void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor);
> -
>   /**
>    * struct ttm_lru_bulk_move_pos
>    *
> @@ -304,8 +284,9 @@ struct ttm_lru_bulk_move_pos {
>   
>   /**
>    * struct ttm_lru_bulk_move
> - *
>    * @pos: first/last lru entry for resources in the each domain/priority
> + * @cursor_list: The list of cursors currently traversing any of
> + * the sublists of @pos. Protected by the ttm device's lru_lock.
>    *
>    * Container for the current bulk move state. Should be used with
>    * ttm_lru_bulk_move_init() and ttm_bo_set_bulk_move().
> @@ -315,8 +296,39 @@ struct ttm_lru_bulk_move_pos {
>    */
>   struct ttm_lru_bulk_move {
>   	struct ttm_lru_bulk_move_pos pos[TTM_NUM_MEM_TYPES][TTM_MAX_BO_PRIORITY];
> +	struct list_head cursor_list;
>   };
>   
> +/**
> + * struct ttm_resource_cursor
> + * @man: The resource manager currently being iterated over
> + * @hitch: A hitch list node inserted before the next resource
> + * to iterate over.
> + * @bulk_link: A list link for the list of cursors traversing the
> + * bulk sublist of @bulk. Protected by the ttm device's lru_lock.
> + * @bulk: Pointer to struct ttm_lru_bulk_move whose subrange @hitch is
> + * inserted to. NULL if none. Never dereference this pointer since
> + * the struct ttm_lru_bulk_move object pointed to might have been
> + * freed. The pointer is only for comparison.
> + * @mem_type: The memory type of the LRU list being traversed.
> + * This field is valid iff @bulk != NULL.
> + * @priority: the current priority
> + *
> + * Cursor to iterate over the resources in a manager.
> + */
> +struct ttm_resource_cursor {
> +	struct ttm_resource_manager *man;
> +	struct ttm_lru_item hitch;
> +	struct list_head bulk_link;
> +	struct ttm_lru_bulk_move *bulk;
> +	unsigned int mem_type;
> +	unsigned int priority;
> +};
> +
> +void ttm_resource_cursor_fini_locked(struct ttm_resource_cursor *cursor);
> +
> +void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor);
> +
>   /**
>    * struct ttm_kmap_iter_iomap - Specialization for a struct io_mapping +
>    * struct sg_table backed struct ttm_resource.
> @@ -405,6 +417,8 @@ ttm_resource_manager_cleanup(struct ttm_resource_manager *man)
>   
>   void ttm_lru_bulk_move_init(struct ttm_lru_bulk_move *bulk);
>   void ttm_lru_bulk_move_tail(struct ttm_lru_bulk_move *bulk);
> +void ttm_lru_bulk_move_fini(struct ttm_device *bdev,
> +			    struct ttm_lru_bulk_move *bulk);
>   
>   void ttm_resource_add_bulk_move(struct ttm_resource *res,
>   				struct ttm_buffer_object *bo);

