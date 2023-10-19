Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19DE97CF2C8
	for <lists+dri-devel@lfdr.de>; Thu, 19 Oct 2023 10:38:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0CAD10E4A1;
	Thu, 19 Oct 2023 08:38:37 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B294F10E4A1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Oct 2023 08:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697704715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=G05XiwhgpIQ/i5NumbylEP8cbj9xoesDNIfV6BzBItM=;
 b=bluqSGekxMNhEssAInPAdfOtOYINJRMGVf67NEdSrJbeHmMl3/4Eax5EU4UUF6qBOUtMJo
 psjEnZ1yY2CqWL8BAa1veKJUWGi1Szm+tJ8WfHN5cEoz4oKGPCOw4QhVrGzO5AjIcPx3ad
 fu7KaCAjgTbdVqwZ+X6eiahv4CSe8lI=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-618-2jecldiiOYG1MiAyW6UiTQ-1; Thu, 19 Oct 2023 04:38:34 -0400
X-MC-Unique: 2jecldiiOYG1MiAyW6UiTQ-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2c50234741eso61010291fa.1
 for <dri-devel@lists.freedesktop.org>; Thu, 19 Oct 2023 01:38:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697704712; x=1698309512;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=G05XiwhgpIQ/i5NumbylEP8cbj9xoesDNIfV6BzBItM=;
 b=AYogxBuOIksCAGyH1heP9sF/thj9MdAUpXmCaugYfLC7pMT2gJ9dqg+1P8GOuXZSnF
 caK/4cSR2MF7tCkL2/uGnnMLw4ZG9TWer5JSsyOi5OdqJ4/M+NgWoUBYMovrWvzTYtvh
 K0ma2pg2zOc4uzlBwSz2niFgBbc79UHu0FLSmS2BVhFwlNOu9MSw1WJimI/Rc2t9WCFX
 ROnvfZtYpMCQ0zv+bpDH4pkAa+6Dnsc2HfOPO8659O2vgTYzcAiHlDatBO8AqrwUOKdz
 4O9fImZFTqSl5POgJ7xIcqRHzUJ5jLckdxZF3fZ478o2RQTP7ql6MnwhLmHq1WXUc+py
 ZCmg==
X-Gm-Message-State: AOJu0Yzz1SeBHaNXWAYKSWuRjbDxTfKQYbxpitRfl36pa8tUtc0clXGI
 eCjJRhCUQ9DVK8plxdK60x+XoLXrER40EFEmcuZPDUEH4Kl6ZxI29a42HwuroF4bEDUuUZI63KG
 Lw2TgnmVxwyq1yjdWQibzBn6UhtUQ
X-Received: by 2002:a2e:9a84:0:b0:2c5:2fcd:2598 with SMTP id
 p4-20020a2e9a84000000b002c52fcd2598mr923273lji.8.1697704712597; 
 Thu, 19 Oct 2023 01:38:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjvOL0qOv+so0xlvnzYm8bWreGusjbjlbJqUyAnRDs+juUfrfGLMyMt9rUO1/HoGxqOlZ6dQ==
X-Received: by 2002:a2e:9a84:0:b0:2c5:2fcd:2598 with SMTP id
 p4-20020a2e9a84000000b002c52fcd2598mr923253lji.8.1697704712268; 
 Thu, 19 Oct 2023 01:38:32 -0700 (PDT)
Received: from localhost (44.red-81-39-191.dynamicip.rima-tde.net.
 [81.39.191.44]) by smtp.gmail.com with ESMTPSA id
 p12-20020a05600c418c00b0040773c69fc0sm3738983wmh.11.2023.10.19.01.38.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Oct 2023 01:38:31 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Maxime Ripard <mripard@kernel.org>, Thierry Reding
 <thierry.reding@gmail.com>
Subject: Re: [PATCH 0/2] fbdev/simplefb: Add missing simple-framebuffer
 features
In-Reply-To: <hrfj43uaoozwbm6wqvpbnqp2axqubuuu4rlantbmmrbddtitq5@6u6y7jibmpfg>
References: <20231011143809.1108034-1-thierry.reding@gmail.com>
 <hrfj43uaoozwbm6wqvpbnqp2axqubuuu4rlantbmmrbddtitq5@6u6y7jibmpfg>
Date: Thu, 19 Oct 2023 10:38:31 +0200
Message-ID: <87wmvjovlk.fsf@minerva.mail-host-address-is-not-set>
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
Cc: linux-fbdev@vger.kernel.org, Robert Foss <rfoss@kernel.org>,
 David Airlie <airlied@linux.ie>, Helge Deller <deller@gmx.de>,
 dri-devel@lists.freedesktop.org, Jon Hunter <jonathanh@nvidia.com>,
 Hans de Goede <hdegoede@redhat.com>, Thomas Zimmermann <tzimmermann@suse.de>,
 Daniel Vetter <daniel.vetter@intel.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Maxime Ripard <mripard@kernel.org> writes:

Hello Maxime,

> Hi,
>
> On Wed, Oct 11, 2023 at 04:38:07PM +0200, Thierry Reding wrote:
>> From: Thierry Reding <treding@nvidia.com>
>> This contains two patches that bring simplefb up to feature parity with
>> simpledrm. The patches add support for the "memory-region" property that
>> provides an alternative to the "reg" property to describe the memory
>> used for the framebuffer and allow attaching the simple-framebuffer
>> device to one or more generic power domains to make sure they aren't
>> turned off during the boot process and take down the display
>> configuration.
>
> I just talked with Sima about it in the hallway at XDC. I'm fine with
> those patches in principle, but it looks to me that simpledrm doesn't
> have support for power domains and we'll want that :)
>

It has support since commit 61df9ca23107 ("drm/simpledrm: Add support for
multiple "power-domains") AFAIK.

> Thanks!
> Maxime
>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

