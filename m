Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C537F7AF5CA
	for <lists+dri-devel@lfdr.de>; Tue, 26 Sep 2023 23:50:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E9AD10E437;
	Tue, 26 Sep 2023 21:49:56 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC6BE10E438
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 21:49:53 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-53447d0241eso4465419a12.3
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 14:49:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695764991; x=1696369791;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uP3ecDRzqPITWRfDVWIXzXwRZ85vGykA6jszJPAUAs0=;
 b=f1ltwPMhRrD65ODdBH3HoPCcxqdahDzR01jTPgnG2cJfHEcb+A3td9Wt/uWcPHEKFT
 ipCNbkgdIuNtl5VeBFDCox89/0rUmKcPAP0lPtMr8agfxsoMq7pkzyE50RZq5eKlGhXW
 zSUcAtWu1BeFdMWICg0Pe0QNp0Q8DKYeuWbIk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695764991; x=1696369791;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uP3ecDRzqPITWRfDVWIXzXwRZ85vGykA6jszJPAUAs0=;
 b=eNSnuaVdtcF2cWbYPoPmM4eB5C7+U4pvjayxRCZK6m1ko5uObKa/DCVANAs7KQsN9b
 D0l6IF/zySNKH/XiQLXepqtfwLOFrb4uw3/VbAOw9xRqDRQ/yB8q7+0e2KQxu0eKq7P0
 61Bmq4r9f+oTI2MQqO4rjoQi0yKELRUf8BibdJixd5dUHEfG4PNmyHenJfQLXF8f8SYd
 ru+wqYQzPV5ab2c/Z1GagdKFnFjm45PcEbcecglQCXnzhwBih2favthTp0JoKRzLbMEe
 Cg9N/Pkcrv6GrMu/STgX5a3bLChyvN7eGDxxC4sLc/6Z2P5KuIKiRq9ZpkwJp83Hci0H
 91ug==
X-Gm-Message-State: AOJu0Yx0bYDVCgdRtW5a+/MZKBDY6QFRqnNg4W3ObIEFUCiAmcPtOL7/
 V/auN02Ye1zT7/NnhBcXsJDwFd81gi250U1dYaJdS4Kk
X-Google-Smtp-Source: AGHT+IGm6qVmr2Gt+BcfgssPFN7BZ0PTWDCKAN4r6nAoXMnCAkS46YcJPQnt3jwJDy2iX/k0NaRYew==
X-Received: by 2002:aa7:d602:0:b0:533:e314:20dd with SMTP id
 c2-20020aa7d602000000b00533e31420ddmr238024edr.13.1695764991100; 
 Tue, 26 Sep 2023 14:49:51 -0700 (PDT)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com.
 [209.85.128.49]) by smtp.gmail.com with ESMTPSA id
 s22-20020a508d16000000b00534133856b6sm3113521eds.34.2023.09.26.14.49.49
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 26 Sep 2023 14:49:50 -0700 (PDT)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4063bfc6c03so36255e9.0
 for <dri-devel@lists.freedesktop.org>; Tue, 26 Sep 2023 14:49:49 -0700 (PDT)
X-Received: by 2002:a05:600c:ad9:b0:401:c94d:d6de with SMTP id
 c25-20020a05600c0ad900b00401c94dd6demr152686wmr.2.1695764989474; Tue, 26 Sep
 2023 14:49:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230703-fix-boe-tv101wum-nl6-v3-0-bd6e9432c755@linaro.org>
 <CAD=FV=W2AKQSnWh02Lxbqi47M325JNCaEn1_B0xAW3PKPKKF7Q@mail.gmail.com>
In-Reply-To: <CAD=FV=W2AKQSnWh02Lxbqi47M325JNCaEn1_B0xAW3PKPKKF7Q@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 26 Sep 2023 14:49:37 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WZ+zX9jrwOhN_ZboSYSBomx2s5vifQEB6MzNFgj=g4Ow@mail.gmail.com>
Message-ID: <CAD=FV=WZ+zX9jrwOhN_ZboSYSBomx2s5vifQEB6MzNFgj=g4Ow@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Fix up the boe-tv101wum-nl6 panel driver
To: Linus Walleij <linus.walleij@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jitao Shi <jitao.shi@mediatek.com>,
 Cong Yang <yangcong5@huaqin.corp-partner.google.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>,
 Ruihai Zhou <zhouruihai@huaqin.corp-partner.google.com>,
 Sam Ravnborg <sam@ravnborg.org>
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

Hi,

On Mon, Sep 18, 2023 at 9:19=E2=80=AFAM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Mon, Jul 3, 2023 at 6:21=E2=80=AFAM Linus Walleij <linus.walleij@linar=
o.org> wrote:
> >
> > This is two patches fixing things I would normally complain about
> > in reviews, but alas I missed this one, so I go in and fix it up
> > myself.
> >
> > Discovering that a completely unrelated driver has been merged
> > into this panel driver I had to bite the bullet and break it out.
> > I am pretty suspicious of the other recently added panel as well.
> >
> > I am surprised that contributors from manufacturers do not seem
> > to have datasheets for the display controllers embedded in the
> > panels of their products. Can you take a second look?
> >
> > Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> > ---
> > Changes in v3:
> > - Rebase on drm-misc-next
> > - Convert the two newly added Starry panels as well.
> > - Break out the obvious ILI9882t-based panel into its own driver.
> > - Link to v2: https://lore.kernel.org/r/20230615-fix-boe-tv101wum-nl6-v=
2-0-457d7ece4590@linaro.org
> >
> > Changes in v2:
> > - Fix a missed static keyword
> > - Link to v1: https://lore.kernel.org/r/20230615-fix-boe-tv101wum-nl6-v=
1-0-8ac378405fb7@linaro.org
> >
> > ---
> > Linus Walleij (4):
> >       drm/panel: boe-tv101wum-nl6: Drop macros and open code sequences
> >       drm/panel: boe-tv101wum-nl6: Drop surplus prepare tracking
> >       drm/panel: ili9882t: Break out as separate driver
> >       drm/panel: ili9882t: Break out function for switching page
> >
> >  drivers/gpu/drm/panel/Kconfig                  |    9 +
> >  drivers/gpu/drm/panel/Makefile                 |    1 +
> >  drivers/gpu/drm/panel/panel-boe-tv101wum-nl6.c | 3037 ++++++++++------=
--------
> >  drivers/gpu/drm/panel/panel-ilitek-ili9882t.c  |  759 ++++++
> >  4 files changed, 2067 insertions(+), 1739 deletions(-)
>
> I'm curious what the latest on this patch series is. Is it abandoned,
> or is it still on your list to move forward with it? If it's
> abandoned, does that mean we've abandoned the idea of breaking
> ili9882t into a separate driver?
>
> From looking at things that have landed downstream in the ChromeOS
> kernel trees it looks as if additional fixes are getting blocked from
> being posted/landed because of the limbo state that this is in.

I presume Linus is busy or otherwise indisposed.

So I guess we have two options here:

a) Cong Yang can post any relevant fixes to the existing "monolithic"
panel driver so that we can get them landed and at least get things
fixed.

- or -

b) Cong Yang could take over all or some of Linus's series and post
new versions of it, addressing feedback.

I would tend to say we should go with "a)" because I think Linus needs
to be involved in some of the cleanup discussions.

-Doug
