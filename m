Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7501028F8CE
	for <lists+dri-devel@lfdr.de>; Thu, 15 Oct 2020 20:42:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E6EB6E139;
	Thu, 15 Oct 2020 18:42:44 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44EE36E139
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 18:42:43 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id a5so4151420ljj.11
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 11:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=dw0XxsAm0N+xBFL5kuzzzttiWu26H5L6VPpZZ+p1K+Q=;
 b=WUzSrl2W1MAsVn/qZ/fS9Hm0TAB8UoUns4rO41D2Ev/4lY06qhyR4V/dfGjo49/3F9
 qF6QqX5XqRKgc2ZEoxerJCUvujPk9UZ4YbWpbs4OPfKOqXkcrp/7xo3biMGolLKVV5EU
 uPwB97ePNYaE3YFEMLJFzu5dYVx4ce1tOZOJM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=dw0XxsAm0N+xBFL5kuzzzttiWu26H5L6VPpZZ+p1K+Q=;
 b=JOi0nCC6bVrKuKC/WpW6FLuBok2YLDin0kl4GhzfGU7HO+TupQRR/HooVeRnUyftwJ
 PyPEO0MET5ECKGXPa4o3Cc9MdeCW98MnZPGxhaGvBvv0VJL/wpa2kzPfsmZ7Ey0AfaIs
 WQaB1Wx7QBxaFfSPMF35mYGBBWs43cKRrywks6shm1fAZevJi9O1ww2HIMSucS2xlgTh
 4OSHohvAz8hV6GstUPnfJSKGdaiqYWgGO4x0rQ80CmmkVYyp6LKv9yqXMMAaT1WljVgy
 UyuSHLXdMQFnJRR8pAee6tyw0VFqgjL0dAEpzb0cMQX2JQUTN1PR4QZSrliW99JR6Llf
 etPQ==
X-Gm-Message-State: AOAM531GrWD6ieeQ+62t5IzkqWHWdK4q2jAulJoY+T5xJn/qo3G0d4li
 s0pGuzvKBkKspRkt21F5AVL/OJLLbUlYZw==
X-Google-Smtp-Source: ABdhPJzGOpW2r9x9eTqotCGvcrQCEZgREEHgEKacUwV8gl2lrfVyUQEXb2fsavAG3RQSf9NlkbU8cA==
X-Received: by 2002:a2e:3217:: with SMTP id y23mr42812ljy.300.1602787361193;
 Thu, 15 Oct 2020 11:42:41 -0700 (PDT)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com.
 [209.85.208.179])
 by smtp.gmail.com with ESMTPSA id j10sm1584726ljb.93.2020.10.15.11.42.39
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 Oct 2020 11:42:39 -0700 (PDT)
Received: by mail-lj1-f179.google.com with SMTP id f21so4182689ljh.7
 for <dri-devel@lists.freedesktop.org>; Thu, 15 Oct 2020 11:42:39 -0700 (PDT)
X-Received: by 2002:a2e:8815:: with SMTP id x21mr51353ljh.312.1602787358993;
 Thu, 15 Oct 2020 11:42:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9txyMmW1DWhS--SuYQu4qDK1GPzgHJwxbAfhHT=hUsPODA@mail.gmail.com>
 <CAHk-=wiP+S4K3yU+FqgGmF+EgcSgk04Eerf3gE-6qObicy346w@mail.gmail.com>
In-Reply-To: <CAHk-=wiP+S4K3yU+FqgGmF+EgcSgk04Eerf3gE-6qObicy346w@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Thu, 15 Oct 2020 11:42:22 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgYNzhoYuUBsBcFq1TFA5C+Bie-2uzZkF2McO9joXxW0A@mail.gmail.com>
Message-ID: <CAHk-=wgYNzhoYuUBsBcFq1TFA5C+Bie-2uzZkF2McO9joXxW0A@mail.gmail.com>
Subject: Re: [git pull] drm next pull for 5.10-rc1
To: Dave Airlie <airlied@gmail.com>, Eryk Brol <eryk.brol@amd.com>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Oct 15, 2020 at 10:51 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> Thanks, looks good to me [..]

Uhhuh. I already pushed things out, but my clang build (which I don't
do between each merge) shows a problem:

  drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/amdgpu_dm_mst_types.c:650:8:
  warning: logical not is only applied to the left hand side of this
comparison [-Wlogical-not-parentheses]
                && !params[i].clock_force_enable == DSC_CLK_FORCE_DEFAULT) {
                   ^                             ~~

and I think clang is entirely right to complain about that code.

Yes, the code may be correct, but even if it's correct, that's a
really odd way to write things.

Anyway, what it does is:

   !params[i].clock_force_enable

turns 0 into 1, and anything that isn't 0 into 0.

And DSC_CLK_FORCE_DEFAULT has a value of 0, so what that line actually means is

  (params[i].clock_force_enable == 0) == 0

which obviously is

  params[i].clock_force_enable != 0

which in this case is the same as

  params[i].clock_force_enable != DSC_CLK_FORCE_DEFAULT

which may be what the code actually meant to do.

So I suspect it does what it meant to do, but only because
DSC_CLK_FORCE_DEFAULT also happens to be 0, which also acts as a
boolean 'false'.

But it's also possible that the '!' is a left-over, and the code
actually _meant_ to do the exact reverse of that. I have no idea.

This odd code was introduced by commit 0749ddeb7d6c ("drm/amd/display:
Add DSC force disable to dsc_clock_en debugfs entry"), and can we
please agree to not write this kind of obfuscated C code?

               Linus
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
