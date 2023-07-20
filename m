Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1599075AC37
	for <lists+dri-devel@lfdr.de>; Thu, 20 Jul 2023 12:42:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14BF410E5A3;
	Thu, 20 Jul 2023 10:42:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0502610E5A3
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 10:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689849746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=s8/QNK9aMUaZdF5PbcawFqcpmmy8WkA3CGA4nPhCcCE=;
 b=HYLk1YOpmNJVWmugdqAIJcWt3j91RAZ0vKAdN+JAcJNlPAm/3mUuz5Ut36MwntmeUQmAiY
 gprpPTKb5WSyOot80lklzfVGf6cQMh0+2k62QTEDskYvDIt+rwZofjQHu2zpG1lkxd5HXP
 cZOWfNHOBxRHBz9bOB9/ka/kTumDt5A=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-596-INR17BgWP0SrtW1HM_6yzw-1; Thu, 20 Jul 2023 06:42:24 -0400
X-MC-Unique: INR17BgWP0SrtW1HM_6yzw-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-315a03cae87so814726f8f.0
 for <dri-devel@lists.freedesktop.org>; Thu, 20 Jul 2023 03:42:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689849743; x=1690454543;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=s8/QNK9aMUaZdF5PbcawFqcpmmy8WkA3CGA4nPhCcCE=;
 b=IhFqh87XsHf9tmFgecnt9jFTnDeUiJR3SKJruj8L7WKb4QfSJzf3obW/DZsTDKpixg
 dh9guFLj/0L4n6phDkafHhzRbMyTxrVUjWN5zV8vhtyhKooS4wsIOXASvswudkBA5Em7
 WJFOc4AoNJ05Qsr3H123o5LuGd5sHUpzffdBQcBym/x+IY1/AJOKdNrQLHlsM6MId1Zj
 E7ef7CgukVsKDzB89BCn1MfzSDXklBbqRvoVhWYD0hFB60caIv3cZ15GOHAwu2mhafFB
 qYtSWJfZy7HRygbs2vRfTBVyCrPCaxC717C2aHxYZgC4aNe5b6cxMuPxf/qSl3KTsYBy
 T/pA==
X-Gm-Message-State: ABy/qLY4itsvVz4VLQdtB9g6WbcJ1X/LUj5CyLuOgehfxj9KrKj6X0OG
 49slRQXe1pTL3GNZBlaP0f4ejuwt6khrwrG9sQ4nmNRPVx+/i7xaIUx3ryelgIoP8DwtUPZv+1x
 cUYnXze8S1O0bJ7bXffwb6SMD+bPB
X-Received: by 2002:a5d:684b:0:b0:314:3e96:bd7e with SMTP id
 o11-20020a5d684b000000b003143e96bd7emr2366483wrw.4.1689849743445; 
 Thu, 20 Jul 2023 03:42:23 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGMNc4DgpuEF386zoNSiKXYMeDCfdF3dk3DGXK5Uhi37HIkp4KWrrVHNkylycNEbWdq0OXybA==
X-Received: by 2002:a5d:684b:0:b0:314:3e96:bd7e with SMTP id
 o11-20020a5d684b000000b003143e96bd7emr2366467wrw.4.1689849743156; 
 Thu, 20 Jul 2023 03:42:23 -0700 (PDT)
Received: from localhost ([91.126.32.244]) by smtp.gmail.com with ESMTPSA id
 h10-20020a5d6e0a000000b003141e9e2f81sm987499wrz.4.2023.07.20.03.42.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Jul 2023 03:42:22 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@redhat.com>
Subject: Re: [PATCH v3] drm/ssd130x: Fix an oops when attempting to update a
 disabled plane
In-Reply-To: <c5khbm4v2ynjgcfhin2htixkyuycfydr6rie5irnyu6gytxg6q@4ghg4ufjgnfx>
References: <20230717163027.480918-1-javierm@redhat.com>
 <c5khbm4v2ynjgcfhin2htixkyuycfydr6rie5irnyu6gytxg6q@4ghg4ufjgnfx>
Date: Thu, 20 Jul 2023 12:42:21 +0200
Message-ID: <87pm4mj242.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@ffwll.ch>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Geert Uytterhoeven <geert@linux-m68k.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Maxime Ripard <mripard@redhat.com> writes:

Hello Maxime,

Thanks a lot for your feedback.

> Hi,
>
> On Mon, Jul 17, 2023 at 06:30:22PM +0200, Javier Martinez Canillas wrote:
>> Geert reports that the following NULL pointer dereference happens for him
>> after commit 49d7d581ceaf ("drm/ssd130x: Don't allocate buffers on each
>> plane update"):
>> 
>>     [drm] Initialized ssd130x 1.0.0 20220131 for 0-003c on minor 0
>>     ssd130x-i2c 0-003c: [drm] surface width(128), height(32), bpp(1)
>>     and format(R1   little-endian (0x20203152))
>>     Unable to handle kernel NULL pointer dereference at virtual address 00000000
>>     Oops [#1]
>>     CPU: 0 PID: 1 Comm: swapper Not tainted
>>     6.5.0-rc1-orangecrab-02219-g0a529a1e4bf4 #565
>>     epc : ssd130x_update_rect.isra.0+0x13c/0x340
>>      ra : ssd130x_update_rect.isra.0+0x2bc/0x340
>>     ...
>>     status: 00000120 badaddr: 00000000 cause: 0000000f
>>     [<c0303d90>] ssd130x_update_rect.isra.0+0x13c/0x340
>>     [<c0304200>] ssd130x_primary_plane_helper_atomic_update+0x26c/0x284
>>     [<c02f8d54>] drm_atomic_helper_commit_planes+0xfc/0x27c
>>     [<c02f9314>] drm_atomic_helper_commit_tail+0x5c/0xb4
>>     [<c02f94fc>] commit_tail+0x190/0x1b8
>>     [<c02f99fc>] drm_atomic_helper_commit+0x194/0x1c0
>>     [<c02c5d00>] drm_atomic_commit+0xa4/0xe4
>>     [<c02cce40>] drm_client_modeset_commit_atomic+0x244/0x278
>>     [<c02ccef0>] drm_client_modeset_commit_locked+0x7c/0x1bc
>>     [<c02cd064>] drm_client_modeset_commit+0x34/0x64
>>     [<c0301a78>] __drm_fb_helper_restore_fbdev_mode_unlocked+0xc4/0xe8
>>     [<c0303424>] drm_fb_helper_set_par+0x38/0x58
>>     [<c027c410>] fbcon_init+0x294/0x534
>>     ...
>> 
>> The problem is that fbcon calls fbcon_init() which triggers a DRM modeset
>> and this leads to drm_atomic_helper_commit_planes() attempting to commit
>> the atomic state for all planes, even the ones whose CRTC is not enabled.
>> 
>> Since the primary plane buffer is allocated in the encoder .atomic_enable
>> callback, this happens after that initial modeset commit and leads to the
>> mentioned NULL pointer dereference.
>
> I think that's where the problem lies: you must not allocate a buffer in
> atomic_enable.
>
> After drm_atomic_helper_swap_state(), the new commit is being applied
> and you aren't allowed to fail, and an allocation can fail.
>
> Everything needs to be prepared by the time _swap_state is called, and
> it's one of the point of atomic_check.
>
> So you need to allocate your buffer there, and use it in whatever
> atomic_commit related hook you need it in.
>
> The typical way of doing this would be to create a custom state
> structure that embeds the global one, create your own reset,
> atomic_duplicate_state and atomic_destroy_state implementations, and
> store the buffer pointer there.
>

I see. That makes totally sense to me. I'll do that in v4 then!

> Maxime

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

