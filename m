Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D93798EAD1
	for <lists+dri-devel@lfdr.de>; Thu,  3 Oct 2024 09:52:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3E7210E7C7;
	Thu,  3 Oct 2024 07:52:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="MpKnBMOy";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61A2110E7C6
 for <dri-devel@lists.freedesktop.org>; Thu,  3 Oct 2024 07:52:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1727941958;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=HJfwnHn7BDJw4HuXXuCRA3kEwkIFFV2gIXwdDHqj144=;
 b=MpKnBMOyS0oFZpl+HSuXr1OuqKLuTAGe30VGGOALkYeXr8667DQP4MAC+fLi9zc962d5bV
 502xrJKYYcYyrbAq9G3nmECGntTYQBK2J7FQ8tzSUu/0Rvndl/ZSV8PtuSjx0b4di6gdF+
 sGJTtkmoRaGcDVMk24kRsUmFy6t4LZc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-301-FjkaB6l3PKGuO5VB8sFjzg-1; Thu, 03 Oct 2024 03:52:37 -0400
X-MC-Unique: FjkaB6l3PKGuO5VB8sFjzg-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-42cb808e9fcso3411505e9.0
 for <dri-devel@lists.freedesktop.org>; Thu, 03 Oct 2024 00:52:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727941955; x=1728546755;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HJfwnHn7BDJw4HuXXuCRA3kEwkIFFV2gIXwdDHqj144=;
 b=Y87S6CGBleBOQ3WJUnpJmnUQV02BCad+jFYiXJtklwJA1cGvi5Ffk3K+7d/cRj7csy
 W2wgdYzHAMZcEUA++OmSr8HcW/WUrG36Fzufro6jZ4bRfJQnDuu0ywXkba+bvvBAqbAt
 UjNinzO4PMhJHWs7Nf+fNE7D/53t0HZVC1BqaTJctTFBchVmQzKVDvshq+fIR62XyxFL
 kD3rFDk1QFqkrm9lv6trFTYjmpMCSQyDpBfgBLYeWx8SOhxjg4bbnTpe8AlpeXkDFdJL
 WqcgPlbbRgfSxPSvUV06jPfGjBwWBbAy53aIGcgBUNShMFp/NswaOvXYgm/bmCLS6l/D
 VapQ==
X-Gm-Message-State: AOJu0YztiW6Wx6/pFlMzCvDobqY8jvULkxqABiZTTvF9XGm1POoTASl+
 xiMTQo2HARVHjj5duye70FEhpeIFprX6mQyJ9vwEAAnZ1tH70HpBjuPOu/El7UdLqlmBt/+cA1P
 IuDIuOR11gWxlzMuiNLjdJJ32KtnCPTX5C8HJuDmU0dCaEVsEdKjLBsAQ5kAzjeyrhBiEH7tfnc
 wEz8do/5OZsFwR57A9UizqrmOCAohMkyfSWs6euW+lPs3xDz+SsQ==
X-Received: by 2002:a05:600c:190b:b0:429:a05:32fb with SMTP id
 5b1f17b1804b1-42f777bf87amr39204675e9.10.1727941955505; 
 Thu, 03 Oct 2024 00:52:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZKtYJLosz7WRTTSfFhBiKZb8NmKOPvPyIHYGUEh7DlJGREXhGpIhyN6dxZazYVvI+igPEIQ==
X-Received: by 2002:a05:600c:190b:b0:429:a05:32fb with SMTP id
 5b1f17b1804b1-42f777bf87amr39204505e9.10.1727941954960; 
 Thu, 03 Oct 2024 00:52:34 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-42f802a0195sm8736755e9.38.2024.10.03.00.52.34
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 03 Oct 2024 00:52:34 -0700 (PDT)
Message-ID: <fafc63f2-fd81-4ced-8b98-3f7ce9357500@redhat.com>
Date: Thu, 3 Oct 2024 09:52:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 1/1] drm/meson: Support drm_panic
To: dri-devel@lists.freedesktop.org
References: <20241001210403.43535-2-ziyao@disroot.org>
 <20241001210403.43535-3-ziyao@disroot.org>
 <28bd30a6-127d-48f0-8e32-703ebd8f69b6@linaro.org>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <28bd30a6-127d-48f0-8e32-703ebd8f69b6@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US, fr
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 02/10/2024 09:59, Neil Armstrong wrote:
> Hi !
> 
> On 01/10/2024 23:04, Yao Zi wrote:
>> This patch implements drm_plane_helper_funcs.get_scanout_buffer for
>> primary plane, enabling meson-drm to work with drm_panic.
>>
>> This implementation tries to use current framebuffer as scanout buffer.
>> In case of AFBC enabled, we disable the decoder path and adjust OSD1
>> parameters in get_scanout_buffer to make the buffer linear.
>>
>> Tested on TTY and Wayland session (Sway).
> 
> Thanks for enabling this!
> 
>>
>> Signed-off-by: Yao Zi <ziyao@disroot.org>
>> ---
>>   drivers/gpu/drm/meson/meson_plane.c | 47 +++++++++++++++++++++++++++--
>>   1 file changed, 44 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/meson/meson_plane.c b/drivers/gpu/drm/ 
>> meson/meson_plane.c
>> index b43ac61201f3..b2def784c00d 100644
>> --- a/drivers/gpu/drm/meson/meson_plane.c
>> +++ b/drivers/gpu/drm/meson/meson_plane.c
>> @@ -20,6 +20,8 @@
>>   #include <drm/drm_framebuffer.h>
>>   #include <drm/drm_gem_atomic_helper.h>
>>   #include <drm/drm_gem_dma_helper.h>
>> +#include <drm/drm_gem_framebuffer_helper.h>
>> +#include <drm/drm_panic.h>
>>   #include "meson_plane.h"
>>   #include "meson_registers.h"
>> @@ -419,10 +421,49 @@ static void meson_plane_atomic_disable(struct 
>> drm_plane *plane,
>>       priv->viu.osd1_enabled = false;
>>   }
>> +static int meson_plane_get_scanout_buffer(struct drm_plane *plane,
>> +                      struct drm_scanout_buffer *sb)
>> +{
>> +    struct meson_plane *meson_plane = to_meson_plane(plane);
>> +    struct meson_drm *priv = meson_plane->priv;
>> +    struct drm_framebuffer *fb;
>> +
>> +    if (!meson_plane->enabled)
>> +        return -ENODEV;
>> +
>> +    if (priv->viu.osd1_afbcd) {
>> +        if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXM)) {
> 
> This should be meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)
> 
> You should call:
> 
>              if (priv->afbcd.ops) {
>                  priv->afbcd.ops->reset(priv);
>                  priv->afbcd.ops->disable(priv);
>              }
> 
>> +            writel_relaxed(0, priv->io_base +
>> +                      _REG(VIU_OSD1_BLK1_CFG_W4));
>> +            writel_relaxed(0, priv->io_base +
>> +                      _REG(VIU_OSD1_BLK2_CFG_W4));
>> +            writel_bits_relaxed(OSD_ENDIANNESS_LE, OSD_ENDIANNESS_LE,
>> +                        priv->io_base +
>> +                        _REG(VIU_OSD1_BLK0_CFG_W0));
> 
> This won't work, drop it, the canvas isn't correctly configured, you 
> should instead call:
>              meson_canvas_config(priv->canvas, priv->canvas_id_osd1,
>                          priv->viu.osd1_addr,
>                          priv->viu.osd1_stride,
>                          priv->viu.osd1_height,
>                          MESON_CANVAS_WRAP_NONE,
>                          MESON_CANVAS_BLKMODE_LINEAR, 0);

The problem is meson_canvas_config() takes a spin_lock, which can block 
forever in a panic handler.
So you can rewrite a version without lock.
Considering the addr, stride, and height don't change in a panic, it can 
probably be simplified for this case.

Also this will be the last image to be drawn, and the last driver code 
to be executed before a reboot, so it's ok if it's a bit dirty, and if 
the software state is not up-to-date with the hardware state.

> 
>> +            meson_viu_g12a_disable_osd1_afbc(priv);
>> +        } else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {
> 
> And here meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXM)
> 
>> +            writel_bits_relaxed(OSD_DPATH_MALI_AFBCD, 0,
>> +                        priv->io_base +
>> +                        _REG(VIU_OSD1_CTRL_STAT2));
> 
> Ok, you should also call meson_canvas_config()
> 
> You should call:
> 
>              if (priv->afbcd.ops) {
>                  priv->afbcd.ops->reset(priv);
>                  priv->afbcd.ops->disable(priv);
>              }
> 
>> +            meson_viu_gxm_disable_osd1_afbc(priv);
>> +        }
>> +    }
> 
> I thing the code should look like:
> 
> if (priv->viu.osd1_afbcd) {
>      meson_canvas_config(priv->canvas, priv->canvas_id_osd1,
>                  priv->viu.osd1_addr,
>                  priv->viu.osd1_stride,
>                  priv->viu.osd1_height,
>                  MESON_CANVAS_WRAP_NONE,
>                  MESON_CANVAS_BLKMODE_LINEAR, 0);
> 
>      if (priv->afbcd.ops) {
>          priv->afbcd.ops->reset(priv);
>          priv->afbcd.ops->disable(priv);
>      }
> 
>      if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_G12A)) {
>          writel_bits_relaxed(OSD_ENDIANNESS_LE, OSD_ENDIANNESS_LE,
>                      priv->io_base +
>                      _REG(VIU_OSD1_BLK0_CFG_W0));
>          meson_viu_g12a_disable_osd1_afbc(priv);
>      } else if (meson_vpu_is_compatible(priv, VPU_COMPATIBLE_GXM)) {
>          writel_bits_relaxed(OSD_DPATH_MALI_AFBCD, 0,
>                      priv->io_base +
>                      _REG(VIU_OSD1_CTRL_STAT2));
>          meson_viu_gxm_disable_osd1_afbc(priv);
>      }
> }
> 
> AFBC is quite hard to test since it requires DRM_FORMAT_XBGR8888, but
> I think sway should perhaps support it, Mesa should also support AFBC.
> 
> At some point I made some memory dumps of AFBC buffers, perhaps they could
> be useful here.
> 
> Another way would be to simply ignore the AFBC case, and bail out since
> it would be a very rare case.

panic handler is a best effort mode, so if it's too complex to support 
AFBC, and it's not very widespread, then it's ok to bail out in this case.
> 
>> +
>> +    fb = plane->state->fb;
>> +    sb->format    = fb->format;
>> +    sb->width    = fb->width;
>> +    sb->height    = fb->height;
>> +    sb->pitch[0]    = fb->pitches[0];
>> +    drm_gem_fb_vmap(fb, sb->map, NULL);
>> +
>> +    return 0;
>> +}
>> +
>>   static const struct drm_plane_helper_funcs meson_plane_helper_funcs = {
>> -    .atomic_check    = meson_plane_atomic_check,
>> -    .atomic_disable    = meson_plane_atomic_disable,
>> -    .atomic_update    = meson_plane_atomic_update,
>> +    .atomic_check        = meson_plane_atomic_check,
>> +    .atomic_disable        = meson_plane_atomic_disable,
>> +    .atomic_update        = meson_plane_atomic_update,
>> +    .get_scanout_buffer    = meson_plane_get_scanout_buffer,
>>   };
>>   static bool meson_plane_format_mod_supported(struct drm_plane *plane,
> 
> Thanks,
> Neil
> 

Best regards,

-- 

Jocelyn

