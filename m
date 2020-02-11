Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D0E9158B75
	for <lists+dri-devel@lfdr.de>; Tue, 11 Feb 2020 09:49:36 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83D046EE07;
	Tue, 11 Feb 2020 08:49:32 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE7846EE07
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 08:49:31 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id a22so12024250oid.13
 for <dri-devel@lists.freedesktop.org>; Tue, 11 Feb 2020 00:49:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GapR/PP+nA57QMva7te9u2I4kGxmUQ4/mErgrZw1Y3c=;
 b=sx5E1yKR6lxfjLchcrgipoBwY72V8BKAR8unWSlGzgGPuoqW5BwR+jBarEdXfzSdk2
 c+52NyzWiSkATXdGlPzaJ3IQuxwF9Zy9a5f0W5y/hzoZeGubz8kCX0yCNafQS0Uk5G97
 ghxHk8fIVhwujH/XXWdZnMppzRpN/XNcz8dDDq4ET1RPbDuleHI9eGTAvKgxE0TX9OiM
 mHb+RuLe3CzkTDAqqQaSlTX8EEHAiSmQZfvO0sSXy2bfsK2dA9Sv/x7ei4JkBkdl+BFS
 q2WmjclX5kwJS+y9tszA55S3f7VxYOzr6K+E9IZDyW0BcZYOGPONcuJQMdPAk6w1rqsr
 ifBA==
X-Gm-Message-State: APjAAAVtlwcbZUBrB2zwk8qyTJuFjrTUA7jShSy8hRuwh6u5ALmqzyos
 tCg10th0vGswQIJCX1rTFkXBlCh2SyZHpMBp/7A=
X-Google-Smtp-Source: APXvYqwI8x1EVFSpPufodnIb84TVzRfFzMPy1rl88l3HOVrxiflNc2TdTktfiTeuW9WRs49ZFr98yn3bgYBAFEEe2qo=
X-Received: by 2002:aca:c4d2:: with SMTP id u201mr2235953oif.54.1581410971055; 
 Tue, 11 Feb 2020 00:49:31 -0800 (PST)
MIME-Version: 1.0
References: <20200112171521.22443-1-geert@linux-m68k.org>
 <CAMuHMdX9M25O9MOQ5tb-cLs36E8qCf1M4YCbYN9BU+h1N3n0MQ@mail.gmail.com>
In-Reply-To: <CAMuHMdX9M25O9MOQ5tb-cLs36E8qCf1M4YCbYN9BU+h1N3n0MQ@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 11 Feb 2020 09:49:20 +0100
Message-ID: <CAMuHMdWgGyt8w4zG-rf-b9uyfEx1aHV-CoLz4h_T3MpvzdniWQ@mail.gmail.com>
Subject: Re: [PATCH] fbdev: c2p: Use BUILD_BUG() instead of custom solution
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
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
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>,
 Linux Fbdev development list <linux-fbdev@vger.kernel.org>,
 Linux/m68k <linux-m68k@vger.kernel.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Mon, Feb 10, 2020 at 12:16 PM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Sun, Jan 12, 2020 at 6:15 PM Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > Replace the call to the custom non-existing function by a standard
> > BUILD_BUG() invocation.
> >
> > Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> Thanks, applied and queued for v5.7.

Sorry, this is fbdev-material, not m68k-material.
If you mind, I can drop it from the m68k for-v5.7 branch again.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
