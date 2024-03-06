Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2895873E68
	for <lists+dri-devel@lfdr.de>; Wed,  6 Mar 2024 19:24:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5594510EC0C;
	Wed,  6 Mar 2024 18:24:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Px2GhBMY";
	dkim-atps=neutral
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 350C111243E
 for <dri-devel@lists.freedesktop.org>; Wed,  6 Mar 2024 18:24:17 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id
 41be03b00d2f7-5e42b4bbfa4so5238110a12.1
 for <dri-devel@lists.freedesktop.org>; Wed, 06 Mar 2024 10:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709749456; x=1710354256; darn=lists.freedesktop.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RWWS4LnVP/asDNzm/6wkKWnD1LdXMDQVgVaviFZ4aPg=;
 b=Px2GhBMYWC9soigAujhllm0y7HdDkHJnqtwkcXMbx+IopyO1OZX+151k/GQJkeTtmF
 rkY/tBZMpgP5F1rviu4bTaTANsm7R6FCP70rfzUY5jfdFkVueJn44AiAGWBGsTFg0Z+j
 UnD1CVj29yrAsV3x38mjNs4RNhv83aS1bxNr2ScYCqJhVjyoz3Ku3ss4i6oEaI0qejzN
 Au2VOV8AOrdKzETiOvRpEjIqtgAvc97PC+JHk3GpGz1LlgJdce4e75NJtqs/UZCL7YEq
 V7yMjXk70D1OenQtBTb1ymAWn1p/QJ1uU+cHsp+8YDPMreD3KeQcBhnsr4EbJXy6qG+n
 RmgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709749456; x=1710354256;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RWWS4LnVP/asDNzm/6wkKWnD1LdXMDQVgVaviFZ4aPg=;
 b=XAxYxZYpijlQVBZbmB2wAIwJOlh9Q24rUZ1e8YBG0+ZP5RscMTr0IA/CNJHLksR/dP
 1gdbd87qnuAxEgODOeMlfgC1YeK5nUFg91oEcHucEiuYKkh17rN4iOZaqnW3I7t+aU1n
 PWmOcRCjfEOQ6xmaDjFIJ2ieNjfJHkWvXaZoRof/WeGLgXt99sSr2KzfL385OEc03QNq
 XnaHiJsroMo1parfGlXGGrOwRmmIJpj7TrVkiSXBXMbvEi5+rvgAxzljf85Zaqmett4F
 h2SEvYjTw12AVEQRotMmOUpuwau5Z+iD24e3ZHPlARWUHSkx2z01CCwSpcIq2uI6jhwA
 6g4Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWT/ycTIEeT4RmrES6ETCBGE5C5+R7iw1J92iRLdCLdHVZQ2uFpLlIyY/blOBgP7DlBmuU+z4O1BNNr7VN49abvuRfaaCJGTpemV3GSNrdf
X-Gm-Message-State: AOJu0YwL/+RJ+zKSeYdT1bNWGXT+7soDYKEHvluJ882+HhhoOVZE+2mN
 DPjFIrAafUq9dqwgLHy82t5YlxkTj0VG+i1mJ2Mr6ADGHVvQwvyvLjFkIoktOLBrnggwKjnoFII
 x82hAS+Qe1YvwsT3D8qMNmYosNlSfKfNAxO4LPQ==
X-Google-Smtp-Source: AGHT+IHKPEqxOppMA9uKtWnzKAyEDN9QbdCsWR4IDnjuRlBVf+wG6gTH/NYYdjq2Jeob5XWC2zp4Hl1RW9kYPP1CSp8=
X-Received: by 2002:a17:90a:8986:b0:29a:c886:243e with SMTP id
 v6-20020a17090a898600b0029ac886243emr14404213pjn.39.1709749456443; Wed, 06
 Mar 2024 10:24:16 -0800 (PST)
MIME-Version: 1.0
References: <20240305184033.425294-1-linux@roeck-us.net>
In-Reply-To: <20240305184033.425294-1-linux@roeck-us.net>
From: =?UTF-8?B?RGFuaWVsIETDrWF6?= <daniel.diaz@linaro.org>
Date: Wed, 6 Mar 2024 12:24:05 -0600
Message-ID: <CAEUSe79fwDAhTdAD3OecCAw=LRzajxA3b-B2r8YtVDPeH7LCtA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/5] Add support for suppressing warning backtraces
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-kselftest@vger.kernel.org, David Airlie <airlied@gmail.com>, 
 Arnd Bergmann <arnd@arndb.de>, =?UTF-8?B?TWHDrXJhIENhbmFs?= <mcanal@igalia.com>,
 Dan Carpenter <dan.carpenter@linaro.org>, Kees Cook <keescook@chromium.org>, 
 David Gow <davidgow@google.com>, Arthur Grillo <arthurgrillo@riseup.net>, 
 Brendan Higgins <brendan.higgins@linux.dev>,
 Naresh Kamboju <naresh.kamboju@linaro.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Maxime Ripard <mripard@kernel.org>, 
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Thomas Zimmermann <tzimmermann@suse.de>,
 dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, loongarch@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, kunit-dev@googlegroups.com, 
 linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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

Hello!

On Tue, 5 Mar 2024 at 12:40, Guenter Roeck <linux@roeck-us.net> wrote:
> Some unit tests intentionally trigger warning backtraces by passing bad
> parameters to kernel API functions. Such unit tests typically check the
> return value from such calls, not the existence of the warning backtrace.
>
> Such intentionally generated warning backtraces are neither desirable
> nor useful for a number of reasons.
> - They can result in overlooked real problems.
> - A warning that suddenly starts to show up in unit tests needs to be
>   investigated and has to be marked to be ignored, for example by
>   adjusting filter scripts. Such filters are ad-hoc because there is
>   no real standard format for warnings. On top of that, such filter
>   scripts would require constant maintenance.
>
> One option to address problem would be to add messages such as "expected
> warning backtraces start / end here" to the kernel log.  However, that
> would again require filter scripts, it might result in missing real
> problematic warning backtraces triggered while the test is running, and
> the irrelevant backtrace(s) would still clog the kernel log.
>
> Solve the problem by providing a means to identify and suppress specific
> warning backtraces while executing test code. Support suppressing multipl=
e
> backtraces while at the same time limiting changes to generic code to the
> absolute minimum. Architecture specific changes are kept at minimum by
> retaining function names only if both CONFIG_DEBUG_BUGVERBOSE and
> CONFIG_KUNIT are enabled.
>
> The first patch of the series introduces the necessary infrastructure.
> The second patch marks the warning message in drm_calc_scale() in the DRM
> subsystem as intentional where warranted. This patch is intended to serve
> as an example for the use of the functionality introduced with this serie=
s.
> The last three patches in the series introduce the necessary architecture
> specific changes for x86, arm64, and loongarch.
>
> This series is based on the RFC patch and subsequent discussion at
> https://patchwork.kernel.org/project/linux-kselftest/patch/02546e59-1afe-=
4b08-ba81-d94f3b691c9a@moroto.mountain/
> and offers a more comprehensive solution of the problem discussed there.
>
> Checkpatch note:
>   Remaining checkpatch errors and warnings were deliberately ignored.
>   Some are triggered by matching coding style or by comments interpreted
>   as code, others by assembler macros which are disliked by checkpatch.
>   Suggestions for improvements are welcome.
>
> Some questions:
>
> - Is the general approach promising ? If not, are there other possible
>   solutions ?
> - Function pointers are only added to the __bug_table section if both
>   CONFIG_KUNIT and CONFIG_DEBUG_BUGVERBOSE are enabled. This avoids image
>   size increases if CONFIG_KUNIT=3Dn. Downside is slightly more complex
>   architecture specific assembler code. If function pointers were always
>   added to the __bug_table section, vmlinux image size would increase by
>   approximately 0.6-0.7%. Is the increased complexity in assembler code
>   worth the reduced image size ? I think so, but I would like to hear
>   other opinions.
> - There are additional possibilities associated with storing the bug
>   function name in the __bug_table section. It could be independent of
>   KUNIT, it could be a configuration flag, and/or it could be used to
>   display the name of the offending function in BUG/WARN messages.
>   Is any of those of interest ?

Thank you SO very much for this work! This is very much appreciated!
We run into these warnings at LKFT all the time, and making sure that
the noise doesn't drown the relevant signal is very important.

Greetings!

Daniel D=C3=ADaz
daniel.diaz@linaro.org
