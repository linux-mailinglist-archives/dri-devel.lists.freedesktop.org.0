Return-Path: <dri-devel-bounces@lists.freedesktop.org>
X-Original-To: lists+dri-devel@lfdr.de
Delivered-To: lists+dri-devel@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6661E18963D
	for <lists+dri-devel@lfdr.de>; Wed, 18 Mar 2020 08:34:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E5CA6E878;
	Wed, 18 Mar 2020 07:34:38 +0000 (UTC)
X-Original-To: dri-devel@lists.freedesktop.org
Delivered-To: dri-devel@lists.freedesktop.org
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com
 [IPv6:2607:f8b0:4864:20::241])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C29C6E878
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 07:34:37 +0000 (UTC)
Received: by mail-oi1-x241.google.com with SMTP id r7so24765376oij.0
 for <dri-devel@lists.freedesktop.org>; Wed, 18 Mar 2020 00:34:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ImnCZJDFg1rQOtfa/ceoUHZbJvEiQdm+R8XInF6JTFI=;
 b=TLCIhGXDURuqIMeQG6s0U7WdW04eLC+XM2claAJPvoBsBajRsO4T5BSxY1ENJ2pHdb
 5o/YLhQRdAgmNylO3lrZWRO9ItNtfg6L5fzgPjUdlET3pNOzgJqD4aqeEWqjy4VHDVZv
 ZTl+0L6bKEMib/QdaRuLhuE+ZohrXXIYaExtA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ImnCZJDFg1rQOtfa/ceoUHZbJvEiQdm+R8XInF6JTFI=;
 b=nj84O/swH6vFQj3leoeelHADm/qhbnDkIxUaes59G/NavqOGwcfL5Tb83/JU3z+ynf
 uypd7MQdMc5vStVlVeh2AuBs1U7VxeMDHcqrRNhnxW8bn1c6YBZLfsvhDae3blHDD6R1
 MiXNJiI9/wW0rGb8ChQTJGhHT2vNXz/rHJpPNGhY01IoSp0QOhifPokFatZmcal82e03
 mOm4+Mddo+wMma1cLdY9EFZDiwQtQoznop52XMA3jCKrVr9vVXhC6gICI3bw/DKwf7Gm
 eX69yR95xZUadmu60R+g4QXxeMq3FcxcVJn1AYh+nPKguRcAXwLnpXUe8a6mB6pq1yDB
 Nn7Q==
X-Gm-Message-State: ANhLgQ0pJf4CUzQwekccQrQA4Ic8BA8bm3HzgO0D1WOOka+yypAl3Ct0
 tuT57LB6Z92LsD4dxZCCGSP4P1X2cN+mRUpbOXGboA==
X-Google-Smtp-Source: ADFU+vtAn6lL50NwcHPgytvRZmg50l63XV0Syeur/1ju+uROCi3D9Op+vVl0likHxo8FG98msXAnnrAs8iSPt64+Xd8=
X-Received: by 2002:aca:5345:: with SMTP id h66mr2229552oib.110.1584516876432; 
 Wed, 18 Mar 2020 00:34:36 -0700 (PDT)
MIME-Version: 1.0
References: <1584343103-13896-1-git-send-email-hqjagain@gmail.com>
 <20200317170243.GR2363188@phenom.ffwll.local>
 <CAJRQjofSWYR--4V_4zmp6K9WVtqShdzpGuH1VFBPvHpViGYH5g@mail.gmail.com>
In-Reply-To: <CAJRQjofSWYR--4V_4zmp6K9WVtqShdzpGuH1VFBPvHpViGYH5g@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Wed, 18 Mar 2020 08:34:24 +0100
Message-ID: <CAKMK7uG8v7cYUwqTJTgYGfC8LEZtczTZ5a+Z4NcRnbFVBcG4Fw@mail.gmail.com>
Subject: Re: [PATCH RESEND] drm/lease: fix potential race in fill_object_idr
To: Qiujun Huang <hqjagain@gmail.com>, Marco Elver <elver@google.com>
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
Cc: Dave Airlie <airlied@linux.ie>, dri-devel <dri-devel@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: dri-devel-bounces@lists.freedesktop.org
Sender: "dri-devel" <dri-devel-bounces@lists.freedesktop.org>

On Tue, Mar 17, 2020 at 11:33 PM Qiujun Huang <hqjagain@gmail.com> wrote:
>
> On Wed, Mar 18, 2020 at 1:02 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Mon, Mar 16, 2020 at 03:18:23PM +0800, Qiujun Huang wrote:
> > > We should hold idr_mutex for idr_alloc.
> > >
> > > Signed-off-by: Qiujun Huang <hqjagain@gmail.com>
> >
> > I've not seen the first version of this anywhere in my inbox, not sure
> > where that got lost.
> >
> > Anyway, this seems like a false positive - I'm assuming this was caught
> > with KCSAN. The commit message really should mention that.
> >
> > fill_object_idr creates the idr, which yes is only access later on under
> > the idr_mutex. But here it's not yet visible to any other thread, and
> > hence lockless access is safe and correct.
>
> Agree that.

Do you know what the recommended annotation for kcsan false positives
like this should be? Adding kcsan author Marco.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
+41 (0) 79 365 57 48 - http://blog.ffwll.ch
_______________________________________________
dri-devel mailing list
dri-devel@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/dri-devel
