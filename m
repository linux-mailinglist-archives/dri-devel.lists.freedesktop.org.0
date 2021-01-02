Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8402E883F
	for <lists+dri-devel@lfdr.de>; Sat,  2 Jan 2021 19:51:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72BBA8985A;
	Sat,  2 Jan 2021 18:51:07 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com
 [209.85.222.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E337D8985A;
 Sat,  2 Jan 2021 18:51:06 +0000 (UTC)
Received: by mail-ua1-f52.google.com with SMTP id f29so7764086uab.0;
 Sat, 02 Jan 2021 10:51:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=teE+wQrrx7cVgqEbQRcBD7sPlQgvAsZl/37kjGyn5Sg=;
 b=fldfID3X9nEy1LYqksdNqOu0uiPfvavczxI01gyKlH136vwuplFW4oeMNsf4FWWc5Q
 MocyqQrY65xWbC93oleWKhggHekEB8Bfik7tyLhWU4pp3mSFlZKa/wp26rQneGqOIQFT
 MX6juEy1IaSdaGXNCQtW0LaRZ9qwy+mDX1lnRJGnuiJjjuZ7DVksjs8ed3OCI9rlanv0
 /cYe11Gt5ICYwExdxwWDvik+OVn6hRbm3vul9AeORNQPKtqxYvslNXBMB/4KWRnhvUkl
 MXsgh9wy1IPm9qpy0Zk/ye87qejoz4gg0CX2VOa7jmZHJ5spFSgwMHkysJMm5aRDRsMs
 WdBg==
X-Gm-Message-State: AOAM531D2YXY5x3UHVdVbsQJ/vO/w6PhHuIE72x54plWe77pNl/Eg1mN
 p6T0q/rjfJv6yPAWGvAt7D9P/ElKq9ROftedF9I=
X-Google-Smtp-Source: ABdhPJyERbt+nwwoGvYgcJnuOc0lp3W/cwLKKeX3tFnYg9asFNbPuYUVn6QwhHkiuLgAApzS2VTVFGlQLGQSEG7s4/k=
X-Received: by 2002:ab0:32cb:: with SMTP id f11mr41557662uao.109.1609613466122; 
 Sat, 02 Jan 2021 10:51:06 -0800 (PST)
MIME-Version: 1.0
References: <20201231205136.11422-1-mario.kleiner.de@gmail.com>
 <CAP+8YyE4H5mL3uj-T4uG0nz75XmgaZ6etXX6YxxdtO4-rL=5qA@mail.gmail.com>
 <CAEsyxyiLrpB872LdAW8-HMVC-rxf7YF8K+B51Ae9nyEvGaG1Sw@mail.gmail.com>
 <CAP+8YyHcUt0Rv_0ov5DCcm+wxeQFCqiW1vC_Pe4TdKzRzmu3fw@mail.gmail.com>
 <CAEsyxyiRNz8GRfM1hAxzVHAFwYzkyiM6OTvvjOAHtQCoCyhRjg@mail.gmail.com>
In-Reply-To: <CAEsyxyiRNz8GRfM1hAxzVHAFwYzkyiM6OTvvjOAHtQCoCyhRjg@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Sat, 2 Jan 2021 13:50:55 -0500
Message-ID: <CAKb7UvhTtJ_w65ESmvb216Nf=YyQ7=3_HjXtoGTNP1azqVeo4A@mail.gmail.com>
Subject: Re: [PATCH] drm/amd/display: Fix pageflipping for XOrg in Linux 5.11+
To: Mario Kleiner <mario.kleiner.de@gmail.com>
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
Cc: Alex Deucher <alexander.deucher@amd.com>, Dave Airlie <airlied@redhat.com>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 amd-gfx mailing list <amd-gfx@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Sat, Jan 2, 2021 at 1:35 PM Mario Kleiner <mario.kleiner.de@gmail.com> wrote:
> I'm less sure about nouveau. It uses modifiers, but has atomic support
> only on nv50+ and that atomic support is off by default -- needs a
> nouveau.nouveau_atomic=1 boot parameter to switch it on. It seems to
> enable modifier support unconditionally regardless if atomic or not,
> see:
> https://elixir.bootlin.com/linux/v5.11-rc1/source/drivers/gpu/drm/nouveau/nouveau_display.c#L703
>
> Atm. nouveau doesn't assign a new format_info though, so wouldn't
> trigger this issue atm.

Note that pre-nv50, no modifiers exist. Also,
drm_drv_uses_atomic_modeset() doesn't care whether the client is an
atomic client or not. It will return true for nv50+ no matter what.
nouveau_atomic=1 affects whether atomic UAPI is exposed. Not sure if
this impacts your discussion.

Cheers,

  -ilia
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
