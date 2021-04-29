Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE4B36EFDB
	for <lists+dri-devel@lfdr.de>; Thu, 29 Apr 2021 21:01:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F402F6F44A;
	Thu, 29 Apr 2021 19:01:29 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 16D0C6F44A
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 19:01:29 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id r12so101471610ejr.5
 for <dri-devel@lists.freedesktop.org>; Thu, 29 Apr 2021 12:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=jlekstrand-net.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1yZQKe+/wbCinRoUbda/jen5tuFh9Vm2S+F8CI6duLE=;
 b=UgPWqvCiV59yUppe768mRp/HDr3IZa5MxAj3AnYSnR7GBqFouOyCbCVw7oXltaPRRz
 WL47YFJOMFJ021Refi9PRcRT20t9dGrkdr8DS2Mgtr6Rt/6ttk4pm8/ui2OVaIlpQqtD
 6yK2IgCx26jGZiYIax34hYFStxVDCtF/asgpj5TDxUN9zA2ALs6glRb32sIEMXsMXEk8
 htM8E3soIwzdW6iEh2UwFCP9xIbpZdKUatAhx8l1mKI83D88ExfopXCPPFfpUsQlGGGW
 eCkRUb7BXnm0pgVIarYu3G43+k9IRUyd1Oad1zaC4RUVBUo05GGfJsfrcuTA2ux+KVLm
 3dgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1yZQKe+/wbCinRoUbda/jen5tuFh9Vm2S+F8CI6duLE=;
 b=Zum0fkZdm5BNT+V/+SKEYpZ0JoQI2d4tpJgb1dnPydUezAPRnaD/UWLIzG8f73yakv
 ANgaOTI+Xnx2GYKporuGt9wpoPMYxzD766pApiNQ5fCCZbe4F/QVEQ28ZUJt35L0NkS0
 XXJV0Zjh+W0m27TIxK3TZiFjY/ux85pD3ZJOlVG3m6y/VjqtSuna6y42hi7qZubFFQ4e
 CZF1KB5+7qxtQBCMNmbFd3DxEPXh77JGmK+Z+ZnzG6OuNKhQMKXXLB+oLXlVNfcdtvSa
 EYgsEE3iEEcMqpttADjfyda2UW9YsoSZDBtv6zV4Er7PWKi2JdxPX0d5Im0uhppMAIvy
 2n1g==
X-Gm-Message-State: AOAM532E6G9wQCJooqh+H6SQ7Wnu1cYRuuKbLLfXqNs668M50JYfNSzf
 YBaccUf/wT2wD3YTtIUDmQytI8FpYqJR1Bl/8Q3bkA==
X-Google-Smtp-Source: ABdhPJzOof6qNtKPapRLIDg3cFl5Qi+xdK9UfRdCHPetjdia/QfvgAwG8enKLv+hKoLgCsR/PKoilvLKiL1YBWgq9x8=
X-Received: by 2002:a17:906:5c52:: with SMTP id
 c18mr1524464ejr.354.1619722887695; 
 Thu, 29 Apr 2021 12:01:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210423223131.879208-1-jason@jlekstrand.net>
 <20210423223131.879208-17-jason@jlekstrand.net>
 <YIrWB3fX3TseroSh@phenom.ffwll.local>
 <CAOFGe97b_LSGfrLo3LBhBuvx8wduVJLf0ySC=gG7Z+L6v2dPzQ@mail.gmail.com>
 <YIsBSRwNGiiF/kxE@phenom.ffwll.local>
In-Reply-To: <YIsBSRwNGiiF/kxE@phenom.ffwll.local>
From: Jason Ekstrand <jason@jlekstrand.net>
Date: Thu, 29 Apr 2021 14:01:16 -0500
Message-ID: <CAOFGe97qi=jB+MGPtJyX-QYmjvTe2QPeijsNCeJ2z+E19x6ZNg@mail.gmail.com>
Subject: Re: [Intel-gfx] [PATCH 16/21] drm/i915/gem: Delay context creation
To: Daniel Vetter <daniel@ffwll.ch>
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
Cc: Intel GFX <intel-gfx@lists.freedesktop.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Thu, Apr 29, 2021 at 1:56 PM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Thu, Apr 29, 2021 at 01:16:04PM -0500, Jason Ekstrand wrote:
> > On Thu, Apr 29, 2021 at 10:51 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > > > +     ret = set_proto_ctx_param(file_priv, pc, args);
> > >
> > > I think we should have a FIXME here of not allowing this on some future
> > > platforms because just use CTX_CREATE_EXT.
> >
> > Done.
> >
> > > > +     if (ret == -ENOTSUPP) {
> > > > +             /* Some params, specifically SSEU, can only be set on fully
> > >
> > > I think this needs a FIXME: that this only holds during the conversion?
> > > Otherwise we kinda have a bit a problem me thinks ...
> >
> > I'm not sure what you mean by that.
>
> Well I'm at least assuming that we wont have this case anymore, i.e.
> there's only two kinds of parameters:
> - those which are valid only on proto context
> - those which are valid on both (like priority)
>
> This SSEU thing looks like a 3rd parameter, which is only valid on
> finalized context. That feels all kinds of wrong. Will it stay? If yes
> *ugh* and why?

Because I was being lazy.  The SSEU stuff is a fairly complex param to
parse and it's always set live.  I can factor out the SSEU parsing
code if you want and it shouldn't be too bad in the end.

--Jason
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
