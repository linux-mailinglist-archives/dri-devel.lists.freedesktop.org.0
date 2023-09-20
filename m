Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DA827A7566
	for <lists+dri-devel@lfdr.de>; Wed, 20 Sep 2023 10:09:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C6B810E455;
	Wed, 20 Sep 2023 08:09:43 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 148B010E45E
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 08:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695197381;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=wUFr8wXK8O4RymSbY1nra3xh487ahU0WWNS0q+EozOI=;
 b=cZw9MAO/FcFnZh/YiCPqOFpRj2rCyX2RsOemK+2vaLaMFb0Wu8mzwKMzLVxGm29okoWQVG
 SkEfU37DssycvC5aRN3SI6NWuDrNFSPNEOXhHo4rvzLdpsGrsgeCCmv3lxG33uval6NTvj
 G7r3dbjR0RWZqiRjE8SH/XD1CzAFelQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-PP1m9QrsM62fRZ4Jm5k5cg-1; Wed, 20 Sep 2023 04:09:39 -0400
X-MC-Unique: PP1m9QrsM62fRZ4Jm5k5cg-1
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-402ff13f749so48698215e9.0
 for <dri-devel@lists.freedesktop.org>; Wed, 20 Sep 2023 01:09:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695197378; x=1695802178;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=wUFr8wXK8O4RymSbY1nra3xh487ahU0WWNS0q+EozOI=;
 b=a/t97MzgFzhOnRmOXPwg0nsrOV3/uwO188SEfUS6LkVg9TEU9OEM0iW3e62hXSaHkv
 qbqauSbq+Z3dIpbOzGy8o+my7drRKXAb69wjzVmvV7pHa88gO9wlYyaUU8mHD3tykzXE
 AilsHwwew2jKuV754+UEelxda0KnX/eMMjKF9zdUn1twGQJAiF+EvjazvBQCe7mf/ygb
 2BEwjlMQoVNU8i/+UcBgR3mSMHEw5xURgB6F6K9hkHI8RF2imcsBI25jNNLs2FaMAaie
 ahRLstsSlPZZNqqNPUwbUEgtydtq2j6PvOAcWkMF1rPlIY26JY8ft+sXWNbXRqhKk6Ij
 NUnw==
X-Gm-Message-State: AOJu0YzlZ+YRq5B9CwQOJAoBLHB31ZkeOyu/j4QgmsV5Tl0SKz7O5EKJ
 o2b2mDL30zpxJExjI7yZV2Q/K8INNZEb5XnpVCxKCQSUy/2lYNux77lP8IAyy6FXEAgRQXDCo1I
 EQpXPRPwieFxcAWPfC3RGqxvKWbke
X-Received: by 2002:a1c:771a:0:b0:401:bf56:8ba0 with SMTP id
 t26-20020a1c771a000000b00401bf568ba0mr1546097wmi.28.1695197378554; 
 Wed, 20 Sep 2023 01:09:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHysZz6FM59YTt5tU+tK8YwrLHrBxcEDjY1ArDkjh6Nbe/7xpyZCpKNOycMqjW9MlKxyQeQmA==
X-Received: by 2002:a1c:771a:0:b0:401:bf56:8ba0 with SMTP id
 t26-20020a1c771a000000b00401bf568ba0mr1546080wmi.28.1695197378265; 
 Wed, 20 Sep 2023 01:09:38 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es.
 [92.176.231.205]) by smtp.gmail.com with ESMTPSA id
 26-20020a05600c22da00b003fedcd02e2asm1223759wmg.35.2023.09.20.01.09.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Sep 2023 01:09:38 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Thomas Zimmermann <tzimmermann@suse.de>, mpe@ellerman.id.au,
 npiggin@gmail.com, christophe.leroy@csgroup.eu, arnd@arndb.de,
 deller@gmx.de
Subject: Re: [PATCH v4 2/5] fbdev: Replace fb_pgprotect() with
 pgprot_framebuffer()
In-Reply-To: <20230912135050.17155-3-tzimmermann@suse.de>
References: <20230912135050.17155-1-tzimmermann@suse.de>
 <20230912135050.17155-3-tzimmermann@suse.de>
Date: Wed, 20 Sep 2023 10:09:37 +0200
Message-ID: <87fs39l0zi.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-arch@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-mips@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-m68k@lists.linux-m68k.org,
 Thomas Zimmermann <tzimmermann@suse.de>, sparclinux@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Thomas Zimmermann <tzimmermann@suse.de> writes:

Hello Thomas,

> Rename the fbdev mmap helper fb_pgprotect() to pgprot_framebuffer().
> The helper sets VMA page-access flags for framebuffers in device I/O
> memory.
>

I think this rename makes it more clear.

> Also clean up the helper's parameters and return value. Instead of
> the VMA instance, pass the individial parameters separately: existing
> page-access flags, the VMAs start and end addresses and the offset

But I fail to see the benefit of this part. Could you please add an
explanation about why this change is desirable ?

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

