Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD4E0402D59
	for <lists+dri-devel@lfdr.de>; Tue,  7 Sep 2021 19:00:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D42E26E073;
	Tue,  7 Sep 2021 17:00:31 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B938D6E071;
 Tue,  7 Sep 2021 17:00:30 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 i8-20020a056830402800b0051afc3e373aso13610241ots.5; 
 Tue, 07 Sep 2021 10:00:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=tX3dLY3KjaJdK+boJZc/jDVbrXqd0jZWFd+gRGqD1s0=;
 b=JDQqLN0MwwK5CCpl1DnA4YhnQTWZvr8TH6HVybD0AeeTcxvlEvUwKAO1AVnNz+g5Fl
 F+VYli6qUA/dz6+QZTxAMfsN3DkNBwjnjP4X4YICQi1JZm2ZqZjXje/Zxd6aPlUTkpgb
 xCI9iENlZWLA0VcWtac6VIx8hJXRv3+hmwVbPx+1sodHQRpAQjqDIoTMziGMRvlRpG8/
 QudUgxMk5JoVXuTso95DqKHtS2Aw8+WwY5CSfoSLb7gbNFAIgygP58dAzmBidrDkt7LN
 u4V+EtJEJdwac6M455A+mc3vWCI8YZSv2INqZz8drbbeGoG5CVhKlBWpqt0/rwgxrd5b
 pMmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tX3dLY3KjaJdK+boJZc/jDVbrXqd0jZWFd+gRGqD1s0=;
 b=QtSlakW4R+AX2SYdBZ3OIjqwSpSNw8Q310M+iVIWtDAFZSjp9vBgjNjQ9/4bsc22gQ
 a2cbt/c4TA87aNig0slQD6V823s5JLpz9NKsqF78iSCTUA7Q6263U66NnTrK377q16OU
 ItJesS0JE79TBNrCjOaJG1xFfR6RANlMXGvZnSE37hIJXR/g1pclZgnPZtph8JXz88kW
 V2gFuzzj9+Fv8h9+5I6wkU8jAaah8Jj184h115Cr6MMng2fQPK6tl5dwyNLf3W1mcEX4
 p1eo2kR48gGnCzqY78x6Z9fTYXl+Wn5zssnL8fEy4AEQwdiHxaX53ifQT1M2omVLI+Af
 ysZQ==
X-Gm-Message-State: AOAM532Jv6QPfZBMKUQH8vhIJayGg/vlOE8H2aTzAWCDD8Ac3XFk759N
 rXO4pdpr1l8vsw/sjR+Qqm7Waw3NedGU0NspjIg=
X-Google-Smtp-Source: ABdhPJzwSR0tEBZdt+IeLRjOaJvXXaOQn4kPRkpLoZWTSbNFLWCZ+U8QwcBpUgbwb+zy7V3LmUG/aj6K0dQ93vW2HLg=
X-Received: by 2002:a05:6830:25d3:: with SMTP id
 d19mr16404248otu.357.1631034030040; 
 Tue, 07 Sep 2021 10:00:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210904154106.9550-1-len.baker@gmx.com>
In-Reply-To: <20210904154106.9550-1-len.baker@gmx.com>
From: Alex Deucher <alexdeucher@gmail.com>
Date: Tue, 7 Sep 2021 13:00:19 -0400
Message-ID: <CADnq5_P_Vq9Qw+K4-mOf-VYDq20UQJ3k1PE94f9-nqi36qmE3g@mail.gmail.com>
Subject: Re: [PATCH] drm/radeon: Prefer kcalloc over open coded arithmetic
To: Len Baker <len.baker@gmx.com>
Cc: Alex Deucher <alexander.deucher@amd.com>, 
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Kees Cook <keescook@chromium.org>, amd-gfx list <amd-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 linux-hardening@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
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

Applied.  Thanks!

Alex

On Sat, Sep 4, 2021 at 11:41 AM Len Baker <len.baker@gmx.com> wrote:
>
> As noted in the "Deprecated Interfaces, Language Features, Attributes,
> and Conventions" documentation [1], size calculations (especially
> multiplication) should not be performed in memory allocator (or similar)
> function arguments due to the risk of them overflowing. This could lead
> to values wrapping around and a smaller allocation being made than the
> caller was expecting. Using those allocations could lead to linear
> overflows of heap memory and other misbehaviors.
>
> So, refactor the code a bit to use the purpose specific kcalloc()
> function instead of the calculated size argument in the kzalloc()
> function.
>
> [1] https://www.kernel.org/doc/html/v5.14/process/deprecated.html#open-coded-arithmetic-in-allocator-arguments
>
> Signed-off-by: Len Baker <len.baker@gmx.com>
> ---
>  drivers/gpu/drm/radeon/r600_dpm.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/radeon/r600_dpm.c b/drivers/gpu/drm/radeon/r600_dpm.c
> index 35b77c944701..fd4226b99862 100644
> --- a/drivers/gpu/drm/radeon/r600_dpm.c
> +++ b/drivers/gpu/drm/radeon/r600_dpm.c
> @@ -820,12 +820,12 @@ union fan_info {
>  static int r600_parse_clk_voltage_dep_table(struct radeon_clock_voltage_dependency_table *radeon_table,
>                                             ATOM_PPLIB_Clock_Voltage_Dependency_Table *atom_table)
>  {
> -       u32 size = atom_table->ucNumEntries *
> -               sizeof(struct radeon_clock_voltage_dependency_entry);
>         int i;
>         ATOM_PPLIB_Clock_Voltage_Dependency_Record *entry;
>
> -       radeon_table->entries = kzalloc(size, GFP_KERNEL);
> +       radeon_table->entries = kcalloc(atom_table->ucNumEntries,
> +                                       sizeof(struct radeon_clock_voltage_dependency_entry),
> +                                       GFP_KERNEL);
>         if (!radeon_table->entries)
>                 return -ENOMEM;
>
> --
> 2.25.1
>
