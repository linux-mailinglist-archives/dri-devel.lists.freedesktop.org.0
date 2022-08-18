Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9755983F5
	for <lists+dri-devel@lfdr.de>; Thu, 18 Aug 2022 15:20:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5754ABFBD;
	Thu, 18 Aug 2022 13:20:34 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2057.outbound.protection.outlook.com [40.107.95.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5A4518A1DA;
 Thu, 18 Aug 2022 13:20:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BTyfMVISGJpVAPDNlOIqeFi47sZCBcIKLo0YCppw31EtA8myXdfhun5NS1p41R8DrCCrq2K4xR2UJTptQVRnOB4ct4f+kVhr9JiSoU4rOmblmtM+rzpJTYF9Ab+ZhiFAnCcfwWnNG3Kv8MDQLCktYp2AuB+G15hr0qGGtBM2tVp1zEvp1OKMeXjobcDkDn+L6CqQmzEghuXwpl1YmI6fqi1Af/e27nSl1eFYUaDIBxsam38Tn+PGyIfEdU0mi96fLkdkPw0XyLfSYWybH3DrdkMACvMbSHZMEKgycMHH6JIgSLBNMf1y0LBql6NHnKsHQ1j8rgMdWj8MyHQZqPssNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2kUSmF1YgFTq+x/Ws1m9/m65sDsJt12J6UgOEBh0ZnA=;
 b=QCmJ7HQ1hwOW5Rte5miyqlIPB5iyFd+ObtWjLeooKlqjP7+FiJyjmyiL3NAIFBMW7Kru3Wivqu1ag7pwwh4ugWcVaEA/BarQ6VhzHLnzoxOBbxp4pF3rbozDVlqxZgG2Ma6I2WN0mdDupC8+lMqbenq8N+gnH62r393uD+CVbNjk0REQogYoj7IBJAxzc2OsxQQ7L3IunAVmXYeu9a68O550u5eNDcL1pBAC+TVb7RTwfohHqbCplR4Mi6S2vlRfrsETTYAHvATU8E0X+TzxW/xNKn0wOC2uBsoKtwhdH/38u2OMmwJMMnDk0hjx+chY2YcI85/OqM3g1A9ErPsJiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2kUSmF1YgFTq+x/Ws1m9/m65sDsJt12J6UgOEBh0ZnA=;
 b=voblQoqcFhNDTWrTFPL4CONMDoWnCMcC7Ic4mj+JxVvsnrZ1Cqf4opDLGS1R/Q/6N5CbrkHQXLBK/8GGl2E13FE8VZQNwyXRgcrngNGK6mvacnNltfGjoy0mZkROP8PRtTm5ECPq30U+tVyM5FVY7nSupARTSM5axJK168JGCH0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BN9PR12MB5225.namprd12.prod.outlook.com (2603:10b6:408:11e::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5525.19; Thu, 18 Aug
 2022 13:20:11 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::905:1701:3b51:7e39%2]) with mapi id 15.20.5504.020; Thu, 18 Aug 2022
 13:20:11 +0000
Message-ID: <c83f20bd-a753-ddcb-d4f3-fb5348189153@amd.com>
Date: Thu, 18 Aug 2022 15:20:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 0/6] amdgpu: Allow explicitly synchronized submissions.
Content-Language: en-US
To: Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org
References: <20220813012801.1115950-1-bas@basnieuwenhuizen.nl>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220813012801.1115950-1-bas@basnieuwenhuizen.nl>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0153.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a2::11) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 612dd58a-4168-469f-5b67-08da811c60b2
X-MS-TrafficTypeDiagnostic: BN9PR12MB5225:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 5InwRylIJKIgc0gZz9YwxHzu49cl5ADo0E5Sxlp+Vx4Ai6zNYLCmBUspY38ZDy3hvDSlV1DkJxjm3DQ7j1TPsj3YEOFXHeHeKVDI3i4XfyoL2fvT9tdE0WH4tsr8uw1/OAn6rClqCgBDgisOzC4qYGeMJiOCeaSlhfet1+Td8VF7tCpCX1UAxwkn1khJOAAx6YJpKfq4WcYaufNj0YUaL7+SiRmU9Nt7ILMLuvvfy8UnQ4dCYIRBL1Yr7LlUScm8ie72mTmrxtKT385/jkqOh7iGcZOZTH6HhNUmgbga/LoYylicEVoV4fW+A1Rvsgr936yCm4rpItpqY1NCHmdQWXA3oe0xnlT6MvEU2bR7I+Xt7UMUYyoIIo7pZHHVNVMwd87+4IAye7qvcKlKMR/Q+q7YEyNdAJl9EYdkmEAU8Ht3mGuyHwU9H5i8CJTU/qQc5qFWfi+UrQmCIvKrCC1bGPyxIOSKIx5dRz8aFymnN10aMglQlXyUxg6vJlo4qeB6GzMBd/I7H+hfnL6Gv3EwqecN0xs8rCf9iR96UBB5CCO+ZWNXsVx5QgGYfyz6gsjiUjC+IXeed9tGQNvEjtR2j1it1Wwz0R4GohGc5/xWlUYjhQUS0rci+i9zUBRNwZR63o3u6NHqYI4W+NXe77yIYaIg0a+4vYV3cd76uN0ihNJDMd7eRsTrUBH5T5HZ0PnzBNuFkB9A2IgvmNckON4cXz8sa+BNcJo5vUtG5W3yCm9vPOHuFFC0vquKMUGw0S2edkhoJbesUvwwaMDo7SyGhxctjVjgP0RC0u91sEes7el92XlRirI2xmlsNZpMn9b/uEwywX/JjqkJVizAcis8og==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(39860400002)(346002)(366004)(136003)(396003)(376002)(6506007)(36756003)(316002)(66556008)(38100700002)(66476007)(66946007)(8676002)(4326008)(6666004)(26005)(2616005)(186003)(83380400001)(41300700001)(478600001)(6486002)(966005)(6512007)(86362001)(5660300002)(8936002)(31696002)(31686004)(2906002)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0dqeHJoSUdaeHJFNWs3MjFmQlljSEhGeUVyZWdsUnlnVXh4QW5XQUlBL2Yw?=
 =?utf-8?B?WEpUdVY4MjdRN25zYjJrN29yaFEyZ1NZZFFHQzlsaWJBNFo0ZGJ1WWxRYjNM?=
 =?utf-8?B?cyt5MzJ6Ri85ek0wRnlDVkZBL1d2Q3NIT1l0SnFWZkM3ZlNxNC85aHhwU3lO?=
 =?utf-8?B?djlGZEpHNTVQTWF0U1dCV2dVMnlHMDVXb3pDOEMzZVduanRjaGYwSGdkeG5U?=
 =?utf-8?B?eldTQ2h1ck4yaDVVcTRwTXpxSmJpd0JBSHFQNmRHeklhSGxpR3dKUXdzbTMx?=
 =?utf-8?B?eCtFek55LzBWNERDUEpHZzVOdWFWV1lhUEhyQmd5MUZ2b2JSUWVJa0dPdjkz?=
 =?utf-8?B?ajcyMEVGV2pPQ0xOcitIKzNucW9PYlNlNm5lMWhROExtTFZXRDV4dkJieDBo?=
 =?utf-8?B?NXRFcHpBZUtJakV0c01Sb0NuVnZRRlVCS3VvbWxoQzZKeHovUXBvS3dVbnFC?=
 =?utf-8?B?VlhKNVhEbHdpend5UlpZdjZ3YWJEOUxseFc4M2ZFbmxGYVRabFI3dkJGNVpu?=
 =?utf-8?B?U0dzU3Jhbll4RWM3K0hXSWt0c1ZIZy95T3RVaVNSVmgwV3VkNEZjYlBKeEwz?=
 =?utf-8?B?NnRyTVNQRUNONGhMQldrRGlOQXVhVmNRSHBkU0hpMmRyKzdtV3N3ZUUvZjVs?=
 =?utf-8?B?M3R1T3NkMVMzRGNtQlRHcGVtSjByNTNrQ2EyQnRFZFEzUWtKekI1RnR0b0dn?=
 =?utf-8?B?eE1UUVJFbHpCOU1wZkxUcHdaUFFnTStIM2t6Q1BzcGVEVGdRTEhhdW5MQjB6?=
 =?utf-8?B?bVBOQ2NUNGU0R0UyRG5Ld1k2TmYrZmNGV1F6ZHlFZnBSUFZJZnY1cllaVlFZ?=
 =?utf-8?B?akFlSzhINDZMaEFiVDhIa1BrL3Z5WnJwVndYY2FEVFJyelpIVFJOaHV6ZDNE?=
 =?utf-8?B?S29FUWd1TUZERjJtUzFZaHpWQnZXZFVnTTg0Z2JRS3RwVUMyanovWGVmTzFp?=
 =?utf-8?B?Q09tMkRoQXBkRWUvR25jVTY1SlFxWWFHeU5NalBkbWlyZC9yb1BPaVpyUUZ4?=
 =?utf-8?B?WC8zbUZaZEFNcUFkcm5wZkh0NnhKSWpWUzVreEYyVG53RUJPY0RlYlJMcHRU?=
 =?utf-8?B?UkwyenUvYWhPRUNUMGJ0cXlwSmNaTGl6akZVOWg3R3g0QTI5YnpYSDhOV29F?=
 =?utf-8?B?enVtSHdObUZmdGNJN3VqMVhYWkllYmlOUjFTVG5EWE9EaTNXVkIyNUxFV1ZL?=
 =?utf-8?B?M1hnQ0pBeGxwU3R1RTZzSkZoZkhhK1R5eTRpL1BBMTdob2JpVnVmbm1yby9I?=
 =?utf-8?B?eEdlNzd2c1QzcDNjUVptdWw2ZjF3NVBXek15VmFFTHpzeWloTUVlVjE2ZHdC?=
 =?utf-8?B?Wmg5VGhRQnBNSUpaS1hqdUNRWVdWSFRUdldoaHVuUTk2ZDNjYzZieHpHb3VF?=
 =?utf-8?B?MlFRWDRCeG0yTlR5bE5tL08xL296MitOSGpxckFyUHVUdG9BM3NKSG9rUEpa?=
 =?utf-8?B?ZzZUNWo0eUhqRlRTZ091c0R6enVIUFN0TU9NV3NERVliaDZ4cmtyOGh0YmFl?=
 =?utf-8?B?bkVNL3IyU0dHMGhiUGRXMlRmWWZ3MTkwbHFrUjMvbG55SEp6aGdpcFNkcEJz?=
 =?utf-8?B?bVlzN3NEMFNTMDBJbVNIb1hIb0pPQmhsSmdzMGgwWWgxY01sQmJpdm5uanlm?=
 =?utf-8?B?aUhLYzV2N003SGc4Tm4xUVlZZjZMa244Tk4xVWQ2S1Z3Q0RSK0x1VmlqNmN0?=
 =?utf-8?B?STBoY3dwY0oxU3FQSnNjdm90UEM3TjAvVzlQNlhHRWFBTGdOcXNEMndMOERT?=
 =?utf-8?B?bmVzU1Y5dW1zczhSZlZCNEhubjFBR0VBTnFlVjVseUlOOHVNSnNuTVVlRGRh?=
 =?utf-8?B?NzM2S0JYdEFYcWRmQzdWZVBmdm8wZGVTVlFxVE1BMmkwaGp2aE5UVHBKYjdO?=
 =?utf-8?B?bnhuZVd4R0lNSGwrdndlUUxadW5QbWxuRFgvYjc5SnViTFFWNUQrdkE1MXdx?=
 =?utf-8?B?M05nTWREcXFrRktMd2ZhRVRPMkNqbVp4TzFpaU9kZ01BbEJhQXo2UkYvblFG?=
 =?utf-8?B?UVg4eXQ0WDJmVkZzYlF2OFhxNzVSU21sTDB1RFY1V3dUelZSK2Y1RFg4YldP?=
 =?utf-8?B?emJ3L2VSbi8xQnQycFBXUnVjKzdVVDVWRFNXaENmTVhEUXFKMzZsbWprc1Rh?=
 =?utf-8?Q?duHUONk8M7jQKwgFOxYsOfe0f?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 612dd58a-4168-469f-5b67-08da811c60b2
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Aug 2022 13:20:11.1152 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: co79Yuay+rSD+RqqMNOXwdpS987i2yvFkewP06O3haVqE82zofJR7kypiKyXMzm+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR12MB5225
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

Hi Bas,

I've just pushed the branch drm-exec to my fdo repository: 
https://gitlab.freedesktop.org/ckoenig/linux-drm.git

This branch contains all the gang submit patches as well as the latest 
drm-exec stuff. VCN3/4 video decoding has some issues on it, but that 
probably shouldn't bother your work.

Please rebase this work on top. It should at least make the TTM changes 
unnecessary.

Going to take a closer look into the VM sync changes now.

Regards,
Christian.

Am 13.08.22 um 03:27 schrieb Bas Nieuwenhuizen:
> This adds a context option to use DMA_RESV_USAGE_BOOKKEEP for userspace submissions,
> based on Christians TTM work.
>
> Disabling implicit sync is something we've wanted in radv for a while for resolving
> some corner cases. A more immediate thing that would be solved here is avoiding a
> bunch of implicit sync on GPU map/unmap operations as well, which helps with stutter
> around sparse maps/unmaps.
>
> This has seen a significant improvement in stutter in Forza Horizon 5 and Forza
> Horizon 4. (As games that had significant issues in sparse binding related stutter).
> I've been able to pass a full vulkan-cts run on navi21 with this.
>
> Userspace code for this is available at
> https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/18032 and a branch
> for the kernel code is available at
> https://github.com/BNieuwenhuizen/linux/tree/no-implicit-sync-5.19
>
> This is a follow-up on RFC series https://patchwork.freedesktop.org/series/104578/ .
>
> The main changes were:
>
> 1) Instead of replacing num_shared with usage, I'm just adding usage, since
>     num_shared was actually needed.
> 2) We now agree that DMA_RESV_USAGE_BOOKKEEP is reasonable for this purpose.
>
> Please let me know if I missed anything, especially with the change to VM updates,
> as we went back and forth a ton of times on that.
>
>
> Bas Nieuwenhuizen (6):
>    drm/ttm: Add usage to ttm_validate_buffer.
>    drm/amdgpu: Add separate mode for syncing DMA_RESV_USAGE_BOOKKEEP.
>    drm/amdgpu: Allow explicit sync for VM ops.
>    drm/amdgpu: Refactor amdgpu_vm_get_pd_bo.
>    drm/amdgpu: Add option to disable implicit sync for a context.
>    drm/amdgpu: Bump amdgpu driver version.
>
>   .../gpu/drm/amd/amdgpu/amdgpu_amdkfd_gpuvm.c  | 16 +++++++---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_cs.c        | 20 +++++++++---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_csa.c       |  3 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.c       | 32 +++++++++++++++++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ctx.h       |  1 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c       |  3 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gem.c       | 12 ++++---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_mes.c       |  3 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c    | 11 ++++---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.h    |  3 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_sync.c      | 11 +++++--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_sync.h      |  4 +--
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c       |  1 +
>   drivers/gpu/drm/amd/amdgpu/amdgpu_uvd.c       |  2 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |  5 ++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm.h        |  3 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_cpu.c    |  3 +-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_vm_sdma.c   |  3 +-
>   drivers/gpu/drm/amd/amdkfd/kfd_svm.c          |  1 +
>   drivers/gpu/drm/qxl/qxl_release.c             |  1 +
>   drivers/gpu/drm/radeon/radeon_cs.c            |  2 ++
>   drivers/gpu/drm/radeon/radeon_gem.c           |  1 +
>   drivers/gpu/drm/radeon/radeon_vm.c            |  2 ++
>   drivers/gpu/drm/ttm/ttm_execbuf_util.c        |  3 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_resource.c      |  7 +++-
>   drivers/gpu/drm/vmwgfx/vmwgfx_validation.c    |  1 +
>   include/drm/ttm/ttm_execbuf_util.h            |  2 ++
>   include/uapi/drm/amdgpu_drm.h                 |  3 ++
>   28 files changed, 122 insertions(+), 37 deletions(-)
>

