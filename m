Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B31A7EB460
	for <lists+dri-devel@lfdr.de>; Tue, 14 Nov 2023 17:05:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC7D510E462;
	Tue, 14 Nov 2023 16:05:19 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A27010E462
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 16:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699977916;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=j565Cy9XLw29CBi7bfBFtO6psEQo+EfQSVIEvDNtFvA=;
 b=Oc9C61MDDXe9zVu9Bg0J4CD9IgxVO2MJ4DXRy9C2h/Q4OdXGMIEraC7nzS9Ky99Qrqlhel
 hZAsfn4aPaNSKl5ZJbpbXChrGG5rtfKiZb3qQyHl0xsllvQlII0Simg/4sS/eNeL4pk08R
 ReEZRUCgZN85eg0HaiRKZllSiOSB6Rk=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-140-bSm_Kw5RO5uNYPJKLd9Pbw-1; Tue, 14 Nov 2023 11:05:15 -0500
X-MC-Unique: bSm_Kw5RO5uNYPJKLd9Pbw-1
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-67166648d77so73549816d6.3
 for <dri-devel@lists.freedesktop.org>; Tue, 14 Nov 2023 08:05:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699977915; x=1700582715;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=j565Cy9XLw29CBi7bfBFtO6psEQo+EfQSVIEvDNtFvA=;
 b=a6PeYHk+vPLSjSGgOlxvsunVUG6odJJeVweyBmWqVrE97oztMK86jJSyJZsns8gb0X
 ZnWakUzzJIX1Zl88ggAqmnJYmsk7mL6wyXvkeM3X9ZF4c3r6hgKxLZIaApd3fJTHmMKx
 Cku7IbbKEbVWlk5yCCYSgy1uJGetKCD9561N5y/Yuah/jITYoxG6q34t4K02qrJsrFzk
 llKK7nnB94dwCddCdxcmfxnUNNmw4NtnR1X3lrS2VAhdPzbboGCaNLZTm3owaSM27miM
 eACVxnvAXw3yeCt1nT0+Xes1YGu2qMQLm1Av1TUanAHzV4hQH9+P4fYkYD0fVmMxdaAi
 JxAg==
X-Gm-Message-State: AOJu0YzdYPuw46icGPNdYy77KUMRny2HVVG1UQGDdakV7quWg2huC4a+
 SUF60FV0UUVfH+JcvMyOj6uZguBsh8oAtO45h60B2ye6We2h/gMZ0dEtJdMxldwUOLbUou446jk
 fD+UcK4icmh3/tU3SFgdL0N1/42Cw
X-Received: by 2002:a0c:f74a:0:b0:66d:37be:47d2 with SMTP id
 e10-20020a0cf74a000000b0066d37be47d2mr2515138qvo.37.1699977915004; 
 Tue, 14 Nov 2023 08:05:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFG72Y2KWMfjoNvHFLMOeHbUicAjGXWzGnJiPCUY7t9jfN0rIz/VFTXo03rJ2HlwwIWkmmcoA==
X-Received: by 2002:a0c:f74a:0:b0:66d:37be:47d2 with SMTP id
 e10-20020a0cf74a000000b0066d37be47d2mr2515103qvo.37.1699977914680; 
 Tue, 14 Nov 2023 08:05:14 -0800 (PST)
Received: from localhost ([195.166.127.210]) by smtp.gmail.com with ESMTPSA id
 h13-20020a0ceecd000000b00671b009412asm2967374qvs.141.2023.11.14.08.05.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Nov 2023 08:05:14 -0800 (PST)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/6] drm: Add
 drm_atomic_helper_buffer_damage_{iter_init, merged}() helpers
In-Reply-To: <6e663e37-b735-47f7-a841-fa0f93fdddaf@suse.de>
References: <20231109172449.1599262-1-javierm@redhat.com>
 <20231109172449.1599262-3-javierm@redhat.com>
 <6e663e37-b735-47f7-a841-fa0f93fdddaf@suse.de>
Date: Tue, 14 Nov 2023 17:05:12 +0100
Message-ID: <87zfzg5nif.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain
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
Cc: nerdopolis <bluescreen_avenger@verizon.net>,
 Pekka Paalanen <pekka.paalanen@collabora.com>, dri-devel@lists.freedesktop.org,
 Sima Vetter <daniel.vetter@ffwll.ch>, Bilal Elmoussaoui <belmouss@redhat.com>,
 Maxime Ripard <mripard@kernel.org>, Gerd Hoffmann <kraxel@redhat.com>,
 stable@vger.kernel.org, Erico Nunes <nunes.erico@gmail.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Hi
>
> Am 09.11.23 um 18:24 schrieb Javier Martinez Canillas:

[...]

>>   	struct drm_rect src;
>>   	memset(iter, 0, sizeof(*iter));
>> @@ -223,7 +224,8 @@ __drm_atomic_helper_damage_iter_init(struct drm_atomic_helper_damage_iter *iter,
>>   	iter->plane_src.x2 = (src.x2 >> 16) + !!(src.x2 & 0xFFFF);
>>   	iter->plane_src.y2 = (src.y2 >> 16) + !!(src.y2 & 0xFFFF);
>>   
>> -	if (!iter->clips || !drm_rect_equals(&state->src, &old_state->src)) {
>> +	if (!iter->clips || !drm_rect_equals(&state->src, &old_state->src) ||
>> +	    (buffer_damage && old_state->fb != state->fb)) {
>
> I'd assume that this change effectivly disables damage handling. AFAICT 
> user space often does a page flip with a new framebuffer plus damage 
> data. Now, with each change of the framebuffer we ignore the damage 
> information. It's not a blocker as that's the behavior before 6.4, but 
> we should be aware of it.
>

Yes, which is the goal of this patch since page flip with a new framebuffer
attached to a plane plus damage information can't be supported by drivers
that do per-buffer uploads.

This was causing some weston and wlroots to have flickering artifacts, due
the framebuffers being changed since the last plane update.

For now it was decided with Sima, Simon and Pekka that is the best we can
do and the reason why I add a TODO in patch #6.

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

