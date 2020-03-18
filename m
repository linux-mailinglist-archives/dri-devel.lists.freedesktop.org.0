Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20A5A18ADFD
	for <lists+dri-devel@lfdr.de>; Thu, 19 Mar 2020 09:09:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29BFF6E990;
	Thu, 19 Mar 2020 08:09:03 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-ot1-x344.google.com (mail-ot1-x344.google.com
 [IPv6:2607:f8b0:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE18D6E4F8
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 12:04:00 +0000 (UTC)
Received: by mail-ot1-x344.google.com with SMTP id s15so25187920otq.8
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 05:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ON8aSc7ZZcAQyUZHAW9VI1gG1tyQ24ZFYQEruz9gWo0=;
 b=itOjqh2g1ZkLQELaM5IsOxGDSehkAZSmi4DU42VdIH9j47wwlmETry1dzPBv5Eu2Zj
 UBrRvqDq//rX8EWY0EYa5W22keh9vNNZ6QfRfXs9wNVLj3m+oVUy+1kR5iwdtSvRMTIN
 jfxQrRsJZC8t7HWZiYa5fJWWEbQIr2BxkaQoIO0Ft/OWzSNud9Ugf8EDv1d2Z3Ky3oR2
 8j3Ji1FQIzWvwqWLi8Iq+UwJGEdkSHGiR68rVWH41xtsSTBJQsdMvG8n60TLEmPX8THN
 r45sSugLCWzpjIc6GHDjOxbH5a7YqjDx2Jy4Sfo/ekFeFcfNC96IyDXkUnueg/39MMcH
 szZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ON8aSc7ZZcAQyUZHAW9VI1gG1tyQ24ZFYQEruz9gWo0=;
 b=rKIWkUEWoAk39ZJ+p1eY9Mg2lzDoqrc276Nmh+PsNcGGlbF71lJxCrOWM2enalUUQb
 AnrWJfHy6oBVM9vRSJZDu1xBockzDuTi3A/sMHcjzm8y51bQXvpFp/fWS6iwvL2KASu0
 tNCzp57tx/HKmM663Xdx5T/t0Ms5+UpjGbu8vsmOYtg/KY90sMLC1sun5xEZEXRej3sy
 4qe7hZxBtRP/TU7VTFhGtbiWNZfGhjcW4bO0Q3QjhmhFpie3ZaJh4R6z2cg85jgubyq4
 VnmDDqft6hu2rQFsHFB/tIlXs4RrBcJTmjywdZ3kXIZ5PZVcZvHR81EqMTclzwj/jJYQ
 VJWA==
X-Gm-Message-State: ANhLgQ2k6dj90PilkIPik/WE8EAmxJtOvVOuY8YVKk6S6hJIp78ufkhV
 pxnw+j2hUpKHs++3PFYUR4ePfJUFdcUjaamWQs22Jw==
X-Google-Smtp-Source: ADFU+vsWQ+o1R/VBSQJ1XYliOSPlCQgT3ZFST7kCA8+qMaRb8f2/sFxzTZdgRhJSWh6L7H0D/CX1fqXT4OmreAQGI8A=
X-Received: by 2002:a9d:6b1a:: with SMTP id g26mr3442844otp.2.1584533039830;
 Wed, 18 Mar 2020 05:03:59 -0700 (PDT)
MIME-Version: 1.0
References: <1584343103-13896-1-git-send-email-hqjagain@gmail.com>
 <20200317170243.GR2363188@phenom.ffwll.local>
 <CAJRQjofSWYR--4V_4zmp6K9WVtqShdzpGuH1VFBPvHpViGYH5g@mail.gmail.com>
 <CAKMK7uG8v7cYUwqTJTgYGfC8LEZtczTZ5a+Z4NcRnbFVBcG4Fw@mail.gmail.com>
In-Reply-To: <CAKMK7uG8v7cYUwqTJTgYGfC8LEZtczTZ5a+Z4NcRnbFVBcG4Fw@mail.gmail.com>
From: Marco Elver <elver@google.com>
Date: Wed, 18 Mar 2020 13:03:48 +0100
Message-ID: <CANpmjNNaBqV2jPcM9p_dB4KEUJDTcRd+V_LyD=tejSRG4DBAeg@mail.gmail.com>
Subject: Re: [PATCH RESEND] drm/lease: fix potential race in fill_object_idr
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Approved-At: Thu, 19 Mar 2020 08:08:58 +0000
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
Cc: Dave Airlie <airlied@linux.ie>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Qiujun Huang <hqjagain@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Wed, 18 Mar 2020 at 08:34, Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Tue, Mar 17, 2020 at 11:33 PM Qiujun Huang <hqjagain@gmail.com> wrote:
> >
> > On Wed, Mar 18, 2020 at 1:02 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> > >
> > > On Mon, Mar 16, 2020 at 03:18:23PM +0800, Qiujun Huang wrote:
> > > > We should hold idr_mutex for idr_alloc.
> > > >
> > > > Signed-off-by: Qiujun Huang <hqjagain@gmail.com>
> > >
> > > I've not seen the first version of this anywhere in my inbox, not sure
> > > where that got lost.
> > >
> > > Anyway, this seems like a false positive - I'm assuming this was caught
> > > with KCSAN. The commit message really should mention that.
> > >
> > > fill_object_idr creates the idr, which yes is only access later on under
> > > the idr_mutex. But here it's not yet visible to any other thread, and
> > > hence lockless access is safe and correct.
> >
> > Agree that.
>
> Do you know what the recommended annotation for kcsan false positives
> like this should be? Adding kcsan author Marco.

AFAIK KCSAN has not reported this, so I think there is nothing to do here.

Thanks,
-- Marco
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
