Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 250AC8C6F5B
	for <lists+dri-devel@lfdr.de>; Thu, 16 May 2024 01:58:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AE5A510E17D;
	Wed, 15 May 2024 23:58:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="LwzGSR8G";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com
 [209.85.208.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B3AD10E17D
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 23:58:29 +0000 (UTC)
Received: by mail-lj1-f180.google.com with SMTP id
 38308e7fff4ca-2df83058d48so1694661fa.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 16:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1715817508; x=1716422308;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rQkGsZkxdko+C8Sw0W5RkLIzgexrf1Kb8aIsn7Naypk=;
 b=LwzGSR8GIzixSHh1UGUzagPrKK9JfAMrPiVJV0jO6LeNwXRNT9WhRtVQIzfnM7FBXF
 YdujBmiyamLfzj7fNOqnnTWo+AGkRqWAp5CRwfw1vlJb2giKJLnpx/LoQEhDXO/R0yDh
 nckrsDnZCw2aneySYW54Re14m3T0+JkifPLaA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715817508; x=1716422308;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rQkGsZkxdko+C8Sw0W5RkLIzgexrf1Kb8aIsn7Naypk=;
 b=pY3XZpUJl0B33x+Mq0o0PB+Iw8YCk1Ou9Nnxlr1ARpEypWi7XmgwNt+qywZvJiJtcF
 nXlslHD/aqTUwNT4dUjAhWwAPn7jVQLjumftr4gp53hCLr0W3jimR8LfOdFzGoW8skvh
 XHf7voTEerISRia2zwyBkpWp551oy5pjzuCMrT9ceNoXoJgnoRYc1H6yHa2RlAKkdm87
 V4DiI5kVTmlFdx7SARRrWIGyfdMfKyvVPc14Vs81M1+V9Cs1sIKI1zDXkEozyWIryxuC
 H8uwTQ6AKxp+y/PaoixSd8+tSXDTaPG2Y+insol7MeShfK3C9dRHpKPFlWtiML8Qt4om
 ZGZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWKyfkuTiWXWTLs1n8M48/Cq7E4lJf5ltEpUXaH3ihgPRvlQ96Mpufa4qtabIWQjX9KW+tvblhcX4qwMHoaD0by1vQ/9XPOsJdaxcOXHZbZ
X-Gm-Message-State: AOJu0Yx1t2WeQjnHpj+vUWgrViQtLvdvkhF9W+eJS6GBsBRew26Y51zD
 4BqLU3YswetEcgubwBQa1xFjrBgENoWi8ChJeuPZdG4CtCJMvVoHCkpiIPF5KLX/aJ0r1zaXFl9
 itZLXfA==
X-Google-Smtp-Source: AGHT+IGuJaI83mNiFVcmWeBZQFpdxVHYx4cN4byuYBe8OrRsrwm3oRFedaqjYb7/4wNpfD78eI8H3Q==
X-Received: by 2002:a2e:8544:0:b0:2e2:2623:333 with SMTP id
 38308e7fff4ca-2e52028b140mr112967401fa.39.1715817507588; 
 Wed, 15 May 2024 16:58:27 -0700 (PDT)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com.
 [209.85.167.44]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2e4d1833f65sm22024021fa.135.2024.05.15.16.58.27
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 May 2024 16:58:27 -0700 (PDT)
Received: by mail-lf1-f44.google.com with SMTP id
 2adb3069b0e04-51f0f6b613dso172778e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 May 2024 16:58:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCUOqGlTMp17+d/S83Ko4ygVpQeLeisromzYgV9kWybzX2HT9ugaL9S28tv0/7hYBkEiPpIrTJyaAA/thdtAfioCzGdBxyIUZA8ZFtAErzTl
X-Received: by 2002:a05:6512:74f:b0:51e:11d5:bca5 with SMTP id
 2adb3069b0e04-5221016e7ddmr9442194e87.54.1715817506678; Wed, 15 May 2024
 16:58:26 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9tw-53PCvveRcdLUUQ+mjq2X2er5zp6n1KeE8Nu8x=VP2g@mail.gmail.com>
 <CAHk-=whxT8D_0j=bjtrvj-O=VEOjn6GW8GK4j2V+BiDUntZKAQ@mail.gmail.com>
 <CAPM=9tyOtH24Mw_2X+bgV9iChOQV3LtmRCoR5x6KXhSUD6FjUg@mail.gmail.com>
 <CAHk-=wh8DWSMrtuhZOzanfBCFcuJCihO9x7fkzx-dBhLddXF-Q@mail.gmail.com>
 <CAPM=9twCVkx9OqndCcvjjgx+P7ixBRwttiz25-R=bkycEo5vrQ@mail.gmail.com>
In-Reply-To: <CAPM=9twCVkx9OqndCcvjjgx+P7ixBRwttiz25-R=bkycEo5vrQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 15 May 2024 16:58:09 -0700
X-Gmail-Original-Message-ID: <CAHk-=whuCX-NAGOLzwn5sObPDJX-pdqamZ7YTpHFHODAMv4P+A@mail.gmail.com>
Message-ID: <CAHk-=whuCX-NAGOLzwn5sObPDJX-pdqamZ7YTpHFHODAMv4P+A@mail.gmail.com>
Subject: Re: [git pull] drm for 6.10-rc1
To: Dave Airlie <airlied@gmail.com>
Cc: Jani Nikula <jani.nikula@linux.intel.com>,
 Jani Nikula <jani.nikula@intel.com>, 
 Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 LKML <linux-kernel@vger.kernel.org>
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
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 15 May 2024 at 16:17, Dave Airlie <airlied@gmail.com> wrote:
>
> It's also possible it's just that hey there's a few others in the tree
>
> KVM_WERROR not tied to it
> PPC_WERROR (why does CXL uses this?)

Yeah, that should be fixed too, but at least KVM_WERROR predates the
whole-kernel WERROR.

And PPC_WERROR predates it by over a decade.

But yes, good catch - both of those should be silenced if we already
have the global WERROR enabled.

I mainly notice new questions (because I use "make oldconfig"), so old
pre-existing illogical ones don't trigger my "why are they asking?"
reaction.

> AMDGPU, I915 and XE all have !COMPILE_TEST on their variants

Hmm.  It turns out that I didn't notice the AMDGPU one because my
Threadripper - that has AMDGPU enabled - I have actually turned off
EXPERT on, so it's hidden by that for me.

But yes, both of those should be "depends on !WERROR" too.

Or maybe they should just go away entirely, and be subsumed by the
DRM_WERROR thing.

               Linus
