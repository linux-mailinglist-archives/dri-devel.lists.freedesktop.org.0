Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D98AA1AFC8B
	for <lists+dri-devel@lfdr.de>; Sun, 19 Apr 2020 19:12:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E762188BF3;
	Sun, 19 Apr 2020 17:12:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5C8C88BF3
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Apr 2020 17:12:31 +0000 (UTC)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com
 [209.85.219.48])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 7D6F822260
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Apr 2020 17:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1587316351;
 bh=OXvQas/pgICsWCaoxckmOhyT+JBsD+OxYXoqKlBpD1Y=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=c8mSdfNlqX7kr0PoqJJpUD7cXbo4DgHpQ4trn8yoN0siolbCVO6bqxN+Yv72OMevf
 s9HTuY6Lmo8rYnzXt1e/5oNUFaraKegJX24ouhXxP6DKRrGQNUHBWRhL+5Q/x/ZbV3
 BCYxrA1nYve6LpMAWoDpgF7jkw9EhTKqOHuvUtIE=
Received: by mail-qv1-f48.google.com with SMTP id t8so1589133qvw.5
 for <dri-devel@lists.freedesktop.org>; Sun, 19 Apr 2020 10:12:31 -0700 (PDT)
X-Gm-Message-State: AGi0PuatKbUgfqwZn101J3/HhBP3lxaiiL1SlkUwr6L1vVAyHW4NMaEr
 yk/ncrCJVrUI2eB7j9iI4w3n9xK3D7Rd5kshLA==
X-Google-Smtp-Source: APiQypInwua0hHPbUS6Hsb1RU170OkHFKFHLASiUkvTXavdb6Kd9XZq+Z0DcGWRclB6hGGGhj2FD50u1znRmqof1vjg=
X-Received: by 2002:ad4:4ae3:: with SMTP id cp3mr10739081qvb.136.1587316350705; 
 Sun, 19 Apr 2020 10:12:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200409013947.12667-1-robh@kernel.org>
 <20200409013947.12667-4-robh@kernel.org>
 <CACRpkdZaxKxF9QuAH8D78C8L0f-01a0V+w5tSGYLvGajYh6nPA@mail.gmail.com>
In-Reply-To: <CACRpkdZaxKxF9QuAH8D78C8L0f-01a0V+w5tSGYLvGajYh6nPA@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Sun, 19 Apr 2020 12:12:19 -0500
X-Gmail-Original-Message-ID: <CAL_JsqKoPCsUtt_fDjuxZ7DcKtTEGndhkKx5q-o=8Dq1f7ABtg@mail.gmail.com>
Message-ID: <CAL_JsqKoPCsUtt_fDjuxZ7DcKtTEGndhkKx5q-o=8Dq1f7ABtg@mail.gmail.com>
Subject: Re: [PATCH 3/3] drm: pl111: Move VExpress setup into versatile init
To: Linus Walleij <linus.walleij@linaro.org>
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
Cc: "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Fri, Apr 17, 2020 at 3:27 PM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Thu, Apr 9, 2020 at 3:39 AM Rob Herring <robh@kernel.org> wrote:
>
> > Since the VExpress setup in pl111_vexpress.c is now just a single
> > function call, let's move it into pl111_versatile.c and we can further
> > simplify pl111_versatile_init() by moving the other pieces for VExpress
> > into pl111_vexpress_clcd_init().
> >
> > Cc: Eric Anholt <eric@anholt.net>
> > Cc: dri-devel@lists.freedesktop.org
> > Signed-off-by: Rob Herring <robh@kernel.org>
>
> Yeah that's much nicer, the other boards get a copy of the
> Vexpress code but it's so little so it doesn't matter and besides
> the Vexpress already had copies of the other boards init code.

It shouldn't change. The compiler should be smart enough to drop all
the code when IS_ENABLED(CONFIG_ARCH_VEXPRESS) is false.

> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Thanks.

Rob
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
