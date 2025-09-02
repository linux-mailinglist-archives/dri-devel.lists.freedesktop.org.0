Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B00B3F76F
	for <lists+dri-devel@lfdr.de>; Tue,  2 Sep 2025 10:02:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5AC8F10E5C0;
	Tue,  2 Sep 2025 08:02:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="LS3E6TS3";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F76D10E5C0
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Sep 2025 08:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1756800165;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HXaSXI416tBr9Xt7SlviNqC21fFgH6dQWHigCHdg9IQ=;
 b=LS3E6TS38qdLT24TmJfKwDroTGqvgqhfX4E/uLqfvEb2sZFGl6U7s299QdS2NtcbSaQ8pB
 b2zfxPx3H0HLL8AGoVBJW8tMcC5YRebx2Csb5QP1STDQB7T+vxKkYeZRY8bqUZbCdtLtIH
 FCRPsTpIBTzSCDT+rTJANmWM2NyJSeA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-665-GCbUEhdPNlmTVo1vOZ5g-Q-1; Tue, 02 Sep 2025 04:02:44 -0400
X-MC-Unique: GCbUEhdPNlmTVo1vOZ5g-Q-1
X-Mimecast-MFC-AGG-ID: GCbUEhdPNlmTVo1vOZ5g-Q_1756800163
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-45b8b7d66adso9460545e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Sep 2025 01:02:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756800163; x=1757404963;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HXaSXI416tBr9Xt7SlviNqC21fFgH6dQWHigCHdg9IQ=;
 b=JWPshkklIFRZKmuhnqFq37T8YPIOJmB0qevDsw6878FsaeuLJ/cd7vFcJj2g1+PL4I
 LkT7SaUIajb+GjWdj2pMy1jeIzv21zCQu37CDA4KRGcdtrn/GWyfd5m+8va0CkF/yETV
 54VoUIMnMlCb1gpIyfIlzmwd5NLgl+ZgdFGQYsIuC5WBCr/KsrXE5WRycmgBEx9eBpTx
 IURRtpU22dye6HeLjkBZXkdug9zxleL6rdge1jJB7itmixRysDxIcmxG7G4/LR5cbAIz
 ZxDaN8rRbyKskuec9yyMxt5KHCBLZg1hPo84Cd6/AvPajvdMDitc8KUd8G860JfXaam9
 u0RQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXSxfPAHfoLZMZTwS72BESkKZ0t10Ubyso2FTBs1r7z5mxC1QuSaUp86NALHxKgjA0vaM8p0l+Im7Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyfwnkvTFHZRofc5UcE9+9rJjZl7FFhpJPRtbq6bqg1h+TgAhMC
 xyZ7HUEElAAL9oxtnEIgShRdqjg6WPZ0g0vrcbuzQrejYkikAc78Gd/sikZF/cmxbPPPpE4uNTH
 k/gr6X+xvwNjhe45J4h6BLj4/7iqaVoxiM7DFsDwTp82ZAT6SpYuShVlsOpkV/ABqt/n8Ug==
X-Gm-Gg: ASbGncs4fsN/+m/7/PqeHI+Hcn9SPGcCls8k1E8FfP1ewlEWUNVtQSXAaEXeFoS4czd
 kcUMNpuhnEIy3pE0uEWs1tkWoHs2Z7Ft0V4ZT3W7oMOFKnwAGaPimKyK5O6kbw6YO7eJy/soDUs
 V1Jp85jB5PO2UQtEOYF60aVYlV2gsz6+W5Pw92u2YWZjP3tnHrolTy6UZKmkSzypWobJoyNLjrh
 mPOPIRhC/d5MogcXiTN/Gj8KvicyTMBgIs3Akz6eb1rPQTXsHlkJZWBQ27iOF55s9pdbFfUveAw
 uwxtBy1ERzLXZ4gXRexdfnM1Bom0qfn9LutOpzPx11K+pJK4eoD42qVIpLIU6sLAq7WeYTkzAPf
 AYaU=
X-Received: by 2002:a05:600c:1c15:b0:456:1514:5b04 with SMTP id
 5b1f17b1804b1-45b9353e825mr19998495e9.21.1756800162758; 
 Tue, 02 Sep 2025 01:02:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHU4ehjBdhj/JptIUXUiuh2hVBGm3VR2ta7Nmb28ZEQjgQYesv86/linYfTv/nHm/XXIlNODg==
X-Received: by 2002:a05:600c:1c15:b0:456:1514:5b04 with SMTP id
 5b1f17b1804b1-45b9353e825mr19998105e9.21.1756800162234; 
 Tue, 02 Sep 2025 01:02:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:8998:e0cf:68cc:1b62?
 ([2a01:e0a:c:37e0:8998:e0cf:68cc:1b62])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3cf33add294sm19732844f8f.29.2025.09.02.01.02.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 02 Sep 2025 01:02:41 -0700 (PDT)
Message-ID: <0439749a-ed43-4dc8-8025-f7aa1eec10b7@redhat.com>
Date: Tue, 2 Sep 2025 10:02:40 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH drm-misc-next 1/1] drm/vmwgfx: add drm_panic support for
 stdu
To: Ryosuke Yasuoka <ryasuoka@redhat.com>, zack.rusin@broadcom.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 airlied@gmail.com, simona@ffwll.ch
Cc: bcm-kernel-feedback-list@broadcom.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
References: <20250901083701.32365-1-ryasuoka@redhat.com>
 <20250901083701.32365-2-ryasuoka@redhat.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <20250901083701.32365-2-ryasuoka@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: tiZ9HEa3LJ7cjkLKRTSObZIjYJQ0ynp2_u9nCzsLKP0_1756800163
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

On 01/09/2025 10:36, Ryosuke Yasuoka wrote:
> Add drm_panic module for vmwgfx stdu so that panic screen can be
> displayed on panic.

Thanks for this work.

If I understand correctly, this will draw the panic screen to the vfbo 
buffer, and then in the panic_flush() function, use 
vmw_panic_bo_cpu_blit() to copy that to the guest_memory_bo.

I think it should be easier to directly write the panic screen to the 
guest_memory_bo.
To write to the guest_memory_bo, you can do something similar as 
vmw_bo_cpu_blit_line(), but using kmap_local_page_try_from_panic() 
instead of kmap_atomic_prot().

You will probably need a custom set_pixel() function, like what I've 
done for i915
https://elixir.bootlin.com/linux/v6.17-rc4/source/drivers/gpu/drm/xe/display/intel_bo.c#L98

Best regards,

-- 

Jocelyn

> 
> Signed-off-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
> ---
>   drivers/gpu/drm/vmwgfx/vmwgfx_blit.c   |  43 ++++++++
>   drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c |  11 ++
>   drivers/gpu/drm/vmwgfx/vmwgfx_drv.h    |   4 +
>   drivers/gpu/drm/vmwgfx/vmwgfx_kms.c    |  48 +++++++++
>   drivers/gpu/drm/vmwgfx/vmwgfx_kms.h    |   1 +
>   drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c   | 139 +++++++++++++++++++++++++
>   6 files changed, 246 insertions(+)
> 
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
> index fa5841fda659..d7ed04531249 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_blit.c
> @@ -514,6 +514,49 @@ static int vmw_external_bo_copy(struct vmw_bo *dst, u32 dst_offset,
>   	return ret;
>   }
>   
> +/* For drm_panic */
> +void vmw_panic_bo_cpu_blit(struct vmw_bo *vmw_dst, u32 dst_stride,
> +			   struct vmw_bo *vmw_src, u32 src_stride,
> +			   u32 w, u32 h, struct vmw_diff_cpy *diff)
> +{
> +	struct ttm_buffer_object *src = &vmw_src->tbo;
> +	struct ttm_buffer_object *dst = &vmw_dst->tbo;
> +	u32 j;
> +	u32 initial_line = 0;
> +	u32 dst_offset = 0;
> +	u32 src_offset = 0;
> +	int ret = 0;
> +	struct vmw_bo_blit_line_data d = {
> +		.mapped_dst = 0,
> +		.mapped_src = 0,
> +		.dst_addr = NULL,
> +		.src_addr = NULL,
> +		.dst_pages = dst->ttm->pages,
> +		.src_pages = src->ttm->pages,
> +		.dst_num_pages = PFN_UP(dst->resource->size),
> +		.src_num_pages = PFN_UP(src->resource->size),
> +		.dst_prot = ttm_io_prot(dst, dst->resource, PAGE_KERNEL),
> +		.src_prot = ttm_io_prot(src, src->resource, PAGE_KERNEL),
> +		.diff = diff,
> +	};
> +
> +	for (j = 0; j < h; ++j) {
> +		diff->line = j + initial_line;
> +		diff->line_offset = dst_offset % dst_stride;
> +		ret = vmw_bo_cpu_blit_line(&d, dst_offset, src_offset, w);
> +		if (ret)
> +			goto out;
> +
> +		dst_offset += dst_stride;
> +		src_offset += src_stride;
> +	}
> +out:
> +	if (d.src_addr)
> +		kunmap_atomic(d.src_addr);
> +	if (d.dst_addr)
> +		kunmap_atomic(d.dst_addr);
> +}
> +
>   /**
>    * vmw_bo_cpu_blit - in-kernel cpu blit.
>    *
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c b/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c
> index 94e8982f5616..e39cc2f214be 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_cmdbuf.c
> @@ -983,6 +983,17 @@ void *vmw_cmdbuf_alloc(struct vmw_cmdbuf_man *man,
>   	return header->cmd;
>   }
>   
> +/* For drm_panic */
> +char *vmw_panic_cmdbuf_reserve_cur(struct vmw_cmdbuf_man *man, size_t size)
> +{
> +	/* Refer to cur without cur_mutex since this func is called in panic handler */
> +	struct vmw_cmdbuf_header *cur = man->cur;
> +
> +	cur->reserved = size;
> +
> +	return (char *) (man->cur->cmd + man->cur_pos);
> +}
> +
>   /**
>    * vmw_cmdbuf_reserve_cur - Reserve space for commands in the current
>    * command buffer.
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> index eda5b6f8f4c4..c71ce975bf52 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_drv.h
> @@ -1271,6 +1271,7 @@ extern int vmw_cmdbuf_idle(struct vmw_cmdbuf_man *man, bool interruptible,
>   extern void *vmw_cmdbuf_reserve(struct vmw_cmdbuf_man *man, size_t size,
>   				int ctx_id, bool interruptible,
>   				struct vmw_cmdbuf_header *header);
> +extern char *vmw_panic_cmdbuf_reserve_cur(struct vmw_cmdbuf_man *man, size_t size);
>   extern void vmw_cmdbuf_commit(struct vmw_cmdbuf_man *man, size_t size,
>   			      struct vmw_cmdbuf_header *header,
>   			      bool flush);
> @@ -1329,6 +1330,9 @@ int vmw_bo_cpu_blit(struct vmw_bo *dst,
>   		    u32 src_offset, u32 src_stride,
>   		    u32 w, u32 h,
>   		    struct vmw_diff_cpy *diff);
> +void vmw_panic_bo_cpu_blit(struct vmw_bo *dst, u32 dst_stride,
> +			   struct vmw_bo *src, u32 src_stride,
> +			   u32 w, u32 h, struct vmw_diff_cpy *diff);
>   
>   /* Host messaging -vmwgfx_msg.c: */
>   void vmw_disable_backdoor(void);
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> index 54ea1b513950..160a4efbf342 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
> @@ -1717,6 +1717,54 @@ void vmw_kms_lost_device(struct drm_device *dev)
>   	drm_atomic_helper_shutdown(dev);
>   }
>   
> +/* For drm_panic */
> +int vmw_du_panic_helper_plane_update(struct vmw_du_update_plane *update)
> +{
> +	struct drm_plane_state *state = update->plane->state;
> +	struct vmw_framebuffer_bo *vfbbo =
> +		container_of(update->vfb, typeof(*vfbbo), base);
> +	struct drm_rect src = drm_plane_state_src(state);
> +	struct drm_rect clip = {
> +		.x1 = 0,
> +		.y1 = 0,
> +		.x2 = (src.x2 >> 16) + !!(src.x2 & 0xFFFF),
> +		.y2 = (src.y2 >> 16) + !!(src.y2 & 0xFFFF),
> +	};
> +	DECLARE_VAL_CONTEXT(val_ctx, NULL, 0);
> +	uint32_t reserved_size = 0;
> +	uint32_t submit_size = 0;
> +	char *cmd;
> +	int ret;
> +
> +	vmw_bo_placement_set(vfbbo->buffer,
> +			     VMW_BO_DOMAIN_SYS | VMW_BO_DOMAIN_MOB | VMW_BO_DOMAIN_GMR,
> +			     VMW_BO_DOMAIN_SYS | VMW_BO_DOMAIN_MOB | VMW_BO_DOMAIN_GMR);
> +
> +	ret = vmw_validation_add_bo(&val_ctx, vfbbo->buffer);
> +	if (ret)
> +		return ret;
> +
> +	ret = vmw_validation_prepare(&val_ctx, NULL, false);
> +	if (ret)
> +		return ret;
> +
> +	reserved_size = update->calc_fifo_size(update, 1);
> +	cmd = vmw_panic_cmdbuf_reserve_cur(update->dev_priv->cman, reserved_size);
> +	if (!cmd)
> +		return -ENOMEM;
> +
> +	vmw_du_translate_to_crtc(state, &clip);
> +
> +	update->clip(update, cmd, &clip, 0, 0);
> +	submit_size = update->post_clip(update, cmd, &clip);
> +
> +	vmw_cmd_commit(update->dev_priv, submit_size);
> +
> +	vmw_kms_helper_validation_finish(update->dev_priv, NULL, &val_ctx,
> +					 NULL, NULL);
> +	return ret;
> +}
> +
>   /**
>    * vmw_du_helper_plane_update - Helper to do plane update on a display unit.
>    * @update: The closure structure.
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
> index 445471fe9be6..e6299390ffea 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
> @@ -499,6 +499,7 @@ int vmw_kms_stdu_readback(struct vmw_private *dev_priv,
>   			  struct drm_crtc *crtc);
>   
>   int vmw_du_helper_plane_update(struct vmw_du_update_plane *update);
> +int vmw_du_panic_helper_plane_update(struct vmw_du_update_plane *update);
>   
>   /**
>    * vmw_du_translate_to_crtc - Translate a rect from framebuffer to crtc
> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> index 20aab725e53a..65b41338c620 100644
> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
> @@ -36,6 +36,7 @@
>   #include <drm/drm_atomic_helper.h>
>   #include <drm/drm_damage_helper.h>
>   #include <drm/drm_fourcc.h>
> +#include <drm/drm_panic.h>
>   #include <drm/drm_vblank.h>
>   
>   #define vmw_crtc_to_stdu(x) \
> @@ -1164,6 +1165,66 @@ static uint32_t vmw_stdu_bo_clip_cpu(struct vmw_du_update_plane  *update,
>   	return 0;
>   }
>   
> +/* For drm_panic */
> +static uint32_t
> +vmw_stdu_panic_bo_populate_update_cpu(struct vmw_du_update_plane  *update, void *cmd,
> +				      struct drm_rect *bb)
> +{
> +	struct vmw_du_update_plane_buffer *bo_update;
> +	struct vmw_screen_target_display_unit *stdu;
> +	struct vmw_framebuffer_bo *vfbbo;
> +	struct vmw_diff_cpy diff = VMW_CPU_BLIT_DIFF_INITIALIZER(0);
> +	struct vmw_stdu_update_gb_image *cmd_img = cmd;
> +	struct vmw_stdu_update *cmd_update;
> +	struct vmw_bo *src_bo, *dst_bo;
> +	s32 src_pitch, dst_pitch;
> +	s32 width, height;
> +
> +	bo_update = container_of(update, typeof(*bo_update), base);
> +	stdu = container_of(update->du, typeof(*stdu), base);
> +	vfbbo = container_of(update->vfb, typeof(*vfbbo), base);
> +
> +	width = bb->x2;
> +	height = bb->y2;
> +
> +	diff.cpp = stdu->cpp;
> +
> +	dst_bo = stdu->display_srf->res.guest_memory_bo;
> +	dst_pitch = stdu->display_srf->metadata.base_size.width * stdu->cpp;
> +
> +	src_bo = vfbbo->buffer;
> +	src_pitch = update->vfb->base.pitches[0];
> +
> +	vmw_panic_bo_cpu_blit(dst_bo, dst_pitch, src_bo, src_pitch,
> +			      width * stdu->cpp, height, &diff);
> +
> +	if (drm_rect_visible(&diff.rect)) {
> +		SVGA3dBox *box = &cmd_img->body.box;
> +
> +		cmd_img->header.id = SVGA_3D_CMD_UPDATE_GB_IMAGE;
> +		cmd_img->header.size = sizeof(cmd_img->body);
> +		cmd_img->body.image.sid = stdu->display_srf->res.id;
> +		cmd_img->body.image.face = 0;
> +		cmd_img->body.image.mipmap = 0;
> +
> +		box->x = diff.rect.x1;
> +		box->y = diff.rect.y1;
> +		box->z = 0;
> +		box->w = drm_rect_width(&diff.rect);
> +		box->h = drm_rect_height(&diff.rect);
> +		box->d = 1;
> +
> +		cmd_update = (struct vmw_stdu_update *)&cmd_img[1];
> +		vmw_stdu_populate_update(cmd_update, stdu->base.unit,
> +					 diff.rect.x1, diff.rect.x2,
> +					 diff.rect.y1, diff.rect.y2);
> +
> +		return sizeof(*cmd_img) + sizeof(*cmd_update);
> +	}
> +
> +	return 0;
> +}
> +
>   static uint32_t
>   vmw_stdu_bo_populate_update_cpu(struct vmw_du_update_plane  *update, void *cmd,
>   				struct drm_rect *bb)
> @@ -1228,6 +1289,28 @@ vmw_stdu_bo_populate_update_cpu(struct vmw_du_update_plane  *update, void *cmd,
>   	return 0;
>   }
>   
> +/* For drm_panic */
> +static int vmw_stdu_panic_plane_update_bo(struct vmw_private *dev_priv,
> +					  struct drm_plane *plane,
> +					  struct vmw_framebuffer *vfb)
> +{
> +	struct vmw_du_update_plane_buffer bo_update;
> +
> +	memset(&bo_update, 0, sizeof(struct vmw_du_update_plane_buffer));
> +	bo_update.base.plane = plane;
> +	bo_update.base.old_state = plane->state;
> +	bo_update.base.dev_priv = dev_priv;
> +	bo_update.base.du = vmw_crtc_to_du(plane->state->crtc);
> +	bo_update.base.vfb = vfb;
> +
> +	bo_update.base.calc_fifo_size = vmw_stdu_bo_fifo_size_cpu;
> +	bo_update.base.pre_clip = vmw_stdu_bo_pre_clip_cpu;
> +	bo_update.base.clip = vmw_stdu_bo_clip_cpu;
> +	bo_update.base.post_clip = vmw_stdu_panic_bo_populate_update_cpu;
> +
> +	return vmw_du_panic_helper_plane_update(&bo_update.base);
> +}
> +
>   /**
>    * vmw_stdu_plane_update_bo - Update display unit for bo backed fb.
>    * @dev_priv: device private.
> @@ -1458,6 +1541,60 @@ vmw_stdu_primary_plane_atomic_update(struct drm_plane *plane,
>   		vmw_fence_obj_unreference(&fence);
>   }
>   
> +static int
> +vmw_stdu_primary_plane_get_scanout_buffer(struct drm_plane *plane,
> +					  struct drm_scanout_buffer *sb)
> +{
> +	struct vmw_framebuffer *vfb;
> +	struct vmw_framebuffer_bo *vfbbo;
> +	void *virtual;
> +
> +	if (!plane->state || !plane->state->fb || !plane->state->visible)
> +		return -ENODEV;
> +
> +	vfb = vmw_framebuffer_to_vfb(plane->state->fb);
> +
> +	if (!vfb->bo)
> +		return -ENODEV;
> +
> +	vfbbo = container_of(vfb, typeof(*vfbbo), base);
> +	virtual = vmw_bo_map_and_cache(vfbbo->buffer);
> +	if (!virtual)
> +		return -ENODEV;
> +	iosys_map_set_vaddr(&sb->map[0], virtual);
> +
> +	sb->format = plane->state->fb->format;
> +	sb->width = plane->state->fb->width;
> +	sb->height = plane->state->fb->height;
> +	sb->pitch[0] = plane->state->fb->pitches[0];
> +
> +	return 0;
> +}
> +
> +static void vmw_stdu_primary_plane_panic_flush(struct drm_plane *plane)
> +{
> +	struct drm_plane_state *state = plane->state;
> +	struct vmw_plane_state *vps = vmw_plane_state_to_vps(state);
> +	struct drm_crtc *crtc = state->crtc;
> +	struct vmw_private *dev_priv = vmw_priv(crtc->dev);
> +	struct vmw_framebuffer *vfb = vmw_framebuffer_to_vfb(state->fb);
> +	struct vmw_screen_target_display_unit *stdu = vmw_crtc_to_stdu(crtc);
> +	int ret;
> +
> +	stdu->display_srf = vmw_user_object_surface(&vps->uo);
> +	stdu->content_fb_type = vps->content_fb_type;
> +	stdu->cpp = vps->cpp;
> +
> +	ret = vmw_stdu_bind_st(dev_priv, stdu, &stdu->display_srf->res);
> +	if (ret)
> +		DRM_ERROR("Failed to bind surface to STDU.\n");
> +
> +	if (vfb->bo)
> +		ret = vmw_stdu_panic_plane_update_bo(dev_priv, plane, vfb);
> +	if (ret)
> +		DRM_ERROR("Failed to update STDU.\n");
> +}
> +
>   static void
>   vmw_stdu_crtc_atomic_flush(struct drm_crtc *crtc,
>   			   struct drm_atomic_state *state)
> @@ -1506,6 +1643,8 @@ drm_plane_helper_funcs vmw_stdu_primary_plane_helper_funcs = {
>   	.atomic_update = vmw_stdu_primary_plane_atomic_update,
>   	.prepare_fb = vmw_stdu_primary_plane_prepare_fb,
>   	.cleanup_fb = vmw_stdu_primary_plane_cleanup_fb,
> +	.get_scanout_buffer = vmw_stdu_primary_plane_get_scanout_buffer,
> +	.panic_flush = vmw_stdu_primary_plane_panic_flush,
>   };
>   
>   static const struct drm_crtc_helper_funcs vmw_stdu_crtc_helper_funcs = {

