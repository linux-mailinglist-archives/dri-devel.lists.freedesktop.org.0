Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DAF93A7394
	for <lists+dri-devel@lfdr.de>; Tue, 15 Jun 2021 04:15:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 751B86E1BE;
	Tue, 15 Jun 2021 02:15:35 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com
 [IPv6:2607:f8b0:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F01E6E1BE
 for <dri-devel@lists.freedesktop.org>; Tue, 15 Jun 2021 02:15:35 +0000 (UTC)
Received: by mail-pg1-x533.google.com with SMTP id e20so10227550pgg.0
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jun 2021 19:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=bb+UZyvF103OTFB+0oPWDOXa4REu4kZb3WG5Dmt+tLs=;
 b=djhNl/bpEcNYfgOtTfUrpPCUBgvF5eX69I7/ZWGqOVvSpEWM6gcZ0URW4tIVQQnhWC
 6SVFL5enr0JvmIqakrJWdsfNkQFFp9mlZ1pgp2NWAz/R+gIdABlQkbKe9MBtNV6hO7Tz
 tny8vYeBX8DFxcRNA71AlLIKkm8+F3IEAw9JnxyX1pdZcplCm6J3r0/jJjvh/wQXWoQL
 EVQoWohGLrQRT4xc2bv3StU7lOYi71HGdQo3OkAU90H3NnGvrp9hPZv2kuEFubIHOEZL
 gi5FxCspuhjq3QTuLxAbzwQJdI1BO4n4G2OZ9wu4yDzhTcfpQXGtNi4irnwT3r8+sZHm
 qerA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=bb+UZyvF103OTFB+0oPWDOXa4REu4kZb3WG5Dmt+tLs=;
 b=s+m1WmDaXy8fcGL2/BFNBfkZP/hOJEcDkwmlz2pYaul0fdIu1F+74EL0waJlXYO6Wq
 D3oeiPEZgtaKVXRwcI+RurbkKOxK10BJk7O8XZ0K/Hd2YlHRuRNL026GBEm7Jkey1U6u
 B6A0R1mwoJhxs2/IShSYwTITrMGUWOMksCC8pKCVvjgJXhTrkug/BVZHHWsIzdFrqo29
 2zyuTjuQxEEr1yPKEKCHNvUuwwpg+ruUU398WhGxV1vKVA1NZ4mb+Xr0e3mwKmVlJJj7
 fN2VQcrP8DJIyZ5vjsS+FdkWxTQx5wkzuJ2VWwnsdhXPWgv5A7bcUw+vMHzSRVheI+Q4
 1k+A==
X-Gm-Message-State: AOAM532Pfo6L9a5pVkMY2f4XqIuZsClozHrWmasyW7T+qQfR0rmzxXP+
 6tVRgY1TwR6hPfsfo8UqWrU=
X-Google-Smtp-Source: ABdhPJzbMNp+OJh6qTIIxfA2u8gNSm96l1xJmy6ecfpAeYhxlOm0wk0kQKK7cE5allybroyVbt6jag==
X-Received: by 2002:a63:d511:: with SMTP id c17mr1255540pgg.219.1623723334490; 
 Mon, 14 Jun 2021 19:15:34 -0700 (PDT)
Received: from [192.168.1.237] ([118.200.190.93])
 by smtp.gmail.com with ESMTPSA id a9sm628494pjm.51.2021.06.14.19.15.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jun 2021 19:15:33 -0700 (PDT)
Subject: Re: [PATCH 2/2] drm: Protect drm_master pointers in drm_lease.c
To: Emil Velikov <emil.l.velikov@gmail.com>
References: <20210612125426.6451-1-desmondcheongzx@gmail.com>
 <20210612125426.6451-3-desmondcheongzx@gmail.com>
 <CACvgo51r3NK_ddQPPD9vBzkJq7A4CcYS4nawxZqqDB8FXK5gcA@mail.gmail.com>
From: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Message-ID: <7bd0d514-efc6-8118-0b28-dfa0bcf5d842@gmail.com>
Date: Tue, 15 Jun 2021 10:15:29 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CACvgo51r3NK_ddQPPD9vBzkJq7A4CcYS4nawxZqqDB8FXK5gcA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>, Dave Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, skhan@linuxfoundation.org,
 "Linux-Kernel@Vger. Kernel. Org" <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 linux-kernel-mentees@lists.linuxfoundation.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On 15/6/21 3:41 am, Emil Velikov wrote:
> On Sat, 12 Jun 2021 at 13:55, Desmond Cheong Zhi Xi
> <desmondcheongzx@gmail.com> wrote:
>>
>> This patch ensures that the device's master mutex is acquired before
>> accessing pointers to struct drm_master that are subsequently
>> dereferenced. Without the mutex, the struct drm_master may be freed
>> concurrently by another process calling drm_setmaster_ioctl(). This
>> could then lead to use-after-free errors.
>>
>> Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
>> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
>> ---
> 
> <snip>
> 
>> @@ -578,6 +594,7 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
>>          /* Hook up the fd */
>>          fd_install(fd, lessee_file);
>>
>> +       mutex_unlock(&dev->master_mutex);
> 
> I was going to suggest pushing the unlock call further up - after the
> drm_lease_create call. Although that would make the error path rather
> messy, so let's keep it as-is.
> 
> <snip>
> 
>> @@ -662,7 +684,7 @@ int drm_mode_get_lease_ioctl(struct drm_device *dev,
>>          struct drm_mode_get_lease *arg = data;
>>          __u32 __user *object_ids = (__u32 __user *) (uintptr_t) (arg->objects_ptr);
>>          __u32 count_objects = arg->count_objects;
>> -       struct drm_master *lessee = lessee_priv->master;
>> +       struct drm_master *lessee;
>>          struct idr *object_idr;
>>          int count;
>>          void *entry;
>> @@ -678,8 +700,10 @@ int drm_mode_get_lease_ioctl(struct drm_device *dev,
>>
>>          DRM_DEBUG_LEASE("get lease for %d\n", lessee->lessee_id);
>>
>> +       mutex_lock(&dev->master_mutex);
> 
> As-is we're dereferencing an uninitialised pointer in DRM_DEBUG_LEASE.
> Move the lock and assignment before the DRM_DEBUG_LEASE, just like
> you've done in the list ioctl.
> 
> With this fix, the patch is;
> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
> 
> -Emil
> 


Good catch, thanks for the feedback Emil. I'll fix this up in a v2 patchset.

Best wishes,
Desmond
