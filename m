Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2B97879746
	for <lists+dri-devel@lfdr.de>; Tue, 12 Mar 2024 16:16:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8ADC10F368;
	Tue, 12 Mar 2024 15:16:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux.dev header.i=@linux.dev header.b="MDeZxBAT";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com
 [91.218.175.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E98810F368
 for <dri-devel@lists.freedesktop.org>; Tue, 12 Mar 2024 15:16:45 +0000 (UTC)
Message-ID: <1eda30fb-1ede-4941-9169-fad667325fe0@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1710256602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/HzmDf8pf1lrEr/GYEiVkEs9j9n8mqLECpV6oLJ/Els=;
 b=MDeZxBATCGv0TB1qQ+3lS/Np6AiS1LX8p7b8kudqF5pQ0Aq5wFLPEsKAQJJJV53omO5IKv
 8GkFdcj19RO7cQPGVk+CtjubWx1aWeVzQEHi9iNtICzWj2aPX3M97mhrCkmusHY5aTvjFS
 RYFIMJF3TI1SqP/6v6gPasDdB+EfHAQ=
Date: Tue, 12 Mar 2024 23:16:12 +0800
MIME-Version: 1.0
Subject: Re: [PATCH v9 0/9] drm/panic: Add a drm panic handler
Content-Language: en-US
To: Jocelyn Falempe <jfalempe@redhat.com>, dri-devel@lists.freedesktop.org,
 tzimmermann@suse.de, airlied@redhat.com, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, daniel@ffwll.ch, javierm@redhat.com,
 bluescreen_avenger@verizon.net, noralf@tronnes.org
Cc: gpiccoli@igalia.com
References: <20240307091936.576689-1-jfalempe@redhat.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Sui Jingfeng <sui.jingfeng@linux.dev>
In-Reply-To: <20240307091936.576689-1-jfalempe@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
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

Hi,


On 2024/3/7 17:14, Jocelyn Falempe wrote:
> This introduces a new drm panic handler, which displays a message when a panic occurs.
> So when fbcon is disabled, you can still see a kernel panic.
>
> This is one of the missing feature, when disabling VT/fbcon in the kernel:
> https://www.reddit.com/r/linux/comments/10eccv9/config_vtn_in_2023/
> Fbcon can be replaced by a userspace kms console, but the panic screen must be done in the kernel.
>
> This is a proof of concept, and works with simpledrm, mgag200, ast, and imx.
>
> To test it, make sure you're using one of the supported driver, and trigger a panic:
> echo c > /proc/sysrq-trigger
>
> or you can enable CONFIG_DRM_PANIC_DEBUG and echo 1 > /sys/kernel/debug/dri/0/drm_panic_plane_0

Yes, the whole series works for me! I have tested with drm/loongson,
Are you willing to add a implement for drm/loongson driver?
If you do please add the fallowing code snippet info drm/loongson/lsdc_plane.c.
Thanks you.


static int
lsdc_primary_plane_get_scanout_buffer(struct drm_plane *plane,
                       struct drm_scanout_buffer *scanout)
{
     struct drm_framebuffer *fb;

     if (!plane->state || !plane->state->fb)
         return -ENODEV;

     fb = plane->state->fb;
     if (fb->modifier != DRM_FORMAT_MOD_LINEAR)
         return -ENODEV;

     scanout->format = fb->format;
     scanout->width = fb->width;
     scanout->height = fb->height;
     scanout->pitch = fb->pitches[0];

     return drm_gem_vmap_unlocked(fb->obj[0], &scanout->map);
}

hook this lsdc_primary_plane_get_scanout_buffer() up to the .get_scanout_buffer
member of lsdc_primary_helper_funcs, and include the #include <drm/drm_panic.h>
Thanks you in advance!

