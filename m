Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F49249D4C0
	for <lists+dri-devel@lfdr.de>; Wed, 26 Jan 2022 23:00:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89F7D10E869;
	Wed, 26 Jan 2022 22:00:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2072.outbound.protection.outlook.com [40.107.237.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E7E10E1BE;
 Wed, 26 Jan 2022 22:00:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jqPUuWhKHWMIv5cL1qdYemHfPvyfIJF5I2AuLnAG48SqQkbj96/Vz5hBpVRL+LCryX46z/topOWZ8EfkebIaQHX11XdsEUyViIoZpgQDO91gyRU5a0aBbmCwbE+j+qxP/AYeev8OZv5T1EEJsEABuTHqLwhTLiN9f7VSRb6w5TR7HRpKzVUQDSUIRI9buTeUmlG6bLUjM5rCQb5yzLBU6yipJXLYyOGiEnCDqF/JVUTPtnkfs13peRaHWg37HlxmNokofHzdVrNlBCJJbhFlxsKJFnCykhR4Fkrg10FlXXP380w2ikxeIuosmr+IqDAd+UXkMGSYXQTW5roeGfdzFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8v2vJYmmXgj5wJO5amIsK5tT+Go64InAXfYFp2oP+Vw=;
 b=C/Ccudh5MXoAUVEkuGlHDUPMImyld5p/0UWM9T/Cko2UvAzkrlaU8vmTPC4cw5tLcdJW+Hz+Xt/4SNnEjWYr7GHfOLow6zf9BAyzX/+b0H5CANGoYlzTy3Owq+o7wkl3DPHZBDsPqwyGRFfc0Wx4dPeFd+Z1s3w2Cg68NHqW8V/4kmfnjFzL20rUq07P1J8vyeMrz/JXqgtgWZatMd7OzIoMwOabULEYSWX5jHzvpFNvqYeqkZjT6lPlI/2AHDjC8oMK8gynD/Gy+JviU1tDUJKBVF/WGHM+NKClMYBFhtr4uIuqNexgeqPu07iV0e3UVoxD2s2y/3YCd+gi+7Yc0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8v2vJYmmXgj5wJO5amIsK5tT+Go64InAXfYFp2oP+Vw=;
 b=JKr/5JaV/DQ0jbI+olNpoARv505aC6cyepg5yuSfKoyki1Odqk/xNS5A0L7r3OO7lXtmmVyWjDvXJ69Ne0gdiCTaQCGW1QR8sOyEwxkt1VkXOHg6U+Q4HiCGLwJ2vKMzJsdws3OKXv10+xm0xGOC3W2Y+cHAg3az/RQqOr4ottk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by MN2PR12MB4518.namprd12.prod.outlook.com (2603:10b6:208:266::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4909.10; Wed, 26 Jan
 2022 22:00:49 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c411:8d69:9007:aed6]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::c411:8d69:9007:aed6%4]) with mapi id 15.20.4909.019; Wed, 26 Jan 2022
 22:00:49 +0000
Message-ID: <6028ceb2-c96f-206c-77f4-b2f4a979e219@amd.com>
Date: Thu, 27 Jan 2022 03:38:41 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v9 4/6] drm: implement a method to free unused pages
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "intel-gfx@lists.freedesktop.org" <intel-gfx@lists.freedesktop.org>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20220119113718.3311-1-Arunpravin.PaneerSelvam@amd.com>
 <20220119113718.3311-3-Arunpravin.PaneerSelvam@amd.com>
 <82ee8da9-ad9a-d1cb-4a19-b1056fa57083@intel.com>
 <MN2PR12MB4342BECA8479BD3CA9068FA6E4209@MN2PR12MB4342.namprd12.prod.outlook.com>
From: Arunpravin <arunpravin.paneerselvam@amd.com>
In-Reply-To: <MN2PR12MB4342BECA8479BD3CA9068FA6E4209@MN2PR12MB4342.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BMXPR01CA0003.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:d::13) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 85a57e4d-77cb-4d58-043e-08d9e1175006
X-MS-TrafficTypeDiagnostic: MN2PR12MB4518:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB45186642BCE2B77CFE9261A3E4209@MN2PR12MB4518.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: dcRvKJ9yjbGlvx5pq0Jl19O7aPckrrcdsS2QiWr0t3DtySkCVwDR5GsfgB6YYIsGz0svwnyZvrjr8vsoTe+IcF4N8t5xBHkD600lL/j/cq/YvR1e9YI9y+4b2JWaMjJyRSHaKmRugXInud5O0x3t5a5Eb4NS+l7uOWXuavHbvmT7TM0Ro0XCr7O5cWcEypli4w9zzVEp9RmlQZU2IA9+ADXCCX5lhWBzfpbqB+X/IPQyrp+vQ8DBsP7FChultZV2+6+D0HEHeBOCCZmOwp2AZsc+sAWR3uN82cexcDxvo4Gd9IGp02P6AnFIgskuEI8BknQQJ7DENcByhcGlmSPFIEjBLSVIbMOW6MJMWk3JFndAza89RVPKC9j+Y2KRRm4YnbqbengCZZarTCG+meDqfFzACUeCitegv6nXxkq+CuLPhgBtqimD21spvgBpj1RZJzRKXdQg+26CALgpUPgYGY73iODuhnb+hP6EleJ6X3k0yVFyhnsju0vEzJqvua3O9pJab7cIeD3rAUWEGWlW+Iean8V4m9xg+Q7E9p3UJBfsav6CfHpSJA+lIyyF+f89339AbS5hsj4GWVQIcrBxcK7MMnAWsv2b23vnnN0d/LqwiY8rYpV3XLvPBZJAoIFktv1AqyIcNnJcyNx8fk6pSvEAJ9OIlezYhlerXFzNO4ylVzE9EzdbU+q2W2M+cpyg2JQoL6xZHaWViIBjp86CvJ3TYGaZFPKsKmzT+jjZsXiPJOWoVoQt/mM9u6+e5V9J
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(366004)(2616005)(8676002)(6506007)(53546011)(36756003)(66556008)(4326008)(26005)(186003)(83380400001)(6486002)(8936002)(66946007)(66476007)(5660300002)(2906002)(6666004)(86362001)(38100700002)(6512007)(31686004)(31696002)(508600001)(110136005)(54906003)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MC9IYkVzQmpRQ1ZQNGlyTEtxZ0NXRXlUcDFibTBWaGlUY3IxQUMwUFpvS3ha?=
 =?utf-8?B?SUkxRlRjd3R4OERwSklTTjdEQ1dpK3hRRnlITU9vVVlFSXdjb0RJdEd0R2d3?=
 =?utf-8?B?MTdPQXNXUDB1RitVdUdpeTNURnRzRGl5OCthV3JBY0w0bkIzdURrQjhwbnBj?=
 =?utf-8?B?bC9JN012clpzL3Y1MEdSYW42Q3lNVWpYUUxmS3dneVAva0grdDVqT2k3RzQv?=
 =?utf-8?B?MlpxSDgzNTRXZXlyQXMzM2NXV3o1NmVNTlJ5QmpCZDdNOFlaaFRpTzM5YWdI?=
 =?utf-8?B?VU51V1BnS2hDeWQ3ajlVOWU2aEFvdEh3VXJBOFJIS0REMktrcHVzdWVSaHgv?=
 =?utf-8?B?UDNBQXo5ejBveldsZ012c3JHY1RlSWUxeVVaemUzRFlDbDdwMDA2R2R4QkRE?=
 =?utf-8?B?RGlkL0I0RnlqOGhybDN3RGM1TmMrdWVWZFdseGVEQVZWVURoUnZqbTAwZE0w?=
 =?utf-8?B?cllqUU8rK2c5RGpjbW1pTCtLVWFzdkE4d3F1N2tjWWRHMFArU0RDMDBQT0cw?=
 =?utf-8?B?QWZZRnZLV0kycHFzc3ZEZGcrdUhtRnRqM1NkMWhqWitGeWVSclcrSXdrWTVm?=
 =?utf-8?B?TkVkc3ZaOEM5ZWl4dit6OVVxSU9EY3ZQWk9Ydzc3SzNIcTVQWiszZ2N1SjdC?=
 =?utf-8?B?enJTZTZXZXFBQnpMVDlhLzdRTEk4Y0k2OHJBcFdxNG9sR3ZvRk5zVURKWkUy?=
 =?utf-8?B?Wk0rK3VhaytLWWtxUHAyV1RwaDJPZDd1d3NQeHVqT2tNUWg2Q3ZmUDRHblk3?=
 =?utf-8?B?SkJPUzZ3L3FDT1NVUVlUellYNnZEbDJpQW9heVUzaWNrTmNPUUVzaUVIbkU2?=
 =?utf-8?B?d3BKNWt4N2N3cUFNSGh6bjM5Y3dkY3pJb3Jlc0NGcjFMTEhHVWpFQzcyVldC?=
 =?utf-8?B?djVhcFZaRVRPaDJ5aXRBV0ltYjM4U2hXK1JJNHpZZ3lYbU04MWQ0WUN5YVZP?=
 =?utf-8?B?QTQ3TjF1aTQ4Y1FOOFNZb29ZSUxLR1ZiTi9JSTcrSUpFem9JUjNQVmV4WVpr?=
 =?utf-8?B?VG1Xblp6cTNna1ltRjJyVmJkMmRyNkpkcDYwbUltUWVpL0tmUTZpeGErS3Rp?=
 =?utf-8?B?THJyd0xCem5mWXQwMk1RNXlha21vN2R4NStCNEVUbHpYQXhXRlZZRzlzbzRh?=
 =?utf-8?B?Mlh4bitLRmxlT2JNK0hkUGhwcmwrc0V3eWxjNnNzVUpJSklQVkhkMzQxQmlt?=
 =?utf-8?B?SmNHMXhLVnovZTd1cms4OUU3QWJhKzZldEdSZThhbk9Wc0FXYVNyeGhBL1FO?=
 =?utf-8?B?MzdMWG9udkZKcS80MWdsRTZTcnlteDlCcU9UZ21DdkowS1BHR2V0STAzbjFo?=
 =?utf-8?B?dFY5bzBweWVJQWNHdnlydGJ3anZySEZ2dmtkMlBwUU1HTFFUUVRKNUpsMHFK?=
 =?utf-8?B?SEo2OUxLZzRIU2xWbmFjeGxmQWV4Z3ZJZDYzVlNsN24xenhSVUtFN01WMy82?=
 =?utf-8?B?bTVQLzFNN21QYlBzS2Q4a2dCelgzczlrTElzU3hQV0wrQWdyZU9JTmxScUlD?=
 =?utf-8?B?Tk56SVYySnJDOVI1K0xhZHFBRGp2RnN0OEgxS2JoUkw3eTNvdDRoTEVxa0RV?=
 =?utf-8?B?OXh2SCtqSERBanJuU0FyTGhkZjUwY2JQNEVCMDZsSHZHbW9zTU80cVBSQVc1?=
 =?utf-8?B?ZjJ0OHpYQXJZRE5tbTFSUHk1THd6U0cwTklDSGduUGR3NERXOXcyK1Y2Njla?=
 =?utf-8?B?VXRqZm1MSGg3U2R1WC9uTnJYL1c5TVRuUnFSd3pTOWFiYWlIMDBtQkNZVkt5?=
 =?utf-8?B?YTB3M0hhSWRpOW14N2pBU1NSUENGTGp1NnJZc3l5elZrYWxjUzlwZFNkUjRr?=
 =?utf-8?B?QytBa0hpTW1TNlpjK2xvMlBpVm1yeUtyWGhEUitJZU54K1kzWkZlZGhDQThk?=
 =?utf-8?B?R29mZEo0UXV6SWpwN2RZZ0EvelNMaTVqbDZmd1UyUTVRYWNhVFZOTUpBN2xa?=
 =?utf-8?B?UmJ2d0lMK290YVc4S0JNbnFVenRMUnNyODVsMkg1SnorWUg1eFVwdm5zNnRF?=
 =?utf-8?B?ZE5WQzZJTDBJZ3MzVTEyclhxYXQzU0UzUHZteGdMRWVBR0I0R2ZQQ011d0g1?=
 =?utf-8?B?eDNzQ0E2WEIxRnl4enE3MUNoR2FQZWU5NlZMdkw0NzRxZkRKMnVvaENvZjJZ?=
 =?utf-8?B?Yk56OHdwV000RzhwS00xc0VxYlh2VkFTM1ZpbElDVmRsdzVOdk5BZE84cTNh?=
 =?utf-8?Q?HUsVaBCTB2DJkYCZO1o5q4Q=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 85a57e4d-77cb-4d58-043e-08d9e1175006
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2022 22:00:49.6623 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eo5HtLjvTPSFDZiqekpe3QFI6prtHxR7nZGmqDlTz0wC+Xeap/Z6cVfkMSbGANSmUSLENPdnW0shd+tztSogkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4518
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
Cc: "Deucher, Alexander" <alexander.deucher@amd.com>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>




> -----Original Message-----
> From: amd-gfx <amd-gfx-bounces@lists.freedesktop.org> On Behalf Of Matthew Auld
> Sent: Thursday, January 20, 2022 11:05 PM
> To: Paneer Selvam, Arunpravin <Arunpravin.PaneerSelvam@amd.com>; dri-devel@lists.freedesktop.org; intel-gfx@lists.freedesktop.org; amd-gfx@lists.freedesktop.org
> Cc: Deucher, Alexander <Alexander.Deucher@amd.com>; tzimmermann@suse.de; jani.nikula@linux.intel.com; Koenig, Christian <Christian.Koenig@amd.com>; daniel@ffwll.ch
> Subject: Re: [PATCH v9 4/6] drm: implement a method to free unused pages
> 
> On 19/01/2022 11:37, Arunpravin wrote:
>> On contiguous allocation, we round up the size to the *next* power of 
>> 2, implement a function to free the unused pages after the newly 
>> allocate block.
>>
>> v2(Matthew Auld):
>>    - replace function name 'drm_buddy_free_unused_pages' with
>>      drm_buddy_block_trim
>>    - replace input argument name 'actual_size' with 'new_size'
>>    - add more validation checks for input arguments
>>    - add overlaps check to avoid needless searching and splitting
>>    - merged the below patch to see the feature in action
>>       - add free unused pages support to i915 driver
>>    - lock drm_buddy_block_trim() function as it calls mark_free/mark_split
>>      are all globally visible
>>
>> v3(Matthew Auld):
>>    - remove trim method error handling as we address the failure case
>>      at drm_buddy_block_trim() function
>>
>> v4:
>>    - in case of trim, at __alloc_range() split_block failure path
>>      marks the block as free and removes it from the original list,
>>      potentially also freeing it, to overcome this problem, we turn
>>      the drm_buddy_block_trim() input node into a temporary node to
>>      prevent recursively freeing itself, but still retain the
>>      un-splitting/freeing of the other nodes(Matthew Auld)
>>
>>    - modify the drm_buddy_block_trim() function return type
>>
>> v5(Matthew Auld):
>>    - revert drm_buddy_block_trim() function return type changes in v4
>>    - modify drm_buddy_block_trim() passing argument n_pages to original_size
>>      as n_pages has already been rounded up to the next power-of-two and
>>      passing n_pages results noop
>>
>> v6:
>>    - fix warnings reported by kernel test robot <lkp@intel.com>
>>
>> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
>> ---
>>   drivers/gpu/drm/drm_buddy.c                   | 65 +++++++++++++++++++
>>   drivers/gpu/drm/i915/i915_ttm_buddy_manager.c | 10 +++
>>   include/drm/drm_buddy.h                       |  4 ++
>>   3 files changed, 79 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/drm_buddy.c b/drivers/gpu/drm/drm_buddy.c 
>> index 6aa5c1ce25bf..c5902a81b8c5 100644
>> --- a/drivers/gpu/drm/drm_buddy.c
>> +++ b/drivers/gpu/drm/drm_buddy.c
>> @@ -546,6 +546,71 @@ static int __drm_buddy_alloc_range(struct drm_buddy *mm,
>>   	return __alloc_range(mm, &dfs, start, size, blocks);
>>   }
>>   
>> +/**
>> + * drm_buddy_block_trim - free unused pages
>> + *
>> + * @mm: DRM buddy manager
>> + * @new_size: original size requested
>> + * @blocks: output list head to add allocated blocks
> 
> @blocks: Input and output list of allocated blocks. MUST contain single block as input to be trimmed. On success will contain the newly allocated blocks making up the @new_size. Blocks always appear in ascending order.
> 
> ?
> 
>> + *
>> + * For contiguous allocation, we round up the size to the nearest
>> + * power of two value, drivers consume *actual* size, so remaining
>> + * portions are unused and it can be freed.
> 
> so remaining portions are unused and can be optionally freed with this function.
> 
> ?
> 
>> + *
>> + * Returns:
>> + * 0 on success, error code on failure.
>> + */
>> +int drm_buddy_block_trim(struct drm_buddy *mm,
>> +			 u64 new_size,
>> +			 struct list_head *blocks)
>> +{
>> +	struct drm_buddy_block *parent;
>> +	struct drm_buddy_block *block;
>> +	LIST_HEAD(dfs);
>> +	u64 new_start;
>> +	int err;
>> +
>> +	if (!list_is_singular(blocks))
>> +		return -EINVAL;
>> +
>> +	block = list_first_entry(blocks,
>> +				 struct drm_buddy_block,
>> +				 link);
>> +
>> +	if (!drm_buddy_block_is_allocated(block))
> 
> Maybe:
> 
> if (WARN_ON(!drm_buddy_block_is_allocated()))
> 
> AFAIK it should be normally impossible to be handed such non-allocated block, and so should be treated as a serious programmer error.
> 
> ?
> 
>> +		return -EINVAL;
>> +
>> +	if (new_size > drm_buddy_block_size(mm, block))
>> +		return -EINVAL;
>> +
>> +	if (!new_size && !IS_ALIGNED(new_size, mm->chunk_size))
>> +		return -EINVAL;
> 
> I assume that's a typo:
> 
> if (!new_size || ...)
> 
> Otherwise I think looks good. Some unit tests for this would be nice, but not a blocker. And this does at least pass the igt_mock_contiguous selftest, and I didn't see anything nasty when running on DG1, which does make use of TTM_PL_FLAG_CONTIGUOUS,

Good to hear its running on DG1, all changes are added to v10. working
on moving i915 buddy selftests into drm selftest folder, I will add a
new unit test case for trim function
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> 
>> +
>> +	if (new_size == drm_buddy_block_size(mm, block))
>> +		return 0;
>> +
>> +	list_del(&block->link);
>> +	mark_free(mm, block);
>> +	mm->avail += drm_buddy_block_size(mm, block);
>> +
>> +	/* Prevent recursively freeing this node */
>> +	parent = block->parent;
>> +	block->parent = NULL;
>> +
>> +	new_start = drm_buddy_block_offset(block);
>> +	list_add(&block->tmp_link, &dfs);
>> +	err =  __alloc_range(mm, &dfs, new_start, new_size, blocks);
>> +	if (err) {
>> +		mark_allocated(block);
>> +		mm->avail -= drm_buddy_block_size(mm, block);
>> +		list_add(&block->link, blocks);
>> +	}
>> +
>> +	block->parent = parent;
>> +	return err;
>> +}
>> +EXPORT_SYMBOL(drm_buddy_block_trim);
>> +
>>   /**
>>    * drm_buddy_alloc_blocks - allocate power-of-two blocks
>>    *
>> diff --git a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c 
>> b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>> index 3662434b64bb..53eb100688a6 100644
>> --- a/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>> +++ b/drivers/gpu/drm/i915/i915_ttm_buddy_manager.c
>> @@ -97,6 +97,16 @@ static int i915_ttm_buddy_man_alloc(struct ttm_resource_manager *man,
>>   	if (unlikely(err))
>>   		goto err_free_blocks;
>>   
>> +	if (place->flags & TTM_PL_FLAG_CONTIGUOUS) {
>> +		u64 original_size = (u64)bman_res->base.num_pages << PAGE_SHIFT;
>> +
>> +		mutex_lock(&bman->lock);
>> +		drm_buddy_block_trim(mm,
>> +				     original_size,
>> +				     &bman_res->blocks);
>> +		mutex_unlock(&bman->lock);
>> +	}
>> +
>>   	*res = &bman_res->base;
>>   	return 0;
>>   
>> diff --git a/include/drm/drm_buddy.h b/include/drm/drm_buddy.h index 
>> 424fc443115e..17ca928fce8e 100644
>> --- a/include/drm/drm_buddy.h
>> +++ b/include/drm/drm_buddy.h
>> @@ -145,6 +145,10 @@ int drm_buddy_alloc_blocks(struct drm_buddy *mm,
>>   			   struct list_head *blocks,
>>   			   unsigned long flags);
>>   
>> +int drm_buddy_block_trim(struct drm_buddy *mm,
>> +			 u64 new_size,
>> +			 struct list_head *blocks);
>> +
>>   void drm_buddy_free_block(struct drm_buddy *mm, struct 
>> drm_buddy_block *block);
>>   
>>   void drm_buddy_free_list(struct drm_buddy *mm, struct list_head 
>> *objects);
>>
