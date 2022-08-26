Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E95845A21DA
	for <lists+dri-devel@lfdr.de>; Fri, 26 Aug 2022 09:29:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47CCB10E6D5;
	Fri, 26 Aug 2022 07:29:50 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2050.outbound.protection.outlook.com [40.107.244.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F274810E6D5
 for <dri-devel@lists.freedesktop.org>; Fri, 26 Aug 2022 07:29:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uh9IrLfXhnxiaWn/tVviS8B+o3eKB2S4F/Uf+bsbqhH0byUNLpLhCG9PBB8m9zyIfboWnFNWtJKF85H9w6/KV9iDIsWqSEm0tPn14pXD6r5fFWCZSEvEPq+NoAQlDLZ2vs2eGrDpluwwEZWBfaBr/Bdd4tP/LSTOlcM1o9MVFALQib0CIriIxnaqlFAjvEwMzy9nZ+jcDDWQZT90B0BQdUjZPj1Wsjvwf5QLg2/5w668C2CccfNnWVtvySMbcmRxuRpO6qAgzSx2SR2NbIUV9Clpz/KW9a2wwwbZBNPCfrGaqBxq2udbS7+gqlitVf013ITObafPAlpf0IkweumhRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4WJOqnblUkybLK5WXkY7NnlWum6MtR69AQ0pPycS1AE=;
 b=WlJjPsJufweWZDpRrvW0CawdyJxrjxo0b1HE+M8I9Rq/2DnVVuAS6+8L3H2xI9G6tSjVe703kQbMV84csTdgvTXCZERqAyQk/j/BJHWXVWXgSrSsmhjjaiBKEZIaJ0CNROEppHrkz8Zox0zhzC7fxtZy81vBmcqXHvZMrwijvN3AezxtdeZCB6OUCPXC765xDjlsMrF3McJt5pHstyhoHqN7DqyfO6uddmQVUVhcnt8kivDXuxeNO/1Xs7TrEr/wLZLOj75F/p9mrxPZkCn6nzhzpTlV6ZfyTk7lNiGua8Ak1pIvV37qvPyBT2AGI/VNirZqcW/MfVnnvd9q6PNnZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4WJOqnblUkybLK5WXkY7NnlWum6MtR69AQ0pPycS1AE=;
 b=h0IB7xj7At3Nlc3EvOfjMaGlBu/ATIwQUSg+OwWxce9ch9vOSkNWNDUISDRmjoVsIHkIXgd0MkpgaAxUJdAQauTaLuh+uX1zrJZvVNg9BipB8bJdvjPf7rd+/iN+W3qHRVr/slHePTEpkS2AHSOedIxOgeXB0plCAtqB6O8y9yY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN8PR12MB3587.namprd12.prod.outlook.com (2603:10b6:408:43::13)
 by DS7PR12MB6333.namprd12.prod.outlook.com (2603:10b6:8:96::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5566.15; Fri, 26 Aug
 2022 07:29:43 +0000
Received: from BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94]) by BN8PR12MB3587.namprd12.prod.outlook.com
 ([fe80::4524:eda6:873a:8f94%7]) with mapi id 15.20.5566.015; Fri, 26 Aug 2022
 07:29:43 +0000
Message-ID: <76882e3a-6061-e5f3-fe69-7928de91ba17@amd.com>
Date: Fri, 26 Aug 2022 09:29:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] drm/ast: add dmabuf/prime buffer sharing support
Content-Language: en-US
To: oushixiong <oushixiong@kylinos.cn>, Dave Airlie <airlied@redhat.com>
References: <20220826013103.1519411-1-oushixiong@kylinos.cn>
From: =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
In-Reply-To: <20220826013103.1519411-1-oushixiong@kylinos.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS9PR04CA0143.eurprd04.prod.outlook.com
 (2603:10a6:20b:48a::24) To BN8PR12MB3587.namprd12.prod.outlook.com
 (2603:10b6:408:43::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 65a3a6b1-086e-4f28-0c88-08da8734bed1
X-MS-TrafficTypeDiagnostic: DS7PR12MB6333:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wSS22a/3dpWuDx//UDI6/Am1LWqhIkorMd+zhPArd1kDshJebwHcmraP5jcPEJIAclzFsUc9cx97aNrZWXf5omvmNtbc+b/tzItB/V9r+N6Yjip+w847A0NZRLKeev3jAvXJUS03fL710adK1q90eEZIIeOvTWKUVtwCN5F9bdChiQG3pMV8B1iW0SuDfX7FPTjvshxEgzHYcDx0Skr1yaJF1kHiAzXQ+nX829NhGDBUgs/73703bO2x3dl7Id8sVyQBSGoFZ3kZRTSkkTk1ulSAToFXpJaKW+NbcNZl+6NPhQOoz0EbOcS9AlkUVoPZjPVn/n+8AIjF44dQzoY9lYZIhM07AR0gqyeMODPfyId+cOlCY4K2WKS/iq4Xv30SGo6BV8qynbM0kb3ffZnQ3/PvWu2lFoqUdczkjHXqfBWSTjlnJ0+TZP5frz/J17ormv26JDTcAgjCt/91IT9ODI2dmYIzCAkhVYAICa4+Xu9u82swIY/kUohu5PJmEQZ0qBc+LkTxb1/7C8MDKHXJ2NrW/rFTk7vn7r+KD15LUcvVp4jhV9O5n40T0T4iIqiC5B8zFbE/iMKT79nvYApFsj3ZfKHOvonf8SSis3Q7FCmlJYbwjTn2WyLHX6Lyq7wahuPHyRZHemqNNsRYZBjeACMIFkVRxHG2UpXTIgGJsO+ysUiOV1OU8HMv+0ZPf9vbMweBHaCsG0HI1Gb8vVueSXbMgotXZwt5HTVwG1aVXNeAPSkd7ORNxalugOk7YJ30QkaAjoA+i++iZ3kJ9UvOvcHb6FzpIrYoBAIWEY+swUw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR12MB3587.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230016)(4636009)(366004)(376002)(396003)(136003)(39860400002)(346002)(110136005)(31686004)(36756003)(54906003)(83380400001)(7416002)(5660300002)(8936002)(4326008)(66476007)(66556008)(66946007)(2906002)(8676002)(316002)(31696002)(6666004)(41300700001)(6512007)(2616005)(186003)(6486002)(86362001)(26005)(6506007)(478600001)(38100700002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGthMXExUUdBbWdrcjJPVll4MGlIUDAxd2QrbHVseERzS0VKeGR3dkNoNmdP?=
 =?utf-8?B?T3BqK1kxLzNPenVXRnV6bWRmbFJpcFhXUGE0VHp3N0Z3alBEVGgwR1BDL21w?=
 =?utf-8?B?cFJJZnpMMndHWXByQ3FkQ1JXaEdRY0FwTmtBOERjenVyRTF1VlJ6ckZ4UC9h?=
 =?utf-8?B?TmJGK21FUmNrVW90bndyYU1jQ2Vtc2tyYlpObEtCSlIrWFlKVVBHaG5QS0Jv?=
 =?utf-8?B?ZHNBNmVsU1BKOWtVdStZbzZLSkhIaVJrK2JNM0t5M0RVYThlRjJkSDdjUFNx?=
 =?utf-8?B?UWFOUkdwbWNVZ2c1dTVMMTRlZVRpbEVwY2xlZVBZNVp6ZjBCL2hOUURIV0VQ?=
 =?utf-8?B?TEs3cnNIWFdaSkhGbFB4anVnME1QNVJnREZZUkZ3S1lxMFRNejNnejdZdWdD?=
 =?utf-8?B?Qm91LzV5VXZaMmtLZURqbnZtYnN2YS9kUDF0cTVwL2U3Q1VzUjRDTnh0bGdX?=
 =?utf-8?B?MFFUZk1hUmhjMS93L3RGRE5RbnNERHgxSEw1SWo3QnJxdTk4aDNuZUtQbGds?=
 =?utf-8?B?bHRxSWRoS2R4TGRHNERtZk5IblpwT2c3QlhzdGVOaUxqNG96S3dObnR0ZWF6?=
 =?utf-8?B?ekhPZjhSM3VqS29xUnpZZlpQd0dlY0YyQVU1SXovN21SZzRsSFJhalB4R2FN?=
 =?utf-8?B?UWlkZ0Q4Q0RpendFZnhCb1dRRXlaU2prWVY0MVNBeGxyeTRPNzFYa3dUQnFW?=
 =?utf-8?B?YjN1bkRGRjFwdDdZcThiaEplay9EUGRib3Mwc3ZNVTZxakxyRUZhRk8vOGJ3?=
 =?utf-8?B?ZTErb2hSRWdIQlBPcVJzd2VWdkRFM0JMNlY2YXRiSW5WWHQyZFJtV3Y2SGIx?=
 =?utf-8?B?Ny85WmtrRUFOcjFlZDl1ZTRQMVBHUHp2UVI4b0Y5UnZtQzlTR0Q5bUZFY0tS?=
 =?utf-8?B?TWNFU2NDcGwyOHVQOXMxR3NDMi9IWEcwbUpEM0hQMFFBMzFyeWVhRkYraXBC?=
 =?utf-8?B?MUFtMXdSUkl1a21ZYUlXN3Y4dTl3ZG40NWVwMklrbnBnMGsrdmYxcFRpUVFI?=
 =?utf-8?B?c3dvSVZudzlyYUF0ZHFaRzZRRWdsTFVwZ0c0aWkwS09KTkV4YWEzcHlvY3Y2?=
 =?utf-8?B?T25RdlRLWG1KQi9LdklxMDdJMXRZbmNWZEVUa1dGMkl3cjFsTFZRc2loa0hD?=
 =?utf-8?B?Z3JHcUxoWGN6cGljUlRVYzhITVpLdzd5TGNTSFhEQlRaRUxpdmxXMHBNSWtm?=
 =?utf-8?B?QS9DVnNlS2NVWFZ0NU5Cd3dMVkZuTFluRnVNM2FtSnRyMlY5Z3ZNelNjakIv?=
 =?utf-8?B?a0NPMzNudkEyOVhGS05uVytUNW1FZlhsRmhTYzdKYWZLdGZIbGVYc09CbWxi?=
 =?utf-8?B?b1pMTGgwZG81c3JGZFc1a0J5eVFFNmVTeFVzcGJrOHhxbTFvYlhVVmtmck0x?=
 =?utf-8?B?WUl1VmpqUmNBak1IZmgzYVNhRjJtR3N4NDVETUtDT2o3Vk1ZSGl6b3lSWHF2?=
 =?utf-8?B?bzBrcGtlU1pOUFkxemNTcmY2SFBiamtweENRWlY5aXBjT1dWcGQ0bEMwREt0?=
 =?utf-8?B?bUxvalFtRmVvZzU5RnhyNXllcFpKMEE5ZlJnQS8zMjR6T3daUnJzcW0yb1NH?=
 =?utf-8?B?cVFIVDB3eXEyTktFTjZjdy8vajc4NGpjOXQvM2VkaDNKZVhYZVB4S2k4Y1Va?=
 =?utf-8?B?YjBYTWtYb3RneWdGRVBiMGtETllqZ09pNjdMQWs0TkVYRnhRY0tjVXArcDl5?=
 =?utf-8?B?SlFDV05GK2RYaDJBWnNZbCttSjRHVUw3dkJlaHhWK3VrblEwOEFVUDlJazVN?=
 =?utf-8?B?YTE4NVVRYVp1dGpPY1ZwU1Mzd3JIMVBMbXA0aE5CZ1B0NjVTTWYzcVAxL3Zm?=
 =?utf-8?B?Qi9PamsxcUtlNGF1UTNPSUdHRCtOVndKQlIzK2dhcEtYZUowYkpGUG05K2w5?=
 =?utf-8?B?bHp4T0ZiQlJ5QXFxZ25ndmgxQ0RJMFEzdk11VUREQWhXQUszOURWMXNUS3Z1?=
 =?utf-8?B?U3VkV1lVRkF3RnNjSTFRS0EyY3ZoVkRhZDgxaUZZUkZmek1WaWxWdEZCb2hS?=
 =?utf-8?B?V2tMRTRoRnNRTUpuOCt4enZaM3FCZHlZRmxVd0thOTllUmFKUkdIVDFHdWVY?=
 =?utf-8?B?cHlNM2ZlVW1pTHBDa1ZCamdsU1dvN0pIcERtcXU5S0hDS0lGdUlZa1hXMzNs?=
 =?utf-8?Q?Uqh7bFLsQ4y8Q7dvg+AWsONDQ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65a3a6b1-086e-4f28-0c88-08da8734bed1
X-MS-Exchange-CrossTenant-AuthSource: BN8PR12MB3587.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Aug 2022 07:29:43.6860 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SkfMWjPJUcjKoRt0Xds8LMJ4jxKHjYsnz8E3puMph1M2JHSRxEcpVctqIUfgXTm3
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6333
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

Am 26.08.22 um 03:31 schrieb oushixiong:
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
>    - we remove the attach function, add the drm_gem_pin() before dma_buf_vmap(),
>      and add the drm_gem_unpin() after the dma_buf_vunmap().
>
> Signed-off-by: oushixiong <oushixiong@kylinos.cn>
> ---
>   drivers/gpu/drm/ast/ast_drv.c  |  27 +++++++
>   drivers/gpu/drm/ast/ast_mode.c | 134 ++++++++++++++++++++++++++++++++-
>   drivers/gpu/drm/drm_gem.c      |   2 +
>   include/drm/drm_gem.h          |   3 +
>   4 files changed, 165 insertions(+), 1 deletion(-)
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
> index 45b56b39ad47..c81a6148b6df 100644
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
> @@ -1535,8 +1537,138 @@ static const struct drm_mode_config_helper_funcs ast_mode_config_helper_funcs =
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
> +		ret = drm_gem_pin(fb->obj[0]->dma_buf->priv);
> +		if (ret)
> +			return ret;

This is an full blown NAK to this!

By accessing dma_buf->priv you are assuming that this points to a GEM 
buffer.

Additional to that pinning the buffer shouldn't be necessary for a call 
to dma_buf_vmap().

Regards,
Christian.

> +		ret = dma_buf_vmap(fb->obj[0]->dma_buf, &dmabuf_map);
> +		if (ret)
> +			goto err_vmap_dmabuf;
> +	} else
> +		dmabuf_map.vaddr = fb->obj[0]->dma_buf->vmap_ptr.vaddr;
> +
> +	dst_bo = drm_gem_vram_of_gem(fb->obj[0]);
> +
> +	ret = drm_gem_vram_pin(dst_bo, 0);
> +	if (ret) {
> +		DRM_ERROR("ast_bo_pin failed\n");
> +		goto err_ast_pin;
> +	}
> +
> +	if (!dst_bo->map.vaddr) {
> +		ret = drm_gem_vram_vmap(dst_bo, &map);
> +		if (ret) {
> +			DRM_ERROR("failed to vmap fbcon\n");
> +			goto err_vmap_ast_bo;
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
> +	return 0;
> +
> +err_vmap_ast_bo:
> +	drm_gem_vram_unpin(dst_bo);
> +err_ast_pin:
> +err_vmap_dmabuf:
> +	drm_gem_unpin(fb->obj[0]->dma_buf->priv);
> +	return ret;
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
> +		drm_gem_unpin(fb->obj[0]->dma_buf->priv);
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
> diff --git a/drivers/gpu/drm/drm_gem.c b/drivers/gpu/drm/drm_gem.c
> index 56fb87885146..3a4f5137abc5 100644
> --- a/drivers/gpu/drm/drm_gem.c
> +++ b/drivers/gpu/drm/drm_gem.c
> @@ -1159,12 +1159,14 @@ int drm_gem_pin(struct drm_gem_object *obj)
>   	else
>   		return 0;
>   }
> +EXPORT_SYMBOL(drm_gem_pin);
>   
>   void drm_gem_unpin(struct drm_gem_object *obj)
>   {
>   	if (obj->funcs->unpin)
>   		obj->funcs->unpin(obj);
>   }
> +EXPORT_SYMBOL(drm_gem_unpin);
>   
>   int drm_gem_vmap(struct drm_gem_object *obj, struct iosys_map *map)
>   {
> diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
> index e2941cee14b6..30c4366968bf 100644
> --- a/include/drm/drm_gem.h
> +++ b/include/drm/drm_gem.h
> @@ -352,6 +352,9 @@ int drm_gem_mmap_obj(struct drm_gem_object *obj, unsigned long obj_size,
>   		     struct vm_area_struct *vma);
>   int drm_gem_mmap(struct file *filp, struct vm_area_struct *vma);
>   
> +int drm_gem_pin(struct drm_gem_object *obj);
> +void drm_gem_unpin(struct drm_gem_object *obj);
> +
>   /**
>    * drm_gem_object_get - acquire a GEM buffer object reference
>    * @obj: GEM buffer object

