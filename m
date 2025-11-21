Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A861EC7B373
	for <lists+dri-devel@lfdr.de>; Fri, 21 Nov 2025 19:07:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED84410E8F1;
	Fri, 21 Nov 2025 18:07:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="DfGHsYiq";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com
 [209.85.218.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE3A810E8F1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 18:07:24 +0000 (UTC)
Received: by mail-ej1-f53.google.com with SMTP id
 a640c23a62f3a-b71397df721so427662866b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 10:07:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1763748443; x=1764353243;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LnYve/sEJnqpERJGoSkMAg9DVj4NToFJqHLvjfOwWgg=;
 b=DfGHsYiqI6jdtBosqgbByxvt8No885yEX1OsqAdz7cTBSqxLQawN7jJQMFLdrC1B5Q
 JMO//9Pv7vAMmoQRLtk02NPeBpxkUAULODBHRRwOooNf/MgSqxBaYu4MOBH5RiPQT0cW
 Ew3MDRvRrOpkcFRzN6u/e57HOnGLfdDu7+BYQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763748443; x=1764353243;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LnYve/sEJnqpERJGoSkMAg9DVj4NToFJqHLvjfOwWgg=;
 b=MmfuOFKtPkv2WmjkFNpqWQFCiBuxVSUOeVNEteKSDyrrHp7Sdh6nxNLCUSH1ZpE0OW
 yY6RL8xW8HpFYhaikaYynDNqqTAe53pZu1hp0uZ2PNhCz4N7ogJrKeCpZuy6Z6JJj4BS
 +eD/xjQqqLj0hpzRxQ2fwrgBgkiQaISWkQa5HlFLKr+5ne/9F0bheoEcfio7y1+PmYR6
 OLqgc4TAMHEH5lj4xSBNyIVI2d2uk+CqbcULMX8ZMXQmMNnXLCFOwa+pN/a79oGA+XJv
 szR4uEGzvqP6S8S6a9Et9LbB6IcV9+e3H432J5I6k3jqDVU+IdLqED2m/SvCwtTMqqrJ
 fiUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGGloKOSo9fGCvTYlUn2H6Tt28KygyT0UAe3g5iM3k/X06+ztF77X9xN7Yb8U9I/hs5gyHggg5DEg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz08kzar+hNzLCwkC/8XAvTb2Q7WPIPb5NAJphxn/300qlXAlju
 wzLODlyl4lPt7FgN4TC3Cp3y2tPbg3qRwZv4tu892c0pbfxWEm5OmBT+SulCCLaCWcGXmJhJend
 5qbpfnhJX0A==
X-Gm-Gg: ASbGncty21f0UyOOpFsb/BBgBd6XKSEZAme/A602j0grExIZ/+jyR9/IwgSbPi+Efa6
 Oh44TyN+uOPEhvFRdX7uR0IJrfmgvJpS85ee6KhyTY7EsEuej1E/SXRzCbCWm4uN10yHXJeusE+
 oQNppJqVDqJpEle9Su4c7EtjqEQhQS/reNDqRg+UFd9E7F3ujMGPwHhuL0iFB2W6SZAXZAhhh3Z
 RpytZIZdY00VanT22He2+90Z/5CvU3Ryb67edrCgC043NsVP1EblMl4wWQ6smqIh58KxsUzx+lD
 yAHfq2/xRc1ZUjOVkjUgFpPTEqzTAA+SvdnttRecomjskifjZ/Ouw6AKY704wBs+lIGZLmCc6ee
 fq4q8C4O1cCtuWfNJHiwl3gcAywedzIxyni0meqhFa52qiPcs7Dje3GxxwhsT3zQsxQXY6gMEws
 oo4wC5zli5SlwUaRA8JE9eDRukJ1UCJqqoe6+KNPi1eVsw3Ynbi8ZbdaA+DVfwdllILVoyJV0=
X-Google-Smtp-Source: AGHT+IEJ4wSO87f9bB+ObpauNCUei3R3clOegu7zOS4zaiZgNv+4nuTwWS8VQWDigNJo958tibcJSg==
X-Received: by 2002:a17:906:4fcb:b0:b73:59b0:34d6 with SMTP id
 a640c23a62f3a-b767170a39cmr345973666b.33.1763748442843; 
 Fri, 21 Nov 2025 10:07:22 -0800 (PST)
Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com.
 [209.85.208.46]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654d80665sm504104166b.31.2025.11.21.10.07.20
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 21 Nov 2025 10:07:20 -0800 (PST)
Received: by mail-ed1-f46.google.com with SMTP id
 4fb4d7f45d1cf-6408f9cb1dcso3448113a12.3
 for <dri-devel@lists.freedesktop.org>; Fri, 21 Nov 2025 10:07:20 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCW+V8FQmSaUO4xXFlVuGXrrANZR3VfwMOyHZyqHmy1JQbDG1xMsc5iZ7V/5PfCA8Lu8LmxDTbX7YTs=@lists.freedesktop.org
X-Received: by 2002:a05:6402:4409:b0:641:1d64:8dce with SMTP id
 4fb4d7f45d1cf-64554666422mr2922451a12.17.1763748440155; Fri, 21 Nov 2025
 10:07:20 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9tz19=6NpVyQ0T4m_V1GGUZ9u7-6AQ7=OxSuZWkX3bU7Dg@mail.gmail.com>
In-Reply-To: <CAPM=9tz19=6NpVyQ0T4m_V1GGUZ9u7-6AQ7=OxSuZWkX3bU7Dg@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 21 Nov 2025 10:07:04 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiBCPL+zeKVF7zYVSiymjFRmgunCeyryUhoZNBR06sR-g@mail.gmail.com>
X-Gm-Features: AWmQ_bmRGoaWrjvgdGC4KS-74ZYgJKt1JBGwBpjveufLlMVfT4TXFZZRm29pSUU
Message-ID: <CAHk-=wiBCPL+zeKVF7zYVSiymjFRmgunCeyryUhoZNBR06sR-g@mail.gmail.com>
Subject: Re: [git pull] drm fixes for 6.18-rc7
To: Dave Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>,
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

On Fri, 21 Nov 2025 at 01:07, Dave Airlie <airlied@gmail.com> wrote:
>
> A range of small fixes across the board, the i915 display
> disambiguation is probably the biggest otherwise amdgpu and xe as
> usual with tegra, nouveau, radeon and a core atomic fix.

Pulled, but my sanity checking complains about your key having expired.

And a "gpg --refresh" doesn't find it on the keyservers I use, nor do
you maintain a key in the kernel.org pgp key repo.

So I have no idea where your keys are. Mind pushing it out to all the
common key servers (which still work sporadically)? Or at least point
to whatever keyserver you do use...

                      Linus
