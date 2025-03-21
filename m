Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0509BA6C3C0
	for <lists+dri-devel@lfdr.de>; Fri, 21 Mar 2025 20:52:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA3510E82E;
	Fri, 21 Mar 2025 19:52:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="Ztl8NIuh";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2077.outbound.protection.outlook.com [40.107.212.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A344210E82E
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Mar 2025 19:52:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e8NXH0WY+V53pIqdgqaRANFJ7hM2tgTdbIRJu5s2i7ns6cyoYLDkvQdXWQXnTtMxALWavXz5NR5MibfP75eA+D/RUOSmwjeG8s8wpm6Mqe3h9K0Otxs8a5DXXimU6yZ2F6W+S8EifkuDCOvHH15zPYuJCY9iIVHiCuAUP/ow3BEAbQx/GKg8i61DnbcHNoG5yMvX+NnrdwR9PYXEvpSkJeo/wPHvJJqDSuL34AZO55YMZ1PqOzmTGdnX1GsKBPHkeNyVHpuNEQmLnniTjlBrvTyLQxUesMcyk9aLXuZlhhS/mAtLt3IbqsA24+fTSZOriKonQxpXwtNUpDAx1wZnnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZkNgJMn3HNJ29bHdgVeue67PwinJHCZsetBAsX8SjIk=;
 b=okRoY1v54/f5uDpddKisEOcMFUhSZmuayXSRrI83Jkg8MSExnMD9+6UE0NDp6k9SM6mwE81hmhEKc6kF4lrdaqxCbxN3nAA1fT8pzN47AG8vP9w5cVdfrm5k5lQh+MobfdkAED+z0FB0ygnez/BoZhWVvp00bT6y7i4LiyUaMiI7Hx5hJtM0Hx0lVks7eegm/wZYaBJXcC4jHLz7/zW7oV47qipngbxkwVtXGLUZz2zjdSv+ypqZl3VuPS0E/DxnZwh60UWFbGGl0KwD4fiEdhZx2BaBST3Gg+QtOo1+XP2qQi3I1Qp6D47SjlnQQ5DbvM/G8IED44p42S0smByh9w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=oss.qualcomm.com smtp.mailfrom=amd.com;
 dmarc=pass (p=quarantine sp=quarantine pct=100) action=none
 header.from=amd.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZkNgJMn3HNJ29bHdgVeue67PwinJHCZsetBAsX8SjIk=;
 b=Ztl8NIuhFL1HYuAQKye0GuVfAtpgu5tkDzvAf9gsWAUoH5PPxz2jRZuNScS8pvafMAHb/McJaPOCHiuOqWOHLqcF0jcUWf0gHCtlYFFGuuFCsO8HJgenHsiIP2vU3LL8ZL7/yO7V2FU0d5gvQOcTDeKTUdICRJraAnm/bRX4m4M=
Received: from BN9PR03CA0974.namprd03.prod.outlook.com (2603:10b6:408:109::19)
 by CY5PR12MB6105.namprd12.prod.outlook.com (2603:10b6:930:2a::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.36; Fri, 21 Mar
 2025 19:52:38 +0000
Received: from MN1PEPF0000F0E5.namprd04.prod.outlook.com
 (2603:10b6:408:109:cafe::57) by BN9PR03CA0974.outlook.office365.com
 (2603:10b6:408:109::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8534.34 via Frontend Transport; Fri,
 21 Mar 2025 19:52:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=SATLEXMB04.amd.com; pr=C
Received: from SATLEXMB04.amd.com (165.204.84.17) by
 MN1PEPF0000F0E5.mail.protection.outlook.com (10.167.242.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.8534.20 via Frontend Transport; Fri, 21 Mar 2025 19:52:38 +0000
Received: from SATLEXMB04.amd.com (10.181.40.145) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.39; Fri, 21 Mar
 2025 14:52:37 -0500
Received: from [172.19.71.207] (10.180.168.240) by SATLEXMB04.amd.com
 (10.181.40.145) with Microsoft SMTP Server id 15.1.2507.39 via Frontend
 Transport; Fri, 21 Mar 2025 14:52:35 -0500
Message-ID: <e7358027-6a8b-85b0-3ccd-cb09b3a9ce7d@amd.com>
Date: Fri, 21 Mar 2025 12:52:35 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH V1] accel/amdxdna: Add BO import and export
Content-Language: en-US
To: Jeff Hugo <jeff.hugo@oss.qualcomm.com>, <ogabbay@kernel.org>,
 <jacek.lawrynowicz@linux.intel.com>, <mario.limonciello@amd.com>,
 <dri-devel@lists.freedesktop.org>
CC: <linux-kernel@vger.kernel.org>, <min.ma@amd.com>, <max.zhen@amd.com>,
 <sonal.santan@amd.com>, <king.tam@amd.com>
References: <20250306180334.3843850-1-lizhi.hou@amd.com>
 <d2d6b84b-7463-483a-a634-396b5099ef56@oss.qualcomm.com>
From: Lizhi Hou <lizhi.hou@amd.com>
In-Reply-To: <d2d6b84b-7463-483a-a634-396b5099ef56@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: None (SATLEXMB04.amd.com: lizhi.hou@amd.com does not designate
 permitted sender hosts)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000F0E5:EE_|CY5PR12MB6105:EE_
X-MS-Office365-Filtering-Correlation-Id: ecb321f2-6dce-4ad3-39a0-08dd68b1eeda
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?M25YdW9WWmNqTHRKamhWaGkreEpwa0FCNUVIVUc0RGErSHl3UlU0cSs0N0Y1?=
 =?utf-8?B?TEExR3hsQ0FxQWNxYm5ON3NwcmpkdTU3ODNBOSt4NVp5Vi9KUVd3Q2RGLzVv?=
 =?utf-8?B?cVBJQkk4V2MrV1ZySmxMc2hPMTEzT1E0SmJDTVJxU0ZIZE13cE9SRHRES0ZV?=
 =?utf-8?B?eEJRRFJmS094UndkVXVwdy9vR1RVL0kwU0xXZzdQWUtRR1V2L3NiT2ZaZmwv?=
 =?utf-8?B?SG5BZnJZeXc4dkNOTm0wUW5oOXJ2RkZJK2RWNzUrSGJwKy9HcFBhdUEzNU1k?=
 =?utf-8?B?ZHJObytsc2JzTmpleHRqWU9PVzIxL0l4WGZscDlXNEx0Z3dDaVoweGNiYlh5?=
 =?utf-8?B?MjBUeEQ3Y2tTQkZRKzR0Um5Nak1XcG9HN1JPNitMN1ZzNkJXOWpUUGc0UHVD?=
 =?utf-8?B?NEtGOWYrbE9NbTV1V0tjSWNZRGUyRkpmUXBnYWI3SHN3a3AzeGJWaWlHK0xY?=
 =?utf-8?B?QjdOOEpYejgrcGFEdVhtQ2lQMy9JNXJjenZTTy80RlpkYkZWR2FHT2hsRWpP?=
 =?utf-8?B?OVRDeVNqTFBHc2dxZnBKNElTaEg0bmdvWVVCRlZBZko4VWpPaGg1dmdOVVBB?=
 =?utf-8?B?Tk5tUGcxUGUvak8wdldNMlFMbGtHSkNaV0ZTSlMwVko5cmxvcmw3RlFKUnpO?=
 =?utf-8?B?eWl4YzhmMS9OeStWWk9xS1k4SW1yRGdqRnBpVUl5NGhXaGZBUUxIb0pTNUh5?=
 =?utf-8?B?eTZmSG9iQ0VLeE56V1ZocWpEVmtpejVBQ2NWVndxTjh4V29UTEhzK2s0TGhz?=
 =?utf-8?B?cHZieWZaRHlnNlZYaEFjMFFINGhpenJITmZiQklqYVh3RjdqeEZCWnRMRWRS?=
 =?utf-8?B?NHEvZnJXRWVvejdNckNSQzNNNHJYTHk0czdNWXJKVnpRUFpJaTRyQjUxZkkx?=
 =?utf-8?B?bDl5MThCV0I5dHQ0ZW5aVkF5SEQ1akZoWWg3dVN3WHozRW9ucmYwOHB4b2VP?=
 =?utf-8?B?Ym00dzBIWVdWbm0xZldrYUw3Z2N6Ulg3RC9xbkIxbzZwSW5peDNpaFVaTjhB?=
 =?utf-8?B?dU1VMEJLK2N3UDROTUdrUG5zaW1wOTBlU01ObEdYL0Q0aVl1emVjMmhjS3JW?=
 =?utf-8?B?Q2RQQVA5RHRTbEJIVW8ra3BHcjRVYjQ0SjlpQmEza1RWZU8wNENGUGdFWFFl?=
 =?utf-8?B?NjlzVENEZmpkYXZCQ2JpaGJkakhiRFpDb0UzS3NDN2UxR0Zhc25DdGVKQURr?=
 =?utf-8?B?QmU4REJ1SU0vRFcyK0xkamhWMzJvWEZXVU5kLzZBdGhkRmJzaVZSb3Z0ME8r?=
 =?utf-8?B?TUJHdWNHcmRUajc2M1AwR2RhbG9OUCsyYXlIRVFYS2hiU0FKZTViVUppb20y?=
 =?utf-8?B?dmhiZzJpT20zUDJFRmp6MmtocEpobXYyUWNHdkcxSzZrWGd3YVRSdHBNeU4v?=
 =?utf-8?B?dXBaYzZvbGk1SjduaUhDUVF3OFBtbVJJSTVzOWhBeDh4d3lNa28xOEt3MnVU?=
 =?utf-8?B?eFhnNEJNU1NWK3JyRUVySVNtdTg0V0NPRDY2OThxNFFsNU1UbmV0RmZBekY2?=
 =?utf-8?B?NkgrV1Q2Q21rVUhOMDR6VVNtdkM0VUJ6QXFaMFpuUE41M1RZZ3VmQTRCNmd3?=
 =?utf-8?B?TExFY3pPNy9ELzZQUXEzSDVuYURlc080VnhtWXRTajdabTdLMWNsNXRZbTZh?=
 =?utf-8?B?ZXU1alI5cHRlU3krVytWY2RJUCtqanBmbG9CTkZ0UkZPR241ckxSNEtjcStj?=
 =?utf-8?B?SmJjdmEybG56a3piWkZtQW9wc3I0bHAwOG5PYlh1VzdsZUJLRVFCODVGNGFD?=
 =?utf-8?B?QlZsdS8rSG9qOHFWRHlZZEdqMkM1U1FaSjdjbDlaMFhEclJmTjY2ZHJhRjFY?=
 =?utf-8?B?WExSdHlOYWllQWVUMFFFTDNFQXF0T2J6TEQxekV5Vjlnd2dRZEdqREJJNUVL?=
 =?utf-8?B?bXRUbmRER2wvbTFnWDRpNnQxdzZTSUp4bFg2K2xDV2JxT0s3MUZjbDBSUUxy?=
 =?utf-8?B?S2hFeTJqZ25mOUtWaS9sSUFmSzZlMk52Z2lRbHNjWFB0Q1lnQ1E2NVRIS2hp?=
 =?utf-8?Q?uGiwcg+jLRohSr+EteMkZTa8szC2eY=3D?=
X-Forefront-Antispam-Report: CIP:165.204.84.17; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:CAL; SFV:NSPM; H:SATLEXMB04.amd.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Mar 2025 19:52:38.1788 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ecb321f2-6dce-4ad3-39a0-08dd68b1eeda
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d; Ip=[165.204.84.17];
 Helo=[SATLEXMB04.amd.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000F0E5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6105
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


On 3/21/25 08:15, Jeff Hugo wrote:
> On 3/6/2025 11:03 AM, Lizhi Hou wrote:
>> +struct drm_gem_object *
>> +amdxdna_gem_prime_import(struct drm_device *dev, struct dma_buf 
>> *dma_buf)
>> +{
>> +    struct dma_buf_attachment *attach;
>> +    struct drm_gem_object *gobj;
>> +    struct sg_table *sgt;
>> +    int ret;
>> +
>> +    attach = dma_buf_attach(dma_buf, dev->dev);
>> +    if (IS_ERR(attach))
>> +        return ERR_CAST(attach);
>> +
>> +    get_dma_buf(dma_buf);
>> +
>> +    sgt = dma_buf_map_attachment_unlocked(attach, DMA_BIDIRECTIONAL);
>> +    if (IS_ERR(sgt)) {
>> +        ret = PTR_ERR(sgt);
>> +        goto fail_detach;
>> +    }
>> +
>> +    gobj = drm_gem_shmem_prime_import_sg_table(dev, attach, sgt);
>> +    if (IS_ERR(gobj)) {
>> +        ret = PTR_ERR(gobj);
>> +        goto fail_unmap;
>> +    }
>> +
>> +    gobj->import_attach = attach;
>> +    gobj->resv = dma_buf->resv;
>> +
>> +    return gobj;
>> +
>> +fail_unmap:
>> +    dma_buf_unmap_attachment_unlocked(attach, sgt, DMA_BIDIRECTIONAL);
>> +fail_detach:
>> +    dma_buf_detach(dma_buf, attach);
>> +    dma_buf_put(dma_buf);
>
> You attach() and then get(), so normal "reverse order" cleanup would 
> be put(), then detach(). That is not what you do here. Should this be 
> reordered, or should you get() then attach() first?

I referred drm_gem_prime_import_dev(). And I agree with you. It looks 
better to get() before attach(). I will respin V2 which will also 
contain another small update for this patch.


Thanks,

Lizhi

>
>
