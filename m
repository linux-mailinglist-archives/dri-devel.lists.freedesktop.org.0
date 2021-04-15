Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 650883611AC
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 20:05:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F2CA6EAAC;
	Thu, 15 Apr 2021 18:05:17 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2041.outbound.protection.outlook.com [40.107.243.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC49C6EAA8
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 18:05:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=e/31+oN91/7b+w+81OHyq7lq2M6mIGE7NLQIZ7M/yz43OCaZf+VBfvNPtQjHkSVKhTrzq3KkpLATAlLplf5LMwel9rFlINOYTB7xegGv573hy2tsE8PqIXk+GFX1EK8ap1xu67jdR2MuLtZr9z2XutJwy672Lw8HIJTjPMvoRZfxX0SBOUXjG16ZAB8sxUTS/+LujaC5Xts4e721qztZ1r6flFkT/imiCfq/w+NjIznSxuzhJnXKNp707zfMzB8yV/nXfkSm+3Z/V4VZOtEPshMJZK0HES/BHGCK2/QgUCOR7zK/LZ7GPCAiVWCIQgHnuHk2Y98r6w8RmhRQtb2Y8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7+lzXaSZ+wnHr7T6NE9j9s3yx+gZ2CN1vWDxEPQHY68=;
 b=TZMPgXEORU3ka/rWwgK1rEhxUZHlCfeIstwc43SVeB8vGMi0ZTp1/V/fzQnC0NxdCzspBtO8hC6uqlLICKXrpHkbQvDXkcxA3ZlqdSrpuECtMiatCSz2CX6iUKltTRSjksUJ0n8J5SmUWQeUBcF7N9EQ9kMozpIbW5SnzEnhAYGZU53srqElEkcmLMzepSOud0GE2RgFroGL/8wYS7rO2pDDdtNh108mCXSXNMXgANLtWZpV8U3yu+NmxhMQ/g4U4U9vzmN2AQHXJNogq1YygFBpdiixC9ohyebXc+oRvIvTwk+0ovW1eFNrNQ+D+j6LoY8fpFINdwKGMEyzAAVdPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7+lzXaSZ+wnHr7T6NE9j9s3yx+gZ2CN1vWDxEPQHY68=;
 b=EFyChmr3S7CyeK7hoJvJMqoSTiZw7qwSEwnABUS/0CxfLkLsvQevwEJmOOJvnKgFXvxHGCHrmMhlJoi/Tw3dNXThXdr38JYzbJEY+N0+rEn3gsIIkN83Vu8ON/ldmz8d/fWWgB17BguJELup0SKY906OvUZIAbHNKBmUwNzxjb8=
Authentication-Results: vmware.com; dkim=none (message not signed)
 header.d=none;vmware.com; dmarc=none action=none header.from=vmware.com;
Received: from SN6PR05MB5759.namprd05.prod.outlook.com (2603:10b6:805:103::19)
 by SN4PR0501MB3758.namprd05.prod.outlook.com (2603:10b6:803:48::32)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.9; Thu, 15 Apr
 2021 18:05:13 +0000
Received: from SN6PR05MB5759.namprd05.prod.outlook.com
 ([fe80::dc9e:62ef:c968:85de]) by SN6PR05MB5759.namprd05.prod.outlook.com
 ([fe80::dc9e:62ef:c968:85de%7]) with mapi id 15.20.4065.006; Thu, 15 Apr 2021
 18:05:13 +0000
Subject: Re: [PATCH v3] drm/vmwgfx: Make sure bo's are unpinned before putting
 them back
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
References: <20210413205938.788366-1-zackr@vmware.com>
From: Roland Scheidegger <sroland@vmware.com>
Message-ID: <6241bf3c-b085-a946-419f-fcbae27fd526@vmware.com>
Date: Thu, 15 Apr 2021 20:05:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.7.0
In-Reply-To: <20210413205938.788366-1-zackr@vmware.com>
Content-Language: de-DE
X-Originating-IP: [46.126.183.173]
X-ClientProxiedBy: GV0P278CA0042.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:710:29::11) To SN6PR05MB5759.namprd05.prod.outlook.com
 (2603:10b6:805:103::19)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.1.125] (46.126.183.173) by
 GV0P278CA0042.CHEP278.PROD.OUTLOOK.COM (2603:10a6:710:29::11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4042.16 via Frontend Transport; Thu, 15 Apr 2021 18:05:12 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 70a0c544-df54-4685-6ca9-08d90039044f
X-MS-TrafficTypeDiagnostic: SN4PR0501MB3758:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <SN4PR0501MB3758F7B7C3E01D5B7860C5E1C64D9@SN4PR0501MB3758.namprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:7691;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: x1RpLuCUsxeSjmq/mZW+Hayw9d0VIinLGH7HmuwDGpXkqydzaeMiCpwb5arK5XOEf6WSDYxABc6YgVxzj3FXLC1j7UyX4CO3PvpBGIYw0GcGmzoM5WPhGj+zF1AjkNIP7cuA7m7iijglfnXtoPfXd2oQwfzcuktrEa3ixRpQZgJ++28wt5S5E3VoGJLIeg7D3fjCPyuGpF+0mQlUtxOXpBmk3e5dYf7qmdlCK0i2FxMAiT2qzpGWUoMWQq/WHIS7iG1GH39EmwpQzNq8nYvIoPqygRuuLa5x6U/61oi7fJ+m9GP6NsR9XG3wXa/7GtO8nnX2L1L7mVwDTNhQaUBQtEwS1jyso5/um0Yu714uUkQLpNXbKjYPEQrejJNxcw1XLgAPy4DIGlSD0c6nPfWPL4GC80TkaGLfaxYkJSwi/GDFZOb26fO3qVCSpFA1IcVkp3FQP4kiB30v3OB2o0hhU+a4XEU7DxiTEcvDhU2aaDfAhtWachP39xCZFJrbLe5KjlVjHWBoFF4QSZZxVNusS0YqXRddO7AR5TqjuLJUEMDIm/PNjVDLRoDEB3PcpmIRwHwSEBOAFlUgybDVyHo+fyUhJHLqUEJeP3Un3XLC8LNCxWlKW0SZLQpiMua3Bj30GhKA4aCsI/BeREStO7X/x7UOyDMl6wldKY1UVH+fJhBvUv+5EF19cgIEGKrzuXK4
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN6PR05MB5759.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(346002)(376002)(39860400002)(396003)(366004)(16526019)(36756003)(66476007)(2616005)(6486002)(8936002)(16576012)(83380400001)(316002)(86362001)(31696002)(8676002)(4326008)(31686004)(107886003)(26005)(186003)(5660300002)(53546011)(478600001)(66556008)(956004)(2906002)(38100700002)(66946007)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?djVXQndiWHBabVo3T1BRSlpkV0p5ZmJ6dmQvbDNiVXZyaks3QW54a1Nqbnpw?=
 =?utf-8?B?LzRrWHNMcWRUZGR6ZzdnQ0RyZ2NRNkMxcExDNU1JYXhLQU1ob1JjTEh0NGZQ?=
 =?utf-8?B?S055VkRmcGsyOFBUODJNTnBKbDJaM0M3Unl1Y21ibVh2QzhCc3F3eTVJM0JQ?=
 =?utf-8?B?ay9LYXBhakw3RHVLMVp6S1V2MkpzTmh4QWdlQXE1MkxiNGVzTmdzTGh6U21j?=
 =?utf-8?B?dlpvUE5PVFAyTDdaM2NwTzRPajV2REF6WnNCSllnbUpJS3FhcHQ4aVJzalMr?=
 =?utf-8?B?dkxnZTU5TTV3cExCZEsraVd2QXArUC9EWEoySWdKOE56YURNZXFPak41R2px?=
 =?utf-8?B?Y3gxSzVMT2JaRHRzZWVwNEt2dUYrWC9JNVYwc0NTNWgvRnJKTk1TYklicjhJ?=
 =?utf-8?B?NWFLSk5HRlFhTy9kay9mR1ZWZFh5YVhrMTRVTEd5MkFSQjEweGxrZnlPNmF4?=
 =?utf-8?B?TFB0QWZETnJVVnJMRUUrRERrQ2FGWWxwZmN3QmR3Q2FJaXZvU3VOazNsbm5N?=
 =?utf-8?B?RjI5ZUE1QThZMHdiR3FVdTNXbmxvZForemUxMThkbHBjbnlJbW9TRzlEOWxs?=
 =?utf-8?B?bDlKNk91Zlp3bDJmSWZJb2ZjWUUyMDVnWlA4UmljcWFPVDFmbFZIRjVGQlZY?=
 =?utf-8?B?aHgycjY5TG00eXhINGRZbms0aHhaTGErcDNwMWNYcXRNUWF5SlNwTW1TK3NK?=
 =?utf-8?B?d2g1Qnp4dzh0TGVJL1lxYzFpZzdUQXExTS94Z081ZEU4RWxPQXBrOHQ1dzk5?=
 =?utf-8?B?clQwZXhvNXI1aHpxTms3Y2VISkUzdWhUcllCRVV3UXRZNUc0RDEzK0EyK2Rt?=
 =?utf-8?B?blc2OWxNMGdBNG5FQXBlbXlmbTZrQmdlOVEvVWQ2dWxmUnQ3NXlmRVU4Sm9s?=
 =?utf-8?B?bUw5eWRzVUZlWVZyMWdud0EvblBqU1JVTmdvby9wTzJFdHppTFVZMkhlMDJo?=
 =?utf-8?B?RGpFRVlxOGUxdHpJK0VDYitNTHNnYlJvWm9uOWVOK1h0NnFXUHNySmwyYkNF?=
 =?utf-8?B?c3ZLSTNBSFlTODQySzZHdEFidEI4dVBEbEx2SUVmL2kwTm04U1kyZ2VvSVZz?=
 =?utf-8?B?WnNXb2dZVlovbkFhV1graXRJQ1M2Y3ovb2Z1RjBHZ2FsVDVmS3EzdElzcFR5?=
 =?utf-8?B?aVdEUWVhcklKL1JQdlRBZ0VHVEhRRXhaaW9sTkdEdUhueFFJOWJVT2Y2RVI3?=
 =?utf-8?B?T2k1WnpYVmt5NDRxLzN0L3J4cFlSd3Z5Q1loQlFyeDhvUU1QcDVRa3VVV1BM?=
 =?utf-8?B?QmlVclR1bkZOQ01hUEdBd2pUeFdXclplblZ5eFR2bHp2bTQzR01DdFB3bGpa?=
 =?utf-8?B?MTY2WWtTZW9mM0d5dHZzaDdJQzVFc2Y5TWpKdGZLZmVvZXpNeWpneGFDU2ZD?=
 =?utf-8?B?WHh6MXZTWXRHUWk4OG82M1U4cWprellqejJTcXg3c0k3dm43ZWNISDR5Y0d4?=
 =?utf-8?B?bFMxcFZCa0VxZ2o0SzVtVkNITldDekkzdnlPNlVyV0hpTlBxTklLUVlDZ2dQ?=
 =?utf-8?B?cHRGdld2YU9WNXNuaVNqWXlLdldlZzhsQ3VWU0pjS1lDMXlwc3lJOXhmaklx?=
 =?utf-8?B?Rld6QmE2TnZxeEQ4bk51THJXdVBHYk9JSVRPMWFLMUNxNE5saXFJdllwalUy?=
 =?utf-8?B?STBJZzRkdE5GL1ZwemJ3OUxNTkdqTWNvdmt1ckE1eENqRWs4U2tRUVBIbVBC?=
 =?utf-8?B?NjdJNVhtR2N0QWVYbkFVa1VodzdaM1R2UkhPRVhMbGFaQmMzem42RXFvMHVo?=
 =?utf-8?Q?EHmA+HwpdiE641Ca3Svu7LE0R+vWm81C+BxOWgD?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70a0c544-df54-4685-6ca9-08d90039044f
X-MS-Exchange-CrossTenant-AuthSource: SN6PR05MB5759.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 18:05:13.6604 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zV7hlGEWlw4GVFUVqufPTFEp6R+uh4GNWpee7IkfgX/Rdgv0sxQbVwaNVAtsOK4ImqYlAzSqEXm0T5WssTNoJw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0501MB3758
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
Cc: Martin Krastev <krastevm@vmware.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

The logic is all complex, but looks good to me.

Reviewed-by: Roland Scheidegger <sroland@vmware.com>

On 13.04.21 22:59, Zack Rusin wrote:
> During cotable resize we pin the backup buffer to make sure the
> trylock doesn't fail. We were never unpinning the backup buffer
> resulting in every subsequent cotable resize trying to release a
> pinned bo. After we copy the old backup to the new we can release
> the pin.
> Mob's are always pinned so we just have to make sure we unpin
> them before releasing them.
> 
> Cc: Martin Krastev <krastevm@vmware.com>
> Cc: Roland Scheidegger <sroland@vmware.com>
> Fixes: d1a73c641afd ("drm/vmwgfx: Make sure we unpin no longer needed buffers")
> Cc: dri-devel@lists.freedesktop.org
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c |  4 ++++
>  drivers/gpu/drm/vmwgfx/vmwgfx_drv.h     |  5 +----
>  drivers/gpu/drm/vmwgfx/vmwgfx_mob.c     | 18 ++++++++++++++----
>  3 files changed, 19 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
> index ba658fa9cf6c..183571c387b7 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
> @@ -481,11 +481,15 @@ static int vmw_cotable_resize(struct vmw_resource *res, size_t new_size)
>  	vmw_bo_unreference(&old_buf);
>  	res->id = vcotbl->type;
>  
> +	/* Release the pin acquired in vmw_bo_init */
> +	ttm_bo_unpin(bo);
> +
>  	return 0;
>  
>  out_map_new:
>  	ttm_bo_kunmap(&old_map);
>  out_wait:
> +	ttm_bo_unpin(bo);
>  	ttm_bo_unreserve(bo);
>  	vmw_bo_unreference(&buf);
>  
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> index 8087a9013455..eb76a6b9ebca 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> @@ -1522,11 +1522,8 @@ static inline void vmw_bo_unreference(struct vmw_buffer_object **buf)
>  	struct vmw_buffer_object *tmp_buf = *buf;
>  
>  	*buf = NULL;
> -	if (tmp_buf != NULL) {
> -		if (tmp_buf->base.pin_count > 0)
> -			ttm_bo_unpin(&tmp_buf->base);
> +	if (tmp_buf != NULL)
>  		ttm_bo_put(&tmp_buf->base);
> -	}
>  }
>  
>  static inline struct vmw_buffer_object *
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c b/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c
> index a0b53141dded..f2d625415458 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_mob.c
> @@ -94,6 +94,16 @@ static void vmw_mob_pt_setup(struct vmw_mob *mob,
>  			     struct vmw_piter data_iter,
>  			     unsigned long num_data_pages);
>  
> +
> +static inline void vmw_bo_unpin_unlocked(struct ttm_buffer_object *bo)
> +{
> +	int ret = ttm_bo_reserve(bo, false, true, NULL);
> +	BUG_ON(ret != 0);
> +	ttm_bo_unpin(bo);
> +	ttm_bo_unreserve(bo);
> +}
> +
> +
>  /*
>   * vmw_setup_otable_base - Issue an object table base setup command to
>   * the device
> @@ -277,7 +287,7 @@ static int vmw_otable_batch_setup(struct vmw_private *dev_priv,
>  						 &batch->otables[i]);
>  	}
>  
> -	ttm_bo_unpin(batch->otable_bo);
> +	vmw_bo_unpin_unlocked(batch->otable_bo);
>  	ttm_bo_put(batch->otable_bo);
>  	batch->otable_bo = NULL;
>  	return ret;
> @@ -341,9 +351,9 @@ static void vmw_otable_batch_takedown(struct vmw_private *dev_priv,
>  	BUG_ON(ret != 0);
>  
>  	vmw_bo_fence_single(bo, NULL);
> +	ttm_bo_unpin(bo);
>  	ttm_bo_unreserve(bo);
>  
> -	ttm_bo_unpin(batch->otable_bo);
>  	ttm_bo_put(batch->otable_bo);
>  	batch->otable_bo = NULL;
>  }
> @@ -530,7 +540,7 @@ static void vmw_mob_pt_setup(struct vmw_mob *mob,
>  void vmw_mob_destroy(struct vmw_mob *mob)
>  {
>  	if (mob->pt_bo) {
> -		ttm_bo_unpin(mob->pt_bo);
> +		vmw_bo_unpin_unlocked(mob->pt_bo);
>  		ttm_bo_put(mob->pt_bo);
>  		mob->pt_bo = NULL;
>  	}
> @@ -646,7 +656,7 @@ int vmw_mob_bind(struct vmw_private *dev_priv,
>  out_no_cmd_space:
>  	vmw_fifo_resource_dec(dev_priv);
>  	if (pt_set_up) {
> -		ttm_bo_unpin(mob->pt_bo);
> +		vmw_bo_unpin_unlocked(mob->pt_bo);
>  		ttm_bo_put(mob->pt_bo);
>  		mob->pt_bo = NULL;
>  	}
> 

_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
