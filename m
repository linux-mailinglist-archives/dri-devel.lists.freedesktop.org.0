Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D9E58A6B76
	for <lists+dri-devel@lfdr.de>; Tue, 16 Apr 2024 14:52:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BE3210E360;
	Tue, 16 Apr 2024 12:52:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="ZTaqsBgH";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9E0410E360
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 12:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1713271943;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=zxlFUfTeSgKCsCdKtJ0S6d32bgkTGD79E4bwSfj5zbI=;
 b=ZTaqsBgH7QS/hcD+JXi9Q48qC10fLorExSc9RUooKTrqliKV5eYIEL/eJTQm5Hg7+gRDtc
 6iqk1FkgRzAol6o36v3bn6LH/vb/XP21a/x8/JU4uucMfPrZkg34uqML8fvKOMpYhTUitv
 aawBRRTdTffwcfA/trgbR3D0Lg0sOqQ=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-687-Fg257q1qPuei5h2T49mG-w-1; Tue, 16 Apr 2024 08:52:22 -0400
X-MC-Unique: Fg257q1qPuei5h2T49mG-w-1
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-41681022d82so17126335e9.1
 for <dri-devel@lists.freedesktop.org>; Tue, 16 Apr 2024 05:52:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713271941; x=1713876741;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=zxlFUfTeSgKCsCdKtJ0S6d32bgkTGD79E4bwSfj5zbI=;
 b=fD6yOsDqXYdsCtfV4X8zbKyuQu2zAqagEP9FRmSn3DHYirvIylP3t6sxTbnXPu9CBr
 M4UYpdu5lTB7whPlrAUvUPF0vTrx2oet8KfhIfBM04ihtgk06CzlKEi2ieyhc+SW+SCV
 8doaf3mGIhMvQ54MU/sGZnGP4zi429wdmxIKvIk0hCnBayWh28rcW5Y+KZlZBUMlrGz0
 rG0PrLCAyzYSfF2WYtVwlbewvjWfk695bz60vL25h251M+z68RL/7gfx4LJdgWtJAxPL
 vkUrVR3GJ83toCPde53KwWLAGenzduWDjYVjlCmXnNO9QDQ8xwThagJcWwR7r5Lasi+4
 wWbQ==
X-Gm-Message-State: AOJu0YxIOZBOlC0KrzRzXzrHESYVkhJXId36h2x1jKNfMKMTb6FFvBVb
 w0XeaEhZRnulIaA2nZxRuZ63CJ25qHX9QUQv0cRadtyoWZxOkz/MGn5uMnSLG65Z01Lni1C1iH1
 y9ci8NaUpNHLU/bJ1YplrLjhgAtvfh7qu9od2ujsDspJGm2FT7tn5BCF5muDDzNAS7w==
X-Received: by 2002:a05:600c:4f49:b0:417:f526:6cc3 with SMTP id
 m9-20020a05600c4f4900b00417f5266cc3mr8922265wmq.20.1713271941002; 
 Tue, 16 Apr 2024 05:52:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH25PNtyLwQbkK6cR9rp8WCEMDH38TwHqAQN8DUaQuPcNKQqbZiGlv1wsD/OJ9PLvJxgvGQsA==
X-Received: by 2002:a05:600c:4f49:b0:417:f526:6cc3 with SMTP id
 m9-20020a05600c4f4900b00417f5266cc3mr8922247wmq.20.1713271940487; 
 Tue, 16 Apr 2024 05:52:20 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 f18-20020adfe912000000b00343d6c7240fsm14804520wrm.35.2024.04.16.05.52.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 05:52:20 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, deller@gmx.de,
 airlied@gmail.com, daniel@ffwll.ch
Cc: dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Subject: Re: [PATCH v2 21/43] drm/fbdev-dma: Implement damage handling and
 deferred I/O
In-Reply-To: <18d461b6-8086-42f5-b629-b673daa04bd7@suse.de>
References: <20240410130557.31572-1-tzimmermann@suse.de>
 <20240410130557.31572-22-tzimmermann@suse.de>
 <871q757b73.fsf@minerva.mail-host-address-is-not-set>
 <18d461b6-8086-42f5-b629-b673daa04bd7@suse.de>
Date: Tue, 16 Apr 2024 14:52:19 +0200
Message-ID: <87zftt4gho.fsf@minerva.mail-host-address-is-not-set>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

> Hi
>
> Am 16.04.24 um 14:18 schrieb Javier Martinez Canillas:
>> Thomas Zimmermann <tzimmermann@suse.de> writes:
>>

[...]

>>> +static int drm_fbdev_dma_fb_mmap(struct fb_info *info, struct vm_area_struct *vma)
>>> +{
>>> +	struct drm_fb_helper *fb_helper = info->par;
>>> +	struct drm_framebuffer *fb = fb_helper->fb;
>>> +	struct drm_gem_dma_object *dma = drm_fb_dma_get_gem_obj(fb, 0);
>>> +
>>> +	if (!dma->map_noncoherent)
>>> +		vma->vm_page_prot = pgprot_writecombine(vma->vm_page_prot);
>> I noticed that some drivers do:
>>
>>                   vma->vm_page_prot = pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
>>
>> I see that vm_get_page_prot() is a per-architecture function, but I don't
>> know about the implications of getting the pgprot_t from the vma->vm_flags
>> set or just using the current vma->vm_page_prot value...
>
> That's in interesting observation. The code in the patch adds a WC flag 
> to the existing vm_page_prot. The code in your example first creates a 
> new vm_page_prot from the vm_flags field. Fbdev drivers generally use 
> the former approach. So where does the original vm_page_prot value come 
> from? (I think that's also the question behind your comment.)
>

Yes, also if the vm_flags were set (and where) for this VMA.

> I've looked through the kernel's mmap code from the syscall [1] to the 
> place where it invokes the mmap callback. [2] Shortly before doing so, 
> mmap_region() set's vm_page_prot from vm_flags like in your example. [3] 
> I would assume there's no reason for drivers to call vm_get_page_prot() 
> by themselves. DRM drivers specially seem to have the habit of doing so.
>

Got it, makes sense. Thanks for taking a look.

> Best regards
> Thomas
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

