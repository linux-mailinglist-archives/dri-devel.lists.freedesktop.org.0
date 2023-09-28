Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DB4D7B1D0E
	for <lists+dri-devel@lfdr.de>; Thu, 28 Sep 2023 14:54:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF96A10E63D;
	Thu, 28 Sep 2023 12:54:26 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACD4F10E63D
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 12:54:24 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-405524e6740so110402035e9.1
 for <dri-devel@lists.freedesktop.org>; Thu, 28 Sep 2023 05:54:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695905663; x=1696510463; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GkJGzKyNVrICSwFtZLNmXg+4hfXNAu8k4PSHR+U0BBA=;
 b=Xv+q01Mml3YmrHEK4a27W8HO86e4b15ZDbmxxArZ68Hp+HGcgzwaI5FAa1mla1z6Nb
 Lm4zHA02IIN4vRPdeIn4vkdkrTdPENcphhiIyrgQ/AtxzMqobCCt6zbO2rI6AB0QyC59
 hH70D+NR1wWDZUbkgsG6ItUBaDql+6MfZ0uSdgnQP6Q7ZT8YKUEAqG8L4b06qEtXRHgU
 gFBz2HP0WQkBghjODPIIGXfr/N6ZDGn3RXg8L5E5io23+xUkJL68yVi8fzsiwgokfGzb
 faoINetIs4eodPueRUrz2utzAcdK0/wpKjB2TZ3xjw3Iw26SgyMUnqfsGE/5vbNir2x0
 ZJnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695905663; x=1696510463;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GkJGzKyNVrICSwFtZLNmXg+4hfXNAu8k4PSHR+U0BBA=;
 b=KE7s1xaiJjl7Wcu/PFHmy6212IxRPoQNF+FxhqWhGQ20CmF/6zqrp3q3BgF8CUi5yZ
 IGrx/fBlfwTCiHZWgV07tNd9PBnAHUVm6me4xYt9iqj6pjm0vRGOOQURL98U8V6/9NvO
 fuO8aIaOtJBmbBtAC2f7d8vCONXA4DToe/Fb0t2eOq99oyEFCewhWq/IOy52PQRHER5D
 tMoQfWWgpLd/Ajwhg88/h5w6GM5vXE6/Iqxfn4dXMf7jUJBoF1eouPKiYJGQkwX8OkSW
 GdNG1GmD2iDnsWPMJoh53+9Tac3jh31gd8QS1cQ490kLaGhabHPXGYJRERWNBF4hHJJr
 E6Ow==
X-Gm-Message-State: AOJu0YyjemQ4xpdyuyZcl05VNmGlMLog72oeUVI4EImGkCNYDn9AY7l0
 dEil/UH+ymuC7aHrmZAZtL4=
X-Google-Smtp-Source: AGHT+IGKGe028sFljfQFKFyB8x0Q6Jjg615ROKlmXruBejuOrG+eD7/eVdJ3UAf3EeBQB3sTaUVZtQ==
X-Received: by 2002:a7b:c410:0:b0:403:bb04:2908 with SMTP id
 k16-20020a7bc410000000b00403bb042908mr1062380wmi.23.1695905662592; 
 Thu, 28 Sep 2023 05:54:22 -0700 (PDT)
Received: from [192.168.2.181] (84-238-195-250.ip.btc-net.bg. [84.238.195.250])
 by smtp.gmail.com with ESMTPSA id
 20-20020a05600c021400b0040607da271asm7550451wmi.31.2023.09.28.05.54.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 28 Sep 2023 05:54:22 -0700 (PDT)
Message-ID: <b95d9d55-32c1-f9b9-8a09-7dfd976d6524@gmail.com>
Date: Thu, 28 Sep 2023 15:54:20 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH] drm/vmwgfx: Keep a gem reference to user bos in surfaces
To: Zack Rusin <zackr@vmware.com>, dri-devel@lists.freedesktop.org
References: <20230928041355.737635-1-zack@kde.org>
Content-Language: en-US
From: "Martin Krastev (VMware)" <martinkrastev768@gmail.com>
In-Reply-To: <20230928041355.737635-1-zack@kde.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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
Cc: Murray McAllister <murray.mcallister@gmail.com>, krastevm@vmware.com,
 iforbes@vmware.com, mombasawalam@vmware.com, stable@vger.kernel.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

From: Martin Krastev <krastevm@vmware.com>


LGTM


Reviewed-by: Martin Krastev <krastevm@vmware.com>


Regards,

Martin


On 28.09.23 г. 7:13 ч., Zack Rusin wrote:
> From: Zack Rusin <zackr@vmware.com>
>
> Surfaces can be backed (i.e. stored in) memory objects (mob's) which
> are created and managed by the userspace as GEM buffers. Surfaces
> grab only a ttm reference which means that the gem object can
> be deleted underneath us, especially in cases where prime buffer
> export is used.
>
> Make sure that all userspace surfaces which are backed by gem objects
> hold a gem reference to make sure they're not deleted before vmw
> surfaces are done with them, which fixes:
> ------------[ cut here ]------------
> refcount_t: underflow; use-after-free.
> WARNING: CPU: 2 PID: 2632 at lib/refcount.c:28 refcount_warn_saturate+0xfb/0x150
> Modules linked in: overlay vsock_loopback vmw_vsock_virtio_transport_common vmw_vsock_vmci_transport vsock snd_ens1371 snd_ac97_codec ac97_bus snd_pcm gameport>
> CPU: 2 PID: 2632 Comm: vmw_ref_count Not tainted 6.5.0-rc2-vmwgfx #1
> Hardware name: VMware, Inc. VMware Virtual Platform/440BX Desktop Reference Platform, BIOS 6.00 11/12/2020
> RIP: 0010:refcount_warn_saturate+0xfb/0x150
> Code: eb 9e 0f b6 1d 8b 5b a6 01 80 fb 01 0f 87 ba e4 80 00 83 e3 01 75 89 48 c7 c7 c0 3c f9 a3 c6 05 6f 5b a6 01 01 e8 15 81 98 ff <0f> 0b e9 6f ff ff ff 0f b>
> RSP: 0018:ffffbdc34344bba0 EFLAGS: 00010286
> RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000000027
> RDX: ffff960475ea1548 RSI: 0000000000000001 RDI: ffff960475ea1540
> RBP: ffffbdc34344bba8 R08: 0000000000000003 R09: 65646e75203a745f
> R10: ffffffffa5b32b20 R11: 72657466612d6573 R12: ffff96037d6a6400
> R13: ffff9603484805b0 R14: 000000000000000b R15: ffff9603bed06060
> FS:  00007f5fd8520c40(0000) GS:ffff960475e80000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007f5fda755000 CR3: 000000010d012005 CR4: 00000000003706e0
> Call Trace:
>   <TASK>
>   ? show_regs+0x6e/0x80
>   ? refcount_warn_saturate+0xfb/0x150
>   ? __warn+0x91/0x150
>   ? refcount_warn_saturate+0xfb/0x150
>   ? report_bug+0x19d/0x1b0
>   ? handle_bug+0x46/0x80
>   ? exc_invalid_op+0x1d/0x80
>   ? asm_exc_invalid_op+0x1f/0x30
>   ? refcount_warn_saturate+0xfb/0x150
>   drm_gem_object_handle_put_unlocked+0xba/0x110 [drm]
>   drm_gem_object_release_handle+0x6e/0x80 [drm]
>   drm_gem_handle_delete+0x6a/0xc0 [drm]
>   ? __pfx_vmw_bo_unref_ioctl+0x10/0x10 [vmwgfx]
>   vmw_bo_unref_ioctl+0x33/0x40 [vmwgfx]
>   drm_ioctl_kernel+0xbc/0x160 [drm]
>   drm_ioctl+0x2d2/0x580 [drm]
>   ? __pfx_vmw_bo_unref_ioctl+0x10/0x10 [vmwgfx]
>   ? do_vmi_munmap+0xee/0x180
>   vmw_generic_ioctl+0xbd/0x180 [vmwgfx]
>   vmw_unlocked_ioctl+0x19/0x20 [vmwgfx]
>   __x64_sys_ioctl+0x99/0xd0
>   do_syscall_64+0x5d/0x90
>   ? syscall_exit_to_user_mode+0x2a/0x50
>   ? do_syscall_64+0x6d/0x90
>   ? handle_mm_fault+0x16e/0x2f0
>   ? exit_to_user_mode_prepare+0x34/0x170
>   ? irqentry_exit_to_user_mode+0xd/0x20
>   ? irqentry_exit+0x3f/0x50
>   ? exc_page_fault+0x8e/0x190
>   entry_SYSCALL_64_after_hwframe+0x6e/0xd8
> RIP: 0033:0x7f5fda51aaff
> Code: 00 48 89 44 24 18 31 c0 48 8d 44 24 60 c7 04 24 10 00 00 00 48 89 44 24 08 48 8d 44 24 20 48 89 44 24 10 b8 10 00 00 00 0f 05 <41> 89 c0 3d 00 f0 ff ff 7>
> RSP: 002b:00007ffd536a4d30 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
> RAX: ffffffffffffffda RBX: 00007ffd536a4de0 RCX: 00007f5fda51aaff
> RDX: 00007ffd536a4de0 RSI: 0000000040086442 RDI: 0000000000000003
> RBP: 0000000040086442 R08: 000055fa603ada50 R09: 0000000000000000
> R10: 0000000000000001 R11: 0000000000000246 R12: 00007ffd536a51b8
> R13: 0000000000000003 R14: 000055fa5ebb4c80 R15: 00007f5fda90f040
>   </TASK>
> ---[ end trace 0000000000000000 ]---
>
> A lot of the analyis on the bug was done by Murray McAllister and
> Ian Forbes.
>
> Reported-by: Murray McAllister <murray.mcallister@gmail.com>
> Cc: Ian Forbes <iforbes@vmware.com>
> Signed-off-by: Zack Rusin <zackr@vmware.com>
> Fixes: a950b989ea29 ("drm/vmwgfx: Do not drop the reference to the handle too soon")
> Cc: <stable@vger.kernel.org> # v6.2+
> ---
>   drivers/gpu/drm/vmwgfx/vmwgfx_bo.c       |  7 +++---
>   drivers/gpu/drm/vmwgfx/vmwgfx_bo.h       | 17 +++++++++----
>   drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c  |  6 ++---
>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h      |  4 +++
>   drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c  | 10 +++++---
>   drivers/gpu/drm/vmwgfx/vmwgfx_gem.c      | 18 +++++++++++---
>   drivers/gpu/drm/vmwgfx/vmwgfx_kms.c      |  6 ++---
>   drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c  |  2 +-
>   drivers/gpu/drm/vmwgfx/vmwgfx_resource.c | 12 ++++-----
>   drivers/gpu/drm/vmwgfx/vmwgfx_shader.c   |  4 +--
>   drivers/gpu/drm/vmwgfx/vmwgfx_surface.c  | 31 +++++++++---------------
>   11 files changed, 68 insertions(+), 49 deletions(-)
>
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> index c43853597776..2bfac3aad7b7 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.c
> @@ -34,6 +34,8 @@
>   
>   static void vmw_bo_release(struct vmw_bo *vbo)
>   {
> +	WARN_ON(vbo->tbo.base.funcs &&
> +		kref_read(&vbo->tbo.base.refcount) != 0);
>   	vmw_bo_unmap(vbo);
>   	drm_gem_object_release(&vbo->tbo.base);
>   }
> @@ -497,7 +499,7 @@ static int vmw_user_bo_synccpu_release(struct drm_file *filp,
>   		if (!(flags & drm_vmw_synccpu_allow_cs)) {
>   			atomic_dec(&vmw_bo->cpu_writers);
>   		}
> -		vmw_user_bo_unref(vmw_bo);
> +		vmw_user_bo_unref(&vmw_bo);
>   	}
>   
>   	return ret;
> @@ -539,7 +541,7 @@ int vmw_user_bo_synccpu_ioctl(struct drm_device *dev, void *data,
>   			return ret;
>   
>   		ret = vmw_user_bo_synccpu_grab(vbo, arg->flags);
> -		vmw_user_bo_unref(vbo);
> +		vmw_user_bo_unref(&vbo);
>   		if (unlikely(ret != 0)) {
>   			if (ret == -ERESTARTSYS || ret == -EBUSY)
>   				return -EBUSY;
> @@ -612,7 +614,6 @@ int vmw_user_bo_lookup(struct drm_file *filp,
>   	}
>   
>   	*out = to_vmw_bo(gobj);
> -	ttm_bo_get(&(*out)->tbo);
>   
>   	return 0;
>   }
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
> index 1d433fceed3d..0d496dc9c6af 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_bo.h
> @@ -195,12 +195,19 @@ static inline struct vmw_bo *vmw_bo_reference(struct vmw_bo *buf)
>   	return buf;
>   }
>   
> -static inline void vmw_user_bo_unref(struct vmw_bo *vbo)
> +static inline struct vmw_bo *vmw_user_bo_ref(struct vmw_bo *vbo)
>   {
> -	if (vbo) {
> -		ttm_bo_put(&vbo->tbo);
> -		drm_gem_object_put(&vbo->tbo.base);
> -	}
> +	drm_gem_object_get(&vbo->tbo.base);
> +	return vbo;
> +}
> +
> +static inline void vmw_user_bo_unref(struct vmw_bo **buf)
> +{
> +	struct vmw_bo *tmp_buf = *buf;
> +
> +	*buf = NULL;
> +	if (tmp_buf)
> +		drm_gem_object_put(&tmp_buf->tbo.base);
>   }
>   
>   static inline struct vmw_bo *to_vmw_bo(struct drm_gem_object *gobj)
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
> index c0b24d1cacbf..a7c07692262b 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cotable.c
> @@ -432,7 +432,7 @@ static int vmw_cotable_resize(struct vmw_resource *res, size_t new_size)
>   	 * for the new COTable. Initially pin the buffer object to make sure
>   	 * we can use tryreserve without failure.
>   	 */
> -	ret = vmw_bo_create(dev_priv, &bo_params, &buf);
> +	ret = vmw_gem_object_create(dev_priv, &bo_params, &buf);
>   	if (ret) {
>   		DRM_ERROR("Failed initializing new cotable MOB.\n");
>   		goto out_done;
> @@ -502,7 +502,7 @@ static int vmw_cotable_resize(struct vmw_resource *res, size_t new_size)
>   
>   	vmw_resource_mob_attach(res);
>   	/* Let go of the old mob. */
> -	vmw_bo_unreference(&old_buf);
> +	vmw_user_bo_unref(&old_buf);
>   	res->id = vcotbl->type;
>   
>   	ret = dma_resv_reserve_fences(bo->base.resv, 1);
> @@ -521,7 +521,7 @@ static int vmw_cotable_resize(struct vmw_resource *res, size_t new_size)
>   out_wait:
>   	ttm_bo_unpin(bo);
>   	ttm_bo_unreserve(bo);
> -	vmw_bo_unreference(&buf);
> +	vmw_user_bo_unref(&buf);
>   
>   out_done:
>   	MKS_STAT_TIME_POP(MKSSTAT_KERN_COTABLE_RESIZE);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> index 58bfdf203eca..3cd5090dedfc 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> @@ -853,6 +853,10 @@ static inline bool vmw_resource_mob_attached(const struct vmw_resource *res)
>   /**
>    * GEM related functionality - vmwgfx_gem.c
>    */
> +struct vmw_bo_params;
> +int vmw_gem_object_create(struct vmw_private *vmw,
> +			  struct vmw_bo_params *params,
> +			  struct vmw_bo **p_vbo);
>   extern int vmw_gem_object_create_with_handle(struct vmw_private *dev_priv,
>   					     struct drm_file *filp,
>   					     uint32_t size,
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> index 98e0723ca6f5..06b06350f61f 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_execbuf.c
> @@ -1151,7 +1151,7 @@ static int vmw_translate_mob_ptr(struct vmw_private *dev_priv,
>   				 SVGAMobId *id,
>   				 struct vmw_bo **vmw_bo_p)
>   {
> -	struct vmw_bo *vmw_bo;
> +	struct vmw_bo *vmw_bo, *tmp_bo;
>   	uint32_t handle = *id;
>   	struct vmw_relocation *reloc;
>   	int ret;
> @@ -1164,7 +1164,8 @@ static int vmw_translate_mob_ptr(struct vmw_private *dev_priv,
>   	}
>   	vmw_bo_placement_set(vmw_bo, VMW_BO_DOMAIN_MOB, VMW_BO_DOMAIN_MOB);
>   	ret = vmw_validation_add_bo(sw_context->ctx, vmw_bo);
> -	vmw_user_bo_unref(vmw_bo);
> +	tmp_bo = vmw_bo;
> +	vmw_user_bo_unref(&tmp_bo);
>   	if (unlikely(ret != 0))
>   		return ret;
>   
> @@ -1206,7 +1207,7 @@ static int vmw_translate_guest_ptr(struct vmw_private *dev_priv,
>   				   SVGAGuestPtr *ptr,
>   				   struct vmw_bo **vmw_bo_p)
>   {
> -	struct vmw_bo *vmw_bo;
> +	struct vmw_bo *vmw_bo, *tmp_bo;
>   	uint32_t handle = ptr->gmrId;
>   	struct vmw_relocation *reloc;
>   	int ret;
> @@ -1220,7 +1221,8 @@ static int vmw_translate_guest_ptr(struct vmw_private *dev_priv,
>   	vmw_bo_placement_set(vmw_bo, VMW_BO_DOMAIN_GMR | VMW_BO_DOMAIN_VRAM,
>   			     VMW_BO_DOMAIN_GMR | VMW_BO_DOMAIN_VRAM);
>   	ret = vmw_validation_add_bo(sw_context->ctx, vmw_bo);
> -	vmw_user_bo_unref(vmw_bo);
> +	tmp_bo = vmw_bo;
> +	vmw_user_bo_unref(&tmp_bo);
>   	if (unlikely(ret != 0))
>   		return ret;
>   
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> index c0da89e16e6f..8b1eb0061610 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_gem.c
> @@ -111,6 +111,20 @@ static const struct drm_gem_object_funcs vmw_gem_object_funcs = {
>   	.vm_ops = &vmw_vm_ops,
>   };
>   
> +int vmw_gem_object_create(struct vmw_private *vmw,
> +			  struct vmw_bo_params *params,
> +			  struct vmw_bo **p_vbo)
> +{
> +	int ret = vmw_bo_create(vmw, params, p_vbo);
> +
> +	if (ret != 0)
> +		goto out_no_bo;
> +
> +	(*p_vbo)->tbo.base.funcs = &vmw_gem_object_funcs;
> +out_no_bo:
> +	return ret;
> +}
> +
>   int vmw_gem_object_create_with_handle(struct vmw_private *dev_priv,
>   				      struct drm_file *filp,
>   				      uint32_t size,
> @@ -126,12 +140,10 @@ int vmw_gem_object_create_with_handle(struct vmw_private *dev_priv,
>   		.pin = false
>   	};
>   
> -	ret = vmw_bo_create(dev_priv, &params, p_vbo);
> +	ret = vmw_gem_object_create(dev_priv, &params, p_vbo);
>   	if (ret != 0)
>   		goto out_no_bo;
>   
> -	(*p_vbo)->tbo.base.funcs = &vmw_gem_object_funcs;
> -
>   	ret = drm_gem_handle_create(filp, &(*p_vbo)->tbo.base, handle);
>   out_no_bo:
>   	return ret;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> index 1489ad73c103..818b7f109f53 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> @@ -1471,8 +1471,8 @@ static int vmw_create_bo_proxy(struct drm_device *dev,
>   	/* Reserve and switch the backing mob. */
>   	mutex_lock(&res->dev_priv->cmdbuf_mutex);
>   	(void) vmw_resource_reserve(res, false, true);
> -	vmw_bo_unreference(&res->guest_memory_bo);
> -	res->guest_memory_bo = vmw_bo_reference(bo_mob);
> +	vmw_user_bo_unref(&res->guest_memory_bo);
> +	res->guest_memory_bo = vmw_user_bo_ref(bo_mob);
>   	res->guest_memory_offset = 0;
>   	vmw_resource_unreserve(res, false, false, false, NULL, 0);
>   	mutex_unlock(&res->dev_priv->cmdbuf_mutex);
> @@ -1666,7 +1666,7 @@ static struct drm_framebuffer *vmw_kms_fb_create(struct drm_device *dev,
>   err_out:
>   	/* vmw_user_lookup_handle takes one ref so does new_fb */
>   	if (bo)
> -		vmw_user_bo_unref(bo);
> +		vmw_user_bo_unref(&bo);
>   	if (surface)
>   		vmw_surface_unreference(&surface);
>   
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c b/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
> index fb85f244c3d0..c45b4724e414 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_overlay.c
> @@ -451,7 +451,7 @@ int vmw_overlay_ioctl(struct drm_device *dev, void *data,
>   
>   	ret = vmw_overlay_update_stream(dev_priv, buf, arg, true);
>   
> -	vmw_user_bo_unref(buf);
> +	vmw_user_bo_unref(&buf);
>   
>   out_unlock:
>   	mutex_unlock(&overlay->mutex);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> index 71eeabf001c8..ca300c7427d2 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_resource.c
> @@ -141,7 +141,7 @@ static void vmw_resource_release(struct kref *kref)
>   		if (res->coherent)
>   			vmw_bo_dirty_release(res->guest_memory_bo);
>   		ttm_bo_unreserve(bo);
> -		vmw_bo_unreference(&res->guest_memory_bo);
> +		vmw_user_bo_unref(&res->guest_memory_bo);
>   	}
>   
>   	if (likely(res->hw_destroy != NULL)) {
> @@ -338,7 +338,7 @@ static int vmw_resource_buf_alloc(struct vmw_resource *res,
>   		return 0;
>   	}
>   
> -	ret = vmw_bo_create(res->dev_priv, &bo_params, &gbo);
> +	ret = vmw_gem_object_create(res->dev_priv, &bo_params, &gbo);
>   	if (unlikely(ret != 0))
>   		goto out_no_bo;
>   
> @@ -457,11 +457,11 @@ void vmw_resource_unreserve(struct vmw_resource *res,
>   			vmw_resource_mob_detach(res);
>   			if (res->coherent)
>   				vmw_bo_dirty_release(res->guest_memory_bo);
> -			vmw_bo_unreference(&res->guest_memory_bo);
> +			vmw_user_bo_unref(&res->guest_memory_bo);
>   		}
>   
>   		if (new_guest_memory_bo) {
> -			res->guest_memory_bo = vmw_bo_reference(new_guest_memory_bo);
> +			res->guest_memory_bo = vmw_user_bo_ref(new_guest_memory_bo);
>   
>   			/*
>   			 * The validation code should already have added a
> @@ -551,7 +551,7 @@ vmw_resource_check_buffer(struct ww_acquire_ctx *ticket,
>   	ttm_bo_put(val_buf->bo);
>   	val_buf->bo = NULL;
>   	if (guest_memory_dirty)
> -		vmw_bo_unreference(&res->guest_memory_bo);
> +		vmw_user_bo_unref(&res->guest_memory_bo);
>   
>   	return ret;
>   }
> @@ -727,7 +727,7 @@ int vmw_resource_validate(struct vmw_resource *res, bool intr,
>   		goto out_no_validate;
>   	else if (!res->func->needs_guest_memory && res->guest_memory_bo) {
>   		WARN_ON_ONCE(vmw_resource_mob_attached(res));
> -		vmw_bo_unreference(&res->guest_memory_bo);
> +		vmw_user_bo_unref(&res->guest_memory_bo);
>   	}
>   
>   	return 0;
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c b/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
> index 1e81ff2422cf..a01ca3226d0a 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_shader.c
> @@ -180,7 +180,7 @@ static int vmw_gb_shader_init(struct vmw_private *dev_priv,
>   
>   	res->guest_memory_size = size;
>   	if (byte_code) {
> -		res->guest_memory_bo = vmw_bo_reference(byte_code);
> +		res->guest_memory_bo = vmw_user_bo_ref(byte_code);
>   		res->guest_memory_offset = offset;
>   	}
>   	shader->size = size;
> @@ -809,7 +809,7 @@ static int vmw_shader_define(struct drm_device *dev, struct drm_file *file_priv,
>   				    shader_type, num_input_sig,
>   				    num_output_sig, tfile, shader_handle);
>   out_bad_arg:
> -	vmw_user_bo_unref(buffer);
> +	vmw_user_bo_unref(&buffer);
>   	return ret;
>   }
>   
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
> index 5db403ee8261..3829be282ff0 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_surface.c
> @@ -686,9 +686,6 @@ static void vmw_user_surface_base_release(struct ttm_base_object **p_base)
>   	    container_of(base, struct vmw_user_surface, prime.base);
>   	struct vmw_resource *res = &user_srf->srf.res;
>   
> -	if (res->guest_memory_bo)
> -		drm_gem_object_put(&res->guest_memory_bo->tbo.base);
> -
>   	*p_base = NULL;
>   	vmw_resource_unreference(&res);
>   }
> @@ -855,23 +852,21 @@ int vmw_surface_define_ioctl(struct drm_device *dev, void *data,
>   	 * expect a backup buffer to be present.
>   	 */
>   	if (dev_priv->has_mob && req->shareable) {
> -		uint32_t backup_handle;
> -
> -		ret = vmw_gem_object_create_with_handle(dev_priv,
> -							file_priv,
> -							res->guest_memory_size,
> -							&backup_handle,
> -							&res->guest_memory_bo);
> +		struct vmw_bo_params params = {
> +			.domain = VMW_BO_DOMAIN_SYS,
> +			.busy_domain = VMW_BO_DOMAIN_SYS,
> +			.bo_type = ttm_bo_type_device,
> +			.size = res->guest_memory_size,
> +			.pin = false
> +		};
> +
> +		ret = vmw_gem_object_create(dev_priv,
> +					    &params,
> +					    &res->guest_memory_bo);
>   		if (unlikely(ret != 0)) {
>   			vmw_resource_unreference(&res);
>   			goto out_unlock;
>   		}
> -		vmw_bo_reference(res->guest_memory_bo);
> -		/*
> -		 * We don't expose the handle to the userspace and surface
> -		 * already holds a gem reference
> -		 */
> -		drm_gem_handle_delete(file_priv, backup_handle);
>   	}
>   
>   	tmp = vmw_resource_reference(&srf->res);
> @@ -1512,7 +1507,7 @@ vmw_gb_surface_define_internal(struct drm_device *dev,
>   		if (ret == 0) {
>   			if (res->guest_memory_bo->tbo.base.size < res->guest_memory_size) {
>   				VMW_DEBUG_USER("Surface backup buffer too small.\n");
> -				vmw_bo_unreference(&res->guest_memory_bo);
> +				vmw_user_bo_unref(&res->guest_memory_bo);
>   				ret = -EINVAL;
>   				goto out_unlock;
>   			} else {
> @@ -1526,8 +1521,6 @@ vmw_gb_surface_define_internal(struct drm_device *dev,
>   							res->guest_memory_size,
>   							&backup_handle,
>   							&res->guest_memory_bo);
> -		if (ret == 0)
> -			vmw_bo_reference(res->guest_memory_bo);
>   	}
>   
>   	if (unlikely(ret != 0)) {
