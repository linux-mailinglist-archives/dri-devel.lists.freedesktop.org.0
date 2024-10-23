Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D5E49AC0FA
	for <lists+dri-devel@lfdr.de>; Wed, 23 Oct 2024 10:04:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82FD110E222;
	Wed, 23 Oct 2024 08:04:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="cm8QoREx";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7561410E788
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 08:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1729670647;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1HJeCjnMIw12TEWY04xj2y1qbuaADV67keXH+V6fBEY=;
 b=cm8QoRExGv68lufHktfTBQiVtmI9vSlm8309GBPQKfYJGoIWoTgaYtaUyncn8z2fsGK4Rp
 JmjIRf0Wj02EMqGpljCx96n5cShuct4E52G4WWj8BrqVPbjuHOsGgRIA+/OLyclBcpj2PG
 cvbspreX3ovOfWY7KZbeioD/uQ41gOQ=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-364-HK1c62MoMT2XXaIQah9x-w-1; Wed, 23 Oct 2024 04:04:06 -0400
X-MC-Unique: HK1c62MoMT2XXaIQah9x-w-1
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4316138aff6so42408705e9.1
 for <dri-devel@lists.freedesktop.org>; Wed, 23 Oct 2024 01:04:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729670645; x=1730275445;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1HJeCjnMIw12TEWY04xj2y1qbuaADV67keXH+V6fBEY=;
 b=q9fQyM0efR/ncp9hOuvsk3AvOdP0B/AFvncnzFYImgKBmjKWDCQfrH9Cj3j046sgs0
 pW5sxG8dfyp/5op8Dl3SjiK05Bg6r0TgVYfMLnNbFUNNqLRyNukB0BhxYjfJn4WqKVlc
 qTnNaMLGxUu6wsVeIo3jccoQ0Qs27LnWYahGSqQq33YQKL/Shc32vtBhhMoH/WdYt9gj
 ibHUYQhtHeUChOZkN+vmmQIXUzy7/htPLzK7U+OWxtceof99FNX4luoI0MDjV9I59OMK
 5nxQrZYzW5Rv2yEKSTtR913RLTfaVHLKyh5IQwmXJRZCSFLiXCkQLuubinybBsnFTawe
 68Bg==
X-Gm-Message-State: AOJu0YyssVBR/nuHoX6qH3nSXg969HdhmJIY14txUg5C+Ucgxy22iIb5
 WcPpus7ZCPrBJDrdVXjrXdb50bI2ncSPaDaIQAURPjvwdMAnA+hrdBqsC6y+uHUwWC1zmeOSaFO
 zL3Om64n49lhOLz2RwpS53dGHEAjAKuayHTPIs+jSfKGLAM9Yz/AG7o3GTtnJScgLsg==
X-Received: by 2002:a05:600c:1e28:b0:426:627e:37af with SMTP id
 5b1f17b1804b1-4318412fd23mr15814815e9.3.1729670644882; 
 Wed, 23 Oct 2024 01:04:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxvfVsE8Z/Bj4nM5IJVIdgM3fqMDZ+BQkr47XiNieWjM3E3mpsBv2Zmc+c3HsbEOTIR8ZDBA==
X-Received: by 2002:a05:600c:1e28:b0:426:627e:37af with SMTP id
 5b1f17b1804b1-4318412fd23mr15814545e9.3.1729670644357; 
 Wed, 23 Oct 2024 01:04:04 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:c:37e0:ced3:55bd:f454:e722?
 ([2a01:e0a:c:37e0:ced3:55bd:f454:e722])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37ee0a365e5sm8357499f8f.21.2024.10.23.01.04.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Oct 2024 01:04:03 -0700 (PDT)
Message-ID: <44141638-4d8f-4e11-9ede-51cdb51d3a28@redhat.com>
Date: Wed, 23 Oct 2024 10:04:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/5] drm/client: Remove unused drm_client_framebuffer_flush
To: Thomas Zimmermann <tzimmermann@suse.de>, linux@treblig.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, airlied@gmail.com,
 simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20241022232934.238124-1-linux@treblig.org>
 <20241022232934.238124-5-linux@treblig.org>
 <a56b486c-9341-41aa-a3ab-090f7ffd56d6@suse.de>
From: Jocelyn Falempe <jfalempe@redhat.com>
In-Reply-To: <a56b486c-9341-41aa-a3ab-090f7ffd56d6@suse.de>
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

On 23/10/2024 08:46, Thomas Zimmermann wrote:
> Hi
> 
> Am 23.10.24 um 01:29 schrieb linux@treblig.org:
>> From: "Dr. David Alan Gilbert" <linux@treblig.org>
>>
>> drm_client_framebuffer_flush() was explicitly added in 2020
>> by
>> commit c9c03e3cf072 ("drm/client: Add drm_client_framebuffer_flush()")
>> but has never been used.
>>
>> Remove it.
> 
> I had a patchset to use this helper for fbdev emulation. It just needs 
> preparation in a number of drivers.

It is used by drm_log, which is under review.
Please don't remove it.

https://patchwork.freedesktop.org/series/136789/

-- 

Jocelyn


> 
> Best regards
> Thomas
> 
>>
>> Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
>> ---
>>   drivers/gpu/drm/drm_client.c | 33 ---------------------------------
>>   include/drm/drm_client.h     |  1 -
>>   2 files changed, 34 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/drm_client.c b/drivers/gpu/drm/drm_client.c
>> index bfedcbf516db..5d10ad3c2ca5 100644
>> --- a/drivers/gpu/drm/drm_client.c
>> +++ b/drivers/gpu/drm/drm_client.c
>> @@ -552,39 +552,6 @@ void drm_client_framebuffer_delete(struct 
>> drm_client_buffer *buffer)
>>   }
>>   EXPORT_SYMBOL(drm_client_framebuffer_delete);
>> -/**
>> - * drm_client_framebuffer_flush - Manually flush client framebuffer
>> - * @buffer: DRM client buffer (can be NULL)
>> - * @rect: Damage rectangle (if NULL flushes all)
>> - *
>> - * This calls &drm_framebuffer_funcs->dirty (if present) to flush 
>> buffer changes
>> - * for drivers that need it.
>> - *
>> - * Returns:
>> - * Zero on success or negative error code on failure.
>> - */
>> -int drm_client_framebuffer_flush(struct drm_client_buffer *buffer, 
>> struct drm_rect *rect)
>> -{
>> -    if (!buffer || !buffer->fb || !buffer->fb->funcs->dirty)
>> -        return 0;
>> -
>> -    if (rect) {
>> -        struct drm_clip_rect clip = {
>> -            .x1 = rect->x1,
>> -            .y1 = rect->y1,
>> -            .x2 = rect->x2,
>> -            .y2 = rect->y2,
>> -        };
>> -
>> -        return buffer->fb->funcs->dirty(buffer->fb, buffer->client- 
>> >file,
>> -                        0, 0, &clip, 1);
>> -    }
>> -
>> -    return buffer->fb->funcs->dirty(buffer->fb, buffer->client->file,
>> -                    0, 0, NULL, 0);
>> -}
>> -EXPORT_SYMBOL(drm_client_framebuffer_flush);
>> -
>>   #ifdef CONFIG_DEBUG_FS
>>   static int drm_client_debugfs_internal_clients(struct seq_file *m, 
>> void *data)
>>   {
>> diff --git a/include/drm/drm_client.h b/include/drm/drm_client.h
>> index bc0e66f9c425..560aae47e06d 100644
>> --- a/include/drm/drm_client.h
>> +++ b/include/drm/drm_client.h
>> @@ -165,7 +165,6 @@ struct drm_client_buffer {
>>   struct drm_client_buffer *
>>   drm_client_framebuffer_create(struct drm_client_dev *client, u32 
>> width, u32 height, u32 format);
>>   void drm_client_framebuffer_delete(struct drm_client_buffer *buffer);
>> -int drm_client_framebuffer_flush(struct drm_client_buffer *buffer, 
>> struct drm_rect *rect);
>>   int drm_client_buffer_vmap_local(struct drm_client_buffer *buffer,
>>                    struct iosys_map *map_copy);
>>   void drm_client_buffer_vunmap_local(struct drm_client_buffer *buffer);
> 

