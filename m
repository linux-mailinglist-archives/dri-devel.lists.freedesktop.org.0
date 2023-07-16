Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 717F0754ED2
	for <lists+dri-devel@lfdr.de>; Sun, 16 Jul 2023 15:30:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FB5F10E18B;
	Sun, 16 Jul 2023 13:30:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2516710E18B
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jul 2023 13:30:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689514237;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=CjuXrLpE5fZ4kMeORkkTJX0Um/Y7BBe3dNlC2HaYSoU=;
 b=X8snGem+gcYRwACxX1FNLN5Ew9D+hoQdg6z4DuFlqZzyFCiTQMSTrcE5bqMkldvyNYVlj2
 r7UglPQVK69KPOAjuSDtnDB/h9HpLjMErhjgCHYnJACrqJiVwzzB0FeqMMYEJMeFQCtWZT
 BQBUn3kXgI11EYNQk2dcNwC//sq48f0=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-371-Yvsup6xPNMqH5S_lDkBI2g-1; Sun, 16 Jul 2023 09:30:35 -0400
X-MC-Unique: Yvsup6xPNMqH5S_lDkBI2g-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-3f42bcef2acso19270175e9.2
 for <dri-devel@lists.freedesktop.org>; Sun, 16 Jul 2023 06:30:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689514234; x=1692106234;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=CjuXrLpE5fZ4kMeORkkTJX0Um/Y7BBe3dNlC2HaYSoU=;
 b=hFKahN+IQRYQq6sAukpBwHDwkHTAS01hxVBuaXdDm/4dHD6hfuzbt1demt/ieUXcXd
 L/ZfD6sVlY/f50fy08uUMwNt9tJf9PnmO+/ecBYhEVoAqxRzmOI3BVDOgneM4dtDgZch
 h8GcPUkjBrCCi6OJixit92Wz4GAab7Serm/ipsXnWSrY286UOjl1pQpRcLy+FFSxXELV
 kUJE8wqWFwvZqop2gcx88KomekVFzLbwjhwwzlukLBg3h5B/3CTrXcAur72O+LBSnIE2
 azzJ8A3Gras1kFrT2rVd5+m6iUOiMKQ0eR5iBrs06gm5Y4RAaZtdVhxCJNII3KWKcT3U
 gsAg==
X-Gm-Message-State: ABy/qLYzdqhYJ5Eq6uANNOsycdBYBzjs9ag1g18t2H+EVNAXUbSgs7NM
 4cp3LD2LRbU2IuiankUOPJ6wYB8ulGe/2TZ9+myEgm91dxaCkBWT+bR8+wlzNoQvnPjnqndtfCx
 vbv4jnjjctmzHqjigUgzQKdtdKevG
X-Received: by 2002:a7b:cbcb:0:b0:3f9:b1e7:8a4b with SMTP id
 n11-20020a7bcbcb000000b003f9b1e78a4bmr7679356wmi.21.1689514234768; 
 Sun, 16 Jul 2023 06:30:34 -0700 (PDT)
X-Google-Smtp-Source: APBJJlF9RdEhJ0TAEWePY7ifDIJ9OBUgAG5cpiZ6Um+wUYdwWLf1n30CjRuAHN3tQL7HMIYTidQoXg==
X-Received: by 2002:a7b:cbcb:0:b0:3f9:b1e7:8a4b with SMTP id
 n11-20020a7bcbcb000000b003f9b1e78a4bmr7679337wmi.21.1689514234418; 
 Sun, 16 Jul 2023 06:30:34 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 y13-20020a05600c364d00b003f819faff24sm5580532wmq.40.2023.07.16.06.30.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jul 2023 06:30:33 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Subject: Re: [PATCH 0/8] drm: fb-helper/ssd130x: Add support for DRM_FORMAT_R1
In-Reply-To: <cover.1689252746.git.geert@linux-m68k.org>
References: <cover.1689252746.git.geert@linux-m68k.org>
Date: Sun, 16 Jul 2023 15:30:32 +0200
Message-ID: <87zg3w7zlz.fsf@minerva.mail-host-address-is-not-set>
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
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Geert Uytterhoeven <geert@linux-m68k.org> writes:

Hello Geert,

> 	Hi all,
>
> The native display format of ssd1306 OLED displays is monochrome
> light-on-dark (R1).  This patch series adds support for the R1 buffer
> format to both the ssd130x DRM driver and the FB helpers, so monochrome
> applications (including fbdev emulation and the text console) can avoid
> the overhead of back-and-forth conversions between R1 and XR24.
>

I've tested your series on a ssd1306 I2C OLED panel and fbcon did work for
me, but had some issues when trying to run your fbtest suite. Because the
test005 gets killed with a SIGSEGV.

$ ./fbtest -d 
fb_init()
fb_open()
fb_get_var()
fb_get_fix()
fb_map()
fb_start = 0, fb_offset = 0, fb_len = 1000
fb_save()
fb_clear()
Using drawops planar (monochrome and (interleaved) bitplanes)
Available visuals:
  Monochrome
  Grayscale 2
Using visops monochrome
Running all tests
Running test test001
test001: PASSED
Running test test002
test002: PASSED
Running test test003
Requirement num_colors >= 16 not met
Running test test004
test004: PASSED
Running test test005
Caught signal 11. Exiting
fb_cleanup()
fb_restore()
fb_unmap()
fb_set_var()
fb_get_var()
fb_get_fix()
fb_close()

Maybe more tests are missing the minimum num_colors requirement? Also, the
penguin in test004 is not displayed correctly. I was expecting that to be
working correctly since you mentioned to be using the Linux logo on boot.

Another question, do you know if is possible to change the default format?
I believe that fbset won't work because the DRM fbdev emulation layer does
not implement mode settings but I thought that changing the mode using the
atomic KMS API would work.

$ modetest -M ssd130x -P 31@33:128x64@XR24 -a
$ echo $?
0

but after that I still get:

$ fbset -i

mode "128x64"
    geometry 128 64 128 64 1
    timings 0 0 0 0 0 0 0
    rgba 1/0,1/0,1/0,0/0
endmode

Frame buffer device information:
    Name        : ssd130xdrmfb
    Address     : (nil)
    Size        : 4096
    Type        : PACKED PIXELS
    Visual      : MONO10
    XPanStep    : 1
    YPanStep    : 1
    YWrapStep   : 0
    LineLength  : 16
    Accelerator : No

Maybe I'm doing something wrong or misunderstading about how should work?

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

