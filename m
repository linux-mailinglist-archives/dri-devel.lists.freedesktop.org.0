Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50BB93A6F4D
	for <lists+dri-devel@lfdr.de>; Mon, 14 Jun 2021 21:41:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 514BB897AC;
	Mon, 14 Jun 2021 19:41:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com
 [IPv6:2607:f8b0:4864:20::e2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86FB7897AC
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jun 2021 19:41:38 +0000 (UTC)
Received: by mail-vs1-xe2d.google.com with SMTP id f21so8468587vsl.4
 for <dri-devel@lists.freedesktop.org>; Mon, 14 Jun 2021 12:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YSHdbBdLxbYZlWemrHLO8rn/WxjGLmePBCR/uXkKydQ=;
 b=gXbiB53zsC9A0e6yeqxynJ8K2CU29DzKA4rzf1CmwQvBwYBn+qnXX00hnKL5om0qVR
 cZYQavTAVYQMj1TX1A03OZ0h8xN0QWjRi+Ot6oIO5CtnxrYernwAO+aRzRp3yH64G1rr
 ayU0qODqGk8qCobFP6cO3js4NbtPKGRSEHEZha27t/AxNpXM90jHZFHYCV199wbhQJwc
 8y1yo+s1VL5UTlxtX51mcg1lHVG49NvzDvT7V0wTFv/iEdQe8jPd4hqxvYzOUN702JC8
 /3JI292H5UcLiwYfN8HGcIP4pH2klkqR0/tKzMJjkhtUPZFpAe8tFKz3PscRB4LnvXz6
 lufg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YSHdbBdLxbYZlWemrHLO8rn/WxjGLmePBCR/uXkKydQ=;
 b=MFI9mimRhHDay8MeJlmNAsdHwAFjBCeHZzZ6oXEne2/0vuPNBz65DfFd/QFmi1gyd2
 J9Cfk8uneqL1DpIc9pmZ/c4Usjslbwx6MbEFW9bdb+envoV/P9PKVuqbFD8VffVLqfyG
 5qJbWajdNU8fW2cIxsOQ/Q3dBDd5YXN0Oar+cyfPKV4R09azLVm9vohlfesWeUmfw7Ka
 WwJOfvSYaG9PFmSFOP1OhbtPAeka/tFCvjeuDgE6CYP2DQTzBXkt5qFpFsOG0n00rCkh
 e4l3aY+wYUSzZ7MjSpEvD6fuzXa780C3EXDPVugdNpsL49HkKf2WjHFhj8CqEZ4guCL4
 IH4Q==
X-Gm-Message-State: AOAM531yX3YLRwak7jMOMJ2uvBFBP5TkNTvsXvn35C8YsmYkVhq5V0CT
 zsekBC3MONZzK6dqs4cA7QE1Fp5ZFOvqxZ2NuFw=
X-Google-Smtp-Source: ABdhPJytersYuO9TTLsR8N3gF2P4x9FpF+WT26vt3Abg72qCHav0Z8Q32sRLjm0DV7rnqHjAmyOKCwgXPuG7IinDHjY=
X-Received: by 2002:a05:6102:2159:: with SMTP id
 h25mr1281799vsg.19.1623699697567; 
 Mon, 14 Jun 2021 12:41:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210612125426.6451-1-desmondcheongzx@gmail.com>
 <20210612125426.6451-3-desmondcheongzx@gmail.com>
In-Reply-To: <20210612125426.6451-3-desmondcheongzx@gmail.com>
From: Emil Velikov <emil.l.velikov@gmail.com>
Date: Mon, 14 Jun 2021 20:41:26 +0100
Message-ID: <CACvgo51r3NK_ddQPPD9vBzkJq7A4CcYS4nawxZqqDB8FXK5gcA@mail.gmail.com>
Subject: Re: [PATCH 2/2] drm: Protect drm_master pointers in drm_lease.c
To: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
Content-Type: text/plain; charset="UTF-8"
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

On Sat, 12 Jun 2021 at 13:55, Desmond Cheong Zhi Xi
<desmondcheongzx@gmail.com> wrote:
>
> This patch ensures that the device's master mutex is acquired before
> accessing pointers to struct drm_master that are subsequently
> dereferenced. Without the mutex, the struct drm_master may be freed
> concurrently by another process calling drm_setmaster_ioctl(). This
> could then lead to use-after-free errors.
>
> Reported-by: Daniel Vetter <daniel.vetter@ffwll.ch>
> Signed-off-by: Desmond Cheong Zhi Xi <desmondcheongzx@gmail.com>
> ---

<snip>

> @@ -578,6 +594,7 @@ int drm_mode_create_lease_ioctl(struct drm_device *dev,
>         /* Hook up the fd */
>         fd_install(fd, lessee_file);
>
> +       mutex_unlock(&dev->master_mutex);

I was going to suggest pushing the unlock call further up - after the
drm_lease_create call. Although that would make the error path rather
messy, so let's keep it as-is.

<snip>

> @@ -662,7 +684,7 @@ int drm_mode_get_lease_ioctl(struct drm_device *dev,
>         struct drm_mode_get_lease *arg = data;
>         __u32 __user *object_ids = (__u32 __user *) (uintptr_t) (arg->objects_ptr);
>         __u32 count_objects = arg->count_objects;
> -       struct drm_master *lessee = lessee_priv->master;
> +       struct drm_master *lessee;
>         struct idr *object_idr;
>         int count;
>         void *entry;
> @@ -678,8 +700,10 @@ int drm_mode_get_lease_ioctl(struct drm_device *dev,
>
>         DRM_DEBUG_LEASE("get lease for %d\n", lessee->lessee_id);
>
> +       mutex_lock(&dev->master_mutex);

As-is we're dereferencing an uninitialised pointer in DRM_DEBUG_LEASE.
Move the lock and assignment before the DRM_DEBUG_LEASE, just like
you've done in the list ioctl.

With this fix, the patch is;
Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>

-Emil
