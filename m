Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 47087406DAF
	for <lists+dri-devel@lfdr.de>; Fri, 10 Sep 2021 16:41:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A5BB6EA0B;
	Fri, 10 Sep 2021 14:41:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2042.outbound.protection.outlook.com [40.107.243.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79BCA6EA07;
 Fri, 10 Sep 2021 14:41:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B44kTqeoX0PLfWXdbWUIjmxKfug0ciV5tQAYAU5C6eV6VZWPJdZ5b9tNn2aJqd4ZaoiGjb9xsMs3u7nM/10UwnokDyU1jELzqTULimzcYUBv8s+lJcLFiWrwqgCSZzGGJqVr/le/0SVjckakAvnV/3/7hFyePDyamwU3ICd38S0DINKYoOjviUOsU1OHnHNmRoWQjrdsERcdwo1lrr1qfu7Z8/VAAhd3lNYsSbEx3X8avzxSGM3b9UwjPb1l1nLf8qSC46O5rztlVjlqqlmYqBUAUBBUItZXRgkGmYcvOPpWQ4gZCjFcf0r2PNfLgZ5wWePchBQTdkuiIQkanXFzBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=urXAqr8595H02Oy1waEep4QVgHO+q+SxZvQ4VmR8ybU=;
 b=huLAr74Gn2wB9rPwODfbheyYG3g1ReTWo8bdY64pmJwldsxEHEaF0R0bwFCFew5LvjfGHwj/5KObCNMmv0eo4RkWIXrLIRpkCHWfkOXNMu2AfzieRaj4cJyHc/E/9UhXqQD8XMxbFdlfwVcyTTEcOoOKbV2CfE6XTUlpus77/yPyq7zqqLArcGpudhQ+Xgo0WqmntorPG4e9OOjakx5RRBmgCLdoRhWJucA6/SVONYP1W0GYt31BnCNn6cul6Q4TNmTo5M+Hu3cEzKXKK0hFdDe/9I3Er16MzA/efGWisXLrmLtDBd1OmnHZNb1f1nQLn2xmRNPJXQO3EFJ3H3PQlQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=urXAqr8595H02Oy1waEep4QVgHO+q+SxZvQ4VmR8ybU=;
 b=TKcIxrZujn8MQe0RBwxZ5nXPVmrMWzcSuJe0DyloN7ttjpc3dmtkUrX5+VHqsbhG6fLXQ57cpoAaW6guYwxgkvTneCjjKJ5e/4o0cjKbv2Ef4+6m3aLh0T8gPxPZxDacSQTTGbBFUFga0z7cpLdNaexu67i4s43i2QdSeXSNMCA=
Authentication-Results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=amd.com;
Received: from MN2PR12MB3775.namprd12.prod.outlook.com (2603:10b6:208:159::19)
 by BL0PR12MB2577.namprd12.prod.outlook.com (2603:10b6:207:42::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.16; Fri, 10 Sep
 2021 14:41:02 +0000
Received: from MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe]) by MN2PR12MB3775.namprd12.prod.outlook.com
 ([fe80::dce2:96e5:aba2:66fe%6]) with mapi id 15.20.4500.017; Fri, 10 Sep 2021
 14:41:02 +0000
Subject: Re: [RFC PATCH] drm/ttm: Add a private member to the struct
 ttm_resource
To: =?UTF-8?Q?Thomas_Hellstr=c3=b6m?= <thomas.hellstrom@linux.intel.com>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Cc: maarten.lankhorst@linux.intel.com, matthew.auld@intel.com,
 Matthew Auld <matthew.william.auld@gmail.com>
References: <20210910131512.161655-1-thomas.hellstrom@linux.intel.com>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Message-ID: <d7570cab-d402-761d-40e0-3d08d9b9d3c9@amd.com>
Date: Fri, 10 Sep 2021 16:40:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
In-Reply-To: <20210910131512.161655-1-thomas.hellstrom@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
X-ClientProxiedBy: PR1P264CA0019.FRAP264.PROD.OUTLOOK.COM
 (2603:10a6:102:19f::6) To MN2PR12MB3775.namprd12.prod.outlook.com
 (2603:10b6:208:159::19)
MIME-Version: 1.0
Received: from [IPv6:2a02:908:1252:fb60:7832:8eaa:31d3:b60a]
 (2a02:908:1252:fb60:7832:8eaa:31d3:b60a) by
 PR1P264CA0019.FRAP264.PROD.OUTLOOK.COM (2603:10a6:102:19f::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4500.14 via Frontend Transport; Fri, 10 Sep 2021 14:41:00 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: beaa4756-337a-4b21-4eb1-08d9746902c8
X-MS-TrafficTypeDiagnostic: BL0PR12MB2577:
X-Microsoft-Antispam-PRVS: <BL0PR12MB2577E35CCA2AC16C766ABE9483D69@BL0PR12MB2577.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6790;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ajt8fp5igqMazMBT144GJKehCZHjLh8xN5NUMiU6t+Cs7Atydngf0sQqJrbwmPZ5j82IcbQZNz44QT2YMUmTjoXLCfxfzAHzCKoRBHXgiM6pFFqSKsgtKLAezym0pz2Xxp48APzpgWw0KeDyx3xBsGfwo5eXAvayTsjfJvkTN6QzEnCPWroHXuECQdhsxLD/Hoorn/OxU7pDoYReYK/bvAu1nI8BSJCdyMDZm3vybx9lFl0gZrdgaucCdzCu+d9wyUFofYMQ0AoFje9zRc0MksyXeQNtd+65nnW2zlqJ+S11MgZr/VlPJWSmLNUIkNCapn4Meq1Vwem/TIa+BUDjtzVo8WN+AWnjDH4cI4XVw+6TzQcOaTMP9OxyI+jill8aLOm/kgAagKox8MshUEp8kRvN8rByzsXZrZXlGLnnHQe47BU5Av9IpoYZ/nntj+1Hbh6kROhkbad44heYhl+O8573afgeNiskt77UhPiFT2F4Hei+tVGWcw6wtgO/gwvVuh4xDkETspQie8o7CBMkPbegEqcZrBFl12/a8vC+svIg0RYURMSys5LinRp/f0yRDuX9OgKosgN2sLN4LcMz3fEBVjBLCelBPT2R3CfvYwZw97KRPBwpf6G2RkbqEX3+9S7Ggr6W7wDXQKS3clXnG7VL9cthIa06zfiVN8c5j33FYSQtkRVLMw14UosduNkuIhSyY4c6eoTx/a/GxKAANluF/LcIQeIK5HHWg1sWC1U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR12MB3775.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(366004)(376002)(396003)(346002)(39860400002)(186003)(8936002)(4326008)(31696002)(66946007)(66476007)(66556008)(478600001)(316002)(38100700002)(36756003)(86362001)(2616005)(5660300002)(6486002)(2906002)(31686004)(6666004)(8676002)(66574015)(83380400001)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SzhOenN1eTcvdzFqQkdEaHJwWXR0UERGbnlKZ3V5b09rREF3TDVJcE8rU256?=
 =?utf-8?B?MDJCTXo3bmltSGQ0VkhxSmdMWWY3VlU5L3JoTFRlWFEyaXd5NTF3WW5yM0pL?=
 =?utf-8?B?dS95b1lUOGxaZHNwa1BJeG1oV21tbXRCb25xRHhYV0JNQXlUNTRPb1B3dExp?=
 =?utf-8?B?RGxPU2lXelhpUzUvM3MzY0x1a0hwU2llcVR4V0cwMVovWGkxVWRSd2dlclpO?=
 =?utf-8?B?SlR3MG54WSsydHQvNTA2Tk9pbU9Wbm91OVpJVUsvUUdnUmpVY2JxQ1lnZm04?=
 =?utf-8?B?aXhBNWpvZ0VhWnJQQVpXa1AwSEVhQlVVa01CMTJmSHJWMXFLOGNNUTFSSFh1?=
 =?utf-8?B?OGExckZoWkhYSStHcG5DeEp2aEl6SkUyU25rN0xZdU9xTFp1L0VYd1VsNFlt?=
 =?utf-8?B?RUNqVTQxTm96TlI3czhtcW5RNzh6MFcwYlJ2bWpaTk1PSmtmMGhKSGdSSE5X?=
 =?utf-8?B?S3MvUUNsVW0yN3hUcDZVWThobmZPbDYzeldxY3pNUmtiMGEvU210WVhIb0RK?=
 =?utf-8?B?c1YvUzVnTGJKeUlkaHo0WFpvQmdWK2tqZEUySzBIeUp6RFJrZldzSHEvYzM0?=
 =?utf-8?B?Y1F3NVZJMkdZaHpBemFBeitYWEpNV0hrS1FncWJUQ0FtcHBlUU1ueURtb0U0?=
 =?utf-8?B?WWN1Y1lJaGNVd3Q1V1pKb1h3ZytjV29ibUF1VkJLRU8rSExCQTlSaS92NE1n?=
 =?utf-8?B?UllQdVpwdjZ0SStwZmc2QTRPSFJiRi80V2pDOXYzTzhabi9QNEx2a3M1V2Y2?=
 =?utf-8?B?bHFlUjJ5MGpZRHQ4U3o3b3FIZ3FhZVlCVit6Yks0c1paKzg0Z0NoaS9leGEy?=
 =?utf-8?B?S1NnYXdaQ0gvUXZTREd5RlZpdlZYeFJJaXpxQjZHcjVoZEdpNEpHaGVPSG9R?=
 =?utf-8?B?ejdENjRPVGp4SW16VHViSlNqYjE0aVRVaEp1VnRSdWhMMWVJbGdxSnZRYmJm?=
 =?utf-8?B?U0Z1bFdiM3JmcUo0Tm1kY0Z3MjNuUkNrMVFTaU84K3VSZ0wwNmx6QmJJejBP?=
 =?utf-8?B?ZmRLS1J1L091d3pNRkZEMUdqb0tFdUh0a29OeTRYanRtblNIWGVUa2xyVWxU?=
 =?utf-8?B?Wk5DWUdYYldYZVpjbmdGOUtjQVJqRngxc1hjMnBMQWJ0NmM0QzJkcG5ZSG1z?=
 =?utf-8?B?R2gyT1RRZ0dHMS9PMlNKOEVHNkJhRlNDK2lVOGdVeXU0aXJUWU41VmcwV0hW?=
 =?utf-8?B?Mk1kdjEyRm9acGhFNnlUYjhvRUxpbzNtM2NraWNOeGdMbmEvaVo2Mm4wSmNj?=
 =?utf-8?B?RHlvQUo1dDY3NTR6UFdYa0hTNVVwNkJYeXJZMTEzUmRPZUFlZUttWlgxdXpt?=
 =?utf-8?B?bkZMaUZQVTdydzhDL3RMSHBzdWJHVXZzTkF3UHoxNjdZWDdWNlQ4NEUyTVRS?=
 =?utf-8?B?dGpNZGpic3oxeDAvY3BSL1hVczBEcjN6c3pYZG5nN3pkMktyUE8ybllLMmRj?=
 =?utf-8?B?bS82OVNJVFZKb3RFMFBYV3FieTdPbHh3YlB0RGZqVlB5Z3FDTzg3dzE2aFpE?=
 =?utf-8?B?ODBjakJLSitzV3RCbkhVQXUvWEdQZUV0MCt3dFNHUThnd0M5SUszNkV6NGpl?=
 =?utf-8?B?Z3BLUlBObmRuM1VzV1VvTmlCZWhWOWlUTURaTkhsQlVHSW1RVzlubkttb250?=
 =?utf-8?B?NWhQYTZOMDJyeGtZZVFsQ1BrbEQzRjg0b0gweFFuNFc1V0ZZN1dFRzdiSE5R?=
 =?utf-8?B?Rm9DdXZDSjAyMElSbW52cWR0MGw5M05SUlpuQlQyY3pKa0t5KzBleEJQU21G?=
 =?utf-8?B?WTlRZ2l6QUl0bEtQeVQydFpFNSt1VUplRWNtQUdtYzJYZEFUTEpsMjFlakRH?=
 =?utf-8?B?ZjY3Y1FVWEtJM3NkWEF6ZmxDQ21OZ1duM0FLbmQraFNzWnRDTnlZa2tjcTM2?=
 =?utf-8?Q?RQaK/YRrzpMS3?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: beaa4756-337a-4b21-4eb1-08d9746902c8
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3775.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2021 14:41:02.0063 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hthQwaVXjobhctxPGbGgma363f+tjEK1TfPFllb/9ZyDcybRAPTiU0Xa70UOLdEx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL0PR12MB2577
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



Am 10.09.21 um 15:15 schrieb Thomas Hellström:
> Both the provider (resource manager) and the consumer (the TTM driver)
> want to subclass struct ttm_resource. Since this is left for the resource
> manager, we need to provide a private pointer for the TTM driver.
>
> Provide a struct ttm_resource_private for the driver to subclass for
> data with the same lifetime as the struct ttm_resource: In the i915 case
> it will, for example, be an sg-table and radix tree into the LMEM
> /VRAM pages that currently are awkwardly attached to the GEM object.
>
> Provide an ops structure for associated ops (Which is only destroy() ATM)
> It might seem pointless to provide a separate ops structure, but Linus
> has previously made it clear that that's the norm.
>
> After careful audit one could perhaps also on a per-driver basis
> replace the delete_mem_notify() TTM driver callback with the above
> destroy function.

Well this is a really big NAK to this approach.

If you need to attach some additional information to the resource then 
implement your own resource manager like everybody else does.

Regards,
Christian.

>
> Cc: Matthew Auld <matthew.william.auld@gmail.com>
> Cc: König Christian <Christian.Koenig@amd.com>
> Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
> ---
>   drivers/gpu/drm/ttm/ttm_resource.c | 10 +++++++---
>   include/drm/ttm/ttm_resource.h     | 28 ++++++++++++++++++++++++++++
>   2 files changed, 35 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/ttm/ttm_resource.c b/drivers/gpu/drm/ttm/ttm_resource.c
> index 2431717376e7..973e7c50bfed 100644
> --- a/drivers/gpu/drm/ttm/ttm_resource.c
> +++ b/drivers/gpu/drm/ttm/ttm_resource.c
> @@ -57,13 +57,17 @@ int ttm_resource_alloc(struct ttm_buffer_object *bo,
>   void ttm_resource_free(struct ttm_buffer_object *bo, struct ttm_resource **res)
>   {
>   	struct ttm_resource_manager *man;
> +	struct ttm_resource *resource = *res;
>   
> -	if (!*res)
> +	if (!resource)
>   		return;
>   
> -	man = ttm_manager_type(bo->bdev, (*res)->mem_type);
> -	man->func->free(man, *res);
>   	*res = NULL;
> +	if (resource->priv)
> +		resource->priv->ops.destroy(resource->priv);
> +
> +	man = ttm_manager_type(bo->bdev, resource->mem_type);
> +	man->func->free(man, resource);
>   }
>   EXPORT_SYMBOL(ttm_resource_free);
>   
> diff --git a/include/drm/ttm/ttm_resource.h b/include/drm/ttm/ttm_resource.h
> index 140b6b9a8bbe..5a22c9a29c05 100644
> --- a/include/drm/ttm/ttm_resource.h
> +++ b/include/drm/ttm/ttm_resource.h
> @@ -44,6 +44,7 @@ struct dma_buf_map;
>   struct io_mapping;
>   struct sg_table;
>   struct scatterlist;
> +struct ttm_resource_private;
>   
>   struct ttm_resource_manager_func {
>   	/**
> @@ -153,6 +154,32 @@ struct ttm_bus_placement {
>   	enum ttm_caching	caching;
>   };
>   
> +/**
> + * struct ttm_resource_private_ops - Operations for a struct
> + * ttm_resource_private
> + *
> + * Not much benefit to keep this as a separate struct with only a single member,
> + * but keeping a separate ops struct is the norm.
> + */
> +struct ttm_resource_private_ops {
> +	/**
> +	 * destroy() - Callback to destroy the private data
> +	 * @priv - The private data to destroy
> +	 */
> +	void (*destroy) (struct ttm_resource_private *priv);
> +};
> +
> +/**
> + * struct ttm_resource_private - TTM driver private data
> + * @ops: Pointer to struct ttm_resource_private_ops with associated operations
> + *
> + * Intended to be subclassed to hold, for example cached data sharing the
> + * lifetime with a struct ttm_resource.
> + */
> +struct ttm_resource_private {
> +	const struct ttm_resource_private_ops ops;
> +};
> +
>   /**
>    * struct ttm_resource
>    *
> @@ -171,6 +198,7 @@ struct ttm_resource {
>   	uint32_t mem_type;
>   	uint32_t placement;
>   	struct ttm_bus_placement bus;
> +	struct ttm_resource_private *priv;
>   };
>   
>   /**

