Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C022C2745FA
	for <lists+dri-devel@lfdr.de>; Tue, 22 Sep 2020 18:02:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A79436E8A8;
	Tue, 22 Sep 2020 16:02:02 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00FF06E8A8
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 16:01:59 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id x69so21543910oia.8
 for <dri-devel@lists.freedesktop.org>; Tue, 22 Sep 2020 09:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jzGx9lNDQDNvXf55+zZV1XJczdG5Tj1hGWl7xVKxg1M=;
 b=AbruHcePTxOWEF854e6hnz/8QaFNhQAY+slB4rUkja6Zj6kCCbk3umIijEqzQanieU
 yeIQ1xS/LWBxCCGI5gpPR66Oa8uZl/04jVVfDBb0GtWtUkxkz1CcbrmWQ3Qwvl31mzpp
 BL8DTdMQ49vHk7PU5rBIHpBnBg4g3ZlYD3v3Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jzGx9lNDQDNvXf55+zZV1XJczdG5Tj1hGWl7xVKxg1M=;
 b=YopVpEIMXs8pzp437/ssf09u0ZKUy2+nmb9MXt0/17N4UZkZcaZ0d6WwFYBHPRpd9Q
 Nf4WzEjLlvnGaAdS+QIGkO36LyjAmtsh1td/oVWHKrTxs2StKCw8aVbNcM98yj3MAvum
 XUuSkqV5Chj1CvVJh5jrGaxdz5ete3JlVeFJ2ayH5WaF8yYhBx6uBnWfr5MnD15KE04J
 1Le76KCMIWeiyhz1FLfYDzP5Usv+MofmH91ANu4tRWNR0jQzCioRWSDArjgoShDOxRnO
 UHFlhKnAU7Pw5wCFnxNXGcvXsq5n8mRX1KfxtUIdCqF2MvNhuoaipTEZTl422tFd2tlp
 oVjA==
X-Gm-Message-State: AOAM5313/H7/h//E8JSA4ciH6pJzoVrnI7YkZjvPjl81m+RW9r6aiasd
 oqjPLOo/PW6kCw4W1WmIZLyggXspPdsWAjtwh6W4cg==
X-Google-Smtp-Source: ABdhPJxUCOo0K3uccb6V78Xey0Gvm3PTUf1Xm+2P+JTQizT3twxEF7VlbI4OYn7TQy4fV9tVym4U9rJE/5W8CN474ZY=
X-Received: by 2002:aca:49c2:: with SMTP id w185mr2629161oia.101.1600790518782; 
 Tue, 22 Sep 2020 09:01:58 -0700 (PDT)
MIME-Version: 1.0
References: <20180705101043.4883-1-daniel.vetter@ffwll.ch>
 <20180705102121.5091-1-daniel.vetter@ffwll.ch>
 <CAPj87rN48S8+pLd0ksOX4pdCTqtO=bDgjhkPxpWr_AnpVvgaSQ@mail.gmail.com>
 <20200922133636.GA2369@xpredator>
 <CAKMK7uHCeFan4+agMn0sr-z9UDyZwEJv0_dL-K-gA1n0=m+A2w@mail.gmail.com>
 <CAPj87rNLzFjn7xyePmEBEY8teL7TnL-HrQHXbp7C1tXDdWgeUA@mail.gmail.com>
In-Reply-To: <CAPj87rNLzFjn7xyePmEBEY8teL7TnL-HrQHXbp7C1tXDdWgeUA@mail.gmail.com>
From: Daniel Vetter <daniel.vetter@ffwll.ch>
Date: Tue, 22 Sep 2020 18:01:47 +0200
Message-ID: <CAKMK7uEyt0d0LidUCQL4oHZRYZdDEFhy=DnRF7WwD1S1+ackFQ@mail.gmail.com>
Subject: Re: [PATCH] drm: avoid spurious EBUSY due to nonblocking atomic
 modesets
To: Daniel Stone <daniel@fooishbar.org>
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

On Tue, Sep 22, 2020 at 4:14 PM Daniel Stone <daniel@fooishbar.org> wrote:
>
> On Tue, 22 Sep 2020 at 15:04, Daniel Vetter <daniel.vetter@ffwll.ch> wrote:
> > On Tue, Sep 22, 2020 at 3:36 PM Marius Vlad <marius.vlad@collabora.com> wrote:
> > > Gentle ping. I've tried out Linus's master tree and, and like Pekka,
> > > I've noticed this isn't integrated/added.
> >
> > Defacto the uapi we have now is that userspace needs to ignore "spurious" EBUSY.
>
> This really, really, really, bites.
>
> I think we need a guarantee that this never happens if ALLOW_MODESET
> is always used in blocking mode, plus in future a cap we can use to
> detect that we won't be getting spurious EBUSY events.
>
> I really don't want to ever paper over this, because it's one of the
> clearest indications that userspace has its timing/signalling wrong.

Ok so the hang-up last time around iirc was that I broke igt by making
a few things more synchronous. Let's hope I'm not also breaking stuff
with the WARN_ON ...

New plan:
- make this patch here only document existing behaviour and enforce it
with the WARN_ON
- new uapi would be behind a flag or something, with userspace and
everything hanging off it.

Thoughts?

Cheers, Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
