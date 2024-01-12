Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 06B5B82C5E8
	for <lists+dri-devel@lfdr.de>; Fri, 12 Jan 2024 20:33:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E96D10E157;
	Fri, 12 Jan 2024 19:33:21 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9716710E157
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 19:33:20 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a28f66dc7ffso1433268466b.0
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 11:33:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1705087999; x=1705692799;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=j27coH7dN6dynLCy7PqLOH/19550Y5l0cyL43P460HQ=;
 b=SsXS0jeqsCP9JR7ynvgDWkrWegm3QEyKKqKmt6a5mP3h38pTQvVUaDDKUL3kvpKpZ+
 lh90DL8CgoIB29P0fVeMTqLR4j5rZ5GQYB5hmIKaeRG0rmnVfwOuLqMPSRUPdxWB3O+r
 JkbkWzmiuzjnCv6aPjSyF9zBGa5Sn4baMFvw4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705087999; x=1705692799;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=j27coH7dN6dynLCy7PqLOH/19550Y5l0cyL43P460HQ=;
 b=ABvtLeLEJ5W9nUAr+jlq56fQMRZ4Pcs7Ue+X+Cj1c30r3O7LGatd7D2e+OWbk/G1hf
 qVA/ivZ+wZJyYm6SXJOs5X1qiR8fHDwNlrhZiNf5pz584I5jv4C+2Z5DJ+Neg90eGOoU
 8BlNbS/ljI0nzLU6/cRlUH2EfxSKxRvi5Q+fA9fTdAQxr1Qwj/9FwiDBER6KcMroFKBQ
 f/q4CNlkp5n0turwKXYHKquvVXn01CtIVfhOADmzuq+4V+KcAaP65BTwQfveuY8Hu2fl
 S0YPXe17HVmwNq1mDSS63hSfMk2EXR0EjdqR6gvKPojf7F7ZuJju8vfPqJUM30jDRvX5
 X6RQ==
X-Gm-Message-State: AOJu0YzJ06KSyn5fyb0AiOkmxMEBchLZN/LLmwCCf+bRjV0JlBkhOz2z
 i9aj0KhGs5Vobapmv9DJXOhtZXxt/FJf81SLsJ19mYTbkc0P3sSb
X-Google-Smtp-Source: AGHT+IFLN28MCtFmRBtWtl75w3OPX+ddkqVtvulPx+RgxT9CFPq/zeNhBzmvJ/c/hwZACBK8pdOxuA==
X-Received: by 2002:a17:907:969e:b0:a23:6bb6:2391 with SMTP id
 hd30-20020a170907969e00b00a236bb62391mr3339158ejc.11.1705087998675; 
 Fri, 12 Jan 2024 11:33:18 -0800 (PST)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com.
 [209.85.218.45]) by smtp.gmail.com with ESMTPSA id
 vs7-20020a170907a58700b00a2caa85c56csm1186738ejc.38.2024.01.12.11.33.18
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 12 Jan 2024 11:33:18 -0800 (PST)
Received: by mail-ej1-f45.google.com with SMTP id
 a640c23a62f3a-a28bf46ea11so1194703466b.1
 for <dri-devel@lists.freedesktop.org>; Fri, 12 Jan 2024 11:33:18 -0800 (PST)
X-Received: by 2002:a17:906:4307:b0:a23:1b07:5c1b with SMTP id
 j7-20020a170906430700b00a231b075c1bmr1933545ejm.10.1705087997668; Fri, 12 Jan
 2024 11:33:17 -0800 (PST)
MIME-Version: 1.0
References: <CAPM=9twKBmO2Svky-zeP+KS8qWHFj9zrgeBqW9y__tUwcAYZhw@mail.gmail.com>
In-Reply-To: <CAPM=9twKBmO2Svky-zeP+KS8qWHFj9zrgeBqW9y__tUwcAYZhw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 12 Jan 2024 11:33:00 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgPJttFz8yrdpPTN-ypMmDXHOKw9yi1nZSEq+7+tGftZA@mail.gmail.com>
Message-ID: <CAHk-=wgPJttFz8yrdpPTN-ypMmDXHOKw9yi1nZSEq+7+tGftZA@mail.gmail.com>
Subject: Re: [git pull] drm for 6.8
To: Dave Airlie <airlied@gmail.com>
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
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 10 Jan 2024 at 11:49, Dave Airlie <airlied@gmail.com> wrote:
>
> Let me know if there are any issues,

Your testing is seriously lacking.

This doesn't even build. The reason seems to be that commit
b49e894c3fd8 ("drm/i915: Replace custom intel runtime_pm tracker with
ref_tracker library") changed the 'intel_wakeref_t' type from a
'depot_stack_handle_t' to 'unsigned long', and as a result did this:

-       drm_dbg(&i915->drm, "async_put_wakeref %u\n",
+       drm_dbg(&i915->drm, "async_put_wakeref %lu\n",
                power_domains->async_put_wakeref);

meanwhile, the Xe driver has this:

  drivers/gpu/drm/xe/compat-i915-headers/intel_wakeref.h:
        typedef bool intel_wakeref_t;

which has never been valid, but now the build fails with

  drivers/gpu/drm/i915/display/intel_display_power.c: In function
=E2=80=98print_async_put_domains_state=E2=80=99:
  drivers/gpu/drm/i915/display/intel_display_power.c:408:29: error:
format =E2=80=98%lu=E2=80=99 expects argument of type =E2=80=98long unsigne=
d int=E2=80=99, but
argument 5 has type =E2=80=98int=E2=80=99 [-Werror=3Dformat=3D]

because the drm header files have this disgusting thing where a
*header* file includes a *C* file:

  In file included from ./include/drm/drm_mm.h:51,
                 from drivers/gpu/drm/xe/xe_bo_types.h:11,
                 from drivers/gpu/drm/xe/xe_bo.h:11,
                 from
./drivers/gpu/drm/xe/compat-i915-headers/gem/i915_gem_object.h:11,
                 from ./drivers/gpu/drm/xe/compat-i915-headers/i915_drv.h:1=
5,
                 from drivers/gpu/drm/i915/display/intel_display_power.c:8:

nasty.

I made it build by fixing that broken Xe compat header file, but this
is definitely *NOT* how things should have worked. How did this ever
get to me without any kind of build testing?

And why the %^!@$% does a header file include a C file? That's wrong
regardless of this bug.

                   Linus
