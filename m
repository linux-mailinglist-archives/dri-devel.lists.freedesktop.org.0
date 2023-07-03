Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D80E7457A4
	for <lists+dri-devel@lfdr.de>; Mon,  3 Jul 2023 10:49:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4162E10E1D9;
	Mon,  3 Jul 2023 08:49:40 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA44D10E1D9
 for <dri-devel@lists.freedesktop.org>; Mon,  3 Jul 2023 08:49:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688374177;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to; bh=+TImfC7tK2SsSjZEh/HT3vdbJQbag2Dkm/n26z7WMho=;
 b=c1VwygpOJBrOcP4j+EQ8TnhNQqSvGCHyhKAVvpmFUKrZ4gPVHnlvTvylE17UPaymiVDRrm
 48xw7Z3FZKBeQ/Dbs9169DqMdXFL5QOSsj1fOT33/qXQT6VuSAcKC4ZZ5eLtJLCzPgf0+J
 R6yujP027rQFAH1WP/cJJsU6C9sO16s=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-214-XH80ut-_MnOn38PcH0pvJQ-1; Mon, 03 Jul 2023 04:49:34 -0400
X-MC-Unique: XH80ut-_MnOn38PcH0pvJQ-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-31421c900b7so1806258f8f.3
 for <dri-devel@lists.freedesktop.org>; Mon, 03 Jul 2023 01:49:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688374173; x=1690966173;
 h=mime-version:message-id:date:in-reply-to:subject:cc:to:from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+TImfC7tK2SsSjZEh/HT3vdbJQbag2Dkm/n26z7WMho=;
 b=JTI8bUCacv/CJccWPOG39AGeb8XbxMLaKMO+yqVIGLY2NDK9d1qh3s1/4Bl/FJDIc8
 vuQvfiQwFTyX3aC1tU4paq8pFwIzDuNMAU8TFSIvf2YxFlP2+nWjH7KUs+PDqMUCe/l/
 l5POT7nYWcArt7EZyStWq+B7Gxqf/xAZaWvSX1OP6VKo+HlwLL5DjZX7Bx3UU0Ye//em
 K0HxEizag70DCvz9QGJQDH9WlXOBvj/CYUlqjJSYYFS7EZzKyNiWKm50sPXa/YhncjB+
 Jq4uyCBNm7wWmZ1TUUwhZxQdJAeslXPGwGJDo/bRgdjo9S1MEBIhwNptE6GGSTQrjzcw
 BDJg==
X-Gm-Message-State: ABy/qLZZ1Qrk3MvCBeQAex1mrqlo/aC06+50zn4roO3SHEP434p8XFhV
 G56iluZX1q52bkFUGv3PtV8uF50pSalHgr/w7c3kbM1vFl6Qp8rYD4CpT3Kx4N5TUtGKZXiEFZW
 vOpIYM5dZ3qq3h7LJ3yU2WmyrRRov
X-Received: by 2002:a5d:5141:0:b0:313:e88d:e6d6 with SMTP id
 u1-20020a5d5141000000b00313e88de6d6mr8286638wrt.14.1688374173214; 
 Mon, 03 Jul 2023 01:49:33 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGg6K8WUHE8euyn+3LOEa30xbblNJ36iK0ft7TSKaKSogN5/e+nUCA42ROWlI7aSWhx9VYj0A==
X-Received: by 2002:a5d:5141:0:b0:313:e88d:e6d6 with SMTP id
 u1-20020a5d5141000000b00313e88de6d6mr8286616wrt.14.1688374172926; 
 Mon, 03 Jul 2023 01:49:32 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 da16-20020a056000197000b0031274a184d5sm25157550wrb.109.2023.07.03.01.49.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Jul 2023 01:49:32 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] fbdev: Split frame buffer support in FB and
 FB_CORE symbols
In-Reply-To: <04fa72f3-d6ca-bd68-7ed9-57151c1877df@suse.de>
Date: Mon, 03 Jul 2023 10:49:26 +0200
Message-ID: <87o7ktz8fd.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Randy Dunlap <rdunlap@infradead.org>,
 Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Helge Deller <deller@gmx.de>, x86@kernel.org, dri-devel@lists.freedesktop.org,
 Ingo Molnar <mingo@redhat.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Borislav Petkov <bp@alien8.de>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

[...]

>>>>    config FB_DEVICE
>>>>    	bool "Provide legacy /dev/fb* device"
>>>> -	depends on FB
>>>> +	select FB_CORE
>>>
>>> This should depend on FB_CORE.
>>>
>> 
>> Yes, already fixed in v3 too. I did a select to prevent symbol circular
>> dependencies but doing that lead to CONFIG_FB_CORE=y even if CONFIG_DRM
>> was set as a module.
>> 
>> But with the "select FB_CORE if DRM_FBDEV_EMULATION" in the DRM symbol as
>> Arnd suggested, I was able to have FB_DEVICE to depend on FB_CORE again.
>
> BTW, where does this item now show up in the menu? It used to be in the 
> framebuffer menu. It's now in the graphics-drivers menu?
>

No, it's still in the framebuffer menu. But after the FB_CORE split the
menuconfig ends broken (no sub-level for fbdev drivers anymore).

I was talking with Arnd and Geert about this. I think that will pause this
series and instead first focus on cleaning up the fbdev Kconfig, then it
should be easier to add the FB_CORE on top of that.

> Best regards
> Thomas
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

