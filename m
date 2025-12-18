Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68F6ACCDC5A
	for <lists+dri-devel@lfdr.de>; Thu, 18 Dec 2025 23:19:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A8CD510EBA9;
	Thu, 18 Dec 2025 22:19:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="TkrbS60T";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
 [209.85.208.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CD5110EBA9
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 22:19:34 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id
 4fb4d7f45d1cf-6492e78ce07so1457774a12.3
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 14:19:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1766096373; x=1766701173;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Jndt3SqYxM2jZAywVtZf3yYDl10GUxyvdAXQWbglW60=;
 b=TkrbS60T+gBHO5CckqgkhbGF2CimxJq+gk0K+GSYpUoqpvF8MLvM45PtZhfbEzl51f
 HjCsjCNlqbVDWs8nmWTgKqPrFDZWMqkLwYRSCD4M5vzBxBydY26AJPBtGNKqVo8IJa0u
 W0SLKZkO9NeTxCyFIVm6TIA0+F216CHmoPvWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766096373; x=1766701173;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Jndt3SqYxM2jZAywVtZf3yYDl10GUxyvdAXQWbglW60=;
 b=VjWCEL+wj7j6NUzW2Llh/XGjpMphUcLyNmpBZ531HwNwiaePbZROp6MhmswGqjeRJf
 G+pqtXyjk9RlxL8jNPyRIYs1drIrqxBMt6qQchHyDyAstIPETERu5KP+BK3I8+1xN9Wu
 RI57Ozfq0/w/47Mm3qaqTlgfP4mxZdxMdsw7y62Rxonl1cQDyarAehKRkcZawoC1hkmG
 aAz3YOAcGlpPMv9qSxc/wbdSaDad0Nm9hMvqjNrB87+Qp2s8RWD7OIaMLKtu6wh1CnGI
 lJqLsCwQng5s9nioFupsOuQT2L4dHt28TJJ7xyY1sZGeF9HZBEQ02SkT3X+sxWpSFYsu
 O52g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgv+8xtQcYwnVTIhPxp5wey8Xtr1HQF4LfRMdktVGQgaaj2aCf+TmoxKcJOT+tsAWa0VSbtsTz9l4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwHm52plZ7GX5tznAHRquszm2/Y/tG9PBp9bHzni9YlrMraxHVm
 NnGlU+IwtyRWDPa+G7Dn/1tHvwvzlYUaXXzc4k0KCj+f2SUwJ941POapxTyOI2pbByyYDSoD4Zp
 h0L13kv7XCQ==
X-Gm-Gg: AY/fxX5NFSZOzOtXpXJmucVsaaMxinMaXsJlEGaF91BdJdHu+OSSAOvy6rWoExLjWzj
 3P8x1Vbg1ND142VuoDvf9K+a9dnlLN1yLmxreaQAHWHBG1uZ0PeXRx3ZbUqkef0V0630hBsYUgV
 MugLAVkP3XcCRmGjzg09hy9IZw62L0blQ7VC1e9kMphxwNQh35ZUOO9KaTMd3o4b47sME8lacxM
 dWdY+fqlGNH2zSx+Bbrh7adqfPAhcCDZjIc5b8I5tSKJJ/uNNNUgtSp8Ujq4gp//sNbWX4cK01n
 mDoJWOP8tZAfPi4jNEqkc8U6sNgoj00p2dMvObEaC3LayQWhLZDTVJ9xeUvEEUBfBpxVgdQkUvk
 SREAN9RohEnleKvRHq0GURuIJe3lSx+E30expdncKvtK4/lNea1YWNt0vsxr43rRvdJ/FEKHLIF
 Mi/6p2bXMZT3r7cfzrCT9EFen19WG51kZ6yIhySQq5k+D2N+Cjm7MuzI2kEgUK
X-Google-Smtp-Source: AGHT+IHcCXJnPL12oPFtgbaUVw2MNrzvsuEpUWrlyVtQKu/vVR61OgoHBTH0g7zGdJYnWBUzzBIztg==
X-Received: by 2002:a05:6402:5194:b0:649:d01e:36cc with SMTP id
 4fb4d7f45d1cf-64b8e9473f0mr729439a12.2.1766096373155; 
 Thu, 18 Dec 2025 14:19:33 -0800 (PST)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com.
 [209.85.208.51]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64b91599605sm529146a12.23.2025.12.18.14.19.32
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 18 Dec 2025 14:19:32 -0800 (PST)
Received: by mail-ed1-f51.google.com with SMTP id
 4fb4d7f45d1cf-64b61f82b5fso1491373a12.0
 for <dri-devel@lists.freedesktop.org>; Thu, 18 Dec 2025 14:19:32 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCVQ1Q0Nq6o7JvkcWhAED6A3YB3Qg8ToTp11avwZtuhcnxwl5chuLLouQG8fhY1hQ1V1skij1UCo/6Y=@lists.freedesktop.org
X-Received: by 2002:a17:906:4fd0:b0:b77:1b05:a081 with SMTP id
 a640c23a62f3a-b8036fade7bmr90274566b.27.1766096371748; Thu, 18 Dec 2025
 14:19:31 -0800 (PST)
MIME-Version: 1.0
References: <20251218-remove_wtype-limits-v1-0-735417536787@kernel.org>
 <20251218202644.0bd24aa8@pumpkin>
 <CAHk-=wjrNyuMfkU2RHs28TbFGSORk45mkjtzqeB7uhYJx33Vuw@mail.gmail.com>
 <20251218220651.5cdde06f@pumpkin>
In-Reply-To: <20251218220651.5cdde06f@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 19 Dec 2025 10:19:15 +1200
X-Gmail-Original-Message-ID: <CAHk-=wjMVfu-aiQ8aNHcgsh6hYwbZCoX1B4ps2scibokO8EZ+A@mail.gmail.com>
X-Gm-Features: AQt7F2rQbkmjgbTYE3I0u5o-OP0XOCVU9BjhcXCAu035ycTBeAxGxqvP-3yEHoo
Message-ID: <CAHk-=wjMVfu-aiQ8aNHcgsh6hYwbZCoX1B4ps2scibokO8EZ+A@mail.gmail.com>
Subject: Re: [PATCH 0/2] kbuild: remove gcc's -Wtype-limits
To: David Laight <david.laight.linux@gmail.com>
Cc: Vincent Mailhol <mailhol@kernel.org>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, 
 Chris Mason <clm@fb.com>, David Sterba <dsterba@suse.com>,
 linux-kbuild@vger.kernel.org, 
 linux-sparse@vger.kernel.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, dri-devel@lists.freedesktop.org, 
 linux-btrfs@vger.kernel.org
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

On Fri, 19 Dec 2025 at 10:06, David Laight <david.laight.linux@gmail.com> wrote:
>
> True - especially for code like:
>         if (x < 0 || x > limit)
>                 return ...

Exactly.

And yes, sometimes the type of 'x' is obvious, and having the range
check for zero can be seen as redundant for unsigned types, but even
in that "obviously redundant" case the code is *clearer* with both the
lower and upper range checked.

And apart from being clearer, it's also then safe when somebody does
change the type for whatever reason.

And lots of types do *not* have obvious signedness. They might be
typedefs, or have other much subtler issues. Something as simple as
"char" has subtle sign behavior, and when it comes to things like
enums the signedness can also be very non-obvious.

So having both sides of a range check is *always* a good idea, even if
one side _may_ be redundant for some type-range reasons.

And there really is absolutely _no_ sane way to get rid of that broken
warning except to just disable the warning itself. All other
alternatives are actively broken - adding a Pragma only makes the code
worse and illegible, and removing the lower bounds check again only
makes the code worse.

So this is a compiler warning that actively encourages worse code. It
needs to *die*. It doesn't fix anything.

And the people who point out that it can show bugs - absolutely *ANY*
warning can do that. That doesn't make a warning good. Any code can
have bugs in it.

The sparse warning I outlined (and that Vincent wrote up and tested
and made into a proper patch) was actually showing interesting issues
in a much better way.

And that sparse warning could certainly be improved on too - I think
that one too would be better if it noticed "oh, it's a pure range
check, so let's not warn even when the code otherwise looks dodgy".

But at least it didn't warn for obviously good code like the horrid
broken type-range warning does.

                  Linus
