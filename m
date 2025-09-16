Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5EECFB59E75
	for <lists+dri-devel@lfdr.de>; Tue, 16 Sep 2025 18:55:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A85310E31B;
	Tue, 16 Sep 2025 16:55:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vOXT2ua1";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from MW6PR02CU001.outbound.protection.outlook.com
 (mail-westus2azon11012007.outbound.protection.outlook.com [52.101.48.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1656D10E31B
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Sep 2025 16:55:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xSyYDreF2FpBfslf7ULi4atLO0GoxkwhN9NNtkEBX6hANodDre9qRqDAysnSoJHkNP36R5y6IxPKaGFFsk6iDt68BcCxRo04YgEoOE4Lwwx4no621ewHYykANj3m49Jhcntbx1cpmknGdiwO2L75w4lFXIAOWei7FivFO+eimzR5h9xlk3nTUb4pG0jKwH3rhRBhx/Vqdm5FYlqeIC8w03i/Rq6/TP6Fh3qJjFXM/h0HOVSGqlMt+teRJolzp2iJ/bLcgusJruj+hLd0vIZZQ5yjQK36h2EigxBGhxXQsbAKeEn5KLuIEau64Zu1nBaw4Gc89kBZZ9m+SSdp+RnrOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HJ/ECgv/DOwI4GxSKchHWbE7r3wGHIA81Pp5rzX+iew=;
 b=kVyShdtF8bVQOTrQ0bKlayLOs5p0y21NvTU53Zvc6iC+oQnFVLoLRwsAH6lPWYqg+fD6MD6jeC40CBoGtsggxaJqqf7jIuh3JxgnDH3O9XWrZmmXB5pAjgMjh5vRCf7xtX+/hFieX2iw0QEVhtzYT0Xh64wULWfX+iUhrcn8wqvz5orZSwh7xPt6A/P4Ob2Gy54Sa5OFpgjXbL5V3FZcVgxeIff74Xhm2krsqduQbXtLSavk0fgeCrIZjMPyBhFrt5zV66sQYQMNhTEKFBij52FkWYiWZhl4vwRW2ms+5RKAvhAu7Z2IK5pUYZtmDuVjmr/n+16ho1ZTIrQa2qpPMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HJ/ECgv/DOwI4GxSKchHWbE7r3wGHIA81Pp5rzX+iew=;
 b=vOXT2ua1lZkQcIWyCb2EUG1dM0OpiIGR/yHl1z0oQYn/7kXD0Nopv1J972R8JQe67JY1sMCJZEzxu1DB/FYDYElivGOV+abftAcf0Pz0fxCAl1AtSZxciSRU1Tmpgc/L6ZeeAp9tlgvxmcRly0MUYpegtCgBXCwkrrnWQRKjpRc=
Received: from CY8PR22CA0008.namprd22.prod.outlook.com (2603:10b6:930:45::18)
 by IA0PR12MB8840.namprd12.prod.outlook.com (2603:10b6:208:490::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.22; Tue, 16 Sep
 2025 16:55:17 +0000
Received: from CY4PEPF0000E9DA.namprd05.prod.outlook.com (2603:10b6:930:45::4)
 by CY8PR22CA0008.outlook.office365.com (2603:10b6:930:45::18) with
 Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.13
 via Frontend Transport; Tue, 16 Sep 2025 16:55:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 CY4PEPF0000E9DA.mail.protection.outlook.com (10.167.241.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Tue, 16 Sep 2025 16:55:16 +0000
Received: from satlexmb07.amd.com (10.181.42.216) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Tue, 16 Sep
 2025 09:55:15 -0700
Received: from [172.19.71.207] (10.180.168.240) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Tue, 16 Sep 2025 09:55:15 -0700
Message-ID: <1488fe4b-011c-8be4-5fca-b7fd4e418085@amd.com>
Date: Tue, 16 Sep 2025 09:55:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RESEND PATCH V1] accel/amdxdna: Call dma_buf_vmap_unlocked() for
 imported object
Content-Language: en-US
To: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>,
 <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <mario.limonciello@amd.com>
References: <20250915161046.135243-1-lizhi.hou@amd.com>
 <50380149-c9cd-4478-9fe0-93d95a1016af@linux.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <50380149-c9cd-4478-9fe0-93d95a1016af@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DA:EE_|IA0PR12MB8840:EE_
X-MS-Office365-Filtering-Correlation-Id: a962bdfa-5359-40dc-ab58-08ddf541d02b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a1UvVlZQaEFSSVNaV2MyOUptUlpaRXRrSyttTkFWcXhaVUNrNE0xSEEwNUlq?=
 =?utf-8?B?UEVXSjVaOWpMc2JUQVU4cXA3NEgydVhreTBkOHF4ajFENkY0eFlJazVkemNY?=
 =?utf-8?B?VEdmZ0lTTUVtVEdWblp5Zk1VMm5GUldSRGdUTnh6L0JEWmx5Tyt5Z0g4RGI0?=
 =?utf-8?B?blEvajdiekl2ZXpOc05GY0hIMGhnU3VRaXFpM3FyMWNKcDc4bEN4anFTek1G?=
 =?utf-8?B?M0ZYVUloK3RyMHlLTUk1U1ppQVVUN0x4bHdWSjNRSE02eTdDdXAvN1pQRFd6?=
 =?utf-8?B?cy9mZHo0SUJOTTc1R1NVMHRMYy9rMzhjTExQNlRDMXRvTHMxYlBxalZBbk9j?=
 =?utf-8?B?VGN1UlF4SWo5TXRmcnlyRW5ucVI4MDdhQ0dUKzlyVnpsS1pRSzVyZXBNcDlG?=
 =?utf-8?B?WW41dHZZL2pVMnA1N3BnRE5takpsamRSRTk4TWcyNGJDSFI0Z0dYdGtOVmtt?=
 =?utf-8?B?UWJZT3BtbTloUFFBMmEwd2ZJc0lZMU9IVGxNZGJWZzF1SXJubERVZklqU2Jj?=
 =?utf-8?B?V0J5ajdGczg1cFVkaFJVVjBaWmNoeFZpN25lbWMyZnZoQ055SXdvWDhZOEhy?=
 =?utf-8?B?eVJlKzJrQlBTeFJyT29SZzZ3Yk5XM2JNV3p4L1B4aVV0Skc3TXFpdVJwMVEr?=
 =?utf-8?B?TlhJSGY4NWp5Rzc5ejdTT2lnZCtCTVdVcCszanM4OVhJSTNJNElibm1HOXgr?=
 =?utf-8?B?SFY0QUtaY1lVTFNYVW8xbDZINzhjeFFORDc2M21OcDV3em93QTFoM3NWZGxM?=
 =?utf-8?B?amx2V0x2cE9jSDJWZWhwR21FSVJhTGwybjhEMnUrUXFXRkZtYnJHNGZ1MHdp?=
 =?utf-8?B?cThZY3VDV2ZnY2hyUTR1bWoxQ0JDalI0M2d3S00zdWRFcG04NUhTeGxtbDNs?=
 =?utf-8?B?d1VCWFRUT2JzaUJIMzEvWksyTXFiQzZVZUtCR2VWOXQ4SVYrUDVIOU9jR2Vq?=
 =?utf-8?B?QXlIU0FaUURNdWxmNEtodk5yalJ1cXZLNnk2Rm9UZUdZM3NKUjhPbnpjODdv?=
 =?utf-8?B?MXdKVFJpUkM5TEVzQUNDa3A0YnZpL0JpRVJpVHBRRitLUkNhMnRmZHhLVm5J?=
 =?utf-8?B?ZU1nTTE4RGJjNzV2VDFJQWZRNXAxZUFWVEhaTTVIQ0pDSjBKOUxpeEZBc1B4?=
 =?utf-8?B?VXlHY3BqQ3BQbFZhdUVXRmtkbnc4eVAzRGpmQUFjUFNveG1VQnhOWDlIdFJn?=
 =?utf-8?B?UnlubWpqVDAvN2s2QkFlYnlUSFdZWXEzRjRuSGlJVHVKZHFIS0dLZUZkNmNM?=
 =?utf-8?B?MEpUQnFrQm1STWd2ellDVW5ScmVmcWZ1dHQrZVpjdDliS1ZlUE1GTmMwQVdw?=
 =?utf-8?B?SUJOWWIrcTVTa3l1WXp1WHZNQkllMlZhR3pMdnhLMTl0c2cxdGloMitSdlVv?=
 =?utf-8?B?K3BMVTlXT2lQZHlnbGNweGtVb2EyNE5qTy9remQ0a0h5TklZK2tnOGxldGE1?=
 =?utf-8?B?NitQeHFlcUNRM1NVWTJqUDJVbkRYc0tZcXBZRFF5aDNmSGkzd0UyNjlOL1k4?=
 =?utf-8?B?ZXo3cUxLU1h2YktmM1J4dXhQeEJmNXVTdEQ4bHZqNmVoS2d3N1pCTXlPenli?=
 =?utf-8?B?dFc4K01keDdtWFA5dEJ5T29MeVp0V0NRM2N6ZmpaNmpyR3ZJNjYrOW5HQlVs?=
 =?utf-8?B?TU5CTzhyQVNNaExxOGRMNjQyV21RSGdGbVl2VHc0TWZ1SHU3L1NYKy9KY213?=
 =?utf-8?B?ODNwNUhQdkZadkQ2SFJhdnNMbExJcG5lMFdOM0h2cksrMnQxdkdsa2Zkc3du?=
 =?utf-8?B?QlZ0eFp5Wks5U3JFeEE1L21YRlNZRnVGaml0Z2p3bDJ3KzFURXhvbGtBSVVW?=
 =?utf-8?B?S1pXQy8yMlU5Y1FRTzNmRzVQVFJVd0k2RHlKL3VtNGpvNzd3QkxtaDFmMnVL?=
 =?utf-8?B?QnMrbmVIVlZtODR2NXhhWm9hbnFFNTdFVVBQQ3FFVGNkY1J6WlY0S3k5ZjlT?=
 =?utf-8?B?R1daYmZlWmRORkpoOWJsSG90VnArcFlOZ0JnTFlYcEVzTngxM2RCMnk1U0Rh?=
 =?utf-8?B?RVptUFJVYkNieWdiUzFuQjlKUjd5S1hvOEJKNEczcWFiZUVhMDBQa3c3UlIw?=
 =?utf-8?Q?y/CRhL?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb07.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2025 16:55:16.9806 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a962bdfa-5359-40dc-ab58-08ddf541d02b
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9DA.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8840
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


On 9/16/25 08:55, Falkowski, Maciej wrote:
> On 9/15/2025 6:10 PM, Lizhi Hou wrote:
>
>> In amdxdna_gem_obj_vmap(), calling dma_buf_vmap() triggers a kernel
>> warning if LOCKDEP is enabled. So for imported object, use
>> dma_buf_vmap_unlocked(). Then, use drm_gem_vmap() for other objects.
>> The similar change applies to vunmap code.
>>
>> Fixes: bd72d4acda10 ("accel/amdxdna: Support user space allocated 
>> buffer")
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>> ---
>>   drivers/accel/amdxdna/amdxdna_gem.c | 38 +++++++++++------------------
>>   1 file changed, 14 insertions(+), 24 deletions(-)
>>
>> diff --git a/drivers/accel/amdxdna/amdxdna_gem.c 
>> b/drivers/accel/amdxdna/amdxdna_gem.c
>> index d407a36eb412..50950be189ae 100644
>> --- a/drivers/accel/amdxdna/amdxdna_gem.c
>> +++ b/drivers/accel/amdxdna/amdxdna_gem.c
>> @@ -392,35 +392,25 @@ static const struct dma_buf_ops 
>> amdxdna_dmabuf_ops = {
>>       .vunmap = drm_gem_dmabuf_vunmap,
>>   };
>>   -static int amdxdna_gem_obj_vmap(struct drm_gem_object *obj, struct 
>> iosys_map *map)
>> +static int amdxdna_gem_obj_vmap(struct amdxdna_gem_obj *abo, struct 
>> iosys_map *map)
>>   {
>> -    struct amdxdna_gem_obj *abo = to_xdna_obj(obj);
>> -
>>       iosys_map_clear(map);
>>   -    dma_resv_assert_held(obj->resv);
>> -
>>       if (is_import_bo(abo))
>> -        dma_buf_vmap(abo->dma_buf, map);
>> -    else
>> -        drm_gem_shmem_object_vmap(obj, map);
>> -
>> -    if (!map->vaddr)
>> -        return -ENOMEM;
>> +        return dma_buf_vmap_unlocked(abo->dma_buf, map);
> Hi,
>
> The dma_buf_vmap_unlocked() will call iosys_map_clear at its start so 
> that
> in this case it will be called twice. Probably it will be optimize 
> out, but maybe
> its something to better omit.
Ok. I will remove iosys_map_clear. The caller uses cleared map even 
drm_gem_vmap might not clear it.
>>   -    return 0;
>> +    return drm_gem_vmap(to_gobj(abo), map);
>>   }
>>   -static void amdxdna_gem_obj_vunmap(struct drm_gem_object *obj, 
>> struct iosys_map *map)
>> +static void amdxdna_gem_obj_vunmap(struct amdxdna_gem_obj *abo, 
>> struct iosys_map *map)
>>   {
>> -    struct amdxdna_gem_obj *abo = to_xdna_obj(obj);
>> -
>> -    dma_resv_assert_held(obj->resv);
>> +    if (iosys_map_is_null(map))
>> +        return;
>>         if (is_import_bo(abo))
>> -        dma_buf_vunmap(abo->dma_buf, map);
>> -    else
>> -        drm_gem_shmem_object_vunmap(obj, map);
>> +        return dma_buf_vunmap_unlocked(abo->dma_buf, map);
> I do also wonder what is the convention here on clearing iosys_map 
> when returning.
> The function drm_gem_vunmap will clear the map for callers while the 
> other not.
> I think at least comment explaining the logic will be necessary.

The input map will not be re-used, so it does not mater if it is cleared 
or not when returning. I will add a comment.

Thanks,

Lizhi

>
> Best regards,
> Maciej
>
>> +
>> +    return drm_gem_vunmap(to_gobj(abo), map);
>>   }
>>     static struct dma_buf *amdxdna_gem_prime_export(struct 
>> drm_gem_object *gobj, int flags)
>> @@ -468,7 +458,7 @@ static void amdxdna_gem_obj_free(struct 
>> drm_gem_object *gobj)
>>       if (abo->type == AMDXDNA_BO_DEV_HEAP)
>>           drm_mm_takedown(&abo->mm);
>>   -    drm_gem_vunmap(gobj, &map);
>> +    amdxdna_gem_obj_vunmap(abo, &map);
>>       mutex_destroy(&abo->lock);
>>         if (is_import_bo(abo)) {
>> @@ -489,8 +479,8 @@ static const struct drm_gem_object_funcs 
>> amdxdna_gem_shmem_funcs = {
>>       .pin = drm_gem_shmem_object_pin,
>>       .unpin = drm_gem_shmem_object_unpin,
>>       .get_sg_table = drm_gem_shmem_object_get_sg_table,
>> -    .vmap = amdxdna_gem_obj_vmap,
>> -    .vunmap = amdxdna_gem_obj_vunmap,
>> +    .vmap = drm_gem_shmem_object_vmap,
>> +    .vunmap = drm_gem_shmem_object_vunmap,
>>       .mmap = amdxdna_gem_obj_mmap,
>>       .vm_ops = &drm_gem_shmem_vm_ops,
>>       .export = amdxdna_gem_prime_export,
>> @@ -692,7 +682,7 @@ amdxdna_drm_create_dev_heap(struct drm_device *dev,
>>       abo->mem.dev_addr = client->xdna->dev_info->dev_mem_base;
>>       drm_mm_init(&abo->mm, abo->mem.dev_addr, abo->mem.size);
>>   -    ret = drm_gem_vmap(to_gobj(abo), &map);
>> +    ret = amdxdna_gem_obj_vmap(abo, &map);
>>       if (ret) {
>>           XDNA_ERR(xdna, "Vmap heap bo failed, ret %d", ret);
>>           goto release_obj;
>> @@ -770,7 +760,7 @@ amdxdna_drm_create_cmd_bo(struct drm_device *dev,
>>       abo->type = AMDXDNA_BO_CMD;
>>       abo->client = filp->driver_priv;
>>   -    ret = drm_gem_vmap(to_gobj(abo), &map);
>> +    ret = amdxdna_gem_obj_vmap(abo, &map);
>>       if (ret) {
>>           XDNA_ERR(xdna, "Vmap cmd bo failed, ret %d", ret);
>>           goto release_obj;
