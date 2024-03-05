Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EEFA6872803
	for <lists+dri-devel@lfdr.de>; Tue,  5 Mar 2024 20:54:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4503B112C74;
	Tue,  5 Mar 2024 19:54:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; unprotected) header.d=chromium.org header.i=@chromium.org header.b="XILo1pSj";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com
 [209.85.210.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7845E10E264
 for <dri-devel@lists.freedesktop.org>; Tue,  5 Mar 2024 19:54:08 +0000 (UTC)
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-6e5a232fe80so100438b3a.0
 for <dri-devel@lists.freedesktop.org>; Tue, 05 Mar 2024 11:54:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1709668448; x=1710273248;
 darn=lists.freedesktop.org; 
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=8OJiIuppva2X62G3XuKOpZ18Of2oWMu+/RVVvODtp4M=;
 b=XILo1pSj/PQhwn8x0KMCRxSQZFBnKj2nmxKaTvYfeai8y1BtaekPjUr7GCnRd9cFnx
 cOCXEiHezSEeW0Q85bMx7csGTpD3wNXaN3I0wNZbYn7+FygHGmJL5JxbHydTTwfaqetc
 RqLa7kNEZ+v09htkF1mDD8zJRqrFBWQ7TIOxY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709668448; x=1710273248;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8OJiIuppva2X62G3XuKOpZ18Of2oWMu+/RVVvODtp4M=;
 b=jbi5oSMo8Nuv+KdIWJQ0vwwXCJa6mY06t/q6m8lx5TMe9koDWJrPGH0GGGEI2Sx9lZ
 sjeC8pRLZK9nnYTH6DanfN3C+rhbhGNbjTfHXucSJuniixR/0fGtBUkRSlie00wgwm2O
 keJV0ZPM2gDu5bjCemWBPMGRZzuaYMYp/676lpPh26b7GYOmxNCoH1Bff94QMNKga88C
 39B0vzPOKqXRPeAfIuAQzScEnsPFgF8guhMgZ2uKuxcjV8wDuSjVSrhXI+cM/LaRsqnf
 V2tGayTwA9mXjG7BQJ7frT/KAIRX8a8wNSsluYlcWKvUGip+8TjsC1p+iF0JdD3j3Dfm
 Q2dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWW170AcWUDgyLcgxJbEnyef6MSVSyZehUMNTW/j73eQvNC6QyEFANyvZ6bOCcIrcqSf2dnccnLSDjzvC1GFCQxE/jEoyVVbyJQw1kuN0cD
X-Gm-Message-State: AOJu0YxLHjxlKr5qkGsl7ApiH1ulyMCeEf10xXPMr+jtyt5daNZ2jGj2
 /WP8uDvabEEFrGHRdW6ySjv1QWAUoW135LNHDjSf7UMBvrza6KYGUT5eFMi2cQ==
X-Google-Smtp-Source: AGHT+IEPSGoV+PaXRY7JI9uSPnapXCs52p1ILPTe+H1wv+UxrhqJWz+AChv6CTzYH5Lp5odgHWXRGQ==
X-Received: by 2002:a05:6a00:8cc:b0:6e6:1df9:af92 with SMTP id
 s12-20020a056a0008cc00b006e61df9af92mr4909513pfu.14.1709668447845; 
 Tue, 05 Mar 2024 11:54:07 -0800 (PST)
Received: from www.outflux.net ([198.0.35.241])
 by smtp.gmail.com with ESMTPSA id
 h5-20020aa786c5000000b006e52ce4ee2fsm9391340pfo.20.2024.03.05.11.54.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Mar 2024 11:54:07 -0800 (PST)
Date: Tue, 5 Mar 2024 11:54:06 -0800
From: Kees Cook <keescook@chromium.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>,
 =?iso-8859-1?Q?Ma=EDra?= Canal <mcanal@igalia.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Daniel Diaz <daniel.diaz@linaro.org>, David Gow <davidgow@google.com>,
 Arthur Grillo <arthurgrillo@riseup.net>,
 Brendan Higgins <brendan.higgins@linux.dev>,
 Naresh Kamboju <naresh.kamboju@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Maxime Ripard <mripard@kernel.org>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 loongarch@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 kunit-dev@googlegroups.com, linux-arch@vger.kernel.org
Subject: Re: [RFC PATCH 1/5] bug: Core support for suppressing warning
 backtraces
Message-ID: <202403051149.547235C794@keescook>
References: <20240305184033.425294-1-linux@roeck-us.net>
 <20240305184033.425294-2-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240305184033.425294-2-linux@roeck-us.net>
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

On Tue, Mar 05, 2024 at 10:40:29AM -0800, Guenter Roeck wrote:
> [...]
>  	warning = (bug->flags & BUGFLAG_WARNING) != 0;
>  	once = (bug->flags & BUGFLAG_ONCE) != 0;
>  	done = (bug->flags & BUGFLAG_DONE) != 0;
>  
> +	if (warning && IS_SUPPRESSED_WARNING(function))
> +		return BUG_TRAP_TYPE_WARN;
> +

I had to re-read __report_bug() more carefully, but yes, this works --
it's basically leaving early, like "once" does.

This looks like a reasonable approach!

Something very similar to this is checking that a warning happens. i.e.
you talk about drm selftests checking function return values, but I've
got a bunch of tests (LKDTM) that live outside of KUnit because I haven't
had a clean way to check for specific warnings/bugs. I feel like future
changes built on top of this series could add counters or something that
KUnit could examine. E.g. I did this manually for some fortify tests:

https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git/commit/?h=for-next/hardening&id=4ce615e798a752d4431fcc52960478906dec2f0e

-Kees

-- 
Kees Cook
