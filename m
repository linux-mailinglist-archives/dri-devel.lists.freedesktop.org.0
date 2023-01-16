Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4EF166B5AF
	for <lists+dri-devel@lfdr.de>; Mon, 16 Jan 2023 03:44:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CB1510E12E;
	Mon, 16 Jan 2023 02:44:42 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2073.outbound.protection.outlook.com [40.107.237.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62D1710E08E;
 Mon, 16 Jan 2023 02:44:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ksZPbFW1HWMqoxfK8/Bb0UIdiY8USGYU9c6ipul9SXtQKpiOqYS1tBEg2TKLy2DoGlEvfYUngesOGEg5gPjLZvKnLAKxbtPjVvNh9n25LYtb372Uu8vqsUFo0q622SwUhX+ttpAg23viVWGDHV7cSnohjrnjZ3f1loUCSZxbMM7IyFQgcyncL0Vafso6jFeP0ORCwydS/LRIF/akuqDj/wsUpM39A/BfG76Avraw321rKyQgbp8YJXhsM9tSI8WPk9AEiQJJ88aBt+tvRnZyoobjWA9uXkalwP/DiLIu47XlNmwesbY5vlOcSY7CCK5NFstIPiXVPkjYj1BihPkaaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=97h8wIG1ICxBHDsUpP+eFbpxiUZFEJoXqY58hp2Iok4=;
 b=oeN+Lx2eHHMo9qlK5dYz2vS0yWaU7V9SfNundQKcAxZY9lQm81UY1nYsDUW1xgCLPBHbjCxsfmtR7o9daXMp6dCH9H0x2Tb9QSnQAmqcYqBuzuJBsp0C3p4hhmhgexGKrYH5l0Uf2WLYMCLlPQh7Y3kETLzSyCsqf0gbvL+p2fTqFO4sg30kT/0Y3YgjkpvToYSW69BnqNz/dCg+jGauD2T6EiK2LDEw63sn5Ntk1wOQ8Be/gN8VpahCRhI2jMDnUBBAUXlMW54btF7Zs0wpWAD3SYUmELq7bFM42xR+UyKvgoGECsYY5H+c/OM0A3klA8Wht/YsAytnwObshVNhRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=97h8wIG1ICxBHDsUpP+eFbpxiUZFEJoXqY58hp2Iok4=;
 b=2rX/CT//NXwZf4bYNJSr/DpF5h7kPV2PNH7Ft3fozxTTIYTdnCjtX8da4yFSeQIzlmqNig8U8Cxjy9xbMapFo+YEZVMVHyxdmLh6eiRJQumXWfbrso1n5vPjLuNow920YHwdXIBc4MyXYFQQoomFdOV60+Qaan37R1ZMR/f4NgY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM4PR12MB6351.namprd12.prod.outlook.com (2603:10b6:8:a2::6) by
 SJ0PR12MB5455.namprd12.prod.outlook.com (2603:10b6:a03:3ba::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5986.23; Mon, 16 Jan
 2023 02:44:34 +0000
Received: from DM4PR12MB6351.namprd12.prod.outlook.com
 ([fe80::edd2:a5a0:32e4:ae3d]) by DM4PR12MB6351.namprd12.prod.outlook.com
 ([fe80::edd2:a5a0:32e4:ae3d%3]) with mapi id 15.20.6002.013; Mon, 16 Jan 2023
 02:44:33 +0000
Message-ID: <de99eae0-2a8d-f727-cb28-b5ded03521d1@amd.com>
Date: Mon, 16 Jan 2023 10:44:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH 1/2] drm/ttm: Check ttm_debugfs_root before creating files
 under it
Content-Language: en-US
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Ma Jun <Jun.Ma2@amd.com>, amd-gfx@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org
References: <20230113053416.2175988-1-Jun.Ma2@amd.com>
 <92a649eb-b812-a3c5-01dd-2cd6301fbf97@amd.com>
From: "Ma, Jun" <majun@amd.com>
In-Reply-To: <92a649eb-b812-a3c5-01dd-2cd6301fbf97@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG3P274CA0012.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::24)
 To DM4PR12MB6351.namprd12.prod.outlook.com
 (2603:10b6:8:a2::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR12MB6351:EE_|SJ0PR12MB5455:EE_
X-MS-Office365-Filtering-Correlation-Id: 2d8ed8d8-0302-4fa5-c848-08daf76b9935
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aBcaFSlJd9rGDM4PLrSOpn4tkqCWUp3ZtvcAsSezW6048tRIrZmeAS+79wC/pn9OQ+qOrViwWgyXnDH39+8ceR7R95OBejZxXsEo7NgPfwNd0+/6HqY9ukhDkCQsv1AUhkMFeNKpuUbOqlp24seb3jHZ+ZYQm9Hc50izaRDxiTPtWz5JzKJLT8RyJ9qXq1034k9T0E23wOJ7YCY1LDC1N5yjfGFtCpXhz2aJKSry4U4X5y7s9cLKtP+VilL3JIPHW9fi6ujyv9i55IwjT6ZnW77QJO6g1sCsyvUdiDfz5A4879pjH6CymWGx7S7JNa2lhuBf4yOxkjP7MRH5tTnauf73NFTqIphcLvvSblT3dvrzRjZVlI+W+HxfrZIzBA6He2x/XpUVJfyFLvmV8FyHf3Hl1tzklexIg3CWhloyilASJ8VyGl4U76U8zbSHbiog1N+CNgdsO/oyFnK2IpGkbMuj1RBFuXYeHhWewGz0huTarlCRZMvTDRdLwI2PNJQBPhhFKBgNMM3C+t094c/WhTDw2Naw9fxkCNvTsAM7JyCOP5Z2SDf1rbOAQH4eeC04CMnH6wyRctT7QNvxYIM9fl3rUrAS55xZnS/H8wxwukgNbBTh7/7KbOcqZkgGFCGb26zcSNPtmKNSemTYhizmsmJoTr+dMbIKYWv3jVBs6EptisAXVfag7lM2dPfgIobrn3uK4SZlZng3HjIOAH0WAQLnEL+LAaFc9caXd5Gydww=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR12MB6351.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(346002)(376002)(39860400002)(136003)(366004)(451199015)(316002)(110136005)(41300700001)(66556008)(36756003)(8676002)(66476007)(66946007)(4326008)(83380400001)(450100002)(6666004)(66574015)(38100700002)(478600001)(6486002)(31696002)(2616005)(6506007)(6512007)(186003)(53546011)(26005)(2906002)(31686004)(8936002)(5660300002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WWRxMUxPZjJZMlZ5MjMwc21EN3lZU09DTEMzaWNIbkN2YUY1c0NCdzFyZkFO?=
 =?utf-8?B?akpFUml4RHloa1BHbW55NzBBc0ZlbnVQL0w1ZFN3OW44WnpLL3pIRWtzUDRZ?=
 =?utf-8?B?dm85dkcxVHZ6bTZCajRlR09JQ0lRclhxOGsvWVR2R05IRm0rZVc0dHh5cHgz?=
 =?utf-8?B?L1VzaTdaY1E5NWRUVElZTjRCQjhMQ1NyUytyeDU4UXExQ0E2WUl2YVpxLzdP?=
 =?utf-8?B?UmZBdGRFMHBXZWZUL0pTaWovUjY3bEVnNVRHU0VoZEpqSDJoRjhYeTNqMFhF?=
 =?utf-8?B?UTZCSHlJNXJ2Q0pFc05XdGJYb1RDOTY5Z25NZDEvNitRQk40THMxVU80SnJP?=
 =?utf-8?B?UGcvTkEzQmlBNmxxaEt6MWI1bjRNekRxa1JwZTFsMWtUWHNkck1aTzNHdHFL?=
 =?utf-8?B?cEhiQ3dUb1lKdUMrenNnMHJEWFB4ZjZHcjQwNXRWTkRBRXZVcDhmdkN1V1Fr?=
 =?utf-8?B?MFloTDJPWWZidWY0QkxhdGVBc2lHSEhjZUw1c3o5ZzdhdUMyK0QzZllnZ0o0?=
 =?utf-8?B?NU5SQUFudVRIQ3ZNSUpxUE4wZXJxaEdYMEx4bk13dFdSeDNVdXhycGxYb2lX?=
 =?utf-8?B?cEhZK2hHUFRpUktWWkRqR1lHM3N6NkdqV2ZORUVMcUs1cDdvcU81NFkyL0g2?=
 =?utf-8?B?MllsNUZnMFlnZFNJNWRkRTlTNWFCVUFjcWpwSGJST0U5eEl1aVVOK3RIelJr?=
 =?utf-8?B?NHpiam5sVTQ4RnpHYkd1QUh2NG80QmFVelhTZkJlSjF4TS93UmFCUmdLR3hi?=
 =?utf-8?B?ZXdHbHQ0MEZXMkNNTW5tMVlDWkdaVUpQV0lyUlNKcTRjREdYYUFzUVBodmJn?=
 =?utf-8?B?L2tQZW5ySnRkZlVvOVV2YklHQ3o0VlRBcDNzOFdIU2ZDN0s3UVpxU3RYS2dO?=
 =?utf-8?B?c2I5d1JFdmg3QnRIMXd5K0kwVmt0VUZTYWdCdWFFTHB0dDBNQ1lTS1pScE54?=
 =?utf-8?B?YVhxMGpCSVZ4RDZLc040WVU5aWYyZHFwcXIvUE4xbEo4MHNPTGE5TE9YbTJX?=
 =?utf-8?B?cXQzQ2tFbEM5RkQ4MDUrNlhQeGRIRmRObExaNkZpc0x4b1dFVXoyYTdoZEly?=
 =?utf-8?B?WktJRnFZd1czR3FnWWJqb3BIVHdDZ3lINXlGQmQ3ajhuTkhxUjdQU0orZjdx?=
 =?utf-8?B?UzZ0eWdZRjJEWkxJOURsbHRXd0tiQmJNZGo2ZmtQbnVBc3MwbmFGd3E5VjZQ?=
 =?utf-8?B?djFHWXoxTzFVRFZPZmNaOGloWUdMNFAxcldKeitKSE1XNXNqYzZBZHBoRWVE?=
 =?utf-8?B?UFNMbkZZNXZER3ZBZmRzUnZtZUFDdHhSaTYwZVFPU3A1M0xHUkNxTlJmUXJ5?=
 =?utf-8?B?bHdrMVk5L3grSW1EOVZ0ell5cmwvSTZjZDU0dWRZK1VEN2Mrd0hQbm8rUDh2?=
 =?utf-8?B?SG1NYklJVTlzUFV4RUl5dm1kZ1lPVGdycFByVzRTeFN6ejJTVFptMmJtNXdt?=
 =?utf-8?B?RkM2TnkraHlhSTJYaDBjWlp3UE5ObVBiN2ZpQlJKTEgyd0s4eXFqUGN6bUNB?=
 =?utf-8?B?dThaSFFKMkhvVG9HQ2FvVHlqVnNrVFVPblRSY2pVYlg1YVdoRHp2ZGRweGFP?=
 =?utf-8?B?M3NJYm1QRWhHQU9PK2dMMTVzOGFmRnV4YklIckovSXR0TTg1Rm5Da3BoSm5M?=
 =?utf-8?B?M1pHMGNybUZobnZGVGtVcDdXYUo5WEJGazBGNzNJbk44cUgrdXNMVE5MTEZH?=
 =?utf-8?B?OUxDanhQWEp0NS95RDRsK0d6MGx4UnFSQ0hlbzNERzA4ditOaG1iMFJGSDZI?=
 =?utf-8?B?WmhqSU4rUHp6WFBJTWU4NUU4OGZ0c1dmOXVWM05kd2k1RzVyN2xycVc3aENn?=
 =?utf-8?B?QUF1Mm1WVTB5Q3lhQ2Z0Y1ZaRTgvSHhQOElPSWlXSEZZakxvcE5Ub3czbUV0?=
 =?utf-8?B?RnJLNE10b1FHWitIaGJqM2VoUDNxTGRweWZRa2g2T25Qa1FsakNiQTRrMDVv?=
 =?utf-8?B?THJrK3QzbEVLaVg5ZS91VVhhbVkrRUYyQzFuWDlWZW5pSlNlbzYwZGEzMWFz?=
 =?utf-8?B?R0VsZlVxUEVzQzZ4cDRsNE1wWHBSM1VPZGVLNFFuc3duNS9MRGl0VGdOcUti?=
 =?utf-8?B?YTRjeXhmUURYT01BN0JDaXpDL0lRSXE2NU9vdlJ2MU1yMDVzcVZ2UVpvS3hD?=
 =?utf-8?Q?pOo75Qjjwp63ad4kkEk4D8478?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2d8ed8d8-0302-4fa5-c848-08daf76b9935
X-MS-Exchange-CrossTenant-AuthSource: DM4PR12MB6351.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2023 02:44:33.3315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AL5ItSHcEhZ+K5/xQcPkXPJ/E8jPOOXuMUfpujDZOYXS8+Xiunmr1L/55A5aslPu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB5455
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
Cc: majun@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>



On 1/13/2023 5:37 PM, Christian König wrote:
> Am 13.01.23 um 06:34 schrieb Ma Jun:
>> Check the ttm_debugfs_root before creating files under it.
>> If the ttm_debugfs_root is NULL, all the files created for
>> ttm/ will be placed in the /sys/kerne/debug/ but not
>> /sys/kernel/debug/ttm/
> 
> Well NAK for upstreaming. Why should ttm_debugfs_root be NULL here?
> 

In my case, when the ttm/ removal fails during amdgpu uninstall and then
we try to modprobe the amdgpu again, the ttm_debugfs_root will be NULL
because the ttm/ already exists.

Regards,
Ma Jun

> Regards,
> Christian.
> 
>>
>> Signed-off-by: Ma Jun <Jun.Ma2@amd.com>
>> ---
>>   drivers/gpu/drm/ttm/ttm_device.c |  3 ++-
>>   drivers/gpu/drm/ttm/ttm_pool.c   | 10 ++++++----
>>   drivers/gpu/drm/ttm/ttm_tt.c     |  5 +++--
>>   3 files changed, 11 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
>> index e7147e304637..967bc2244df3 100644
>> --- a/drivers/gpu/drm/ttm/ttm_device.c
>> +++ b/drivers/gpu/drm/ttm/ttm_device.c
>> @@ -105,7 +105,8 @@ static int ttm_global_init(void)
>>   	INIT_LIST_HEAD(&glob->device_list);
>>   	atomic_set(&glob->bo_count, 0);
>>   
>> -	debugfs_create_atomic_t("buffer_objects", 0444, ttm_debugfs_root,
>> +	if(ttm_debugfs_root)
>> +		debugfs_create_atomic_t("buffer_objects", 0444, ttm_debugfs_root,
>>   				&glob->bo_count);
>>   out:
>>   	if (ret && ttm_debugfs_root)
>> diff --git a/drivers/gpu/drm/ttm/ttm_pool.c b/drivers/gpu/drm/ttm/ttm_pool.c
>> index 21b61631f73a..d95a65f759df 100644
>> --- a/drivers/gpu/drm/ttm/ttm_pool.c
>> +++ b/drivers/gpu/drm/ttm/ttm_pool.c
>> @@ -713,10 +713,12 @@ int ttm_pool_mgr_init(unsigned long num_pages)
>>   	}
>>   
>>   #ifdef CONFIG_DEBUG_FS
>> -	debugfs_create_file("page_pool", 0444, ttm_debugfs_root, NULL,
>> -			    &ttm_pool_debugfs_globals_fops);
>> -	debugfs_create_file("page_pool_shrink", 0400, ttm_debugfs_root, NULL,
>> -			    &ttm_pool_debugfs_shrink_fops);
>> +	if(ttm_debugfs_root) {
>> +		debugfs_create_file("page_pool", 0444, ttm_debugfs_root, NULL,
>> +				    &ttm_pool_debugfs_globals_fops);
>> +		debugfs_create_file("page_pool_shrink", 0400, ttm_debugfs_root, NULL,
>> +				    &ttm_pool_debugfs_shrink_fops);
>> +	}
>>   #endif
>>   
>>   	mm_shrinker.count_objects = ttm_pool_shrinker_count;
>> diff --git a/drivers/gpu/drm/ttm/ttm_tt.c b/drivers/gpu/drm/ttm/ttm_tt.c
>> index d505603930a7..fec443494ef0 100644
>> --- a/drivers/gpu/drm/ttm/ttm_tt.c
>> +++ b/drivers/gpu/drm/ttm/ttm_tt.c
>> @@ -394,8 +394,9 @@ DEFINE_SHOW_ATTRIBUTE(ttm_tt_debugfs_shrink);
>>   void ttm_tt_mgr_init(unsigned long num_pages, unsigned long num_dma32_pages)
>>   {
>>   #ifdef CONFIG_DEBUG_FS
>> -	debugfs_create_file("tt_shrink", 0400, ttm_debugfs_root, NULL,
>> -			    &ttm_tt_debugfs_shrink_fops);
>> +	if(ttm_debugfs_root)
>> +		debugfs_create_file("tt_shrink", 0400, ttm_debugfs_root, NULL,
>> +				    &ttm_tt_debugfs_shrink_fops);
>>   #endif
>>   
>>   	if (!ttm_pages_limit)
> 
