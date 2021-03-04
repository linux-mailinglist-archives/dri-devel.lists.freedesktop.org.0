Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DDFF32CDEB
	for <lists+dri-devel@lfdr.de>; Thu,  4 Mar 2021 08:48:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 383016EA03;
	Thu,  4 Mar 2021 07:48:13 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2058.outbound.protection.outlook.com [40.107.94.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCE156EA02;
 Thu,  4 Mar 2021 07:48:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lG/SDkZeWDYIQo57/2y7UZjVcUhonSLxp5Dvzn0ehSVldw2rsl26SXjBuvwAz6Gh4qlSLoDv0apaPeAOFfWXnUmZVbg6Oi/zTJmH+/doJqy7mwASpRkuwlB/t9JFKmPEQNpj6g1P4iYIjDxZqMfOhO78Z8b4AN6959nKVqXykRJc4prJgVMHs0Wwr7/BYsnA68II4f0eI2cDMCdA1dAF5I7URjJNVFuCE94CW4LAWok3icBrB2zUy1rji55UD22eSf9M2aWwzESyMF+xMast/0UbJdCsZ+33N+9V8wnsImeuL62lIQJViewiKVNIYRy3XN1J6dn2npGR8B0gh3SLFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y6mDwO/uoFvlqtIU6ayf6GSbyVdhjRavEFrnD+aLs4o=;
 b=H/JMNBwt0bu/ZV5IQwFaD+nNEzdSb7/5UAjtrWdT/ntUNH8PxODpLtc8C4yNoHMCP25x8yGzycbyttMEqmkV8xl71eje0cWH7FDrfAT+mZ5aSdqCjf0fPtOpG199JITtgcWdhcDzDKy5DOSnPTdhkbOb4JWWusX/8g1qtHwvwfz0I/efYDcjtqTu1TljQOt9a3rbbj9TFgJbDg6nsyvJB8ibYGD2Hc3bGjGnYK7ZxzFuPZDCD6MpIZCyGdW2p2YTp2vcT1qmLOHV2+c42jKf5ATFGsFlRnwjOT+siuaFSRhN8kDR8oxu7xd7rVoalu5WiO+KEQH49/FEy2piNqJoTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Y6mDwO/uoFvlqtIU6ayf6GSbyVdhjRavEFrnD+aLs4o=;
 b=ia0LjtrQp9xJQ03lJfDtpP+z7bobXMZrmjJKnwmq3655y5f9VSff8R2haW8BsZX/b9hoiJk8da5EmSfZxEC1LJMuOa3i2p7tW/qhZPnQajSpIXt+YlkpzfZZAhnJk5PshK6MehzuTo4MTd1mFyBW7EdEqiI42MrZyJog0Hjrvaw=
Authentication-Results: amd.com; dkim=none (message not signed)
 header.d=none;amd.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by MN2PR12MB4255.namprd12.prod.outlook.com (2603:10b6:208:198::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17; Thu, 4 Mar
 2021 07:48:06 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::c1ff:dcf1:9536:a1f2%2]) with mapi id 15.20.3912.017; Thu, 4 Mar 2021
 07:48:06 +0000
Subject: Re: [PATCH] drm/ttm: ioremap buffer according to TTM mem caching
 setting
To: Oak Zeng <Oak.Zeng@amd.com>, dri-devel@lists.freedesktop.org,
 amd-gfx@lists.freedesktop.org, brahma_sw_dev@amd.com
References: <1614805925-32431-1-git-send-email-Oak.Zeng@amd.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <eadf2818-2365-8b01-79a9-266bcde2f00d@amd.com>
Date: Thu, 4 Mar 2021 08:48:01 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <1614805925-32431-1-git-send-email-Oak.Zeng@amd.com>
Content-Language: en-US
X-Originating-IP: [2a02:908:1252:fb60:64f0:29b:e922:7ee4]
X-ClientProxiedBy: AM9P195CA0010.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:21f::15) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [IPv6:2a02:908:1252:fb60:64f0:29b:e922:7ee4]
 (2a02:908:1252:fb60:64f0:29b:e922:7ee4) by
 AM9P195CA0010.EURP195.PROD.OUTLOOK.COM (2603:10a6:20b:21f::15) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.3890.20 via Frontend Transport; Thu, 4 Mar 2021 07:48:04 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-HT: Tenant
X-MS-Office365-Filtering-Correlation-Id: d04f076a-ad7d-4d86-d6e7-08d8dee1d8ca
X-MS-TrafficTypeDiagnostic: MN2PR12MB4255:
X-LD-Processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR12MB42557ABF47081E6C15B7616B83979@MN2PR12MB4255.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CXvtRJ4Tb2pTpzoIEhK4ePblsYqfan82ntIzzjikr7Wup4x6agWL16mRSiW3cs8k729fFGqFvrCaALtOR8iPufMLrP2XKV+ZPJKRlHyGds94AadIxR3k5NqDn7K/HUq7yDUZJfls92AZiQ0t16dCVICTM3lWVhZYg1V9rU9p5M9mvFV6l89URA9OJx5c4iVLW9Dow7CmrppVdSNZDMGLIhX5g+XKcTR3kwTX9hWCzQmKfqdBH9Yg4q/5PuZvnmIO9cyAEQDinDAR2KLbjfNMVP7UvIp4b3xDMLbZPNhXMvv9HO+XdvvBKjnhZKsEh3BNMCasTfLtJKfYio3B/2Zi8t1cW4cMvFWl+l4lQzzVxov1+Zq4GqGXt7+L+H4QrPfVkRiFc8dguGYi4UUsgvEirxDgfEusMMuRD1iil/vaW4A+krYp1Uybn3+viHaa1/CdeL99ppBkDRs3jHIfwtdCJXRhQO7/055UK2hmH9uhZfeHKu6pE+64h4G2mWV/hrkXqbwzz3FsK1YQsI+zomo8HiVk6LpiPwLydAGlwl+8Cmmw0XySzj33JTGH9qOyEfbYEeypbM6qGVVbgSjPp9OK1lXJfdmgHuT5+tishJWgFgs=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(39860400002)(366004)(136003)(346002)(376002)(396003)(66946007)(6636002)(4326008)(8676002)(36756003)(450100002)(66556008)(6486002)(66476007)(316002)(6666004)(478600001)(86362001)(2616005)(31686004)(31696002)(52116002)(5660300002)(2906002)(186003)(8936002)(16526019)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?QjJoVzhMRjJ0SGhIanBmRHJvdHV4SHFyWXFBZ0tIT2xudFJpMlpqQlhmM2F3?=
 =?utf-8?B?cURUc1pySTU1NkIxb1oxSEpxdWV2T2syaklWaUVqNGdrQ1VNODk2Y0VJWSty?=
 =?utf-8?B?OXNPaURCTHV0MFlyVGRSMkRIRjNjVmRxY2lJWTVBZEdpN0ZwdFIrRTZ1aXQ2?=
 =?utf-8?B?YUhPVEZleFhHL3QxY1ZybDQxTCtITngyWG45Q3l5QlhCeDJ4akFqRS83Qk1W?=
 =?utf-8?B?cVhsTXlWazFzUzNlditHYlZTK3lLSnROMUUvTlYrWVoyYnNKSHNyVXljNUFp?=
 =?utf-8?B?dlpZZ1ZGQ1kvRXBEMDNGZStwa1RFeXpwUGNNclp0N0c0SlBaZjBST0hOYUl5?=
 =?utf-8?B?ei9naTFMUkdNZ1pyUHBYd3JzOEVSMjJZd2ZmSHpIL3VIVFZKOEYveTBrM3NL?=
 =?utf-8?B?citNeitKWG1xbzlWZGdzdzhTZkUvMlZ6UjY4RitCbEh4NTRUdHRaQ2FQOWRP?=
 =?utf-8?B?VUpPckpnZEI1R0UvWHljdmFGUTA4bWtKNVRkT3NIK1MxMkVyK1c3ZFI0S3kz?=
 =?utf-8?B?SzRNTnZ5d21YVVhSeEwrOVlacVlOUDRFQ3ptRTVtYmladU0wNUFXaWNRQVJN?=
 =?utf-8?B?SFozR1JGamk4Y214dzBmcVdiRUF3cVI3SXNCSTZ0SjVsNHhhUFBZd2F3S01Q?=
 =?utf-8?B?MUM4bUVITHZlNkI0MmNUWnYrVEY5RHAvZHVjVHhlL0RRV0E3dTh6TlU0T0ti?=
 =?utf-8?B?N3ppVGVxaytCRXlnRFpTV1BIUkxib1ZOeitjc0RkMVA1MFRqdkpMVFNKZXZC?=
 =?utf-8?B?d1RXVEhUdSs1SGdGaTIvTnJBUUk1QSs4K1RDUUZxZ2NQbTNlb3QxWWVsZmFD?=
 =?utf-8?B?c1ozRTFlY3ZZYno3ZkVuM0p3SU1GYzhXQ1d1aWsrSi9RUnR4dStjaWFmV0xV?=
 =?utf-8?B?cGhoUEp5akZkaEVxdVhTYWNFb1h3bG5DVTJCYlkwbnYwV3VNTkx3YitieEE5?=
 =?utf-8?B?U25lbmNGNG1NazZlenVHelBaZ3B6ZVBjRTV2bjF4Q1hNYXZ6b3BlU1pBNTJi?=
 =?utf-8?B?elV6YlRPL1FvY3pRNDRwUElzU0dCRG8zK2pBWDlaRURiSFVlUXBscktJY1V6?=
 =?utf-8?B?QUFMM24ydHBHdTlxTVlrSEpXWTl0NVJmK0J5Wjk4Sm5JbmJYNE9MeDBCOWwr?=
 =?utf-8?B?NkNscHhKaTJnRkpjZ0dWZnRkekp3aFdKQkhURSttV2hFdTlFdk4wOHd3bmpR?=
 =?utf-8?B?SysrTEZWNlFadk5OdkFERVFXVmE0Z3UyNEZreE5QVnFGNkYyRTNodHZjejla?=
 =?utf-8?B?KzNRNTJ0UTcyRVVQcVNhdENqZk42TzZmWUk5bGVHWk9BclQvUG9keTNyekx0?=
 =?utf-8?B?aUkzcDFoUm5WNUxPbVU1MDdUeThuOWdxSnJlZ1hxWFByYW85M0FRRk8rYlZL?=
 =?utf-8?B?NWd3RW56d3VHc2JNSDcyNzNFU0p2dFltUHpZSG9xWHdvcmVmQjQ4L2I0MlFF?=
 =?utf-8?B?aml4R3BaQ1pkZE1XVm83cm1xei8zdmNMNFBzSFR3bFJFT2V6NUVLYWdiVjZ6?=
 =?utf-8?B?YnV2Vk95WkJCelBaNGRQSjBYNUhVVnZzcFgwNVQ1WUVTM0owWGZYS0JKcmdK?=
 =?utf-8?B?MS83NVVNZTlBMDBoVDV4TkRwRlR5YldWRUJWTjJIcGFRbng1MTFvN1ltOFpp?=
 =?utf-8?B?TUtUc2JCTmdKR1E0djNwR2RqSlN4OU1ZVXhhOUNsWkdzYklNSW9XbHhsa0lT?=
 =?utf-8?B?SFphVzRCZXF0YjRZSlZtUHZQNERhYTB4bVVUSDloRzgrVDFHY3dQK1lWWnVJ?=
 =?utf-8?B?aFVobTZZSTNIc1VHVEpERExqRWFzQ0dMM2dqYkRxTU5Pd1VBQm03eTVDY0oy?=
 =?utf-8?B?NjNRS3NPYkdGc3o5VGZXSFBDRmV0cG9ONklRa3I3eVNFeEdUOVBlSndZTGNr?=
 =?utf-8?Q?4XjVYP03Ho4ao?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d04f076a-ad7d-4d86-d6e7-08d8dee1d8ca
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2021 07:48:06.3822 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k/34s+mb+Hl9ZThAYuewgVlZ1YR8ohwJMyClgVy60HxanauWgDqyffHBqBIzvEB4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4255
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
Cc: Alexander.Deucher@amd.com, jinhuieric.huang@amd.com, Felix.Kuehling@amd.com,
 harish.kasiviswanathan@amd.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

I think we should check for CONFIG_X86 instead, but in general it sounds 
like the right approach to me for now.

Regards,
Christian.

Am 03.03.21 um 22:12 schrieb Oak Zeng:
> If tbo.mem.bus.caching is cached, buffer is intended to be mapped
> as cached from CPU. Map it with ioremap_cache.
>
> This wasn't necessary before as device memory was never mapped
> as cached from CPU side. It becomes necessary for aldebaran as
> device memory is mapped cached from CPU.
>
> Signed-off-by: Oak Zeng <Oak.Zeng@amd.com>
> Reviewed-by: Christian Konig <Christian.Koenig@amd.com>
> ---
>   drivers/gpu/drm/ttm/ttm_bo_util.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_bo_util.c b/drivers/gpu/drm/ttm/ttm_bo_util.c
> index 031e581..7c848e2 100644
> --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> @@ -91,6 +91,10 @@ static int ttm_resource_ioremap(struct ttm_device *bdev,
>   
>   		if (mem->bus.caching == ttm_write_combined)
>   			addr = ioremap_wc(mem->bus.offset, bus_size);
> +#ifdef __x86_64__
> +		else if (mem->bus.caching == ttm_cached)
> +			addr = ioremap_cache(mem->bus.offset, bus_size);
> +#endif
>   		else
>   			addr = ioremap(mem->bus.offset, bus_size);
>   		if (!addr) {
> @@ -372,6 +376,11 @@ static int ttm_bo_ioremap(struct ttm_buffer_object *bo,
>   		if (mem->bus.caching == ttm_write_combined)
>   			map->virtual = ioremap_wc(bo->mem.bus.offset + offset,
>   						  size);
> +#ifdef __x86_64__
> +		else if (mem->bus.caching == ttm_cached)
> +			map->virtual = ioremap_cache(bo->mem.bus.offset + offset,
> +						  size);
> +#endif
>   		else
>   			map->virtual = ioremap(bo->mem.bus.offset + offset,
>   					       size);
> @@ -490,6 +499,11 @@ int ttm_bo_vmap(struct ttm_buffer_object *bo, struct dma_buf_map *map)
>   		else if (mem->bus.caching == ttm_write_combined)
>   			vaddr_iomem = ioremap_wc(mem->bus.offset,
>   						 bo->base.size);
> +		else if (mem->bus.caching == ttm_cached)
> +#ifdef __x86_64__
> +			vaddr_iomem = ioremap_cache(mem->bus.offset,
> +						  bo->base.size);
> +#endif
>   		else
>   			vaddr_iomem = ioremap(mem->bus.offset, bo->base.size);
>   

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
