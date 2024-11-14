Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96E859C852A
	for <lists+dri-devel@lfdr.de>; Thu, 14 Nov 2024 09:48:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DF0410E22A;
	Thu, 14 Nov 2024 08:48:48 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
X-Greylist: delayed 1005 seconds by postgrey-1.36 at gabe;
 Thu, 14 Nov 2024 03:21:17 UTC
Received: from szxga08-in.huawei.com (szxga08-in.huawei.com [45.249.212.255])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7469E10E012
 for <dri-devel@lists.freedesktop.org>; Thu, 14 Nov 2024 03:21:17 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.88.105])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4XplLH5rvZz1V46M;
 Thu, 14 Nov 2024 11:01:59 +0800 (CST)
Received: from kwepemd100013.china.huawei.com (unknown [7.221.188.163])
 by mail.maildlp.com (Postfix) with ESMTPS id BFC0B1400DC;
 Thu, 14 Nov 2024 11:04:29 +0800 (CST)
Received: from [10.67.109.79] (10.67.109.79) by kwepemd100013.china.huawei.com
 (7.221.188.163) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Thu, 14 Nov
 2024 11:04:29 +0800
Message-ID: <b0de8aff-348d-4c80-96f7-22b91c9d5940@huawei.com>
Date: Thu, 14 Nov 2024 11:04:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/vmwgfx: avoid null_ptr_deref in
 vmw_framebuffer_surface_create_handle
To: Chen Ridong <chenridong@huaweicloud.com>, <zack.rusin@broadcom.com>,
 <bcm-kernel-feedback-list@broadcom.com>, <maarten.lankhorst@linux.intel.com>, 
 <mripard@kernel.org>, <tzimmermann@suse.de>, <airlied@gmail.com>,
 <simona@ffwll.ch>, <maaz.mombasawala@broadcom.com>,
 <martin.krastev@broadcom.com>
CC: <dri-devel@lists.freedesktop.org>, <wangweiyang2@huawei.com>
References: <20241029083429.1185479-1-chenridong@huaweicloud.com>
Content-Language: en-US
From: chenridong <chenridong@huawei.com>
In-Reply-To: <20241029083429.1185479-1-chenridong@huaweicloud.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.79]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemd100013.china.huawei.com (7.221.188.163)
X-Mailman-Approved-At: Thu, 14 Nov 2024 08:48:47 +0000
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



On 2024/10/29 16:34, Chen Ridong wrote:
> From: Chen Ridong <chenridong@huawei.com>
> 
> The 'vmw_user_object_buffer' function may return NULL with incorrect
> inputs. To avoid possible null pointer dereference, add a check whether
> the 'bo' is NULL in the vmw_framebuffer_surface_create_handle.
> 
> Fixes: d6667f0ddf46 ("drm/vmwgfx: Fix handling of dumb buffers")
> Signed-off-by: Chen Ridong <chenridong@huawei.com>
> ---
>  drivers/gpu/drm/vmwgfx/vmwgfx_kms.c | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> index f39bf992364d..8db38927729b 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> @@ -1265,6 +1265,8 @@ static int vmw_framebuffer_surface_create_handle(struct drm_framebuffer *fb,
>  	struct vmw_framebuffer_surface *vfbs = vmw_framebuffer_to_vfbs(fb);
>  	struct vmw_bo *bo = vmw_user_object_buffer(&vfbs->uo);
>  
> +	if (WARN_ON(!bo))
> +		return -EINVAL;
>  	return drm_gem_handle_create(file_priv, &bo->tbo.base, handle);
>  }
>  

Friendly ping.
