Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E988768EED8
	for <lists+dri-devel@lfdr.de>; Wed,  8 Feb 2023 13:24:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8F88010E76D;
	Wed,  8 Feb 2023 12:24:47 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on20613.outbound.protection.outlook.com
 [IPv6:2a01:111:f400:7e8a::613])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25B8010E762;
 Wed,  8 Feb 2023 12:24:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gpZT9TVO/PQ6CPblDHKSbYhpiElfsvDeVY+ZVRStukphiUApZ/VBKebCSt5j+3agCSrn5C9HnnbrmgIp6thqF0Cp5VQH+d7OXZsN8lzoira4C9kgdwP3P8meKj9rwFnzcUJFKttVea511LUP7nDt04C2UimZA8oBf69IcE7+jBxEj4yx92rNIvRRWzjXzW2G+4jyWbEeh0xiqKYVeCkSqdwqVUcsF4x8Sl789fESALe6VPA4OVr8mWK9t6qQF+mdf/LjZQyvtvjkLlEPxjq8iVtHCzWoAuWqy6h8riHv69ZDSGa7aCmYDQRnu0nh6SlyuEpO6DackW+xcGNUZ+YXtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aWCHX3uwNrgviFvWrAxHiOPhOqQlq7TMYKNhzfTxyuw=;
 b=YqaSS6WPglveiL3hATAKSGBP+/DjUdJhcEEu4UNOu/4dYLq90DYniTv1KyXCa0DSL/8UUJXb3BZDSrd79iQcMlMMKb5wS0ALfHyvnG+fZuC/DzL4rp/qQkzC8WAiOMxeRRsNMxDTQMftDz42zXr+wYHRSvliBdocmAGV5GyB1pvFhM0gWqoPiTFVQNBFF7R2T3+2SWpTD/xIHQBcBoqN6IMfP3HpUzg0A5azYDIUM3acM2urhnVH7li7K0LLEZT5rdeX6SdvPCp8uPTEWpTpdb4niRfmfBo67XQJuybicNq0ArR4Hpm6NlwAOlWTV6jB0nfMFyOz0Mj7Gf15T1CoBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aWCHX3uwNrgviFvWrAxHiOPhOqQlq7TMYKNhzfTxyuw=;
 b=LuU9SH7COZv/F9J7CiwveBemvXuNvkeHe4bjtKD/uAIVlMmdDk1vo2THKslcMW2iyRXRTXtDiEGnxjizKfNPlulFnmjshVZQrJWGWTNzaNA7+qVSxzIHGTal45EwPgNK5tL4WzfjYhjU1sdP5jnLO0bEpDtVofwlEu5t/iFeRqw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by CH0PR12MB5156.namprd12.prod.outlook.com (2603:10b6:610:bb::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6064.36; Wed, 8 Feb
 2023 12:24:40 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::2e4f:4041:28be:ba7a%6]) with mapi id 15.20.6064.032; Wed, 8 Feb 2023
 12:24:40 +0000
Message-ID: <a9fb097d-c36b-dddf-65cf-ecab7f8b6527@amd.com>
Date: Wed, 8 Feb 2023 13:24:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 3/6] drm/ttm: Change the meaning of resource->start from
 pfn to bytes
Content-Language: en-US
To: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-graphics-maintainer@vmware.com
References: <20230208090106.9659-1-Amaranath.Somalapuram@amd.com>
 <20230208090106.9659-3-Amaranath.Somalapuram@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20230208090106.9659-3-Amaranath.Somalapuram@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0128.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:94::10) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR12MB3587:EE_|CH0PR12MB5156:EE_
X-MS-Office365-Filtering-Correlation-Id: 66793ef0-0da7-449c-397b-08db09cf736e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 440caPpdC6Y9xDljE4i21XmWGJ60dPHjxK9ARNWOnv3nZ3vQui/cj9lfSNWMTLpiCuPynXGn/qr7a357wnNDXRMQ7C63o6J1QJZ0eZBS+XvzKUHjYaE1VFOJu+p+LAXItwx362umJrcshPS5qPLR6dOOraKWPi0UqH8jAgJ2AHKjRwehHJHYwj+PFgETcdrhlHqKk5rhPMJ/3J4rkHhjMsO+YD00cq3/qzlEZC2HcRlTzcGvtpIjCVhtxXAxxpqRcm8nLkYSftVhzRb7RCFRR97Xan19cLz9taDiMjsj86ZNCUxdg2f4uw5+yo4dyo4KqAen2IJeVHoE3KtAvZCKi53QXnD2kK5qxkLrT/rsomp7Qr1oAhb8CzX4MhAcj2lrdCImjuLz1EhcSd89EXzts7qsbkFRp1He24MN1t5TgCU5DDvsUY8k311q9nHizOJgfq7Ok0+I8gVXZvWgPZUgFBVh8TgFx3lSA/h145Ai5BTaTg5R5FcAQHjnWUWedFlNnz1RGHKDEEW20LYT1cVAMYa+2JRVeo5W7nFC1gADWqyv4PzWht8V8W83JaMYA0T2u6RtjcAYkwS9vYgZyHQiGBqJVKjwsGQr23Rf2lQroeacs7623LE2SEgKKrjfB0cbyGp/zLipbhuEVnhmqs7mh9aHcC5S1qQ8Mcbx0vyslQgPDdEC60vUoJcEmohVem1q6djWz/3iS6HqjqBnFhcZW2M9dpCCeS35WHQifzf9jh0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(346002)(376002)(366004)(136003)(39860400002)(396003)(451199018)(83380400001)(38100700002)(316002)(478600001)(31696002)(6506007)(4326008)(36756003)(2906002)(6512007)(86362001)(2616005)(186003)(8676002)(30864003)(5660300002)(8936002)(6666004)(66556008)(66476007)(6486002)(31686004)(41300700001)(66946007)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OEtJMFNaK0VvWFZ3SGV2bE1na1h0NTdHQkxtOUZXbXo3cUNjL3RZamlISnJD?=
 =?utf-8?B?UFRnSjRxRlhGbkRxb2ZsY2RQNlVSSjA5OGQycStPU2o2clNiOW94bWZMOTJa?=
 =?utf-8?B?cEZYbGdRaWMrUytrTW1LV01Mbi9MZkk4TTJhcnRIaUhiUlNNb0VqcjlaUzY4?=
 =?utf-8?B?enljV1RVYUFzQVRFRDQrdzRxRHZxS3VaRHpXMVcrQ1hGMEpIb1dlQWJIVkE2?=
 =?utf-8?B?YTBtNUtPWXp4QWlaNE9NOW9QUXpwUUlCbWo1cWZ6NW9VaE9MRTJmT2Z4VmJy?=
 =?utf-8?B?Z1g3SHVDOUZ2Z0pVdW80L01yWU1wQ2FsOW45V2x6SVU0eEZ3dFRwQ202UXhx?=
 =?utf-8?B?dUxWSlZtZzZtd1dEVzhBL1YvMXQrSmRkeWdWSURhVFhwd1VydFE1R1ljZXky?=
 =?utf-8?B?cUw1YURvOUhEbk9jTC9ucTFrZllXeVBiNTh2QkNoWHdSQ1NOTzlENWppZ3V0?=
 =?utf-8?B?TElkZ0ZwVmtYdk83TDY0WWkwd0tWa3NzMytnK0RrZEhsc214cTRVVHR2RzNP?=
 =?utf-8?B?czFud0REbkFXakdBTmlYTHE2S1YvQUdPanhmSzhWd3RiRkpDaHRyNUhUaHo3?=
 =?utf-8?B?ZGhvM0tUSDNOb3pCR3VtdmJvVjNIRjhIZ0lybTN0ckdBWXNNZWorSkYxbjMz?=
 =?utf-8?B?aVBGNHA2RFIraUtpSitIbVZPclBIZ1VXaUdkMEFidXJkVkE4MDdPNzZuUnMx?=
 =?utf-8?B?eGJNTndhbmNWdnoycEgxT3FGa2I4MWVibUttTWV6WFNKODRPZWhBaWs2Y3dM?=
 =?utf-8?B?ekRPcU4zZ2NnNlFYZVhTNzFScC9SSFo2Vkh3ei9DaHZQT0JIMjZKL0UvOGM2?=
 =?utf-8?B?K2pRaHZsL09Cc2ZHalBQTDdVdm94QVhxaXlBSWV5aGU2QjVyVENQZVhEa2ZB?=
 =?utf-8?B?eGNlZXFkVVNBNHJVQTF6ajZqbDBIMnNhUTZ3bTU1UERESmplMDFLVHhidXhK?=
 =?utf-8?B?aTJIUGZaRnkzek0xVFRHR01CYWYxMlFiZ0dWV0toQjl0L0w0enBZcVg5VlBa?=
 =?utf-8?B?enFWSGgyMmIwdkNmZUo3ckIrZk84dktyNmVsd1gvN2t3OTkyL1dDOThxMGlu?=
 =?utf-8?B?NzJMajRnb0lLQ1pOMVkwSmRLSkxIeGt3OWNoU3RnaFdyTVRudEt5czEyZzg5?=
 =?utf-8?B?dHZyQmlhNnZBNzZIZWQ5ZjRldFVudVI1cXMyZGFmVjRna2hLWFZ2a0xlWUdp?=
 =?utf-8?B?Q21DOWVhd25GQUtHNU5YYjFaRUIrSXEwTXdWaHJjQTJrUVkzYnFpV3FiZkxv?=
 =?utf-8?B?cjdmVkVxbkFYMmFmS0hEUjQxRVR2K3k4ZnJhQlF4RTBuTkVLSWFVSE5sUWgx?=
 =?utf-8?B?N0laeWVJOEcwQVJ1T3dsS2xqYW1CZWY3NWI1Z2NrQStEOU1velp2cW10T1lN?=
 =?utf-8?B?T1dDa2NtTm1BYlF6YnBMTDFDZm9sdFQ3OEt6cC90bmx4UHZrWVAyTDZMMzRH?=
 =?utf-8?B?OWtzVi9MUHl5WVhISWx3S3lIMFdnYVI4VUZmNVU4T3k4Q3ZUeTQ1RlJNcnpx?=
 =?utf-8?B?MjloQ3JiMm5OdWpBRTlmWmNtMlhoaUs4ZittRzdJZnBWSzRFQkRSK3JoSjR5?=
 =?utf-8?B?dGtMY3RwZUxLZ2l4WFNYaHExSy9yQ0wzWXRHQ0ppU0ZqUEQzdnovVzNxMXpH?=
 =?utf-8?B?SlFiU081TWVXVzA0VitxTHUwbjFLY1ZVcGljUzBWbVYraklXQUcrV0FmYnBV?=
 =?utf-8?B?WnExV0xrL2lUWVRuVmhQa0RZVXRBVExpMTVxc3Vxa2grTHV4d2xTTEIzRXhU?=
 =?utf-8?B?R09JKzAvMEg2OExpVkFBdTc3VnJFSitwd0Nickx5dU9FdXFtR2FhTHZZdlUz?=
 =?utf-8?B?RGhOWXV6ZkNNZDRqYnZOdFlId0M3bVE3SkZUbWR0czE0a09ZN3VSZXk2clNM?=
 =?utf-8?B?cmp3Vm9tQmwxT3h4NE5zRFBGVXBYazZ0MDQ0MVlrS3IxSzRreUJIR0hUODFz?=
 =?utf-8?B?RFFhMWNrUnpLRkowYVNBWjIyWWRtNmRNemRENzNNYlFhVjBsbHQyUXZsT2N1?=
 =?utf-8?B?RlhDYUJjcE4xNzVlRytTMHBxMkc4ZEJBcHhBRG0yeEk1UDE3THN6U3J6K25l?=
 =?utf-8?B?aWJlSE03eURSK1BBWG15TVNhK2hBQlhqRmg2bGljRlgvZ3N6b082dWpXS0dX?=
 =?utf-8?B?OVFzVzVPVDBnWDdqbUZPT2dqYld6akk4eU5uaGpMS0d2RC90cDhvVWVzbjVz?=
 =?utf-8?Q?c0FzYKtPjTX69fly6aSHc0Y6H3gw3+DCorvYWEXVaIPq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 66793ef0-0da7-449c-397b-08db09cf736e
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Feb 2023 12:24:40.4572 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ts1499Yd8fwP0jFE999F5rEdJaNN6gprVl6exk13XUPsXR2KkLIGa1AfVUuqbh9M
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB5156
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
Cc: alexander.deucher@amd.com, arunpravin.paneerselvam@amd.com,
 arvind.yadav@amd.com, shashank.sharma@amd.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

That finally starts to look sane. I'm going to make a few more 
adjustments and then send this out.

Christian.

Am 08.02.23 um 10:01 schrieb Somalapuram Amaranath:
> Change resource->start from pfn to bytes to
> allow allocating objects smaller than a page.
> Change all DRM drivers using ttm_resource start and size pfn to bytes.
> Change amdgpu_res_first() cur->start, cur->size from pfn to bytes.
> Replacing ttm_resource resource->start field with cursor.start.
> Change amdgpu_gtt_mgr_new() allocation from pfn to bytes.
>
> Signed-off-by: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> ---
>   drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c         | 13 +++++++------
>   drivers/gpu/drm/amd/amdgpu/amdgpu_object.c          |  4 +++-
>   drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h      |  8 ++++----
>   drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c             | 10 +++++++---
>   .../gpu/drm/amd/amdkfd/kfd_device_queue_manager.c   |  6 +++++-
>   drivers/gpu/drm/drm_gem_vram_helper.c               |  2 +-
>   drivers/gpu/drm/nouveau/nouveau_bo.c                | 13 ++++++-------
>   drivers/gpu/drm/nouveau/nouveau_bo0039.c            |  4 ++--
>   drivers/gpu/drm/nouveau/nouveau_mem.c               | 10 +++++-----
>   drivers/gpu/drm/nouveau/nouveau_ttm.c               |  2 +-
>   drivers/gpu/drm/nouveau/nv17_fence.c                |  2 +-
>   drivers/gpu/drm/nouveau/nv50_fence.c                |  2 +-
>   drivers/gpu/drm/qxl/qxl_drv.h                       |  2 +-
>   drivers/gpu/drm/qxl/qxl_object.c                    |  2 +-
>   drivers/gpu/drm/qxl/qxl_ttm.c                       |  5 ++---
>   drivers/gpu/drm/radeon/radeon_object.c              |  6 +++---
>   drivers/gpu/drm/radeon/radeon_object.h              |  2 +-
>   drivers/gpu/drm/radeon/radeon_ttm.c                 | 13 ++++++-------
>   drivers/gpu/drm/radeon/radeon_vm.c                  |  2 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_bo.c                  |  4 ++--
>   drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c                 |  2 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c             |  2 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c          |  3 +--
>   23 files changed, 63 insertions(+), 56 deletions(-)
>
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> index 44367f03316f..a1fbfc5984d8 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_gtt_mgr.c
> @@ -116,7 +116,6 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
>   			      struct ttm_resource **res)
>   {
>   	struct amdgpu_gtt_mgr *mgr = to_gtt_mgr(man);
> -	uint32_t num_pages = PFN_UP(tbo->base.size);
>   	struct ttm_range_mgr_node *node;
>   	int r;
>   
> @@ -134,8 +133,10 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
>   	if (place->lpfn) {
>   		spin_lock(&mgr->lock);
>   		r = drm_mm_insert_node_in_range(&mgr->mm, &node->mm_nodes[0],
> -						num_pages, tbo->page_alignment,
> -						0, place->fpfn, place->lpfn,
> +						tbo->base.size,
> +						tbo->page_alignment << PAGE_SHIFT, 0,
> +						place->fpfn << PAGE_SHIFT,
> +						place->lpfn << PAGE_SHIFT,
>   						DRM_MM_INSERT_BEST);
>   		spin_unlock(&mgr->lock);
>   		if (unlikely(r))
> @@ -144,7 +145,7 @@ static int amdgpu_gtt_mgr_new(struct ttm_resource_manager *man,
>   		node->base.start = node->mm_nodes[0].start;
>   	} else {
>   		node->mm_nodes[0].start = 0;
> -		node->mm_nodes[0].size = PFN_UP(node->base.size);
> +		node->mm_nodes[0].size = node->base.size;
>   		node->base.start = AMDGPU_BO_INVALID_OFFSET;
>   	}
>   
> @@ -285,8 +286,8 @@ int amdgpu_gtt_mgr_init(struct amdgpu_device *adev, uint64_t gtt_size)
>   
>   	ttm_resource_manager_init(man, &adev->mman.bdev, gtt_size);
>   
> -	start = AMDGPU_GTT_MAX_TRANSFER_SIZE * AMDGPU_GTT_NUM_TRANSFER_WINDOWS;
> -	size = (adev->gmc.gart_size >> PAGE_SHIFT) - start;
> +	start = (AMDGPU_GTT_MAX_TRANSFER_SIZE * AMDGPU_GTT_NUM_TRANSFER_WINDOWS) << PAGE_SHIFT;
> +	size = adev->gmc.gart_size - start;
>   	drm_mm_init(&mgr->mm, start, size);
>   	spin_lock_init(&mgr->lock);
>   
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> index d835ee2131d2..f5d5eee09cea 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_object.c
> @@ -1488,9 +1488,11 @@ u64 amdgpu_bo_gpu_offset(struct amdgpu_bo *bo)
>   u64 amdgpu_bo_gpu_offset_no_check(struct amdgpu_bo *bo)
>   {
>   	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->tbo.bdev);
> +	struct amdgpu_res_cursor cursor;
>   	uint64_t offset;
>   
> -	offset = (bo->tbo.resource->start << PAGE_SHIFT) +
> +	amdgpu_res_first(bo->tbo.resource, 0, bo->tbo.resource->size, &cursor);
> +	offset = cursor.start +
>   		 amdgpu_ttm_domain_start(adev, bo->tbo.resource->mem_type);
>   
>   	return amdgpu_gmc_sign_extend(offset);
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
> index 5c4f93ee0c57..5c78f0b09351 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_res_cursor.h
> @@ -94,8 +94,8 @@ static inline void amdgpu_res_first(struct ttm_resource *res,
>   		while (start >= node->size << PAGE_SHIFT)
>   			start -= node++->size << PAGE_SHIFT;
>   
> -		cur->start = (node->start << PAGE_SHIFT) + start;
> -		cur->size = min((node->size << PAGE_SHIFT) - start, size);
> +		cur->start = node->start + start;
> +		cur->size = min(node->size - start, size);
>   		cur->remaining = size;
>   		cur->node = node;
>   		break;
> @@ -155,8 +155,8 @@ static inline void amdgpu_res_next(struct amdgpu_res_cursor *cur, uint64_t size)
>   		node = cur->node;
>   
>   		cur->node = ++node;
> -		cur->start = node->start << PAGE_SHIFT;
> -		cur->size = min(node->size << PAGE_SHIFT, cur->remaining);
> +		cur->start = node->start;
> +		cur->size = min(node->size, cur->remaining);
>   		break;
>   	default:
>   		return;
> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> index 2cd081cbf706..6b270d4662a3 100644
> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_ttm.c
> @@ -845,6 +845,7 @@ static int amdgpu_ttm_backend_bind(struct ttm_device *bdev,
>   {
>   	struct amdgpu_device *adev = amdgpu_ttm_adev(bdev);
>   	struct amdgpu_ttm_tt *gtt = ttm_to_amdgpu_ttm_tt(ttm);
> +	struct amdgpu_res_cursor cursor;
>   	uint64_t flags;
>   	int r;
>   
> @@ -892,7 +893,8 @@ static int amdgpu_ttm_backend_bind(struct ttm_device *bdev,
>   	flags = amdgpu_ttm_tt_pte_flags(adev, ttm, bo_mem);
>   
>   	/* bind pages into GART page tables */
> -	gtt->offset = (u64)bo_mem->start << PAGE_SHIFT;
> +	amdgpu_res_first(bo_mem, 0, bo_mem->size, &cursor);
> +	gtt->offset = cursor.start;
>   	amdgpu_gart_bind(adev, gtt->offset, ttm->num_pages,
>   			 gtt->ttm.dma_address, flags);
>   	gtt->bound = true;
> @@ -912,6 +914,7 @@ int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo)
>   	struct amdgpu_device *adev = amdgpu_ttm_adev(bo->bdev);
>   	struct ttm_operation_ctx ctx = { false, false };
>   	struct amdgpu_ttm_tt *gtt = ttm_to_amdgpu_ttm_tt(bo->ttm);
> +	struct amdgpu_res_cursor cursor;
>   	struct ttm_placement placement;
>   	struct ttm_place placements;
>   	struct ttm_resource *tmp;
> @@ -923,7 +926,7 @@ int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo)
>   
>   	addr = amdgpu_gmc_agp_addr(bo);
>   	if (addr != AMDGPU_BO_INVALID_OFFSET) {
> -		bo->resource->start = addr >> PAGE_SHIFT;
> +		bo->resource->start = addr;
>   		return 0;
>   	}
>   
> @@ -945,7 +948,8 @@ int amdgpu_ttm_alloc_gart(struct ttm_buffer_object *bo)
>   	flags = amdgpu_ttm_tt_pte_flags(adev, bo->ttm, tmp);
>   
>   	/* Bind pages */
> -	gtt->offset = (u64)tmp->start << PAGE_SHIFT;
> +	amdgpu_res_first(tmp, 0, tmp->size, &cursor);
> +	gtt->offset = cursor.start;
>   	amdgpu_ttm_gart_bind(adev, bo, flags);
>   	amdgpu_gart_invalidate_tlb(adev);
>   	ttm_resource_free(bo, &bo->resource);
> diff --git a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> index c06ada0844ba..9114393d2ee6 100644
> --- a/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> +++ b/drivers/gpu/drm/amd/amdkfd/kfd_device_queue_manager.c
> @@ -200,8 +200,12 @@ static int add_queue_mes(struct device_queue_manager *dqm, struct queue *q,
>   	queue_input.wptr_addr = (uint64_t)q->properties.write_ptr;
>   
>   	if (q->wptr_bo) {
> +		struct amdgpu_res_cursor cursor;
> +
>   		wptr_addr_off = (uint64_t)q->properties.write_ptr & (PAGE_SIZE - 1);
> -		queue_input.wptr_mc_addr = ((uint64_t)q->wptr_bo->tbo.resource->start << PAGE_SHIFT) + wptr_addr_off;
> +		amdgpu_res_first(q->wptr_bo->tbo.resource, 0,
> +				 q->wptr_bo->tbo.resource->size, &cursor);
> +		queue_input.wptr_mc_addr = cursor.start + wptr_addr_off;
>   	}
>   
>   	queue_input.is_kfd_process = 1;
> diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
> index d40b3edb52d0..e7be562790de 100644
> --- a/drivers/gpu/drm/drm_gem_vram_helper.c
> +++ b/drivers/gpu/drm/drm_gem_vram_helper.c
> @@ -275,7 +275,7 @@ s64 drm_gem_vram_offset(struct drm_gem_vram_object *gbo)
>   {
>   	if (WARN_ON_ONCE(!gbo->bo.pin_count))
>   		return (s64)-ENODEV;
> -	return drm_gem_vram_pg_offset(gbo) << PAGE_SHIFT;
> +	return drm_gem_vram_pg_offset(gbo);
>   }
>   EXPORT_SYMBOL(drm_gem_vram_offset);
>   
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> index c2ec91cc845d..89fada6c2e11 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> @@ -946,7 +946,7 @@ static void nouveau_bo_move_ntfy(struct ttm_buffer_object *bo,
>   	}
>   
>   	if (new_reg)
> -		nvbo->offset = (new_reg->start << PAGE_SHIFT);
> +		nvbo->offset = new_reg->start;
>   
>   }
>   
> @@ -957,7 +957,7 @@ nouveau_bo_vm_bind(struct ttm_buffer_object *bo, struct ttm_resource *new_reg,
>   	struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
>   	struct drm_device *dev = drm->dev;
>   	struct nouveau_bo *nvbo = nouveau_bo(bo);
> -	u64 offset = new_reg->start << PAGE_SHIFT;
> +	u64 offset = new_reg->start;
>   
>   	*new_tile = NULL;
>   	if (new_reg->mem_type != TTM_PL_VRAM)
> @@ -1118,8 +1118,7 @@ nouveau_ttm_io_mem_reserve(struct ttm_device *bdev, struct ttm_resource *reg)
>   	case TTM_PL_TT:
>   #if IS_ENABLED(CONFIG_AGP)
>   		if (drm->agp.bridge) {
> -			reg->bus.offset = (reg->start << PAGE_SHIFT) +
> -				drm->agp.base;
> +			reg->bus.offset = reg->start + drm->agp.base;
>   			reg->bus.is_iomem = !drm->agp.cma;
>   			reg->bus.caching = ttm_write_combined;
>   		}
> @@ -1132,7 +1131,7 @@ nouveau_ttm_io_mem_reserve(struct ttm_device *bdev, struct ttm_resource *reg)
>   		}
>   		fallthrough;	/* tiled memory */
>   	case TTM_PL_VRAM:
> -		reg->bus.offset = (reg->start << PAGE_SHIFT) +
> +		reg->bus.offset = reg->start +
>   			device->func->resource_addr(device, 1);
>   		reg->bus.is_iomem = true;
>   
> @@ -1222,7 +1221,7 @@ vm_fault_t nouveau_ttm_fault_reserve_notify(struct ttm_buffer_object *bo)
>   	struct nouveau_drm *drm = nouveau_bdev(bo->bdev);
>   	struct nouveau_bo *nvbo = nouveau_bo(bo);
>   	struct nvkm_device *device = nvxx_device(&drm->client.device);
> -	u32 mappable = device->func->resource_size(device, 1) >> PAGE_SHIFT;
> +	u32 mappable = device->func->resource_size(device, 1);
>   	int i, ret;
>   
>   	/* as long as the bo isn't in vram, and isn't tiled, we've got
> @@ -1241,7 +1240,7 @@ vm_fault_t nouveau_ttm_fault_reserve_notify(struct ttm_buffer_object *bo)
>   	} else {
>   		/* make sure bo is in mappable vram */
>   		if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA ||
> -		    bo->resource->start + PFN_UP(bo->resource->size) < mappable)
> +		    bo->resource->start + bo->resource->size < mappable)
>   			return 0;
>   
>   		for (i = 0; i < nvbo->placement.num_placement; ++i) {
> diff --git a/drivers/gpu/drm/nouveau/nouveau_bo0039.c b/drivers/gpu/drm/nouveau/nouveau_bo0039.c
> index e2ce44adaa5c..41197312f82f 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_bo0039.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_bo0039.c
> @@ -49,9 +49,9 @@ nv04_bo_move_m2mf(struct nouveau_channel *chan, struct ttm_buffer_object *bo,
>   {
>   	struct nvif_push *push = chan->chan.push;
>   	u32 src_ctxdma = nouveau_bo_mem_ctxdma(bo, chan, old_reg);
> -	u32 src_offset = old_reg->start << PAGE_SHIFT;
> +	u32 src_offset = old_reg->start;
>   	u32 dst_ctxdma = nouveau_bo_mem_ctxdma(bo, chan, new_reg);
> -	u32 dst_offset = new_reg->start << PAGE_SHIFT;
> +	u32 dst_offset = new_reg->start;
>   	u32 page_count = PFN_UP(new_reg->size);
>   	int ret;
>   
> diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
> index 25f31d5169e5..d31cc3b069d8 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_mem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
> @@ -158,7 +158,7 @@ nouveau_mem_vram(struct ttm_resource *reg, bool contig, u8 page)
>   	}
>   	mutex_unlock(&drm->master.lock);
>   
> -	reg->start = mem->mem.addr >> PAGE_SHIFT;
> +	reg->start = mem->mem.addr;
>   	return ret;
>   }
>   
> @@ -197,8 +197,8 @@ nouveau_mem_intersects(struct ttm_resource *res,
>   	u32 num_pages = PFN_UP(size);
>   
>   	/* Don't evict BOs outside of the requested placement range */
> -	if (place->fpfn >= (res->start + num_pages) ||
> -	    (place->lpfn && place->lpfn <= res->start))
> +	if (place->fpfn >= ((res->start >> PAGE_SHIFT) + num_pages) ||
> +	    (place->lpfn && place->lpfn <= (res->start >> PAGE_SHIFT)))
>   		return false;
>   
>   	return true;
> @@ -211,8 +211,8 @@ nouveau_mem_compatible(struct ttm_resource *res,
>   {
>   	u32 num_pages = PFN_UP(size);
>   
> -	if (res->start < place->fpfn ||
> -	    (place->lpfn && (res->start + num_pages) > place->lpfn))
> +	if ((res->start >> PAGE_SHIFT) < place->fpfn ||
> +	    (place->lpfn && ((res->start >> PAGE_SHIFT) + num_pages) > place->lpfn))
>   		return false;
>   
>   	return true;
> diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> index 1469a88910e4..2127b98e033a 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
> @@ -145,7 +145,7 @@ nv04_gart_manager_new(struct ttm_resource_manager *man,
>   		return ret;
>   	}
>   
> -	(*res)->start = mem->vma[0].addr >> PAGE_SHIFT;
> +	(*res)->start = mem->vma[0].addr;
>   	return 0;
>   }
>   
> diff --git a/drivers/gpu/drm/nouveau/nv17_fence.c b/drivers/gpu/drm/nouveau/nv17_fence.c
> index 07c2e0878c24..b6567e5f769c 100644
> --- a/drivers/gpu/drm/nouveau/nv17_fence.c
> +++ b/drivers/gpu/drm/nouveau/nv17_fence.c
> @@ -79,7 +79,7 @@ nv17_fence_context_new(struct nouveau_channel *chan)
>   	struct nv10_fence_priv *priv = chan->drm->fence;
>   	struct ttm_resource *reg = priv->bo->bo.resource;
>   	struct nv10_fence_chan *fctx;
> -	u32 start = reg->start * PAGE_SIZE;
> +	u32 start = reg->start;
>   	u32 limit = start + priv->bo->bo.base.size - 1;
>   	int ret = 0;
>   
> diff --git a/drivers/gpu/drm/nouveau/nv50_fence.c b/drivers/gpu/drm/nouveau/nv50_fence.c
> index ea1e1f480bfe..c3f1df834bb9 100644
> --- a/drivers/gpu/drm/nouveau/nv50_fence.c
> +++ b/drivers/gpu/drm/nouveau/nv50_fence.c
> @@ -38,7 +38,7 @@ nv50_fence_context_new(struct nouveau_channel *chan)
>   	struct nv10_fence_priv *priv = chan->drm->fence;
>   	struct nv10_fence_chan *fctx;
>   	struct ttm_resource *reg = priv->bo->bo.resource;
> -	u32 start = reg->start * PAGE_SIZE;
> +	u32 start = reg->start;
>   	u32 limit = start + priv->bo->bo.base.size - 1;
>   	int ret;
>   
> diff --git a/drivers/gpu/drm/qxl/qxl_drv.h b/drivers/gpu/drm/qxl/qxl_drv.h
> index ea993d7162e8..994996e6a623 100644
> --- a/drivers/gpu/drm/qxl/qxl_drv.h
> +++ b/drivers/gpu/drm/qxl/qxl_drv.h
> @@ -289,7 +289,7 @@ qxl_bo_physical_address(struct qxl_device *qdev, struct qxl_bo *bo,
>   
>          /* TODO - need to hold one of the locks to read bo->tbo.resource->start */
>   
> -	return slot->high_bits | ((bo->tbo.resource->start << PAGE_SHIFT) + offset);
> +	return slot->high_bits | (bo->tbo.resource->start + offset);
>   }
>   
>   /* qxl_display.c */
> diff --git a/drivers/gpu/drm/qxl/qxl_object.c b/drivers/gpu/drm/qxl/qxl_object.c
> index 06a58dad5f5c..657b9995f4f6 100644
> --- a/drivers/gpu/drm/qxl/qxl_object.c
> +++ b/drivers/gpu/drm/qxl/qxl_object.c
> @@ -220,7 +220,7 @@ void *qxl_bo_kmap_atomic_page(struct qxl_device *qdev,
>   	else
>   		goto fallback;
>   
> -	offset = bo->tbo.resource->start << PAGE_SHIFT;
> +	offset = bo->tbo.resource->start;
>   	return io_mapping_map_atomic_wc(map, offset + page_offset);
>   fallback:
>   	if (bo->kptr) {
> diff --git a/drivers/gpu/drm/qxl/qxl_ttm.c b/drivers/gpu/drm/qxl/qxl_ttm.c
> index a92a5b0d4c25..31f96c7d89b4 100644
> --- a/drivers/gpu/drm/qxl/qxl_ttm.c
> +++ b/drivers/gpu/drm/qxl/qxl_ttm.c
> @@ -81,13 +81,12 @@ int qxl_ttm_io_mem_reserve(struct ttm_device *bdev,
>   		return 0;
>   	case TTM_PL_VRAM:
>   		mem->bus.is_iomem = true;
> -		mem->bus.offset = (mem->start << PAGE_SHIFT) + qdev->vram_base;
> +		mem->bus.offset = mem->start + qdev->vram_base;
>   		mem->bus.caching = ttm_write_combined;
>   		break;
>   	case TTM_PL_PRIV:
>   		mem->bus.is_iomem = true;
> -		mem->bus.offset = (mem->start << PAGE_SHIFT) +
> -			qdev->surfaceram_base;
> +		mem->bus.offset = mem->start + qdev->surfaceram_base;
>   		mem->bus.caching = ttm_write_combined;
>   		break;
>   	default:
> diff --git a/drivers/gpu/drm/radeon/radeon_object.c b/drivers/gpu/drm/radeon/radeon_object.c
> index 10c0fbd9d2b4..83d50c72aeeb 100644
> --- a/drivers/gpu/drm/radeon/radeon_object.c
> +++ b/drivers/gpu/drm/radeon/radeon_object.c
> @@ -588,7 +588,7 @@ int radeon_bo_get_surface_reg(struct radeon_bo *bo)
>   
>   out:
>   	radeon_set_surface_reg(rdev, i, bo->tiling_flags, bo->pitch,
> -			       bo->tbo.resource->start << PAGE_SHIFT,
> +			       bo->tbo.resource->start,
>   			       bo->tbo.base.size);
>   	return 0;
>   }
> @@ -738,7 +738,7 @@ vm_fault_t radeon_bo_fault_reserve_notify(struct ttm_buffer_object *bo)
>   		return 0;
>   
>   	size = bo->resource->size;
> -	offset = bo->resource->start << PAGE_SHIFT;
> +	offset = bo->resource->start;
>   	if ((offset + size) <= rdev->mc.visible_vram_size)
>   		return 0;
>   
> @@ -760,7 +760,7 @@ vm_fault_t radeon_bo_fault_reserve_notify(struct ttm_buffer_object *bo)
>   		radeon_ttm_placement_from_domain(rbo, RADEON_GEM_DOMAIN_GTT);
>   		r = ttm_bo_validate(bo, &rbo->placement, &ctx);
>   	} else if (likely(!r)) {
> -		offset = bo->resource->start << PAGE_SHIFT;
> +		offset = bo->resource->start;
>   		/* this should never happen */
>   		if ((offset + size) > rdev->mc.visible_vram_size)
>   			return VM_FAULT_SIGBUS;
> diff --git a/drivers/gpu/drm/radeon/radeon_object.h b/drivers/gpu/drm/radeon/radeon_object.h
> index 0a6ef49e990a..6e0002e08c57 100644
> --- a/drivers/gpu/drm/radeon/radeon_object.h
> +++ b/drivers/gpu/drm/radeon/radeon_object.h
> @@ -104,7 +104,7 @@ static inline u64 radeon_bo_gpu_offset(struct radeon_bo *bo)
>   		break;
>   	}
>   
> -	return (bo->tbo.resource->start << PAGE_SHIFT) + start;
> +	return bo->tbo.resource->start + start;
>   }
>   
>   static inline unsigned long radeon_bo_size(struct radeon_bo *bo)
> diff --git a/drivers/gpu/drm/radeon/radeon_ttm.c b/drivers/gpu/drm/radeon/radeon_ttm.c
> index 67075c85f847..777d38b211d2 100644
> --- a/drivers/gpu/drm/radeon/radeon_ttm.c
> +++ b/drivers/gpu/drm/radeon/radeon_ttm.c
> @@ -104,7 +104,7 @@ static void radeon_evict_flags(struct ttm_buffer_object *bo,
>   		if (rbo->rdev->ring[radeon_copy_ring_index(rbo->rdev)].ready == false)
>   			radeon_ttm_placement_from_domain(rbo, RADEON_GEM_DOMAIN_CPU);
>   		else if (rbo->rdev->mc.visible_vram_size < rbo->rdev->mc.real_vram_size &&
> -			 bo->resource->start < (rbo->rdev->mc.visible_vram_size >> PAGE_SHIFT)) {
> +			 bo->resource->start < rbo->rdev->mc.visible_vram_size) {
>   			unsigned fpfn = rbo->rdev->mc.visible_vram_size >> PAGE_SHIFT;
>   			int i;
>   
> @@ -149,8 +149,8 @@ static int radeon_move_blit(struct ttm_buffer_object *bo,
>   
>   	rdev = radeon_get_rdev(bo->bdev);
>   	ridx = radeon_copy_ring_index(rdev);
> -	old_start = (u64)old_mem->start << PAGE_SHIFT;
> -	new_start = (u64)new_mem->start << PAGE_SHIFT;
> +	old_start = (u64)old_mem->start;
> +	new_start = (u64)new_mem->start;
>   
>   	switch (old_mem->mem_type) {
>   	case TTM_PL_VRAM:
> @@ -274,15 +274,14 @@ static int radeon_ttm_io_mem_reserve(struct ttm_device *bdev, struct ttm_resourc
>   #if IS_ENABLED(CONFIG_AGP)
>   		if (rdev->flags & RADEON_IS_AGP) {
>   			/* RADEON_IS_AGP is set only if AGP is active */
> -			mem->bus.offset = (mem->start << PAGE_SHIFT) +
> -				rdev->mc.agp_base;
> +			mem->bus.offset = mem->start + rdev->mc.agp_base;
>   			mem->bus.is_iomem = !rdev->agp->cant_use_aperture;
>   			mem->bus.caching = ttm_write_combined;
>   		}
>   #endif
>   		break;
>   	case TTM_PL_VRAM:
> -		mem->bus.offset = mem->start << PAGE_SHIFT;
> +		mem->bus.offset = mem->start;
>   		/* check if it's visible */
>   		if ((mem->bus.offset + bus_size) > rdev->mc.visible_vram_size)
>   			return -EINVAL;
> @@ -443,7 +442,7 @@ static int radeon_ttm_backend_bind(struct ttm_device *bdev,
>   		flags &= ~RADEON_GART_PAGE_WRITE;
>   	}
>   
> -	gtt->offset = (unsigned long)(bo_mem->start << PAGE_SHIFT);
> +	gtt->offset = (unsigned long)bo_mem->start;
>   	if (!ttm->num_pages) {
>   		WARN(1, "nothing to bind %u pages for mreg %p back %p!\n",
>   		     ttm->num_pages, bo_mem, ttm);
> diff --git a/drivers/gpu/drm/radeon/radeon_vm.c b/drivers/gpu/drm/radeon/radeon_vm.c
> index 987cabbf1318..27ba2f6c4ac5 100644
> --- a/drivers/gpu/drm/radeon/radeon_vm.c
> +++ b/drivers/gpu/drm/radeon/radeon_vm.c
> @@ -945,7 +945,7 @@ int radeon_vm_bo_update(struct radeon_device *rdev,
>   		bo_va->flags &= ~RADEON_VM_PAGE_WRITEABLE;
>   
>   	if (mem) {
> -		addr = (u64)mem->start << PAGE_SHIFT;
> +		addr = (u64)mem->start;
>   		if (mem->mem_type != TTM_PL_SYSTEM)
>   			bo_va->flags |= RADEON_VM_PAGE_VALID;
>   
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> index 9bf1f9d2f9b6..f58af9753ca1 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> @@ -200,7 +200,7 @@ int vmw_bo_pin_in_start_of_vram(struct vmw_private *dev_priv,
>   	 * that situation.
>   	 */
>   	if (bo->resource->mem_type == TTM_PL_VRAM &&
> -	    bo->resource->start < PFN_UP(bo->resource->size) &&
> +	    bo->resource->start < bo->resource->size &&
>   	    bo->resource->start > 0 &&
>   	    buf->base.pin_count == 0) {
>   		ctx.interruptible = false;
> @@ -263,7 +263,7 @@ void vmw_bo_get_guest_ptr(const struct ttm_buffer_object *bo,
>   {
>   	if (bo->resource->mem_type == TTM_PL_VRAM) {
>   		ptr->gmrId = SVGA_GMR_FRAMEBUFFER;
> -		ptr->offset = bo->resource->start << PAGE_SHIFT;
> +		ptr->offset = bo->resource->start;
>   	} else {
>   		ptr->gmrId = bo->resource->start;
>   		ptr->offset = 0;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c
> index 162dfeb1cc5a..4883f8fc71f2 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cmd.c
> @@ -584,7 +584,7 @@ static int vmw_cmd_emit_dummy_legacy_query(struct vmw_private *dev_priv,
>   
>   	if (bo->resource->mem_type == TTM_PL_VRAM) {
>   		cmd->body.guestResult.gmrId = SVGA_GMR_FRAMEBUFFER;
> -		cmd->body.guestResult.offset = bo->resource->start << PAGE_SHIFT;
> +		cmd->body.guestResult.offset = bo->resource->start;
>   	} else {
>   		cmd->body.guestResult.gmrId = bo->resource->start;
>   		cmd->body.guestResult.offset = 0;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> index 9359e8dfbac2..c882990ac361 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> @@ -3755,7 +3755,7 @@ static void vmw_apply_relocations(struct vmw_sw_context *sw_context)
>   		bo = &reloc->vbo->base;
>   		switch (bo->resource->mem_type) {
>   		case TTM_PL_VRAM:
> -			reloc->location->offset += bo->resource->start << PAGE_SHIFT;
> +			reloc->location->offset += bo->resource->start;
>   			reloc->location->gmrId = SVGA_GMR_FRAMEBUFFER;
>   			break;
>   		case VMW_PL_GMR:
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> index 856a352a72a6..3b3cb872858b 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_ttm_buffer.c
> @@ -543,8 +543,7 @@ static int vmw_ttm_io_mem_reserve(struct ttm_device *bdev, struct ttm_resource *
>   	case VMW_PL_MOB:
>   		return 0;
>   	case TTM_PL_VRAM:
> -		mem->bus.offset = (mem->start << PAGE_SHIFT) +
> -			dev_priv->vram_start;
> +		mem->bus.offset = mem->start + dev_priv->vram_start;
>   		mem->bus.is_iomem = true;
>   		mem->bus.caching = ttm_cached;
>   		break;

