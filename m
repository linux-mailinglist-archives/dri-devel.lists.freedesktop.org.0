Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACE699D2358
	for <lists+dri-devel@lfdr.de>; Tue, 19 Nov 2024 11:22:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B721210E60B;
	Tue, 19 Nov 2024 10:22:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="OTfWsUg4";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B7CA10E60B
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 10:22:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1732011721;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8MNieSpE6gTBEIVtn2b0sVcAoq2jKuHsT3OLWhOmepc=;
 b=OTfWsUg4aDSueEAsO3skolWvWYS+U9KaloYou20+DNmlMlTh54UT2dCJjIUa148TBTl2gB
 tzCySO9w6QIS062rIIwO37pNBX9/DGIwYFSA2UfP3vbod+OFCj+GGCp5NNnyz9pplB8/ut
 ef5NIOISadv2j0VbEMaz8EDgqqqEuEk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-375-YrOzy_MoN9eUf_6IHN6oag-1; Tue, 19 Nov 2024 05:21:59 -0500
X-MC-Unique: YrOzy_MoN9eUf_6IHN6oag-1
X-Mimecast-MFC-AGG-ID: YrOzy_MoN9eUf_6IHN6oag
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-381d07c377cso2157807f8f.1
 for <dri-devel@lists.freedesktop.org>; Tue, 19 Nov 2024 02:21:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732011718; x=1732616518;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=8MNieSpE6gTBEIVtn2b0sVcAoq2jKuHsT3OLWhOmepc=;
 b=n49dphbHOC5bDDi65gJD4AbnZFZEnAwdqM1XnZLgBECkgNvy/qfQuBCrZmp3UQm4FQ
 l9Cfk2IWPhSKotmeEICvJDtddEc593N3753R1Oc+oc1CfBob1XqPUAv+qA44Pp9eaWzD
 3LlLX3eyz9Ge/cbZ5MrcRkbOK3Y2aNzuTunlQz1gPyEGoKvaWpdWhLM27ENPJSkmECTl
 v9Oo/LQHvnjY23bxiddiKCHqa4YrmwmZYg6LYMDxXTqZAxk8rPgNSz+xgh5uBSZgvhBS
 KYxUZu4qXKqIyr++F6Q51XgqkKW2ZzWiY/q5J6jnymTla+FuAnWHFK1Y47ZHF5WWFBv8
 o6QA==
X-Gm-Message-State: AOJu0YwYE4+ArZthYiJVzZjPrrWrY5McyoRCH4GaQ3iVoQo0ptW/NKFe
 BrM2DbQkYwVbK0ZDlJcQHI6Bxedf/EXymc5sNYonNSxzXYLZmgeo9/4Ej4g5JdsPN5wQM1bPDEG
 aTCmJIP6mb9XbH7DJbbanq5szNa19i438E2I6ZJIWvYt7jLjmyJpj3/bUncdCQMEqZQ==
X-Received: by 2002:a5d:6d8a:0:b0:382:4921:21b5 with SMTP id
 ffacd0b85a97d-382492124cemr6031464f8f.43.1732011718343; 
 Tue, 19 Nov 2024 02:21:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IESq6DyI+r9NsoAI08+JoruDcdy8pKuWK8e1UPeNUO1nqs0Iqg3gL1Tiq0xdqBexTVPqYnFjQ==
X-Received: by 2002:a5d:6d8a:0:b0:382:4921:21b5 with SMTP id
 ffacd0b85a97d-382492124cemr6031425f8f.43.1732011717906; 
 Tue, 19 Nov 2024 02:21:57 -0800 (PST)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-382308532cbsm11506201f8f.88.2024.11.19.02.21.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Nov 2024 02:21:57 -0800 (PST)
Message-ID: <ec721548-0d47-4c40-9e9d-59f58e2181ae@redhat.com>
Date: Tue, 19 Nov 2024 11:21:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/virtio: Add drm_panic support
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Ryosuke Yasuoka <ryasuoka@redhat.com>, airlied@redhat.com,
 kraxel@redhat.com, gurchetansingh@chromium.org, olvaffe@gmail.com,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20241113084438.3283737-1-ryasuoka@redhat.com>
 <f31a8d1f-73d5-424e-ad09-2ae39712e230@collabora.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <f31a8d1f-73d5-424e-ad09-2ae39712e230@collabora.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: xnt23VC-52TCZshD7M2DgFCD2wSoxskYJqh5pOIgjEM_1732011718
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

On 18/11/2024 17:16, Dmitry Osipenko wrote:
> On 11/13/24 11:44, Ryosuke Yasuoka wrote:
>> From: Jocelyn Falempe <jfalempe@redhat.com>
>>
>> Virtio gpu supports the drm_panic module, which displays a message to
>> the screen when a kernel panic occurs.
>>
>> Signed-off-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
> 
> On a second look, I spotted few problems, see them below:
> 
> ...
>> +/* For drm_panic */
>> +static int virtio_gpu_panic_resource_flush(struct drm_plane *plane,
>> +					   struct virtio_gpu_vbuffer *vbuf,
>> +					   uint32_t x, uint32_t y,
>> +					   uint32_t width, uint32_t height)
>> +{
>> +	int ret;
>> +	struct drm_device *dev = plane->dev;
>> +	struct virtio_gpu_device *vgdev = dev->dev_private;
>> +	struct virtio_gpu_framebuffer *vgfb;
>> +	struct virtio_gpu_object *bo;
>> +
>> +	vgfb = to_virtio_gpu_framebuffer(plane->state->fb);
>> +	bo = gem_to_virtio_gpu_obj(vgfb->base.obj[0]);
>> +
>> +	ret = virtio_gpu_panic_cmd_resource_flush(vgdev, vbuf, bo->hw_res_handle, x, y,
>> +						  width, height);
>> +	return ret;
> 
> Nit: return directly directly in such cases, dummy ret variable not needed
> 
>> +}
>> +
>>   static void virtio_gpu_resource_flush(struct drm_plane *plane,
>>   				      uint32_t x, uint32_t y,
>>   				      uint32_t width, uint32_t height)
>> @@ -359,11 +406,128 @@ static void virtio_gpu_cursor_plane_update(struct drm_plane *plane,
>>   	virtio_gpu_cursor_ping(vgdev, output);
>>   }
>>   
>> +static int virtio_drm_get_scanout_buffer(struct drm_plane *plane,
>> +					 struct drm_scanout_buffer *sb)
>> +{
>> +	struct virtio_gpu_object *bo;
>> +
>> +	if (!plane->state || !plane->state->fb || !plane->state->visible)
>> +		return -ENODEV;
>> +
>> +	bo = gem_to_virtio_gpu_obj(plane->state->fb->obj[0]);
> 
> VRAM BOs aren't vmappable and should be rejected.
> 
> In the virtio_panic_flush() below,
> virtio_gpu_panic_cmd_transfer_to_host_2d() is invoked only for dumb BOs.
> Thus, only dumb BO supports panic output and should be accepted by
> get_scanout_buffer(), other should be rejected with ENODEV here, AFAICT.
> Correct?

Yes, it's correct
> 
>> +	/* try to vmap it if possible */
>> +	if (!bo->base.vaddr) {
>> +		int ret;
>> +
>> +		ret = drm_gem_shmem_vmap(&bo->base, &sb->map[0]);
>> +		if (ret)
>> +			return ret;
>> +	} else {
>> +		iosys_map_set_vaddr(&sb->map[0], bo->base.vaddr);
>> +	}
>> +
>> +	sb->format = plane->state->fb->format;
>> +	sb->height = plane->state->fb->height;
>> +	sb->width = plane->state->fb->width;
>> +	sb->pitch[0] = plane->state->fb->pitches[0];
>> +	return 0;
>> +}
>> +
>> +struct virtio_gpu_panic_object_array {
>> +	struct ww_acquire_ctx ticket;
>> +	struct list_head next;
>> +	u32 nents, total;
>> +	struct drm_gem_object *objs;
>> +};
> 
> This virtio_gpu_panic_object_array struct is a hack, use
> virtio_gpu_array_alloc(). Maybe add atomic variant of the array_alloc().

We can't allocate memory in the panic handler, but maybe it can be 
pre-allocated, like the virtio_panic_buffer ?
> 
>> +static void virtio_gpu_panic_put_vbuf(struct virtqueue *vq,
>> +				      struct virtio_gpu_vbuffer *vbuf,
>> +				      struct virtio_gpu_object_array *objs)
>> +{
>> +	unsigned int len;
>> +	int i;
>> +
>> +	/* waiting vbuf to be used */
>> +	for (i = 0; i < 500; i++) {
>> +		if (vbuf == virtqueue_get_buf(vq, &len)) {
> 
> Is it guaranteed that virtio_gpu_dequeue_ctrl_func() never runs in
> parallel here?

Yes, in the panic handler, only one CPU remains active, and no other 
task can be scheduled.
> 
>> +			if (objs != NULL && vbuf->objs)
>> +				drm_gem_object_put(objs->objs[0]);
> 
> This drm_gem_object_put(objs->objs) is difficult to follow. Why
> vbuf->objs can't be used directly?
> 
> Better to remove all error handlings for simplicity. It's not important
> if a bit of memory leaked on panic.

We try to reclaim, to make it easier to test with the debugfs interface.
But this is a bit racy anyway, because it's not the real panic context.
> 
>> +			break;
>> +		}
>> +		udelay(1);
>> +	}
>> +}
>> +
>> +static void virtio_panic_flush(struct drm_plane *plane)
>> +{
>> +	int ret;
>> +	struct virtio_gpu_object *bo;
>> +	struct drm_device *dev = plane->dev;
>> +	struct virtio_gpu_device *vgdev = dev->dev_private;
>> +	struct drm_rect rect;
>> +	void *vp_buf = vgdev->virtio_panic_buffer;
>> +	struct virtio_gpu_vbuffer *vbuf_dumb_bo = vp_buf;
>> +	struct virtio_gpu_vbuffer *vbuf_resource_flush = vp_buf + VBUFFER_SIZE;
>> +
>> +	rect.x1 = 0;
>> +	rect.y1 = 0;
>> +	rect.x2 = plane->state->fb->width;
>> +	rect.y2 = plane->state->fb->height;
>> +
>> +	bo = gem_to_virtio_gpu_obj(plane->state->fb->obj[0]);
>> +
>> +	struct drm_gem_object obj;
>> +	struct virtio_gpu_panic_object_array objs = {
>> +		.next = { NULL, NULL },
>> +		.nents = 0,
>> +		.total = 1,
>> +		.objs = &obj
>> +	};
> 
> This &obj is unitialized stack data. The .objs points to an array of obj
> pointers and you pointing it to object. Like I suggested above, let's
> remove this hack and use proper virtio_gpu_array_alloc().
> 
>> +	if (bo->dumb) {
>> +		ret = virtio_gpu_panic_update_dumb_bo(vgdev,
>> +						      plane->state,
>> +						      &rect,
>> +						      (struct virtio_gpu_object_array *)&objs,
>> +						      vbuf_dumb_bo);
>> +		if (ret) {
>> +			if (vbuf_dumb_bo->objs)
>> +				drm_gem_object_put(&objs.objs[0]);
>> +			return;
>> +		}
>> +	}
>> +
>> +	ret = virtio_gpu_panic_resource_flush(plane, vbuf_resource_flush,
>> +					      plane->state->src_x >> 16,
>> +					      plane->state->src_y >> 16,
>> +					      plane->state->src_w >> 16,
>> +					      plane->state->src_h >> 16);
>> +	if (ret) {
>> +		virtio_gpu_panic_put_vbuf(vgdev->ctrlq.vq,
>> +					  vbuf_dumb_bo,
>> +					  (struct virtio_gpu_object_array *)&objs);
> 
> The virtio_gpu_panic_notify() hasn't been invoked here, thus this
> put_vbuf should always time out because vq hasn't been kicked. Again,
> best to leak resources on error than to have broken/untested error
> handling code paths.

agreed
> 
>> +		return;
>> +	}
>> +
>> +	virtio_gpu_panic_notify(vgdev);
>> +
>> +	virtio_gpu_panic_put_vbuf(vgdev->ctrlq.vq,
>> +				  vbuf_dumb_bo,
>> +				  (struct virtio_gpu_object_array *)&objs);
>> +	virtio_gpu_panic_put_vbuf(vgdev->ctrlq.vq,
>> +				  vbuf_resource_flush,
>> +				  NULL);
>> +}
>> +
>>   static const struct drm_plane_helper_funcs virtio_gpu_primary_helper_funcs = {
>>   	.prepare_fb		= virtio_gpu_plane_prepare_fb,
>>   	.cleanup_fb		= virtio_gpu_plane_cleanup_fb,
>>   	.atomic_check		= virtio_gpu_plane_atomic_check,
>>   	.atomic_update		= virtio_gpu_primary_plane_update,
>> +	.get_scanout_buffer	= virtio_drm_get_scanout_buffer,
>> +	.panic_flush		= virtio_panic_flush,
>>   };
>>   
>>   static const struct drm_plane_helper_funcs virtio_gpu_cursor_helper_funcs = {
>> @@ -383,6 +547,13 @@ struct drm_plane *virtio_gpu_plane_init(struct virtio_gpu_device *vgdev,
>>   	const uint32_t *formats;
>>   	int nformats;
>>   
>> +	/* allocate panic buffers */
>> +	if (index == 0 && type == DRM_PLANE_TYPE_PRIMARY) {
>> +		vgdev->virtio_panic_buffer = drmm_kzalloc(dev, 2 * VBUFFER_SIZE, GFP_KERNEL);
>> +		if (!vgdev->virtio_panic_buffer)
>> +			return ERR_PTR(-ENOMEM);
>> +	}
> 
> If there is more than one virtio-gpu display, then this panic buffer is
> reused by other displays. It seems to work okay, but potential
> implications are unclear. Won't it be more robust to have a panic buffer
> per CRTC?

The drm panic handler call each plane sequentially, so it's not a 
problem. Having one buffer per CRTC would just add more complexity.

> 
> Also, please rename vgdev->virtio_panic_buffer to vgdev->panic_vbuf for
> brevity.
> 

Thanks for the review.

-- 

Jocelyn

