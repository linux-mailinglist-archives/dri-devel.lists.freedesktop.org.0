Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03EBD876508
	for <lists+dri-devel@lfdr.de>; Fri,  8 Mar 2024 14:21:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE55810EF82;
	Fri,  8 Mar 2024 13:21:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=amd.com header.i=@amd.com header.b="4U+Jos+l";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2052.outbound.protection.outlook.com [40.107.223.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC27010EA22;
 Fri,  8 Mar 2024 13:21:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hp5/PE6vjRv3dmqFOhguriI+fdtD55/jbl00PT9w79aheJ3OWv9zLUF+eI5xOhr7hWZZcOofhhJId7QxucpD8YkiVH7JZ/GU9OeJgCT9/zH7d6AsHMShMBpoVcIx5lbZ+rmTgcxllV9Ap0bwhkACNXyFWu4sXs/Q7J/mV/qOE5Z1kqcKHQjOSIsOa/7FgntA+osFGPySuKyl/1bAq0AmvjozFRD8VRbNG4ZPWzDwJfcne7JFYsgzLCapoE8Io2aWrjX+pX5mQVqajN8dek2oStF+lLtyKrp13BkOlUGwy09Du/a/KB3iP6mKqC/WXbRtxwCiCemYmQUuyLNBDnm9xA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jmDfDskDJNfu78q/UsXMKipP0B+vFsSfhvCAjovBvaM=;
 b=iA0C0myVdxVX3N0F9tn5om5GubysOZnUz/Ex79Aqzw/iI87h7ZeOE6qeeuw0lv4BiRlVYe8ary9gKWO1rk8+XvBxjzYLqo6U1wc3fcOOarcm8RT22RLAStU2/fot8xlcrBiXG4bmPAp8vzYE7xmMI4embGChPgKoJXzEt3p9erH+FdeHabuQrb1k9LPhpm9pjAVG5nb4sfplomV9Bx5dZSdPqa9awnD4HWsNTaqu16cmgKDPBraXd7ZaYm7/8+eN6b8c/JH2qC9tk1MEpmqWAMwdBB1QPevAZBcakmKbu0IOgjpbNunMTDXudeKckHVpjtnXPMzV9vMHoCnS3ia6vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jmDfDskDJNfu78q/UsXMKipP0B+vFsSfhvCAjovBvaM=;
 b=4U+Jos+l9rscT8CSKaS3Sw+Pi4/z8iDIZWsPgxlmAmkgwOo6mExJ4GlMQDXA1pQGzGxhU3/murRrqMD+iTnpOg8sR0LT6jKHTXd8f37+yf/Rcd8mHOiVgx4gi2Z/hi6b3+FiyyR3pbMWo+5BjIPOU+79RCOpyZ5IzIKnx61YjMY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3897.namprd12.prod.outlook.com (2603:10b6:5:1ca::24)
 by DM4PR12MB6351.namprd12.prod.outlook.com (2603:10b6:8:a2::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7339.41; Fri, 8 Mar 2024 13:21:04 +0000
Received: from DM6PR12MB3897.namprd12.prod.outlook.com
 ([fe80::42d0:ec1:3bfa:d3df]) by DM6PR12MB3897.namprd12.prod.outlook.com
 ([fe80::42d0:ec1:3bfa:d3df%7]) with mapi id 15.20.7362.030; Fri, 8 Mar 2024
 13:21:03 +0000
Message-ID: <40fd8ad3-c63f-ce79-461c-519d273c2d36@amd.com>
Date: Fri, 8 Mar 2024 18:50:54 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH v4 2/4] drm/ttm: Use LRU hitches
Content-Language: en-US
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-xe@lists.freedesktop.org, intel-gfx@lists.freedesktop.org
Cc: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>,
 dri-devel@lists.freedesktop.org
References: <20240306070125.27071-1-thomas.hellstrom@linux.intel.com>
 <20240306070125.27071-3-thomas.hellstrom@linux.intel.com>
From: "Somalapuram, Amaranath" <asomalap@amd.com>
In-Reply-To: <20240306070125.27071-3-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: PN3PR01CA0008.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:95::20) To DM6PR12MB3897.namprd12.prod.outlook.com
 (2603:10b6:5:1ca::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3897:EE_|DM4PR12MB6351:EE_
X-MS-Office365-Filtering-Correlation-Id: f8f99e19-a779-4128-80f1-08dc3f729ab8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lPylJBPf4vJ7/z1ackUR/1vphnKS3/K5rjqCtsiPT46OWdQcEn6UUlKXpJKiwLs8y2wyT4jQAa/sdB+4JJC1HqPW261vSnv4bs5VVidXUUgKP26NLNiWExk95GfyFonL2CeHUcaAZNFBKJunxg1/ppsJ4f/JXkBgRWX+Ayp01ZaVxvJyty8zTS+jFjLPb8h2yICfo9SkABwxtYtkrdhYTWTKmbj3H5OwfLryaoHll0C9GO9Li29aAt/UGmf/75jPdmRC8aswuvZSVDOnyRRU7KnaiZeGLX0fzAFOYTZgrWlKa8bWEA5DAoExgQ7NUlkP0XWlrP3bUOOnGcOG1IU4JuOfI9qAmC3/J21BV9NFFxDKccKrCysg8cWg6TTEnOgCxBaa3tQalb/UodUgUjawdbK7vftDVdjMt1s1R5203tal8JgzIUBgYOELh88VNtd5ZR4O/0Uiji7DR03+xDQiycKi4BHJINBlOpe6GNMIVoG1Uhd1OQuQEd+nCEDmj/2JMmW20fjgXyCvzpXGRp/iL+I94PYWc0gyWInd4RQk6CM3kOM/KVPsh3XHqAPgyBx9UksN/DhVDUnmjcCE/3RbCZM/gufUT6xs/cLxlIehVOEjeiJnmSrbbcbWixLIvHhKW74FLtht7rGGg0OYwXcbOCmUmz2ATNjHBw05FiSGsMQ=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3897.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGZ6aDVxUEFJWWxYV3BONDh4VVhHMjRkK0JPekYreS80cEdWeGZoRTFJUGFs?=
 =?utf-8?B?WEwvdlF0OTY5cFhxYVBSOFloeGtMMGxEYW5sK0JsaUdYNDZhL0pyLzh6VWp1?=
 =?utf-8?B?dUFyUGs4TXB5eEptSVdSQlAxS1hqMHIwSk9WU2hXSmh6eUFJYWt1T0wyNDhx?=
 =?utf-8?B?c0tPMytOemlwM1p6a2NaNDlKd0piaC90NUxkSUFTS0YrOWZmeGwrNEJsSHBX?=
 =?utf-8?B?S1RzWTBrc0xyUjU2UXV3WUFYUENOQ3VWcml4QitPUzVLK1pEYmxwcDFlNGcw?=
 =?utf-8?B?eWVzSEE0Yld3Y2ZQeHdDRi9BMWE5dXZVWUFzSjBqWFhlMzZReDd5blJ3cWdN?=
 =?utf-8?B?MWZqMTVlT2dKVTVHcnY3T1VJTzZxTUVVdkFGYmdwZTI5bUxEYkIwajJLS3NO?=
 =?utf-8?B?RHd4MnRtYjRGc1VDT3Vxc2pqdld4RlVaQzNOV25qWlhxTCtFdUowemd4VkpE?=
 =?utf-8?B?L2cvYkVEaTl0R0Q2SnFVV1FobDRQWjBCMVNRNnBxOHBWNUlwT0pQMWJ2QnFx?=
 =?utf-8?B?Z2ZabDZuNDZ6SzRJdFgrQ2xlcWFKMjBWdG5lUy96eVF6VzlpV3NVYmp2eVhZ?=
 =?utf-8?B?RUMrVnpqbi9Pdm1FdWY2UFFMbVp2WUhNYzRUcVlsZG9YTlZCb25WMUx2R1d1?=
 =?utf-8?B?OHdFallaRkJIc1V5c085aDZnYXp5MWJ2VmxYeER4R3RLWUovNXB1aEFtUjlR?=
 =?utf-8?B?a3ZmY1RkR3ArRlZMU0lCUGRNS3lYczhnQjdNb25iTHlwYWRTaDRraWo0cDgz?=
 =?utf-8?B?VHhEKytRUDdtcmdMZWlZRWpZNldHYTFtSFJVWmpyZk0zSDA0U29tR3JVRkNB?=
 =?utf-8?B?bDNrMXNTaGlzT0w0a0UxWWVaRUdHRXRFVmptVjBiTG9WbU5qU0RuNFFNVXgv?=
 =?utf-8?B?STZvSy8zL0k0K3FDcnZWZlhOSVJPeGJjTUNTM1ZMTkkvZ09UTG9GK1lsYTU3?=
 =?utf-8?B?cEhqZGQ5NDh4TVpTemVQdUJ3RGdlS0ZjNkU1ckxRWmZ6ekJzZERJYmFkY0RW?=
 =?utf-8?B?T1Bxc3NTWUN6eVNhMlRsVkR4bjhlcit2ems2MlBsL2paMnorTTdabitxdlUz?=
 =?utf-8?B?VTN2bnl1ZzdOcnNueVYzRmx4S0RaYktGMWZZMW9jMmhpaVRUQmttYXFaVVF6?=
 =?utf-8?B?R296czFQVjY4UGxBbUJCOXNtS1hyYlNKKzlZQlR3NDRic1orRUxMTVJMYzlT?=
 =?utf-8?B?NGY3dXRMazB3bVQvdGFiM1FtQWsvMUNaS2JJSEQwTEpMczlsR2ttcnRETWhs?=
 =?utf-8?B?TW1HVnlDOFpSUkRlN1VQQ0JkU0N4aGlQT1NqTDdodk9FNHo0MXVDSElhU3hn?=
 =?utf-8?B?cnlJbytqT2pvTDV5SWh0NUdYeGFuaFFwYk5kUksxaWx6SFBaOFFzSVNsTnJm?=
 =?utf-8?B?WEJTV29qbU9QYmV4WU95WnlndGhZQlROcUoxRGphL2dpazVsV3VKT25yRUkz?=
 =?utf-8?B?Wlk3QlZSaTlUdzl2Z1UzOHRhaTJKTjcxUUJpQkpQb3g3YkdqS25NcU1pb0E1?=
 =?utf-8?B?Y3VxRkExQnBBZXZ2Z1c5VE52Nk1CWEo2VkwvbGFXNXZKOEdqOXFEaVZFTkpx?=
 =?utf-8?B?amtxWXRDSzVLbjlhMzNPSERNcXRVV1JMOTdxUlg0UFdSYnU5NXlvbUxaYVpC?=
 =?utf-8?B?Y3BnQ01ZNXpmZGZramtYbWZmR2lnendOUVlwNUdBREZic24vMldYUEI3cEZ6?=
 =?utf-8?B?Y0ZWbjJpcmMxanI0VDAxTm5PY2VybFlsS25oSmVuZExteG94WVpRUUxoTFpS?=
 =?utf-8?B?b3M3aVFIcWc2UHZ2dzdacTBUSXNYNVB5c20xZU9KbFZFS2NOeFI5V1BHOFZy?=
 =?utf-8?B?d1RKVVBETVNKWXJjVXNIeDhqU3hraHhvMzgvSEVTT3pKcE9OMkcxcThHTFVq?=
 =?utf-8?B?akM0ZHljOWlhUkJ0d2UxQU1xL1A4empsSmJnU1RKT3UwSWJkVTc2VlFNNmpt?=
 =?utf-8?B?NEFJbmVTWjJicWtaaFRlSmtvc3dZcjZUVWdHQWhNYVRkdi9kZWtkOUdCbjE3?=
 =?utf-8?B?VHpwcHozQWdSanhmNXFJVXJwbGppM1ZRcFhtZGliYmg5SXZPcjRPRWxjUm9Y?=
 =?utf-8?B?Y2hwZW5lc1FETEZWaWdHelZGR1M2R0hEdkdvcVZML1dvUTlDL05VMzhod1lO?=
 =?utf-8?Q?pwx2Kt1Xfh+Kvg59BjSaFzvAy?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8f99e19-a779-4128-80f1-08dc3f729ab8
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3897.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Mar 2024 13:21:03.7878 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MkRMoiu/OY3nVZuhqQzbcAFd05+Mm+ZwDDfXcRJcRimBdOq9FWUx80TE3WNLCYO4EAKuDtj+y96bt4BcBmBYpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6351
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


On 3/6/2024 12:31 PM, Thomas Hellström wrote:
> Have iterators insert themselves into the list they are iterating
> over using hitch list nodes. Since only the iterator owner
> can remove these list nodes from the list, it's safe to unlock
> the list and when continuing, use them as a starting point. Due to
> the way LRU bumping works in TTM, newly added items will not be
> missed, and bumped items will be iterated over a second time before
> reaching the end of the list.
>
> The exception is list with bulk move sublists. When bumping a
> sublist, a hitch that is part of that sublist will also be moved
> and we might miss items if restarting from it. This will be
> addressed in a later patch.
>
> v2:
> - Updated ttm_resource_cursor_fini() documentation.
>
> Cc: Christian König <christian.koenig@amd.com>
> Cc: Somalapuram Amaranath <Amaranath.Somalapuram@amd.com>
> Cc: <dri-devel@lists.freedesktop.org>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo.c       |  1 +
>   drivers/gpu/drm/ttm/ttm_device.c   |  9 ++-
>   drivers/gpu/drm/ttm/ttm_resource.c | 94 ++++++++++++++++++++----------
>   include/drm/ttm/ttm_resource.h     | 16 +++--
>   4 files changed, 82 insertions(+), 38 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo.c b/drivers/gpu/drm/ttm/ttm_bo.c
> index e059b1e1b13b..b6f75a0ff2e5 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo.c
> @@ -622,6 +622,7 @@ int ttm_mem_evict_first(struct ttm_device *bdev,
>   		if (locked)
>   			dma_resv_unlock(res->bo->base.resv);
>   	}
> +	ttm_resource_cursor_fini_locked(&cursor);
>   
>   	if (!bo) {
>   		if (busy_bo && !ttm_bo_get_unless_zero(busy_bo))
> diff --git a/drivers/gpu/drm/ttm/ttm_device.c b/drivers/gpu/drm/ttm/ttm_device.c
> index f27406e851e5..e8a6a1dab669 100644
> --- a/drivers/gpu/drm/ttm/ttm_device.c
> +++ b/drivers/gpu/drm/ttm/ttm_device.c
> @@ -169,12 +169,17 @@ int ttm_device_swapout(struct ttm_device *bdev, struct ttm_operation_ctx *ctx,
>   			num_pages = PFN_UP(bo->base.size);
>   			ret = ttm_bo_swapout(bo, ctx, gfp_flags);
>   			/* ttm_bo_swapout has dropped the lru_lock */
> -			if (!ret)
> +			if (!ret) {
> +				ttm_resource_cursor_fini(&cursor);

is spin_unlock(&bdev->lru_lock) missing ?

>   				return num_pages;
> -			if (ret != -EBUSY)
> +			}
> +			if (ret != -EBUSY) {
> +				ttm_resource_cursor_fini(&cursor);

is spin_unlock(&bdev->lru_lock) missing ?

Regards,
S.Amarnath
>   				return ret;
> +			}
>   		}
>   	}
> +	ttm_resource_cursor_fini_locked(&cursor);
>   	spin_unlock(&bdev->lru_lock);
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index ee1865f82cb4..971014fca10a 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -32,6 +32,37 @@
>   
>   #include <drm/drm_util.h>
>   
> +/**
> + * ttm_resource_cursor_fini_locked() - Finalize the LRU list cursor usage
> + * @cursor: The struct ttm_resource_cursor to finalize.
> + *
> + * The function pulls the LRU list cursor off any lists it was previusly
> + * attached to. Needs to be called with the LRU lock held. The function
> + * can be called multiple times after eachother.
> + */
> +void ttm_resource_cursor_fini_locked(struct ttm_resource_cursor *cursor)
> +{
> +	lockdep_assert_held(&cursor->man->bdev->lru_lock);
> +	list_del_init(&cursor->hitch.link);
> +}
> +
> +/**
> + * ttm_resource_cursor_fini() - Finalize the LRU list cursor usage
> + * @cursor: The struct ttm_resource_cursor to finalize.
> + *
> + * The function pulls the LRU list cursor off any lists it was previusly
> + * attached to. Needs to be called without the LRU list lock held. The
> + * function can be called multiple times after eachother.
> + */
> +void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor)
> +{
> +	spinlock_t *lru_lock = &cursor->man->bdev->lru_lock;
> +
> +	spin_lock(lru_lock);
> +	ttm_resource_cursor_fini_locked(cursor);
> +	spin_unlock(lru_lock);
> +}
> +
>   /**
>    * ttm_lru_bulk_move_init - initialize a bulk move structure
>    * @bulk: the structure to init
> @@ -483,62 +514,63 @@ void ttm_resource_manager_debug(struct ttm_resource_manager *man,
>   EXPORT_SYMBOL(ttm_resource_manager_debug);
>   
>   /**
> - * ttm_resource_manager_first
> - *
> - * @man: resource manager to iterate over
> + * ttm_resource_manager_next() - Continue iterating over the resource manager
> + * resources
>    * @cursor: cursor to record the position
>    *
> - * Returns the first resource from the resource manager.
> + * Return: The next resource from the resource manager.
>    */
>   struct ttm_resource *
> -ttm_resource_manager_first(struct ttm_resource_manager *man,
> -			   struct ttm_resource_cursor *cursor)
> +ttm_resource_manager_next(struct ttm_resource_cursor *cursor)
>   {
> +	struct ttm_resource_manager *man = cursor->man;
>   	struct ttm_lru_item *lru;
>   
>   	lockdep_assert_held(&man->bdev->lru_lock);
>   
> -	for (cursor->priority = 0; cursor->priority < TTM_MAX_BO_PRIORITY;
> -	     ++cursor->priority)
> -		list_for_each_entry(lru, &man->lru[cursor->priority], link) {
> -			if (ttm_lru_item_is_res(lru))
> +	do {
> +		lru = &cursor->hitch;
> +		list_for_each_entry_continue(lru, &man->lru[cursor->priority], link) {
> +			if (ttm_lru_item_is_res(lru)) {
> +				list_move(&cursor->hitch.link, &lru->link);
>   				return ttm_lru_item_to_res(lru);
> +			}
>   		}
>   
> +		if (++cursor->priority >= TTM_MAX_BO_PRIORITY)
> +			break;
> +
> +		list_move(&cursor->hitch.link, &man->lru[cursor->priority]);
> +	} while (true);
> +
> +	list_del_init(&cursor->hitch.link);
> +
>   	return NULL;
>   }
>   
>   /**
> - * ttm_resource_manager_next
> - *
> + * ttm_resource_manager_first() - Start iterating over the resources
> + * of a resource manager
>    * @man: resource manager to iterate over
>    * @cursor: cursor to record the position
> - * @res: the current resource pointer
>    *
> - * Returns the next resource from the resource manager.
> + * Initializes the cursor and starts iterating. When done iterating,
> + * the caller must explicitly call ttm_resource_cursor_fini().
> + *
> + * Return: The first resource from the resource manager.
>    */
>   struct ttm_resource *
> -ttm_resource_manager_next(struct ttm_resource_manager *man,
> -			  struct ttm_resource_cursor *cursor,
> -			  struct ttm_resource *res)
> +ttm_resource_manager_first(struct ttm_resource_manager *man,
> +			   struct ttm_resource_cursor *cursor)
>   {
> -	struct ttm_lru_item *lru = &res->lru;
> -
>   	lockdep_assert_held(&man->bdev->lru_lock);
>   
> -	list_for_each_entry_continue(lru, &man->lru[cursor->priority], link) {
> -		if (ttm_lru_item_is_res(lru))
> -			return ttm_lru_item_to_res(lru);
> -	}
> +	cursor->priority = 0;
> +	cursor->man = man;
> +	ttm_lru_item_init(&cursor->hitch, TTM_LRU_HITCH);
> +	list_move(&cursor->hitch.link, &man->lru[cursor->priority]);
>   
> -	for (++cursor->priority; cursor->priority < TTM_MAX_BO_PRIORITY;
> -	     ++cursor->priority)
> -		list_for_each_entry(lru, &man->lru[cursor->priority], link) {
> -			if (ttm_lru_item_is_res(lru))
> -				ttm_lru_item_to_res(lru);
> -		}
> -
> -	return NULL;
> +	return ttm_resource_manager_next(cursor);
>   }
>   
>   static void ttm_kmap_iter_iomap_map_local(struct ttm_kmap_iter *iter,
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> index cad8c5476198..b9043c183205 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -271,15 +271,23 @@ ttm_lru_item_to_res(struct ttm_lru_item *item)
>   
>   /**
>    * struct ttm_resource_cursor
> - *
> + * @man: The resource manager currently being iterated over
> + * @hitch: A hitch list node inserted before the next resource
> + * to iterate over.
>    * @priority: the current priority
>    *
>    * Cursor to iterate over the resources in a manager.
>    */
>   struct ttm_resource_cursor {
> +	struct ttm_resource_manager *man;
> +	struct ttm_lru_item hitch;
>   	unsigned int priority;
>   };
>   
> +void ttm_resource_cursor_fini_locked(struct ttm_resource_cursor *cursor);
> +
> +void ttm_resource_cursor_fini(struct ttm_resource_cursor *cursor);
> +
>   /**
>    * struct ttm_lru_bulk_move_pos
>    *
> @@ -435,9 +443,7 @@ struct ttm_resource *
>   ttm_resource_manager_first(struct ttm_resource_manager *man,
>   			   struct ttm_resource_cursor *cursor);
>   struct ttm_resource *
> -ttm_resource_manager_next(struct ttm_resource_manager *man,
> -			  struct ttm_resource_cursor *cursor,
> -			  struct ttm_resource *res);
> +ttm_resource_manager_next(struct ttm_resource_cursor *cursor);
>   
>   /**
>    * ttm_resource_manager_for_each_res - iterate over all resources
> @@ -449,7 +455,7 @@ ttm_resource_manager_next(struct ttm_resource_manager *man,
>    */
>   #define ttm_resource_manager_for_each_res(man, cursor, res)		\
>   	for (res = ttm_resource_manager_first(man, cursor); res;	\
> -	     res = ttm_resource_manager_next(man, cursor, res))
> +	     res = ttm_resource_manager_next(cursor))
>   
>   struct ttm_kmap_iter *
>   ttm_kmap_iter_iomap_init(struct ttm_kmap_iter_iomap *iter_io,
