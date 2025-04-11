Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C35F5A85E46
	for <lists+dri-devel@lfdr.de>; Fri, 11 Apr 2025 15:11:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9170210EBB2;
	Fri, 11 Apr 2025 13:11:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=redhat.com header.i=@redhat.com header.b="fssDc4DM";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C7A510EBB2
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 13:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1744377074;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=sVZ4QSAu2dyki6ocaWRXYDX2sA20EeQkrcN4x5tVkmQ=;
 b=fssDc4DMaW5W5OtvxvE4w9SaX4O5G8jYlGk7TCvz7+9lvo+LSrNJyEHfSFmx2z/GfhHZOz
 zLbN94JqrkPXRaTLyeObNPwp+2ztovpQQzn8mxQQbY1DCUV2hyeoFa0cxe0aFZRHnaGIPE
 iefG4Y9LG9mJ2HyppYiALfyO8erggwA=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-355-ygOQx_iJMEa0qHKCF42MQA-1; Fri, 11 Apr 2025 09:11:12 -0400
X-MC-Unique: ygOQx_iJMEa0qHKCF42MQA-1
X-Mimecast-MFC-AGG-ID: ygOQx_iJMEa0qHKCF42MQA_1744377072
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-43cf172ffe1so17648005e9.3
 for <dri-devel@lists.freedesktop.org>; Fri, 11 Apr 2025 06:11:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744377072; x=1744981872;
 h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
 :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=sVZ4QSAu2dyki6ocaWRXYDX2sA20EeQkrcN4x5tVkmQ=;
 b=ltO3uNV3RHAEzOsdIS0umZj/hAKxIgKvUl8tQWkeg0xXyvVS80wLi7fTVT2OVe/9L9
 rApsjaNOxAMTmh4qDARhhU8BeireB9lhUGeY6uf47UloXPjgeiH2Vl93omUYMALqtePG
 8ClKlKG/v0FQPl1jzxDAbNG4UTHa1StJwEOWGT7azHPaG4tRRdfIa/2pN5kwMLoXMBVZ
 hQYtWN5uvb5Vi1TCXd+KEP5smBDSeR6F+iNkGBOrcgFbFpjj2Y22UdR4PxN6wjBaOSRP
 nTZ8J1M5Ilfn4vJvIpc2jlf1OTDc/zu9jdxIKCxkWexGLGIXy3B5y1UQtw5rUvht6vSe
 vEDQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcushCbwncxSuqU15sDVtKVcntxnj737NvZFqDXYEaQ4Qyi9iAhblOWAr/bna1W5ZM34XpqEj16e4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz+g6gVWVqGr5fUYg4jIUy7CaHaqA/JAQcMDcH2Wa0P9Hesb0Um
 USanEzHhKjVmNwYJw1HfCLjJuGvE8OI1kfnUzl8IYiH6NRTnqg9TTkjfqXunYyQfR2brohU56VF
 zzsAAzzAjBba/Soj9DlIG5maGxWPzCHl5PVSOw1fe9D11FYvhDZyTpAG6xZbw5kBq7g==
X-Gm-Gg: ASbGncv9NliD9U3dERzmtLl0rKkSpLnAe+5c7TCssQAUt7TYFxB8zSLrHvNqOhwvsS8
 xpZ4nv8BYwFPCSia0Ah3GLMsBdhu7AXUETMD9TsK+y+IYhO/YUqCqVWytN4j1k5lqKMmknhTdA2
 HGzdKmBysV9QCE+J1EAamtfw6DI6o9L+iUCA5/g93R4PLTQ+F/6taxhXrzY/TTK8dKSVCmGohPp
 UQuWNMXKlgHw0TmKgsq5lijnW9beCwqsEOVu1uk7MvCgaV1RnlgHTxy+s2R4OVuEcnyPPJm4o0T
 oByoOsDe5bZOMlQR85DkJMbi91qvztWF7e5gaXotKrfM/QHBiLPG9JTN6sQX8gY3t6CW3w==
X-Received: by 2002:a05:600c:4f45:b0:43c:fffc:7855 with SMTP id
 5b1f17b1804b1-43f3a959a54mr27221195e9.15.1744377071558; 
 Fri, 11 Apr 2025 06:11:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFC+z92vhh7g2ybLS4kL/brhBh5vT1DbMh4lJA6Q6ypcMXRNf2AULVsSlzOqoIHKKXQrjXtDQ==
X-Received: by 2002:a05:600c:4f45:b0:43c:fffc:7855 with SMTP id
 5b1f17b1804b1-43f3a959a54mr27220665e9.15.1744377071067; 
 Fri, 11 Apr 2025 06:11:11 -0700 (PDT)
Received: from localhost (62-151-111-63.jazzfree.ya.com. [62.151.111.63])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-43f23572d43sm81516565e9.31.2025.04.11.06.11.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Apr 2025 06:11:10 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: Arnd Bergmann <arnd@kernel.org>, Thomas Zimmermann
 <tzimmermann@suse.de>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Nathan
 Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Nick Desaulniers
 <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>,
 Justin Stitt <justinstitt@google.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH] drm/efidrm: ensure screen_base is initialized
In-Reply-To: <20250411125554.1453825-1-arnd@kernel.org>
References: <20250411125554.1453825-1-arnd@kernel.org>
Date: Fri, 11 Apr 2025 15:11:08 +0200
Message-ID: <8734ee3ksz.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oivfsl3OCSbatWxFby-JyQTbTgwUoA39Brn6n3QEx0M_1744377072
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

Arnd Bergmann <arnd@kernel.org> writes:

Hello Arnd,

> From: Arnd Bergmann <arnd@arndb.de>
>
> clang points out that there is a code path that leads to undefined behavior:
>
> drivers/gpu/drm/sysfb/efidrm.c:353:11: error: variable 'screen_base' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>   353 |         else if (mem_flags & EFI_MEMORY_WB)
>       |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
>
> Add the missing initialization.
>
> Fixes: 32ae90c66fb6 ("drm/sysfb: Add efidrm for EFI displays")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

A similar patch has been proposed by Nathan already and acked by Thomas:

https://lists.freedesktop.org/archives/dri-devel/2025-April/500539.html

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

