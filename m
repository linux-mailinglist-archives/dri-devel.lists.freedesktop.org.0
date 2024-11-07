Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D65DB9BFF7E
	for <lists+dri-devel@lfdr.de>; Thu,  7 Nov 2024 09:02:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17DA610E7BA;
	Thu,  7 Nov 2024 08:02:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from dggsgout12.his.huawei.com (dggsgout12.his.huawei.com
 [45.249.212.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65C9C10E04E
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2024 07:52:40 +0000 (UTC)
Received: from mail.maildlp.com (unknown [172.19.163.216])
 by dggsgout12.his.huawei.com (SkyGuard) with ESMTP id 4XkZ6V4Zwqz4f3jsK
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2024 15:52:18 +0800 (CST)
Received: from mail02.huawei.com (unknown [10.116.40.75])
 by mail.maildlp.com (Postfix) with ESMTP id A1C9F1A0197
 for <dri-devel@lists.freedesktop.org>; Thu,  7 Nov 2024 15:52:36 +0800 (CST)
Received: from [10.67.109.79] (unknown [10.67.109.79])
 by APP2 (Coremail) with SMTP id Syh0CgBXBuPEcSxnzadWBA--.11636S2;
 Thu, 07 Nov 2024 15:52:36 +0800 (CST)
Message-ID: <b2c395e5-fdc3-479b-bad8-113bb54d4147@huaweicloud.com>
Date: Thu, 7 Nov 2024 15:52:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/vmwgfx: avoid null_ptr_deref in
 vmw_framebuffer_surface_create_handle
To: Chen Ridong <chenridong@huaweicloud.com>, zack.rusin@broadcom.com,
 bcm-kernel-feedback-list@broadcom.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
 maaz.mombasawala@broadcom.com, martin.krastev@broadcom.com
Cc: dri-devel@lists.freedesktop.org, wangweiyang2@huawei.com
References: <20241029083429.1185479-1-chenridong@huaweicloud.com>
Content-Language: en-US
From: Chen Ridong <chenridong@huaweicloud.com>
In-Reply-To: <20241029083429.1185479-1-chenridong@huaweicloud.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CM-TRANSID: Syh0CgBXBuPEcSxnzadWBA--.11636S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GFWDXr1kWw4rZry3Jw13Arb_yoWkCFX_G3
 4kArn7JF45XFn5Z3Z29398Z34Ik3WrZrZ7ua1FqFW5tFnrZ3sYg348K34ktrn7Ga17GFs8
 Aay8GFs2vwnrWjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
 9fnUUIcSsGvfJTRUUUbVkFF20E14v26r4j6ryUM7CY07I20VC2zVCF04k26cxKx2IYs7xG
 6rWj6s0DM7CIcVAFz4kK6r1j6r18M28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8w
 A2z4x0Y4vE2Ix0cI8IcVAFwI0_Ar0_tr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_
 Gr1UM28EF7xvwVC2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s
 0DM2AIxVAIcxkEcVAq07x20xvEncxIr21l5I8CrVACY4xI64kE6c02F40Ex7xfMcIj6xII
 jxv20xvE14v26r106r15McIj6I8E87Iv67AKxVWUJVW8JwAm72CE4IkC6x0Yz7v_Jr0_Gr
 1lF7xvr2IY64vIr41lF7I21c0EjII2zVCS5cI20VAGYxC7M4IIrI8v6xkF7I0E8cxan2IY
 04v7MxkF7I0En4kS14v26r1q6r43MxAIw28IcxkI7VAKI48JMxC20s026xCaFVCjc4AY6r
 1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CE
 b7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0x
 vE2Ix0cI8IcVCY1x0267AKxVW8JVWxJwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAI
 cVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kf
 nxnUUI43ZEXa7VU13ku3UUUUU==
X-CM-SenderInfo: hfkh02xlgr0w46kxt4xhlfz01xgou0bp/
X-Mailman-Approved-At: Thu, 07 Nov 2024 08:02:44 +0000
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

