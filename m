Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 569CAB0467B
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jul 2025 19:27:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 590DE10E02E;
	Mon, 14 Jul 2025 17:27:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="rl4ZB5+Z";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2077.outbound.protection.outlook.com [40.107.100.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0AC6D10E02E
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jul 2025 17:27:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AQAlRMaWy/fWrg7uMLtCPocdhDeDnAVc02J/VC8vs5NhGoPShFzkBDlNrWagiDgKCPNVQjJw6eAxWrKzBNXCpq9BL5AB79AZ0np17aJELe9HjFuOkzDtr+iLY7157wRaxTSz+FkRRRWeDZzh7tP9v2PTnrfmgVTmrSmFrAYs7fdEQEU2xdaEehH8UoYCQnu/zIDyuKo1AWXDuKSFi4LhiQ0wWmN5u1cPkgqpUufHpL0mXIEbnxockvZMYOV+Iya8do/t1/KJklGiuaZEtyDqdkGxsgmvGFxQD548vDQsxh6CjckpCIJxdupJLKKymj41m859LbdNcjkWVJ5wc//01A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3CqQcufVyVQ3xFJ+PYmxSe0536ZSJ7RbsUk3Z6aa91w=;
 b=oTSpRDG3BXDrykCdSQNkta5rKunn6TA3eb/o91cq2tnKe5meIu9Fm6PN/aDafjHx6J8nuCcdZOWIoR02jLIyCGir3JrglYrqzwIa6C2BJ+9RG39FAXRwaKcl0fFXQm586OzZba1Az8gHVEfG1LjLChRss1jlAWudNyVFJSHLwRk6bCcqGBrfJfMLZbVE64ri+FpQm1Yauu8kSijYhcO1eA/f+jLg7Q+ZRqBFRdXr+wHkBozsoebEgOPPLkcEiiqNsn4o2j9M7/0Ni3hI7KJx75vp+c3VLgdmWKxJLoXRBBOAjsEeMlplD3ZlphW/OTV3T9GdnJQwUe4AjpNSyARNbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3CqQcufVyVQ3xFJ+PYmxSe0536ZSJ7RbsUk3Z6aa91w=;
 b=rl4ZB5+Zl9AkPCfgPvK2vaQdAOk/N9rD8A7KHXJrhVb2mx7ovtorzYGk71aBYM+1Nx+7IBEAUoyO8bhJvuwVYRNsVurabGSOy3NmgSK7pOAn1ewLl7B3UF65dn4cYVJ0j5z6RBt79mHjNvbvl7qlGmC1WoguazYRerGDg9uYEwE=
Received: from BN9PR03CA0034.namprd03.prod.outlook.com (2603:10b6:408:fb::9)
 by MN2PR12MB4173.namprd12.prod.outlook.com (2603:10b6:208:1d8::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8922.32; Mon, 14 Jul
 2025 17:27:43 +0000
Received: from BL02EPF00029928.namprd02.prod.outlook.com
 (2603:10b6:408:fb:cafe::8d) by BN9PR03CA0034.outlook.office365.com
 (2603:10b6:408:fb::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8922.32 via Frontend Transport; Mon,
 14 Jul 2025 17:27:43 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BL02EPF00029928.mail.protection.outlook.com (10.167.249.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8922.22 via Frontend Transport; Mon, 14 Jul 2025 17:27:41 +0000
Received: from SATLEXMB06.amd.com (10.181.40.147) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Jul
 2025 12:27:41 -0500
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB06.amd.com
 (10.181.40.147) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Mon, 14 Jul
 2025 12:27:41 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Mon, 14 Jul 2025 12:27:40 -0500
Message-ID: <d128e835-8024-73f6-1fd6-fffb018c4403@amd.com>
Date: Mon, 14 Jul 2025 10:27:40 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V1] accel/amdxdna: Support user space allocated buffer
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <mario.limonciello@amd.com>
References: <20250707193813.880281-1-lizhi.hou@amd.com>
 <1499278a-bc89-4c63-a6d3-54b3a7f87626@linux.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <1499278a-bc89-4c63-a6d3-54b3a7f87626@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL02EPF00029928:EE_|MN2PR12MB4173:EE_
X-MS-Office365-Filtering-Correlation-Id: 6330cea7-3a8a-4bdd-11b3-08ddc2fbbce7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?T3RjcDRXMmd6clFrUlZqdnVSRW90QUMvYUdXbStUWDZlZ293VithcitUdmVZ?=
 =?utf-8?B?UEdkbFNrSkJvSkxESVU0cCtVSlZCZlRCdWxUWkFmWTZhRUhPSjZWY0tyTkRM?=
 =?utf-8?B?cVRxWXBtNDJCdGJGK1dndHlUWUhLT1N1cVZFbzMrSmp1ME1lNjdjL1RtbzZh?=
 =?utf-8?B?cGpob1lqQXFQSXN5OHdMQ3prNDNxb29qYnk5V3ZPMmxJbmJ5NmpiSmxuVWJi?=
 =?utf-8?B?NThSNUlJMXh3akswRTQ4Z2x2WkxsaWg1VmZ6QlZ0amJjRU1OQmFJbjZzU2Fl?=
 =?utf-8?B?cnlURGRUVzUzTEZPT2x2SjBuejN6aCtJSEVrdzQ4YnM3NHNyQlAyY1RMaDFO?=
 =?utf-8?B?eDFIYUJlUGp6NjRlVHNQMzhUczREbVdCaU5rN3hWbEFZK1BuVkhxMlNsOUJR?=
 =?utf-8?B?Mno1eW1jdHF0Q1JNRE5aQlB6RDd1YVZVN0tEN0dSYTJEUjhDS0p3Y1NhWHpv?=
 =?utf-8?B?YzBDODk4a04rL1dvTjJNYlN6a0c3aGFIZkVDRnBySGxSZGlhT1lheEpUWmQx?=
 =?utf-8?B?aWFwM0dSTWlsRUJ6aXF6T0hzZytkMG5EM2ljeFNVZGsrTkM1dmVxTU9VMUFG?=
 =?utf-8?B?WWs1ak9BOHIvWlpyakpGWHFqV3lZUGxhc3ZtZ3MzR3N2ZXcydXlMeTJCMUk3?=
 =?utf-8?B?dXJkSDIrSWMreU5YTi8vTTJkYmozbVFUZWVGL25KM2s0VVgwb0dYV0dJWFJ4?=
 =?utf-8?B?aFRSV01OeGQ1Z05lWGpZOVFvMURFT0h3cmdONjNnMmpqSk1iQ1cydUR3YkhC?=
 =?utf-8?B?Y01qcmFpeXJGNG44alZ3Q1BENHNlc2RqZElyaEwzaDBKQys2SldsbWs5aVFn?=
 =?utf-8?B?VWx2Y1Y4V1d6RkF4TllaRU5LRVNRMWZXeEpHODFuRUV6d0xlK0pjL2w5M0t0?=
 =?utf-8?B?QUNLYXlOdHlCQm9raWJKbkZGclExODlXaGYvWFlTUnRlTDhJV0NQVUZFTkJu?=
 =?utf-8?B?M3prNVpmY0h3WnRkRFZDY2dEdHdvb1NOY1pYYk1qNG1PV09FM0VKTW0yMmgz?=
 =?utf-8?B?d3BiRExLTWxJc2tmMm1RQlZXN0laUEl2OGlJQmh5dXZTMGZIUngwdEp1enRQ?=
 =?utf-8?B?RG8vanppRXZGdDBkcktDOFh5aXJRbkJZUitWbFc4ZGs0WGhmUkdSK3dSMFFn?=
 =?utf-8?B?dVlLc0FWZVFGZjg4V3NUelhWWlVjM2xKbWxReXNVM2FiUTZhWnRjWGVLWm8r?=
 =?utf-8?B?N1ZOdXZGenhJSWtPRFBkdENncUYvSnpVMVF2cE0vSzJNQTNYZUMvSWdHdzNy?=
 =?utf-8?B?Z0h4WVNJajl1eFc3UENCK1ROaGdOaWdtRXloWXlRSTZnTUVFUTZrUHBiV0dV?=
 =?utf-8?B?QXRXcWlmNFdkNGdRRXJoOHFJWFZqSFhQWFZKV0x3bC9HV05kR2xHKzM3VHNO?=
 =?utf-8?B?bkltc1ZIWW5UQ0dCT2x0bmIzRDRIdy83YW0wMlAzbVVlVkpWMFhYZzN5Qm1z?=
 =?utf-8?B?YmZoR0FOdEUrZlV5MkdFbVB5UmpKZXdTTXpZZ0ZCN0lUYVkvckZ3aEtRc1Fi?=
 =?utf-8?B?aHdHZG9vRXprY2hqRFdnOGdtOUt1SnoyOVBRQit6WGRLNWJjQzlEWHZGN1pJ?=
 =?utf-8?B?ZUk3TDRtc0dRNGdaQTd1bk9YTmp6bUJqMHlad04vWXI1THprNDN0YjBiTWdO?=
 =?utf-8?B?ZEcxdktsVkdESXpoaDNxeml5RzVUMnRDSlFRaVlXQ2xIWVNsUVRTVWlzeWFk?=
 =?utf-8?B?YlZ2aDZITUdURzdncEEva3BKL2FhZnUxSUc1VGxYTzZLREpsSzQzK0tSQXJi?=
 =?utf-8?B?ZTlQNncybGVzcTVaZUVwNzNIVlh5VG92Z0RaUmhjcXl1RlNJRjloNmtzdXBz?=
 =?utf-8?B?WjVsVUNtSHgwSmFPaVJJajNUakRydmpFRFdxK3BTQ1pwOVRhMWcvS3Nidytu?=
 =?utf-8?B?ckQwUEdOVk4vMnc2Z3lIcTNIS09WWGtZTFpjc29zRU5uSG0vdERCZUJoRDk4?=
 =?utf-8?B?YXgwUGlaRW4yZUZHcVpHUzc4dVo0SStWdFFZZ3oxTzdPV1dEeWRJY3l1WVQ2?=
 =?utf-8?B?VjRRa0VHaEJldEt2alQxR3RKL2x4SzJKS0taNG5TS3AxNkNKbXcyZm94cXNy?=
 =?utf-8?Q?JT8WLd?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jul 2025 17:27:41.7880 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6330cea7-3a8a-4bdd-11b3-08ddc2fbbce7
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BL02EPF00029928.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4173
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


On 7/14/25 03:33, Jacek Lawrynowicz wrote:
> Hi,
>
> This looks very interesting. It's a clever way of adding userptr on top of existing gem code.
>
> On 7/7/2025 9:38 PM, Lizhi Hou wrote:
>> Enhance DRM_IOCTL_AMDXDNA_CREATE_BO to accept user space allocated
>> buffer pointer. The buffer pages will be pinned in memory. Unless
>> the CAP_IPC_LOCK is enabled for the application process, the total
>> pinned memory can not beyond rlimit_memlock.
>>
>> Signed-off-by: Lizhi Hou <lizhi.hou@amd.com>
>> ---
>>   drivers/accel/amdxdna/Makefile       |   1 +
>>   drivers/accel/amdxdna/amdxdna_gem.c  | 139 +++++++++++++---
>>   drivers/accel/amdxdna/amdxdna_ubuf.c | 232 +++++++++++++++++++++++++++
>>   drivers/accel/amdxdna/amdxdna_ubuf.h |  19 +++
>>   include/uapi/drm/amdxdna_accel.h     |  25 +++
>>   5 files changed, 391 insertions(+), 25 deletions(-)
>>   create mode 100644 drivers/accel/amdxdna/amdxdna_ubuf.c
>>   create mode 100644 drivers/accel/amdxdna/amdxdna_ubuf.h
>>
>> diff --git a/drivers/accel/amdxdna/Makefile b/drivers/accel/amdxdna/Makefile
>> index 0e9adf6890a0..6797dac65efa 100644
>> --- a/drivers/accel/amdxdna/Makefile
>> +++ b/drivers/accel/amdxdna/Makefile
>> @@ -15,6 +15,7 @@ amdxdna-y := \
>>   	amdxdna_mailbox_helper.o \
>>   	amdxdna_pci_drv.o \
>>   	amdxdna_sysfs.o \
>> +	amdxdna_ubuf.o \
>>   	npu1_regs.o \
>>   	npu2_regs.o \
>>   	npu4_regs.o \
>> diff --git a/drivers/accel/amdxdna/amdxdna_gem.c b/drivers/accel/amdxdna/amdxdna_gem.c
>> index 0f85a0105178..d407a36eb412 100644
>> --- a/drivers/accel/amdxdna/amdxdna_gem.c
>> +++ b/drivers/accel/amdxdna/amdxdna_gem.c
>> @@ -18,6 +18,7 @@
>>   #include "amdxdna_ctx.h"
>>   #include "amdxdna_gem.h"
>>   #include "amdxdna_pci_drv.h"
>> +#include "amdxdna_ubuf.h"
>>   
>>   #define XDNA_MAX_CMD_BO_SIZE	SZ_32K
>>   
>> @@ -296,7 +297,7 @@ static int amdxdna_insert_pages(struct amdxdna_gem_obj *abo,
>>   
>>   	vma->vm_private_data = NULL;
>>   	vma->vm_ops = NULL;
>> -	ret = dma_buf_mmap(to_gobj(abo)->dma_buf, vma, 0);
>> +	ret = dma_buf_mmap(abo->dma_buf, vma, 0);
>>   	if (ret) {
>>   		XDNA_ERR(xdna, "Failed to mmap dma buf %d", ret);
>>   		return ret;
>> @@ -391,10 +392,47 @@ static const struct dma_buf_ops amdxdna_dmabuf_ops = {
>>   	.vunmap = drm_gem_dmabuf_vunmap,
>>   };
>>   
>> +static int amdxdna_gem_obj_vmap(struct drm_gem_object *obj, struct iosys_map *map)
>> +{
>> +	struct amdxdna_gem_obj *abo = to_xdna_obj(obj);
>> +
>> +	iosys_map_clear(map);
>> +
>> +	dma_resv_assert_held(obj->resv);
>> +
>> +	if (is_import_bo(abo))
>> +		dma_buf_vmap(abo->dma_buf, map);
>> +	else
>> +		drm_gem_shmem_object_vmap(obj, map);
>> +
>> +	if (!map->vaddr)
>> +		return -ENOMEM;
>> +
>> +	return 0;
>> +}
>> +
>> +static void amdxdna_gem_obj_vunmap(struct drm_gem_object *obj, struct iosys_map *map)
>> +{
>> +	struct amdxdna_gem_obj *abo = to_xdna_obj(obj);
>> +
>> +	dma_resv_assert_held(obj->resv);
>> +
>> +	if (is_import_bo(abo))
>> +		dma_buf_vunmap(abo->dma_buf, map);
>> +	else
>> +		drm_gem_shmem_object_vunmap(obj, map);
>> +}
>> +
>>   static struct dma_buf *amdxdna_gem_prime_export(struct drm_gem_object *gobj, int flags)
>>   {
>> +	struct amdxdna_gem_obj *abo = to_xdna_obj(gobj);
>>   	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
>>   
>> +	if (abo->dma_buf) {
>> +		get_dma_buf(abo->dma_buf);
>> +		return abo->dma_buf;
>> +	}
>> +
>>   	exp_info.ops = &amdxdna_dmabuf_ops;
>>   	exp_info.size = gobj->size;
>>   	exp_info.flags = flags;
>> @@ -451,8 +489,8 @@ static const struct drm_gem_object_funcs amdxdna_gem_shmem_funcs = {
>>   	.pin = drm_gem_shmem_object_pin,
>>   	.unpin = drm_gem_shmem_object_unpin,
>>   	.get_sg_table = drm_gem_shmem_object_get_sg_table,
>> -	.vmap = drm_gem_shmem_object_vmap,
>> -	.vunmap = drm_gem_shmem_object_vunmap,
>> +	.vmap = amdxdna_gem_obj_vmap,
>> +	.vunmap = amdxdna_gem_obj_vunmap,
>>   	.mmap = amdxdna_gem_obj_mmap,
>>   	.vm_ops = &drm_gem_shmem_vm_ops,
>>   	.export = amdxdna_gem_prime_export,
>> @@ -494,6 +532,68 @@ amdxdna_gem_create_object_cb(struct drm_device *dev, size_t size)
>>   	return to_gobj(abo);
>>   }
>>   
>> +static struct amdxdna_gem_obj *
>> +amdxdna_gem_create_shmem_object(struct drm_device *dev, size_t size)
>> +{
>> +	struct drm_gem_shmem_object *shmem = drm_gem_shmem_create(dev, size);
>> +
>> +	if (IS_ERR(shmem))
>> +		return ERR_CAST(shmem);
>> +
>> +	shmem->map_wc = false;
>> +	return to_xdna_obj(&shmem->base);
>> +}
>> +
>> +static struct amdxdna_gem_obj *
>> +amdxdna_gem_create_ubuf_object(struct drm_device *dev, struct amdxdna_drm_create_bo *args)
>> +{
>> +	struct amdxdna_dev *xdna = to_xdna_dev(dev);
>> +	enum amdxdna_ubuf_flag flags = 0;
>> +	struct amdxdna_drm_va_tbl va_tbl;
>> +	struct drm_gem_object *gobj;
>> +	struct dma_buf *dma_buf;
>> +
>> +	if (copy_from_user(&va_tbl, u64_to_user_ptr(args->vaddr), sizeof(va_tbl))) {
>> +		XDNA_DBG(xdna, "Access va table failed");
>> +		return ERR_PTR(-EINVAL);
>> +	}
>> +
>> +	if (va_tbl.num_entries) {
>> +		if (args->type == AMDXDNA_BO_CMD)
>> +			flags |= AMDXDNA_UBUF_FLAG_MAP_DMA;
> Does it make sense to create a ubuf without AMDXDNA_UBUF_FLAG_MAP_DMA?
> Seems like without dma_map, the buffer cannot be used by the device.
xdna device supports dma through virtual address. Thus, MAP_DMA is an 
option.
>
>> +
>> +		dma_buf = amdxdna_get_ubuf(dev, flags, va_tbl.num_entries,
>> +					   u64_to_user_ptr(args->vaddr + sizeof(va_tbl)));
>> +	} else {
>> +		dma_buf = dma_buf_get(va_tbl.dmabuf_fd);
>> +	}
>> +
>> +	if (IS_ERR(dma_buf))
>> +		return ERR_CAST(dma_buf);
>> +
>> +	gobj = amdxdna_gem_prime_import(dev, dma_buf);
>> +	if (IS_ERR(gobj)) {
>> +		dma_buf_put(dma_buf);
>> +		return ERR_CAST(gobj);
>> +	}
>> +
>> +	dma_buf_put(dma_buf);
>> +
>> +	return to_xdna_obj(gobj);
>> +}
>> +
>> +static struct amdxdna_gem_obj *
>> +amdxdna_gem_create_object(struct drm_device *dev,
>> +			  struct amdxdna_drm_create_bo *args)
>> +{
>> +	size_t aligned_sz = PAGE_ALIGN(args->size);
>> +
>> +	if (args->vaddr)
>> +		return amdxdna_gem_create_ubuf_object(dev, args);
>> +
>> +	return amdxdna_gem_create_shmem_object(dev, aligned_sz);
>> +}
>> +
>>   struct drm_gem_object *
>>   amdxdna_gem_prime_import(struct drm_device *dev, struct dma_buf *dma_buf)
>>   {
>> @@ -545,16 +645,12 @@ amdxdna_drm_alloc_shmem(struct drm_device *dev,
>>   			struct drm_file *filp)
>>   {
>>   	struct amdxdna_client *client = filp->driver_priv;
>> -	struct drm_gem_shmem_object *shmem;
>>   	struct amdxdna_gem_obj *abo;
>>   
>> -	shmem = drm_gem_shmem_create(dev, args->size);
>> -	if (IS_ERR(shmem))
>> -		return ERR_CAST(shmem);
>> -
>> -	shmem->map_wc = false;
>> +	abo = amdxdna_gem_create_object(dev, args);
>> +	if (IS_ERR(abo))
>> +		return ERR_CAST(abo);
>>   
>> -	abo = to_xdna_obj(&shmem->base);
>>   	abo->client = client;
>>   	abo->type = AMDXDNA_BO_SHMEM;
>>   
>> @@ -569,7 +665,6 @@ amdxdna_drm_create_dev_heap(struct drm_device *dev,
>>   	struct amdxdna_client *client = filp->driver_priv;
>>   	struct iosys_map map = IOSYS_MAP_INIT_VADDR(NULL);
>>   	struct amdxdna_dev *xdna = to_xdna_dev(dev);
>> -	struct drm_gem_shmem_object *shmem;
>>   	struct amdxdna_gem_obj *abo;
>>   	int ret;
>>   
>> @@ -586,14 +681,12 @@ amdxdna_drm_create_dev_heap(struct drm_device *dev,
>>   		goto mm_unlock;
>>   	}
>>   
>> -	shmem = drm_gem_shmem_create(dev, args->size);
>> -	if (IS_ERR(shmem)) {
>> -		ret = PTR_ERR(shmem);
>> +	abo = amdxdna_gem_create_object(dev, args);
>> +	if (IS_ERR(abo)) {
>> +		ret = PTR_ERR(abo);
>>   		goto mm_unlock;
>>   	}
>>   
>> -	shmem->map_wc = false;
>> -	abo = to_xdna_obj(&shmem->base);
>>   	abo->type = AMDXDNA_BO_DEV_HEAP;
>>   	abo->client = client;
>>   	abo->mem.dev_addr = client->xdna->dev_info->dev_mem_base;
>> @@ -657,7 +750,6 @@ amdxdna_drm_create_cmd_bo(struct drm_device *dev,
>>   {
>>   	struct iosys_map map = IOSYS_MAP_INIT_VADDR(NULL);
>>   	struct amdxdna_dev *xdna = to_xdna_dev(dev);
>> -	struct drm_gem_shmem_object *shmem;
>>   	struct amdxdna_gem_obj *abo;
>>   	int ret;
>>   
>> @@ -671,12 +763,9 @@ amdxdna_drm_create_cmd_bo(struct drm_device *dev,
>>   		return ERR_PTR(-EINVAL);
>>   	}
>>   
>> -	shmem = drm_gem_shmem_create(dev, args->size);
>> -	if (IS_ERR(shmem))
>> -		return ERR_CAST(shmem);
>> -
>> -	shmem->map_wc = false;
>> -	abo = to_xdna_obj(&shmem->base);
>> +	abo = amdxdna_gem_create_object(dev, args);
>> +	if (IS_ERR(abo))
>> +		return ERR_CAST(abo);
>>   
>>   	abo->type = AMDXDNA_BO_CMD;
>>   	abo->client = filp->driver_priv;
>> @@ -691,7 +780,7 @@ amdxdna_drm_create_cmd_bo(struct drm_device *dev,
>>   	return abo;
>>   
>>   release_obj:
>> -	drm_gem_shmem_free(shmem);
>> +	drm_gem_object_put(to_gobj(abo));
>>   	return ERR_PTR(ret);
>>   }
>>   
>> @@ -702,7 +791,7 @@ int amdxdna_drm_create_bo_ioctl(struct drm_device *dev, void *data, struct drm_f
>>   	struct amdxdna_gem_obj *abo;
>>   	int ret;
>>   
>> -	if (args->flags || args->vaddr || !args->size)
>> +	if (args->flags)
>>   		return -EINVAL;
>>   
>>   	XDNA_DBG(xdna, "BO arg type %d vaddr 0x%llx size 0x%llx flags 0x%llx",
>> diff --git a/drivers/accel/amdxdna/amdxdna_ubuf.c b/drivers/accel/amdxdna/amdxdna_ubuf.c
>> new file mode 100644
>> index 000000000000..c19167ecd963
>> --- /dev/null
>> +++ b/drivers/accel/amdxdna/amdxdna_ubuf.c
>> @@ -0,0 +1,232 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * Copyright (C) 2025, Advanced Micro Devices, Inc.
>> + */
>> +
>> +#include <drm/amdxdna_accel.h>
>> +#include <drm/drm_device.h>
>> +#include <drm/drm_print.h>
>> +#include <linux/dma-buf.h>
>> +#include <linux/pagemap.h>
>> +#include <linux/vmalloc.h>
>> +
>> +#include "amdxdna_pci_drv.h"
>> +#include "amdxdna_ubuf.h"
>> +
>> +struct amdxdna_ubuf_priv {
>> +	struct page **pages;
>> +	u64 nr_pages;
>> +	enum amdxdna_ubuf_flag flags;
>> +	struct mm_struct *mm;
>> +};
>> +
>> +static struct sg_table *amdxdna_ubuf_map(struct dma_buf_attachment *attach,
>> +					 enum dma_data_direction direction)
>> +{
>> +	struct amdxdna_ubuf_priv *ubuf = attach->dmabuf->priv;
>> +	struct sg_table *sg;
>> +	int ret;
>> +
>> +	sg = kzalloc(sizeof(*sg), GFP_KERNEL);
>> +	if (!sg)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	ret = sg_alloc_table_from_pages(sg, ubuf->pages, ubuf->nr_pages, 0,
>> +					ubuf->nr_pages << PAGE_SHIFT, GFP_KERNEL);
>> +	if (ret)
>> +		return ERR_PTR(ret);
>> +
>> +	if (ubuf->flags & AMDXDNA_UBUF_FLAG_MAP_DMA) {
>> +		ret = dma_map_sgtable(attach->dev, sg, direction, 0);
>> +		if (ret)
>> +			return ERR_PTR(ret);
>> +	}
>> +
>> +	return sg;
>> +}
>> +
>> +static void amdxdna_ubuf_unmap(struct dma_buf_attachment *attach,
>> +			       struct sg_table *sg,
>> +			       enum dma_data_direction direction)
>> +{
>> +	struct amdxdna_ubuf_priv *ubuf = attach->dmabuf->priv;
>> +
>> +	if (ubuf->flags & AMDXDNA_UBUF_FLAG_MAP_DMA)
>> +		dma_unmap_sgtable(attach->dev, sg, direction, 0);
>> +
>> +	sg_free_table(sg);
>> +	kfree(sg);
>> +}
>> +
>> +static void amdxdna_ubuf_release(struct dma_buf *dbuf)
>> +{
>> +	struct amdxdna_ubuf_priv *ubuf = dbuf->priv;
>> +
>> +	unpin_user_pages(ubuf->pages, ubuf->nr_pages);
>> +	kvfree(ubuf->pages);
>> +	atomic64_sub(ubuf->nr_pages, &ubuf->mm->pinned_vm);
>> +	mmdrop(ubuf->mm);
>> +	kfree(ubuf);
>> +}
>> +
>> +static vm_fault_t amdxdna_ubuf_vm_fault(struct vm_fault *vmf)
>> +{
>> +	struct vm_area_struct *vma = vmf->vma;
>> +	struct amdxdna_ubuf_priv *ubuf;
>> +	unsigned long pfn;
>> +	pgoff_t pgoff;
>> +
>> +	ubuf = vma->vm_private_data;
>> +	pgoff = (vmf->address - vma->vm_start) >> PAGE_SHIFT;
>> +
>> +	pfn = page_to_pfn(ubuf->pages[pgoff]);
>> +	return vmf_insert_pfn(vma, vmf->address, pfn);
>> +}
>> +
>> +static const struct vm_operations_struct amdxdna_ubuf_vm_ops = {
>> +	.fault = amdxdna_ubuf_vm_fault,
>> +};
>> +
>> +static int amdxdna_ubuf_mmap(struct dma_buf *dbuf, struct vm_area_struct *vma)
>> +{
>> +	struct amdxdna_ubuf_priv *ubuf = dbuf->priv;
>> +
>> +	vma->vm_ops = &amdxdna_ubuf_vm_ops;
>> +	vma->vm_private_data = ubuf;
>> +	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
>> +
>> +	return 0;
>> +}
>> +
>> +static int amdxdna_ubuf_vmap(struct dma_buf *dbuf, struct iosys_map *map)
>> +{
>> +	struct amdxdna_ubuf_priv *ubuf = dbuf->priv;
>> +	void *kva;
>> +
>> +	kva = vmap(ubuf->pages, ubuf->nr_pages, VM_MAP, PAGE_KERNEL);
>> +	if (!kva)
>> +		return -EINVAL;
>> +
>> +	iosys_map_set_vaddr(map, kva);
>> +	return 0;
>> +}
>> +
>> +static void amdxdna_ubuf_vunmap(struct dma_buf *dbuf, struct iosys_map *map)
>> +{
>> +	vunmap(map->vaddr);
>> +}
>> +
>> +static const struct dma_buf_ops amdxdna_ubuf_dmabuf_ops = {
>> +	.map_dma_buf = amdxdna_ubuf_map,
>> +	.unmap_dma_buf = amdxdna_ubuf_unmap,
>> +	.release = amdxdna_ubuf_release,
>> +	.mmap = amdxdna_ubuf_mmap,
> Why mmap user memory? You will end up with two user space virtual addresses.

xdna supports user virtual address dma. The mmapped address is owned by 
runtime library and will be used only for device access. The mmu 
notifier will be registered on mmapped address range. This will minimize 
the impact of original user virtual address which is not owned by 
runtime library.

It also helps the mmu notifier implementation in driver. It is unified 
with shmem BO.

>
>> +	.vmap = amdxdna_ubuf_vmap,
>> +	.vunmap = amdxdna_ubuf_vunmap,
>> +};
>> +
>> +struct dma_buf *amdxdna_get_ubuf(struct drm_device *dev,
>> +				 enum amdxdna_ubuf_flag flags,
>> +				 u32 num_entries, void __user *va_entries)
>> +{
>> +	struct amdxdna_dev *xdna = to_xdna_dev(dev);
>> +	unsigned long lock_limit, new_pinned;
>> +	struct amdxdna_drm_va_entry *va_ent;
>> +	struct amdxdna_ubuf_priv *ubuf;
>> +	u32 npages, start = 0;
>> +	struct dma_buf *dbuf;
>> +	int i, ret;
>> +	DEFINE_DMA_BUF_EXPORT_INFO(exp_info);
>> +
>> +	if (!can_do_mlock())
>> +		return ERR_PTR(-EPERM);
>> +
>> +	ubuf = kzalloc(sizeof(*ubuf), GFP_KERNEL);
>> +	if (!ubuf)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	ubuf->flags = flags;
>> +	ubuf->mm = current->mm;
>> +	mmgrab(ubuf->mm);
>> +
>> +	va_ent = kvcalloc(num_entries, sizeof(*va_ent), GFP_KERNEL);
>> +	if (!va_ent) {
>> +		ret = -ENOMEM;
>> +		goto free_ubuf;
>> +	}
>> +
>> +	if (copy_from_user(va_ent, va_entries, sizeof(*va_ent) * num_entries)) {
>> +		XDNA_DBG(xdna, "Access va entries failed");
>> +		ret = -EINVAL;
>> +		goto free_ent;
>> +	}
>> +
>> +	for (i = 0, exp_info.size = 0; i < num_entries; i++) {
>> +		if ((va_ent[i].vaddr & (PAGE_SIZE - 1)) ||
>> +		    (va_ent[i].len & (PAGE_SIZE - 1))) {
> I would use IS_ALIGNED(x, PAGE_SIZE) for readability.
Sure. I will fix this.
>
>> +			XDNA_ERR(xdna, "Invalid address or len %llx, %llx",
>> +				 va_ent[i].vaddr, va_ent[i].len);
>> +			ret = -EINVAL;
>> +			goto free_ent;
>> +		}
>> +
>> +		exp_info.size += va_ent[i].len;
>> +	}
>> +
>> +	ubuf->nr_pages = exp_info.size >> PAGE_SHIFT;
>> +	lock_limit = rlimit(RLIMIT_MEMLOCK) >> PAGE_SHIFT;
>> +	new_pinned = atomic64_add_return(ubuf->nr_pages, &ubuf->mm->pinned_vm);
>> +	if (new_pinned > lock_limit && !capable(CAP_IPC_LOCK)) {
>> +		XDNA_DBG(xdna, "New pin %ld, limit %ld, cap %d",
>> +			 new_pinned, lock_limit, capable(CAP_IPC_LOCK));
>> +		ret = -ENOMEM;
>> +		goto sub_pin_cnt;
>> +	}
>> +
>> +	ubuf->pages = kvmalloc_array(ubuf->nr_pages, sizeof(*ubuf->pages), GFP_KERNEL);
>> +	if (!ubuf->pages) {
>> +		ret = -ENOMEM;
>> +		goto sub_pin_cnt;
>> +	}
>> +
>> +	for (i = 0; i < num_entries; i++) {
>> +		npages = va_ent[i].len >> PAGE_SHIFT;
>> +
>> +		ret = pin_user_pages_fast(va_ent[i].vaddr, npages,
>> +					  FOLL_WRITE | FOLL_LONGTERM,
>> +					  &ubuf->pages[start]);
>> +		if (ret < 0 || ret != npages) {
>> +			ret = -ENOMEM;
>> +			XDNA_ERR(xdna, "Failed to pin pages ret %d", ret);
>> +			goto destroy_pages;
>> +		}
>> +
>> +		start += ret;
>> +	}
>> +
>> +	exp_info.ops = &amdxdna_ubuf_dmabuf_ops;
>> +	exp_info.priv = ubuf;
>> +	exp_info.flags = O_RDWR;
> I would consider adding O_CLOEXEC.
Sure. I will add it.
>
>> +
>> +	dbuf = dma_buf_export(&exp_info);
>> +	if (IS_ERR(dbuf)) {
>> +		ret = PTR_ERR(dbuf);
>> +		goto destroy_pages;
>> +	}
>> +	kvfree(va_ent);
>> +
>> +	return dbuf;
>> +
>> +destroy_pages:
>> +	if (start)
>> +		unpin_user_pages(ubuf->pages, start);
>> +	kvfree(ubuf->pages);
>> +sub_pin_cnt:
>> +	atomic64_sub(ubuf->nr_pages, &ubuf->mm->pinned_vm);
>> +free_ent:
>> +	kvfree(va_ent);
>> +free_ubuf:
>> +	mmdrop(ubuf->mm);
>> +	kfree(ubuf);
>> +	return ERR_PTR(ret);
>> +}
>> diff --git a/drivers/accel/amdxdna/amdxdna_ubuf.h b/drivers/accel/amdxdna/amdxdna_ubuf.h
>> new file mode 100644
>> index 000000000000..e5cb3bdb3ec9
>> --- /dev/null
>> +++ b/drivers/accel/amdxdna/amdxdna_ubuf.h
>> @@ -0,0 +1,19 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Copyright (C) 2025, Advanced Micro Devices, Inc.
>> + */
>> +#ifndef _AMDXDNA_UBUF_H_
>> +#define _AMDXDNA_UBUF_H_
>> +
>> +#include <drm/drm_device.h>
>> +#include <linux/dma-buf.h>
>> +
>> +enum amdxdna_ubuf_flag {
>> +	AMDXDNA_UBUF_FLAG_MAP_DMA = 1,
>> +};
>> +
>> +struct dma_buf *amdxdna_get_ubuf(struct drm_device *dev,
>> +				 enum amdxdna_ubuf_flag flags,
>> +				 u32 num_entries, void __user *va_entries);
>> +
>> +#endif /* _AMDXDNA_UBUF_H_ */
>> diff --git a/include/uapi/drm/amdxdna_accel.h b/include/uapi/drm/amdxdna_accel.h
>> index a706ead39082..ce523e9ccc52 100644
>> --- a/include/uapi/drm/amdxdna_accel.h
>> +++ b/include/uapi/drm/amdxdna_accel.h
>> @@ -153,6 +153,31 @@ enum amdxdna_bo_type {
>>   	AMDXDNA_BO_CMD,
>>   };
>>   
>> +/**
>> + * struct amdxdna_drm_va_entry
>> + * @vaddr: Virtual address.
>> + * @len: Size of entry.
>> + */
>> +struct amdxdna_drm_va_entry {
>> +	__u64 vaddr;
>> +	__u64 len;
>> +};
>> +
>> +/**
>> + * struct amdxdna_drm_va_tbl
>> + * @dmabuf_fd: The fd of dmabuf.
>> + * @num_entries: Number of va entries.
>> + * @va_entries: Array of va entries.
>> + *
>> + * The input can be either a dmabuf fd or a virtual address entry table.
>> + * When dmabuf_fd is used, num_entries must be zero.
>> + */
>> +struct amdxdna_drm_va_tbl {
>> +	__s32 dmabuf_fd;
> Isn't this already implemented by drm_prime_fd_to_handle_ioctl?

This provides support for dmabuf which is not drm bo.

Thanks,

Lizhi

>
>> +	__u32 num_entries;
>> +	struct amdxdna_drm_va_entry va_entries[];
>> +};
>> +
>>   /**
>>    * struct amdxdna_drm_create_bo - Create a buffer object.
>>    * @flags: Buffer flags. MBZ.
> Regards,
> Jacek
