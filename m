Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F2A53D3B0
	for <lists+dri-devel@lfdr.de>; Sat,  4 Jun 2022 00:44:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24E6210F14D;
	Fri,  3 Jun 2022 22:44:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2085.outbound.protection.outlook.com [40.107.95.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F140510E2DF;
 Fri,  3 Jun 2022 22:44:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Rp04wli8rj/fg6rj8wGA+oT1Yc+zIg1w0qjePIBOwgwEzYv1JpPA+gJVUu+1fNmWnDZOrmZp0C6Qhhyax71D0z+1S5s5+5D7hqiSkhP2xpuZHYLyMbAt1aGt8yNVjyVWZBCXCTM3QD8bHW9wGDszqL4tMlI2q+CyjLMjGx/iFCfv3h0Rk/b9JSenFTLe/ou+2QqM9oLZMuRujolcNkbqcTDsjSuH1hbIqdTatxrtwexzW25LJRdRDJZRCttawZuPVcQfrsKS/ozTzONsgYlWvM6H/LQoR8jrkE8do9gNtmTgH2j8HQ0sGUtaGsCTyvX08wsRht0zW3MGKskclZE8mw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=42bMIzn3PAAaggtIKbOWVgyElw7tdIfdkRAjT/faWpE=;
 b=luJWkh6ymi1z6nQEJe9cIoP9I1bz+7/tb0MfcxnZuRfPwWZ1CS+WQqjnCY7/QGJ256AXKoPAXnsfIAlzlmQto5kUd0kdZ7FfRhiQUd/NCGbaZ0E7R3UnmnEkJ6bMJkibEv+8eTEhV/1SzCz5QHZnhkUyW9XSHX1f5CF+enEBhV0tBrAm1ZieJApv/saVyA81je9hlnBpb7KoWscj7eqtV9VL1PCIqXMDx44xgrVIX7k9gPL9QPIVv92Nm11wZ4662dKND8XjjCbxjwWwob7ybKEVGjBKPowuXJs3bhiVe9WF/N369oISpLEgi1hfedwJM6JvV18R+E6I0WW/Al9dIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=42bMIzn3PAAaggtIKbOWVgyElw7tdIfdkRAjT/faWpE=;
 b=wANLHYGbp9qsGNAJOxyWJtts6lQ2pr3KB1zQxM2VUjckvINa8uQ+gCkxEccxd90dyJFB9S4t2J2ce9Yn12h9g/I9GLtbyCn4taek1yiBwkDxFipsuF18nGxMtI/zncAVg94z3gHyYynTR8e28oj31pFeUNXAWwo9fjRXuPI9KDE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5115.namprd12.prod.outlook.com (13.101.157.78) by
 DM6PR12MB3099.namprd12.prod.outlook.com (20.178.198.31) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5293.18; Fri, 3 Jun 2022 22:44:17 +0000
Received: from BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::1cf6:2a9d:41d6:e8c3]) by BN9PR12MB5115.namprd12.prod.outlook.com
 ([fe80::1cf6:2a9d:41d6:e8c3%4]) with mapi id 15.20.5314.016; Fri, 3 Jun 2022
 22:44:17 +0000
Message-ID: <29cb2391-3a91-dbef-da59-65d1ea1e50a7@amd.com>
Date: Fri, 3 Jun 2022 18:44:15 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH] drm/ttm: fix missing NULL check in ttm_device_swapout
Content-Language: en-US
From: Felix Kuehling <felix.kuehling@amd.com>
To: =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>,
 mike@fireburn.co.uk, dri-devel@lists.freedesktop.org,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>
References: <20220603104604.456991-1-christian.koenig@amd.com>
 <c9b23cac-6bf0-e8ad-d6b1-f59c1ee1569f@amd.com>
Organization: AMD Inc.
In-Reply-To: <c9b23cac-6bf0-e8ad-d6b1-f59c1ee1569f@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: CH2PR14CA0035.namprd14.prod.outlook.com
 (2603:10b6:610:56::15) To BN9PR12MB5115.namprd12.prod.outlook.com
 (2603:10b6:408:118::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65f9caba-9907-48cb-a742-08da45b29721
X-MS-TrafficTypeDiagnostic: DM6PR12MB3099:EE_
X-Microsoft-Antispam-PRVS: <DM6PR12MB3099A1D444BE3B2DC10FC22C92A19@DM6PR12MB3099.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: tXwj+lyYrncaHiozMi1PsqtEEYZJMNO+dTr6pB4fm3QH0ClSKUFsoOzLML+yimLBTwIhg9ulWZBWspoGwg6if0/sO9Gn7a9iRvnclTCKq+ETfce7kYj0UdZkYfUzkSZpkfer6tpS/PHLst9MWGoCQqG6RIqqUgLScCm2zrdmxay/h3Kq4ivYTlCpHUBld1BuMYO9IGOl+/Nhg076OtHuGtXfQWPk6nBmQqJz4cEfz2ZvhKBsw/XVA/5QI3dknwDLikaynKd5cWbk+dQpzv0dYzUJ0ianf1L2yjQFabearBZ7mHBssqh9AEHr+xr1+sqozFGEr4s4VJSXkBQsyt2RT+1tSp0ZkeBjcYxG5UkN16dNetEmgWuw+TuDgx8hn6mS1/KnmPpOgsKv0ppIU32+v/ElptKC/+3w45Yr86AdZbSvu1UZDU+DqBnYHTbOdfMf9MxkJitoTVOiO9N4vuwewg2vWDyzJpbqkI6/APO9RNROkhqDNfyyP81KbyiYV/xQ6jhrcGJJ2H3IB9G9k6qbUjfeNisW/4ilEqC/pasGiu4GdnPg6R+NYHteQDmmuVaVbDwD7JewgL4v48HZ4cV8HlrlobTyZu4ICoXj+m4UUN8KxOtFCO9raiGwmbtnHqaMugfsRrNGdSBBMadUVhDi+Xv3RrVDdQBihRJTuUU2YqUkwhVnz/pjcwDlfmUEPzLR5KpVX7Kx5SUEe6CfuyZQoFu02nMiZnwPHKhw79PRcCtAV3t9XM6AybO9F34qbzTu
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR12MB5115.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(31696002)(6506007)(2616005)(31686004)(44832011)(6486002)(316002)(36756003)(66556008)(83380400001)(66476007)(8676002)(66946007)(66574015)(4326008)(53546011)(186003)(38100700002)(110136005)(508600001)(86362001)(8936002)(26005)(6512007)(5660300002)(2906002)(36916002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDNJd0tScVlpT2Z2YVhUZG9iUWhqWTkxcjFJWUNPSGt3MzNuZzRRNjhkdEdq?=
 =?utf-8?B?ZUU5eUd3bkJCRVJJc3lVdnBwQk9zL2FVTzlkSVhtVFlOWGwrT05PT0Erb3lj?=
 =?utf-8?B?bDV3dmtTRzE2MncvVGRQdUNDRTBhV0U4WnJBNi96Q1VOWGpEYkF6Q0diQllW?=
 =?utf-8?B?VGRsL2NROFVqMDBMN1Z2ZmIySlNwckU2UHVudGw5RDhGcnBOMXMyU09nMFl6?=
 =?utf-8?B?MGlRT1Zwa0Q1WE1NTnlJTnVQTWVKdzZPdkRUWWVvK0tnRFBVSFJEd2dDRXJy?=
 =?utf-8?B?T3Y3d1h5N3RaNHFSWS9NcmRwaFprZ2dPVTNORW9HTjY2bzQyZXNPVHNUMWE2?=
 =?utf-8?B?VkMvMjdIVU9TVkRpMzc0UWV0UjJPSTBzSWNHNnBVcEwvWE50eXI1c1lRcFZN?=
 =?utf-8?B?emZuenFYbmtuS1B0bnF3VU1GcjIrelhmZUNuS0IzYUM3YzhmYzV6YzNmRitS?=
 =?utf-8?B?dWhvTFV6MCs3MEpDZEdzblBCdEFyZy82QmhJRGJkelpReWFxYkJNOEpXQytT?=
 =?utf-8?B?RUhMU1B3MkNlWmhPM0czcnhzK3ptNXlmSEhmclFzN3JMOXd2bjRSeFY5Tmdj?=
 =?utf-8?B?MG9sQzEzRkVNVnBGWDQrMDRHN1EzR3c4eWdwejVvenJmSFNsbEZYSFRWeDdq?=
 =?utf-8?B?K3poVTNMZFR2K3M2MmxJQlZUUVRLMzIzaEh5bTJGZDh5ZUdaM29XbUx4N0V1?=
 =?utf-8?B?Z0VjMnhWajBkY01iL2ltY2NXWk9nZGVNeHF3SmliOUowdHZ0K0RYa3BYZFI3?=
 =?utf-8?B?Yi8wTVJTOFJleG04aHozZkR5amxCRlpLNDcvVHF5MU4zWThvR0p2ZUd1TnJW?=
 =?utf-8?B?d3VxQ1RRQkw5N1kzcVhDRnVYaGZFSmMzTUVWQVFWMFVOOXI1L24wVXdTM0lv?=
 =?utf-8?B?MU9WOVY0RXJUVjdiRkw3RHdyaG1YbXhYeVNKVVo4cjExUFFXU2VaY0JNazNJ?=
 =?utf-8?B?cFY2QmxlVlA2V05URlZwdG5jL2RZbVR5Ymt6aG4xcVUvbkxkOGdyMUFEWGJH?=
 =?utf-8?B?azVRTERVZkVYeU80V2JSRk1uT1JHT283OTNvZGwxeXRsdy9CYkgrNG9oQWhs?=
 =?utf-8?B?ck9pck4wTFpaZHFjQWVQVVk5R1Z6U004N0h2dXd0S0UyQTV5UjcvSHVZZ0Qx?=
 =?utf-8?B?cW9FeXQvUTMrdlRCTWdvR083eDlNZFFUZVpSVi9iZVd2TURSTENlYStZQ0J2?=
 =?utf-8?B?SnhqK1RpM1lUWmIwUWxyT2ZDekhNRWRuTFNkNVpYUWhwaTFCTUt1ZmxNQmNm?=
 =?utf-8?B?SXdNSlZxUUxlaytLUEFuVjBMa1I3Y0dPU0hBdmZWMEg4ZHFJMGREMWt4eHV1?=
 =?utf-8?B?WnVqc2FyS1lybXZ2SllCOEFmR2dKT1p6c2hvdHdjajRlKzE3dVUzZ2hrVkRD?=
 =?utf-8?B?NkFwRG10MEhlWVRLS1VDanFEd3hFeWx2ZFdtMWtHakZOR3ZLaXlhYjkxZmRT?=
 =?utf-8?B?b3BWTkdxTXZ3V0o4TnRyallxSFlnRGkrQTA2elRjZXFBazV4RnI1Nm5OT0Ni?=
 =?utf-8?B?Ym5VV01pTXBBZFRuWm9oc0VOUS9OdmpJLzV2U05jbFVoRkNZZ0Y1QWV3eW8y?=
 =?utf-8?B?WHhHdk5IT3pnMXl5dnA1MTFCY05qVmxsSDZCOG5ucUZFZWJZQzRpQXZuOEFJ?=
 =?utf-8?B?TWlGMFJObTNJSmhOZVNqZWxDTTZZQ1NOVkFzM1hXMnF5MUhtRTdxYWtZNnRL?=
 =?utf-8?B?QWlsTlZMM0JPdWhKNDRQL0dSVXdXV21CcHg0R2k0aXhSNWRmWW01VW1rY3Vn?=
 =?utf-8?B?WUVDNjNpU0xtcUJoYXdyV2QzY3BmSWwrTkVrMFRtU2RROURTNlpPbG40cUtD?=
 =?utf-8?B?YnF4M1ZxYnhrd1E5SlJ0MG5aTVhiNElQNjVQeEsxUlorenEzSFBLNG1KT0h1?=
 =?utf-8?B?MWk0UHE5Uk15NDNyQ3RENk5ENTlDaUFwcUdjUVRjdGhJZkRrUDBBcnNHMjZ1?=
 =?utf-8?B?OVlVSWRBQ2EyVzBuV2JPVUM3eFJMTFJLenhGNE1pUlQ2TVB3VWFwdmpPanUv?=
 =?utf-8?B?TlVGUmFyZFRnd3czcUdpRlNFZXFacEVDNHhWZTgvOUhlQldQa0g4U1RQdS94?=
 =?utf-8?B?UW03OE8wQjNqRTE3WU5SMEVxM0w0TURyUCtjR08yWmJwaFV1WmxBQ3Q1eGZa?=
 =?utf-8?B?QTdQdVAxRkpJVjlRV2FCOTFHMTVLTjlnYm5vY1dCcVRzUEU4d1RTd2hvTzV3?=
 =?utf-8?B?Z3hlYVVYODg4NVB1QXMxeVRyNVNTd1diNTUyd0g5aXp2UEMzQjJYcXM1MGNw?=
 =?utf-8?B?cU14RmVaNlBzMGxGVnM2bzlVNWxNYktBVVdoRjZGZWQ4N0l5Y1hIcHZNSEIw?=
 =?utf-8?B?WlJzd0cyeUREeFVpQ3RJNVNSdDVWZEFpdnFlS0VsOVVRR2VUbzV3Zz09?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65f9caba-9907-48cb-a742-08da45b29721
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5115.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jun 2022 22:44:16.9812 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0inJQEkYaieYzn4X93QoC16PEg+aKqK6fczdzFxeMb006iT034Q4a0W99HrJPezFp3pJa+9rNN+Jnl1uoTcdNg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3099
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
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

[+amd-gfx]


On 2022-06-03 15:37, Felix Kuehling wrote:
>
> On 2022-06-03 06:46, Christian König wrote:
>> Resources about to be destructed are not tied to BOs any more.
> I've been seeing a backtrace in that area with a patch series I'm 
> working on, but didn't have enough time to track it down yet. I'll try 
> if this patch fixes it.

The patch doesn't apply on amd-staging-drm-next. I made the following 
change instead, which fixes my problem (and I do see the pr_err being 
triggered):

--- a/drivers/gpu/drm/ttm/ttm_device.c
+++ b/drivers/gpu/drm/ttm/ttm_device.c
@@ -157,6 +157,10 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
                         list_for_each_entry(bo, &man->lru[j], lru) {
                                 uint32_t num_pages = PFN_UP(bo->base.size);
  
+                               if (!bo->resource) {
+                                       pr_err("### bo->resource is NULL\n");
+                                       continue;
+                               }
                                 ret = ttm_bo_swapout(bo, ctx, gfp_flags);
                                 /* ttm_bo_swapout has dropped the lru_lock */
                                 if (!ret)

>
> Regards,
>   Felix
>
>
>>
>> Signed-off-by: Christian König <christian.koenig@amd.com>
>> ---
>>   drivers/gpu/drm/ttm/ttm_device.c | 6 +++++-
>>   1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/ttm/ttm_device.c 
>> b/drivers/gpu/drm/ttm/ttm_device.c
>> index a0562ab386f5..e7147e304637 100644
>> --- a/drivers/gpu/drm/ttm/ttm_device.c
>> +++ b/drivers/gpu/drm/ttm/ttm_device.c
>> @@ -156,8 +156,12 @@ int ttm_device_swapout(struct ttm_device *bdev, 
>> struct ttm_operation_ctx *ctx,
>>             ttm_resource_manager_for_each_res(man, &cursor, res) {
>>               struct ttm_buffer_object *bo = res->bo;
>> -            uint32_t num_pages = PFN_UP(bo->base.size);
>> +            uint32_t num_pages;
>>   +            if (!bo)
>> +                continue;
>> +
>> +            num_pages = PFN_UP(bo->base.size);
>>               ret = ttm_bo_swapout(bo, ctx, gfp_flags);
>>               /* ttm_bo_swapout has dropped the lru_lock */
>>               if (!ret)
