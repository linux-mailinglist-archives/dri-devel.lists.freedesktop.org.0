Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DC71974C16
	for <lists+dri-devel@lfdr.de>; Wed, 11 Sep 2024 10:04:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9363F10E819;
	Wed, 11 Sep 2024 08:04:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="f9BYtiqr";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D57E10E976
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 08:04:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1726041872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=zN7Nx9wbm87vDbixdnAvR+8D6LX+5L0REN5XvFjsOdE=;
 b=f9BYtiqrusFK9hp2tpn0In2WAq8LrbKRM3q50Uirq45BcsSWdqNW9aGVOZ/B4bO5d5pTGG
 ieMeIJZMFV+imsPfl0N4qlpVIwI9tKpMvhXlEDgrcKhK7R271jrzFXSTSh2ZSqsV63OCoN
 9cZqUqKl8xL8KjbO2wZAltkzeom7slc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-461-wBGBnUenPBWLV1TGiLTEUg-1; Wed, 11 Sep 2024 04:04:30 -0400
X-MC-Unique: wBGBnUenPBWLV1TGiLTEUg-1
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-374c434b952so3028327f8f.1
 for <dri-devel@lists.freedesktop.org>; Wed, 11 Sep 2024 01:04:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726041869; x=1726646669;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zN7Nx9wbm87vDbixdnAvR+8D6LX+5L0REN5XvFjsOdE=;
 b=Ihfk2PN35YyXpev8mRJ9ePAjtG5fSKB8D/9kY65bqn3pMA0bgoSn71YFCyzxNtDwcV
 BddxRYbXaPz+4pv8g2TsSi8gz5FlDdy2SELgEy6y38CnT/vSuqKlz9xu+YCdrLiGQIr/
 /8RCcC/a8Us66M826H9OVLQxAuHhYigqR1dtRS5qfspPBzxrUJADxIEyTzlhcm4lq1XQ
 D0IVN+zhvYycpanVi/YI/BMzzu1yf5map9ML6Eywy+SpRCwMXHBjEEx+IS0Wqg+o2BEL
 zEjcUR4hpkkZnMQ0rS1OXwWS97NitS2k5fidxX0pPpiuk6EZWuZwP6BsiQTqaBgr2B9H
 bz3w==
X-Gm-Message-State: AOJu0YxnCUSfFYlylWlXynD08JrWn4+4cnpT+jGcgyBGWME0r8NRN3qG
 lOAotC2ZCX4KEXpKlnKoO67i+RXXHf8WWQVeOsRT7VfWdve4mPt43uz98FJkKoPn62jmN0o0jRy
 iZ7OeVSWyKQUZGzCTnsgQaYFEN3pnhMRTeoDSbK7P+F4gDFlTX51vP9ELUMrTvBa2dTvvTbvk0g
 +acCpyOATYRyB3M/OnJgBRRs8hb4byNUwv/Q76okf1xzFafKQhwg==
X-Received: by 2002:adf:e242:0:b0:371:8c19:f5e6 with SMTP id
 ffacd0b85a97d-378896a3e97mr11102088f8f.40.1726041869123; 
 Wed, 11 Sep 2024 01:04:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG3Y2qtzM6tzIx3DodTBL/V8p/zbakCx3SMzZtSf79lUzzhmF73iGLOogtiaim76By5wx2bng==
X-Received: by 2002:adf:e242:0:b0:371:8c19:f5e6 with SMTP id
 ffacd0b85a97d-378896a3e97mr11102061f8f.40.1726041868349; 
 Wed, 11 Sep 2024 01:04:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37895665517sm11080737f8f.36.2024.09.11.01.04.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 11 Sep 2024 01:04:27 -0700 (PDT)
Message-ID: <958c8191-7266-4ed6-b745-01cb0e4560f8@redhat.com>
Date: Wed, 11 Sep 2024 10:04:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] drm/virtio: Defer the host dumb buffer creation
To: dri-devel@lists.freedesktop.org
References: <20240903075414.297622-1-jfalempe@redhat.com>
 <dc88e7b9-ff0d-4405-88d1-bd94df550ae7@collabora.com>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <dc88e7b9-ff0d-4405-88d1-bd94df550ae7@collabora.com>
X-Mimecast-Spam-Score: 0
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

On 11/09/2024 00:09, Dmitry Osipenko wrote:
> On 9/3/24 10:48, Jocelyn Falempe wrote:
>> The host dumb buffer command needs a format, but the
>> DRM_IOCTL_MODE_CREATE_DUMB only provides a buffer size.
>> So wait for the DRM_IOCTL_MODE_ADDFB(2), to get the format, and create
>> the host resources at this time.
>>
>> This will allow virtio-gpu to support multiple pixel formats.
>>
>> This problem was noticed in commit 42fd9e6c29b39 ("drm/virtio: fix
>> DRM_FORMAT_* handling")
>>
>> Suggested-by: Gerd Hoffmann <kraxel@redhat.com>
>> Signed-off-by: Jocelyn Falempe <jfalempe@redhat.com>
>> ---
>>
>> v2:
>>   * Move virtio_gpu_object deferred field to its own block (Geerd Hoffmann)
>>   * Check that the size of the dumb buffer can hold the framebuffer (Geerd Hoffmann)
>>
>>   drivers/gpu/drm/virtio/virtgpu_display.c | 33 ++++++++++++++++++++++++
>>   drivers/gpu/drm/virtio/virtgpu_drv.h     |  5 ++++
>>   drivers/gpu/drm/virtio/virtgpu_gem.c     |  1 -
>>   drivers/gpu/drm/virtio/virtgpu_object.c  | 13 +++++++---
>>   4 files changed, 47 insertions(+), 5 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/virtio/virtgpu_display.c b/drivers/gpu/drm/virtio/virtgpu_display.c
>> index 64baf2f22d9f0..5e8ca742c6d00 100644
>> --- a/drivers/gpu/drm/virtio/virtgpu_display.c
>> +++ b/drivers/gpu/drm/virtio/virtgpu_display.c
>> @@ -290,6 +290,30 @@ static int vgdev_output_init(struct virtio_gpu_device *vgdev, int index)
>>   	return 0;
>>   }
>>   
>> +static int virtio_gpu_deferred_create(struct virtio_gpu_object *bo,
>> +				      struct virtio_gpu_device *vgdev,
>> +				      const struct drm_mode_fb_cmd2 *mode_cmd)
>> +{
>> +	struct virtio_gpu_object_params params = { 0 };
>> +
>> +	params.format = virtio_gpu_translate_format(mode_cmd->pixel_format);
>> +	params.dumb = true;
>> +	params.width = mode_cmd->width;
>> +	params.height = mode_cmd->height;
>> +	params.size = params.height * params.width * 4;
>> +	params.size = ALIGN(params.size, PAGE_SIZE);
>> +
>> +	if (params.size > bo->base.base.size)
>> +		return -EINVAL;
>> +
>> +	virtio_gpu_cmd_create_resource(vgdev, bo, &params, NULL, NULL);
>> +	virtio_gpu_object_attach(vgdev, bo, bo->ents, bo->nents);
>> +
>> +	bo->deferred = false;
>> +	bo->ents = NULL;
>> +	return 0;
>> +}
>> +
>>   static struct drm_framebuffer *
>>   virtio_gpu_user_framebuffer_create(struct drm_device *dev,
>>   				   struct drm_file *file_priv,
>> @@ -297,6 +321,8 @@ virtio_gpu_user_framebuffer_create(struct drm_device *dev,
>>   {
>>   	struct drm_gem_object *obj = NULL;
>>   	struct virtio_gpu_framebuffer *virtio_gpu_fb;
>> +	struct virtio_gpu_device *vgdev = dev->dev_private;
>> +	struct virtio_gpu_object *bo;
>>   	int ret;
>>   
>>   	if (mode_cmd->pixel_format != DRM_FORMAT_HOST_XRGB8888 &&
>> @@ -308,6 +334,13 @@ virtio_gpu_user_framebuffer_create(struct drm_device *dev,
>>   	if (!obj)
>>   		return ERR_PTR(-EINVAL);
>>   
>> +	bo = gem_to_virtio_gpu_obj(obj);
>> +	if (bo->deferred) {
>> +		ret = virtio_gpu_deferred_create(bo, vgdev, mode_cmd);
>> +		if (ret)
>> +			return ERR_PTR(ret);
>> +	}
>> +
>>   	virtio_gpu_fb = kzalloc(sizeof(*virtio_gpu_fb), GFP_KERNEL);
>>   	if (virtio_gpu_fb == NULL) {
>>   		drm_gem_object_put(obj);
>> diff --git a/drivers/gpu/drm/virtio/virtgpu_drv.h b/drivers/gpu/drm/virtio/virtgpu_drv.h
>> index 64c236169db88..4302933e5067c 100644
>> --- a/drivers/gpu/drm/virtio/virtgpu_drv.h
>> +++ b/drivers/gpu/drm/virtio/virtgpu_drv.h
>> @@ -95,6 +95,11 @@ struct virtio_gpu_object {
>>   	bool host3d_blob, guest_blob;
>>   	uint32_t blob_mem, blob_flags;
>>   
>> +	/* For deferred dumb buffer creation */
>> +	bool deferred;
>> +	struct virtio_gpu_mem_entry *ents;
>> +	unsigned int nents;
>> +
>>   	int uuid_state;
>>   	uuid_t uuid;
>>   };
>> diff --git a/drivers/gpu/drm/virtio/virtgpu_gem.c b/drivers/gpu/drm/virtio/virtgpu_gem.c
>> index 7db48d17ee3a8..33ad15fed30f6 100644
>> --- a/drivers/gpu/drm/virtio/virtgpu_gem.c
>> +++ b/drivers/gpu/drm/virtio/virtgpu_gem.c
>> @@ -75,7 +75,6 @@ int virtio_gpu_mode_dumb_create(struct drm_file *file_priv,
>>   	args->size = pitch * args->height;
>>   	args->size = ALIGN(args->size, PAGE_SIZE);
>>   
>> -	params.format = virtio_gpu_translate_format(DRM_FORMAT_HOST_XRGB8888);
> 
> This will break the guest blob code path in virtio_gpu_object_create(),
> AFAICT.

The params.format is not used in virtio_gpu_cmd_resource_create_3d() nor 
in virtio_gpu_cmd_resource_create_blob(), it's only used for dumb buffer 
creation. So it shouldn't break the guest blob path.
> 
>>   	params.width = args->width;
>>   	params.height = args->height;
>>   	params.size = args->size;
>> diff --git a/drivers/gpu/drm/virtio/virtgpu_object.c b/drivers/gpu/drm/virtio/virtgpu_object.c
>> index c7e74cf130221..b5a537a761294 100644
>> --- a/drivers/gpu/drm/virtio/virtgpu_object.c
>> +++ b/drivers/gpu/drm/virtio/virtgpu_object.c
>> @@ -67,6 +67,8 @@ void virtio_gpu_cleanup_object(struct virtio_gpu_object *bo)
>>   
>>   	virtio_gpu_resource_id_put(vgdev, bo->hw_res_handle);
>>   	if (virtio_gpu_is_shmem(bo)) {
>> +		if (bo->deferred)
>> +			kvfree(bo->ents);
>>   		drm_gem_shmem_free(&bo->base);
>>   	} else if (virtio_gpu_is_vram(bo)) {
>>   		struct virtio_gpu_object_vram *vram = to_virtio_gpu_vram(bo);
>> @@ -228,10 +230,13 @@ int virtio_gpu_object_create(struct virtio_gpu_device *vgdev,
>>   		virtio_gpu_cmd_resource_create_3d(vgdev, bo, params,
>>   						  objs, fence);
>>   		virtio_gpu_object_attach(vgdev, bo, ents, nents);
>> -	} else {
>> -		virtio_gpu_cmd_create_resource(vgdev, bo, params,
>> -					       objs, fence);
>> -		virtio_gpu_object_attach(vgdev, bo, ents, nents);
>> +	} else if (params->dumb) {
>> +		/* Create the host resource in virtio_gpu_user_framebuffer_create()
>> +		 * because the pixel format is not specified yet
>> +		 */
>> +		bo->ents = ents;
>> +		bo->nents = nents;
>> +		bo->deferred = true;
>>   	}
> 
> AFAICS, the "params.dumb = true" should be set in
> virtio_gpu_mode_dumb_create() and not in virtio_gpu_deferred_create().
> Was this patch tested?

You're right that params.dumb is not used in 
virtio_gpu_cmd_create_resource() so it's useless to set it in 
virtio_gpu_deferred_create(). I can remove that line.
But it's also set in virtio_gpu_mode_dumb_create() and I didn't change 
that with this patch.

I'm testing on a s390x machine, and it allows wayland compositor to 
work. (The colors are still a mess, but at least it starts with this patch).
> 
> Overall, this deferred resource creation doesn't look robust. Could be
> better to either add SET_SCANOUT2 with the format info or add cmd that
> overrides the res fmt.
> 
This would also need modification in the qemu code, so it looks much 
more complex than this patch.

Best regards,

-- 

Jocelyn

