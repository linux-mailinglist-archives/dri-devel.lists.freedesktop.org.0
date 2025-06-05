Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72570ACEC82
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jun 2025 11:00:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A74A10E836;
	Thu,  5 Jun 2025 09:00:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="02fpIwko";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2082.outbound.protection.outlook.com [40.107.220.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2CDE510E836
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jun 2025 09:00:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dnnP5+/bmOW3reT89I1TONDXryU+mJoglUhr0qDM0ITmli86M3vcW9htqzyTkge+sLhKh2F/VK06etRcdcSWzVaMOFiFulknh4QBGj1so7XofR2TlOYQOuwHHwPA2eqJzDbu0zJk6IhZWBes9ymKzoIDeYNH8QmiwNlPJZFMnH1mX6NHkQmQQFpjM3tgZbRM5CK40IUnVRF19AGn/RFnoJKD27rH02J4S8vMvewct/9RExMX9iZPxc46r4IgD8weD9z9VxCU13ci+osduT6F91XqhsP5rVlhOYli9MWInzLV+67pK2ieqWnCw+fuADjS6Rc8bSLRLxAJGz5DGC0/jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VRzv0GpSnySfpC1aB5JTAISMlT0XdKK7hSAUdiCYkBs=;
 b=tr98ximqE3LiQ1LGWqXFNNf+hblkZ+ZU5fxkFnQC8kZ9WTby4I0vmDDe1pVpxv/yDtEAllKENVCI55jXi4taYK4kYZBsf/JZaAuMCDI6QIs+ZnDvBDCEfoMMTpxvULI9uqOrbpxSz+e2Yhsx4f+AmWQOKPzwwij93LFMNqFd2lvdxXwtGc+gbU/lEySv8dkbom7PVtTFH2NTM29IDn2ProHelAqXeJd4ZoEuAAW4ZgUOxQSPbGQVk15VuBvLqy2arjv/j42O1WfaaC0djyNlPtGkIiTgnPSA54LeUG/6vYTDXhcyBNdUUBZm3AAh+Th2cWUIWlt9KY9pJr7pCqELmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=linux.intel.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VRzv0GpSnySfpC1aB5JTAISMlT0XdKK7hSAUdiCYkBs=;
 b=02fpIwkoNRwH3gTMc5418x6wcLfsAE1H1A03RgOjBL6KsaO3lyAH6ar4zxLqxMg7kjY7ogu4W41Ir0maY3CIAfOe/JKErl9qiIqD57Jqb9pIZ2reWY5eNo9Hy7U3ow5U8xKzjXMOaUdc4XRDOxwO02DJVSlRGKEGJN08HUGHU1o=
Received: from SJ0PR05CA0041.namprd05.prod.outlook.com (2603:10b6:a03:33f::16)
 by MW4PR12MB6707.namprd12.prod.outlook.com (2603:10b6:303:1ee::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.37; Thu, 5 Jun
 2025 09:00:32 +0000
Received: from BY1PEPF0001AE1A.namprd04.prod.outlook.com
 (2603:10b6:a03:33f:cafe::24) by SJ0PR05CA0041.outlook.office365.com
 (2603:10b6:a03:33f::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8835.9 via Frontend Transport; Thu, 5
 Jun 2025 09:00:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB03.amd.com; pr=C
Received: from SATLEXMB03.amd.com (165.204.84.17) by
 BY1PEPF0001AE1A.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8792.29 via Frontend Transport; Thu, 5 Jun 2025 09:00:31 +0000
Received: from SATLEXMB05.amd.com (10.181.40.146) by SATLEXMB03.amd.com
 (10.181.40.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Jun
 2025 04:00:29 -0500
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB05.amd.com
 (10.181.40.146) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Thu, 5 Jun
 2025 04:00:29 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Thu, 5 Jun 2025 04:00:28 -0500
Message-ID: <6a4f4df9-0305-a89d-0ed7-8fedf0e31ffc@amd.com>
Date: Thu, 5 Jun 2025 02:00:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] accel/ivpu: Use dma_resv_lock() instead of a custom mutex
Content-Language: en-US
To: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>,
 <dri-devel@lists.freedesktop.org>
CC: <jeff.hugo@oss.qualcomm.com>, <stable@vger.kernel.org>
References: <20250528154325.500684-1-jacek.lawrynowicz@linux.intel.com>
 <26b8a17e-500d-d89d-de9f-c17108a6831d@amd.com>
 <a52588be-b487-433a-a74f-eaa1d7a88654@linux.intel.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <a52588be-b487-433a-a74f-eaa1d7a88654@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB05.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF0001AE1A:EE_|MW4PR12MB6707:EE_
X-MS-Office365-Filtering-Correlation-Id: e87bbed1-e464-4e17-4ba9-08dda40f6d1a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YTJCMzNkQU81UGRHNGgwby9BM0ZwVEZIZU1ZS01YM29Ec3ZJb2hXeHYwbXhW?=
 =?utf-8?B?cWJmWm1JRmNHaWhPVXpkYlFjSENUSmRheUZpTXNtblYzVkZSRzJvc1VPbUJ3?=
 =?utf-8?B?L2dWdythUG42TnhuYUpLZVFFRTk1VXBabGFrRkJudDU2RjJFK1EzUjhRcmpG?=
 =?utf-8?B?ZGJsWmpUWVF2NUZ5VGNCTUp2c1ZGdDlVYVd4MnE5VVhsWmVpTmR2MGZadEdX?=
 =?utf-8?B?clM5S0VZOVhRcDZySVRReHZjd0dNd1k1ei9sRTZ0M0RFUTRGQ0U1SWJwM1VJ?=
 =?utf-8?B?Slc3RERCc1d6WGhYaUMvV1Fwa1ZzZU1nWmFsNmtzeThkSDhWeXJqQ1V6azhD?=
 =?utf-8?B?cnNiNWxuemZra1RBcWxySlI5WjR3UXN3WHVPMmpyN2tER1dPb3k1N3BNYjlQ?=
 =?utf-8?B?QTZRN1JoVkpKenZUVFprSGJuKzIwc0RlSVgzOURRMC9GclhzOXAveHNmcm1J?=
 =?utf-8?B?OEJ2U0JWekpoVER6SFVCS04yN1VxODVndDc2THN5dmZ1bThJOW5LcTBHUXY3?=
 =?utf-8?B?a3ByVlREZXl1UE5uSjZiMVNubUxrdjlINHlDZTFYeHRtWU4wNlJ6Tm9SZjdI?=
 =?utf-8?B?ekZJSHdWM3hiSU4xOHdZbVFhZDFwUGNGcnBrM0hGZGNWeDQ0RWxKS1JTYm9j?=
 =?utf-8?B?V3ZEYVVoaWtqS3Y0c0tUYVgrblJBMjZ6UkplTm1kWVZRUkxIWTJoWk53UTFw?=
 =?utf-8?B?aUtIY2lIN1hkSHRVUTRHZHhSeDZ3ejlzOXlERm5LcVJXdEY0RnVDV1psWjdR?=
 =?utf-8?B?QmI2YSttWE5INXMzMmczN2Z1dEk2VUMyQnlNeUQvT0JxOHZROGFYQVpzU3Yy?=
 =?utf-8?B?UnBuYkFKOXZUMDg1aThtdG42WTgzSERnRlZMNGczM2tyL1FKT2x5ZDFXRFBW?=
 =?utf-8?B?L3pWeUQ3QnMxTVlMRVY2bTcvWUdnVFVkZWR5NG95R1YvazdBT2lsWDQwQTU4?=
 =?utf-8?B?bzBySmpuM2lEU2FXa2ZtOGMvaU4ySlRiK002TmJKbmp5QWxvckJRK3NpemtC?=
 =?utf-8?B?ZE9BNFpzOHduSmJ0YnB0WjFWbHdTeGtqaDVMNm1ZaGRVUnRZZlg5bjZROHN6?=
 =?utf-8?B?RFZFR2xCNHFOK0R4S2RTN0VzdHBDUHdVeGpjb2hGQitLSytnVUVwK2hEL2FJ?=
 =?utf-8?B?RGkxMVhRc3JLQjBQODRJZ0dyYUhHRWVrRzdzMVF5U0JvMjJQOHNnNElIbmVB?=
 =?utf-8?B?aDBseDNXcG5xRGdoQWpHR0ZGZDJ6TGpWdzVSUWNrOWxURXo0T3hFUlBIT2RE?=
 =?utf-8?B?d3lQaFBzaWozMlNtWUNRR1JWUkN2TWdZSm5pSnEzeU1aT1hnVjFGYVA1UkhE?=
 =?utf-8?B?TDlUNUVGaFVvT0tCbTdKZXRhOXlqMEZGbmlkRU1FcElibnBkUlEvVlg1a2R5?=
 =?utf-8?B?UmtXZ2lqdkdQUkl5ZTNaTVpOaGw4RWRiVXk4Y3o1VWNhM0l5ZWRLSG5ScWdh?=
 =?utf-8?B?MyswRGU0MmdERGZZTlhqS0dreUNXM0xQc2tXdVhEWjFuMzg5aW5qNFpHQzN6?=
 =?utf-8?B?ODNXZGVXbE84Sm9ISXVVa1RPZVQ4WHZvVVoxS0tmcVFCMnUyVURDZ0ZOcElj?=
 =?utf-8?B?a1l5WklUZ1VoL01qSUFPQTBxOE9NVkJKSUhnT1ZJMk5TTmdrclg2dTlnNG1I?=
 =?utf-8?B?d0ZNMXR5NXNDbHlHOCthUjNMQm1HaElZMUNGeHc5NzREQ3NEYkdhOHhnMUV1?=
 =?utf-8?B?QmVRNm9aNExuSnBub1pKWUc0SXV6N29iSUtmVVlPT04yUmZ4RzhPM2FwcXlO?=
 =?utf-8?B?WGU1OFZFVWJ6czRaWnJCemdWaGtGNTFpbzl5WXVjZFVndjdHaFRvU3E3Y2VT?=
 =?utf-8?B?RHhDbGVISTNsa2VtN3RjWUFocjRZMmZJVU5pVktiZC83UldhVFJDb2t6V283?=
 =?utf-8?B?RHZwSktZSmgzTUxTTmdTb3JvWmVpbjZRcC8zVFJ5M0NTYTBKWlFZNks3dHpu?=
 =?utf-8?B?TENLVklDUkdoRytEN3MxR1BTMWluMXhFNzhhTHpSbkFNaERqS2U5SEpSMkpt?=
 =?utf-8?B?L2pTVUt4Y3B4WHFIU3IwMHBwZ0VkVTlLTGdyM2tCYTJ4YVBiYmNTUDhzK1dB?=
 =?utf-8?Q?DFsZlr?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB03.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014)(7053199007);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 09:00:31.7121 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e87bbed1-e464-4e17-4ba9-08dda40f6d1a
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB03.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: BY1PEPF0001AE1A.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6707
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


On 6/2/25 05:58, Jacek Lawrynowicz wrote:
> Hi,
>
> On 5/28/2025 7:50 PM, Lizhi Hou wrote:
>> On 5/28/25 08:43, Jacek Lawrynowicz wrote:
>>> This fixes a potential race conditions in:
>>>    - ivpu_bo_unbind_locked() where we modified the shmem->sgt without
>>>      holding the dma_resv_lock().
>>>    - ivpu_bo_print_info() where we read the shmem->pages without
>>>      holding the dma_resv_lock().
>>>
>>> Using dma_resv_lock() also protects against future syncronisation
>>> issues that may arise when accessing drm_gem_shmem_object or
>>> drm_gem_object members.
>>>
>>> Fixes: 42328003ecb6 ("accel/ivpu: Refactor BO creation functions")
>>> Cc: <stable@vger.kernel.org> # v6.9+
>>> Signed-off-by: Jacek Lawrynowicz <jacek.lawrynowicz@linux.intel.com>
>>> ---
>>>    drivers/accel/ivpu/ivpu_gem.c | 63 +++++++++++++++++++----------------
>>>    drivers/accel/ivpu/ivpu_gem.h |  1 -
>>>    2 files changed, 34 insertions(+), 30 deletions(-)
>>>
>>> diff --git a/drivers/accel/ivpu/ivpu_gem.c b/drivers/accel/ivpu/ivpu_gem.c
>>> index c193a80241f5f..5908268ca45e9 100644
>>> --- a/drivers/accel/ivpu/ivpu_gem.c
>>> +++ b/drivers/accel/ivpu/ivpu_gem.c
>>> @@ -33,6 +33,16 @@ static inline void ivpu_dbg_bo(struct ivpu_device *vdev, struct ivpu_bo *bo, con
>>>             (bool)bo->base.base.import_attach);
>>>    }
>>>    +static inline int ivpu_bo_lock(struct ivpu_bo *bo)
>>> +{
>>> +    return dma_resv_lock(bo->base.base.resv, NULL);
>>> +}
>>> +
>>> +static inline void ivpu_bo_unlock(struct ivpu_bo *bo)
>>> +{
>>> +    dma_resv_unlock(bo->base.base.resv);
>>> +}
>>> +
>>>    /*
>>>     * ivpu_bo_pin() - pin the backing physical pages and map them to VPU.
>>>     *
>>> @@ -43,22 +53,22 @@ static inline void ivpu_dbg_bo(struct ivpu_device *vdev, struct ivpu_bo *bo, con
>>>    int __must_check ivpu_bo_pin(struct ivpu_bo *bo)
>>>    {
>>>        struct ivpu_device *vdev = ivpu_bo_to_vdev(bo);
>>> +    struct sg_table *sgt;
>>>        int ret = 0;
>>>    -    mutex_lock(&bo->lock);
>>> -
>>>        ivpu_dbg_bo(vdev, bo, "pin");
>>> -    drm_WARN_ON(&vdev->drm, !bo->ctx);
>>>    -    if (!bo->mmu_mapped) {
>>> -        struct sg_table *sgt = drm_gem_shmem_get_pages_sgt(&bo->base);
>>> +    sgt = drm_gem_shmem_get_pages_sgt(&bo->base);
>>> +    if (IS_ERR(sgt)) {
>>> +        ret = PTR_ERR(sgt);
>>> +        ivpu_err(vdev, "Failed to map BO in IOMMU: %d\n", ret);
>>> +        return ret;
>>> +    }
>>>    -        if (IS_ERR(sgt)) {
>>> -            ret = PTR_ERR(sgt);
>>> -            ivpu_err(vdev, "Failed to map BO in IOMMU: %d\n", ret);
>>> -            goto unlock;
>>> -        }
>>> +    ivpu_bo_lock(bo);
>>>    +    if (!bo->mmu_mapped) {
>>> +        drm_WARN_ON(&vdev->drm, !bo->ctx);
>>>            ret = ivpu_mmu_context_map_sgt(vdev, bo->ctx, bo->vpu_addr, sgt,
>>>                               ivpu_bo_is_snooped(bo));
>>>            if (ret) {
>>> @@ -69,7 +79,7 @@ int __must_check ivpu_bo_pin(struct ivpu_bo *bo)
>>>        }
>>>      unlock:
>>> -    mutex_unlock(&bo->lock);
>>> +    ivpu_bo_unlock(bo);
>>>          return ret;
>>>    }
>>> @@ -84,7 +94,7 @@ ivpu_bo_alloc_vpu_addr(struct ivpu_bo *bo, struct ivpu_mmu_context *ctx,
>>>        if (!drm_dev_enter(&vdev->drm, &idx))
>>>            return -ENODEV;
>>>    -    mutex_lock(&bo->lock);
>>> +    ivpu_bo_lock(bo);
>>>          ret = ivpu_mmu_context_insert_node(ctx, range, ivpu_bo_size(bo), &bo->mm_node);
>>>        if (!ret) {
>>> @@ -94,7 +104,7 @@ ivpu_bo_alloc_vpu_addr(struct ivpu_bo *bo, struct ivpu_mmu_context *ctx,
>>>            ivpu_err(vdev, "Failed to add BO to context %u: %d\n", ctx->id, ret);
>>>        }
>>>    -    mutex_unlock(&bo->lock);
>>> +    ivpu_bo_unlock(bo);
>>>          drm_dev_exit(idx);
>>>    @@ -105,7 +115,7 @@ static void ivpu_bo_unbind_locked(struct ivpu_bo *bo)
>>>    {
>>>        struct ivpu_device *vdev = ivpu_bo_to_vdev(bo);
>>>    -    lockdep_assert(lockdep_is_held(&bo->lock) || !kref_read(&bo->base.base.refcount));
>>> +    lockdep_assert(dma_resv_held(bo->base.base.resv) || !kref_read(&bo->base.base.refcount));
>>>          if (bo->mmu_mapped) {
>>>            drm_WARN_ON(&vdev->drm, !bo->ctx);
>>> @@ -123,14 +133,12 @@ static void ivpu_bo_unbind_locked(struct ivpu_bo *bo)
>>>        if (bo->base.base.import_attach)
>>>            return;
>>>    -    dma_resv_lock(bo->base.base.resv, NULL);
>>>        if (bo->base.sgt) {
>>>            dma_unmap_sgtable(vdev->drm.dev, bo->base.sgt, DMA_BIDIRECTIONAL, 0);
>>>            sg_free_table(bo->base.sgt);
>>>            kfree(bo->base.sgt);
>>>            bo->base.sgt = NULL;
>> Maybe not directly modify sgt but use drm_gem_shmem_purge()?
> drm_gem_shmem_purge() also removes user mapping and backing pages.
> In ivpu_bo_unbind_locked() we only want to unmap the buffer from the device as it being turned off.
> We don't want to crash user process in this case and this will probably be the result of drm_gem_shmem_purge() na mmpapped buffer.
>
>> Will it potentially memleak without calling drm_gem_shmem_put_pages()? (if the bo is mmap, vmap etc)
> There is no memory leak. We are calling drm_gem_shmem_get_pages_sgt() only once per object and drm_gem_shmem_free() frees all backing memory.
Reviewed-by: Lizhi Hou <lizhi.hou@amd.com>
>
> Regards,
> Jacek
