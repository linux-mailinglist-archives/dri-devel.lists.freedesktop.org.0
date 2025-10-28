Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66370C14FE4
	for <lists+dri-devel@lfdr.de>; Tue, 28 Oct 2025 14:56:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 865E310E3F3;
	Tue, 28 Oct 2025 13:55:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="JjR1xJuD";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83E8E10E3F3
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 13:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761659756;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TP3sMnWb954GwG5aHzvMI/fn46BxA3t9cRLXM251tSg=;
 b=JjR1xJuDUhzlpV5iRAr9eITiKHK5nk5KqNWCo3/DFeHz1ROZWGmk6tejcxwqj8jp6mh0Y7
 lwdsPZvEslaTH8gkf7Wfo1g5ilQ4Nwqb+pPROJt7Pt84c0MrMSWLQDs2O6nAiMjF7fEat4
 Q+dwdS9V4lxhtxGDmIn/oBIODT+bfFU=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-255-0UuGt2RxN7-4dV52uGOr8w-1; Tue, 28 Oct 2025 09:55:55 -0400
X-MC-Unique: 0UuGt2RxN7-4dV52uGOr8w-1
X-Mimecast-MFC-AGG-ID: 0UuGt2RxN7-4dV52uGOr8w_1761659754
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-4770e0910a1so14329035e9.2
 for <dri-devel@lists.freedesktop.org>; Tue, 28 Oct 2025 06:55:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761659754; x=1762264554;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TP3sMnWb954GwG5aHzvMI/fn46BxA3t9cRLXM251tSg=;
 b=ngwanT86xxCyWvDZwIXnwEkRtRK+dL/WaaJaSqn9b2MX4e3FLzJ5aeqZFZDZaZJ5EB
 nYBJdrFx9Y/bFf8ncgeR8oS8huY8nDWPlXJxBjt1TcPJnMwFPOVQG5eA4uJT/7hVFjiB
 39TK8Mr4Vbg+Vf314afPigB+urmVRZqizZGYtO/f4Iq0KS7Ou1YARUDVsJ1yhceKyxtD
 lrH3CnVteVFzLa1ldf6dY+m+O83UBlxkzAjes5Kg1L9yPQKk0t+9zrJHDo+ElCgsAZgE
 6rIo1/jeQ8tYAU5NWFAJ7WfR3iMiP30X78EDkHRKXuR8faciliD9gplMCIwkatVV1fY2
 1r4g==
X-Gm-Message-State: AOJu0Yy268TB2TO8vOEuilwda5UcymTRffy2KME+nryvTeDMyCr1ldCH
 yLqOHgr3+IXVKgfNn+L35P6xIBwHaITybK9RnwGIzxy+/qU4lQW8tHRrNjckwXQUsw4jy4nugY5
 yw7L5Um/Z4iJitD/zDuLWrVpJ4QOgfFv2/B8mNXfsMxeXQ80XIt8qJ8CsudJVIC4IkOFqnw==
X-Gm-Gg: ASbGnctXijJFRcaeklciOEzmHRtJhwoatPbh8MGD6KDhMAxSTP4Ckts+r+i/YD400AL
 J+jkAf+1gi9Ei5An+EMY8ZaTDULWr+qDoUNeppxtnIcG9chy8rrZp2osD3h2Nex8AMLyFiLYJwr
 MlFLmLRsfGSh7TnLFXXD0A/PHB8lxjKBumKtS7vQhPKgVb9pRfV8EzCvRKrxLEALAq7eDHntr4N
 VA+ChDTyCTQ71x2jOs/Et5FWiNfXy6x3XHRQL8ZQCdIrljedZYVCg9YcUyy3VE8d5pYwOoL28cJ
 ruUOPvmAS1QBuxiU4wDS2yRv0Z/zNah0mT8g2oKW5U5DNBRsySJyUH5Avun7XAY8J+D4Iu+xm7k
 eDztvtq6EbyS1D+kw09mo4mDnrCJqFXl4xENl1jI=
X-Received: by 2002:a05:600c:45d1:b0:46f:c55a:5a8d with SMTP id
 5b1f17b1804b1-47717df9d11mr34678015e9.4.1761659753846; 
 Tue, 28 Oct 2025 06:55:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHLPa4PANWNjlIdC/fX1eq93x6E3L0YnXlqQiTR8aBDrSESbvjS73t1g3rrie/Ndjoa0vVXFw==
X-Received: by 2002:a05:600c:45d1:b0:46f:c55a:5a8d with SMTP id
 5b1f17b1804b1-47717df9d11mr34677745e9.4.1761659753376; 
 Tue, 28 Oct 2025 06:55:53 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:d5:a000:d252:5640:545:41db?
 ([2a01:e0a:d5:a000:d252:5640:545:41db])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952d5768sm21140157f8f.24.2025.10.28.06.55.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Oct 2025 06:55:52 -0700 (PDT)
Message-ID: <3deee603-5eee-4341-96ca-8b8c672ce7ca@redhat.com>
Date: Tue, 28 Oct 2025 14:55:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/vmwgfx: Add drm_panic support
To: Ryosuke Yasuoka <ryasuoka@redhat.com>, Ian Forbes <ian.forbes@broadcom.com>
Cc: dri-devel@lists.freedesktop.org, bcm-kernel-feedback-list@broadcom.com,
 zack.rusin@broadcom.com, maaz.mombasawala@broadcom.com
References: <20251023200447.206834-1-ian.forbes@broadcom.com>
 <b4c069b6-b932-45a9-a681-f661bb0a89cf@redhat.com> <aQCuQITy-z8aMDE-@zeus>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <aQCuQITy-z8aMDE-@zeus>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: gNhNu2WUrQTCPZXIxdAZypIiAdbZMbc8TdYUCog6xTM_1761659754
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

On 28/10/2025 12:51, Ryosuke Yasuoka wrote:
> On Mon, Oct 27, 2025 at 02:56:21PM +0100, Jocelyn Falempe wrote:
>> On 23/10/2025 22:04, Ian Forbes wrote:
>>> Sets up VRAM as the scanout buffer then switches to legacy mode.
>>
>> Thank you and Ryosuke for working on drm_panic support on vmwgfx.
>> For the use of the drm_panic API, it looks good to me.
>>
>> Acked-by: Jocelyn Falempe <jfalempe@redhat.com>
>>>
>>> Suggested-by: Ryosuke Yasuoka <ryasuoka@redhat.com>
>>> Signed-off-by: Ian Forbes <ian.forbes@broadcom.com>
>>> ---
>>>    drivers/gpu/drm/vmwgfx/vmwgfx_kms.c  | 33 ++++++++++++++++++++++++++++
>>>    drivers/gpu/drm/vmwgfx/vmwgfx_kms.h  |  5 +++++
>>>    drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c |  2 ++
>>>    3 files changed, 40 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
>>> index 54ea1b513950..4ff4ae041236 100644
>>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
>>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.c
>>> @@ -20,6 +20,7 @@
>>>    #include <drm/drm_rect.h>
>>>    #include <drm/drm_sysfs.h>
>>>    #include <drm/drm_edid.h>
>>> +#include <drm/drm_panic.h>
>>>    void vmw_du_init(struct vmw_display_unit *du)
>>>    {
>>> @@ -2022,3 +2023,35 @@ bool vmw_user_object_is_null(struct vmw_user_object *uo)
>>>    {
>>>    	return !uo->buffer && !uo->surface;
>>>    }
>>> +
>>> +int
>>> +vmw_get_scanout_buffer(struct drm_plane *plane, struct drm_scanout_buffer *sb)
>>> +{
>>> +	void  *vram;
>>> +	struct vmw_private *vmw_priv = container_of(plane->dev, struct vmw_private, drm);
>>> +
>>> +	// Only call on the primary display
>>> +	if (container_of(plane, struct vmw_display_unit, primary)->unit != 0)
>>> +		return -EINVAL;
>>> +
>>> +	vram = memremap(vmw_priv->vram_start, vmw_priv->vram_size,
>>> +			MEMREMAP_WB | MEMREMAP_DEC);
>>> +	if (!vram)
>>> +		return -ENOMEM;
>>> +
>>> +	sb->map[0].vaddr = vram;
>>> +	sb->format = drm_format_info(DRM_FORMAT_RGB565);
> 
> Let me confirm whether debugfs feature works correctly. As I mentioned
> in my original patch [1], modifying this format will allow to display
> the panic screen by debugfs only one time. In your environment, can you
> trigger panic screen by debugfs multiple times?

The debugfs interface is broken by design, it's just here to help adding 
new device support to drm_panic, so not a problem if there are garbage 
after you trigger it. (it's the case on most driver anyway).

> 
>>> +	sb->width  = vmw_priv->initial_width;
>>> +	sb->height = vmw_priv->initial_height;
>>> +	sb->pitch[0] = sb->width * 2;
>>> +	return 0;
>>> +}
>>> +
>>> +void vmw_panic_flush(struct drm_plane *plane)
>>> +{
>>> +	struct vmw_private *vmw_priv = container_of(plane->dev, struct vmw_private, drm);
>>> +
>>> +	vmw_kms_write_svga(vmw_priv,
>>> +			   vmw_priv->initial_width, vmw_priv->initial_height,
>>> +			   vmw_priv->initial_width * 2, 16, 16);
> 
> vmw_kms_write_svga() calls vmw_write() which locks spin lock. Since
> these functions are called in panic handler, we should avoid them. You
> can find some idea in my original patch [1]!

Maybe another solution is to restrict the panic handler to 
VMWGFX_PCI_ID_SVGA3, that doesn't need locks in vmw_write().

I don't know if there are still a lot of hosts with VMWGFX_PCI_ID_SVGA2 
in the open, and if we want to add drm_panic support for them.

Best regards,

-- 

Jocelyn

> 
> [1] https://lore.kernel.org/all/20250919032936.2267240-1-ryasuoka@redhat.com/
> 
> Thank you
> Ryosuke
> 
>>> +}
>>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
>>> index 445471fe9be6..8e37561cd527 100644
>>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
>>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_kms.h
>>> @@ -500,6 +500,11 @@ int vmw_kms_stdu_readback(struct vmw_private *dev_priv,
>>>    int vmw_du_helper_plane_update(struct vmw_du_update_plane *update);
>>> +struct drm_scanout_buffer;
>>> +
>>> +int vmw_get_scanout_buffer(struct drm_plane *pl, struct drm_scanout_buffer *sb);
>>> +void vmw_panic_flush(struct drm_plane *plane);
>>> +
>>>    /**
>>>     * vmw_du_translate_to_crtc - Translate a rect from framebuffer to crtc
>>>     * @state: Plane state.
>>> diff --git a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
>>> index 20aab725e53a..37cb742ba1d9 100644
>>> --- a/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
>>> +++ b/drivers/gpu/drm/vmwgfx/vmwgfx_stdu.c
>>> @@ -1506,6 +1506,8 @@ drm_plane_helper_funcs vmw_stdu_primary_plane_helper_funcs = {
>>>    	.atomic_update = vmw_stdu_primary_plane_atomic_update,
>>>    	.prepare_fb = vmw_stdu_primary_plane_prepare_fb,
>>>    	.cleanup_fb = vmw_stdu_primary_plane_cleanup_fb,
>>> +	.get_scanout_buffer = vmw_get_scanout_buffer,
>>> +	.panic_flush = vmw_panic_flush,
>>>    };
>>>    static const struct drm_crtc_helper_funcs vmw_stdu_crtc_helper_funcs = {
>>
>>
> 

