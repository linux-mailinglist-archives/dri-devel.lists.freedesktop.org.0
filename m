Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D663F2743FD
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 16:17:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4434789870;
	Tue, 22 Sep 2020 14:17:52 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com
 [IPv6:2a00:1450:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C36897B4
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 14:14:24 +0000 (UTC)
Received: by mail-wm1-x343.google.com with SMTP id w2so3527024wmi.1
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 07:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fooishbar-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=09aMBDkPJux1mOBtGcc/fyhx1X6XV4+R4LwQfh2kMPU=;
 b=B5np/HrBFPNZ/G2O3WjCvtixGWYcqMjEluiig3iewAlWg+Cfa8cziRu6OHmTKT4ECW
 gNBrlaVJmxR0amUAv2BAmoVTdkDo/f/QdzbVJhcZTUB7+GUvJvwIJoN0NAqizyZ0VKvW
 1Cb5nc+lR1kWQscJ1Y/4LGB0wDCJzhnAE8NXh277COKJ8yqFnpAbgyoJ2d+yjkWHed3j
 NRQdFtldSUlTR70rPny/jSF/PZ1MIklMPOj0jg+eM4Ey1HbZwt+vHb8ajj7U0LlisjLD
 CQ7Vt0/9jxVSDovZnZb0BgMBMz4V0CdsSsl/HbqHsC59IoDzQ6032Hlrxkk5ghEb0g/b
 3M5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=09aMBDkPJux1mOBtGcc/fyhx1X6XV4+R4LwQfh2kMPU=;
 b=n7lIy53qbirRDtlaghYHfhqxPdBcpaTIdd2ru6r0YpEm4TiBcqNuvN0uJ9QNS5WxjN
 m9C8EDKFNL4mxz+cmGntrQnadLuK4WnOqJvlp6Xbik9s7llnCG4TxvEVxe+3MhtOT5Cv
 r8ioqKgzQ0JhPfJtrnLUZihuqoiq4yNnRyxgWByMeZFs/kZo0Ie9XMYHejf2UFCfEUfw
 OnUj2FoAJmg2IMB3M42M1Wk6Slu3L0Nk6mAOSqPTETLg4M2WAfCZpiLwdrW5N6VftBPP
 sMT+HUwn7dd56+uZDX1d0iWBCQhmyqONBEhcJrTNaEI6uFVswALvHiO1SVK/aJADWjnT
 P7wg==
X-Gm-Message-State: AOAM530eRdvLAbj0LFtHUm8EC2l9c2C/NpcjsUAFEI/Mvw6ftc8ZMGv9
 dnPf7s8lGAXwfrXDxwRI+QjVIgJnN0j1KeAc+eIzqQ==
X-Google-Smtp-Source: ABdhPJyRiNmKIR+ib/A/iCuGpj88zEWajj+OMCgabJvnHMLyXhDDYeenoXnXVC6GmPgUV0l3AKahFTpQsIFvPdot2XA=
X-Received: by 2002:a7b:c241:: with SMTP id b1mr1275471wmj.98.1600784062650;
 Tue, 22 Sep 2020 07:14:22 -0700 (PDT)
MIME-Version: 1.0
References: <20180705101043.4883-1-daniel.vetter@ffwll.ch>
 <20180705102121.5091-1-daniel.vetter@ffwll.ch>
 <CAPj87rN48S8+pLd0ksOX4pdCTqtO=bDgjhkPxpWr_AnpVvgaSQ@mail.gmail.com>
 <20200922133636.GA2369@xpredator>
 <CAKMK7uHCeFan4+agMn0sr-z9UDyZwEJv0_dL-K-gA1n0=m+A2w@mail.gmail.com>
In-Reply-To: <CAKMK7uHCeFan4+agMn0sr-z9UDyZwEJv0_dL-K-gA1n0=m+A2w@mail.gmail.com>
From: Daniel Stone <daniel@fooishbar.org>
Date: Tue, 22 Sep 2020 15:14:11 +0100
Message-ID: <CAPj87rNLzFjn7xyePmEBEY8teL7TnL-HrQHXbp7C1tXDdWgeUA@mail.gmail.com>
Subject: Re: [PATCH] drm: avoid spurious EBUSY due to nonblocking atomic
 modesets
To: Daniel Vetter <daniel.vetter@ffwll.ch>
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
Cc: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>,
 stable <stable@vger.kernel.org>, Daniel Vetter <daniel.vetter@intel.com>,
 Pekka Paalanen <pekka.paalanen@collabora.co.uk>,
 Marius Vlad <marius.vlad@collabora.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, 22 Sep 2020 at 15:04, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> On Tue, Sep 22, 2020 at 3:36 PM Marius Vlad <marius.vlad@collabora.com> wrote:
> > Gentle ping. I've tried out Linus's master tree and, and like Pekka,
> > I've noticed this isn't integrated/added.
>
> Defacto the uapi we have now is that userspace needs to ignore "spurious" EBUSY.

This really, really, really, bites.

I think we need a guarantee that this never happens if ALLOW_MODESET
is always used in blocking mode, plus in future a cap we can use to
detect that we won't be getting spurious EBUSY events.

I really don't want to ever paper over this, because it's one of the
clearest indications that userspace has its timing/signalling wrong.

Cheers,
Daniel
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
