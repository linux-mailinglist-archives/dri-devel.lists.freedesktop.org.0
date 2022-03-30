Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A3D04EBD48
	for <lists+dri-devel@lfdr.de>; Wed, 30 Mar 2022 11:10:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D21310F741;
	Wed, 30 Mar 2022 09:09:57 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2088.outbound.protection.outlook.com [40.107.223.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88F6310F5FC;
 Wed, 30 Mar 2022 09:09:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DXMpM8tBBPYJ338oA5PAE5EWlQqILthgRrwMvKW2CJiatSXC9HnT6EmRCd7499KV6TcKfmbzNfyGPJdb7DEtrkOwr/eEf39xHb7a9jx1u6+qHYW6IjSnEOl5Yo+WAbTi1zkJfJSCESL96XzKlQfWX1ytRx+eB4lG5/6DncXco1e/Uqmef8geouhxFSDaxPA+pG8Qla4P5tOZakPMSq0LqoOv3Nxbgq7Wz5j4xyWbS9GXhS60N3mNOQUcedsBebM0W+v9M2e0TPsnnFEFB08NwzDn2/CngzjnkLvjde7kJFn0nAuwc4PDCACkFfTUhaxuIgk69qsWTdF+G46RunlSxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M+cQl4a9liwGrOz7ORNCocINjD9wOAHQVIJKIJBnTNA=;
 b=H2b4lhP8HhqZWy3vBrXnTo5/n8j9BdzsgsICg7IWWn2TnSWhx9v8zO6slIrUQ9VkbZGDoB9Kx/QpOOOoSJVIQ+PeHJKjFQsl/Vz3aJ3PElqrAneiDteHU6WayniEOheKB8QvObao0DiIKq3DUEeUVAWdV3qmx8FwKzEJOu7vDt498Tvx8Aq8kbtl8noDp15+mqeS8ocB9DX8kTgSQ8MQfQWyg7Z3tsq138ay6C+xprksgAVFv1QDyTteqYAs8DDe/GlzzkeZn3tmf4IEpgdpFiiZ8vA9jC93Ny19UZ6ZIFrScz3BfIfpzI54laeMgLi82JJlJUQx4f+JaESNQTunFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M+cQl4a9liwGrOz7ORNCocINjD9wOAHQVIJKIJBnTNA=;
 b=UEQSQ0qyziFgmVcmvyOFi4aQaAM4WzetcDiBetvB5G1FaVHc6cWg0UI4jcrfzlUIrEKJp/+vLs3jXYvAEcQ9wneNw/7Ti56YyUdLyzl7oi/5ZeraVUn/kQSOWEp3EeUqx5nKA+5J+AIXdBjst3V275LcFMoQCpjI2B0BPpqplJM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by DM5PR12MB1898.namprd12.prod.outlook.com (2603:10b6:3:10d::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5102.18; Wed, 30 Mar
 2022 09:09:51 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::48e2:1306:25a3:5f14]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::48e2:1306:25a3:5f14%6]) with mapi id 15.20.5102.023; Wed, 30 Mar 2022
 09:09:51 +0000
Message-ID: <65d77a10-897a-fce6-28c9-321f3c723129@amd.com>
Date: Wed, 30 Mar 2022 14:50:08 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH] drm: round_up the size to the alignment value
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org
References: <20220330090410.135332-1-Arunpravin.PaneerSelvam@amd.com>
 <c0b22bc3-8bad-fd19-6d1d-164bfee851c4@amd.com>
From: Arunpravin Paneer Selvam <arunpravin.paneerselvam@amd.com>
In-Reply-To: <c0b22bc3-8bad-fd19-6d1d-164bfee851c4@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN2PR01CA0066.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:23::11) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: a5d8cec7-c127-4f4f-bb3f-08da122d0bf3
X-MS-TrafficTypeDiagnostic: DM5PR12MB1898:EE_
X-Microsoft-Antispam-PRVS: <DM5PR12MB1898E3C7E22FB964583FC53CE41F9@DM5PR12MB1898.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 8cGZf141HlDhNHlx+3cvDTgTm+0x2GiBlr4TJ24lNh9KnazNiRZ+B5lj8A9cnnS80VQQSDZyRrJzcpHSOioZ+hMTisBkNxa9CNdIIk01/cH+Vnbum5g+0nfHiI1D9L2A0Y6wI30CxT46MDNyXIK+/TK9A4Ls+VHa94BvuWGg54wqh5oyBJ9hFpfSyhixdYvJTXk5v/MqDlTH0x03vDDmE+yHp2P9dX09/YaBwaJ7a0os7C6l7yye/qnXq+gor5Cvu59q7+Rey73URHgEKU2PIq0Uqki+EEkueg7Mwzh+M2sujuPhRNvWSdT1wGwuqbnvQFMAkVYlL9WlU3DZPgTp2sywR7Xnovfc0NUe8hPPxEXRisYT0Nv/9AQ0+TP58XgIjLnwgf3QYrM/dWCvGNnigah1LiHZffP1yqNomnnapp8JVqZ58ZdPcmvP0/XQtWP0te8eydk3TXCHa5Ie1TfM6iCUR/ZS17iecfGgppWzQenoxTHjqVPT2C/pX5mfT+LPVVrl3AZycYUOj/Ocozy3ScHZ4ALpvPgfqbZsrGO4AZdtaMpFfgq+4K7GE8yh1GgRlXTQaFNVhIXfho74pA4pvaZfXbV//+6K6tcVvTjl0NptMzGorkjAgsq4+sjF10mw4LIYNzXGlilpKawhXmNWE70Vm6mrMWuDwGjseXd3qU4W8TYDG7SA+wii+XZojTIGpYX9B85Ri5VjF8v5VXu5c/rCBjEQjiolkpVR96lysQY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(4326008)(66556008)(26005)(186003)(83380400001)(38100700002)(66574015)(66476007)(5660300002)(8936002)(6512007)(31686004)(316002)(8676002)(53546011)(66946007)(6506007)(86362001)(6666004)(2616005)(2906002)(6486002)(31696002)(36756003)(508600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RFY4bDlTaG1iejlOSm11TWJoQzdFYWxKejdYWmpROEtydUc2MkM3NkVqeE1N?=
 =?utf-8?B?ZEpFQnFySnV5TXFjLzVwWmM2T0gxa2ZwM3lkTkJZN2l5YnhXdFovamFqcGVy?=
 =?utf-8?B?YVh3QnZsWlNWWldiQ1hqeENJdEVlT0kwcWRzWUNxQ0pyVm5kSW1FRmVCVjh1?=
 =?utf-8?B?RkRGU3FWQnVwR1YyM0N6L08rNXlxWUZtY1ZUMDJ1d3d3UzF5VmZkNU01eHl6?=
 =?utf-8?B?ZGhpV1dybDA3TUZERXBIaHJnWHFkY01ZaGVyZW50VlRqL2J6bjlQUDJUdlhZ?=
 =?utf-8?B?OFoxUmJ5cWZETkZIb09ZV1R0emRIekYxbkgzZEV0dm5uUVg4cXJhVjl6dlBz?=
 =?utf-8?B?TUcyMEVLUnRadisremFrWU9ybHBqSk5GWmd2NVYrODVSK2RmdHFTdktwZkR2?=
 =?utf-8?B?QmVxY3ptaE02UStPMW1BR0tuUXUxYk1PYkwwd1ZNUElLOEpzZUJRVnhPTHBr?=
 =?utf-8?B?RjFQd2NacjFtbjlCTU5VQkFTK2xodCs5TE1YNUowZEF6clFJTnVXdU1TbFNC?=
 =?utf-8?B?K1REYlJXVEtRaGhLcHZqWXNQTzBjcmhtWXdmSzZrUU9ERkFyQWlEcHVQdWEy?=
 =?utf-8?B?Qkk5VCsvWm1lZ3UrTXM3YWxSSDRDOVFDQkJ6d0FDOExhVVZFMExhTDloK1hJ?=
 =?utf-8?B?dHJzcENHUy9LdERHRzkwRGFtUnZyekNGZnNTZ0xxRyswbWVMMlJjRjVNUk9Z?=
 =?utf-8?B?QUhPaEttSG5QeG1wb3JCVmxLQWhYYnJhTklIT0Y1b1FKQzNtdTdTMS9mb1Vu?=
 =?utf-8?B?WWhISmkyWXcrbTIzSkd5dlhJK0tEUlFzUVBJRzcvOUZEYXc5aU0wZldRYWds?=
 =?utf-8?B?SnNFdUdKOU1teEZkY2diUmlTMUZDNHlMNHcvQjJyc0tTdzdpTi94MzBXd3A3?=
 =?utf-8?B?N1hkdXYxTlY1YTFKWVVuVmtOOUpZMDBSRG9oZW9KU1IyM0dFVCs4Q0lCSkVk?=
 =?utf-8?B?dktGbUZoRzR2bnplWndDbHp2SzhicTdvTGxpWHZOM0ZxUFc1cDN3cmhTVEtW?=
 =?utf-8?B?c0c0S1UyNCtnR0tUeE5zMGE5R1hBM3JlN1R1aDhwM25iZTRBYmlhUTJEV3o2?=
 =?utf-8?B?eUhwUlEvSDRVR1BQWmgvdXhSQ0pUWVZUckl1UkFrazZ3MnZOdWh3OERGUVo3?=
 =?utf-8?B?ZjB3RDZQR0pSbXB0dkMwRDQ5dlBDWkl6cnN0ODZQVHNqVHRMenRyUTRVeWV5?=
 =?utf-8?B?Y1phS1VjZlRadDA4bVpSZmJ6SmM2TzFlbUVqM1hJbEE0ZTJxaENHZFRPblVQ?=
 =?utf-8?B?MnRyZGtYVXVsNmN1SHJmMHR6dWd3UlhFdWppak0wZGFxN3FMeTRvRnR4b0N2?=
 =?utf-8?B?M1E2a0NwTkVONE4wMi9LNXhVTzVWSFpoSnU4QXNFOEVwTVZ1L2dRa3FRdGpp?=
 =?utf-8?B?MVJUcUFhNjQrb1dxTVZRejdwRDl6eE1mNC9Oa0FyWDhUL1laUzVRMEV5Ty9j?=
 =?utf-8?B?MDVEVkpaNE00Y0RocHlObS90Ni9NWEp5b2JKSVgrczlRSFpDeFhqcGlRMWUr?=
 =?utf-8?B?Q0hKQVRFeDdDZ0hIV0owQmM2Z09Vd3NmOTlnR05DblkxeTlYc2sxdnBEVlpV?=
 =?utf-8?B?L0R6QmRYZDhETkJLNUFmU1BvRktCQy9qL2xZYWhRSGFackNlc1BoWkx5d1pT?=
 =?utf-8?B?Zm1XTEoxanhYMS9hV2lrd0ZNMHpFY1YwdHFGTE9zNkIzVGVuL2hOMlIrVm0z?=
 =?utf-8?B?cFVnQ3JyaU03Tm0rdktqK2wrMXlXbktUd2owVS8xVzM1QkJOdmczM3ZwTWtO?=
 =?utf-8?B?T2l3aDhEWlBCelNSYzl0RmtSeXRDOEQyNjVBbVU2MzN6TU5oQVJzdzZwMXFR?=
 =?utf-8?B?T3RzSUsyR25YQlhicWRhM1orbkx2YjBLTmU5bXl3STFuUFlITmdGSWthMytx?=
 =?utf-8?B?SUswT0dDeElMd3llcm9FOUJHbXArdkw2NHF2MHZMRWhneDFpTGdGeHptUWFT?=
 =?utf-8?B?WUF3eGgxb0VjWWVXVmJZaWpRUHk5emFNR3dyVUliUUVudEtzR3dSU1BKcXcx?=
 =?utf-8?B?Rm5iazZ1amdQUERmamV4d1I0TXJvRG9YbitjKy9BY2JZclA2TUxwVk8yK1VJ?=
 =?utf-8?B?aFVYQnhhaHhXUE9EWTJhZGk3eUEwQUs3RmV3YUYrQXpCaXh0VzJQL0NuRWov?=
 =?utf-8?B?WlI4cHJ1R2h6bDhHWHVwQ2FJUW04ZU9Fa2NTWTkvL3AyaEZaM1R4QzU5dCtO?=
 =?utf-8?B?MU1QbUFTaTZrVVhXUS9la2hJV2hhWmJZWlBIM2tUcUpiUW9nNW9MLzE3L1Ur?=
 =?utf-8?B?VnNVMTE0eFE3YU1DOWlEeTMvbm9sQ2RPTnZNZDFRdDBXSmY0eUx3Mi9LYXYx?=
 =?utf-8?B?eUVNUzNSYi9INStrdEhhRnBDQmc5QjIwditmSEdpb1pJVEluUkRldz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a5d8cec7-c127-4f4f-bb3f-08da122d0bf3
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2022 09:09:51.2289 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DvuyxrceRYAgwi2ETpkqw6le1tphh4A5GBkOzOBNJXrofQ+P0/OQK6Ye2xMRFCKQEQjsQOfPKU0Cx7cpmwRDCA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR12MB1898
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
Cc: alexander.deucher@amd.com, matthew.auld@intel.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 30/03/22 2:37 pm, Christian König wrote:
> Am 30.03.22 um 11:04 schrieb Arunpravin Paneer Selvam:
>> Round up the size value to the min_page_size and trim the last block to
>> the required size.
>>
>> This solves a bug detected when size is not aligned with the min_page_size.
>> Unigine Heaven has allocation requests for example required pages are 257
>> and alignment request is 256. To allocate the left over 1 page, continues
>> the iteration to find the order value which is 0 and when it compares with
>> min_order = 8, triggers the BUG_ON(order < min_order). To avoid this issue
>> we round_up the size value to the min_page_size and trim the last block to
>> the computed required size value.
> 
> Well, Matthew and you convinced me to *not* do it like this.
> 
> Has that conclusion changed somehow?
> 
Yes, now he is ok to handle rounding + trimming in drm buddy

> Regards,
> Christian.
> 
>>
>> Signed-off-by: Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>
>> ---
>>   drivers/gpu/drm/drm_buddy.c | 31 +++++++++++++++++++++++++++++++
>>   1 file changed, 31 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c
>> index 72f52f293249..98d7ec359b08 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
>> @@ -641,6 +641,7 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>   	unsigned int min_order, order;
>>   	unsigned long pages;
>>   	LIST_HEAD(allocated);
>> +	u64 cur_size;
>>   	int err;
>>   
>>   	if (size < mm->chunk_size)
>> @@ -665,6 +666,11 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>   	if (start + size == end)
>>   		return __drm_buddy_alloc_range(mm, start, size, blocks);
>>   
>> +	cur_size = size;
>> +
>> +	if (!IS_ALIGNED(size, min_page_size))
>> +		size = round_up(size, min_page_size);
>> +
>>   	pages = size >> ilog2(mm->chunk_size);
>>   	order = fls(pages) - 1;
>>   	min_order = ilog2(min_page_size) - ilog2(mm->chunk_size);
>> @@ -702,6 +708,31 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>   			break;
>>   	} while (1);
>>   
>> +
>> +	/*
>> +	 * If size value rounded up to min_page_size, trim the last block
>> +	 * to the required size
>> +	 */
>> +	if (cur_size != size) {
>> +		struct drm_buddy_block *trim_block;
>> +		LIST_HEAD(trim_list);
>> +		u64 required_size;
>> +
>> +		trim_block = list_last_entry(&allocated, typeof(*trim_block), link);
>> +		list_move_tail(&trim_block->link, &trim_list);
>> +		/*
>> +		 * Compute the required_size value by subtracting the last block size
>> +		 * with (aligned size - original size)
>> +		 */
>> +		required_size = drm_buddy_block_size(mm, trim_block) - (size - cur_size);
>> +
>> +		drm_buddy_block_trim(mm,
>> +				     required_size,
>> +				     &trim_list);
>> +
>> +		list_splice_tail(&trim_list, &allocated);
>> +	}
>> +
>>   	list_splice_tail(&allocated, blocks);
>>   	return 0;
>>   
>>
>> base-commit: ec57376fba5abc0e571617ff88e2ade7970c2e4b
> 
