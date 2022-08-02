Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DA8B35887D6
	for <lists+dri-devel@lfdr.de>; Wed,  3 Aug 2022 09:21:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 12AED10E203;
	Wed,  3 Aug 2022 07:21:41 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E0329499C
 for <dri-devel@lists.freedesktop.org>; Tue,  2 Aug 2022 19:03:04 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id w3so3142298edc.2
 for <dri-devel@lists.freedesktop.org>; Tue, 02 Aug 2022 12:03:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=hdZe8WkFIDKqrtIYgscLkYHRt1bx/RYV0KOkoVHZg/U=;
 b=gCYPSqJEQcsEXEg1PVpE4xVbI3EovHiB2CErLstNYEEw9Kd7e2Yoyj/dY3KraWCNXa
 jfH3FVYLKnyP3m92iKulAVVPL1h63ILHVaiWen5VR04KQB14SfbJART7GD7MZQA/wGlW
 3XLkj5PTJciEcprJKYLyMkpSYBlHZTQ8vs3qLiS9TYf/FMRO7XxqUnqJscqg8xuXopek
 Fa2UB3p5WH6DXM2KpSRPhSQBi3c0NCmOMuCoK/XBSxoYKTRETx7Fki+elejv6jKNa+sb
 VAgw3R95yNxm35jFxYLsMXZS4fJmBi2J2djAaaHrbABgD0VUczcgO40WULkHHFmJuEto
 nbnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hdZe8WkFIDKqrtIYgscLkYHRt1bx/RYV0KOkoVHZg/U=;
 b=Nj5lxHTXAK4Mpg2RZxu3zuz935i299avEHvEM+9GtJg1UF7Tk/23FYYBijhWeaGu6Z
 eEcg6iTZOPHVNs+tHLS9QX4vU4z/cz++/qLVnmE7aQvZzO38iuWyPfR4Gyi4lEJwkpLr
 55n8xoOqCbcvGBWnPD5slljqwKalHaR6jcBGvkLdfR5NieZYMMQhokUHCSnw6BYs0PIq
 oJXQH69ku5dCDJL6eqZd4v1JUMKtGlUtP2ja3t1Jg1hYmhogZ4G3m9zKBLwNbW+KLGsi
 BaIXyqcSI+3MxgAIvx2DnKgqSryiCbj3pOk4D5/H+IzPlm2ywSc61nHr2P1k4v9IKDK5
 Vt3Q==
X-Gm-Message-State: AJIora9xgVaf2rXVhv7ra3Ajfo5v0eTW7gX+V879l6R3JeqZC062AeTv
 qqJfG3LqRZzB+TfXSzcgQUI4pkRJ/VC62OinBKMnNrUBJk81ng==
X-Google-Smtp-Source: AGRyM1u/nRRxEHLE6sP2ETOr10p93ZE9ry7i/CBgAJ9Vjm+Hzy7fU1bSg/CnAiXNxTbBgwkcgA7CnrQKA2HsC53ijjw=
X-Received: by 2002:a05:6402:16:b0:43a:f435:5d07 with SMTP id
 d22-20020a056402001600b0043af4355d07mr22904421edu.420.1659466983066; Tue, 02
 Aug 2022 12:03:03 -0700 (PDT)
MIME-Version: 1.0
References: <CANX2M5Ysmgv1b4toRxeTDiKtpJyv_-dTqsRediqd8NbT=RKObQ@mail.gmail.com>
In-Reply-To: <CANX2M5Ysmgv1b4toRxeTDiKtpJyv_-dTqsRediqd8NbT=RKObQ@mail.gmail.com>
From: Dipanjan Das <mail.dipanjan.das@gmail.com>
Date: Tue, 2 Aug 2022 12:02:51 -0700
Message-ID: <CANX2M5Z2LzD_Z6qgq9Avv3hygQ7LJNX+KyZOK6_5d-KZRNwfCg@mail.gmail.com>
Subject: Re: KASAN: use-after-free Read in drm_gem_object_release
To: maarten.lankhorst@linux.intel.com, mripard@kernel.org, sean@poorly.run, 
 airlied@linux.ie, daniel@ffwll.ch, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-Mailman-Approved-At: Wed, 03 Aug 2022 07:21:28 +0000
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
Cc: fleischermarius@googlemail.com, syzkaller@googlegroups.com,
 its.priyanka.bose@gmail.com
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Jul 22, 2022 at 9:23 AM Dipanjan Das
<mail.dipanjan.das@gmail.com> wrote:
> ======================================================
> description: KASAN: use-after-free Read in drm_gem_object_release
> affected file: drivers/gpu/drm/drm_gem.c
> kernel version: 5.4.206
> kernel commit: 981f87403bb9841f1e0b7953e12a51f09a47a4f0
> git tree: upstream
> kernel config: https://syzkaller.appspot.com/text?tag=KernelConfig&x=1aab6d4187ddf667
> crash reproducer: attached
> ======================================================
> Crash log:
> ======================================================
> BUG: KASAN: use-after-free in drm_gem_object_release+0xf7/0x120
> drivers/gpu/drm/drm_gem.c:952
> ==================================================================
> BUG: KASAN: double-free or invalid-free in
> drm_gem_vram_create+0x1b7/0x1f0
> drivers/gpu/drm/drm_gem_vram_helper.c:142

We did an initial analysis for this bug and figured out the following:

If ttm_bo_init_reserved() fails, the `gbo` and `gbo->bo.base` will be
freed by ttm_buffer_object_destroy(). But then drm_gem_vram_create()
and drm_gem_vram_init() will attempt to free `gbo` and `gbo->bo.base`
again. This will result in UAF and Double Free. A similar bug (the
stack traces were a bit different) has been patched by this upstream
commit: https://github.com/torvalds/linux/commit/da62cb7230f0871c30dc9789071f63229158d261.
We applied this patch and can confirm that the repro does not trigger
the issue anymore.

-- 
Thanks and Regards,

Dipanjan
