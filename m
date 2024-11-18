Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7E3A9D1529
	for <lists+dri-devel@lfdr.de>; Mon, 18 Nov 2024 17:17:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A81F10E163;
	Mon, 18 Nov 2024 16:17:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=collabora.com header.i=dmitry.osipenko@collabora.com header.b="EWpPVUO0";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com
 [136.143.188.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5546E10E163
 for <dri-devel@lists.freedesktop.org>; Mon, 18 Nov 2024 16:17:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1731946619; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=EjX99rYKMKpe+4qAyaiz4WV0Y0y43xMQCqt60IlX4Jt3IoHhaGLaIuSMvPKEuLAKM1dC2PX9sBfJfXIuu/jru/imqXKMdURtrheUYTSDsRjdsw7y1fpkcJysdHtIvWfyPOUbo948KudjhHNgGWcjUTg7gRYOnfcR0JEQPNSARco=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1731946619;
 h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To;
 bh=Zd6CgBIQAUUeDjZPP0+TxMRYrOx8gekX99SnHY/7F0s=; 
 b=F+IYG8VpfdffTRgbAkWDKi96Le3yR5sBcyXBpRQQPOhwjnMMRkXLtf3Ky8v3zxxHkPwI3FouciK7b5F4Mqc/CuisGDKnEObWyiM3SLZdJJQQBz3XXuC03GSOxkc6bLEd3v3x333cZFRwNHW5XCbDiFOo/r0JmSc7Fl2ukBC89kY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=collabora.com;
 spf=pass  smtp.mailfrom=dmitry.osipenko@collabora.com;
 dmarc=pass header.from=<dmitry.osipenko@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1731946619; 
 s=zohomail; d=collabora.com; i=dmitry.osipenko@collabora.com; 
 h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:References:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
 bh=Zd6CgBIQAUUeDjZPP0+TxMRYrOx8gekX99SnHY/7F0s=;
 b=EWpPVUO0guR8h6fnQiFBveB2eWQ2v1H2WZvIT0WU9EzLerq55b0ALMHf+7384wxC
 jmT1OBSsd113l3F8Dcd0x7k8ryHggWZs39O6sekK828q1mSDAPylxHAOkvJH0m38iXL
 YwAHgJ0ihW5Px51JBLlsQq322PmlpgRh3DfGOPyo=
Received: by mx.zohomail.com with SMTPS id 1731946618743272.2388897538434;
 Mon, 18 Nov 2024 08:16:58 -0800 (PST)
Message-ID: <f31a8d1f-73d5-424e-ad09-2ae39712e230@collabora.com>
Date: Mon, 18 Nov 2024 19:16:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/virtio: Add drm_panic support
To: Ryosuke Yasuoka <ryasuoka@redhat.com>, airlied@redhat.com,
 kraxel@redhat.com, gurchetansingh@chromium.org, olvaffe@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 simona@ffwll.ch
Cc: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux.dev, linux-kernel@vger.kernel.org
References: <20241113084438.3283737-1-ryasuoka@redhat.com>
Content-Language: en-US
From: Dmitry Osipenko <dmitry.osipenko@collabora.com>
In-Reply-To: <20241113084438.3283737-1-ryasuoka@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
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

On 11/13/24 11:44, Ryosuke Yasuoka wrote:
> From: Jocelyn Falempe <jfalempe@redhat.com>
> 
> Virtio gpu supports the drm_panic module, which displays a message to
> the screen when a kernel panic occurs.
> 
> Signed-off-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
> ---

On a second look, I spotted few problems, see them below:

...
> +/* For drm_panic */
> +static int virtio_gpu_panic_resource_flush(struct drm_plane *plane,
> +					   struct virtio_gpu_vbuffer *vbuf,
> +					   uint32_t x, uint32_t y,
> +					   uint32_t width, uint32_t height)
> +{
> +	int ret;
> +	struct drm_device *dev = plane->dev;
> +	struct virtio_gpu_device *vgdev = dev->dev_private;
> +	struct virtio_gpu_framebuffer *vgfb;
> +	struct virtio_gpu_object *bo;
> +
> +	vgfb = to_virtio_gpu_framebuffer(plane->state->fb);
> +	bo = gem_to_virtio_gpu_obj(vgfb->base.obj[0]);
> +
> +	ret = virtio_gpu_panic_cmd_resource_flush(vgdev, vbuf, bo->hw_res_handle, x, y,
> +						  width, height);
> +	return ret;

Nit: return directly directly in such cases, dummy ret variable not needed

> +}
> +
>  static void virtio_gpu_resource_flush(struct drm_plane *plane,
>  				      uint32_t x, uint32_t y,
>  				      uint32_t width, uint32_t height)
> @@ -359,11 +406,128 @@ static void virtio_gpu_cursor_plane_update(struct drm_plane *plane,
>  	virtio_gpu_cursor_ping(vgdev, output);
>  }
>  
> +static int virtio_drm_get_scanout_buffer(struct drm_plane *plane,
> +					 struct drm_scanout_buffer *sb)
> +{
> +	struct virtio_gpu_object *bo;
> +
> +	if (!plane->state || !plane->state->fb || !plane->state->visible)
> +		return -ENODEV;
> +
> +	bo = gem_to_virtio_gpu_obj(plane->state->fb->obj[0]);

VRAM BOs aren't vmappable and should be rejected.

In the virtio_panic_flush() below,
virtio_gpu_panic_cmd_transfer_to_host_2d() is invoked only for dumb BOs.
Thus, only dumb BO supports panic output and should be accepted by
get_scanout_buffer(), other should be rejected with ENODEV here, AFAICT.
Correct?

> +	/* try to vmap it if possible */
> +	if (!bo->base.vaddr) {
> +		int ret;
> +
> +		ret = drm_gem_shmem_vmap(&bo->base, &sb->map[0]);
> +		if (ret)
> +			return ret;
> +	} else {
> +		iosys_map_set_vaddr(&sb->map[0], bo->base.vaddr);
> +	}
> +
> +	sb->format = plane->state->fb->format;
> +	sb->height = plane->state->fb->height;
> +	sb->width = plane->state->fb->width;
> +	sb->pitch[0] = plane->state->fb->pitches[0];
> +	return 0;
> +}
> +
> +struct virtio_gpu_panic_object_array {
> +	struct ww_acquire_ctx ticket;
> +	struct list_head next;
> +	u32 nents, total;
> +	struct drm_gem_object *objs;
> +};

This virtio_gpu_panic_object_array struct is a hack, use
virtio_gpu_array_alloc(). Maybe add atomic variant of the array_alloc().

> +static void virtio_gpu_panic_put_vbuf(struct virtqueue *vq,
> +				      struct virtio_gpu_vbuffer *vbuf,
> +				      struct virtio_gpu_object_array *objs)
> +{
> +	unsigned int len;
> +	int i;
> +
> +	/* waiting vbuf to be used */
> +	for (i = 0; i < 500; i++) {
> +		if (vbuf == virtqueue_get_buf(vq, &len)) {

Is it guaranteed that virtio_gpu_dequeue_ctrl_func() never runs in
parallel here?

> +			if (objs != NULL && vbuf->objs)
> +				drm_gem_object_put(objs->objs[0]);

This drm_gem_object_put(objs->objs) is difficult to follow. Why
vbuf->objs can't be used directly?

Better to remove all error handlings for simplicity. It's not important
if a bit of memory leaked on panic.

> +			break;
> +		}
> +		udelay(1);
> +	}
> +}
> +
> +static void virtio_panic_flush(struct drm_plane *plane)
> +{
> +	int ret;
> +	struct virtio_gpu_object *bo;
> +	struct drm_device *dev = plane->dev;
> +	struct virtio_gpu_device *vgdev = dev->dev_private;
> +	struct drm_rect rect;
> +	void *vp_buf = vgdev->virtio_panic_buffer;
> +	struct virtio_gpu_vbuffer *vbuf_dumb_bo = vp_buf;
> +	struct virtio_gpu_vbuffer *vbuf_resource_flush = vp_buf + VBUFFER_SIZE;
> +
> +	rect.x1 = 0;
> +	rect.y1 = 0;
> +	rect.x2 = plane->state->fb->width;
> +	rect.y2 = plane->state->fb->height;
> +
> +	bo = gem_to_virtio_gpu_obj(plane->state->fb->obj[0]);
> +
> +	struct drm_gem_object obj;
> +	struct virtio_gpu_panic_object_array objs = {
> +		.next = { NULL, NULL },
> +		.nents = 0,
> +		.total = 1,
> +		.objs = &obj
> +	};

This &obj is unitialized stack data. The .objs points to an array of obj
pointers and you pointing it to object. Like I suggested above, let's
remove this hack and use proper virtio_gpu_array_alloc().

> +	if (bo->dumb) {
> +		ret = virtio_gpu_panic_update_dumb_bo(vgdev,
> +						      plane->state,
> +						      &rect,
> +						      (struct virtio_gpu_object_array *)&objs,
> +						      vbuf_dumb_bo);
> +		if (ret) {
> +			if (vbuf_dumb_bo->objs)
> +				drm_gem_object_put(&objs.objs[0]);
> +			return;
> +		}
> +	}
> +
> +	ret = virtio_gpu_panic_resource_flush(plane, vbuf_resource_flush,
> +					      plane->state->src_x >> 16,
> +					      plane->state->src_y >> 16,
> +					      plane->state->src_w >> 16,
> +					      plane->state->src_h >> 16);
> +	if (ret) {
> +		virtio_gpu_panic_put_vbuf(vgdev->ctrlq.vq,
> +					  vbuf_dumb_bo,
> +					  (struct virtio_gpu_object_array *)&objs);

The virtio_gpu_panic_notify() hasn't been invoked here, thus this
put_vbuf should always time out because vq hasn't been kicked. Again,
best to leak resources on error than to have broken/untested error
handling code paths.

> +		return;
> +	}
> +
> +	virtio_gpu_panic_notify(vgdev);
> +
> +	virtio_gpu_panic_put_vbuf(vgdev->ctrlq.vq,
> +				  vbuf_dumb_bo,
> +				  (struct virtio_gpu_object_array *)&objs);
> +	virtio_gpu_panic_put_vbuf(vgdev->ctrlq.vq,
> +				  vbuf_resource_flush,
> +				  NULL);
> +}
> +
>  static const struct drm_plane_helper_funcs virtio_gpu_primary_helper_funcs = {
>  	.prepare_fb		= virtio_gpu_plane_prepare_fb,
>  	.cleanup_fb		= virtio_gpu_plane_cleanup_fb,
>  	.atomic_check		= virtio_gpu_plane_atomic_check,
>  	.atomic_update		= virtio_gpu_primary_plane_update,
> +	.get_scanout_buffer	= virtio_drm_get_scanout_buffer,
> +	.panic_flush		= virtio_panic_flush,
>  };
>  
>  static const struct drm_plane_helper_funcs virtio_gpu_cursor_helper_funcs = {
> @@ -383,6 +547,13 @@ struct drm_plane *virtio_gpu_plane_init(struct virtio_gpu_device *vgdev,
>  	const uint32_t *formats;
>  	int nformats;
>  
> +	/* allocate panic buffers */
> +	if (index == 0 && type == DRM_PLANE_TYPE_PRIMARY) {
> +		vgdev->virtio_panic_buffer = drmm_kzalloc(dev, 2 * VBUFFER_SIZE, GFP_KERNEL);
> +		if (!vgdev->virtio_panic_buffer)
> +			return ERR_PTR(-ENOMEM);
> +	}

If there is more than one virtio-gpu display, then this panic buffer is
reused by other displays. It seems to work okay, but potential
implications are unclear. Won't it be more robust to have a panic buffer
per CRTC?

Also, please rename vgdev->virtio_panic_buffer to vgdev->panic_vbuf for
brevity.

-- 
Best regards,
Dmitry

