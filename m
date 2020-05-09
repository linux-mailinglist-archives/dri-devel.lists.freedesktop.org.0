Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CEBD1CC507
	for <lists+dri-devel@lfdr.de>; Sun, 10 May 2020 00:50:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB36E89CF6;
	Sat,  9 May 2020 22:50:00 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9063189CF6
 for <dri-devel@lists.freedesktop.org>; Sat,  9 May 2020 22:49:59 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id l25so3363799vso.6
 for <dri-devel@lists.freedesktop.org>; Sat, 09 May 2020 15:49:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=TXUBBXmljQ5wXNIAowkwYkd4kb/4nsVYm0GYUwUuYac=;
 b=Tkqv2f5gzC+XAAIPgdH4R2bngWQK+egYnu5AfQSyhmjrOFiaTRmfAv7lxgLnmQRtYh
 NBnfLaEJwQKjW3zaO8N1Ey2h0IUcGByzxK0QPSE9/2kqI0YP0aHCLIuvqeL3qlQkJmgq
 GdgmD/Eytja1TI6YPeB/tQ7b4pxyojrn+yLps=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TXUBBXmljQ5wXNIAowkwYkd4kb/4nsVYm0GYUwUuYac=;
 b=iCYkts6Z7WH0uuznqLaNeZs/RjvleJoLMms2X0yENbPbViQzQ/48CB3fVVN0i+GeqX
 zmu+JJA1cD2SWh0FTPRomQizN6x/3TuxAjk8JAWiqIrOfrWBPrGtGYSscuhcJlkDoLT8
 pVF1I+j8y2mxn4cp1qqcsJ4gDCbJmOyZrjQowRGOjErfHYCUP+NQrw0rOq4sQA/1rfRW
 a80ffnnY0bsG4hOZR5B75GIHCDlFm5FJTbVGjWoQdmz4k06eNeLEk5WeJUduQ/f0RB+V
 qTv7tvG5J8qbdFf7Xm4JbOnITHF6OG/FD+/fBpUfuqX5Nw3cxqeHubZnJ0b/g6kmbAYy
 OhqA==
X-Gm-Message-State: AGi0PuaNJKaSspwPtSz3n6tORrcZWu3ZFfoqXinntCZUFq7XSlLimB3s
 C+CrQmweCu0PMQzpcmfOgyus6VuQ7H0=
X-Google-Smtp-Source: APiQypJAxsZ0MmjSPrtx6VWVOHVejOZKPgf0qso6+qDZt0RvM1LRC6ntqe4KtH3cB5gJC/a3b1EoQw==
X-Received: by 2002:a05:6102:3cc:: with SMTP id
 n12mr6201684vsq.156.1589064598152; 
 Sat, 09 May 2020 15:49:58 -0700 (PDT)
Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com.
 [209.85.222.49])
 by smtp.gmail.com with ESMTPSA id u25sm5247974vkn.22.2020.05.09.15.49.57
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 09 May 2020 15:49:57 -0700 (PDT)
Received: by mail-ua1-f49.google.com with SMTP id z16so2049967uae.11
 for <dri-devel@lists.freedesktop.org>; Sat, 09 May 2020 15:49:57 -0700 (PDT)
X-Received: by 2002:ab0:45c7:: with SMTP id u65mr7022602uau.8.1589064596879;
 Sat, 09 May 2020 15:49:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200508155859.1.I4d29651c0837b4095fb4951253f44036a371732f@changeid>
 <20200509200021.GA30802@ravnborg.org>
In-Reply-To: <20200509200021.GA30802@ravnborg.org>
From: Doug Anderson <dianders@chromium.org>
Date: Sat, 9 May 2020 15:49:45 -0700
X-Gmail-Original-Message-ID: <CAD=FV=W+sAfu-A0ScE+hzNOd=jxnf+YZgwygPoR-gFqm0b++5A@mail.gmail.com>
Message-ID: <CAD=FV=W+sAfu-A0ScE+hzNOd=jxnf+YZgwygPoR-gFqm0b++5A@mail.gmail.com>
Subject: Re: [PATCH 1/3] panel: simple: Fix size and bpp of BOE NV133FHM-N61
To: Sam Ravnborg <sam@ravnborg.org>
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Thierry Reding <thierry.reding@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Sat, May 9, 2020 at 1:00 PM Sam Ravnborg <sam@ravnborg.org> wrote:
>
> Hi Douglas
>
> On Fri, May 08, 2020 at 03:59:00PM -0700, Douglas Anderson wrote:
> > The BOE NV133FHM-N61 is documented in the original commit to be a
> > 13.3" panel, but the size listed in our struct doesn't match.
> > Specifically:
> >
> >   math.sqrt(30.0 * 30.0 + 18.7 * 18.7) / 2.54 ==> 13.92
> >
> > Searching around on the Internet shows that the size that was in the
> > structure was the "Outline Size", not the "Display Area".  Let's fix
> > it.
> >
> > Also the Internet says that this panel supports 262K colors.  That's
> > 6bpp, not 8bpp.
> >
> > Fixes: b0c664cc80e8 ("panel: simple: Add BOE NV133FHM-N61")
> > Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
> Added to drm-misc-next as I did not think this had to be updated in
> mainline right now. Let me know if you expect it to land in mainline
> soonish.

drm-misc-next is perfect, thanks!

-Doug
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
