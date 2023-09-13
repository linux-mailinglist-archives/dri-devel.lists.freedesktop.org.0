Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B093779EF43
	for <lists+dri-devel@lfdr.de>; Wed, 13 Sep 2023 18:48:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3C3E10E0D1;
	Wed, 13 Sep 2023 16:48:20 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7890310E0D1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 16:48:18 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-502a4f33440so8511207e87.1
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 09:48:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google; t=1694623696; x=1695228496;
 darn=lists.freedesktop.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=UQjO5I3ejJ11+YkmxgcLlgBI7nBSQ5PbV23tc1Goj3o=;
 b=YWyjkdnieNwIzCq5cPCJUg11LIjjoUCrWuqVYM0c2AlQwBHMwyaF5QzOyBgwiSY2TL
 Djs7xPQbKNhELvwMaXy6kFmJ/eI+p3ylMSRrwtDcr3NGY4ayJkJ/HfcRfmTNdzhrKisa
 ak4qotqroPNjqO7rcyl1FuN6olO98oOP4Gc2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694623696; x=1695228496;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UQjO5I3ejJ11+YkmxgcLlgBI7nBSQ5PbV23tc1Goj3o=;
 b=G8jYd+DfFFecqYKZefpESLRJOtFqORI/jUwnAg1gAsdOfl5ocvdbcrE0hJpqX6i9Lt
 pxSZg0vhe2eGW/gziLZt5WipLXbSFFdpiP8eFCmJ46SGt+7Ab8qUmCdOTOEaPjMwjdOM
 KsOmVFdo5YvvGUeoLiDaw2f/uTrV5FKsY9l2wlLXV6tcPXeq2tFVlSKEZGC7CL5h7riM
 1bxwGksEw5gI+91PtOL0j14YOH7Y1eL4W03Zzi4riyiDg9nDwAtl21G+rxLyYusyya43
 7IqbrekZMvDArpZlwmkEHDvzU8WOXzoPHeAZmv2iOsLZZX8k+NQCrs4FBbIMX+izQ0ar
 3zhg==
X-Gm-Message-State: AOJu0YzK4ujPlItF5gQ9rtL8IfkokeETJsI1oTSYtTglGyTdImhkE3Z2
 Qu3FXZWsa6pUEal6hhTkvHdNJC/Ic0k/aU0DjCO3/EUk
X-Google-Smtp-Source: AGHT+IGnmyyK0nml9QBQOqZokl3RPb87YV1y8czs9hjRHViwLgSJpEd/3ubyAMlmZI3LyipzKGu/ig==
X-Received: by 2002:a05:6512:224b:b0:502:9253:c56f with SMTP id
 i11-20020a056512224b00b005029253c56fmr3491230lfu.44.1694623696177; 
 Wed, 13 Sep 2023 09:48:16 -0700 (PDT)
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com.
 [209.85.208.170]) by smtp.gmail.com with ESMTPSA id
 m3-20020ac24243000000b004ff8d9ed368sm2213186lfl.258.2023.09.13.09.48.15
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 13 Sep 2023 09:48:15 -0700 (PDT)
Received: by mail-lj1-f170.google.com with SMTP id
 38308e7fff4ca-2bfb1167277so23973861fa.2
 for <dri-devel@lists.freedesktop.org>; Wed, 13 Sep 2023 09:48:15 -0700 (PDT)
X-Received: by 2002:a2e:8206:0:b0:2b9:ee3e:2412 with SMTP id
 w6-20020a2e8206000000b002b9ee3e2412mr2818557ljg.22.1694623695030; Wed, 13 Sep
 2023 09:48:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230913110709.6684-1-hdanton@sina.com>
 <99d99007-8385-31df-a659-665bf50193bc@I-love.SAKURA.ne.jp>
In-Reply-To: <99d99007-8385-31df-a659-665bf50193bc@I-love.SAKURA.ne.jp>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 13 Sep 2023 09:47:57 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgb9ccWN3Nks5STYUDqQUeHZdCLsK4kA37SdDJuGZfukg@mail.gmail.com>
Message-ID: <CAHk-=wgb9ccWN3Nks5STYUDqQUeHZdCLsK4kA37SdDJuGZfukg@mail.gmail.com>
Subject: Re: drm/vkms: deadlock between dev->event_lock and timer
To: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
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
Cc: Haneen Mohammed <hamohammed.sa@gmail.com>, Hillf Danton <hdanton@sina.com>,
 Sanan Hasanov <Sanan.Hasanov@ucf.edu>,
 Rodrigo Siqueira <rodrigosiqueiramelo@gmail.com>,
 LKML <linux-kernel@vger.kernel.org>, DRI <dri-devel@lists.freedesktop.org>,
 Melissa Wen <melissa.srw@gmail.com>, Maira Canal <mairacanal@riseup.net>,
 syzkaller@googlegroups.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 13 Sept 2023 at 07:21, Tetsuo Handa
<penguin-kernel@i-love.sakura.ne.jp> wrote:
>
> Hello. A deadlock was reported in drivers/gpu/drm/vkms/ .
> It looks like this locking pattern remains as of 6.6-rc1. Please fix.
>
> void drm_crtc_vblank_off(struct drm_crtc *crtc) {
>   spin_lock_irq(&dev->event_lock);
>   drm_vblank_disable_and_save(dev, pipe) {
>     __disable_vblank(dev, pipe) {
>       crtc->funcs->disable_vblank(crtc) == vkms_disable_vblank {
>         hrtimer_cancel(&out->vblank_hrtimer) { // Retries with dev->event_lock held until lock_hrtimer_base() succeeds.
>           ret = hrtimer_try_to_cancel(timer) {
>             base = lock_hrtimer_base(timer, &flags); // Fails forever because vkms_vblank_simulate() is in progress.

Heh. Ok. This is clearly a bug, but it does seem to be limited to just
the vkms driver, and literally only to the "simulate vblank" case.

The worst part about it is that it's so subtle and not obvious.

Some light grepping seems to show that amdgpu has almost the exact
same pattern in its own vkms thing, except it uses

        hrtimer_try_to_cancel(&amdgpu_crtc->vblank_timer);

directly, which presumably fixes the livelock, but means that the
cancel will fail if it's currently running.

So just doing the same thing in the vkms driver probably fixes things.

Maybe the vkms people need to add a flag to say "it's canceled" so
that it doesn't then get re-enabled?  Or maybe it doesn't matter
and/or already happens for some reason I didn't look into.

                       Linus
