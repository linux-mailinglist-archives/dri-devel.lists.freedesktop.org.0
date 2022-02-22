Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 40E1C4C01BC
	for <lists+dri-devel@lfdr.de>; Tue, 22 Feb 2022 19:57:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ACEB10EC17;
	Tue, 22 Feb 2022 18:57:16 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2075.outbound.protection.outlook.com [40.107.237.75])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8107D10EC17;
 Tue, 22 Feb 2022 18:57:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B10r0rCCp1iCyvq/JR9np5O5M2Txrj3Z7Acarvyicozy53oEp1Z+mGRaI4o/0d02w1xHpVKB47jtGbPbP5UwIz2pnhhqsRT8XyIQTIB2P8oqk4VV2x40deKKajJlIzygW6pEmE2m0rHtcnNZDJI164ulKsZR8oTZGGfRc0O9ilNq+HcDnu5IxIP3rFEdjMt+sJ+49WQ/0+5tXuBQ47c+9gnxGziM1LObIvKPYddC/MkUYs9kEo5Oo7Iz6m3oVKz3kdO0KA8vrKZsqpY9R4sUkr2KZ9jb0wzVxjJwT61LroquI4xBA6cBtY1nLg5uYAfCOHjNx9q2f6Ti8zzVXCPaVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9pSG3DzoC9P9ik9UZF0sBQe4wsgDz3tSlSIK98AqpSk=;
 b=J8y0RWrsrSfEh+NoCzuaSN++NBlllgMWX0EPqapvuKRH3KQ8tbJ+tGnDLM1GyTOgW/c8s7uiejl/M1gxNjl29vPdsIs3pS1eBy32OzMTdTlTFuvJTnMIRkRoHbpIs0fHZ7YT+iER42BcCn3rFWLajcH9EInJ/CfM2wYl7kwXdKSjOL86zOaIBVrA0eLdSJz3OBU9K2u+IPI+irEPZApQivEomrWuLoHyZs+GXlJW8czzLPZkfsA/D7UuDuFQI8MZ+Xvb1xznKvXpVxpN4kemzEFdsEbO2w6DuKqtfBselCBAiygTjDWDEPk9q4lYgbaljCOG0Sqzg2GHoamsyOc9eQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9pSG3DzoC9P9ik9UZF0sBQe4wsgDz3tSlSIK98AqpSk=;
 b=2EogSw6A5l3rbnY39ffG2wg11fw/YGvEfekz3Oh3HFElNP0TPuN9ycrOYpdslRE5eIO7FDVvxrZ7YACOgqgs+8g56OIdAOjEycG+agZHsD67t+McAnPD92uq7VrhCRhojOQ0MJryXGxgmgQQo3Oc7bt1TFVQXUgP7YpwZNEUBLY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB4342.namprd12.prod.outlook.com (2603:10b6:208:264::7)
 by DS7PR12MB5887.namprd12.prod.outlook.com (2603:10b6:8:7a::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4995.22; Tue, 22 Feb 2022 18:57:13 +0000
Received: from MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::88a:bf7a:6898:5ba9]) by MN2PR12MB4342.namprd12.prod.outlook.com
 ([fe80::88a:bf7a:6898:5ba9%5]) with mapi id 15.20.4995.027; Tue, 22 Feb 2022
 18:57:13 +0000
Message-ID: <e275411e-9020-5069-a0fa-aba9d33f3709@amd.com>
Date: Wed, 23 Feb 2022 00:37:59 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 2/7] drm/selftests: add drm buddy alloc limit testcase
Content-Language: en-US
To: Matthew Auld <matthew.auld@intel.com>, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220203133234.3350-1-Arunpravin.PaneerSelvam@amd.com>
 <20220203133234.3350-2-Arunpravin.PaneerSelvam@amd.com>
 <644ce762-cb6a-0cf1-d1e0-1e799a3405bf@intel.com>
From: Arunpravin <arunpravin.paneerselvam@amd.com>
In-Reply-To: <644ce762-cb6a-0cf1-d1e0-1e799a3405bf@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BM1PR01CA0145.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:b00:68::15) To MN2PR12MB4342.namprd12.prod.outlook.com
 (2603:10b6:208:264::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c8c8577e-b791-4a50-5c6a-08d9f63522fc
X-MS-TrafficTypeDiagnostic: DS7PR12MB5887:EE_
X-Microsoft-Antispam-PRVS: <DS7PR12MB58878DF27EA5E8C2AF93ECBBE43B9@DS7PR12MB5887.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jXPt3PfZTsriHUEna7k8c7qeLmCYMGsMipilDpWFxSdKt2/zzp3RH+xyyofRL5Ah4mHGdNc39juGZQFS8sVF0w/i922MdvatP8H+bqTKcJ9/L7GyyE4HTAsLGPyJ89cifshi9jFmoNZzZluH4QtJlXWttvbgpjcY0FwvXHMywo0ahHE4ZDYvlyLeboYgjq5BfiBwYCymmsIaCfyn7qkFah+M3kv7GmKIh6/s9/4wfF6MoBNBGgYifaG9Y4nCUDUhHMC8O/ndCCMupuPjIUyq3CPKufE293R/a97TMXgTp9ARZKU9ealvNtHpjKWFtYCb1kNdFZ1bzX8hGpHMLGudn1U0jfmhsaud5pGLIvGkXAOC76UMDSEXNfYdIWqmWnQdOw/nd2NA2JpGx29wnVZQpwsPTiKhP47g1YR8Q/ZW3US04d8PV7TgoFZxlOfxxzOWdq3MPG3gm4zCiJNk6T4eiqLl9P4QC/l04NMwlI/5KOrjpVfJdB0Vqxbd6QYC3SHN11yyrOrpYU3pTfwhflX4oiBAfIR1OlcImGttNE3l3RncaIE9cJAf+z5Ioc2NfMURzdL1spPNhS9A+yfLdEz5MGOasstvyMfY5Ldz0DEaVAU4bjHmzzZylwOLF8Iy0y4BanW5EnNq90dYIzvyWnlAXMhWxKnnue6+e8yS08Wy9GtjJjmmadTargDKLLhwN3PVxAHXKpV4wvxWQ04QZHCgEoSyzo3c7bFSDex8k1DMaV8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB4342.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(186003)(86362001)(83380400001)(2616005)(26005)(38100700002)(31696002)(2906002)(53546011)(66946007)(36756003)(66476007)(66556008)(6506007)(8676002)(6512007)(6486002)(8936002)(508600001)(4326008)(31686004)(5660300002)(316002)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WXZ2NXA1a2tnR1FuMGN3N1pGRGtpSlBWWXNlZG1zL1owVytrKzlGLzBLMzNQ?=
 =?utf-8?B?cUtnb3JVVEorZVRvc00zbVlGUmxJK0luRVA0MUxWbTBYdlozTzlMWVdtU29l?=
 =?utf-8?B?NDdKVUJlbHNrQXYxMXNsellvRXE0R3RzajhWalZpS1BWWWRhTU9wMWVPSC9C?=
 =?utf-8?B?dW16MkFCOHhWU1NqQmVyZ3IrN2hDd2l6RjRVSFVScEZHL3dWQ082Y1FFTjg0?=
 =?utf-8?B?eU1MUDFyQVkrYUFSOFU4SUxxazZEZVRtUk9wOGxHbENxbXl2aWVwZHFrVS9L?=
 =?utf-8?B?VjdybnhlZzl4VGt6OUVQSStJbm1yZ2l5TlIrVWVhajE4bk1GOHUwMTdwYzlO?=
 =?utf-8?B?dkFOeTc3aVFRTWpKek9UdVpyRkJ1MERDczR1WWhWR1lBV2RFdlNoNERsWSs4?=
 =?utf-8?B?c0l0c08zb1hSaDkvSUpERmVDbWlrZ1ZBMjEzNlpaaHZtait0M1hLbFM5ZnJZ?=
 =?utf-8?B?V3hzTi93RlBUems3MllodEt6bEJxbFZwS1ZBdGRxNFZET2lCYWQvem5XSXUy?=
 =?utf-8?B?UGRMaG5kaG5PUEFuU3M4bzVIRXlqQncxUXlycXFhM1lUMTA4Y29ETDBJQnVq?=
 =?utf-8?B?TmdPMjBPS05SRmg1a1ZKTWR6MHBBUFMzRGxHQnZRZE4zYzFiRzc5dW9VeGJn?=
 =?utf-8?B?dU9HZWp4N3Y5Sng4dlhVb2gxMytBaTVmd0x3ajJBSGNncW5kVzBtODRxcElE?=
 =?utf-8?B?blgyV1pzcUxld0xER1h0aWFQeVlLNElrKzVwWjNGZGtLZWxxaVFWTEZhTlc0?=
 =?utf-8?B?NE4ycEUvTUNHM2xwaXo2QmRVUnRxUFFveno5YVVOZkw3bzV1THBEOXlHN3Ns?=
 =?utf-8?B?bitKRGVaVmt4MTY2NUZQYlVrdm5xRmJtQllvTTVYNklxVHF0S2J4S2cyWE5K?=
 =?utf-8?B?ajFHU2hXL09EZXJZb1lzaEJNV3g5RTlhWWh1eFNYaEUzVGhTREJEaUpUYlNB?=
 =?utf-8?B?a3hZL1h2WXovUHZVMzFDVHUvYWtMMjV3TGRlb1MzYW5BbFlaVzE1UzlvbVFZ?=
 =?utf-8?B?eWNUeDNlOHBETXNySURlamRuOTUvWExqV0N5YlZkR0hRem9qeFgzVEpVTXFs?=
 =?utf-8?B?QzIzZ1VQTDZ5RXcyTGpFQUdCdVc0a1k2cGw3cTZacUFhdmFTbmRsa1R6VFIy?=
 =?utf-8?B?cDVGd0pZRnlJSjNpYjZNVDBHMmpaWU9DU3lCSmVtWE4raS9KY3J5SjdzUzNh?=
 =?utf-8?B?dXNGVTdBTFhTcjVzWE5oWVlMd0dKT2lkbXR0SlZ5djR6NklSaFVZcGNXbGNn?=
 =?utf-8?B?MTUzUTNyOWR3NGtSVUV2emE5aldSRFQyNmFwZkovbEg5S3ZaRk1BTGV4ZjI2?=
 =?utf-8?B?UGZtY0o3d1FHY0JySzQ1VG1PWUNVUVUrN3RzemE5bkZQYjVYVENxNElwSlhI?=
 =?utf-8?B?WHBiVjBuVGkzazBPL1NhVU0wZFYvbnN3dHBXRnhja3RkTjdDVnV6Z0p6Ny9z?=
 =?utf-8?B?WXhETW80dU83aXBMc0ExaklwcDRJMGI5WXY4K0xxMHF6NTMrak9OaGV4YlVW?=
 =?utf-8?B?K01pSHR6SUJnTXpSbk5tQjFEeFliTFRhVThxcGwwRzhFajJQYjljTGhEUFBU?=
 =?utf-8?B?Qk9NS1NrWUxwMnJma00wRVlOMlhrbGIzWGYveHRPeVo1WDRMTlRaM3J6eTBK?=
 =?utf-8?B?NmJSajg1djVpZHpsVmpUblBNTjlXcDFOOXJkSFg3SXNTaDB5eVk1ZTJHVjdH?=
 =?utf-8?B?RlZFdk56WWRTeWxVaGs3ZmpzR1U1Si9lNTZLRVZNVmQybW5WcW1BeDIrZElt?=
 =?utf-8?B?NFFoTU9QRU9taHljdkExN3NMOXg0QkdUMjg1NXR2NTFwdk9wUHJUN0s0L3pH?=
 =?utf-8?B?QUhnazl6TjJ0dk84QkRxYXF1TzZKaHhPVUg4cHBheEtjUnBRWC9WL1dlNGdh?=
 =?utf-8?B?MjdOalVGZ3pOZDNubTh2cDdpem1pYTI0ajdtQ1QrQlp1L1lPSXUxN0dxRTQx?=
 =?utf-8?B?STRiRHdPTDN6cWdzM1NTM2NsK1NLVTNxanNvN0xRaVBMMm5CL1dPVTZmMkpP?=
 =?utf-8?B?NnFiRDljOXkzOVZ1d3M3VFRzTGpzTGd4RU5BZHFKVnpGT2JrcGYwNXZ3Nk5q?=
 =?utf-8?B?YUN2YWxnYXhMQnI5U3dmcGQvOHA1eGF4K2dQaWFhelErRGxReVZ2SUh1U3ZE?=
 =?utf-8?B?WU5JUnp0d0JtNEFWR243WkR1OHVGY2NvM2lBeU5UcFpsUDRvckFyaDdTd2Vy?=
 =?utf-8?Q?IR1dt/6LhrRzZcn9a+SnS/I=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c8c8577e-b791-4a50-5c6a-08d9f63522fc
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB4342.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Feb 2022 18:57:13.3413 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9clFEOXRoBzP39qAdGbtptsusDfmvQcRsZpktSDDI224fu/tz38M+UMGAtJEc/3NDiYgXuVu7D7mc54QO0HuhQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5887
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
Cc: alexander.deucher@amd.com, tzimmermann@suse.de, christian.koenig@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 08/02/22 3:10 pm, Matthew Auld wrote:
> On 03/02/2022 13:32, Arunpravin wrote:
>> add a test to check the maximum allocation limit
>>
>> Signed-off-by: Arunpravin <Arunpravin.PaneerSelvam@amd.com>
>> ---
>>   .../gpu/drm/selftests/drm_buddy_selftests.h   |  1 +
>>   drivers/gpu/drm/selftests/test-drm_buddy.c    | 60 +++++++++++++++++++
>>   2 files changed, 61 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/selftests/drm_buddy_selftests.h b/drivers/gpu/drm/selftests/drm_buddy_selftests.h
>> index a4bcf3a6dfe3..ebe16162762f 100644
>> --- a/drivers/gpu/drm/selftests/drm_buddy_selftests.h
>> +++ b/drivers/gpu/drm/selftests/drm_buddy_selftests.h
>> @@ -7,3 +7,4 @@
>>    * Tests are executed in order by igt/drm_buddy
>>    */
>>   selftest(sanitycheck, igt_sanitycheck) /* keep first (selfcheck for igt) */
>> +selftest(buddy_alloc_limit, igt_buddy_alloc_limit)
>> diff --git a/drivers/gpu/drm/selftests/test-drm_buddy.c b/drivers/gpu/drm/selftests/test-drm_buddy.c
>> index 51e4d393d22c..fd7d1a112458 100644
>> --- a/drivers/gpu/drm/selftests/test-drm_buddy.c
>> +++ b/drivers/gpu/drm/selftests/test-drm_buddy.c
>> @@ -16,6 +16,66 @@
>>   
>>   static unsigned int random_seed;
>>   
>> +static int igt_buddy_alloc_limit(void *arg)
>> +{
>> +	u64 end, size = U64_MAX, start = 0;
>> +	struct drm_buddy_block *block;
>> +	unsigned long flags = 0;
>> +	LIST_HEAD(allocated);
>> +	struct drm_buddy mm;
>> +	int err;
>> +
>> +	size = end = round_down(size, 4096);
>> +	err = drm_buddy_init(&mm, size, PAGE_SIZE);
>> +	if (err)
>> +		return err;
>> +
>> +	if (mm.max_order != DRM_BUDDY_MAX_ORDER) {
>> +		pr_err("mm.max_order(%d) != %d\n",
>> +		       mm.max_order, DRM_BUDDY_MAX_ORDER);
>> +		err = -EINVAL;
>> +		goto out_fini;
>> +	}
>> +
>> +	err = drm_buddy_alloc_blocks(&mm, start, end, size,
>> +				     PAGE_SIZE, &allocated, flags);
>> +
>> +	if (unlikely(err))
>> +		goto out_free;
>> +
>> +	block = list_first_entry_or_null(&allocated,
>> +					 struct drm_buddy_block,
>> +					 link);
>> +
>> +	if (!block)
> 
> err = -EINVAL;
> 
>> +		goto out_fini;
>> +
>> +	if (drm_buddy_block_order(block) != mm.max_order) {
>> +		pr_err("block order(%d) != %d\n",
>> +		       drm_buddy_block_order(block), mm.max_order);
>> +		err = -EINVAL;
>> +		goto out_free;
>> +	}
>> +
>> +	if (drm_buddy_block_size(&mm, block) !=
>> +	    BIT_ULL(mm.max_order) * PAGE_SIZE) {
>> +		pr_err("block size(%llu) != %llu\n",
>> +		       drm_buddy_block_size(&mm, block),
>> +		       BIT_ULL(mm.max_order) * PAGE_SIZE);
>> +		err = -EINVAL;
>> +		goto out_free;
>> +	}
>> +
>> +	if (!err)
> 
> Always true AFAICT?
> 
>> +		pr_info("%s - succeeded\n", __func__);
> 
> I guess this could be made part of the run_selftests()? It looks like it 
> already prints the current test, perhaps that is already enough?

removed all unnecessary succeeded prints

Thanks,
Arun
> 
> With the err = -EINVAL change, feel free to add,
> Reviewed-by: Matthew Auld <matthew.auld@intel.com>
> 
>> +
>> +out_free:
>> +	drm_buddy_free_list(&mm, &allocated);
>> +out_fini:
>> +	drm_buddy_fini(&mm);
>> +	return err;
>> +}
>> +
>>   static int igt_sanitycheck(void *ignored)
>>   {
>>   	pr_info("%s - ok!\n", __func__);
