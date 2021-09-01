Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C99163FE26D
	for <lists+dri-devel@lfdr.de>; Wed,  1 Sep 2021 20:33:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CE446E255;
	Wed,  1 Sep 2021 18:33:24 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 04CA66E255
 for <dri-devel@lists.freedesktop.org>; Wed,  1 Sep 2021 18:33:22 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id s12so731218ljg.0
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Sep 2021 11:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linux-foundation.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=wmlFp7IyZjhJM+UbKugZxR7EIWg6Bz16CqvqAdC73iw=;
 b=aO3JVvdoC0SVDHw81BnqPRgF6kxIUydorxW6tTvTFB4MtXnxf1a0Fm48pYWaQujiim
 dLsdxQ0vNUOunTxKmSEr9gJ0o0NL0XYCbLKU3AV2I7ckznr09qJ/3xJKozXgyoB6Gk25
 vn1MlVEcgjn8f8Si8qJ1ioGLyIrav6X+gUCt8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wmlFp7IyZjhJM+UbKugZxR7EIWg6Bz16CqvqAdC73iw=;
 b=T48Sx8akHeRK2ucESkcU9yzz4Wgww8kfuNMzu6bY4zr3Dbx86oPCklXUqvUDaI6jun
 7+z9/bI8sgQc/XvXhgjADumA53Mx/Fc/y1FiyYdagbk3voHC19xCxBE6OQTlyVLlMF/0
 f3H5oQKHZvogZnWm83JirTZN4doLz58aEoCZicuwgKvyMM3CdcixnQAVvHmH0OZfKsf0
 xo+L7NqF6Mc0MBHZVUwG3ap09TQAO9jHAOckp89K3VY2QUHHWlMrrF9XhJGvywTcCAav
 MBHb+Ln9wYvnanvc1i9qzZt65+i+/dVJuQkjpHG9F0ah8iLP66hQXZENcFFLoUHSvXRu
 PXuw==
X-Gm-Message-State: AOAM532FT2Cp+2eCChJkmdbvpFL5VsdVsxxszV+Os8RDWAdFs1jui0eS
 AJIiqLkK8EzLB9MPMdLpgq4WHPIrRwHADVAS
X-Google-Smtp-Source: ABdhPJzwXbPxTw2ZIrmYm6PiH7s9+pT/PYtwKnJidH3Oi4k7fZkXeZr8cnUXyb8bPfIjJtxHoudD9w==
X-Received: by 2002:a2e:b16a:: with SMTP id a10mr890786ljm.18.1630521200979;
 Wed, 01 Sep 2021 11:33:20 -0700 (PDT)
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com.
 [209.85.208.171])
 by smtp.gmail.com with ESMTPSA id y2sm24922lfe.242.2021.09.01.11.33.19
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 01 Sep 2021 11:33:19 -0700 (PDT)
Received: by mail-lj1-f171.google.com with SMTP id g14so635067ljk.5
 for <dri-devel@lists.freedesktop.org>; Wed, 01 Sep 2021 11:33:19 -0700 (PDT)
X-Received: by 2002:a05:651c:908:: with SMTP id
 e8mr836025ljq.507.1630521198866; 
 Wed, 01 Sep 2021 11:33:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAPM=9txeN-qCRJvYV552zdo2H9iVy1ruVrq=YdZBP5Dmpc3Jmg@mail.gmail.com>
 <CAHk-=whP_v5nrK9B5vefnZS6Xz3-vZDFxUvSmW8W82hhNh67sA@mail.gmail.com>
In-Reply-To: <CAHk-=whP_v5nrK9B5vefnZS6Xz3-vZDFxUvSmW8W82hhNh67sA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 1 Sep 2021 11:33:01 -0700
X-Gmail-Original-Message-ID: <CAHk-=wiyPpwYLBXTdXi0DyMFhTKsTstmqU-LLjgD5fNxUnB_WA@mail.gmail.com>
Message-ID: <CAHk-=wiyPpwYLBXTdXi0DyMFhTKsTstmqU-LLjgD5fNxUnB_WA@mail.gmail.com>
Subject: Re: [git pull] drm for 5.15-rc1
To: Dave Airlie <airlied@gmail.com>, John Clements <john.clements@amd.com>, 
 Hawking Zhang <Hawking.Zhang@amd.com>, Alex Deucher <alexander.deucher@amd.com>
Cc: Daniel Vetter <daniel.vetter@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>, 
 LKML <linux-kernel@vger.kernel.org>
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

On Wed, Sep 1, 2021 at 10:57 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> No worries. I enjoyed seeing the AMD code-names in the conflicts, they
> are using positively kernel-level naming.

Oh, I spoke too soon.

The conflict in amdgpu_ras_eeprom.c is trivial to fix up, but the
*code* is garbage.

It does this (from commit 14fb496a84f1: "drm/amdgpu: set RAS EEPROM
address from VBIOS"):

        ...
        control->i2c_address = 0;

        if (amdgpu_atomfirmware_ras_rom_addr(adev,
(uint8_t*)&control->i2c_address))
        {
                if (control->i2c_address == 0xA0)
                        control->i2c_address = 0;
        ...

and honestly, that just hurts to look at. It's completely wrong, even
if it happens to work on a little-endian machine.

Yes, yes, BE is irrelevant, and doubly so for an AMD GPU driver, but still.

It's assigning a 8-bit value to a 32-bit entity by doing a pointer
cast on the address, and then mixing things up by using/assigning to
that same field.

That's just *wrong* and nasty.

Oh, the resolution would be easy - just take that broken code as-is -
but I can't actually make myself do that.

So I fixed it up to not be that incredibly ugly garbage.

Please holler if I did something wrong.

             Linus
