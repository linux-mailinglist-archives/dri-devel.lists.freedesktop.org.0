Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E05B9361208
	for <lists+dri-devel@lfdr.de>; Thu, 15 Apr 2021 20:22:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9AA86EAB0;
	Thu, 15 Apr 2021 18:21:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2041.outbound.protection.outlook.com [40.107.223.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 954B96EAB0
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Apr 2021 18:21:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BlyRACeXhIWlilWSryaWc3JiGtRY1LlykcqKvnXxLYr5VIf0xBZM6eoWRNhUsktcX2iz3slgYpzQMlq5CMU8Lr3Xa3KY6aOAbQEL5N4xYiAbGjDS6BtPFPwmm2EH3eW82cancgE5RJR1rLUloC6ft6XI7VJ1L/TKC4kYpMtdFVXO6HZzuRNR+7CRlEeFKIMrzotr0H4iM4tRpUROnAJJym3GA7blabowkQ75vFqX7JJlgq3dMUbJHeOMonh5dfK2oENDE347CFJUEPCKbaiXyZmeNrVikVGxU7tRLqGexptQMcJdj+nkCA5NrZx1en5nkejRsSQzScITVIhoOntX+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EMwc8VNaVbwRDqfnUDbpmj2aNQWhlApW1+Z5n7bUX5M=;
 b=oF5wPhS3+ccwT3oOmumW4ozYybZY6Lgo2WNeEnuoUi9KJ1DEEL5ECympkC0oN9kn4HtljGrdHAN/NdH3iclexT70lDbHYkrDRVrYl/3/VGHmLw1CEbOsmFvTBK9vdVwUMU44FHGZiDFZx3jzxqJnsx/iRGb3/t67HRQeSaA3HzW1C4deBsWQ6LblI1qBb2P8Q0ib5o4mIgj8HwQIJjn0jv11hxbyBon5b432U1cltykf0ZlQt4fZiyQwA5HUeU5KXd1D6YMYumq9qIfI8iokzupd5l6FgUlLyaGlfOxMzJEE054A9bdRQlsnk0jKW1jRe5D3CuyBt1/rjbCT6qtHoA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vmware.com; dmarc=pass action=none header.from=vmware.com;
 dkim=pass header.d=vmware.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vmware.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EMwc8VNaVbwRDqfnUDbpmj2aNQWhlApW1+Z5n7bUX5M=;
 b=QuM8VtVua8c47CbUQo/CU2mq3I+/3JsJCOYRZhC908m29NSjLZWsmjwRym1hJ/1ArFcQa87r8vzCDOWumQ0IEtbgkA4rKCl0TVi2TndJSqzqfCbkuWc4r3aBHTk7MPI/BL//1+NVo/zodKEyjH46gIRv94cY/azX3WWZKgnSifc=
Authentication-Results: lists.infradead.org; dkim=none (message not signed)
 header.d=none;lists.infradead.org; dmarc=none action=none
 header.from=vmware.com;
Received: from MN2PR05MB6624.namprd05.prod.outlook.com (2603:10b6:208:d8::18)
 by MN2PR05MB6558.namprd05.prod.outlook.com (2603:10b6:208:e3::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4042.10; Thu, 15 Apr
 2021 18:21:47 +0000
Received: from MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::603b:4954:dbec:c02]) by MN2PR05MB6624.namprd05.prod.outlook.com
 ([fe80::603b:4954:dbec:c02%7]) with mapi id 15.20.4042.016; Thu, 15 Apr 2021
 18:21:47 +0000
Subject: Re: [PATCH 1/4] drm/vmwgfx: Make console emulation depend on
 DRM_FBDEV_EMULATION
To: Thomas Zimmermann <tzimmermann@suse.de>,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@linux.ie,
 daniel@ffwll.ch, marex@denx.de, stefan@agner.ch, shawnguo@kernel.org,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 linux-imx@nxp.com, linux-graphics-maintainer@vmware.com, sroland@vmware.com
References: <20210415110040.23525-1-tzimmermann@suse.de>
 <20210415110040.23525-2-tzimmermann@suse.de>
From: Zack Rusin <zackr@vmware.com>
Message-ID: <af143092-edd3-91eb-025d-836de1e4a104@vmware.com>
Date: Thu, 15 Apr 2021 14:21:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
In-Reply-To: <20210415110040.23525-2-tzimmermann@suse.de>
Content-Language: en-US
X-Originating-IP: [108.36.85.85]
X-ClientProxiedBy: BL1PR13CA0344.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::19) To MN2PR05MB6624.namprd05.prod.outlook.com
 (2603:10b6:208:d8::18)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [192.168.0.193] (108.36.85.85) by
 BL1PR13CA0344.namprd13.prod.outlook.com (2603:10b6:208:2c6::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4065.8 via Frontend
 Transport; Thu, 15 Apr 2021 18:21:47 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 2a213fdf-dfab-4881-540d-08d9003b549b
X-MS-TrafficTypeDiagnostic: MN2PR05MB6558:
X-LD-Processed: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0,ExtAddr
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <MN2PR05MB65585EB683CD0EBCADA3050ACE4D9@MN2PR05MB6558.namprd05.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:5236;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +sT1QSRbCfzasfZkzdhzCejZGLh8wBoGO5T7LZN529PhFzSlG5ibudN9fTErh2d/4uvIj3uPTW6KoG8sTZv/XJYr+6HGW+dRefs52DVjjClZB25Jga6nTYAGZzdVHpKsmMjdbeN8ZpiKfN/wHoe3jjnz09sDrqtUp8etoQ2Tg9bA+K2AwvX9qWBqHwgH6aBUwNm7J9+xw0WZFPrJqCY/qrtHKfoahb1nnpGguT6WdqyMvNJ3jViWS44fObv1L+Kpm2Y5B9tknZ1t9L+VF4I/odRyrmREf3uvmq0KWKHBai+KY1W/LLlR0wkmEa1qbnkjnh2UTGFveTox96k/ep/nFenQBipjfxCU3ZBrFisQbA001JjxN/LqsDGh8hqMnKDXtwPrSZ88SQCd6Yat4GKU0oS5Qc/0MCB1ZUZ2IN+TGod/bEJbRsl5F0Okj0is9np9jgS/1CSLkMr6b85f5geYjN5x/TWnor+HhOcoIL4I0eDHThvwLQ1ahscyL98X8KLIM5mrZE+cf1e1RTkt1l6OH87qaU6//Jh0lIS2sgVJfSvZHhhlZXpXJIr7JW6TvbVoSofnAo2bccPeR0B6PzaNDbmLl0Eeahyf2oakmtsXLcZfQCw7/dXcu/6An3dCIWzu1vsuFzwuWicOlMeqvQtANfYelogtxlzli0c3h6Rx/rBOJ03iv8FcuymegP7oYl9WQixq5CCKhFJJeCg7MvYZPw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN2PR05MB6624.namprd05.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(396003)(346002)(136003)(376002)(39860400002)(366004)(316002)(7416002)(8676002)(16576012)(66476007)(38100700002)(36756003)(6486002)(6636002)(956004)(4326008)(83380400001)(2616005)(53546011)(2906002)(478600001)(31696002)(16526019)(5660300002)(66556008)(921005)(186003)(26005)(31686004)(86362001)(8936002)(66946007)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?S3RnR3dCVmFEb1pQS3dqcWhPLzFXZzNmS2p4ZG80T0lRY1lNSEs0dzdBaWVD?=
 =?utf-8?B?WEFLc05BYisvbkF5MWU5YlZlanhiV3J4SDVxTFNYWDVGQUtYQXRaNUdsQXVm?=
 =?utf-8?B?a0pUcjhMYURBZWx2bzVPQWQ4Tm53allBekg3WVJxemZuUHVzYjN3NDlPMmdU?=
 =?utf-8?B?T284bUZISUZJTHdBTlVkbW8rVkl1b1RpaDJzaURQVXFQaXMrVTFmcTRleUkv?=
 =?utf-8?B?RzFjZ2tCYkxiRE1WOFM3eHNXanpCTUMyc3hnZ0tXS2czMDdZekhHN3M5TFdq?=
 =?utf-8?B?UXQ5ZkloNStWajJFRjVKM05ISzV1dURGL1VBVkJrQU1BSnBRd2duTGpGUEVH?=
 =?utf-8?B?cWU5VjN6cEhrYlVyZDBnZExadFg4WkpWall1cWFwRnlaSUlseHU3YnozaXJS?=
 =?utf-8?B?YU1vdzJzcWtXcERmQnZBbzhQYnRJQk1MUkJKclRybTlJSDRlR3E1Y1VPazc0?=
 =?utf-8?B?ME1aQzNteTBad0pKcEJza3ZWbWhTL3h5MzRGdHdxQlhlQlAzbkVvZUVGaW5V?=
 =?utf-8?B?c1RFN1RsRWpzUkdhbW4zUTJ4WEljTUtNb1NweFlMbnRnR2xKN2NxSmV4YldQ?=
 =?utf-8?B?Vy9ob0E5K3lsT2lzTkR5b1BvSHkzSWtOQThFLzZnNStiWGJRQjB3RndxZjcw?=
 =?utf-8?B?YTV2Und3ZnRNZWQwUFRGNC9oUytrVmx6QzNLL1FHUHEzcVFyYVhka3o4NnQz?=
 =?utf-8?B?TWVnRU9JQlpLZjdKZm1mOUE2UWVuQXNzRW8yZmpqSC9BRlJzU0pJM3RJNVlN?=
 =?utf-8?B?MTExMC9JQ3R6SzVOT3puVDVDTFJFSm0xMzI2VkU1TnFlSUwvMzdHaitDb21q?=
 =?utf-8?B?eS96RVlzNlNzblZGTzZGRE1VZm9hWEZ6Y1h3M2RTOE9ldHFHdWg5YjE3YTVX?=
 =?utf-8?B?cWZCOUY4dGRmOXVrQWNuTDZoYlhwRnF2ZFBDODRrdHpTZCtCdkhtTzRRSXNp?=
 =?utf-8?B?SDMrbFRWSHJ3YTNVcWQ2enRsdWZnOE0yRFI0ckttVXZVNlNUR2doMEhaY2I2?=
 =?utf-8?B?bWZxbnB2ZWNyRGFQQWpHOEM3UFgyalV2T2xyTzlSY2t1cS9RUHMvaVNjTnBY?=
 =?utf-8?B?S25VQ0FBK0ZaVFpNcW1aSldMejVpc1JvMU12U1JZVnBEUlFtYVRlU2FpV1FI?=
 =?utf-8?B?V2g2a3E3NHdFZXJzellGTlIwNzRTWGFWT2psSlpJT3BLTUZQKzEyYk05RU9V?=
 =?utf-8?B?QXdvZU9PQmVQV2MyRUV5SlhpUjhQaHZLbE5wTE1IbjRMbVRxak5KaGVKZWdy?=
 =?utf-8?B?MmRuT3dwd2NjVFEwL1VkSytZbjRrM0lYWlV3WStyRUJhbzF2L0ZmQ3UySW9i?=
 =?utf-8?B?Vkt3U3dHV2ltNTV4c2pEYVZmc1lsVUU0a016VkJpQTJIdkFqUzd6bkhUTWZj?=
 =?utf-8?B?L2VKVEd1dnhCZXNaVFVSWUpOWmF1TzQ0aTR3WDM3cWdFaFNqZVZHRG11UmVW?=
 =?utf-8?B?T1ZXVjh2SWJEZkp3dWRuM0xvZ2ZxNFZkQ0tzMFF5MndTWUtaT2RSUDNTZUc3?=
 =?utf-8?B?YkkxNlNET0F0WVQ2SFd2dDZHQjVoZFVoc2VwTzljSDVjeHRmNkhrbjhqOFEv?=
 =?utf-8?B?UUpLTmVaMnlQbjFTZWUwQS9NQ0wzRjRCK1ByelcvR2orNEJmS2NHazRJSUNT?=
 =?utf-8?B?cWljNkZVYUszTEVJWlZUMFNWZW52TFk1YU95STE0RjhHWS9nbW9mem9MZm56?=
 =?utf-8?B?VTBLSjcvUzlMSkZCYTNscXI5TVpqcUxLTGl6L1pJMlJ5cXVCSElSSjc3aUxq?=
 =?utf-8?Q?C5tiDQAnXAfWU2Y0+n5RGn58hEKnjghP3Wfugou?=
X-OriginatorOrg: vmware.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2a213fdf-dfab-4881-540d-08d9003b549b
X-MS-Exchange-CrossTenant-AuthSource: MN2PR05MB6624.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Apr 2021 18:21:47.6279 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: b39138ca-3cee-4b4a-a4d6-cd83d9dd62f0
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3J4orDY07A/U2RByvBULkTx2qZb7M8/23SbRJiGSlB3n1mTHENo19oyXHkdVn0Ap+QHFi5wVhhawka9/McCHmA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR05MB6558
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
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 4/15/21 7:00 AM, Thomas Zimmermann wrote:
> Respect DRM's kconfig setting for fbdev console emulation. If enabled,
> it will select all required config options. So remove them from vmwgfx's
> Kconfig file.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
> ---
>   drivers/gpu/drm/vmwgfx/Kconfig      |  7 +------
>   drivers/gpu/drm/vmwgfx/Makefile     |  4 +++-
>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h | 19 +++++++++++++++++++
>   3 files changed, 23 insertions(+), 7 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/Kconfig b/drivers/gpu/drm/vmwgfx/Kconfig
> index 15acdf2a7c0f..b3a34196935b 100644
> --- a/drivers/gpu/drm/vmwgfx/Kconfig
> +++ b/drivers/gpu/drm/vmwgfx/Kconfig
> @@ -2,12 +2,7 @@
>   config DRM_VMWGFX
>   	tristate "DRM driver for VMware Virtual GPU"
>   	depends on DRM && PCI && X86 && MMU
> -	select FB_DEFERRED_IO
> -	select FB_CFB_FILLRECT
> -	select FB_CFB_COPYAREA
> -	select FB_CFB_IMAGEBLIT
>   	select DRM_TTM
> -	select FB
>   	select MAPPING_DIRTY_HELPERS
>   	# Only needed for the transitional use of drm_crtc_init - can be removed
>   	# again once vmwgfx sets up the primary plane itself.
> @@ -20,7 +15,7 @@ config DRM_VMWGFX
>   	  The compiled module will be called "vmwgfx.ko".
>   
>   config DRM_VMWGFX_FBCON
> -	depends on DRM_VMWGFX && FB
> +	depends on DRM_VMWGFX && DRM_FBDEV_EMULATION
>   	bool "Enable framebuffer console under vmwgfx by default"
>   	help
>   	   Choose this option if you are shipping a new vmwgfx
> diff --git a/drivers/gpu/drm/vmwgfx/Makefile b/drivers/gpu/drm/vmwgfx/Makefile
> index 8c02fa5852e7..9f5743013cbb 100644
> --- a/drivers/gpu/drm/vmwgfx/Makefile
> +++ b/drivers/gpu/drm/vmwgfx/Makefile
> @@ -1,6 +1,6 @@
>   # SPDX-License-Identifier: GPL-2.0
>   vmwgfx-y := vmwgfx_execbuf.o vmwgfx_gmr.o vmwgfx_kms.o vmwgfx_drv.o \
> -	    vmwgfx_fb.o vmwgfx_ioctl.o vmwgfx_resource.o vmwgfx_ttm_buffer.o \
> +	    vmwgfx_ioctl.o vmwgfx_resource.o vmwgfx_ttm_buffer.o \
>   	    vmwgfx_cmd.o vmwgfx_irq.o vmwgfx_ldu.o vmwgfx_ttm_glue.o \
>   	    vmwgfx_overlay.o vmwgfx_gmrid_manager.o vmwgfx_fence.o \
>   	    vmwgfx_bo.o vmwgfx_scrn.o vmwgfx_context.o \
> @@ -11,5 +11,7 @@ vmwgfx-y := vmwgfx_execbuf.o vmwgfx_gmr.o vmwgfx_kms.o vmwgfx_drv.o \
>   	    vmwgfx_validation.o vmwgfx_page_dirty.o vmwgfx_streamoutput.o \
>   	    ttm_object.o ttm_lock.o ttm_memory.o
>   
> +vmwgfx-$(CONFIG_DRM_FBDEV_EMULATION) += vmwgfx_fb.o
>   vmwgfx-$(CONFIG_TRANSPARENT_HUGEPAGE) += vmwgfx_thp.o
> +
>   obj-$(CONFIG_DRM_VMWGFX) := vmwgfx.o
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> index 7e6518709e14..e7836da190c4 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> @@ -1116,10 +1116,29 @@ extern void vmw_generic_waiter_remove(struct vmw_private *dev_priv,
>    * Kernel framebuffer - vmwgfx_fb.c
>    */
>   
> +#ifdef CONFIG_DRM_FBDEV_EMULATION
>   int vmw_fb_init(struct vmw_private *vmw_priv);
>   int vmw_fb_close(struct vmw_private *dev_priv);
>   int vmw_fb_off(struct vmw_private *vmw_priv);
>   int vmw_fb_on(struct vmw_private *vmw_priv);
> +#else
> +static inline int vmw_fb_init(struct vmw_private *vmw_priv)
> +{
> +	return 0;
> +}
> +static inline int vmw_fb_close(struct vmw_private *dev_priv)
> +{
> +	return 0;
> +}
> +static inline int vmw_fb_off(struct vmw_private *vmw_priv)
> +{
> +	return 0;
> +}
> +static inline int vmw_fb_on(struct vmw_private *vmw_priv)
> +{
> +	return 0;
> +}
> +#endif
>   
>   /**
>    * Kernel modesetting - vmwgfx_kms.c
> 

This changes the behavior a bit, I guess DRM_VMWGFX (or at least DRM_VMWGFX_FBCON) would need to select DRM_FBDEV_EMULATION to preserve the old behavior, but that's largely due to the fact that given how those options were setup we never run without FB set. In general it should be ok and looks more reasonable than the current setup. I'll try it out on Monday just in case, but for now:

Reviewed-by: Zack Rusin <zackr@vmware.com>

z
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
