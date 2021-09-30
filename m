Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 860A341E014
	for <lists+dri-devel@lfdr.de>; Thu, 30 Sep 2021 19:23:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F4386EC2F;
	Thu, 30 Sep 2021 17:23:04 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 895F56EC2F
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 17:23:03 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id i25so28320330lfg.6
 for <dri-devel@lists.freedesktop.org>; Thu, 30 Sep 2021 10:23:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H8Db515P2u3wr8eXpxbK+mdL07rAEGHZYTKLOrQ0Ezw=;
 b=BLudoU1R5T/CW89tzCG/kuhg5sdEQS1uJDH9zxbhJO16UL5oDpz87cOexihq6kA0GQ
 sfvfHJEXVSEKxpc4dG6OIUZ+biW+n9i/NjdbEc4QgrozJY5506juVmjJfXLkX6ZD6fh9
 D3o7GNWJEvwNHDxhF694ejAjzK1CpMMUJxxDWz7MxszI5XZPKG7F9YhYU/jzaA3hIcvJ
 AFbLyOIkHHZfNuL+z1mlniTqeo5VhnJfGAye/bZlcP43dq8u0O+K5qj+QHJA4e60VGIb
 f5CBFez0yMwbHYeNzDgpiSzFFPM4+N58pVNaALuRu1BkxWOq5xqnJlLdkOzUsfCw+ryt
 ODgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H8Db515P2u3wr8eXpxbK+mdL07rAEGHZYTKLOrQ0Ezw=;
 b=1N9lBLkBu07Ic6UmQwoRv8UH/lFOY25sL8ltbc4GD2rOCo1yplB20cdqo1Gk8EhKEP
 cWKaSIisJJFPZh8e2Jonldm1YQAjq5NTeRiEmcGtGskoS+T4/1T/hRyZXvKPA26gTvkZ
 FRNQseXFMCqeYCqeesawS715kt3ya/okLRWAMLun9EsRT1KzMWXh6E1QHf9ZDU67d9XQ
 RCjCnknEepXWlx4dl43TxMK0YRcq3T9IOfwNZPVBFCkzUSIjM7gwr1gLRZvr7YvFb+OS
 UXOaXxAmS1KxitPdmGmmQy+cfE1VTtPuKdrDF11U22rMfp73LafE3no8VgKTafkLF+VY
 SHLQ==
X-Gm-Message-State: AOAM5316weJuVXUDf28v18Nw0xCu+qrpjcG338n2grNlhPm8ZI3fUrsm
 PkwrQsukSg68pAaVkohvun1Kak32jpELjxmqYFEEoQ==
X-Google-Smtp-Source: ABdhPJyvjrJEB0rRbVB9O+YguaIBi4LthEutwQhoaWse0IUnkg0n/FYjG3RqA3+pw+y/Sq3ipUz9tZwJgyVXblJ7cmQ=
X-Received: by 2002:a05:6512:110a:: with SMTP id
 l10mr393783lfg.550.1633022580476; 
 Thu, 30 Sep 2021 10:23:00 -0700 (PDT)
MIME-Version: 1.0
References: <20210930162302.2344542-1-nathan@kernel.org>
 <CADnq5_PBMGdUG8VMUQ2UOSdd9qXbZ7QoyGH2RTgUPnTjdzKqFA@mail.gmail.com>
In-Reply-To: <CADnq5_PBMGdUG8VMUQ2UOSdd9qXbZ7QoyGH2RTgUPnTjdzKqFA@mail.gmail.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 30 Sep 2021 10:22:49 -0700
Message-ID: <CAKwvOdk56-7UQDs_EAn+WK397mnd5H7_JMrsjROPk5ZFCw2QLw@mail.gmail.com>
Subject: Re: [PATCH] drm/amd: Return NULL instead of false in
 dcn201_acquire_idle_pipe_for_layer()
To: Alex Deucher <alexdeucher@gmail.com>, "Deucher,
 Alexander" <alexander.deucher@amd.com>, 
 "Koenig, Christian" <christian.koenig@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>
Cc: Nathan Chancellor <nathan@kernel.org>,
 Harry Wentland <harry.wentland@amd.com>, 
 Leo Li <sunpeng.li@amd.com>, amd-gfx list <amd-gfx@lists.freedesktop.org>, 
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, llvm@lists.linux.dev
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

On Thu, Sep 30, 2021 at 10:10 AM Alex Deucher <alexdeucher@gmail.com> wrote:
>
> Applied.  Thanks!
>
> Alex
>
> On Thu, Sep 30, 2021 at 12:23 PM Nathan Chancellor <nathan@kernel.org> wrote:
> >
> > Clang warns:

Any chance AMDGPU folks can look into adding clang to the CI roster?
-- 
Thanks,
~Nick Desaulniers
