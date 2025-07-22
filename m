Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEDF4B0E0CF
	for <lists+dri-devel@lfdr.de>; Tue, 22 Jul 2025 17:42:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 09C7C10E2F9;
	Tue, 22 Jul 2025 15:42:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="d/vVYLgy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2082.outbound.protection.outlook.com [40.107.243.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8088710E2F9
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Jul 2025 15:42:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xeF3lpeZ/kALpn8peOXsrOzVUX0Jd5BJrf/+hyMg89KsrjYSbK3x6bj6Sig6Q9EIv/JDIN02WNJDDBbhU1fQp0ry9rStme3wQm5+PiNzqKpSphFh7RfeBCS3RjdQGhjGHhhksoIuQVeYIe2QoMK71qGI2e+ugM+kYeD6auPgmDWAnad+c5K4Pe4uFuzpX4joRJ1iNzspYPnPohkqnETExHFnyzDM3z75Z2Unagi4hPLhmKbwHxfkwRtfMWpuRm9xAAty51/iU1gFMKEq7vp8QxONYGFwjx+VDeG79Gc5asNpwgHZDxdr/iKLnnOtNVyAl0Z4/HMxhOK1bC0Gcc1Xkw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MZU9GVDX0LBfK/kce13cL4l7cKsc8IpI8y9wPY1pdNY=;
 b=dM7A0i7SB/Puq1h8Op5MGqcNQWr9W/AYVO+zTtWIEjpd9H7l2xLYwjZyujkoogCNu/aAoiSjpfYypy6Mc86PBvFE5SG9Yn5rnWAaRVByJoMR8OEEhghWZEVP08GR8LOYqcU4e0r5LDoeydyZMp5+RFIX4CbO6MInA5gmnT8YRu9sBCOLtep4UYq14HIXq8C0GnXFD2DLr0/35aLcOACA8ujf3+Dk/6+68ix9NIJAuuWOjc5whVUkqcIAaSNiUUv8Tl0UgCqiX+BfRAFRY9h4O2xo91IsaJYUFb3KBcNUM9ffuNrWdDb43lPj4RTY0w2F5xhP/bhvd5rIJ4yWa3X3kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MZU9GVDX0LBfK/kce13cL4l7cKsc8IpI8y9wPY1pdNY=;
 b=d/vVYLgyCT75fOMJB94JKfZvKWkhfPmYWIcVuw1oOL2avVoXWEjQGuT4FGf5hOrVVSKAy058ZXlIyPMo1j0mNT4X5nRp66fzd1F8jq49IkucKvLGI3IR1G4l+jzuU6uGOGdxoq7vOJ2K5iFUWYXfrQa/d9P+0rdtZg/9eKXCJw8=
Received: from MW4P221CA0030.NAMP221.PROD.OUTLOOK.COM (2603:10b6:303:8b::35)
 by DS0PR12MB7925.namprd12.prod.outlook.com (2603:10b6:8:14b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8964.21; Tue, 22 Jul
 2025 15:42:40 +0000
Received: from MWH0EPF000A6732.namprd04.prod.outlook.com
 (2603:10b6:303:8b:cafe::2c) by MW4P221CA0030.outlook.office365.com
 (2603:10b6:303:8b::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.29 via Frontend Transport; Tue,
 22 Jul 2025 15:42:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MWH0EPF000A6732.mail.protection.outlook.com (10.167.249.24) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8964.20 via Frontend Transport; Tue, 22 Jul 2025 15:42:39 +0000
Received: from SATLEXMB03.amd.com (10.181.40.144) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Tue, 22 Jul
 2025 10:42:38 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Tue, 22 Jul 2025 10:42:38 -0500
Message-ID: <72832cc9-602b-22a7-c2db-549a08e0a997@amd.com>
Date: Tue, 22 Jul 2025 08:42:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V2] accel/amdxdna: Support user space allocated buffer
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <ogabbay@kernel.org>, <quic_jhugo@quicinc.com>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <mario.limonciello@amd.com>
References: <20250716164414.112091-1-lizhi.hou@amd.com>
 <b013b26b-dd57-4c10-9e51-d826fea14317@linux.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <b013b26b-dd57-4c10-9e51-d826fea14317@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6732:EE_|DS0PR12MB7925:EE_
X-MS-Office365-Filtering-Correlation-Id: 1bac488e-a3f6-4e7e-7e56-08ddc93663e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SGYrazhxZ1g5YTU5cEJ2ZGRySldtM2Y0UFo4WGtBVEFnUnNpZW5xRE9INnlU?=
 =?utf-8?B?T0pGeWl4ZmltVWF3L29CRFVadktwRlNtMUVOSzh2T0JsVzlGSnM1Q1ZZRHR1?=
 =?utf-8?B?K3pPUkhxWGJKb1U3ZFF5OTFnVVNjd1dmZnE0cG8rTXdKZTZaY1lMbmVncXA4?=
 =?utf-8?B?S3lFWnhSOVE1Z1UyNTNvSmhCK2o2SUhTdXZSTVNFbk1uMUs4QlQvSFdnZ3hM?=
 =?utf-8?B?RWQ4MWI4SGNyKzlPTWpWVWMrN3pvNEFtR0oxTjc0d1FaVEJrT3o4aVJLSzZH?=
 =?utf-8?B?U0dyUEltd1RSSW1WWWZQekh1VGNIbUdCcGtlUGV1VzJNZldwOHdpZDVWZ0dW?=
 =?utf-8?B?SkRjSEtLNDB2UW51em9lejM5VGFodmFvc0c1R1FKak1ub2prR0pVb280ek8y?=
 =?utf-8?B?eTIwOW5zYVE1bVVhTDNLLzJsdE8wcllGYjZnbGdEQ1hkQkRrWmgxcjBXaTg2?=
 =?utf-8?B?QmordG13OFc4YlArWE53TlVzTWFDdE85cnovdXNudi8wQXkvRzRLbTd1MWhC?=
 =?utf-8?B?Y0thK1Y3TXoxanNiZlJJbnpGeVVJVVd5eDkzL3BXVGxRenZkWXhsNXZWeVgw?=
 =?utf-8?B?YmNZeUpBWnpFdERuL1lQOGZPTGVFL0lCU3NUQ0owMUhCRzJWL0lwc3oveGVE?=
 =?utf-8?B?UCtCbnJoelcvbWFyOEFhZ3lLSHVPSDQxcFgwN2Z5MWFCRTNEeC9RUEZ5eFNz?=
 =?utf-8?B?SUNySlNENitFcHBEMlRYQlJiVXFiMGdocS9NdHZZMWF0dGN0aXRhZkZlWFNT?=
 =?utf-8?B?d3pDOTBXa0owdUNkTkdsSjYzS0NMTk42MStIc3hnVDZkWkh0YWo2a3E0Ull1?=
 =?utf-8?B?ZkdWWExwUGQ5bDB6dFdGb3ZUOUxCRDRrdUVsRnB5ZWRFeEIzOU9NZEpsNmY0?=
 =?utf-8?B?UXZMQTlmU0hXTzdmTkxhcVIwK3crUzdxT1NzR1NpRHU0OGYxS21nYjJySHRa?=
 =?utf-8?B?eGpLU2lzc281QkVWMDkreDlySWNJcW5pWHl6TlFtY2ozRFBJN3Y3U1YrR3Nt?=
 =?utf-8?B?N2llcEdoOVAyaVhweldBRU9mTkZmYjhPbHJITklid2dOSGh2dnE2VXRKZis1?=
 =?utf-8?B?K3pWRDJTQlZpV2lrS0IzcTB6eHF1a1p1T1I5V3JNemtGTVNEZk1IT0JQNVFS?=
 =?utf-8?B?c3RZaWR4YjdBc2NlbTVidTdJWkE5UTJoMjVTekpRTnJCLy9oUXZnYkQvaUpV?=
 =?utf-8?B?dzUvYXBnM05YdnRZckx2N0wvN0dEU0NOYjRURFUvRXpHaVVlekwrY0VWaTFt?=
 =?utf-8?B?UWxJY0tPSGJGSTRrTWlrMVkyMGhoNVFHWWx0NU9MamZBY0RsdFJ5Q0tpbllz?=
 =?utf-8?B?eEZKNy9abitIRWpEK0tnWUF6alRrQ3F3WkRLZzlWRFIyZkxqYy9rZm9jKzlv?=
 =?utf-8?B?YlZRZmhhUjNRSUUrWlQvK25CUmFJOU1XT01sYTlkdG1TcHMyaXBkekgyNDBa?=
 =?utf-8?B?d21abDJqOVMwQklmVnMzdGxEbU1XeHRqdEZxR3RreGlnd3VvNWs3TnVyS28w?=
 =?utf-8?B?b2t1d29acDRQMUVLNCtqcWlvMHQ2OFNHZUxyaGpVZTE4c2ZvUmg0ZEVPZE9O?=
 =?utf-8?B?WDRjN2w5TlBLQk5ZVEZMazhPVG8yNitKTlZwZEpuUE5tNUg1ZXhiMTFRdENi?=
 =?utf-8?B?NWVUTXFZejN1YjV6R1FKSExydkh3YzYvdmNhY2ZoQ01ocDlMMEhlejdtL2lm?=
 =?utf-8?B?S3VWVDc5K0VyU0tPaUVyN3IzOW9KWTk4RnZqUUgzNDdseSs0SElCOUxVZTN3?=
 =?utf-8?B?VGJQcmVhcm4zOWJtR0Yrd3lvYXNTRmpzZ2JUZFV3TG5iZElrS3JkTFE1T1NB?=
 =?utf-8?B?akhPZjY2ZG1QZWF2eUlrTTBKN3Jpd291OGFQTHhhUTQ2aDE3aHVxeHN4c2Nz?=
 =?utf-8?B?dkN0UWRyM1JNSVd6Z0RmQ0hYd2t2azRrdzZ1RXV6Y1J0czdNT1UyWklHbU4w?=
 =?utf-8?B?ZCtLNWhHdldTMHBUMzgzVHNJR1lXQklyOTZjNHlsenVQR3FROHBQSUlqcTNN?=
 =?utf-8?B?Y1ZMUlBkakRLWjVuK3FhbUZnQWtnSE4vaUhoWUVnRzhPOGo2MmMvZi9KbFd6?=
 =?utf-8?Q?0GkFDy?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jul 2025 15:42:39.6176 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1bac488e-a3f6-4e7e-7e56-08ddc93663e0
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6732.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7925
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

Pushed to drm-misc-next. Thanks.


Lizhi

On 7/22/25 01:22, Jacek Lawrynowicz wrote:
> Reviewed-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>
> On 7/16/2025 6:44 PM, Lizhi Hou wrote:
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
>> index 000000000000..077b2261cf2a
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
>> +		if (!IS_ALIGNED(va_ent[i].vaddr, PAGE_SIZE) ||
>> +		    !IS_ALIGNED(va_ent[i].len, PAGE_SIZE)) {
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
>> +	exp_info.flags = O_RDWR | O_CLOEXEC;
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
>> +	__u32 num_entries;
>> +	struct amdxdna_drm_va_entry va_entries[];
>> +};
>> +
>>   /**
>>    * struct amdxdna_drm_create_bo - Create a buffer object.
>>    * @flags: Buffer flags. MBZ.
