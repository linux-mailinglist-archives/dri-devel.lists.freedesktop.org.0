Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F8F965ECDD
	for <lists+dri-devel@lfdr.de>; Thu,  5 Jan 2023 14:23:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CFF410E71E;
	Thu,  5 Jan 2023 13:22:53 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E07DF10E71C
 for <dri-devel@lists.freedesktop.org>; Thu,  5 Jan 2023 13:22:51 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 k22-20020a05600c1c9600b003d1ee3a6289so1288458wms.2
 for <dri-devel@lists.freedesktop.org>; Thu, 05 Jan 2023 05:22:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TMYXEk4lndOrw8goIICh9q2Q+fxdp6yIZD9WFVuj+yo=;
 b=V94j5uLsqkr1OjMTZXNgPq44eyqGmxT0IobSI51BRwh6FlTxLGJS6GlaplOQcu4J4i
 1UIi3lNu7W2NDMt/4LU1E8bedgzj4cvGalflGyH+QwXn6vqCCv77tVy6hqfjnwomUkDg
 eNuk2sGyaPx9pQFWucJgrkT8p7Q17PrwKmruQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references
 :mail-followup-to:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TMYXEk4lndOrw8goIICh9q2Q+fxdp6yIZD9WFVuj+yo=;
 b=VtkyRglhbfyUPyM2sEzUfsMH8bf0Ti14UUZHwDO9dZHEvguxL+rk61rElHLcrvS9k2
 inKf7j6pfQeJnFeQ3gBNG5EvEavR5CGKo9cQU0B/7KRPUtoYBxwzaO9x1SHBQm2/qZ2e
 AdrnEnE3Zvd85M9zrFvqcNfDZdi6FjYBv0j6Wz7SmELGvTdD6weBztqNIFCcdG/EJ3Dl
 xIQKCVLWtHDRePPXREHQ9+KQbb2ozWSjN/TFTmeVCXB50F/5XBazaoeo7Sp6fObbPSe8
 vNY2rhkjhSOB0lYoZOBBDLBq2ymKzpU2obqoeN86yGSkXHgCVxugYPebQrUOPQcKh1rb
 1Fdg==
X-Gm-Message-State: AFqh2ko59QNwoBXkhNiSRf/ykxhoUCP9V0OYBTCSsCh0tqliEaxNlwG4
 nifz5lwIwu4mXhcu7mp9tvqodw==
X-Google-Smtp-Source: AMrXdXuJUO1wZOxW9brhdxg5XJCrqOxItwQjBkeG7zm48GS5EfrNaAp6aLdj5/qkbCI8xw+kWLLptw==
X-Received: by 2002:a05:600c:1d89:b0:3d3:5cd6:781 with SMTP id
 p9-20020a05600c1d8900b003d35cd60781mr35560523wms.37.1672924970434; 
 Thu, 05 Jan 2023 05:22:50 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id
 j25-20020a05600c1c1900b003cfa80443a0sm2701132wms.35.2023.01.05.05.22.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Jan 2023 05:22:49 -0800 (PST)
Date: Thu, 5 Jan 2023 14:22:47 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
Subject: Re: [PATCH] fbcon: Use kzalloc() in fbcon_prepare_logo()
Message-ID: <Y7bPJzyVpqTK+DMd@phenom.ffwll.local>
Mail-Followup-To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
 Alexander Potapenko <glider@google.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 Marco Elver <elver@google.com>, Dmitry Vyukov <dvyukov@google.com>,
 kasan-dev <kasan-dev@googlegroups.com>,
 Helge Deller <deller@gmx.de>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 DRI <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Kees Cook <keescook@chromium.org>
References: <cad03d25-0ea0-32c4-8173-fd1895314bce@I-love.SAKURA.ne.jp>
 <CAMuHMdUH4CU9EfoirSxjivg08FDimtstn7hizemzyQzYeq6b6g@mail.gmail.com>
 <86bdfea2-7125-2e54-c2c0-920f28ff80ce@I-love.SAKURA.ne.jp>
 <CAG_fn=VJrJDNSea6DksLt5uBe_sDu0+8Ofg+ifscOyDdMKj3XQ@mail.gmail.com>
 <Y7a6XkCNTkxxGMNC@phenom.ffwll.local>
 <032386fc-fffb-1f17-8cfd-94b35b6947ee@I-love.SAKURA.ne.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <032386fc-fffb-1f17-8cfd-94b35b6947ee@I-love.SAKURA.ne.jp>
X-Operating-System: Linux phenom 5.19.0-2-amd64 
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
Cc: Marco Elver <elver@google.com>, Kees Cook <keescook@chromium.org>,
 Helge Deller <deller@gmx.de>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 kasan-dev <kasan-dev@googlegroups.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Geert Uytterhoeven <geert@linux-m68k.org>,
 DRI <dri-devel@lists.freedesktop.org>, Alexander Potapenko <glider@google.com>,
 Dmitry Vyukov <dvyukov@google.com>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Jan 05, 2023 at 10:17:24PM +0900, Tetsuo Handa wrote:
> On 2023/01/05 20:54, Daniel Vetter wrote:
> >>> . Plain memset() in arch/x86/include/asm/string_64.h is redirected to __msan_memset()
> >>> but memsetXX() are not redirected to __msan_memsetXX(). That is, memory initialization
> >>> via memsetXX() results in KMSAN's shadow memory being not updated.
> >>>
> >>> KMSAN folks, how should we fix this problem?
> >>> Redirect assembly-implemented memset16(size) to memset(size*2) if KMSAN is enabled?
> >>>
> >>
> >> I think the easiest way to fix it would be disable memsetXX asm
> >> implementations by something like:
> >>
> >> -------------------------------------------------------------------------------------------------
> >> diff --git a/arch/x86/include/asm/string_64.h b/arch/x86/include/asm/string_64.h
> >> index 888731ccf1f67..5fb330150a7d1 100644
> >> --- a/arch/x86/include/asm/string_64.h
> >> +++ b/arch/x86/include/asm/string_64.h
> >> @@ -33,6 +33,7 @@ void *memset(void *s, int c, size_t n);
> >>  #endif
> >>  void *__memset(void *s, int c, size_t n);
> >>
> >> +#if !defined(__SANITIZE_MEMORY__)
> >>  #define __HAVE_ARCH_MEMSET16
> >>  static inline void *memset16(uint16_t *s, uint16_t v, size_t n)
> >>  {
> >> @@ -68,6 +69,7 @@ static inline void *memset64(uint64_t *s, uint64_t
> >> v, size_t n)
> >>                      : "memory");
> >>         return s;
> >>  }
> >> +#endif
> > 
> > So ... what should I do here? Can someone please send me a revert or patch
> > to apply. I don't think I should do this, since I already tossed my credit
> > for not looking at stuff carefully enough into the wind :-)
> > -Daniel
> > 
> >>
> >>  #define __HAVE_ARCH_MEMMOVE
> >>  #if defined(__SANITIZE_MEMORY__) && defined(__NO_FORTIFY)
> >> -------------------------------------------------------------------------------------------------
> >>
> >> This way we'll just pick the existing C implementations instead of
> >> reinventing them.
> >>
> 
> I'd like to avoid touching per-arch asm/string.h files if possible.
> 
> Can't we do like below (i.e. keep asm implementations as-is, but
> automatically redirect to __msan_memset()) ? If yes, we could move all
> __msan_*() redirection from per-arch asm/string.h files to the common
> linux/string.h file?

Oh I was more asking about the fbdev patch. This here sounds a lot more
something that needs to be discussed with kmsan people, that's definitely
not my area.
-Daniel

> 
> diff --git a/include/linux/string.h b/include/linux/string.h
> index c062c581a98b..403813b04e00 100644
> --- a/include/linux/string.h
> +++ b/include/linux/string.h
> @@ -360,4 +360,15 @@ static __always_inline size_t str_has_prefix(const char *str, const char *prefix
>  	return strncmp(str, prefix, len) == 0 ? len : 0;
>  }
>  
> +#if defined(__SANITIZE_MEMORY__) && defined(__NO_FORTIFY)
> +#undef memset
> +#define memset(dest, src, count) __msan_memset((dest), (src), (count))
> +#undef memset16
> +#define memset16(dest, src, count) __msan_memset((dest), (src), (count) << 1)
> +#undef memset32
> +#define memset32(dest, src, count) __msan_memset((dest), (src), (count) << 2)
> +#undef memset64
> +#define memset64(dest, src, count) __msan_memset((dest), (src), (count) << 3)
> +#endif
> +
>  #endif /* _LINUX_STRING_H_ */
> 
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
