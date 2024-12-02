Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC7AF9DFB8F
	for <lists+dri-devel@lfdr.de>; Mon,  2 Dec 2024 09:00:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C639010E433;
	Mon,  2 Dec 2024 08:00:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="uOMnFNLo";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2041.outbound.protection.outlook.com [40.107.220.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E27E10E433;
 Mon,  2 Dec 2024 08:00:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EtN089S51PVgdmsCpL022EtWoSAElJRFqOszNCKI0QRyg22KHniUtGh9r7c2ipKpj1k/w+c37C+m1GATuU4Dyqkqszkg/FgiUgYk59mY/6f9gvddy2RJmiWkjYkmjfosMOL5eOxDAEEJnvx0uBUtSUlA/0kMIJmMPvETSctOdtl4JwyRvQiXdksbV7JuBtWlckyWoqVJhrYSdcnzDoYJxoY1y6NG57JrR99tAuWKJqGV4/2+N0MNNf482FECSfpycMZFeVQn/GGzEOUJa5z8Jmn0hCc9ZcXp27i8jb1cyY66fMgCHuPTDZ51UhshtmKD4URQxOnG+GN7oOkNNr8S3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/pL59ROiBsvBwO148B2no9lY+o45sz13kthoBWZJo10=;
 b=S1JmEcqX60j2lOCPSqRf2oJ8tyruuoQCJV5RgU4QbZ5AIob2ZMXjmIltZ4W8BH++GQrxV6Y246ev1ftczMz6jMgTm/ks6mHL+F3OOn3XZnBVND10xgWLLc5xmDh4AYFwI9dceZT1VPpD/KjnJnjeHeQpgtyYuBeAp8cTS0Vw9nMZDQyhE5Ar59ozMWLaKaXvIELjeEKoRIQj8X0pEZNv9Kc0jlSSqtN2+4Bt6CsqHUWl3FLLaj3uZ4SLxNa1h9Y6ruI34MQXzgQ4Kcx49N7xNrZVownLwpW8xQWe+DrV++9GCv66Xr/BmUSZdcmPcsM1IjA3MfY86YM9i3QKAt/D4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/pL59ROiBsvBwO148B2no9lY+o45sz13kthoBWZJo10=;
 b=uOMnFNLo3tsGkC+sXYdEaqYDBjXKXqnWr/Y4TAU3xB0+Y/dvb1N8mpHbjnT3WaS6w316SD2s1+ELgocGFzUcCnO73s9sBET2Vz3UfZem+TZvKz39Cyj20EAs1ZjNQk2H0cQ6Y6h2eqU6Q9IUq7lSp1tw1doByv5vCY/DmsSTvJ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MN2PR12MB4239.namprd12.prod.outlook.com (2603:10b6:208:1d2::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Mon, 2 Dec
 2024 08:00:49 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::46fb:96f2:7667:7ca5%5]) with mapi id 15.20.8207.017; Mon, 2 Dec 2024
 08:00:49 +0000
Message-ID: <ced840af-89cf-4285-bd02-c1cf9261ad60@amd.com>
Date: Mon, 2 Dec 2024 09:00:39 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/8] drm/ttm: Add ttm_bo_access
To: Rodrigo Vivi <rodrigo.vivi@intel.com>, maarten.lankhorst@linux.intel.com, 
 mripard@kernel.org, tzimmermann@suse.de
Cc: Matthew Brost <matthew.brost@intel.com>, intel-xe@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, thomas.hellstrom@linux.intel.com
References: <20241126174615.2665852-1-matthew.brost@intel.com>
 <20241126174615.2665852-3-matthew.brost@intel.com>
 <0554dd02-06a5-4da1-821a-e2b26b651402@amd.com> <Z0hKSYRokwJoi_T1@intel.com>
Content-Language: en-US
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <Z0hKSYRokwJoi_T1@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: FR3P281CA0178.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a0::19) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MN2PR12MB4239:EE_
X-MS-Office365-Filtering-Correlation-Id: ccfdb1ef-f769-411c-9fe6-08dd12a76f14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NTVOWE03UnBNempUbEtDRld3Z3FVRDIzNm91eVZPSXR1Q0Z6YlhQaEdNK3JP?=
 =?utf-8?B?SE5iNjROOWtkWEIzVDM3di9QTkdkYXA0Si96QW9nS0pWQWh1d3NXTGp6d0tX?=
 =?utf-8?B?MEJ3aXVhV1dWZ1ZCQnFha2ZBbGJybnk0VGRBeFhTZlZJQVdKV0RlSE82cjcz?=
 =?utf-8?B?cExTNkxmazAweEpPSmFIb0FEMzdIUUp3cndkUHBkazdmbFNqZk45Z3FzODlP?=
 =?utf-8?B?VW5veWplNXJkWkVGS0x0QVdjRzVDZkV1K2E1RXdQdExzV0ZzK2tKQUhuOXNF?=
 =?utf-8?B?NVhBazhnbU5hTEg1dkNDV0VJdDl2RHlDODIyV0FSRjk4UUJwT2pEUlVEK0hS?=
 =?utf-8?B?emNUR1ZYdElFMFR6VHU0Z3gzbkttL0FtcE5kREJyZUZ5MXB4MVliSnJ3QUNY?=
 =?utf-8?B?L1Vxc0YrUXJjNGJZYzdRck9sN0dzamhaT256UnY1aGNlMmRZZ2xkdjRBcU9C?=
 =?utf-8?B?c2VEL3RNV2UyZVZmZmthODZFWUtUbDBHTEwwRGxBenhTOExMUEZGKzBBK3Ro?=
 =?utf-8?B?VWZCYk90UkJESE1aN0gzMFIvY21wYS9rY3E0b1JmQk4vcDVpWHMxc0VXUDZl?=
 =?utf-8?B?YS92Zlh5YXE4eVBjRFN1b085Rll0MmJsTG1lOXBuVXJNR0dRandlTmVjS2pQ?=
 =?utf-8?B?ekZablFPWnFlcU8xYnN5S0NNVUJFaHBqczlxTzVFRE5Oa05tNWFjMi9nbFUy?=
 =?utf-8?B?ODdFTUdGU1M3bzAvUDIxc0RQNklJMER5TjBaVFpRVU1PK2VFZDVHVzNyajdq?=
 =?utf-8?B?OEFnWG5aS1F0eWFZRGRFNkNGcFEwcVVDT0ZreGErNlR3TXNBZFNraVU4WnQx?=
 =?utf-8?B?OXdSWmhKbHl3enFxYjMySDI5US96a1lJVVMxQTVCUkJGdTdaZ3RuTTViYWJ6?=
 =?utf-8?B?VE5Zd2h3OWxScDQyN0lwdVJyeVFTTlBGeG9UN2ZmQU9wZ1NmL21sYjFRYmJD?=
 =?utf-8?B?UW95UFc3ckhiUkE1L1VkRWxwZUJ6OVZJcTZ3bGZLcG56RFdpQ2hDdzVEYWJa?=
 =?utf-8?B?ZmlFa3JGV0o2L2gwT0FpUzc5aEdBM1o3bEU5d0hrL1R1RllIc2MrRHFtZTRH?=
 =?utf-8?B?aDUxeVlsYjJOTm1zcTE1N0FiOEZVSEN0aHRWN1dZVGhCc1NFK0poeHJLUUVn?=
 =?utf-8?B?UWpCQzRFS2wrOXlES05lSUpKWjNYbDN6UFhxNkZMeEE5a0NtOENSYkZjd2Uy?=
 =?utf-8?B?V3kwUURhZWhqWStOYXJnSDFrZWhaV3hXRG5aQUd6SUFQSXFZcDhkZ2NrTnlW?=
 =?utf-8?B?cUUwVVZsYWU3cjZBcFpOOXZSZ2lHM3ZJOVpBZzV5NzhCcXlmWWFWai9rTC9R?=
 =?utf-8?B?NklvaTQ5dzVnNGxUNlFZWmpzWVlNOExWWHlmcmJBRkk2Uy93NHJTMUUydVYv?=
 =?utf-8?B?dmhrOXlPOWNtZXBwWlpLOXlDcVYrdE1vYUpjU3pReG5RdmhzNkJCaTBLNTU4?=
 =?utf-8?B?ZmRSWE82aUNFdHJBTXBla2VLRWVjd0VNeHpYcURjYW9CcEloYXBZMCt0Rys0?=
 =?utf-8?B?KzNCSHNEcTBQWkRwVFpzUnlNK3BWVjg0NDdzaHErY1hyYVhLOENwWDBoNGFy?=
 =?utf-8?B?VkhIdXRpZktKUGFqN3MxOU9CSUJFYndndW5xUFhzOUNNT1FGbmo0REpJWXNu?=
 =?utf-8?B?SGlaeHhFRmlwVjN0Smh2S3FvN2NmOUp0cmp2UldYbDdBbTNJZUp2UG4wSDV4?=
 =?utf-8?B?UmtucXBSVnR2Ky9LM2tDb1AyV1hjbGs3c214MmJCdzYzaFpKUVBKdFBRSStO?=
 =?utf-8?B?NWc0YXhCV0t1dGlhVW5GUEk0ZXFsUkdtM0l6OFMrT1MwejVZT3RjYTFlQzRY?=
 =?utf-8?B?bzduM1pGay9XVDN5MnFiZz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TzFDQk12cmE1U0I2ZHNjNHFKSW1QcG4rREgyOGg1SjVLdHhLaUQrbDVwS2Jz?=
 =?utf-8?B?eW1FeWJHbGdtdG00MHVENTZRU3M3R2grRDdQL2hMMXZOT3QvSE1YZUh4T2VU?=
 =?utf-8?B?cGN2NGxsWWUxQmFrc3hjV0FMZCtiL0V5WDJVRE55N05UeDZ3c2xhZCtKVTJw?=
 =?utf-8?B?a3pxNktWT0hjUVhxd25TRHVVT3I5STNpSUg0NFdub3FMRi9UN3gwUWFjTkxx?=
 =?utf-8?B?MCsrYzhHM1A2MG5pTmJKeWI5Rm90TlhVdTJaWjlXdTRuY2lDZVVVWFNXWTla?=
 =?utf-8?B?ZTArYit4emt2czliQVc4Z3NwVUp0eXc0bUtOdWIyeEJ2ajlBN2dtMnB0UlF3?=
 =?utf-8?B?WWtlT3FtOWNXcWVNdGQzUnlZaWl1d0tmYnVNYjlBV2Y1RThLK0RvdnZaWWMy?=
 =?utf-8?B?cmFmMXFjSG5tcUdjZGJmQzQzZTVndE5xSGxOMWtkeXFycDE0c2c3THpXWFRU?=
 =?utf-8?B?ZWY3bWlaUnpNM0lnQ3BDYkIraXR0Q1dmMkgrWGFERXFSSDF3MGN4ZDZMejg0?=
 =?utf-8?B?bUpPZG83SWpTZEF5ZGFicTZZVFlud3VqMVdPUWZtUFVEQ3NaQXBJQmhqUGoy?=
 =?utf-8?B?MTlvUkVnS1hHV3BPbDNrd3VCWlRxUStsdFhCT0tTdUtycGhHUUF6ZTl5VXhm?=
 =?utf-8?B?SHZrQlZIUi90Q3RwQ0lQVHluTUk4dkhWWStMOEhsenBPWVk2YThoRTFXK0Fm?=
 =?utf-8?B?QTFrWWlxRUhZanRzRXRSZzVpUDFZM2FMVUFsNHJNVmMzbHNXK2JFTFhjTDgy?=
 =?utf-8?B?U3YvRlRiM281SDlSK1J4Rkg0ZHpwb01ROHpWZE55cGVEZVFpWUZvenNIUENH?=
 =?utf-8?B?NGFjcW1rQ0lYMWdYZ1NzZWI2ZE5PaGs2enVUcFpsdEQreVp1SnJ1MmtkTy93?=
 =?utf-8?B?RGxLWnk4ZWpjbWJsK01qNEhvSldKNDBrejZSWDcvUjN6N1NJRFY5RkhPQ2Ry?=
 =?utf-8?B?SmxtTmNScUFvdGNwa1pPZkU0MDNxOE5iOElMaXk5WnVDYW9ZdEZWL1ExeW43?=
 =?utf-8?B?Q0RtVWJhQjQ3Z09vbzU3WS9MenRGT3c3S1licmJlb0Y4ZnJuSXg0UC8xcVFV?=
 =?utf-8?B?WDlIRXFXSFlxN21iSGVVeVl4WDd5YmovOVJJcVBwcVEyelY2Y0c3V1J6NklK?=
 =?utf-8?B?b216T1NuVFNialpiMnBBRlFIMVQ1dDZxc24zYkpocjJCWk1oKzkzSENIaWYw?=
 =?utf-8?B?S1RjSGpJVVROeUoyNDFKYnJnTGlGU1UzQ0FqVEVEUE5iUUJKMUY5aDNwN3Bh?=
 =?utf-8?B?amg4N09sRUhhWFRYNVEzcWlCQ0FEWTlJbjJFY2R6eHF6dnBvTXorekVkR1ZB?=
 =?utf-8?B?NzBvZldrQ0hzcklDclpIRVdGajhkOUZEZWFIOEVFNldhVysydFJCemdpRCtX?=
 =?utf-8?B?WUxzN1lQUFkyNkRPNlFPOXpXYklpd2h1QmliL2R4U09TVThqQ3U5azZTK0Nn?=
 =?utf-8?B?U3V0ZGdLUXhsYldDdmpJWUovK3FTZVV5dmk2OFV1L2tGaDJVeXFFdVZXdVN5?=
 =?utf-8?B?SlQ3SlJyZUg1WEw3bDBzVlUzZEwxOTl2SVZWbElKNHl2MGZwRzIyanUvcDlx?=
 =?utf-8?B?NGxzWVFlRlliK2x3cWpHdUpVaWtHcCt1QkZyckhBQUxVRGg0cUMvNWNWbmNM?=
 =?utf-8?B?elR4UjBXK3ZOcXNoK3NBWk5vYytiWEFTRXNqVGhQbFExcnFpNlgwYmR3elF2?=
 =?utf-8?B?WDRlU3ltMGgzVlRSbGF6Q2dhNWZNemxrWDU2aGQrM3dPTzRQa1RybzRDWkdE?=
 =?utf-8?B?UnpqNmZCcjc3OWVuQVFvSGNNR1JVQjIzeXFWdnZDekhNZ3M0T2lSa0FzdUlk?=
 =?utf-8?B?blJiSUVOWVlJSm4yWFluZUN5K2t2N1J2ZVg1TFlJM2s1cW9Eb3dYcm9YeXpv?=
 =?utf-8?B?eHZzVW8zN0RVeGlGOUt6QnB3a3VOSGR6T3BuajdiRXRCYlBnd2E4OENYQXFW?=
 =?utf-8?B?SEpaS2EwSGV5djB2QU5vd1RSUm1UT051SDBOay9Ec3lBVHlidWxhT0dvK3U5?=
 =?utf-8?B?dVJ1QzdMcFpxTmFOQ01WQ0Y1UEM1OHoxSTJlSmN3QnZ3NDZRRWN1cmdEaHBZ?=
 =?utf-8?B?YXpteis4R1dpRUcrQU5RSU1rSzFZeHdtSHlSMzJaczd5QzlzK0Rpd3IxdlBy?=
 =?utf-8?Q?JbTQ=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccfdb1ef-f769-411c-9fe6-08dd12a76f14
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Dec 2024 08:00:49.2023 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YG4GRtoglEPoMG7F1H89qMlPkr76WU20oGbTFKp4EyUIf/7iqtWPD/9mn+WaOrui
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4239
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

Am 28.11.24 um 11:47 schrieb Rodrigo Vivi:
> On Wed, Nov 27, 2024 at 02:19:32PM +0100, Christian König wrote:
>> Am 26.11.24 um 18:46 schrieb Matthew Brost:
>>> Non-contiguous VRAM cannot easily be mapped in TTM nor can non-visible
>>> VRAM easily be accessed. Add ttm_bo_access, which is similar to
>>> ttm_bo_vm_access, to access such memory.
>>>
>>> v4:
>>>    - Fix checkpatch warnings (CI)
>>> v5:
>>>    - Fix checkpatch warnings (CI)
>>> v6:
>>>    - Fix kernel doc (Auld)
>>> v7:
>>>    - Move ttm_bo_access to ttm_bo_vm.c (Christian)
>>>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Reported-by: Christoph Manszewski <christoph.manszewski@intel.com>
>>> Suggested-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>> Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>>> Tested-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
>>> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
> Thank you!
>
> Ack on get this through drm-xe-next?

I already agreed to that in the other mail to Matthew.

Regards,
Christian.

>
> drm-misc-maintainers?
>
>>> ---
>>>    drivers/gpu/drm/ttm/ttm_bo_vm.c | 40 ++++++++++++++++++++++++++-------
>>>    include/drm/ttm/ttm_bo.h        |  2 ++
>>>    2 files changed, 34 insertions(+), 8 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/ttm/ttm_bo_vm.c b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>> index 2c699ed1963a..f02d3966cc84 100644
>>> --- a/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>> +++ b/drivers/gpu/drm/ttm/ttm_bo_vm.c
>>> @@ -405,13 +405,25 @@ static int ttm_bo_vm_access_kmap(struct ttm_buffer_object *bo,
>>>    	return len;
>>>    }
>>> -int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>>> -		     void *buf, int len, int write)
>>> +/**
>>> + * ttm_bo_access - Helper to access a buffer object
>>> + *
>>> + * @bo: ttm buffer object
>>> + * @offset: access offset into buffer object
>>> + * @buf: pointer to caller memory to read into or write from
>>> + * @len: length of access
>>> + * @write: write access
>>> + *
>>> + * Utility function to access a buffer object. Useful when buffer object cannot
>>> + * be easily mapped (non-contiguous, non-visible, etc...). Should not directly
>>> + * be exported to user space via a peak / poke interface.
>>> + *
>>> + * Returns:
>>> + * @len if successful, negative error code on failure.
>>> + */
>>> +int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
>>> +		  void *buf, int len, int write)
>>>    {
>>> -	struct ttm_buffer_object *bo = vma->vm_private_data;
>>> -	unsigned long offset = (addr) - vma->vm_start +
>>> -		((vma->vm_pgoff - drm_vma_node_start(&bo->base.vma_node))
>>> -		 << PAGE_SHIFT);
>>>    	int ret;
>>>    	if (len < 1 || (offset + len) > bo->base.size)
>>> @@ -429,8 +441,8 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>>>    		break;
>>>    	default:
>>>    		if (bo->bdev->funcs->access_memory)
>>> -			ret = bo->bdev->funcs->access_memory(
>>> -				bo, offset, buf, len, write);
>>> +			ret = bo->bdev->funcs->access_memory
>>> +				(bo, offset, buf, len, write);
>>>    		else
>>>    			ret = -EIO;
>>>    	}
>>> @@ -439,6 +451,18 @@ int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>>>    	return ret;
>>>    }
>>> +EXPORT_SYMBOL(ttm_bo_access);
>>> +
>>> +int ttm_bo_vm_access(struct vm_area_struct *vma, unsigned long addr,
>>> +		     void *buf, int len, int write)
>>> +{
>>> +	struct ttm_buffer_object *bo = vma->vm_private_data;
>>> +	unsigned long offset = (addr) - vma->vm_start +
>>> +		((vma->vm_pgoff - drm_vma_node_start(&bo->base.vma_node))
>>> +		 << PAGE_SHIFT);
>>> +
>>> +	return ttm_bo_access(bo, offset, buf, len, write);
>>> +}
>>>    EXPORT_SYMBOL(ttm_bo_vm_access);
>>>    static const struct vm_operations_struct ttm_bo_vm_ops = {
>>> diff --git a/include/drm/ttm/ttm_bo.h b/include/drm/ttm/ttm_bo.h
>>> index 5804408815be..8ea11cd8df39 100644
>>> --- a/include/drm/ttm/ttm_bo.h
>>> +++ b/include/drm/ttm/ttm_bo.h
>>> @@ -421,6 +421,8 @@ void ttm_bo_unpin(struct ttm_buffer_object *bo);
>>>    int ttm_bo_evict_first(struct ttm_device *bdev,
>>>    		       struct ttm_resource_manager *man,
>>>    		       struct ttm_operation_ctx *ctx);
>>> +int ttm_bo_access(struct ttm_buffer_object *bo, unsigned long offset,
>>> +		  void *buf, int len, int write);
>>>    vm_fault_t ttm_bo_vm_reserve(struct ttm_buffer_object *bo,
>>>    			     struct vm_fault *vmf);
>>>    vm_fault_t ttm_bo_vm_fault_reserved(struct vm_fault *vmf,

