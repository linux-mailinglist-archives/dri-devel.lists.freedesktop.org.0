Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 554E47EC80A
	for <lists+dri-devel@lfdr.de>; Wed, 15 Nov 2023 17:00:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6393C10E086;
	Wed, 15 Nov 2023 16:00:49 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBD4E10E0C5
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 16:00:46 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id
 5614622812f47-3b4bdb89177so701047b6e.1
 for <dri-devel@lists.freedesktop.org>; Wed, 15 Nov 2023 08:00:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1700064046; x=1700668846; darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=eFmbaY0oGVZ7sScVBLanmu7D2D9vxvb7T+NtcQ3NkJ4=;
 b=cPuOTTEAUVbudIBIoLUfEo7f7P+nx4vqCUfl5OfgTgjRKnZF9p38LDd3+4qV2gIyMY
 YcsMXlhjWj9JsQySLkWeHWVpFiy67Sf6A7PtLjJcD8JaAJBuw1AS7FKZCOlSISDMWT3i
 WO6A3/wocjHWnzFylEJMiXWswEc2mwvWGV6QQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700064046; x=1700668846;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eFmbaY0oGVZ7sScVBLanmu7D2D9vxvb7T+NtcQ3NkJ4=;
 b=OuRgvChKdSoCWFVCogU/7LWjSuAj5vzPRms4G5JI8cUeCqqjndR+qFQdncG3+1QrWC
 leQWeXX4BDrYbuor4t5xax7lEIBOkhG1OUXrsdV3pcTn5+N+CYrFeyENntUxi1vlJJhw
 h+im4NQJCUmvj3yqsUE5U8dKcMAD9AXJ4lNFKixrRXq/EGvuDuu+9tdJux5r0WEvkyWO
 xoHx0vGC23SsY/8OPTn1LAxIXqNceWoLGVCgHk6QT+xHaO1/3LmSM658x/6iYwUVMIzW
 B0GlZ4i2nykHunsEA1o9Dz8GGBuox3UO4d3vpUrRUiaOhY+c3YakJigsXqXZYIWM/uoy
 9yug==
X-Gm-Message-State: AOJu0Yz216Md4uGSWbuAmtCKxDXJuv96+E+CUP+tMA/WZ/Wlthr+zHYs
 G1I7Q99d1QqwfAMpCXqtIrjQbg21CUw6a38+7J9oxIqFfgerEywR
X-Google-Smtp-Source: AGHT+IEC7e0xzEZvfFar3WHPgtO7pOAY07ejbJf+y9ARFz7vkcAW/xxvlGk01OR2uItXzOvVmoLvaArE9Pf6m0XXx+0=
X-Received: by 2002:a05:6871:5c47:b0:1e9:bbfe:6458 with SMTP id
 os7-20020a0568715c4700b001e9bbfe6458mr7237902oac.1.1700064046168; Wed, 15 Nov
 2023 08:00:46 -0800 (PST)
MIME-Version: 1.0
References: <20231110200830.1832556-1-davidgow@google.com>
 <4e0c8bb796a67af5fb901f831c5f87fe.mripard@kernel.org>
In-Reply-To: <4e0c8bb796a67af5fb901f831c5f87fe.mripard@kernel.org>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 15 Nov 2023 17:00:35 +0100
Message-ID: <CAKMK7uG-FH6iLpNpQ74xXPZoyGoDGvg+L99oCK3nFZT43o6GcA@mail.gmail.com>
Subject: Re: [PATCH 1/3] kunit: Add a macro to wrap a deferred action function
To: Maxime Ripard <mripard@kernel.org>
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
Cc: David Gow <davidgow@google.com>, Emma Anholt <emma@anholt.net>,
 dlatypov@google.com, llvm@lists.linux.dev, Rae Moar <rmoar@google.com>,
 dri-devel@lists.freedesktop.org,
 =?UTF-8?B?TWHDrXJhIENhbmFs?= <mairacanal@riseup.net>,
 linux-hardening@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Sami Tolvanen <samitolvanen@google.com>, Kees Cook <keescook@chromium.org>,
 Nathan Chancellor <nathan@kernel.org>,
 Richard Fitzgerald <rf@opensource.cirrus.com>,
 Benjamin Berg <benjamin.berg@intel.com>,
 Shuah Khan <skhan@linuxfoundation.org>, kunit-dev@googlegroups.com,
 Brendan Higgins <brendan.higgins@linux.dev>, linux-kernel@vger.kernel.org,
 Thomas Zimmermann <tzimmermann@suse.de>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 15 Nov 2023 at 16:51, Maxime Ripard <mripard@kernel.org> wrote:
>
> On Sat, 11 Nov 2023 04:08:26 +0800, David Gow wrote:
> > KUnit's deferred action API accepts a void(*)(void *) function pointer
> > which is called when the test is exited. However, we very frequently
> > want to use existing functions which accept a single pointer, but which
> > may not be of type void*. While this is probably dodgy enough to be on
> > the wrong side of the C standard, it's been often used for similar
> >
> > [ ... ]
>
> Reviewed-by: Maxime Ripard <mripard@kernel.org>

Acked-by: Daniel Vetter <daniel@ffwll.ch> for merging through kunit
tree, since I guess that's the simplest way to land this.

Cheers!
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
