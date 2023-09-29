Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEACA7B34B2
	for <lists+dri-devel@lfdr.de>; Fri, 29 Sep 2023 16:17:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DBFA310E142;
	Fri, 29 Sep 2023 14:17:46 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6EEB10E142
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 14:17:44 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5056ca2b6d1so900495e87.1
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 07:17:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=chromium.org; s=google; t=1695997061; x=1696601861;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wHZm/0dJ6cWlCinb/QJLx3AsO1RtLBLtwABzRD/dBUs=;
 b=FwX0AsxTxNHKir8gPDJc8gwyuh7L/uTu7UjMODgqMgtPMy/9bp6Z9hQ//iO6gvvO36
 ErbmRPLe2j5e4N4xnrXfmok028GpKvt0GAKmIQjhOfjOqiYvsJ1F2hAy8SmVpm5btrd8
 xvczJCKewDYxMNVYAUeMLADAeKkJzKFp+wScY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695997061; x=1696601861;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wHZm/0dJ6cWlCinb/QJLx3AsO1RtLBLtwABzRD/dBUs=;
 b=Si6Xf5lkXzlS5Pf9wazv204uVZD8aecQVYDQqOLJdPU12plragow1ZdzyBez4Jbu22
 ZJAG+V4ydhp5qRhWhqNYWxyrZyqX4whXJYrmSdsBqc855ROSh10XntDskT1XTkIvWfvv
 f5vbF4QNDjc3PvN3zpCBsZelOdiWHU/zlBFh3ofeP8QKPU/CYzQeJA8Dg/1dz+/LSbbZ
 yr4AbsVUifS04+7HqU74dAsxOsaKxAkdIC6l65vKMoT+jWXzCnxA40jd45WRFiGuGt68
 wh4PcFk/JG3cJpDlS+ZeQCIziy+YA689PwjMYyX6YSkP7MbdAXuiAJI4VqjZ+mlzfhhD
 GkYA==
X-Gm-Message-State: AOJu0YwP8ReT0DylMCOQpBUkE6ISRRJb+BHNoNN/yxzXE5oMSKappRZt
 u/laMrf3ZYCfjsnp57fP/xpFTZ+W4qPlM7lvKTxWYYdA
X-Google-Smtp-Source: AGHT+IED5PlXeUj1n1d5irgzzNbINzbe5OKrVUDS9oui3CZwmlFKVMMo/Ij9HGCh2lX2IeKU/sqyxg==
X-Received: by 2002:a05:6512:34cb:b0:501:b929:48af with SMTP id
 w11-20020a05651234cb00b00501b92948afmr2962453lfr.34.1695997060964; 
 Fri, 29 Sep 2023 07:17:40 -0700 (PDT)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com.
 [209.85.167.54]) by smtp.gmail.com with ESMTPSA id
 n19-20020a195513000000b004fba82dde47sm3530727lfe.123.2023.09.29.07.17.39
 for <dri-devel@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 29 Sep 2023 07:17:39 -0700 (PDT)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-502f29ed596so6390e87.0
 for <dri-devel@lists.freedesktop.org>; Fri, 29 Sep 2023 07:17:39 -0700 (PDT)
X-Received: by 2002:a19:c20f:0:b0:502:cdb6:f316 with SMTP id
 l15-20020a19c20f000000b00502cdb6f316mr285906lfc.3.1695997059452; Fri, 29 Sep
 2023 07:17:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230703-fix-boe-tv101wum-nl6-v3-0-bd6e9432c755@linaro.org>
 <CAD=FV=W2AKQSnWh02Lxbqi47M325JNCaEn1_B0xAW3PKPKKF7Q@mail.gmail.com>
 <CAD=FV=WZ+zX9jrwOhN_ZboSYSBomx2s5vifQEB6MzNFgj=g4Ow@mail.gmail.com>
 <CACRpkdZutdTDQkCSQoA0_0U=Qdf+xDWTu3PzvYRRz=cT18wHRA@mail.gmail.com>
In-Reply-To: <CACRpkdZutdTDQkCSQoA0_0U=Qdf+xDWTu3PzvYRRz=cT18wHRA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 29 Sep 2023 07:17:22 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XG1yFfbvAh9t6XiMNKBc3kHNZ8FqVjayboQjuTfxt-6A@mail.gmail.com>
Message-ID: <CAD=FV=XG1yFfbvAh9t6XiMNKBc3kHNZ8FqVjayboQjuTfxt-6A@mail.gmail.com>
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

On Thu, Sep 28, 2023 at 2:42=E2=80=AFPM Linus Walleij <linus.walleij@linaro=
.org> wrote:
>
> On Tue, Sep 26, 2023 at 11:49=E2=80=AFPM Doug Anderson <dianders@chromium=
.org> wrote:
>
> > > I'm curious what the latest on this patch series is. Is it abandoned,
> > > or is it still on your list to move forward with it? If it's
> > > abandoned, does that mean we've abandoned the idea of breaking
> > > ili9882t into a separate driver?
> > >
> > > From looking at things that have landed downstream in the ChromeOS
> > > kernel trees it looks as if additional fixes are getting blocked from
> > > being posted/landed because of the limbo state that this is in.
> >
> > I presume Linus is busy or otherwise indisposed.
>
> Sorry I was looking for the branch with my patches and I have it
> somewhere not ordinary :/
>
> Originally I shelved it because I got requests to do additional
> patches to the driver:
> https://lore.kernel.org/dri-devel/CAD=3DFV=3DXkr3Qpd8m_6Xta_2jL_ezbxsmMya=
rbKXTXL+UJLG9xNw@mail.gmail.com/
>
> To do measurements about binary code size in object files, and if it does=
,
> then I need to invent new sequence macros (IIUC):
> https://lore.kernel.org/dri-devel/CAD=3DFV=3DWju3WS45=3DEpXMUg7FjYDh3-=3D=
mvm_jS7TF1tsaAzbb4Uw@mail.gmail.com/
>
> So I just didn't have time for that extensive rework of the driver.
>
> It's good feedback, but I just wanted to make the situation a little
> bit better, and perfect is the enemy of good (TM).
>
> > So I guess we have two options here:
> >
> > a) Cong Yang can post any relevant fixes to the existing "monolithic"
> > panel driver so that we can get them landed and at least get things
> > fixed.
> >
> > - or -
> >
> > b) Cong Yang could take over all or some of Linus's series and post
> > new versions of it, addressing feedback.
>
> Either works for me, I would prefer b), Cong is welcome to adopt
> the patches if he/his employer want to. Go ahead!
>
> We can't really let this one-size-fits-all driver go on like this.
>
> My main concern with the "boe-tv101wum-nl6" driver is that it can
> be renamed "cromeos-hackfest" at this point because it becomes
> hard for any other system to reuse the panel drivers, the typical
> example would be a system using say ili9882t but with
> a different init sequence or something, why would they want
> support for 9 unrelated panels compiled in? The condition that
> these drivers should be related to the original panel that gave
> name to the file has seemingly been dropped long ago.
>
> It looks like the drivers only share the power lines (avdd, avee, pp3300,
> pp1800) then this can be broken out to a helper library. But I am
> sceptical about that too. I doubt that the vastly different panels
> actually have exactly these these supply line names, I think it is
> actually names of the rails on the chrome machine board. And that is
> not how these regulators should be named, they should be named after
> the input name on the component. This is really hard to catch in reviews =
when
> we don't have datasheets so I'm not blaming anyone, but is this something
> that even needs fixing in the device tree bindings? (By deprecation
> and addition...) can we look into this?
>
> I would say can we at least agree that before we merge one more
> driver into this file, break out to subdrivers those that clearly have
> an identifiable display controller and is thus reusable? From my
> point of view I can just see the ili9882t so that's a good start.

This sounds like a reasonable plan to me. What if Cong posted patches
that broke this up into a separate driver for the distinct controller
but otherwise didn't substantially reorganize it? In other words both
the old driver and the new one would keep the "struct panel_init_cmd"
until we get some resolution about the binary size issue. That would
at least let us move forward...

-Doug
