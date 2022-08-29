Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3165A42D0
	for <lists+dri-devel@lfdr.de>; Mon, 29 Aug 2022 07:58:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 883FF10F09A;
	Mon, 29 Aug 2022 05:58:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2089.outbound.protection.outlook.com [40.107.100.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D1B110F0E6
 for <dri-devel@lists.freedesktop.org>; Mon, 29 Aug 2022 05:58:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oN0weiwhJhKdSwicYc+WvUkn2JhOCVfRZPypa4zdYaFK8nUsGcCU0Lnoy1MY+/j8gOmnpIZvUlxcXC5nRHGME054l+5OPbRCPenPrhDgZ1yY7O3Sqita9y7kX/xHJPpq0ETbNn07tf00DkN6pb18NXlg15sDhLoo/X+r67Z5mYUz6fXzNtqkSWvDv5ADhfd0Wf1IsyH3bDwn5y1yQU4wTD6/YGP71JrPceHuev57F2Tn3gGpCZGGraUyzYnmur2zx2EEfIlFJWGr5aba+a+8t1cfJFYcLNucRr114NlOpTWbWaR1Up4zXPolXWdu9QyAeR+8uDgbHfpS/hhCM5oRMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cTGHZkuwUO1QTa4W1T3PxT1vwiZmcn+6Hc5XWzlXrGA=;
 b=Rxg2Hs5DK8KkjANgntpfv/ctwkwgG8ekg4c4amcHKEaS8fCkqnafVqdCQJClgxZ762RRvrr6cj/LHU/oh80xO7xD4yGSnqCcW1y244Xtnaa1h8zrgGSKpIfuAHANmFkhm7q/fwx5JPngqReHQ62tSr1WZCRSusn/ivnT9xwdF6OcvHHfUsV+G60m7AFcHAGxJ+yLdW7R62CjFnF0Dq+edjekE78LsI+JIDDBGrnSUPWLgJQ4vKTG3BRQ6FFr5m7HqqzOZ3S5jHFzodw1pJT01K15G/KTd78H2f2dDYeWw0pzse3Ufp/xQ8gSQ5ukDe6x9Gd1owAPLOjeMhT72HaFCw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cTGHZkuwUO1QTa4W1T3PxT1vwiZmcn+6Hc5XWzlXrGA=;
 b=x5Yp6rQiDIP0ivrQRydAnkKUNZyB0xXN7h+p4PQWiAtkZ8ibW8aW+iYM3NEK3EHk6Pq7T9q2BSCjpJfCo7U7tt628pVf6p/ruGeSH1WrqH8XbIUg6GfKI/CwcJHPQQwFm7+NchUwho60+4zIzJk2X6ezzw0Z6N4xaAkqNxlnHr4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by BL1PR12MB5301.namprd12.prod.outlook.com (2603:10b6:208:31f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Mon, 29 Aug
 2022 05:58:20 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94%7]) with mapi id 15.20.5566.021; Mon, 29 Aug 2022
 05:58:17 +0000
Message-ID: <732919ef-c8b8-159b-6f69-e95eea710680@amd.com>
Date: Mon, 29 Aug 2022 07:58:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PTACH v3] drm/ast: add dmabuf/prime buffer sharing support
Content-Language: en-US
To: oushixiong <oushixiong@kylinos.cn>, Dave Airlie <airlied@redhat.com>
References: <20220827091030.496671-1-oushixiong@kylinos.cn>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220827091030.496671-1-oushixiong@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS8PR04CA0190.eurprd04.prod.outlook.com
 (2603:10a6:20b:2f3::15) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: fe909fb5-68ae-4e35-7210-08da898377f4
X-MS-TrafficTypeDiagnostic: BL1PR12MB5301:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XIdoh75OqVIHX4FCit/2u3kMKC3UOAHTVjE6MjzPrqsFQSzgVBM79VqNHuKowmz3RPHsbqLz1NTnVibMp3HlgFlbCdabcmHh/J4lVXZosybghqzYU5JDePJK6WXHcNIqNelwKNRXN6nMhX2ZlMYaJrexjcQISML3sZQnXOgr9NNWAdnnblOXBSXJOxGsCjesz3sfT+p/eNLDXVI63zNyKvzhBrWVj8xaoTFkMTubmqY9362rVDMZ8QUm2zlyAhYB8G9RWXOBg3Z7qN0tI7TKgnm64TwrxTulVR/vbvN5IoQtN7sAMJ+pDuqZx/4T5TNwU7xxXaARs0HjBADHZDrqgSwg1gaP2RU+Wm3cmuhcGjyV7MIDsCVXjWAGlLNUv8aR5rK+P7AfiVY8o0cRJCa9elYbwgCa417N6dv2y8W9/a3C7Qh7URXj/9mni57bw6RiVXs6aPhDmIbONPn/zjwgPLG8s1fdOgwPs9+PgfyTkrDEoiaTVRf+2P0r1jzJ3wnU3RFMYUZt9zBBJwp2reSpAmoMg/eRio8LITJz5omkmsOP0bf+ROP5Qp5Y+rY+f08gV1aQd3Oz3I4epDjCjpTPMikbwu0n+78BgEGXW5vrC4cw0MpzNBvVZZ33y8tMmD9ll7lrKT7UZ+InKJWkjFyZF44Ehf6FX8F/tYwoJ45dUUyzqr/PXEl/yxnQYRvdGvLyKacYzpvpy4igSpYIVeVMACHyn6YDkAKtoXw+a0UktWnM0sj0yRFAJyVxgSpbpL2iDzwCcyeTA5TyktWZjfNTArJZJfABgTEDg83ovOWUqBI=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(396003)(376002)(39860400002)(366004)(346002)(136003)(38100700002)(2906002)(6512007)(26005)(6666004)(6506007)(2616005)(66574015)(186003)(83380400001)(316002)(110136005)(8676002)(4326008)(66476007)(66556008)(66946007)(31696002)(6486002)(54906003)(31686004)(7416002)(41300700001)(86362001)(8936002)(5660300002)(36756003)(478600001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R1RCNlBvVGcydGRMNFRrdW1wV2RpLzZoZmMzRzc1VzN3YW9YRGVJMWlFVWVk?=
 =?utf-8?B?YkhJN1hNNUo5UW1JSmF1cnB3bXAyaVFTNmhUc004QlhUUHpqbmVIamdGOTBL?=
 =?utf-8?B?c3BldUNGZGFLT3RjNEN5ZmVvNUVnMVN5ZDZpeTR3ZUpmMFhjRmlPQ1BtOERk?=
 =?utf-8?B?ZWQyWTQ3UGthRHJwZUFBTUl4SER0NHNLMW02d2E3a25JVVV0d2YrRUhYdWhM?=
 =?utf-8?B?UEJFY2svbjZOZHVGRm5ackdzN2xkWGI4OXBkMjFiMWhRRHBzYnF6dVhjR2ZG?=
 =?utf-8?B?bEwra0MyR0tDRUVFSko0RE5NZ2xwcUlmV0oxQThFMWs0b0ZHdmE4S3hSZ0hz?=
 =?utf-8?B?TDIvcHFLQndQaTJLMzhac3JmQi9BaE5pMWQrMXJ4YnFLOWVOZG9YYlhQWDlt?=
 =?utf-8?B?eFphVitmK0xXaHQ1MVR3Q0srTW15ODF5Z3Vqbk5LK2oxVlk4eVZQbmQ2ZUc2?=
 =?utf-8?B?ZWZ6RjV6cnVNeVpXRVZrY0VUWk5zTEQ2d095cmM3ZVZNalNtR0xkaEZuaU9t?=
 =?utf-8?B?MU1rbUJlUmx5cXVURGtMRGZSQWZrYUx3SnNQZ2Vpa0lPRnk1WkhDaDJTRW9X?=
 =?utf-8?B?YWVCODRncWNNcUZGWWZUWEkrTW1VclFacXRib3EwWituQTBVRUxyTWdsY2hq?=
 =?utf-8?B?Q3Z0WnJKNVNNT0pCVEVNUTcraHl5WFZaZFdHNEZ3Nmd1TUFuOWZoeFdmWlov?=
 =?utf-8?B?K0pobEZRSXhqRDdTZHBINkpKRUZqdjRQOVRRTWw5cmJSS3B1MTNmS25UZHNv?=
 =?utf-8?B?M1hhdlg0Y3pMTTVRVFh3ZGtFSkF3WUYvQ2s1ZW83WVB2VktDS0pRY2YvbUVH?=
 =?utf-8?B?OHFRLzNOb1ZTOXhmRW9rcWk0bjJYbmJXaEk2ZEZZb0hTbGpydEM2SzUzMHBv?=
 =?utf-8?B?bHA5VEovdkIwRmVqR204cnp4NHdmNE1Ma1lsNHl6ZDhqN0h5WnE4NjV6bThp?=
 =?utf-8?B?TnVVUlpLUVRIdm1ISFpvaUs4eW1lVjVUd1lFZHhScGdnZDMxTHQ3QUJjZGx0?=
 =?utf-8?B?dkoxV1Y5dkFZNlBNRjB3UGcxek1CaDJ3cnN0cFdKdWI3aVJFb0JHNGk2OS9T?=
 =?utf-8?B?clhqNFRXcUlmK0hHKzdEL056eE5MaDJYYkRJa0ZDb2w2NTRqcm84dWR1UFYz?=
 =?utf-8?B?TXFKSUIzZkNHQnNiY1FjaDJra0NlRk5aV1k4eEN5VENPK09pL0FCc05GRE1C?=
 =?utf-8?B?M09UZDl4WGl6aFdDQjNwUTFjN3BnZ05Pd1NMUFYrRlhSZW1QbEZqWU9lVWlO?=
 =?utf-8?B?Y1JYODRnM1JUSWxXUnFNc3JoUlR1c2ZYZnlKRFJuOE9nZUw3MlI4TWFCTnVZ?=
 =?utf-8?B?WnpDWk5aUFhiNGxNdXZ1NzZQWTZxWkxzeXJLNlJxeTZ4RVUySFVoWW1NYml6?=
 =?utf-8?B?L3dzNUZMRlRJUSt1cWtvR2NzK3NtbjMvRnQ4Zm4vRlNSeEd2MVZiUXc5R3lX?=
 =?utf-8?B?anZpL3NKaXRLQm1Ua1RsbW1FUzRzMjN5dHJnUEhDcGtaa2xMRWFMU0FQQ2pW?=
 =?utf-8?B?czJPUTJZUGd6dDdsWXFUMnpGemdKb1UrT2tFZk94MnRoaC9jQjQ2cFRCOWFC?=
 =?utf-8?B?ZW81S1ZPQ3N3OEloRG9TbDhxNmM4dHdsOEJwcnBIVVl3cW15ckVlSDVhNHJP?=
 =?utf-8?B?eitpVXNSdE9jLzAwa21lYlVSSFJ2eUZVN1JNUGJyZUxYU2k2WjQyd213Wnlw?=
 =?utf-8?B?MWJNVmpNL0xCTHpkZ3UrU3hmY0I2K244c2FzVk1XRk41OGU1aUtNUytRVFRs?=
 =?utf-8?B?WS9laTNrVDdBU0RPbmpRQyt0SG5kWC9FTXNwOU9QdUZNdGZPZnY3K3FIdjZx?=
 =?utf-8?B?aW9NUUlZTTJ1b0dxeVFHU0VMSDlhRWNXdkZMbi9NRUZLeXpuOS9GRHZ1ZmV6?=
 =?utf-8?B?bm52REVwZDVueHl2UjZNWVN4am1sMXZCelJTS0RjaENISGFuR3NLQWVxMTVU?=
 =?utf-8?B?SmJmWlRkYWV6U0pxd2pXRytiVFJQSXlZMkJUMmh6d09MM2kvZ1hXbkF1YkYx?=
 =?utf-8?B?Yjc0UTNmM2g5NzYvaHczZUg2MWdwYVV0YmQ4a3R5Wmk1QWtaa2gvcWpaUDhz?=
 =?utf-8?B?RVFvSzJ1WjAvNWdjQ2pmNitPUi9WUWNkTXJnNktiQVFYS2VDdFNvcExXeWhN?=
 =?utf-8?Q?E6PCsW5EWZ8XS/00BcAqbhKm+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe909fb5-68ae-4e35-7210-08da898377f4
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2022 05:58:17.4919 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5HOF9GQB182lDeD7736crp7rMkHnxQAnLuqEFXrcBoLTvZoIVdichDhkPRB5t6Fd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5301
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@linux.ie>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linaro-mm-sig@lists.linaro.org, Sumit Semwal <sumit.semwal@linaro.org>,
 linux-media@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Am 27.08.22 um 11:10 schrieb oushixiong:
> This patch adds ast specific codes for DRM prime feature, this is to
> allow for offloading of rending in one direction and outputs in other.
>
> This patch is designed to solve the problem that the AST is not displayed
> when the server plug in a discrete graphics graphics card at the same time.
> We call the dirty callback function to copy the rendering results of the
> discrete graphics card to the ast side by dma-buf.
>
> v1->v2:
>    - Fix the comment.
> v2->v3:
>    - we remove the gem_prime_import_sg_table callback and use the gem_prime_import
>      callback, becuase it just map and access the buffer with the CPU. and do not
>      to pin the buffer.
>
> Signed-off-by: oushixiong <oushixiong@kylinos.cn>

Thomas should probably comment as well, I think at least the memcpy_toio 
usage can still be made cleaner.

But from the DMA-buf side I think that looks good now, feel free to add 
an Acked-by: Christian König <christian.koenig@amd.com>

Regards,
Christian.

> ---
>   drivers/gpu/drm/ast/ast_drv.c  |  27 +++++++
>   drivers/gpu/drm/ast/ast_mode.c | 125 ++++++++++++++++++++++++++++++++-
>   2 files changed, 151 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/ast/ast_drv.c b/drivers/gpu/drm/ast/ast_drv.c
> index 7465c4f0156a..107383a56ca7 100644
> --- a/drivers/gpu/drm/ast/ast_drv.c
> +++ b/drivers/gpu/drm/ast/ast_drv.c
> @@ -28,6 +28,7 @@
>   
>   #include <linux/module.h>
>   #include <linux/pci.h>
> +#include <linux/dma-buf.h>
>   
>   #include <drm/drm_aperture.h>
>   #include <drm/drm_atomic_helper.h>
> @@ -50,6 +51,29 @@ module_param_named(modeset, ast_modeset, int, 0400);
>   
>   DEFINE_DRM_GEM_FOPS(ast_fops);
>   
> +struct drm_gem_object *ast_gem_prime_import(struct drm_device *dev,
> +						struct dma_buf *dma_buf)
> +{
> +	struct drm_gem_vram_object *gbo;
> +
> +	gbo = drm_gem_vram_of_gem(dma_buf->priv);
> +	if (gbo->bo.base.dev == dev) {
> +		/*
> +		* Importing dmabuf exported from out own gem increases
> +		* refcount on gem itself instead of f_count of dmabuf.
> +		*/
> +		drm_gem_object_get(&gbo->bo.base);
> +		return &gbo->bo.base;
> +	}
> +
> +	gbo = drm_gem_vram_create(dev, dma_buf->size, 0);
> +	if (IS_ERR(gbo))
> +		return NULL;
> +
> +	get_dma_buf(dma_buf);
> +	return &gbo->bo.base;
> +}
> +
>   static const struct drm_driver ast_driver = {
>   	.driver_features = DRIVER_ATOMIC |
>   			   DRIVER_GEM |
> @@ -63,6 +87,9 @@ static const struct drm_driver ast_driver = {
>   	.minor = DRIVER_MINOR,
>   	.patchlevel = DRIVER_PATCHLEVEL,
>   
> +	.prime_fd_to_handle = drm_gem_prime_fd_to_handle,
> +	.gem_prime_import = ast_gem_prime_import,
> +
>   	DRM_GEM_VRAM_DRIVER
>   };
>   
> diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
> index 45b56b39ad47..65a4342c5622 100644
> --- a/drivers/gpu/drm/ast/ast_mode.c
> +++ b/drivers/gpu/drm/ast/ast_mode.c
> @@ -48,6 +48,8 @@
>   #include "ast_drv.h"
>   #include "ast_tables.h"
>   
> +MODULE_IMPORT_NS(DMA_BUF);
> +
>   static inline void ast_load_palette_index(struct ast_private *ast,
>   				     u8 index, u8 red, u8 green,
>   				     u8 blue)
> @@ -1535,8 +1537,129 @@ static const struct drm_mode_config_helper_funcs ast_mode_config_helper_funcs =
>   	.atomic_commit_tail = drm_atomic_helper_commit_tail_rpm,
>   };
>   
> +static int ast_handle_damage(struct drm_framebuffer *fb, int x, int y,
> +					int width, int height)
> +{
> +	struct drm_gem_vram_object *dst_bo = NULL;
> +	void *dst = NULL;
> +	int ret = 0, i;
> +	unsigned long offset = 0;
> +	bool unmap = false;
> +	unsigned int bytesPerPixel;
> +	struct iosys_map map;
> +	struct iosys_map dmabuf_map;
> +
> +	bytesPerPixel = fb->format->cpp[0];
> +
> +	if (!fb->obj[0]->dma_buf)
> +		return -EINVAL;
> +
> +	if (!fb->obj[0]->dma_buf->vmap_ptr.vaddr) {
> +		ret = dma_buf_vmap(fb->obj[0]->dma_buf, &dmabuf_map);
> +		if (ret)
> +			return ret;
> +	} else
> +		dmabuf_map.vaddr = fb->obj[0]->dma_buf->vmap_ptr.vaddr;
> +
> +	dst_bo = drm_gem_vram_of_gem(fb->obj[0]);
> +
> +	ret = drm_gem_vram_pin(dst_bo, 0);
> +	if (ret) {
> +		DRM_ERROR("ast_bo_pin failed\n");
> +		return ret;
> +	}
> +
> +	if (!dst_bo->map.vaddr) {
> +		ret = drm_gem_vram_vmap(dst_bo, &map);
> +		if (ret) {
> +			drm_gem_vram_unpin(dst_bo);
> +			DRM_ERROR("failed to vmap fbcon\n");
> +			return ret;
> +		}
> +		unmap = true;
> +	}
> +	dst = dst_bo->map.vaddr;
> +
> +	for (i = y; i < y + height; i++) {
> +		offset = i * fb->pitches[0] + (x * bytesPerPixel);
> +		memcpy_toio(dst + offset, dmabuf_map.vaddr + offset,
> +			width * bytesPerPixel);
> +	}
> +
> +	if (unmap)
> +		drm_gem_vram_vunmap(dst_bo, &map);
> +
> +	drm_gem_vram_unpin(dst_bo);
> +
> +	return 0;
> +}
> +
> +
> +static int ast_user_framebuffer_dirty(struct drm_framebuffer *fb,
> +				struct drm_file *file,
> +				unsigned int flags,
> +				unsigned int color,
> +				struct drm_clip_rect *clips,
> +				unsigned int num_clips)
> +{
> +	int i, ret = 0;
> +
> +	drm_modeset_lock_all(fb->dev);
> +	if (fb->obj[0]->dma_buf) {
> +		ret = dma_buf_begin_cpu_access(fb->obj[0]->dma_buf,
> +				DMA_FROM_DEVICE);
> +		if (ret)
> +			goto unlock;
> +	}
> +
> +	for (i = 0; i < num_clips; i++) {
> +		ret = ast_handle_damage(fb, clips[i].x1, clips[i].y1,
> +				clips[i].x2 - clips[i].x1, clips[i].y2 - clips[i].y1);
> +		if (ret)
> +			break;
> +	}
> +
> +	if (fb->obj[0]->dma_buf) {
> +		dma_buf_end_cpu_access(fb->obj[0]->dma_buf,
> +				DMA_FROM_DEVICE);
> +	}
> +
> +unlock:
> +	drm_modeset_unlock_all(fb->dev);
> +
> +	return ret;
> +}
> +
> +static void ast_user_framebuffer_destroy(struct drm_framebuffer *fb)
> +{
> +	struct iosys_map dmabuf_map;
> +
> +	if (fb->obj[0]->dma_buf) {
> +		dmabuf_map.is_iomem = fb->obj[0]->dma_buf->vmap_ptr.is_iomem;
> +		dmabuf_map.vaddr = fb->obj[0]->dma_buf->vmap_ptr.vaddr;
> +		if (dmabuf_map.vaddr)
> +			dma_buf_vunmap(fb->obj[0]->dma_buf, &dmabuf_map);
> +	}
> +
> +	drm_gem_fb_destroy(fb);
> +}
> +
> +static const struct drm_framebuffer_funcs ast_gem_fb_funcs_dirtyfb = {
> +	.destroy	= ast_user_framebuffer_destroy,
> +	.create_handle	= drm_gem_fb_create_handle,
> +	.dirty		= ast_user_framebuffer_dirty,
> +};
> +
> +static struct drm_framebuffer *
> +ast_gem_fb_create_with_dirty(struct drm_device *dev, struct drm_file *file,
> +				const struct drm_mode_fb_cmd2 *mode_cmd)
> +{
> +	return drm_gem_fb_create_with_funcs(dev, file, mode_cmd,
> +					&ast_gem_fb_funcs_dirtyfb);
> +}
> +
>   static const struct drm_mode_config_funcs ast_mode_config_funcs = {
> -	.fb_create = drm_gem_fb_create,
> +	.fb_create = ast_gem_fb_create_with_dirty,
>   	.mode_valid = drm_vram_helper_mode_valid,
>   	.atomic_check = drm_atomic_helper_check,
>   	.atomic_commit = drm_atomic_helper_commit,

