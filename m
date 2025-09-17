Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77B64B814D7
	for <lists+dri-devel@lfdr.de>; Wed, 17 Sep 2025 20:09:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0F5D10E13A;
	Wed, 17 Sep 2025 18:08:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="vcK4flVu";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012002.outbound.protection.outlook.com [52.101.53.2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A699410E13A
 for <dri-devel@lists.freedesktop.org>; Wed, 17 Sep 2025 18:08:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cdlYJXRyvWMdGjXuTIJ0FKynT9BXaQ5kYZFQG42ko7WFhz0YQvMt484s74JxeCIHJqOUP3b/O8BC+gBMSgen4NWH+CuVLHfUgdjpZ/jBBLuk5Yni6DKSsC31zEwJKRJvpheWsakluzmgTUwH1acM0rcNmUZrISfHOiFIGvj7cNGHRGxGpsCTWpfcZ7VLKBEMF2UMlnYaJc2pBojVDPFeX+7d/TM+ZJpeZpFx3UrzzSI9grmtQgW2sM7HFjj0of6QincNe8VbG81OyQlRm90Bbn78bO2tzv+yL4KTtSGg91OS6bAYtTc6gOFa69OvGfBREpKzwUP1O+qT7G8G+UeMDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pCDwGtasUO8DtmEQ7vK9ki4rES9j8C0VxydW3Wwjieg=;
 b=rjUc3/Dhg8VwQxooq5KT+BqyLHvuJdbd7giCmNV+Aqvh9/ZeO20JMd7Y0hJecegAxoIs6pfJWESnq521IeN46bWHH3uI/jBRfxbHAWjxXJb2VYa4wnYJsERjMSAGlKE+XBSNom7069CKfAU9uFw0HEMmYP1UX6Go9RfxMBb/Mn9M03tuBqNDU+4H1M4Oo0uEiGthkYwEj87ALRpHojIsnzndnujNgApcPmMK5nSnvGVIQ3cjpn5yqCZfy4+mgoMRgD7rOVrXRCqtCclM8IZo1v0+phMywFw2xR38lBuUELx+oHtdupSJPAH4jN0Or+lTxQ/wwNKUQnhYp7WjRo8Q1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pCDwGtasUO8DtmEQ7vK9ki4rES9j8C0VxydW3Wwjieg=;
 b=vcK4flVuLxVKi5naCUmepBy1wNH4O4hNCpSsbB736eH+9g+ZpQSy2C8GsHtLCFdZUDsVC8yHta1yeeylrYc51U28xGzh5tD2yFIg5H/+uzv2pZnskPSoJQf++clEK4KiG/oDAwTfmZHP66psg+i7yLouLTl7fU9RM5Qo/Vixkqc=
Received: from DM6PR01CA0023.prod.exchangelabs.com (2603:10b6:5:296::28) by
 CH2PR12MB4215.namprd12.prod.outlook.com (2603:10b6:610:ab::24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.13; Wed, 17 Sep 2025 18:06:10 +0000
Received: from DS1PEPF00017096.namprd05.prod.outlook.com
 (2603:10b6:5:296:cafe::c8) by DM6PR01CA0023.outlook.office365.com
 (2603:10b6:5:296::28) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9137.14 via Frontend Transport; Wed,
 17 Sep 2025 18:07:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb08.amd.com; pr=C
Received: from satlexmb08.amd.com (165.204.84.17) by
 DS1PEPF00017096.mail.protection.outlook.com (10.167.18.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9137.12 via Frontend Transport; Wed, 17 Sep 2025 18:06:09 +0000
Received: from Satlexmb09.amd.com (10.181.42.218) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 17 Sep
 2025 11:06:03 -0700
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb09.amd.com
 (10.181.42.218) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Wed, 17 Sep
 2025 11:06:03 -0700
Received: from [172.19.71.207] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Wed, 17 Sep 2025 11:06:02 -0700
Message-ID: <834cb380-01e3-f35b-b732-0417fc15af53@amd.com>
Date: Wed, 17 Sep 2025 11:05:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V2] accel/amdxdna: Call dma_buf_vmap_unlocked() for
 imported object
Content-Language: en-US
To: "Falkowski, Maciej" <maciej.falkowski@linux.intel.com>,
 <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <mario.limonciello@amd.com>
References: <20250916174842.234709-1-lizhi.hou@amd.com>
 <a682eea5-8956-49a4-87a5-8affc3a03c03@linux.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <a682eea5-8956-49a4-87a5-8affc3a03c03@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF00017096:EE_|CH2PR12MB4215:EE_
X-MS-Office365-Filtering-Correlation-Id: 96e154d6-442f-4888-76b7-08ddf614e139
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?blY5WkN0eFNLdVhJMkR6ZjNiSzV0RFVYeW8wc2lrVnRWOFFmZEFzMndEQkpX?=
 =?utf-8?B?S2pTcWdyU0luem1RcFBzdElNYm9xZkxyOGl0NkZ2clBtRnNqRGQ5NHl1RVFv?=
 =?utf-8?B?cEYraTVnK2tENmdQMS8vZ3NsNFFVQ0ZNNnNhaHBUWU9iMFZWMGtVUWlyRkFD?=
 =?utf-8?B?RmZUaWYwMmFkc2l1emlDQktKMERVbmZUdC9zY2JaVng3Z1hJSDg4N1RJYlVQ?=
 =?utf-8?B?SWJVdUpGaGhVNTZWTmtmK1dXS2w1cStUTXBNbmR6c2VOeWwwWmYySGw2cytL?=
 =?utf-8?B?b0MwbEhMMjhTaytCcDVYbFFsbzhyMGJMbmdTdWw3bUJrQ0ZiS0IwTU9XWDEx?=
 =?utf-8?B?Y2xmR3ppV2NKWkdqcEo4cmhDdDZTQnRVT2pKK3oxSFVTRTBKSHdWd3JEcnZt?=
 =?utf-8?B?WFppQ0V5QUZYSlBwSnB0UVZENUVlenhiRCtPVXpnS2FLaFBzay9YMTJLVDBi?=
 =?utf-8?B?anN1L2hUZGNhVVVFalFWdW44OUMrMnNvQzF6KzBJU3JSY01PSEVtTXVnaHh2?=
 =?utf-8?B?cldwYk1LUk4wS3htNFhTOHZYbFJYR2c5bEhhclRDVXNVNVViSndrckpBTDFD?=
 =?utf-8?B?MSt4cmZjVFJQcGtiSHNSQ1QreC9jek1vTVJXYnJpZ1B6bWdYU0kxOE5yaTgz?=
 =?utf-8?B?NUhQb0FvMzVoVVFRUXRKK2lyQ2FOemFGQzMyTlUzeEcrOEpEUGY2RExPRUN1?=
 =?utf-8?B?VUNLUkFYbW1IcFJWMTFCaVcza3gwRGhGa09XWUNhVmFFM0NLZlViV1FQS1Ey?=
 =?utf-8?B?NTlSeGJyN21IUE9HSWxVeXFjU0F6QnJsaTNRem55T3A0YXk2d1JYVmhoWmxY?=
 =?utf-8?B?VU40ZTZQcDR4cFN4T29YMXY0Q2tHejE1V1Z5QXBwTkJoUVBqOS9vbWFNN3dk?=
 =?utf-8?B?SEZaem50RUh0UFhBRTFseEU3VDdsYmZ4akNHY1NEVi9ZR0prY1g3NXVxeTlr?=
 =?utf-8?B?aFFrbmlKb3ZBOTdsMjc2dEsvc3ZPYk5UemNRaXI5bzZ0TUF0bGtLQUlEZ1c4?=
 =?utf-8?B?bm9ReWk1MVl5RDdTRTZvNVJuQnZ3elV3K1ZTa2I3WDV1RUo1Q0ZkVlBwWWdQ?=
 =?utf-8?B?OHlvdHJqOXpLN1F4YUR0MjEvRFo5Q0x5Q2QxMmhBRWN0M2RvUFBqN1R5V25T?=
 =?utf-8?B?UUZsd05ndk5WOGdnZWE1WXJGSkhxbkpUQWNqZW02MlNIRUNBNks3RDk1cFFO?=
 =?utf-8?B?Z2E4MUZOYXlpUVQ0UllBNmxIckpjdnR1dnJtbGxWZm9nOHNORG13bTR5VHJC?=
 =?utf-8?B?ME9EbDhVRnlBOGwyWmthcklqRjllK3ZDNGVUZmY1V2xsNXRqM3FnVTBSL2kw?=
 =?utf-8?B?UTlla05kM3Z1VGpmeHUyanU2K3dzMXFrOHdFYStHUE5OYlF1K3JKVSs3c0N3?=
 =?utf-8?B?ZndkR0xYZ1gvL1N1MG1zYTJCK3JRSE8raHREcDdyZ2dzcUZuNU9NazlZNXA3?=
 =?utf-8?B?cDNLbHNTRU5FYS9aZjhSRkVtQ3NTcmdCSHlTd3RGQ2dTWkNQWVM1b3ovNG9Y?=
 =?utf-8?B?RkJsNks5QXdZSUFBd0dwS2FwYWhZcFNDaisxQ2R1YlpieVY2TGRKS2FzMXoz?=
 =?utf-8?B?R1hKbVhXL1FRUTZmcFB0WGNnK0dEMXBOdDhKeVk0ay84OUNjWEdiaUljb0VS?=
 =?utf-8?B?MFM1dVhUbGlraTBBaFd4djNReVZFcEJQWlc4WXRqQVdkQ1pJcndXN2RFQVFX?=
 =?utf-8?B?c0ljcGE3WDZtZFFzc0VXNDFlWUltQUlvMWcvdHdjSGJ4d1NFMEFBODRTVzd5?=
 =?utf-8?B?YytiYnRJQTBXTVU1WVIwVjNFT3ZXQStkb2g4SS8raFNTcGc4TW1iNFpLN0lS?=
 =?utf-8?B?Z0V1V0Q2Zjc0aG5zMHhiY0tETFFjckdZQ0d2aGhKaDAxZmZLMTFGQ0JEZUd0?=
 =?utf-8?B?RVkvaVk5MHV6aDJqcnNiQ2IwcllJYVNCeUN6RUk5QjJFeW5xNmtUMlJOb3lV?=
 =?utf-8?B?b3hNOUhISUd1RDM0ZE9VYWw4UVVSdUdqaHQ5cEt6ckkzblJVd1c5M1BEUXFC?=
 =?utf-8?B?Z1VVUE1ZeHlEQlAwaDRNdGg5ZnVtZ1pkOFpmMFdyL2UvdkorQUxaUnN3M1lI?=
 =?utf-8?Q?HZ79wk?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:satlexmb08.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 18:06:09.4267 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96e154d6-442f-4888-76b7-08ddf614e139
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[satlexmb08.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017096.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4215
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

Applied to drm-misc-next

On 9/17/25 07:15, Falkowski, Maciej wrote:
> Reviewed-by: Maciej Falkowski <maciej.falkowski@linux.intel.com>
>
> On 9/16/2025 7:48 PM, Lizhi Hou wrote:
>> In amdxdna_gem_obj_vmap(), calling dma_buf_vmap() triggers a kernel
>> warning if LOCKDEP is enabled. So for imported object, use
>> dma_buf_vmap_unlocked(). Then, use drm_gem_vmap() for other objects.
>> The similar change applies to vunmap code.
>>
>> Fixes: bd72d4acda10 ("accel/amdxdna: Support user space allocated 
>> buffer")
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>> ---
>>   drivers/accel/amdxdna/amdxdna_gem.c | 47 ++++++++++++-----------------
>>   1 file changed, 20 insertions(+), 27 deletions(-)
>>
>> diff --git a/drivers/accel/amdxdna/amdxdna_gem.c 
>> b/drivers/accel/amdxdna/amdxdna_gem.c
>> index d407a36eb412..7f91863c3f24 100644
>> --- a/drivers/accel/amdxdna/amdxdna_gem.c
>> +++ b/drivers/accel/amdxdna/amdxdna_gem.c
>> @@ -392,35 +392,33 @@ static const struct dma_buf_ops 
>> amdxdna_dmabuf_ops = {
>>       .vunmap = drm_gem_dmabuf_vunmap,
>>   };
>>   -static int amdxdna_gem_obj_vmap(struct drm_gem_object *obj, struct 
>> iosys_map *map)
>> +static int amdxdna_gem_obj_vmap(struct amdxdna_gem_obj *abo, void 
>> **vaddr)
>>   {
>> -    struct amdxdna_gem_obj *abo = to_xdna_obj(obj);
>> -
>> -    iosys_map_clear(map);
>> -
>> -    dma_resv_assert_held(obj->resv);
>> +    struct iosys_map map = IOSYS_MAP_INIT_VADDR(NULL);
>> +    int ret;
>>         if (is_import_bo(abo))
>> -        dma_buf_vmap(abo->dma_buf, map);
>> +        ret = dma_buf_vmap_unlocked(abo->dma_buf, &map);
>>       else
>> -        drm_gem_shmem_object_vmap(obj, map);
>> -
>> -    if (!map->vaddr)
>> -        return -ENOMEM;
>> +        ret = drm_gem_vmap(to_gobj(abo), &map);
>>   -    return 0;
>> +    *vaddr = map.vaddr;
>> +    return ret;
>>   }
>>   -static void amdxdna_gem_obj_vunmap(struct drm_gem_object *obj, 
>> struct iosys_map *map)
>> +static void amdxdna_gem_obj_vunmap(struct amdxdna_gem_obj *abo)
>>   {
>> -    struct amdxdna_gem_obj *abo = to_xdna_obj(obj);
>> +    struct iosys_map map;
>> +
>> +    if (!abo->mem.kva)
>> +        return;
>>   -    dma_resv_assert_held(obj->resv);
>> +    iosys_map_set_vaddr(&map, abo->mem.kva);
>>         if (is_import_bo(abo))
>> -        dma_buf_vunmap(abo->dma_buf, map);
>> +        dma_buf_vunmap_unlocked(abo->dma_buf, &map);
>>       else
>> -        drm_gem_shmem_object_vunmap(obj, map);
>> +        drm_gem_vunmap(to_gobj(abo), &map);
>>   }
>>     static struct dma_buf *amdxdna_gem_prime_export(struct 
>> drm_gem_object *gobj, int flags)
>> @@ -455,7 +453,6 @@ static void amdxdna_gem_obj_free(struct 
>> drm_gem_object *gobj)
>>   {
>>       struct amdxdna_dev *xdna = to_xdna_dev(gobj->dev);
>>       struct amdxdna_gem_obj *abo = to_xdna_obj(gobj);
>> -    struct iosys_map map = IOSYS_MAP_INIT_VADDR(abo->mem.kva);
>>         XDNA_DBG(xdna, "BO type %d xdna_addr 0x%llx", abo->type, 
>> abo->mem.dev_addr);
>>   @@ -468,7 +465,7 @@ static void amdxdna_gem_obj_free(struct 
>> drm_gem_object *gobj)
>>       if (abo->type == AMDXDNA_BO_DEV_HEAP)
>>           drm_mm_takedown(&abo->mm);
>>   -    drm_gem_vunmap(gobj, &map);
>> +    amdxdna_gem_obj_vunmap(abo);
>>       mutex_destroy(&abo->lock);
>>         if (is_import_bo(abo)) {
>> @@ -489,8 +486,8 @@ static const struct drm_gem_object_funcs 
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
>> @@ -663,7 +660,6 @@ amdxdna_drm_create_dev_heap(struct drm_device *dev,
>>                   struct drm_file *filp)
>>   {
>>       struct amdxdna_client *client = filp->driver_priv;
>> -    struct iosys_map map = IOSYS_MAP_INIT_VADDR(NULL);
>>       struct amdxdna_dev *xdna = to_xdna_dev(dev);
>>       struct amdxdna_gem_obj *abo;
>>       int ret;
>> @@ -692,12 +688,11 @@ amdxdna_drm_create_dev_heap(struct drm_device 
>> *dev,
>>       abo->mem.dev_addr = client->xdna->dev_info->dev_mem_base;
>>       drm_mm_init(&abo->mm, abo->mem.dev_addr, abo->mem.size);
>>   -    ret = drm_gem_vmap(to_gobj(abo), &map);
>> +    ret = amdxdna_gem_obj_vmap(abo, &abo->mem.kva);
>>       if (ret) {
>>           XDNA_ERR(xdna, "Vmap heap bo failed, ret %d", ret);
>>           goto release_obj;
>>       }
>> -    abo->mem.kva = map.vaddr;
>>         client->dev_heap = abo;
>>       drm_gem_object_get(to_gobj(abo));
>> @@ -748,7 +743,6 @@ amdxdna_drm_create_cmd_bo(struct drm_device *dev,
>>                 struct amdxdna_drm_create_bo *args,
>>                 struct drm_file *filp)
>>   {
>> -    struct iosys_map map = IOSYS_MAP_INIT_VADDR(NULL);
>>       struct amdxdna_dev *xdna = to_xdna_dev(dev);
>>       struct amdxdna_gem_obj *abo;
>>       int ret;
>> @@ -770,12 +764,11 @@ amdxdna_drm_create_cmd_bo(struct drm_device *dev,
>>       abo->type = AMDXDNA_BO_CMD;
>>       abo->client = filp->driver_priv;
>>   -    ret = drm_gem_vmap(to_gobj(abo), &map);
>> +    ret = amdxdna_gem_obj_vmap(abo, &abo->mem.kva);
>>       if (ret) {
>>           XDNA_ERR(xdna, "Vmap cmd bo failed, ret %d", ret);
>>           goto release_obj;
>>       }
>> -    abo->mem.kva = map.vaddr;
>>         return abo;
