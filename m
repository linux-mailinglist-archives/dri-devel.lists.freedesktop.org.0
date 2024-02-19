Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B4A685A1D5
	for <lists+dri-devel@lfdr.de>; Mon, 19 Feb 2024 12:22:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7D0A10E31E;
	Mon, 19 Feb 2024 11:22:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="UNn4CoMd";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2040.outbound.protection.outlook.com [40.107.95.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0657710E31C
 for <dri-devel@lists.freedesktop.org>; Mon, 19 Feb 2024 11:22:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fxMM21grzKvHxRmLPV4m0yzXBmxSMpVLvDa4GFLRHXCoJbz6kdfILUYGbd3mVwDQDRMP2AauxrlauF4JMvmiiG6F8wk54+OSH/qRcl5jkc3/vAmux3/jxTFGDscfdhUApGT16XW5v5BBCKNJMH++vuzhcu/RuShmylM7e8wrTKNa1aEHvYttkKDvavsWGUY++iJJLjdlGwamjK10YyCTDtqLgG+a8in7iREUJKz/sBbjmPf24+12jmQVzjn8duZPp8GLf//OJowLhOhEZWoctO2mft2MUICj4NFW23quxuScpXuUwzuvcXGqxM5WAmPSUOddjzg/QdnhMCkzGPXYjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q+nY4mWRD16ZJiod1LL5PjN0FJNbrv6NgDYtnJzjoZY=;
 b=gcZhbAbMw06oY8p/K0vJiPsNhEA3h2WJgojOQvDrvZqVT1W8wI8a68I2/rygtnkTp5X/arQIgiJDOi2/hBv+oWiGb8an66oNNik4xV2TH5+S5E/CHuMWTRNjYkpSfSpWUrr+tCAtYLEHGs1jzkxw4tzjgg57rbqF6L+pSes9OILEnFH0GxOTLKdf29DB6FLYcNvfusu8BkFw4MgkKcm77oOxhX0kMrUulAlO5JX3Ai41IDlXWIX9R11GUdz3r3ilgU87Dmu5DYrDxWnzGuSImLuO9RcHhw7gekqYHretk73Ce75Dl+LzrFMNWAWnALup46Eq3eF8ULsFW9vzg/N5IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+nY4mWRD16ZJiod1LL5PjN0FJNbrv6NgDYtnJzjoZY=;
 b=UNn4CoMdb6SBHAUaMEtOm0sN4sl6NaZOO04LhALBLiwnrrWvN5OGIpUMtCxCO9rKSJ+Zmd3v/pTSMDrCKF5pf+z3eaKacSOPjGGn2mMad6SVMKqPEtwaXl74oGupx/VAq8TfQbyxU58uwfiawTzvRWJb1DWsp+dtohK9SP74Nts=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from PH7PR12MB5685.namprd12.prod.outlook.com (2603:10b6:510:13c::22)
 by MW3PR12MB4396.namprd12.prod.outlook.com (2603:10b6:303:59::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.19; Mon, 19 Feb
 2024 11:22:35 +0000
Received: from PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653]) by PH7PR12MB5685.namprd12.prod.outlook.com
 ([fe80::e1fb:4123:48b1:653%4]) with mapi id 15.20.7316.018; Mon, 19 Feb 2024
 11:22:35 +0000
Message-ID: <4cdc5b58-11c1-490d-8c3b-6352d8f1b8cb@amd.com>
Date: Mon, 19 Feb 2024 12:22:28 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/tests/drm_buddy: avoid 64-bit calculation
Content-Language: en-US
To: Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Arunpravin Paneer Selvam <Arunpravin.PaneerSelvam@amd.com>,
 David Gow <davidgow@google.com>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>, Matthew Auld <matthew.auld@intel.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20240216202442.2493031-1-arnd@kernel.org>
 <745e156e-c3ec-427f-98ad-bfc7d3cfd846@infradead.org>
From: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
In-Reply-To: <745e156e-c3ec-427f-98ad-bfc7d3cfd846@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0183.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::11) To PH7PR12MB5685.namprd12.prod.outlook.com
 (2603:10b6:510:13c::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR12MB5685:EE_|MW3PR12MB4396:EE_
X-MS-Office365-Filtering-Correlation-Id: 8233f01c-1763-4bb2-f37f-08dc313d1246
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: olalifhMNxtbxoIYwVkzaFoprluWdHwVj5l1zK0QmEPoiJ7DAbLEbs/vA/Miooj3pkKN7GBAPreHIn28We0V5t0NILBKkr8p3pYGuizCmsqk/LIaw+A42PmeeKzDoeAbRDuTzAnW+EqvwceTtnDDV/zHG+Y3id3DODMMx4leocQplqBxUqCHDor+6vpgzknmBCjLHcZntCOPCl8G1zsFPXx9pfKzoQjyPwMuoCZA/VXpFipQOXl0q594h0NMHtrMfMgRb9vlQu6UtPXeIYGvmEE16yQ//jgzJgsFQxXMR2enSUU4lPs7JnFLbRSvhuWuUo+XwWtzumqxw24Ec19OcjRRxazJ8Ex5CCxOFPGworFdz/1PcV63eAsTCS851iKVUsATd4GDSYWGv4VbvX6z8I29oBuMYCQTICatteqkBoZSWJL17/37RSSkSSCU2f3G6vhc0w+biovgOWaNlvq+ykCmZZ4Hd8lLUwIwnln5twy/eq+sRtB7RJNcGk0rphtq/zIQlhKZlycqp9NWPkxn3ZAn240kVDPqCOT/QO3ybRs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB5685.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YkJtNklveS9VL0x5Q2tOZDZaMVV6enplaHZEOFc4dVlhbW5Qb2pDZ3p5S1Jz?=
 =?utf-8?B?c2NOUHpTUHdPc29KQTFIVm1oS0VkQytkeWl2M3JsNWtVcEYvajdZSU0zYlM2?=
 =?utf-8?B?aW03OFRia05MZ3VkZTZkeUJXRmY3SllGdmxkbjVBT1dtV0hxMHc4dWRDMlRy?=
 =?utf-8?B?bkhWSjYrY1hxdnprU2hrTk5RMHRxbTgrR0o3bWtWakRyVisrVW5HTURUZ1dQ?=
 =?utf-8?B?U21jaW1KVzVabG9yblBURUFXbkhaWW5JTktiOXJQL1RZK3djMWFhRjRPSm1i?=
 =?utf-8?B?ME9OYmNKeURBMG1MK3Nxa1FPeVVUc2tLa3BuYzhhNmlnNlpTTjNsQnB2Tnh0?=
 =?utf-8?B?OEh5VXVrcCs4endZS1UwM3BpOCtyNWIwZUlvMEdaSVBRZDg4WnRLcEI1eHVH?=
 =?utf-8?B?MW9pZUpCK0R1MmZpWWtaZ0ZFeFFPODZUY05Da2hvZmNRSlBSU09MSWVMRUNr?=
 =?utf-8?B?ZzZBSHNFT0RIakdSR2o2dmN4QzBRN0RvZXEzRjFlWHpGcnMvSzRPNy8xWnJj?=
 =?utf-8?B?MitabUZFcDV2YkpvK3Z3MGxnbWhKd3g1bldrUExvN3V2UFlhekUxc1Evd0xN?=
 =?utf-8?B?V2d6MzQ2c1hqdUtTazljTDBzNGo4WmZnMkNlSVdLcXlBMHNKVm9ZcmNkTHVW?=
 =?utf-8?B?RkFHaWhCbkhuaE1BM1pmSWFNRGlBeEREUHFwS0FJdGFDTWZjbUNiNG1IR0Ey?=
 =?utf-8?B?K2tBMll3bFlpR0ZnMW4zM3ZDeTZRRjNWVHdNdFZMeE5kcGNUdHNVbnJWU3RK?=
 =?utf-8?B?MnNXN09aMHdpWGovdkdPTWYwR1RLeTJRbER0QjZTWGpmeDJpTGpoYWlmZkcv?=
 =?utf-8?B?clJ2TnRJYks5UGxQQjJNdGZhZXJZdXlyYk5VNHZWTGJna2hmWS9ZMFZ3SzAr?=
 =?utf-8?B?MzZva3grYndrZzlBeEFjWVRsWnh4WmxKUjFwaWhBNzFqa21GdGhhRWRFREdE?=
 =?utf-8?B?RDlJZ0h0Y2xpZmR1MEMxNURQQUJPRGErbHVXQ2h4MzV2dyt2SEs4dTFINElS?=
 =?utf-8?B?Ukc1M3lDYUxMd3JxKzdyMUQ4blQ3a3ZJQ0hIZmRNOWtidVJQbTQwbFhpdzVx?=
 =?utf-8?B?aEF3ZWRYN0lrSURjSjhPb2N6emdUZzhJSjh6TVpIc1JER1dmWjV0Z1pHMGxT?=
 =?utf-8?B?S0wxbjRVLzBvSGpXVGRqcFNobURKQ3FNVHFJaUU2TkhXN0FMSk93cXZUWmp0?=
 =?utf-8?B?MjUvcGh2UEtoU2k0M2hkMjlsaXEzN0dNaWJjTzRLVTNyT2pVbEV6NzdhdWNk?=
 =?utf-8?B?eUVWaythQUl1MVpSa1AyR1d0QmRhMXFWOGpOVkNYR1ZHb1NDVkNhTmdKbllQ?=
 =?utf-8?B?b2ZtMWQ3SmdBcHVHZFhob2tsRCtWQVF3OS9rdmhNbEdXaFJnU3FlRHhjZ3FS?=
 =?utf-8?B?ekljcnBuTFJTTVpCd0xObklXNU5UYnJvQjdvbkxvRWplaDVWQm9sU2I1Ry9O?=
 =?utf-8?B?YmNRUG5rNHU4Q09ZWDU5NVp1dkJvNVExVHMwN3Fmdi85eG1lZ0lZem56dEds?=
 =?utf-8?B?MWwrVEJ3SVV2R3lDS0JQVlB2UDljUlNNYjdzSjdwUTdkTEgrYjljcWZRcnhp?=
 =?utf-8?B?T2UrdDJpMjZRdTR2aHFkTzBQV2NKVGhhL3JCcG5HWTkyN25HVkVVQ1NuUXBH?=
 =?utf-8?B?UWFSZzNseUJlMHVONFovMXUzSWo0RzlXMGNyZHRRczkwN2svQVIycmNDVkl1?=
 =?utf-8?B?S0JwUldsck1ObUd1ZHVXOTFwcUNQckZpQ0x3bk1nU0g4QVF5Z2xSZXFObWtV?=
 =?utf-8?B?cUNUNUo1RGo1TUYxdTFoeVhuMTBicGpWU2ZHWXhFQTRoREp5VmVrUW5PZDJ2?=
 =?utf-8?B?TnZqeTgxa0RtOVl2UGZKa1NjZ0phR3pCaGVPdDJrVjRrQ2ZNWk5VVmlvTFd0?=
 =?utf-8?B?T1FlUEN5Z3ZFL2xtV3p0eWd6SHlEWXplbWhHWnBmTFNOSlNwa0FpRlpFVTFX?=
 =?utf-8?B?Y2ZvQTFFSWxEKy93L3Brd2g5b0RCcnFUV3hRcTd6ZytPaXJ3cGpPUjBNclVq?=
 =?utf-8?B?anh0QlJjNnJhR3JTYVFrSmpNeUU4TWJGdENPa1VReGU3UGFKakdhQWZUdkxq?=
 =?utf-8?B?Q1VjUHNkRUQzQTVhbThCWHhYN1dWZys0Mm9RUVEyem1qT083eUxGUXJVSzUv?=
 =?utf-8?Q?8D/PxI3PHnE3sv+zrYiccyipa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8233f01c-1763-4bb2-f37f-08dc313d1246
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB5685.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2024 11:22:35.0631 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ocB/o1spiA5pehYy6HoF66SzjSfhuZ89jgT1Cek7kYBAvShKGVS6iyjP/e2HZY3F
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4396
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

Am 17.02.24 um 02:31 schrieb Randy Dunlap:
> On 2/16/24 12:24, Arnd Bergmann wrote:
>> From: Arnd Bergmann <arnd@arndb.de>
>>
>> The newly added drm_test_buddy_alloc_contiguous() test fails to link on
>> 32-bit targets because of inadvertent 64-bit calculations:
>>
>> ERROR: modpost: "__aeabi_uldivmod" [drivers/gpu/drm/tests/drm_buddy_test.ko] undefined!
>> ERROR: modpost: "__aeabi_ldivmod" [drivers/gpu/drm/tests/drm_buddy_test.ko] undefined!
>>
>> >From what I can tell, the numbers cannot possibly overflow a 32-bit size,
>> so use different types for these.
>>
>> I noticed that the function has another possible flaw in that is mixes
>> what it calls pages with 4KB units. This is a big confusing at best,
>> or possibly broken when built on machines with larger pages.
>>
>> Fixes: a64056bb5a32 ("drm/tests/drm_buddy: add alloc_contiguous test")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Tested-by: Randy Dunlap <rdunlap@infradead.org>

I've just pushed a similar patch Mathew came up a bit earlier to 
drm-misc-fixes.

Sorry for the noise, I have to catch up on picking up patches for 
misc-fixes and misc-next.

Christian.

>
> Thanks.
>
>> ---
>>   drivers/gpu/drm/tests/drm_buddy_test.c | 7 ++++---
>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/tests/drm_buddy_test.c b/drivers/gpu/drm/tests/drm_buddy_test.c
>> index fee6bec757d1..50a5f98cd5bd 100644
>> --- a/drivers/gpu/drm/tests/drm_buddy_test.c
>> +++ b/drivers/gpu/drm/tests/drm_buddy_test.c
>> @@ -21,7 +21,8 @@ static inline u64 get_size(int order, u64 chunk_size)
>>   
>>   static void drm_test_buddy_alloc_contiguous(struct kunit *test)
>>   {
>> -	u64 mm_size, ps = SZ_4K, i, n_pages, total;
>> +	u64 mm_size, total;
>> +	u32 i, ps = SZ_4K, n_pages;
>>   	struct drm_buddy_block *block;
>>   	struct drm_buddy mm;
>>   	LIST_HEAD(left);
>> @@ -29,7 +30,8 @@ static void drm_test_buddy_alloc_contiguous(struct kunit *test)
>>   	LIST_HEAD(right);
>>   	LIST_HEAD(allocated);
>>   
>> -	mm_size = 16 * 3 * SZ_4K;
>> +	n_pages = 16 * 3;
>> +	mm_size = n_pages * SZ_4K;
>>   
>>   	KUNIT_EXPECT_FALSE(test, drm_buddy_init(&mm, mm_size, ps));
>>   
>> @@ -42,7 +44,6 @@ static void drm_test_buddy_alloc_contiguous(struct kunit *test)
>>   	 */
>>   
>>   	i = 0;
>> -	n_pages = mm_size / ps;
>>   	do {
>>   		struct list_head *list;
>>   		int slot = i % 3;

